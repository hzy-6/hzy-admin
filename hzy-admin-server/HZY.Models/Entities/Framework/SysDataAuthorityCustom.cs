using System;
using System.ComponentModel.DataAnnotations;
using HZY.Models.Entities.BaseEntitys;

namespace HZY.Models.Entities.Framework
{
    /// <summary>
    /// 数据权限子表
    /// </summary>
    public class SysDataAuthorityCustom : DefaultBaseEntity<Guid>
    {

        /// <summary>
        ///  SysDataAuthorityId => 备注: 数据权限主表Id
        /// </summary>
        public Guid? SysDataAuthorityId { get; set; }


        /// <summary>
        ///  SysOrganizationId => 备注: 组织Id
        /// </summary>
        public Int32 SysOrganizationId { get; set; }


    }
}