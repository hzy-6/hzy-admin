import { defineStore } from "pinia"
import router from '@/router/index'
import { reactive, nextTick } from "vue";
import tools from "@/scripts/tools";
import userService from "@/service/system/userService";

/**
 * 
 * Pinia 参考：https://juejin.cn/post/7041867966970855431
 * 
 * 
 */
const useAppStore = defineStore("appStore", function () {
    var state = reactive({
        tabs: [{
            fullPath: "/home",
            path: "/home",
            name: "HomeIndexCom",
            meta: { title: '首页', close: false, keepAlive: true }
        }],
        //缓存视图 视图缓存只能通过组件名称来
        cacheViews: ["HomeIndexCom"],
        title: "hzy-admin-spa-ui",
        //全局加载动画
        loading: false,
        userInfo: {
            name: "超级管理员",
            menus: [],
            menuPowers: []
        },
        allRouters: [],
        submenus: [],
        topNav: tools.getTopNav(),
        //当前是否处于小屏幕
        isMobile: false,
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

    /**
     * 刷新
     * 
     * @param {*} fullPath 
     * @param {*} componentName 
     */
    function refresh(fullPath, componentName) {
        cacheViewMethods.delCacheView(componentName, () => {
            nextTick(() => {
                router.push("/redirect" + fullPath);
            });
        })
    }

    /**
     * 设置 TopNav
     * @param {*} value 
     */
    function setTopNav(value) {
        if (tools.getTopNav()) {
            state.topNav = value;
        }
    }

    /**
     * 保存 topnav 状态
     * @param {*} value 
     */
    function saveTopNavState(value) {
        state.topNav = value;
        tools.setTopNav(value);
    }

    /**
     *  根据当前路由菜单id 查找 最上级 id
     * @returns 
     */
    function getTopMenuIdByCurrentRoute() {
        let route = router.currentRoute.value;
        let levelCode = route.meta.levelCode;
        if (!levelCode) return;
        return parseInt(levelCode.indexOf('.') == -1 ? levelCode : levelCode.split('.')[0]);
    }

    /**
     * 根据 id 设置子菜单
     * @param {*} parentId 
     */
    function setSubmenu(parentId) {
        var menus = state.userInfo.menus.filter((w) => w.id == parentId);
        if (menus.length > 0) {
            state.submenus = menus[0].children;
        }
    }

    /**
     * 根据全路径信息获取 router 信息
     * @param {*} fullPath 
     * @returns 
     */
    function getRouterByFullPath(fullPath) {
        let result = state.allRouters.find(w => w.path == fullPath);
        if (!result) {
            result = state.tabs.find(w => w.path == fullPath);
        }
        return result;
    }

    /**
     * 设置用户信息
     * @param {*} userInfo 
     */
    function setUserInfo(userInfo) {
        state.userInfo = userInfo;
    }

    /**
     * 获取用户信息 与 菜单
     * 
     * @returns 
     */
    function getUserInfo() {
        return new Promise((resolve) => {
            if (state.userInfo.loadOver) {
                return resolve(state.userInfo);
            }
            refreshUserInfo().then((data) => {
                data.loadOver = true;
                resolve(data);
            });
        });
    }

    /**
     * 刷新用户信息
     * 
     * @returns 
     */
    function refreshUserInfo() {
        state.loading = true;
        return new Promise((resolve) => {
            userService
                .getUserInfo()
                .then((res) => {
                    let data = res.data;
                    setUserInfo(data);
                    state.loading = false;
                    resolve(data);
                })
                .catch(() => {
                    state.loading = false;
                });
        });
    }

    /**
     * 根据菜单id 获取权限信息
     * 
     * @param {*} menuId 
     * @returns 
     */
    function getPowerByMenuId(menuId) {
        const data = state.userInfo.menuPowers.find((w) => w.menuId == menuId);
        return data ? data : {};
    }

    /**
     * 重置信息
     */
    function resetInfo() {
        setUserInfo({
            name: "超级管理员",
            menus: [],
            menuPowers: []
        });
        state.tabs = [];
        cacheViewMethods.delCacheViewAll();
    }

    return {
        state,
        ...cacheViewMethods,
        addTab,
        closeTabSelf,
        closeTabOther,
        closeTabAll,
        tabClick,
        refresh,
        setTopNav,
        saveTopNavState,
        getTopMenuIdByCurrentRoute,
        setSubmenu,
        getRouterByFullPath,
        setUserInfo,
        resetInfo,
        //结合接口实现业务
        getUserInfo,
        refreshUserInfo,
        getPowerByMenuId,

    }
});

// // 对外部暴露一个 use 方法，该方法会导出我们定义的 state
// const useCounterStore = defineStore({
//     // 每个 store 的 id 必须唯一
//     id: 'counter',
//     // state 表示数据源
//     state: () => ({
//         count: 0
//     }),
//     // getters 类似于 computed，可对 state 的值进行二次计算
//     getters: {
//         double() {
//             // getter 中的 this 指向👉 state
//             return count * 2
//         },
//         // 如果使用箭头函数会导致 this 指向有问题
//         // 可以在函数的第一个参数中拿到 state
//         double: (state) => {
//             return state.count * 2
//         }
//     },
//     // actions 用来修改 state
//     actions: {
//         increment() {
//             // action 中的 this 指向👉 state
//             count++
//         },
//     }
// })

export default useAppStore