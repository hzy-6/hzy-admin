<script lang="ts">
//init 函数参数类型
interface IInitParameter {
  id: string | null;
  organizationId: string;
  allOrganizationTree: any[];
}
</script>
<script lang="ts" setup>
import { reactive } from "vue";
import tools, { EMessageType } from "@/infrastructure/scripts/tools";
import service from "@/services/system/UserService";

//定义组件事件
const emits = defineEmits<{
  (e: "onSuccess", value: number): void;
}>();

const state = reactive<{
  vm: {
    id: string | null;
    form: any;
    roleIds: any[];
    postIds: any[];
    allRoleList: any[];
    allPostList: any[];
  };
  visible: boolean;
  loading: boolean;
  organizationId: string;
  organizationTree: any[];
}>({
  vm: {
    id: null,
    form: {},
    roleIds: [],
    postIds: [],
    allRoleList: [],
    allPostList: [],
  },
  visible: false,
  loading: false,
  organizationId: "",
  organizationTree: [],
});

/**
 * 初始化启动打开表单
 * @param param0
 */
function init({ id, organizationId, allOrganizationTree }: IInitParameter): void {
  state.vm.id = id;
  state.visible = true;
  state.organizationTree = allOrganizationTree;
  state.organizationId = organizationId;
  findForm();
}

/**
 * 查询表单
 */
function findForm() {
  state.loading = true;
  service.findForm(state.vm.id).then((res) => {
    state.loading = false;
    if (res.code != 1) return;
    state.vm = res.data;
    //覆盖掉特殊得几个字段
    state.vm.form.password = "";
    if (state.organizationId) {
      state.vm.form.organizationId = state.organizationId;
    }
  });
}

/**
 * 保存数据
 */
function saveForm() {
  if (!state.vm.form.organizationId) {
    return tools.message("请选择组织", EMessageType.警告);
  }

  state.loading = true;
  service
    .saveForm(state.vm)
    .then((res) => {
      if (res.code != 1) return;
      emits("onSuccess", 1);
      tools.message("提交成功!", EMessageType.成功);
      state.visible = false;
    })
    .finally(() => {
      state.loading = false;
    });
}

//向父级导出 函数
defineExpose({ init });
</script>

<template>
  <el-dialog centered :show-close="false" draggable :width="800" v-model="state.visible" :title="state.vm.id ? '编辑' : '新建'">
    <template #footer>
      <el-button plain type="primary" :loading="state.loading" @click="saveForm()"> 提交 </el-button>
      <el-button plain type="danger" @click="state.visible = false">关闭</el-button>
    </template>
    <!-- 表单 -->
    <el-form label-position="top" label-width="auto">
      <el-row :gutter="20">
        <el-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
          <el-form-item label="真实姓名">
            <el-input v-model="state.vm.form.name" placeholder="真实姓名" />
          </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
          <el-form-item label="账户名称">
            <el-input v-model="state.vm.form.loginName" placeholder="账户名称" />
          </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
          <el-form-item label="账户密码">
            <el-input v-model="state.vm.form.password" placeholder="账户密码" />
          </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
          <el-form-item label="联系电话">
            <el-input v-model="state.vm.form.phone" placeholder="联系电话" />
          </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
          <el-form-item label="邮箱地址">
            <el-input v-model="state.vm.form.email" placeholder="邮箱地址" />
          </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
          <el-form-item label="所属组织">
            <el-tree-select
              v-model="state.vm.form.organizationId"
              :data="state.organizationTree"
              :render-after-expand="false"
              :props="{ children: 'children', label: 'title', value: 'key' }"
              class="w100"
            />
          </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
          <el-form-item label="删除锁定">
            <el-radio-group v-model="state.vm.form.deleteLock">
              <el-radio :label="true">锁定</el-radio>
              <el-radio :label="false">不锁定</el-radio>
            </el-radio-group>
          </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
          <el-form-item label="所属岗位">
            <el-checkbox-group v-model="state.vm.postIds" class="w100">
              <el-row :gutter="16">
                <el-col :xs="24" :sm="12" :md="8" :lg="6" :xl="6" v-for="(item, index) in state.vm.allPostList" :key="index">
                  <el-checkbox :label="item.id">{{ item.name }}</el-checkbox>
                </el-col>
              </el-row>
            </el-checkbox-group>
          </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
          <el-form-item label="所属角色">
            <el-checkbox-group v-model="state.vm.roleIds" class="w100">
              <el-row :gutter="16">
                <el-col :xs="24" :sm="12" :md="8" :lg="6" :xl="6" v-for="(item, index) in state.vm.allRoleList" :key="index">
                  <el-checkbox :label="item.id">{{ item.name }}</el-checkbox>
                </el-col>
              </el-row>
            </el-checkbox-group>
          </el-form-item>
        </el-col>
      </el-row>
    </el-form>
  </el-dialog>
</template>
