import { defineStore } from "pinia";
import { computed, reactive, watch } from "vue";
import router from "@/core/router";
import { RouteLocationNormalizedLoaded } from "vue-router";
import AppConsts from "@/utils/AppConsts";
import AppStore from "../AppStore";

export interface ITabsItem extends RouteLocationNormalizedLoaded {

}

interface IState {
    height: number
    bgColor: string
    activeBgColor: string
    activeTextColor: string
    tabs: ITabsItem[],
    cacheViews: string[]
    //选项卡激活 key
    activeKey: string
}

export default defineStore("TabsStore", () => {

    const appStore = AppStore();
    //定义状态
    let state = reactive<IState>({
        height: 41,
        bgColor: '#ffffff',
        activeBgColor: '#f0f2f5',
        activeTextColor: '#409eff',
        tabs: [{
            fullPath: AppConsts.defaultHomePageInfo.jumpUrl,
            path: AppConsts.defaultHomePageInfo.jumpUrl,
            name: AppConsts.defaultHomePageInfo.componentName,
            meta: {
                title: AppConsts.defaultHomePageInfo.name,
                close: AppConsts.defaultHomePageInfo.close,
                keepAlive: true,
                icon: AppConsts.defaultHomePageInfo.icon,
                mode: 1
            },
        } as ITabsItem],
        //缓存视图 视图缓存只能通过组件名称来
        cacheViews: [AppConsts.defaultHomePageInfo.componentName!],
        activeKey: router.currentRoute.value.fullPath
    });

    //当前模式
    const currentMode = computed(() => state.tabs.find(w => w.fullPath == state.activeKey)?.meta.mode ?? 1);

    watch(
        () => router.currentRoute.value.fullPath,
        (value) => {
            state.activeKey = value;
        }
    );

    /**
     * 缓存处理函数
     */
    var cacheViewMethods = {
        /**
         * 添加缓存视图
         * @param {*} routeInfo 
         * @returns 
         */
        addCacheView(routeInfo: ITabsItem) {
            const { name, meta } = routeInfo;
            if (!meta.keepAlive) return;
            let any = state.cacheViews.includes(name as string);
            if (any) return;
            state.cacheViews.push(name as string);
        },

        /**
         * 删除缓存视图
         * @param {*} name
         * @param {*} call 
         */
        delCacheView(name: string, call: (() => void) | null) {
            const index = state.cacheViews.indexOf(name);
            if (index > -1) {
                state.cacheViews.splice(index, 1);
            }
            if (call) call();
        },

        /**
         * 删除其他缓存视图
         * @param {*} name 
         */
        delCacheViewOther(name: string) {
            const index = state.cacheViews.indexOf(name)
            if (index > -1) {
                state.cacheViews = state.cacheViews.slice(index, index + 1)
            } else {
                state.cacheViews = [];
            }
        },

        /**
         * 删除所有缓存视图
         */
        delCacheViewAll() {
            state.cacheViews = [];
        },
    };

    /**
     * 添加标签页
     * @param {*} routeInfo 
     * @returns 
     */
    function addTab(routeInfo: RouteLocationNormalizedLoaded) {
        const { meta, fullPath } = routeInfo;

        if (!Object.prototype.hasOwnProperty.call(meta, 'close')) return;
        const { keepAlive } = meta;
        if (keepAlive == null) return;

        //检查是否存在
        let tab = state.tabs.find(w => w.fullPath == fullPath);
        const menuItem = appStore.state.userInfo.menus.find(w => w.id == routeInfo.meta.menuId);
        const tabsItem = routeInfo as ITabsItem;
        tabsItem.meta.mode = menuItem?.mode ?? 1;

        if (!tab) {
            state.tabs.push(tabsItem);
        }

        cacheViewMethods.addCacheView(tabsItem);
    }

    /**
     * 关闭当前
     * @param {*} fullPath 
     * @returns 
     */
    function closeTabSelf(fullPath: string) {
        let index = state.tabs.findIndex(w => w.fullPath == fullPath);
        let oldTab = state.tabs[index];
        if (oldTab.meta.close) {
            state.tabs.splice(index, 1);
            cacheViewMethods.delCacheView(oldTab.name as string, null);
        }
        let tab = state.tabs[index - 1];
        if (!tab) return;
        router.push(tab.fullPath);
    }

    /**
     * 关闭其他
     * @param {*} fullPath 
     */
    function closeTabOther(fullPath: string) {
        var list = [];
        for (let i = 0; i < state.tabs.length; i++) {
            let item = state.tabs[i];
            if (!item.meta.close || item.fullPath == fullPath) {
                list.push(item);
            }
        }

        let route = router.currentRoute.value;
        if (fullPath != route.fullPath) {
            return router.push(fullPath);
        }

        if (route.name) {
            cacheViewMethods.delCacheViewOther(route.name.toString());
        }

        state.tabs = list;
    }

    /**
     * 关闭所有
     */
    function closeTabAll(): void {
        let tab = state.tabs.find(w => !w.meta.close);
        let route = router.currentRoute.value;

        if (!tab) return;

        if (tab.fullPath != route.fullPath) {
            router.push(tab.fullPath);
        }

        state.tabs = [];
        state.tabs.push(tab);

        cacheViewMethods.delCacheViewAll();
    }

    /**
     * 点击切换选项卡
     * @param {*} fullPath 
     */
    function tabClick(fullPath: string) {
        router.push(fullPath);
    }

    return {
        state,
        currentMode,
        ...cacheViewMethods,
        addTab,
        closeTabSelf,
        closeTabOther,
        closeTabAll,
        tabClick
    }

});
