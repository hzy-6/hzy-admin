import { defineStore } from "pinia";
import { reactive, onMounted, watch } from "vue";
import CoreStore from "@/core/store/layouts/CoreStore";
import AppConsts from '@/utils/AppConsts';
import { MenuTheme } from "ant-design-vue";

export enum EMenuMode {
    // 1：默认模式
    default = "1",
    //2：顶部模式
    top = "2",
    //3：侧边栏
    left = "3"
}

/**
 * 菜单自定义主题
 */
interface MenuCustomTheme {
    // 激活文本背景颜色
    activeBgColor: string | undefined,
    // 激活文本颜色
    activeTextColor: string | undefined
    // 背景颜色
    backgroundColor: string | undefined
    // 文本颜色
    textColor: string | undefined,
}

interface IState {
    /**
     * 菜单宽度
     */
    width: number
    /**
     * 菜单最小宽度
     */
    minWidth: number
    /**
     * 菜单最大宽度
     */
    maxWidth: number
    /**
     * 移动模式菜单宽度
     */
    mobileWidth: number,
    /**
     * 左侧模式一级菜单宽度
     */
    leftModeWidth: number,
    menuCustomThemesIndex: number
    isCollapse: boolean
    /**
     * 菜单模式
     */
    menuMode: EMenuMode
}

/**
 * 菜单项模型
 */
export interface MenuItemModel {
    id?: number
    /**
     * 菜单名称
     */
    name?: string
    /**
     * 组件名称
     */
    componentName?: string | null
    /**
     * 菜单物理路径
     */
    url?: string | null
    /**
     * 路由地址
     */
    router?: string | null
    /**
     * 默认跳转地址
     */
    jumpUrl?: string | null
    /**
     * 菜单图标
     */
    icon?: string | null
    /**
     * 选项卡是否可关闭
     */
    close?: boolean
    /**
     * 父级Id
     */
    parentId?: number | null
    /**
     * 菜单类型
     */
    type?: number
    /**
     * 级别码 1.1.1
     */
    levelCode?: string | null
    /**
     * 模式 1=普通模式 2=微前端模式
     */
    mode: 1 | 2
    /**
     * 微前端模块地址 Dev 模式
     */
    moduleUrl?: string | null
    /**
     * 微前端模块地址 Pro 模式
     */
    moduleUrlPro?: string | null
    /**
     * 编号
     */
    number?: number | null
    /**
     * 子集菜单
     */
    children?: MenuItemModel[] | null | []
    /**
     * 父级名称
     */
    parentName?: string | null
    /**
     * 是否显示
     */
    show?: boolean | null
    /**
     * 是否缓存多标签
     */
    keepAlive?: boolean | null
    /**
     * 菜单状态
     */
    state?: boolean | null
    /**
     * 最后更新人id
     */
    lastModifierUserId?: string | null
    /**
     * 最后更新时间
     */
    lastModificationTime?: string | null
    /**
     * 创建人id
     */
    creatorUserId?: string | null
    /**
     * 创建时间
     */
    creationTime?: string | null
}

//菜单主题集合
const menuCustomThemes: MenuCustomTheme[] = [{//原生风格 antd 风格 亮色
    activeBgColor: "#2f54eb",
    backgroundColor: undefined,
    activeTextColor: "#fff",
    textColor: "rgba(0, 0, 0, 0.85)",
}, {//原生风格 antd 风格 暗色
    activeBgColor: "#2f54eb",// 激活文本背景颜色
    backgroundColor: "#001529",// 菜单背景色
    activeTextColor: "#fff",// 文本激活色
    textColor: "#fff",// 默认文本色
}, {//element+ 官方自定义颜色风格
    activeBgColor: "#2f54eb",
    backgroundColor: "#545c64",
    activeTextColor: "#fff",//黑色
    textColor: "#fff",
}, {//iview 菜单风格
    activeBgColor: "#2f54eb",
    backgroundColor: "#191a23",
    activeTextColor: "#fff",
    textColor: "#fff",
}];

