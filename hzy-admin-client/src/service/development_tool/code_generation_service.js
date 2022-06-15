import { get, post, download } from '@/scripts/request';
// import tools from "@/scripts/tools";

const controllerName = "admin/CodeGeneration";

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
     * 获取 code
     * @returns 
     */
    getCode(form) {
        return post(`${controllerName}/getCode`, form, false);
    },

    /**
     * 下载当前代码
     * @param {*} form 
     * @returns 
     */
    download(form) {
        return download(`${controllerName}/download`, form, false);
    },

    /**
     * 下载当前代码
     * @param {*} form 
     * @returns 
     */
    downloadAll(form) {
        return download(`${controllerName}/downloadAll`, form, false);
    },

    /**
     * 创建数据字典
     */
    createDataDictionary() {
        return download(`${controllerName}/createDataDictionary`, null, false);
    }

};