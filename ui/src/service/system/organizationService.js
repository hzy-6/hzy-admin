import { get, post, download } from '@/scripts/request';
import tools from "@/scripts/tools";

const controllerName = "admin/SysOrganization";

export default {
    /**
     * 查询列表
     * 
     */
    findList(search = {}) {
        return post(`${controllerName}/findList/`, search, false);
    },
    /**
     * 删除数据
     * 
     * @param {要删除的id 数组} ids 
     */
    deleteList(ids) {
        console.log(ids);
        if (ids && ids.length === 0) {
            return tools.message("请选择要删除的数据!", "警告");
        }
        return post(`${controllerName}/deleteList`, ids, false);
    },
    /**
     * 获取表单数据
     * 
     * @param {*} id 
     */
    findForm(id, parentId) {
        return get(`${controllerName}/findForm/${(id ? id : tools.guidEmpty)}/${(parentId ? parentId : '')}`);
    },
    /**
     * 保存表单
     * 
     * @param {表单数据} form 
     */
    saveForm(form) {
        return post(`${controllerName}/saveForm`, form);
    },
    /**
     * 导出 excel
     * @param {*} search 
     */
    exportExcel(search) {
        return download(`${controllerName}/exportExcel`, search);
    },
    /**
     * sysOrganizationTree
     * @param {*} search 
     */
    sysOrganizationTree() {
        return post(`${controllerName}/sysOrganizationTree`);
    }
};