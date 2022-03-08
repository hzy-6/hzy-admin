/*
 Navicat Premium Data Transfer

 Source Server         : 本地_PostgreSql
 Source Server Type    : PostgreSQL
 Source Server Version : 130003
 Source Host           : localhost:5432
 Source Catalog        : HzyAdminSpa
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 130003
 File Encoding         : 65001

 Date: 02/01/2022 12:16:34
*/


-- ----------------------------
-- Sequence structure for sysdictionary_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sysdictionary_id_seq";
CREATE SEQUENCE "public"."sysdictionary_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 99999999
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for sysmenu_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sysmenu_id_seq";
CREATE SEQUENCE "public"."sysmenu_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 29
CACHE 1;

-- ----------------------------
-- Sequence structure for sysorganization_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sysorganization_id_seq";
CREATE SEQUENCE "public"."sysorganization_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 11
CACHE 1;

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
-- Table structure for SysDictionary
-- ----------------------------
DROP TABLE IF EXISTS "public"."SysDictionary";
CREATE TABLE "public"."SysDictionary" (
  "Id" int4 NOT NULL DEFAULT nextval('sysdictionary_id_seq'::regclass),
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
  "LastModificationTime" timestamp(6),
  "CreationTime" timestamp(6),
  "JumpUrl" varchar(255) COLLATE "pg_catalog"."default",
  "KeepAlive" bool,
  "State" bool
)
;

-- ----------------------------
-- Records of SysMenu
-- ----------------------------
INSERT INTO "public"."SysMenu" VALUES (2, '1.2', 10, 'Antd Vue3.0组件', 'views/AntdVueComponents.vue', '/antd/vue/components', 'AntdVueComponentsCom', 'LayoutOutlined', 1, 't', 't', '2021-12-28 15:08:50', '2021-01-16 16:05:22', NULL, 't', 't');
INSERT INTO "public"."SysMenu" VALUES (3, '1.3', 30, '按钮', 'views/Button.vue', '/button', 'ButtonCom', 'AppstoreOutlined', 1, 't', 't', '2021-12-28 13:42:18', '2020-12-17 14:58:05', NULL, 't', 't');
INSERT INTO "public"."SysMenu" VALUES (4, '1.4', 40, '图表 AntV G2', NULL, NULL, NULL, 'PieChartOutlined', 1, 't', 't', '2021-01-16 16:06:33', '2021-01-16 16:06:33', NULL, 't', 't');
INSERT INTO "public"."SysMenu" VALUES (5, '1.4.5', 10, '基础图表', 'views/chart/Base.vue', '/chart/base', 'ChartBaseCom', NULL, 4, 't', 't', '2021-01-16 16:07:24', '2021-01-16 16:07:24', NULL, 't', 't');
INSERT INTO "public"."SysMenu" VALUES (6, '1.4.6', 20, '更多图表', 'views/chart/More.vue', '/chart/more', 'ChartMoreCom', NULL, 4, 't', 't', '2021-01-16 16:10:06', '2021-01-16 16:10:06', NULL, 't', 't');
INSERT INTO "public"."SysMenu" VALUES (7, '1.7', 50, '表格管理', NULL, NULL, NULL, 'TableOutlined', 1, 't', 't', '2021-01-16 17:32:07', '2018-03-10 12:16:38', NULL, 't', 't');
INSERT INTO "public"."SysMenu" VALUES (8, '1.7.8', 100, '基础列表', 'views/BaseList.vue', '/base/list', 'BaseListCom', NULL, 7, 't', 't', '2020-12-17 14:49:10', '2020-12-17 14:49:12', NULL, 't', 't');
INSERT INTO "public"."SysMenu" VALUES (9, '1.7.9', 110, '标准表格', 'views/list/Index.vue', '/list', 'ListIndexCom', NULL, 7, 't', 't', '2020-12-17 14:51:05', '2020-12-17 14:51:07', NULL, 't', 't');
INSERT INTO "public"."SysMenu" VALUES (10, '1.10', 60, '富文本编辑器', 'views/Editor.vue', '/editor', 'EditorCom', 'PicRightOutlined', 1, 't', 't', '2021-01-18 19:34:54', '2021-01-18 19:34:28', NULL, 't', 't');
INSERT INTO "public"."SysMenu" VALUES (11, '1.11', 70, '跳转外部地址', 'components/ExternalJump.vue', '/external/jump/:path(.*)', 'ExternalJumpCom', 'RadarChartOutlined', 1, 't', 't', '2021-08-05 21:51:12', '2021-08-05 21:51:12', 'https://antv.vision/zh', 't', 't');
INSERT INTO "public"."SysMenu" VALUES (12, '12', 90, '基础信息', NULL, NULL, NULL, 'GoldOutlined', NULL, 't', 't', '2021-01-18 19:33:46', '2018-03-10 12:16:38', NULL, 't', 't');
INSERT INTO "public"."SysMenu" VALUES (13, '12.13', 10, '会员管理', 'views/base/member/Index.vue', '/base/member', 'base_member', 'UsergroupAddOutlined', 12, 't', 't', '2021-05-28 12:58:22', '2018-03-10 12:16:38', NULL, 't', 't');
INSERT INTO "public"."SysMenu" VALUES (14, '14', 100, '系统管理', NULL, NULL, NULL, 'DesktopOutlined', NULL, 't', 't', '2018-03-10 12:16:38', '2018-03-10 12:16:38', NULL, 't', 't');
INSERT INTO "public"."SysMenu" VALUES (15, '14.15', 100, '账户管理', 'views/system/user/Index.vue', '/system/user', 'system_user', 'UserOutlined', 14, 't', 't', '2021-12-29 16:42:32', '2018-03-10 12:16:38', NULL, 't', 't');
INSERT INTO "public"."SysMenu" VALUES (16, '14.16', 110, '角色管理', 'views/system/role/Index.vue', '/system/role', 'system_role', 'TeamOutlined', 14, 't', 't', '2021-05-28 12:45:16', '2018-03-10 12:16:38', NULL, 't', 't');
INSERT INTO "public"."SysMenu" VALUES (17, '14.17', 120, '功能管理', 'views/system/function/Index.vue', '/system/function', 'system_function', 'ControlOutlined', 14, 't', 't', '2021-05-28 12:49:53', '2018-03-10 12:16:38', NULL, 't', 't');
INSERT INTO "public"."SysMenu" VALUES (19, '14.19', 150, '个人中心', 'views/system/personal_center/Index.vue', '/system/personal/center', 'system_personal_center', 'FormOutlined', 14, 't', 't', '2021-06-06 00:28:43', '2018-03-10 12:16:38', NULL, 't', 't');
INSERT INTO "public"."SysMenu" VALUES (20, '14.20', 160, '岗位管理', 'views/system/post/Index.vue', '/system/post', 'system_post', 'IdcardOutlined', 14, 't', 't', '2021-06-06 00:29:11', '2021-05-27 17:29:49', NULL, 't', 't');
INSERT INTO "public"."SysMenu" VALUES (21, '14.21', 170, '组织机构', 'views/system/organization/Index.vue', '/system/organization', 'system_organization', 'ClusterOutlined', 14, 't', 't', '2021-06-06 00:29:19', '2021-05-27 20:27:56', NULL, 't', 't');
INSERT INTO "public"."SysMenu" VALUES (22, '14.22', 180, '接口文档', 'views/system/Swagger.vue', '/system/swagger', 'system_swagger', 'FileSearchOutlined', 14, 't', 't', '2021-06-06 00:29:25', '2018-03-10 12:17:03', NULL, 't', 't');
INSERT INTO "public"."SysMenu" VALUES (23, '14.23', 190, '数据字典', 'views/system/dictionary/Index.vue', '/system/dictionary', 'system_dictionary', 'FileDoneOutlined', 14, 't', 't', '2021-07-25 21:51:53', '2021-07-25 21:50:01', NULL, 't', 't');
INSERT INTO "public"."SysMenu" VALUES (24, '14.24', 200, '操作日志', 'views/system/sys_operation_log/Index.vue', '/system/sys_operation_log', 'sys_operation_log', 'ContainerOutlined', 14, 't', 't', '2021-08-05 21:48:54', '2021-08-05 21:24:54', '', 't', 't');
INSERT INTO "public"."SysMenu" VALUES (25, '14.25', 130, '菜单功能', 'views/system/menu/Index.vue', '/system/menu', 'system_menu', 'MenuOutlined', 14, 't', 't', '2021-05-28 12:51:15', '2018-03-10 12:16:38', NULL, 't', 't');
INSERT INTO "public"."SysMenu" VALUES (28, '1.28', 1, 'Vxe-Table', 'views/VxeTable.vue', '/vxe/table', 'VxeTableCom', 'BorderlessTableOutlined', 1, 't', 't', '2021-12-29 17:13:26', '2021-12-29 17:13:26', NULL, 't', 't');
INSERT INTO "public"."SysMenu" VALUES (1, '1', 10, '更多示例', NULL, NULL, NULL, 'MoreOutlined', NULL, 't', 't', '2021-06-06 00:29:45', '2021-05-28 11:49:02', NULL, 't', 't');

