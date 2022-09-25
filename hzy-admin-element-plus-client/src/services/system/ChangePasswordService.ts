import Http from '@/infrastructure/scripts/Http';
import { ApiResult } from '@/infrastructure/typings/ApiResult';

class ChangePasswordService {

    private controllerName: string = "admin/ChangePassword";

    /**
        * 保存表单
        *
        * @param {表单数据} form
        */
    saveForm(form: any): Promise<ApiResult<any>> {
        return Http.post(`${this.controllerName}/saveForm`, form);
    }
}

export default new ChangePasswordService()