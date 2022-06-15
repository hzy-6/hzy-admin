
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

  public static class MigrationsSysFunctionModelBuilderExtensions
    {
        public static void Seed(this ModelBuilder modelBuilder)
        {
// ===============================================表：SysFunction 种子数据=============================================
modelBuilder.Entity<SysFunction>().HasData(new SysFunction(){Id=Guid.Parse("b6fd5425-504a-46a9-993b-2f8dc9158eb8"),ByName="Print",CreationTime=DateTime.Parse("2016/6/20 13:40:52"),LastModificationTime=DateTime.Parse("2021/4/18 22:08:06"),Name="打印",Number=80,Remark="Print"},new SysFunction(){Id=Guid.Parse("c9518758-b2e1-4f51-b517-5282e273889c"),ByName="Display",CreationTime=DateTime.Parse("2016/6/20 13:40:52"),LastModificationTime=DateTime.Parse("2021/4/18 22:08:06"),Name="显示",Number=10,Remark="Display"},new SysFunction(){Id=Guid.Parse("f27ecb0a-197d-47b1-b243-59a8c71302bf"),ByName="Search",CreationTime=DateTime.Parse("2016/6/20 13:40:52"),LastModificationTime=DateTime.Parse("2021/4/18 22:08:06"),Name="检索",Number=60,Remark="Search"},new SysFunction(){Id=Guid.Parse("383e7ee2-7690-46ac-9230-65155c84aa30"),ByName="Save",CreationTime=DateTime.Parse("2016/6/20 13:40:52"),LastModificationTime=DateTime.Parse("2021/4/18 22:08:06"),Name="保存",Number=50,Remark="Save"},new SysFunction(){Id=Guid.Parse("9c388461-2704-4c5e-a729-72c17e9018e1"),ByName="Delete",CreationTime=DateTime.Parse("2016/6/20 13:40:52"),LastModificationTime=DateTime.Parse("2021/4/18 22:08:06"),Name="删除",Number=40,Remark="Delete"},new SysFunction(){Id=Guid.Parse("bffefb1c-8988-4ddf-b4ac-81c2b30e80cd"),ByName="Insert",CreationTime=DateTime.Parse("2016/6/20 13:40:52"),LastModificationTime=DateTime.Parse("2021/4/18 22:08:06"),Name="添加",Number=20,Remark="Insert"},new SysFunction(){Id=Guid.Parse("2401f4d0-60b0-4e2e-903f-84c603373572"),ByName="Export",CreationTime=DateTime.Parse("2016/6/20 13:40:52"),LastModificationTime=DateTime.Parse("2021/4/18 22:08:06"),Name="导出",Number=70,Remark="Export"},new SysFunction(){Id=Guid.Parse("e7ef2a05-8317-41c3-b588-99519fe88bf9"),ByName="Update",CreationTime=DateTime.Parse("2016/6/20 13:40:52"),LastModificationTime=DateTime.Parse("2021/4/18 22:08:06"),Name="修改",Number=30,Remark="Update"});

    }
}
