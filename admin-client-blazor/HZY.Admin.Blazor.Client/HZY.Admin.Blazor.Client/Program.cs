var builder = WebAssemblyHostBuilder.CreateDefault(args);
builder.RootComponents.Add<App>("#app");
builder.RootComponents.Add<HeadOutlet>("head::after");

builder.Services.AddTransient<HttpClientDelegatingHandler>();
builder.Services.AddScoped(sp =>
{
    var httpClientDelegatingHandler = sp.GetRequiredService<HttpClientDelegatingHandler>();

    return new HttpClient(httpClientDelegatingHandler)
    {
        BaseAddress = new Uri("http://localhost:5500")//builder.HostEnvironment.BaseAddress
    };
});

builder.Services.AddAntDesign();

await builder.Build().RunAsync();
