import Http from '@/infrastructure/scripts/Http';
import { ApiResult } from '@/infrastructure/typings/ApiResult';

class MonitorEfCoreService {

    private controllerName: string = "admin/MonitorEFCore";

    /**
     * 获取 EFCore 监控上下文
     *
     */
    getEFCoreMonitorContext(): Promise<ApiResult<any>> {
        return Http.post(`${this.controllerName}/GetEFCoreMonitorContext/`, null, false);
    }

    /**
     * 获取 EFCore Sql 监控上下文 耗时排行榜
     *
     */
    getTimeConsumingRanking(): Promise<ApiResult<any>> {
        return Http.post(`${this.controllerName}/GetTimeConsumingRanking/`, null, false);
    }

    /**
    * 获取 EFCore Sql 监控上下文 最新数据
    *
    */
    getNewest(): Promise<ApiResult<any>> {
        return Http.post(`${this.controllerName}/GetNewest/`, null, false);
    }

}


export default new MonitorEfCoreService();