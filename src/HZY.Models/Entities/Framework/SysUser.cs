using System;
using System.ComponentModel.DataAnnotations;
using HZY.Models.Entities.BaseEntitys;

namespace HZY.Models.Entities.Framework;

/// <summary>
/// 系统账号
/// </summary>
public class SysUser : DefaultBaseEntity<Guid>
{
    /// <summary>
    /// 账户名称
    /// </summary>
    [Required(ErrorMessage = "用户名称不能为空!")]
    public string Name { get; set; }

    /// <summary>
    /// 登录账号
    /// </summary>
    [Required(ErrorMessage = "登录名称不能为空!")]
    public string LoginName { get; set; }

    /// <summary>
    /// 密码
    /// </summary>
    public string Password { get; set; }

    /// <summary>
    /// 联系电话
    /// </summary>
    public string Phone { get; set; }

    /// <summary>
    /// 账户邮件地址
    /// </summary>
    [Required(ErrorMessage = "邮件不能为空!"), EmailAddress(ErrorMessage = "邮件格式不正确!")]
    public string Email { get; set; }

    /// <summary>
    /// 删除锁 ，如果是 true 则不能删除
    /// </summary>
    public bool DeleteLock { get; set; } = false;

    /// <summary>
    /// 组织Id
    /// </summary>
    public int? OrganizationId { get; set; }
}
