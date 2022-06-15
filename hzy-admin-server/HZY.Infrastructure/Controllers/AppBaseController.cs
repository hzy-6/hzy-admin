using HZY.Infrastructure;
using HZY.Infrastructure.Controllers;
using Microsoft.AspNetCore.Mvc;

namespace HZY.Infrastructure.Controllers;

[ApiExplorerSettings(GroupName = nameof(ApiVersions.App))]
[Route("api/app/[controller]")]
public class AppBaseController<TDefaultService> : ApiBaseController<TDefaultService> where TDefaultService : class
{
    public AppBaseController(TDefaultService defaultService) : base(defaultService)
    {

    }
}

[ApiExplorerSettings(GroupName = nameof(ApiVersions.App))]
[Route("api/app/[controller]")]
public class AppBaseController : ApiBaseController
{

}