-- ----------------------------
-- Table structure for SysMenuFunction
-- ----------------------------
DROP TABLE IF EXISTS "public"."SysMenuFunction";
CREATE TABLE "public"."SysMenuFunction" (
  "Id" uuid NOT NULL,
  "MenuId" int4,
  "FunctionId" uuid,
  "LastModificationTime" timestamp(6),
  "CreationTime" timestamp(6)
)
;

-- ----------------------------
-- Records of SysMenuFunction
-- ----------------------------
INSERT INTO "public"."SysMenuFunction" VALUES ('9a754201-e1c1-4cd9-a05a-08d9c9ab518e', 21, 'c9518758-b2e1-4f51-b517-5282e273889c', '2021-12-28 10:43:54', '2021-12-28 10:43:54');
INSERT INTO "public"."SysMenuFunction" VALUES ('30974fd8-e30f-47a4-a05b-08d9c9ab518e', 21, 'bffefb1c-8988-4ddf-b4ac-81c2b30e80cd', '2021-12-28 10:43:54', '2021-12-28 10:43:54');
INSERT INTO "public"."SysMenuFunction" VALUES ('84771ba1-3831-49a0-a05c-08d9c9ab518e', 21, 'e7ef2a05-8317-41c3-b588-99519fe88bf9', '2021-12-28 10:43:54', '2021-12-28 10:43:54');
INSERT INTO "public"."SysMenuFunction" VALUES ('247a8853-76b9-468d-a05d-08d9c9ab518e', 21, '9c388461-2704-4c5e-a729-72c17e9018e1', '2021-12-28 10:43:54', '2021-12-28 10:43:54');
INSERT INTO "public"."SysMenuFunction" VALUES ('669c6d95-fa29-451c-a05e-08d9c9ab518e', 21, '383e7ee2-7690-46ac-9230-65155c84aa30', '2021-12-28 10:43:54', '2021-12-28 10:43:54');
INSERT INTO "public"."SysMenuFunction" VALUES ('d5d41d85-6cb3-4b3f-a05f-08d9c9ab518e', 21, 'f27ecb0a-197d-47b1-b243-59a8c71302bf', '2021-12-28 10:43:54', '2021-12-28 10:43:54');
INSERT INTO "public"."SysMenuFunction" VALUES ('370ee9eb-a798-4396-a060-08d9c9ab518e', 21, '2401f4d0-60b0-4e2e-903f-84c603373572', '2021-12-28 10:43:54', '2021-12-28 10:43:54');
INSERT INTO "public"."SysMenuFunction" VALUES ('4dfccbdc-4a18-4d77-a061-08d9c9ab518e', 21, 'b6fd5425-504a-46a9-993b-2f8dc9158eb8', '2021-12-28 10:43:54', '2021-12-28 10:43:54');
INSERT INTO "public"."SysMenuFunction" VALUES ('a6fa1360-f26c-42b2-a062-08d9c9ab518e', 22, 'c9518758-b2e1-4f51-b517-5282e273889c', '2021-12-28 10:44:01', '2021-12-28 10:44:01');
INSERT INTO "public"."SysMenuFunction" VALUES ('8725306c-ee0b-4803-a063-08d9c9ab518e', 22, 'bffefb1c-8988-4ddf-b4ac-81c2b30e80cd', '2021-12-28 10:44:01', '2021-12-28 10:44:01');
INSERT INTO "public"."SysMenuFunction" VALUES ('fb442f05-a084-4b87-a064-08d9c9ab518e', 22, 'e7ef2a05-8317-41c3-b588-99519fe88bf9', '2021-12-28 10:44:01', '2021-12-28 10:44:01');
INSERT INTO "public"."SysMenuFunction" VALUES ('64e3b018-6ccd-46cd-a065-08d9c9ab518e', 22, '9c388461-2704-4c5e-a729-72c17e9018e1', '2021-12-28 10:44:01', '2021-12-28 10:44:01');
INSERT INTO "public"."SysMenuFunction" VALUES ('d7e4c5c4-2f3f-4a63-a066-08d9c9ab518e', 22, '383e7ee2-7690-46ac-9230-65155c84aa30', '2021-12-28 10:44:01', '2021-12-28 10:44:01');
INSERT INTO "public"."SysMenuFunction" VALUES ('675c2a47-7e11-43cf-a067-08d9c9ab518e', 22, 'f27ecb0a-197d-47b1-b243-59a8c71302bf', '2021-12-28 10:44:01', '2021-12-28 10:44:01');
INSERT INTO "public"."SysMenuFunction" VALUES ('11423833-00ce-4f49-a068-08d9c9ab518e', 22, '2401f4d0-60b0-4e2e-903f-84c603373572', '2021-12-28 10:44:01', '2021-12-28 10:44:01');
INSERT INTO "public"."SysMenuFunction" VALUES ('3758e181-272e-4704-a069-08d9c9ab518e', 22, 'b6fd5425-504a-46a9-993b-2f8dc9158eb8', '2021-12-28 10:44:01', '2021-12-28 10:44:01');
INSERT INTO "public"."SysMenuFunction" VALUES ('e0546cc6-d74d-4b3b-a06a-08d9c9ab518e', 23, 'c9518758-b2e1-4f51-b517-5282e273889c', '2021-12-28 10:44:06', '2021-12-28 10:44:06');
INSERT INTO "public"."SysMenuFunction" VALUES ('81162ecd-adf7-4875-a06b-08d9c9ab518e', 23, 'bffefb1c-8988-4ddf-b4ac-81c2b30e80cd', '2021-12-28 10:44:06', '2021-12-28 10:44:06');
INSERT INTO "public"."SysMenuFunction" VALUES ('e00dc41c-1ad9-44d7-a06c-08d9c9ab518e', 23, 'e7ef2a05-8317-41c3-b588-99519fe88bf9', '2021-12-28 10:44:06', '2021-12-28 10:44:06');
INSERT INTO "public"."SysMenuFunction" VALUES ('e5d2d1df-cca5-46e6-a06d-08d9c9ab518e', 23, '9c388461-2704-4c5e-a729-72c17e9018e1', '2021-12-28 10:44:06', '2021-12-28 10:44:06');
INSERT INTO "public"."SysMenuFunction" VALUES ('43746e4b-b67a-4817-a06e-08d9c9ab518e', 23, '383e7ee2-7690-46ac-9230-65155c84aa30', '2021-12-28 10:44:06', '2021-12-28 10:44:06');
INSERT INTO "public"."SysMenuFunction" VALUES ('5f602e04-c523-4a9e-a06f-08d9c9ab518e', 23, 'f27ecb0a-197d-47b1-b243-59a8c71302bf', '2021-12-28 10:44:06', '2021-12-28 10:44:06');
INSERT INTO "public"."SysMenuFunction" VALUES ('06b66adb-264f-440a-a070-08d9c9ab518e', 23, '2401f4d0-60b0-4e2e-903f-84c603373572', '2021-12-28 10:44:06', '2021-12-28 10:44:06');
INSERT INTO "public"."SysMenuFunction" VALUES ('104a88c6-6cef-4f74-a071-08d9c9ab518e', 23, 'b6fd5425-504a-46a9-993b-2f8dc9158eb8', '2021-12-28 10:44:06', '2021-12-28 10:44:06');
INSERT INTO "public"."SysMenuFunction" VALUES ('57080c79-709f-4738-a072-08d9c9ab518e', 13, 'c9518758-b2e1-4f51-b517-5282e273889c', '2021-12-28 10:44:18', '2021-12-28 10:44:18');
INSERT INTO "public"."SysMenuFunction" VALUES ('d0a41214-744c-4e68-a073-08d9c9ab518e', 13, 'bffefb1c-8988-4ddf-b4ac-81c2b30e80cd', '2021-12-28 10:44:18', '2021-12-28 10:44:18');
INSERT INTO "public"."SysMenuFunction" VALUES ('9050b6b6-4f11-4f87-a074-08d9c9ab518e', 13, 'e7ef2a05-8317-41c3-b588-99519fe88bf9', '2021-12-28 10:44:18', '2021-12-28 10:44:18');
INSERT INTO "public"."SysMenuFunction" VALUES ('f1532e35-9f0c-4fab-a075-08d9c9ab518e', 13, '9c388461-2704-4c5e-a729-72c17e9018e1', '2021-12-28 10:44:18', '2021-12-28 10:44:18');
INSERT INTO "public"."SysMenuFunction" VALUES ('551bba4a-76e6-46da-a076-08d9c9ab518e', 13, '383e7ee2-7690-46ac-9230-65155c84aa30', '2021-12-28 10:44:19', '2021-12-28 10:44:19');
INSERT INTO "public"."SysMenuFunction" VALUES ('81f839be-8753-40ec-a077-08d9c9ab518e', 13, 'f27ecb0a-197d-47b1-b243-59a8c71302bf', '2021-12-28 10:44:19', '2021-12-28 10:44:19');
INSERT INTO "public"."SysMenuFunction" VALUES ('75e99c9d-3e34-448a-a078-08d9c9ab518e', 13, '2401f4d0-60b0-4e2e-903f-84c603373572', '2021-12-28 10:44:19', '2021-12-28 10:44:19');
INSERT INTO "public"."SysMenuFunction" VALUES ('35832dbd-afd3-41a6-a079-08d9c9ab518e', 13, 'b6fd5425-504a-46a9-993b-2f8dc9158eb8', '2021-12-28 10:44:19', '2021-12-28 10:44:19');
INSERT INTO "public"."SysMenuFunction" VALUES ('4b91d103-4b34-4ed8-a07a-08d9c9ab518e', 24, 'c9518758-b2e1-4f51-b517-5282e273889c', '2021-12-28 11:26:44', '2021-12-28 11:26:44');
INSERT INTO "public"."SysMenuFunction" VALUES ('9b37a272-7fa8-4f36-e0b1-08d9caa12654', 16, 'c9518758-b2e1-4f51-b517-5282e273889c', '2021-12-29 16:29:55', '2021-12-29 16:29:55');
INSERT INTO "public"."SysMenuFunction" VALUES ('6c768319-7967-4acf-e0b2-08d9caa12654', 16, 'bffefb1c-8988-4ddf-b4ac-81c2b30e80cd', '2021-12-29 16:29:55', '2021-12-29 16:29:55');
INSERT INTO "public"."SysMenuFunction" VALUES ('a8d64615-5cb4-4b22-e0b3-08d9caa12654', 16, 'e7ef2a05-8317-41c3-b588-99519fe88bf9', '2021-12-29 16:29:55', '2021-12-29 16:29:55');
INSERT INTO "public"."SysMenuFunction" VALUES ('2b6d4962-4816-43e8-e0b4-08d9caa12654', 16, '9c388461-2704-4c5e-a729-72c17e9018e1', '2021-12-29 16:29:55', '2021-12-29 16:29:55');
INSERT INTO "public"."SysMenuFunction" VALUES ('44b56ff0-1759-4cdd-e0b5-08d9caa12654', 16, '383e7ee2-7690-46ac-9230-65155c84aa30', '2021-12-29 16:29:55', '2021-12-29 16:29:55');
INSERT INTO "public"."SysMenuFunction" VALUES ('f3ff09d4-f8fe-41a9-e0b6-08d9caa12654', 16, 'f27ecb0a-197d-47b1-b243-59a8c71302bf', '2021-12-29 16:29:55', '2021-12-29 16:29:55');
INSERT INTO "public"."SysMenuFunction" VALUES ('62eb566d-7c40-444a-e0b7-08d9caa12654', 16, '2401f4d0-60b0-4e2e-903f-84c603373572', '2021-12-29 16:29:55', '2021-12-29 16:29:55');
INSERT INTO "public"."SysMenuFunction" VALUES ('1bb81800-11de-49d1-e0b8-08d9caa12654', 16, 'b6fd5425-504a-46a9-993b-2f8dc9158eb8', '2021-12-29 16:29:55', '2021-12-29 16:29:55');
INSERT INTO "public"."SysMenuFunction" VALUES ('0488152f-3f5d-4fa7-e0d9-08d9caa12654', 20, 'c9518758-b2e1-4f51-b517-5282e273889c', '2021-12-29 16:38:08', '2021-12-29 16:38:08');
INSERT INTO "public"."SysMenuFunction" VALUES ('67a933fe-0784-4fe6-e0da-08d9caa12654', 20, 'bffefb1c-8988-4ddf-b4ac-81c2b30e80cd', '2021-12-29 16:38:08', '2021-12-29 16:38:08');
INSERT INTO "public"."SysMenuFunction" VALUES ('3bec973f-332f-4275-e0db-08d9caa12654', 20, 'e7ef2a05-8317-41c3-b588-99519fe88bf9', '2021-12-29 16:38:08', '2021-12-29 16:38:08');
INSERT INTO "public"."SysMenuFunction" VALUES ('b367ef95-b112-49f5-e0dc-08d9caa12654', 20, '9c388461-2704-4c5e-a729-72c17e9018e1', '2021-12-29 16:38:08', '2021-12-29 16:38:08');
INSERT INTO "public"."SysMenuFunction" VALUES ('1376cc74-710a-4a01-e0dd-08d9caa12654', 20, '383e7ee2-7690-46ac-9230-65155c84aa30', '2021-12-29 16:38:08', '2021-12-29 16:38:08');
INSERT INTO "public"."SysMenuFunction" VALUES ('92550e68-c31c-42dd-e0de-08d9caa12654', 20, 'f27ecb0a-197d-47b1-b243-59a8c71302bf', '2021-12-29 16:38:08', '2021-12-29 16:38:08');
INSERT INTO "public"."SysMenuFunction" VALUES ('114ca32c-05d8-45df-e0df-08d9caa12654', 20, '2401f4d0-60b0-4e2e-903f-84c603373572', '2021-12-29 16:38:08', '2021-12-29 16:38:08');
INSERT INTO "public"."SysMenuFunction" VALUES ('7017668c-6b2c-46eb-e0e0-08d9caa12654', 20, 'b6fd5425-504a-46a9-993b-2f8dc9158eb8', '2021-12-29 16:38:08', '2021-12-29 16:38:08');
INSERT INTO "public"."SysMenuFunction" VALUES ('a785942e-ba72-4bb6-e0e1-08d9caa12654', 19, 'c9518758-b2e1-4f51-b517-5282e273889c', '2021-12-29 16:39:16', '2021-12-29 16:39:16');
INSERT INTO "public"."SysMenuFunction" VALUES ('2db4b3c2-8639-44a9-e0e2-08d9caa12654', 19, 'bffefb1c-8988-4ddf-b4ac-81c2b30e80cd', '2021-12-29 16:39:16', '2021-12-29 16:39:16');
INSERT INTO "public"."SysMenuFunction" VALUES ('41a066d8-db3f-41cc-e0e3-08d9caa12654', 19, 'e7ef2a05-8317-41c3-b588-99519fe88bf9', '2021-12-29 16:39:16', '2021-12-29 16:39:16');
INSERT INTO "public"."SysMenuFunction" VALUES ('69a539c0-41bd-44c8-e0e4-08d9caa12654', 19, '9c388461-2704-4c5e-a729-72c17e9018e1', '2021-12-29 16:39:16', '2021-12-29 16:39:16');
INSERT INTO "public"."SysMenuFunction" VALUES ('b5c26c68-c152-44c1-e0e5-08d9caa12654', 19, '383e7ee2-7690-46ac-9230-65155c84aa30', '2021-12-29 16:39:16', '2021-12-29 16:39:16');
INSERT INTO "public"."SysMenuFunction" VALUES ('ef5ca0c6-7e97-4955-e0e6-08d9caa12654', 19, 'f27ecb0a-197d-47b1-b243-59a8c71302bf', '2021-12-29 16:39:16', '2021-12-29 16:39:16');
INSERT INTO "public"."SysMenuFunction" VALUES ('2244f634-edc4-45c2-e0e7-08d9caa12654', 19, '2401f4d0-60b0-4e2e-903f-84c603373572', '2021-12-29 16:39:16', '2021-12-29 16:39:16');
INSERT INTO "public"."SysMenuFunction" VALUES ('0c5cb9b2-4319-4a20-e0e8-08d9caa12654', 19, 'b6fd5425-504a-46a9-993b-2f8dc9158eb8', '2021-12-29 16:39:16', '2021-12-29 16:39:16');
INSERT INTO "public"."SysMenuFunction" VALUES ('239cd589-33a4-4985-e0e9-08d9caa12654', 17, 'c9518758-b2e1-4f51-b517-5282e273889c', '2021-12-29 16:40:12', '2021-12-29 16:40:12');
INSERT INTO "public"."SysMenuFunction" VALUES ('57bee1c8-c2ff-49a7-e0ea-08d9caa12654', 17, 'bffefb1c-8988-4ddf-b4ac-81c2b30e80cd', '2021-12-29 16:40:12', '2021-12-29 16:40:12');
INSERT INTO "public"."SysMenuFunction" VALUES ('12e846a7-51bb-486c-e0eb-08d9caa12654', 17, 'e7ef2a05-8317-41c3-b588-99519fe88bf9', '2021-12-29 16:40:12', '2021-12-29 16:40:12');
INSERT INTO "public"."SysMenuFunction" VALUES ('9363cc80-b00c-424b-e0ec-08d9caa12654', 17, '9c388461-2704-4c5e-a729-72c17e9018e1', '2021-12-29 16:40:12', '2021-12-29 16:40:12');
INSERT INTO "public"."SysMenuFunction" VALUES ('88d7f424-ec8b-48ec-e0ed-08d9caa12654', 17, '383e7ee2-7690-46ac-9230-65155c84aa30', '2021-12-29 16:40:12', '2021-12-29 16:40:12');
INSERT INTO "public"."SysMenuFunction" VALUES ('701338a1-a49e-468c-e0ee-08d9caa12654', 17, 'f27ecb0a-197d-47b1-b243-59a8c71302bf', '2021-12-29 16:40:12', '2021-12-29 16:40:12');
INSERT INTO "public"."SysMenuFunction" VALUES ('a8a5e24f-53d0-4161-e0ef-08d9caa12654', 17, '2401f4d0-60b0-4e2e-903f-84c603373572', '2021-12-29 16:40:12', '2021-12-29 16:40:12');
INSERT INTO "public"."SysMenuFunction" VALUES ('4b827f9a-698d-443a-e0f0-08d9caa12654', 17, 'b6fd5425-504a-46a9-993b-2f8dc9158eb8', '2021-12-29 16:40:12', '2021-12-29 16:40:12');
INSERT INTO "public"."SysMenuFunction" VALUES ('61fde7d3-3d8f-4c28-e0f1-08d9caa12654', 25, 'c9518758-b2e1-4f51-b517-5282e273889c', '2021-12-29 16:42:14', '2021-12-29 16:42:14');
INSERT INTO "public"."SysMenuFunction" VALUES ('5909bb02-079b-46fb-e0f2-08d9caa12654', 25, 'bffefb1c-8988-4ddf-b4ac-81c2b30e80cd', '2021-12-29 16:42:14', '2021-12-29 16:42:14');
INSERT INTO "public"."SysMenuFunction" VALUES ('6be618a2-61c7-4223-e0f3-08d9caa12654', 25, 'e7ef2a05-8317-41c3-b588-99519fe88bf9', '2021-12-29 16:42:14', '2021-12-29 16:42:14');
INSERT INTO "public"."SysMenuFunction" VALUES ('c96e8476-529f-4707-e0f4-08d9caa12654', 25, '9c388461-2704-4c5e-a729-72c17e9018e1', '2021-12-29 16:42:14', '2021-12-29 16:42:14');
INSERT INTO "public"."SysMenuFunction" VALUES ('248a3067-1c4c-4969-e0f5-08d9caa12654', 25, '383e7ee2-7690-46ac-9230-65155c84aa30', '2021-12-29 16:42:14', '2021-12-29 16:42:14');
INSERT INTO "public"."SysMenuFunction" VALUES ('ba1fdad6-c28e-462c-e0f6-08d9caa12654', 25, 'f27ecb0a-197d-47b1-b243-59a8c71302bf', '2021-12-29 16:42:14', '2021-12-29 16:42:14');
INSERT INTO "public"."SysMenuFunction" VALUES ('d68fe19a-36b0-49bb-e0f7-08d9caa12654', 25, '2401f4d0-60b0-4e2e-903f-84c603373572', '2021-12-29 16:42:14', '2021-12-29 16:42:14');
INSERT INTO "public"."SysMenuFunction" VALUES ('639cb3c6-75df-45ed-e0f8-08d9caa12654', 25, 'b6fd5425-504a-46a9-993b-2f8dc9158eb8', '2021-12-29 16:42:14', '2021-12-29 16:42:14');
INSERT INTO "public"."SysMenuFunction" VALUES ('014d7f2c-34b7-42af-e101-08d9caa12654', 15, 'c9518758-b2e1-4f51-b517-5282e273889c', '2021-12-29 16:42:32', '2021-12-29 16:42:32');
INSERT INTO "public"."SysMenuFunction" VALUES ('ca27eb94-9feb-497b-e102-08d9caa12654', 15, 'bffefb1c-8988-4ddf-b4ac-81c2b30e80cd', '2021-12-29 16:42:32', '2021-12-29 16:42:32');
INSERT INTO "public"."SysMenuFunction" VALUES ('b0c0e2c3-fc20-4d1f-e103-08d9caa12654', 15, 'e7ef2a05-8317-41c3-b588-99519fe88bf9', '2021-12-29 16:42:32', '2021-12-29 16:42:32');
INSERT INTO "public"."SysMenuFunction" VALUES ('6a5bcb65-f536-46af-e104-08d9caa12654', 15, '9c388461-2704-4c5e-a729-72c17e9018e1', '2021-12-29 16:42:32', '2021-12-29 16:42:32');
INSERT INTO "public"."SysMenuFunction" VALUES ('f093bb17-6797-4572-e105-08d9caa12654', 15, '383e7ee2-7690-46ac-9230-65155c84aa30', '2021-12-29 16:42:32', '2021-12-29 16:42:32');
INSERT INTO "public"."SysMenuFunction" VALUES ('a3254ef2-641c-48cf-e106-08d9caa12654', 15, 'f27ecb0a-197d-47b1-b243-59a8c71302bf', '2021-12-29 16:42:32', '2021-12-29 16:42:32');
INSERT INTO "public"."SysMenuFunction" VALUES ('b9aa5ab0-03b7-4f30-e107-08d9caa12654', 15, '2401f4d0-60b0-4e2e-903f-84c603373572', '2021-12-29 16:42:32', '2021-12-29 16:42:32');
INSERT INTO "public"."SysMenuFunction" VALUES ('db3b2563-6ef5-4f6f-e108-08d9caa12654', 15, 'b6fd5425-504a-46a9-993b-2f8dc9158eb8', '2021-12-29 16:42:32', '2021-12-29 16:42:32');
INSERT INTO "public"."SysMenuFunction" VALUES ('4ec5b6ff-6837-48c9-97d0-08d9caab7863', 28, 'c9518758-b2e1-4f51-b517-5282e273889c', '2021-12-29 17:13:26', '2021-12-29 17:13:26');

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
  "UserId" char(36) COLLATE "pg_catalog"."default",
  "TakeUpTime" int8 NOT NULL,
  "LastModificationTime" timestamp(0),
  "CreationTime" timestamp(0)
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
INSERT INTO "public"."SysOperationLog" VALUES ('4f072d83-6183-411e-2d59-08d9cb66294a', '/api/admin/SysOperationLog/deleteAllData', '0.0.0.1', '', '', '', 'Chrome96', 'Windows10', '0198459E-2034-4533-B843-5D227AD20740', 26, '2021-12-30 00:00:00', '2021-12-30 00:00:00');
INSERT INTO "public"."SysOperationLog" VALUES ('7395ddc8-e184-4dd7-2d5a-08d9cb66294a', '/api/admin/SysOperationLog/findList/10/1', '0.0.0.1', '', '{"name":null}', '', 'Chrome96', 'Windows10', '0198459E-2034-4533-B843-5D227AD20740', 24, '2021-12-30 00:00:00', '2021-12-30 00:00:00');
INSERT INTO "public"."SysOperationLog" VALUES ('1ebe4e2f-741b-466a-8775-29b973592c22', '/api/admin/SysUser/info', '0.0.0.1', '', '', '', 'Chrome96', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 226, '2021-12-30 16:44:40', '2021-12-30 16:44:40');
INSERT INTO "public"."SysOperationLog" VALUES ('735ca6b8-b2b2-4008-9759-852b6e60fcb6', '/api/admin/SysUser/info', '0.0.0.1', '', '', '', 'Chrome96', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 38, '2021-12-30 16:45:00', '2021-12-30 16:45:00');
INSERT INTO "public"."SysOperationLog" VALUES ('d95f344c-b6b7-4cb8-8264-e518313a1391', '/api/admin/SysUser/info', '0.0.0.1', '', '', '', 'Chrome96', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 1, '2021-12-30 16:45:01', '2021-12-30 16:45:01');
INSERT INTO "public"."SysOperationLog" VALUES ('7f01d2e3-eeea-440f-95fa-8aa7d601331f', '/api/admin/SysUser/info', '0.0.0.1', '', '', '', 'Chrome96', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 0, '2021-12-30 16:45:01', '2021-12-30 16:45:01');
INSERT INTO "public"."SysOperationLog" VALUES ('696b14b5-e86a-4c02-9016-717bf0859070', '/api/admin/SysUser/info', '0.0.0.1', '', '', '', 'Chrome96', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 37, '2021-12-30 16:45:04', '2021-12-30 16:45:04');
INSERT INTO "public"."SysOperationLog" VALUES ('89f74fcb-3b2b-4bfa-b922-58d96c68dcf8', '/api/admin/SysUser/info', '0.0.0.1', '', '', '', 'Chrome96', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 31, '2021-12-30 16:45:35', '2021-12-30 16:45:35');
INSERT INTO "public"."SysOperationLog" VALUES ('bbbc6358-ec25-45ec-9d76-181165685c55', '/api/admin/SysUser/info', '0.0.0.1', '', '', '', 'Chrome96', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 18611, '2021-12-30 16:59:44', '2021-12-30 16:59:44');

