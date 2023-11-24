namespace HZY.Core.ApiResultManage;

/// <summary>
/// 警告消息
/// </summary>
[Serializable]
public class MessageBox : Exception
{
    private R ApiResult { get; set; }

    public MessageBox(R apiResult) : base(string.Empty)
    {
        ApiResult = apiResult;
    }

    public MessageBox(string message) : base(message)
    {
        ApiResult = R.ErrorMessage(message);
    }

    public MessageBox(string message, object data) : base(message)
    {
        ApiResult = R.Error(message, data);
    }

    /// <summary>
    /// 获取 ApiResult
    /// </summary>
    /// <returns></returns>
    public R GetApiResult() => ApiResult;

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
    public static void Show(R apiResult) => throw new MessageBox(apiResult);


}