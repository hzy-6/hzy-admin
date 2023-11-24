<script lang="ts" setup>
import {reactive, onMounted, ref} from "vue";
import PageContainer from "@/core/components/PageContainer.vue";
import {VxeTablePropTypes} from 'vxe-table'
import XEUtils from 'xe-utils'

defineOptions({name: "VxeTableCom"});

interface RowVO {
  name: string
  attr1: number
  attr2: string
  attr3: string
  attr4: string
  attr5: string
  attr6: string
  attr7: string
  attr8: string
  attr9: string
  attr10: string
  attr11: string
  attr12: string
  attr13: string
  attr14: string
}

const tableData = ref<RowVO[]>([])

const sumNum = (list: RowVO[], field: string) => {
  let count = 0
  list.forEach(item => {
    count += Number(item[field])
  })
  return XEUtils.round(count, 2)
}

const footerMethod: VxeTablePropTypes.FooterMethod<RowVO> = ({columns, data}) => {
  // 返回一个二维数组的表尾合计
  const footData = [
    columns.map((column: any, columnIndex: any) => {
      if (columnIndex === 0) {
        return '平均'
      }
      switch (column.field) {
        case 'attr1':
          return sumNum(data, 'attr1')
      }
      return '-'
    })
  ]
  return footData
}

setTimeout(() => {
  const mockList: RowVO[] = []
  for (let index = 0; index < 1000; index++) {
    mockList.push({
      name: 'Test' + index,
      attr1: index,
      attr2: 'a2-' + index,
      attr3: 'a3-' + index,
      attr4: 'a4-' + index,
      attr5: 'a5-' + index,
      attr6: 'a6-' + index,
      attr7: 'a7-' + index,
      attr8: 'a8-' + index,
      attr9: 'a9-' + index,
      attr10: 'a10-' + index,
      attr11: 'a11-' + index,
      attr12: 'a12-' + index,
      attr13: 'a13-' + index,
      attr14: 'a14-' + index
    })
  }
  tableData.value = mockList
}, 300)
</script>

<template>
  <PageContainer>
    <a-card title="VxeTable 演示" :body-style="{padding:0}">
      <template #extra>
        <a href="https://vxetable.cn/#/table/scroll/scroll" target="_black">
          VxeTable 官网文档
        </a>
      </template>
      <div>
        <vxe-table
            border
            show-overflow
            show-header-overflow
            show-footer-overflow
            show-footer
            height="600px"
            :footer-method="footerMethod"
            :scroll-x="{enabled: true, gt: 10}"
            :scroll-y="{enabled: true, gt: 100}"
            :data="tableData">
          <vxe-column type="seq" width="100"></vxe-column>
          <vxe-column field="name" title="Name" width="150" sortable></vxe-column>
          <vxe-colgroup title="分类1">
            <vxe-column field="attr1" title="Attr1" width="100"></vxe-column>
            <vxe-column field="attr2" title="Attr2" width="100"></vxe-column>
            <vxe-column field="attr3" title="Attr3" width="100"></vxe-column>
          </vxe-colgroup>
          <vxe-column field="attr4" title="Attr4" width="100"></vxe-column>
          <vxe-column field="attr5" title="Attr5" width="150" sortable></vxe-column>
          <vxe-column field="attr6" title="Attr6" width="100"></vxe-column>
          <vxe-column field="attr7" title="Attr7" width="100"></vxe-column>
          <vxe-column field="attr8" title="Attr8" width="200" show-overflow></vxe-column>
          <vxe-column field="attr9" title="Attr9" width="100"></vxe-column>
          <vxe-column field="attr10" title="Attr10" width="100"></vxe-column>
          <vxe-colgroup title="分类2">
            <vxe-column field="attr11" title="Attr11" width="100"></vxe-column>
            <vxe-column field="attr12" title="Attr12" width="100"></vxe-column>
            <vxe-column field="attr13" title="Attr13" width="150" sortable></vxe-column>
            <vxe-column field="attr14" title="Attr14" width="100"></vxe-column>
            <vxe-column field="attr15" title="Attr15" width="100"></vxe-column>
          </vxe-colgroup>
        </vxe-table>
      </div>
    </a-card>
  </PageContainer>
</template>
