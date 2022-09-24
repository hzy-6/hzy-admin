import Http from '@/infrastructure/scripts/Http';
import Tools, { EMessageType } from "@/infrastructure/scripts/Tools";

class SysOperationLogSerivce {

    private controllerName: string = "admin/SysOperationLog";

    /**
     * 查询列表
     * 
     * @param {一页显示多少行} rows 
     * @param {当前页码} page 
     */
    findList(rows, page, search = {}) {
        return Http.post(`${this.controllerName}/findList/${rows}/${page}`, search, false);
    }

    deleteAllData() {
        return Http.get(`${this.controllerName}/deleteAllData`);
    }

    /**
     * 获取表单数据
     * 
     * @param {*} id 
     */
    findForm(id) {
        return Http.get(`${this.controllerName}/findForm${(id ? '/' + id : '')}`);
    }
}

export default new SysOperationLogSerivce()