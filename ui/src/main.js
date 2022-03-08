import { createApp } from 'vue'
import App from './App.vue'
//vue 路由
import router from './router'
//ant-design-vue
import antd from 'ant-design-vue'
//样式-引入覆盖antd
import '@/assets/styles/hzy-admin-ui-antd.less'
//样式-nprogress
import 'nprogress/nprogress.css';
//pinia
import { createPinia } from 'pinia'
//vxe table 
import useVXETable from "@/scripts/vxe-table-util";
//antd icons
import { useAllAntdIcons } from '@/scripts/antd-icons'

var app = createApp(App);
app.use(createPinia())
app.use(router);
app.use(antd);
app.use(useVXETable);
app.use(useAllAntdIcons);
app.mount('#app');