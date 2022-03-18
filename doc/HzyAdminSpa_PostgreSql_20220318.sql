/*
 Navicat Premium Data Transfer

 Source Server         : 本机_postgresql
 Source Server Type    : PostgreSQL
 Source Server Version : 130003
 Source Host           : localhost:5432
 Source Catalog        : HzyAdminSpa20220318
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 130003
 File Encoding         : 65001

 Date: 18/03/2022 10:09:33
*/


-- ----------------------------
-- Table structure for Member
-- ----------------------------
DROP TABLE IF EXISTS "public"."Member";
CREATE TABLE "public"."Member" (
  "Id" uuid NOT NULL,
  "Number" varchar(255) COLLATE "pg_catalog"."default",
  "Name" varchar(255) COLLATE "pg_catalog"."default",
  "Phone" varchar(255) COLLATE "pg_catalog"."default",
  "Sex" varchar(255) COLLATE "pg_catalog"."default",
  "Birthday" timestamp(6),
  "Photo" varchar(255) COLLATE "pg_catalog"."default",
  "Introduce" varchar(255) COLLATE "pg_catalog"."default",
  "FilePath" varchar(255) COLLATE "pg_catalog"."default",
  "UserId" uuid,
  "CreationTime" timestamp(6),
  "LastModificationTime" timestamp(6)
)
;

-- ----------------------------
-- Records of Member
-- ----------------------------
INSERT INTO "public"."Member" VALUES ('96a1aa3d-a61a-42d0-954a-c71753fb2065', '123', '123', '123', '女', '2018-04-25 23:00:00', NULL, '<p>123</p>', NULL, 'ac18f496-e93d-42f0-b59e-e321acc85335', '2020-10-24 00:07:42', '2021-04-18 22:08:06');
INSERT INTO "public"."Member" VALUES ('9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', '1', '测试会员', '18510912123', '男', '2019-07-08 11:47:24', '/upload/files/20210118/time_232747_old_name_hzy.png', '<p>888</p>', '/upload/files/20210118/time_233310_old_name_hzy.png', 'ac18f496-e93d-42f0-b59e-e321acc85335', '2018-04-25 23:00:00', '2021-01-19 14:19:47');

-- ----------------------------
-- Table structure for SysDataAuthority
-- ----------------------------
DROP TABLE IF EXISTS "public"."SysDataAuthority";
CREATE TABLE "public"."SysDataAuthority" (
  "Id" uuid NOT NULL,
  "LastModificationTime" timestamp(6),
  "CreationTime" timestamp(6),
  "RoleId" uuid,
  "PermissionType" int4
)
;
COMMENT ON COLUMN "public"."SysDataAuthority"."PermissionType" IS '数据权限类型';

-- ----------------------------
-- Records of SysDataAuthority
-- ----------------------------
INSERT INTO "public"."SysDataAuthority" VALUES ('d09bf250-c5b0-41cb-237d-08da00442990', '2022-03-08 10:02:22.62', '2022-03-07 22:09:58', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 5);

-- ----------------------------
-- Table structure for SysDataAuthorityCustom
-- ----------------------------
DROP TABLE IF EXISTS "public"."SysDataAuthorityCustom";
CREATE TABLE "public"."SysDataAuthorityCustom" (
  "Id" uuid NOT NULL,
  "LastModificationTime" timestamp(6),
  "CreationTime" timestamp(6),
  "SysDataAuthorityId" uuid,
  "SysOrganizationId" int4 NOT NULL
)
;

-- ----------------------------
-- Records of SysDataAuthorityCustom
-- ----------------------------

-- ----------------------------
-- Table structure for SysDictionary
-- ----------------------------
DROP TABLE IF EXISTS "public"."SysDictionary";
CREATE TABLE "public"."SysDictionary" (
  "Id" int4 NOT NULL,
  "LastModificationTime" timestamp(6),
  "CreationTime" timestamp(6),
  "Sort" int4,
  "Code" varchar(255) COLLATE "pg_catalog"."default",
  "Value" varchar(255) COLLATE "pg_catalog"."default",
  "Name" varchar(255) COLLATE "pg_catalog"."default",
  "ParentId" int4
)
;
COMMENT ON COLUMN "public"."SysDictionary"."Id" IS 'id';
COMMENT ON COLUMN "public"."SysDictionary"."LastModificationTime" IS '更新时间';
COMMENT ON COLUMN "public"."SysDictionary"."CreationTime" IS '创建时间';
COMMENT ON COLUMN "public"."SysDictionary"."Sort" IS '排序号';
COMMENT ON COLUMN "public"."SysDictionary"."Code" IS '编码';
COMMENT ON COLUMN "public"."SysDictionary"."Value" IS '值';
COMMENT ON COLUMN "public"."SysDictionary"."Name" IS '分组名/键';
COMMENT ON COLUMN "public"."SysDictionary"."ParentId" IS '父级分组id';
COMMENT ON TABLE "public"."SysDictionary" IS '数据字典';

-- ----------------------------
-- Records of SysDictionary
-- ----------------------------
INSERT INTO "public"."SysDictionary" VALUES (1, '2021-07-25 22:39:34.87', '2021-07-25 22:31:30.49', 1, 'news_type', NULL, '资讯类别', NULL);
INSERT INTO "public"."SysDictionary" VALUES (2, '2021-07-25 22:40:30.037', '2021-07-25 22:38:49.153', 1, 'news_type_nan', '1', '男', 1);
INSERT INTO "public"."SysDictionary" VALUES (3, '2021-07-25 22:40:52.99', '2021-07-25 22:40:47.933', 2, 'news_type_nv', '2', '女', 1);

-- ----------------------------
-- Table structure for SysFunction
-- ----------------------------
DROP TABLE IF EXISTS "public"."SysFunction";
CREATE TABLE "public"."SysFunction" (
  "Id" uuid NOT NULL,
  "Number" int4,
  "Name" varchar(255) COLLATE "pg_catalog"."default",
  "ByName" varchar(255) COLLATE "pg_catalog"."default",
  "Remark" varchar(255) COLLATE "pg_catalog"."default",
  "LastModificationTime" timestamp(6),
  "CreationTime" timestamp(6)
)
;

-- ----------------------------
-- Records of SysFunction
-- ----------------------------
INSERT INTO "public"."SysFunction" VALUES ('b6fd5425-504a-46a9-993b-2f8dc9158eb8', 80, '打印', 'Print', 'Print', '2021-04-18 22:08:06', '2016-06-20 13:40:52');
INSERT INTO "public"."SysFunction" VALUES ('c9518758-b2e1-4f51-b517-5282e273889c', 10, '显示', 'Display', 'Display', '2021-04-18 22:08:06', '2016-06-20 13:40:52');
INSERT INTO "public"."SysFunction" VALUES ('f27ecb0a-197d-47b1-b243-59a8c71302bf', 60, '检索', 'Search', 'Search', '2021-04-18 22:08:06', '2016-06-20 13:40:52');
INSERT INTO "public"."SysFunction" VALUES ('383e7ee2-7690-46ac-9230-65155c84aa30', 50, '保存', 'Save', 'Save', '2021-04-18 22:08:06', '2016-06-20 13:40:52');
INSERT INTO "public"."SysFunction" VALUES ('9c388461-2704-4c5e-a729-72c17e9018e1', 40, '删除', 'Delete', 'Delete', '2021-04-18 22:08:06', '2016-06-20 13:40:52');
INSERT INTO "public"."SysFunction" VALUES ('bffefb1c-8988-4ddf-b4ac-81c2b30e80cd', 20, '添加', 'Insert', 'Insert', '2021-04-18 22:08:06', '2016-06-20 13:40:52');
INSERT INTO "public"."SysFunction" VALUES ('2401f4d0-60b0-4e2e-903f-84c603373572', 70, '导出', 'Export', 'Export', '2021-04-18 22:08:06', '2016-06-20 13:40:52');
INSERT INTO "public"."SysFunction" VALUES ('e7ef2a05-8317-41c3-b588-99519fe88bf9', 30, '修改', 'Update', 'Update', '2021-04-18 22:08:06', '2016-06-20 13:40:52');

