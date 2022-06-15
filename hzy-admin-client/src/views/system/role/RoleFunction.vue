<template>
  <a-modal v-model:visible="state.visible" centered width="1200px" :bodyStyle="{ overflowY: 'auto', height: 'calc(100vh - 100px)' }" :footer="null">
    <template #title>
      <span class="mr-15">角色功能设置</span>
      <a-button type="primary" @click="methods.save">保存/提交</a-button>
    </template>
    <a-spin :spinning="state.loading">
      <vxe-table ref="refTable" resizable :data="state.data" :row-config="{ isHover: true }" :tree-config="{ transform: true, rowField: 'id', parentField: 'parentId' }" size="small">
        <vxe-column field="name" title="菜单名称" tree-node width="250">
          <template #default="{ row }">
            <span class="mr-15">{{ row.name }}</span>
            <a-checkbox v-model:checked="row.checkAll" :indeterminate="row.indeterminate" @change="(e) => methods.onCheckAllChange(e, row)" v-if="row.menuFunctions.length > 0"> 全选 </a-checkbox>
          </template>
        </vxe-column>
        <vxe-column field="id" title="权限">
          <template #default="{ row }">
            <template v-if="row.menuFunctions.length > 0">
              <a-checkbox-group style="display: block" v-model:value="row.checkedMenuFunctionIds" @change="(values) => methods.onChangeCheckbox({ values, row })">
                <span v-for="item in row.menuFunctions" :key="item.id" class="mr-15">
                  <a-checkbox :value="item.id">{{ item.label }}</a-checkbox>
                </span>
              </a-checkbox-group>
            </template>
          </template>
        </vxe-column>
      </vxe-table>
    </a-spin>
  </a-modal>
</template>

<script setup>
import { nextTick, reactive, ref } from "vue";
import service from "@/service/system/rolefunctionService";
import tools from "@/scripts/tools";

const state = reactive({
  roleId: "",
  data: [],
  loading: false,
  visible: false,
});

const refTable = ref(null);

const methods = {
  //获取角色菜单功能树
  getRoleMenuFunctionTree() {
    state.loading = true;
    service.getRoleMenuFunctionByRoleId(state.roleId).then((res) => {
      state.loading = false;
      let data = res.data;
      state.data = data;
      nextTick(() => {
        // methods.setAllTreeExpand();
        //计算要展开的选项
        for (var i = 0; i < state.data.length; i++) {
          var item = state.data[i];

          if (item.menuFunctions.length > 0) {
            // levelCode
            var parentLevelCode = item.levelCode.substr(0, item.levelCode.lastIndexOf("."));
            refTable.value.setTreeExpand(
              state.data.filter((w) => w.levelCode == parentLevelCode),
              true
            );
          }
        }
      });
    });
  },
  //保存提交
  save() {
    var rows = state.data.filter((w) => w.menuFunctions.length > 0);
    var data = [];
    for (var i = 0; i < rows.length; i++) {
      var item = rows[i];
      data.push({
        roleId: state.roleId,
        menuId: item.id,
        menuFunctionIdList: item.checkedMenuFunctionIds,
      });
    }
    service.saveForm(data).then((res) => {
      if (res.code != 1) {
        return tools.message("保存失败!", "错误");
      }
      methods.getRoleMenuFunctionTree();
      tools.message("保存成功!", "成功");
    });
  },
  //点击复选框事件
  onChangeCheckbox({ values, row }) {
    // console.log(values);
    row.indeterminate = !!values.length && values.length < row.menuFunctions.length;
    row.checkAll = values.length === row.menuFunctions.length;
  },
  //打开窗口
  openWindow({ visible, key }) {
    state.visible = visible;
    state.roleId = key;
    methods.getRoleMenuFunctionTree();
  },
  //展开所有树状
  setAllTreeExpand() {
    refTable.value.setAllTreeExpand(true);
    //关闭所有展开
    //  refTable.value.clearTreeExpand();
  },
  //全选/全不选
  onCheckAllChange(e, row) {
    // console.log(row);
    if (e.target.checked) {
      row.checkedMenuFunctionIds = row.menuFunctions.map((w) => w.id);
      row.indeterminate = row.checkedMenuFunctionIds.length > 0 && row.checkedMenuFunctionIds.length < row.menuFunctions.length;
      row.checkAll = row.checkedMenuFunctionIds.length === row.menuFunctions.length;
    } else {
      row.checkedMenuFunctionIds = [];
      row.indeterminate = false;
    }
  },
};

// 暴露函数或者属性到外部
defineExpose({ ...methods });
</script>
