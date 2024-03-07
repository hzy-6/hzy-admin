import Http from "@/core/utils/Http";

/**
 * 定时任务服务
 */
export default class TimedTaskService {
  static urlPrefix = "/api/v1/admin/QuartzTasks";

  /**
   * 获取数据列表
   *
   * @param filter
   * @returns
   */
  static findList(filter: string) {
    return Http.post(`${this.urlPrefix}/findList/${filter ? filter : ""}`);
  }

  /**
   * 删除集合数据
   *
   * @param ids
   * @returns
   */
  static deleteList(ids: string[]) {
    return Http.post(`${this.urlPrefix}/deleteList`, ids);
  }

  /**
   * 查询表单
   *
   * @param id
   * @returns
   */
  static findForm(id?: string | undefined) {
    return Http.get(`${this.urlPrefix}/findForm${id ? "/" + id : ""}`);
  }

  /**
   * 保存表单数据
   *
   * @param id
   * @param formData
   * @returns
   */
  static saveForm(id: string | undefined, formData: any) {
    console.log(id);
    return Http.post(`${this.urlPrefix}/saveForm`, formData);
  }

  /**
   * 运行
   * @param ids
   * @returns
   */
  static run(ids: string[]) {
    return Http.post(`${this.urlPrefix}/run`, ids);
  }

  /**
   * 关闭
   * @param ids
   * @returns
   */
  static close(ids: string[]) {
    return Http.post(`${this.urlPrefix}/close`, ids);
  }

  /**
   * 获取日志记录列表
   * @param id
   * @param page
   * @param size
   * @returns
   */
  static getJobLoggers(id: string, page: number, size = 10) {
    return Http.get(`${this.urlPrefix}/getJobLoggers/${id}/${page}/${size}`);
  }

  /**
   * 扫描本地任务
   */
  static scanTask() {
    return Http.get(`${this.urlPrefix}/scanTask`);
  }
}
