/*
 * *******************************************************
 *
 * 作者：hzy
 *
 * 开源地址：https://gitee.com/hzy6
 *
 * *******************************************************
 */
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Toolkit.Razor
{
    public interface IRazorViewRender
    {
        /// <summary>
        /// 渲染 razor cshtml
        /// </summary>
        /// <param name="viewName">例如： /wwwroot/Root/Service.cshtml</param>
        /// <param name="model"></param>
        /// <returns></returns>
        Task<StringBuilder> RenderAsync(string viewName, object model);

        /// <summary>
        /// 渲染 razor cshtml
        /// </summary>
        /// <param name="viewName">例如： /wwwroot/Root/Service.cshtml</param>
        /// <param name="viewData"></param>
        /// <returns></returns>
        Task<StringBuilder> RenderByDictionaryAsync(string viewName, Dictionary<string, object> viewData);

        /// <summary>
        /// 渲染 razor cshtml
        /// </summary>
        /// <param name="viewName">例如： /wwwroot/Root/Service.cshtml</param>
        /// <param name="model"></param>
        /// <param name="viewData"></param>
        /// <returns></returns>
        Task<StringBuilder> RenderAsync(string viewName, object model, Dictionary<string, object> viewData);
    }
}