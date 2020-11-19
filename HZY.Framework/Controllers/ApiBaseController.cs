using HZY.Framework.Model;
using Microsoft.AspNetCore.Mvc;

namespace HZY.Framework.Controllers
{
    [ApiController]
    [Route("Api/[controller]")]
    public class ApiBaseController : ControllerBase
    {
        /// <summary>
        /// 返回数据
        /// </summary>
        /// <param name="apiResultCodeEnum"></param>
        /// <param name="message"></param>
        /// <param name="data"></param>
        /// <returns></returns>
        [NonAction]
        public ApiResult Result(ApiResult.ApiResultCodeEnum apiResultCodeEnum, string message, object data)
            => ApiResult.Result(apiResultCodeEnum, message, data);

        /// <summary>
        /// 返回数据
        /// </summary>
        /// <param name="code"></param>
        /// <param name="message"></param>
        /// <param name="data"></param>
        /// <returns></returns>
        [NonAction]
        public ApiResult Result(int code, string message, object data)
            => ApiResult.Result(code, message, data);

        #region Ok

        /// <summary>
        /// 返回消息
        /// </summary>
        /// <param name="message"></param>
        /// <returns></returns>
        [NonAction]
        public ApiResult ResultOk(string message) => ApiResult.OkMessage(message);

        /// <summary>
        /// 返回数据
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [NonAction]
        public ApiResult ResultOk(object data) => ApiResult.OkData(data);

        /// <summary>
        /// 返回消息和数据
        /// </summary>
        /// <param name="message"></param>
        /// <param name="data"></param>
        /// <returns></returns>
        [NonAction]
        public ApiResult ResultOk(string message, object data) => ApiResult.Ok(message, data);

        #endregion

        #region 警告

        /// <summary>
        /// 返回消息
        /// </summary>
        /// <param name="message"></param>
        /// <returns></returns>
        [NonAction]
        public ApiResult ResultWarn(string message) => ApiResult.OkMessage(message);

        /// <summary>
        /// 返回数据
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [NonAction]
        public ApiResult ResultWarn(object data) => ApiResult.OkData(data);

        /// <summary>
        /// 返回消息和数据
        /// </summary>
        /// <param name="message"></param>
        /// <param name="data"></param>
        /// <returns></returns>
        [NonAction]
        public ApiResult ResultWarn(string message, object data) => ApiResult.Ok(message, data);

        #endregion
    }
}