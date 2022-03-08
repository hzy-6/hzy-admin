import { get,post } from '@/scripts/request';


const controllerName = "admin/SysOperationLog";

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

    deleteAllData(){
        return get(`${controllerName}/deleteAllData`);
    },
    /**
     * 获取表单数据
     * 
     * @param {*} id 
     */
     findForm(id) {
        return get(`${controllerName}/findForm${(id ? '/' + id : '')}`);
    },
    
};