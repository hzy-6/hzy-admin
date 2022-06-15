<template>
  <div>
    <a-card class="mb-15" v-show="tableData.search.state">
      <!-- 检索插槽 -->
      <slot name="search"></slot>
    </a-card>
    <a-card :bodyStyle="{ paddingBottom: 0 }">
      <a-row :gutter="[15, 15]">
        <a-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12">
          <a-space :size="15">
            <!-- 工具栏左侧插槽 -->
            <slot name="toolbar-left"></slot>
          </a-space>
        </a-col>
        <a-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12" class="text-right" style="display: inline-flex; justify-content: end">
          <a-space :size="15">
            <!-- 工具栏右侧插槽 -->
            <slot name="toolbar-right"></slot>
          </a-space>
        </a-col>
      </a-row>
      <!-- 表格 -->
      <a-spin :spinning="tableData.loading">
        <!-- size="medium" -->
        <div style="overflow: hidden; height: calc(100vh - 250px); display: initial">
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
