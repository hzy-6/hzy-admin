<template>
  <a-menu :theme="propMenuTheme" v-model:selectedKeys="selectedKeys" v-model:openKeys="openKeys" mode="inline" @select="onMenuSelected">
    <!--   <a-menu-item key="/home" title="首页">
      <AppIcons name="HomeOutlined" />
      <span>首页</span>
    </a-menu-item>
    <a-menu-item key="/antd/vue/components" title="Antd Vue3.0 组件库">
      <AppIcons name="LayoutOutlined" />
      <span>Antd Vue3.0 组件库</span>
    </a-menu-item>
    <a-menu-item key="/button" title="按钮">
      <AppIcons name="AppstoreOutlined" />
      <span>按钮</span>
    </a-menu-item>
    <a-sub-menu key="sub2">
      <template #title>
        <span>
          <AppIcons name="PieChartOutlined" />
          <span>图表 AntV G2</span>
        </span>
      </template>
      <a-menu-item key="/chart/base" title="基础图表">基础图表</a-menu-item>
      <a-menu-item key="/chart/more" title="更多示例">更多示例</a-menu-item>
    </a-sub-menu>
    <a-sub-menu key="sub3">
      <template #title>
        <span>
          <AppIcons name="TableOutlined" />
          <span>表格管理</span>
        </span>
      </template>
      <a-menu-item key="/base/list" title="基础列表">基础列表</a-menu-item>
      <a-menu-item key="/list" title="标准列表">标准列表</a-menu-item>
    </a-sub-menu>
    <a-menu-item key="/editor" title="富文本编辑器">
      <AppIcons name="PicRightOutlined" />
      <span>富文本编辑器</span>
    </a-menu-item>-->

    <!-- 动态生成 topnav-->
    <template v-if="topNavValue">
      <template v-for="item in subMenus.filter((w) => w.show)">
        <a-menu-item v-if="item.children.length === 0" :key="item.jumpUrl ? item.jumpUrl : item.id" :title="item.name">
          <AppIcons :name="item.icon" />
          <span>{{ item.name }}</span>
        </a-menu-item>
        <LayoutSubMenus v-else :menu-info="item" :key="item.id" />
      </template>
    </template>
    <template v-else>
      <template v-for="item in menus.filter((w) => w.show)">
        <a-menu-item v-if="item.children.length === 0" :key="item.jumpUrl ? item.jumpUrl : item.id" :title="item.name">
          <AppIcons :name="item.icon" />
          <span>{{ item.name }}</span>
        </a-menu-item>
        <LayoutSubMenus v-else :menu-info="item" :key="item.id" />
      </template>
    </template>
  </a-menu>
</template>
<script>
import { defineComponent, reactive, toRefs, watch, computed } from "vue";
import AppIcons from "@/components/AppIcons.vue";
import router from "@/router/index";
import useAppStore from "@/store/index";
import LayoutSubMenus from "./LayoutSubMenus.vue";

export default defineComponent({
  name: "LayoutMenusCom",
  components: { AppIcons, LayoutSubMenus },
  props: {
    propMenuTheme: {
      type: String,
      required: true,
    },
  },
  setup() {
    var appStore = useAppStore();
    const fullPath = router.currentRoute.value.fullPath;
    const menus = computed(() => appStore.state.userInfo.menus);
    //topnav 菜单
    const topNavValue = computed(() => appStore.state.topNav);
    const subMenus = computed(() => appStore.state.submenus);

    const state = reactive({
      defaultSelectedKeys: [fullPath],
      selectedKeys: [fullPath],
      openKeys: getOpenMenuKeys(),
    });

    watch(
      () => router.currentRoute.value,
      (value) => {
        state.selectedKeys = [value.fullPath];
      }
    );

    //菜单选中
    const onMenuSelected = (obj) => {
      if (obj.key.indexOf("http://") > -1 || obj.key.indexOf("https://") > -1) {
        router.push("/external/jump/" + obj.key);
      } else {
        router.push(obj.key);
      }
    };

    /**
     * 获取当前打开的菜单 并找到他的所有父级
     * @returns
     */
    function getOpenMenuKeys() {
      let route = router.currentRoute.value;
      let levelCode = route.meta.levelCode;
      if (!levelCode) return [];
      var keys = [];
      if (levelCode.indexOf(".") > -1) {
        var ids = levelCode.split(".");
        for (var i = 0; i < ids.length - 1; i++) {
          var id = ids[i];
          keys.push(parseInt(id));
        }
      }
      return keys;
    }

    return {
      ...toRefs(state),
      onMenuSelected,
      menus,
      topNavValue,
      subMenus,
    };
  },
});
</script>
