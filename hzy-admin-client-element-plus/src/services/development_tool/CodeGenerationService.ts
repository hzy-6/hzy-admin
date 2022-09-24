import Http from '@/infrastructure/scripts/Http';

const controllerName = "admin/CodeGeneration";

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

    /**
     * 获取 code
     * @returns 
     */
    getCode(form) {
        return Http.post(`${controllerName}/getCode`, form, false);
    },

    /**
     * 下载当前代码
     * @param {*} form 
     * @returns 
     */
    download(form) {
        return Http.download(`${controllerName}/download`, form, false);
    },

    /**
     * 下载当前代码
     * @param {*} form 
     * @returns 
     */
    downloadAll(form) {
        return Http.download(`${controllerName}/downloadAll`, form, false);
    },

    /**
     * 创建数据字典
     */
    createDataDictionary() {
        return Http.download(`${controllerName}/createDataDictionary`, null, false);
    },
    /**
     * 代码生成导入到项目
     */
    autoImprotProject(form) {
        return Http.post(`${controllerName}/AutoImprotProject`, form, false)
    }
};