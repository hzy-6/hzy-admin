import Http from "@/core/utils/Http";

/**
 * 个人中心服务
 */
export default class PersonalCenterService {
  static urlPrefix = "/api/v1/admin/PersonalCenter";

  /**
   * 修改密码
   *
   * @param form
   * @returns
   */
  static changePassword(form: any) {
    return Http.post(`${this.urlPrefix}/changePassword`, form);
  }

  /**
   * 修改基础信息
   * @param formData
   * @returns
   */
  static saveForm(formData: any) {
    return Http.post(`${this.urlPrefix}/saveForm`, formData);
  }
}
