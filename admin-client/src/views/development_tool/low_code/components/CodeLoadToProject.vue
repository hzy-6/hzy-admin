<script lang="ts" setup>
import { reactive, ref, watchEffect } from "vue";
import { FormInstance } from "ant-design-vue";
import Tools from "@/core/utils/Tools";
import CodeGenerationService from "@/services/development_tool/low_code/CodeGenerationService";
import LowCodeTableService from "@/services/development_tool/low_code/LowCodeTableService";

//定义组件事件
const props = defineProps<{ rowData: any }>();

const state = reactive({
  vm: {
    id: "",
    form: {} as any,
  },
  loading: false,
});

const refForm = ref<FormInstance>();

//验证规则
const rules = {
  // projectRootPath: [{ required: true, message: "请输入项目根地址", trigger: "blur" }],
  // modelPath: [{ required: true, message: "请输入实体保存路径", trigger: "blur" }],
  // servicePath: [{ required: true, message: "请输入服务保存路径", trigger: "blur" }],
  // controllerPath: [{ required: true, message: "请输入控制器保存路径", trigger: "blur" }],
  // indexVuePath: [{ required: true, message: "请输入前端视图保存路径", trigger: "blur" }],
  // infoVuePath: [{ required: true, message: "请输入前端信息弹窗保存位置", trigger: "blur" }],
  // serviceJsPath: [{ required: true, message: "请输入前端服务保存位置", trigger: "blur" }],
} as any;

watchEffect(() => {
  if (props.rowData) {
    findForm();
  }
}, props.rowData);

/**
 * 获取表单信息
 */
async function findForm() {
  state.loading = true;
  const result = await LowCodeTableService.findForm(props.rowData.id);
  state.loading = false;
  if (result.code != 200) return;
  state.vm = result.data;
}

/**
 * 保存表单信息
 */
function saveForm(successCallBack: Function | null = null) {
  refForm.value?.validate().then(() => {
    state.loading = true;
    LowCodeTableService.saveForm(state.vm.id, state.vm.form)
      .then((res) => {
        state.loading = false;
        if (res.code != 200) return;
        Tools.message.success("保存成功!");
        if (successCallBack) {
          successCallBack();
        }
      })
      .finally(() => {
        state.loading = false;
      });
  });
}

/**
 * 导入代码项目工程
 */
function autoImport() {
  saveForm(async () => {
    state.loading = true;
    const result = await CodeGenerationService.autoImprotProject({ tableName: props.rowData.tableName });
    state.loading = false;
    if (result.code !== 1) return;
    Tools.message.success("代码载入项目成功!");
  });
}
</script>

<template>
  <div>
    <a-form ref="refForm" layout="vertical" :model="state.vm.form" :rules="rules">
      <a-row :gutter="[15, 15]">
        <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
          <a-form-item label="实体保存路径" ref="modelPath" name="modelPath">
            <a-input v-model:value="state.vm.form.modelPath" placeholder="请输入" />
          </a-form-item>
        </a-col>
        <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
          <a-form-item label="服务保存路径" ref="servicePath" name="servicePath">
            <a-input v-model:value="state.vm.form.servicePath" placeholder="请输入" />
          </a-form-item>
        </a-col>
        <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
          <a-form-item label="控制器保存路径" ref="controllerPath" name="controllerPath">
            <a-input v-model:value="state.vm.form.controllerPath" placeholder="请输入" />
          </a-form-item>
        </a-col>
        <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
          <a-form-item label="前端视图保存路径" ref="clientIndexPath" name="clientIndexPath">
            <a-input v-model:value="state.vm.form.clientIndexPath" placeholder="请输入" />
          </a-form-item>
        </a-col>
        <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
          <a-form-item label="前端信息弹窗保存位置" ref="clientInfoPath" name="clientInfoPath">
            <a-input v-model:value="state.vm.form.clientInfoPath" placeholder="请输入" />
          </a-form-item>
        </a-col>
        <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
          <a-form-item label="前端服务保存位置" ref="clientServicePath" name="clientServicePath">
            <a-input v-model:value="state.vm.form.clientServicePath" placeholder="请输入" />
          </a-form-item>
        </a-col>
        <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
          <a-form-item label="是否覆盖" ref="isCover" name="isCover">
            <a-radio-group v-model:value="state.vm.form.isCover" name="isCover">
              <a-radio :value="true">是</a-radio>
              <a-radio :value="false">否</a-radio>
            </a-radio-group>
          </a-form-item>
        </a-col>
      </a-row>
    </a-form>

    <div class="text-center mt-48">
      <a-button type="primary" @click="autoImport()">代码载入项目</a-button>
    </div>
  </div>
</template>
