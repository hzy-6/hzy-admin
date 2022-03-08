namespace HZY.Models.DTO;

public class AuthUserFormDto
{
    /// <summary>
    /// 用户名称
    /// </summary>
    public string UserName { get; set; }

    /// <summary>
    /// 用户密码
    /// </summary>
    public string UserPassword { get; set; }

    /// <summary>
    /// 验证码(不填)
    /// </summary>
    public string LoginCode { get; set; }
}
