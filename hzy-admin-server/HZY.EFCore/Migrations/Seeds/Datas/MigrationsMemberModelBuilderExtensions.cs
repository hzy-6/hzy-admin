
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

  public static class MigrationsMemberModelBuilderExtensions
    {
        public static void Seed(this ModelBuilder modelBuilder)
        {
// ===============================================表：Member 种子数据=============================================
modelBuilder.Entity<Member>().HasData(new Member(){Id=Guid.Parse("96a1aa3d-a61a-42d0-954a-c71753fb2065"),Birthday=DateTime.Parse("2018/4/25 23:00:00"),CreationTime=DateTime.Parse("2020/10/24 0:07:42"),FilePath=null,Introduce="<p>123</p>",LastModificationTime=DateTime.Parse("2021/4/18 22:08:06"),Name="123",Number="123",Phone="123",Photo=null,Sex="女",UserId=Guid.Parse("ac18f496-e93d-42f0-b59e-e321acc85335")},new Member(){Id=Guid.Parse("9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e"),Birthday=DateTime.Parse("2019/7/8 11:47:24"),CreationTime=DateTime.Parse("2018/4/25 23:00:00"),FilePath="/upload/files/20210118/time_233310_old_name_hzy.png",Introduce="<p>999888</p>",LastModificationTime=DateTime.Parse("2022/5/8 16:46:21"),Name="测试会员",Number="1",Phone="18510912123",Photo="http://localhost:5600http://localhost:5600http://localhost:5600/upload/files/20210118/time_232747_old_name_hzy.png",Sex="男",UserId=Guid.Parse("ac18f496-e93d-42f0-b59e-e321acc85335")});

    }
}
