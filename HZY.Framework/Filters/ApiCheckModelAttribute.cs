using HZY.Framework.ApiResultManage;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System.Collections.Generic;
using System.Linq;

namespace HZY.Framework.Filters
{
    /// <summary>
    /// 对接口模型验证
    /// </summary>
    public class ApiCheckModelAttribute : ActionFilterAttribute
    {
        /// <summary>
        /// 每次请求Action之前发生，，在行为方法执行前执行
        /// </summary>
        /// <param name="context"></param>
        public override void OnActionExecuting(ActionExecutingContext context)
        {
            base.OnActionExecuting(context);

            if (context.ModelState.IsValid) return;
            var messages = new List<string>();
            var keys = context.ModelState.Keys;
            var values = context.ModelState.Values;
            foreach (var item in keys)
            {
                var value = context.ModelState.FirstOrDefault(w => w.Key == item).Value;
                foreach (var err in value.Errors)
                {
                    messages.Add($"{err.ErrorMessage}");
                }
            }

            var apiResult = ApiResult.Warn(string.Join("<br /><br />", messages), null);
            context.Result = new JsonResult(apiResult);
        }
    }
}
