using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using HZY.Admin.Services.Framework;
using HZY.Repository.Domain.Framework;
using HZY.Common;
using Microsoft.AspNetCore.Mvc;
using HZY.Framework.Permission.Attributes;
using Microsoft.AspNetCore.Mvc.Filters;
using System.Reflection;
using System.Linq;
using HZY.Framework.ApiResultManage;
using HZY.Admin.Services;
using Newtonsoft.Json;

namespace HZY.Admin.Filters
{
    /// <summary>
    /// 后台 权限 管理 控制
    /// </summary>
    public class AdminAuthorizationActionFilter : IActionFilter
    {
        private readonly SysMenuService _sysMenuService;
        private readonly AccountService _accountService;

        public AdminAuthorizationActionFilter(SysMenuService sysMenuService, AccountService accountService)
        {
            _sysMenuService = sysMenuService;
            _accountService = accountService;
        }

        /// <summary>
        /// Action 执行前
        /// </summary>
        /// <param name="context"></param>
        public virtual void OnActionExecuting(ActionExecutingContext context)
        {
            var httpContext = context.HttpContext;
            var routeValues = context.ActionDescriptor.RouteValues;
            //var areaName = routeValues["area"];
            var controllerName = routeValues["controller"];
            var actionName = routeValues["action"];


            #region 拦截操作数据库的 接口 方便发布线上演示

            //拦截操作数据库的 接口

            //var actionList = new[] { "SaveForm", "DeleteList" };
            //if (actionList.Any(w => w.ToLower() == actionName.ToLower()))
            //{
            //    MessageBox.Show("请下载源代码本地运行!");
            //}

            #endregion

            if (!(context.Controller is Controller))
            {
                return;
            }

            var controller = (Controller)context.Controller;

            //获取 class 上面所有的 自定义 特性
            var customAttributes = controller.GetType().GetCustomAttributes();
            //处理 控制器 class 上面 带有 ControllerDescriptorAttribute 标记
            var adminApiDescribeAttribute = (ControllerDescriptorAttribute)customAttributes
                .FirstOrDefault(w => w is ControllerDescriptorAttribute);

            if (adminApiDescribeAttribute == null) return;

            const string unAuthMessage = "未授权,请先登录授权!";

            #region 检查是否登录 授权

            if (this._accountService.GetAccountInfo() == null)
            {
                if (httpContext.IsJsonRequest())
                {
                    var data = ApiResult.ResultMessage(ApiResultCodeEnum.UnAuth, unAuthMessage);
                    context.Result = new JsonResult(data);
                }
                else
                {
                    var alert = $@"<script type='text/javascript'>
                                        alert('{unAuthMessage}');
                                        top.window.location='Admin/Login/Index';
                                    </script>";
                    context.Result = new ContentResult
                    {
                        Content = alert,
                        ContentType = "text/html;charset=utf-8;"
                    };
                }

                return;
            }

            #endregion

            var menuId = adminApiDescribeAttribute.GetMenuId().ToGuid();
            var actionDescriptorAttribute = (ActionDescriptorAttribute)context.ActionDescriptor.EndpointMetadata
                .FirstOrDefault(w => w is ActionDescriptorAttribute);

            #region 检查页面权限信息

            if (httpContext.IsHtmlRequest())
            {
                //判断是否 查找带回
                var isFindBack = httpContext.Request.Query.ContainsKey("findBack");
                var findBack = httpContext.Request.Query["findBack"];
                Dictionary<string, bool> power;
                if (menuId == Guid.Empty)
                {
                    power = this._sysMenuService.GetFindBackPower(findBack, false).Result;
                }
                else
                {
                    if (isFindBack)
                    {
                        //收集用户权限
                        power = this._sysMenuService.GetFindBackPower(findBack).Result;
                    }
                    else
                    {
                        //收集用户权限
                        power = this._sysMenuService.GetPowerStateByMenuId(menuId).Result;

                        if (!power[AppConst.Function_Have].ToBool())
                        {
                            context.Result = new ContentResult()
                            {
                                Content = "您无权访问!",
                                ContentType = "text/html;charset=utf-8;"
                            };
                            return;
                        }
                    }
                }

                controller.ViewData["power"] = JsonConvert.SerializeObject(power);
                controller.ViewData["isFindBack"] = isFindBack ? 1 : 0;
            }
            else
            {
                if (actionDescriptorAttribute != null && menuId != Guid.Empty)
                {
                    var functionName = actionDescriptorAttribute.GetFunctionName();
                    //收集用户权限 未授权让他重新登录
                    var power = this._sysMenuService.GetPowerStateByMenuId(menuId).Result;
                    if (power.ContainsKey(functionName) && !power[functionName])
                    {
                        var data = ApiResult.ResultMessage(ApiResultCodeEnum.UnAuth, unAuthMessage);
                        context.Result = new JsonResult(data);
                    }
                }
            }

            #endregion

            //LogUtil.Write("OnActionExecuting");
        }

        /// <summary>
        /// Action 执行后
        /// </summary>
        /// <param name="context"></param>
        public virtual void OnActionExecuted(ActionExecutedContext context)
        {
            // LogUtil.Write("OnActionExecuted");
        }
    }
}