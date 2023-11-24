namespace HZY.Core.CAP;

public class CoreCAPRedisStartup : StartupModule<CoreCAPRedisStartup>
{

    /// <summary>
    /// 
    /// </summary>
    /// <param name="webApplicationBuilder"></param>
    public override void ConfigureServices(WebApplicationBuilder webApplicationBuilder)
    {
        var services = webApplicationBuilder.Services;

        webApplicationBuilder.Services.AddCap(x =>
        {
            //如果你使用的 EF 进行数据操作，你需要添加如下配置：
            //x.UseEntityFramework<TDbContext>();  //可选项，你不需要再次配置 x.UseSqlServer 了

            ////如果你使用的ADO.NET，根据数据库选择进行配置：
            //x.UseSqlServer("数据库连接字符串");
            //x.UseMySql("数据库连接字符串");
            //x.UsePostgreSql("数据库连接字符串");

            ////如果你使用的 MongoDB，你可以添加如下配置：
            //x.UseMongoDB("ConnectionStrings");  //注意，仅支持MongoDB 4.0+集群

            ////CAP支持 RabbitMQ、Kafka、AzureServiceBus、AmazonSQS 等作为MQ，根据使用选择配置：
            //x.UseRabbitMQ("ConnectionStrings");
            //x.UseKafka("ConnectionStrings");
            //x.UseAzureServiceBus("ConnectionStrings");
            //x.UseAmazonSQS();

            // 内存消息队列
            x.UseRedis();
        });
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="webApplication"></param>
    public override void Configure(WebApplication webApplication)
    {

    }

}