-- ----------------------------
-- Table structure for SysOrganization
-- ----------------------------
DROP TABLE IF EXISTS "public"."SysOrganization";
CREATE TABLE "public"."SysOrganization" (
  "Id" int4 NOT NULL DEFAULT nextval('sysorganization_id_seq'::regclass),
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
INSERT INTO "public"."SysOrganization" VALUES (6, '财务部门', 4, '1.5.6', '财务部门', '12323452345', '12312@qq.com', 1, 5, '2021-05-27 22:33:13', '2021-05-27 22:33:13');
INSERT INTO "public"."SysOrganization" VALUES (7, '研发部门', 1, '1.5.7', '研发部门', '1234323423', '12312@qq.com', 1, 5, '2021-05-27 22:32:29', '2021-05-27 22:32:08');
INSERT INTO "public"."SysOrganization" VALUES (8, '市场部门', 2, '1.5.8', '市场部门', '123213', '123@qq.com', 1, 5, '2021-05-27 22:32:46', '2021-05-27 22:32:40');
INSERT INTO "public"."SysOrganization" VALUES (9, '运维部门', 5, '1.5.9', '运维部门', '1232133452', '12341@qq.com', 1, 5, '2021-05-27 22:33:25', '2021-05-27 22:33:25');
INSERT INTO "public"."SysOrganization" VALUES (10, '测试部门', 3, '1.5.10', '测试部门', '12313', '123123@qq.com', 1, 5, '2021-05-27 22:32:59', '2021-05-27 22:32:59');

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
  "Number" int4,
  "Name" varchar(255) COLLATE "pg_catalog"."default",
  "Remark" varchar(255) COLLATE "pg_catalog"."default",
  "IsDelete" int4,
  "LastModificationTime" timestamp(6),
  "CreationTime" timestamp(6)
)
;

