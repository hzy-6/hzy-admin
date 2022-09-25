import { MenuItemModel } from "@/infrastructure/store/layouts/MenuStore";

/**
 * 程序常量
 */
export default class AppConsts {

    /**
     * token 键值
     */
    static tokenKey: string = "Authorization_HZY_ADMIN_SPA"

    /**
    * 后台服务api域名
    */
    static domainApi: string = process.env.NODE_ENV == "production" ? "" : "http://localhost:5600"

    /**
     * app 前缀 用于浏览器本地缓存 key 的前缀
     */
    static appPrefix: string = "HzyAdminElementPlus"

    /**
     * 用于请求头部授权码key名称
     */
    static authorizationKeyName: string = "Authorization"

    /**
     * 打包给目录的前缀
     * 生产环境默认：client 文件夹包起来
     * 开发环境默认：/
     */
    static packDirectoryPrefix: string = process.env.NODE_ENV == "production" ? "/client/" : "/";

    /**
     * 系统标题
     */
    static appTitle: string = "HzyAdmin 管理系统";

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

}
