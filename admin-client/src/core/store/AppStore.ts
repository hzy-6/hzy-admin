import { defineStore } from "pinia";
import { reactive } from "vue";
import router from "@/core/router";
import TabsStore, { ITabsItem } from "./layouts/TabsStore";
import AppConsts from "@/utils/AppConsts";
import { MenuItemModel } from "@/core/store/layouts/MenuStore";
import { RouteRecordRaw } from "vue-router";
import SysUserService from "@/services/system/SysUserService";

interface IDefaultUserInfo {
  name: string;
  menus: MenuItemModel[];
  menuPowers: any[];
  //
  loadOver: boolean;
}

interface IState {
  // 所有路由集合
  allRouters: RouteRecordRaw[];
  //用户信息
  userInfo: IDefaultUserInfo;
  //一级大菜单集合
  oneLevels: any[];
  //一级一下菜单集合
  subMenus: any[];
  //全局加载状态
  loading: boolean;
  //系统标题
  title: string;
}

/**
 * 默认用户信息
 */
export class DefaultUserInfo {
  name: string = "超级管理员";
  menus: any[] = [];
  menuPowers: any = [];
  loadOver: boolean = false;
}

export default defineStore("AppStore", () => {
  const tabsStore = TabsStore();

  const defaultUserInfo = new DefaultUserInfo();

  //定义状态
  let state = reactive<IState>({
    allRouters: [],
    userInfo: defaultUserInfo,
    //一级大菜单集合
    oneLevels: [],
    //一级一下菜单集合
    subMenus: [],
    //全局加载状态
    loading: false,
    //系统标题
    title: AppConsts.appTitle,
  });

  /**
   * 创建一级菜单
   */
  function createOneLevelMenu() {
    state.oneLevels = state.userInfo.menus.filter((w: any) => w.parentId == null || w.parentId == "");
  }

  /**
   *  根据当前路由菜单id 查找 最上级 id
   * @returns
   */
  function getTopMenuIdByCurrentRoute(): number {
    let route = router.currentRoute.value;
    let levelCode = route.meta.levelCode as string;
    if (!levelCode) return 0;
    return parseInt(levelCode.indexOf(".") == -1 ? levelCode : levelCode.split(".")[0]);
  }

  /**
   * 根据 id 设置子菜单
   * @param {*} parentId
   */
  function setSubmenu(parentId: string) {
    const subMenus = state.userInfo.menus.filter((w) => w.parentId == (parentId as any));
    if (subMenus) {
      state.subMenus = subMenus;
    }
    return subMenus;
  }

  /**
   * 根据全路径信息获取 router 信息
   * @param {*} fullPath
   * @returns
   */
  function getRouterByFullPath(fullPath: string): ITabsItem {
    let result = state.allRouters.find((w) => w.path == fullPath);
    if (result) {
      return result as any as ITabsItem;
    }
    return tabsStore.state.tabs.find((w: any) => w.path == fullPath) as ITabsItem;
  }

  /**
   * 设置用户信息
   * @param {*} userInfo
   */
  function setUserInfo(userInfo: IDefaultUserInfo) {
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
      refreshUserInfo().then((data: any) => {
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
  async function refreshUserInfo() {
    state.loading = true;
    const result = await SysUserService.currentUser();
    state.loading = false;
    setUserInfo(result.data);
    return new Promise((resolve) => {
      resolve(result.data);
    });
  }

  /**
   * 根据菜单id 获取权限信息
   *
   * @param {*} menuId
   * @returns
   */
  function getAuthorityByMenuId(menuId: number) {
    const data = state.userInfo.menuPowers.find((w) => w.menuId == menuId);
    return data ? data : {};
  }

  /**
   * 重置信息
   */
  function resetInfo() {
    setUserInfo(defaultUserInfo);
    tabsStore.state.tabs = [];
    tabsStore.delCacheViewAll();
  }

  /**
   * 设置全局加载
   * @param loading
   */
  function setLoading(loading: boolean) {
    state.loading = loading;
  }

  return {
    state,
    setLoading,
    createOneLevelMenu,
    getTopMenuIdByCurrentRoute,
    setSubmenu,
    getRouterByFullPath,
    setUserInfo,
    getUserInfo,
    refreshUserInfo,
    getAuthorityByMenuId,
    resetInfo,
  };
});
