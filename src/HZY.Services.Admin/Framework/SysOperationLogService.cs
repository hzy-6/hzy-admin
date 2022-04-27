﻿using HZY.Domain.Services.Accounts;
using HZY.EFCore.Models;
using HZY.EFCore.Repositories.Base;
using HZY.Infrastructure;
using HZY.Infrastructure.ApiResultManage;
using HZY.Infrastructure.MessageQueue;
using HZY.Models.DTO;
using HZY.Models.Entities;
using HZY.Models.Entities.Framework;
using HZY.Services.Admin.BaseServicesAdmin;
using HzyEFCoreRepositories.Extensions;
using HzyScanDiService.Extensions;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using Microsoft.Extensions.DependencyInjection;
using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Services.Admin.Framework;

/// <summary>
/// 操作日服务
/// </summary>
public class SysOperationLogService : AdminBaseService<IRepository<SysOperationLog>>
{
    private readonly HttpContext _httpContext;
    private readonly IAccountDomainService _accountService;
    private readonly IMessageQueueProvider _messageQueueProvider;
    private readonly IRepository<SysUser> _sysUserRepository;

    public SysOperationLogService(IRepository<SysOperationLog> defaultRepository,
        IHttpContextAccessor iHttpContextAccessor,
        IAccountDomainService accountService,
        IMessageQueueProvider messageQueueProvider,
        IRepository<SysUser> sysUserRepository
        ) : base(defaultRepository)
    {
        this._httpContext = iHttpContextAccessor.HttpContext;
        _accountService = accountService;
        this._messageQueueProvider = messageQueueProvider;
        _sysUserRepository = sysUserRepository;
    }

    /// <summary>
    /// 写入操作日志
    /// </summary>
    /// <returns></returns>
    public async Task WriteInLogAsync(long time, string bodyString)
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
        //try
        //{
        //    //读取 表单 信息
        //    var form = await _httpContext.Request.ReadFormAsync();
        //    if (form != null)
        //    {
        //        var _Dictionary = new Dictionary<string, object>();
        //        foreach (var key in form.Keys)
        //        {
        //            _Dictionary[key] = form[key];
        //        }

        //        formString = JsonConvert.SerializeObject(_Dictionary);
        //    }
        //}
        //catch (Exception) { }

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

        await _messageQueueProvider.SendMessageQueueAsync("WriteInLogAsync", sysOperationLog, (value, serviceProvider) =>
        {
            using var scope = ServiceProviderExtensions.CreateScope();
            var repository = scope.ServiceProvider.GetRequiredService<IRepository<SysOperationLog>>();
            repository.InsertAsync((SysOperationLog)value).Wait();
        });
    }

    /// <summary>
    /// 获取列表数据
    /// </summary>
    /// <param name="page">page</param>
    /// <param name="size">size</param>
    /// <param name="search">search</param>
    /// <returns></returns>
    public async Task<PagingViewModel> FindListAsync(int page, int size, SysOperationLog search)
    {
        var query = (from log in _defaultRepository.Select.OrderByDescending(w => w.CreationTime)
                     from use in _sysUserRepository.Select.Where(w => w.Id == log.UserId).DefaultIfEmpty()
                     select new
                     {
                         log.Id,
                         log.Api,
                         log.Browser,
                         log.Ip,
                         log.OS,
                         log.TakeUpTime,
                         UserName = use.Name,
                         use.LoginName,
                         CreationTime = log.CreationTime.ToString("yyyy-MM-dd hh:mm:ss")
                     })
                     .WhereIf(!string.IsNullOrWhiteSpace(search.Api), w => w.Api.Contains(search.Api))
                     .WhereIf(!string.IsNullOrWhiteSpace(search.Browser), w => w.Browser.Contains(search.Browser))
                     .WhereIf(!string.IsNullOrWhiteSpace(search.Ip), w => w.Ip.Contains(search.Ip))
                     .WhereIf(!string.IsNullOrWhiteSpace(search.OS), w => w.OS.Contains(search.OS))
                     ;

        return await this._defaultRepository.AsPagingViewModelAsync(query, page, size);
    }

    /// <summary>
    /// 删除所有数据
    /// </summary>
    /// <returns></returns>
    public async Task<bool> DeletedAllData()
    {
        int i = await _defaultRepository.DeleteAsync(w => 1 == 1);
        if (i >= 0)
        {
            return await Task.FromResult(true);
        }
        return await Task.FromResult(false);
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