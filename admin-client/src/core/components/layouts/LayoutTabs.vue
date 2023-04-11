<script lang="ts" setup>
import { onMounted, watch, computed } from "vue";
import AppIcon from "@/core/components/AppIcon.vue";
import router from "@/core/router";
import TabsStore from "@/core/store/layouts/TabsStore";

//tabs
const tabsStore = TabsStore();

onMounted(() => {
  addTags();
});

watch(
  () => router.currentRoute.value.fullPath,
  (value) => {
    addTags();
  }
);

function addTags() {
  tabsStore.addTab(router.currentRoute.value);
}

function onEdit(key: any, action: any) {
  if (action === "remove") {
    removeTab(key);
  }
}

function removeTab(key: string) {
  tabsStore.closeTabSelf(key);
}

function closeTabOther() {
  tabsStore.closeTabOther(tabsStore.state.activeKey);
}

function closeTabAll() {
  tabsStore.closeTabAll();
}

function tabOnChange(activeKey: any) {
  tabsStore.state.activeKey = activeKey;
  tabsStore.tabClick(activeKey);
}
</script>

<template>
  <div class="hzy-tabs">
    <a-tabs hide-add tabPosition="top" type="editable-card" :tabBarGutter="0" @edit="onEdit" @change="tabOnChange" :activeKey="tabsStore.state.activeKey">
      <a-tab-pane v-for="item in tabsStore.state.tabs" :key="item.fullPath" :closable="item.meta.close">
        <template #tab>
          <span>{{ item.meta.title }}</span>
        </template>
        <template #closeIcon>
          <AppIcon name="CloseOutlined" :size="12" class="close" />
        </template>
      </a-tab-pane>
      <template #rightExtra>
        <a-dropdown placement="bottomRight">
          <AppIcon name="MoreOutlined" class="pl-16 pr-16" style="height: 100%" :size="16" />
          <template #overlay>
            <a-menu>
              <a-menu-item key="2" @click="closeTabOther()">
                <template #icon>
                  <AppIcon name="CloseOutlined" />
                </template>
                关闭其他
              </a-menu-item>
              <a-menu-item key="3" @click="closeTabAll()">
                <template #icon>
                  <AppIcon name="DeleteOutlined" />
                </template>
                关闭全部
              </a-menu-item>
            </a-menu>
          </template>
        </a-dropdown>
      </template>
    </a-tabs>
  </div>
</template>

<style lang="less" scope>
.hzy-tabs {
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
    background: transparent !important;

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
