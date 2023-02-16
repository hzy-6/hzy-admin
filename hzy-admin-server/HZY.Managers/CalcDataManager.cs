using HZY.Framework.AutoRegisterIOC;
using HZY.Framework.AutoRegisterIOC.Attributes;
using HZY.Framework.Core.Quartz;

namespace HZY.Managers
{
    /// <summary>
    /// 本地测试对象
    /// </summary>
    [Component(ServiceType = ServiceType.Transient)]
    public class CalcDataManager
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
