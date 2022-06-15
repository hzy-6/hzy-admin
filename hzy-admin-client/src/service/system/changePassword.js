import { post } from '@/scripts/request';

const controllerName = "admin/ChangePassword";

export default {
    /**
     * 保存表单
     *
     * @param {表单数据} form
     */
    saveForm(form) {
        return post(`${controllerName}/saveForm`, form);
    }
};