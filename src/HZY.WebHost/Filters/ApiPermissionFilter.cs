using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HZY.Infrastructure;
using HZY.Infrastructure.ApiResultManage;
using HZY.Infrastructure.Permission;
using HZY.Infrastructure.Permission.Attributes;
using HZY.Services.Admin.Framework;
using HzyScanDiService.Extensions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

namespace HZY.WebHost.Filters
{
    /// <summary>
    /// 权限 拦截
    /// </summary>
    public class ApiPermissionFilter : IActionFilter
    {
        private readonly SysMenuService _sysMenuService;

        public ApiPermissionFilter(SysMenuService sysMenuService)
        {
            _sysMenuService = sysMenuService;
        }

        /// <summary>
        /// action 执行之前
        /// </summary>
        /// <param name="context"></param>
        public void OnActionExecuting(ActionExecutingContext context)
        {
            var httpContext = context.HttpContext;
            const string unAuthMessage = "未授权,请先登录授权!";
            var routeValues = context.ActionDescriptor.RouteValues;
            //var areaName = routeValues["area"];
            var controllerName = routeValues["controller"];
            var actionName = routeValues["action"];

            #region 拦截操作数据库的 接口 方便发布线上演示
            var appConfiguration = httpContext.RequestServices.GetRequiredService<AppConfiguration>();

            //拦截操作数据库的 接口
            if (appConfiguration.IsInterceptEdit)
            {
                var actionList = new[] { "SaveForm", "DeleteList", "ChangePassword" };
                if (actionList.Any(w => w.ToLower() == actionName.ToLower()))
                {
                    var data = ApiResult.ResultMessage(ApiResultCodeEnum.Warn, "请下载源代码本地运行!");
                    context.Result = new JsonResult(data);
                }
            }
            #endregion

            #region 检查控制器 是否有控制器描述标记 [ControllerDescriptorAttribute]

            if (context.Controller is not IApiPermissionController)
            {
                return;
            }

            var apiPermissionController = (IApiPermissionController)context.Controller;
            if (apiPermissionController == null) return;
            var menuId = apiPermissionController.GetCurrentMenuId().ToInt32();
            if (menuId == 0) return;

            //获取 action 上面的权限编码
            var actionDescriptorAttribute = (ActionDescriptorAttribute)context.ActionDescriptor.EndpointMetadata
                .FirstOrDefault(w => w is ActionDescriptorAttribute);
            if (actionDescriptorAttribute == null) return;

            #region 检查页面权限信息 验证当前用户是否有权限访问该接口
            var functionName = actionDescriptorAttribute.GetFunctionName();
            //收集用户权限 未授权让他重新登录
            var power = this._sysMenuService.GetPowerStateByMenuIdAsync(menuId).Result;
            //检查当前用户对当前权限码是否有权限
            if (power.ContainsKey(functionName) && !(bool)power[functionName])
            {
                var data = ApiResult.ResultMessage(ApiResultCodeEnum.UnAuth, unAuthMessage);
                context.Result = new JsonResult(data);
            }
            #endregion

            #endregion
        }

        public void OnActionExecuted(ActionExecutedContext context)
        {

        }
    }
}