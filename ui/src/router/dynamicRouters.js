import router from '@/router/index.js'
import useAppStore from '@/store';

let dynamicRouters = [];
let allRouters = [];
// [{
//     path: '/system/role',
//     name: "system_role",
//     component: import('@/views/system/role'),
//     meta: {title: '角色管理', close: true, keepAlive: true, menuId: '60ae9382-31ab-4276-a379-d3876e9bb783'},
// }]

//导出所有的 vue 模块
const modules = import.meta.glob('../**.vue');

/**
 * 创建动态路由
 * @param data
 */
function createDynamicRouters(data) {
    for (let i = 0; i < data.length; i++) {
        let item = data[i];
        let path = item.router ? item.router : (item.url ? item.url : '/NotFoundComponent');
        if (item.children.length > 0) {
            createDynamicRouters(item.children);
        } else {
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
    }
}

/**
 * 获取动态路由
 * @param data
 */
export default function getDynamicRouters(data) {
    allRouters = []
    createDynamicRouters(data);
    let hasRouteLayout = router.hasRoute("dynamicLayout");
    if (!hasRouteLayout) {
        router.addRoute({
            name: 'dynamicLayout',
            path: '',
            redirect: '/home',
            component: () =>
                import('@/components/layout/Layout.vue'),
            children: dynamicRouters
        });
    }

    //将所有的路由信息记录到 全局状态 中
    var appStore = useAppStore();
    appStore.state.allRouters = allRouters;

    return hasRouteLayout;
}