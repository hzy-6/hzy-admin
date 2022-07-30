<template>
  <div>
    <a-form ref="formRef" layout="vertical" :model="state.vm.form" :rules="rules">
      <a-row :gutter="[15, 15]">
        <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
          <a-form-item label="是否覆盖" ref="isCover" name="isCover">
            <a-radio-group v-model:value="state.vm.form.isCover" name="isCover">
              <a-radio :value="true">是</a-radio>
              <a-radio :value="false">否</a-radio>
            </a-radio-group>
          </a-form-item>
        </a-col>
        <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
          <a-form-item label="项目根地址" ref="projectRootPath" name="projectRootPath">
            <a-input v-model:value="state.vm.form.projectRootPath" placeholder="请输入" />
          </a-form-item>
        </a-col>
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
          <a-form-item label="前端视图保存路径" ref="indexVuePath" name="indexVuePath">
            <a-input v-model:value="state.vm.form.indexVuePath" placeholder="请输入" />
          </a-form-item>
        </a-col>
        <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
          <a-form-item label="前端信息弹窗保存位置" ref="infoVuePath" name="infoVuePath">
            <a-input v-model:value="state.vm.form.infoVuePath" placeholder="请输入" />
          </a-form-item>
        </a-col>
        <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
          <a-form-item label="前端服务保存位置" ref="serviceJsPath" name="serviceJsPath">
            <a-input v-model:value="state.vm.form.serviceJsPath" placeholder="请输入" />
          </a-form-item>
        </a-col>
      </a-row>
    </a-form>

    <div class="text-right">
      <a-button type="primary" @click="methods.saveForm()" class="mr-24">提交</a-button>
      <a-button type="primary" @click="methods.autoImport()" danger>代码载入项目</a-button>
    </div>
  </div>
</template>
<script setup>
import tools from "@/scripts/tools";
import service from "@/service/development_tool/code_generation_service";
import lowCodeTalbeService from "@/service/development_tool/low_code/low_code_table_service";
import { computed, reactive, ref } from "vue";

//定义组件事件
// const emits = defineEmits(["onSuccess"]);
const props = defineProps({
  tableName: String,
});

const state = reactive({
  tableName: computed(() => props.tableName),
  vm: {
    id: "",
    form: {},
  },
  saveLoading: false,
});

const formRef = ref(null);

//验证规则
const rules = {
  projectRootPath: [{ required: true, message: "请输入项目根地址", trigger: "blur" }],
  modelPath: [{ required: true, message: "请输入实体保存路径", trigger: "blur" }],
  servicePath: [{ required: true, message: "请输入服务保存路径", trigger: "blur" }],
  controllerPath: [{ required: true, message: "请输入控制器保存路径", trigger: "blur" }],
  indexVuePath: [{ required: true, message: "请输入前端视图保存路径", trigger: "blur" }],
  infoVuePath: [{ required: true, message: "请输入前端信息弹窗保存位置", trigger: "blur" }],
  serviceJsPath: [{ required: true, message: "请输入前端服务保存位置", trigger: "blur" }],
};

const methods = {
  findForm() {
    state.saveLoading = true;
    return lowCodeTalbeService.findForm(state.vm.id).then((res) => {
      state.saveLoading = false;
      if (res.code != 1) return;
      state.vm = res.data;
    });
  },
  saveForm() {
    formRef.value.validate().then(() => {
      state.saveLoading = true;
      lowCodeTalbeService
        .saveForm(state.vm)
        .then((res) => {
          if (res.code != 1) return;
          tools.message("操作成功!", "成功");
          // state.visible = false;
          state.saveLoading = false;
        })
        .finally(() => {
          state.saveLoading = false;
        });
    });
    // .catch((error) => {
    //   console.log("error", error);
    // });
  },
  autoImport() {
    console.log("执行");
    service
      .autoImprotProject({ tableName: props.tableName })
      .then((res) => {
        if (res.code === 1) {
          tools.message("导入成功,请查看!", "成功");
        }
      })
      .finally(() => {
        tools.message("导入结束");
      });
  },
  loadData({ key }) {
    state.vm.id = key;
    methods.findForm();
  },
};
//如果传入参数 tablename变化 加载表单信息
// watch(
//   () => state.tableName,
//   (value) => {
//     alert(value);
//     methods.findForm();
//   }
// );

// 暴露函数或者属性到外部
defineExpose({ ...methods });
</script>
