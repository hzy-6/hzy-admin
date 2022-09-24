import Http from '@/infrastructure/scripts/Http';

class ChangePasswordService {

    private controllerName: string = "admin/ChangePassword";

    /**
        * 保存表单
        *
        * @param {表单数据} form
        */
    saveForm(form) {
        return Http.post(`${this.controllerName}/saveForm`, form);
    }
}

export default new ChangePasswordService()