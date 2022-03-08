<template>
  <div id="hzy-layout">
    <LayoutFirstLevelMenuVue v-if="topNavValue" />
    <div style="flex: 1 1 0%">
      <a-layout style="min-height: 100vh">
        <a-layout-sider
          hasSider
          v-model:collapsed="collapsed"
          :breakpoint="'lg'"
          @breakpoint="(broken) => (breakpoint = broken)"
          :collapsedWidth="siderWidth"
          :style="{
            overflow: 'auto',
            left: 0,
            zIndex: 6,
            boxShadow: '1px 0px 1px 0 rgba(0, 0, 0, 0.1)',
          }"
          :theme="menuTheme"
          :width="siderWidth"
        >
          <!-- :class="headerTheme" -->
          <div class="hzy-logo" v-show="!isMobile && !collapsed" :style="{ color: menuTheme == 'dark' ? '#ffffff' : '' }">
            {{ title }}
          </div>
          <a-drawer
            placement="left"
            @close="collapsed = !collapsed"
            :closable="false"
            :visible="!collapsed"
            :bodyStyle="{ padding: 0 }"
            :drawerStyle="{ background: menuTheme == 'dark' ? '#001529' : '' }"
            width="80%"
            v-if="breakpoint"
          >
            <!-- :class="headerTheme" -->
            <div class="hzy-logo" v-show="isMobile" :style="{ color: menuTheme == 'dark' ? '#ffffff' : '' }">
              {{ title }}
            </div>
            <LayoutMenus :propMenuTheme="menuTheme" />
          </a-drawer>
          <LayoutMenus :propMenuTheme="menuTheme" v-else />
        </a-layout-sider>
        <a-layout>
          <LayoutHeader v-model:propCollapsed="collapsed" v-model:propHeaderTheme="headerTheme" v-model:propLayoutSettingsState="layoutSettings.state" :style="{ position: 'relative', zIndex: 1 }" />
          <a-layout-content>
            <LayoutTabs />
            <div style="min-height: 100vh">
              <!-- 由于必须要输出 cacheViews 才能不让缓存页面丢失事件 所以用了下面隐藏的input组件 来激活cacheViews变化-->
              <input type="hidden" :value="cacheViews" />
              <router-view v-slot="{ Component, route }">
                <transition name="fade-transform" mode="out-in">
                  <keep-alive :include="cacheViews">
                    <component :is="Component" :key="route.fullPath" />
                  </keep-alive>
                </transition>
              </router-view>
            </div>

            <!-- 返回顶部 -->
            <a-back-top />
            <a-layout-footer style="text-align: center">hzy admin span ui ©2020 created by hzy</a-layout-footer>
          </a-layout-content>
        </a-layout>
      </a-layout>
    </div>

    <!--设置弹框-->
    <LayoutSettings v-model:propState="layoutSettings.state" v-model:propHeaderTheme="headerTheme" v-model:propMenuTheme="menuTheme" />
  </div>
</template>
<script>
import { reactive, watch, defineComponent, toRefs, computed, onMounted } from "vue";
import tools from "@/scripts/tools";
import useAppStore from "@/store";
import LayoutHeader from "./LayoutHeader.vue";
import LayoutTabs from "./LayoutTabs.vue";
import LayoutMenus from "./menus/LayoutMenus.vue";
import LayoutSettings from "./LayoutSettings.vue";
import LayoutFirstLevelMenuVue from "./menus/LayoutFirstLevelMenu.vue";

export default defineComponent({
  name: "LayoutCom",
  components: {
    LayoutTabs,
    LayoutHeader,
    LayoutMenus,
    LayoutSettings,
    LayoutFirstLevelMenuVue,
  },
  setup() {
    const appStore = useAppStore();
    const cacheViews = computed(() => appStore.state.cacheViews);
    const title = computed(() => appStore.state.title);
    const topNavValue = computed(() => appStore.state.topNav);
    const isMobile = computed(() => appStore.state.isMobile);
    const headerTheme = tools.getHeaderTheme() ?? "hzy-layout-header-light";
    const menuCollapsed = tools.getMenuCollapsed();
    const siderMinWidth = 50;
    const siderMaxWidth = topNavValue.value ? 190 : menuCollapsed ? siderMinWidth : 208;

    const state = reactive({
      collapsed: menuCollapsed,
      siderWidth: menuCollapsed ? siderMinWidth : siderMaxWidth,
      breakpoint: false,
      headerTheme,
      menuTheme: tools.getMenuTheme(),
      layoutSettings: {
        state: false,
      },
    });

    //监听菜单收缩状态
    watch(
      () => state.collapsed,
      (value) => {
        tools.setMenuCollapsed(value);
        methods.calcCollapsed(value);
      }
    );
    //小屏幕是计算菜单状态
    watch(
      () => state.breakpoint,
      (value) => {
        console.log(value);
        methods.calcCollapsed(state.collapsed);
      }
    );
    //如果大菜单收起来，则重新计算菜单栏的宽度
    watch(
      () => topNavValue.value,
      (value) => {
        console.log(value);
        methods.calcSiderMaxWidth();
      }
    );
    //如果菜单宽度变成最小，则收起菜单
    watch(
      () => state.siderWidth,
      (value) => {
        if (value == siderMinWidth) {
          state.collapsed = true;
        }
      }
    );

    var methods = {
      calcCollapsed(collapsedValue) {
        if (state.breakpoint) {
          //如果小屏幕 菜单宽度
          state.siderWidth = 0;
        } else {
          state.siderWidth = collapsedValue ? siderMinWidth : siderMaxWidth;
        }
      },
      calcSiderMaxWidth() {
        //如果大菜单收起来，则重新计算菜单栏的宽度
        state.siderWidth = topNavValue.value ? 190 : state.collapsed ? siderMinWidth : 208;
      },
    };

    onMounted(() => {
      state.collapsed = tools.getMenuCollapsed();
      methods.calcCollapsed(state.collapsed);
    });

    return {
      ...toRefs(state),
      title,
      cacheViews,
      topNavValue,
      isMobile,
    };
  },
});
</script>
<style lang="less">
.ant-layout {
  background-color: #ffffff;
  .ant-layout-content {
    position: relative;
    background-color: #f0f2f5;
  }
}
</style>
