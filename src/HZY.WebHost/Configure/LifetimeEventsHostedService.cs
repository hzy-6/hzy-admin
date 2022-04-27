using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using System.Threading;
using System.Threading.Tasks;

namespace HZY.WebHost.Configure;

/// <summary>
/// 生命周期监听
/// </summary>
public class LifetimeEventsHostedService : IHostedService
{
    private readonly ILogger _logger;
    private readonly IHostApplicationLifetime _appLifetime;

    public LifetimeEventsHostedService(
        ILogger<LifetimeEventsHostedService> logger,
        IHostApplicationLifetime appLifetime)
    {
        _logger = logger;
        _appLifetime = appLifetime;
    }

    public Task StartAsync(CancellationToken cancellationToken)
    {
        _appLifetime.ApplicationStarted.Register(OnStarted);
        _appLifetime.ApplicationStopping.Register(OnStopping);
        _appLifetime.ApplicationStopped.Register(OnStopped);

        return Task.CompletedTask;
    }

    public Task StopAsync(CancellationToken cancellationToken)
    {
        return Task.CompletedTask;
    }

    private void OnStarted()
    {
        _logger.LogInformation("应用启动.");

        // Perform post-startup activities here
    }

    private void OnStopping()
    {
        _logger.LogInformation("应用停止中.");

        // Perform on-stopping activities here
    }

    private void OnStopped()
    {
        _logger.LogInformation("应用已停止.");

        // Perform post-stopped activities here
    }

}

