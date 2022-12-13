import { createApp } from 'vue';
//app
import App from './App.js';
//vue 路由
import { registerRouter } from '@/core/router';
//pinia
import { createPinia } from 'pinia';
//ant-design-vue
import antd from 'ant-design-vue';
//样式-引入覆盖antd
import '@/assets/styles/hzy-admin-ui-antd.less';
//antd icons
import { useAllIcons } from '@/core/utils/icons';
//vxe-table
import useVXETable from "@/core/utils/VxeTableUtil";
//打印
import print from 'vue3-print-nb';

createApp(App)
    .use(createPinia())
    .use(registerRouter())
    .use(antd)
    .use(useAllIcons)
    .use(useVXETable)
    .use(print)
    .mount('#app')
    ;