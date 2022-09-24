<template>
  <div>
    <a-card :bodyStyle="{ paddingBottom: 0 }">
      <!-- 工具栏插槽 -->
      <div>
        <transition name="fade-transform" mode="out-in">
          <a-card class="mb-15 mt-15 search-card" v-show="tableData.search.state">
            <!-- 检索插槽 -->
            <slot name="search"></slot>
          </a-card>
        </transition>
        <a-space :size="15">
          <slot name="toolbar"></slot>
        </a-space>
      </div>
      <!-- 表格 -->
      <a-spin :spinning="tableData.loading">
        <!-- size="medium" -->
        <div style="overflow: hidden; height: calc(100vh - 250px); display: initial">
          <slot name="table">
            <vxe-table
              class="mt-15"
              ref="table"
              auto-resize
              height="auto"
              border
              stripe
              :data="tableData.data"
              :row-config="{ isCurrent: true, isHover: true }"
              :column-config="{ isCurrent: true, resizable: true }"
              :checkbox-config="{ highlight: true }"
            >
              <slot name="table-col">
                <vxe-column type="seq" width="50"></vxe-column>
                <vxe-column type="checkbox" width="50"></vxe-column>
                <!-- 表格列插槽 -->
                <slot name="table-col-default"></slot>
              </slot>
            </vxe-table>
          </slot>
        </div>
        <!-- 分页插件 -->
        <vxe-pager
          background
          v-model:current-page="tableData.page"
          v-model:page-size="tableData.rows"
          :total="tableData.total"
          :page-sizes="pageSizeOptions"
          :layouts="['PrevJump', 'PrevPage', 'JumpNumber', 'NextPage', 'NextJump', 'Sizes', 'FullJump', 'Total']"
          @page-change="onChange"
        >
        </vxe-pager>
      </a-spin>
    </a-card>
  </div>
</template>
<!-- 脚本 -->
<script setup>
import { useSlots } from "vue";
import { ref, computed } from "vue";

//定义 props
const props = defineProps({
  tableData: Object,
});

const tableData = computed(() => props.tableData);
const table = ref(null);
const pageSizeOptions = ref([10, 20, 50, 100, 500, 1000]);

//定义事件
const emit = defineEmits("onChange");

const onChange = (data) => {
  emit("onChange", data);
};

//暴露属性
defineExpose({
  table,
});

// const slots = useSlots();
</script>

<style scoped lang="less">
.search-card {
  position: absolute;
  z-index: 12;
  // margin-right: 15px;
  right: 0;
  left: 0;
  top: -15px;
  backdrop-filter: saturate(50%) blur(10px);
  -webkit-backdrop-filter: saturate(50%) blur(10px);
  background-color: initial;
  box-shadow: 0px 0px 12px rgba(0, 0, 0, 0.12);
}
</style>
