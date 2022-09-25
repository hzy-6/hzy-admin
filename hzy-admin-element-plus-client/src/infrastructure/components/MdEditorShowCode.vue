<script lang="ts" setup>
import { computed, reactive } from "vue";

const props = defineProps<{ text: string }>();

const state = reactive({
  text: computed(() => props.text),
});
</script>

<template>
  <div>
    <highlightjs autodetect :code="state.text" />
  </div>
</template>
