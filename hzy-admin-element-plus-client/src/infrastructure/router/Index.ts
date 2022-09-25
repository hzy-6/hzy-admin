import { createRouter, createWebHashHistory, Router, useRouter as appRouter, useRoute as appRoute } from 'vue-router'
import defaultRouters from '@/infrastructure/router/DefaultRouters';
import { genDynamicRouters } from '@/infrastructure/router/DynamicRouters';
import Tools from '@/infrastructure/scripts/Tools';
//菜单数据
import menuTreeList from "@/infrastructure/mock/MenuData";

const router = createRouter({
  history: createWebHashHistory(),
  routes: defaultRouters,
  scrollBehavior: () => ({ top: 0 }),//to, from, savedPosition
});

//监听路由
router.beforeEach((to, from, next) => {
  console.log('路由拦截器=>', to, from);
  Tools.loadingStart();

  // if (to.fullPath === "/login") {
  //   return next();
  // }

  //动态路由
  var hasRoute = genDynamicRouters(menuTreeList);
  if (!hasRoute) {
    //
    console.log('router-cmd', router.getRoutes(), router.options.routes, to.fullPath);
    //如果初次add路由需要一下代码重新加载
    return next(to.fullPath);
  }

  next();
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
