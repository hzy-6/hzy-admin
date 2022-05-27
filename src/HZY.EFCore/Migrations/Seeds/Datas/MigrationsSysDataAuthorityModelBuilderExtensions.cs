
using HZY.Models.Entities;
using HZY.Models.Entities.LowCode;
using HZY.Models.Entities.AllPeopleGoGoGo;
using HZY.Models.Entities.ApprovalFlow;
using HZY.Models.Entities.Framework;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.EFCore.Migrations.Seeds.Datas;

  public static class MigrationsSysDataAuthorityModelBuilderExtensions
    {
        public static void Seed(this ModelBuilder modelBuilder)
        {
// ===============================================表：SysDataAuthority 种子数据=============================================
modelBuilder.Entity<SysDataAuthority>().HasData(new SysDataAuthority(){Id=Guid.Parse("d09bf250-c5b0-41cb-237d-08da00442990"),CreationTime=DateTime.Parse("2022/3/7 22:09:58"),LastModificationTime=DateTime.Parse("2022/3/8 10:02:22"),PermissionType=SysDataAuthorityPermissionTypeEnum.Self,RoleId=Guid.Parse("40ff1844-c099-4061-98e0-cd6e544fcfd3")},new SysDataAuthority(){Id=Guid.Parse("0228a5b5-2202-4ba0-6e48-08da205da7b7"),CreationTime=DateTime.Parse("2022/4/17 18:33:04"),LastModificationTime=DateTime.Parse("2022/4/17 18:33:04"),PermissionType=SysDataAuthorityPermissionTypeEnum.Self,RoleId=Guid.Parse("18fa4771-6f58-46a3-80d2-6f0f5e9972e3")});

    }
}
