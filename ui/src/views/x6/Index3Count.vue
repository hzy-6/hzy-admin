<template>
  <Button type="primary" @click="count++">计数:{{ count }}</Button>
</template>
<script>
import { defineComponent, ref } from "vue";
import { Button } from "ant-design-vue";

export default defineComponent({
  name: "Index3CountCom",
  components: { Button },
  setup() {
    const count = ref(0);
    return { count };
  },
});
</script>
