namespace HZY.Core.EntityFramework.Interceptors;

/// <summary>
/// 审计 保存拦截器 拦截v2实体模型
/// </summary>
public class AuditInterceptorV2 : AuditInterceptor
{
    /// <summary>
    /// 添加 、 修改 、删除 拦截
    /// </summary>
    /// <param name="eventData"></param>
    protected override void SavingChanges(DbContextEventData eventData)
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
            .Where(w => w is { Entity: ICreateEntityV2, State: EntityState.Added })
            .Select(item => (ICreateEntityV2)item.Entity)
            .ToList();

        if (insertEntries is not null)
        {
            foreach (var item in insertEntries)
            {
                item.CreateTime = item.CreateTime > DateTime.MinValue ? item.CreateTime : DateTime.Now;
                item.CreateBy = item.CreateBy ?? userId?.ToString();
            }
        }

        //Update
        var updateEntries = entityEntries?
            .Where(w => w is { Entity: IUpdateEntityV2, State: EntityState.Modified })
            .Select(item => (IUpdateEntityV2)item.Entity)
            .ToList(); // || w.State == EntityState.Unchanged
        ;
        if (updateEntries is not null)
        {
            foreach (var item in updateEntries)
            {
                item.UpdateTime = DateTime.Now;
                item.UpdateBy = userId?.ToString();
            }
        }

        //Delete
        var deleteEntries = entityEntries?
            .Where(w => w is { Entity: IDeleteEntityV2, State: EntityState.Deleted })
            .Select(item => (IDeleteEntityV2)item.Entity)
            .ToList();
        ;
        if (deleteEntries is not null)
        {
            foreach (var item in deleteEntries)
            {
                item.DeleteFlag = true;
                item.DeleteTime = DateTime.Now;
                item.DeleteBy = userId?.ToString();
            }
        }

        #endregion
    }
}