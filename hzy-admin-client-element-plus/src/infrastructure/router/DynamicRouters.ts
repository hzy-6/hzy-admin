import { RouteMeta, RouteRecordRaw } from 'vue-router';
import AppStore from '@/infrastructure/store/AppStore';
import router from '@/infrastructure/router';
import AppConsts from '../scripts/AppConsts';

//导出所有的 vue 模块
let dynamicRouters: Array<RouteRecordRaw> = [];
let allRouters: Array<any> = [];
const modules = import.meta.glob(['../../views/**/**.vue', '../../infrastructure/components/**/**.vue']);
const dynamicLayoutName = "dynamicLayout";
const layout = () => import("@/infrastructure/components/layouts/Layout.vue");

/**
 * 生成动态路由
 * @param menuTreeList
 */
export function genDynamicRouters(menuTreeList: any[]): boolean {
    allRouters = [];
    dynamicRouters = [];

    const isdynamicLayout = router.hasRoute(dynamicLayoutName);
    if (isdynamicLayout) router.removeRoute(dynamicLayoutName);

    //主页 默认工作台
    dynamicRouters.push({
        path: AppConsts.defaultHomePageInfo.jumpUrl,
        name: AppConsts.defaultHomePageInfo.componentName,
        component: modules['../../' + AppConsts.defaultHomePageInfo.url],
        meta: { title: AppConsts.defaultHomePageInfo.name, close: AppConsts.defaultHomePageInfo.close, keepAlive: true, icon: AppConsts.defaultHomePageInfo.icon },
    })

    //动态路由
    createDynamicRouters(menuTreeList);

    router.addRoute({
        name: dynamicLayoutName,
        path: '/',
        component: layout,
        redirect: AppConsts.defaultHomePageInfo.jumpUrl,
        children: dynamicRouters
    });

    //将所有的路由信息记录到 全局状态 中
    var appStore = AppStore();
    appStore.state.allRouters = allRouters;
    appStore.state.userInfo.menus = menuTreeList;

    return isdynamicLayout;
}

/**
 * 创建动态路由
 * @param data
 */
function createDynamicRouters(data: any[]) {
    for (let i = 0; i < data.length; i++) {
        let item = data[i];
        let path = item.router ? item.router : (item.url ? item.url : '/NotFoundComponent');

        //如果是菜单类型
        if (item.type == 2) {
            var route: RouteRecordRaw = {
                path: path,
                name: item.componentName ? item.componentName : item.id,
                redirect: path && path === '/NotFoundComponent' ? '/NotFoundComponent' : undefined,
                meta: {
                    title: item.name,
                    keepAlive: item.keepAlive ?? true,
                    close: item.close,
                    show: item.show ?? true,
                    menuId: item.id,
                    parentId: item.parentId,
                    levelCode: item.levelCode,
                    jumpUrl: item.jumpUrl,
                    icon: item.icon
                } as RouteMeta,
            } as RouteRecordRaw;

            if (path && path === '/NotFoundComponent') {
                route.redirect = '/NotFoundComponent';
            } else {
                route.component = modules['../../' + item.url];
            }

            dynamicRouters.push(route);
            allRouters.push(route);

        } else {
            //只要有 children 则需要往下递归
            createDynamicRouters(item.children);
        }
    }
}
