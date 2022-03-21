<template>
  <!-- 左侧模式 -->
  <div class="hzy-left-nav" v-if="menuStoreState.oneLevelMenuMode == 3">
    <div class="hzy-logo-img">
      <AppIcon name="AntDesignOutlined" style="font-size: 48px; color: #1890ff" />
    </div>
    <ul>
      <li v-for="item in appStoreState.oneLevels" :key="getJumpUrl(item)" :class="{ active: getJumpUrl(item) == selectedKey }" @click="onMenuSelected(getJumpUrl(item))">
        <a-tooltip placement="right">
          <template #title>{{ item.name }}</template>
          <AppIcon :name="item.icon" />
          <div class="title">{{ item.name }}</div>
        </a-tooltip>
      </li>
    </ul>
  </div>
  <!-- 顶部模式 -->
  <ul class="hzy-one-nav" v-if="menuStoreState.oneLevelMenuMode == 2">
    <li v-for="item in appStoreState.oneLevels" :key="getJumpUrl(item)" :class="{ active: getJumpUrl(item) == selectedKey }" @click="onMenuSelected(getJumpUrl(item))">
      <div class="menu-item">
        <AppIcon :name="item.icon" :size="16" />
        <div class="ml-5">{{ item.name }}</div>
      </div>
    </li>
  </ul>
</template>

<script>
import { defineComponent, onMounted, reactive, toRefs, computed, watch } from "vue";
import AppIcon from "@/components/AppIcon.vue";
import { useAppStore, useHeaderStore, useMenuStore } from "@/store";
import router from "@/router";

export default defineComponent({
  name: "LayoutOneLevelMenuVue",
  components: { AppIcon },
  setup() {
    const fullPath = computed(() => router.currentRoute.value.fullPath);
    const appStore = useAppStore();
    const appStoreState = computed(() => appStore.state);
    const headerStore = useHeaderStore();
    const headerStoreState = computed(() => headerStore.state);
    const menuStore = useMenuStore();
    const menuStoreState = computed(() => menuStore.state);
    const topMenuId = computed(() => appStore.getTopMenuIdByCurrentRoute());
    const state = reactive({
      selectedKey: fullPath.value,
    });

    watch(
      () => router.currentRoute.value,
      (value) => {
        methods.initTopMenu();
      }
    );

    const methods = {
      //初始化 一级菜单
      initTopMenu() {
        //如果当前路由 父级菜单 有 则切换到这个菜单上去
        if (topMenuId.value) {
          state.selectedKey = topMenuId.value;
          methods.onMenuSelected(topMenuId.value);
        } else {
          if (appStoreState.value.oneLevels.length > 0) {
            var menu = appStoreState.value.oneLevels[0];
            state.selectedKey = methods.getJumpUrl(menu);
            methods.onMenuSelected(state.selectedKey);
          }
        }
      },
      //菜单选中
      onMenuSelected(urlOrId) {
        const routeInfo = appStore.getRouterByFullPath(urlOrId);
        if (routeInfo && router.hasRoute(routeInfo.name)) {
          router.push({ path: urlOrId });
        } else {
          state.selectedKey = urlOrId;
          appStore.setSubmenu(urlOrId);
        }
      },
      getJumpUrl(item) {
        return item.jumpUrl ? item.jumpUrl : item.componentName ? item.componentName : item.id;
      },
    };

    //页面加载 钩子函数
    onMounted(() => {
      appStore.createOneLevelMenu();
      methods.initTopMenu();
    });

    return {
      ...toRefs(state),
      ...methods,
      appStoreState,
      headerStoreState,
      menuStoreState,
    };
  },
});
</script>
<style lang="less" scoped>
.hzy-left-nav {
  color: #ffffff;
  background-color: #000000;
  width: 80px;
  z-index: 7;
  box-shadow: 5px 0px 2px 0 rgba(0, 0, 0, 0.1);

  ul {
    margin: 0;
    padding: 0;
    list-style: none;
    li {
      text-align: center;
      cursor: pointer;
      padding: 13px 0;
      height: 80px;
      color: #8c8c8c;

      .anticon {
        font-size: 25px;
      }
      .title {
        padding-left: 5px;
        padding-right: 5px;
        padding-top: 5px;
        width: 100%;
        text-align: center;
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
      }
    }

    .active {
      // background-color: #1890ff;
      border-left: 2px solid #1890ff;
      color: #d9d9d9;
    }
  }
  li:hover {
    // background-color: #1890ff;
    border-right: 2px solid #1890ff;
    color: #d9d9d9;
  }
}

.hzy-one-nav {
  margin: 0;
  padding: 0;
  list-style: none;
  display: inline-flex;

  li {
    text-align: center;
    cursor: pointer;
    color: rgba(0, 0, 0, 0.85);
    justify-content: center;
    align-items: center;
    display: inline-flex;
    padding: 0 8px;

    .menu-item {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      height: 32px;
      padding: 4px 15px;
      border-radius: 2px;
      //
      transition: background-color 0.3s;
      -moz-transition: background-color 0.3s;
      /* Firefox 4 */
      -webkit-transition: background-color 0.3s;
      /* Safari 和 Chrome */
      -o-transition: background-color 0.3s;
    }
  }

  .active {
    .menu-item {
      background: #1890ff;
      * {
        color: #fff !important;
      }
    }
  }

  .menu-item:hover {
    background: #1890ff;
    * {
      color: #fff !important;
    }
  }
}
</style>
