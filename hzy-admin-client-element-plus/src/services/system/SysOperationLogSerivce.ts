import Http from '@/infrastructure/scripts/Http';
import Tools, { EMessageType } from "@/infrastructure/scripts/Tools";

const controllerName = "admin/SysOperationLog";

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
    deleteAllData() {
        return Http.get(`${controllerName}/deleteAllData`);
    },
    /**
     * 获取表单数据
     * 
     * @param {*} id 
     */
    findForm(id) {
        return Http.get(`${controllerName}/findForm${(id ? '/' + id : '')}`);
    },

};