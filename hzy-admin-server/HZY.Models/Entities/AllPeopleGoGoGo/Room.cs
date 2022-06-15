using HZY.Models.Entities.BaseEntitys;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Models.Entities.AllPeopleGoGoGo
{
    /// <summary>
    /// 房间
    /// </summary>
    public class Room : DefaultBaseEntity<Guid>
    {
        /// <summary>
        /// 编号
        /// </summary>
        public int Number { get; set; }

        /// <summary>
        /// 房间名称
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 房间密钥
        /// </summary>
        public string SecretKey { get; set; }

    }
}
