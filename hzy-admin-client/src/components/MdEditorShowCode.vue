<template>
  <div>
    <highlightjs autodetect :code="state.text" />
  </div>
</template>

<script setup>
import { computed, reactive } from "vue";

const props = defineProps({ text: String });

const state = reactive({
  text: computed(() => props.text),
});
</script>
