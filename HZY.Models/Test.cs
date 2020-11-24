/*
 * *******************************************************
 *
 * 作者：hzy
 *
 * 开源地址：https://gitee.com/hzy6
 *
 * *******************************************************
 */
using System;
using System.ComponentModel.DataAnnotations;
using HZY.Models.Core;

namespace HZY.Models
{
    /// <summary>
    /// Test
    /// </summary>
    public class Test : GuidKeyBaseModel
    {

            /// <summary>
            /// 请设置 Name 的显示名称 => 备注: Name
            /// </summary>
            public string Name { get; set; }
            
    }
}