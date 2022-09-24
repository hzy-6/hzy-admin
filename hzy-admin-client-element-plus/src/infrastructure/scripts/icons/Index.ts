/**
 * 
 * 
 * 更多图标封装看这里：https://github.com/07akioni/xicons
 * 
 * 
 * 
 */

import { ComponentInternalInstance } from "vue";
import { useAllElementPlusIcons, getAllName as getAllNameElementPlus } from "./ElementPlusIcons";
import { useAllAntdIcons, getAllName as getAllNameAntd } from "./AntdIcons";

export function useAllIcons(app: any) {
    // 注册所有的 element plus 图标
    app.use(useAllElementPlusIcons);
    // 注册所有的 antd 图标
    app.use(useAllAntdIcons);

}

/**
 * 获取所有的 antd 图标
 * @returns 
 */
export function getAllNameByElementPlus(currentInstance: ComponentInternalInstance | null) {
    return getAllNameElementPlus(currentInstance);
}

/**
 * 获取所有的 ionicons5 图标
 * @returns
 */
export function getAllNameByAntd(currentInstance: ComponentInternalInstance | null) {
    return getAllNameAntd(currentInstance);
}
