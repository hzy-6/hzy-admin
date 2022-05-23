import { post } from '@/scripts/request';
// import tools from "@/scripts/tools";

const controllerName = "admin/LowCodeTable";

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
     * 删除数据
     * 
     * @param {要删除的id 数组} ids 
     */
    deleteList(ids) {
        if (ids && ids.length === 0) {
            return tools.message("请选择要删除的数据!", "警告");
        }
        return post(`${controllerName}/deleteList`, ids, false);
    },

    /**
     * 同步表
     * @returns 
     */
    synchronization() {
        return post(`${controllerName}/synchronization`, null, false);
    },

    /**
     * 变更数据
     * @returns 
     */
    change(list) {
        return post(`${controllerName}/change`, list, false);
    }


};