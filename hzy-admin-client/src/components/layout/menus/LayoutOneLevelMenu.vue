<template>
  <!-- 左侧模式 -->
  <div class="hzy-left-nav" v-if="menuStoreState.oneLevelMenuMode == 3">
    <div class="hzy-logo-img">
      <AppIcon name="AntDesignOutlined" style="font-size: 48px; color: #1890ff" />
    </div>
    <ul>
      <template v-for="item in appStoreState.oneLevels">
        <a-tooltip placement="right">
          <template #title>{{ item.name }}</template>
          <li :key="methods.getJumpUrl(item)" :class="{ active: methods.getJumpUrl(item) == state.selectedKey }" @click="methods.onMenuSelected(methods.getJumpUrl(item))">
            <AppIcon :name="item.icon" :size="25" />
          </li>
        </a-tooltip>
      </template>
    </ul>
  </div>
  <!-- 顶部模式 -->
  <ul class="hzy-one-nav" v-if="menuStoreState.oneLevelMenuMode == 2">
    <li
      v-for="item in appStoreState.oneLevels"
      :key="methods.getJumpUrl(item)"
      :class="{ active: methods.getJumpUrl(item) == state.selectedKey }"
      @click="methods.onMenuSelected(methods.getJumpUrl(item))"
    >
      <div class="menu-item">
        <AppIcon :name="item.icon" :size="16" />
        <div class="ml-5">{{ item.name }}</div>
      </div>
    </li>
  </ul>
</template>

<script>
export default { name: "LayoutOneLevelMenuVue" };
</script>
<script setup>
import { onMounted, reactive, computed, watch } from "vue";
import AppIcon from "@/components/AppIcon.vue";
import { useAppStore, useHeaderStore, useMenuStore } from "@/store";
import router from "@/router";

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
</script>
<style lang="less" scoped>
.hzy-left-nav {
  background-color: #000000;
  z-index: 7;
  box-shadow: 5px 0px 2px 0 rgba(0, 0, 0, 0.1);
  width: 60px;

  ul {
    margin: 0;
    padding: 0;
    list-style: none;

    li {
      text-align: center;
      cursor: pointer;
      color: #fff;
      padding: 5px 0px;
      margin: 15px 5px;
    }
    .active {
      color: #1890ff;
      border-left: 2px solid #1890ff;
      //
      transition: background-color 0.1s;
      -moz-transition: background-color 0.1s;
      /* Firefox 4 */
      -webkit-transition: background-color 0.1s;
      /* Safari 和 Chrome */
      -o-transition: background-color 0.1s;
    }
  }
  li:hover {
    color: #1890ff;
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
