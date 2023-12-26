namespace HZY.Admin.Blazor.Client.Utils;

/// <summary>
/// 工具
/// </summary>
public static class Tools
{
    /// <summary>
    /// 获取浏览器内存数据
    /// </summary>
    /// <typeparam name="T"></typeparam>
    /// <param name="jSRuntime"></param>
    /// <param name="key"></param>
    /// <returns></returns>
    public static async Task<T> GetLocalStorageItemAsync<T>(this IJSRuntime jSRuntime, string key)
    {
        var token = await jSRuntime.InvokeAsync<T>("localStorage.getItem", key);

        return token;
    }

    /// <summary>
    /// 存储数据到浏览器
    /// </summary>
    /// <typeparam name="T"></typeparam>
    /// <param name="jSRuntime"></param>
    /// <param name="key"></param>
    /// <param name="data"></param>
    /// <returns></returns>
    public static async Task SetLocalStorageItemAsync<T>(this IJSRuntime jSRuntime, string key, T data)
    {
        await jSRuntime.InvokeAsync<T>("localStorage.setItem", key, JsonConvert.SerializeObject(data));
    }

}
