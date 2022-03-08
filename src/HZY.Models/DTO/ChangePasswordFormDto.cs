namespace HZY.Models.DTO;

public class ChangePasswordFormDto
{
    /// <summary>
    /// 旧密码
    /// </summary>
    public string OldPassword { get; set; }

    /// <summary>
    /// 新密码
    /// </summary>
    public string NewPassword { get; set; }

    /// <summary>
    /// 确认密码
    /// </summary>
    /// <value></value>
    public string QrPassword { get; set; }
}