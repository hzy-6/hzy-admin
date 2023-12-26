using System.Net;

namespace HZY.Admin.Blazor.Client.Utils;

/// <summary>
/// Api 消息返回类
/// </summary>
public class R : R<object>
{
    public R() : base()
    {

    }

    public R(int code, string? message, object? data) : base(code, message, data)
    {

    }

    #region result

    /// <summary>
    /// 返回消息
    /// </summary>
    /// <param name="code"></param>
    /// <param name="message"></param>
    /// <returns></returns>
    public static R ResultMessage(HttpStatusCode code, string message)
    => new R((int)code, message, null);

    /// <summary>
    /// 返回数据
    /// </summary>
    /// <param name="code"></param>
    /// <param name="data"></param>
    /// <returns></returns>
    public static R ResultData(HttpStatusCode code, object data)
        => new R((int)code, null, data);

    /// <summary>
    /// 可返回消息和数据
    /// </summary>
    /// <param name="code"></param>
    /// <param name="message"></param>
    /// <param name="data"></param>
    /// <returns></returns>
    public static R Result(HttpStatusCode code, string message, object data)
        => new R((int)code, message, data);

    #endregion

    #region result code 可传入 int

    /// <summary>
    /// 返回消息
    /// </summary>
    /// <param name="code"></param>
    /// <param name="message"></param>
    /// <returns></returns>
    public static R ResultMessage(int code, string message)
        => new R(code, message, null);

    /// <summary>
    /// 返回数据
    /// </summary>
    /// <param name="code"></param>
    /// <param name="data"></param>
    /// <returns></returns>
    public static R ResultData(int code, object data)
        => new R(code, null, data);

    /// <summary>
    /// 可返回消息和数据
    /// </summary>
    /// <param name="code"></param>
    /// <param name="message"></param>
    /// <param name="data"></param>
    /// <returns></returns>
    public static R Result(int code, string message, object data)
        => new R(code, message, data);

    #endregion

    #region Ok

    /// <summary>
    /// 成功 可返回消息
    /// </summary>
    /// <param name="message"></param>
    /// <returns></returns>
    public static R OkMessage(string message)
        => ResultMessage(HttpStatusCode.OK, message);

    /// <summary>
    /// 成功 可返回数据
    /// </summary>
    /// <param name="data"></param>
    /// <returns></returns>
    public static R OkData(object data)
        => ResultData(HttpStatusCode.OK, data);

    /// <summary>
    /// 成功 可返回 消息和数据
    /// </summary>
    /// <param name="message"></param>
    /// <param name="data"></param>
    /// <returns></returns>
    public static R Ok(string message, object data)
        => Result(HttpStatusCode.OK, message, data);

    #endregion

    #region Error

    /// <summary>
    /// Error 可返回消息
    /// </summary>
    /// <param name="message"></param>
    /// <returns></returns>
    public static R ErrorMessage(string message)
        => ResultMessage(HttpStatusCode.InternalServerError, message);

    /// <summary>
    /// Error 可返回数据
    /// </summary>
    /// <param name="data"></param>
    /// <returns></returns>
    public static R ErrorData(object data)
        => ResultData(HttpStatusCode.InternalServerError, data);

    /// <summary>
    /// Error 可返回 消息和数据
    /// </summary>
    /// <param name="message"></param>
    /// <param name="data"></param>
    /// <returns></returns>
    public static R Error(string message, object data)
        => Result(HttpStatusCode.InternalServerError, message, data);

    #endregion


}

/// <summary>
/// Api 消息返回类
/// </summary>
public class R<T>
{
    public R()
    {

    }

    public R(int code, string? message, T? data)
    {
        this.Code = code;
        this.Message = message;
        this.Data = data;
    }

    public int Code { get; set; }
    public string? Message { get; set; }
    public T? Data { get; set; }



}
