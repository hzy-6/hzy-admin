import 'vue-router'
import { MenuItemModel } from "@/core/store/layouts/MenuStore";

declare module 'vue-router' {
    interface RouteMeta extends MenuItemModel {
        //路由地址标题
        title?: string
        //菜单Id
        menuId?: number
    }
}