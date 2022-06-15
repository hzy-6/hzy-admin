using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using Microsoft.EntityFrameworkCore.Diagnostics;
using Microsoft.Extensions.DependencyInjection;

using HzyScanDiService;

using HZY.Infrastructure.Token;
using HZY.Models.Entities.BaseEntitys;

namespace HZY.EFCore.DbContexts.Interceptor
{
    /// <summary>
    /// 审计 保存拦截器
    /// </summary>
    public class AuditInterceptor : SaveChangesInterceptor
    {
        public override InterceptionResult<int> SavingChanges(DbContextEventData eventData, InterceptionResult<int> result)
        {
            using var scope = IOCUtil.CreateScope();
            var _tokenService = scope.ServiceProvider.GetService<TokenService>();
            var userId = _tokenService.GetAccountIdByToken();

            var entries = eventData.Context.ChangeTracker.Entries();
            var entityEntries = entries as EntityEntry[] ?? entries.ToArray();

            #region 处理 DefaultBaseEntity

            //Update
            var updateEntries_BaseModel = entityEntries
                .Where(w => w.Entity is DefaultBaseEntity && w.State == EntityState.Modified) // || w.State == EntityState.Unchanged
                .Select(item => (DefaultBaseEntity)item.Entity)
                .ToList();
            updateEntries_BaseModel.ForEach(w => w.LastModificationTime = DateTime.Now);

            //Insert
            var insertEntries_BaseModel = entityEntries
                .Where(w => w.Entity is DefaultBaseEntity && w.State == EntityState.Added)
                .Select(item => (DefaultBaseEntity)item.Entity)
                .ToList();
            foreach (var entity in insertEntries_BaseModel)
            {
                entity.CreationTime = DateTime.Now;
                entity.LastModificationTime = DateTime.Now;
            }

            #endregion

            #region 处理 BaseEntity

            //Insert
            var insertEntries = entityEntries
                .Where(w => w.Entity is ICreateBaseEntity && w.State == EntityState.Added)
                .Select(item => (ICreateBaseEntity)item.Entity)
                .ToList();
            foreach (var item in insertEntries)
            {
                item.CreationTime = DateTime.Now;
                item.CreatorUserId = userId;
            }

            //Update
            var updateEntries = entityEntries
                .Where(w => w.Entity is IUpdateBaseEntity && w.State == EntityState.Modified) // || w.State == EntityState.Unchanged
                .Select(item => (IUpdateBaseEntity)item.Entity)
                .ToList();
            foreach (var item in updateEntries)
            {
                item.LastModificationTime = DateTime.Now;
                item.LastModifierUserId = userId;
            }

            //Delete
            var deleteEntries = entityEntries
                .Where(w => w.Entity is IDeleteBaseEntity && w.State == EntityState.Deleted);
            foreach (var item in deleteEntries)
            {
                item.State = EntityState.Modified;
                var entity = (IDeleteBaseEntity)item.Entity;
                entity.IsDeleted = true;
                entity.DeletionTime = DateTime.Now;
                entity.DeleterUserId = userId;
            }

            #endregion

            return base.SavingChanges(eventData, result);
        }

        public override ValueTask<InterceptionResult<int>> SavingChangesAsync(DbContextEventData eventData, InterceptionResult<int> result, CancellationToken cancellationToken = default)
        {
            using var scope = IOCUtil.CreateScope();
            var _tokenService = scope.ServiceProvider.GetService<TokenService>();
            var userId = _tokenService.GetAccountIdByToken();

            var entries = eventData.Context.ChangeTracker.Entries();
            var entityEntries = entries as EntityEntry[] ?? entries.ToArray();

            #region 处理 DefaultBaseEntity

            //Update
            var updateEntries_BaseModel = entityEntries
                .Where(w => w.Entity is DefaultBaseEntity && w.State == EntityState.Modified) // || w.State == EntityState.Unchanged
                .Select(item => (DefaultBaseEntity)item.Entity)
                .ToList();
            updateEntries_BaseModel.ForEach(w => w.LastModificationTime = DateTime.Now);

            //Insert
            var insertEntries_BaseModel = entityEntries
                .Where(w => w.Entity is DefaultBaseEntity && w.State == EntityState.Added)
                .Select(item => (DefaultBaseEntity)item.Entity)
                .ToList();
            foreach (var entity in insertEntries_BaseModel)
            {
                entity.CreationTime = DateTime.Now;
                entity.LastModificationTime = DateTime.Now;
            }

            #endregion

            #region 处理 BaseEntity

            //Insert
            var insertEntries = entityEntries
                .Where(w => w.Entity is ICreateBaseEntity && w.State == EntityState.Added)
                .Select(item => (ICreateBaseEntity)item.Entity)
                .ToList();
            foreach (var item in insertEntries)
            {
                item.CreationTime = DateTime.Now;
                item.CreatorUserId = userId;
            }

            //Update
            var updateEntries = entityEntries
                .Where(w => w.Entity is IUpdateBaseEntity && w.State == EntityState.Modified) // || w.State == EntityState.Unchanged
                .Select(item => (IUpdateBaseEntity)item.Entity)
                .ToList();
            foreach (var item in updateEntries)
            {
                item.LastModificationTime = DateTime.Now;
                item.LastModifierUserId = userId;
            }

            //Delete
            var deleteEntries = entityEntries
                .Where(w => w.Entity is IDeleteBaseEntity && w.State == EntityState.Deleted);
            foreach (var item in deleteEntries)
            {
                item.State = EntityState.Modified;
                var entity = (IDeleteBaseEntity)item.Entity;
                entity.IsDeleted = true;
                entity.DeletionTime = DateTime.Now;
                entity.DeleterUserId = userId;
            }

            #endregion

            return base.SavingChangesAsync(eventData, result, cancellationToken);
        }

    }
}
