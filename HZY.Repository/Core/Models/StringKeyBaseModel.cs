using System.ComponentModel.DataAnnotations;

namespace HZY.Repository.Core.Models
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