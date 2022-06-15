using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Controllers;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Server.Kestrel.Core.Internal.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;

namespace HZY.WebHost.Configure
{
    public class CustomPolicyRequirement : IAuthorizationRequirement
    {
        /// <summary>
        /// 权限认证键
        /// </summary>
        public string AuthKey { get; }
        public CustomPolicyRequirement(string authKey)
        {
            AuthKey = authKey;
        }
    }

    public class CustomAuthorizationHandler : AuthorizationHandler<CustomPolicyRequirement>
    {
        protected override Task HandleRequirementAsync(AuthorizationHandlerContext context, CustomPolicyRequirement requirement)
        {
            //获取当前http请求的context对象
            var authContext = context.Resource as AuthorizationFilterContext;
            if (authContext != null)
            {
                if (!authContext.HttpContext.Request.Headers.ContainsKey(requirement.AuthKey))
                {
                    context.Fail();
                }
                else
                {
                    context.Succeed(requirement); //通过验证，这句代码必须要有
                }
            }
            else
            {
                context.Succeed(requirement);
            }

            return Task.CompletedTask;
        }
    }
}
