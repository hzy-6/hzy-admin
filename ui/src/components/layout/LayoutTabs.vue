<template>
  <div class="app-tabs">
    <a-tabs hide-add tabPosition="top" type="editable-card" :tabBarGutter="0" @edit="onEdit" @change="tabOnChange" :activeKey="active">
      <a-tab-pane v-for="item in tabsStoreState.tabs" :key="item.fullPath" :closable="item.meta.close">
        <template #tab>
          <span>{{ item.meta.title }}</span>
        </template>
        <template #closeIcon>
          <AppIcon name="CloseOutlined" :size="12" class="close" />
        </template>
      </a-tab-pane>
      <template #rightExtra>
        <a-dropdown placement="bottomRight">
          <AppIcon name="DownOutlined" class="pl-20 pr-20" style="height: 100%" />
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
import { defineComponent, onMounted, watch, computed } from "vue";
import { useTabsStore } from "@/store";
import AppIcon from "@/components/AppIcon.vue";
import router from "@/router";

export default defineComponent({
  name: "LayoutTabsCom",
  components: { AppIcon },
  setup() {
    const tabsStore = useTabsStore();
    const tabsStoreState = computed(() => tabsStore.state);
    const active = computed(() => router.currentRoute.value.fullPath);

    const methods = {
      addTags() {
        tabsStore.addTab(router.currentRoute.value);
      },
      onEdit(key, action) {
        if (action === "remove") {
          methods.removeTab(key);
        }
      },
      removeTab(key) {
        tabsStore.closeTabSelf(key);
      },
      closeTabOther() {
        tabsStore.closeTabOther(active.value);
      },
      closeTabAll() {
        tabsStore.closeTabAll();
      },
      tabOnChange(activeKey) {
        tabsStore.tabClick(activeKey);
      },
    };

    onMounted(() => {
      methods.addTags();
    });

    watch(
      () => router.currentRoute.value.fullPath,
      (value) => {
        methods.addTags();
      }
    );

    return { tabsStoreState, active, ...methods };
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

  .ant-tabs-nav {
    margin: 0 !important;
    .ant-tabs-tab-active {
      background-color: #f0f2f5 !important;
      .close {
        visibility: visible !important;
      }
    }
  }

  .ant-tabs-tab {
    border: 0 !important;
    height: 32px;
    padding: 4px 15px;

    .close {
      visibility: hidden;
    }
  }

  .ant-tabs-tab:hover {
    .close {
      visibility: visible !important;
    }
  }

  .tab-more {
    position: absolute;
    margin-top: 13px;
    left: 18px;
    display: none;
  }
}
</style>
