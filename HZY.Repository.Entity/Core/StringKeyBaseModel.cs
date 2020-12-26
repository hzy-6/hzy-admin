using System.ComponentModel.DataAnnotations;

namespace HZY.Repository.Entity.Core
{
    /// <summary>
    /// String Key
    /// </summary>
    public class StringKeyBaseModel : BaseModel
    {
        /// <summary>
        /// Id
        /// </summary>
        [Key]
        public string Id { get; set; } = string.Empty;
    }
}