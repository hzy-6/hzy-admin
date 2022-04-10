<template>
  <div>
    <div>
      <Context />
    </div>

    <a-row :gutter="[15, 15]" class="mt-5">
      <a-col :xs="24" :sm="24" :md="24" :lg="12" :xl="12">
        <TimeConsumingRanking />
      </a-col>
      <a-col :xs="24" :sm="24" :md="24" :lg="12" :xl="12">
        <Newest />
      </a-col>
    </a-row>
  </div>
</template>

<script>
import { defineComponent } from "vue";
import Context from "./components/Context.vue";
import TimeConsumingRanking from "./components/TimeConsumingRanking.vue";
import Newest from "./components/Newest.vue";

export default defineComponent({
  name: "monitor_ef_core",
  components: { Context, TimeConsumingRanking, Newest },
  setup() {
    return {};
  },
});
</script>
