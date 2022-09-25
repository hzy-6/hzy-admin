import { createApp } from 'vue'
import App from './App.vue'
//pinia
import { createPinia } from 'pinia';
// 路由
import router from '@/infrastructure/router';
//element plus
import ElementPlus from 'element-plus';
import "./assets/styles/hzy-admin-ui-layout.scss";
//自定义 less 样式
import "./assets/styles/hzy-admin-ui-layout.less";
//图标注册
import { useAllIcons } from "@/infrastructure/scripts/icons";
//vxe-table
import useVXETable from "@/infrastructure/scripts/VxeTableUtil";

createApp(App)
    .use(createPinia())
    .use(router)
    .use(ElementPlus)
    .use(useAllIcons)
    .use(useVXETable)
    .mount('#app');
