import { defineStore } from "pinia";
import { reactive, onMounted, watch } from "vue";
import tools from "@/scripts/tools";
import useLayoutStore from "@/store/layout/layout-store";

const menuStore = defineStore("menu-store", () => {

    const layoutSore = useLayoutStore();

    const light = {
        textColor: '#303133',
        activeTextColor: '#409eff',
        backgroundColor: '#ffffff',
    };

    const dark = {
        textColor: 'hsla(0,0%,100%,.65)',
        activeTextColor: '#409eff',
        backgroundColor: '#001529',
    }

    var currentIsCollapse = layoutSore.state.isMobile ? true : tools.getMenuCollapsed();

    //定义状态
    let state = reactive({
        theme: {
            textColor: '',
            activeTextColor: '',
            backgroundColor: '',
        },
        width: 220,
        themeType: tools.getMenuTheme(),//dark | light
        //菜单收展
        isCollapse: currentIsCollapse,
        //是否开启一级导航模式
        isOneNav: tools.getOneNav()
    });

    watch(() => layoutSore.state.isMobile, (value) => {
        // 监听窗口大小 小屏幕下不使用 topnav
        setOneNav(window.innerWidth > layoutSore.state.demarcation);
    })
    watch(() => state.isOneNav, (value) => tools.setOneNav(value));
    watch(() => state.isCollapse, (value) => calcMenuWidth(value));
    watch(() => layoutSore.state.isMobile, (value) => {
        if (layoutSore.state.isMobile) {
            state.isCollapse = true;
        }
        calcMenuWidth(state.isCollapse);
    });

    onMounted(() => {
        onChangeCollapse(currentIsCollapse);
        calcMenuWidth(state.isCollapse);
        onChangeTheme(state.themeType);
    });

    /**
     * 计算菜单宽度
     * 
     * @param {*} isCollapse 
     */
    function calcMenuWidth(isCollapse) {
        //手机移动端
        if (layoutSore.state.isMobile) {
            state.width = 0;
            return;
        }

        if (isCollapse) {
            state.width = 64;
        } else {
            state.width = 220;
        }
    }

    /**
     * 改变菜单主题
     * 
     * @param {*} themeType 
     */
    function onChangeTheme(themeType) {
        state.themeType = themeType;
        if (state.themeType == "dark") {
            state.theme = dark;
        } else {
            state.theme = light;
        }
        tools.setMenuTheme(themeType);
    }

    /**
     * 菜单收展
     */
    function onChangeCollapse(isCollapse) {
        state.isCollapse = isCollapse;
        tools.setMenuCollapsed(isCollapse);
    }

    /**
     * 设置一级菜单 是否开启
     * @param {*} isOneNav 
     */
    function setOneNav(isOneNav) {
        state.isOneNav = isOneNav;
    }

    return {
        state,
        onChangeTheme,
        onChangeCollapse,
        setOneNav
    }
});


export default menuStore;