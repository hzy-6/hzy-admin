import Http from "@/core/utils/Http";
import Tools from "@/core/utils/Tools";

/**
 * 角色菜单功能服务
 */
export default class SysRoleMenuFunctionService {
  static urlPrefix = "/api/v1/admin/SysRoleMenuFunction";

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
   * 保存表单数据
   *
   * @param id
   * @param formData
   * @returns
   */
  static saveForm(formData: any) {
    return Http.post(`${this.urlPrefix}/create`, formData);
  }

  /**
   * 获取角色菜单功能树
   *
   * @param {角色Id} roleId
   */
  static async getRoleMenuFunctionByRoleId(roleId: string) {
    const result = await Http.get(`${this.urlPrefix}/getRoleMenuFunctionByRoleId/${roleId}`);
    const keys: any[] = [];
    result.data.forEach((item: any) => {
      keys.push(item.id);
    });
    return {
      data: result.data,
      tree: Tools.genTreeData(result.data),
      keys,
    };
  }
}
