namespace HZY.Core.QrCode.Services;

/// <summary>
/// 二维码服务
/// </summary>
[Component(ServiceType = ServiceType.Singleton)]
public class QrCodeService
{
    public QrCodeService()
    {

    }

    /// <summary>
    /// 生成二维码图片
    /// </summary>
    public void GenerateQRCode()
    {
        var qrCodeContent = "老铁666";
        using var generator = new QRCodeGenerator();

        // 创建二维码（并设置纠错能力最高级）
        var createQrCode = generator.CreateQrCode(qrCodeContent, ECCLevel.H);

        var skImageInfo = new SKImageInfo(300, 300);

        // 创建SkiaSharp画布
        using var surface = SKSurface.Create(skImageInfo);

        var canvas = surface.Canvas;

        // 渲染二维码到画布
        canvas.Render(createQrCode, skImageInfo.Width, skImageInfo.Height);

        using var image = surface.Snapshot();// 获取画布快照
        using var data = image.Encode(SKEncodedImageFormat.Png, 100);// 编码画布快照为PNG格式的数据
        using var stream = File.OpenWrite(@"MyQRCode.png");
        data.SaveTo(stream);// 将数据保存到文件流中，生成二维码图片
    }




}
