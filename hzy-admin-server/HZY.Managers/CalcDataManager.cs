using HZY.Framework.AutoRegisterIOC;
using HZY.Framework.Core.Quartz;

namespace HZY.Managers
{
    /// <summary>
    /// 本地测试对象
    /// </summary>
    public class CalcDataManager : ITransientSelfDependency
    {
        /// <summary>
        /// 
        /// </summary>
        [Scheduled("0/5 * * * * ?")]
        public void Run()
        {

            Console.WriteLine($"\r\n >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> {nameof(CalcDataManager)} - {nameof(Run)}  \r\n");

        }


    }
}
