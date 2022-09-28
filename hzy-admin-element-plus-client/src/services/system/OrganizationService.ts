import Http from '@/infrastructure/scripts/Http';
import Tools, { EMessageType } from "@/infrastructure/scripts/Tools";
import ApiResult from '@/infrastructure/typings/ApiResult';

class OrganizationService {

    private controllerName: string = "admin/SysOrganization";

    /**
     * 查询列表
     * 
     */
    findList(search = {}): Promise<ApiResult<any>> {
        return Http.post(`${this.controllerName}/findList/`, search, false);
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
    findForm(id: string | null, parentId: string): Promise<ApiResult<any>> {
        return Http.get(`${this.controllerName}/findForm/${(id ? id : Tools.guidEmpty)}/${(parentId ? parentId : '')}`);
    }

    /**
     * 保存表单
     * 
     * @param {表单数据} vm 
     */
    saveForm(vm: { form: any, id: string }): Promise<ApiResult<any>> {
        if (vm.id) {
            return Http.post(`${this.controllerName}/update`, vm.form);
        }
        return Http.post(`${this.controllerName}/create`, vm.form);
    }

    /**
     * 导出 excel
     * @param {*} search 
     */
    exportExcel(search: any): Promise<ApiResult<any>> {
        return Http.download(`${this.controllerName}/exportExcel`, search);
    }

    /**
     * sysOrganizationTree
     */
    sysOrganizationTree(): Promise<ApiResult<any>> {
        return Http.post(`${this.controllerName}/sysOrganizationTree`);
    }
}

export default new OrganizationService()