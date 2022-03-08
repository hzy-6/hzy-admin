import { getCurrentInstance } from "vue";
import * as antdIcons from "@ant-design/icons-vue";

/**
 * 使用所有的 antd 图标
 * @param {*} app 
 */
export function useAllAntdIcons(app) {
    var names = [];
    // 注册组件
    Object.keys(antdIcons).forEach(key => {
        var com = antdIcons[key];
        app.component(key, com);
        if (com.displayName) {
            names.push(com.displayName);
        }
    });
    // 添加到全局
    app.config.globalProperties.$antdIcons = antdIcons;
    app.config.globalProperties.$antdIconNames = names;
}

/**
 * 获取所有的 antd 图标 模块
 * @returns 
 */
export function getAllAntdIcons() {
    return getCurrentInstance().appContext.app.config.globalProperties.$antdIcons;
}

/**
 * 获取所有的 antd 图标名称
 * @returns 
 */
export function getAllAntdIconNames() {
    return getCurrentInstance().appContext.app.config.globalProperties.$antdIconNames.filter((w) => w != "Icon");
}