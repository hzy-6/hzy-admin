<template>
  <div>
    <a-button type="primary" v-print="'#print'" class="mb-15">打印</a-button>
    x:{{ x }}y:{{ y }}
    <div id="print">
      <a-table :row-selection="rowSelection" :columns="state.columns" :data-source="state.data">
        <template #bodyCell="{ column, text }">
          <template v-if="column.dataIndex === 'name'">
            <a>{{ text }}</a>
          </template>
        </template>
      </a-table>
    </div>
    <div ref="el" :style="style" style="position: fixed; background-color: red; width: 100px; height: 100px">快拖动我...</div>
  </div>
</template>

<script>
export default { name: "BaseListCom" };
</script>
<script setup>
import { reactive, ref } from "vue";
import { useDraggable } from "@vueuse/core";

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

const rowSelection = {
  onChange: (selectedRowKeys, selectedRows) => {
    console.log(`selectedRowKeys: ${selectedRowKeys}`, "selectedRows: ", selectedRows);
  },
  getCheckboxProps: (record) => ({
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
