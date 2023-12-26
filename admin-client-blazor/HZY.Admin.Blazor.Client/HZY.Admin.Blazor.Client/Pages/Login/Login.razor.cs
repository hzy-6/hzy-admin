namespace HZY.Admin.Blazor.Client.Pages.Login;

public partial class Login
{
    public string UserName { get; set; }

    public string Password { get; set; }

    public bool Loading { get; set; }

    [Inject]
    public NavigationManager NavigationManager { get; set; }

    public void Check()
    {
        Loading = true;

        Thread.Sleep(1000);

        Loading = false;
        Thread.Sleep(1000);
        NavigationManager.NavigateTo("/");
    }

}
