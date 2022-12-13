using FreeSql.DatabaseModel;
using HZY.Models.Entities.BaseEntitys;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Models.Entities.LowCode
{
    /// <summary>
    /// 低代码表
    /// </summary>
    public class LowCodeTable : DefaultBaseEntityGuidKey
    {

        /// <summary>
        /// 表名称
        /// </summary>
        public string TableName { get; set; }

        /// <summary>
        /// 表空间
        /// </summary>
        /// <value></value>
        public string Schema { get; set; }

        /// <summary>
        /// 表类型
        /// </summary>
        /// <value></value>
        public string Type { get; set; }

        /// <summary>
        /// 显示名称 描述
        /// </summary>
        public string DisplayName { get; set; }

        /// <summary>
        /// 实体名称
        /// </summary>
        public string EntityName { get; set; }

        /// <summary>
        /// 备注
        /// </summary>
        public string Remark { get; set; }

        /// <summary>
        /// 项目根地址
        /// </summary>
        /// <value></value>
        public string ProjectRootPath { get; set; }
        /// <summary>
        /// 实体保存路径
        /// </summary>
        /// <value></value>
        public string ModelPath { get; set; }
        /// <summary>
        /// 服务保存路径
        /// </summary>
        /// <value></value>
        public string ServicePath { get; set; }
        /// <summary>
        /// 控制器保存路径
        /// </summary>
        /// <value></value>
        public string ControllerPath { get; set; }
        /// <summary>
        /// 前端视图保存路径
        /// </summary>
        /// <value></value>
        public string ClientIndexPath { get; set; }
        /// <summary>
        /// 前端信息弹窗保存位置
        /// </summary>
        /// <value></value>
        public string ClientInfoPath { get; set; }
        /// <summary>
        /// 前端服务保存位置
        /// </summary>
        /// <value></value>
        public string ClientServicePath { get; set; }
        /// <summary>
        /// 是否覆盖生成  否的话生成代码重复会在后面加一个时间
        /// </summary>
        /// <value></value>
        public bool? IsCover { get; set; } = false;


    }
}
