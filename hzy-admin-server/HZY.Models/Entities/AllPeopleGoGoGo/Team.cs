using HZY.Models.Entities.BaseEntitys;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Models.Entities.AllPeopleGoGoGo
{

    /// <summary>
    /// 队伍
    /// </summary>
    public class Team : DefaultBaseEntity<Guid>
    {
        /// <summary>
        /// 队伍编号
        /// </summary>
        public int Number { get; set; }

        /// <summary>
        /// 队伍名称
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 所属房间Id
        /// </summary>
        public Guid? RoomId { get; set; }

    }
}
