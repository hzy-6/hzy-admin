using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Framework.ApiResultManage
{
    /// <summary>
    /// Api 返回数据 对象
    /// </summary>
    public class ApiResultData
    {
       
        /// <summary>
        /// 返回数据
        /// </summary>
        /// <param name="apiResultCodeEnum"></param>
        /// <param name="message"></param>
        /// <param name="data"></param>
        /// <returns></returns>
        public ApiResult Result(ApiResultCodeEnum apiResultCodeEnum, string message, object data)
            => ApiResult.Result(apiResultCodeEnum, message, data);

        /// <summary>
        /// 返回数据
        /// </summary>
        /// <param name="code"></param>
        /// <param name="message"></param>
        /// <param name="data"></param>
        /// <returns></returns>
        public ApiResult Result(int code, string message, object data)
            => ApiResult.Result(code, message, data);

        #region Ok

        /// <summary>
        /// 返回消息
        /// </summary>
        /// <param name="message"></param>
        /// <returns></returns>
        public ApiResult ResultOk(string message) => ApiResult.OkMessage(message);

        /// <summary>
        /// 返回数据
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        public ApiResult ResultOk(object data) => ApiResult.OkData(data);

        /// <summary>
        /// 返回消息和数据
        /// </summary>
        /// <param name="message"></param>
        /// <param name="data"></param>
        /// <returns></returns>
        public ApiResult ResultOk(string message, object data) => ApiResult.Ok(message, data);

        #endregion

        #region 警告

        /// <summary>
        /// 返回消息
        /// </summary>
        /// <param name="message"></param>
        /// <returns></returns>
        public ApiResult ResultWarn(string message) => ApiResult.OkMessage(message);

        /// <summary>
        /// 返回数据
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        public ApiResult ResultWarn(object data) => ApiResult.OkData(data);

        /// <summary>
        /// 返回消息和数据
        /// </summary>
        /// <param name="message"></param>
        /// <param name="data"></param>
        /// <returns></returns>
        public ApiResult ResultWarn(string message, object data) => ApiResult.Ok(message, data);

        #endregion


    }
}
