
using HZY.Models.Entities;
using HZY.Models.Entities.LowCode;
using HZY.Models.Entities.Framework;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.EFCore.Migrations.Seeds.Datas;

  public static class MigrationsSysDataAuthorityCustomModelBuilderExtensions
    {
        public static void Seed(this ModelBuilder modelBuilder)
        {
// ===============================================表：sys_data_authority_custom 种子数据=============================================
modelBuilder.Entity<SysDataAuthorityCustom>().HasData(new SysDataAuthorityCustom(){Id=Guid.Parse("99013215-08b9-45cc-351e-08dac55a1d77"),CreationTime=DateTime.Parse("2022/11/13 17:33:25"),CreatorUserId=Guid.Parse("0198459e-2034-4533-b843-5d227ad20740"),LastModificationTime=null,LastModifierUserId=null,SysDataAuthorityId=Guid.Parse("d09bf250-c5b0-41cb-237d-08da00442990"),SysOrganizationId=5},new SysDataAuthorityCustom(){Id=Guid.Parse("f23e4387-e718-4845-351f-08dac55a1d77"),CreationTime=DateTime.Parse("2022/11/13 17:33:25"),CreatorUserId=Guid.Parse("0198459e-2034-4533-b843-5d227ad20740"),LastModificationTime=null,LastModifierUserId=null,SysDataAuthorityId=Guid.Parse("d09bf250-c5b0-41cb-237d-08da00442990"),SysOrganizationId=7},new SysDataAuthorityCustom(){Id=Guid.Parse("9f5f3bd1-0c40-4810-3520-08dac55a1d77"),CreationTime=DateTime.Parse("2022/11/13 17:33:25"),CreatorUserId=Guid.Parse("0198459e-2034-4533-b843-5d227ad20740"),LastModificationTime=null,LastModifierUserId=null,SysDataAuthorityId=Guid.Parse("d09bf250-c5b0-41cb-237d-08da00442990"),SysOrganizationId=11},new SysDataAuthorityCustom(){Id=Guid.Parse("c04f9ae5-916a-44b6-3521-08dac55a1d77"),CreationTime=DateTime.Parse("2022/11/13 17:33:25"),CreatorUserId=Guid.Parse("0198459e-2034-4533-b843-5d227ad20740"),LastModificationTime=null,LastModifierUserId=null,SysDataAuthorityId=Guid.Parse("d09bf250-c5b0-41cb-237d-08da00442990"),SysOrganizationId=10},new SysDataAuthorityCustom(){Id=Guid.Parse("79b86c29-ccd6-4e88-3522-08dac55a1d77"),CreationTime=DateTime.Parse("2022/11/13 17:33:25"),CreatorUserId=Guid.Parse("0198459e-2034-4533-b843-5d227ad20740"),LastModificationTime=null,LastModifierUserId=null,SysDataAuthorityId=Guid.Parse("d09bf250-c5b0-41cb-237d-08da00442990"),SysOrganizationId=9});

    }
}
