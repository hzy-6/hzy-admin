<template>
  <component :is="$props.name" v-if="!!name" />
</template>

<script>
import { defineComponent } from "vue";

export default defineComponent({
  name: "AppIconsCom",
  props: {
    name: String,
  },
  setup() {
    return {};
  },
});
</script>
