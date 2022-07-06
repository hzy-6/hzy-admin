import { get, post } from '@/scripts/request';
// import tools from "@/scripts/tools";

const controllerName = "admin/SysRoleMenuFunction";

export default {
    /**
     * 查询列表
     * 
     * @param {一页显示多少行} rows 
     * @param {当前页码} page 
     */
    findList(rows, page, search = {}) {
        return post(`${controllerName}/findList/${rows}/${page}`, search, false);
    },
    /**
     * 保存表单
     * 
     * @param {表单数据} vm 
     */
    saveForm(vm) {
        if (vm.id) {
            return post(`${controllerName}/update`, vm);
        }
        return post(`${controllerName}/create`, vm);
    },
    /**
     * 获取角色菜单功能树
     * @param {角色Id} roleId 
     */
    getRoleMenuFunctionByRoleId(roleId) {
        return get(`${controllerName}/getRoleMenuFunctionByRoleId/${roleId}`);
    }
};