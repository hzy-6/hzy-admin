import { defineStore } from "pinia";
import { onMounted, reactive, watch } from "vue";
import useCoreStore from "@/infrastructure/store/layouts/CoreStore";
import AppConsts from "@/infrastructure/scripts/AppConsts";

export enum EMenuMode {
    // 1：常规模式
    default = "1",
    //2：顶部模式
    top = "2",
    //3：左侧模式
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

/**
 * 菜单项模型
 */
export interface MenuItemModel {
    id: number
    name: string
    componentName: string
    url: string
    router: string
    jumpUrl: string
    icon: string
    close: boolean
    parentId: number | null
    type: number
    children: MenuItemModel[]
}

interface IState {
    // 菜单收展状态
    isCollapse: boolean
    // 当前宽度
    width: number
    // pc端最小宽度
    minWidth: number
    // 最大宽度
    maxWidth: number
    // 移动端pc菜单宽度
    mobileWidth: number
    // 菜单自定义颜色 索引值
    menuCustomThemesIndex: number
    // 菜单模式 = 1：常规模式|2：顶部模式|3：左侧模式
    menuMode: EMenuMode
}

// 域名
const domainName = window.location.origin;

export default defineStore("MenuStore", () => {

    const coreStore = useCoreStore();
    //菜单主题集合
    const menuCustomThemes: MenuCustomTheme[] = [{//原生风格
        activeBgColor: undefined,
        backgroundColor: undefined,
        activeTextColor: undefined,
        textColor: undefined,
    }, {//antd 风格
        activeBgColor: "#1890ff",// 激活文本背景颜色
        backgroundColor: "#001529",// 菜单背景色
        activeTextColor: "#fff",// 文本激活色
        textColor: "#fff",// 默认文本色
    }, {//element+ 官方自定义颜色风格
        activeBgColor: "#ffd04b",
        backgroundColor: "#545c64",
        activeTextColor: "#303133",//黑色
        textColor: "#fff",
    }, {//iview 菜单风格
        activeBgColor: "#1890ff",
        backgroundColor: "#191a23",
        activeTextColor: "#fff",
        textColor: "#fff",
    }];

    let state = reactive<IState>({
        // 菜单收展状态
        isCollapse: false,
        // 当前宽度
        width: 230,
        // pc端最小宽度
        minWidth: 64,
        // 最大宽度
        maxWidth: 230,
        // 移动端pc菜单宽度
        mobileWidth: 0,
        // 菜单自定义颜色 索引值
        menuCustomThemesIndex: 0,
        // 菜单栏模式 = 1：常规模式|2：顶部模式|3：左侧模式
        menuMode: window.innerWidth < coreStore.state.demarcation ? EMenuMode.default : MenuStoreUtil.getMenuMode()
    });

    watch(() => state.menuMode, (value) => MenuStoreUtil.setMenuMode(value));
    watch(() => coreStore.state.isMobile, (value) => {
        // 监听窗口大小 小屏幕下不使用 oneLevelMenuMode
        MenuStoreUtil.setMenuMode(window.innerWidth < coreStore.state.demarcation ?
            EMenuMode.default : MenuStoreUtil.getMenuMode());
        onChangeMenu(value);
        //如果是移动模式，将菜单模式还原为默认行为
        if (value) {
            setMenuMode(EMenuMode.default);
        }
    });

    /**
     * 菜单变化
     * @param isMobile 
     */
    function onChangeMenu(isMobile: boolean) {
        if (isMobile) {
            state.width = state.maxWidth;
        } else {
            // pc 端表现
            if (state.isCollapse) {
                state.width = state.minWidth;
            } else {
                state.width = state.maxWidth;
            }
        }
    };

    /**
     * 菜单收展
     */
    function onChangeCollapse(isCollapse: boolean) {
        state.isCollapse = isCollapse;
        onChangeMenu(coreStore.state.isMobile);
    }

    // 监听移动端变化菜单状态
    onChangeMenu(coreStore.state.isMobile);

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

    return {
        state,
        menuCustomThemes,
        onChangeMenuCustomThemesIndex,
        onChangeCollapse,
        setMenuMode,
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
        localStorage.setItem(`${domainName}_menu_custom_themes_index`, menuCustomThemesIndex.toString());
    }
    /**
     * 获取 MenuCustomThemesIndex
     * @returns 
     */
    static getMenuCustomThemesIndex(): number {
        var index = localStorage.getItem(`${domainName}_menu_custom_themes_index`);
        if (index == null || index == undefined || index == "") return 0;
        return parseInt(index);
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
        return value ? value as EMenuMode : EMenuMode.top;
    }

}