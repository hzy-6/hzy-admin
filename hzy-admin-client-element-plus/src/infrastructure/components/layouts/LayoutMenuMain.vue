<script lang="ts" setup>
import LayoutMenuPcVue from "./LayoutMenuPc.vue";
import LayoutMenuMobileVue from "./LayoutMenuMobile.vue";
import CoreStore from "@/infrastructure/store/layouts/CoreStore";
//
const coreStore = CoreStore();
</script>

<template>
  <LayoutMenuMobileVue v-if="coreStore.state.isMobile" />
  <LayoutMenuPcVue v-else />
</template>
