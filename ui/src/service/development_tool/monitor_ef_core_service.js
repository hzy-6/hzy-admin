import { post } from '@/scripts/request';

const controllerName = "admin/MonitorEFCore";

export default {
    /**
     * 获取 EFCore 监控上下文
     *
     */
    getEFCoreMonitorContext() {
        return post(`${controllerName}/GetEFCoreMonitorContext/`, null, false);
    },
    /**
     * 获取 EFCore Sql 监控上下文 耗时排行榜
     *
     */
    getTimeConsumingRanking() {
        return post(`${controllerName}/GetTimeConsumingRanking/`, null, false);
    },
    /**
    * 获取 EFCore Sql 监控上下文 最新数据
    *
    */
    getNewest() {
        return post(`${controllerName}/GetNewest/`, null, false);
    },

};