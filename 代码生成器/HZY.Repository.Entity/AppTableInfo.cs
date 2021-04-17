using System;
using System.ComponentModel.DataAnnotations;

namespace HZY.Repository.Entity
{
    public class AppTableInfo
    {
        /// <summary>
        /// Id
        /// </summary>
        [Key]
        public string Id { get; set; }

        /// <summary>
        /// 表名称
        /// </summary>
        /// <value></value>
        public string TabName { get; set; }

        /// <summary>
        /// 表备注
        /// </summary>
        /// <value></value>
        public string TabNameRemark { get; set; }

        /// <summary>
        /// 列序号
        /// </summary>
        /// <value></value>
        public Int32 ColOrder { get; set; }

        /// <summary>
        /// 列名
        /// </summary>
        /// <value></value>
        public string ColName { get; set; }

        /// <summary>
        /// 是否自增 1 是 0 否
        /// </summary>
        /// <value></value>
        public Int32 ColIsIdentity { get; set; }

        /// <summary>
        /// 是否主键 1 是 0 否
        /// </summary>
        /// <value></value>
        public Int32 ColIsKey { get; set; }

        /// <summary>
        /// 类型
        /// </summary>
        /// <value></value>
        public string ColType { get; set; }

        /// <summary>
        /// 暂用字节数
        /// </summary>
        /// <value></value>
        public Int32 ColLength { get; set; }

        /// <summary>
        /// 允许占用最大字长度
        /// </summary>
        /// <value></value>
        public Int32 ColMaxLength { get; set; }

        /// <summary>
        /// 小数位数
        /// </summary>
        /// <value></value>
        public Int32 ColScale { get; set; }

        /// <summary>
        /// 列能否为 Null
        /// </summary>
        /// <value></value>
        public Int32 ColIsNull { get; set; }

        /// <summary>
        /// 列默认值
        /// </summary>
        /// <value></value>
        public string ColDefaultValue { get; set; }

        /// <summary>
        /// 列备注
        /// </summary>
        /// <value></value>
        public string ColRemark { get; set; }

        /// <summary>
        /// 映射到C#的类型
        /// </summary>
        public string CsType { set; get; }
    }
}