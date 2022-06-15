/**
 * 程序常量
 */
const appConsts = {
    /**
     * token 键值
     */
    tokenKey: "Authorization_HZY_ADMIN_SPA",
    /**
     * 域名
     */
    domainName: process.env.NODE_ENV == "production" ? "" : "http://localhost:5600",
    /**
     * Guid Empty String
     */
    guidEmpty: '00000000-0000-0000-0000-000000000000',
    /**
     * app 前缀 用于浏览器本地缓存 key 的前缀
     */
    appPrefix: "HzyAdminAntdVue",
    /**
     * 用于请求头部授权码key名称
     */
    authorizationKeyName: "Authorization",
};

export default appConsts;