-- ----------------------------
-- Records of SysRole
-- ----------------------------
INSERT INTO "public"."SysRole" VALUES ('18fa4771-6f58-46a3-80d2-6f0f5e9972e3', 1, '超级管理员', '拥有所有权限', 0, '2021-01-10 11:25:12', '2016-07-06 17:59:20');
INSERT INTO "public"."SysRole" VALUES ('40ff1844-c099-4061-98e0-cd6e544fcfd3', 2, '普通用户', '普通用户', 1, '2021-01-30 00:51:17', '2016-07-06 17:59:20');

-- ----------------------------
-- Table structure for SysRoleMenuFunction
-- ----------------------------
DROP TABLE IF EXISTS "public"."SysRoleMenuFunction";
CREATE TABLE "public"."SysRoleMenuFunction" (
  "Id" uuid NOT NULL,
  "RoleId" uuid,
  "MenuId" int4,
  "FunctionId" uuid,
  "LastModificationTime" timestamp(6),
  "CreationTime" timestamp(6)
)
;

-- ----------------------------
-- Records of SysRoleMenuFunction
-- ----------------------------
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('d93ab57e-aa37-494f-6872-08d9ca9289b5', '18fa4771-6f58-46a3-80d2-6f0f5e9972e3', 13, 'c9518758-b2e1-4f51-b517-5282e273889c', '2021-12-29 14:40:50', '2021-12-29 14:40:50');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('1f8c9cc0-0af8-405f-6873-08d9ca9289b5', '18fa4771-6f58-46a3-80d2-6f0f5e9972e3', 13, 'bffefb1c-8988-4ddf-b4ac-81c2b30e80cd', '2021-12-29 14:40:50', '2021-12-29 14:40:50');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('15a20e57-c338-4359-6874-08d9ca9289b5', '18fa4771-6f58-46a3-80d2-6f0f5e9972e3', 13, 'e7ef2a05-8317-41c3-b588-99519fe88bf9', '2021-12-29 14:40:50', '2021-12-29 14:40:50');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('53bf048a-7078-4ef3-6875-08d9ca9289b5', '18fa4771-6f58-46a3-80d2-6f0f5e9972e3', 13, '9c388461-2704-4c5e-a729-72c17e9018e1', '2021-12-29 14:40:50', '2021-12-29 14:40:50');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('ba849832-a0a0-4364-6876-08d9ca9289b5', '18fa4771-6f58-46a3-80d2-6f0f5e9972e3', 13, '383e7ee2-7690-46ac-9230-65155c84aa30', '2021-12-29 14:40:50', '2021-12-29 14:40:50');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('a502b878-254c-4f50-6877-08d9ca9289b5', '18fa4771-6f58-46a3-80d2-6f0f5e9972e3', 13, 'f27ecb0a-197d-47b1-b243-59a8c71302bf', '2021-12-29 14:40:50', '2021-12-29 14:40:50');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('950735aa-4158-4402-6878-08d9ca9289b5', '18fa4771-6f58-46a3-80d2-6f0f5e9972e3', 13, '2401f4d0-60b0-4e2e-903f-84c603373572', '2021-12-29 14:40:50', '2021-12-29 14:40:50');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('3e8625e6-b829-4c6a-6879-08d9ca9289b5', '18fa4771-6f58-46a3-80d2-6f0f5e9972e3', 13, 'b6fd5425-504a-46a9-993b-2f8dc9158eb8', '2021-12-29 14:40:50', '2021-12-29 14:40:50');

