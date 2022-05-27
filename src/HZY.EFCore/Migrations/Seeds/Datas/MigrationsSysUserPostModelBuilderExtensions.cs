
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

  public static class MigrationsSysUserPostModelBuilderExtensions
    {
        public static void Seed(this ModelBuilder modelBuilder)
        {
// ===============================================表：SysUserPost 种子数据=============================================
modelBuilder.Entity<SysUserPost>().HasData(new SysUserPost(){Id=Guid.Parse("978fc672-d829-4dad-abc7-071810c5ad18"),CreationTime=DateTime.Parse("2022/3/8 17:15:08"),LastModificationTime=DateTime.Parse("2022/3/8 17:15:08"),PostId=Guid.Parse("e46af329-6d08-442c-9837-f22cff954411"),UserId=Guid.Parse("e225e163-31c9-4da9-62d7-08da00e3d8a0")},new SysUserPost(){Id=Guid.Parse("8100145c-9cd0-49bf-9a62-25c9e508bc1c"),CreationTime=DateTime.Parse("2022/3/8 17:19:55"),LastModificationTime=DateTime.Parse("2022/3/8 17:19:55"),PostId=Guid.Parse("f0bd38c2-f1de-4bd9-e2db-08da00a93622"),UserId=Guid.Parse("a1b6dafb-2b6a-4ff9-62da-08da00e3d8a0")},new SysUserPost(){Id=Guid.Parse("6133b794-efc7-4ebc-b7cf-2cf72fa768f8"),CreationTime=DateTime.Parse("2022/4/23 17:55:33"),LastModificationTime=DateTime.Parse("2022/4/23 17:55:33"),PostId=Guid.Parse("f0bd38c2-f1de-4bd9-e2db-08da00a93622"),UserId=Guid.Parse("1550d6d4-0529-4fdd-62dc-08da00e3d8a0")},new SysUserPost(){Id=Guid.Parse("575bf085-47bb-42f2-8b68-620cf460b164"),CreationTime=DateTime.Parse("2022/3/8 17:29:22"),LastModificationTime=DateTime.Parse("2022/3/8 17:29:22"),PostId=Guid.Parse("96927c30-41d0-4ced-8e29-cbed35c90fb0"),UserId=Guid.Parse("0198459e-2034-4533-b843-5d227ad20740")},new SysUserPost(){Id=Guid.Parse("af1bec7e-3309-4629-9606-72eefa1826b3"),CreationTime=DateTime.Parse("2022/3/8 17:20:20"),LastModificationTime=DateTime.Parse("2022/3/8 17:20:20"),PostId=Guid.Parse("f0bd38c2-f1de-4bd9-e2db-08da00a93622"),UserId=Guid.Parse("cc186fe2-ee27-4292-62db-08da00e3d8a0")},new SysUserPost(){Id=Guid.Parse("d4e0ae0b-3573-4901-8fd7-9bb2c88ebe94"),CreationTime=DateTime.Parse("2022/3/8 17:17:58"),LastModificationTime=DateTime.Parse("2022/3/8 17:17:58"),PostId=Guid.Parse("f0bd38c2-f1de-4bd9-e2db-08da00a93622"),UserId=Guid.Parse("3739f349-7995-4c63-62d8-08da00e3d8a0")},new SysUserPost(){Id=Guid.Parse("b97331a7-e281-4027-aade-9f068558826a"),CreationTime=DateTime.Parse("2022/3/8 17:13:02"),LastModificationTime=DateTime.Parse("2022/3/8 17:13:02"),PostId=Guid.Parse("f0bd38c2-f1de-4bd9-e2db-08da00a93622"),UserId=Guid.Parse("5722af0f-2366-4fc9-62d5-08da00e3d8a0")},new SysUserPost(){Id=Guid.Parse("0c1a55ba-6bd3-4810-a494-a6b9b7374d4d"),CreationTime=DateTime.Parse("2022/3/8 10:13:35"),LastModificationTime=DateTime.Parse("2022/3/8 10:13:35"),PostId=Guid.Parse("f0bd38c2-f1de-4bd9-e2db-08da00a93622"),UserId=Guid.Parse("ac18f496-e93d-42f0-b59e-e321acc85335")},new SysUserPost(){Id=Guid.Parse("e64ef93c-2ce5-4b1d-a5d0-a9de937c5a3f"),CreationTime=DateTime.Parse("2022/3/8 17:15:07"),LastModificationTime=DateTime.Parse("2022/3/8 17:15:07"),PostId=Guid.Parse("f0bd38c2-f1de-4bd9-e2db-08da00a93622"),UserId=Guid.Parse("e225e163-31c9-4da9-62d7-08da00e3d8a0")},new SysUserPost(){Id=Guid.Parse("6f671077-c98d-4106-9736-bf2edb6db58d"),CreationTime=DateTime.Parse("2022/3/8 17:14:13"),LastModificationTime=DateTime.Parse("2022/3/8 17:14:13"),PostId=Guid.Parse("e46af329-6d08-442c-9837-f22cff954411"),UserId=Guid.Parse("4fd6a740-0cf1-4975-62d6-08da00e3d8a0")},new SysUserPost(){Id=Guid.Parse("6c34f115-28dd-441a-81d5-f6598c97d44a"),CreationTime=DateTime.Parse("2022/3/8 17:19:22"),LastModificationTime=DateTime.Parse("2022/3/8 17:19:22"),PostId=Guid.Parse("f0bd38c2-f1de-4bd9-e2db-08da00a93622"),UserId=Guid.Parse("a3f9784c-5f00-4ec9-62d9-08da00e3d8a0")},new SysUserPost(){Id=Guid.Parse("b797ff16-d6f7-45db-83ec-f910b2612926"),CreationTime=DateTime.Parse("2022/3/8 17:14:13"),LastModificationTime=DateTime.Parse("2022/3/8 17:14:13"),PostId=Guid.Parse("f0bd38c2-f1de-4bd9-e2db-08da00a93622"),UserId=Guid.Parse("4fd6a740-0cf1-4975-62d6-08da00e3d8a0")});

    }
}
