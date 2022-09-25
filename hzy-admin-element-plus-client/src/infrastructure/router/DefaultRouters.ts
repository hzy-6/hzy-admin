import AppConsts from '@/infrastructure/scripts/AppConsts';
import { RouteRecordRaw } from 'vue-router';

const layout = () => import("@/infrastructure/components/layouts/Layout.vue");
const vues = import.meta.glob(['../views/**/**.vue']);

//路由配置
const routes: Array<RouteRecordRaw> = [
    {
        //登录
        path: '/login',
        name: "LoginCom",
        component: () => import('@/views/Login.vue')
    },
    {
        //找不到地址
        path: '/:pathMatch(.*)*',
        name: '404',
        component: () => import('@/infrastructure/components/404.vue')
    },
    {
        //用户刷新组件
        path: '/redirect',
        component: layout,
        children: [{
            path: '/redirect/:path(.*)',
            name: "RedirectCom",
            component: () => import('@/infrastructure/components/Redirect.vue'),
        }]
    }
];

export default routes;