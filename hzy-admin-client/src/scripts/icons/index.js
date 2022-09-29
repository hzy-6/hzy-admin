/**
 *
 *
 * 更多图标封装看这里：https://github.com/07akioni/xicons
 *
 *
 *
 */

import { useAllAntdIcons, getAllName as getAllNameAntd } from "./antd-icons";
import { useAllElementPlusIcons, getAllName as getAllName } from "./element-plus-icons";

export function useAllIcons(app) {
  // 注册所有的 antd 图标
  app.use(useAllAntdIcons);
  // 注册所有的 element icon 图标
  app.use(useAllElementPlusIcons);
}

/**
 * 获取所有的 antd 图标
 * @returns
 */
export function getAllNameByAntd(currentInstance) {
  return getAllNameAntd(currentInstance);
}

/**
 * 获取所有的 element 图标
 * @returns
 */
export function getAllNameByElementPlusIcons(currentInstance) {
  return getAllName(currentInstance);
}
