import layoutStore from "@/store/layout/layout-store";
import menuStore from "@/store/layout/menu-store";
import headerStore from "@/store/layout/header-store";
import tabsStore from "@/store/layout/tabs-store";
import settingsStore from "@/store/layout/settings-store";
import appStore from "@/store/app-store";


/**
 * 导出 layoutStore 对象
 */
export function useLayoutStore() {
    return layoutStore();
}

/**
 * 导出 menuStore 对象
 */
export function useMenuStore() {
    return menuStore();
}

/**
 * 导出 headerStore 对象
 */
export function useHeaderStore() {
    return headerStore();
}

/**
 * 导出 tabsStore 对象
 * @returns 
 */
export function useTabsStore() {
    return tabsStore();
}

/**
 * 导出 settingsStore 对象
 * @returns 
 */
export function useSettingsStore() {
    return settingsStore();
}

/**
 * 导出 appStore 对象
 * @returns 
 */
export function useAppStore() {
    return appStore();
}
