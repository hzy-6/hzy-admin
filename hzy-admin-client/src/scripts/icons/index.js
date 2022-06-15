/**
 * 
 * 
 * 更多图标封装看这里：https://github.com/07akioni/xicons
 * 
 * 
 * 
 */

import { useAllAntdIcons, getAllName as getAllNameAntd } from "./antd-icons";
import { useAllIonicons5Icons, getAllName as getAllNameIonicons5 } from "./ionicons5-icons";

export function useAllIcons(app) {
    // 注册所有的 antd 图标
    app.use(useAllAntdIcons);
    // 注册所有的 ionicons5 图标
    app.use(useAllIonicons5Icons);

}

/**
 * 获取所有的 antd 图标
 * @returns 
 */
export function getAllNameByAntd(currentInstance) {
    return getAllNameAntd(currentInstance);
}

/**
 * 获取所有的 ionicons5 图标
 * @returns 
 */
export function getAllNameByIonicons5(currentInstance) {
    return getAllNameIonicons5(currentInstance);
}


