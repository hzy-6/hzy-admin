<script lang="ts" setup>
import { reactive, ref } from "vue";
import { useDraggable } from "@vueuse/core";
import PageContainer from "@/core/components/PageContainer.vue";
defineOptions({ name: "BaseListCom" });

const columns = [
  {
    title: "Name",
    dataIndex: "name",
  },
  {
    title: "Age",
    dataIndex: "age",
  },
  {
    title: "Address",
    dataIndex: "address",
  },
];
const data = [
  {
    key: "1",
    name: "John Brown",
    age: 32,
    address: "New York No. 1 Lake Park",
  },
  {
    key: "2",
    name: "Jim Green",
    age: 42,
    address: "London No. 1 Lake Park",
  },
  {
    key: "3",
    name: "Joe Black",
    age: 32,
    address: "Sidney No. 1 Lake Park",
  },
  {
    key: "4",
    name: "Disabled User",
    age: 99,
    address: "Sidney No. 1 Lake Park",
  },
];

const state = reactive({
  columns,
  data,
});

const rowSelection: any = {
  onChange: (selectedRowKeys: string[], selectedRows: any[]) => {
    console.log(`selectedRowKeys: ${selectedRowKeys}`, "selectedRows: ", selectedRows);
  },
  getCheckboxProps: (record: any) => ({
    disabled: record.name === "Disabled User", // Column configuration not to be checked
    name: record.name,
  }),
};

const el = ref(null);

// `style` will be a helper computed for `left: ?px; top: ?px;`
const { x, y, style } = useDraggable(el, {
  initialValue: { x: 500, y: 200 },
});
</script>

<template>
  <PageContainer>
    <a-button type="primary" class="mb-16" v-print="'#print'">打印</a-button>

    <div id="print">
      <a-table :row-selection="rowSelection" :columns="state.columns" :data-source="state.data">
        <template #bodyCell="{ column, text }">
          <template v-if="column.dataIndex === 'name'">
            <a>{{ text }}</a>
          </template>
        </template>
      </a-table>
    </div>
    <div ref="el" :style="style" style="position: fixed; background-color: red; width: 100px; height: 100px; color: #fff; cursor: pointer">快拖动我... x:{{ x }}y:{{ y }}</div>
  </PageContainer>
</template>
