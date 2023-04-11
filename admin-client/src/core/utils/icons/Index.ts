/**
 * 
 * 
 * 更多图标封装看这里：https://github.com/07akioni/xicons
 * 
 * 
 * 
 */

import { ComponentInternalInstance } from "vue";
import { useAllIcons as useAllAntdIcons, getAllName as getAllNameAntd } from "./AntdIcons";
import { useAllIcons as useAllElementPlusIcons, getAllName as getAllNameElementPlusIcons } from "./ElementPlusIcons";

export function useAllIcons(app: any) {
    // 注册所有的 antd 图标
    app.use(useAllAntdIcons);
    // 注册所有的 element plus 图标
    app.use(useAllElementPlusIcons);
}

/**
 * 获取所有的 antd 图标
 * @returns 
 */
export function getAllNameByAntd(currentInstance: ComponentInternalInstance | null) {
    return getAllNameAntd(currentInstance);
}

/**
 * 获取所有的 ionicons5 图标
 * @returns
 */
export function getAllNameByElementPlus(currentInstance: ComponentInternalInstance | null) {
    return getAllNameElementPlusIcons(currentInstance);
}
