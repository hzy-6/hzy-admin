
using HZY.Models.Entities;
using HZY.Models.Entities.LowCode;
using HZY.Models.Entities.ApprovalFlow;
using HZY.Models.Entities.Framework;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.EFCore.Migrations.Seeds.Datas;

  public static class MigrationsMemberModelBuilderExtensions
    {
        public static void Seed(this ModelBuilder modelBuilder)
        {
// ===============================================表：member 种子数据=============================================
modelBuilder.Entity<Member>().HasData(new Member(){Id=Guid.Parse("96a1aa3d-a61a-42d0-954a-c71753fb2065"),Birthday=DateTime.Parse("2018/4/25 23:00:00"),CreationTime=DateTime.Parse("2020/10/24 0:07:42"),CreatorUserId=null,FilePath="[{\"uid\":\"a6778e9d-6c2e-4d23-91c9-d0d10756d177\",\"name\":\"time_000345_old_name_hzy.png\",\"percent\":100,\"status\":\"done\",\"thumbUrl\":\"/upload/files/20220731/time_000345_old_name_hzy.png\",\"url\":\"/upload/files/20220731/time_000345_old_name_hzy.png\"}]",Introduce="<p>123</p>",LastModificationTime=DateTime.Parse("2022/7/31 0:03:48"),LastModifierUserId=null,Name="123",Number="123",Phone="123",Photo="[{\"uid\":\"d80bbe3d-7296-4eb9-965a-cb3f03d3def7\",\"name\":\"time_000335_old_name_微信图片_20200413162625.jpg\",\"percent\":100,\"status\":\"done\",\"thumbUrl\":\"/upload/files/20220731/time_000335_old_name_微信图片_20200413162625.jpg\",\"url\":\"/upload/files/20220731/time_000335_old_name_微信图片_20200413162625.jpg\"}]",Sex="女",UserId=Guid.Parse("ac18f496-e93d-42f0-b59e-e321acc85335")},new Member(){Id=Guid.Parse("9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e"),Birthday=DateTime.Parse("2019/7/8 11:47:24"),CreationTime=DateTime.Parse("2018/4/25 23:00:00"),CreatorUserId=null,FilePath="[{\"uid\":\"35828ad6-cbba-4bcb-9c97-141d5b31acc7\",\"name\":\"time_000320_old_name_Ko.js增删改查例子.txt\",\"percent\":100,\"status\":\"done\",\"thumbUrl\":\"/upload/files/20220731/time_000320_old_name_Ko.js增删改查例子.txt\",\"url\":\"/upload/files/20220731/time_000320_old_name_Ko.js增删改查例子.txt\"}]",Introduce="<p>999888</p>",LastModificationTime=DateTime.Parse("2022/7/31 0:03:23"),LastModifierUserId=null,Name="测试会员",Number="1",Phone="18510912123",Photo="[{\"uid\":\"6f5aed63-0fdc-4752-9c2b-3f66cbfa77bf\",\"name\":\"time_000222_old_name_微信图片_20200521081252.jpg\",\"percent\":100,\"status\":\"done\",\"thumbUrl\":\"/upload/files/20220731/time_000222_old_name_微信图片_20200521081252.jpg\",\"url\":\"/upload/files/20220731/time_000222_old_name_微信图片_20200521081252.jpg\"}]",Sex="男",UserId=Guid.Parse("ac18f496-e93d-42f0-b59e-e321acc85335")});

    }
}
