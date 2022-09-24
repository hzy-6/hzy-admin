<script lang="ts" setup>
import { onMounted, reactive, computed, watch } from "vue";
import AppIcon from "@/infrastructure/components/AppIcon.vue";
import router from "@/infrastructure/router";
import AppConsts from "@/infrastructure/scripts/AppConsts";

import MenuStore, { EMenuMode } from "@/infrastructure/store/layouts/MenuStore";
import AppStore from "@/infrastructure/store/AppStore";
//
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
    if (routeInfo && router.hasRoute(routeInfo.name)) {
      //如果跳转的地址就算当前已经打开得地址则不跳转
      if (router.currentRoute.value.fullPath.indexOf(urlOrId) < 0) {
        router.push(urlOrId);
      }
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
  <div class="hzy-left-nav" v-if="menuStore.state.menuMode == EMenuMode.left" :style="{ width: menuStore.state.minWidth + 'px' }">
    <!-- <div class="hzy-logo-img">
      <div>
        <img src="" width="45" />
      </div>
    </div> -->
    <ul>
      <template v-for="item in appStore.state.oneLevels">
        <el-tooltip :content="item.name" placement="right">
          <li :key="methods.getJumpUrl(item)" :class="{ active: methods.getJumpUrl(item) == state.selectedKey }" @click="methods.onMenuSelected(methods.getJumpUrl(item))">
            <AppIcon :name="item.icon" :size="25" v-if="item.icon" />
          </li>
        </el-tooltip>
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
// 左侧一级
.hzy-left-nav {
  background-color: #000000;
  z-index: 7;
  box-shadow: 5px 0px 2px 0 rgba(0, 0, 0, 0.1);

  ul {
    margin: 0;
    padding: 0;
    list-style: none;

    li {
      text-align: center;
      cursor: pointer;
      padding: 5px 0px;
      margin: 15px 5px;
      color: #fff;
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

  .hzy-logo-img {
    height: 100px;
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
  }
}

// 顶部一级
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
    --color: inherit;
    color: var(--color);

    .menu-item {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      height: 32px;
      padding: 0px 12px;
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
