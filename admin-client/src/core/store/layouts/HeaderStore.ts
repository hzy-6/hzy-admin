import AppConsts from "@/utils/AppConsts.js";
import {defineStore} from "pinia";
import {reactive, onMounted} from "vue";

export interface IState {
    height: number;
    /**
     * 使用主色
     */
    useColorPrimary: boolean;
}

export default defineStore("HeaderStore", () => {
    //定义状态
    let state = reactive<IState>({
        height: 48,
        useColorPrimary: false,
    });

    onMounted(() => {
        state.useColorPrimary = HeaderStoreUtil.getUseColorPrimary();
    });

    function changeUseColorPrimary() {
        state.useColorPrimary = !state.useColorPrimary;
        HeaderStoreUtil.setUseColorPrimary(state.useColorPrimary);
    }

    return {
        state,
        changeUseColorPrimary,
    };
});

class HeaderStoreUtil {
    /**
     * 持久化 使用主色
     * @param index
     */
    static setUseColorPrimary(use: boolean) {
        localStorage.setItem(`${AppConsts.appPrefix}_use_color_primary`, use ? "1" : "0");
    }

    /**
     * 获取 使用主色
     * @returns
     */
    static getUseColorPrimary(): boolean {
        var result = localStorage.getItem(`${AppConsts.appPrefix}_use_color_primary`);
        return result == "1";
    }
}
