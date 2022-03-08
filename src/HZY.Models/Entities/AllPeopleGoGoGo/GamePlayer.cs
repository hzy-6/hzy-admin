using HZY.Models.Entities.BaseEntitys;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Models.Entities.AllPeopleGoGoGo
{
    /// <summary>
    /// 游戏玩家
    /// </summary>
    public class GamePlayer : DefaultBaseEntity<Guid>
    {

        /// <summary>
        /// 编号
        /// </summary>
        public int Number { get; set; }

        /// <summary>
        /// 游戏昵称
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 账号
        /// </summary>
        public string AccountNumber { get; set; }

        /// <summary>
        /// 账户密码
        /// </summary>
        public string AccountPassword { get; set; }

        /// <summary>
        /// 所属队伍
        /// </summary>
        public Guid? TeamId { get; set; }

        /// <summary>
        /// 游戏积分
        /// </summary>
        public int GameCredits { get; set; }

        /// <summary>
        /// 是否在线
        /// </summary>
        public bool IsOnline { get; set; } = false;

        /// <summary>
        /// 是否停用
        /// </summary>
        public bool State { get; set; } = false;


    }
}
