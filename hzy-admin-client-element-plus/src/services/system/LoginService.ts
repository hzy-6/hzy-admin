import Http from '@/infrastructure/scripts/Http';
import Tools, { EMessageType } from "@/infrastructure/scripts/Tools";

class LoginService {

    /**
     * 登录账户
     * 
     * @param {*} userName 
     * @param {*} userPassword 
     */
    login(userName, userPassword) {
        if (!userName) {
            return Tools.message("用户名不能为空!", EMessageType.警告);
        }

        if (!userPassword) {
            return Tools.message("密码不能为空!", EMessageType.警告);
        }

        return Http.post('account/check', {
            userName,
            userPassword
        });
    }
}

export default new LoginService()