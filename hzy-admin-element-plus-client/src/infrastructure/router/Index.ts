import { createRouter, createWebHashHistory, Router, useRouter as appRouter, useRoute as appRoute } from 'vue-router'
import defaultRouters from '@/infrastructure/router/DefaultRouters';
import { genDynamicRouters } from '@/infrastructure/router/DynamicRouters';
import Tools, { EMessageType } from '@/infrastructure/scripts/Tools';
//菜单数据
// import menuTreeList from "@/infrastructure/mock/MenuData";
import AppConsts from '../scripts/AppConsts';
import AppStore from '../store/AppStore';

const router = createRouter({
  history: createWebHashHistory(),
  routes: defaultRouters,
  scrollBehavior: () => ({ top: 0 }),//to, from, savedPosition
});

//监听路由
router.beforeEach((to, from, next) => {
  console.log('路由拦截器=>', to, from);
  Tools.loadingStart();

  if (Tools.checkPageWhiteList(to.fullPath)) {
    return next();
  }

  if (!Tools.getAuthorization()) {
    return next(AppConsts.loginPath);
  }

  //动态路由，和权限验证
  const appStore = AppStore();
  appStore.getUserInfo().then(data => {
    //创建动态路由
    let hasRouteLayout = genDynamicRouters(data.menus);

    appStore.state.userInfo.menus = data.menus;
    if (hasRouteLayout) {
      if (Tools.getAuthority(data, to.meta)) {
        next()
      } else {
        Tools.notice(AppConsts.noPowerMessage, EMessageType.错误);
        next(from.fullPath);
      }
    } else {
      next(to.fullPath);
    }
  });
});

router.afterEach(() => {
  Tools.loadingStop();
});

export default router;

/**
 * 注册路由
 * @returns 
 */
export function registerRouter(): Router {
  return router;
}

/**
 * 使用路由
 * @returns 
 */
export function useRouter() {
  return appRouter();
}

/**
 * 使用路由
 * @returns 
 */
export function useRoute() {
  return appRoute();
}
