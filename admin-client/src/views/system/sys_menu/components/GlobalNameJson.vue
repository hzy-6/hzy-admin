<script lang="ts" setup>
import {reactive, onMounted} from "vue";
import SysMenuService from "@/services/system/SysMenuService";

defineOptions({name: "system_menu"});

const state = reactive({
  visible: false,
  loading: false,
  jsonString: ''
});

/**
 * 向父级导出 函数
 */
defineExpose({
  /**
   * 打开表单初始化
   */
  open: () => {
    state.visible = true;

    console.log('result', 123);

    getGlobalNameJson();

  }
});

/**
 * 初始化
 */
onMounted(() => {

});

/**
 * 复制菜单
 */
async function getGlobalNameJson() {
  state.loading = true;
  const result = await SysMenuService.getGlobalNameJson();
  state.loading = false;
  if (result.code != 200) return;
  state.jsonString = JSON.stringify(result.data,null, 4);
}
</script>

<template>
  <a-modal v-model:open="state.visible" title="国际化菜单Json">
    <a-textarea autosize v-model:value="state.jsonString"></a-textarea>
  </a-modal>
</template>
