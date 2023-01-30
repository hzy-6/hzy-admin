using HZY.Managers.Accounts;
using HZY.EntityFramework.PagingViews;
using HZY.EntityFramework.Repositories.Admin.Core;
using HZY.Infrastructure;
using HZY.Infrastructure.MessageQueue.Models;
using HZY.Infrastructure.Permission.Attributes;
using HZY.Models.DTO.Framework;
using HZY.Models.Entities.Framework;
using HZY.Services.Admin.Core;
using HZY.Framework.EntityFrameworkRepositories.Extensions;
using HZY.Framework.AutoRegisterIOC;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Newtonsoft.Json;
using Zyx.MemoryMQ.Interfaces;
using HZY.Framework.Core.Utils;

namespace HZY.Services.Admin.Framework;

/// <summary>
/// 操作日服务
/// </summary>
public class SysOperationLogService : AdminBaseService<IAdminRepository<SysOperationLog>>
{
    private readonly HttpContext _httpContext;
    private readonly IAccountManager _accountService;
    private readonly IAdminRepository<SysUser> _sysUserRepository;
    private readonly IProducer producer;

    public SysOperationLogService(IAdminRepository<SysOperationLog> defaultRepository,
          IHttpContextAccessor iHttpContextAccessor,
          IAccountManager accountService,
          IAdminRepository<SysUser> sysUserRepository,
          IProducer producer
          ) : base(defaultRepository)
    {
        this._httpContext = iHttpContextAccessor.HttpContext;
        _accountService = accountService;
        _sysUserRepository = sysUserRepository;
        this.producer = producer;
    }

    /// <summary>
    /// 写入操作日志
    /// </summary>
    /// <returns></returns>
    public async Task WriteInLogAsync(long time, string bodyString, Endpoint endpoint)
    {
        var queryString = _httpContext.Request.QueryString.ToString();
        var apiUrl = _httpContext.Request.Path;

        //获取请求ip
        var ip = _httpContext.Request.Headers["X-Forwarded-For"].FirstOrDefault();
        if (string.IsNullOrEmpty(ip))
        {
            ip = _httpContext.Connection.RemoteIpAddress.MapToIPv4().ToString();
        }
        //
        var clientInfo = _httpContext.GetBrowserClientInfo();
        var browser = clientInfo?.UA.Family + clientInfo?.UA.Major;
        var os = clientInfo?.OS.Family + clientInfo?.OS.Major;

        //本机不记录
        // if (_IP == "::1") return;

        var formString = string.Empty;

        //form
        try
        {
            if (_httpContext.Request.HasFormContentType)
            {
                //读取 表单 信息
                var form = await _httpContext.Request.ReadFormAsync();
                if (form != null)
                {
                    var _Dictionary = new Dictionary<string, object>();
                    foreach (var key in form.Keys)
                    {
                        _Dictionary[key] = form[key];
                    }

                    formString = JsonConvert.SerializeObject(_Dictionary);
                }

            }
        }
        catch (Exception) { }

        var userInfo = _accountService.GetAccountInfo();
        var sysOperationLog = new SysOperationLog
        {
            Api = apiUrl,
            Ip = ip,
            Form = formString,
            QueryString = queryString,
            FormBody = bodyString,
            UserId = userInfo?.Id,
            TakeUpTime = time,
            Browser = browser,
            OS = os,
        };

        //
        if (endpoint != null)
        {
            var controllerDescriptorAttribute = endpoint.Metadata.GetMetadata<ControllerDescriptorAttribute>();
            var actionDescriptorAttribute = endpoint.Metadata.GetMetadata<ActionDescriptorAttribute>();
            sysOperationLog.ControllerDisplayName = controllerDescriptorAttribute?.DisplayName;
            sysOperationLog.ActionDisplayName = actionDescriptorAttribute?.DisplayName;
        }

        // 发布消息
        await producer.PublishAsync("WriteInLog", sysOperationLog);
    }

    /// <summary>
    /// 获取列表数据
    /// </summary>
    /// <param name="pagingSearchInput"></param>
    /// <returns></returns>
    public async Task<PagingView> FindListAsync(PagingSearchInput<SysOperationLogSearchDto> pagingSearchInput)
    {
        var query = (from log in _defaultRepository.Select.OrderByDescending(w => w.CreationTime)
                     from use in _sysUserRepository.Select.Where(w => w.Id == log.UserId).DefaultIfEmpty()
                     select new { log, use })
                     .WhereIf(!string.IsNullOrWhiteSpace(pagingSearchInput.Search.Api), w => w.log.Api.Contains(pagingSearchInput.Search.Api))
                     .WhereIf(!string.IsNullOrWhiteSpace(pagingSearchInput.Search.Browser), w => w.log.Browser.Contains(pagingSearchInput.Search.Browser))
                     .WhereIf(!string.IsNullOrWhiteSpace(pagingSearchInput.Search.Ip), w => w.log.Ip.Contains(pagingSearchInput.Search.Ip))
                     .WhereIf(!string.IsNullOrWhiteSpace(pagingSearchInput.Search.OS), w => w.log.OS.Contains(pagingSearchInput.Search.OS))
                     .WhereIf(pagingSearchInput.Search.StartTime != null, w => w.log.CreationTime.Date >= pagingSearchInput.Search.StartTime.Value)
                     .WhereIf(pagingSearchInput.Search.EndTime != null, w => w.log.CreationTime.Date <= pagingSearchInput.Search.EndTime.Value)
                     .Select(w => new
                     {
                         w.log.Id,
                         w.log.Api,
                         w.log.Browser,
                         w.log.Ip,
                         w.log.OS,
                         w.log.TakeUpTime,
                         UserName = w.use.Name,
                         w.use.LoginName,
                         w.log.ControllerDisplayName,
                         w.log.ActionDisplayName,
                         CreationTime = w.log.CreationTime.ToString("yyyy-MM-dd HH:mm:ss")
                     })
                     ;

        return await this._defaultRepository.AsPagingViewAsync(query, pagingSearchInput);
    }

    /// <summary>
    /// 删除所有数据
    /// </summary>
    /// <returns></returns>
    public async Task<bool> DeletedAllData()
    {
        return await _defaultRepository.DeleteAsync(w => 1 == 1) >= 0;
    }

    /// <summary>
    /// 查询表单数据
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public async Task<Dictionary<string, object>> FindFormAsync(Guid id)
    {
        var res = new Dictionary<string, object>();
        var form = await this._defaultRepository.FindByIdAsync(id);
        form = form.NullSafe();
        var use = await _sysUserRepository.FindByIdAsync(form.UserId);
        use = use.NullSafe();
        res[nameof(id)] = id == Guid.Empty ? "" : id;
        res[nameof(form)] = form;
        res[nameof(use)] = use;
        return res;
    }
}