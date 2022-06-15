using FreeSql.DatabaseModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Models.DTO.DevelopmentTool
{
    /// <summary>
    /// 生成代码上下文
    /// </summary>
    public class GenContextDto : DbTableInfo
    {
        /// <summary>
        /// 命名空间
        /// </summary>
        public string Namespace { get; set; }

    }
}
