import Http from "@/core/utils/Http";

/**
 * EFCore 监控服务
 */
export default class MonitorEFCoreService {
  static urlPrefix = "/api/v1/admin/MonitorEFCore";

  /**
   * 获取 EFCore 监控上下文
   *
   */
  static getEFCoreMonitorContext() {
    return Http.post(`${this.urlPrefix}/GetEFCoreMonitorContext/`);
  }

  /**
   * 获取 EFCore Sql 监控上下文 耗时排行榜
   *
   */
  static getTimeConsumingRanking() {
    return Http.post(`${this.urlPrefix}/GetTimeConsumingRanking/`);
  }

  /**
   * 获取 EFCore Sql 监控上下文 最新数据
   *
   */
  static getNewest() {
    return Http.post(`${this.urlPrefix}/GetNewest/`);
  }
}
