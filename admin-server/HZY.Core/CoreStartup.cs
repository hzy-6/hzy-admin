namespace HZY.Core;

/// <summary>
/// 程序启动器
/// </summary>
[ImportStartup(
    typeof(CoreAutoRegisterIOCStartup)
    )]
public class CoreStartup : StartupModule<CoreStartup>
{
    /// <summary>
    /// 程序启动器
    /// </summary>
    public CoreStartup() => Order = -1;

    /// <summary>
    /// 
    /// </summary>
    /// <param name="webApplicationBuilder"></param>
    public override void ConfigureServices(WebApplicationBuilder webApplicationBuilder)
    {
        

    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="webApplication"></param>
    public override void Configure(WebApplication webApplication)
    {
        // 创建 IdGeneratorOptions 对象，可在构造函数中输入 WorkerId：
        var options = new IdGeneratorOptions((ushort)Thread.CurrentThread.ManagedThreadId);
        options.WorkerIdBitLength = 16; // 默认值6，限定 WorkerId 最大值为2^6-1，即默认最多支持64个节点。
        options.SeqBitLength = 6; // 默认值6，限制每毫秒生成的ID个数。若生成速度超过5万个/秒，建议加大 SeqBitLength 到 10。
                                  // options.BaseTime = Your_Base_Time; // 如果要兼容老系统的雪花算法，此处应设置为老系统的BaseTime。
                                  // ...... 其它参数参考 IdGeneratorOptions 定义。
                                  // 配置长度
                                  // 保存参数（务必调用，否则参数设置不生效）：
        YitIdHelper.SetIdGenerator(options);
    }

}
