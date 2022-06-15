<template>
  <a-modal v-model:visible="state.visible" title="数据权限设置" centered @ok="state.visible = false" :width="400" :bodyStyle="{ overflowY: 'auto', height: 'calc(100vh - 300px)' }">
    <template #footer>
      <a-button type="primary" @click="methods.saveForm()" :loading="state.saveLoading">提交</a-button>
      <a-button type="danger" ghost @click="state.visible = false" class="ml-15">关闭</a-button>
    </template>
    <a-spin :spinning="state.loading">
      <!-- <a-divider>数据权限类型</a-divider> -->
      <a-radio-group v-model:value="state.form.sysDataAuthority.permissionType">
        <a-radio :style="{ display: 'flex', height: '30px', lineHeight: '30px' }" :value="1">自定义权限</a-radio>
        <a-radio :style="{ display: 'flex', height: '30px', lineHeight: '30px' }" :value="2">查看所有数据</a-radio>
        <a-radio :style="{ display: 'flex', height: '30px', lineHeight: '30px' }" :value="3">仅查看本组织</a-radio>
        <a-radio :style="{ display: 'flex', height: '30px', lineHeight: '30px' }" :value="4">仅查看本组织和下属组织</a-radio>
        <a-radio :style="{ display: 'flex', height: '30px', lineHeight: '30px' }" :value="5">仅查看本人</a-radio>
      </a-radio-group>

      <!-- 自定义选择组织 -->
      <div v-if="state.form.sysDataAuthority.permissionType === 1">
        <a-divider>自定义数据权限</a-divider>
        <div class="mb-15">
          <a-checkbox v-model:checked="state.selectAll" @change="methods.onSelectAll()">全选/全不选</a-checkbox>
          <a-checkbox v-model:checked="state.expandedAll" @change="methods.onExpandedAll()">展开/折叠</a-checkbox>
        </div>

        <div style="max-height: 280px; overflow-y: auto">
          <a-tree v-model:expandedKeys="state.tree.expandedKeys" v-model:checkedKeys="state.tree.checkedKeys" checkable :tree-data="state.tree.data">
            <!-- <template #title="{ title, key }">
              <span v-if="key === '0-0-1-0'" style="color: #1890ff">{{ title }}</span>
              <template v-else>{{ title }}</template>
            </template> -->
          </a-tree>
        </div>
      </div>
    </a-spin>
  </a-modal>
</template>

<script setup>
import { reactive, watch } from "vue";
import tools from "@/scripts/tools";
import organizationService from "@/service/system/organizationService";
import sysDataAuthorityService from "@/service/system/sysDataAuthorityService";

const state = reactive({
  roleId: "",
  loading: false,
  visible: false,
  form: {
    sysDataAuthority: {},
    sysDataAuthorityCustomList: [],
  },
  selectAll: false,
  expandedAll: false,
  tree: {
    data: [],
    expandedKeys: [],
    selectedKeys: [],
    checkedKeys: [],
    allKeys: [],
    allExpandedKeys: [],
    loadingTree: false,
  },
});

const methods = {
  //打开窗口
  openWindow({ visible, key }) {
    state.visible = visible;
    state.roleId = key;
    this.findForm();
  },
  findForm() {
    state.saveLoading = true;
    sysDataAuthorityService.getDataAuthorityByRoleId(state.roleId).then((res) => {
      state.saveLoading = false;
      if (res.code != 1) return;
      state.form = res.data;
      state.form.sysDataAuthority.roleId = state.roleId;
      this.sysOrganizationTree();
    });
  },
  //获取部门树
  sysOrganizationTree() {
    state.tree.loadingTree = true;
    state.tree.checkedKeys = [];
    organizationService.sysOrganizationTree().then((res) => {
      state.tree.loadingTree = false;
      let data = res.data;
      state.tree.data = data.rows;
      state.tree.expandedKeys = data.expandedRowKeys;
      state.tree.allKeys = data.allKeys;
      state.tree.allExpandedKeys = data.expandedRowKeys;

      //组织选中的组织
      var array = state.form.sysDataAuthorityCustomList;
      for (let i = 0; i < array.length; i++) {
        const item = array[i];
        state.tree.checkedKeys.push(item.sysOrganizationId);
      }

      //全选、全不选处理
      state.selectAll = state.tree.checkedKeys.length == state.tree.allKeys.length;
      //收展
      state.expandedAll = state.tree.expandedKeys.length == state.tree.allExpandedKeys.length;
    });
  },
  //保存提交
  saveForm() {
    if (state.form.sysDataAuthority.permissionType === 1) {
      var array = state.tree.checkedKeys;
      state.form.sysDataAuthorityCustomList = [];
      for (let i = 0; i < array.length; i++) {
        const item = array[i];
        state.form.sysDataAuthorityCustomList.push({
          sysOrganizationId: item,
        });
      }
    } else {
      state.form.sysDataAuthorityCustomList = [];
    }

    sysDataAuthorityService.saveForm(state.form).then((res) => {
      if (res.code != 1) {
        return tools.message("保存失败!", "错误");
      }
      tools.message("保存成功!", "成功");
    });
  },
  /**
   * 全选
   */
  onSelectAll() {
    if (state.selectAll) {
      state.tree.checkedKeys = state.tree.allKeys;
    } else {
      state.tree.checkedKeys = [];
    }
  },
  /**
   * 收展所有
   */
  onExpandedAll() {
    if (state.expandedAll) {
      state.tree.expandedKeys = state.tree.allExpandedKeys;
    } else {
      state.tree.expandedKeys = [];
    }
  },
};

watch(
  () => state.tree.checkedKeys,
  (value) => {
    console.log("checkedKeys", value);
    //全选、全不选处理
    state.selectAll = value.length == state.tree.allKeys.length;
  }
);

watch(
  () => state.tree.expandedKeys,
  (value) => {
    //收展
    state.expandedAll = value.length == state.tree.allExpandedKeys.length;
  }
);

// 暴露函数或者属性到外部
defineExpose({ ...methods });
</script>
