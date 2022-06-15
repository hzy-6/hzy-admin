using HZY.Infrastructure;
using HZY.Infrastructure.Filters;
using HZY.Models.DTO;
using HZY.Models.DTO.Framework;
using HZY.Services.Admin.Framework;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HZY.WebHost.Controllers.Public;

/// <summary>
/// 公共接口控制器
/// </summary>
[ApiResultFilter]
[Route("api/[controller]")]
[ApiExplorerSettings(GroupName = nameof(ApiVersions.Public))]
public class PublicController : ControllerBase
{
    private readonly SysDictionaryService _sysDictionaryService;

    public PublicController(SysDictionaryService sysDictionaryService)
    {
        _sysDictionaryService = sysDictionaryService;
    }

    /// <summary>
    /// 根据编码获取 字典集合
    /// </summary>
    /// <param name="code"></param>
    /// <returns></returns>
    [HttpGet("GetDictionary/{code}")]
    public Task<List<SysDictionaryDto>> GetDictionaryByCodeAsync([FromRoute] string code)
    {
        return this._sysDictionaryService.GetDictionaryByCodeAsync(code);
    }



}