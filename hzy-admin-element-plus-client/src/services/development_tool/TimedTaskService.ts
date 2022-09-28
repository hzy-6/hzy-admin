import Http from '@/infrastructure/scripts/Http';
import Tools, { EMessageType } from "@/infrastructure/scripts/Tools";
import { ApiResult } from '@/infrastructure/typings/ApiResult';

class TimedTaskService {

    private controllerName: string = "admin/QuartzTasks";

    /**
     * 查询列表
     *
     * @param {一页显示多少行} rows
     * @param {当前页码} page
     */
    findList(filter: any): Promise<ApiResult<any>> {
        return Http.post(`${this.controllerName}/findList/${(filter ? filter : '')}`, {}, false);
    }

    /**
     * 删除数据
     *
     * @param {要删除的id 数组} ids
     */
    deleteList(ids: string[]): Promise<ApiResult<any>> | undefined {
        console.log(ids);
        if (ids && ids.length === 0) {
            Tools.message("请选择要删除的数据!", EMessageType.警告);
            return;
        }
        return Http.post(`${this.controllerName}/deleteList`, ids, false);
    }

    /**
     * 获取表单数据
     *
     * @param {*} id
     */
    findForm(id: string | null): Promise<ApiResult<any>> {
        return Http.get(`${this.controllerName}/findForm${(id ? '/' + id : '')}`);
    }

    /**
     * 保存表单
     *
     * @param {表单数据} form
     */
    saveForm(form: any): Promise<ApiResult<any>> {
        return Http.post(`${this.controllerName}/saveForm`, form);
    }

    /**
     * 运行
     */
    run(ids: string[]): Promise<ApiResult<any>> {
        return Http.post(`${this.controllerName}/run`, ids, false);
    }

    /**
     * 关闭
     */
    close(ids: string[]): Promise<ApiResult<any>> {
        return Http.post(`${this.controllerName}/close`, ids, false);
    }

    /**
     * 获取日志记录列表
     */
    getJobLoggers(id: string, page: number, size: number = 15): Promise<ApiResult<any>> {
        return Http.get(`${this.controllerName}/getJobLoggers/${id}/${page}/${size}`);
    }
}

export default new TimedTaskService();