import { MenuItemModel } from "../core/store/layouts/MenuStore"


// 域名
const domainName = window.location.origin;


/**
 * 程序常量
 */
class AppConsts {

    /**
     * token 键值
     */
    static tokenKey: string = "Authorization_HZY_ADMIN_SPA"

    /**
    * Guid Empty String
    */
    static guidEmpty: string = '00000000-0000-0000-0000-000000000000'

    /**
    * 后台服务api域名
    */
    static domainServerApi: string = process.env.NODE_ENV == "production" ? "" : "http://localhost:5600"

    /**
     * app 前缀 用于浏览器本地缓存 key 的前缀
     */
    static appPrefix: string = `HzyAdminAntdVue-${domainName}`

    /**
     * 用于请求头部授权码key名称
     */
    static authorizationKeyName: string = "Authorization"

    /**
     * 系统标题
     */
    static appTitle: string = "HzyAdmin";

    /**
     * 默认首页标签页信息配置
     */
    static defaultHomePageInfo: MenuItemModel = {
        id: 0,
        name: "工作台",
        componentName: "HomeIndexCom",
        url: "views/home/Index.vue",
        router: "/home",
        jumpUrl: "/home",
        icon: "HomeFilled",
        close: false,
        parentId: null,
        type: 2,
        mode: 1,
        levelCode: null,
        children: [],
    };

    /**
     * 登录地址
     */
    static loginPath: string = "/login";

    /**
     * 页面白名单地址 不受登录限制
     */
    static pageWhiteList: string[] = [AppConsts.loginPath];

    /**
     * 无查看权限提示信息
     */
    static noPowerMessage: string = "界面显示权限不足！请配置菜单显示权限.";

    /**
     * 模块 视图模块 和 组件模块
     */
    static modules = import.meta.glob(['../views/**/**.vue', '../core/components/**/**.vue', '../views/**/**.tsx', '../core/components/**/**.tsx']);

    /**
     * 菜单配置项
     */
    static menu = {
        /**
         * pc 模式 菜单最小宽度
         */
        minWidth: 50,
        /**
         * 菜单最大宽度
         */
        maxWidth: 200,
        /**
         * 左侧模式一级菜单宽度
         */
        leftModeWidth: 50,
    }

}

export default AppConsts;