<template>
  <a-card title="Icons 图标集合" :bordered="false" :headStyle="{ 'border-bottom': 0 }">
    <template #extra>
      <a href="https://next.antdv.com/components/icon-cn" target="_black"> 官方图标</a>
    </template>
    <AppIconList v-model:name="iconName" :height="600" />
  </a-card>
</template>
<script>
import { defineComponent, reactive, toRefs } from "vue";
import AppIconList from "@/components/AppIconList.vue";

export default defineComponent({
  name: "IconsVue",
  components: { AppIconList },
  setup() {
    const state = reactive({
      iconName: "AlipaySquareFilled",
    });

    return {
      ...toRefs(state),
    };
  },
});
</script>
