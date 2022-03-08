import { get, post } from '@/scripts/request';
import tools from "@/scripts/tools";

const controllerName = "admin/QuartzTasks";

export default {
    /**
     * 查询列表
     *
     * @param {一页显示多少行} rows
     * @param {当前页码} page
     */
    findList(filter) {
        return post(`${controllerName}/findList/${(filter ? filter : '')}`, null, false);
    },
    /**
     * 删除数据
     *
     * @param {要删除的id 数组} ids
     */
    deleteList(ids) {
        console.log(ids);
        if (ids && ids.length === 0) {
            return tools.message("请选择要删除的数据!", "警告");
        }
        return post(`${controllerName}/deleteList`, ids, false);
    },
    /**
     * 获取表单数据
     *
     * @param {*} id
     */
    findForm(id) {
        return get(`${controllerName}/findForm${(id ? '/' + id : '')}`);
    },
    /**
     * 保存表单
     *
     * @param {表单数据} form
     */
    saveForm(form) {
        return post(`${controllerName}/saveForm`, form);
    },
    /**
     * 运行
     */
    run(ids) {
        return post(`${controllerName}/run`, ids, false);
    },
    /**
     * 关闭
     */
    close(ids) {
        return post(`${controllerName}/close`, ids, false);
    },
    /**
     * 获取日志记录列表
     */
    getJobLoggers(id, page, size = 15) {
        return get(`${controllerName}/getJobLoggers/${id}/${page}/${size}`);
    }
};