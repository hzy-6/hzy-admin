<script lang="ts" setup>
import { onMounted, watch, computed } from "vue";
import router from "@/infrastructure/router";
import CoreStore from "@/infrastructure/store/layouts/CoreStore";
import MenuStore from "@/infrastructure/store/layouts/MenuStore";
import TabsStore from "@/infrastructure/store/layouts/TabsStore";

const coreStore = CoreStore();
const menuStore = MenuStore();
const tabsStore = TabsStore();

const active = computed(() => router.currentRoute.value.fullPath);
const tabsState = computed(() => tabsStore.state);

const methods: any = {
  addTags() {
    tabsStore.addTab(router.currentRoute.value);
  },
  onEdit(key: string, action: string) {
    if (action === "remove") {
      methods.removeTab(key);
    }
  },
  /**
   * 关闭标签
   */
  removeTab(key: string) {
    tabsStore.closeTabSelf(key);
  },
  /**
   * 关闭其他标签
   */
  closeTabOther() {
    tabsStore.closeTabOther(active.value);
  },
  /**
   * 关闭所有标签
   */
  closeTabAll() {
    tabsStore.closeTabAll();
  },
  /**
   * 标签点击选中
   */
  tabOnChange(activeKey: string) {
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
</script>

<template>
  <div class="hzy-layout-tabs">
    <div class="hzy-layout-tabs-left" :style="{ width: 'calc(100vw - ' + ((coreStore.state.isMobile ? 0 : menuStore.state.width) + 40) + 'px)' }">
      <el-tabs type="card" :modelValue="active" @tabRemove="methods.removeTab" @tabChange="methods.tabOnChange">
        <el-tab-pane v-for="item in tabsState.tabs" :key="item.fullPath" :name="item.fullPath" :closable="item.meta.close">
          <template #label>
            {{ item.meta.title }}
          </template>
        </el-tab-pane>
      </el-tabs>
    </div>
    <!-- 更多操作 -->
    <div class="hzy-layout-tabs-right">
      <el-dropdown>
        <span class="hzy-layout-tabs-right-dropdown-name">
          <el-icon><MoreFilled /></el-icon>
        </span>
        <template #dropdown>
          <el-dropdown-menu>
            <el-dropdown-item icon="Close" @click="methods.closeTabOther()">关闭其他</el-dropdown-item>
            <el-dropdown-item icon="Delete" @click="methods.closeTabAll()">关闭全部 </el-dropdown-item>
          </el-dropdown-menu>
        </template>
      </el-dropdown>
    </div>
  </div>
</template>

<style lang="less">
.hzy-layout-tabs {
  display: flex;
  border-bottom: 1px solid var(--el-border-color-light);
  .hzy-layout-tabs-left {
    flex: 1;
    .el-tabs--border-card {
      border: 0;
      background: none;
      .el-tabs__header {
        border-bottom: 0;
        background: none;
      }
    }
    .el-tabs__header {
      margin: 0 !important;
    }

    .el-tabs__content {
      display: none !important;
    }

    // .el-tabs--border-card > .el-tabs__header .el-tabs__item {
    //   margin-top: 1px !important;
    // }

    .el-tabs--card > .el-tabs__header .el-tabs__nav {
      border-radius: 0px 0px 0 0 !important;
    }

    .el-tabs--card > .el-tabs__header {
      border: 0 !important;
    }

    .el-tabs__item.is-active {
      border-right-color: var(--el-fill-color-light);
      border-left-color: var(--el-fill-color-light);
      background-color: var(--el-fill-color-light);
      margin-top: 1px;
      height: 39px;
    }

    .el-tabs--card > .el-tabs__header .el-tabs__item.is-active {
      border-bottom-color: initial;
    }

    .el-tabs--card > .el-tabs__header .el-tabs__item {
      border-bottom: 0;
    }
  }

  .el-tabs--card > .el-tabs__header .el-tabs__nav {
    border: 0;
  }

  .el-tabs--card > .el-tabs__header .el-tabs__item {
    border: 0;
  }

  .el-tabs__nav-wrap {
    margin-bottom: 0px;
  }

  .hzy-layout-tabs-right {
    width: 40px;
    cursor: pointer;
    .el-dropdown {
      width: 100%;
      height: 100%;
      .hzy-layout-tabs-right-dropdown-name {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 100%;
        height: 100%;
      }
    }
    .el-dropdown:hover {
      background: rgba(243, 246, 248, 0.5);
    }
  }
}
</style>