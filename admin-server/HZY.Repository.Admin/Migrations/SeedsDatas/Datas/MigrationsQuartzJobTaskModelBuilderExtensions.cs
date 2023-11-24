namespace HZY.Repository.Admin.Migrations.SeedsDatas.Datas;

public static class MigrationsQuartzJobTaskModelBuilderExtensions
{
    public static void Seed(this ModelBuilder modelBuilder)
    {
        // ===============================================表：quartz_job_task 种子数据=============================================
        modelBuilder.Entity<QuartzJobTask>().HasData(new QuartzJobTask() { Id = Guid.Parse("b871a81b-fda6-42b0-bf48-08db0369c499"), CreationTime = DateTime.Parse("2023/1/31 17:01:40"), CreatorUserId = Guid.Parse("00000000-0000-0000-0000-000000000000"), Cron = "0/10 * * * * ?", ExecuteTime = null, GroupName = "HZY.Managers.CalcDataManager", JobPoint = "HZY.Managers.CalcDataManager>Run", LastModificationTime = DateTime.Parse("2023/3/16 21:47:14"), LastModifierUserId = Guid.Parse("00000000-0000-0000-0000-000000000000"), Name = "Run", Remark = null, State = QuartzJobTaskStateEnum.运行中, Type = QuartzJobTaskTypeEnum.Local }, new QuartzJobTask() { Id = Guid.Parse("0af155d7-a8ee-4a07-ab1a-40dd0c77d7ea"), CreationTime = DateTime.Parse("2023/1/29 11:36:30"), CreatorUserId = Guid.Parse("00000000-0000-0000-0000-000000000000"), Cron = "0/10 * * * * ?", ExecuteTime = null, GroupName = "TEST", JobPoint = "http://localhost:5600/api/job/JobTest/Test", LastModificationTime = DateTime.Parse("2023/3/9 14:33:11"), LastModifierUserId = Guid.Parse("00000000-0000-0000-0000-000000000000"), Name = "默认测试接口", Remark = "用于测试", RequsetMode = QuartzJobTaskRequsetModeEnum.Get, State = QuartzJobTaskStateEnum.未运行, Type = QuartzJobTaskTypeEnum.WebApi });

    }
}
