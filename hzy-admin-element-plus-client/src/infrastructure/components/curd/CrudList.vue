<!-- 脚本 -->
<script lang="ts" setup>
import { ref, computed } from "vue";
import ICrudITableData from "@/infrastructure/typings/ICrudITableData";
import { ElTable } from "element-plus";

//定义 props
const props = defineProps<{
  tableData: ICrudITableData;
}>();
//定义事件
const emits = defineEmits<{
  (e: "onCurrentChange", currentPage: number): void;
  (e: "onSizeChange", currentPageSize: number): void;
}>();

const tableData = computed(() => props.tableData);
const table = ref<InstanceType<typeof ElTable>>();
const pageSizeOptions = ref([15, 20, 500, 1000]);

const onCurrentChange = (currentPage: number) => {
  emits("onCurrentChange", currentPage);
};

const onSizeChange = (currentPageSize: number) => {
  emits("onSizeChange", currentPageSize);
};

//暴露属性
defineExpose({
  table,
});
</script>

<template>
  <div v-loading="tableData.loading">
    <!-- 高级检索 -->
    <div style="position: relative">
      <el-collapse-transition>
        <el-card class="search-card" v-show="tableData.search.state">
          <el-form label-position="left" label-width="auto">
            <el-row :gutter="20">
              <!-- 检索插槽 -->
              <slot name="search"></slot>
            </el-row>
          </el-form>
        </el-card>
      </el-collapse-transition>
    </div>
    <!-- 工具栏插槽 -->
    <div class="mb-20">
      <slot name="toolbar"></slot>
    </div>
    <!-- 表格 -->
    <slot>
      <el-table ref="table" :data="tableData.data" border stripe height="calc(100vh - 250px)" class="mb-20" table-layout="fixed" highlight-current-row>
        <slot name="table-col-default">
          <el-table-column type="index" width="50" />
          <el-table-column type="selection" width="50" />
          <!-- 表格列插槽 -->
          <slot name="table-col"></slot>
        </slot>
        <template #empty>
          <el-empty description="暂无数据" />
        </template>
      </el-table>
    </slot>
    <!-- 分页 -->
    <!-- small -->
    <el-pagination
      v-model:currentPage="tableData.page"
      v-model:page-size="tableData.rows"
      :total="tableData.total"
      :page-sizes="pageSizeOptions"
      background
      layout="total, sizes, prev, pager, next, jumper"
      @current-change="onCurrentChange"
      @size-change="onSizeChange"
    />
  </div>
</template>

<style lang="less" scoped>
.search-card {
  position: absolute;
  z-index: 9;
  backdrop-filter: saturate(50%) blur(20px);
  -webkit-backdrop-filter: saturate(50%) blur(20px);
  background-color: initial;
}
</style>
