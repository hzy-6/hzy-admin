import {defineStore} from "pinia";
import {reactive, nextTick, onMounted, watch} from "vue";
import router from "@/core/router";
import TabsStore from "./TabsStore";
import i18n from "@/locale/Main.js";
import AppConsts from "@/utils/AppConsts";

interface IState {
    isMobile: boolean;
    demarcation: number;
    // 语言
    locale: "zh-CN" | "en-US" | string | any
}

export default defineStore("LayoutStore", () => {
    const tabsStore = TabsStore();

    //定义状态
    let state = reactive<IState>({
        isMobile: false,
        // 鉴定是否移动设备分界值
        // demarcation: 1080
        demarcation: 768,
        // 语言
        locale: 'zh-CN'
    });

    //页面加载 钩子函数
    onMounted(() => {
        calcScreen();
        state.locale = CoreStoreUtil.getLang();
    });

    // 监控语言变化
    watch(() => state.locale, (newVal: any, oldVal) => {
        i18n.global.locale = newVal;
    })

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
        setTimeout(() => {
            nextTick(() => {
                router.push("/redirect" + fullPath);
            });
        }, 100);
    }

    /**
     * 设置语言
     * @param locale
     */
    function setLocale(locale: "zh-CN" | "en-US" | string | any) {
        state.locale = locale;
        //
        i18n.global.locale = locale;
        // 持久化
        CoreStoreUtil.setLang(locale);
    }

    return {
        state,
        refresh,
        setLocale
    };
});


class CoreStoreUtil {
    /**
     * 持久化 国际化
     * @param locale
     */
    static setLang(locale: "zh-CN" | "en-US" | string | any) {
        localStorage.setItem(`${AppConsts.appPrefix}_lang`, locale);
    }

    /**
     * 获取 国际化
     * @returns
     */
    static getLang(): "zh-CN" | "en-US" | string | any {
        return localStorage.getItem(`${AppConsts.appPrefix}_lang`) ?? "zh-CN";
    }
}
