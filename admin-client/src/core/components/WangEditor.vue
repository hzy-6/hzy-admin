<script lang="ts" setup>
import { onMounted, reactive, onBeforeUnmount, watch } from "vue";
import "@wangeditor/editor/dist/css/style.css";
import { createEditor, createToolbar, IDomEditor, Toolbar } from "@wangeditor/editor";

interface IProps {
  el: string;
  /**
   * 编辑器内容
   */
  html: string;
  /**
   * 编辑器高度
   */
  height: Number;
  /**
   * 文件上传域名
   */
  domainName: string;
  /**
   * 预览域名
   */
  previewDomainName: string;
}
//定义 props
const props = withDefaults(defineProps<IProps>(), {
  el: new Date().getTime() + "_" + Math.floor(Math.random() * 1000),
});
//定义事件
const emits = defineEmits<{
  (e: "update:html", value: string): void;
}>();

const state = reactive<{
  toolbarContainer: string;
  editorContainer: string;
  mode: "default" | "simple"; // 或 'simple' 参考下文
  editor: IDomEditor | null;
  toolbar: Toolbar | null;
}>({
  toolbarContainer: "toolbar-container-" + props.el,
  editorContainer: "editor-container-" + props.el,
  mode: "default", // 或 'simple' 参考下文
  editor: null,
  toolbar: null,
});

//组件销毁后 钩子函数
onBeforeUnmount(() => {
  // 销毁编辑器
  destroy();
});

onMounted(() => {
  init();
});

//【注意】下面使用的 typescript 语法。如用 javascript 语法，把类型去掉即可。
const editorConfig: any = { onChange: function () {}, MENU_CONF: {} };
editorConfig.placeholder = "请输入内容";
//菜单配置 - 上传图片
editorConfig.MENU_CONF["uploadImage"] = {
  server: props.domainName ? props.domainName + "/api/Upload/Images" : "",
  // form-data fieldName ，默认值 'wangeditor-uploaded-image'
  fieldName: "editorFileImages",
  // 超时时间，默认为 10 秒
  timeout: 60 * 1000, // 5 秒
  // 单个文件的最大体积限制，默认为 2M
  maxFileSize: 10 * 1024 * 1024, // 1M
  // 上传之前触发
  onBeforeUpload(file: File) {
    // file 选中的文件，格式如 { key: file }
    console.log(`${file.name} 上传之前触发`, file);
    return file;

    // 可以 return
    // 1. return file 或者 new 一个 file ，接下来将上传
    // 2. return false ，不上传这个 file
  },
  // 上传进度的回调函数
  onProgress(progress: number) {
    // progress 是 0-100 的数字
    console.log("progress", progress);
  },
  // 单个文件上传成功之后
  onSuccess(file: File, res: any) {
    console.log(`${file.name} 上传成功`, res);
  },
  // 单个文件上传失败
  onFailed(file: File, res: any) {
    console.log(`${file.name} 上传失败`, res);
  },
  // 上传错误，或者触发 timeout 超时
  onError(file: File, err: any, res: any) {
    console.log(`${file.name} 上传出错`, err, res);
  },
  // 自定义插入图片
  customInsert(res: any, insertFn: any) {
    // res 即服务端的返回结果

    // 从 res 中找到 url alt href ，然后插图图片
    // insertFn(url, alt, href);

    // result 即服务端返回的接口
    console.log("res", res);
    console.log("insertFn", insertFn);

    // insertImgFn 可把图片插入到编辑器，传入图片 src ，执行函数即可
    let data = res.data;
    for (let i = 0; i < data.length; i++) {
      let item = data[i];
      if (props.previewDomainName) {
        insertFn(props.previewDomainName + item);
      } else {
        insertFn(item);
      }
    }
  },
};

watch(
  () => props.html,
  (value) => {
    if (state.editor) {
      state.editor.clear();
      state.editor.dangerouslyInsertHtml(props.html);
    }
  }
);

//事件配置
// editorConfig.onCreated = (editor) => {
//   // 当编辑器选区、内容变化时，即触发
//   editor.clear();
//   editor.dangerouslyInsertHtml(props.html);
// };
editorConfig.onChange = (editor: any) => {
  // 当编辑器选区、内容变化时，即触发
  emits("update:html", editor.getHtml());
};

/**
 * 初始化
 */
function init() {
  // 创建编辑器
  state.editor = createEditor({
    selector: "#" + state.editorContainer,
    config: editorConfig,
    mode: state.mode, // 或 'simple' 参考下文
    html: props.html,
  });
  // 创建工具栏
  state.toolbar = createToolbar({
    editor: state.editor,
    selector: "#" + state.toolbarContainer,
    mode: state.mode, // 或 'simple' 参考下文
  });
}

/**
 * 销毁编辑器
 */
function destroy() {
  // 销毁编辑器
  state.editor!.destroy();
  state.toolbar!.destroy();
  state.editor = null;
}
</script>

<template>
  <div style="z-index: 99; border: 1px solid #ccc">
    <div :id="state.toolbarContainer" style="border-bottom: 1px solid #ccc"></div>
    <div :id="state.editorContainer" :style="{ height: props.height + 'px' }"></div>
  </div>
</template>

<style scoped></style>
