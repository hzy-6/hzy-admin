using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HZY.Models.Entities.LowCode;

namespace HZY.Models.DTO.DevelopmentTool
{
    public class GenDbTableDto : Low_Code_Table
    {
        /// <summary>
        /// 表字段信息
        /// </summary>
        /// <value></value>
        public List<Low_Code_Table_Info> TableInfos { get; set; }
    }
}