import Http from "@/core/utils/Http";

/**
 * 登录服务
 */
export default class LoginService {

    /**
     * 登录
     * @param userName 
     * @param userPassword 
     * @returns 
     */
    static login(userName: string, userPassword: string) {
        return Http.post('/api/account/check', {
            userName,
            userPassword
        });
    }

}
