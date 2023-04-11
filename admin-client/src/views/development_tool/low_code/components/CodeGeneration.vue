<script lang="ts" setup>
import { Codemirror } from "vue-codemirror";
import { loadLanguage } from "@uiw/codemirror-extensions-langs";
import { githubDark } from "@uiw/codemirror-themes-all";
import { ref, watchEffect } from "vue";
import CodeGenerationService from "@/services/development_tool/low_code/CodeGenerationService";

//定义组件事件
const props = defineProps<{ rowData: any }>();

const code = ref(``);
const codeType = ref("HZY.Models");
const extensions = ref([loadLanguage("csharp")?.extension, githubDark as any]);
const loading = ref(false);

watchEffect(() => {
  if (props.rowData) {
    getCode();
  }
}, props.rowData);

/**
 * 获取代码
 */
async function getCode() {
  loading.value = true;
  const result = await CodeGenerationService.getCode({
    tableName: props.rowData.tableName,
    type: codeType.value,
    codeText: "",
  });
  loading.value = false;
  if (result.code != 1) return;
  code.value = result?.data?.code;

  if (codeType.value == "HZY.Models" || codeType.value == "HZY.Services.Admin" || codeType.value == "HZY.Controllers.Admin") {
    extensions.value = [loadLanguage("csharp")?.extension, githubDark as any];
  }

  if (codeType.value == "Client.Index" || codeType.value == "Client.Info") {
    extensions.value = [loadLanguage("html")?.extension, githubDark as any];
  }

  if (codeType.value == "Client.Service") {
    extensions.value = [loadLanguage("typescript")?.extension, githubDark as any];
  }
}

/**
 * 下载预览代码
 */
function download() {
  CodeGenerationService.download({
    tableName: props.rowData.tableName,
    type: codeType.value,
    codeText: "",
  });
}

/**
 * 下载对应类型得代码包
 */
function downloadAll() {
  CodeGenerationService.download({
    tableName: props.rowData.tableName,
    type: codeType.value,
    codeText: "",
  });
}
</script>

<template>
  <div>
    <div class="mb-16">
      <a-spin :spinning="loading">
        <a-radio-group v-model:value="codeType">
          <a-radio-button value="HZY.Models">实体</a-radio-button>
          <a-radio-button value="HZY.Services.Admin">服务</a-radio-button>
          <a-radio-button value="HZY.Controllers.Admin">控制器</a-radio-button>
          <a-radio-button value="Client.Index">客户端列表页</a-radio-button>
          <a-radio-button value="Client.Info">客户端表单页</a-radio-button>
          <a-radio-button value="Client.Service">客户端服务</a-radio-button>
          <a-button type="primary" @click="download()" class="ml-15">
            <template #icon>
              <AppIcon name="DownloadOutlined" />
            </template>
            下载预览代码
          </a-button>
          <a-button type="primary" @click="downloadAll()" class="ml-15">
            <template #icon>
              <AppIcon name="DownloadOutlined" />
            </template>
            下载 {{ codeType }} 类型代码包
          </a-button>
        </a-radio-group>
      </a-spin>
    </div>
    <Codemirror v-model="code" :disabled="true" :autofocus="true" :extensions="extensions" :style="{ height: 'calc(100vh - 220px)' }" />
  </div>
</template>

<style lang="stylus" scoped></style>
