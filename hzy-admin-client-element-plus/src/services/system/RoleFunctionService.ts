import Http from '@/infrastructure/scripts/Http';
import Tools, { EMessageType } from "@/infrastructure/scripts/Tools";

const controllerName = "admin/SysRoleMenuFunction";

export default {
    /**
     * 查询列表
     * 
     * @param {一页显示多少行} rows 
     * @param {当前页码} page 
     */
    findList(rows, page, search = {}) {
        return Http.post(`${controllerName}/findList/${rows}/${page}`, search, false);
    },
    /**
     * 保存表单
     * 
     * @param {表单数据} vm 
     */
    saveForm(vm) {
        if (vm.id) {
            return Http.post(`${controllerName}/update`, vm);
        }
        return Http.post(`${controllerName}/create`, vm);
    },
    /**
     * 获取角色菜单功能树
     * @param {角色Id} roleId 
     */
    getRoleMenuFunctionByRoleId(roleId) {
        return Http.get(`${controllerName}/getRoleMenuFunctionByRoleId/${roleId}`);
    }
};