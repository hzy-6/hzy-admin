
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

  public static class MigrationsSysDictionaryModelBuilderExtensions
    {
        public static void Seed(this ModelBuilder modelBuilder)
        {
// ===============================================表：SysDictionary 种子数据=============================================
modelBuilder.Entity<SysDictionary>().HasData(new SysDictionary(){Code="news_type",CreationTime=DateTime.Parse("2021/7/25 22:31:30"),Id=1,LastModificationTime=DateTime.Parse("2021/7/25 22:39:34"),Name="资讯类别",ParentId=null,Sort=1,Value=null},new SysDictionary(){Code="news_type_nan",CreationTime=DateTime.Parse("2021/7/25 22:38:49"),Id=2,LastModificationTime=DateTime.Parse("2021/7/25 22:40:30"),Name="男",ParentId=1,Sort=1,Value="1"},new SysDictionary(){Code="news_type_nv",CreationTime=DateTime.Parse("2021/7/25 22:40:47"),Id=3,LastModificationTime=DateTime.Parse("2022/4/23 22:18:52"),Name="女",ParentId=1,Sort=2,Value="2"});

    }
}