-- ----------------------------
-- Table structure for SysUser
-- ----------------------------
DROP TABLE IF EXISTS "public"."SysUser";
CREATE TABLE "public"."SysUser" (
  "Id" uuid NOT NULL,
  "Name" varchar(255) COLLATE "pg_catalog"."default",
  "LoginName" varchar(255) COLLATE "pg_catalog"."default",
  "Password" varchar(255) COLLATE "pg_catalog"."default",
  "Phone" varchar(255) COLLATE "pg_catalog"."default",
  "Email" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "IsDelete" int4,
  "OrganizationId" int4,
  "LastModificationTime" timestamp(6),
  "CreationTime" timestamp(6)
)
;

-- ----------------------------
-- Records of SysUser
-- ----------------------------
INSERT INTO "public"."SysUser" VALUES ('0198459e-2034-4533-b843-5d227ad20740', '超级管理员', 'admin', 'E10ADC3949BA59ABBE56E057F20F883E', '123123123', '1396510655@qq.com', 2, 1, '2021-12-30 15:22:38', '2017-04-06 19:55:53');
INSERT INTO "public"."SysUser" VALUES ('ac18f496-e93d-42f0-b59e-e321acc85335', '用户', 'user', 'E10ADC3949BA59ABBE56E057F20F883E', '456456456', '18123456789@live.com', 1, 1, '2021-12-27 22:17:01', '2017-04-06 19:55:53');

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
INSERT INTO "public"."SysUserPost" VALUES ('6357195e-7fdb-42f2-a16b-2ae0d2e7a69d', 'ac18f496-e93d-42f0-b59e-e321acc85335', '0716b4b0-9a06-43e9-8ae8-82c74875f83e', '2021-12-27 22:17:01', '2021-12-27 22:17:01');
INSERT INTO "public"."SysUserPost" VALUES ('65955bf8-7867-4d10-865c-78d07f57a655', '0198459e-2034-4533-b843-5d227ad20740', '96927c30-41d0-4ced-8e29-cbed35c90fb0', '2021-12-30 15:22:38', '2021-12-30 15:22:38');

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
INSERT INTO "public"."SysUserRole" VALUES ('d5109601-af57-4db4-8537-eadfd9165d04', 'ac18f496-e93d-42f0-b59e-e321acc85335', '40ff1844-c099-4061-98e0-cd6e544fcfd3', '2021-12-27 22:17:01', '2021-12-27 22:17:01');

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sysdictionary_id_seq"', 6, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sysmenu_id_seq"', 31, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sysorganization_id_seq"', 13, true);

