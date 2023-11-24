namespace HZY.Core.EntityFramework.Interceptors;

/// <summary>
/// 审计 保存拦截器
/// </summary>
public class AuditInterceptor : SaveChangesInterceptor
{
    /// <summary>
    /// SavingChanges
    /// </summary>
    /// <param name="eventData"></param>
    /// <param name="result"></param>
    /// <returns></returns>
    public override InterceptionResult<int> SavingChanges(DbContextEventData eventData, InterceptionResult<int> result)
    {
        SavingChanges(eventData);
        return base.SavingChanges(eventData, result);
    }

    /// <summary>
    /// SavingChangesAsync
    /// </summary>
    /// <param name="eventData"></param>
    /// <param name="result"></param>
    /// <param name="cancellationToken"></param>
    /// <returns></returns>
    public override ValueTask<InterceptionResult<int>> SavingChangesAsync(DbContextEventData eventData,
        InterceptionResult<int> result, CancellationToken cancellationToken = default)
    {
        SavingChanges(eventData);
        return base.SavingChangesAsync(eventData, result, cancellationToken);
    }

    /// <summary>
    /// 添加 、 修改 、删除 拦截
    /// </summary>
    /// <param name="eventData"></param>
    protected virtual void SavingChanges(DbContextEventData eventData)
    {
        var userId = default(string);
        try
        {
            using var scope = App.CreateScope();
            var tokenService = scope.ServiceProvider.GetService<JwtTokenService>(); //

            var id = tokenService?.GetAccountIdByToken();

            userId = tokenService?.GetAccountIdByToken() == Guid.Empty ? null : id.ToString();
        }
        catch (Exception e)
        {
            // ignored
        }

        var entries = eventData.Context?.ChangeTracker.Entries();
        var entityEntries = entries as EntityEntry[] ?? entries?.ToArray();
        if (entityEntries is null) return;

        #region 处理 TableIdAttribute 标记的 id

        HandleTableId(entityEntries);

        #endregion

        #region 处理 BaseEntity

        //Insert
        var insertEntries = entityEntries?
            .Where(w => w is { Entity: ICreateEntity, State: EntityState.Added })
            .Select(item => (ICreateEntity)item.Entity)
            .ToList();

        if (insertEntries is not null)
        {
            foreach (var item in insertEntries)
            {
                item.CreationTime = item.CreationTime > DateTime.MinValue ? item.CreationTime : DateTime.Now;
                item.CreatorUserId = userId?.ToGuid();
            }
        }

        //Update
        var updateEntries = entityEntries?
            .Where(w => w is { Entity: IUpdateEntity, State: EntityState.Modified })
            .Select(item => (IUpdateEntity)item.Entity)
            .ToList(); // || w.State == EntityState.Unchanged
        ;
        if (updateEntries is not null)
        {
            foreach (var item in updateEntries)
            {
                item.LastModificationTime = DateTime.Now;
                item.LastModifierUserId = userId?.ToGuid();
            }
        }

        //Delete
        var deleteEntries = entityEntries?
            .Where(w => w is { Entity: IDeleteEntity, State: EntityState.Deleted })
            .Select(item => (IDeleteEntity)item.Entity)
            .ToList();
        ;
        if (deleteEntries is not null)
        {
            foreach (var item in deleteEntries)
            {
                item.IsDeleted = true;
                item.DeletionTime = DateTime.Now;
                item.DeleterUserId = userId?.ToGuid();
            }
        }

        #endregion
    }

    /// <summary>
    /// 处理 表 主键 id
    /// </summary>
    /// <param name="entityEntries"></param>
    protected virtual void HandleTableId(EntityEntry[] entityEntries)
    {
        foreach (var item in entityEntries.Where(w => w.State == EntityState.Added))
        {
            var propertyEntries = item.Properties
                .Where(w => w.Metadata.PropertyInfo?.GetCustomAttribute<TableIdAttribute>() is not null)
                .ToList();

            foreach (var propertyEntry in propertyEntries)
            {
                var tableIdAttribute = propertyEntry.Metadata.PropertyInfo?.GetCustomAttribute<TableIdAttribute>();
                if (tableIdAttribute is null) continue;

                if (tableIdAttribute!.IdType == IdType.SnowflakeId)
                {
                    long.TryParse(propertyEntry.CurrentValue?.ToString() ?? "", out var result);
                    if (result > 0) continue;
                    // 判断  propertyEntry.CurrentValue 是否为 long 类型
                    if (propertyEntry.CurrentValue is long)
                    {
                        propertyEntry.CurrentValue = Tools.GetNewId();
                    }

                    if (propertyEntry.CurrentValue is string)
                    {
                        propertyEntry.CurrentValue = Tools.GetNewId().ToString();
                    }

                    continue;
                }

                if (tableIdAttribute!.IdType == IdType.UuId)
                {
                    if (propertyEntry.CurrentValue != null) continue;
                    propertyEntry.CurrentValue = Guid.NewGuid();
                    continue;
                }

                if (tableIdAttribute!.IdType != IdType.UuIdString) continue;
                if (propertyEntry.CurrentValue != null) continue;
                propertyEntry.CurrentValue = Guid.NewGuid().ToString().Replace("-", "");
            }
        }
    }
}