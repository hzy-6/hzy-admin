namespace HZY.Shared.Upload.VO;

/// <summary>
/// Antd Vue 文件上传返回对象
/// </summary>
public class UploadResultVO
{

    //name 文件名 string	-
    //percent 上传进度    number	-
    //status 上传状态，不同状态展示颜色也会有所不同 error | success | done | uploading | removed	-
    //thumbUrl 缩略图地址   string	-
    //uid 唯一标识符，不设置时会自动生成 string	-
    //url 下载地址    string

    /// <summary>
    /// 唯一标识符，不设置时会自动生成 string	-
    /// </summary>
    public Guid Uid { get; set; }

    /// <summary>
    /// 文件名
    /// </summary>
    public string? Name { get; set; }

    /// <summary>
    /// 上传进度
    /// </summary>
    public int Percent { get; set; }

    /// <summary>
    /// 上传状态，不同状态展示颜色也会有所不同 error | success | done | uploading | removed	-
    /// </summary>
    public string? Status { get; set; }

    /// <summary>
    /// 缩略图地址
    /// </summary>
    public string? ThumbUrl { get; set; }

    /// <summary>
    /// 下载地址
    /// </summary>
    public string? Url { get; set; }


}
