namespace HZY.Repository.EntityFramework.Interceptors;

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
    public override ValueTask<InterceptionResult<int>> SavingChangesAsync(DbContextEventData eventData, InterceptionResult<int> result, CancellationToken cancellationToken = default)
    {
        SavingChanges(eventData);
        return base.SavingChangesAsync(eventData, result, cancellationToken);
    }

    /// <summary>
    /// 添加 、 修改 、删除 拦截
    /// </summary>
    /// <param name="eventData"></param>
    public void SavingChanges(DbContextEventData eventData)
    {
        using var scope = App.CreateScope();
        var _tokenService = scope.ServiceProvider.GetService<JwtTokenService>();//

        var userId = _tokenService?.GetAccountIdByToken() ?? Guid.Empty;

        var entries = eventData.Context?.ChangeTracker.Entries();
        var entityEntries = entries as EntityEntry[] ?? entries?.ToArray();

        #region 处理 Guid 添加时配置默认 id

        //foreach (var item in entityEntries.Where(w => w.State == EntityState.Added))
        //{
        //    var entityType = item.Properties;

        //    foreach (var propertyEntry in item.Properties)
        //    {
        //        if (propertyEntry.Metadata.ClrType != typeof(Guid)) continue;

        //        propertyEntry.CurrentValue = Guid.NewGuid();
        //    }
        //}

        #endregion

        #region 处理 BaseEntity

        //Insert
        var insertEntries = entityEntries?
            .Where(w => w.Entity is ICreateEntity && w.State == EntityState.Added)
            .Select(item => (ICreateEntity)item.Entity)
            .ToList();

        if (insertEntries != null)
        {
            foreach (var item in insertEntries)
            {
                item.CreationTime = DateTime.Now;
                item.CreatorUserId = userId;
            }
        }

        //Update
        var updateEntries = entityEntries?
            .Where(w => w.Entity is IUpdateEntity && w.State == EntityState.Modified) // || w.State == EntityState.Unchanged
            ;
        if (updateEntries != null)
        {
            foreach (var item in updateEntries)
            {
                var entity = (IUpdateEntity)item.Entity;
                entity.LastModificationTime = DateTime.Now;
                entity.LastModifierUserId = userId;
            }
        }

        //Delete
        var deleteEntries = entityEntries?
            .Where(w => w.Entity is IDeleteEntity && w.State == EntityState.Deleted)
            ;
        if (deleteEntries != null)
        {
            foreach (var item in deleteEntries)
            {
                item.State = EntityState.Modified;
                var entity = (IDeleteEntity)item.Entity;
                entity.IsDeleted = true;
                entity.DeletionTime = DateTime.Now;
                entity.DeleterUserId = userId;
            }
        }

        #endregion
    }

}
