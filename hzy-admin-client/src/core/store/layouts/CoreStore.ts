import { defineStore } from "pinia";
import { reactive, nextTick, onMounted } from "vue";
import router from "@/core/router";
import TabsStore from "./TabsStore";

interface IState {
    isMobile: boolean
    demarcation: number
}

export default defineStore("LayoutStore", () => {

    const tabsStore = TabsStore();

    //定义状态
    let state = reactive<IState>({
        isMobile: false,
        // 鉴定是否移动设备分界值
        // demarcation: 1080
        demarcation: 768
    });

    //页面加载 钩子函数
    onMounted(() => {
        calcScreen();
    });

    /**
     * 实时计算监听 宽高
     * 
     */
    const calcScreen = () => {
        state.isMobile = window.innerWidth < state.demarcation;
        window.onresize = () => {
            return (() => {
                state.isMobile = window.innerWidth < state.demarcation;
            })();
        };
    };

    /**
     * 刷新
     * 
     * @param {*} fullPath 
     */
    function refresh(fullPath: string) {
        tabsStore.closeTabSelf(fullPath);
        nextTick(() => {
            router.push("/redirect" + fullPath);
        });
    }


    return {
        state,
        refresh,
    }

});
