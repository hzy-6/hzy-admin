<template>
  <component :is="currentIcon" v-if="!!name && currentIcon" />
</template>

<script>
import { defineComponent, watch, ref } from "vue";
import { getAllAntdIcons, getAllAntdIconNames } from "@/scripts/antd-icons";

export default defineComponent({
  name: "AppIconsCom",
  props: {
    name: String,
  },
  setup(props) {
    var antdIcons = getAllAntdIcons();
    var names = getAllAntdIconNames();
    //验证一下，组件名称是否存在合理的 名称集合里面
    var currentIcon = ref(null);
    currentIcon.value = names.findIndex((w) => w == props.name) > -1 ? antdIcons[props.name] : null;

    watch(
      () => props.name,
      (value) => {
        currentIcon.value = names.findIndex((w) => w == value) > -1 ? antdIcons[value] : null;
      }
    );

    return {
      currentIcon,
    };
  },
});
</script>
