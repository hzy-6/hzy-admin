import router from '@/router'
import { useAppStore } from '@/store';

// [{
//     path: '/system/role',
//     name: "system_role",
//     component: import('@/views/system/role'),
//     meta: {title: '角色管理', close: true, keepAlive: true, menuId: '60ae9382-31ab-4276-a379-d3876e9bb783'},
// }]

//导出所有的 vue 模块
let dynamicRouters = [];
let allRouters = [];
const modules = import.meta.glob('../**.vue');
const dynamicLayoutName = "dynamicLayout";

/**
 * 创建动态路由
 * @param data
 */
function createDynamicRouters(data) {
    for (let i = 0; i < data.length; i++) {
        let item = data[i];
        let path = item.router ? item.router : (item.url ? item.url : '/NotFoundComponent');

        //如果是菜单类型
        if (item.type == 2) {
            var route = {
                path: path,
                name: item.componentName ? item.componentName : item.id,
                meta: {
                    title: item.name,
                    close: item.close,
                    show: item.show,
                    keepAlive: item.keepAlive,
                    menuId: item.id,
                    parentId: item.parentId,
                    jumpUrl: item.jumpUrl,
                    levelCode: item.levelCode,
                },
            };

            if (path && path === '/NotFoundComponent') {
                route.redirect = '/NotFoundComponent';
            } else {
                route.component = modules['../' + item.url];
            }

            dynamicRouters.push(route);
            allRouters.push(route);
        }

        //只要有 children 则需要往下递归
        createDynamicRouters(item.children);

    }
}

/**
 * 获取动态路由
 * @param data
 */
export function getDynamicRouters(data) {
    allRouters = []
    createDynamicRouters(data);
    let hasRouteLayout = router.hasRoute("dynamicLayout");
    if (hasRouteLayout) router.removeRoute("dynamicLayout");
    router.addRoute({
        name: 'dynamicLayout',
        path: '',
        redirect: '/home',
        component: () =>
            import('@/components/layout/Layout.vue'),
        children: dynamicRouters
    });
    //将所有的路由信息记录到 全局状态 中
    var appStore = useAppStore();
    appStore.state.allRouters = allRouters;

    return hasRouteLayout;
}


/**
 * 是否有动态路由节点存在
 * 
 * @returns 
 */
export function hasRoute() {
    return router.hasRoute(dynamicLayoutName);
}

/**
 * 移除动态路由节点
 */
export function removeRoute() {
    router.removeRoute(dynamicLayoutName);
}