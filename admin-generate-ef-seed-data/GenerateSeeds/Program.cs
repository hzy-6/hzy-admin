using GenerateSeeds;
using System.Text;

var connectionString = "Server=.;Database=hzy_microservices_sqlserver_20230227;User ID=sa;Password=123456;MultipleActiveResultSets=true;Encrypt=True;TrustServerCertificate=True;";

IFreeSql fsql = new FreeSql.FreeSqlBuilder()
    .UseConnectionString(FreeSql.DataType.SqlServer, connectionString)
    .UseAutoSyncStructure(false) //自动同步实体结构到数据库
    .Build(); //请务必定义成 Singleton 单例模式

var tables = fsql.DbFirst.GetTablesByDatabase();

var useStringBuilder = new StringBuilder();
foreach (var table in tables)
{
    var list = fsql.Ado.Query<Dictionary<string, object>>($"select * from {table.Name}");

    if (list.Count == 0) continue;

    if (table.Name.ToLower().Contains("log".ToLower())) continue;

    if (table.Name.ToLower().StartsWith("__".ToLower())) continue;

    var sb = new StringBuilder();

    var entityName = Util.LineToHump(table.Name);

    var className = $"Migrations{entityName}ModelBuilderExtensions";

    // MigrationsLowCodeTableInfoModelBuilderExtensions.Seed(modelBuilder);
    useStringBuilder.Append(className + ".Seed(modelBuilder);");

    sb.Append($@"
namespace HZY.Repository.EntityFramework.Admin.Migrations.SeedsDatas.Datas;

  public static class {className}
    {{
        public static void Seed(this ModelBuilder modelBuilder)
        {{
// ===============================================表：{table.Name} 种子数据=============================================
modelBuilder.Entity<{entityName}>().HasData(");

    var codes = new List<string>();
    foreach (var item in list)
    {
        var rows = $"new {entityName}(){{";

        var fileds = new List<string>();
        foreach (var column in table.Columns)
        {
            var value = item[column.Name] ?? null;

            if (value is string)
            {
                if (value != null && value.ToString().Count(w => w == '"') > 1)
                {
                    var start = "\"";
                    var end = "\\\"";
                    var newValue = value.ToString().Replace(start, end);
                    fileds.Add($"{column.Name}=\"{newValue}\"");
                }
                else
                {
                    fileds.Add($"{column.Name}=\"{(value == null ? null : value)}\"");
                }

            }
            else if (value is Guid)
            {
                fileds.Add($"{column.Name}=Guid.Parse(\"{value}\")");
            }
            else if (value is DateTime || value is DateTime?)
            {
                fileds.Add($"{column.Name}=DateTime.Parse(\"{value}\")");
            }
            else if (value is bool)
            {
                fileds.Add($"{column.Name}=bool.Parse(\"{value}\")");
            }
            else if (column.Name == "PermissionType" && table.Name == "sys_data_authority")
            {
                fileds.Add($"{column.Name}=SysDataAuthorityPermissionTypeEnum.Self");
            }
            else if (column.Name == "Type" && table.Name == "sys_menu")
            {
                //SysMenuTypeEnum.菜单
                if (value is int || value is int?)
                {
                    if ((int)value == (int)SysMenuTypeEnum.菜单)
                    {
                        fileds.Add($"{column.Name}=SysMenuTypeEnum.菜单");
                    }
                    else
                    {
                        fileds.Add($"{column.Name}=SysMenuTypeEnum.目录");
                    }
                }
            }
            else if (column.Name == "Mode" && table.Name == "sys_menu")
            {
                if (value is int || value is int?)
                {
                    if ((int)value == (int)SysMenuModeEnum.普通)
                    {
                        fileds.Add($"{column.Name}=SysMenuModeEnum.普通");
                    }
                    else
                    {
                        fileds.Add($"{column.Name}=SysMenuModeEnum.微前端");
                    }
                }
            }
            else if (column.Name == "State" && (table.Name == "sys_post" || table.Name == "sys_organization"))
            {
                fileds.Add($"{column.Name}=StateEnum.正常");
            }
            else if (column.Name == "State" && table.Name == "quartz_job_task")
            {
                if (value is int || value is int?)
                {
                    if ((int)value == (int)QuartzJobTaskStateEnum.运行中)
                    {
                        fileds.Add($"{column.Name}=QuartzJobTaskStateEnum.运行中");
                    }
                    else
                    {
                        fileds.Add($"{column.Name}=QuartzJobTaskStateEnum.未运行");
                    }
                }
            }
            else if (column.Name == "Type" && table.Name == "quartz_job_task")
            {
                if (value is int || value is int?)
                {
                    if ((int)value == (int)QuartzJobTaskTypeEnum.Local)
                    {
                        fileds.Add($"{column.Name}=QuartzJobTaskTypeEnum.Local");
                    }
                    else
                    {
                        fileds.Add($"{column.Name}=QuartzJobTaskTypeEnum.WebApi");
                    }
                }
            }
            else if (column.Name == "RequsetMode" && table.Name == "quartz_job_task")
            {
                if (value is int || value is int?)
                {
                    if ((int)value == (int)QuartzJobTaskRequsetModeEnum.Delete)
                    {
                        fileds.Add($"{column.Name}=QuartzJobTaskRequsetModeEnum.Delete");
                    }

                    if ((int)value == (int)QuartzJobTaskRequsetModeEnum.Get)
                    {
                        fileds.Add($"{column.Name}=QuartzJobTaskRequsetModeEnum.Get");
                    }

                    if ((int)value == (int)QuartzJobTaskRequsetModeEnum.Post)
                    {
                        fileds.Add($"{column.Name}=QuartzJobTaskRequsetModeEnum.Post");
                    }

                    if (value == null)
                    {
                        fileds.Add($"{column.Name}=null");
                    }

                }
            }
            else
            {
                if (value == null || string.IsNullOrWhiteSpace(value.ToString()))
                {
                    fileds.Add($"{column.Name}=null");
                }
                else
                {
                    fileds.Add($"{column.Name}={value}");
                }

            }

        }

        rows += string.Join(",", fileds);

        rows += $"}}";

        codes.Add(rows);
    }

    sb.Append(string.Join(",", codes));

    sb.Append(@");

    }
}
");

    //验证文件是否存在
    if (!Directory.Exists(AppDomain.CurrentDomain.BaseDirectory + "codes"))
    {
        Directory.CreateDirectory(AppDomain.CurrentDomain.BaseDirectory + "/codes");
    }

    var fileName = "/codes/" + className + ".cs";

    if (File.Exists(AppDomain.CurrentDomain.BaseDirectory + fileName))
    {
        File.Delete(AppDomain.CurrentDomain.BaseDirectory + fileName);
    }

    File.WriteAllTextAsync(AppDomain.CurrentDomain.BaseDirectory + fileName, sb.ToString());

}

Console.WriteLine(useStringBuilder.ToString());
Console.WriteLine("完成!!!");

Console.ReadKey();


