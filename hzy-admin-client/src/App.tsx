import { defineComponent, computed, onMounted } from "vue";
import { ConfigProvider, Spin } from "ant-design-vue";
import AppStore from "@/core/store/AppStore";
import zhCN from "ant-design-vue/es/locale/zh_CN";
import dayjs from "dayjs";
import "dayjs/locale/zh-cn";

export default defineComponent({
    setup(props, ctx) {
        dayjs.locale("zh-cn");
        const appStore = AppStore();
        const loading = computed(() => appStore.state.loading);

        const getPopupContainer = (node: HTMLElement | undefined) => {
            // if (node) {
            //     return node.parentNode as HTMLElement;
            // } else {
            //     return document.body;
            // }
            return document.body;
        };

        onMounted(() => {

            ConfigProvider.config({
                theme: {
                    primaryColor: '#2f54eb'
                },
            });

        });

        return () => (
            <ConfigProvider autoInsertSpaceInButton={false} locale={zhCN} getPopupContainer={getPopupContainer}>
                <Spin spinning={loading.value} >
                    <router-view></router-view>
                </Spin>
            </ConfigProvider >
        )
    }
}) 