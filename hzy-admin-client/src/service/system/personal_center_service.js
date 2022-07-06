import { post } from '@/scripts/request';

const controllerName = "admin/PersonalCenter";

export default {
    /**
     * 修改密码
     *
     * @param {表单数据} form
     */
    changePassword(form) {
        return post(`${controllerName}/changePassword`, form);
    },
    /**
     * 保存表单
     * 
     * @param {表单数据} vm 
     */
    saveForm(vm) {
        return post(`${controllerName}/saveForm`, vm);
    },
};