using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HZY.Models.Entities.LowCode;

namespace HZY.Models.DTO.DevelopmentTool
{
    public class GenDbTableDto : LowCodeTable
    {
        /// <summary>
        /// 表字段信息
        /// </summary>
        /// <value></value>
        public List<LowCodeTableInfo> TableInfos { get; set; }

        public string Namespace { get; set; }
    }
}