export default defineStore("MenuStore", () => {

    const coreStore = CoreStore();

    var currentIsCollapse = coreStore.state.isMobile ? true : MenuStoreUtil.getCollapsed();

    //定义状态
    let state = reactive<IState>({
        /**
         * 当前宽度
         */
        width: AppConsts.menu.maxWidth,
        /**
         * pc端最小宽度
         */
        minWidth: AppConsts.menu.minWidth,
        /**
         * 最大宽度
         */
        maxWidth: AppConsts.menu.maxWidth,
        /**
         * 移动端pc菜单宽度
         */
        mobileWidth: 0,
        /**
         * 左侧模式一级菜单宽度
         */
        leftModeWidth: AppConsts.menu.leftModeWidth,
        /**
         * 菜单自定义颜色 索引值
         */
        menuCustomThemesIndex: 0,
        /**
         * 菜单收展
         */
        isCollapse: currentIsCollapse,
        /**
         * 菜单栏模式 = 1：常规模式|2：顶部模式|3：左侧模式
         */
        menuMode: window.innerWidth < coreStore.state.demarcation ? EMenuMode.default : MenuStoreUtil.getMenuMode()
    });

    watch(() => state.menuMode, (value) => MenuStoreUtil.setMenuMode(value));
    watch(() => state.isCollapse, (value) => calcMenuWidth(value));
    watch(() => coreStore.state.isMobile, (value) => {
        // 监听窗口大小 小屏幕下不使用 oneLevelMenuMode
        MenuStoreUtil.setMenuMode(window.innerWidth < coreStore.state.demarcation ?
            EMenuMode.default : MenuStoreUtil.getMenuMode());
        //
        if (value) {
            state.isCollapse = true;
        }
        calcMenuWidth(state.isCollapse);
    });

    onMounted(() => {
        onChangeCollapse(currentIsCollapse);
        calcMenuWidth(state.isCollapse);
    });

    /**
     * 计算菜单宽度
     * 
     * @param {*} isCollapse 
     */
    function calcMenuWidth(isCollapse: boolean) {
        //手机移动端
        if (coreStore.state.isMobile) {
            state.width = 0;
            return;
        }

        if (isCollapse) {
            state.width = state.minWidth;
        } else {
            state.width = state.maxWidth;
        }
    }

    /**
     * 改变自定义颜色
     * @param index 索引
     */
    function onChangeMenuCustomThemesIndex(index: number) {
        state.menuCustomThemesIndex = index;
    }
    onMounted(() => { state.menuCustomThemesIndex = MenuStoreUtil.getMenuCustomThemesIndex(); })
    watch(() => state.menuCustomThemesIndex, value => {
        setMenuCustomThemesIndex(value);
        onChangeMenuCustomThemesIndex(value);
    });

    /**
     * 菜单收展
     * @param isCollapse 
     */
    function onChangeCollapse(isCollapse: boolean) {
        state.isCollapse = isCollapse;
        MenuStoreUtil.setCollapsed(isCollapse);
    }

    /**
     * 设置一级菜单 是否开启
     * @param menumode 
     */
    function setMenuMode(menumode: EMenuMode) {
        state.menuMode = menumode;
    }

    /**
     * 持久化保存自定义颜色状态
     * @param index 菜单主题索引
     */
    function setMenuCustomThemesIndex(index: number) {
        MenuStoreUtil.setMenuCustomThemesIndex(index);
    }

    /**
     * 主题类型
     */
    function themeType(): MenuTheme {
        if (state.menuCustomThemesIndex == 0) {
            return "light";
        }

        return "dark";
    }

    return {
        state,
        menuCustomThemes,
        onChangeMenuCustomThemesIndex,
        onChangeCollapse,
        setMenuMode,
        themeType
    }
});

/**
 * 保存菜单状态数据
 */
class MenuStoreUtil {

    /**
    * 持久化保存自定义颜色状态
    * @param menuCustomThemesIndex 
    */
    static setMenuCustomThemesIndex(menuCustomThemesIndex: number) {
        localStorage.setItem(`${AppConsts.appPrefix}_menu_custom_themes_index`, menuCustomThemesIndex.toString());
    }
    /**
     * 获取 MenuCustomThemesIndex
     * @returns 
     */
    static getMenuCustomThemesIndex(): number {
        var index = localStorage.getItem(`${AppConsts.appPrefix}_menu_custom_themes_index`);
        if (index == null || index == undefined || index == "") return 0;
        return parseInt(index);
    }

    /**
     * 获取菜单收展状态
     * @returns 
     */
    static getCollapsed(): boolean {
        let value = localStorage.getItem(AppConsts.appPrefix + "_collapsed");
        return value == "1" ? true : false;
    }

    /**
     * 设置菜单收展状态
     * @param collapsed 
     */
    static setCollapsed(collapsed: boolean) {
        localStorage.setItem(AppConsts.appPrefix + "_collapsed", collapsed ? "1" : "0");
    }

    /**
     * 设置 menuMode
     * @param menuMode 
     */
    static setMenuMode(menuMode: EMenuMode) {
        localStorage.setItem(AppConsts.appPrefix + "_one_level_menu_mode", menuMode.toString());
    }

    /**
     * 获取 menuMode
     */
    static getMenuMode() {
        let value = localStorage.getItem(AppConsts.appPrefix + "_one_level_menu_mode");
        return value ? value as EMenuMode : EMenuMode.default;
    }

}