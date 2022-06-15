var menuTreeList = [
    // {
    //     "id": 0,
    //     "name": "首页",
    //     "componentName": "HomeIndexCom",
    //     "url": "views/home/Index.vue",
    //     "router": "/home",
    //     "jumpUrl": "/home",
    //     "icon": "HomeOutlined",
    //     "close": false,
    //     "parentId": null,
    //     "children": []
    // },
    {
        "id": 1,
        // "name": "基础示例",
        name: "基础",
        "componentName": null,
        "url": null,
        "router": null,
        "jumpUrl": null,
        "icon": "BuildOutlined",
        "close": true,
        "parentId": null,
        "children": [
            // {
            //     "id": 2,
            //     "name": "Antd Vue3.0组件库",
            //     "componentName": "AntdVueComponentsCom",
            //     "url": "views/AntdVueComponents.vue",
            //     "router": "/antd/vue/components",
            //     "jumpUrl": "/antd/vue/components",
            //     "icon": "LayoutOutlined",
            //     "close": true,
            //     "parentId": 1,
            //     "levelCode": "1.2",
            //     "children": []
            // },
            {
                "id": 33,
                "name": "Vxe-Table",
                "componentName": "VxeTableCom",
                "url": "views/VxeTable.vue",
                "router": "/vxe/table",
                "jumpUrl": "/vxe/table",
                "icon": "BorderlessTableOutlined",
                "close": true,
                "parentId": 1,
                "levelCode": "1.33",
                "children": []
            },
            {
                "id": 34,
                "name": "图标库",
                "componentName": "IconsVue",
                "url": "views/Icons.vue",
                "router": "/icons",
                "jumpUrl": "/icons",
                "icon": "FireTwoTone",
                "close": true,
                "parentId": 1,
                "levelCode": "1.34",
                "children": []
            },
            {
                "id": 3,
                "name": "按钮",
                "componentName": "ButtonCom",
                "url": "views/Button.vue",
                "router": "/button",
                "jumpUrl": "/button",
                "icon": "AppstoreOutlined",
                "close": true,
                "parentId": 1,
                "levelCode": "1.3",
                "children": []
            },
            {
                "id": 4,
                "name": "图表 AntV G2",
                "componentName": null,
                "url": null,
                "router": null,
                "jumpUrl": null,
                "icon": "PieChartOutlined",
                "close": true,
                "parentId": 1,
                "levelCode": "1.4",
                "children": [
                    {
                        "id": 5,
                        "name": "基础图表",
                        "componentName": "ChartBaseCom",
                        "url": "views/chart/Base.vue",
                        "router": "/chart/base",
                        "jumpUrl": "/chart/base",
                        "icon": null,
                        "close": true,
                        "parentId": 4,
                        "levelCode": "1.4.5",
                        "children": []
                    },
                    {
                        "id": 6,
                        "name": "更多图表",
                        "componentName": "ChartMoreCom",
                        "url": "views/chart/More.vue",
                        "router": "/chart/more",
                        "jumpUrl": "/chart/more",
                        "icon": null,
                        "close": true,
                        "parentId": 4,
                        "levelCode": "1.4.6",
                        "children": []
                    }
                ]
            },
            {
                "id": 7,
                "name": "表格管理",
                "componentName": null,
                "url": null,
                "router": null,
                "jumpUrl": null,
                "icon": "TableOutlined",
                "close": true,
                "parentId": 1,
                "levelCode": "1.7",
                "children": [
                    {
                        "id": 8,
                        "name": "基础列表",
                        "componentName": "BaseListCom",
                        "url": "views/BaseList.vue",
                        "router": "/base/list",
                        "jumpUrl": "/base/list",
                        "icon": null,
                        "close": true,
                        "parentId": 7,
                        "levelCode": "1.7.8",
                        "children": []
                    },
                    {
                        "id": 9,
                        "name": "标准表格",
                        "componentName": "ListIndexCom",
                        "url": "views/list/Index.vue",
                        "router": "/list",
                        "jumpUrl": "/list",
                        "icon": null,
                        "close": true,
                        "parentId": 7,
                        "levelCode": "1.7.9",
                        "children": []
                    }
                ]
            },
            {
                "id": 10,
                "name": "富文本编辑器",
                "componentName": "EditorCom",
                "url": "views/Editor.vue",
                "router": "/editor",
                "jumpUrl": "/editor",
                "icon": "PicRightOutlined",
                "close": true,
                "parentId": 1,
                "levelCode": "1.7.8",
                "children": []
            },
            {
                "id": 11,
                "name": "跳转外部地址",
                "componentName": "ExternalJumpCom",
                "url": "components/ExternalJump.vue",
                "router": "/external/jump/:path(.*)",
                "jumpUrl": "https://antv.vision/zh",
                "icon": "LinkOutlined",
                "close": true,
                "parentId": 1,
                "levelCode": "1.11",
                "children": []
            }
        ]
    },
    {
        "id": 100,
        "name": "更多组件",
        "componentName": null,
        "url": null,
        "router": null,
        "jumpUrl": null,
        "icon": "MoreOutlined",
        "close": true,
        "parentId": null,
        "children": [
            {
                "id": 101,
                "name": "Antd Vue3.0组件库",
                "componentName": "AppComponentsCom",
                "url": "views/AppComponents.vue",
                "router": "/app/components",
                "jumpUrl": "/app/components",
                "icon": "LayoutOutlined",
                "close": true,
                "parentId": 100,
                "levelCode": "100.101",
                "children": []
            },
            {
                "id": 102,
                "name": "X6",
                "componentName": "X6Com",
                "url": "views/x6/Index.vue",
                "router": "/x6",
                "jumpUrl": "/x6",
                "icon": "LayoutOutlined",
                "close": true,
                "parentId": 100,
                "levelCode": "100.102",
                "children": []
            }]
    },
];

export default menuTreeList

// allMenuList
