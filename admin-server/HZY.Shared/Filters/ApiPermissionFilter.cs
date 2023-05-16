namespace HZY.Shared.Filters;

/// <summary>
/// 系统权限 拦截
/// </summary>
public class ApiPermissionFilter : IActionFilter
{
    private readonly PermissionService _permissionService;
    private readonly IConfiguration _configuration;

    public ApiPermissionFilter(PermissionService permissionService, IConfiguration configuration)
    {
        _permissionService = permissionService;
        _configuration = configuration;
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

        var isInterceptEdit = _configuration.GetSection("IsInterceptEdit")?.Get<bool>();

        //拦截操作数据库的 接口
        if (isInterceptEdit ?? false)
        {
            var actionList = new[] {
                "SaveForm",
                "DeleteList",
                "ChangePassword",
                "Change",
                "Delete",
                "Insert",
                "Create",
                "Update",
                "Remove",
                "AutoImprotProject"
            };

            if (actionList.Any(w => actionName.ToLower().Contains(w.ToLower())))
            {
                var data = ApiResult.ResultMessage(ApiResultCodeEnum.Warn, "请下载源代码本地运行!");
                context.Result = new JsonResult(data);
            }
        }
        #endregion

        #region 如果有取消授权标记 则 权限检查失效

        //如果有 AllowAnonymousAttribute 标记则忽略授权检查
        var allowAnonymousAttribute = context.ActionDescriptor.EndpointMetadata.Any(w => w is AllowAnonymousAttribute);
        if (allowAnonymousAttribute) return;

        #endregion

        #region 检查控制器 是否有控制器描述标记 [ControllerDescriptorAttribute]

        var controllerDescriptorAttribute = PermissionUtil.GetControllerDescriptorAttributeByType(context.Controller.GetType());
        if (controllerDescriptorAttribute == null) return;
        if (string.IsNullOrWhiteSpace(controllerDescriptorAttribute.MenuId)) return;
        var menuId = controllerDescriptorAttribute.MenuId.ToInt32();
        if (menuId == 0) return;

        //获取 action 上面的权限编码
        var actionDescriptorAttribute = PermissionUtil.GetActionDescriptorAttribute(context.ActionDescriptor);
        if (actionDescriptorAttribute == null) return;

        #region 检查页面权限信息 验证当前用户是否有权限访问该接口
        var functionName = actionDescriptorAttribute.GetFunctionName();
        if (string.IsNullOrWhiteSpace(functionName)) return;
        //收集用户权限 未授权让他重新登录
        var power = _permissionService.GetPowerStateByMenuIdAsync(menuId).Result;

        if (power == null)
        {
            var data = ApiResult.ResultMessage(ApiResultCodeEnum.Error, "检测不到任何权限信息!");
            context.Result = new JsonResult(data);
            return;
        }

        //检查当前用户对当前权限码是否有权限
        if (power.ContainsKey(functionName) && !(bool)power[functionName])
        {
            var data = ApiResult.ResultMessage(ApiResultCodeEnum.UnAuth, unAuthMessage);
            context.Result = new JsonResult(data);
        }
        #endregion

        #endregion
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="context"></param>
    public void OnActionExecuted(ActionExecutedContext context)
    {

    }
}