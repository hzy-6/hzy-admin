<template>
  <component :is="iconName" :fill="$props.color" :style="style" :class="$props.class" v-if="isAntdIcon" />
  <!-- element plus icon -->
  <i :style="{ width: $props.size + 'px', height: $props.size + 'px', color: $props.color, ...$props.style }" :color="$props.color" :class="$props.class" v-else>
    <component :is="iconName" />
  </i>
</template>

<script>
import { defineComponent, getCurrentInstance, ref, watch } from "vue";
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
  setup(props) {
    const iconName = ref(props.name);
    const currentInstance = getCurrentInstance();
    const allNameByAntds = getAllNameByAntd(currentInstance);
    const isAntdIcon = ref(allNameByAntds.findIndex((w) => w == props.name) > -1);

    watch(
      () => props.name,
      (value) => {
        if (!value) return;
        isAntdIcon.value = allNameByAntds.findIndex((w) => w == value) > -1;
        if (isAntdIcon.value) {
          iconName.value = value;
        } else {
          iconName.value = value.indexOf("EP-") > -1 ? value : "EP-" + value;
          console.log(iconName.value);
        }
      }
    );

    //style 用于兼容 antd 图标
    let style = props.style ? props.style : {};
    if (isAntdIcon.value) {
      style["fontSize"] = props.size + "px";
    }

    return { isAntdIcon, style, iconName };
  },
});
</script>
