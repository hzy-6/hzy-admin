<script lang="ts" setup>
import { reactive, ref } from "vue";
import { FormInstance } from "ant-design-vue";
import Tools from "@/core/utils/Tools";
import SysUserService from "@/services/system/SysUserService";
import SysOrganizationService from "@/services/system/SysOrganizationService";

//定义组件事件
const props = defineProps<{ onSuccess: () => void }>();

const state = reactive({
  vm: {
    id: "",
    form: {} as any,
    postIds: [] as string[],
    allPostList: [] as any[],
    roleIds: [] as string[],
    allRoleList: [] as any[],
  },
  visible: false,
  loading: false,
  organizationTree: [],
});

//表单实例
const refForm = ref<FormInstance>();

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
    if (state.visible) {
      state.vm.id = key;
    }
    refForm.value?.resetFields();
    //初始化表单数据
    state.loading = true;
    SysUserService.findForm(key).then((res) => {
      state.loading = false;
      if (res.code != 200) return;
      state.vm = res.data;
      state.vm.form.password = "";
    });
    //组织树
    state.loading = true;
    SysOrganizationService.sysOrganizationTree().then((res) => {
      state.loading = false;
      state.organizationTree = res.data.rows;
    });
  },
});

/**
 *保存数据
 */
function save() {
  refForm.value?.validate().then(async () => {
    if (!state.vm.form.organizationId) {
      return Tools.message.warning("请选择组织!");
    }

    try {
      state.loading = true;
      const result = await SysUserService.saveForm(state.vm.id, state.vm);
      state.loading = false;
      if (result.code != 200) return;
      Tools.message.success("操作成功!");
      props.onSuccess();
      state.visible = false;
    } catch (error) {
      state.loading = false;
    }
  });
}
</script>

<template>
  <a-modal v-model:open="state.visible" :title="state.vm.id ? '编辑' : '新建'" centered @ok="state.visible = false" :width="800">
    <template #footer>
      <a-button type="primary" :loading="state.loading" @click="save()"> 提交</a-button>
      <a-button @click="state.visible = false">关闭</a-button>
    </template>
    <a-spin :spinning="state.loading">
      <a-form ref="refForm" layout="vertical" :model="state.vm.form">
        <a-row :gutter="[16, 0]">
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <a-form-item label="真实姓名" name="name" :rules="[{ required: true, message: '请输入真实姓名', trigger: 'blur' }]">
              <a-input v-model:value="state.vm.form.name" placeholder="请输入" />
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <a-form-item label="账户名称" name="loginName" :rules="[{ required: true, message: '请输入账户名称', trigger: 'blur' }]">
              <a-input v-model:value="state.vm.form.loginName" placeholder="请输入" />
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <a-form-item label="账户密码">
              <a-input v-model:value="state.vm.form.password" placeholder="请输入" />
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <a-form-item label="联系电话">
              <a-input v-model:value="state.vm.form.phone" placeholder="请输入" />
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <a-form-item label="邮箱地址">
              <a-input v-model:value="state.vm.form.email" placeholder="请输入" />
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <a-form-item label="所属组织">
              <a-tree-select
                v-model:value="state.vm.form.organizationId"
                :dropdown-style="{ maxHeight: '400px', overflow: 'auto' }"
                placeholder="所属组织"
                allow-clear
                tree-default-expand-all
                show-search
                tree-node-filter-prop="name"
                :tree-data="state.organizationTree"
                :field-names="{
                  children: 'children',
                  label: 'name',
                  value: 'id',
                }"
              ></a-tree-select>
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <a-form-item label="删除锁定">
              <a-radio-group v-model:value="state.vm.form.deleteLock">
                <a-radio :value="true">锁定</a-radio>
                <a-radio :value="false">不锁定</a-radio>
              </a-radio-group>
            </a-form-item>
          </a-col>

          <a-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <a-form-item label="所属岗位">
              <a-checkbox-group v-model:value="state.vm.postIds" class="w100" style="display: block">
                <a-row :gutter="[16, 8]">
                  <a-col :span="6" v-for="(item, index) in state.vm.allPostList" :key="index">
                    <a-checkbox :value="item.id">
                      {{ item.name }}
                    </a-checkbox>
                  </a-col>
                </a-row>
              </a-checkbox-group>
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <a-form-item label="所属角色">
              <a-checkbox-group v-model:value="state.vm.roleIds" class="w100" style="display: block">
                <a-row :gutter="[16, 8]">
                  <a-col :span="6" v-for="(item, index) in state.vm.allRoleList" :key="index">
                    <a-checkbox :value="item.id">
                      {{ item.name }}
                    </a-checkbox>
                  </a-col>
                </a-row>
              </a-checkbox-group>
            </a-form-item>
          </a-col>
        </a-row>
      </a-form>
    </a-spin>
  </a-modal>
</template>
