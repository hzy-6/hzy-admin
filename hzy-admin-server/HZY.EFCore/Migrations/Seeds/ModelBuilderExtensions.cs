using HZY.EFCore.Migrations.Seeds.Datas;
using Microsoft.EntityFrameworkCore;

namespace HZY.EFCore.Migrations.Seeds
{
    /// <summary>
    /// EFCore 种子数据
    /// </summary>
    public static class ModelBuilderExtensions
    {

        /// <summary>
        /// 种子数据
        /// </summary>
        /// <param name="modelBuilder"></param>
        public static void Seed(this ModelBuilder modelBuilder)
        {
            MigrationsLowCodeTableModelBuilderExtensions.Seed(modelBuilder);
            MigrationsLowCodeTableInfoModelBuilderExtensions.Seed(modelBuilder);
            MigrationsMemberModelBuilderExtensions.Seed(modelBuilder);
            MigrationsSysDataAuthorityModelBuilderExtensions.Seed(modelBuilder);
            MigrationsSysDictionaryModelBuilderExtensions.Seed(modelBuilder);
            MigrationsSysFunctionModelBuilderExtensions.Seed(modelBuilder);
            MigrationsSysMenuModelBuilderExtensions.Seed(modelBuilder);
            MigrationsSysMenuFunctionModelBuilderExtensions.Seed(modelBuilder);
            MigrationsSysOrganizationModelBuilderExtensions.Seed(modelBuilder);
            MigrationsSysPostModelBuilderExtensions.Seed(modelBuilder);
            MigrationsSysRoleModelBuilderExtensions.Seed(modelBuilder);
            MigrationsSysRoleMenuFunctionModelBuilderExtensions.Seed(modelBuilder);
            MigrationsSysUserModelBuilderExtensions.Seed(modelBuilder);
            MigrationsSysUserPostModelBuilderExtensions.Seed(modelBuilder);
            MigrationsSysUserRoleModelBuilderExtensions.Seed(modelBuilder);
        }


    }
}
