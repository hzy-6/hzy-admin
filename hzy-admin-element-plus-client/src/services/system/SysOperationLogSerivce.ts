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
    findList(rows: number, page: number, search = {}): Promise<unknown> {
        return Http.post(`${this.controllerName}/findList/${rows}/${page}`, search, false);
    }

    /**
     * 删除所有数据
     * @returns 
     */
    deleteAllData(): Promise<unknown> {
        return Http.get(`${this.controllerName}/deleteAllData`);
    }

    /**
     * 获取表单数据
     * 
     * @param {*} id 
     */
    findForm(id: string): Promise<unknown> {
        return Http.get(`${this.controllerName}/findForm${(id ? '/' + id : '')}`);
    }
}

export default new SysOperationLogSerivce()