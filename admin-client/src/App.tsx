import { defineComponent, computed } from "vue";
import { ConfigProvider, Spin } from "ant-design-vue";
import AppStore from "@/core/store/AppStore";
import zhCN from "ant-design-vue/es/locale/zh_CN";
import dayjs from "dayjs";
import "dayjs/locale/zh-cn";
import ThemeStore, { TokenTheme } from "@/core/store/layouts/ThemeStore";
import HeaderStore from "./core/store/layouts/HeaderStore";

export default defineComponent({
    setup(props, ctx) {
        dayjs.locale("zh-cn");
        const appStore = AppStore();
        const loading = computed(() => appStore.state.loading);

        const themeStore = ThemeStore();
        const headerStore = HeaderStore();

        let colorItemBgSelectedObject = computed(() => {
            return JSON.stringify(themeStore.state.menuTheme) == "{}" ? {} : {
                colorItemBgSelected: themeStore.state.tokenTheme!.colorPrimary ?? new TokenTheme().colorPrimary
            }
        })

        let layoutColorBgHeader = computed(() => {
            return headerStore.state.useColorPrimary ? { colorBgHeader: themeStore.state.tokenTheme?.colorPrimary } : { colorBgHeader: 'transparent' }
        })

        return () => (
            <ConfigProvider
                locale={zhCN}
                theme={{
                    token: {
                        ...themeStore.state.tokenTheme
                    },
                    algorithm: themeStore.themeConfig,
                    components: {
                        Menu: {
                            ...themeStore.state.menuTheme,
                            ...colorItemBgSelectedObject.value
                        },
                        Layout: {
                            ...layoutColorBgHeader.value
                        },
                    }
                }}>
                {/* <div class="bg" style={{ backgroundImage: 'url(' + themeStore.bgImageList[themeStore.state.backgroundImageIndex] + ')' }}> */}
                <Spin spinning={loading.value} >
                    <div style={{ "min-height": "200px" }}>
                        <router-view></router-view>
                    </div>
                </Spin>
                {/* </div> */}
            </ConfigProvider >
        )
    }
}) 