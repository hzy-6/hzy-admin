<script lang="ts">
//init 函数参数类型
interface IInitParameter {
  id: string | null;
}
</script>
<script lang="ts" setup>
import { reactive } from "vue";
import tools, { EMessageType } from "@/infrastructure/scripts/tools";
import service from "@/services/system/FunctionService";

//定义组件事件
const emits = defineEmits<{
  (e: "onSuccess", value: number): void;
}>();

const state = reactive<{
  vm: {
    id: string | null;
    form: any;
  };
  visible: boolean;
  loading: boolean;
}>({
  vm: {
    id: null,
    form: {},
  },
  visible: false,
  loading: false,
});

/**
 * 初始化启动打开表单
 * @param param0
 */
function init({ id }: IInitParameter): void {
  state.vm.id = id;
  state.visible = true;
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
  });
}

/**
 * 保存数据
 */
function saveForm() {
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
  <el-dialog centered :show-close="false" draggable :width="400" v-model="state.visible" :title="state.vm.id ? '编辑' : '新建'">
    <template #footer>
      <el-button plain type="primary" :loading="state.loading" @click="saveForm()"> 提交 </el-button>
      <el-button plain type="danger" @click="state.visible = false">关闭</el-button>
    </template>
    <!-- 表单 -->
    <el-form label-position="top" label-width="auto">
        <el-row :gutter="20">
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
          <el-form-item label="编号">
            <el-input v-model="state.vm.form.number" placeholder="编号" />
          </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
          <el-form-item label="名称">
            <el-input v-model="state.vm.form.name" placeholder="名称" />
          </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
          <el-form-item label="英文名称">
            <el-input v-model="state.vm.form.byName" placeholder="英文名称" />
          </el-form-item>
        </el-col>
      </el-row>
    </el-form>
  </el-dialog>
</template>
