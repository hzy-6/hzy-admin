namespace HZY.Admin.Blazor.Client.Layout;

public partial class MainLayout
{
    [Inject] public HttpClient? HttpClient { get; set; }

    protected override async Task OnInitializedAsync()
    {
        await base.OnInitializedAsync();

        // 加载用户信息
        var urlPrefix = "/api/v1/admin/SysUser";


        var result = await HttpClient!.GetFromJsonAsync<R>($"{urlPrefix}/info");


    }

}
