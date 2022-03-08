import layout from '@/components/layout/Layout.vue';
//路由配置
export default [
    {
        //登录
        path: '/login',
        name: "LoginCom",
        component: () => import('@/views/Login.vue')
    },
    {
        //找不到地址
        path: '/:pathMatch(.*)',
        name: 'NotFoundComponentCom',
        component: () => import('@/components/NotFoundComponent.vue')
    },
    {
        //用户刷新组件
        path: '/redirect',
        component: layout,
        hidden: true,
        children: [{
            path: '/redirect/:path(.*)',
            name: "RedirectCom",
            component: () => import('@/components/Redirect.vue'),
        }]
    },
    {
        //默认首页
        name: 'defaultLayout',
        path: '',
        component: layout,
        redirect: '/home',
        children: [
            {
                path: '/home',
                name: "HomeIndexCom",
                component: () => import('@/views/home/Index.vue'),
                meta: { title: '首页', close: false, keepAlive: true },
            }]
    }
    // {
    //     path: '/',
    //     component: layout,
    //     redirect: "/home"
    // },
    // {
    //     path: '/',
    //     component: layout,
    //     children: [{
    //         path: '/home',
    //         name: "HomeIndexCom",
    //         component: () => import('@/views/home/Index.vue'),
    //         meta: { title: '首页', close: false, keepAlive: true },
    //     }]
    // },
    // {
    //     path: '/',
    //     component: layout,
    //     children: [{
    //         path: '/button',
    //         name: "ButtonCom",
    //         component: () => import('@/views/Button.vue'),
    //         meta: { title: '按钮', close: true, keepAlive: true },
    //     }]
    // },
    // {
    //     path: '/',
    //     component: layout,
    //     children: [{
    //         path: '/list',
    //         name: "ListIndexCom",
    //         component: () => import('@/views/list/Index.vue'),
    //         meta: { title: '标准列表', close: true, keepAlive: true },
    //     }]
    // },
    // {
    //     path: '/',
    //     component: layout,
    //     children: [{
    //         path: '/base/list',
    //         name: "BaseListCom",
    //         component: () => import('@/views/BaseList.vue'),
    //         meta: { title: '基础列表', close: true, keepAlive: true },
    //     }]
    // },
    // {
    //     path: '/',
    //     component: layout,
    //     children: [{
    //         path: '/chart/base',
    //         name: "ChartBaseCom",
    //         component: () => import('@/views/chart/Base.vue'),
    //         meta: { title: '基础图表', close: true, keepAlive: true },
    //     }]
    // },
    // {
    //     path: '/',
    //     component: layout,
    //     children: [{
    //         path: '/chart/more',
    //         name: "ChartMoreCom",
    //         component: () => import('@/views/chart/More.vue'),
    //         meta: { title: '更多示例', close: true, keepAlive: true },
    //     }]
    // },
    // {
    //     path: '/',
    //     component: layout,
    //     children: [{
    //         path: '/antd/vue/components',
    //         name: "AntdVueComponentsCom",
    //         component: () => import('@/views/AntdVueComponents.vue'),
    //         meta: { title: 'Antd Vue3.0组件库', close: true, keepAlive: true },
    //     }]
    // },
    // {
    //     path: '/',
    //     component: layout,
    //     children: [{
    //         path: '/editor',
    //         name: "EditorCom",
    //         component: () => import('@/views/Editor.vue'),
    //         meta: { title: '富文本编辑器', close: true, keepAlive: true },
    //     }]
    // }
];