import Http from '@/infrastructure/scripts/Http';
import Tools, { EMessageType } from "@/infrastructure/scripts/tools";
import ApiResult from '@/infrastructure/typings/ApiResult';

class LowCodeTableInfoService {

    private controllerName: string = "admin/LowCodeTableInfo";

    /**
    * 查询列表
    * 
    * @param {一页显示多少行} rows 
    * @param {当前页码} page 
    */
    findList(rows: number, page: number, search = {}): Promise<ApiResult<any>> {
        return Http.post(`${this.controllerName}/findList/${rows}/${page}`, search, false);
    }

    /**
     * 删除数据
     * 
     * @param {要删除的id 数组} ids 
     */
    deleteList(ids: string[]): Promise<ApiResult<any>> | undefined {
        if (ids && ids.length === 0) {
            Tools.message("请选择要删除的数据!", EMessageType.警告);
            return;
        }
        return Http.post(`${this.controllerName}/deleteList`, ids, false);
    }

    /**
     * 同步表
     * @returns 
     */
    synchronization(tableId: string): Promise<ApiResult<any>> {
        return Http.post(`${this.controllerName}/synchronization/${tableId}`, {}, false);
    }

    /**
     * 变更数据
     * @returns 
     */
    change(list: any[]): Promise<ApiResult<any>> {
        return Http.post(`${this.controllerName}/change`, list, false);
    }
}

export default new LowCodeTableInfoService();