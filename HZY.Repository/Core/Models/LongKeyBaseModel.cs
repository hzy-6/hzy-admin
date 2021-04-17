using System.ComponentModel.DataAnnotations;

namespace HZY.Repository.Core.Models
{
    /// <summary>
    /// Int Key
    /// </summary>
    public class LongKeyBaseModel : BaseModel
    {
        /// <summary>
        /// Id
        /// </summary>
        [Key]
        public long Id { get; set; } = 0;
    }
}