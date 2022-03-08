using System;

namespace HZY.Infrastructure.ApiResultManage;

/// <summary>
/// 警告消息
/// </summary>
[Serializable]
public class MessageBox : Exception
{
    private ApiResult ApiResult { get; set; }

    public MessageBox(ApiResult apiResult) : base(string.Empty)
    {
        this.ApiResult = apiResult;
    }

    public MessageBox(string message) : base(message)
    {
        this.ApiResult = ApiResult.WarnMessage(message);
    }

    public MessageBox(string message, object data) : base(message)
    {
        this.ApiResult = ApiResult.Warn(message, data);
    }

    /// <summary>
    /// 获取 ApiResult
    /// </summary>
    /// <returns></returns>
    public ApiResult GetApiResult() => ApiResult;

    /// <summary>
    /// 输出消息
    /// </summary>
    /// <param name="message"></param>
    public static void Show(string message) => throw new MessageBox(message);

    /// <summary>
    /// 输出消息和数据
    /// </summary>
    /// <param name="message"></param>
    /// <param name="data"></param>
    public static void Show(string message, object data) => throw new MessageBox(message, data);

    /// <summary>
    /// 支持传入 ApiResult 对象
    /// </summary>
    /// <param name="apiResult"></param>
    public static void Show(ApiResult apiResult) => throw new MessageBox(apiResult);
}