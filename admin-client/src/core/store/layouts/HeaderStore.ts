import AppConsts from "@/utils/AppConsts";
import { defineStore } from "pinia";
import { reactive } from "vue";

export interface IState {
    height: number,
    themeClass: string | null
}

export default defineStore("HeaderStore", () => {

    //定义状态
    let state = reactive<IState>({
        height: 48,
        themeClass: HeaderStoreUtil.getHeaderClass()
    });

    /**
     * 设置头部样式
     */
    function setHeaderClass(_class: string) {
        HeaderStoreUtil.setHeaderClass(_class);
        state.themeClass = _class;
    }

    return {
        state,
        setHeaderClass
    }

});

/**
 * 头部状态数据工具
 */
class HeaderStoreUtil {
    /**
     * 设置头部颜色
     * 
     * @param _class 
     */
    static setHeaderClass(_class: string): void {
        localStorage.setItem(AppConsts.appPrefix + "_header_class", _class ? _class : "");
    }

    /**
     * 获取头部颜色
     * 
     * @returns 
     */
    static getHeaderClass(): string | null {
        return localStorage.getItem(AppConsts.appPrefix + "_header_class");
    }

}