-- ----------------------------
-- Table structure for SysMenu
-- ----------------------------
DROP TABLE IF EXISTS "public"."SysMenu";
CREATE TABLE "public"."SysMenu" (
  "Id" int4 NOT NULL,
  "LastModificationTime" timestamp(6),
  "CreationTime" timestamp(6),
  "LevelCode" varchar(50) COLLATE "pg_catalog"."default",
  "Number" int4,
  "Name" varchar(255) COLLATE "pg_catalog"."default",
  "Url" varchar(255) COLLATE "pg_catalog"."default",
  "Router" varchar(255) COLLATE "pg_catalog"."default",
  "ComponentName" varchar(255) COLLATE "pg_catalog"."default",
  "Icon" varchar(255) COLLATE "pg_catalog"."default",
  "ParentId" int4,
  "Show" bool,
  "Close" bool,
  "KeepAlive" bool,
  "State" bool,
  "JumpUrl" varchar(255) COLLATE "pg_catalog"."default",
  "Type" int4
)
;

-- ----------------------------
-- Records of SysMenu
-- ----------------------------
INSERT INTO "public"."SysMenu" VALUES (1, '2022-03-04 12:25:39', '2021-05-28 11:49:02', '1', 10, '更多示例', NULL, NULL, NULL, 'MoreOutlined', NULL, 't', 't', 't', 't', NULL, 1);
INSERT INTO "public"."SysMenu" VALUES (2, '2022-03-04 12:26:04', '2021-01-16 16:05:22', '1.2', 10, 'Antd Vue3.0组件', 'views/AntdVueComponents.vue', '/antd/vue/components', 'AntdVueComponentsCom', 'LayoutOutlined', 1, 't', 't', 't', 't', NULL, 2);
INSERT INTO "public"."SysMenu" VALUES (3, '2022-03-04 12:26:14', '2020-12-17 14:58:05', '1.3', 30, '按钮', 'views/Button.vue', '/button', 'ButtonCom', 'AppstoreOutlined', 1, 't', 't', 't', 't', NULL, 2);
INSERT INTO "public"."SysMenu" VALUES (4, '2022-03-04 12:26:21', '2021-01-16 16:06:33', '1.4', 40, '图表 AntV G2', NULL, NULL, NULL, 'PieChartOutlined', 1, 't', 't', 't', 't', NULL, 1);
INSERT INTO "public"."SysMenu" VALUES (5, '2022-03-04 12:26:25', '2021-01-16 16:07:24', '1.4.5', 10, '基础图表', 'views/chart/Base.vue', '/chart/base', 'ChartBaseCom', NULL, 4, 't', 't', 't', 't', NULL, 2);
INSERT INTO "public"."SysMenu" VALUES (6, '2022-03-04 12:26:28', '2021-01-16 16:10:06', '1.4.6', 20, '更多图表', 'views/chart/More.vue', '/chart/more', 'ChartMoreCom', NULL, 4, 't', 't', 't', 't', NULL, 2);
INSERT INTO "public"."SysMenu" VALUES (7, '2022-03-04 12:26:34', '2018-03-10 12:16:38', '1.7', 50, '表格管理', NULL, NULL, NULL, 'TableOutlined', 1, 't', 't', 't', 't', NULL, 1);
INSERT INTO "public"."SysMenu" VALUES (8, '2022-03-04 12:26:38', '2020-12-17 14:49:12', '1.7.8', 100, '基础列表', 'views/BaseList.vue', '/base/list', 'BaseListCom', NULL, 7, 't', 't', 't', 't', NULL, 2);
INSERT INTO "public"."SysMenu" VALUES (9, '2022-03-04 12:26:41', '2020-12-17 14:51:07', '1.7.9', 110, '标准表格', 'views/list/Index.vue', '/list', 'ListIndexCom', NULL, 7, 't', 't', 't', 't', NULL, 2);
INSERT INTO "public"."SysMenu" VALUES (10, '2022-03-04 12:26:46', '2021-01-18 19:34:28', '1.10', 60, '富文本编辑器', 'views/Editor.vue', '/editor', 'EditorCom', 'PicRightOutlined', 1, 't', 't', 't', 't', NULL, 2);
INSERT INTO "public"."SysMenu" VALUES (11, '2022-03-04 12:26:49', '2021-08-05 21:51:12', '1.11', 70, '跳转外部地址', 'components/ExternalJump.vue', '/external/jump/:path(.*)', 'ExternalJumpCom', 'RadarChartOutlined', 1, 't', 't', 't', 't', 'https://antv.vision/zh', 2);
INSERT INTO "public"."SysMenu" VALUES (12, '2022-03-04 12:25:43', '2018-03-10 12:16:38', '12', 50, '基础信息', NULL, NULL, NULL, 'GoldOutlined', NULL, 't', 't', 't', 't', NULL, 1);
INSERT INTO "public"."SysMenu" VALUES (13, '2022-03-04 12:26:55', '2018-03-10 12:16:38', '12.13', 10, '会员管理', 'views/base/member/Index.vue', '/base/member', 'base_member', 'UsergroupAddOutlined', 12, 't', 't', 't', 't', NULL, 2);
INSERT INTO "public"."SysMenu" VALUES (14, '2022-03-04 12:25:46', '2018-03-10 12:16:38', '14', 100, '系统管理', NULL, NULL, NULL, 'DesktopOutlined', NULL, 't', 't', 't', 't', NULL, 1);
INSERT INTO "public"."SysMenu" VALUES (15, '2022-03-04 12:27:02', '2018-03-10 12:16:38', '14.15', 100, '账户管理', 'views/system/user/Index.vue', '/system/user', 'system_user', 'UserOutlined', 14, 't', 't', 't', 't', NULL, 2);
INSERT INTO "public"."SysMenu" VALUES (16, '2022-03-04 12:27:07', '2018-03-10 12:16:38', '14.16', 110, '角色管理', 'views/system/role/Index.vue', '/system/role', 'system_role', 'TeamOutlined', 14, 't', 't', 't', 't', NULL, 2);
INSERT INTO "public"."SysMenu" VALUES (17, '2022-03-04 12:27:11', '2018-03-10 12:16:38', '14.17', 120, '功能管理', 'views/system/function/Index.vue', '/system/function', 'system_function', 'ControlOutlined', 14, 't', 't', 't', 't', NULL, 2);
INSERT INTO "public"."SysMenu" VALUES (19, '2022-03-04 12:27:19', '2018-03-10 12:16:38', '14.19', 150, '个人中心', 'views/system/personal_center/Index.vue', '/system/personal/center', 'system_personal_center', 'FormOutlined', 14, 't', 't', 't', 't', NULL, 2);
INSERT INTO "public"."SysMenu" VALUES (20, '2022-03-04 12:27:23', '2021-05-27 17:29:49', '14.20', 160, '岗位管理', 'views/system/post/Index.vue', '/system/post', 'system_post', 'IdcardOutlined', 14, 't', 't', 't', 't', NULL, 2);
INSERT INTO "public"."SysMenu" VALUES (21, '2022-03-04 12:27:27', '2021-05-27 20:27:56', '14.21', 170, '组织机构', 'views/system/organization/Index.vue', '/system/organization', 'system_organization', 'ClusterOutlined', 14, 't', 't', 't', 't', NULL, 2);
INSERT INTO "public"."SysMenu" VALUES (22, '2022-03-04 12:27:41', '2018-03-10 12:17:03', '29.22', 10, '接口文档', 'views/development_tool/Swagger.vue', '/development_tool/swagger', 'swagger', 'FileSearchOutlined', 29, 't', 't', 't', 't', NULL, 2);
INSERT INTO "public"."SysMenu" VALUES (23, '2022-03-04 12:27:31', '2021-07-25 21:50:01', '14.23', 190, '数据字典', 'views/system/dictionary/Index.vue', '/system/dictionary', 'system_dictionary', 'FileDoneOutlined', 14, 't', 't', 't', 't', NULL, 2);
INSERT INTO "public"."SysMenu" VALUES (24, '2022-03-04 12:27:35', '2021-08-05 21:24:54', '14.24', 200, '操作日志', 'views/system/sys_operation_log/Index.vue', '/system/sys_operation_log', 'sys_operation_log', 'ContainerOutlined', 14, 't', 't', 't', 't', '', 2);
INSERT INTO "public"."SysMenu" VALUES (25, '2022-03-04 12:27:15', '2018-03-10 12:16:38', '14.25', 130, '菜单功能', 'views/system/menu/Index.vue', '/system/menu', 'system_menu', 'MenuOutlined', 14, 't', 't', 't', 't', NULL, 2);
INSERT INTO "public"."SysMenu" VALUES (28, '2022-03-04 12:26:00', '2021-12-29 17:13:26', '1.28', 1, 'Vxe-Table', 'views/VxeTable.vue', '/vxe/table', 'VxeTableCom', 'BorderlessTableOutlined', 1, 't', 't', 't', 't', NULL, 2);
INSERT INTO "public"."SysMenu" VALUES (29, '2022-03-04 12:25:49', '2022-01-12 14:17:21', '29', 200, '开发工具', NULL, NULL, NULL, 'CodepenOutlined', NULL, 't', 't', 't', 't', NULL, 1);
INSERT INTO "public"."SysMenu" VALUES (30, '2022-03-04 12:27:44', '2022-01-12 14:22:04', '29.30', 20, '定时任务', 'views/development_tool/timed_task/Index.vue', '/development_tool/timed_task', 'TimedTaskCom', 'FieldTimeOutlined', 29, 't', 't', 't', 't', NULL, 2);
INSERT INTO "public"."SysMenu" VALUES (31, '2022-03-04 12:27:48', '2022-01-12 15:39:46', '29.31', 30, '代码生成', 'views/development_tool/code_generation/Index.vue', '/development_tool/code_generation', 'code_generation_index', 'CodeTwoTone', 29, 't', 't', 't', 't', NULL, 2);
INSERT INTO "public"."SysMenu" VALUES (32, '2022-03-04 12:26:08', '2022-02-24 10:51:38', '1.32', 20, '图标展示', 'views/AntdIcons.vue', '/antd/icons', 'AntdIconsCom', 'TagsTwoTone', 1, 't', 't', 't', 't', NULL, 2);

