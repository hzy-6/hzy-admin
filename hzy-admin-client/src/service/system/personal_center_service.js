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
    saveForm(form) {
        return post(`${controllerName}/saveForm`, form);
    }
};