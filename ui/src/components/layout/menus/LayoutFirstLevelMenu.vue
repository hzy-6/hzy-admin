<template>
  <div class="hzy-left-nav">
    <div class="hzy-logo-img">
      <AppIcons name="AntDesignOutlined" style="font-size: 48px; color: #1890ff" />
    </div>
    <ul>
      <li v-for="item in oneLevels.filter((w) => w.show)" :key="getJumpUrl(item)" :class="{ active: getJumpUrl(item) == selectedKey }" @click="onMenuSelected(getJumpUrl(item))">
        <a-tooltip placement="right">
          <template #title>{{ item.name }}</template>
          <AppIcons :name="item.icon" />
          <div class="title">{{ item.name }}</div>
        </a-tooltip>
      </li>
    </ul>
  </div>
</template>
<script>
import { defineComponent, onMounted, reactive, toRefs, computed } from "vue";
import AppIcons from "@/components/AppIcons.vue";
import useAppStore from "@/store";
import router from "@/router/index";

export default defineComponent({
  name: "LayoutFirstLevelMenuCom",
  components: { AppIcons },
  setup() {
    const fullPath = router.currentRoute.value.fullPath;
    const appStore = useAppStore();
    const menus = computed(() => appStore.state.userInfo.menus);
    const topMenuId = computed(() => appStore.getTopMenuIdByCurrentRoute());
    const state = reactive({
      oneLevels: [],
      selectedKey: fullPath,
    });

    const methods = {
      //初始化 一级菜单
      initTopMenu() {
        state.oneLevels = menus.value.filter((w) => w.parentId == null || w.parentId == "");
        //如果当前路由 父级菜单 有 则切换到这个菜单上去
        if (topMenuId.value) {
          state.selectedKey = topMenuId.value;
          methods.onMenuSelected(topMenuId.value);
        } else {
          if (state.oneLevels.length > 0) {
            var menu = state.oneLevels[0];
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
      methods.initTopMenu();
    });

    return {
      ...toRefs(state),
      ...methods,
    };
  },
});
</script>
<style lang="less" scoped>
.hzy-left-nav {
  color: #ffffff;
  background-color: #001529;
  width: 80px;
  z-index: 7;
  box-shadow: 5px 0px 2px 0 rgba(0, 0, 0, 0.1);
  // border-right: 1px solid #f0f2f5;

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
</style>
