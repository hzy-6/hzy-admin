using System;
using ICSharpCode.SharpZipLib.Checksum;
using ICSharpCode.SharpZipLib.Zip;
using System.IO;

namespace HZY.Toolkit
{
    /// <summary>
    /// 压缩 zip  https://www.cnblogs.com/xielong/p/6165550.html
    /// </summary>
    public class Zip
    {
        public Zip(string strFile, string strZip)
        {
            var len = strFile.Length;
            var strLen = strFile[len - 1];
            if (strFile[strFile.Length - 1] != Path.DirectorySeparatorChar)
            {
                strFile += Path.DirectorySeparatorChar;
            }

            using var outStream = new ZipOutputStream(File.Create(strZip));
            try
            {
                outStream.SetLevel(6);
                this.Execute(strFile, outStream, strFile);
            }
            finally
            {
                outStream.Finish();
                outStream.Close();
            }
        }

        private void Execute(string strFile, ZipOutputStream outStream, string staticFile)
        {
            if (strFile[strFile.Length - 1] != Path.DirectorySeparatorChar)
            {
                strFile += Path.DirectorySeparatorChar;
            }

            var crc = new Crc32();
            //获取指定目录下所有文件和子目录文件名称
            var filenames = Directory.GetFileSystemEntries(strFile);
            //遍历文件
            foreach (var file in filenames)
            {
                if (Directory.Exists(file))
                {
                    Execute(file, outStream, staticFile);
                }
                //否则，直接压缩文件
                else
                {
                    //打开文件
                    using var fs = File.OpenRead(file);
                    //定义缓存区对象
                    var buffer = new byte[fs.Length];
                    //通过字符流，读取文件
                    fs.Read(buffer, 0, buffer.Length);
                    //得到目录下的文件（比如:D:\Debug1\test）,test
                    var tempFile = file.Substring(staticFile.LastIndexOf("\\", StringComparison.Ordinal) + 1);
                    var entry = new ZipEntry(tempFile) {DateTime = DateTime.Now, Size = fs.Length};

                    crc.Reset();
                    crc.Update(buffer);
                    entry.Crc = crc.Value;
                    outStream.PutNextEntry(entry);
                    //写文件
                    outStream.Write(buffer, 0, buffer.Length);
                    fs.Close();
                }
            }
        }

        /// <summary>
        /// 解压
        /// </summary>
        /// <param name="zipFile">压缩包文件名</param>
        /// <param name="targetPath">解压缩目标路径</param>
        public static string UnZip(string zipFile, string targetPath)
        {
            var directoryName = targetPath;
            if (!Directory.Exists(directoryName)) Directory.CreateDirectory(directoryName); //生成解压目录   
            var currentDirectory = directoryName;
            var data = new byte[2048];
            var size = 2048;

            ZipEntry zipEntry = null;
            var theEntry = string.Empty;

            using var s = new ZipInputStream(File.OpenRead(zipFile));
            while ((zipEntry = s.GetNextEntry()) != null)
            {
                if (zipEntry.IsDirectory)
                {
                    // 该结点是目录
                    if (!Directory.Exists(currentDirectory + zipEntry.Name))
                        Directory.CreateDirectory(currentDirectory + zipEntry.Name);
                    //保存路径名
                    if (!string.IsNullOrEmpty(zipEntry.Name) && zipEntry.Name.Contains("/"))
                        theEntry = zipEntry.Name.Substring(0, zipEntry.Name.IndexOf('/'));
                }
                else
                {
                    if (string.IsNullOrWhiteSpace(zipEntry.Name)) continue;

                    //解压文件到指定的目录
                    using var streamWriter = File.Create(currentDirectory + zipEntry.Name);
                    while (true)
                    {
                        size = s.Read(data, 0, data.Length);
                        if (size <= 0) break;
                        streamWriter.Write(data, 0, size);
                    }

                    streamWriter.Close();
                }
            }

            s.Close();
            return "/" + theEntry; //返回压缩文件的路径
        }
    }
}