<script lang="ts" setup>
import PageContainer from "@/core/components/PageContainer.vue";
import {nextTick, onMounted, reactive, ref, shallowRef} from "vue";
import type {S2DataConfig, S2Options} from '@antv/s2';
import {SheetComponent} from '@antv/s2-vue';
import "@antv/s2-vue/dist/style.min.css";

defineOptions({name: "BigDataTableCom"});

const s2Options = {
  width: 600,
  height: 480
}

const s2DataConfig = {
  fields: {
    rows: ['province', 'city'],
    columns: ['type'],
    values: ['price'],
  },
  data: [
    {
      province: "浙江",
      city: "杭州",
      type: "笔",
      price: "1",
    },
    {
      province: "浙江",
      city: "杭州",
      type: "纸张",
      price: "2",
    },
    {
      province: "浙江",
      city: "舟山",
      type: "笔",
      price: "17",
    },
    {
      province: "浙江",
      city: "舟山",
      type: "纸张",
      price: "6",
    },
    {
      province: "吉林",
      city: "长春",
      type: "笔",
      price: "8",
    },
    {
      province: "吉林",
      city: "白山",
      type: "笔",
      price: "12",
    },
    {
      province: "吉林",
      city: "长春",
      type: "纸张",
      price: "3",
    },
    {
      province: "吉林",
      city: "白山",
      type: "纸张",
      price: "25",
    },
    {
      province: "浙江",
      city: "杭州",
      type: "笔",
      cost: "0.5",
    },
    {
      province: "浙江",
      city: "杭州",
      type: "纸张",
      cost: "20",
    },
    {
      province: "浙江",
      city: "舟山",
      type: "笔",
      cost: "1.7",
    },
    {
      province: "浙江",
      city: "舟山",
      type: "纸张",
      cost: "0.12",
    },
    {
      province: "吉林",
      city: "长春",
      type: "笔",
      cost: "10",
    },
    {
      province: "吉林",
      city: "白山",
      type: "笔",
      cost: "9",
    },
    {
      province: "吉林",
      city: "长春",
      type: "纸张",
      cost: "3",
    },
    {
      province: "吉林",
      city: "白山",
      type: "纸张",
      cost: "1",
    }
  ]
};

// dataCfg 数据字段较多，建议使用 shallow, 如果有数据更改直接替换整个对象
const dataCfg = shallowRef(s2DataConfig);
const options: S2Options = reactive(s2Options);
//
// const refTable = ref<HTMLElement | null>(null);
//
// onMounted(() => {
//   const tableInstance = new VTable.ListTable(refTable.value!, option as ListTableConstructorOptions);
//   // window['tableInstance'] = tableInstance;
// })

</script>

<template>
  <PageContainer>
    <a-button type="primary" class="mb-16" v-print="'#print'">打印</a-button>

    <div id="print">
      <div ref="refTable" class="big-data-table">
        <SheetComponent :dataCfg="dataCfg" :options="options"/>
      </div>
    </div>
  </PageContainer>
</template>

<style lang="less">
.big-data-table {
  height: calc(100vh - 250px);
  overflow: auto;
}
</style>
