<script lang="ts" setup>
import { nextTick, ref, watchEffect, watch } from "vue";
import AppIcon from "@/core/components/AppIcon.vue";
import * as monaco from "monaco-editor";
import CodeGenerationService from "@/services/development_tool/low_code/CodeGenerationService";

//定义组件事件
const props = defineProps<{ rowData: any }>();

const codeType = ref("HZY.Models");
const loading = ref(false);
const csharpEditorContainer = ref<HTMLElement>();
// 修改 monaco editor 默认的右键菜单中的剪切、复制和粘贴菜单项的文本
let standaloneCodeEditor: monaco.editor.IStandaloneCodeEditor | null = null;

watchEffect(() => {
  loading.value = true;
  nextTick(() => {
    setTimeout(() => {
      standaloneCodeEditor = monaco.editor.create(csharpEditorContainer.value!, {
        value: ``,
        language: "csharp",
        theme: "vs-dark", // 主题
        folding: true, // 是否折叠
        foldingHighlight: true, // 折叠等高线
        foldingStrategy: "indentation", // 折叠方式  auto | indentation
        showFoldingControls: "always", // 是否一直显示折叠 always | mouseover
        disableLayerHinting: true, // 等宽优化
        emptySelectionClipboard: false, // 空选择剪切板
        selectionClipboard: false, // 选择剪切板
        // automaticLayout: true, // 自动布局
        codeLens: false, // 代码镜头
        scrollBeyondLastLine: false, // 滚动完最后一行后再滚动一屏幕
        colorDecorators: true, // 颜色装饰器
        accessibilitySupport: "off", // 辅助功能支持  "auto" | "off" | "on"
        lineNumbers: "on", // 行号 取值： "on" | "off" | "relative" | "interval" | function
        lineNumbersMinChars: 5, // 行号最小字符   number
        readOnly: false, //是否只读  取值 true | false
      });
      //
      setTimeout(() => {
        if (props.rowData) {
          getCode();
        }
      }, 100);
    }, 1000);
  });
}, props.rowData);

watch(
  () => codeType.value,
  () => {
    getCode();
  }
);

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
  if (result.code != 200) return;
  standaloneCodeEditor?.setValue(result?.data?.code);

  // 切换编辑器语言
  if (codeType.value == "HZY.Models" || codeType.value == "HZY.Services.Admin" || codeType.value == "HZY.Controllers.Admin") {
    monaco.editor.setModelLanguage(standaloneCodeEditor?.getModel()!, "csharp");
  }

  if (codeType.value == "Client.Index" || codeType.value == "Client.Info") {
    monaco.editor.setModelLanguage(standaloneCodeEditor?.getModel()!, "html");
  }

  if (codeType.value == "Client.Service") {
    monaco.editor.setModelLanguage(standaloneCodeEditor?.getModel()!, "typescript");
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
            下载代码
          </a-button>
          <a-button type="primary" @click="downloadAll()" class="ml-15">
            <template #icon>
              <AppIcon name="DownloadOutlined" />
            </template>
            下载代码包 {{ codeType }}
          </a-button>
        </a-radio-group>
      </a-spin>
    </div>
    <div ref="csharpEditorContainer" class="csharpEditorContainer"></div>
  </div>
</template>

<style lang="less" scoped>
.csharpEditorContainer {
  height: calc(100vh - 200px) !important;
}
</style>
