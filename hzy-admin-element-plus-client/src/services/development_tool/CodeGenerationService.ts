import Http from '@/infrastructure/scripts/Http';
import { ApiResult } from '@/infrastructure/typings/ApiResult';

class CodeGenerationService {

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
     * 获取 code
     * @returns 
     */
    getCode(form: any): Promise<ApiResult<any>> {
        return Http.post(`${this.controllerName}/getCode`, form, false);
    }

    /**
     * 下载当前代码
     * @param {*} form 
     * @returns 
     */
    download(form: any): Promise<ApiResult<any>> {
        return Http.download(`${this.controllerName}/download`, form, false);
    }

    /**
     * 下载当前代码
     * @param {*} form 
     * @returns 
     */
    downloadAll(form: any): Promise<ApiResult<any>> {
        return Http.download(`${this.controllerName}/downloadAll`, form, false);
    }

    /**
     * 创建数据字典
     */
    createDataDictionary(): Promise<ApiResult<any>> {
        return Http.download(`${this.controllerName}/createDataDictionary`, null, false);
    }

    /**
     * 代码生成导入到项目
     */
    autoImprotProject(form: any): Promise<ApiResult<any>> {
        return Http.post(`${this.controllerName}/AutoImprotProject`, form, false)
    }

}

export default new CodeGenerationService();