using HZY.Framework.Repository.EntityFramework;
using HZY.Repository.Admin.Entities.Systems;
using Microsoft.AspNetCore.Components.WebView.WindowsForms;
using Microsoft.Extensions.Logging;

namespace HZY.WinFormDemo;

public partial class Form1 : Form
{
    private readonly ILogger<Form1> _logger;
    private IRepository<SysUser> _sysUserRepository;

    public Form1(ILogger<Form1> logger, IRepository<SysUser> sysUserRepository)
    {
        InitializeComponent();
        _logger = logger;
        _sysUserRepository = sysUserRepository;
    }

    private void Form1_Load(object sender, EventArgs e)
    {


        // 加入启动 blazor
        blazorWebView1.HostPage = "wwwroot\\index.html";
        blazorWebView1.Services = HZY.Framework.Core.App.WebApplication?.Services!;
        blazorWebView1.RootComponents.Add<HZY.WinFormDemo.App>("#app");

        // 打开窗口2
        var form2 = HZY.Framework.Core.App.WebApplication?.Services?.GetService<Form2>();
        form2?.Show();


    }
}
