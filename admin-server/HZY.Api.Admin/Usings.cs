﻿global using Flurl.Http;
global using FreeSql;
global using FreeSql.DatabaseModel;
global using HZY.Api.Admin;
global using HZY.Api.Admin.ApplicationServices.Bases;
global using HZY.Api.Admin.ApplicationServices.Core.Quartz;
global using HZY.Api.Admin.ApplicationServices.Core.Quartz.Jobs;
global using HZY.Api.Admin.ApplicationServices.Core.SignalRs;
global using HZY.Api.Admin.ApplicationServices.Core.SignalRs.Hubs;
global using HZY.Api.Admin.ApplicationServices.DevelopmentTools.LowCode;
global using HZY.Api.Admin.ApplicationServices.DevelopmentTools.MonitorEFCore;
global using HZY.Api.Admin.ApplicationServices.Systems;
global using HZY.Api.Admin.Models.Configs;
global using HZY.Api.Admin.Models.Dtos.DevelopmentTool;
global using HZY.Api.Admin.Models.Dtos.Systems;
global using HZY.Api.Admin.Repository;
global using HZY.Api.Admin.Repository.Configs;
global using HZY.Core;
global using HZY.Core.ApiResultManage;
global using HZY.Core.EntityFramework.Aop;
global using HZY.Core.Enums;
global using HZY.Core.Files;
global using HZY.Core.Filters;
global using HZY.Core.Identity;
global using HZY.Core.Identity.Services;
global using HZY.Core.Logs;
global using HZY.Core.Mappers;
global using HZY.Core.Permission;
global using HZY.Core.Permission.Attributes;
global using HZY.Core.Quartz;
global using HZY.Core.Quartz.Services;
global using HZY.Core.Razor;
global using HZY.Core.Razor.Services;
global using HZY.Core.Redis;
global using HZY.Core.Swagger;
global using HZY.Core.Zips;
global using HZY.Framework.Core;
global using HZY.Framework.Core.AspNetCore;
global using HZY.Framework.Core.Quartz;
global using HZY.Framework.Core.Utils;
global using HZY.Framework.DependencyInjection;
global using HZY.Framework.DependencyInjection.Attributes;
global using HZY.Framework.DynamicApiController;
global using HZY.Framework.Repository.EntityFramework;
global using HZY.Framework.Repository.EntityFramework.Extensions;
global using HZY.Framework.Repository.EntityFramework.Monitor;
global using HZY.Framework.Repository.EntityFramework.Monitor.Models;
global using HZY.Repository.Admin;
global using HZY.Repository.Admin.Entities.Base;
global using HZY.Repository.Admin.Entities.LowCode;
global using HZY.Repository.Admin.Entities.Quartz;
global using HZY.Repository.Admin.Entities.Systems;
global using HZY.Repository.Admin.Models;
global using HZY.Repository.Admin.Models.Dtos.Systems;
global using HZY.Shared;
global using HZY.Shared.ApplicationServices;
global using HZY.Shared.ApplicationServices.Systems;
global using HZY.Shared.Extensions;
global using HZY.Shared.Filters;
global using HZY.Shared.Models.Consts;
global using HZY.Shared.Models.LowCodes;
global using HZY.Shared.Models.PagingViews;
global using HZY.Shared.Upload;
global using HZY.Shared.Upload.VO;
global using HZY.Shared.Utils;
//global using IGeekFan.AspNetCore.Knife4jUI;
global using Microsoft.AspNetCore.Authentication.JwtBearer;
global using Microsoft.AspNetCore.Authorization;
global using Microsoft.AspNetCore.Mvc;
global using Microsoft.AspNetCore.SignalR;
global using Microsoft.EntityFrameworkCore;
global using Microsoft.Extensions.Caching.Memory;
global using Newtonsoft.Json;
global using NPOI.XSSF.UserModel;
global using Quartz;
global using Quartz.Impl.Triggers;
global using Quartz.Spi;
global using Serilog;
global using System.ComponentModel;
global using System.Diagnostics;
global using System.Reflection;
global using System.Text;
global using System.Text.Encodings.Web;
global using System.Text.Unicode;
