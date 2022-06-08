using HZY.Models.Entities.BaseEntitys;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Models.Entities.LowCode
{
    /// <summary>
    /// 低代码表信息
    /// </summary>
    public class LowCodeTableInfo : DefaultBaseEntity<Guid>
    {
        /// <summary>
        /// 表 id
        /// </summary>
        public Guid Low_Code_TableId { get; set; }

        /// <summary>
        /// 主键
        /// </summary>
        public bool IsPrimary { get; set; }

        /// <summary>
        /// 自增标识
        /// </summary>
        public bool IsIdentity { get; set; }

        /// <summary>
        /// 是否可DBNull
        /// </summary>
        public bool IsNullable { get; set; }

        /// <summary>
        /// 字段位置
        /// </summary>
        public int Position { get; set; }

        /// <summary>
        /// 列名
        /// </summary>
        public string ColumnName { get; set; }

        /// <summary>
        /// 列描述
        /// </summary>
        public string Describe { get; set; }

        /// <summary>
        /// 数据库列类型
        /// </summary>
        public string DatabaseColumnType { get; set; }

        /// <summary>
        /// c# 数据类型
        /// </summary>
        public string CsType { get; set; }

        /// <summary>
        /// c# 字段
        /// </summary>
        public string CsField { get; set; }

        /// <summary>
        /// 
        /// </summary>
        /// <value></value>
        public int? MaxLength { get; set; }

        /// <summary>
        /// 显示名称
        /// </summary>
        public string DisplayName { get; set; }
    }

    /// <summary>
    /// c# 类型枚举
    /// </summary>
    public enum CsTypeEnum
    {
        Long,
        String,
        Int32,
        Double,
        Decimal,
        DateTime,
        Boolean,
        Guid
    }
}
