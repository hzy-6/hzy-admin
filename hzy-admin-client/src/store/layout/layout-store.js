import { defineStore } from "pinia";
import { reactive, nextTick, onMounted } from "vue";
import router from "@/router";
import { useTabsStore } from "@/store";

const layoutStore = defineStore("layout-store", () => {

    const tabsStore = useTabsStore();

    //定义状态
    let state = reactive({
        loading: false,
        title: 'hzy-admin-spa-ui',
        isMobile: false,
        // 鉴定是否移动设备分界值
        demarcation: 1080
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
     * @param {*} componentName 
     */
    function refresh(fullPath, componentName) {
        tabsStore.delCacheView(componentName, () => {
            nextTick(() => {
                router.push("/redirect" + fullPath);
            });
        })
    }


    return {
        state,
        refresh,
    }

});


export default layoutStore;