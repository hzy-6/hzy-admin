using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenerateSeeds
{
    public static class Util
    {

        /// <summary>
        /// 蛇形命名 转化为 驼峰命名
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public static string LineToHump(string name)
        {
            if (!name.Contains('_') && name != name.ToLower())
            {
                return name;
            }

            StringBuilder sb = new StringBuilder();
            foreach (var item in name.Split("_", StringSplitOptions.RemoveEmptyEntries))
            {
                sb.Append(Thread.CurrentThread.CurrentCulture.TextInfo.ToTitleCase(item));
            }

            return sb.ToString();
        }

    }
}
