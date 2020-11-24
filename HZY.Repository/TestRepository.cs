/*
 * *******************************************************
 *
 * 作者：hzy
 *
 * 开源地址：https://gitee.com/hzy6
 *
 * *******************************************************
 */
using HZY.Models.Framework;
using HZY.Repository.Core;
using HZY.Repository.Core.Provider;

namespace HZY.Repository
{
    /// <summary>
    /// 仓储 TestRepository
    /// </summary>
    public class TestRepository : AppRepository<Test>
    {
        public TestRepository(AppDbContext context) : base(context)
        {
        }
    }
}