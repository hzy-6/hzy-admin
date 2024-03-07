<script lang="ts" setup>
import { reactive } from "vue";
import Tools from "@/core/utils/Tools";
import SysDataAuthorityService from "@/services/system/SysDataAuthorityService";
import SysOrganizationService from "@/services/system/SysOrganizationService";

//定义组件事件
const props = defineProps<{ onSuccess: () => void }>();

const state = reactive({
  vm: {
    id: "",
    form: {
      sysDataAuthority: {} as any,
      sysDataAuthorityCustomList: [] as any[],
    },
  },
  visible: false,
  loading: false,
  tree: {
    data: [],
    expandedKeys: [] as string[],
    selectedKeys: [] as string[],
    checkedKeys: [] as string[],
    allKeys: [] as string[],
    allExpandedKeys: [] as string[],
  },
  selectAll: false,
  expandedAll: false,
});

//向父级导出 函数
defineExpose({
  /**
   * 打开表单初始化
   * @param key
   */
  open: (key: string = "") => {
    state.visible = true;
    if (state.visible) {
      state.vm.id = key;
    }
    //初始化表单数据
    state.loading = true;
    SysDataAuthorityService.getDataAuthorityByRoleId(key).then(async (res) => {
      state.loading = false;
      if (res.code != 200) return;
      state.vm.form.sysDataAuthority = res.data.sysDataAuthority;
      state.vm.form.sysDataAuthority.roleId = key; //赋予角色id
      state.vm.form.sysDataAuthorityCustomList = res.data.sysDataAuthorityCustomList;

      const result = await SysOrganizationService.sysOrganizationTree();
      let data = result.data;
      state.tree.data = data.rows;
      state.tree.expandedKeys = data.expandedRowKeys;
      state.tree.allKeys = data.allKeys;
      state.tree.allExpandedKeys = data.expandedRowKeys;

      //组织选中的组织
      var array = state.vm.form.sysDataAuthorityCustomList;
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
});

/**
 *保存数据
 */
async function save() {
  if (state.vm.form.sysDataAuthority.permissionType === 1) {
    var array = state.tree.checkedKeys;
    state.vm.form.sysDataAuthorityCustomList = [];
    for (let i = 0; i < array.length; i++) {
      const item = array[i];
      state.vm.form.sysDataAuthorityCustomList.push({
        sysOrganizationId: item,
      });
    }
  } else {
    state.vm.form.sysDataAuthorityCustomList = [];
  }

  state.loading = true;
  const result = await SysDataAuthorityService.saveForm(state.vm.id, state.vm.form);
  if (result.code != 200) return;
  Tools.message.success("操作成功!");
  props.onSuccess();
  state.visible = false;
}

/**
 * 全选
 */
function onSelectAll() {
  if (state.selectAll) {
    state.tree.checkedKeys = state.tree.allKeys;
  } else {
    state.tree.checkedKeys = [];
  }
}

/**
 * 收展所有
 */
function onExpandedAll() {
  if (state.expandedAll) {
    state.tree.expandedKeys = state.tree.allExpandedKeys;
  } else {
    state.tree.expandedKeys = [];
  }
}
</script>

<template>
  <a-modal v-model:open="state.visible" title="数据权限设置" centered @ok="state.visible = false" :width="400">
    <template #footer>
      <a-button type="primary" :loading="state.loading" @click="save()"> 提交</a-button>
      <a-button @click="state.visible = false">关闭</a-button>
    </template>
    <a-spin :spinning="state.loading">
      <a-radio-group v-model:value="state.vm.form.sysDataAuthority.permissionType">
        <a-radio :style="{ display: 'flex', height: '30px', lineHeight: '30px' }" :value="1">自定义权限</a-radio>
        <a-radio :style="{ display: 'flex', height: '30px', lineHeight: '30px' }" :value="2">查看所有数据</a-radio>
        <a-radio :style="{ display: 'flex', height: '30px', lineHeight: '30px' }" :value="3">仅查看本组织</a-radio>
        <a-radio :style="{ display: 'flex', height: '30px', lineHeight: '30px' }" :value="4">仅查看本组织和下属组织</a-radio>
        <a-radio :style="{ display: 'flex', height: '30px', lineHeight: '30px' }" :value="5">仅查看本人</a-radio>
      </a-radio-group>

      <!-- 自定义选择组织 -->
      <div v-if="state.vm.form.sysDataAuthority.permissionType === 1">
        <a-divider>自定义数据权限</a-divider>
        <div class="mb-15">
          <a-checkbox v-model:checked="state.selectAll" @change="onSelectAll()">全选/全不选</a-checkbox>
          <a-checkbox v-model:checked="state.expandedAll" @change="onExpandedAll()">展开/折叠</a-checkbox>
        </div>

        <div style="max-height: 280px; overflow-y: auto">
          <a-tree
            v-model:expandedKeys="state.tree.expandedKeys"
            v-model:checkedKeys="state.tree.checkedKeys"
            @check="(checked :any)=>state.selectAll = checked.length == state.tree.allKeys.length"
            @expand="(expandedKeys:any[]) => (state.expandedAll = expandedKeys.length == state.tree.allExpandedKeys.length)"
            checkable
            :tree-data="state.tree.data"
            :fieldNames="{ children: 'children', title: 'name', key: 'id' }"
          >
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
