import { defineStore } from "pinia";
import { reactive } from "vue";

interface IState {
    isOpen: boolean
}

export default defineStore("SettingsStore", () => {

    let state = reactive<IState>({
        //
        isOpen: false,
    });

    /**
     * 打开设置窗口
     * @param isOpen 
     */
    function onOpen(isOpen: boolean) {
        state.isOpen = isOpen;
    }

    return {
        state,
        onOpen
    }

});