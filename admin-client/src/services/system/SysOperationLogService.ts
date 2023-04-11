import Http from "@/core/utils/Http";

/**
 * 系统日志服务
 */
export default class SysOperationLogService {
  static urlPrefix = "/api/v1/admin/SysOperationLog";

  /**
   * 获取数据列表
   * @param current
   * @param pageSize
   * @param search
   * @param searchSort
   * @returns
   */
  static findList(current: number, pageSize: number, search: any = {}, searchSort: any[] = []) {
    return Http.post(`${this.urlPrefix}/findList`, {
      page: current,
      size: pageSize,
      search,
      searchSort,
    });
  }

  /**
   * 删除集合数据
   *
   * @param ids
   * @returns
   */
  static deleteList(ids: string[]) {
    return Http.post(`${this.urlPrefix}/deleteList`, ids);
  }

  /**
   * 查询表单
   *
   * @param id
   * @returns
   */
  static findForm(id?: string | undefined) {
    return Http.get(`${this.urlPrefix}/findForm${id ? "/" + id : ""}`);
  }

  /**
   * 删除所有数据
   *
   * @returns
   */
  static deleteAllData() {
    return Http.get(`${this.urlPrefix}/deleteAllData`);
  }
}
