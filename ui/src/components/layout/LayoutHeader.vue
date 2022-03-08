<template>
  <a-layout-header style="padding: 0; height: auto; background: #ffffff">
    <div class="hzy-layout-header" :class="propHeaderTheme">
      <!-- <div class="hzy-header-btn hzy-logo" v-show="!isMobile">{{ title }}</div> -->
      <div class="hzy-header-btn" @click="onCollapsed">
        <a-tooltip>
          <template #title>菜单收展</template>
          <AppIcons :name="collapsed ? 'MenuUnfoldOutlined' : 'MenuFoldOutlined'" />
        </a-tooltip>
      </div>
      <div class="hzy-header-btn" @click="onReload">
        <a-tooltip>
          <template #title>刷新当前选项卡</template>
          <AppIcons name="ReloadOutlined" />
        </a-tooltip>
      </div>
      <div style="flex: 1 1 0%"></div>
      <div class="hzy-header-btn" @click="onSettings">
        <a-tooltip>
          <template #title>界面设置</template>
          <AppIcons name="SettingOutlined" />
        </a-tooltip>
      </div>
      <div class="hzy-header-btn" @click="onFullScreen" v-if="!isMobile">
        <a-tooltip>
          <template #title>全屏</template>
          <AppIcons name="FullscreenExitOutlined" v-if="fullscreen" />
          <AppIcons name="FullscreenOutlined" v-else />
        </a-tooltip>
      </div>
      <div class="hzy-header-btn">
        <a-dropdown>
          <div>
            <AppIcons name="UserOutlined" />
            &nbsp;&nbsp;{{ userName ? userName : "未知用户" }}
          </div>
          <template #overlay>
            <a-menu>
              <a-menu-item @click="onLogOut">
                <a href="javascript:;"> <AppIcons name="LogoutOutlined" />&nbsp;&nbsp;退出登录 </a>
              </a-menu-item>
            </a-menu>
          </template>
        </a-dropdown>
      </div>
    </div>
  </a-layout-header>
</template>
<script>
import { defineComponent, reactive, toRefs, watch, computed } from "vue";
import AppIcons from "@/components/AppIcons.vue";
import useAppStore from "@/store";
import router from "@/router/index";
import screenfull from "screenfull";
import tools from "@/scripts/tools";

export default defineComponent({
  name: "LayoutHeaderCom",
  props: {
    propCollapsed: Boolean,
    propLayoutSettingsState: Boolean,
    propHeaderTheme: String,
  },
  components: { AppIcons },
  setup(props, context) {
    const appStore = useAppStore();
    const userName = computed(() => appStore.state.userInfo.name);
    const title = computed(() => appStore.state.title);
    const isMobile = computed(() => appStore.state.isMobile);
    const state = reactive({
      collapsed: props.propCollapsed,
      fullscreen: false,
      layoutSettings: {
        state: props.propLayoutSettingsState,
      },
    });

    watch(
      () => props.propCollapsed,
      (value) => {
        state.collapsed = value;
      }
    );

    watch(
      () => props.propLayoutSettingsState,
      (value) => {
        state.layoutSettings.state = value;
      }
    );

    const methods = {
      onCollapsed() {
        state.collapsed = !state.collapsed;
        context.emit("update:propCollapsed", state.collapsed);
      },
      onSettings() {
        context.emit("update:propLayoutSettingsState", !state.layoutSettings.state);
      },
      onLogOut() {
        //退出登录
        router.push("/login");
      },
      //全屏事件
      onFullScreen() {
        if (!screenfull.isEnabled) {
          return tools.message("您的浏览器无法使用全屏功能，请更换谷歌浏览器或者请手动点击F11按钮全屏展示！");
        }
        screenfull.toggle();
        state.fullscreen = !screenfull.isFullscreen;
      },
      //刷新当前页面
      onReload() {
        appStore.refresh(router.currentRoute.value.fullPath, router.currentRoute.value.name);
      },
    };

    return {
      ...toRefs(state),
      ...methods,
      userName,
      title,
      isMobile,
    };
  },
});
</script>
<style lang="less">
#hzy-layout {
  //覆盖样式
  .ant-layout-header {
    position: relative;
    z-index: 6;
    width: 100%;
    height: 48px !important;
    line-height: 48px !important;
  }

  //=======// 头部
  .hzy-layout-header {
    padding: 0;
    position: relative;
    display: flex;
    align-items: center;
    height: 48px;

    .hzy-header-btn {
      padding: 0 10px;
      cursor: pointer;
    }

    .hzy-header-btn:hover {
      background: rgba(243, 246, 248, 0.2);
    }

    .anticon {
      color: #fff;
    }

    .ant-dropdown-trigger {
      color: #fff;
    }

    .ant-menu-item-selected {
      .anticon {
        color: #1890ff;
      }
    }
  }
}
</style>
