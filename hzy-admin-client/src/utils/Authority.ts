// import { App } from "vue";
import { RouteMeta } from "vue-router";
import router from "../core/router";
import AppStore from "../core/store/AppStore";

/**
 * 根据路由 meta 获取权限
 * @param data 
 * @param meta 
 * @returns 
 */
export function getAuthorityByRouteMeta(data: any, meta: RouteMeta): boolean {
    let menuId = meta.menuId;
    if (!menuId) return true;
    if (!data.menuPowers) return true;
    let power = data.menuPowers.find((w: any) => w.menuId == menuId);
    if (!power) return true;
    // console.log('getAuthority=>', data, 'menuid=>', menuId, 'userId=>', userId, power.display);
    //检查页面是否有 display 权限
    return power.display;
}

/**
 * 获取使用权限
 * @returns 
 */
export function useAuthority() {
    if (!router.currentRoute.value.meta.menuId) {
        return console.error("useAuthority() 找不到当前路由的菜单 id !");
    }
    return useAuthorityByMenuId(router.currentRoute.value.meta.menuId!)
}

/**
 * 根据菜单 id 获取使用权限
 * @returns 
 */
export function useAuthorityByMenuId(menuId: number) {
    const appStore = AppStore();
    return appStore.getAuthorityByMenuId(menuId);
}

/**
 * 获取当前用户所有信息
 * @returns 
 */
export async function useCurrentUser() {
    const appStore = AppStore();
    return await appStore.getUserInfo();
}

// /**
// * 使用指令 v-power 控制按钮级别权限
// * @param app
// */
// export function registerAuthorityDirective(app: App<Element>) {
//     // 注册一个全局自定义指令 `v-power`
//     app.directive('power', {
//         // 当被绑定的元素挂载到 DOM 中时……
//         mounted(el: Element, data) {
//             if (data.value.indexOf('.') < 0) {
//                 return console.error("v-power 语法错误. v-power='你的功能' v-power='delete' ! ");
//             }
//             const strArray = data.value.split('.');
//             const menuId = strArray[0];
//             const _function = strArray[1];
//             const appStore = AppStore();
//             var powers = appStore.getAuthorityByMenuId(menuId);
//             console.log('按钮权限>', powers, menuId, _function);
//             if (!powers[_function]) {
//                 el.remove();
//             }
//         }
//     })
// }
