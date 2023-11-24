<script setup lang="ts">
import CoreStore from "@/core/store/layouts/CoreStore";

const coreStore = CoreStore();

</script>

<template>
  <!--多语言下拉框-->
  <a-dropdown>
    <slot>
      <a-button>
        <template #icon>
          <TranslationOutlined/>
        </template>
      </a-button>
    </slot>

    <template #overlay>
      <a-menu>
        <a-menu-item @click="coreStore.setLocale('zh-CN')">
          <!--            <a href="javascript:;"></a>-->
          中文
        </a-menu-item>
        <a-menu-item @click="coreStore.setLocale('en-US')">
          <!--            <a href="javascript:;"></a>-->
          English
        </a-menu-item>
      </a-menu>
    </template>
  </a-dropdown>
</template>