-- ----------------------------
-- Table structure for SysMenuFunction
-- ----------------------------
DROP TABLE IF EXISTS "public"."SysMenuFunction";
CREATE TABLE "public"."SysMenuFunction" (
  "Id" uuid NOT NULL,
  "LastModificationTime" timestamp(6),
  "CreationTime" timestamp(6),
  "Number" int4,
  "MenuId" int4,
  "FunctionCode" varchar(100) COLLATE "pg_catalog"."default",
  "FunctionName" varchar(100) COLLATE "pg_catalog"."default",
  "Remark" varchar(100) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of SysMenuFunction
-- ----------------------------
INSERT INTO "public"."SysMenuFunction" VALUES ('33c80938-82c8-4299-0f12-08d9fdad00ab', '2022-03-04 15:17:09', '2022-03-04 15:17:09', 10, 30, 'Display', '显示', 'Display');
INSERT INTO "public"."SysMenuFunction" VALUES ('ef70b789-21ee-4850-0f1b-08d9fdad00ab', '2022-03-04 15:16:44', '2022-03-04 15:16:44', 10, 22, 'Display', '显示', 'Display');
INSERT INTO "public"."SysMenuFunction" VALUES ('dab12c2f-1f4d-4347-0f1c-08d9fdad00ab', '2022-03-04 15:17:24', '2022-03-04 15:17:24', 10, 31, 'Display', '显示', 'Display');
INSERT INTO "public"."SysMenuFunction" VALUES ('a7cd04db-bbe3-49b6-0f1e-08d9fdad00ab', '2022-03-04 15:24:16', '2022-03-04 15:24:16', 10, 2, 'Display', '显示', 'Display');
INSERT INTO "public"."SysMenuFunction" VALUES ('6c09c0c0-72fa-4842-0f1f-08d9fdad00ab', '2022-03-04 15:24:21', '2022-03-04 15:24:21', 10, 32, 'Display', '显示', 'Display');
INSERT INTO "public"."SysMenuFunction" VALUES ('f64cfe50-1ef1-457f-0f20-08d9fdad00ab', '2022-03-04 15:24:24', '2022-03-04 15:24:24', 10, 3, 'Display', '显示', 'Display');
INSERT INTO "public"."SysMenuFunction" VALUES ('a1ddd02f-8c21-4d79-0f21-08d9fdad00ab', '2022-03-04 15:24:30', '2022-03-04 15:24:30', 10, 5, 'Display', '显示', 'Display');
INSERT INTO "public"."SysMenuFunction" VALUES ('1cb6fbe1-4a6c-4aad-0f22-08d9fdad00ab', '2022-03-04 15:24:34', '2022-03-04 15:24:34', 10, 6, 'Display', '显示', 'Display');
INSERT INTO "public"."SysMenuFunction" VALUES ('d2e6ea60-2cf6-478a-0f23-08d9fdad00ab', '2022-03-04 15:24:40', '2022-03-04 15:24:40', 10, 8, 'Display', '显示', 'Display');
INSERT INTO "public"."SysMenuFunction" VALUES ('b7533a90-dae4-4263-0f24-08d9fdad00ab', '2022-03-04 15:24:43', '2022-03-04 15:24:43', 10, 9, 'Display', '显示', 'Display');
INSERT INTO "public"."SysMenuFunction" VALUES ('ec535908-8671-4928-0f25-08d9fdad00ab', '2022-03-04 15:24:47', '2022-03-04 15:24:47', 10, 10, 'Display', '显示', 'Display');
INSERT INTO "public"."SysMenuFunction" VALUES ('3bc0e68f-d03d-4e99-0f26-08d9fdad00ab', '2022-03-04 15:24:53', '2022-03-04 15:24:53', 10, 11, 'Display', '显示', 'Display');
INSERT INTO "public"."SysMenuFunction" VALUES ('eb958545-6449-40db-0f27-08d9fdad00ab', '2022-03-04 15:25:07', '2022-03-04 15:25:07', 10, 13, 'Display', '显示', 'Display');
INSERT INTO "public"."SysMenuFunction" VALUES ('b5881044-afb8-40b2-0f28-08d9fdad00ab', '2022-03-04 15:25:07', '2022-03-04 15:25:07', 20, 13, 'Insert', '添加', 'Insert');
INSERT INTO "public"."SysMenuFunction" VALUES ('106fb69a-8bb5-4559-0f29-08d9fdad00ab', '2022-03-04 15:25:07', '2022-03-04 15:25:07', 30, 13, 'Update', '修改', 'Update');
INSERT INTO "public"."SysMenuFunction" VALUES ('f4621fbe-6b40-4454-0f2a-08d9fdad00ab', '2022-03-04 15:25:07', '2022-03-04 15:25:07', 40, 13, 'Delete', '删除', 'Delete');
INSERT INTO "public"."SysMenuFunction" VALUES ('523b53b5-8159-4a16-0f2b-08d9fdad00ab', '2022-03-04 15:25:07', '2022-03-04 15:25:07', 50, 13, 'Save', '保存', 'Save');
INSERT INTO "public"."SysMenuFunction" VALUES ('a3754771-f6e9-4a23-0f2c-08d9fdad00ab', '2022-03-04 15:25:07', '2022-03-04 15:25:07', 60, 13, 'Search', '检索', 'Search');
INSERT INTO "public"."SysMenuFunction" VALUES ('b96f977c-a36e-4e7f-0f2d-08d9fdad00ab', '2022-03-04 15:25:07', '2022-03-04 15:25:07', 70, 13, 'Export', '导出', 'Export');
INSERT INTO "public"."SysMenuFunction" VALUES ('541d9045-47b2-4629-0f2e-08d9fdad00ab', '2022-03-04 15:25:07', '2022-03-04 15:25:07', 80, 13, 'Print', '打印', 'Print');
INSERT INTO "public"."SysMenuFunction" VALUES ('13f3f74d-c6fc-4488-0f2f-08d9fdad00ab', '2022-03-04 15:25:14', '2022-03-04 15:25:14', 10, 15, 'Display', '显示', 'Display');
INSERT INTO "public"."SysMenuFunction" VALUES ('cce82eb4-7fc5-4308-0f30-08d9fdad00ab', '2022-03-04 15:25:14', '2022-03-04 15:25:14', 20, 15, 'Insert', '添加', 'Insert');
INSERT INTO "public"."SysMenuFunction" VALUES ('8564e4d8-d7f4-4f12-0f31-08d9fdad00ab', '2022-03-04 15:25:14', '2022-03-04 15:25:14', 30, 15, 'Update', '修改', 'Update');
INSERT INTO "public"."SysMenuFunction" VALUES ('0ad6a459-1d9d-4512-0f32-08d9fdad00ab', '2022-03-04 15:25:14', '2022-03-04 15:25:14', 40, 15, 'Delete', '删除', 'Delete');
INSERT INTO "public"."SysMenuFunction" VALUES ('37d3e492-62da-47a4-0f33-08d9fdad00ab', '2022-03-04 15:25:14', '2022-03-04 15:25:14', 50, 15, 'Save', '保存', 'Save');
INSERT INTO "public"."SysMenuFunction" VALUES ('beb87004-5cfb-417a-0f34-08d9fdad00ab', '2022-03-04 15:25:14', '2022-03-04 15:25:14', 60, 15, 'Search', '检索', 'Search');
INSERT INTO "public"."SysMenuFunction" VALUES ('a46e07d3-c722-4548-0f35-08d9fdad00ab', '2022-03-04 15:25:14', '2022-03-04 15:25:14', 70, 15, 'Export', '导出', 'Export');
INSERT INTO "public"."SysMenuFunction" VALUES ('c8edbb79-567e-461b-0f36-08d9fdad00ab', '2022-03-04 15:25:14', '2022-03-04 15:25:14', 80, 15, 'Print', '打印', 'Print');
INSERT INTO "public"."SysMenuFunction" VALUES ('550f874b-e804-44a0-0f37-08d9fdad00ab', '2022-03-04 15:25:18', '2022-03-04 15:25:18', 10, 16, 'Display', '显示', 'Display');
INSERT INTO "public"."SysMenuFunction" VALUES ('c67a0abe-daec-491b-0f38-08d9fdad00ab', '2022-03-04 15:25:18', '2022-03-04 15:25:18', 20, 16, 'Insert', '添加', 'Insert');
INSERT INTO "public"."SysMenuFunction" VALUES ('823ac05d-65e4-4216-0f39-08d9fdad00ab', '2022-03-04 15:25:18', '2022-03-04 15:25:18', 30, 16, 'Update', '修改', 'Update');
INSERT INTO "public"."SysMenuFunction" VALUES ('bd6ae6da-1ca6-46c2-0f3a-08d9fdad00ab', '2022-03-04 15:25:18', '2022-03-04 15:25:18', 40, 16, 'Delete', '删除', 'Delete');
INSERT INTO "public"."SysMenuFunction" VALUES ('14783a71-e265-4d6b-0f3b-08d9fdad00ab', '2022-03-04 15:25:18', '2022-03-04 15:25:18', 50, 16, 'Save', '保存', 'Save');
INSERT INTO "public"."SysMenuFunction" VALUES ('2fea8f87-2a13-4c95-0f3c-08d9fdad00ab', '2022-03-04 15:25:18', '2022-03-04 15:25:18', 60, 16, 'Search', '检索', 'Search');
INSERT INTO "public"."SysMenuFunction" VALUES ('437fbf85-8704-4e87-0f3d-08d9fdad00ab', '2022-03-04 15:25:18', '2022-03-04 15:25:18', 70, 16, 'Export', '导出', 'Export');
INSERT INTO "public"."SysMenuFunction" VALUES ('6b009415-eadf-4dab-0f3e-08d9fdad00ab', '2022-03-04 15:25:18', '2022-03-04 15:25:18', 80, 16, 'Print', '打印', 'Print');
INSERT INTO "public"."SysMenuFunction" VALUES ('53fdb4a0-ca6e-4568-0f3f-08d9fdad00ab', '2022-03-04 15:25:21', '2022-03-04 15:25:21', 10, 17, 'Display', '显示', 'Display');
INSERT INTO "public"."SysMenuFunction" VALUES ('86465238-c51c-45d5-0f40-08d9fdad00ab', '2022-03-04 15:25:21', '2022-03-04 15:25:21', 20, 17, 'Insert', '添加', 'Insert');
INSERT INTO "public"."SysMenuFunction" VALUES ('86ff83fd-d34a-4290-0f41-08d9fdad00ab', '2022-03-04 15:25:21', '2022-03-04 15:25:21', 30, 17, 'Update', '修改', 'Update');
INSERT INTO "public"."SysMenuFunction" VALUES ('7ea8f706-bfe5-42b2-0f42-08d9fdad00ab', '2022-03-04 15:25:21', '2022-03-04 15:25:21', 40, 17, 'Delete', '删除', 'Delete');
INSERT INTO "public"."SysMenuFunction" VALUES ('dee401b1-e20e-496e-0f43-08d9fdad00ab', '2022-03-04 15:25:21', '2022-03-04 15:25:21', 50, 17, 'Save', '保存', 'Save');
INSERT INTO "public"."SysMenuFunction" VALUES ('0b27e69f-af16-4481-0f44-08d9fdad00ab', '2022-03-04 15:25:21', '2022-03-04 15:25:21', 60, 17, 'Search', '检索', 'Search');
INSERT INTO "public"."SysMenuFunction" VALUES ('a726455f-1c29-4be0-0f45-08d9fdad00ab', '2022-03-04 15:25:21', '2022-03-04 15:25:21', 70, 17, 'Export', '导出', 'Export');
INSERT INTO "public"."SysMenuFunction" VALUES ('0caa6e7d-92b0-4814-0f46-08d9fdad00ab', '2022-03-04 15:25:21', '2022-03-04 15:25:21', 80, 17, 'Print', '打印', 'Print');
INSERT INTO "public"."SysMenuFunction" VALUES ('db3ab8bd-7709-41a2-0f47-08d9fdad00ab', '2022-03-04 15:25:28', '2022-03-04 15:25:28', 10, 25, 'Display', '显示', 'Display');
INSERT INTO "public"."SysMenuFunction" VALUES ('fe6465bf-e429-45bd-0f48-08d9fdad00ab', '2022-03-04 15:25:28', '2022-03-04 15:25:28', 20, 25, 'Insert', '添加', 'Insert');
INSERT INTO "public"."SysMenuFunction" VALUES ('4a67fcdb-a7a9-4e3c-0f49-08d9fdad00ab', '2022-03-04 15:25:28', '2022-03-04 15:25:28', 30, 25, 'Update', '修改', 'Update');
INSERT INTO "public"."SysMenuFunction" VALUES ('20ab5395-d57c-49db-0f4a-08d9fdad00ab', '2022-03-04 15:25:28', '2022-03-04 15:25:28', 40, 25, 'Delete', '删除', 'Delete');
INSERT INTO "public"."SysMenuFunction" VALUES ('41cb1942-573a-4d63-0f4b-08d9fdad00ab', '2022-03-04 15:25:28', '2022-03-04 15:25:28', 50, 25, 'Save', '保存', 'Save');
INSERT INTO "public"."SysMenuFunction" VALUES ('7e0f6c84-d7f1-4243-0f4c-08d9fdad00ab', '2022-03-04 15:25:28', '2022-03-04 15:25:28', 60, 25, 'Search', '检索', 'Search');
INSERT INTO "public"."SysMenuFunction" VALUES ('1e69df5d-d1e9-4bc8-0f4d-08d9fdad00ab', '2022-03-04 15:25:28', '2022-03-04 15:25:28', 70, 25, 'Export', '导出', 'Export');
INSERT INTO "public"."SysMenuFunction" VALUES ('4bbbe120-0cc6-4a08-0f4e-08d9fdad00ab', '2022-03-04 15:25:28', '2022-03-04 15:25:28', 80, 25, 'Print', '打印', 'Print');
INSERT INTO "public"."SysMenuFunction" VALUES ('45e2ca86-4823-4fb9-0f57-08d9fdad00ab', '2022-03-04 15:25:36', '2022-03-04 15:25:36', 10, 20, 'Display', '显示', 'Display');
INSERT INTO "public"."SysMenuFunction" VALUES ('3e44c6f5-e090-40a1-0f58-08d9fdad00ab', '2022-03-04 15:25:36', '2022-03-04 15:25:36', 20, 20, 'Insert', '添加', 'Insert');
INSERT INTO "public"."SysMenuFunction" VALUES ('22a675f6-efda-481d-0f59-08d9fdad00ab', '2022-03-04 15:25:36', '2022-03-04 15:25:36', 30, 20, 'Update', '修改', 'Update');
INSERT INTO "public"."SysMenuFunction" VALUES ('69da651e-787b-42e5-0f5a-08d9fdad00ab', '2022-03-04 15:25:36', '2022-03-04 15:25:36', 40, 20, 'Delete', '删除', 'Delete');
INSERT INTO "public"."SysMenuFunction" VALUES ('616c4e4a-fb61-49cf-0f5b-08d9fdad00ab', '2022-03-04 15:25:36', '2022-03-04 15:25:36', 50, 20, 'Save', '保存', 'Save');
INSERT INTO "public"."SysMenuFunction" VALUES ('5e4e87bd-c179-4b5b-0f5c-08d9fdad00ab', '2022-03-04 15:25:36', '2022-03-04 15:25:36', 60, 20, 'Search', '检索', 'Search');
INSERT INTO "public"."SysMenuFunction" VALUES ('54743c86-ac73-4345-0f5d-08d9fdad00ab', '2022-03-04 15:25:36', '2022-03-04 15:25:36', 70, 20, 'Export', '导出', 'Export');
INSERT INTO "public"."SysMenuFunction" VALUES ('2469188c-21de-492a-0f5e-08d9fdad00ab', '2022-03-04 15:25:36', '2022-03-04 15:25:36', 80, 20, 'Print', '打印', 'Print');
INSERT INTO "public"."SysMenuFunction" VALUES ('c6ba141b-99ba-4114-0f5f-08d9fdad00ab', '2022-03-04 15:25:40', '2022-03-04 15:25:40', 10, 21, 'Display', '显示', 'Display');
INSERT INTO "public"."SysMenuFunction" VALUES ('0a85e4fd-5a1c-47f6-0f60-08d9fdad00ab', '2022-03-04 15:25:40', '2022-03-04 15:25:40', 20, 21, 'Insert', '添加', 'Insert');
INSERT INTO "public"."SysMenuFunction" VALUES ('f4c73ac0-c66d-4988-0f61-08d9fdad00ab', '2022-03-04 15:25:40', '2022-03-04 15:25:40', 30, 21, 'Update', '修改', 'Update');
INSERT INTO "public"."SysMenuFunction" VALUES ('3cb3cbc7-9e45-4cc3-0f62-08d9fdad00ab', '2022-03-04 15:25:40', '2022-03-04 15:25:40', 40, 21, 'Delete', '删除', 'Delete');
INSERT INTO "public"."SysMenuFunction" VALUES ('6b209d5a-b366-4a61-0f63-08d9fdad00ab', '2022-03-04 15:25:40', '2022-03-04 15:25:40', 50, 21, 'Save', '保存', 'Save');
INSERT INTO "public"."SysMenuFunction" VALUES ('f36b9b06-2826-425f-0f64-08d9fdad00ab', '2022-03-04 15:25:40', '2022-03-04 15:25:40', 60, 21, 'Search', '检索', 'Search');
INSERT INTO "public"."SysMenuFunction" VALUES ('a9503588-e6f7-420b-0f65-08d9fdad00ab', '2022-03-04 15:25:40', '2022-03-04 15:25:40', 70, 21, 'Export', '导出', 'Export');
INSERT INTO "public"."SysMenuFunction" VALUES ('c9e5fff0-6744-47d7-0f66-08d9fdad00ab', '2022-03-04 15:25:40', '2022-03-04 15:25:40', 80, 21, 'Print', '打印', 'Print');
INSERT INTO "public"."SysMenuFunction" VALUES ('9426768e-b90d-41e1-0f67-08d9fdad00ab', '2022-03-04 15:25:50', '2022-03-04 15:25:50', 10, 23, 'Display', '显示', 'Display');
INSERT INTO "public"."SysMenuFunction" VALUES ('e991934a-0d30-416b-0f68-08d9fdad00ab', '2022-03-04 15:25:50', '2022-03-04 15:25:50', 20, 23, 'Insert', '添加', 'Insert');
INSERT INTO "public"."SysMenuFunction" VALUES ('b98a365e-6fb4-4efb-0f69-08d9fdad00ab', '2022-03-04 15:25:50', '2022-03-04 15:25:50', 30, 23, 'Update', '修改', 'Update');
INSERT INTO "public"."SysMenuFunction" VALUES ('92b39a10-3927-4ee7-0f6a-08d9fdad00ab', '2022-03-04 15:25:50', '2022-03-04 15:25:50', 40, 23, 'Delete', '删除', 'Delete');
INSERT INTO "public"."SysMenuFunction" VALUES ('a03d56d7-4b0d-47cc-0f6b-08d9fdad00ab', '2022-03-04 15:25:50', '2022-03-04 15:25:50', 50, 23, 'Save', '保存', 'Save');
INSERT INTO "public"."SysMenuFunction" VALUES ('e2319118-42cc-41a2-0f6c-08d9fdad00ab', '2022-03-04 15:25:50', '2022-03-04 15:25:50', 60, 23, 'Search', '检索', 'Search');
INSERT INTO "public"."SysMenuFunction" VALUES ('0984a2e1-3722-41d4-0f6d-08d9fdad00ab', '2022-03-04 15:25:50', '2022-03-04 15:25:50', 70, 23, 'Export', '导出', 'Export');
INSERT INTO "public"."SysMenuFunction" VALUES ('1d831d57-6634-45d7-0f6e-08d9fdad00ab', '2022-03-04 15:25:50', '2022-03-04 15:25:50', 80, 23, 'Print', '打印', 'Print');
INSERT INTO "public"."SysMenuFunction" VALUES ('c77c812a-1601-4311-0f70-08d9fdad00ab', '2022-03-04 15:26:00', '2022-03-04 15:26:00', 10, 19, 'Display', '显示', 'Display');
INSERT INTO "public"."SysMenuFunction" VALUES ('3f6d0af7-5386-4d3a-0f71-08d9fdad00ab', '2022-03-04 15:40:52', '2022-03-04 15:40:52', 10, 28, 'Display', '显示', 'Display');
INSERT INTO "public"."SysMenuFunction" VALUES ('55750f56-edc9-4771-e2d6-08d9fdefa8f8', '2022-03-04 23:00:02', '2022-03-04 23:00:02', 10, 24, 'Display', '显示', 'Display');
INSERT INTO "public"."SysMenuFunction" VALUES ('7694fbf5-e28d-424c-e2d7-08d9fdefa8f8', '2022-03-04 23:00:02', '2022-03-04 23:00:02', 40, 24, 'Delete', '删除', 'Delete');
INSERT INTO "public"."SysMenuFunction" VALUES ('2186550d-246c-4552-e2d8-08d9fdefa8f8', '2022-03-04 23:00:02', '2022-03-04 23:00:02', 60, 24, 'Search', '检索', 'Search');

-- ----------------------------
-- Table structure for SysOperationLog
-- ----------------------------
DROP TABLE IF EXISTS "public"."SysOperationLog";
CREATE TABLE "public"."SysOperationLog" (
  "Id" uuid NOT NULL,
  "Api" varchar(500) COLLATE "pg_catalog"."default",
  "Ip" varchar(255) COLLATE "pg_catalog"."default",
  "Form" text COLLATE "pg_catalog"."default",
  "FormBody" text COLLATE "pg_catalog"."default",
  "QueryString" text COLLATE "pg_catalog"."default",
  "Browser" varchar(255) COLLATE "pg_catalog"."default",
  "OS" varchar(255) COLLATE "pg_catalog"."default",
  "UserId" uuid,
  "TakeUpTime" int8 NOT NULL,
  "LastModificationTime" timestamp(6),
  "CreationTime" timestamp(6)
)
;
COMMENT ON COLUMN "public"."SysOperationLog"."Api" IS '接口地址';
COMMENT ON COLUMN "public"."SysOperationLog"."Ip" IS 'ip地址';
COMMENT ON COLUMN "public"."SysOperationLog"."Form" IS '表单信息';
COMMENT ON COLUMN "public"."SysOperationLog"."FormBody" IS 'json表单信息';
COMMENT ON COLUMN "public"."SysOperationLog"."QueryString" IS '地址栏信息';
COMMENT ON COLUMN "public"."SysOperationLog"."UserId" IS '当前操作人id';
COMMENT ON COLUMN "public"."SysOperationLog"."TakeUpTime" IS '接口耗时（毫秒）';

-- ----------------------------
-- Records of SysOperationLog
-- ----------------------------
INSERT INTO "public"."SysOperationLog" VALUES ('b4a5c339-6fda-4ed4-bef3-a51f8e80455c', '/api/admin/SysUser/info', '0.0.0.1', '', '', '', 'Chrome99', 'Windows10', NULL, 11, '2022-03-18 09:59:03.274476', '2022-03-18 09:59:03.274421');

-- ----------------------------
-- Table structure for SysOrganization
-- ----------------------------
DROP TABLE IF EXISTS "public"."SysOrganization";
CREATE TABLE "public"."SysOrganization" (
  "Id" int4 NOT NULL,
  "Name" varchar(255) COLLATE "pg_catalog"."default",
  "OrderNumber" int4,
  "LevelCode" varchar(50) COLLATE "pg_catalog"."default",
  "Leader" varchar(255) COLLATE "pg_catalog"."default",
  "Phone" varchar(255) COLLATE "pg_catalog"."default",
  "Email" varchar(255) COLLATE "pg_catalog"."default",
  "State" int4,
  "ParentId" int4,
  "LastModificationTime" timestamp(6),
  "CreationTime" timestamp(6)
)
;

-- ----------------------------
-- Records of SysOrganization
-- ----------------------------
INSERT INTO "public"."SysOrganization" VALUES (1, '阿里巴巴集团', 1, '1', 'hzy', '18410912184', '18410912184@qq.com', 1, NULL, '2021-05-27 20:50:31', '2021-05-27 20:50:31');
INSERT INTO "public"."SysOrganization" VALUES (2, '北京分部', 3, '1.2', '北京分部', '132123', '13131', 1, 1, '2021-12-28 16:13:34', '2021-05-27 22:33:44');
INSERT INTO "public"."SysOrganization" VALUES (3, '市场部门', 1, '1.2.3', '市场部门', '234124234', '234234@qq.com', 1, 2, '2021-05-27 22:33:57', '2021-05-27 22:33:57');
INSERT INTO "public"."SysOrganization" VALUES (4, '财务部门', 2, '1.2.4', '财务部门', '435543535', '123@qq.com', 1, 2, '2021-05-27 22:34:11', '2021-05-27 22:34:11');
INSERT INTO "public"."SysOrganization" VALUES (5, '成都分部', 2, '1.5', '成都分部', '123123123', '123@qq.com', 1, 1, '2021-05-27 22:31:45', '2021-05-27 21:01:50');
INSERT INTO "public"."SysOrganization" VALUES (7, '研发部门', 1, '1.5.7', '研发部门', '1234323423', '12312@qq.com', 1, 5, '2021-05-27 22:32:29', '2021-05-27 22:32:08');
INSERT INTO "public"."SysOrganization" VALUES (9, '运维部门', 4, '1.5.9', '运维部门', '1232133452', '12341@qq.com', 1, 5, '2022-03-08 17:07:47', '2021-05-27 22:33:25');
INSERT INTO "public"."SysOrganization" VALUES (10, '测试部门', 3, '1.5.10', '测试部门', '12313', '123123@qq.com', 1, 5, '2021-05-27 22:32:59', '2021-05-27 22:32:59');
INSERT INTO "public"."SysOrganization" VALUES (11, '技术部门', 2, '1.5.11', '技术部门', '12345678911', '12345678901@qq.com', 1, 5, '2022-03-08 17:07:37', '2022-03-08 17:00:20');

-- ----------------------------
-- Table structure for SysPost
-- ----------------------------
DROP TABLE IF EXISTS "public"."SysPost";
CREATE TABLE "public"."SysPost" (
  "Id" uuid NOT NULL,
  "Number" int4,
  "Code" varchar(255) COLLATE "pg_catalog"."default",
  "Name" varchar(255) COLLATE "pg_catalog"."default",
  "State" int4,
  "Remarks" varchar(255) COLLATE "pg_catalog"."default",
  "LastModificationTime" timestamp(6),
  "CreationTime" timestamp(6)
)
;

-- ----------------------------
-- Records of SysPost
-- ----------------------------
INSERT INTO "public"."SysPost" VALUES ('f0bd38c2-f1de-4bd9-e2db-08da00a93622', 5, 'dotnet_engineer', 'DotNet软件工程师', 1, NULL, '2022-03-08 10:13:18', '2022-03-08 10:13:18');
INSERT INTO "public"."SysPost" VALUES ('0716b4b0-9a06-43e9-8ae8-82c74875f83e', 2, 'se', '项目经理', 1, NULL, '2021-05-27 20:26:35', '2021-05-27 20:26:35');
INSERT INTO "public"."SysPost" VALUES ('96927c30-41d0-4ced-8e29-cbed35c90fb0', 1, 'ceo', '董事长', 1, NULL, '2021-05-27 20:26:22', '2021-05-27 20:26:22');
INSERT INTO "public"."SysPost" VALUES ('e46af329-6d08-442c-9837-f22cff954411', 4, 'user', '普通员工', 1, NULL, '2021-05-27 20:26:52', '2021-05-27 20:26:52');
INSERT INTO "public"."SysPost" VALUES ('f0c67537-8094-429a-b474-f54ac518609e', 3, 'hr', '人力资源', 1, NULL, '2021-05-27 20:26:44', '2021-05-27 20:26:44');

-- ----------------------------
-- Table structure for SysRole
-- ----------------------------
DROP TABLE IF EXISTS "public"."SysRole";
CREATE TABLE "public"."SysRole" (
  "Id" uuid NOT NULL,
  "LastModificationTime" timestamp(6),
  "CreationTime" timestamp(6),
  "Number" int4,
  "Name" varchar(255) COLLATE "pg_catalog"."default",
  "Remark" varchar(255) COLLATE "pg_catalog"."default",
  "DeleteLock" bool
)
;

-- ----------------------------
-- Records of SysRole
-- ----------------------------
INSERT INTO "public"."SysRole" VALUES ('18fa4771-6f58-46a3-80d2-6f0f5e9972e3', '2021-01-10 11:25:12', '2016-07-06 17:59:20', 1, '超级管理员', '拥有所有权限', 't');
INSERT INTO "public"."SysRole" VALUES ('40ff1844-c099-4061-98e0-cd6e544fcfd3', '2021-01-30 00:51:17', '2016-07-06 17:59:20', 2, '普通用户', '普通用户', 't');

-- ----------------------------
-- Table structure for SysRoleMenuFunction
-- ----------------------------
DROP TABLE IF EXISTS "public"."SysRoleMenuFunction";
CREATE TABLE "public"."SysRoleMenuFunction" (
  "Id" uuid NOT NULL,
  "RoleId" uuid,
  "MenuId" int4,
  "MenuFunctionId" uuid,
  "LastModificationTime" timestamp(6),
  "CreationTime" timestamp(6)
)
;

-- ----------------------------
-- Records of SysRoleMenuFunction
-- ----------------------------
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('8e81677b-0b69-4aa2-50b7-08da0046a5b6', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 2, 'a7cd04db-bbe3-49b6-0f1e-08d9fdad00ab', '2022-03-07 22:27:45', '2022-03-07 22:27:45');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('c6c7c04b-d22e-4aad-50b8-08da0046a5b6', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 3, 'f64cfe50-1ef1-457f-0f20-08d9fdad00ab', '2022-03-07 22:27:45', '2022-03-07 22:27:45');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('74857e94-3aea-4161-50b9-08da0046a5b6', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 5, 'a1ddd02f-8c21-4d79-0f21-08d9fdad00ab', '2022-03-07 22:27:45', '2022-03-07 22:27:45');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('537ee83d-2022-40f1-50ba-08da0046a5b6', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 6, '1cb6fbe1-4a6c-4aad-0f22-08d9fdad00ab', '2022-03-07 22:27:45', '2022-03-07 22:27:45');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('bcc9dd20-62ff-4a1b-50bb-08da0046a5b6', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 8, 'd2e6ea60-2cf6-478a-0f23-08d9fdad00ab', '2022-03-07 22:27:45', '2022-03-07 22:27:45');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('2dadaf13-6ddc-4458-50bc-08da0046a5b6', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 9, 'b7533a90-dae4-4263-0f24-08d9fdad00ab', '2022-03-07 22:27:45', '2022-03-07 22:27:45');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('b2a39591-7a0c-419d-50bd-08da0046a5b6', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 10, 'ec535908-8671-4928-0f25-08d9fdad00ab', '2022-03-07 22:27:45', '2022-03-07 22:27:45');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('a96009ad-b7e9-4eb6-50be-08da0046a5b6', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 11, '3bc0e68f-d03d-4e99-0f26-08d9fdad00ab', '2022-03-07 22:27:45', '2022-03-07 22:27:45');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('59f64fdf-1dc8-4031-50bf-08da0046a5b6', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 13, 'eb958545-6449-40db-0f27-08d9fdad00ab', '2022-03-07 22:27:45', '2022-03-07 22:27:45');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('f3c080a9-ddab-4bce-50c0-08da0046a5b6', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 13, 'b5881044-afb8-40b2-0f28-08d9fdad00ab', '2022-03-07 22:27:45', '2022-03-07 22:27:45');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('e6d2abff-c1d4-4855-50c1-08da0046a5b6', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 13, '106fb69a-8bb5-4559-0f29-08d9fdad00ab', '2022-03-07 22:27:45', '2022-03-07 22:27:45');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('02b217c2-9aa8-4102-50c2-08da0046a5b6', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 13, 'f4621fbe-6b40-4454-0f2a-08d9fdad00ab', '2022-03-07 22:27:45', '2022-03-07 22:27:45');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('0a2da8ba-74a6-4bdc-50c3-08da0046a5b6', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 13, '523b53b5-8159-4a16-0f2b-08d9fdad00ab', '2022-03-07 22:27:45', '2022-03-07 22:27:45');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('25f59bc4-b4a2-4b0e-50c4-08da0046a5b6', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 13, 'a3754771-f6e9-4a23-0f2c-08d9fdad00ab', '2022-03-07 22:27:45', '2022-03-07 22:27:45');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('c3f0d869-eb3a-4966-50c5-08da0046a5b6', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 13, 'b96f977c-a36e-4e7f-0f2d-08d9fdad00ab', '2022-03-07 22:27:45', '2022-03-07 22:27:45');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('82220bff-16f7-4413-50c6-08da0046a5b6', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 13, '541d9045-47b2-4629-0f2e-08d9fdad00ab', '2022-03-07 22:27:45', '2022-03-07 22:27:45');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('6623169b-0573-4f75-50c7-08da0046a5b6', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 15, '13f3f74d-c6fc-4488-0f2f-08d9fdad00ab', '2022-03-07 22:27:45', '2022-03-07 22:27:45');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('6ac3e66c-48be-4262-50c8-08da0046a5b6', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 19, 'c77c812a-1601-4311-0f70-08d9fdad00ab', '2022-03-07 22:27:45', '2022-03-07 22:27:45');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('5b3530fd-a94f-47ae-50c9-08da0046a5b6', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 28, '3f6d0af7-5386-4d3a-0f71-08d9fdad00ab', '2022-03-07 22:27:45', '2022-03-07 22:27:45');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('24e9a375-893b-4432-50ca-08da0046a5b6', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 32, '6c09c0c0-72fa-4842-0f1f-08d9fdad00ab', '2022-03-07 22:27:45', '2022-03-07 22:27:45');

-- ----------------------------
-- Table structure for SysUser
-- ----------------------------
DROP TABLE IF EXISTS "public"."SysUser";
CREATE TABLE "public"."SysUser" (
  "Id" uuid NOT NULL,
  "LastModificationTime" timestamp(6),
  "CreationTime" timestamp(6),
  "Name" varchar(255) COLLATE "pg_catalog"."default",
  "LoginName" varchar(255) COLLATE "pg_catalog"."default",
  "Password" varchar(255) COLLATE "pg_catalog"."default",
  "Phone" varchar(255) COLLATE "pg_catalog"."default",
  "Email" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "DeleteLock" bool,
  "OrganizationId" int4
)
;

-- ----------------------------
-- Records of SysUser
-- ----------------------------
INSERT INTO "public"."SysUser" VALUES ('5722af0f-2366-4fc9-62d5-08da00e3d8a0', '2022-03-08 17:13:02', '2022-03-08 17:13:02', '杜甫', '杜甫', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 'f', 7);
INSERT INTO "public"."SysUser" VALUES ('4fd6a740-0cf1-4975-62d6-08da00e3d8a0', '2022-03-08 17:14:13', '2022-03-08 17:14:13', '李商隐', '李商隐', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 'f', 7);
INSERT INTO "public"."SysUser" VALUES ('e225e163-31c9-4da9-62d7-08da00e3d8a0', '2022-03-08 17:15:07', '2022-03-08 17:15:07', '苏轼', '苏轼', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 'f', 7);
INSERT INTO "public"."SysUser" VALUES ('3739f349-7995-4c63-62d8-08da00e3d8a0', '2022-03-08 17:17:58', '2022-03-08 17:17:58', '白居易', '白居易', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 'f', 7);
INSERT INTO "public"."SysUser" VALUES ('a3f9784c-5f00-4ec9-62d9-08da00e3d8a0', '2022-03-08 17:19:22', '2022-03-08 17:19:22', '陶渊明 ', '陶渊明 ', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 'f', 7);
INSERT INTO "public"."SysUser" VALUES ('a1b6dafb-2b6a-4ff9-62da-08da00e3d8a0', '2022-03-08 17:19:55', '2022-03-08 17:19:55', '屈原', '屈原', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 'f', 7);
INSERT INTO "public"."SysUser" VALUES ('cc186fe2-ee27-4292-62db-08da00e3d8a0', '2022-03-08 17:20:20', '2022-03-08 17:20:20', '孟浩然', '孟浩然', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 'f', 7);
INSERT INTO "public"."SysUser" VALUES ('1550d6d4-0529-4fdd-62dc-08da00e3d8a0', '2022-03-08 17:30:56', '2022-03-08 17:21:56', '鲁迅', '鲁迅', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 'f', 7);
INSERT INTO "public"."SysUser" VALUES ('0198459e-2034-4533-b843-5d227ad20740', '2022-03-08 17:27:36', '2017-04-06 19:55:53', '超级管理员', 'admin', 'E10ADC3949BA59ABBE56E057F20F883E', '10000000000', '1396510655@qq.com', 't', 7);
INSERT INTO "public"."SysUser" VALUES ('ac18f496-e93d-42f0-b59e-e321acc85335', '2022-03-08 10:12:14', '2017-04-06 19:55:53', '李白', 'libai', 'E10ADC3949BA59ABBE56E057F20F883E', '12345678900', '12345678900@live.com', 't', 7);

-- ----------------------------
-- Table structure for SysUserPost
-- ----------------------------
DROP TABLE IF EXISTS "public"."SysUserPost";
CREATE TABLE "public"."SysUserPost" (
  "Id" uuid NOT NULL,
  "UserId" uuid,
  "PostId" uuid,
  "LastModificationTime" timestamp(6),
  "CreationTime" timestamp(6)
)
;

-- ----------------------------
-- Records of SysUserPost
-- ----------------------------
INSERT INTO "public"."SysUserPost" VALUES ('978fc672-d829-4dad-abc7-071810c5ad18', 'e225e163-31c9-4da9-62d7-08da00e3d8a0', 'e46af329-6d08-442c-9837-f22cff954411', '2022-03-08 17:15:08', '2022-03-08 17:15:08');
INSERT INTO "public"."SysUserPost" VALUES ('8100145c-9cd0-49bf-9a62-25c9e508bc1c', 'a1b6dafb-2b6a-4ff9-62da-08da00e3d8a0', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', '2022-03-08 17:19:55', '2022-03-08 17:19:55');
INSERT INTO "public"."SysUserPost" VALUES ('575bf085-47bb-42f2-8b68-620cf460b164', '0198459e-2034-4533-b843-5d227ad20740', '96927c30-41d0-4ced-8e29-cbed35c90fb0', '2022-03-08 17:29:22', '2022-03-08 17:29:22');
INSERT INTO "public"."SysUserPost" VALUES ('af1bec7e-3309-4629-9606-72eefa1826b3', 'cc186fe2-ee27-4292-62db-08da00e3d8a0', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', '2022-03-08 17:20:20', '2022-03-08 17:20:20');
INSERT INTO "public"."SysUserPost" VALUES ('ad627af5-0fe8-4b33-b4ac-73c22c2ea1bc', '1550d6d4-0529-4fdd-62dc-08da00e3d8a0', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', '2022-03-08 17:30:56', '2022-03-08 17:30:56');
INSERT INTO "public"."SysUserPost" VALUES ('d4e0ae0b-3573-4901-8fd7-9bb2c88ebe94', '3739f349-7995-4c63-62d8-08da00e3d8a0', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', '2022-03-08 17:17:58', '2022-03-08 17:17:58');
INSERT INTO "public"."SysUserPost" VALUES ('b97331a7-e281-4027-aade-9f068558826a', '5722af0f-2366-4fc9-62d5-08da00e3d8a0', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', '2022-03-08 17:13:02', '2022-03-08 17:13:02');
INSERT INTO "public"."SysUserPost" VALUES ('0c1a55ba-6bd3-4810-a494-a6b9b7374d4d', 'ac18f496-e93d-42f0-b59e-e321acc85335', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', '2022-03-08 10:13:35', '2022-03-08 10:13:35');
INSERT INTO "public"."SysUserPost" VALUES ('e64ef93c-2ce5-4b1d-a5d0-a9de937c5a3f', 'e225e163-31c9-4da9-62d7-08da00e3d8a0', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', '2022-03-08 17:15:07', '2022-03-08 17:15:07');
INSERT INTO "public"."SysUserPost" VALUES ('6f671077-c98d-4106-9736-bf2edb6db58d', '4fd6a740-0cf1-4975-62d6-08da00e3d8a0', 'e46af329-6d08-442c-9837-f22cff954411', '2022-03-08 17:14:13', '2022-03-08 17:14:13');
INSERT INTO "public"."SysUserPost" VALUES ('6c34f115-28dd-441a-81d5-f6598c97d44a', 'a3f9784c-5f00-4ec9-62d9-08da00e3d8a0', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', '2022-03-08 17:19:22', '2022-03-08 17:19:22');
INSERT INTO "public"."SysUserPost" VALUES ('b797ff16-d6f7-45db-83ec-f910b2612926', '4fd6a740-0cf1-4975-62d6-08da00e3d8a0', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', '2022-03-08 17:14:13', '2022-03-08 17:14:13');

-- ----------------------------
-- Table structure for SysUserRole
-- ----------------------------
DROP TABLE IF EXISTS "public"."SysUserRole";
CREATE TABLE "public"."SysUserRole" (
  "Id" uuid NOT NULL,
  "UserId" uuid,
  "RoleId" uuid,
  "LastModificationTime" timestamp(6),
  "CreationTime" timestamp(6)
)
;

-- ----------------------------
-- Records of SysUserRole
-- ----------------------------
INSERT INTO "public"."SysUserRole" VALUES ('ad5014f2-92e8-4109-9ca4-013a92390f8b', 'cc186fe2-ee27-4292-62db-08da00e3d8a0', '40ff1844-c099-4061-98e0-cd6e544fcfd3', '2022-03-08 17:20:20', '2022-03-08 17:20:20');
INSERT INTO "public"."SysUserRole" VALUES ('ce9f61ac-79d8-426f-9066-36962c017bf6', '5722af0f-2366-4fc9-62d5-08da00e3d8a0', '40ff1844-c099-4061-98e0-cd6e544fcfd3', '2022-03-08 17:13:02', '2022-03-08 17:13:02');
INSERT INTO "public"."SysUserRole" VALUES ('b79a27f7-fc78-421c-9872-3f54bbd303a1', '1550d6d4-0529-4fdd-62dc-08da00e3d8a0', '40ff1844-c099-4061-98e0-cd6e544fcfd3', '2022-03-08 17:30:56', '2022-03-08 17:30:56');
INSERT INTO "public"."SysUserRole" VALUES ('a646def7-0581-4ce9-947e-400360c339f9', 'a1b6dafb-2b6a-4ff9-62da-08da00e3d8a0', '40ff1844-c099-4061-98e0-cd6e544fcfd3', '2022-03-08 17:19:55', '2022-03-08 17:19:55');
INSERT INTO "public"."SysUserRole" VALUES ('dbc656a6-4264-417d-97d8-577e1218feca', 'a3f9784c-5f00-4ec9-62d9-08da00e3d8a0', '40ff1844-c099-4061-98e0-cd6e544fcfd3', '2022-03-08 17:19:22', '2022-03-08 17:19:22');
INSERT INTO "public"."SysUserRole" VALUES ('1fe23f57-97c5-4670-9064-88d7d972cd28', 'e225e163-31c9-4da9-62d7-08da00e3d8a0', '40ff1844-c099-4061-98e0-cd6e544fcfd3', '2022-03-08 17:15:07', '2022-03-08 17:15:07');
INSERT INTO "public"."SysUserRole" VALUES ('a9f8a23b-8c2f-43cc-97af-8ed6f4c4d097', '4fd6a740-0cf1-4975-62d6-08da00e3d8a0', '40ff1844-c099-4061-98e0-cd6e544fcfd3', '2022-03-08 17:14:13', '2022-03-08 17:14:13');
INSERT INTO "public"."SysUserRole" VALUES ('45b7d5af-4d2c-465e-a4b6-99e52af9aee5', '3739f349-7995-4c63-62d8-08da00e3d8a0', '40ff1844-c099-4061-98e0-cd6e544fcfd3', '2022-03-08 17:17:58', '2022-03-08 17:17:58');
INSERT INTO "public"."SysUserRole" VALUES ('1c9f81df-c8a0-45bb-a272-c84bd3af0c19', '0198459e-2034-4533-b843-5d227ad20740', '18fa4771-6f58-46a3-80d2-6f0f5e9972e3', '2022-03-08 17:29:22', '2022-03-08 17:29:22');
INSERT INTO "public"."SysUserRole" VALUES ('fa1fdf14-3847-4194-894c-cd935a3dd9e6', 'ac18f496-e93d-42f0-b59e-e321acc85335', '40ff1844-c099-4061-98e0-cd6e544fcfd3', '2022-03-08 10:13:35', '2022-03-08 10:13:35');
