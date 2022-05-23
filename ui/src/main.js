import { createApp } from 'vue'
import App from './App.vue'
//vue 路由
import router from './router'
//ant-design-vue
import antd from 'ant-design-vue'
//样式-引入覆盖antd
import '@/assets/styles/hzy-admin-ui-antd.less'
//pinia
import { createPinia } from 'pinia';
//vxe table 
import useVXETable from "@/scripts/vxe-table-util";
//antd icons
import { useAllIcons } from '@/scripts/icons';
//打印
import print from 'vue3-print-nb';

var app = createApp(App);
app.use(createPinia());
app.use(router);
app.use(antd);
app.use(useVXETable);
app.use(useAllIcons);
app.use(print);
app.mount('#app');