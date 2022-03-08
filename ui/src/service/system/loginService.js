import { post } from '@/scripts/request';
import tools from "@/scripts/tools";

export default {
    /**
     * 登录账户
     * 
     * @param {*} userName 
     * @param {*} userPassword 
     */
    login(userName, userPassword) {
        if (!userName) {
            return tools.message("用户名不能为空!", "警告");
        }

        if (!userPassword) {
            return tools.message("密码不能为空!", "警告");
        }

        return post('account/check', {
            userName,
            userPassword
        });
    }
}