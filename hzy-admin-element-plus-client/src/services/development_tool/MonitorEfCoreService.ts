import Http from '@/infrastructure/scripts/Http';
import { ApiResult } from '@/infrastructure/typings/ApiResult';

class MonitorEfCoreService {

    private controllerName: string = "admin/MonitorEFCore";

    /**
     * 获取 EFCore 监控上下文
     *
     */
    getEFCoreMonitorContext(): Promise<ApiResult<any>> {
        return Http.post(`${this.controllerName}/GetEFCoreMonitorContext/`, {}, false);
    }

    /**
     * 获取 EFCore Sql 监控上下文 耗时排行榜
     *
     */
    getTimeConsumingRanking(): Promise<ApiResult<any>> {
        return Http.post(`${this.controllerName}/GetTimeConsumingRanking/`, {}, false);
    }

    /**
    * 获取 EFCore Sql 监控上下文 最新数据
    *
    */
    getNewest(): Promise<ApiResult<any>> {
        return Http.post(`${this.controllerName}/GetNewest/`, {}, false);
    }

}


export default new MonitorEfCoreService();