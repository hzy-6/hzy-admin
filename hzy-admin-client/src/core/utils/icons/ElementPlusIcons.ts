import { ComponentInternalInstance, getCurrentInstance } from "vue";
import * as _Icons from '@element-plus/icons-vue'

const iconsKeyName = "$ElementPlusIcons";
const iconNameKeyName = "$ElementPlusIconNames";
const allIconsKeyName = "$AllIcons";

/**
 * 使用所有的 图标
 * @param {*} app 
 */
export function useAllIcons(app: any) {
    var names: string[] = [];
    let allIcons = app.config.globalProperties[allIconsKeyName];
    allIcons = allIcons ? allIcons : [];
    // 注册组件
    var icons = _Icons as any;
    Object.keys(icons).forEach(key => {
        var com = icons[key];

        //验证能否注册
        if (allIcons.findIndex((w: any) => w.toLocaleLowerCase() == key.toLocaleLowerCase()) < 0) {
            app.component(key, com);
            names.push(key);
            allIcons.push(key);
        }
    });
    // 添加到全局
    app.config.globalProperties[iconsKeyName] = icons;
    app.config.globalProperties[iconNameKeyName] = names;
    app.config.globalProperties[allIconsKeyName] = allIcons;
}

/**
 * 获取所有的 图标 模块
 * @returns 
 */
export function getAll(currentInstance: ComponentInternalInstance | null): any {
    const newCurrentInstance = currentInstance ? currentInstance : getCurrentInstance();
    if (!newCurrentInstance) return
    const { appContext } = newCurrentInstance;
    return appContext.app.config.globalProperties[iconsKeyName];
}

/**
 * 获取所有的 图标名称
 * @returns 
 */
export function getAllName(currentInstance: ComponentInternalInstance | null) {
    const newCurrentInstance = currentInstance ? currentInstance : getCurrentInstance();
    if (!newCurrentInstance) return
    const { appContext } = newCurrentInstance;
    return appContext.app.config.globalProperties[iconNameKeyName];
}