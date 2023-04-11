import Http from "@/core/utils/Http";

/**
 * 数据字典
 */
export default class SysDictionaryService {
  static urlPrefix = "/api/v1/admin/SysDictionary";

  /**
   * 获取数据列表
   *
   * @param search
   * @returns
   */
  static findList(search: any = {}) {
    return Http.post(`${this.urlPrefix}/findList`, search);
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
   * 获取组织树
   */
  static sysOrganizationTree() {
    return Http.post(`${this.urlPrefix}/sysOrganizationTree`);
  }
}
