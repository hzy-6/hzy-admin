import Http from '@/infrastructure/scripts/Http';
import Tools, { EMessageType } from "@/infrastructure/scripts/Tools";

const controllerName = "admin/PersonalCenter";

export default {
    /**
     * 修改密码
     *
     * @param {表单数据} form
     */
    changePassword(form) {
        return Http.post(`${controllerName}/changePassword`, form);
    },
    /**
     * 保存表单
     * 
     * @param {表单数据} vm 
     */
    saveForm(vm) {
        return Http.post(`${controllerName}/saveForm`, vm);
    },
};