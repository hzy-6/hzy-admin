<template>
  <component :is="$props.name" :fill="$props.color" :style="style" :class="$props.class" v-if="isAntdIcon" />
  <!-- xicons -->
  <Icon :tag="$props.tag ? $props.tag : 'i'" :size="$props.size" :color="$props.color" :style="$props.style" :class="$props.class" v-else>
    <component :is="$props.name" />
  </Icon>
</template>

<script>
import { defineComponent, getCurrentInstance, ref, watch } from "vue";
import { Icon } from "@vicons/utils";
// icons
import { getAllNameByAntd } from "@/scripts/icons";

//封装组件来自：https://www.xicons.org/#/

export default defineComponent({
  name: "AppIconCom",
  props: {
    name: String,
    // size: Number | String,
    size: Number,
    color: String,
    style: Object | String,
    class: Object | String,
    tag: String,
  },
  components: { Icon },
  setup(props) {
    const currentInstance = getCurrentInstance();
    const allNameByAntds = getAllNameByAntd(currentInstance);
    const isAntdIcon = ref(allNameByAntds.findIndex((w) => w == props.name) > -1);

    watch(
      () => props.name,
      () => {
        isAntdIcon.value = allNameByAntds.findIndex((w) => w == props.name) > -1;
      }
    );

    //style 用于兼容 antd 图标
    let style = props.style ? props.style : {};
    if (isAntdIcon.value) {
      style["fontSize"] = props.size + "px";
    }

    return { isAntdIcon, style };
  },
});
</script>
