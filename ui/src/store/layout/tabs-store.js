import { defineStore } from "pinia";
import { reactive } from "vue";
import router from "@/router";

const layoutStore = defineStore("tabs-store", () => {

    //定义状态
    let state = reactive({
        height: 41,
        bgColor: '#ffffff',
        activeBgColor: '#f0f2f5',
        activeTextColor: '#409eff',
        tabs: [{
            fullPath: "/home",
            path: "/home",
            name: "HomeIndexCom",
            meta: { title: '首页', close: false, keepAlive: true }
        }],
        //缓存视图 视图缓存只能通过组件名称来
        cacheViews: ["HomeIndexCom"],
    });

    /**
     * 缓存处理函数
     */
    var cacheViewMethods = {
        /**
         * 添加缓存视图
         * @param {*} routeInfo 
         * @returns 
         */
        addCacheView(routeInfo) {
            const { name, meta } = routeInfo;
            if (!meta.keepAlive) return;
            let any = state.cacheViews.includes(name);
            if (any) return;
            state.cacheViews.push(name);
        },

        /**
         * 删除缓存视图
         * @param {*} name
         * @param {*} call 
         */
        delCacheView(name, call) {
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
        delCacheViewOther(name) {
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
     * @param {*} route 
     * @returns 
     */
    function addTab(routeInfo) {
        if (Object.prototype.hasOwnProperty.call(routeInfo, 'hidden')) return;

        const { hidden, meta, fullPath } = routeInfo;

        if (hidden) return;
        
        if (!Object.prototype.hasOwnProperty.call(meta, 'close')) return;

        //检查是否存在
        let tab = state.tabs.find(w => w.fullPath == fullPath);
        if (!tab) {
            state.tabs.push({
                fullPath: routeInfo.fullPath,
                path: routeInfo.path,
                name: routeInfo.name,
                meta: {
                    title: routeInfo.meta.title,
                    close: routeInfo.meta.close,
                    keepAlive: routeInfo.meta.keepAlive
                }
            });
        }

        cacheViewMethods.addCacheView(routeInfo);
    }

    /**
     * 关闭当前
     * @param {*} fullPath 
     * @returns 
     */
    function closeTabSelf(fullPath) {
        let index = state.tabs.findIndex(w => w.fullPath == fullPath);
        let oldTab = state.tabs[index];
        if (oldTab.meta.close) {
            state.tabs.splice(index, 1);
            cacheViewMethods.delCacheView(oldTab.name, null);
        }
        let tab = state.tabs[index - 1];
        if (!tab) return;
        router.push(tab.fullPath);
    }

    /**
     * 关闭其他
     * @param {*} fullPath 
     */
    function closeTabOther(fullPath) {
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

        cacheViewMethods.delCacheViewOther(route.name);
        state.tabs = list;
    }

    /**
     * 关闭所有
     */
    function closeTabAll() {
        let tab = state.tabs.find(w => !w.meta.close);
        let route = router.currentRoute.value;

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
    function tabClick(fullPath) {
        router.push(fullPath);
    }


    return {
        state,
        ...cacheViewMethods,
        addTab,
        closeTabSelf,
        closeTabOther,
        closeTabAll,
        tabClick,
    }

});


export default layoutStore;