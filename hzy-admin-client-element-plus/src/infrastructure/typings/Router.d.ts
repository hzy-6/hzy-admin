import 'vue-router'

declare module 'vue-router' {
    interface RouteMeta {
        //路由地址标题
        title: string
        //选项卡能否缓存
        keepAlive: boolean
        //选项卡能否关闭
        close: boolean
        //菜单路由能否显示
        show?: boolean
        //菜单Id
        menuId?: string
        //父级菜单Id
        parentId?: string
        //菜单等级编码
        levelCode?: string
        //默认跳转完整地址
        jumpUrl?: string
        //菜单图标名称
        icon?: string
    }
}