﻿using System;
using HZY.Infrastructure;
using HZY.Infrastructure.ScanDIService.Attributes;
using HZY.Infrastructure.ScanDIService.Enums;
using Microsoft.Extensions.Configuration;

namespace HZY.Infrastructure;

/// <summary>
/// 程序配置信息映射类 appsettings.json
/// </summary>
[DIService(DIType.Singleton)]
public class AppConfiguration
{
    private readonly IConfiguration _configuration;

    public AppConfiguration(IConfiguration configuration)
    {
        this._configuration = configuration;
        //AppConfig 
        this.Mapping(nameof(AppConfiguration));
    }

    /// <summary>
    /// 映射数据 到 属性
    /// </summary>
    /// <param name="key"></param>
    private void Mapping(string key)
    {
        var properties = this.GetType().GetProperties();
        foreach (var item in properties)
        {
            var value = _configuration[$"{key}:{item.Name}"];

            if (item.PropertyType == typeof(Guid))
            {
                item.SetValue(this, value.ToGuid());
            }
            else if (item.PropertyType == typeof(int))
            {
                item.SetValue(this, value.ToInt32());
            }
            else
            {
                item.SetValue(this, value);
            }
        }
    }

    /// <summary>
    /// 默认数据库类型
    /// </summary>
    /// <value></value>
    public string DefaultDatabaseType { get; set; }
    /// <summary>
    /// sqlserver
    /// </summary>
    /// <value></value>
    public string DefaultConnectionString_SqlServer { get; set; }
    /// <summary>
    /// mysql
    /// </summary>
    /// <value></value>
    public string DefaultConnectionString_MySql { get; set; }
    /// <summary>
    /// pgsql
    /// </summary>
    /// <value></value>
    public string DefaultConnectionString_PgSql { get; set; }
    /// <summary>
    /// redis 地址
    /// </summary>
    /// <value></value>
    public string ConnectionStringRedis { get; set; }
    /// <summary>
    /// 程序标题
    /// </summary>
    /// <value></value>
    public string AppTitle { get; set; }
    public string JwtValidAudience { get; set; }
    public string JwtValidIssuer { get; set; }
    public string JwtIssuerSigningKey { get; set; }
    /// <summary>
    /// token 键名
    /// </summary>
    /// <value></value>
    public string AuthorizationKeyName { get; set; }
    /// <summary>
    /// 超级管理员角色id
    /// </summary>
    /// <value></value>
    public Guid AdminRoleId { get; set; }
    /// <summary>
    /// 系统菜单id
    /// </summary>
    /// <value></value>
    public int SysMenuId { get; set; }
    /// <summary>
    /// 命名空间
    /// </summary>
    public string Namespace { get; set; }
}