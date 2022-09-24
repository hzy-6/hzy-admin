import router from '@/infrastructure/router';
import { useFullscreen, useWindowSize, useDark, useToggle } from '@vueuse/core';
import { defineStore } from 'pinia';
import { nextTick, reactive, ref, watch } from 'vue';
import TabsStore from './TabsStore';

interface IState {
    // 菜单收展状态
    isMobile: boolean
    // 全屏
    isFullscreen: boolean
    // 暗黑
    isDark: boolean
    // 鉴定是否移动设备分界值
    demarcation: number
    // 全局加载
    loading: boolean
}

export default defineStore("CoreStore", () => {

    const tabsStore = TabsStore();

    let state = reactive<IState>({
        //菜单收展状态
        isMobile: false,
        //全屏
        isFullscreen: false,
        //暗黑
        isDark: false,
        // 鉴定是否移动设备分界值
        demarcation: 768,
        // 全局加载
        loading: false
    });

    //窗口宽高变化
    const { width, height } = useWindowSize();
    state.isMobile = width.value < state.demarcation;
    watch(() => width.value, (value) => {
        state.isMobile = value < state.demarcation;
    });

    //全屏
    const { isFullscreen, enter, exit, toggle } = useFullscreen();
    watch(() => isFullscreen.value, (value) => {
        state.isFullscreen = value;
    });
    const toggleFullscreen = () => toggle();

    //暗黑主题
    let isDark = ref(useDark());
    const toggleDark = useToggle(isDark);
    watch(() => isDark.value, value => {
        state.isDark = value;
    });

    /**
     * 刷新
     * 
     * @param {*} fullPath 
     * @param {*} componentName 
     */
    function refresh(fullPath: string, componentName: string) {
        console.log(fullPath, componentName);
        tabsStore.delCacheView(componentName, () => {
            nextTick(() => {
                router.push("/redirect" + fullPath);
            });
        })
    }

    return {
        state,
        toggleFullscreen,
        toggleDark,
        refresh
    }

});