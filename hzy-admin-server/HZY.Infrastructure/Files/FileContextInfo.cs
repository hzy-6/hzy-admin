namespace HZY.Infrastructure.Files
{
  public class FileContextInfo
  {
    public Exception Exception { get; set; }

    public string FileName { get; set; }

    public string FileRoot { get; set; }

    public FileContextStates State { get; set; }

    public string FullName { get; set; }

    public string OldName { get; set; }
  }
}