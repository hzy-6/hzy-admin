import { defineStore } from "pinia";
import { reactive } from "vue";

interface IState {
    show: boolean
}

export default defineStore("SettingsStore", () => {
    //定义状态
    let state = reactive<IState>({
        show: false
    });

    /**
     * 是否显示设置界面
     */
    function isShow() {
        state.show = !state.show;
    }

    return {
        state,
        isShow
    }

});
