import { createRouter, createWebHashHistory } from 'vue-router';
import 'nprogress/nprogress.css';
import defaultRouters from '@/router/defaultRouters';
import { getDynamicRouters } from '@/router/dynamicRouters';
import tools from '@/scripts/tools';
//菜单数据
// import menuTreeList from "@/mock/menuData"
import { useAppStore } from "@/store"

const routerHistory = createWebHashHistory();

let router = createRouter({
    history: routerHistory,
    routes: defaultRouters,
    scrollBehavior: () => ({ top: 0 }),//to, from, savedPosition
});

//监听路由
router.beforeEach((to, from, next) => {
    // console.log('路由拦截器=>', from, to);
    tools.loadingStart();
    let loginPath = "/login";
    let noPowerMessage = "界面显示权限不足！请配置菜单显示权限.";

    if (to.fullPath === loginPath) {
        return next();
    }

    if (!tools.getAuthorization()) {
        return next(loginPath);
    }

    var appStore = useAppStore();
    //路由和用户信息 处理
    appStore.getUserInfo().then(data => {
        //创建动态路由
        let hasRouteLayout = getDynamicRouters(data.menus);
        appStore.state.userInfo.menus = data.menus;
        if (hasRouteLayout) {
            if (getAuthority(data, to)) {
                next()
            } else {
                tools.notice(noPowerMessage, "错误");
                next(from.fullPath);
            }
        } else {
            next(to.fullPath)
        }
    });

    //默认 动态加载路由
    // let hasRouteLayout = getDynamicRouters(menuTreeList);
    // if (!hasRouteLayout) {
    //     var store = useAppStore();
    //     store.state.userInfo.menus = menuTreeList;
    //     //如果初次add路由需要一下代码重新加载
    //     next(to.fullPath);
    //     // console.log(hasRouteLayout, router.getRoutes());
    // } else {
    //     next();
    // }
});

router.afterEach(() => {
    tools.loadingStop();
});

/**
 * 获取权限
 */
function getAuthority(data, to) {
    let menuId = to.meta.menuId;
    if (!menuId) return true;
    if (!data.menuPowers) return true;
    let power = data.menuPowers.find(w => w.menuId == menuId);
    if (!power) return true;
    // console.log('getAuthority=>', data, 'menuid=>', menuId, 'userId=>', userId, power.display);
    //检查页面是否有 display 权限
    return power.display;
}

export default router;