-- ----------------------------
-- Primary Key structure for table Member
-- ----------------------------
ALTER TABLE "public"."Member" ADD CONSTRAINT "Member_pkey" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table SysDictionary
-- ----------------------------
ALTER TABLE "public"."SysDictionary" ADD CONSTRAINT "SysDictionary_pkey" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table SysFunction
-- ----------------------------
ALTER TABLE "public"."SysFunction" ADD CONSTRAINT "SysFunction_pkey" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table SysMenu
-- ----------------------------
ALTER TABLE "public"."SysMenu" ADD CONSTRAINT "SysMenu_pkey" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table SysMenuFunction
-- ----------------------------
ALTER TABLE "public"."SysMenuFunction" ADD CONSTRAINT "SysMenuFunction_pkey" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table SysOperationLog
-- ----------------------------
ALTER TABLE "public"."SysOperationLog" ADD CONSTRAINT "SysOperationLog_pkey" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table SysOrganization
-- ----------------------------
ALTER TABLE "public"."SysOrganization" ADD CONSTRAINT "SysOrganization_pkey" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table SysPost
-- ----------------------------
ALTER TABLE "public"."SysPost" ADD CONSTRAINT "SysPost_pkey" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table SysRole
-- ----------------------------
ALTER TABLE "public"."SysRole" ADD CONSTRAINT "SysRole_pkey" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table SysRoleMenuFunction
-- ----------------------------
ALTER TABLE "public"."SysRoleMenuFunction" ADD CONSTRAINT "SysRoleMenuFunction_pkey" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table SysUser
-- ----------------------------
ALTER TABLE "public"."SysUser" ADD CONSTRAINT "SysUser_pkey" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table SysUserPost
-- ----------------------------
ALTER TABLE "public"."SysUserPost" ADD CONSTRAINT "SysUserPost_pkey" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table SysUserRole
-- ----------------------------
ALTER TABLE "public"."SysUserRole" ADD CONSTRAINT "SysUserRole_pkey" PRIMARY KEY ("Id");
