namespace HZY.Core.EntityFramework.Interceptors;

/// <summary>
/// 审计 保存拦截器
/// </summary>
public class AuditInterceptor : AbstractAuditInterceptor
{
    protected override void SavingChanges(DbContextEventData eventData)
    {
        base.SavingChanges(eventData);
    }

    /// <summary>
    /// 获取当前用户 id
    /// </summary>
    /// <returns></returns>
    protected override string? GetCurrentUserId()
    {
        try
        {
            using var scope = App.CreateScope();
            var tokenService = scope?.ServiceProvider.GetService<JwtTokenService>(); //

            var id = tokenService?.GetAccountIdByToken();

            return id == Guid.Empty || id == null ? null : id.ToString();
        }
        catch (Exception)
        {
            // ignored

            return null;
        }
    }

    /// <summary>
    /// 获取雪花id
    /// </summary>
    /// <returns></returns>
    protected override long GetSnowflakeId()
    {
        return Tools.GetNewId();
    }
}