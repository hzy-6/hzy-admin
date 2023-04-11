namespace HZY.Core.Files;

public class FileManagerContext
{
    public string? FileDir { get; set; }

    public long MaxFileSizeLimit { get; set; }

    public List<string> FileExtensions { get; set; }

    public bool IsAllowAnyFile { get; set; }

    public string? ServerUrl { get; set; }
}