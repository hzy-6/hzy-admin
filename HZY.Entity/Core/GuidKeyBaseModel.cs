using System;
using System.ComponentModel.DataAnnotations;

namespace HZY.Entity.Core
{
    /// <summary>
    /// Guid Key
    /// </summary>
    public class GuidKeyBaseModel : BaseModel
    {
        /// <summary>
        /// Id
        /// </summary>
        [Key]
        public Guid Id { get; set; } = Guid.Empty;
    }
}