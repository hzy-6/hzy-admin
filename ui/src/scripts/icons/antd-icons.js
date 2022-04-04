import { getCurrentInstance } from "vue";
import * as icons from "@ant-design/icons-vue";

const iconsKeyName = "$antdIcons";
const iconNameKeyName = "$antdIconNames";
const allIconsKeyName = "$allIcons";

/**
 * 使用所有的 图标
 * @param {*} app 
 */
export function useAllAntdIcons(app) {
    var names = [];
    let allIcons = app.config.globalProperties[allIconsKeyName];
    allIcons = allIcons ? allIcons : [];
    // 注册组件
    Object.keys(icons).forEach(key => {
        var com = icons[key];

        //验证能否注册
        if (allIcons.findIndex(w => w == key) < 0 && key != "Icon" && com && com.displayName && com.displayName != "Icon") {
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
export function getAll(currentInstance) {
    const { appContext } = currentInstance ? currentInstance : getCurrentInstance();
    return appContext.app.config.globalProperties[iconsKeyName];
}

/**
 * 获取所有的 图标名称
 * @returns 
 */
export function getAllName(currentInstance) {
    const { appContext } = currentInstance ? currentInstance : getCurrentInstance();
    return appContext.app.config.globalProperties[iconNameKeyName];
}

