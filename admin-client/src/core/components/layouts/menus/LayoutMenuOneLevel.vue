<script lang="ts" setup>
import { onMounted, reactive, computed, watch } from "vue";
import AppIcon from "@/core/components/AppIcon.vue";
import router from "@/core/router";
import MenuStore, { EMenuMode } from "@/core/store/layouts/MenuStore";
import AppStore from "@/core/store/AppStore";

const menuStore = MenuStore();
const appStore = AppStore();

const fullPath = computed(() => router.currentRoute.value.fullPath);
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

const methods: any = {
  //初始化 一级菜单
  initTopMenu() {
    //如果当前路由 父级菜单 有 则切换到这个菜单上去
    if (topMenuId.value) {
      state.selectedKey = topMenuId.value.toString();
      methods.onMenuSelected(topMenuId.value.toString());
    } else {
      if (appStore.state.oneLevels.length > 0) {
        var menu = appStore.state.oneLevels[0];
        state.selectedKey = methods.getJumpUrl(menu);
        methods.onMenuSelected(state.selectedKey);
      }
    }
  },
  //菜单选中
  onMenuSelected(urlOrId: string) {
    const routeInfo = appStore.getRouterByFullPath(urlOrId);
    if (routeInfo && router.hasRoute(routeInfo.name as string) && state.selectedKey != urlOrId) {
      router.push(urlOrId);
    } else {
      state.selectedKey = urlOrId;
      appStore.setSubmenu(urlOrId);
    }
  },
  getJumpUrl(item: any) {
    return item.jumpUrl ? item.jumpUrl : item.componentName ? item.componentName : item.id;
  },
};

//页面加载 钩子函数
onMounted(() => {
  appStore.createOneLevelMenu();
  methods.initTopMenu();
});
</script>

<template>
  <!-- 左侧模式 -->
  <div class="hzy-left-nav" v-if="menuStore.state.menuMode == EMenuMode.left">
    <div class="hzy-logo">
      <AppIcon name="AntDesignOutlined" style="font-size: 30px; color: #1890ff" />
    </div>
    <ul>
      <template v-for="item in appStore.state.oneLevels">
        <a-tooltip placement="right">
          <template #title>{{ item.name }}</template>
          <li :key="methods.getJumpUrl(item)" :class="{ active: methods.getJumpUrl(item) == state.selectedKey }" @click="methods.onMenuSelected(methods.getJumpUrl(item))">
            <AppIcon :name="item.icon" :size="22" />
          </li>
        </a-tooltip>
      </template>
    </ul>
  </div>
  <!-- 顶部模式 -->
  <ul class="hzy-one-nav" v-if="menuStore.state.menuMode == EMenuMode.top">
    <li
      v-for="item in appStore.state.oneLevels"
      :key="methods.getJumpUrl(item)"
      :class="{ active: methods.getJumpUrl(item) == state.selectedKey }"
      @click="methods.onMenuSelected(methods.getJumpUrl(item))"
    >
      <div class="menu-item">
        <AppIcon :name="item.icon" :size="16" v-if="item.icon" />
        <div class="ml-5">{{ item.name }}</div>
      </div>
    </li>
  </ul>
</template>

<style lang="less" scoped>
.hzy-left-nav {
  background-color: #000000;
  z-index: 7;
  box-shadow: 8px 0px 2px 0 rgba(0, 0, 0, 0.1);
  width: v-bind("menuStore.state.leftModeWidth+'px'");

  ul {
    margin: 0;
    padding: 0;
    list-style: none;

    li {
      text-align: center;
      cursor: pointer;
      color: #fff;
      padding: 4px 0px;
      margin: 16px 8px;
      border-radius: 4px;
    }
    .active {
      background: #2f54eb;
      //
      transition: background-color 0.1s;
      -moz-transition: background-color 0.1s;
      /* Firefox 4 */
      -webkit-transition: background-color 0.1s;
      /* Safari 和 Chrome */
      -o-transition: background-color 0.1s;
    }
    li:hover {
      background: #2f54eb;
    }
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
    justify-content: center;
    align-items: center;
    display: inline-flex;
    padding: 0 8px;

    .menu-item {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      height: 32px;
      padding: 2px 15px;
      border-radius: 4px;
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
      background: #2f54eb;
      * {
        color: #fff !important;
      }
    }
  }

  .menu-item:hover {
    background: #2f54eb;
    * {
      color: #fff !important;
    }
  }
}
</style>
