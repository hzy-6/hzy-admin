import Http from '@/infrastructure/scripts/Http';
import Tools, { EMessageType } from "@/infrastructure/scripts/Tools";
import ApiResult from '@/infrastructure/typings/ApiResult';

class PersonalCenterService {

    private controllerName: string = "admin/PersonalCenter";

    /**
     * 修改密码
     *
     * @param {表单数据} form
     */
    changePassword(form: any): Promise<ApiResult<any>> {
        return Http.post(`${this.controllerName}/changePassword`, form);
    }

    /**
     * 保存表单
     * 
     * @param {表单数据} vm 
     */
    saveForm(vm: any): Promise<ApiResult<any>> {
        return Http.post(`${this.controllerName}/saveForm`, vm);
    }
}

export default new PersonalCenterService()