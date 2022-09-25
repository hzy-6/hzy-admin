/*
 Navicat Premium Data Transfer

 Source Server         : 本地_PostgreSql
 Source Server Type    : PostgreSQL
 Source Server Version : 130003
 Source Host           : localhost:5432
 Source Catalog        : hzy_admin_pgsql_20220920
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 130003
 File Encoding         : 65001

 Date: 25/09/2022 18:22:39
*/


-- ----------------------------
-- Sequence structure for sys_dictionary_Id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_dictionary_Id_seq";
CREATE SEQUENCE "public"."sys_dictionary_Id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for sys_menu_Id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_menu_Id_seq";
CREATE SEQUENCE "public"."sys_menu_Id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for sys_organization_Id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_organization_Id_seq";
CREATE SEQUENCE "public"."sys_organization_Id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for __EFMigrationsHistory
-- ----------------------------
DROP TABLE IF EXISTS "public"."__EFMigrationsHistory";
CREATE TABLE "public"."__EFMigrationsHistory" (
  "MigrationId" varchar(150) COLLATE "pg_catalog"."default" NOT NULL,
  "ProductVersion" varchar(32) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of __EFMigrationsHistory
-- ----------------------------
INSERT INTO "public"."__EFMigrationsHistory" VALUES ('20220920124022_pgsql_init', '6.0.8');

-- ----------------------------
-- Table structure for flow
-- ----------------------------
DROP TABLE IF EXISTS "public"."flow";
CREATE TABLE "public"."flow" (
  "Id" uuid NOT NULL,
  "Number" int4,
  "Code" text COLLATE "pg_catalog"."default",
  "Name" text COLLATE "pg_catalog"."default",
  "Remark" text COLLATE "pg_catalog"."default",
  "CreatorUserId" uuid,
  "CreationTime" timestamp(6) NOT NULL,
  "LastModifierUserId" uuid,
  "LastModificationTime" timestamp(6)
)
;

-- ----------------------------
-- Records of flow
-- ----------------------------

-- ----------------------------
-- Table structure for flow_approval
-- ----------------------------
DROP TABLE IF EXISTS "public"."flow_approval";
CREATE TABLE "public"."flow_approval" (
  "Id" uuid NOT NULL,
  "UserId" uuid NOT NULL,
  "UserName" text COLLATE "pg_catalog"."default",
  "LaunchTime" timestamp(6) NOT NULL,
  "FormId" uuid NOT NULL,
  "FlowId" uuid NOT NULL,
  "FlowCode" text COLLATE "pg_catalog"."default",
  "FlowName" text COLLATE "pg_catalog"."default",
  "CreatorUserId" uuid,
  "CreationTime" timestamp(6) NOT NULL,
  "LastModifierUserId" uuid,
  "LastModificationTime" timestamp(6)
)
;

-- ----------------------------
-- Records of flow_approval
-- ----------------------------

-- ----------------------------
-- Table structure for flow_approval_step_history
-- ----------------------------
DROP TABLE IF EXISTS "public"."flow_approval_step_history";
CREATE TABLE "public"."flow_approval_step_history" (
  "Id" uuid NOT NULL,
  "Sort" int4 NOT NULL,
  "FlowNodeId" uuid NOT NULL,
  "FlowNodeName" text COLLATE "pg_catalog"."default",
  "SortMore" int4 NOT NULL,
  "State" int4 NOT NULL,
  "Opinions" text COLLATE "pg_catalog"."default",
  "UserId" uuid NOT NULL,
  "UserName" text COLLATE "pg_catalog"."default",
  "ApprovalDate" timestamp(6) NOT NULL,
  "CreatorUserId" uuid,
  "CreationTime" timestamp(6) NOT NULL,
  "LastModifierUserId" uuid,
  "LastModificationTime" timestamp(6)
)
;

-- ----------------------------
-- Records of flow_approval_step_history
-- ----------------------------

-- ----------------------------
-- Table structure for flow_approval_step_history_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."flow_approval_step_history_user";
CREATE TABLE "public"."flow_approval_step_history_user" (
  "Id" uuid NOT NULL,
  "FlowApprovalStepHistoryId" uuid NOT NULL,
  "FlowNodeId" uuid NOT NULL,
  "FlowNodeName" text COLLATE "pg_catalog"."default",
  "UserId" uuid NOT NULL,
  "UserName" text COLLATE "pg_catalog"."default",
  "CreatorUserId" uuid,
  "CreationTime" timestamp(6) NOT NULL,
  "LastModifierUserId" uuid,
  "LastModificationTime" timestamp(6)
)
;

-- ----------------------------
-- Records of flow_approval_step_history_user
-- ----------------------------

-- ----------------------------
-- Table structure for flow_node
-- ----------------------------
DROP TABLE IF EXISTS "public"."flow_node";
CREATE TABLE "public"."flow_node" (
  "Id" uuid NOT NULL,
  "FlowId" uuid NOT NULL,
  "Sort" int4,
  "Name" text COLLATE "pg_catalog"."default",
  "RoleId" uuid NOT NULL,
  "Remark" text COLLATE "pg_catalog"."default",
  "CreatorUserId" uuid,
  "CreationTime" timestamp(6) NOT NULL,
  "LastModifierUserId" uuid,
  "LastModificationTime" timestamp(6)
)
;

-- ----------------------------
-- Records of flow_node
-- ----------------------------

-- ----------------------------
-- Table structure for low_code_list
-- ----------------------------
DROP TABLE IF EXISTS "public"."low_code_list";
CREATE TABLE "public"."low_code_list" (
  "Id" uuid NOT NULL,
  "Low_Code_TableId" uuid NOT NULL,
  "Low_Code_Table_InfoId" uuid NOT NULL,
  "ForeignKeyTableId" uuid NOT NULL,
  "ForeignKeyTableFieldName" text COLLATE "pg_catalog"."default",
  "CreatorUserId" uuid,
  "CreationTime" timestamp(6) NOT NULL,
  "LastModifierUserId" uuid,
  "LastModificationTime" timestamp(6)
)
;

-- ----------------------------
-- Records of low_code_list
-- ----------------------------

-- ----------------------------
-- Table structure for low_code_search
-- ----------------------------
DROP TABLE IF EXISTS "public"."low_code_search";
CREATE TABLE "public"."low_code_search" (
  "Id" uuid NOT NULL,
  "Low_Code_TableId" uuid NOT NULL,
  "Low_Code_Table_InfoId" uuid NOT NULL,
  "CreatorUserId" uuid,
  "CreationTime" timestamp(6) NOT NULL,
  "LastModifierUserId" uuid,
  "LastModificationTime" timestamp(6)
)
;

-- ----------------------------
-- Records of low_code_search
-- ----------------------------

-- ----------------------------
-- Table structure for low_code_table
-- ----------------------------
DROP TABLE IF EXISTS "public"."low_code_table";
CREATE TABLE "public"."low_code_table" (
  "Id" uuid NOT NULL,
  "TableName" text COLLATE "pg_catalog"."default",
  "Schema" text COLLATE "pg_catalog"."default",
  "Type" text COLLATE "pg_catalog"."default",
  "DisplayName" text COLLATE "pg_catalog"."default",
  "EntityName" text COLLATE "pg_catalog"."default",
  "Remark" text COLLATE "pg_catalog"."default",
  "ProjectRootPath" text COLLATE "pg_catalog"."default",
  "ModelPath" text COLLATE "pg_catalog"."default",
  "ServicePath" text COLLATE "pg_catalog"."default",
  "ControllerPath" text COLLATE "pg_catalog"."default",
  "IndexVuePath" text COLLATE "pg_catalog"."default",
  "InfoVuePath" text COLLATE "pg_catalog"."default",
  "ServiceJsPath" text COLLATE "pg_catalog"."default",
  "IsCover" bool,
  "CreatorUserId" uuid,
  "CreationTime" timestamp(6) NOT NULL,
  "LastModifierUserId" uuid,
  "LastModificationTime" timestamp(6)
)
;

-- ----------------------------
-- Records of low_code_table
-- ----------------------------
INSERT INTO "public"."low_code_table" VALUES ('0a8bdb18-758a-4798-9ffc-e7031dcbf262', 'sys_post', 'dbo', 'TABLE', '岗位', 'SysPost', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 'f', NULL, '2022-04-17 00:00:00', NULL, '2022-08-01 20:32:25');
INSERT INTO "public"."low_code_table" VALUES ('18fbb18e-cb29-45d8-a5f3-c0121c57680a', 'flow_approval_step_history', 'dbo', 'TABLE', '', 'FlowApprovalStepHistory', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 'f', NULL, '2022-07-29 00:00:00', NULL, '2022-08-01 20:32:25');
INSERT INTO "public"."low_code_table" VALUES ('1a8df018-79f8-4e26-b4eb-4b735aae7275', 'flow', 'dbo', 'TABLE', '审批流', 'Flow', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 'f', NULL, '2022-04-17 00:00:00', NULL, '2022-08-01 20:32:25');
INSERT INTO "public"."low_code_table" VALUES ('2ae9e532-7d9a-474b-b629-50a39945c44d', 'sys_menu_function', 'dbo', 'TABLE', '菜单功能', 'SysMenuFunction', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 'f', NULL, '2022-04-17 00:00:00', NULL, '2022-08-01 20:32:25');
INSERT INTO "public"."low_code_table" VALUES ('3da5d264-2e8d-460c-a10c-ff9a6bb57a60', 'sys_user_role', 'dbo', 'TABLE', '用户与角色', 'SysUserRole', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 'f', NULL, '2022-04-17 00:00:00', NULL, '2022-08-01 20:32:25');
INSERT INTO "public"."low_code_table" VALUES ('524e71b4-cbf7-4248-8b29-3f99b43f2eb2', 'sys_data_authority_custom', 'dbo', 'TABLE', '自定义数据权限', 'SysDataAuthorityCustom', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 'f', NULL, '2022-04-17 00:00:00', NULL, '2022-08-01 20:32:25');
INSERT INTO "public"."low_code_table" VALUES ('60cceba1-28bf-4d1d-b603-4edf95d512b8', 'sys_operation_log', 'dbo', 'TABLE', '操作日志', 'SysOperationLog', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 'f', NULL, '2022-04-17 00:00:00', NULL, '2022-08-01 20:32:25');
INSERT INTO "public"."low_code_table" VALUES ('6323638b-a45f-4a76-886e-69a9e9be0901', 'sys_user', 'dbo', 'TABLE', '用户', 'SysUser', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 'f', NULL, '2022-04-17 00:00:00', NULL, '2022-08-01 20:32:25');
INSERT INTO "public"."low_code_table" VALUES ('651bb982-1130-4e1c-9070-36b90dcf2324', 'flow_approval_step', NULL, NULL, '工作流审批步骤配置', 'FlowApprovalStep', NULL, NULL, 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 'f', NULL, '2022-04-17 00:00:00', NULL, '2022-07-29 21:59:11');
INSERT INTO "public"."low_code_table" VALUES ('69b24f04-0ed3-45fc-91d9-0dc929175a57', 'sys_user_post', 'dbo', 'TABLE', '用户与岗位', 'SysUserPost', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 'f', NULL, '2022-04-17 00:00:00', NULL, '2022-08-01 20:32:25');
INSERT INTO "public"."low_code_table" VALUES ('69edd8a8-1d24-478c-a909-b82039edcec0', 'low_code_search', 'dbo', 'TABLE', '低代码检索表', 'LowCodeSearch', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 'f', NULL, '2022-05-23 00:00:00', NULL, '2022-08-01 20:32:25');
INSERT INTO "public"."low_code_table" VALUES ('6ba9805c-916e-4d2c-99d0-216fcbc361cc', 'low_code_table', 'dbo', 'TABLE', '低代码表', 'LowCodeTable', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 'f', NULL, '2022-05-23 00:00:00', NULL, '2022-08-01 20:32:25');
INSERT INTO "public"."low_code_table" VALUES ('6fabc67a-8b48-49a6-8ba1-c8a32c499d36', 'sys_function', 'dbo', 'TABLE', '功能', 'SysFunction', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 'f', NULL, '2022-04-17 00:00:00', NULL, '2022-08-01 20:32:25');
INSERT INTO "public"."low_code_table" VALUES ('73c97832-4e7f-4758-86d2-94327971b5fd', 'member', 'dbo', 'TABLE', '会员', 'Member', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 'f', NULL, '2022-04-17 00:00:00', NULL, '2022-08-01 20:32:25');
INSERT INTO "public"."low_code_table" VALUES ('79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 'low_code_table_info', 'dbo', 'TABLE', '低代码表信息', 'LowCodeTableInfo', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 'f', NULL, '2022-05-23 00:00:00', NULL, '2022-08-01 20:32:25');
INSERT INTO "public"."low_code_table" VALUES ('7ad3b915-f0bd-443a-89cd-42d41dd6c554', 'flow_approval_step_user', NULL, NULL, '工作流用户审批步骤', 'FlowApprovalStepUser', NULL, NULL, 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 'f', NULL, '2022-04-17 00:00:00', NULL, '2022-07-29 21:59:11');
INSERT INTO "public"."low_code_table" VALUES ('7f94e0db-fc63-40dc-bfe3-18c5aad75975', 'flow_approval_step_history_user', 'dbo', 'TABLE', '', 'FlowApprovalStepHistoryUser', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 'f', NULL, '2022-07-29 00:00:00', NULL, '2022-08-01 20:32:25');
INSERT INTO "public"."low_code_table" VALUES ('852f53ff-0d00-4c32-aa55-a9c11993751b', 'low_code_list', 'dbo', 'TABLE', '低代码列表', 'LowCodeList', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 'f', NULL, '2022-05-23 00:00:00', NULL, '2022-08-01 20:32:25');
INSERT INTO "public"."low_code_table" VALUES ('8da38d20-8a09-4e81-8dd8-ed6702aee380', 'sys_role_menu_function', 'dbo', 'TABLE', '角色菜单功能关联', 'SysRoleMenuFunction', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 'f', NULL, '2022-04-17 00:00:00', NULL, '2022-08-01 20:32:25');
INSERT INTO "public"."low_code_table" VALUES ('ae6d94d8-6a15-4348-b600-aa17e4b61718', 'flow_node', 'dbo', 'TABLE', '工作流节点', 'FlowNode', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 'f', NULL, '2022-04-17 00:00:00', NULL, '2022-08-01 20:32:25');
INSERT INTO "public"."low_code_table" VALUES ('af37f705-7ba0-4883-b1be-8a274ea4c026', 'sys_dictionary', 'dbo', 'TABLE', '数据字典', 'SysDictionary', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 'f', NULL, '2022-04-17 00:00:00', NULL, '2022-08-01 20:32:25');
INSERT INTO "public"."low_code_table" VALUES ('d2600250-6f32-4d7d-8395-96cc9fa36db4', 'sys_menu', 'dbo', 'TABLE', '菜单', 'SysMenu', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 'f', NULL, '2022-04-17 00:00:00', NULL, '2022-08-01 20:32:25');
INSERT INTO "public"."low_code_table" VALUES ('d26d07cb-158a-4cb2-8b20-5dfd5181af54', 'sys_organization', 'dbo', 'TABLE', '组织', 'SysOrganization', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 'f', NULL, '2022-04-17 00:00:00', NULL, '2022-08-01 20:32:25');
INSERT INTO "public"."low_code_table" VALUES ('d8948c56-c5bd-4061-b272-5417375f38f0', 'flow_approval', 'dbo', 'TABLE', '审批流审批', 'FlowApproval', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 'f', NULL, '2022-04-17 00:00:00', NULL, '2022-08-01 20:32:25');
INSERT INTO "public"."low_code_table" VALUES ('e79db53b-7162-4669-9b5e-f860501475ac', 'sys_data_authority', 'dbo', 'TABLE', '数据权限', 'SysDataAuthority', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 'f', NULL, '2022-04-17 00:00:00', NULL, '2022-08-01 20:32:25');
INSERT INTO "public"."low_code_table" VALUES ('f3d7bbb3-c1fb-4d61-92a4-9bc101811335', 'sys_role', 'dbo', 'TABLE', '角色', 'SysRole', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 'f', NULL, '2022-04-17 00:00:00', NULL, '2022-08-01 20:32:25');

-- ----------------------------
-- Table structure for low_code_table_info
-- ----------------------------
DROP TABLE IF EXISTS "public"."low_code_table_info";
CREATE TABLE "public"."low_code_table_info" (
  "Id" uuid NOT NULL,
  "Low_Code_TableId" uuid NOT NULL,
  "IsPrimary" bool NOT NULL,
  "IsIdentity" bool NOT NULL,
  "IsNullable" bool NOT NULL,
  "Position" int4 NOT NULL,
  "ColumnName" text COLLATE "pg_catalog"."default",
  "Describe" text COLLATE "pg_catalog"."default",
  "DatabaseColumnType" text COLLATE "pg_catalog"."default",
  "CsType" text COLLATE "pg_catalog"."default",
  "CsField" text COLLATE "pg_catalog"."default",
  "MaxLength" int4,
  "DisplayName" text COLLATE "pg_catalog"."default",
  "CreatorUserId" uuid,
  "CreationTime" timestamp(6) NOT NULL,
  "LastModifierUserId" uuid,
  "LastModificationTime" timestamp(6)
)
;

-- ----------------------------
-- Records of low_code_table_info
-- ----------------------------
INSERT INTO "public"."low_code_table_info" VALUES ('01ca178c-112a-4a49-d489-08da3d8d5a26', 'd8948c56-c5bd-4061-b272-5417375f38f0', 'f', 'f', 't', 33, 'CreationTime', '', 'datetime', 'DateTime', 'CreationTime', 8, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('022c287a-11e3-4234-3392-08da716a5c08', '18fbb18e-cb29-45d8-a5f3-c0121c57680a', 'f', 'f', 't', 28, 'UserName', '', 'nvarchar(MAX)', 'String', 'UserName', -1, '', NULL, '2022-07-29 21:58:05', NULL, '2022-07-29 21:58:05');
INSERT INTO "public"."low_code_table_info" VALUES ('042a59e2-72c1-4c38-d52d-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 'f', 'f', 't', 140, 'ParentId', '', 'int', 'Int32', 'ParentId', NULL, NULL, NULL, '2022-05-24 00:00:00', NULL, '2022-06-09 21:20:26');
INSERT INTO "public"."low_code_table_info" VALUES ('043612f1-e16a-4c44-d497-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 'f', 'f', 't', 42, 'LastModificationTime', '', 'datetime', 'DateTime', 'LastModificationTime', 8, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('063d44b8-6ce2-47a6-d51a-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 'f', 'f', 't', 9, 'Browser', '', 'varchar(255)', 'String', 'Browser', 255, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('06f4f5a9-f63f-4e47-d485-08da3d8d5a26', '1a8df018-79f8-4e26-b4eb-4b735aae7275', 'f', 'f', 't', 29, 'Name', '流程名称', 'nvarchar(255)', 'String', 'Name', 255, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('0888b15f-3bd2-4881-d523-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 'f', 'f', 'f', 12, 'TakeUpTime', '接口耗时（毫秒）', 'bigint', 'Int64', 'TakeUpTime', 8, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('0aa2daab-50df-4397-d51c-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 'f', 'f', 't', 3, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', 6, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('0b45e9bb-b9f1-4a2f-d526-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 'f', 'f', 't', 142, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', NULL, NULL, NULL, '2022-05-24 00:00:00', NULL, '2022-06-09 21:20:26');
INSERT INTO "public"."low_code_table_info" VALUES ('0cfc881c-98d4-4a2c-d4a5-08da3d8d5a26', '7ad3b915-f0bd-443a-89cd-42d41dd6c554', 'f', 'f', 't', 60, 'UserName', '审批人名称', 'varchar(500)', 'String', 'UserName', 500, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('0df6b078-b248-4c83-d4ab-08da3d8d5a26', 'ae6d94d8-6a15-4348-b600-aa17e4b61718', 'f', 'f', 't', 67, 'Name', '', 'nvarchar(255)', 'String', 'Name', 255, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('0e19400d-1876-4fe3-d4a7-08da3d8d5a26', 'ae6d94d8-6a15-4348-b600-aa17e4b61718', 'f', 'f', 't', 63, 'CreationTime', '', 'datetime', 'DateTime', 'CreationTime', 8, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('0e864b91-b667-4f53-d4a3-08da3d8d5a26', '7ad3b915-f0bd-443a-89cd-42d41dd6c554', 'f', 'f', 't', 54, 'LastModificationTime', '', 'datetime', 'DateTime', 'LastModificationTime', 8, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('0f908e1d-4a82-42c1-d4e8-08da3d8d5a26', 'e79db53b-7162-4669-9b5e-f860501475ac', 'f', 'f', 't', 86, 'PermissionType', '数据权限类型', 'int', 'Int32', 'PermissionType', 4, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('1121d642-49e8-4b25-d52b-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 'f', 'f', 't', 133, 'Name', '', 'nvarchar(255)', 'String', 'Name', NULL, '组织名称', NULL, '2022-05-24 00:00:00', NULL, '2022-06-09 21:20:26');
INSERT INTO "public"."low_code_table_info" VALUES ('11afcf11-9b42-47ce-d4c5-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 'f', 'f', 't', 204, 'ColumnName', '', 'varchar(500)', 'String', 'ColumnName', 500, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('11f3d291-cf7a-4143-d52a-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 'f', 'f', 't', 135, 'LevelCode', '', 'varchar(50)', 'String', 'LevelCode', NULL, NULL, NULL, '2022-05-24 00:00:00', NULL, '2022-06-09 21:20:26');
INSERT INTO "public"."low_code_table_info" VALUES ('1213c179-e366-4e3c-d540-08da3d8d5a26', '8da38d20-8a09-4e81-8dd8-ed6702aee380', 'f', 'f', 't', 163, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', 6, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('12e9e9ad-5631-4dc8-d503-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 'f', 'f', 't', 122, 'JumpUrl', '', 'varchar(255)', 'String', 'JumpUrl', 255, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('134c9f62-abd2-476e-d532-08da3d8d5a26', '0a8bdb18-758a-4798-9ffc-e7031dcbf262', 'f', 'f', 't', 150, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', 6, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('135e23db-540b-4096-d551-08da3d8d5a26', '69b24f04-0ed3-45fc-91d9-0dc929175a57', 'f', 'f', 't', 177, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', 6, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('13775de6-200d-43e0-244c-08da717dbcaa', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 'f', 'f', 't', 218, 'ServiceJsPath', '', 'varchar(50)', 'String', 'ServiceJsPath', 50, '', NULL, '2022-07-30 00:16:47', NULL, '2022-07-30 00:16:47');
INSERT INTO "public"."low_code_table_info" VALUES ('158b1c2d-fa67-4696-244b-08da717dbcaa', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 'f', 'f', 't', 207, 'Schema', '', 'nvarchar(MAX)', 'String', 'Schema', -1, '', NULL, '2022-07-30 00:16:47', NULL, '2022-07-30 00:16:47');
INSERT INTO "public"."low_code_table_info" VALUES ('1790b4d5-51b2-4dc0-d534-08da3d8d5a26', '0a8bdb18-758a-4798-9ffc-e7031dcbf262', 'f', 'f', 't', 146, 'Name', '', 'nvarchar(255)', 'String', 'Name', 255, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('18b4430b-765d-4a71-97b9-08da39a2ef6c', '3da5d264-2e8d-460c-a10c-ff9a6bb57a60', 'f', 'f', 't', 171, 'UserId', '', 'uniqueidentifier', 'Guid', 'UserId', NULL, NULL, NULL, '2022-05-19 00:00:00', NULL, '2022-05-19 22:26:18');
INSERT INTO "public"."low_code_table_info" VALUES ('1916e619-4818-4c63-d50b-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 'f', 'f', 't', 118, 'Show', '', 'bit', 'Boolean', 'Show', 1, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('19a7504c-f740-4b49-d528-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 'f', 'f', 't', 141, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', NULL, NULL, NULL, '2022-05-24 00:00:00', NULL, '2022-06-09 21:20:26');
INSERT INTO "public"."low_code_table_info" VALUES ('19fa02fe-fb8f-4631-d50e-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 'f', 'f', 't', 113, 'Url', '', 'nvarchar(255)', 'String', 'Url', NULL, NULL, NULL, '2022-05-24 00:00:00', NULL, '2022-05-24 21:58:07');
INSERT INTO "public"."low_code_table_info" VALUES ('1a2a9e15-dc83-49e1-d4b9-08da3d8d5a26', '69edd8a8-1d24-478c-a909-b82039edcec0', 'f', 'f', 't', 188, 'Low_Code_Table_InfoId', '', 'uniqueidentifier', 'Guid', 'Low_Code_Table_InfoId', 16, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('1bd2134c-3a2a-4e1b-2446-08da717dbcaa', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 'f', 'f', 't', 219, 'IsCover', '', 'bit', 'Boolean', 'IsCover', 1, '', NULL, '2022-07-30 00:16:47', NULL, '2022-07-30 00:16:47');
INSERT INTO "public"."low_code_table_info" VALUES ('1d3c8224-a3a5-4b88-d4cd-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 'f', 'f', 't', 200, 'IsPrimary', '', 'bit', 'Boolean', 'IsPrimary', 1, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('1d881e59-d88e-497f-d51e-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 'f', 'f', 't', 7, 'FormBody', 'json表单信息', 'varchar(MAX)', 'String', 'FormBody', -1, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('1e40d97a-49ee-4727-d4c6-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 'f', 'f', 't', 198, 'CreationTime', '', 'datetime', 'DateTime', 'CreationTime', 8, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('1fbf9cea-3e4c-401b-243f-08da717dbcaa', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 't', 'f', 'f', 203, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '', NULL, '2022-07-30 00:16:47', NULL, '2022-07-30 00:16:47');
INSERT INTO "public"."low_code_table_info" VALUES ('2006ac52-bb49-4e41-d501-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 'f', 'f', 't', 109, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', NULL, NULL, NULL, '2022-05-24 00:00:00', NULL, '2022-05-24 21:58:07');
INSERT INTO "public"."low_code_table_info" VALUES ('200ff922-513c-4b19-d519-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 'f', 'f', 't', 4, 'Api', '接口地址', 'varchar(500)', 'String', 'Api', 500, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('2029bb6d-a0f2-41de-97b8-08da39a2ef6c', '3da5d264-2e8d-460c-a10c-ff9a6bb57a60', 'f', 'f', 't', 172, 'RoleId', '', 'uniqueidentifier', 'Guid', 'RoleId', NULL, NULL, NULL, '2022-05-19 00:00:00', NULL, '2022-05-19 22:26:18');
INSERT INTO "public"."low_code_table_info" VALUES ('22527fe7-bd5c-4e6c-3389-08da716a5c08', '18fbb18e-cb29-45d8-a5f3-c0121c57680a', 'f', 'f', 'f', 31, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', 8, '', NULL, '2022-07-29 21:58:05', NULL, '2022-07-29 21:58:05');
INSERT INTO "public"."low_code_table_info" VALUES ('2286c948-4f0d-4b66-d535-08da3d8d5a26', '0a8bdb18-758a-4798-9ffc-e7031dcbf262', 'f', 'f', 't', 144, 'Number', '', 'int', 'Int32', 'Number', 4, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('2321aac8-0eed-4b87-d4ac-08da3d8d5a26', 'ae6d94d8-6a15-4348-b600-aa17e4b61718', 'f', 'f', 't', 69, 'Remark', '', 'nvarchar(255)', 'String', 'Remark', 255, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('2341dcb1-8056-4a7c-d4eb-08da3d8d5a26', '524e71b4-cbf7-4248-8b29-3f99b43f2eb2', 'f', 'f', 't', 89, 'CreationTime', '', 'datetime', 'DateTime', 'CreationTime', 8, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('235b67f8-62d2-480e-d508-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 'f', 'f', 't', 111, 'Number', '编号', 'int', 'Int32', 'Number', NULL, NULL, NULL, '2022-05-24 00:00:00', NULL, '2022-05-24 21:58:07');
INSERT INTO "public"."low_code_table_info" VALUES ('24db7ed8-1a4f-4b25-d49d-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 'f', 'f', 't', 51, 'UserName', '步骤审批人名称', 'varchar(255)', 'String', 'UserName', 255, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('252ac7b2-0e62-48e1-97b7-08da39a2ef6c', '3da5d264-2e8d-460c-a10c-ff9a6bb57a60', 'f', 'f', 't', 173, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', NULL, NULL, NULL, '2022-05-19 00:00:00', NULL, '2022-05-19 22:26:18');
INSERT INTO "public"."low_code_table_info" VALUES ('26f16d3d-9c42-4f86-244e-08da717dbcaa', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 'f', 'f', 't', 206, 'TableName', '', 'nvarchar(MAX)', 'String', 'TableName', -1, '', NULL, '2022-07-30 00:16:47', NULL, '2022-07-30 00:16:47');
INSERT INTO "public"."low_code_table_info" VALUES ('2819dfe7-f12b-483c-d4a6-08da3d8d5a26', 'ae6d94d8-6a15-4348-b600-aa17e4b61718', 't', 'f', 'f', 61, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('287314b2-3141-4957-d548-08da3d8d5a26', '6323638b-a45f-4a76-886e-69a9e9be0901', 'f', 'f', 'f', 171, 'Email', '', 'nvarchar(255)', 'String', 'Email', NULL, '电子邮箱', NULL, '2022-05-24 00:00:00', NULL, '2022-06-09 21:20:04');
INSERT INTO "public"."low_code_table_info" VALUES ('29b765bd-36f4-462f-d4f3-08da3d8d5a26', 'af37f705-7ba0-4883-b1be-8a274ea4c026', 'f', 'f', 't', 98, 'Name', '分组名/键', 'varchar(255)', 'String', 'Name', 255, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('29d08351-9091-4c91-d514-08da3d8d5a26', '2ae9e532-7d9a-474b-b629-50a39945c44d', 'f', 'f', 't', 128, 'MenuId', '', 'int', 'Int32', 'MenuId', 4, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('2a1c3f3d-4efc-472b-d49a-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 'f', 'f', 't', 47, 'SortMore', '多次审批顺序号（可能是多次审批次数）', 'int', 'Int32', 'SortMore', 4, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('2ae91c1d-d618-4267-d4b3-08da3d8d5a26', '852f53ff-0d00-4c32-aa55-a9c11993751b', 'f', 'f', 't', 190, 'LastModificationTime', '', 'datetime', 'DateTime', 'LastModificationTime', 8, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('2b4747ed-0409-4d14-d48b-08da3d8d5a26', 'd8948c56-c5bd-4061-b272-5417375f38f0', 'f', 'f', 't', 38, 'FlowId', '流程Id', 'uniqueidentifier', 'Guid', 'FlowId', 16, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('2ca9aa7e-321e-47f0-d4f0-08da3d8d5a26', 'af37f705-7ba0-4883-b1be-8a274ea4c026', 'f', 'f', 't', 94, 'CreationTime', '创建时间', 'datetime', 'DateTime', 'CreationTime', 8, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('2ffaa9ee-c286-4f90-d495-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 'f', 'f', 't', 45, 'FlowNodeId', '审批流节点Id', 'uniqueidentifier', 'Guid', 'FlowNodeId', 16, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('3051fb7c-f075-4d91-2443-08da717dbcaa', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 'f', 'f', 't', 210, 'EntityName', '', 'nvarchar(MAX)', 'String', 'EntityName', -1, '', NULL, '2022-07-30 00:16:47', NULL, '2022-07-30 00:16:47');
INSERT INTO "public"."low_code_table_info" VALUES ('3071360b-c1ef-4dff-d48f-08da3d8d5a26', 'd8948c56-c5bd-4061-b272-5417375f38f0', 'f', 'f', 't', 36, 'LaunchTime', '发起时间', 'datetime', 'DateTime', 'LaunchTime', 8, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('3133985d-586c-4c4e-d4ff-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 'f', 'f', 't', 119, 'Close', '', 'bit', 'Boolean', 'Close', 1, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('325af03c-cbb7-4de6-d4ee-08da3d8d5a26', '524e71b4-cbf7-4248-8b29-3f99b43f2eb2', 'f', 'f', 'f', 91, 'SysOrganizationId', '', 'int', 'Int32', 'SysOrganizationId', 4, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('3b959124-21d2-45b9-d4ca-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 'f', 'f', 't', 205, 'Describe', '', 'varchar(50)', 'String', 'Describe', 50, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('3d9c98e4-2ac7-40fd-3391-08da716a5c08', '18fbb18e-cb29-45d8-a5f3-c0121c57680a', 'f', 'f', 'f', 27, 'UserId', '', 'uniqueidentifier', 'Guid', 'UserId', 16, '', NULL, '2022-07-29 21:58:05', NULL, '2022-07-29 21:58:05');
INSERT INTO "public"."low_code_table_info" VALUES ('3f7e43c9-762f-48ea-d53a-08da3d8d5a26', 'f3d7bbb3-c1fb-4d61-92a4-9bc101811335', 'f', 'f', 't', 157, 'DeleteLock', '', 'bit', 'Boolean', 'DeleteLock', 1, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('42430604-7090-442d-d539-08da3d8d5a26', 'f3d7bbb3-c1fb-4d61-92a4-9bc101811335', 'f', 'f', 't', 153, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', 6, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('4467bf43-6e95-4798-d522-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 'f', 'f', 't', 8, 'QueryString', '地址栏信息', 'varchar(MAX)', 'String', 'QueryString', -1, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('46bac66f-3cf0-46b3-d546-08da3d8d5a26', '6323638b-a45f-4a76-886e-69a9e9be0901', 'f', 'f', 't', 166, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', NULL, '创建时间', NULL, '2022-05-24 00:00:00', NULL, '2022-06-09 21:20:04');
INSERT INTO "public"."low_code_table_info" VALUES ('4736479f-6089-4141-d521-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 'f', 'f', 't', 10, 'OS', '', 'varchar(255)', 'String', 'OS', 255, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('48b12860-84de-4f7b-d4c9-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 'f', 'f', 't', 206, 'DatabaseColumnType', '', 'varchar(50)', 'String', 'DatabaseColumnType', 50, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('495fe86e-5bd6-44d4-d4a1-08da3d8d5a26', '7ad3b915-f0bd-443a-89cd-42d41dd6c554', 'f', 'f', 't', 57, 'FlowNodeId', '审批节点Id', 'uniqueidentifier', 'Guid', 'FlowNodeId', 16, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('498327eb-5676-4091-d4fe-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 't', 't', 'f', 107, 'Id', '', 'int', 'Int32', 'Id', NULL, NULL, NULL, '2022-05-24 00:00:00', NULL, '2022-05-24 21:58:07');
INSERT INTO "public"."low_code_table_info" VALUES ('4aaa1e18-8c06-4806-d4d1-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 'f', 'f', 't', 203, 'Position', '', 'int', 'Int32', 'Position', 4, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('4b5bc027-5663-463a-d54b-08da3d8d5a26', '6323638b-a45f-4a76-886e-69a9e9be0901', 'f', 'f', 't', 167, 'Name', '', 'nvarchar(255)', 'String', 'Name', NULL, '用户名称', NULL, '2022-05-24 00:00:00', NULL, '2022-06-09 21:20:04');
INSERT INTO "public"."low_code_table_info" VALUES ('4c479d54-530f-4652-d552-08da3d8d5a26', '69b24f04-0ed3-45fc-91d9-0dc929175a57', 'f', 'f', 't', 176, 'PostId', '', 'uniqueidentifier', 'Guid', 'PostId', 16, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('50b6b2fc-3e73-457c-338b-08da716a5c08', '18fbb18e-cb29-45d8-a5f3-c0121c57680a', 'f', 'f', 't', 23, 'FlowNodeName', '', 'nvarchar(MAX)', 'String', 'FlowNodeName', -1, '', NULL, '2022-07-29 21:58:05', NULL, '2022-07-29 21:58:05');
INSERT INTO "public"."low_code_table_info" VALUES ('517cbfe0-275d-4f36-d53b-08da3d8d5a26', 'f3d7bbb3-c1fb-4d61-92a4-9bc101811335', 'f', 'f', 't', 152, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', 6, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('51d2eb90-7ab9-4763-3387-08da716a5c08', '18fbb18e-cb29-45d8-a5f3-c0121c57680a', 't', 'f', 'f', 20, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '', NULL, '2022-07-29 21:58:05', NULL, '2022-07-29 21:58:05');
INSERT INTO "public"."low_code_table_info" VALUES ('5257ad4f-589d-40d0-d533-08da3d8d5a26', '0a8bdb18-758a-4798-9ffc-e7031dcbf262', 'f', 'f', 't', 149, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', 6, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('54a0ed42-104e-4e2a-2445-08da717dbcaa', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 'f', 'f', 't', 217, 'InfoVuePath', '', 'varchar(50)', 'String', 'InfoVuePath', 50, '', NULL, '2022-07-30 00:16:47', NULL, '2022-07-30 00:16:47');
INSERT INTO "public"."low_code_table_info" VALUES ('5541e535-7cbe-43d2-d4d4-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 'f', 'f', 't', 80, 'CreationTime', '创建时间', 'datetime2', 'DateTime', 'CreationTime', NULL, '创建时间', NULL, '2022-05-24 00:00:00', NULL, '2022-06-08 21:20:04');
INSERT INTO "public"."low_code_table_info" VALUES ('564a907b-1f47-4849-d537-08da3d8d5a26', '0a8bdb18-758a-4798-9ffc-e7031dcbf262', 'f', 'f', 't', 147, 'State', '', 'int', 'Int32', 'State', 4, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('585e18ea-ab50-4216-d4b5-08da3d8d5a26', '852f53ff-0d00-4c32-aa55-a9c11993751b', 'f', 'f', 't', 192, 'Low_Code_TableId', '', 'uniqueidentifier', 'Guid', 'Low_Code_TableId', 16, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('59cfb48c-8d3f-43d7-244f-08da717dbcaa', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 'f', 'f', 't', 208, 'Type', '', 'nvarchar(MAX)', 'String', 'Type', -1, '', NULL, '2022-07-30 00:16:47', NULL, '2022-07-30 00:16:47');
INSERT INTO "public"."low_code_table_info" VALUES ('59f5d993-e502-4fee-3393-08da716a5c08', '7f94e0db-fc63-40dc-bfe3-18c5aad75975', 't', 'f', 'f', 32, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '', NULL, '2022-07-29 21:58:05', NULL, '2022-07-29 21:58:05');
INSERT INTO "public"."low_code_table_info" VALUES ('5a9fa990-b6d6-445f-d54c-08da3d8d5a26', '6323638b-a45f-4a76-886e-69a9e9be0901', 'f', 'f', 't', 173, 'OrganizationId', '', 'int', 'Int32', 'OrganizationId', NULL, '组织id', NULL, '2022-05-24 00:00:00', NULL, '2022-06-09 21:20:04');
INSERT INTO "public"."low_code_table_info" VALUES ('5aa598a9-6e52-4ae4-d50a-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 'f', 'f', 't', 114, 'Router', '', 'nvarchar(255)', 'String', 'Router', NULL, NULL, NULL, '2022-05-24 00:00:00', NULL, '2022-05-24 21:58:07');
INSERT INTO "public"."low_code_table_info" VALUES ('5aed3feb-3d77-4e1e-d52c-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 'f', 'f', 't', 134, 'OrderNumber', '', 'int', 'Int32', 'OrderNumber', NULL, NULL, NULL, '2022-05-24 00:00:00', NULL, '2022-06-09 21:20:26');
INSERT INTO "public"."low_code_table_info" VALUES ('5bcf7406-75cc-4171-d545-08da3d8d5a26', '6323638b-a45f-4a76-886e-69a9e9be0901', 't', 'f', 'f', 164, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', NULL, NULL, NULL, '2022-05-24 00:00:00', NULL, '2022-06-09 21:20:04');
INSERT INTO "public"."low_code_table_info" VALUES ('5ca84ecf-5971-45bc-d4a8-08da3d8d5a26', 'ae6d94d8-6a15-4348-b600-aa17e4b61718', 'f', 'f', 't', 65, 'FlowCode', '', 'nvarchar(255)', 'String', 'FlowCode', 255, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('5cb41f1c-e68a-47f9-d486-08da3d8d5a26', '1a8df018-79f8-4e26-b4eb-4b735aae7275', 'f', 'f', 't', 27, 'Number', '排序号', 'int', 'Int32', 'Number', 4, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('5f5c2997-daa8-491c-d51d-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 'f', 'f', 't', 6, 'Form', '表单信息', 'varchar(MAX)', 'String', 'Form', -1, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('5f9a4a78-1bb9-4592-d536-08da3d8d5a26', '0a8bdb18-758a-4798-9ffc-e7031dcbf262', 'f', 'f', 't', 148, 'Remarks', '', 'nvarchar(255)', 'String', 'Remarks', 255, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('5fc01eb0-4833-4e93-d483-08da3d8d5a26', '1a8df018-79f8-4e26-b4eb-4b735aae7275', 'f', 'f', 't', 26, 'CreationTime', '', 'datetime', 'DateTime', 'CreationTime', 8, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('5fea8348-aa6b-4577-d4cc-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 'f', 'f', 't', 202, 'IsNullable', '', 'bit', 'Boolean', 'IsNullable', 1, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('60019cd9-49eb-489b-97b5-08da39a2ef6c', '3da5d264-2e8d-460c-a10c-ff9a6bb57a60', 't', 'f', 'f', 170, 'Id', 'Id', 'uniqueidentifier', 'Guid', 'Id', NULL, NULL, NULL, '2022-05-19 00:00:00', NULL, '2022-05-19 22:26:18');
INSERT INTO "public"."low_code_table_info" VALUES ('609a52aa-48b2-4e64-d48e-08da3d8d5a26', 'd8948c56-c5bd-4061-b272-5417375f38f0', 'f', 'f', 't', 32, 'LastModificationTime', '', 'datetime', 'DateTime', 'LastModificationTime', 8, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('6284c929-4115-4c17-d491-08da3d8d5a26', 'd8948c56-c5bd-4061-b272-5417375f38f0', 'f', 'f', 't', 35, 'UserName', '发起人', 'varchar(255)', 'String', 'UserName', 255, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('6304e602-84a1-4c57-d4ec-08da3d8d5a26', '524e71b4-cbf7-4248-8b29-3f99b43f2eb2', 'f', 'f', 't', 88, 'LastModificationTime', '', 'datetime', 'DateTime', 'LastModificationTime', 8, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('643c3aa6-d639-46bd-339a-08da716a5c08', '7f94e0db-fc63-40dc-bfe3-18c5aad75975', 'f', 'f', 't', 37, 'UserName', '', 'nvarchar(MAX)', 'String', 'UserName', -1, '', NULL, '2022-07-29 21:58:05', NULL, '2022-07-29 21:58:05');
INSERT INTO "public"."low_code_table_info" VALUES ('646614d9-d7f3-42c5-d4fd-08da3d8d5a26', '6fabc67a-8b48-49a6-8ba1-c8a32c499d36', 'f', 'f', 't', 104, 'Remark', '', 'nvarchar(255)', 'String', 'Remark', 255, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('66718de6-5c1a-4229-d524-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 'f', 'f', 't', 11, 'UserId', '当前操作人id', 'uniqueidentifier', 'Guid', 'UserId', 16, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('669b87ce-c694-4c8c-d4da-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 'f', 'f', 't', 73, 'Phone', '', 'nvarchar(255)', 'String', 'Phone', NULL, '联系电话', NULL, '2022-05-24 00:00:00', NULL, '2022-06-08 21:20:04');
INSERT INTO "public"."low_code_table_info" VALUES ('69875823-326c-4e13-d538-08da3d8d5a26', 'f3d7bbb3-c1fb-4d61-92a4-9bc101811335', 't', 'f', 'f', 151, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('6aa13b8f-1e3c-4750-d530-08da3d8d5a26', '0a8bdb18-758a-4798-9ffc-e7031dcbf262', 't', 'f', 'f', 143, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('6c3bb548-aafc-4f16-d50d-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 'f', 'f', 't', 123, 'Type', '', 'int', 'Int32', 'Type', 4, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('6c934348-be20-4c9e-d542-08da3d8d5a26', '8da38d20-8a09-4e81-8dd8-ed6702aee380', 'f', 'f', 't', 161, 'MenuFunctionId', '', 'uniqueidentifier', 'Guid', 'MenuFunctionId', 16, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('6cfe3b57-006f-436b-d511-08da3d8d5a26', '2ae9e532-7d9a-474b-b629-50a39945c44d', 'f', 'f', 't', 129, 'FunctionCode', '', 'varchar(100)', 'String', 'FunctionCode', 100, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('6e69cf9b-d9cd-4c31-d4f4-08da3d8d5a26', 'af37f705-7ba0-4883-b1be-8a274ea4c026', 'f', 'f', 't', 99, 'ParentId', '父级分组id', 'int', 'Int32', 'ParentId', 4, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('70e30a70-99f9-44b3-d482-08da3d8d5a26', '1a8df018-79f8-4e26-b4eb-4b735aae7275', 'f', 'f', 't', 28, 'Code', '编码', 'nvarchar(255)', 'String', 'Code', 255, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('7211aea6-eb91-41e5-d505-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 'f', 'f', 't', 108, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', NULL, NULL, NULL, '2022-05-24 00:00:00', NULL, '2022-05-24 21:58:07');
INSERT INTO "public"."low_code_table_info" VALUES ('72ac247c-d792-4fee-d4dc-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 'f', 'f', 't', 74, 'Sex', '', 'nvarchar(255)', 'String', 'Sex', NULL, '性别', NULL, '2022-05-24 00:00:00', NULL, '2022-06-08 21:20:04');
INSERT INTO "public"."low_code_table_info" VALUES ('73d17476-e006-4530-d4ad-08da3d8d5a26', 'ae6d94d8-6a15-4348-b600-aa17e4b61718', 'f', 'f', 't', 68, 'RoleId', '', 'uniqueidentifier', 'Guid', 'RoleId', 16, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('743d6eab-b4c8-4a15-d4f8-08da3d8d5a26', '6fabc67a-8b48-49a6-8ba1-c8a32c499d36', 'f', 'f', 't', 103, 'ByName', '', 'nvarchar(255)', 'String', 'ByName', 255, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('7485deed-e9e8-4aa6-338a-08da716a5c08', '18fbb18e-cb29-45d8-a5f3-c0121c57680a', 'f', 'f', 'f', 22, 'FlowNodeId', '', 'uniqueidentifier', 'Guid', 'FlowNodeId', 16, '', NULL, '2022-07-29 21:58:05', NULL, '2022-07-29 21:58:05');
INSERT INTO "public"."low_code_table_info" VALUES ('78757b0d-d9ee-45ea-d500-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 'f', 'f', 't', 115, 'ComponentName', '', 'nvarchar(255)', 'String', 'ComponentName', NULL, NULL, NULL, '2022-05-24 00:00:00', NULL, '2022-05-24 21:58:07');
INSERT INTO "public"."low_code_table_info" VALUES ('79d371fb-b37a-4d32-3390-08da716a5c08', '18fbb18e-cb29-45d8-a5f3-c0121c57680a', 'f', 'f', 'f', 25, 'State', '', 'int', 'Int32', 'State', 4, '', NULL, '2022-07-29 21:58:05', NULL, '2022-07-29 21:58:05');
INSERT INTO "public"."low_code_table_info" VALUES ('7b4df31f-36a3-477c-d4ba-08da3d8d5a26', '69edd8a8-1d24-478c-a909-b82039edcec0', 'f', 'f', 't', 187, 'Low_Code_TableId', '', 'uniqueidentifier', 'Guid', 'Low_Code_TableId', 16, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('7b6df0cd-c31b-4508-d53f-08da3d8d5a26', '8da38d20-8a09-4e81-8dd8-ed6702aee380', 't', 'f', 'f', 158, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('7b900baf-65df-4910-d4b1-08da3d8d5a26', '852f53ff-0d00-4c32-aa55-a9c11993751b', 'f', 'f', 't', 195, 'ForeignKeyTableFieldName', '', 'varchar(50)', 'String', 'ForeignKeyTableFieldName', 50, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('7c7400ed-ec08-4832-d4b6-08da3d8d5a26', '69edd8a8-1d24-478c-a909-b82039edcec0', 't', 'f', 'f', 184, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('7cbe8988-cbac-4ea2-d54a-08da3d8d5a26', '6323638b-a45f-4a76-886e-69a9e9be0901', 'f', 'f', 't', 168, 'LoginName', '', 'nvarchar(255)', 'String', 'LoginName', NULL, '登录名称', NULL, '2022-05-24 00:00:00', NULL, '2022-06-09 21:20:04');
INSERT INTO "public"."low_code_table_info" VALUES ('7ec46123-3852-4b62-2440-08da717dbcaa', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 'f', 'f', 't', 215, 'ControllerPath', '', 'varchar(50)', 'String', 'ControllerPath', 50, '', NULL, '2022-07-30 00:16:47', NULL, '2022-07-30 00:16:47');
INSERT INTO "public"."low_code_table_info" VALUES ('803c2d4b-4a80-43b0-244a-08da717dbcaa', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 'f', 'f', 't', 211, 'Remark', '', 'nvarchar(MAX)', 'String', 'Remark', -1, '', NULL, '2022-07-30 00:16:47', NULL, '2022-07-30 00:16:47');
INSERT INTO "public"."low_code_table_info" VALUES ('8237d289-05cf-485b-d4b8-08da3d8d5a26', '69edd8a8-1d24-478c-a909-b82039edcec0', 'f', 'f', 't', 185, 'LastModificationTime', '', 'datetime', 'DateTime', 'LastModificationTime', 8, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('825e69b9-cd33-4ab8-97b6-08da39a2ef6c', '3da5d264-2e8d-460c-a10c-ff9a6bb57a60', 'f', 'f', 't', 174, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', NULL, NULL, NULL, '2022-05-19 00:00:00', NULL, '2022-05-19 22:26:18');
INSERT INTO "public"."low_code_table_info" VALUES ('82ee25d2-4e01-4100-d4f9-08da3d8d5a26', '6fabc67a-8b48-49a6-8ba1-c8a32c499d36', 'f', 'f', 't', 106, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', 6, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('8326ca11-09f1-4c38-d4d6-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 'f', 'f', 't', 77, 'Introduce', '', 'nvarchar(255)', 'String', 'Introduce', NULL, '简介', NULL, '2022-05-24 00:00:00', NULL, '2022-06-08 21:20:04');
INSERT INTO "public"."low_code_table_info" VALUES ('837b058b-a88e-4107-d4dd-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 'f', 'f', 't', 79, 'UserId', '所属用户', 'uniqueidentifier', 'Guid', 'UserId', NULL, '所属用户', NULL, '2022-05-24 00:00:00', NULL, '2022-06-08 21:20:04');
INSERT INTO "public"."low_code_table_info" VALUES ('84a87e33-8b66-4b9a-d4f5-08da3d8d5a26', 'af37f705-7ba0-4883-b1be-8a274ea4c026', 'f', 'f', 't', 95, 'Sort', '排序号', 'int', 'Int32', 'Sort', 4, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('86b95bf0-4418-46ba-d4cb-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 'f', 'f', 't', 201, 'IsIdentity', '', 'bit', 'Boolean', 'IsIdentity', 1, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('897a208c-2e13-46f1-d4d7-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 'f', 'f', 't', 81, 'LastModificationTime', '更新时间', 'datetime2', 'DateTime', 'LastModificationTime', NULL, '更新时间', NULL, '2022-05-24 00:00:00', NULL, '2022-06-08 21:20:04');
INSERT INTO "public"."low_code_table_info" VALUES ('8ad408db-b5aa-4cb7-d494-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 'f', 'f', 't', 43, 'CreationTime', '', 'datetime', 'DateTime', 'CreationTime', 8, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('8e5f9439-6b90-423a-2447-08da717dbcaa', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 'f', 'f', 'f', 204, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', 8, '', NULL, '2022-07-30 00:16:47', NULL, '2022-07-30 00:16:47');
INSERT INTO "public"."low_code_table_info" VALUES ('8f107c7c-e4f5-4647-338f-08da716a5c08', '18fbb18e-cb29-45d8-a5f3-c0121c57680a', 'f', 'f', 'f', 24, 'SortMore', '', 'int', 'Int32', 'SortMore', 4, '', NULL, '2022-07-29 21:58:05', NULL, '2022-07-29 21:58:05');
INSERT INTO "public"."low_code_table_info" VALUES ('9059bf44-23a0-4e12-3399-08da716a5c08', '7f94e0db-fc63-40dc-bfe3-18c5aad75975', 'f', 'f', 'f', 36, 'UserId', '', 'uniqueidentifier', 'Guid', 'UserId', 16, '', NULL, '2022-07-29 21:58:05', NULL, '2022-07-29 21:58:05');
INSERT INTO "public"."low_code_table_info" VALUES ('92bc9094-160e-4338-d4a4-08da3d8d5a26', '7ad3b915-f0bd-443a-89cd-42d41dd6c554', 'f', 'f', 't', 59, 'UserId', '审批人Id', 'uniqueidentifier', 'Guid', 'UserId', 16, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('92c1fffc-5a00-468c-d4b0-08da3d8d5a26', '852f53ff-0d00-4c32-aa55-a9c11993751b', 'f', 'f', 't', 191, 'CreationTime', '', 'datetime', 'DateTime', 'CreationTime', 8, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('95414873-486d-4609-338e-08da716a5c08', '18fbb18e-cb29-45d8-a5f3-c0121c57680a', 'f', 'f', 'f', 21, 'Sort', '', 'int', 'Int32', 'Sort', 4, '', NULL, '2022-07-29 21:58:05', NULL, '2022-07-29 21:58:05');
INSERT INTO "public"."low_code_table_info" VALUES ('97284d66-88b9-478f-d4e5-08da3d8d5a26', 'e79db53b-7162-4669-9b5e-f860501475ac', 't', 'f', 'f', 82, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('9a050102-6300-46ef-d516-08da3d8d5a26', '2ae9e532-7d9a-474b-b629-50a39945c44d', 'f', 'f', 't', 131, 'Remark', '', 'varchar(100)', 'String', 'Remark', 100, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('9a850f29-2dd2-4779-d4f6-08da3d8d5a26', 'af37f705-7ba0-4883-b1be-8a274ea4c026', 'f', 'f', 't', 97, 'Value', '值', 'varchar(255)', 'String', 'Value', 255, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('9b1b319a-e9dc-406d-d4c4-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 't', 'f', 'f', 196, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('9bc385e0-10ee-4299-d4a9-08da3d8d5a26', 'ae6d94d8-6a15-4348-b600-aa17e4b61718', 'f', 'f', 't', 64, 'FlowId', '', 'uniqueidentifier', 'Guid', 'FlowId', 16, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('9c4158f4-b5b5-4928-d50f-08da3d8d5a26', '2ae9e532-7d9a-474b-b629-50a39945c44d', 't', 'f', 'f', 124, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('9c9f9672-3fa0-4c65-d4e9-08da3d8d5a26', 'e79db53b-7162-4669-9b5e-f860501475ac', 'f', 'f', 't', 85, 'RoleId', '', 'uniqueidentifier', 'Guid', 'RoleId', 16, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('9de60dd7-a403-442d-d4e7-08da3d8d5a26', 'e79db53b-7162-4669-9b5e-f860501475ac', 'f', 'f', 't', 83, 'LastModificationTime', '', 'datetime', 'DateTime', 'LastModificationTime', 8, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('a06381ef-e532-4b7a-2442-08da717dbcaa', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 'f', 'f', 't', 209, 'DisplayName', '', 'nvarchar(MAX)', 'String', 'DisplayName', -1, '', NULL, '2022-07-30 00:16:47', NULL, '2022-07-30 00:16:47');
INSERT INTO "public"."low_code_table_info" VALUES ('a0fdeb45-c9fe-439b-d48a-08da3d8d5a26', 'd8948c56-c5bd-4061-b272-5417375f38f0', 'f', 'f', 't', 39, 'FlowCode', '流程编码', 'varchar(255)', 'String', 'FlowCode', 255, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('a2660342-556e-4aef-d4b4-08da3d8d5a26', '852f53ff-0d00-4c32-aa55-a9c11993751b', 'f', 'f', 't', 193, 'Low_Code_Table_InfoId', '', 'uniqueidentifier', 'Guid', 'Low_Code_Table_InfoId', 16, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('a29e0236-9c06-4a70-d4b7-08da3d8d5a26', '69edd8a8-1d24-478c-a909-b82039edcec0', 'f', 'f', 't', 186, 'CreationTime', '', 'datetime', 'DateTime', 'CreationTime', 8, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('a61101b5-8e66-4456-d4fa-08da3d8d5a26', '6fabc67a-8b48-49a6-8ba1-c8a32c499d36', 'f', 'f', 't', 105, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', 6, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('a62bb184-93b0-40e3-d51b-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 'f', 'f', 't', 13, 'ControllerDisplayName', '', 'varchar(255)', 'String', 'ControllerDisplayName', 255, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('a6752bd9-f3d6-451f-d547-08da3d8d5a26', '6323638b-a45f-4a76-886e-69a9e9be0901', 'f', 'f', 't', 172, 'DeleteLock', '', 'bit', 'Boolean', 'DeleteLock', NULL, '删除锁', NULL, '2022-05-24 00:00:00', NULL, '2022-06-09 21:20:04');
INSERT INTO "public"."low_code_table_info" VALUES ('a7263191-1e30-42c5-3396-08da716a5c08', '7f94e0db-fc63-40dc-bfe3-18c5aad75975', 'f', 'f', 'f', 34, 'FlowNodeId', '', 'uniqueidentifier', 'Guid', 'FlowNodeId', 16, '', NULL, '2022-07-29 21:58:05', NULL, '2022-07-29 21:58:05');
INSERT INTO "public"."low_code_table_info" VALUES ('a72c0341-82e8-48ad-d481-08da3d8d5a26', '1a8df018-79f8-4e26-b4eb-4b735aae7275', 't', 'f', 'f', 24, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('a8be7873-7ce4-4cb2-d498-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 'f', 'f', 't', 49, 'OpinIons', '步骤审批意见', 'varchar(255)', 'String', 'OpinIons', 255, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('a908815c-c0e6-4565-d512-08da3d8d5a26', '2ae9e532-7d9a-474b-b629-50a39945c44d', 'f', 'f', 't', 130, 'FunctionName', '', 'varchar(100)', 'String', 'FunctionName', 100, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('a932f1ce-a55a-480b-d520-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 'f', 'f', 't', 2, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', 6, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('a9766bbb-21bf-46da-d54f-08da3d8d5a26', '69b24f04-0ed3-45fc-91d9-0dc929175a57', 't', 'f', 'f', 174, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('aaa312a2-73fb-4c84-d496-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 'f', 'f', 't', 46, 'FlowNodeName', '审批流节点名称', 'varchar(255)', 'String', 'FlowNodeName', 255, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('aaa5fae3-8c5b-4427-d4fb-08da3d8d5a26', '6fabc67a-8b48-49a6-8ba1-c8a32c499d36', 'f', 'f', 't', 102, 'Name', '', 'nvarchar(255)', 'String', 'Name', 255, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('aaecfda3-f48d-4cd5-244d-08da717dbcaa', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 'f', 'f', 't', 214, 'ServicePath', '', 'varchar(50)', 'String', 'ServicePath', 50, '', NULL, '2022-07-30 00:16:47', NULL, '2022-07-30 00:16:47');
INSERT INTO "public"."low_code_table_info" VALUES ('ab5c0b3d-8871-42fd-d4f1-08da3d8d5a26', 'af37f705-7ba0-4883-b1be-8a274ea4c026', 'f', 't', 'f', 92, 'Id', 'id', 'int', 'Int32', 'Id', 4, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('aba55ad7-7153-4658-d4f2-08da3d8d5a26', 'af37f705-7ba0-4883-b1be-8a274ea4c026', 'f', 'f', 't', 93, 'LastModificationTime', '更新时间', 'datetime', 'DateTime', 'LastModificationTime', 8, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('acf079d0-3db9-43f7-d490-08da3d8d5a26', 'd8948c56-c5bd-4061-b272-5417375f38f0', 'f', 'f', 't', 34, 'UserId', '发起人Id', 'uniqueidentifier', 'Guid', 'UserId', 16, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('ae55fabc-3944-4a36-d49f-08da3d8d5a26', '7ad3b915-f0bd-443a-89cd-42d41dd6c554', 'f', 'f', 't', 55, 'CreationTime', '', 'datetime', 'DateTime', 'CreationTime', 8, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('b1f89f8d-8e22-4c4a-d504-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 'f', 'f', 't', 120, 'KeepAlive', '', 'bit', 'Boolean', 'KeepAlive', 1, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('b24ac0e3-71ab-4d48-d541-08da3d8d5a26', '8da38d20-8a09-4e81-8dd8-ed6702aee380', 'f', 'f', 't', 162, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', 6, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('b52a9e8c-dffb-40b7-d506-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 'f', 'f', 't', 110, 'LevelCode', '', 'varchar(50)', 'String', 'LevelCode', NULL, NULL, NULL, '2022-05-24 00:00:00', NULL, '2022-05-24 21:58:07');
INSERT INTO "public"."low_code_table_info" VALUES ('b6422cb6-498e-4ff5-d4e6-08da3d8d5a26', 'e79db53b-7162-4669-9b5e-f860501475ac', 'f', 'f', 't', 84, 'CreationTime', '', 'datetime', 'DateTime', 'CreationTime', 8, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('b754af63-f1de-4000-d4a0-08da3d8d5a26', '7ad3b915-f0bd-443a-89cd-42d41dd6c554', 'f', 'f', 't', 56, 'FlowApprovalStepId', '步骤Id', 'uniqueidentifier', 'Guid', 'FlowApprovalStepId', 16, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('b755e2af-1164-47de-2444-08da717dbcaa', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 'f', 'f', 't', 216, 'IndexVuePath', '', 'varchar(50)', 'String', 'IndexVuePath', 50, '', NULL, '2022-07-30 00:16:47', NULL, '2022-07-30 00:16:47');
INSERT INTO "public"."low_code_table_info" VALUES ('b76500c1-91f8-4e44-d531-08da3d8d5a26', '0a8bdb18-758a-4798-9ffc-e7031dcbf262', 'f', 'f', 't', 145, 'Code', '', 'nvarchar(255)', 'String', 'Code', 255, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('b7fbb61f-94fc-4242-d4d3-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 'f', 'f', 't', 75, 'Birthday', '', 'datetime2', 'DateTime', 'Birthday', NULL, '生日', NULL, '2022-05-24 00:00:00', NULL, '2022-06-08 21:20:04');
INSERT INTO "public"."low_code_table_info" VALUES ('b9bbab1d-0a03-4d07-d488-08da3d8d5a26', 'd8948c56-c5bd-4061-b272-5417375f38f0', 't', 'f', 'f', 31, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('b9bfca2e-f72b-4a3f-d52f-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 'f', 'f', 't', 139, 'State', '', 'int', 'Int32', 'State', NULL, NULL, NULL, '2022-05-24 00:00:00', NULL, '2022-06-09 21:20:26');
INSERT INTO "public"."low_code_table_info" VALUES ('ba392537-c1c5-4ecc-d517-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 't', 'f', 'f', 1, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('bbac9a7c-6e62-4fe6-d4ef-08da3d8d5a26', 'af37f705-7ba0-4883-b1be-8a274ea4c026', 'f', 'f', 't', 96, 'Code', '编码', 'varchar(255)', 'String', 'Code', 255, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('be481209-565b-4099-d53c-08da3d8d5a26', 'f3d7bbb3-c1fb-4d61-92a4-9bc101811335', 'f', 'f', 't', 155, 'Name', '', 'nvarchar(255)', 'String', 'Name', 255, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('be6f08b8-b14b-4253-2441-08da717dbcaa', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 'f', 'f', 'f', 205, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', 8, '', NULL, '2022-07-30 00:16:47', NULL, '2022-07-30 00:16:47');
INSERT INTO "public"."low_code_table_info" VALUES ('bf24a276-6ed0-49d4-d4d9-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 'f', 'f', 't', 71, 'Number', '', 'nvarchar(255)', 'String', 'Number', NULL, '编号', NULL, '2022-05-24 00:00:00', NULL, '2022-06-08 21:20:04');
INSERT INTO "public"."low_code_table_info" VALUES ('bf3dbedf-ade0-4e20-338d-08da716a5c08', '18fbb18e-cb29-45d8-a5f3-c0121c57680a', 'f', 'f', 't', 26, 'Opinions', '', 'nvarchar(MAX)', 'String', 'Opinions', -1, '', NULL, '2022-07-29 21:58:05', NULL, '2022-07-29 21:58:05');
INSERT INTO "public"."low_code_table_info" VALUES ('c1ae4945-25fc-45e9-3388-08da716a5c08', '18fbb18e-cb29-45d8-a5f3-c0121c57680a', 'f', 'f', 'f', 29, 'ApprovalDate', '', 'datetime2', 'DateTime', 'ApprovalDate', 8, '', NULL, '2022-07-29 21:58:05', NULL, '2022-07-29 21:58:05');
INSERT INTO "public"."low_code_table_info" VALUES ('c2f1a286-2b35-41d6-d4af-08da3d8d5a26', '852f53ff-0d00-4c32-aa55-a9c11993751b', 't', 'f', 'f', 189, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('c6042620-d052-4a60-2448-08da717dbcaa', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 'f', 'f', 't', 213, 'ModelPath', '', 'varchar(50)', 'String', 'ModelPath', 50, '', NULL, '2022-07-30 00:16:47', NULL, '2022-07-30 00:16:47');
INSERT INTO "public"."low_code_table_info" VALUES ('c7b2ad1d-ecb0-4497-d515-08da3d8d5a26', '2ae9e532-7d9a-474b-b629-50a39945c44d', 'f', 'f', 't', 127, 'Number', '', 'int', 'Int32', 'Number', 4, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('c82d5132-6cda-463e-d54e-08da3d8d5a26', '6323638b-a45f-4a76-886e-69a9e9be0901', 'f', 'f', 't', 170, 'Phone', '', 'nvarchar(255)', 'String', 'Phone', NULL, '联系电话', NULL, '2022-05-24 00:00:00', NULL, '2022-06-09 21:20:04');
INSERT INTO "public"."low_code_table_info" VALUES ('ca605278-6972-48b4-d51f-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 'f', 'f', 't', 5, 'Ip', 'ip地址', 'varchar(255)', 'String', 'Ip', 255, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('caae5d6f-f9c7-4edb-d48d-08da3d8d5a26', 'd8948c56-c5bd-4061-b272-5417375f38f0', 'f', 'f', 't', 37, 'FormId', '表单Id', 'varchar(50)', 'String', 'FormId', 50, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('caff37bf-4e91-4934-2449-08da717dbcaa', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 'f', 'f', 't', 212, 'ProjectRootPath', '', 'varchar(50)', 'String', 'ProjectRootPath', 50, '', NULL, '2022-07-30 00:16:47', NULL, '2022-07-30 00:16:47');
INSERT INTO "public"."low_code_table_info" VALUES ('cb4a19d3-35dd-416d-3394-08da716a5c08', '7f94e0db-fc63-40dc-bfe3-18c5aad75975', 'f', 'f', 'f', 39, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', 8, '', NULL, '2022-07-29 21:58:05', NULL, '2022-07-29 21:58:05');
INSERT INTO "public"."low_code_table_info" VALUES ('cb5f9ecf-9317-4b11-d553-08da3d8d5a26', '69b24f04-0ed3-45fc-91d9-0dc929175a57', 'f', 'f', 't', 175, 'UserId', '', 'uniqueidentifier', 'Guid', 'UserId', 16, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('cbd75568-2ece-4f90-d49b-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 'f', 'f', 't', 48, 'State', '步骤状态（待审批、同意、不同意、回退升级审批）', 'int', 'Int32', 'State', 4, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('ccc3f055-79c4-4e63-3397-08da716a5c08', '7f94e0db-fc63-40dc-bfe3-18c5aad75975', 'f', 'f', 't', 35, 'FlowNodeName', '', 'nvarchar(MAX)', 'String', 'FlowNodeName', -1, '', NULL, '2022-07-29 21:58:05', NULL, '2022-07-29 21:58:05');
INSERT INTO "public"."low_code_table_info" VALUES ('ce802713-74f5-4f30-d527-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 'f', 'f', 't', 138, 'Email', '', 'nvarchar(255)', 'String', 'Email', NULL, NULL, NULL, '2022-05-24 00:00:00', NULL, '2022-06-09 21:20:26');
INSERT INTO "public"."low_code_table_info" VALUES ('cf2e3691-ab88-4420-d529-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 'f', 'f', 't', 136, 'Leader', '', 'nvarchar(255)', 'String', 'Leader', NULL, NULL, NULL, '2022-05-24 00:00:00', NULL, '2022-06-09 21:20:26');
INSERT INTO "public"."low_code_table_info" VALUES ('cf99d60b-2392-493c-d4ce-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 'f', 'f', 't', 197, 'LastModificationTime', '', 'datetime', 'DateTime', 'LastModificationTime', 8, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('d0fbf229-7204-4494-d50c-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 'f', 'f', 't', 121, 'State', '', 'bit', 'Boolean', 'State', 1, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('d1eb49cf-c053-4226-d4d8-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 'f', 'f', 't', 72, 'Name', '', 'nvarchar(255)', 'String', 'Name', NULL, '会员名称', NULL, '2022-05-24 00:00:00', NULL, '2022-06-08 21:20:04');
INSERT INTO "public"."low_code_table_info" VALUES ('d41bd8db-1b3f-48fa-d543-08da3d8d5a26', '8da38d20-8a09-4e81-8dd8-ed6702aee380', 'f', 'f', 't', 160, 'MenuId', '', 'int', 'Int32', 'MenuId', 4, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('d45ac420-e348-4d6b-d4aa-08da3d8d5a26', 'ae6d94d8-6a15-4348-b600-aa17e4b61718', 'f', 'f', 't', 62, 'LastModificationTime', '', 'datetime', 'DateTime', 'LastModificationTime', 8, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('d48c70e6-4549-41b6-d4a2-08da3d8d5a26', '7ad3b915-f0bd-443a-89cd-42d41dd6c554', 'f', 'f', 't', 58, 'FlowNodeName', '审批节点名称', 'varchar(500)', 'String', 'FlowNodeName', 500, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('d550fb44-f912-434e-3395-08da716a5c08', '7f94e0db-fc63-40dc-bfe3-18c5aad75975', 'f', 'f', 'f', 33, 'FlowApprovalStepHistoryId', '', 'uniqueidentifier', 'Guid', 'FlowApprovalStepHistoryId', 16, '', NULL, '2022-07-29 21:58:05', NULL, '2022-07-29 21:58:05');
INSERT INTO "public"."low_code_table_info" VALUES ('d5e76d95-beed-43c9-3398-08da716a5c08', '7f94e0db-fc63-40dc-bfe3-18c5aad75975', 'f', 'f', 'f', 38, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', 8, '', NULL, '2022-07-29 21:58:05', NULL, '2022-07-29 21:58:05');
INSERT INTO "public"."low_code_table_info" VALUES ('d6008705-0d21-42ac-d525-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 't', 't', 'f', 132, 'Id', '', 'int', 'Int32', 'Id', NULL, NULL, NULL, '2022-05-24 00:00:00', NULL, '2022-06-09 21:20:26');
INSERT INTO "public"."low_code_table_info" VALUES ('db4510e1-40d2-4db4-338c-08da716a5c08', '18fbb18e-cb29-45d8-a5f3-c0121c57680a', 'f', 'f', 'f', 30, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', 8, '', NULL, '2022-07-29 21:58:05', NULL, '2022-07-29 21:58:05');
INSERT INTO "public"."low_code_table_info" VALUES ('dbe000fc-4895-42f2-d53e-08da3d8d5a26', 'f3d7bbb3-c1fb-4d61-92a4-9bc101811335', 'f', 'f', 't', 156, 'Remark', '', 'nvarchar(255)', 'String', 'Remark', 255, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('dd367fd5-2030-43b2-d53d-08da3d8d5a26', 'f3d7bbb3-c1fb-4d61-92a4-9bc101811335', 'f', 'f', 't', 154, 'Number', '', 'int', 'Int32', 'Number', 4, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('de43269d-d43b-4a77-d4d0-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 'f', 'f', 't', 209, 'MaxLength', '', 'int', 'Int32', 'MaxLength', 4, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('de898f57-abe7-4d2c-d4ed-08da3d8d5a26', '524e71b4-cbf7-4248-8b29-3f99b43f2eb2', 'f', 'f', 't', 90, 'SysDataAuthorityId', '', 'uniqueidentifier', 'Guid', 'SysDataAuthorityId', 16, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('df559c6b-6f60-467c-d4ea-08da3d8d5a26', '524e71b4-cbf7-4248-8b29-3f99b43f2eb2', 't', 'f', 'f', 87, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('e0e9d3c3-b713-419c-d4c7-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 'f', 'f', 't', 208, 'CsField', '', 'varchar(50)', 'String', 'CsField', 50, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('e1316750-62a4-46aa-d4f7-08da3d8d5a26', '6fabc67a-8b48-49a6-8ba1-c8a32c499d36', 't', 'f', 'f', 100, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('e346cf76-ec76-4409-d49e-08da3d8d5a26', '7ad3b915-f0bd-443a-89cd-42d41dd6c554', 't', 'f', 'f', 53, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('e36410b5-cb7c-4fc3-d54d-08da3d8d5a26', '6323638b-a45f-4a76-886e-69a9e9be0901', 'f', 'f', 't', 169, 'Password', '', 'nvarchar(255)', 'String', 'Password', NULL, '密码', NULL, '2022-05-24 00:00:00', NULL, '2022-06-09 21:20:04');
INSERT INTO "public"."low_code_table_info" VALUES ('e4245f5f-bffa-43f0-d4d5-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 'f', 'f', 't', 78, 'FilePath', '文件地址', 'nvarchar(255)', 'String', 'FilePath', NULL, '文件地址', NULL, '2022-05-24 00:00:00', NULL, '2022-06-08 21:20:04');
INSERT INTO "public"."low_code_table_info" VALUES ('e4dd55f0-9697-43ae-d513-08da3d8d5a26', '2ae9e532-7d9a-474b-b629-50a39945c44d', 'f', 'f', 't', 125, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', 6, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('e5418d61-916f-45fd-d549-08da3d8d5a26', '6323638b-a45f-4a76-886e-69a9e9be0901', 'f', 'f', 't', 165, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', NULL, '更新时间', NULL, '2022-05-24 00:00:00', NULL, '2022-06-09 21:20:04');
INSERT INTO "public"."low_code_table_info" VALUES ('e571fd26-b1a8-4648-d4ae-08da3d8d5a26', 'ae6d94d8-6a15-4348-b600-aa17e4b61718', 'f', 'f', 't', 66, 'Sort', '', 'int', 'Int32', 'Sort', 4, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('e67fd0c6-a997-4956-d49c-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 'f', 'f', 't', 50, 'UserId', '步骤审批人Id', 'uniqueidentifier', 'Guid', 'UserId', 16, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('e74c1f4b-af12-4eaa-d507-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 'f', 'f', 't', 112, 'Name', '', 'nvarchar(255)', 'String', 'Name', NULL, NULL, NULL, '2022-05-24 00:00:00', NULL, '2022-05-24 21:58:07');
INSERT INTO "public"."low_code_table_info" VALUES ('e75b8650-ee49-4f83-d4d2-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 't', 'f', 'f', 70, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', NULL, NULL, NULL, '2022-05-24 00:00:00', NULL, '2022-06-08 21:20:04');
INSERT INTO "public"."low_code_table_info" VALUES ('e7facee2-5132-4003-d4b2-08da3d8d5a26', '852f53ff-0d00-4c32-aa55-a9c11993751b', 'f', 'f', 't', 194, 'ForeignKeyTableId', '', 'uniqueidentifier', 'Guid', 'ForeignKeyTableId', 16, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('e8e60481-fb7f-4f1d-d499-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 'f', 'f', 't', 44, 'Sort', '步骤顺序号', 'int', 'Int32', 'Sort', 4, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('ea63351c-c203-4d40-d52e-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 'f', 'f', 't', 137, 'Phone', '', 'nvarchar(255)', 'String', 'Phone', NULL, NULL, NULL, '2022-05-24 00:00:00', NULL, '2022-06-09 21:20:26');
INSERT INTO "public"."low_code_table_info" VALUES ('eb846ac3-723e-4207-d4c8-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 'f', 'f', 't', 207, 'CsType', '', 'varchar(50)', 'String', 'CsType', 50, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('ee8ca902-4e27-40c5-d518-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 'f', 'f', 't', 14, 'ActionDisplayName', '', 'varchar(255)', 'String', 'ActionDisplayName', 255, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('f00cde73-2294-40d6-d48c-08da3d8d5a26', 'd8948c56-c5bd-4061-b272-5417375f38f0', 'f', 'f', 't', 40, 'FlowName', '流程名称', 'varchar(255)', 'String', 'FlowName', 255, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('f029b676-48ac-4ba3-d509-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 'f', 'f', 't', 117, 'ParentId', '', 'int', 'Int32', 'ParentId', 4, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('f03ac01c-e0cf-4f13-d4db-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 'f', 'f', 't', 76, 'Photo', '', 'nvarchar(255)', 'String', 'Photo', NULL, '头像', NULL, '2022-05-24 00:00:00', NULL, '2022-06-08 21:20:04');
INSERT INTO "public"."low_code_table_info" VALUES ('f21d4c33-e65a-4dfe-d487-08da3d8d5a26', '1a8df018-79f8-4e26-b4eb-4b735aae7275', 'f', 'f', 't', 30, 'Remark', '备注', 'nvarchar(255)', 'String', 'Remark', 255, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('f221da94-0a1d-4ce7-d4cf-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 'f', 'f', 't', 199, 'Low_Code_TableId', '', 'uniqueidentifier', 'Guid', 'Low_Code_TableId', 16, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('f24f0e45-209e-46b7-d544-08da3d8d5a26', '8da38d20-8a09-4e81-8dd8-ed6702aee380', 'f', 'f', 't', 159, 'RoleId', '', 'uniqueidentifier', 'Guid', 'RoleId', 16, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('f5193134-b39d-4ca0-d502-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 'f', 'f', 't', 116, 'Icon', '', 'nvarchar(255)', 'String', 'Icon', NULL, NULL, NULL, '2022-05-24 00:00:00', NULL, '2022-05-24 21:58:07');
INSERT INTO "public"."low_code_table_info" VALUES ('f5c93cc7-50a6-4e0e-d492-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 't', 'f', 'f', 41, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('f6d23541-2fca-40e6-d493-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 'f', 'f', 't', 52, 'ApprovalDate', '审批时间', 'datetime', 'DateTime', 'ApprovalDate', 8, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');
INSERT INTO "public"."low_code_table_info" VALUES ('f731ccd3-9a9c-4dda-d550-08da3d8d5a26', '69b24f04-0ed3-45fc-91d9-0dc929175a57', 'f', 'f', 't', 178, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', 6, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('f9fd0e13-4e5d-42b4-d4fc-08da3d8d5a26', '6fabc67a-8b48-49a6-8ba1-c8a32c499d36', 'f', 'f', 't', 101, 'Number', '', 'int', 'Int32', 'Number', 4, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('fbf2d2c1-454b-4898-d510-08da3d8d5a26', '2ae9e532-7d9a-474b-b629-50a39945c44d', 'f', 'f', 't', 126, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', 6, NULL, NULL, '2022-05-24 21:57:34', NULL, '2022-05-24 21:57:34');
INSERT INTO "public"."low_code_table_info" VALUES ('fd9abf54-3c88-44b0-d484-08da3d8d5a26', '1a8df018-79f8-4e26-b4eb-4b735aae7275', 'f', 'f', 't', 25, 'LastModificationTime', '', 'datetime', 'DateTime', 'LastModificationTime', 8, NULL, NULL, '2022-05-24 21:57:33', NULL, '2022-05-24 21:57:33');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS "public"."member";
CREATE TABLE "public"."member" (
  "Id" uuid NOT NULL,
  "Number" text COLLATE "pg_catalog"."default",
  "Name" text COLLATE "pg_catalog"."default",
  "Phone" text COLLATE "pg_catalog"."default",
  "Sex" text COLLATE "pg_catalog"."default",
  "Birthday" timestamp(6) NOT NULL,
  "Photo" text COLLATE "pg_catalog"."default",
  "Introduce" text COLLATE "pg_catalog"."default",
  "FilePath" text COLLATE "pg_catalog"."default",
  "UserId" uuid NOT NULL,
  "CreatorUserId" uuid,
  "CreationTime" timestamp(6) NOT NULL,
  "LastModifierUserId" uuid,
  "LastModificationTime" timestamp(6)
)
;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO "public"."member" VALUES ('96a1aa3d-a61a-42d0-954a-c71753fb2065', '123', '123', '123', '女', '2018-04-25 23:00:00', '[{"uid":"d80bbe3d-7296-4eb9-965a-cb3f03d3def7","name":"time_000335_old_name_微信图片_20200413162625.jpg","percent":100,"status":"done","thumbUrl":"/upload/files/20220731/time_000335_old_name_微信图片_20200413162625.jpg","url":"/upload/files/20220731/time_000335_old_name_微信图片_20200413162625.jpg"}]', '<p>123</p>', '[{"uid":"a6778e9d-6c2e-4d23-91c9-d0d10756d177","name":"time_000345_old_name_hzy.png","percent":100,"status":"done","thumbUrl":"/upload/files/20220731/time_000345_old_name_hzy.png","url":"/upload/files/20220731/time_000345_old_name_hzy.png"}]', 'ac18f496-e93d-42f0-b59e-e321acc85335', NULL, '2020-10-24 00:07:42', NULL, '2022-07-31 00:03:48');
INSERT INTO "public"."member" VALUES ('9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', '1', '测试会员', '18510912123', '男', '2019-07-08 11:47:24', '[{"uid":"6f5aed63-0fdc-4752-9c2b-3f66cbfa77bf","name":"time_000222_old_name_微信图片_20200521081252.jpg","percent":100,"status":"done","thumbUrl":"/upload/files/20220731/time_000222_old_name_微信图片_20200521081252.jpg","url":"/upload/files/20220731/time_000222_old_name_微信图片_20200521081252.jpg"}]', '<p>999888</p>', '[{"uid":"35828ad6-cbba-4bcb-9c97-141d5b31acc7","name":"time_000320_old_name_Ko.js增删改查例子.txt","percent":100,"status":"done","thumbUrl":"/upload/files/20220731/time_000320_old_name_Ko.js增删改查例子.txt","url":"/upload/files/20220731/time_000320_old_name_Ko.js增删改查例子.txt"}]', 'ac18f496-e93d-42f0-b59e-e321acc85335', NULL, '2018-04-25 23:00:00', NULL, '2022-07-31 00:03:23');

-- ----------------------------
-- Table structure for sys_data_authority
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_data_authority";
CREATE TABLE "public"."sys_data_authority" (
  "Id" uuid NOT NULL,
  "PermissionType" int4 NOT NULL,
  "RoleId" uuid NOT NULL,
  "CreatorUserId" uuid,
  "CreationTime" timestamp(6) NOT NULL,
  "LastModifierUserId" uuid,
  "LastModificationTime" timestamp(6)
)
;

-- ----------------------------
-- Records of sys_data_authority
-- ----------------------------
INSERT INTO "public"."sys_data_authority" VALUES ('0228a5b5-2202-4ba0-6e48-08da205da7b7', 5, '18fa4771-6f58-46a3-80d2-6f0f5e9972e3', NULL, '2022-04-17 18:33:04', NULL, '2022-04-17 18:33:04');
INSERT INTO "public"."sys_data_authority" VALUES ('d09bf250-c5b0-41cb-237d-08da00442990', 5, '40ff1844-c099-4061-98e0-cd6e544fcfd3', NULL, '2022-03-07 22:09:58', NULL, '2022-07-06 21:53:17');

-- ----------------------------
-- Table structure for sys_data_authority_custom
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_data_authority_custom";
CREATE TABLE "public"."sys_data_authority_custom" (
  "Id" uuid NOT NULL,
  "SysDataAuthorityId" uuid,
  "SysOrganizationId" int4 NOT NULL,
  "CreatorUserId" uuid,
  "CreationTime" timestamp(6) NOT NULL,
  "LastModifierUserId" uuid,
  "LastModificationTime" timestamp(6)
)
;

-- ----------------------------
-- Records of sys_data_authority_custom
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dictionary
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_dictionary";
CREATE TABLE "public"."sys_dictionary" (
  "Id" int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
),
  "Sort" int4 NOT NULL,
  "Code" text COLLATE "pg_catalog"."default",
  "Name" text COLLATE "pg_catalog"."default",
  "Value" text COLLATE "pg_catalog"."default",
  "ParentId" int4,
  "CreatorUserId" uuid,
  "CreationTime" timestamp(6) NOT NULL,
  "LastModifierUserId" uuid,
  "LastModificationTime" timestamp(6)
)
;

-- ----------------------------
-- Records of sys_dictionary
-- ----------------------------
INSERT INTO "public"."sys_dictionary" VALUES (1, 1, 'news_type', '资讯类别', NULL, NULL, NULL, '2021-07-25 22:31:30', NULL, '2021-07-25 22:39:34');
INSERT INTO "public"."sys_dictionary" VALUES (2, 1, 'news_type_nan', '男', '1', 1, NULL, '2021-07-25 22:38:49', NULL, '2021-07-25 22:40:30');
INSERT INTO "public"."sys_dictionary" VALUES (3, 2, 'news_type_nv', '女', '2', 1, NULL, '2021-07-25 22:40:47', NULL, '2022-07-06 21:55:30');
INSERT INTO "public"."sys_dictionary" VALUES (4, 0, '3', '未知', '3', 1, NULL, '2022-06-29 20:55:46', NULL, '2022-06-29 20:55:46');

-- ----------------------------
-- Table structure for sys_function
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_function";
CREATE TABLE "public"."sys_function" (
  "Id" uuid NOT NULL,
  "Number" int4,
  "Name" text COLLATE "pg_catalog"."default",
  "ByName" text COLLATE "pg_catalog"."default",
  "Remark" text COLLATE "pg_catalog"."default",
  "CreatorUserId" uuid,
  "CreationTime" timestamp(6) NOT NULL,
  "LastModifierUserId" uuid,
  "LastModificationTime" timestamp(6)
)
;

-- ----------------------------
-- Records of sys_function
-- ----------------------------
INSERT INTO "public"."sys_function" VALUES ('2401f4d0-60b0-4e2e-903f-84c603373572', 70, '导出', 'Export', 'Export', NULL, '2016-06-20 13:40:52', NULL, '2021-04-18 22:08:06');
INSERT INTO "public"."sys_function" VALUES ('383e7ee2-7690-46ac-9230-65155c84aa30', 50, '保存', 'Save', 'Save', NULL, '2016-06-20 13:40:52', NULL, '2021-04-18 22:08:06');
INSERT INTO "public"."sys_function" VALUES ('9c388461-2704-4c5e-a729-72c17e9018e1', 40, '删除', 'Delete', 'Delete', NULL, '2016-06-20 13:40:52', NULL, '2021-04-18 22:08:06');
INSERT INTO "public"."sys_function" VALUES ('b6fd5425-504a-46a9-993b-2f8dc9158eb8', 80, '打印', 'Print', 'Print', NULL, '2022-06-16 17:28:00', NULL, '2021-04-18 22:08:06');
INSERT INTO "public"."sys_function" VALUES ('bffefb1c-8988-4ddf-b4ac-81c2b30e80cd', 20, '添加', 'Insert', 'Insert', NULL, '2016-06-20 13:40:52', NULL, '2021-04-18 22:08:06');
INSERT INTO "public"."sys_function" VALUES ('c9518758-b2e1-4f51-b517-5282e273889c', 10, '显示', 'Display', 'Display', NULL, '2016-06-20 13:40:52', NULL, '2021-04-18 22:08:06');
INSERT INTO "public"."sys_function" VALUES ('e7ef2a05-8317-41c3-b588-99519fe88bf9', 30, '修改', 'Update', 'Update', NULL, '2016-06-20 13:40:52', NULL, '2021-04-18 22:08:06');
INSERT INTO "public"."sys_function" VALUES ('f27ecb0a-197d-47b1-b243-59a8c71302bf', 60, '检索', 'Search', 'Search', NULL, '2016-06-20 13:40:52', NULL, '2021-04-18 22:08:06');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_menu";
CREATE TABLE "public"."sys_menu" (
  "Id" int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
),
  "LevelCode" text COLLATE "pg_catalog"."default",
  "Number" int4,
  "Name" text COLLATE "pg_catalog"."default",
  "ComponentName" text COLLATE "pg_catalog"."default",
  "Url" text COLLATE "pg_catalog"."default",
  "Router" text COLLATE "pg_catalog"."default",
  "JumpUrl" text COLLATE "pg_catalog"."default",
  "Icon" text COLLATE "pg_catalog"."default",
  "ParentId" int4,
  "Show" bool NOT NULL,
  "Close" bool NOT NULL,
  "KeepAlive" bool NOT NULL,
  "State" bool NOT NULL,
  "Type" int4 NOT NULL,
  "CreatorUserId" uuid,
  "CreationTime" timestamp(6) NOT NULL,
  "LastModifierUserId" uuid,
  "LastModificationTime" timestamp(6)
)
;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO "public"."sys_menu" VALUES (1, '1', 10, '更多示例', NULL, NULL, NULL, NULL, 'MoreOutlined', NULL, 't', 't', 't', 't', 1, NULL, '2021-05-28 11:49:02', NULL, '2022-03-04 12:25:39');
INSERT INTO "public"."sys_menu" VALUES (3, '1.3', 30, '按钮', 'ButtonCom', 'views/example/Button.vue', '/button', NULL, 'AppstoreOutlined', 1, 't', 't', 't', 't', 2, NULL, '2020-12-17 14:58:05', NULL, '2022-03-04 12:26:14');
INSERT INTO "public"."sys_menu" VALUES (4, '1.4', 40, '图表 AntV G2', NULL, NULL, NULL, NULL, 'PieChartOutlined', 1, 't', 't', 't', 't', 1, NULL, '2021-01-16 16:06:33', NULL, '2022-03-04 12:26:21');
INSERT INTO "public"."sys_menu" VALUES (5, '1.4.5', 10, '基础图表', 'ChartBaseCom', 'views/example/chart/Base.vue', '/chart/base', NULL, NULL, 4, 't', 't', 't', 't', 2, NULL, '2021-01-16 16:07:24', NULL, '2022-03-04 12:26:25');
INSERT INTO "public"."sys_menu" VALUES (6, '1.4.6', 20, '更多图表', 'ChartMoreCom', 'views/example/chart/More.vue', '/chart/more', NULL, NULL, 4, 't', 't', 't', 't', 2, NULL, '2021-01-16 16:10:06', NULL, '2022-03-04 12:26:28');
INSERT INTO "public"."sys_menu" VALUES (7, '1.7', 50, '表格管理', NULL, NULL, NULL, NULL, 'TableOutlined', 1, 't', 't', 't', 't', 1, NULL, '2018-03-10 12:16:38', NULL, '2022-03-04 12:26:34');
INSERT INTO "public"."sys_menu" VALUES (8, '1.7.8', 100, '基础列表', 'BaseListCom', 'views/example/BaseList.vue', '/base/list', NULL, NULL, 7, 't', 't', 't', 't', 2, NULL, '2020-12-17 14:49:12', NULL, '2022-03-04 12:26:38');
INSERT INTO "public"."sys_menu" VALUES (9, '1.7.9', 110, '标准表格', 'ListIndexCom', 'views/example/list/Index.vue', '/list', NULL, NULL, 7, 't', 't', 't', 't', 2, NULL, '2020-12-17 14:51:07', NULL, '2022-03-04 12:26:41');
INSERT INTO "public"."sys_menu" VALUES (10, '1.10', 60, '富文本编辑器', 'EditorCom', 'views/example/Editor.vue', '/editor', NULL, 'PicRightOutlined', 1, 't', 't', 't', 't', 2, NULL, '2021-01-18 19:34:28', NULL, '2022-03-04 12:26:46');
INSERT INTO "public"."sys_menu" VALUES (11, '1.11', 70, '跳转外部地址', 'ExternalJumpCom', 'components/ExternalJump.vue', '/external/jump/:path(.*)', 'https://antv.vision/zh', 'RadarChartOutlined', 1, 't', 't', 't', 't', 2, NULL, '2021-08-05 21:51:12', NULL, '2022-03-04 12:26:49');
INSERT INTO "public"."sys_menu" VALUES (12, '12', 50, '基础信息', NULL, NULL, NULL, NULL, 'GoldOutlined', NULL, 't', 't', 't', 't', 1, NULL, '2018-03-10 12:16:38', NULL, '2022-03-04 12:25:43');
INSERT INTO "public"."sys_menu" VALUES (13, '12.13', 10, '会员管理', 'base_member', 'views/base/member/Index.vue', '/base/member', NULL, 'UsergroupAddOutlined', 12, 't', 't', 't', 't', 2, NULL, '2018-03-10 12:16:38', NULL, '2022-03-04 12:26:55');
INSERT INTO "public"."sys_menu" VALUES (14, '14', 100, '系统管理', NULL, NULL, NULL, NULL, 'DesktopOutlined', NULL, 't', 't', 't', 't', 1, NULL, '2018-03-10 12:16:38', NULL, '2022-03-04 12:25:46');
INSERT INTO "public"."sys_menu" VALUES (15, '14.15', 100, '账户管理', 'system_user', 'views/system/user/Index.vue', '/system/user', NULL, 'UserOutlined', 14, 't', 't', 't', 't', 2, NULL, '2018-03-10 12:16:38', NULL, '2022-03-04 12:27:02');
INSERT INTO "public"."sys_menu" VALUES (16, '14.16', 110, '角色管理', 'system_role', 'views/system/role/Index.vue', '/system/role', NULL, 'TeamOutlined', 14, 't', 't', 't', 't', 2, NULL, '2018-03-10 12:16:38', NULL, '2022-04-22 22:24:03');
INSERT INTO "public"."sys_menu" VALUES (17, '14.17', 120, '功能管理', 'system_function', 'views/system/function/Index.vue', '/system/function', NULL, 'ControlOutlined', 14, 't', 't', 't', 't', 2, NULL, '2018-03-10 12:16:38', NULL, '2022-03-04 12:27:11');
INSERT INTO "public"."sys_menu" VALUES (19, '14.19', 150, '个人中心', 'system_personal_center', 'views/system/personal_center/Index.vue', '/system/personal/center', NULL, 'FormOutlined', 14, 't', 't', 't', 't', 2, NULL, '2018-03-10 12:16:38', NULL, '2022-03-04 12:27:19');
INSERT INTO "public"."sys_menu" VALUES (20, '14.20', 160, '岗位管理', 'system_post', 'views/system/post/Index.vue', '/system/post', NULL, 'IdcardOutlined', 14, 't', 't', 't', 't', 2, NULL, '2021-05-27 17:29:49', NULL, '2022-03-04 12:27:23');
INSERT INTO "public"."sys_menu" VALUES (21, '14.21', 170, '组织机构', 'system_organization', 'views/system/organization/Index.vue', '/system/organization', NULL, 'ClusterOutlined', 14, 't', 't', 't', 't', 2, NULL, '2021-05-27 20:27:56', NULL, '2022-03-04 12:27:27');
INSERT INTO "public"."sys_menu" VALUES (22, '29.22', 10, '接口文档', 'swagger', 'views/development_tool/Swagger.vue', '/development_tool/swagger', NULL, 'FileSearchOutlined', 29, 't', 't', 't', 't', 2, NULL, '2018-03-10 12:17:03', NULL, '2022-03-04 12:27:41');
INSERT INTO "public"."sys_menu" VALUES (23, '14.23', 190, '数据字典', 'system_dictionary', 'views/system/dictionary/Index.vue', '/system/dictionary', NULL, 'FileDoneOutlined', 14, 't', 't', 't', 't', 2, NULL, '2021-07-25 21:50:01', NULL, '2022-03-04 12:27:31');
INSERT INTO "public"."sys_menu" VALUES (24, '14.24', 200, '操作日志', 'sys_operation_log', 'views/system/sys_operation_log/Index.vue', '/system/sys_operation_log', '', 'ContainerOutlined', 14, 't', 't', 't', 't', 2, NULL, '2021-08-05 21:24:54', NULL, '2022-03-04 12:27:35');
INSERT INTO "public"."sys_menu" VALUES (25, '14.25', 130, '菜单功能', 'system_menu', 'views/system/menu/Index.vue', '/system/menu', NULL, 'MenuOutlined', 14, 't', 't', 't', 't', 2, NULL, '2018-03-10 12:16:38', NULL, '2022-03-04 12:27:15');
INSERT INTO "public"."sys_menu" VALUES (28, '1.28', 1, 'Vxe-Table', 'VxeTableCom', 'views/example/VxeTable.vue', '/vxe/table', NULL, 'BorderlessTableOutlined', 1, 't', 't', 't', 't', 2, NULL, '2021-12-29 17:13:26', NULL, '2022-03-04 12:26:00');
INSERT INTO "public"."sys_menu" VALUES (29, '29', 200, '开发工具', NULL, NULL, NULL, NULL, 'CodepenOutlined', NULL, 't', 't', 't', 't', 1, NULL, '2022-01-12 14:17:21', NULL, '2022-03-04 12:25:49');
INSERT INTO "public"."sys_menu" VALUES (30, '29.30', 20, '定时任务', 'TimedTaskCom', 'views/development_tool/timed_task/Index.vue', '/development_tool/timed_task', NULL, 'FieldTimeOutlined', 29, 't', 't', 't', 't', 2, NULL, '2022-01-12 14:22:04', NULL, '2022-03-04 12:27:44');
INSERT INTO "public"."sys_menu" VALUES (31, '29.31', 30, '代码生成', 'LowCode', 'views/development_tool/low_code/Index.vue', '/development-tool/low-code', NULL, 'CodeTwoTone', 29, 't', 't', 't', 't', 2, NULL, '2022-01-12 15:39:46', NULL, '2022-05-24 22:05:57');
INSERT INTO "public"."sys_menu" VALUES (32, '1.32', 20, '图标展示', 'IconsVue', 'views/example/Icons.vue', '/icons', NULL, 'TagsTwoTone', 1, 't', 't', 't', 't', 2, NULL, '2022-02-24 10:51:38', NULL, '2022-03-18 12:06:38');
INSERT INTO "public"."sys_menu" VALUES (33, '29.33', 40, 'EFCore监控台', 'monitor_ef_core', 'views/development_tool/monitor_ef_core/Index.vue', '/development_tool/monitor/efcore', NULL, 'DashboardFilled', 29, 't', 't', 't', 't', 2, NULL, '2022-04-10 10:55:41', NULL, '2022-04-10 10:56:17');
INSERT INTO "public"."sys_menu" VALUES (36, '12.13.36', 1, '详情', 'base_member_info_Details', 'views/base/member/components/Details.vue', '/base/member/details/:id/:title', NULL, NULL, 13, 'f', 't', 't', 't', 2, NULL, '2022-04-17 17:45:25', NULL, '2022-04-17 17:49:13');
INSERT INTO "public"."sys_menu" VALUES (2, '1.2', 10, '查看更多组件', 'AppComponentsCom', 'views/example/AppComponents.vue', '/app/components', NULL, 'LayoutOutlined', 1, 't', 't', 't', 't', 2, NULL, '2021-01-16 16:05:22', NULL, '2022-03-18 12:06:20');

-- ----------------------------
-- Table structure for sys_menu_function
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_menu_function";
CREATE TABLE "public"."sys_menu_function" (
  "Id" uuid NOT NULL,
  "Number" int4,
  "MenuId" int4 NOT NULL,
  "FunctionCode" text COLLATE "pg_catalog"."default",
  "FunctionName" text COLLATE "pg_catalog"."default",
  "Remark" text COLLATE "pg_catalog"."default",
  "CreatorUserId" uuid,
  "CreationTime" timestamp(6) NOT NULL,
  "LastModifierUserId" uuid,
  "LastModificationTime" timestamp(6)
)
;

-- ----------------------------
-- Records of sys_menu_function
-- ----------------------------
INSERT INTO "public"."sys_menu_function" VALUES ('0073cce2-ff42-496c-9ff6-08da204fcecb', 10, 36, 'Display', '显示', 'Display', NULL, '2022-04-17 20:40:12', NULL, '2022-04-17 20:40:12');
INSERT INTO "public"."sys_menu_function" VALUES ('01d95cc7-bc8c-4735-b331-08da716b6134', 50, 38, 'Save', '保存', 'Save', NULL, '2022-07-29 22:16:34', NULL, '2022-07-29 22:16:34');
INSERT INTO "public"."sys_menu_function" VALUES ('0984a2e1-3722-41d4-0f6d-08d9fdad00ab', 70, 23, 'Export', '导出', 'Export', NULL, '2022-03-04 15:25:50', NULL, '2022-03-04 15:25:50');
INSERT INTO "public"."sys_menu_function" VALUES ('09b50a32-5748-408c-b32e-08da716b6134', 20, 38, 'Insert', '添加', 'Insert', NULL, '2022-07-29 22:16:34', NULL, '2022-07-29 22:16:34');
INSERT INTO "public"."sys_menu_function" VALUES ('0a85e4fd-5a1c-47f6-0f60-08d9fdad00ab', 20, 21, 'Insert', '添加', 'Insert', NULL, '2022-03-04 15:25:40', NULL, '2022-03-04 15:25:40');
INSERT INTO "public"."sys_menu_function" VALUES ('0ad6a459-1d9d-4512-0f32-08d9fdad00ab', 40, 15, 'Delete', '删除', 'Delete', NULL, '2022-03-04 15:25:14', NULL, '2022-03-04 15:25:14');
INSERT INTO "public"."sys_menu_function" VALUES ('0b27e69f-af16-4481-0f44-08d9fdad00ab', 60, 17, 'Search', '检索', 'Search', NULL, '2022-03-04 15:25:21', NULL, '2022-03-04 15:25:21');
INSERT INTO "public"."sys_menu_function" VALUES ('0caa6e7d-92b0-4814-0f46-08d9fdad00ab', 80, 17, 'Print', '打印', 'Print', NULL, '2022-03-04 15:25:21', NULL, '2022-03-04 15:25:21');
INSERT INTO "public"."sys_menu_function" VALUES ('106fb69a-8bb5-4559-0f29-08d9fdad00ab', 30, 13, 'Update', '修改', 'Update', NULL, '2022-03-04 15:25:07', NULL, '2022-03-04 15:25:07');
INSERT INTO "public"."sys_menu_function" VALUES ('13f3f74d-c6fc-4488-0f2f-08d9fdad00ab', 10, 15, 'Display', '显示', 'Display', NULL, '2022-03-04 15:25:14', NULL, '2022-03-04 15:25:14');
INSERT INTO "public"."sys_menu_function" VALUES ('14783a71-e265-4d6b-0f3b-08d9fdad00ab', 50, 16, 'Save', '保存', 'Save', NULL, '2022-04-22 22:24:03', NULL, '2022-04-22 22:24:03');
INSERT INTO "public"."sys_menu_function" VALUES ('1cb6fbe1-4a6c-4aad-0f22-08d9fdad00ab', 10, 6, 'Display', '显示', 'Display', NULL, '2022-03-04 15:24:34', NULL, '2022-03-04 15:24:34');
INSERT INTO "public"."sys_menu_function" VALUES ('1d831d57-6634-45d7-0f6e-08d9fdad00ab', 80, 23, 'Print', '打印', 'Print', NULL, '2022-03-04 15:25:50', NULL, '2022-03-04 15:25:50');
INSERT INTO "public"."sys_menu_function" VALUES ('1e69df5d-d1e9-4bc8-0f4d-08d9fdad00ab', 70, 25, 'Export', '导出', 'Export', NULL, '2022-03-04 15:25:28', NULL, '2022-03-04 15:25:28');
INSERT INTO "public"."sys_menu_function" VALUES ('20ab5395-d57c-49db-0f4a-08d9fdad00ab', 40, 25, 'Delete', '删除', 'Delete', NULL, '2022-03-04 15:25:28', NULL, '2022-03-04 15:25:28');
INSERT INTO "public"."sys_menu_function" VALUES ('2186550d-246c-4552-e2d8-08d9fdefa8f8', 60, 24, 'Search', '检索', 'Search', NULL, '2022-03-04 23:00:02', NULL, '2022-03-04 23:00:02');
INSERT INTO "public"."sys_menu_function" VALUES ('22a675f6-efda-481d-0f59-08d9fdad00ab', 30, 20, 'Update', '修改', 'Update', NULL, '2022-03-04 15:25:36', NULL, '2022-03-04 15:25:36');
INSERT INTO "public"."sys_menu_function" VALUES ('2469188c-21de-492a-0f5e-08d9fdad00ab', 80, 20, 'Print', '打印', 'Print', NULL, '2022-03-04 15:25:36', NULL, '2022-03-04 15:25:36');
INSERT INTO "public"."sys_menu_function" VALUES ('25774728-1c9a-476a-b329-08da716b6134', 50, 37, 'Save', '保存', 'Save', NULL, '2022-07-29 22:35:08', NULL, '2022-07-29 22:35:08');
INSERT INTO "public"."sys_menu_function" VALUES ('299c81a3-66a6-4ff2-b32f-08da716b6134', 30, 38, 'Update', '修改', 'Update', NULL, '2022-07-29 22:16:34', NULL, '2022-07-29 22:16:34');
INSERT INTO "public"."sys_menu_function" VALUES ('2fea8f87-2a13-4c95-0f3c-08d9fdad00ab', 60, 16, 'Search', '检索', 'Search', NULL, '2022-04-22 22:24:03', NULL, '2022-04-22 22:24:03');
INSERT INTO "public"."sys_menu_function" VALUES ('33c80938-82c8-4299-0f12-08d9fdad00ab', 10, 30, 'Display', '显示', 'Display', NULL, '2022-03-04 15:17:09', NULL, '2022-03-04 15:17:09');
INSERT INTO "public"."sys_menu_function" VALUES ('377b961c-3dee-445a-b328-08da716b6134', 40, 37, 'Delete', '删除', 'Delete', NULL, '2022-07-29 22:35:08', NULL, '2022-07-29 22:35:08');
INSERT INTO "public"."sys_menu_function" VALUES ('37d3e492-62da-47a4-0f33-08d9fdad00ab', 50, 15, 'Save', '保存', 'Save', NULL, '2022-03-04 15:25:14', NULL, '2022-03-04 15:25:14');
INSERT INTO "public"."sys_menu_function" VALUES ('38b4704d-7c5d-4f89-a2e7-08da3d8e6577', 60, 31, 'Search', '检索', 'Search', NULL, '2022-05-24 22:05:57', NULL, '2022-05-24 22:05:57');
INSERT INTO "public"."sys_menu_function" VALUES ('38f4d17c-d4a1-44f3-b334-08da716b6134', 80, 38, 'Print', '打印', 'Print', NULL, '2022-07-29 22:16:34', NULL, '2022-07-29 22:16:34');
INSERT INTO "public"."sys_menu_function" VALUES ('3bc0e68f-d03d-4e99-0f26-08d9fdad00ab', 10, 11, 'Display', '显示', 'Display', NULL, '2022-03-04 15:24:53', NULL, '2022-03-04 15:24:53');
INSERT INTO "public"."sys_menu_function" VALUES ('3cb3cbc7-9e45-4cc3-0f62-08d9fdad00ab', 40, 21, 'Delete', '删除', 'Delete', NULL, '2022-03-04 15:25:40', NULL, '2022-03-04 15:25:40');
INSERT INTO "public"."sys_menu_function" VALUES ('3e44c6f5-e090-40a1-0f58-08d9fdad00ab', 20, 20, 'Insert', '添加', 'Insert', NULL, '2022-03-04 15:25:36', NULL, '2022-03-04 15:25:36');
INSERT INTO "public"."sys_menu_function" VALUES ('3f6d0af7-5386-4d3a-0f71-08d9fdad00ab', 10, 28, 'Display', '显示', 'Display', NULL, '2022-03-04 15:40:52', NULL, '2022-03-04 15:40:52');
INSERT INTO "public"."sys_menu_function" VALUES ('41cb1942-573a-4d63-0f4b-08d9fdad00ab', 50, 25, 'Save', '保存', 'Save', NULL, '2022-03-04 15:25:28', NULL, '2022-03-04 15:25:28');
INSERT INTO "public"."sys_menu_function" VALUES ('437fbf85-8704-4e87-0f3d-08d9fdad00ab', 70, 16, 'Export', '导出', 'Export', NULL, '2022-04-22 22:24:03', NULL, '2022-04-22 22:24:03');
INSERT INTO "public"."sys_menu_function" VALUES ('45e2ca86-4823-4fb9-0f57-08d9fdad00ab', 10, 20, 'Display', '显示', 'Display', NULL, '2022-03-04 15:25:36', NULL, '2022-03-04 15:25:36');
INSERT INTO "public"."sys_menu_function" VALUES ('48f0a694-0539-4e69-a2e4-08da3d8e6577', 10, 31, 'Display', '显示', 'Display', NULL, '2022-05-24 22:05:57', NULL, '2022-05-24 22:05:57');
INSERT INTO "public"."sys_menu_function" VALUES ('4a67fcdb-a7a9-4e3c-0f49-08d9fdad00ab', 30, 25, 'Update', '修改', 'Update', NULL, '2022-03-04 15:25:28', NULL, '2022-03-04 15:25:28');
INSERT INTO "public"."sys_menu_function" VALUES ('4bbbe120-0cc6-4a08-0f4e-08d9fdad00ab', 80, 25, 'Print', '打印', 'Print', NULL, '2022-03-04 15:25:28', NULL, '2022-03-04 15:25:28');
INSERT INTO "public"."sys_menu_function" VALUES ('4dbf096d-d3d3-4565-a2e5-08da3d8e6577', 40, 31, 'Delete', '删除', 'Delete', NULL, '2022-05-24 22:05:57', NULL, '2022-05-24 22:05:57');
INSERT INTO "public"."sys_menu_function" VALUES ('523b53b5-8159-4a16-0f2b-08d9fdad00ab', 50, 13, 'Save', '保存', 'Save', NULL, '2022-03-04 15:25:07', NULL, '2022-03-04 15:25:07');
INSERT INTO "public"."sys_menu_function" VALUES ('53fdb4a0-ca6e-4568-0f3f-08d9fdad00ab', 10, 17, 'Display', '显示', 'Display', NULL, '2022-03-04 15:25:21', NULL, '2022-03-04 15:25:21');
INSERT INTO "public"."sys_menu_function" VALUES ('541d9045-47b2-4629-0f2e-08d9fdad00ab', 80, 13, 'Print', '打印', 'Print', NULL, '2022-03-04 15:25:07', NULL, '2022-03-04 15:25:07');
INSERT INTO "public"."sys_menu_function" VALUES ('54743c86-ac73-4345-0f5d-08d9fdad00ab', 70, 20, 'Export', '导出', 'Export', NULL, '2022-03-04 15:25:36', NULL, '2022-03-04 15:25:36');
INSERT INTO "public"."sys_menu_function" VALUES ('550f874b-e804-44a0-0f37-08d9fdad00ab', 10, 16, 'Display', '显示', 'Display', NULL, '2022-04-22 22:24:03', NULL, '2022-04-22 22:24:03');
INSERT INTO "public"."sys_menu_function" VALUES ('55750f56-edc9-4771-e2d6-08d9fdefa8f8', 10, 24, 'Display', '显示', 'Display', NULL, '2022-03-04 23:00:02', NULL, '2022-03-04 23:00:02');
INSERT INTO "public"."sys_menu_function" VALUES ('5e4e87bd-c179-4b5b-0f5c-08d9fdad00ab', 60, 20, 'Search', '检索', 'Search', NULL, '2022-03-04 15:25:36', NULL, '2022-03-04 15:25:36');
INSERT INTO "public"."sys_menu_function" VALUES ('616c4e4a-fb61-49cf-0f5b-08d9fdad00ab', 50, 20, 'Save', '保存', 'Save', NULL, '2022-03-04 15:25:36', NULL, '2022-03-04 15:25:36');
INSERT INTO "public"."sys_menu_function" VALUES ('628c6e8c-3fc6-4dd0-b327-08da716b6134', 30, 37, 'Update', '修改', 'Update', NULL, '2022-07-29 22:35:08', NULL, '2022-07-29 22:35:08');
INSERT INTO "public"."sys_menu_function" VALUES ('687254ae-0d76-4788-a4e8-08da1a9d9949', 10, 33, 'Display', '显示', 'Display', NULL, '2022-04-10 10:56:17', NULL, '2022-04-10 10:56:17');
INSERT INTO "public"."sys_menu_function" VALUES ('69da651e-787b-42e5-0f5a-08d9fdad00ab', 40, 20, 'Delete', '删除', 'Delete', NULL, '2022-03-04 15:25:36', NULL, '2022-03-04 15:25:36');
INSERT INTO "public"."sys_menu_function" VALUES ('6b009415-eadf-4dab-0f3e-08d9fdad00ab', 80, 16, 'Print', '打印', 'Print', NULL, '2022-04-22 22:24:03', NULL, '2022-04-22 22:24:03');
INSERT INTO "public"."sys_menu_function" VALUES ('6b209d5a-b366-4a61-0f63-08d9fdad00ab', 50, 21, 'Save', '保存', 'Save', NULL, '2022-03-04 15:25:40', NULL, '2022-03-04 15:25:40');
INSERT INTO "public"."sys_menu_function" VALUES ('6c09c0c0-72fa-4842-0f1f-08d9fdad00ab', 10, 32, 'Display', '显示', 'Display', NULL, '2022-03-18 12:06:38', NULL, '2022-03-18 12:06:38');
INSERT INTO "public"."sys_menu_function" VALUES ('7694fbf5-e28d-424c-e2d7-08d9fdefa8f8', 40, 24, 'Delete', '删除', 'Delete', NULL, '2022-03-04 23:00:02', NULL, '2022-03-04 23:00:02');
INSERT INTO "public"."sys_menu_function" VALUES ('7890cc93-ded0-4c18-b325-08da716b6134', 10, 37, 'Display', '显示', 'Display', NULL, '2022-07-29 22:35:08', NULL, '2022-07-29 22:35:08');
INSERT INTO "public"."sys_menu_function" VALUES ('7e0f6c84-d7f1-4243-0f4c-08d9fdad00ab', 60, 25, 'Search', '检索', 'Search', NULL, '2022-03-04 15:25:28', NULL, '2022-03-04 15:25:28');
INSERT INTO "public"."sys_menu_function" VALUES ('7ea8f706-bfe5-42b2-0f42-08d9fdad00ab', 40, 17, 'Delete', '删除', 'Delete', NULL, '2022-03-04 15:25:21', NULL, '2022-03-04 15:25:21');
INSERT INTO "public"."sys_menu_function" VALUES ('823ac05d-65e4-4216-0f39-08d9fdad00ab', 30, 16, 'Update', '修改', 'Update', NULL, '2022-04-22 22:24:03', NULL, '2022-04-22 22:24:03');
INSERT INTO "public"."sys_menu_function" VALUES ('8564e4d8-d7f4-4f12-0f31-08d9fdad00ab', 30, 15, 'Update', '修改', 'Update', NULL, '2022-03-04 15:25:14', NULL, '2022-03-04 15:25:14');
INSERT INTO "public"."sys_menu_function" VALUES ('86465238-c51c-45d5-0f40-08d9fdad00ab', 20, 17, 'Insert', '添加', 'Insert', NULL, '2022-03-04 15:25:21', NULL, '2022-03-04 15:25:21');
INSERT INTO "public"."sys_menu_function" VALUES ('86ff83fd-d34a-4290-0f41-08d9fdad00ab', 30, 17, 'Update', '修改', 'Update', NULL, '2022-03-04 15:25:21', NULL, '2022-03-04 15:25:21');
INSERT INTO "public"."sys_menu_function" VALUES ('8d82d688-77dd-4ca6-b326-08da716b6134', 20, 37, 'Insert', '添加', 'Insert', NULL, '2022-07-29 22:35:08', NULL, '2022-07-29 22:35:08');
INSERT INTO "public"."sys_menu_function" VALUES ('92b39a10-3927-4ee7-0f6a-08d9fdad00ab', 40, 23, 'Delete', '删除', 'Delete', NULL, '2022-03-04 15:25:50', NULL, '2022-03-04 15:25:50');
INSERT INTO "public"."sys_menu_function" VALUES ('9426768e-b90d-41e1-0f67-08d9fdad00ab', 10, 23, 'Display', '显示', 'Display', NULL, '2022-03-04 15:25:50', NULL, '2022-03-04 15:25:50');
INSERT INTO "public"."sys_menu_function" VALUES ('a03d56d7-4b0d-47cc-0f6b-08d9fdad00ab', 50, 23, 'Save', '保存', 'Save', NULL, '2022-03-04 15:25:50', NULL, '2022-03-04 15:25:50');
INSERT INTO "public"."sys_menu_function" VALUES ('a1ddd02f-8c21-4d79-0f21-08d9fdad00ab', 10, 5, 'Display', '显示', 'Display', NULL, '2022-03-04 15:24:30', NULL, '2022-03-04 15:24:30');
INSERT INTO "public"."sys_menu_function" VALUES ('a3754771-f6e9-4a23-0f2c-08d9fdad00ab', 60, 13, 'Search', '检索', 'Search', NULL, '2022-03-04 15:25:07', NULL, '2022-03-04 15:25:07');
INSERT INTO "public"."sys_menu_function" VALUES ('a46e07d3-c722-4548-0f35-08d9fdad00ab', 70, 15, 'Export', '导出', 'Export', NULL, '2022-03-04 15:25:14', NULL, '2022-03-04 15:25:14');
INSERT INTO "public"."sys_menu_function" VALUES ('a63be630-ac04-40aa-b32a-08da716b6134', 60, 37, 'Search', '检索', 'Search', NULL, '2022-07-29 22:35:08', NULL, '2022-07-29 22:35:08');
INSERT INTO "public"."sys_menu_function" VALUES ('a726455f-1c29-4be0-0f45-08d9fdad00ab', 70, 17, 'Export', '导出', 'Export', NULL, '2022-03-04 15:25:21', NULL, '2022-03-04 15:25:21');
INSERT INTO "public"."sys_menu_function" VALUES ('a7cd04db-bbe3-49b6-0f1e-08d9fdad00ab', 10, 2, 'Display', '显示', 'Display', NULL, '2022-03-18 12:06:20', NULL, '2022-03-18 12:06:20');
INSERT INTO "public"."sys_menu_function" VALUES ('a9503588-e6f7-420b-0f65-08d9fdad00ab', 70, 21, 'Export', '导出', 'Export', NULL, '2022-03-04 15:25:40', NULL, '2022-03-04 15:25:40');
INSERT INTO "public"."sys_menu_function" VALUES ('b3847204-1afa-4f58-b330-08da716b6134', 40, 38, 'Delete', '删除', 'Delete', NULL, '2022-07-29 22:16:34', NULL, '2022-07-29 22:16:34');
INSERT INTO "public"."sys_menu_function" VALUES ('b5881044-afb8-40b2-0f28-08d9fdad00ab', 20, 13, 'Insert', '添加', 'Insert', NULL, '2022-03-04 15:25:07', NULL, '2022-03-04 15:25:07');
INSERT INTO "public"."sys_menu_function" VALUES ('b7533a90-dae4-4263-0f24-08d9fdad00ab', 10, 9, 'Display', '显示', 'Display', NULL, '2022-03-04 15:24:43', NULL, '2022-03-04 15:24:43');
INSERT INTO "public"."sys_menu_function" VALUES ('b96f977c-a36e-4e7f-0f2d-08d9fdad00ab', 70, 13, 'Export', '导出', 'Export', NULL, '2022-03-04 15:25:07', NULL, '2022-03-04 15:25:07');
INSERT INTO "public"."sys_menu_function" VALUES ('b98a365e-6fb4-4efb-0f69-08d9fdad00ab', 30, 23, 'Update', '修改', 'Update', NULL, '2022-03-04 15:25:50', NULL, '2022-03-04 15:25:50');
INSERT INTO "public"."sys_menu_function" VALUES ('bd6ae6da-1ca6-46c2-0f3a-08d9fdad00ab', 40, 16, 'Delete', '删除', 'Delete', NULL, '2022-04-22 22:24:03', NULL, '2022-04-22 22:24:03');
INSERT INTO "public"."sys_menu_function" VALUES ('beb87004-5cfb-417a-0f34-08d9fdad00ab', 60, 15, 'Search', '检索', 'Search', NULL, '2022-03-04 15:25:14', NULL, '2022-03-04 15:25:14');
INSERT INTO "public"."sys_menu_function" VALUES ('bfc1476c-db0d-4db4-b32b-08da716b6134', 70, 37, 'Export', '导出', 'Export', NULL, '2022-07-29 22:35:08', NULL, '2022-07-29 22:35:08');
INSERT INTO "public"."sys_menu_function" VALUES ('c67a0abe-daec-491b-0f38-08d9fdad00ab', 20, 16, 'Insert', '添加', 'Insert', NULL, '2022-04-22 22:24:03', NULL, '2022-04-22 22:24:03');
INSERT INTO "public"."sys_menu_function" VALUES ('c6ba141b-99ba-4114-0f5f-08d9fdad00ab', 10, 21, 'Display', '显示', 'Display', NULL, '2022-03-04 15:25:40', NULL, '2022-03-04 15:25:40');
INSERT INTO "public"."sys_menu_function" VALUES ('c77c812a-1601-4311-0f70-08d9fdad00ab', 10, 19, 'Display', '显示', 'Display', NULL, '2022-03-04 15:26:00', NULL, '2022-03-04 15:26:00');
INSERT INTO "public"."sys_menu_function" VALUES ('c8edbb79-567e-461b-0f36-08d9fdad00ab', 80, 15, 'Print', '打印', 'Print', NULL, '2022-03-04 15:25:14', NULL, '2022-03-04 15:25:14');
INSERT INTO "public"."sys_menu_function" VALUES ('c9e5fff0-6744-47d7-0f66-08d9fdad00ab', 80, 21, 'Print', '打印', 'Print', NULL, '2022-03-04 15:25:40', NULL, '2022-03-04 15:25:40');
INSERT INTO "public"."sys_menu_function" VALUES ('cce82eb4-7fc5-4308-0f30-08d9fdad00ab', 20, 15, 'Insert', '添加', 'Insert', NULL, '2022-03-04 15:25:14', NULL, '2022-03-04 15:25:14');
INSERT INTO "public"."sys_menu_function" VALUES ('d2e6ea60-2cf6-478a-0f23-08d9fdad00ab', 10, 8, 'Display', '显示', 'Display', NULL, '2022-03-04 15:24:40', NULL, '2022-03-04 15:24:40');
INSERT INTO "public"."sys_menu_function" VALUES ('db3ab8bd-7709-41a2-0f47-08d9fdad00ab', 10, 25, 'Display', '显示', 'Display', NULL, '2022-03-04 15:25:28', NULL, '2022-03-04 15:25:28');
INSERT INTO "public"."sys_menu_function" VALUES ('ddd08d34-55a2-43eb-b32d-08da716b6134', 10, 38, 'Display', '显示', 'Display', NULL, '2022-07-29 22:16:34', NULL, '2022-07-29 22:16:34');
INSERT INTO "public"."sys_menu_function" VALUES ('dee401b1-e20e-496e-0f43-08d9fdad00ab', 50, 17, 'Save', '保存', 'Save', NULL, '2022-03-04 15:25:21', NULL, '2022-03-04 15:25:21');
INSERT INTO "public"."sys_menu_function" VALUES ('e2319118-42cc-41a2-0f6c-08d9fdad00ab', 60, 23, 'Search', '检索', 'Search', NULL, '2022-03-04 15:25:50', NULL, '2022-03-04 15:25:50');
INSERT INTO "public"."sys_menu_function" VALUES ('e991934a-0d30-416b-0f68-08d9fdad00ab', 20, 23, 'Insert', '添加', 'Insert', NULL, '2022-03-04 15:25:50', NULL, '2022-03-04 15:25:50');
INSERT INTO "public"."sys_menu_function" VALUES ('eb958545-6449-40db-0f27-08d9fdad00ab', 10, 13, 'Display', '显示', 'Display', NULL, '2022-03-04 15:25:07', NULL, '2022-03-04 15:25:07');
INSERT INTO "public"."sys_menu_function" VALUES ('ec535908-8671-4928-0f25-08d9fdad00ab', 10, 10, 'Display', '显示', 'Display', NULL, '2022-03-04 15:24:47', NULL, '2022-03-04 15:24:47');
INSERT INTO "public"."sys_menu_function" VALUES ('ef70b789-21ee-4850-0f1b-08d9fdad00ab', 10, 22, 'Display', '显示', 'Display', NULL, '2022-03-04 15:16:44', NULL, '2022-03-04 15:16:44');
INSERT INTO "public"."sys_menu_function" VALUES ('f36b9b06-2826-425f-0f64-08d9fdad00ab', 60, 21, 'Search', '检索', 'Search', NULL, '2022-03-04 15:25:40', NULL, '2022-03-04 15:25:40');
INSERT INTO "public"."sys_menu_function" VALUES ('f4621fbe-6b40-4454-0f2a-08d9fdad00ab', 40, 13, 'Delete', '删除', 'Delete', NULL, '2022-03-04 15:25:07', NULL, '2022-03-04 15:25:07');
INSERT INTO "public"."sys_menu_function" VALUES ('f4c73ac0-c66d-4988-0f61-08d9fdad00ab', 30, 21, 'Update', '修改', 'Update', NULL, '2022-03-04 15:25:40', NULL, '2022-03-04 15:25:40');
INSERT INTO "public"."sys_menu_function" VALUES ('f64cfe50-1ef1-457f-0f20-08d9fdad00ab', 10, 3, 'Display', '显示', 'Display', NULL, '2022-03-04 15:24:24', NULL, '2022-03-04 15:24:24');
INSERT INTO "public"."sys_menu_function" VALUES ('f8c7ee2c-842e-402e-b32c-08da716b6134', 80, 37, 'Print', '打印', 'Print', NULL, '2022-07-29 22:35:08', NULL, '2022-07-29 22:35:08');
INSERT INTO "public"."sys_menu_function" VALUES ('fc75b3a0-2a84-48f2-b332-08da716b6134', 60, 38, 'Search', '检索', 'Search', NULL, '2022-07-29 22:16:34', NULL, '2022-07-29 22:16:34');
INSERT INTO "public"."sys_menu_function" VALUES ('fccd54ab-9e7d-4184-b333-08da716b6134', 70, 38, 'Export', '导出', 'Export', NULL, '2022-07-29 22:16:34', NULL, '2022-07-29 22:16:34');
INSERT INTO "public"."sys_menu_function" VALUES ('fe6465bf-e429-45bd-0f48-08d9fdad00ab', 20, 25, 'Insert', '添加', 'Insert', NULL, '2022-03-04 15:25:28', NULL, '2022-03-04 15:25:28');

-- ----------------------------
-- Table structure for sys_operation_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_operation_log";
CREATE TABLE "public"."sys_operation_log" (
  "Id" uuid NOT NULL,
  "Api" text COLLATE "pg_catalog"."default",
  "Ip" text COLLATE "pg_catalog"."default",
  "Form" text COLLATE "pg_catalog"."default",
  "FormBody" text COLLATE "pg_catalog"."default",
  "QueryString" text COLLATE "pg_catalog"."default",
  "TakeUpTime" int8 NOT NULL,
  "Browser" text COLLATE "pg_catalog"."default",
  "OS" text COLLATE "pg_catalog"."default",
  "UserId" uuid,
  "ControllerDisplayName" text COLLATE "pg_catalog"."default",
  "ActionDisplayName" text COLLATE "pg_catalog"."default",
  "CreatorUserId" uuid,
  "CreationTime" timestamp(6) NOT NULL,
  "LastModifierUserId" uuid,
  "LastModificationTime" timestamp(6)
)
;

-- ----------------------------
-- Records of sys_operation_log
-- ----------------------------
INSERT INTO "public"."sys_operation_log" VALUES ('ecdae159-0743-4ce9-ae01-bfa414329602', '/', '0.0.0.1', '', '', '', 357, 'Edge105', 'Windows10', NULL, NULL, NULL, '00000000-0000-0000-0000-000000000000', '2022-09-20 20:41:25.64959', NULL, NULL);
INSERT INTO "public"."sys_operation_log" VALUES ('7a32b2f4-e375-4dbe-8fc1-a26337babd5d', '/api/admin/SysUser/info', '0.0.0.1', '', '', '', 641, 'Edge105', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', '系统账号', '获取用户信息', '00000000-0000-0000-0000-000000000000', '2022-09-20 20:41:27.272454', NULL, NULL);
INSERT INTO "public"."sys_operation_log" VALUES ('ebe3d05e-2316-4c71-af08-6cc31dfd25a2', '/hub/negotiate', '0.0.0.1', '', '', '?negotiateVersion=1', 29, 'Edge105', 'Windows10', NULL, NULL, NULL, '00000000-0000-0000-0000-000000000000', '2022-09-20 20:41:27.513331', NULL, NULL);
INSERT INTO "public"."sys_operation_log" VALUES ('1ef726d8-bbc6-4316-b51e-278a5ea67bb8', '/api/admin/SysOrganization/sysOrganizationTree', '0.0.0.1', '', '{}', '', 123, 'Edge105', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', '组织机构', '查看组织架构树', '00000000-0000-0000-0000-000000000000', '2022-09-20 20:41:34.901139', NULL, NULL);
INSERT INTO "public"."sys_operation_log" VALUES ('bf1f1077-6f25-4c2c-9085-e4fdf35f7d57', '/api/admin/SysUser/findList/10/1', '0.0.0.1', '', '{"name":null,"loginName":null,"organizationId":null}', '', 685, 'Edge105', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', '系统账号', '查看数据', '00000000-0000-0000-0000-000000000000', '2022-09-20 20:41:35.437804', NULL, NULL);
INSERT INTO "public"."sys_operation_log" VALUES ('8162438d-f7b3-46b5-8826-9f747b31c268', '/api/admin/SysRole/findList/10/1', '0.0.0.1', '', '{"name":null}', '', 92, 'Edge105', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', '角色', '查看表格', '00000000-0000-0000-0000-000000000000', '2022-09-20 20:41:35.653366', NULL, NULL);
INSERT INTO "public"."sys_operation_log" VALUES ('e6b95e4d-55f7-47f3-b1d6-5a00f49d0491', '/api/admin/SysFunction/findList/10/1', '0.0.0.1', '', '{"name":null}', '', 82, 'Edge105', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', '功能', '查看数据列表', '00000000-0000-0000-0000-000000000000', '2022-09-20 20:41:36.528226', NULL, NULL);
INSERT INTO "public"."sys_operation_log" VALUES ('2e3f7bfd-1729-4057-a5d9-1437bea0f0e1', '/api/admin/SysMenu/getAll', '0.0.0.1', '', '{"name":null}', '', 99, 'Edge105', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', '菜单', '获取所有的菜单', '00000000-0000-0000-0000-000000000000', '2022-09-20 20:41:37.368082', NULL, NULL);
INSERT INTO "public"."sys_operation_log" VALUES ('732cdbef-55f2-488a-97bc-34e9312a80cf', '/api/admin/SysPost/findList/10/1', '0.0.0.1', '', '{"name":null}', '', 97, 'Edge105', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', '岗位', '查看列表', '00000000-0000-0000-0000-000000000000', '2022-09-20 20:41:39.119846', NULL, NULL);
INSERT INTO "public"."sys_operation_log" VALUES ('5502cf23-1243-4bd2-912c-d8766a547ddf', '/api/admin/SysOrganization/findList/', '0.0.0.1', '', '{"name":null,"state":1}', '', 75, 'Edge105', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', '组织机构', '查看列表', '00000000-0000-0000-0000-000000000000', '2022-09-20 20:41:39.916321', NULL, NULL);
INSERT INTO "public"."sys_operation_log" VALUES ('0c48b3b7-d87f-46d9-a4d7-7ebf886be0bc', '/api/admin/SysDictionary/getDictionaryTree', '0.0.0.1', '', '', '', 131, 'Edge105', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', '数据字典', '获取字典树', '00000000-0000-0000-0000-000000000000', '2022-09-20 20:41:40.789487', NULL, NULL);
INSERT INTO "public"."sys_operation_log" VALUES ('370c0960-4ab2-4b92-b4b5-ecf9f08d3ce3', '/api/admin/SysDictionary/findList/10/1', '0.0.0.1', '', '{"name":null,"parentId":null}', '', 144, 'Edge105', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', '数据字典', '查看列表', '00000000-0000-0000-0000-000000000000', '2022-09-20 20:41:40.821608', NULL, NULL);
INSERT INTO "public"."sys_operation_log" VALUES ('e7d3a838-ffd7-45a4-966f-2c6272211816', '/api/admin/SysOperationLog/findList/10/1', '0.0.0.1', '', '{"name":null,"api":null,"browser":null,"ip":null,"os":null,"rangeTime":[],"startTime":null,"endTime":null}', '', 111, 'Edge105', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', '操作日志', '查看列表', '00000000-0000-0000-0000-000000000000', '2022-09-20 20:41:41.541626', NULL, NULL);
INSERT INTO "public"."sys_operation_log" VALUES ('f06e59d0-5f0d-4845-b255-b33b7d005a4f', '/api/admin/SysFunction/findForm/c9518758-b2e1-4f51-b517-5282e273889c', '0.0.0.1', '', '', '', 73, 'Edge105', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', '功能', '查看表单', '00000000-0000-0000-0000-000000000000', '2022-09-20 20:41:45.168638', NULL, NULL);
INSERT INTO "public"."sys_operation_log" VALUES ('c08bca52-77f4-4d02-aa0e-2a6102683625', '/api/admin/Member/findList/10/1', '0.0.0.1', '', '{"name":""}', '', 119, 'Edge105', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', '会员', '查看列表', '00000000-0000-0000-0000-000000000000', '2022-09-20 20:41:51.070374', NULL, NULL);
INSERT INTO "public"."sys_operation_log" VALUES ('522c8e3e-95b4-4806-ad3a-60656eae91a9', '/hub', '0.0.0.1', '', '', '?id=w3fxci2Y9i8rRelKC-ty2w', 27266, 'Edge105', 'Windows10', NULL, NULL, NULL, '00000000-0000-0000-0000-000000000000', '2022-09-20 20:41:55.095434', NULL, NULL);

-- ----------------------------
-- Table structure for sys_organization
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_organization";
CREATE TABLE "public"."sys_organization" (
  "Id" int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
),
  "Name" text COLLATE "pg_catalog"."default",
  "OrderNumber" int4,
  "LevelCode" text COLLATE "pg_catalog"."default",
  "Leader" text COLLATE "pg_catalog"."default",
  "Phone" text COLLATE "pg_catalog"."default",
  "Email" text COLLATE "pg_catalog"."default",
  "State" int4,
  "ParentId" int4,
  "CreatorUserId" uuid,
  "CreationTime" timestamp(6) NOT NULL,
  "LastModifierUserId" uuid,
  "LastModificationTime" timestamp(6)
)
;

-- ----------------------------
-- Records of sys_organization
-- ----------------------------
INSERT INTO "public"."sys_organization" VALUES (1, '阿里巴巴集团', 1, '1', 'hzy', '18410912184', '18410912184@qq.com', 1, NULL, NULL, '2021-05-27 20:50:31', NULL, '2021-05-27 20:50:31');
INSERT INTO "public"."sys_organization" VALUES (2, '北京分部', 3, '1.2', '北京分部', '132123', '13131', 1, 1, NULL, '2021-05-27 22:33:44', NULL, '2021-12-28 16:13:34');
INSERT INTO "public"."sys_organization" VALUES (3, '市场部门', 1, '1.2.3', '市场部门', '234124234', '234234@qq.com', 1, 2, NULL, '2021-05-27 22:33:57', NULL, '2021-05-27 22:33:57');
INSERT INTO "public"."sys_organization" VALUES (4, '财务部门', 2, '1.2.4', '财务部门', '435543535', '123@qq.com', 1, 2, NULL, '2021-05-27 22:34:11', NULL, '2021-05-27 22:34:11');
INSERT INTO "public"."sys_organization" VALUES (5, '成都分部', 2, '1.5', '成都分部', '123123123', '123@qq.com', 1, 1, NULL, '2021-05-27 21:01:50', NULL, '2021-05-27 22:31:45');
INSERT INTO "public"."sys_organization" VALUES (7, '研发部门', 1, '1.5.7', '研发部门', '1234323423', '12312@qq.com', 1, 5, NULL, '2021-05-27 22:32:08', NULL, '2021-05-27 22:32:29');
INSERT INTO "public"."sys_organization" VALUES (9, '运维部门', 4, '1.5.9', '运维部门', '1232133452', '12341@qq.com', 1, 5, NULL, '2021-05-27 22:33:25', NULL, '2022-03-08 17:07:47');
INSERT INTO "public"."sys_organization" VALUES (10, '测试部门', 3, '1.5.10', '测试部门', '12313', '123123@qq.com', 1, 5, NULL, '2021-05-27 22:32:59', NULL, '2021-05-27 22:32:59');
INSERT INTO "public"."sys_organization" VALUES (11, '技术部门', 2, '1.5.11', '技术部门', '12345678911', '12345678901@qq.com', 1, 5, NULL, '2022-03-08 17:00:20', NULL, '2022-03-08 17:07:37');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_post";
CREATE TABLE "public"."sys_post" (
  "Id" uuid NOT NULL,
  "Number" int4,
  "Code" text COLLATE "pg_catalog"."default",
  "Name" text COLLATE "pg_catalog"."default",
  "State" int4 NOT NULL,
  "Remarks" text COLLATE "pg_catalog"."default",
  "CreatorUserId" uuid,
  "CreationTime" timestamp(6) NOT NULL,
  "LastModifierUserId" uuid,
  "LastModificationTime" timestamp(6)
)
;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO "public"."sys_post" VALUES ('0716b4b0-9a06-43e9-8ae8-82c74875f83e', 2, 'se', '项目经理', 1, NULL, NULL, '2021-05-27 20:26:35', NULL, '2021-05-27 20:26:35');
INSERT INTO "public"."sys_post" VALUES ('96927c30-41d0-4ced-8e29-cbed35c90fb0', 1, 'ceo', '董事长', 1, NULL, NULL, '2021-05-27 20:26:22', NULL, '2021-05-27 20:26:22');
INSERT INTO "public"."sys_post" VALUES ('e46af329-6d08-442c-9837-f22cff954411', 4, 'user', '普通员工', 1, NULL, NULL, '2021-05-27 20:26:52', NULL, '2022-04-23 21:50:55');
INSERT INTO "public"."sys_post" VALUES ('f0bd38c2-f1de-4bd9-e2db-08da00a93622', 5, 'dotnet_engineer', 'DotNet软件工程师', 1, NULL, NULL, '2022-03-08 10:13:18', NULL, '2022-03-08 10:13:18');
INSERT INTO "public"."sys_post" VALUES ('f0c67537-8094-429a-b474-f54ac518609e', 3, 'hr', '人力资源', 1, NULL, NULL, '2021-05-27 20:26:44', NULL, '2021-05-27 20:26:44');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role";
CREATE TABLE "public"."sys_role" (
  "Id" uuid NOT NULL,
  "Number" int4,
  "Name" text COLLATE "pg_catalog"."default",
  "Remark" text COLLATE "pg_catalog"."default",
  "DeleteLock" bool NOT NULL,
  "CreatorUserId" uuid,
  "CreationTime" timestamp(6) NOT NULL,
  "LastModifierUserId" uuid,
  "LastModificationTime" timestamp(6)
)
;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO "public"."sys_role" VALUES ('18fa4771-6f58-46a3-80d2-6f0f5e9972e3', 1, '超级管理员', '拥有所有权限', 't', NULL, '2016-07-06 17:59:20', NULL, '2021-01-10 11:25:12');
INSERT INTO "public"."sys_role" VALUES ('40ff1844-c099-4061-98e0-cd6e544fcfd3', 2, '普通用户', '普通用户', 't', NULL, '2016-07-06 17:59:20', NULL, '2021-01-30 00:51:17');

-- ----------------------------
-- Table structure for sys_role_menu_function
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role_menu_function";
CREATE TABLE "public"."sys_role_menu_function" (
  "Id" uuid NOT NULL,
  "RoleId" uuid NOT NULL,
  "MenuId" int4 NOT NULL,
  "MenuFunctionId" uuid NOT NULL,
  "CreatorUserId" uuid,
  "CreationTime" timestamp(6) NOT NULL,
  "LastModifierUserId" uuid,
  "LastModificationTime" timestamp(6)
)
;

-- ----------------------------
-- Records of sys_role_menu_function
-- ----------------------------
INSERT INTO "public"."sys_role_menu_function" VALUES ('28d17daa-b64e-4946-0369-08da5f56b13d', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 3, 'f64cfe50-1ef1-457f-0f20-08d9fdad00ab', NULL, '2022-07-06 21:51:57', NULL, '2022-07-06 21:51:57');
INSERT INTO "public"."sys_role_menu_function" VALUES ('31e97cae-1a79-4066-0368-08da5f56b13d', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 2, 'a7cd04db-bbe3-49b6-0f1e-08d9fdad00ab', NULL, '2022-07-06 21:51:57', NULL, '2022-07-06 21:51:57');
INSERT INTO "public"."sys_role_menu_function" VALUES ('390f485a-5f50-475b-0376-08da5f56b13d', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 13, 'b96f977c-a36e-4e7f-0f2d-08d9fdad00ab', NULL, '2022-07-06 21:51:57', NULL, '2022-07-06 21:51:57');
INSERT INTO "public"."sys_role_menu_function" VALUES ('3ce23bf9-f697-4d68-0372-08da5f56b13d', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 13, '106fb69a-8bb5-4559-0f29-08d9fdad00ab', NULL, '2022-07-06 21:51:57', NULL, '2022-07-06 21:51:57');
INSERT INTO "public"."sys_role_menu_function" VALUES ('3d15457f-c009-44e4-036a-08da5f56b13d', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 5, 'a1ddd02f-8c21-4d79-0f21-08d9fdad00ab', NULL, '2022-07-06 21:51:57', NULL, '2022-07-06 21:51:57');
INSERT INTO "public"."sys_role_menu_function" VALUES ('4df2715f-2a1e-45c2-0375-08da5f56b13d', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 13, 'a3754771-f6e9-4a23-0f2c-08d9fdad00ab', NULL, '2022-07-06 21:51:57', NULL, '2022-07-06 21:51:57');
INSERT INTO "public"."sys_role_menu_function" VALUES ('509ad581-1589-41a3-0379-08da5f56b13d', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 19, 'c77c812a-1601-4311-0f70-08d9fdad00ab', NULL, '2022-07-06 21:51:57', NULL, '2022-07-06 21:51:57');
INSERT INTO "public"."sys_role_menu_function" VALUES ('653ffa0a-9a3f-447a-036b-08da5f56b13d', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 6, '1cb6fbe1-4a6c-4aad-0f22-08d9fdad00ab', NULL, '2022-07-06 21:51:57', NULL, '2022-07-06 21:51:57');
INSERT INTO "public"."sys_role_menu_function" VALUES ('6c20dd18-622a-4c81-036c-08da5f56b13d', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 8, 'd2e6ea60-2cf6-478a-0f23-08d9fdad00ab', NULL, '2022-07-06 21:51:57', NULL, '2022-07-06 21:51:57');
INSERT INTO "public"."sys_role_menu_function" VALUES ('95e2ad9f-f876-4881-0371-08da5f56b13d', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 13, 'b5881044-afb8-40b2-0f28-08d9fdad00ab', NULL, '2022-07-06 21:51:57', NULL, '2022-07-06 21:51:57');
INSERT INTO "public"."sys_role_menu_function" VALUES ('9cdb59fa-4c72-4adf-0373-08da5f56b13d', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 13, 'f4621fbe-6b40-4454-0f2a-08d9fdad00ab', NULL, '2022-07-06 21:51:57', NULL, '2022-07-06 21:51:57');
INSERT INTO "public"."sys_role_menu_function" VALUES ('a10fdd9a-93df-47d6-0377-08da5f56b13d', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 13, '541d9045-47b2-4629-0f2e-08d9fdad00ab', NULL, '2022-07-06 21:51:57', NULL, '2022-07-06 21:51:57');
INSERT INTO "public"."sys_role_menu_function" VALUES ('aa9a9ba6-a5cf-4620-037b-08da5f56b13d', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 32, '6c09c0c0-72fa-4842-0f1f-08d9fdad00ab', NULL, '2022-07-06 21:51:57', NULL, '2022-07-06 21:51:57');
INSERT INTO "public"."sys_role_menu_function" VALUES ('b414e6e7-ab37-48ab-0378-08da5f56b13d', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 15, '13f3f74d-c6fc-4488-0f2f-08d9fdad00ab', NULL, '2022-07-06 21:51:57', NULL, '2022-07-06 21:51:57');
INSERT INTO "public"."sys_role_menu_function" VALUES ('bc7ad808-e114-47ae-037a-08da5f56b13d', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 28, '3f6d0af7-5386-4d3a-0f71-08d9fdad00ab', NULL, '2022-07-06 21:51:57', NULL, '2022-07-06 21:51:57');
INSERT INTO "public"."sys_role_menu_function" VALUES ('cd8357e8-e0b8-4a44-036f-08da5f56b13d', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 11, '3bc0e68f-d03d-4e99-0f26-08d9fdad00ab', NULL, '2022-07-06 21:51:57', NULL, '2022-07-06 21:51:57');
INSERT INTO "public"."sys_role_menu_function" VALUES ('cf58224e-9d8a-4dd7-036e-08da5f56b13d', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 10, 'ec535908-8671-4928-0f25-08d9fdad00ab', NULL, '2022-07-06 21:51:57', NULL, '2022-07-06 21:51:57');
INSERT INTO "public"."sys_role_menu_function" VALUES ('d11fb2b1-54d2-4151-0374-08da5f56b13d', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 13, '523b53b5-8159-4a16-0f2b-08d9fdad00ab', NULL, '2022-07-06 21:51:57', NULL, '2022-07-06 21:51:57');
INSERT INTO "public"."sys_role_menu_function" VALUES ('ef9cbb6d-70f0-4246-036d-08da5f56b13d', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 9, 'b7533a90-dae4-4263-0f24-08d9fdad00ab', NULL, '2022-07-06 21:51:57', NULL, '2022-07-06 21:51:57');
INSERT INTO "public"."sys_role_menu_function" VALUES ('f90cd8a1-2fae-40ed-0370-08da5f56b13d', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 13, 'eb958545-6449-40db-0f27-08d9fdad00ab', NULL, '2022-07-06 21:51:57', NULL, '2022-07-06 21:51:57');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_user";
CREATE TABLE "public"."sys_user" (
  "Id" uuid NOT NULL,
  "Name" text COLLATE "pg_catalog"."default" NOT NULL,
  "LoginName" text COLLATE "pg_catalog"."default" NOT NULL,
  "Password" text COLLATE "pg_catalog"."default",
  "Phone" text COLLATE "pg_catalog"."default",
  "Email" text COLLATE "pg_catalog"."default" NOT NULL,
  "DeleteLock" bool NOT NULL,
  "OrganizationId" int4,
  "CreatorUserId" uuid,
  "CreationTime" timestamp(6) NOT NULL,
  "LastModifierUserId" uuid,
  "LastModificationTime" timestamp(6)
)
;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO "public"."sys_user" VALUES ('0198459e-2034-4533-b843-5d227ad20740', '超级管理员', 'admin', 'E10ADC3949BA59ABBE56E057F20F883E', '10000000000', '1396510655@qq.com', 't', 7, NULL, '2017-04-06 19:55:53', NULL, '2022-03-08 17:27:36');
INSERT INTO "public"."sys_user" VALUES ('1550d6d4-0529-4fdd-62dc-08da00e3d8a0', '鲁迅', '鲁迅', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 'f', 7, NULL, '2022-03-08 17:21:56', NULL, '2022-03-08 17:30:56');
INSERT INTO "public"."sys_user" VALUES ('3739f349-7995-4c63-62d8-08da00e3d8a0', '白居易', '白居易', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 'f', 7, NULL, '2022-03-08 17:17:58', NULL, '2022-03-08 17:17:58');
INSERT INTO "public"."sys_user" VALUES ('4fd6a740-0cf1-4975-62d6-08da00e3d8a0', '李商隐', '李商隐', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 'f', 7, NULL, '2022-03-08 17:14:13', NULL, '2022-03-08 17:14:13');
INSERT INTO "public"."sys_user" VALUES ('5722af0f-2366-4fc9-62d5-08da00e3d8a0', '杜甫', '杜甫', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 'f', 7, NULL, '2022-03-08 17:13:02', NULL, '2022-03-08 17:13:02');
INSERT INTO "public"."sys_user" VALUES ('a1b6dafb-2b6a-4ff9-62da-08da00e3d8a0', '屈原', '屈原', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 'f', 7, NULL, '2022-03-08 17:19:55', NULL, '2022-03-08 17:19:55');
INSERT INTO "public"."sys_user" VALUES ('a3f9784c-5f00-4ec9-62d9-08da00e3d8a0', '陶渊明 ', '陶渊明 ', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 'f', 7, NULL, '2022-03-08 17:19:22', NULL, '2022-03-08 17:19:22');
INSERT INTO "public"."sys_user" VALUES ('ac18f496-e93d-42f0-b59e-e321acc85335', '李白', 'libai', 'E10ADC3949BA59ABBE56E057F20F883E', '12345678900', '12345678900@live.com', 't', 7, NULL, '2017-04-06 19:55:53', NULL, '2022-03-08 10:12:14');
INSERT INTO "public"."sys_user" VALUES ('cc186fe2-ee27-4292-62db-08da00e3d8a0', '孟浩然', '孟浩然', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 'f', 7, NULL, '2022-03-08 17:20:20', NULL, '2022-03-08 17:20:20');
INSERT INTO "public"."sys_user" VALUES ('e225e163-31c9-4da9-62d7-08da00e3d8a0', '苏轼', '苏轼', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 'f', 7, NULL, '2022-03-08 17:15:07', NULL, '2022-03-08 17:15:07');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_user_post";
CREATE TABLE "public"."sys_user_post" (
  "Id" uuid NOT NULL,
  "UserId" uuid NOT NULL,
  "PostId" uuid NOT NULL,
  "CreatorUserId" uuid,
  "CreationTime" timestamp(6) NOT NULL,
  "LastModifierUserId" uuid,
  "LastModificationTime" timestamp(6)
)
;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO "public"."sys_user_post" VALUES ('0c1a55ba-6bd3-4810-a494-a6b9b7374d4d', 'ac18f496-e93d-42f0-b59e-e321acc85335', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', NULL, '2022-03-08 10:13:35', NULL, '2022-03-08 10:13:35');
INSERT INTO "public"."sys_user_post" VALUES ('575bf085-47bb-42f2-8b68-620cf460b164', '0198459e-2034-4533-b843-5d227ad20740', '96927c30-41d0-4ced-8e29-cbed35c90fb0', NULL, '2022-03-08 17:29:22', NULL, '2022-03-08 17:29:22');
INSERT INTO "public"."sys_user_post" VALUES ('6c34f115-28dd-441a-81d5-f6598c97d44a', 'a3f9784c-5f00-4ec9-62d9-08da00e3d8a0', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', NULL, '2022-03-08 17:19:22', NULL, '2022-03-08 17:19:22');
INSERT INTO "public"."sys_user_post" VALUES ('6f671077-c98d-4106-9736-bf2edb6db58d', '4fd6a740-0cf1-4975-62d6-08da00e3d8a0', 'e46af329-6d08-442c-9837-f22cff954411', NULL, '2022-03-08 17:14:13', NULL, '2022-03-08 17:14:13');
INSERT INTO "public"."sys_user_post" VALUES ('978fc672-d829-4dad-abc7-071810c5ad18', 'e225e163-31c9-4da9-62d7-08da00e3d8a0', 'e46af329-6d08-442c-9837-f22cff954411', NULL, '2022-03-08 17:15:08', NULL, '2022-03-08 17:15:08');
INSERT INTO "public"."sys_user_post" VALUES ('af1bec7e-3309-4629-9606-72eefa1826b3', 'cc186fe2-ee27-4292-62db-08da00e3d8a0', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', NULL, '2022-03-08 17:20:20', NULL, '2022-03-08 17:20:20');
INSERT INTO "public"."sys_user_post" VALUES ('b669ec48-aa60-441a-b59d-7f9be7b94155', '1550d6d4-0529-4fdd-62dc-08da00e3d8a0', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', NULL, '2022-07-06 21:49:13', NULL, '2022-07-06 21:49:13');
INSERT INTO "public"."sys_user_post" VALUES ('b797ff16-d6f7-45db-83ec-f910b2612926', '4fd6a740-0cf1-4975-62d6-08da00e3d8a0', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', NULL, '2022-03-08 17:14:13', NULL, '2022-03-08 17:14:13');
INSERT INTO "public"."sys_user_post" VALUES ('b97331a7-e281-4027-aade-9f068558826a', '5722af0f-2366-4fc9-62d5-08da00e3d8a0', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', NULL, '2022-03-08 17:13:02', NULL, '2022-03-08 17:13:02');
INSERT INTO "public"."sys_user_post" VALUES ('d4e0ae0b-3573-4901-8fd7-9bb2c88ebe94', '3739f349-7995-4c63-62d8-08da00e3d8a0', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', NULL, '2022-03-08 17:17:58', NULL, '2022-03-08 17:17:58');
INSERT INTO "public"."sys_user_post" VALUES ('da9b04c9-d1ef-4721-8a94-4558dfe2eb7d', 'a1b6dafb-2b6a-4ff9-62da-08da00e3d8a0', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', NULL, '2022-06-21 19:59:02', NULL, '2022-06-21 19:59:02');
INSERT INTO "public"."sys_user_post" VALUES ('e64ef93c-2ce5-4b1d-a5d0-a9de937c5a3f', 'e225e163-31c9-4da9-62d7-08da00e3d8a0', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', NULL, '2022-03-08 17:15:07', NULL, '2022-03-08 17:15:07');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_user_role";
CREATE TABLE "public"."sys_user_role" (
  "Id" uuid NOT NULL,
  "UserId" uuid NOT NULL,
  "RoleId" uuid NOT NULL,
  "CreatorUserId" uuid,
  "CreationTime" timestamp(6) NOT NULL,
  "LastModifierUserId" uuid,
  "LastModificationTime" timestamp(6)
)
;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO "public"."sys_user_role" VALUES ('1c9f81df-c8a0-45bb-a272-c84bd3af0c19', '0198459e-2034-4533-b843-5d227ad20740', '18fa4771-6f58-46a3-80d2-6f0f5e9972e3', NULL, '2022-03-08 17:29:22', NULL, '2022-03-08 17:29:22');
INSERT INTO "public"."sys_user_role" VALUES ('1fe23f57-97c5-4670-9064-88d7d972cd28', 'e225e163-31c9-4da9-62d7-08da00e3d8a0', '40ff1844-c099-4061-98e0-cd6e544fcfd3', NULL, '2022-03-08 17:15:07', NULL, '2022-03-08 17:15:07');
INSERT INTO "public"."sys_user_role" VALUES ('23d32064-6eb8-4ea9-9b2a-7e2f09f53e4d', '1550d6d4-0529-4fdd-62dc-08da00e3d8a0', '40ff1844-c099-4061-98e0-cd6e544fcfd3', NULL, '2022-07-06 21:49:13', NULL, '2022-07-06 21:49:13');
INSERT INTO "public"."sys_user_role" VALUES ('45b7d5af-4d2c-465e-a4b6-99e52af9aee5', '3739f349-7995-4c63-62d8-08da00e3d8a0', '40ff1844-c099-4061-98e0-cd6e544fcfd3', NULL, '2022-03-08 17:17:58', NULL, '2022-03-08 17:17:58');
INSERT INTO "public"."sys_user_role" VALUES ('9b7bee51-2fb4-4aba-b680-6eea512919eb', 'a1b6dafb-2b6a-4ff9-62da-08da00e3d8a0', '40ff1844-c099-4061-98e0-cd6e544fcfd3', NULL, '2022-06-21 19:59:02', NULL, '2022-06-21 19:59:02');
INSERT INTO "public"."sys_user_role" VALUES ('a9f8a23b-8c2f-43cc-97af-8ed6f4c4d097', '4fd6a740-0cf1-4975-62d6-08da00e3d8a0', '40ff1844-c099-4061-98e0-cd6e544fcfd3', NULL, '2022-03-08 17:14:13', NULL, '2022-03-08 17:14:13');
INSERT INTO "public"."sys_user_role" VALUES ('ad5014f2-92e8-4109-9ca4-013a92390f8b', 'cc186fe2-ee27-4292-62db-08da00e3d8a0', '40ff1844-c099-4061-98e0-cd6e544fcfd3', NULL, '2022-03-08 17:20:20', NULL, '2022-03-08 17:20:20');
INSERT INTO "public"."sys_user_role" VALUES ('ce9f61ac-79d8-426f-9066-36962c017bf6', '5722af0f-2366-4fc9-62d5-08da00e3d8a0', '40ff1844-c099-4061-98e0-cd6e544fcfd3', NULL, '2022-03-08 17:13:02', NULL, '2022-03-08 17:13:02');
INSERT INTO "public"."sys_user_role" VALUES ('dbc656a6-4264-417d-97d8-577e1218feca', 'a3f9784c-5f00-4ec9-62d9-08da00e3d8a0', '40ff1844-c099-4061-98e0-cd6e544fcfd3', NULL, '2022-03-08 17:19:22', NULL, '2022-03-08 17:19:22');
INSERT INTO "public"."sys_user_role" VALUES ('fa1fdf14-3847-4194-894c-cd935a3dd9e6', 'ac18f496-e93d-42f0-b59e-e321acc85335', '40ff1844-c099-4061-98e0-cd6e544fcfd3', NULL, '2022-03-08 10:13:35', NULL, '2022-03-08 10:13:35');

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."sys_dictionary_Id_seq"
OWNED BY "public"."sys_dictionary"."Id";
SELECT setval('"public"."sys_dictionary_Id_seq"', 6, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."sys_menu_Id_seq"
OWNED BY "public"."sys_menu"."Id";
SELECT setval('"public"."sys_menu_Id_seq"', 38, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."sys_organization_Id_seq"
OWNED BY "public"."sys_organization"."Id";
SELECT setval('"public"."sys_organization_Id_seq"', 13, false);

-- ----------------------------
-- Primary Key structure for table __EFMigrationsHistory
-- ----------------------------
ALTER TABLE "public"."__EFMigrationsHistory" ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");

-- ----------------------------
-- Primary Key structure for table flow
-- ----------------------------
ALTER TABLE "public"."flow" ADD CONSTRAINT "PK_flow" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table flow_approval
-- ----------------------------
ALTER TABLE "public"."flow_approval" ADD CONSTRAINT "PK_flow_approval" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table flow_approval_step_history
-- ----------------------------
ALTER TABLE "public"."flow_approval_step_history" ADD CONSTRAINT "PK_flow_approval_step_history" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table flow_approval_step_history_user
-- ----------------------------
ALTER TABLE "public"."flow_approval_step_history_user" ADD CONSTRAINT "PK_flow_approval_step_history_user" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table flow_node
-- ----------------------------
ALTER TABLE "public"."flow_node" ADD CONSTRAINT "PK_flow_node" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table low_code_list
-- ----------------------------
ALTER TABLE "public"."low_code_list" ADD CONSTRAINT "PK_low_code_list" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table low_code_search
-- ----------------------------
ALTER TABLE "public"."low_code_search" ADD CONSTRAINT "PK_low_code_search" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table low_code_table
-- ----------------------------
ALTER TABLE "public"."low_code_table" ADD CONSTRAINT "PK_low_code_table" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table low_code_table_info
-- ----------------------------
ALTER TABLE "public"."low_code_table_info" ADD CONSTRAINT "PK_low_code_table_info" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table member
-- ----------------------------
ALTER TABLE "public"."member" ADD CONSTRAINT "PK_member" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table sys_data_authority
-- ----------------------------
ALTER TABLE "public"."sys_data_authority" ADD CONSTRAINT "PK_sys_data_authority" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table sys_data_authority_custom
-- ----------------------------
ALTER TABLE "public"."sys_data_authority_custom" ADD CONSTRAINT "PK_sys_data_authority_custom" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table sys_dictionary
-- ----------------------------
ALTER TABLE "public"."sys_dictionary" ADD CONSTRAINT "PK_sys_dictionary" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table sys_function
-- ----------------------------
ALTER TABLE "public"."sys_function" ADD CONSTRAINT "PK_sys_function" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table sys_menu
-- ----------------------------
ALTER TABLE "public"."sys_menu" ADD CONSTRAINT "PK_sys_menu" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table sys_menu_function
-- ----------------------------
ALTER TABLE "public"."sys_menu_function" ADD CONSTRAINT "PK_sys_menu_function" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table sys_operation_log
-- ----------------------------
ALTER TABLE "public"."sys_operation_log" ADD CONSTRAINT "PK_sys_operation_log" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table sys_organization
-- ----------------------------
ALTER TABLE "public"."sys_organization" ADD CONSTRAINT "PK_sys_organization" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table sys_post
-- ----------------------------
ALTER TABLE "public"."sys_post" ADD CONSTRAINT "PK_sys_post" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table sys_role
-- ----------------------------
ALTER TABLE "public"."sys_role" ADD CONSTRAINT "PK_sys_role" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table sys_role_menu_function
-- ----------------------------
ALTER TABLE "public"."sys_role_menu_function" ADD CONSTRAINT "PK_sys_role_menu_function" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table sys_user
-- ----------------------------
ALTER TABLE "public"."sys_user" ADD CONSTRAINT "PK_sys_user" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table sys_user_post
-- ----------------------------
ALTER TABLE "public"."sys_user_post" ADD CONSTRAINT "PK_sys_user_post" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table sys_user_role
-- ----------------------------
ALTER TABLE "public"."sys_user_role" ADD CONSTRAINT "PK_sys_user_role" PRIMARY KEY ("Id");
