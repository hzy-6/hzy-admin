import Http from "@/core/utils/Http";
import Tools from "@/core/utils/Tools";

/**
 * 组织机构日志
 */
export default class SysOrganizationService {
  static urlPrefix = "/api/v1/admin/SysOrganization";

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
    return new Promise((resolve: (value: any) => any, reject) => {
      Http.post(`${this.urlPrefix}/GetSysOrganizationTree`).then((res) => {
        // 如果成功
        if (res.code === 200) {
          // 对数据加工转换为 tree
          res.data.rows = Tools.genTreeData(res.data.rows, null);
          console.log(res);
          resolve(res as any);
        } else {
          reject(res as any);
        }
      });
    });
  }
}
