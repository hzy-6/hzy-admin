using Microsoft.AspNetCore.Components.WebAssembly.Http;

namespace HZY.Admin.Blazor.Client.Utils;

/// <summary>
/// http 拦截器
/// </summary>
public class HttpClientDelegatingHandler : DelegatingHandler
{
    private readonly NavigationManager _navigationManager;
    private readonly IJSRuntime _jSRuntime;

    public HttpClientDelegatingHandler(NavigationManager navigationManager, IJSRuntime jSRuntime)
    {
        _navigationManager = navigationManager;
        _jSRuntime = jSRuntime;
    }

    protected override async Task<HttpResponseMessage> SendAsync(HttpRequestMessage request, CancellationToken cancellationToken)
    {
        var token = await _jSRuntime.GetLocalStorageItemAsync<string>("token");

        if (string.IsNullOrWhiteSpace(token))
        {
            _navigationManager.NavigateTo("/login");
            //return default;
        }

        // 跨域配置
        request.SetBrowserRequestCredentials(BrowserRequestCredentials.Include);

        // 在发送请求之前进行JSON序列化
        //if (request.Content != null && request.Content.Headers.ContentType?.MediaType == "application/json")
        //{
        //    var content = await request.Content.ReadAsStringAsync();
        //    var serializedContent = JsonConvert.SerializeObject(JsonConvert.DeserializeObject(content));
        //    request.Content = new StringContent(serializedContent, System.Text.Encoding.UTF8, "application/json");
        //}

        try
        {
            // 发送请求
            var response = await base.SendAsync(request, cancellationToken);

            // 在收到响应后进行JSON反序列化
            //if (response.Content != null && response.Content.Headers.ContentType?.MediaType == "application/json")
            //{
            //    var content = await response.Content.ReadAsStringAsync();
            //    var deserializedContent = JsonConvert.DeserializeObject(content);
            //    response.Content = new StringContent(JsonConvert.SerializeObject(deserializedContent), System.Text.Encoding.UTF8, "application/json");
            //}

            return response;
        }
        catch (Exception ex)
        {

            throw;
        }

    }
}