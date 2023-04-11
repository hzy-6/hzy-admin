import Http from "@/core/utils/Http";

/**
 * 低代码生成服务
 */
export default class CodeGenerationService {
  static urlPrefix = "/api/v1/admin/CodeGeneration";

  /**
   * 获取数据列表
   * @param current
   * @param pageSize
   * @param search
   * @param searchSort
   * @returns
   */
  static findList(current: number, pageSize: number, search: any = {}, searchSort: any[] = []) {
    return Http.post(`${this.urlPrefix}/findList`, {
      page: current,
      size: pageSize,
      search,
      searchSort,
    });
  }

  /**
   * 获取 code
   * @returns
   */
  static getCode(form: any) {
    return Http.post(`${this.urlPrefix}/getCode`, form);
  }

  /**
   * 下载当前代码
   * @param {*} form
   * @returns
   */
  static download(form: any) {
    return Http.download(`${this.urlPrefix}/download`, form);
  }

  /**
   * 下载当前代码
   * @param {*} form
   * @returns
   */
  static downloadAll(form: any) {
    return Http.download(`${this.urlPrefix}/downloadAll`, form);
  }

  /**
   * 创建数据字典
   */
  static createDataDictionary() {
    return Http.download(`${this.urlPrefix}/createDataDictionary`, {});
  }

  /**
   * 代码生成导入到项目
   */
  static autoImprotProject(form: any) {
    return Http.post(`${this.urlPrefix}/AutoImprotProject`, form);
  }
}
