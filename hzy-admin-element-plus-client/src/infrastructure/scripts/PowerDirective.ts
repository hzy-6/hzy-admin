import { App } from "vue";
import router from "../router";
import AppStore from "../store/AppStore";

/**
 * 权限指令处理
 */
class PowerDirective {

    /**
     * 使用指令 v-power 控制按钮级别权限
     * @param app 
     */
    usePowerDirective(app: App<Element>) {

        // 注册一个全局自定义指令 `v-power`
        app.directive('power', {
            // 当被绑定的元素挂载到 DOM 中时……
            mounted(el: Element, data) {
                if (data.value.indexOf(':') < 0) {
                    return console.error("v-power 语法错误. v-power='你的菜单id:你的功能' v-power='1:delete' !");
                }
                const strArray = data.value.split(':');
                const menuId = strArray[0];
                const _function = strArray[1];
                const appStore = AppStore();
                var powers = appStore.getPowerByMenuId(menuId);
                console.log('按钮权限>', powers, menuId, _function);
                if (!powers[_function]) {
                    el.remove();
                }
            }
        })

    }

    /**
     * 通过获取权限
     * @param menuId 
     * @returns 
     */
    getPowerByMenuId(menuId: string) {
        const appStore = AppStore();
        return appStore.getPowerByMenuId(menuId);
    }

    /**
     * 通过当前路由的菜单id 获取权限
     * @returns 
     */
    getPowerByCurrentRouteMenuId() {
        return this.getPowerByMenuId(router.currentRoute.value.meta.menuId!);
    }

}

export default new PowerDirective();