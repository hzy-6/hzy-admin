using HzyScanDiService;

namespace HZY.Infrastructure.Files
{
  public interface IFileManager : ITransientDependency
  {
    FileManager AddFileExtensions(params string[] fileExtensions);
    FileManager AddMaxLength(long maxLength);
    FileManager AddSaveFolder(string dir);
    FileManager AllowAnyFileExtensions();
    FileManagerContext BuildFileManagerContext();
    FileManager ResetFileExtensions();
  }
}