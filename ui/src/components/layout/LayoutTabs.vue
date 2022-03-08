<template>
  <div class="app-tabs">
    <a-tabs hide-add tabPosition="top" type="editable-card" :tabBarGutter="0" @edit="onEdit" @change="tabOnChange" v-model:activeKey="activeKey">
      <a-tab-pane v-for="item in tabs" :key="item.fullPath" :closable="item.meta.close">
        <template #tab>
          <span class="tab-title" style="user-select: none">{{ item.meta.title }}</span>
        </template>
        <template #closeIcon>
          <AppIcons name="CloseOutlined" />
        </template>
      </a-tab-pane>
      <template #rightExtra>
        <a-dropdown>
          <AppIcons name="DownOutlined" class="pl-20 pr-20" style="height: 100%" />
          <template #overlay>
            <a-menu>
              <a-menu-item key="2" @click="closeTabOther()">关闭其他</a-menu-item>
              <a-menu-item key="3" @click="closeTabAll()">关闭全部</a-menu-item>
            </a-menu>
          </template>
        </a-dropdown>
      </template>
    </a-tabs>
  </div>
</template>
<script>
import { defineComponent, onMounted, watch, ref, computed } from "vue";
import useAppStore from "@/store";
import AppIcons from "@/components/AppIcons.vue";
import router from "@/router/index";

export default defineComponent({
  name: "LayoutTabsCom",
  components: { AppIcons },
  setup() {
    //计算属性
    const appStore = useAppStore();
    const tabs = computed(() => appStore.state.tabs);
    const activeKey = ref("");

    watch(
      () => router.currentRoute.value.fullPath,
      (value) => {
        activeKey.value = value;
        methods.addTags();
      }
    );

    const methods = {
      addTags() {
        appStore.addTab(router.currentRoute.value);
        activeKey.value = router.currentRoute.value.fullPath;
      },
      onEdit(key, action) {
        if (action === "remove") {
          appStore.closeTabSelf(key);
        }
      },
      closeTabOther() {
        appStore.closeTabOther(activeKey.value);
      },
      closeTabAll() {
        appStore.closeTabAll();
      },
      tabOnChange(activeKey) {
        appStore.tabClick(activeKey);
      },
    };

    onMounted(() => {
      methods.addTags();
    });

    return {
      tabs,
      activeKey,
      ...methods,
    };
  },
});
</script>
<style lang="less" scope>
.app-tabs {
  position: relative;
  left: 0;
  width: 100%;
  z-index: 5;
  background: #ffffff;
  border-top: 1px solid #f0f2f5;
  border-bottom: 1px solid #f0f2f5;
  // box-shadow: 0px 1px 1px rgba(0, 21, 41, 0.08);
  .ant-tabs-nav {
    margin: 0 !important;
    .ant-tabs-tab-active {
      background: #f0f2f5 !important;
    }
  }

  .ant-tabs-tab {
    background: #ffffff !important;
    border: 0 !important;
    border-radius: 0 !important;
    padding: 8px 18px !important;
  }

  .tab-more {
    position: absolute;
    margin-top: 13px;
    left: 18px;
    display: none;
  }

  // .ant-tabs-tab:hover {
  //   .ant-tabs-tab-remove {
  //     display: inline-block;
  //   }
  // }

  // .ant-tabs-tab-remove {
  //   display: none;
  // }

  .ant-tabs-tab.ant-tabs-tab-active {
    color: rgba(0, 0, 0, 0.45) !important;
    text-shadow: 0 0 0.25px currentColor;
    .tab-title {
      color: #5b8ff9 !important;
      text-shadow: 0 0 0.25px currentColor !important;
    }
  }
}
</style>
