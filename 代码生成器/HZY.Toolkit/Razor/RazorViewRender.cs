/*
 * *******************************************************
 *
 * 作者：hzy
 *
 * 开源地址：https://gitee.com/hzy6
 *
 * *******************************************************
 */
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Threading.Tasks;
using HZY.Toolkit.Attributes;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Abstractions;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.AspNetCore.Mvc.Razor;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Mvc.ViewFeatures;
using Microsoft.AspNetCore.Routing;

namespace HZY.Toolkit.Razor
{
    /// <summary>
    /// razor cshtml 模板渲染
    /// </summary>
    [AppService]
    public class RazorViewRender : IRazorViewRender
    {
        private readonly IRazorViewEngine _razorViewEngine;
        private readonly ITempDataProvider _tempDataProvider;
        private readonly IServiceProvider _serviceProvider;

        public RazorViewRender(IRazorViewEngine razorViewEngine, ITempDataProvider tempDataProvider,
            IServiceProvider serviceProvider)
        {
            _razorViewEngine = razorViewEngine;
            _tempDataProvider = tempDataProvider;
            _serviceProvider = serviceProvider;
        }

        public Task<StringBuilder> RenderAsync(string viewName, object model)
        {
            return this.RenderAsync(viewName, model, null);
        }

        public Task<StringBuilder> RenderByDictionaryAsync(string viewName, Dictionary<string, object> viewData)
        {
            return this.RenderAsync(viewName, null, viewData);
        }

        public async Task<StringBuilder> RenderAsync(string viewName, object model, Dictionary<string, object> viewData)
        {
            var httpContext = new DefaultHttpContext
            {
                RequestServices = _serviceProvider
            };
            var actionContext = new ActionContext(httpContext, new RouteData(), new ActionDescriptor());

            await using var stringWriter = new StringWriter();

            var viewResult = _razorViewEngine.GetView(null, viewName, false);

            if (!viewResult.Success)
            {
                throw new ArgumentNullException($"{viewName} 找不到Razor模板!");
            }

            var emptyModelMetadataProvider = new EmptyModelMetadataProvider();
            var modelStateDictionary = new ModelStateDictionary();

            var viewDictionary = new ViewDataDictionary(emptyModelMetadataProvider, modelStateDictionary)
                {Model = model};

            //添加额外参数(ViewDate)
            if (viewData != null)
            {
                foreach (var item in viewData.Keys)
                {
                    viewDictionary.Add(item, viewData[item]);
                }
            }

            var tempDataDictionary = new TempDataDictionary(actionContext.HttpContext, _tempDataProvider);

            var viewContext = new ViewContext(actionContext,
                viewResult.View,
                viewDictionary,
                tempDataDictionary,
                stringWriter,
                new HtmlHelperOptions());

            await viewResult.View.RenderAsync(viewContext);

            return stringWriter.GetStringBuilder();
        }
    }
}