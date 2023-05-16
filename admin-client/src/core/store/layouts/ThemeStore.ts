import { defineStore } from "pinia";
import { computed, reactive, onMounted } from "vue";
import { theme as antdTheme } from "ant-design-vue";
import AppConsts from "@/utils/AppConsts";
// import Img0 from "@/assets/images/login-1.jpg";
// import Img1 from "@/assets/images/bg-1.jpg";
// import Img2 from "@/assets/images/bg-2.jpg";
// import Img3 from "@/assets/images/bg-3.jpg";
// import Img4 from "@/assets/images/bg-4.jpg";
// import Img5 from "@/assets/images/bg-5.jpg";
// import Img6 from "@/assets/images/bg-6.jpg";
// import Img7 from "@/assets/images/bg-7.jpg";
// import Img8 from "@/assets/images/bg-8.jpg";
// import Img9 from "@/assets/images/bg-9.jpg";
// import Img10 from "@/assets/images/bg-10.jpg";
// import Img11 from "@/assets/images/bg-11.jpg";
// import Img12 from "@/assets/images/bg-12.jpg";

export type ThemeName = "light" | "dark" | "compact";

interface IState {
  /**
   * 是否暗黑
   */
  isDark: boolean;
  /**
   * 全局 主题
   */
  tokenTheme?: TokenTheme;
  /**
   * 菜单主题
   */
  menuTheme: IMenuTheme;
  /**
   * 背景图索引
   */
  backgroundImageIndex: number;
}

export class TokenTheme {
  colorPrimary: string = "#2f54eb";
  //
  // colorBgLayout: "red",
  // paddingXXS: 16,
  // paddingXS: 16,
  // paddingSM: 16,
  // padding: 16,
  // paddingMD: 16,
  // paddingLG: 16,
  // paddingXL: 16,
}

/**
 * 菜单主题接口
 */
interface IMenuTheme {
  // 菜单项背景色
  colorItemBg?: string;
  // 背景色 hover
  colorItemBgHover?: string;
  // 选中背景色
  colorItemBgSelected?: string;
  // 文本色
  colorItemText?: string;
  // 文本 hover
  colorItemTextHover?: string;
  // 文本选中
  colorItemTextSelected?: string;
}

export default defineStore("ThemeStore", () => {
  var tokenTheme = new TokenTheme();

  const menuThemeList: IMenuTheme[] = [
    // 白色
    {},
    // antd 暗色菜单
    {
      colorItemBg: "#001529",
      colorItemBgHover: "rgba(0, 0, 0, 0.06)",
      colorItemText: "#ffffffa6",
      colorItemTextHover: "#ffffff",
      colorItemTextSelected: "#ffffff",
    },
    // element+ 官方自定义颜色风格
    {
      colorItemBg: "#545c64",
      colorItemBgHover: "rgba(0, 0, 0, 0.06)",
      colorItemText: "#ffffffa6",
      colorItemTextHover: "#fff",
      colorItemTextSelected: "#fff",
    },
    // iview 菜单风格
    {
      colorItemBg: "#191a23",
      colorItemBgHover: "rgba(0, 0, 0, 0.06)",
      colorItemText: "#ffffffa6",
      colorItemTextHover: "#fff",
      colorItemTextSelected: "#fff",
    },
  ];

  // 品牌色集合
  const colorPrimaryList: string[] = ["#2f54eb", "#1677FF", "#5A54F9", "#9E339F", "#ED4192", "#E0282E", "#F4801A", "#F2BD27", "#00B96B", "#393D49", "#009688", "#63BA79"];

  // /**
  //  * 背景图片
  //  */
  // const bgImageList: string[] = [
  //   Img0,
  //   Img1,
  //   Img2,
  //   Img3,
  //   Img4,
  //   Img5,
  //   Img6,
  //   Img7,
  //   // Img8,
  //   // Img9,
  //   // Img10,
  //   // Img11,
  //   // Img12,
  // ];

  // 状态定义
  const state = reactive<IState>({
    isDark: false,
    tokenTheme,
    menuTheme: {},
    backgroundImageIndex: -1,
  });

  onMounted(() => {
    let index = ThemeCacheUtil.getMenuCustomThemesIndex();
    state.menuTheme = menuThemeList[index];
    let isDark = ThemeCacheUtil.getIsDark();
    state.isDark = isDark;
    let colorPrimary = ThemeCacheUtil.getColorPrimary();
    if (colorPrimary) {
      state.tokenTheme!.colorPrimary = colorPrimary;
    }
  });

  //
  const getAlgorithm = (themes: ThemeName[] = []) =>
    themes.map((theme) => {
      if (theme === "dark") {
        return antdTheme.darkAlgorithm;
      }
      if (theme === "compact") {
        return antdTheme.compactAlgorithm;
      }
      return antdTheme.defaultAlgorithm;
    });

  const themeConfig = computed(() => (state.isDark ? getAlgorithm(["dark"]) : getAlgorithm(["light"])));

  /**
   * 主题改变
   * @param isDark
   */
  function changeTheme(isDark: boolean) {
    state.isDark = isDark;
    ThemeCacheUtil.setIsDark(isDark);
  }

  /**
   * 切换菜单主题
   * @param index
   */
  function changeMenuTheme(index: number) {
    state.menuTheme = menuThemeList[index];
    ThemeCacheUtil.setMenuCustomThemesIndex(index);
  }

  /**
   * 改变主色 品牌色
   */
  function changeColorPrimary(color: string) {
    state.tokenTheme!.colorPrimary = color;
    ThemeCacheUtil.setColorPrimary(color);
  }

  return {
    state,
    themeConfig,
    menuThemeList,
    colorPrimaryList,
    // bgImageList,
    changeTheme,
    changeMenuTheme,
    changeColorPrimary,
  };
});

/**
 * 主题缓存工具
 */
class ThemeCacheUtil {
  /**
   * 持久化保存自定义颜色状态
   * @param index
   */
  static setMenuCustomThemesIndex(index: number) {
    localStorage.setItem(`${AppConsts.appPrefix}_menu_custom_themes_index`, index.toString());
  }

  /**
   * 获取 index
   * @returns
   */
  static getMenuCustomThemesIndex(): number {
    var index = localStorage.getItem(`${AppConsts.appPrefix}_menu_custom_themes_index`);
    if (index == null || index == undefined || index == "") return 0;
    return parseInt(index);
  }

  /**
   * 设置主题
   * @param isDark
   */
  static setIsDark(isDark: boolean) {
    localStorage.setItem(`${AppConsts.appPrefix}_theme_is_dark`, (isDark ? 1 : 0).toString());
  }

  /**
   * 获取主题
   * @returns
   */
  static getIsDark() {
    var result = localStorage.getItem(`${AppConsts.appPrefix}_theme_is_dark`);
    return result == "1";
  }

  /**
   * 保存品牌色
   */
  static setColorPrimary(color: string) {
    localStorage.setItem(`${AppConsts.appPrefix}_color_primary`, color);
  }

  /**
   * 读取品牌色
   * @returns
   */
  static getColorPrimary() {
    var result = localStorage.getItem(`${AppConsts.appPrefix}_color_primary`);
    return result;
  }
}
