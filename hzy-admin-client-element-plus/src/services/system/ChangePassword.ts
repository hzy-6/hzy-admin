import Http from '@/infrastructure/scripts/Http';

const controllerName = "admin/ChangePassword";

export default {
    /**
     * 保存表单
     *
     * @param {表单数据} form
     */
    saveForm(form) {
        return Http.post(`${controllerName}/saveForm`, form);
    }
};