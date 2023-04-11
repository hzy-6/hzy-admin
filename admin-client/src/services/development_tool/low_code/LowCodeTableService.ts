import Http from "@/core/utils/Http";

/**
 * 低代码表服务
 */
export default class LowCodeTableService {
  static urlPrefix = "/api/v1/admin/LowCodeTable";

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
   * 保存表单数据
   *
   * @param id
   * @param formData
   * @returns
   */
  static saveForm(id: string | undefined, formData: any) {
    return Http.post(`${this.urlPrefix}/${id ? "update" : "create"}`, formData);
  }

  /**
   * 同步表
   *
   * @returns
   */
  static synchronization() {
    return Http.post(`${this.urlPrefix}/synchronization`);
  }

  /**
   * 变更数据
   * @param list
   * @returns
   */
  static change(list: any[]) {
    return Http.post(`${this.urlPrefix}/change`, list);
  }
}
