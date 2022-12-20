import Http from "@/core/utils/Http";

/**
 * 低代码表详情信息服务
 */
export default class LowCodeTableInfoService {

    static urlPrefix = "/api/admin/LowCodeTableInfo";

    /**
     * 获取数据列表
     * 
     * @param current 
     * @param pageSize 
     * @param search 
     * @returns 
     */
    static findList(current: number, pageSize: number, search: any = {}) {
        return Http.post(`${this.urlPrefix}/findList/${pageSize}/${current}`, search)
    }

    /**
     * 删除集合数据
     * 
     * @param ids 
     * @returns 
     */
    static deleteList(ids: string[]) {
        return Http.post(`${this.urlPrefix}/deleteList`, {
            data: ids
        })
    }

    /**
     * 同步
     * 
     * @returns 
     */
    static synchronization(tableId: string) {
        return Http.post(`${this.urlPrefix}/synchronization/${tableId}`);
    }

    /**
     * 变更数据
     * @param list 
     * @returns 
     */
    static change(list: any[]) {
        return Http.post(`${this.urlPrefix}/change`, list);
    }


}


