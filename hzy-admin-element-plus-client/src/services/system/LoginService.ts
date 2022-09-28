import Http from '@/infrastructure/scripts/Http';
import Tools, { EMessageType } from "@/infrastructure/scripts/Tools";
import ApiResult from '@/infrastructure/typings/ApiResult';

class LoginService {

    /**
     * 登录账户
     * 
     * @param {*} userName 
     * @param {*} userPassword 
     */
    login(userName: string, userPassword: string): Promise<ApiResult<any>> | undefined {
        if (!userName) {
            Tools.message("用户名不能为空!", EMessageType.警告);
            return;
        }

        if (!userPassword) {
            Tools.message("密码不能为空!", EMessageType.警告);
            return;
        }

        return Http.post('account/check', {
            userName,
            userPassword
        });
    }
}

export default new LoginService()