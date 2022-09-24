import Http from '@/infrastructure/scripts/Http';
import Tools, { EMessageType } from "@/infrastructure/scripts/Tools";

const controllerName = "admin/SysUser";

export default {
    /**
     * 获取用户和菜单信息
     *
     * @returns {Promise}
     */
    getUserInfo() {
        return Http.get(`${controllerName}/info`);
    },
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
     * 删除数据
     * 
     * @param {要删除的id 数组} ids 
     */
    deleteList(ids) {
        console.log(ids);
        if (ids && ids.length === 0) {
            return Tools.message("请选择要删除的数据!", EMessageType.警告);
        }
        return Http.post(`${controllerName}/deleteList`, ids, false);
    },
    /**
     * 获取表单数据
     * 
     * @param {*} id 
     */
    findForm(id) {
        return Http.get(`${controllerName}/findForm${(id ? '/' + id : '')}`);
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
     * 导出 excel
     * @param {*} search 
     */
    exportExcel(search) {
        return Http.download(`${controllerName}/exportExcel`, search);
    },

};