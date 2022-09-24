import Http from '@/infrastructure/scripts/Http';

const controllerName = "admin/MonitorEFCore";

export default {
    /**
     * 获取 EFCore 监控上下文
     *
     */
    getEFCoreMonitorContext() {
        return Http.post(`${controllerName}/GetEFCoreMonitorContext/`, null, false);
    },
    /**
     * 获取 EFCore Sql 监控上下文 耗时排行榜
     *
     */
    getTimeConsumingRanking() {
        return Http.post(`${controllerName}/GetTimeConsumingRanking/`, null, false);
    },
    /**
    * 获取 EFCore Sql 监控上下文 最新数据
    *
    */
    getNewest() {
        return Http.post(`${controllerName}/GetNewest/`, null, false);
    },

};