import { defineStore } from "pinia";
import { reactive } from "vue";

const settingsStore = defineStore("settings-store", () => {
    //定义状态
    let state = reactive({
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

export default settingsStore;