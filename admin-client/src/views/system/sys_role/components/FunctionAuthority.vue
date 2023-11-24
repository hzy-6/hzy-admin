<script lang="ts" setup>
import { reactive } from "vue";
import Tools from "@/core/utils/Tools";
import SysRoleMenuFunctionService from "@/services/system/SysRoleMenuFunctionService";
import { CheckboxChangeEvent } from "ant-design-vue/lib/checkbox/interface";

//定义组件事件
const props = defineProps<{ onSuccess: () => void }>();

const state = reactive({
  visible: false,
  loading: false,
  roleId: "",
  treeData: [] as any,
  rowkeys: [] as string[],
});

/**
 * 向父级导出 函数
 */
defineExpose({
  /**
   * 打开表单初始化
   * @param key
   */
  open: (key: string = "") => {
    state.visible = true;
    state.roleId = key;
    //初始化表单数据
    state.loading = true;
    SysRoleMenuFunctionService.getRoleMenuFunctionByRoleId(key).then((res) => {
      state.loading = false;
      state.treeData = res.tree;
      state.rowkeys = res.keys;
      console.log(state.rowkeys);
    });
  },
});

/**
 *保存数据
 */
async function save() {
  //组装数据
  const newData: any = [];
  /**
   * 扫描树形
   * @param tree
   */
  function scanningTreeData(tree: any[]) {
    tree.forEach((item) => {
      if (item.children && item.children.length > 0) {
        scanningTreeData(item.children);
      }

      if (item.checkedMenuFunctionIds && item.checkedMenuFunctionIds.length > 0) {
        newData.push({
          roleId: state.roleId,
          menuId: item.id,
          menuFunctionIdList: item.checkedMenuFunctionIds,
        });
      }
    });
  }

  scanningTreeData(state.treeData);
  const result = await SysRoleMenuFunctionService.saveForm(newData);
  if (result.code != 200) return;
  Tools.message.success("操作成功!");
  props.onSuccess();
  state.visible = false;
}

/**
 * 全选/全不选
 * @param e
 * @param row
 */
function onCheckAllChange(e: CheckboxChangeEvent, row: any) {
  // console.log(row);
  if (e.target.checked) {
    row.checkedMenuFunctionIds = row.menuFunctions.map((w: any) => w.id);
    row.indeterminate = row.checkedMenuFunctionIds.length > 0 && row.checkedMenuFunctionIds.length < row.menuFunctions.length;
    row.checkAll = row.checkedMenuFunctionIds.length === row.menuFunctions.length;
  } else {
    row.checkedMenuFunctionIds = [];
    row.indeterminate = false;
  }
}

/**
 * 点击复选框事件
 * @param values
 * @param row
 */
function onChangeCheckbox(values: any, row: any) {
  row.indeterminate = !!values.length && values.length < row.menuFunctions.length;
  row.checkAll = values.length === row.menuFunctions.length;
}
</script>

<template>
  <a-drawer v-model:open="state.visible" title="角色功能设置" centered @ok="state.visible = false" :width="1200" :footer="null">
    <template #extra>
      <ASpace>
        <a-button type="primary" @click="save()">保存/提交</a-button>
        <a-button @click="() => (state.visible = !state.visible)">关闭</a-button>
      </ASpace>
    </template>
    <a-spin :spinning="state.loading">
      <ATable :data-source="state.treeData" size="small" v-model:expandedRowKeys="state.rowkeys" :pagination="false" row-key="id">
        <ATableColumn title="菜单" data-index="name" width="250px" />
        <ATableColumn title="功能" data-index="id">
          <template #default="{ record }">
            <ASpace :size="8" v-if="record.menuFunctions.length > 0">
              <a-checkbox
                v-model:checked="record.checkAll"
                :indeterminate="record.indeterminate"
                @change="(e:CheckboxChangeEvent) => onCheckAllChange(e, record)"
                v-if="record.menuFunctions.length > 0"
              >
                全选/取消
              </a-checkbox>
              <ADivider type="vertical" />
              <a-checkbox-group style="display: block" v-model:value="record.checkedMenuFunctionIds" @change="(values:any) => onChangeCheckbox(values, record)">
                <span v-for="item in record.menuFunctions" :key="item.id" class="mr-16">
                  <a-checkbox :value="item.id">{{ item.label }}</a-checkbox>
                </span>
              </a-checkbox-group>
            </ASpace>
          </template>
        </ATableColumn>
      </ATable>
    </a-spin>
  </a-drawer>
</template>
