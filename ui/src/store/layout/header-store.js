import { defineStore } from "pinia";
import { reactive } from "vue";
import tools from "@/scripts/tools";

const headerStore = defineStore("header-store", () => {

    const headerThemes = [
        { className: "hzy-layout-header-light", color: "#ffffff" },
        { className: "hzy-layout-header-dark", color: "#001529" },
        { className: "hzy-layout-header-blue", color: "#096dd9" },
        { className: "hzy-layout-header-1", color: "#997b71" },
        { className: "hzy-layout-header-2", color: "#237804" },
        { className: "hzy-layout-header-3", color: "#667afa" },
        { className: "hzy-layout-header-4", color: "#f74584" },
        { className: "hzy-layout-header-5", color: "#9463f7" },
        { className: "hzy-layout-header-6", color: "#d48806" },
        { className: "hzy-layout-header-7", color: "#ff4c52" },
    ];

    let currentHeaderTheme = tools.getHeaderTheme();
    currentHeaderTheme = currentHeaderTheme ? currentHeaderTheme : headerThemes[0].className;

    //定义状态
    let state = reactive({
        height: 48,
        theme: {
            classList: headerThemes,
            class: currentHeaderTheme,
        }
    });

    /**
     * 改变头部主题
     * 
     * @param {*} className 
     */
    function onChangeThemeClass(className) {
        state.theme.class = className;
        tools.setHeaderTheme(className);
    }

    return {
        state,
        onChangeThemeClass
    }

});


export default headerStore;