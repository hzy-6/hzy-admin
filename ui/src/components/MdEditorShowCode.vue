<template>
  <md-editor :editorId="state.editorId" v-model="state.text" :theme="state.theme" previewOnly :preview-theme="state.previewTheme" />
  <!-- <md-editor editor-id="ddd" /> -->
  <!-- <md-catalog editor-id="ddd" /> -->
</template>

<script setup>
import { reactive } from "vue";
import MdEditor from "md-editor-v3";
import "md-editor-v3/lib/style.css";

//插件 文档地址：https://imzbf.github.io/md-editor-v3/index

const props = defineProps({ text: String, editorId: String });

// MdEditor.config({
//   editorExtensions: {
//     highlight: {
//       js: "https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@11.2.0/build/highlight.min.js",
//       css: {
//         dark: "https://cdn.jsdelivr.net/npm/highlight.js@11.2.0/styles/atom-one-dark.css",
//       },
//     },
//   },
// });

const state = reactive({
  text: props.text,
  theme: "light", //dark  |  light
  //default、github、vuepress
  previewTheme: "default",
  editorId: props.editorId ? props.editorId : null,
});
</script>
