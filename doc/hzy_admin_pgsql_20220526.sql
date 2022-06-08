/*
 Navicat Premium Data Transfer

 Source Server         : 本地_PostgreSql
 Source Server Type    : PostgreSQL
 Source Server Version : 130003
 Source Host           : localhost:5432
 Source Catalog        : hzy_admin_pgsql_20220526
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 130003
 File Encoding         : 65001

 Date: 08/06/2022 21:29:03
*/


-- ----------------------------
-- Sequence structure for SysDictionary_Id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."SysDictionary_Id_seq";
CREATE SEQUENCE "public"."SysDictionary_Id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for SysMenu_Id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."SysMenu_Id_seq";
CREATE SEQUENCE "public"."SysMenu_Id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for SysOrganization_Id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."SysOrganization_Id_seq";
CREATE SEQUENCE "public"."SysOrganization_Id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for FlowApprovalStepUsers
-- ----------------------------
DROP TABLE IF EXISTS "public"."FlowApprovalStepUsers";
CREATE TABLE "public"."FlowApprovalStepUsers" (
  "Id" uuid NOT NULL,
  "FlowApprovalStepId" uuid NOT NULL,
  "FlowNodeId" uuid NOT NULL,
  "FlowNodeName" text COLLATE "pg_catalog"."default",
  "UserId" uuid NOT NULL,
  "UserName" text COLLATE "pg_catalog"."default",
  "LastModificationTime" timestamp(6) NOT NULL,
  "CreationTime" timestamp(6) NOT NULL
)
;

-- ----------------------------
-- Records of FlowApprovalStepUsers
-- ----------------------------

-- ----------------------------
-- Table structure for FlowApprovalSteps
-- ----------------------------
DROP TABLE IF EXISTS "public"."FlowApprovalSteps";
CREATE TABLE "public"."FlowApprovalSteps" (
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
  "LastModificationTime" timestamp(6) NOT NULL,
  "CreationTime" timestamp(6) NOT NULL
)
;

-- ----------------------------
-- Records of FlowApprovalSteps
-- ----------------------------

-- ----------------------------
-- Table structure for FlowApprovals
-- ----------------------------
DROP TABLE IF EXISTS "public"."FlowApprovals";
CREATE TABLE "public"."FlowApprovals" (
  "Id" uuid NOT NULL,
  "UserId" uuid NOT NULL,
  "UserName" text COLLATE "pg_catalog"."default",
  "LaunchTime" timestamp(6) NOT NULL,
  "FormId" uuid NOT NULL,
  "FlowId" uuid NOT NULL,
  "FlowCode" text COLLATE "pg_catalog"."default",
  "FlowName" text COLLATE "pg_catalog"."default",
  "LastModificationTime" timestamp(6) NOT NULL,
  "CreationTime" timestamp(6) NOT NULL
)
;

-- ----------------------------
-- Records of FlowApprovals
-- ----------------------------

-- ----------------------------
-- Table structure for FlowNodes
-- ----------------------------
DROP TABLE IF EXISTS "public"."FlowNodes";
CREATE TABLE "public"."FlowNodes" (
  "Id" uuid NOT NULL,
  "FlowId" uuid NOT NULL,
  "Sort" int4,
  "Name" text COLLATE "pg_catalog"."default",
  "RoleId" uuid NOT NULL,
  "Remark" text COLLATE "pg_catalog"."default",
  "LastModificationTime" timestamp(6) NOT NULL,
  "CreationTime" timestamp(6) NOT NULL
)
;

-- ----------------------------
-- Records of FlowNodes
-- ----------------------------

-- ----------------------------
-- Table structure for Flows
-- ----------------------------
DROP TABLE IF EXISTS "public"."Flows";
CREATE TABLE "public"."Flows" (
  "Id" uuid NOT NULL,
  "Number" int4,
  "Code" text COLLATE "pg_catalog"."default",
  "Name" text COLLATE "pg_catalog"."default",
  "Remark" text COLLATE "pg_catalog"."default",
  "LastModificationTime" timestamp(6) NOT NULL,
  "CreationTime" timestamp(6) NOT NULL
)
;

-- ----------------------------
-- Records of Flows
-- ----------------------------

-- ----------------------------
-- Table structure for LowCodeList
-- ----------------------------
DROP TABLE IF EXISTS "public"."LowCodeList";
CREATE TABLE "public"."LowCodeList" (
  "Id" uuid NOT NULL,
  "Low_Code_TableId" uuid NOT NULL,
  "Low_Code_Table_InfoId" uuid NOT NULL,
  "ForeignKeyTableId" uuid NOT NULL,
  "ForeignKeyTableFieldName" text COLLATE "pg_catalog"."default",
  "LastModificationTime" timestamp(6) NOT NULL,
  "CreationTime" timestamp(6) NOT NULL
)
;

-- ----------------------------
-- Records of LowCodeList
-- ----------------------------

-- ----------------------------
-- Table structure for LowCodeSearch
-- ----------------------------
DROP TABLE IF EXISTS "public"."LowCodeSearch";
CREATE TABLE "public"."LowCodeSearch" (
  "Id" uuid NOT NULL,
  "Low_Code_TableId" uuid NOT NULL,
  "Low_Code_Table_InfoId" uuid NOT NULL,
  "LastModificationTime" timestamp(6) NOT NULL,
  "CreationTime" timestamp(6) NOT NULL
)
;

-- ----------------------------
-- Records of LowCodeSearch
-- ----------------------------

-- ----------------------------
-- Table structure for LowCodeTable
-- ----------------------------
DROP TABLE IF EXISTS "public"."LowCodeTable";
CREATE TABLE "public"."LowCodeTable" (
  "Id" uuid NOT NULL,
  "TableName" text COLLATE "pg_catalog"."default",
  "Schema" text COLLATE "pg_catalog"."default",
  "Type" text COLLATE "pg_catalog"."default",
  "DisplayName" text COLLATE "pg_catalog"."default",
  "EntityName" text COLLATE "pg_catalog"."default",
  "Remark" text COLLATE "pg_catalog"."default",
  "LastModificationTime" timestamp(6) NOT NULL,
  "CreationTime" timestamp(6) NOT NULL
)
;

-- ----------------------------
-- Records of LowCodeTable
-- ----------------------------
INSERT INTO "public"."LowCodeTable" VALUES ('0a8bdb18-758a-4798-9ffc-e7031dcbf262', 'SysPost', 'dbo', 'TABLE', '岗位', 'SysPost', NULL, '2022-05-24 21:57:34', '2022-04-17 00:00:00');
INSERT INTO "public"."LowCodeTable" VALUES ('1a8df018-79f8-4e26-b4eb-4b735aae7275', 'Flow', 'dbo', 'TABLE', '审批流', 'Flow', NULL, '2022-05-24 21:57:34', '2022-04-17 00:00:00');
INSERT INTO "public"."LowCodeTable" VALUES ('2ae9e532-7d9a-474b-b629-50a39945c44d', 'SysMenuFunction', 'dbo', 'TABLE', '菜单功能', 'SysMenuFunction', NULL, '2022-05-24 21:57:34', '2022-04-17 00:00:00');
INSERT INTO "public"."LowCodeTable" VALUES ('3da5d264-2e8d-460c-a10c-ff9a6bb57a60', 'SysUserRole', 'dbo', 'TABLE', '用户与角色', 'SysUserRole', NULL, '2022-05-24 21:57:34', '2022-04-17 00:00:00');
INSERT INTO "public"."LowCodeTable" VALUES ('524e71b4-cbf7-4248-8b29-3f99b43f2eb2', 'SysDataAuthorityCustom', 'dbo', 'TABLE', '自定义数据权限', 'SysDataAuthorityCustom', NULL, '2022-05-24 21:57:34', '2022-04-17 00:00:00');
INSERT INTO "public"."LowCodeTable" VALUES ('60cceba1-28bf-4d1d-b603-4edf95d512b8', 'SysOperationLog', 'dbo', 'TABLE', '操作日志', 'SysOperationLog', NULL, '2022-05-24 21:57:34', '2022-04-17 00:00:00');
INSERT INTO "public"."LowCodeTable" VALUES ('6323638b-a45f-4a76-886e-69a9e9be0901', 'SysUser', 'dbo', 'TABLE', '用户', 'SysUser', NULL, '2022-05-24 21:57:34', '2022-04-17 00:00:00');
INSERT INTO "public"."LowCodeTable" VALUES ('651bb982-1130-4e1c-9070-36b90dcf2324', 'FlowApprovalStep', 'dbo', 'TABLE', '工作流审批步骤配置', 'FlowApprovalStep', NULL, '2022-05-24 21:57:34', '2022-04-17 00:00:00');
INSERT INTO "public"."LowCodeTable" VALUES ('69b24f04-0ed3-45fc-91d9-0dc929175a57', 'SysUserPost', 'dbo', 'TABLE', '用户与岗位', 'SysUserPost', NULL, '2022-05-24 21:57:34', '2022-04-17 00:00:00');
INSERT INTO "public"."LowCodeTable" VALUES ('69edd8a8-1d24-478c-a909-b82039edcec0', 'LowCodeSearch', 'dbo', 'TABLE', '低代码检索表', 'LowCodeSearch', NULL, '2022-05-24 21:57:34', '2022-05-23 00:00:00');
INSERT INTO "public"."LowCodeTable" VALUES ('6ba9805c-916e-4d2c-99d0-216fcbc361cc', 'LowCodeTable', 'dbo', 'TABLE', '低代码表', 'LowCodeTable', NULL, '2022-05-24 21:57:34', '2022-05-23 00:00:00');
INSERT INTO "public"."LowCodeTable" VALUES ('6fabc67a-8b48-49a6-8ba1-c8a32c499d36', 'SysFunction', 'dbo', 'TABLE', '功能', 'SysFunction', NULL, '2022-05-24 21:57:34', '2022-04-17 00:00:00');
INSERT INTO "public"."LowCodeTable" VALUES ('73c97832-4e7f-4758-86d2-94327971b5fd', 'Member', 'dbo', 'TABLE', '会员', 'Member', NULL, '2022-05-24 21:57:34', '2022-04-17 00:00:00');
INSERT INTO "public"."LowCodeTable" VALUES ('79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 'LowCodeTableInfo', 'dbo', 'TABLE', '低代码表信息', 'LowCodeTableInfo', NULL, '2022-05-24 21:57:34', '2022-05-23 00:00:00');
INSERT INTO "public"."LowCodeTable" VALUES ('7ad3b915-f0bd-443a-89cd-42d41dd6c554', 'FlowApprovalStepUser', 'dbo', 'TABLE', '工作流用户审批步骤', 'FlowApprovalStepUser', NULL, '2022-05-24 21:57:34', '2022-04-17 00:00:00');
INSERT INTO "public"."LowCodeTable" VALUES ('852f53ff-0d00-4c32-aa55-a9c11993751b', 'LowCodeList', 'dbo', 'TABLE', '低代码列表', 'LowCodeList', NULL, '2022-05-24 21:57:34', '2022-05-23 00:00:00');
INSERT INTO "public"."LowCodeTable" VALUES ('8da38d20-8a09-4e81-8dd8-ed6702aee380', 'SysRoleMenuFunction', 'dbo', 'TABLE', '角色菜单功能关联', 'SysRoleMenuFunction', NULL, '2022-05-24 21:57:34', '2022-04-17 00:00:00');
INSERT INTO "public"."LowCodeTable" VALUES ('ae6d94d8-6a15-4348-b600-aa17e4b61718', 'FlowNode', 'dbo', 'TABLE', '工作流节点', 'FlowNode', NULL, '2022-05-24 21:57:34', '2022-04-17 00:00:00');
INSERT INTO "public"."LowCodeTable" VALUES ('af37f705-7ba0-4883-b1be-8a274ea4c026', 'SysDictionary', 'dbo', 'TABLE', '数据字典', 'SysDictionary', NULL, '2022-05-24 21:57:34', '2022-04-17 00:00:00');
INSERT INTO "public"."LowCodeTable" VALUES ('c5883367-42aa-43b8-9577-4720a2253efa', 'News', 'dbo', 'TABLE', '资讯', 'News', NULL, '2022-05-24 21:57:34', '2022-04-28 00:00:00');
INSERT INTO "public"."LowCodeTable" VALUES ('d2600250-6f32-4d7d-8395-96cc9fa36db4', 'SysMenu', 'dbo', 'TABLE', '菜单', 'SysMenu', NULL, '2022-05-24 21:57:34', '2022-04-17 00:00:00');
INSERT INTO "public"."LowCodeTable" VALUES ('d26d07cb-158a-4cb2-8b20-5dfd5181af54', 'SysOrganization', 'dbo', 'TABLE', '组织', 'SysOrganization', NULL, '2022-05-24 21:57:34', '2022-04-17 00:00:00');
INSERT INTO "public"."LowCodeTable" VALUES ('d8948c56-c5bd-4061-b272-5417375f38f0', 'FlowApproval', 'dbo', 'TABLE', '审批流审批', 'FlowApproval', NULL, '2022-05-24 21:57:34', '2022-04-17 00:00:00');
INSERT INTO "public"."LowCodeTable" VALUES ('e79db53b-7162-4669-9b5e-f860501475ac', 'SysDataAuthority', 'dbo', 'TABLE', '数据权限', 'SysDataAuthority', NULL, '2022-05-24 21:57:34', '2022-04-17 00:00:00');
INSERT INTO "public"."LowCodeTable" VALUES ('f3d7bbb3-c1fb-4d61-92a4-9bc101811335', 'SysRole', 'dbo', 'TABLE', '角色', 'SysRole', NULL, '2022-05-24 21:57:34', '2022-04-17 00:00:00');

-- ----------------------------
-- Table structure for LowCodeTableInfo
-- ----------------------------
DROP TABLE IF EXISTS "public"."LowCodeTableInfo";
CREATE TABLE "public"."LowCodeTableInfo" (
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
  "LastModificationTime" timestamp(6) NOT NULL,
  "CreationTime" timestamp(6) NOT NULL,
  "DisplayName" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of LowCodeTableInfo
-- ----------------------------
INSERT INTO "public"."LowCodeTableInfo" VALUES ('01ca178c-112a-4a49-d489-08da3d8d5a26', 'd8948c56-c5bd-4061-b272-5417375f38f0', 'f', 'f', 't', 33, 'CreationTime', '', 'datetime', 'DateTime', 'CreationTime', 8, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('02ffafb8-cf9b-441c-d4c2-08da3d8d5a26', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 'f', 'f', 't', 18, 'TableName', '', 'varchar(50)', 'String', 'TableName', 50, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('042a59e2-72c1-4c38-d52d-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 'f', 'f', 't', 140, 'ParentId', '', 'int', 'Int32', 'ParentId', 4, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('043612f1-e16a-4c44-d497-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 'f', 'f', 't', 42, 'LastModificationTime', '', 'datetime', 'DateTime', 'LastModificationTime', 8, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('063d44b8-6ce2-47a6-d51a-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 'f', 'f', 't', 9, 'Browser', '', 'varchar(255)', 'String', 'Browser', 255, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('06f4f5a9-f63f-4e47-d485-08da3d8d5a26', '1a8df018-79f8-4e26-b4eb-4b735aae7275', 'f', 'f', 't', 29, 'Name', '流程名称', 'nvarchar(255)', 'String', 'Name', 255, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('0888b15f-3bd2-4881-d523-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 'f', 'f', 'f', 12, 'TakeUpTime', '接口耗时（毫秒）', 'bigint', 'Int64', 'TakeUpTime', 8, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('0aa2daab-50df-4397-d51c-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 'f', 'f', 't', 3, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', 6, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('0b45e9bb-b9f1-4a2f-d526-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 'f', 'f', 't', 142, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', 6, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('0cfc881c-98d4-4a2c-d4a5-08da3d8d5a26', '7ad3b915-f0bd-443a-89cd-42d41dd6c554', 'f', 'f', 't', 60, 'UserName', '审批人名称', 'varchar(500)', 'String', 'UserName', 500, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('0df6b078-b248-4c83-d4ab-08da3d8d5a26', 'ae6d94d8-6a15-4348-b600-aa17e4b61718', 'f', 'f', 't', 67, 'Name', '', 'nvarchar(255)', 'String', 'Name', 255, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('0e19400d-1876-4fe3-d4a7-08da3d8d5a26', 'ae6d94d8-6a15-4348-b600-aa17e4b61718', 'f', 'f', 't', 63, 'CreationTime', '', 'datetime', 'DateTime', 'CreationTime', 8, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('0e864b91-b667-4f53-d4a3-08da3d8d5a26', '7ad3b915-f0bd-443a-89cd-42d41dd6c554', 'f', 'f', 't', 54, 'LastModificationTime', '', 'datetime', 'DateTime', 'LastModificationTime', 8, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('0f0c03e3-604f-489f-d4bf-08da3d8d5a26', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 'f', 'f', 't', 16, 'LastModificationTime', '', 'datetime', 'DateTime', 'LastModificationTime', 8, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('0f908e1d-4a82-42c1-d4e8-08da3d8d5a26', 'e79db53b-7162-4669-9b5e-f860501475ac', 'f', 'f', 't', 86, 'PermissionType', '数据权限类型', 'int', 'Int32', 'PermissionType', 4, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('1121d642-49e8-4b25-d52b-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 'f', 'f', 't', 133, 'Name', '', 'nvarchar(255)', 'String', 'Name', 255, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('11afcf11-9b42-47ce-d4c5-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 'f', 'f', 't', 204, 'ColumnName', '', 'varchar(500)', 'String', 'ColumnName', 500, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('11f3d291-cf7a-4143-d52a-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 'f', 'f', 't', 135, 'LevelCode', '', 'varchar(50)', 'String', 'LevelCode', 50, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('1213c179-e366-4e3c-d540-08da3d8d5a26', '8da38d20-8a09-4e81-8dd8-ed6702aee380', 'f', 'f', 't', 163, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', 6, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('12e9e9ad-5631-4dc8-d503-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 'f', 'f', 't', 122, 'JumpUrl', '', 'varchar(255)', 'String', 'JumpUrl', 255, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('134c9f62-abd2-476e-d532-08da3d8d5a26', '0a8bdb18-758a-4798-9ffc-e7031dcbf262', 'f', 'f', 't', 150, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', 6, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('135e23db-540b-4096-d551-08da3d8d5a26', '69b24f04-0ed3-45fc-91d9-0dc929175a57', 'f', 'f', 't', 177, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', 6, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('1790b4d5-51b2-4dc0-d534-08da3d8d5a26', '0a8bdb18-758a-4798-9ffc-e7031dcbf262', 'f', 'f', 't', 146, 'Name', '', 'nvarchar(255)', 'String', 'Name', 255, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('18b4430b-765d-4a71-97b9-08da39a2ef6c', '3da5d264-2e8d-460c-a10c-ff9a6bb57a60', 'f', 'f', 't', 171, 'UserId', '', 'uniqueidentifier', 'Guid', 'UserId', NULL, '2022-05-19 22:26:18', '2022-05-19 00:00:00', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('1916e619-4818-4c63-d50b-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 'f', 'f', 't', 118, 'Show', '', 'bit', 'Boolean', 'Show', 1, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('19a7504c-f740-4b49-d528-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 'f', 'f', 't', 141, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', 6, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('19fa02fe-fb8f-4631-d50e-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 'f', 'f', 't', 113, 'Url', '', 'nvarchar(255)', 'String', 'Url', NULL, '2022-05-24 21:58:07', '2022-05-24 00:00:00', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('1a2a9e15-dc83-49e1-d4b9-08da3d8d5a26', '69edd8a8-1d24-478c-a909-b82039edcec0', 'f', 'f', 't', 188, 'Low_Code_Table_InfoId', '', 'uniqueidentifier', 'Guid', 'Low_Code_Table_InfoId', 16, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('1d3c8224-a3a5-4b88-d4cd-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 'f', 'f', 't', 200, 'IsPrimary', '', 'bit', 'Boolean', 'IsPrimary', 1, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('1d881e59-d88e-497f-d51e-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 'f', 'f', 't', 7, 'FormBody', 'json表单信息', 'varchar(MAX)', 'String', 'FormBody', -1, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('1e40d97a-49ee-4727-d4c6-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 'f', 'f', 't', 198, 'CreationTime', '', 'datetime', 'DateTime', 'CreationTime', 8, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('2006ac52-bb49-4e41-d501-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 'f', 'f', 't', 109, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', NULL, '2022-05-24 21:58:07', '2022-05-24 00:00:00', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('200ff922-513c-4b19-d519-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 'f', 'f', 't', 4, 'Api', '接口地址', 'varchar(500)', 'String', 'Api', 500, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('2029bb6d-a0f2-41de-97b8-08da39a2ef6c', '3da5d264-2e8d-460c-a10c-ff9a6bb57a60', 'f', 'f', 't', 172, 'RoleId', '', 'uniqueidentifier', 'Guid', 'RoleId', NULL, '2022-05-19 22:26:18', '2022-05-19 00:00:00', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('2286c948-4f0d-4b66-d535-08da3d8d5a26', '0a8bdb18-758a-4798-9ffc-e7031dcbf262', 'f', 'f', 't', 144, 'Number', '', 'int', 'Int32', 'Number', 4, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('2321aac8-0eed-4b87-d4ac-08da3d8d5a26', 'ae6d94d8-6a15-4348-b600-aa17e4b61718', 'f', 'f', 't', 69, 'Remark', '', 'nvarchar(255)', 'String', 'Remark', 255, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('2341dcb1-8056-4a7c-d4eb-08da3d8d5a26', '524e71b4-cbf7-4248-8b29-3f99b43f2eb2', 'f', 'f', 't', 89, 'CreationTime', '', 'datetime', 'DateTime', 'CreationTime', 8, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('235b67f8-62d2-480e-d508-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 'f', 'f', 't', 111, 'Number', '编号', 'int', 'Int32', 'Number', NULL, '2022-05-24 21:58:07', '2022-05-24 00:00:00', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('24db7ed8-1a4f-4b25-d49d-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 'f', 'f', 't', 51, 'UserName', '步骤审批人名称', 'varchar(255)', 'String', 'UserName', 255, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('252ac7b2-0e62-48e1-97b7-08da39a2ef6c', '3da5d264-2e8d-460c-a10c-ff9a6bb57a60', 'f', 'f', 't', 173, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', NULL, '2022-05-19 22:26:18', '2022-05-19 00:00:00', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('2819dfe7-f12b-483c-d4a6-08da3d8d5a26', 'ae6d94d8-6a15-4348-b600-aa17e4b61718', 't', 'f', 'f', 61, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('29b765bd-36f4-462f-d4f3-08da3d8d5a26', 'af37f705-7ba0-4883-b1be-8a274ea4c026', 'f', 'f', 't', 98, 'Name', '分组名/键', 'varchar(255)', 'String', 'Name', 255, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('29d08351-9091-4c91-d514-08da3d8d5a26', '2ae9e532-7d9a-474b-b629-50a39945c44d', 'f', 'f', 't', 128, 'MenuId', '', 'int', 'Int32', 'MenuId', 4, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('2a1c3f3d-4efc-472b-d49a-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 'f', 'f', 't', 47, 'SortMore', '多次审批顺序号（可能是多次审批次数）', 'int', 'Int32', 'SortMore', 4, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('2ae91c1d-d618-4267-d4b3-08da3d8d5a26', '852f53ff-0d00-4c32-aa55-a9c11993751b', 'f', 'f', 't', 190, 'LastModificationTime', '', 'datetime', 'DateTime', 'LastModificationTime', 8, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('2b4747ed-0409-4d14-d48b-08da3d8d5a26', 'd8948c56-c5bd-4061-b272-5417375f38f0', 'f', 'f', 't', 38, 'FlowId', '流程Id', 'uniqueidentifier', 'Guid', 'FlowId', 16, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('2ca9aa7e-321e-47f0-d4f0-08da3d8d5a26', 'af37f705-7ba0-4883-b1be-8a274ea4c026', 'f', 'f', 't', 94, 'CreationTime', '创建时间', 'datetime', 'DateTime', 'CreationTime', 8, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('2ffaa9ee-c286-4f90-d495-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 'f', 'f', 't', 45, 'FlowNodeId', '审批流节点Id', 'uniqueidentifier', 'Guid', 'FlowNodeId', 16, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('3071360b-c1ef-4dff-d48f-08da3d8d5a26', 'd8948c56-c5bd-4061-b272-5417375f38f0', 'f', 'f', 't', 36, 'LaunchTime', '发起时间', 'datetime', 'DateTime', 'LaunchTime', 8, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('3133985d-586c-4c4e-d4ff-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 'f', 'f', 't', 119, 'Close', '', 'bit', 'Boolean', 'Close', 1, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('31f56d34-2216-45b0-d4df-08da3d8d5a26', 'c5883367-42aa-43b8-9577-4720a2253efa', 'f', 'f', 't', 214, 'Author', '', 'varchar(50)', 'String', 'Author', 50, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('325af03c-cbb7-4de6-d4ee-08da3d8d5a26', '524e71b4-cbf7-4248-8b29-3f99b43f2eb2', 'f', 'f', 'f', 91, 'SysOrganizationId', '', 'int', 'Int32', 'SysOrganizationId', 4, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('3ab15f84-8722-4837-d4c3-08da3d8d5a26', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 'f', 'f', 't', 20, 'Type', '', 'int', 'Int32', 'Type', 4, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('3b959124-21d2-45b9-d4ca-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 'f', 'f', 't', 205, 'Describe', '', 'varchar(50)', 'String', 'Describe', 50, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('3f7e43c9-762f-48ea-d53a-08da3d8d5a26', 'f3d7bbb3-c1fb-4d61-92a4-9bc101811335', 'f', 'f', 't', 157, 'DeleteLock', '', 'bit', 'Boolean', 'DeleteLock', 1, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('42430604-7090-442d-d539-08da3d8d5a26', 'f3d7bbb3-c1fb-4d61-92a4-9bc101811335', 'f', 'f', 't', 153, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', 6, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('441e03ec-ecb7-4172-d4c1-08da3d8d5a26', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 'f', 'f', 't', 19, 'Schema', '', 'varchar(50)', 'String', 'Schema', 50, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('4467bf43-6e95-4798-d522-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 'f', 'f', 't', 8, 'QueryString', '地址栏信息', 'varchar(MAX)', 'String', 'QueryString', -1, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('4736479f-6089-4141-d521-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 'f', 'f', 't', 10, 'OS', '', 'varchar(255)', 'String', 'OS', 255, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('48b12860-84de-4f7b-d4c9-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 'f', 'f', 't', 206, 'DatabaseColumnType', '', 'varchar(50)', 'String', 'DatabaseColumnType', 50, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('495fe86e-5bd6-44d4-d4a1-08da3d8d5a26', '7ad3b915-f0bd-443a-89cd-42d41dd6c554', 'f', 'f', 't', 57, 'FlowNodeId', '审批节点Id', 'uniqueidentifier', 'Guid', 'FlowNodeId', 16, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('498327eb-5676-4091-d4fe-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 't', 't', 'f', 107, 'Id', '', 'int', 'Int32', 'Id', NULL, '2022-05-24 21:58:07', '2022-05-24 00:00:00', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('4aaa1e18-8c06-4806-d4d1-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 'f', 'f', 't', 203, 'Position', '', 'int', 'Int32', 'Position', 4, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('4c479d54-530f-4652-d552-08da3d8d5a26', '69b24f04-0ed3-45fc-91d9-0dc929175a57', 'f', 'f', 't', 176, 'PostId', '', 'uniqueidentifier', 'Guid', 'PostId', 16, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('517cbfe0-275d-4f36-d53b-08da3d8d5a26', 'f3d7bbb3-c1fb-4d61-92a4-9bc101811335', 'f', 'f', 't', 152, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', 6, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('5257ad4f-589d-40d0-d533-08da3d8d5a26', '0a8bdb18-758a-4798-9ffc-e7031dcbf262', 'f', 'f', 't', 149, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', 6, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('564a907b-1f47-4849-d537-08da3d8d5a26', '0a8bdb18-758a-4798-9ffc-e7031dcbf262', 'f', 'f', 't', 147, 'State', '', 'int', 'Int32', 'State', 4, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('585e18ea-ab50-4216-d4b5-08da3d8d5a26', '852f53ff-0d00-4c32-aa55-a9c11993751b', 'f', 'f', 't', 192, 'Low_Code_TableId', '', 'uniqueidentifier', 'Guid', 'Low_Code_TableId', 16, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('5aa598a9-6e52-4ae4-d50a-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 'f', 'f', 't', 114, 'Router', '', 'nvarchar(255)', 'String', 'Router', NULL, '2022-05-24 21:58:07', '2022-05-24 00:00:00', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('5aed3feb-3d77-4e1e-d52c-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 'f', 'f', 't', 134, 'OrderNumber', '', 'int', 'Int32', 'OrderNumber', 4, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('5ca84ecf-5971-45bc-d4a8-08da3d8d5a26', 'ae6d94d8-6a15-4348-b600-aa17e4b61718', 'f', 'f', 't', 65, 'FlowCode', '', 'nvarchar(255)', 'String', 'FlowCode', 255, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('5cb41f1c-e68a-47f9-d486-08da3d8d5a26', '1a8df018-79f8-4e26-b4eb-4b735aae7275', 'f', 'f', 't', 27, 'Number', '排序号', 'int', 'Int32', 'Number', 4, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('5e4c83fd-7071-4997-d4be-08da3d8d5a26', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 'f', 'f', 't', 22, 'EntityName', '', 'varchar(50)', 'String', 'EntityName', 50, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('5f28be90-e415-46dd-d4e3-08da3d8d5a26', 'c5883367-42aa-43b8-9577-4720a2253efa', 'f', 'f', 't', 215, 'Time', '', 'datetime', 'DateTime', 'Time', 8, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('5f5c2997-daa8-491c-d51d-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 'f', 'f', 't', 6, 'Form', '表单信息', 'varchar(MAX)', 'String', 'Form', -1, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('5f9a4a78-1bb9-4592-d536-08da3d8d5a26', '0a8bdb18-758a-4798-9ffc-e7031dcbf262', 'f', 'f', 't', 148, 'Remarks', '', 'nvarchar(255)', 'String', 'Remarks', 255, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('5fc01eb0-4833-4e93-d483-08da3d8d5a26', '1a8df018-79f8-4e26-b4eb-4b735aae7275', 'f', 'f', 't', 26, 'CreationTime', '', 'datetime', 'DateTime', 'CreationTime', 8, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('5fea8348-aa6b-4577-d4cc-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 'f', 'f', 't', 202, 'IsNullable', '', 'bit', 'Boolean', 'IsNullable', 1, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('60019cd9-49eb-489b-97b5-08da39a2ef6c', '3da5d264-2e8d-460c-a10c-ff9a6bb57a60', 't', 'f', 'f', 170, 'Id', 'Id', 'uniqueidentifier', 'Guid', 'Id', NULL, '2022-05-19 22:26:18', '2022-05-19 00:00:00', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('609a52aa-48b2-4e64-d48e-08da3d8d5a26', 'd8948c56-c5bd-4061-b272-5417375f38f0', 'f', 'f', 't', 32, 'LastModificationTime', '', 'datetime', 'DateTime', 'LastModificationTime', 8, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('6284c929-4115-4c17-d491-08da3d8d5a26', 'd8948c56-c5bd-4061-b272-5417375f38f0', 'f', 'f', 't', 35, 'UserName', '发起人', 'varchar(255)', 'String', 'UserName', 255, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('6304e602-84a1-4c57-d4ec-08da3d8d5a26', '524e71b4-cbf7-4248-8b29-3f99b43f2eb2', 'f', 'f', 't', 88, 'LastModificationTime', '', 'datetime', 'DateTime', 'LastModificationTime', 8, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('646614d9-d7f3-42c5-d4fd-08da3d8d5a26', '6fabc67a-8b48-49a6-8ba1-c8a32c499d36', 'f', 'f', 't', 104, 'Remark', '', 'nvarchar(255)', 'String', 'Remark', 255, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('66718de6-5c1a-4229-d524-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 'f', 'f', 't', 11, 'UserId', '当前操作人id', 'uniqueidentifier', 'Guid', 'UserId', 16, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('69875823-326c-4e13-d538-08da3d8d5a26', 'f3d7bbb3-c1fb-4d61-92a4-9bc101811335', 't', 'f', 'f', 151, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('6aa13b8f-1e3c-4750-d530-08da3d8d5a26', '0a8bdb18-758a-4798-9ffc-e7031dcbf262', 't', 'f', 'f', 143, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('6c3bb548-aafc-4f16-d50d-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 'f', 'f', 't', 123, 'Type', '', 'int', 'Int32', 'Type', 4, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('6c934348-be20-4c9e-d542-08da3d8d5a26', '8da38d20-8a09-4e81-8dd8-ed6702aee380', 'f', 'f', 't', 161, 'MenuFunctionId', '', 'uniqueidentifier', 'Guid', 'MenuFunctionId', 16, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('6cfe3b57-006f-436b-d511-08da3d8d5a26', '2ae9e532-7d9a-474b-b629-50a39945c44d', 'f', 'f', 't', 129, 'FunctionCode', '', 'varchar(100)', 'String', 'FunctionCode', 100, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('6e69cf9b-d9cd-4c31-d4f4-08da3d8d5a26', 'af37f705-7ba0-4883-b1be-8a274ea4c026', 'f', 'f', 't', 99, 'ParentId', '父级分组id', 'int', 'Int32', 'ParentId', 4, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('6fe5687c-bfaf-4e2f-d4e0-08da3d8d5a26', 'c5883367-42aa-43b8-9577-4720a2253efa', 'f', 'f', 't', 216, 'Content', '', 'varchar(MAX)', 'String', 'Content', -1, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('70e30a70-99f9-44b3-d482-08da3d8d5a26', '1a8df018-79f8-4e26-b4eb-4b735aae7275', 'f', 'f', 't', 28, 'Code', '编码', 'nvarchar(255)', 'String', 'Code', 255, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('7211aea6-eb91-41e5-d505-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 'f', 'f', 't', 108, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', NULL, '2022-05-24 21:58:07', '2022-05-24 00:00:00', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('73d17476-e006-4530-d4ad-08da3d8d5a26', 'ae6d94d8-6a15-4348-b600-aa17e4b61718', 'f', 'f', 't', 68, 'RoleId', '', 'uniqueidentifier', 'Guid', 'RoleId', 16, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('743d6eab-b4c8-4a15-d4f8-08da3d8d5a26', '6fabc67a-8b48-49a6-8ba1-c8a32c499d36', 'f', 'f', 't', 103, 'ByName', '', 'nvarchar(255)', 'String', 'ByName', 255, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('78757b0d-d9ee-45ea-d500-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 'f', 'f', 't', 115, 'ComponentName', '', 'nvarchar(255)', 'String', 'ComponentName', NULL, '2022-05-24 21:58:07', '2022-05-24 00:00:00', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('7b4df31f-36a3-477c-d4ba-08da3d8d5a26', '69edd8a8-1d24-478c-a909-b82039edcec0', 'f', 'f', 't', 187, 'Low_Code_TableId', '', 'uniqueidentifier', 'Guid', 'Low_Code_TableId', 16, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('7b6df0cd-c31b-4508-d53f-08da3d8d5a26', '8da38d20-8a09-4e81-8dd8-ed6702aee380', 't', 'f', 'f', 158, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('7b900baf-65df-4910-d4b1-08da3d8d5a26', '852f53ff-0d00-4c32-aa55-a9c11993751b', 'f', 'f', 't', 195, 'ForeignKeyTableFieldName', '', 'varchar(50)', 'String', 'ForeignKeyTableFieldName', 50, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('7c7400ed-ec08-4832-d4b6-08da3d8d5a26', '69edd8a8-1d24-478c-a909-b82039edcec0', 't', 'f', 'f', 184, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('804e418f-3206-4090-d4e4-08da3d8d5a26', 'c5883367-42aa-43b8-9577-4720a2253efa', 'f', 'f', 't', 213, 'Title', '', 'varchar(50)', 'String', 'Title', 50, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('8237d289-05cf-485b-d4b8-08da3d8d5a26', '69edd8a8-1d24-478c-a909-b82039edcec0', 'f', 'f', 't', 185, 'LastModificationTime', '', 'datetime', 'DateTime', 'LastModificationTime', 8, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('825e69b9-cd33-4ab8-97b6-08da39a2ef6c', '3da5d264-2e8d-460c-a10c-ff9a6bb57a60', 'f', 'f', 't', 174, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', NULL, '2022-05-19 22:26:18', '2022-05-19 00:00:00', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('82ee25d2-4e01-4100-d4f9-08da3d8d5a26', '6fabc67a-8b48-49a6-8ba1-c8a32c499d36', 'f', 'f', 't', 106, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', 6, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('8430c5a1-6c73-4733-d4bc-08da3d8d5a26', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 'f', 'f', 't', 17, 'CreationTime', '', 'datetime', 'DateTime', 'CreationTime', 8, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('84a87e33-8b66-4b9a-d4f5-08da3d8d5a26', 'af37f705-7ba0-4883-b1be-8a274ea4c026', 'f', 'f', 't', 95, 'Sort', '排序号', 'int', 'Int32', 'Sort', 4, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('86b95bf0-4418-46ba-d4cb-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 'f', 'f', 't', 201, 'IsIdentity', '', 'bit', 'Boolean', 'IsIdentity', 1, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('5541e535-7cbe-43d2-d4d4-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 'f', 'f', 't', 80, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', NULL, '2022-06-08 21:28:49.884799', '2022-05-24 00:00:00', '创建时间');
INSERT INTO "public"."LowCodeTableInfo" VALUES ('669b87ce-c694-4c8c-d4da-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 'f', 'f', 't', 73, 'Phone', '', 'nvarchar(255)', 'String', 'Phone', NULL, '2022-06-08 21:28:49.884798', '2022-05-24 00:00:00', '联系电话');
INSERT INTO "public"."LowCodeTableInfo" VALUES ('72ac247c-d792-4fee-d4dc-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 'f', 'f', 't', 74, 'Sex', '', 'nvarchar(255)', 'String', 'Sex', NULL, '2022-06-08 21:28:49.884798', '2022-05-24 00:00:00', '性别');
INSERT INTO "public"."LowCodeTableInfo" VALUES ('8326ca11-09f1-4c38-d4d6-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 'f', 'f', 't', 77, 'Introduce', '', 'nvarchar(255)', 'String', 'Introduce', NULL, '2022-06-08 21:28:49.884799', '2022-05-24 00:00:00', '简介');
INSERT INTO "public"."LowCodeTableInfo" VALUES ('8ad408db-b5aa-4cb7-d494-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 'f', 'f', 't', 43, 'CreationTime', '', 'datetime', 'DateTime', 'CreationTime', 8, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('92bc9094-160e-4338-d4a4-08da3d8d5a26', '7ad3b915-f0bd-443a-89cd-42d41dd6c554', 'f', 'f', 't', 59, 'UserId', '审批人Id', 'uniqueidentifier', 'Guid', 'UserId', 16, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('92c1fffc-5a00-468c-d4b0-08da3d8d5a26', '852f53ff-0d00-4c32-aa55-a9c11993751b', 'f', 'f', 't', 191, 'CreationTime', '', 'datetime', 'DateTime', 'CreationTime', 8, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('97284d66-88b9-478f-d4e5-08da3d8d5a26', 'e79db53b-7162-4669-9b5e-f860501475ac', 't', 'f', 'f', 82, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('9a050102-6300-46ef-d516-08da3d8d5a26', '2ae9e532-7d9a-474b-b629-50a39945c44d', 'f', 'f', 't', 131, 'Remark', '', 'varchar(100)', 'String', 'Remark', 100, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('9a850f29-2dd2-4779-d4f6-08da3d8d5a26', 'af37f705-7ba0-4883-b1be-8a274ea4c026', 'f', 'f', 't', 97, 'Value', '值', 'varchar(255)', 'String', 'Value', 255, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('9b1b319a-e9dc-406d-d4c4-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 't', 'f', 'f', 196, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('9bc385e0-10ee-4299-d4a9-08da3d8d5a26', 'ae6d94d8-6a15-4348-b600-aa17e4b61718', 'f', 'f', 't', 64, 'FlowId', '', 'uniqueidentifier', 'Guid', 'FlowId', 16, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('9c4158f4-b5b5-4928-d50f-08da3d8d5a26', '2ae9e532-7d9a-474b-b629-50a39945c44d', 't', 'f', 'f', 124, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('9c9f9672-3fa0-4c65-d4e9-08da3d8d5a26', 'e79db53b-7162-4669-9b5e-f860501475ac', 'f', 'f', 't', 85, 'RoleId', '', 'uniqueidentifier', 'Guid', 'RoleId', 16, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('9de60dd7-a403-442d-d4e7-08da3d8d5a26', 'e79db53b-7162-4669-9b5e-f860501475ac', 'f', 'f', 't', 83, 'LastModificationTime', '', 'datetime', 'DateTime', 'LastModificationTime', 8, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('a0fdeb45-c9fe-439b-d48a-08da3d8d5a26', 'd8948c56-c5bd-4061-b272-5417375f38f0', 'f', 'f', 't', 39, 'FlowCode', '流程编码', 'varchar(255)', 'String', 'FlowCode', 255, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('a2660342-556e-4aef-d4b4-08da3d8d5a26', '852f53ff-0d00-4c32-aa55-a9c11993751b', 'f', 'f', 't', 193, 'Low_Code_Table_InfoId', '', 'uniqueidentifier', 'Guid', 'Low_Code_Table_InfoId', 16, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('a29e0236-9c06-4a70-d4b7-08da3d8d5a26', '69edd8a8-1d24-478c-a909-b82039edcec0', 'f', 'f', 't', 186, 'CreationTime', '', 'datetime', 'DateTime', 'CreationTime', 8, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('a61101b5-8e66-4456-d4fa-08da3d8d5a26', '6fabc67a-8b48-49a6-8ba1-c8a32c499d36', 'f', 'f', 't', 105, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', 6, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('a62bb184-93b0-40e3-d51b-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 'f', 'f', 't', 13, 'ControllerDisplayName', '', 'varchar(255)', 'String', 'ControllerDisplayName', 255, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('a72c0341-82e8-48ad-d481-08da3d8d5a26', '1a8df018-79f8-4e26-b4eb-4b735aae7275', 't', 'f', 'f', 24, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('a8be7873-7ce4-4cb2-d498-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 'f', 'f', 't', 49, 'OpinIons', '步骤审批意见', 'varchar(255)', 'String', 'OpinIons', 255, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('a908815c-c0e6-4565-d512-08da3d8d5a26', '2ae9e532-7d9a-474b-b629-50a39945c44d', 'f', 'f', 't', 130, 'FunctionName', '', 'varchar(100)', 'String', 'FunctionName', 100, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('a932f1ce-a55a-480b-d520-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 'f', 'f', 't', 2, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', 6, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('a9766bbb-21bf-46da-d54f-08da3d8d5a26', '69b24f04-0ed3-45fc-91d9-0dc929175a57', 't', 'f', 'f', 174, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('aaa312a2-73fb-4c84-d496-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 'f', 'f', 't', 46, 'FlowNodeName', '审批流节点名称', 'varchar(255)', 'String', 'FlowNodeName', 255, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('aaa5fae3-8c5b-4427-d4fb-08da3d8d5a26', '6fabc67a-8b48-49a6-8ba1-c8a32c499d36', 'f', 'f', 't', 102, 'Name', '', 'nvarchar(255)', 'String', 'Name', 255, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('ab5c0b3d-8871-42fd-d4f1-08da3d8d5a26', 'af37f705-7ba0-4883-b1be-8a274ea4c026', 'f', 't', 'f', 92, 'Id', 'id', 'int', 'Int32', 'Id', 4, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('aba55ad7-7153-4658-d4f2-08da3d8d5a26', 'af37f705-7ba0-4883-b1be-8a274ea4c026', 'f', 'f', 't', 93, 'LastModificationTime', '更新时间', 'datetime', 'DateTime', 'LastModificationTime', 8, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('acf079d0-3db9-43f7-d490-08da3d8d5a26', 'd8948c56-c5bd-4061-b272-5417375f38f0', 'f', 'f', 't', 34, 'UserId', '发起人Id', 'uniqueidentifier', 'Guid', 'UserId', 16, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('ae55fabc-3944-4a36-d49f-08da3d8d5a26', '7ad3b915-f0bd-443a-89cd-42d41dd6c554', 'f', 'f', 't', 55, 'CreationTime', '', 'datetime', 'DateTime', 'CreationTime', 8, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('b1f89f8d-8e22-4c4a-d504-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 'f', 'f', 't', 120, 'KeepAlive', '', 'bit', 'Boolean', 'KeepAlive', 1, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('b24ac0e3-71ab-4d48-d541-08da3d8d5a26', '8da38d20-8a09-4e81-8dd8-ed6702aee380', 'f', 'f', 't', 162, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', 6, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('b52a9e8c-dffb-40b7-d506-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 'f', 'f', 't', 110, 'LevelCode', '', 'varchar(50)', 'String', 'LevelCode', NULL, '2022-05-24 21:58:07', '2022-05-24 00:00:00', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('b6422cb6-498e-4ff5-d4e6-08da3d8d5a26', 'e79db53b-7162-4669-9b5e-f860501475ac', 'f', 'f', 't', 84, 'CreationTime', '', 'datetime', 'DateTime', 'CreationTime', 8, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('b754af63-f1de-4000-d4a0-08da3d8d5a26', '7ad3b915-f0bd-443a-89cd-42d41dd6c554', 'f', 'f', 't', 56, 'FlowApprovalStepId', '步骤Id', 'uniqueidentifier', 'Guid', 'FlowApprovalStepId', 16, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('b76500c1-91f8-4e44-d531-08da3d8d5a26', '0a8bdb18-758a-4798-9ffc-e7031dcbf262', 'f', 'f', 't', 145, 'Code', '', 'nvarchar(255)', 'String', 'Code', 255, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('b97d19d1-948a-489f-d4bb-08da3d8d5a26', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 't', 'f', 'f', 15, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('b9bbab1d-0a03-4d07-d488-08da3d8d5a26', 'd8948c56-c5bd-4061-b272-5417375f38f0', 't', 'f', 'f', 31, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('b9bfca2e-f72b-4a3f-d52f-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 'f', 'f', 't', 139, 'State', '', 'int', 'Int32', 'State', 4, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('ba392537-c1c5-4ecc-d517-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 't', 'f', 'f', 1, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('bbac9a7c-6e62-4fe6-d4ef-08da3d8d5a26', 'af37f705-7ba0-4883-b1be-8a274ea4c026', 'f', 'f', 't', 96, 'Code', '编码', 'varchar(255)', 'String', 'Code', 255, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('be481209-565b-4099-d53c-08da3d8d5a26', 'f3d7bbb3-c1fb-4d61-92a4-9bc101811335', 'f', 'f', 't', 155, 'Name', '', 'nvarchar(255)', 'String', 'Name', 255, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('be86a4ee-e843-4c2a-d4e1-08da3d8d5a26', 'c5883367-42aa-43b8-9577-4720a2253efa', 'f', 'f', 't', 212, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', 6, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('bfec557a-1223-49ec-d4de-08da3d8d5a26', 'c5883367-42aa-43b8-9577-4720a2253efa', 't', 'f', 'f', 210, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('c03ba636-abb2-43f7-d4e2-08da3d8d5a26', 'c5883367-42aa-43b8-9577-4720a2253efa', 'f', 'f', 't', 211, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', 6, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('c2f1a286-2b35-41d6-d4af-08da3d8d5a26', '852f53ff-0d00-4c32-aa55-a9c11993751b', 't', 'f', 'f', 189, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('c7b2ad1d-ecb0-4497-d515-08da3d8d5a26', '2ae9e532-7d9a-474b-b629-50a39945c44d', 'f', 'f', 't', 127, 'Number', '', 'int', 'Int32', 'Number', 4, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('ca605278-6972-48b4-d51f-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 'f', 'f', 't', 5, 'Ip', 'ip地址', 'varchar(255)', 'String', 'Ip', 255, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('caae5d6f-f9c7-4edb-d48d-08da3d8d5a26', 'd8948c56-c5bd-4061-b272-5417375f38f0', 'f', 'f', 't', 37, 'FormId', '表单Id', 'varchar(50)', 'String', 'FormId', 50, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('cb5f9ecf-9317-4b11-d553-08da3d8d5a26', '69b24f04-0ed3-45fc-91d9-0dc929175a57', 'f', 'f', 't', 175, 'UserId', '', 'uniqueidentifier', 'Guid', 'UserId', 16, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('cbd75568-2ece-4f90-d49b-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 'f', 'f', 't', 48, 'State', '步骤状态（待审批、同意、不同意、回退升级审批）', 'int', 'Int32', 'State', 4, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('ce802713-74f5-4f30-d527-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 'f', 'f', 't', 138, 'Email', '', 'nvarchar(255)', 'String', 'Email', 255, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('cf2e3691-ab88-4420-d529-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 'f', 'f', 't', 136, 'Leader', '', 'nvarchar(255)', 'String', 'Leader', 255, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('cf99d60b-2392-493c-d4ce-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 'f', 'f', 't', 197, 'LastModificationTime', '', 'datetime', 'DateTime', 'LastModificationTime', 8, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('d0fbf229-7204-4494-d50c-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 'f', 'f', 't', 121, 'State', '', 'bit', 'Boolean', 'State', 1, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('d41bd8db-1b3f-48fa-d543-08da3d8d5a26', '8da38d20-8a09-4e81-8dd8-ed6702aee380', 'f', 'f', 't', 160, 'MenuId', '', 'int', 'Int32', 'MenuId', 4, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('d45ac420-e348-4d6b-d4aa-08da3d8d5a26', 'ae6d94d8-6a15-4348-b600-aa17e4b61718', 'f', 'f', 't', 62, 'LastModificationTime', '', 'datetime', 'DateTime', 'LastModificationTime', 8, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('d48c70e6-4549-41b6-d4a2-08da3d8d5a26', '7ad3b915-f0bd-443a-89cd-42d41dd6c554', 'f', 'f', 't', 58, 'FlowNodeName', '审批节点名称', 'varchar(500)', 'String', 'FlowNodeName', 500, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('b7fbb61f-94fc-4242-d4d3-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 'f', 'f', 't', 75, 'Birthday', '', 'datetime2', 'DateTime', 'Birthday', NULL, '2022-06-08 21:28:49.884798', '2022-05-24 00:00:00', '生日');
INSERT INTO "public"."LowCodeTableInfo" VALUES ('bf24a276-6ed0-49d4-d4d9-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 'f', 'f', 't', 71, 'Number', '', 'nvarchar(255)', 'String', 'Number', NULL, '2022-06-08 21:28:49.884798', '2022-05-24 00:00:00', '编号');
INSERT INTO "public"."LowCodeTableInfo" VALUES ('d6008705-0d21-42ac-d525-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 't', 't', 'f', 132, 'Id', '', 'int', 'Int32', 'Id', 4, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('d7ef7a4e-f4b9-4ac4-d4bd-08da3d8d5a26', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 'f', 'f', 't', 21, 'DisplayName', '', 'varchar(200)', 'String', 'DisplayName', 200, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('dbe000fc-4895-42f2-d53e-08da3d8d5a26', 'f3d7bbb3-c1fb-4d61-92a4-9bc101811335', 'f', 'f', 't', 156, 'Remark', '', 'nvarchar(255)', 'String', 'Remark', 255, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('dd367fd5-2030-43b2-d53d-08da3d8d5a26', 'f3d7bbb3-c1fb-4d61-92a4-9bc101811335', 'f', 'f', 't', 154, 'Number', '', 'int', 'Int32', 'Number', 4, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('de43269d-d43b-4a77-d4d0-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 'f', 'f', 't', 209, 'MaxLength', '', 'int', 'Int32', 'MaxLength', 4, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('de898f57-abe7-4d2c-d4ed-08da3d8d5a26', '524e71b4-cbf7-4248-8b29-3f99b43f2eb2', 'f', 'f', 't', 90, 'SysDataAuthorityId', '', 'uniqueidentifier', 'Guid', 'SysDataAuthorityId', 16, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('df559c6b-6f60-467c-d4ea-08da3d8d5a26', '524e71b4-cbf7-4248-8b29-3f99b43f2eb2', 't', 'f', 'f', 87, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('e0e9d3c3-b713-419c-d4c7-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 'f', 'f', 't', 208, 'CsField', '', 'varchar(50)', 'String', 'CsField', 50, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('e1316750-62a4-46aa-d4f7-08da3d8d5a26', '6fabc67a-8b48-49a6-8ba1-c8a32c499d36', 't', 'f', 'f', 100, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('e346cf76-ec76-4409-d49e-08da3d8d5a26', '7ad3b915-f0bd-443a-89cd-42d41dd6c554', 't', 'f', 'f', 53, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('e4dd55f0-9697-43ae-d513-08da3d8d5a26', '2ae9e532-7d9a-474b-b629-50a39945c44d', 'f', 'f', 't', 125, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', 6, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('e571fd26-b1a8-4648-d4ae-08da3d8d5a26', 'ae6d94d8-6a15-4348-b600-aa17e4b61718', 'f', 'f', 't', 66, 'Sort', '', 'int', 'Int32', 'Sort', 4, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('e67fd0c6-a997-4956-d49c-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 'f', 'f', 't', 50, 'UserId', '步骤审批人Id', 'uniqueidentifier', 'Guid', 'UserId', 16, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('e74c1f4b-af12-4eaa-d507-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 'f', 'f', 't', 112, 'Name', '', 'nvarchar(255)', 'String', 'Name', NULL, '2022-05-24 21:58:07', '2022-05-24 00:00:00', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('e7facee2-5132-4003-d4b2-08da3d8d5a26', '852f53ff-0d00-4c32-aa55-a9c11993751b', 'f', 'f', 't', 194, 'ForeignKeyTableId', '', 'uniqueidentifier', 'Guid', 'ForeignKeyTableId', 16, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('e8e60481-fb7f-4f1d-d499-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 'f', 'f', 't', 44, 'Sort', '步骤顺序号', 'int', 'Int32', 'Sort', 4, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('ea63351c-c203-4d40-d52e-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 'f', 'f', 't', 137, 'Phone', '', 'nvarchar(255)', 'String', 'Phone', 255, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('eb846ac3-723e-4207-d4c8-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 'f', 'f', 't', 207, 'CsType', '', 'varchar(50)', 'String', 'CsType', 50, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('ee8ca902-4e27-40c5-d518-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 'f', 'f', 't', 14, 'ActionDisplayName', '', 'varchar(255)', 'String', 'ActionDisplayName', 255, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('f00cde73-2294-40d6-d48c-08da3d8d5a26', 'd8948c56-c5bd-4061-b272-5417375f38f0', 'f', 'f', 't', 40, 'FlowName', '流程名称', 'varchar(255)', 'String', 'FlowName', 255, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('f029b676-48ac-4ba3-d509-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 'f', 'f', 't', 117, 'ParentId', '', 'int', 'Int32', 'ParentId', 4, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('f21d4c33-e65a-4dfe-d487-08da3d8d5a26', '1a8df018-79f8-4e26-b4eb-4b735aae7275', 'f', 'f', 't', 30, 'Remark', '备注', 'nvarchar(255)', 'String', 'Remark', 255, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('f221da94-0a1d-4ce7-d4cf-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 'f', 'f', 't', 199, 'Low_Code_TableId', '', 'uniqueidentifier', 'Guid', 'Low_Code_TableId', 16, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('f24f0e45-209e-46b7-d544-08da3d8d5a26', '8da38d20-8a09-4e81-8dd8-ed6702aee380', 'f', 'f', 't', 159, 'RoleId', '', 'uniqueidentifier', 'Guid', 'RoleId', 16, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('f5193134-b39d-4ca0-d502-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 'f', 'f', 't', 116, 'Icon', '', 'nvarchar(255)', 'String', 'Icon', NULL, '2022-05-24 21:58:07', '2022-05-24 00:00:00', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('f5c93cc7-50a6-4e0e-d492-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 't', 'f', 'f', 41, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('f6d23541-2fca-40e6-d493-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 'f', 'f', 't', 52, 'ApprovalDate', '审批时间', 'datetime', 'DateTime', 'ApprovalDate', 8, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('f731ccd3-9a9c-4dda-d550-08da3d8d5a26', '69b24f04-0ed3-45fc-91d9-0dc929175a57', 'f', 'f', 't', 178, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', 6, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('f9fd0e13-4e5d-42b4-d4fc-08da3d8d5a26', '6fabc67a-8b48-49a6-8ba1-c8a32c499d36', 'f', 'f', 't', 101, 'Number', '', 'int', 'Int32', 'Number', 4, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('fa8b1456-88f3-4d4e-d4c0-08da3d8d5a26', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 'f', 'f', 't', 23, 'Remark', '', 'varchar(500)', 'String', 'Remark', 500, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('fbf2d2c1-454b-4898-d510-08da3d8d5a26', '2ae9e532-7d9a-474b-b629-50a39945c44d', 'f', 'f', 't', 126, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', 6, '2022-05-24 21:57:34', '2022-05-24 21:57:34', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('fd9abf54-3c88-44b0-d484-08da3d8d5a26', '1a8df018-79f8-4e26-b4eb-4b735aae7275', 'f', 'f', 't', 25, 'LastModificationTime', '', 'datetime', 'DateTime', 'LastModificationTime', 8, '2022-05-24 21:57:33', '2022-05-24 21:57:33', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('287314b2-3141-4957-d548-08da3d8d5a26', '6323638b-a45f-4a76-886e-69a9e9be0901', 'f', 'f', 'f', 171, 'Email', '', 'nvarchar(255)', 'String', 'Email', NULL, '2022-06-08 21:27:46.456967', '2022-05-24 00:00:00', '电子邮箱');
INSERT INTO "public"."LowCodeTableInfo" VALUES ('46bac66f-3cf0-46b3-d546-08da3d8d5a26', '6323638b-a45f-4a76-886e-69a9e9be0901', 'f', 'f', 't', 166, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', NULL, '2022-06-08 21:27:46.456967', '2022-05-24 00:00:00', '创建时间');
INSERT INTO "public"."LowCodeTableInfo" VALUES ('4b5bc027-5663-463a-d54b-08da3d8d5a26', '6323638b-a45f-4a76-886e-69a9e9be0901', 'f', 'f', 't', 167, 'Name', '', 'nvarchar(255)', 'String', 'Name', NULL, '2022-06-08 21:27:46.456967', '2022-05-24 00:00:00', '用户名称');
INSERT INTO "public"."LowCodeTableInfo" VALUES ('5a9fa990-b6d6-445f-d54c-08da3d8d5a26', '6323638b-a45f-4a76-886e-69a9e9be0901', 'f', 'f', 't', 173, 'OrganizationId', '', 'int', 'Int32', 'OrganizationId', NULL, '2022-06-08 21:27:46.456967', '2022-05-24 00:00:00', '组织id');
INSERT INTO "public"."LowCodeTableInfo" VALUES ('5bcf7406-75cc-4171-d545-08da3d8d5a26', '6323638b-a45f-4a76-886e-69a9e9be0901', 't', 'f', 'f', 164, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', NULL, '2022-06-08 21:27:46.456966', '2022-05-24 00:00:00', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('7cbe8988-cbac-4ea2-d54a-08da3d8d5a26', '6323638b-a45f-4a76-886e-69a9e9be0901', 'f', 'f', 't', 168, 'LoginName', '', 'nvarchar(255)', 'String', 'LoginName', NULL, '2022-06-08 21:27:46.456967', '2022-05-24 00:00:00', '登录名称');
INSERT INTO "public"."LowCodeTableInfo" VALUES ('a6752bd9-f3d6-451f-d547-08da3d8d5a26', '6323638b-a45f-4a76-886e-69a9e9be0901', 'f', 'f', 't', 172, 'DeleteLock', '', 'bit', 'Boolean', 'DeleteLock', NULL, '2022-06-08 21:27:46.456967', '2022-05-24 00:00:00', '删除锁');
INSERT INTO "public"."LowCodeTableInfo" VALUES ('c82d5132-6cda-463e-d54e-08da3d8d5a26', '6323638b-a45f-4a76-886e-69a9e9be0901', 'f', 'f', 't', 170, 'Phone', '', 'nvarchar(255)', 'String', 'Phone', NULL, '2022-06-08 21:27:46.456967', '2022-05-24 00:00:00', '联系电话');
INSERT INTO "public"."LowCodeTableInfo" VALUES ('e36410b5-cb7c-4fc3-d54d-08da3d8d5a26', '6323638b-a45f-4a76-886e-69a9e9be0901', 'f', 'f', 't', 169, 'Password', '', 'nvarchar(255)', 'String', 'Password', NULL, '2022-06-08 21:27:46.456967', '2022-05-24 00:00:00', '密码');
INSERT INTO "public"."LowCodeTableInfo" VALUES ('e5418d61-916f-45fd-d549-08da3d8d5a26', '6323638b-a45f-4a76-886e-69a9e9be0901', 'f', 'f', 't', 165, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', NULL, '2022-06-08 21:27:46.456967', '2022-05-24 00:00:00', '更新时间');
INSERT INTO "public"."LowCodeTableInfo" VALUES ('837b058b-a88e-4107-d4dd-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 'f', 'f', 't', 79, 'UserId', '', 'uniqueidentifier', 'Guid', 'UserId', NULL, '2022-06-08 21:28:49.884799', '2022-05-24 00:00:00', '所属用户');
INSERT INTO "public"."LowCodeTableInfo" VALUES ('897a208c-2e13-46f1-d4d7-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 'f', 'f', 't', 81, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', NULL, '2022-06-08 21:28:49.884799', '2022-05-24 00:00:00', '更新时间');
INSERT INTO "public"."LowCodeTableInfo" VALUES ('d1eb49cf-c053-4226-d4d8-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 'f', 'f', 't', 72, 'Name', '', 'nvarchar(255)', 'String', 'Name', NULL, '2022-06-08 21:28:49.884798', '2022-05-24 00:00:00', '会员名称');
INSERT INTO "public"."LowCodeTableInfo" VALUES ('e4245f5f-bffa-43f0-d4d5-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 'f', 'f', 't', 78, 'FilePath', '', 'nvarchar(255)', 'String', 'FilePath', NULL, '2022-06-08 21:28:49.884799', '2022-05-24 00:00:00', '文件地址');
INSERT INTO "public"."LowCodeTableInfo" VALUES ('e75b8650-ee49-4f83-d4d2-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 't', 'f', 'f', 70, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', NULL, '2022-06-08 21:28:49.884798', '2022-05-24 00:00:00', NULL);
INSERT INTO "public"."LowCodeTableInfo" VALUES ('f03ac01c-e0cf-4f13-d4db-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 'f', 'f', 't', 76, 'Photo', '', 'nvarchar(255)', 'String', 'Photo', NULL, '2022-06-08 21:28:49.884798', '2022-05-24 00:00:00', '头像');

-- ----------------------------
-- Table structure for Member
-- ----------------------------
DROP TABLE IF EXISTS "public"."Member";
CREATE TABLE "public"."Member" (
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
  "LastModificationTime" timestamp(6) NOT NULL,
  "CreationTime" timestamp(6) NOT NULL
)
;

-- ----------------------------
-- Records of Member
-- ----------------------------
INSERT INTO "public"."Member" VALUES ('96a1aa3d-a61a-42d0-954a-c71753fb2065', '123', '123', '123', '女', '2018-04-25 23:00:00', NULL, '<p>123</p>', NULL, 'ac18f496-e93d-42f0-b59e-e321acc85335', '2021-04-18 22:08:06', '2020-10-24 00:07:42');
INSERT INTO "public"."Member" VALUES ('9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', '1', '测试会员', '18510912123', '男', '2019-07-08 11:47:24', 'http://localhost:5600http://localhost:5600http://localhost:5600/upload/files/20210118/time_232747_old_name_hzy.png', '<p>999888</p>', '/upload/files/20210118/time_233310_old_name_hzy.png', 'ac18f496-e93d-42f0-b59e-e321acc85335', '2022-05-08 16:46:21', '2018-04-25 23:00:00');

-- ----------------------------
-- Table structure for SysDataAuthority
-- ----------------------------
DROP TABLE IF EXISTS "public"."SysDataAuthority";
CREATE TABLE "public"."SysDataAuthority" (
  "Id" uuid NOT NULL,
  "PermissionType" int4 NOT NULL,
  "RoleId" uuid NOT NULL,
  "LastModificationTime" timestamp(6) NOT NULL,
  "CreationTime" timestamp(6) NOT NULL
)
;

-- ----------------------------
-- Records of SysDataAuthority
-- ----------------------------
INSERT INTO "public"."SysDataAuthority" VALUES ('0228a5b5-2202-4ba0-6e48-08da205da7b7', 5, '18fa4771-6f58-46a3-80d2-6f0f5e9972e3', '2022-04-17 18:33:04', '2022-04-17 18:33:04');
INSERT INTO "public"."SysDataAuthority" VALUES ('d09bf250-c5b0-41cb-237d-08da00442990', 5, '40ff1844-c099-4061-98e0-cd6e544fcfd3', '2022-03-08 10:02:22', '2022-03-07 22:09:58');

-- ----------------------------
-- Table structure for SysDataAuthorityCustom
-- ----------------------------
DROP TABLE IF EXISTS "public"."SysDataAuthorityCustom";
CREATE TABLE "public"."SysDataAuthorityCustom" (
  "Id" uuid NOT NULL,
  "SysDataAuthorityId" uuid,
  "SysOrganizationId" int4 NOT NULL,
  "LastModificationTime" timestamp(6) NOT NULL,
  "CreationTime" timestamp(6) NOT NULL
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
  "LastModificationTime" timestamp(6) NOT NULL,
  "CreationTime" timestamp(6) NOT NULL
)
;

-- ----------------------------
-- Records of SysDictionary
-- ----------------------------
INSERT INTO "public"."SysDictionary" VALUES (1, 1, 'news_type', '资讯类别', NULL, NULL, '2021-07-25 22:39:34', '2021-07-25 22:31:30');
INSERT INTO "public"."SysDictionary" VALUES (2, 1, 'news_type_nan', '男', '1', 1, '2021-07-25 22:40:30', '2021-07-25 22:38:49');
INSERT INTO "public"."SysDictionary" VALUES (3, 2, 'news_type_nv', '女', '2', 1, '2022-04-23 22:18:52', '2021-07-25 22:40:47');

-- ----------------------------
-- Table structure for SysFunction
-- ----------------------------
DROP TABLE IF EXISTS "public"."SysFunction";
CREATE TABLE "public"."SysFunction" (
  "Id" uuid NOT NULL,
  "Number" int4,
  "Name" text COLLATE "pg_catalog"."default",
  "ByName" text COLLATE "pg_catalog"."default",
  "Remark" text COLLATE "pg_catalog"."default",
  "LastModificationTime" timestamp(6) NOT NULL,
  "CreationTime" timestamp(6) NOT NULL
)
;

-- ----------------------------
-- Records of SysFunction
-- ----------------------------
INSERT INTO "public"."SysFunction" VALUES ('2401f4d0-60b0-4e2e-903f-84c603373572', 70, '导出', 'Export', 'Export', '2021-04-18 22:08:06', '2016-06-20 13:40:52');
INSERT INTO "public"."SysFunction" VALUES ('383e7ee2-7690-46ac-9230-65155c84aa30', 50, '保存', 'Save', 'Save', '2021-04-18 22:08:06', '2016-06-20 13:40:52');
INSERT INTO "public"."SysFunction" VALUES ('9c388461-2704-4c5e-a729-72c17e9018e1', 40, '删除', 'Delete', 'Delete', '2021-04-18 22:08:06', '2016-06-20 13:40:52');
INSERT INTO "public"."SysFunction" VALUES ('b6fd5425-504a-46a9-993b-2f8dc9158eb8', 80, '打印', 'Print', 'Print', '2021-04-18 22:08:06', '2016-06-20 13:40:52');
INSERT INTO "public"."SysFunction" VALUES ('bffefb1c-8988-4ddf-b4ac-81c2b30e80cd', 20, '添加', 'Insert', 'Insert', '2021-04-18 22:08:06', '2016-06-20 13:40:52');
INSERT INTO "public"."SysFunction" VALUES ('c9518758-b2e1-4f51-b517-5282e273889c', 10, '显示', 'Display', 'Display', '2021-04-18 22:08:06', '2016-06-20 13:40:52');
INSERT INTO "public"."SysFunction" VALUES ('e7ef2a05-8317-41c3-b588-99519fe88bf9', 30, '修改', 'Update', 'Update', '2021-04-18 22:08:06', '2016-06-20 13:40:52');
INSERT INTO "public"."SysFunction" VALUES ('f27ecb0a-197d-47b1-b243-59a8c71302bf', 60, '检索', 'Search', 'Search', '2021-04-18 22:08:06', '2016-06-20 13:40:52');

-- ----------------------------
-- Table structure for SysMenu
-- ----------------------------
DROP TABLE IF EXISTS "public"."SysMenu";
CREATE TABLE "public"."SysMenu" (
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
  "LastModificationTime" timestamp(6) NOT NULL,
  "CreationTime" timestamp(6) NOT NULL
)
;

-- ----------------------------
-- Records of SysMenu
-- ----------------------------
INSERT INTO "public"."SysMenu" VALUES (1, '1', 10, '更多示例', NULL, NULL, NULL, NULL, 'MoreOutlined', NULL, 't', 't', 't', 't', 1, '2022-03-04 12:25:39', '2021-05-28 11:49:02');
INSERT INTO "public"."SysMenu" VALUES (2, '1.2', 10, 'Antd Vue3.0组件', 'AppComponentsCom', 'views/AppComponents.vue', '/app/components', NULL, 'LayoutOutlined', 1, 't', 't', 't', 't', 2, '2022-03-18 12:06:20', '2021-01-16 16:05:22');
INSERT INTO "public"."SysMenu" VALUES (3, '1.3', 30, '按钮', 'ButtonCom', 'views/Button.vue', '/button', NULL, 'AppstoreOutlined', 1, 't', 't', 't', 't', 2, '2022-03-04 12:26:14', '2020-12-17 14:58:05');
INSERT INTO "public"."SysMenu" VALUES (4, '1.4', 40, '图表 AntV G2', NULL, NULL, NULL, NULL, 'PieChartOutlined', 1, 't', 't', 't', 't', 1, '2022-03-04 12:26:21', '2021-01-16 16:06:33');
INSERT INTO "public"."SysMenu" VALUES (5, '1.4.5', 10, '基础图表', 'ChartBaseCom', 'views/chart/Base.vue', '/chart/base', NULL, NULL, 4, 't', 't', 't', 't', 2, '2022-03-04 12:26:25', '2021-01-16 16:07:24');
INSERT INTO "public"."SysMenu" VALUES (6, '1.4.6', 20, '更多图表', 'ChartMoreCom', 'views/chart/More.vue', '/chart/more', NULL, NULL, 4, 't', 't', 't', 't', 2, '2022-03-04 12:26:28', '2021-01-16 16:10:06');
INSERT INTO "public"."SysMenu" VALUES (7, '1.7', 50, '表格管理', NULL, NULL, NULL, NULL, 'TableOutlined', 1, 't', 't', 't', 't', 1, '2022-03-04 12:26:34', '2018-03-10 12:16:38');
INSERT INTO "public"."SysMenu" VALUES (8, '1.7.8', 100, '基础列表', 'BaseListCom', 'views/BaseList.vue', '/base/list', NULL, NULL, 7, 't', 't', 't', 't', 2, '2022-03-04 12:26:38', '2020-12-17 14:49:12');
INSERT INTO "public"."SysMenu" VALUES (9, '1.7.9', 110, '标准表格', 'ListIndexCom', 'views/list/Index.vue', '/list', NULL, NULL, 7, 't', 't', 't', 't', 2, '2022-03-04 12:26:41', '2020-12-17 14:51:07');
INSERT INTO "public"."SysMenu" VALUES (10, '1.10', 60, '富文本编辑器', 'EditorCom', 'views/Editor.vue', '/editor', NULL, 'PicRightOutlined', 1, 't', 't', 't', 't', 2, '2022-03-04 12:26:46', '2021-01-18 19:34:28');
INSERT INTO "public"."SysMenu" VALUES (11, '1.11', 70, '跳转外部地址', 'ExternalJumpCom', 'components/ExternalJump.vue', '/external/jump/:path(.*)', 'https://antv.vision/zh', 'RadarChartOutlined', 1, 't', 't', 't', 't', 2, '2022-03-04 12:26:49', '2021-08-05 21:51:12');
INSERT INTO "public"."SysMenu" VALUES (12, '12', 50, '基础信息', NULL, NULL, NULL, NULL, 'GoldOutlined', NULL, 't', 't', 't', 't', 1, '2022-03-04 12:25:43', '2018-03-10 12:16:38');
INSERT INTO "public"."SysMenu" VALUES (13, '12.13', 10, '会员管理', 'base_member', 'views/base/member/Index.vue', '/base/member', NULL, 'UsergroupAddOutlined', 12, 't', 't', 't', 't', 2, '2022-03-04 12:26:55', '2018-03-10 12:16:38');
INSERT INTO "public"."SysMenu" VALUES (14, '14', 100, '系统管理', NULL, NULL, NULL, NULL, 'DesktopOutlined', NULL, 't', 't', 't', 't', 1, '2022-03-04 12:25:46', '2018-03-10 12:16:38');
INSERT INTO "public"."SysMenu" VALUES (15, '14.15', 100, '账户管理', 'system_user', 'views/system/user/Index.vue', '/system/user', NULL, 'UserOutlined', 14, 't', 't', 't', 't', 2, '2022-03-04 12:27:02', '2018-03-10 12:16:38');
INSERT INTO "public"."SysMenu" VALUES (16, '14.16', 110, '角色管理', 'system_role', 'views/system/role/Index.vue', '/system/role', NULL, 'TeamOutlined', 14, 't', 't', 't', 't', 2, '2022-04-22 22:24:03', '2018-03-10 12:16:38');
INSERT INTO "public"."SysMenu" VALUES (17, '14.17', 120, '功能管理', 'system_function', 'views/system/function/Index.vue', '/system/function', NULL, 'ControlOutlined', 14, 't', 't', 't', 't', 2, '2022-03-04 12:27:11', '2018-03-10 12:16:38');
INSERT INTO "public"."SysMenu" VALUES (19, '14.19', 150, '个人中心', 'system_personal_center', 'views/system/personal_center/Index.vue', '/system/personal/center', NULL, 'FormOutlined', 14, 't', 't', 't', 't', 2, '2022-03-04 12:27:19', '2018-03-10 12:16:38');
INSERT INTO "public"."SysMenu" VALUES (20, '14.20', 160, '岗位管理', 'system_post', 'views/system/post/Index.vue', '/system/post', NULL, 'IdcardOutlined', 14, 't', 't', 't', 't', 2, '2022-03-04 12:27:23', '2021-05-27 17:29:49');
INSERT INTO "public"."SysMenu" VALUES (21, '14.21', 170, '组织机构', 'system_organization', 'views/system/organization/Index.vue', '/system/organization', NULL, 'ClusterOutlined', 14, 't', 't', 't', 't', 2, '2022-03-04 12:27:27', '2021-05-27 20:27:56');
INSERT INTO "public"."SysMenu" VALUES (22, '29.22', 10, '接口文档', 'swagger', 'views/development_tool/Swagger.vue', '/development_tool/swagger', NULL, 'FileSearchOutlined', 29, 't', 't', 't', 't', 2, '2022-03-04 12:27:41', '2018-03-10 12:17:03');
INSERT INTO "public"."SysMenu" VALUES (23, '14.23', 190, '数据字典', 'system_dictionary', 'views/system/dictionary/Index.vue', '/system/dictionary', NULL, 'FileDoneOutlined', 14, 't', 't', 't', 't', 2, '2022-03-04 12:27:31', '2021-07-25 21:50:01');
INSERT INTO "public"."SysMenu" VALUES (24, '14.24', 200, '操作日志', 'sys_operation_log', 'views/system/sys_operation_log/Index.vue', '/system/sys_operation_log', '', 'ContainerOutlined', 14, 't', 't', 't', 't', 2, '2022-03-04 12:27:35', '2021-08-05 21:24:54');
INSERT INTO "public"."SysMenu" VALUES (25, '14.25', 130, '菜单功能', 'system_menu', 'views/system/menu/Index.vue', '/system/menu', NULL, 'MenuOutlined', 14, 't', 't', 't', 't', 2, '2022-03-04 12:27:15', '2018-03-10 12:16:38');
INSERT INTO "public"."SysMenu" VALUES (28, '1.28', 1, 'Vxe-Table', 'VxeTableCom', 'views/VxeTable.vue', '/vxe/table', NULL, 'BorderlessTableOutlined', 1, 't', 't', 't', 't', 2, '2022-03-04 12:26:00', '2021-12-29 17:13:26');
INSERT INTO "public"."SysMenu" VALUES (29, '29', 200, '开发工具', NULL, NULL, NULL, NULL, 'CodepenOutlined', NULL, 't', 't', 't', 't', 1, '2022-03-04 12:25:49', '2022-01-12 14:17:21');
INSERT INTO "public"."SysMenu" VALUES (30, '29.30', 20, '定时任务', 'TimedTaskCom', 'views/development_tool/timed_task/Index.vue', '/development_tool/timed_task', NULL, 'FieldTimeOutlined', 29, 't', 't', 't', 't', 2, '2022-03-04 12:27:44', '2022-01-12 14:22:04');
INSERT INTO "public"."SysMenu" VALUES (31, '29.31', 30, '代码生成', 'LowCode', 'views/development_tool/low_code/Index.vue', '/development-tool/low-code', NULL, 'CodeTwoTone', 29, 't', 't', 't', 't', 2, '2022-05-24 22:05:57', '2022-01-12 15:39:46');
INSERT INTO "public"."SysMenu" VALUES (32, '1.32', 20, '图标展示', 'IconsVue', 'views/Icons.vue', '/icons', NULL, 'TagsTwoTone', 1, 't', 't', 't', 't', 2, '2022-03-18 12:06:38', '2022-02-24 10:51:38');
INSERT INTO "public"."SysMenu" VALUES (33, '29.33', 40, 'EFCore监控台', 'monitor_ef_core', 'views/development_tool/monitor_ef_core/Index.vue', '/development_tool/monitor/efcore', NULL, 'DashboardFilled', 29, 't', 't', 't', 't', 2, '2022-04-10 10:56:17', '2022-04-10 10:55:41');
INSERT INTO "public"."SysMenu" VALUES (36, '12.13.36', 1, '详情', 'base_member_info_Details', 'views/base/member/components/Details.vue', '/base/member/details/:id/:title', NULL, NULL, 13, 'f', 't', 't', 't', 2, '2022-04-17 17:49:13', '2022-04-17 17:45:25');

-- ----------------------------
-- Table structure for SysMenuFunction
-- ----------------------------
DROP TABLE IF EXISTS "public"."SysMenuFunction";
CREATE TABLE "public"."SysMenuFunction" (
  "Id" uuid NOT NULL,
  "Number" int4,
  "MenuId" int4 NOT NULL,
  "FunctionCode" text COLLATE "pg_catalog"."default",
  "FunctionName" text COLLATE "pg_catalog"."default",
  "Remark" text COLLATE "pg_catalog"."default",
  "LastModificationTime" timestamp(6) NOT NULL,
  "CreationTime" timestamp(6) NOT NULL
)
;

-- ----------------------------
-- Records of SysMenuFunction
-- ----------------------------
INSERT INTO "public"."SysMenuFunction" VALUES ('0073cce2-ff42-496c-9ff6-08da204fcecb', 10, 36, 'Display', '显示', 'Display', '2022-04-17 20:40:12', '2022-04-17 20:40:12');
INSERT INTO "public"."SysMenuFunction" VALUES ('0984a2e1-3722-41d4-0f6d-08d9fdad00ab', 70, 23, 'Export', '导出', 'Export', '2022-03-04 15:25:50', '2022-03-04 15:25:50');
INSERT INTO "public"."SysMenuFunction" VALUES ('0a85e4fd-5a1c-47f6-0f60-08d9fdad00ab', 20, 21, 'Insert', '添加', 'Insert', '2022-03-04 15:25:40', '2022-03-04 15:25:40');
INSERT INTO "public"."SysMenuFunction" VALUES ('0ad6a459-1d9d-4512-0f32-08d9fdad00ab', 40, 15, 'Delete', '删除', 'Delete', '2022-03-04 15:25:14', '2022-03-04 15:25:14');
INSERT INTO "public"."SysMenuFunction" VALUES ('0b27e69f-af16-4481-0f44-08d9fdad00ab', 60, 17, 'Search', '检索', 'Search', '2022-03-04 15:25:21', '2022-03-04 15:25:21');
INSERT INTO "public"."SysMenuFunction" VALUES ('0caa6e7d-92b0-4814-0f46-08d9fdad00ab', 80, 17, 'Print', '打印', 'Print', '2022-03-04 15:25:21', '2022-03-04 15:25:21');
INSERT INTO "public"."SysMenuFunction" VALUES ('106fb69a-8bb5-4559-0f29-08d9fdad00ab', 30, 13, 'Update', '修改', 'Update', '2022-03-04 15:25:07', '2022-03-04 15:25:07');
INSERT INTO "public"."SysMenuFunction" VALUES ('13f3f74d-c6fc-4488-0f2f-08d9fdad00ab', 10, 15, 'Display', '显示', 'Display', '2022-03-04 15:25:14', '2022-03-04 15:25:14');
INSERT INTO "public"."SysMenuFunction" VALUES ('14783a71-e265-4d6b-0f3b-08d9fdad00ab', 50, 16, 'Save', '保存', 'Save', '2022-04-22 22:24:03', '2022-04-22 22:24:03');
INSERT INTO "public"."SysMenuFunction" VALUES ('1cb6fbe1-4a6c-4aad-0f22-08d9fdad00ab', 10, 6, 'Display', '显示', 'Display', '2022-03-04 15:24:34', '2022-03-04 15:24:34');
INSERT INTO "public"."SysMenuFunction" VALUES ('1d831d57-6634-45d7-0f6e-08d9fdad00ab', 80, 23, 'Print', '打印', 'Print', '2022-03-04 15:25:50', '2022-03-04 15:25:50');
INSERT INTO "public"."SysMenuFunction" VALUES ('1e69df5d-d1e9-4bc8-0f4d-08d9fdad00ab', 70, 25, 'Export', '导出', 'Export', '2022-03-04 15:25:28', '2022-03-04 15:25:28');
INSERT INTO "public"."SysMenuFunction" VALUES ('20ab5395-d57c-49db-0f4a-08d9fdad00ab', 40, 25, 'Delete', '删除', 'Delete', '2022-03-04 15:25:28', '2022-03-04 15:25:28');
INSERT INTO "public"."SysMenuFunction" VALUES ('2186550d-246c-4552-e2d8-08d9fdefa8f8', 60, 24, 'Search', '检索', 'Search', '2022-03-04 23:00:02', '2022-03-04 23:00:02');
INSERT INTO "public"."SysMenuFunction" VALUES ('22a675f6-efda-481d-0f59-08d9fdad00ab', 30, 20, 'Update', '修改', 'Update', '2022-03-04 15:25:36', '2022-03-04 15:25:36');
INSERT INTO "public"."SysMenuFunction" VALUES ('2469188c-21de-492a-0f5e-08d9fdad00ab', 80, 20, 'Print', '打印', 'Print', '2022-03-04 15:25:36', '2022-03-04 15:25:36');
INSERT INTO "public"."SysMenuFunction" VALUES ('2fea8f87-2a13-4c95-0f3c-08d9fdad00ab', 60, 16, 'Search', '检索', 'Search', '2022-04-22 22:24:03', '2022-04-22 22:24:03');
INSERT INTO "public"."SysMenuFunction" VALUES ('33c80938-82c8-4299-0f12-08d9fdad00ab', 10, 30, 'Display', '显示', 'Display', '2022-03-04 15:17:09', '2022-03-04 15:17:09');
INSERT INTO "public"."SysMenuFunction" VALUES ('37d3e492-62da-47a4-0f33-08d9fdad00ab', 50, 15, 'Save', '保存', 'Save', '2022-03-04 15:25:14', '2022-03-04 15:25:14');
INSERT INTO "public"."SysMenuFunction" VALUES ('38b4704d-7c5d-4f89-a2e7-08da3d8e6577', 60, 31, 'Search', '检索', 'Search', '2022-05-24 22:05:57', '2022-05-24 22:05:57');
INSERT INTO "public"."SysMenuFunction" VALUES ('3bc0e68f-d03d-4e99-0f26-08d9fdad00ab', 10, 11, 'Display', '显示', 'Display', '2022-03-04 15:24:53', '2022-03-04 15:24:53');
INSERT INTO "public"."SysMenuFunction" VALUES ('3cb3cbc7-9e45-4cc3-0f62-08d9fdad00ab', 40, 21, 'Delete', '删除', 'Delete', '2022-03-04 15:25:40', '2022-03-04 15:25:40');
INSERT INTO "public"."SysMenuFunction" VALUES ('3e44c6f5-e090-40a1-0f58-08d9fdad00ab', 20, 20, 'Insert', '添加', 'Insert', '2022-03-04 15:25:36', '2022-03-04 15:25:36');
INSERT INTO "public"."SysMenuFunction" VALUES ('3f6d0af7-5386-4d3a-0f71-08d9fdad00ab', 10, 28, 'Display', '显示', 'Display', '2022-03-04 15:40:52', '2022-03-04 15:40:52');
INSERT INTO "public"."SysMenuFunction" VALUES ('41cb1942-573a-4d63-0f4b-08d9fdad00ab', 50, 25, 'Save', '保存', 'Save', '2022-03-04 15:25:28', '2022-03-04 15:25:28');
INSERT INTO "public"."SysMenuFunction" VALUES ('437fbf85-8704-4e87-0f3d-08d9fdad00ab', 70, 16, 'Export', '导出', 'Export', '2022-04-22 22:24:03', '2022-04-22 22:24:03');
INSERT INTO "public"."SysMenuFunction" VALUES ('45e2ca86-4823-4fb9-0f57-08d9fdad00ab', 10, 20, 'Display', '显示', 'Display', '2022-03-04 15:25:36', '2022-03-04 15:25:36');
INSERT INTO "public"."SysMenuFunction" VALUES ('48f0a694-0539-4e69-a2e4-08da3d8e6577', 10, 31, 'Display', '显示', 'Display', '2022-05-24 22:05:57', '2022-05-24 22:05:57');
INSERT INTO "public"."SysMenuFunction" VALUES ('4a67fcdb-a7a9-4e3c-0f49-08d9fdad00ab', 30, 25, 'Update', '修改', 'Update', '2022-03-04 15:25:28', '2022-03-04 15:25:28');
INSERT INTO "public"."SysMenuFunction" VALUES ('4bbbe120-0cc6-4a08-0f4e-08d9fdad00ab', 80, 25, 'Print', '打印', 'Print', '2022-03-04 15:25:28', '2022-03-04 15:25:28');
INSERT INTO "public"."SysMenuFunction" VALUES ('4dbf096d-d3d3-4565-a2e5-08da3d8e6577', 40, 31, 'Delete', '删除', 'Delete', '2022-05-24 22:05:57', '2022-05-24 22:05:57');
INSERT INTO "public"."SysMenuFunction" VALUES ('523b53b5-8159-4a16-0f2b-08d9fdad00ab', 50, 13, 'Save', '保存', 'Save', '2022-03-04 15:25:07', '2022-03-04 15:25:07');
INSERT INTO "public"."SysMenuFunction" VALUES ('53fdb4a0-ca6e-4568-0f3f-08d9fdad00ab', 10, 17, 'Display', '显示', 'Display', '2022-03-04 15:25:21', '2022-03-04 15:25:21');
INSERT INTO "public"."SysMenuFunction" VALUES ('541d9045-47b2-4629-0f2e-08d9fdad00ab', 80, 13, 'Print', '打印', 'Print', '2022-03-04 15:25:07', '2022-03-04 15:25:07');
INSERT INTO "public"."SysMenuFunction" VALUES ('54743c86-ac73-4345-0f5d-08d9fdad00ab', 70, 20, 'Export', '导出', 'Export', '2022-03-04 15:25:36', '2022-03-04 15:25:36');
INSERT INTO "public"."SysMenuFunction" VALUES ('550f874b-e804-44a0-0f37-08d9fdad00ab', 10, 16, 'Display', '显示', 'Display', '2022-04-22 22:24:03', '2022-04-22 22:24:03');
INSERT INTO "public"."SysMenuFunction" VALUES ('55750f56-edc9-4771-e2d6-08d9fdefa8f8', 10, 24, 'Display', '显示', 'Display', '2022-03-04 23:00:02', '2022-03-04 23:00:02');
INSERT INTO "public"."SysMenuFunction" VALUES ('5e4e87bd-c179-4b5b-0f5c-08d9fdad00ab', 60, 20, 'Search', '检索', 'Search', '2022-03-04 15:25:36', '2022-03-04 15:25:36');
INSERT INTO "public"."SysMenuFunction" VALUES ('616c4e4a-fb61-49cf-0f5b-08d9fdad00ab', 50, 20, 'Save', '保存', 'Save', '2022-03-04 15:25:36', '2022-03-04 15:25:36');
INSERT INTO "public"."SysMenuFunction" VALUES ('687254ae-0d76-4788-a4e8-08da1a9d9949', 10, 33, 'Display', '显示', 'Display', '2022-04-10 10:56:17', '2022-04-10 10:56:17');
INSERT INTO "public"."SysMenuFunction" VALUES ('69da651e-787b-42e5-0f5a-08d9fdad00ab', 40, 20, 'Delete', '删除', 'Delete', '2022-03-04 15:25:36', '2022-03-04 15:25:36');
INSERT INTO "public"."SysMenuFunction" VALUES ('6b009415-eadf-4dab-0f3e-08d9fdad00ab', 80, 16, 'Print', '打印', 'Print', '2022-04-22 22:24:03', '2022-04-22 22:24:03');
INSERT INTO "public"."SysMenuFunction" VALUES ('6b209d5a-b366-4a61-0f63-08d9fdad00ab', 50, 21, 'Save', '保存', 'Save', '2022-03-04 15:25:40', '2022-03-04 15:25:40');
INSERT INTO "public"."SysMenuFunction" VALUES ('6c09c0c0-72fa-4842-0f1f-08d9fdad00ab', 10, 32, 'Display', '显示', 'Display', '2022-03-18 12:06:38', '2022-03-18 12:06:38');
INSERT INTO "public"."SysMenuFunction" VALUES ('7694fbf5-e28d-424c-e2d7-08d9fdefa8f8', 40, 24, 'Delete', '删除', 'Delete', '2022-03-04 23:00:02', '2022-03-04 23:00:02');
INSERT INTO "public"."SysMenuFunction" VALUES ('7e0f6c84-d7f1-4243-0f4c-08d9fdad00ab', 60, 25, 'Search', '检索', 'Search', '2022-03-04 15:25:28', '2022-03-04 15:25:28');
INSERT INTO "public"."SysMenuFunction" VALUES ('7ea8f706-bfe5-42b2-0f42-08d9fdad00ab', 40, 17, 'Delete', '删除', 'Delete', '2022-03-04 15:25:21', '2022-03-04 15:25:21');
INSERT INTO "public"."SysMenuFunction" VALUES ('823ac05d-65e4-4216-0f39-08d9fdad00ab', 30, 16, 'Update', '修改', 'Update', '2022-04-22 22:24:03', '2022-04-22 22:24:03');
INSERT INTO "public"."SysMenuFunction" VALUES ('8564e4d8-d7f4-4f12-0f31-08d9fdad00ab', 30, 15, 'Update', '修改', 'Update', '2022-03-04 15:25:14', '2022-03-04 15:25:14');
INSERT INTO "public"."SysMenuFunction" VALUES ('86465238-c51c-45d5-0f40-08d9fdad00ab', 20, 17, 'Insert', '添加', 'Insert', '2022-03-04 15:25:21', '2022-03-04 15:25:21');
INSERT INTO "public"."SysMenuFunction" VALUES ('86ff83fd-d34a-4290-0f41-08d9fdad00ab', 30, 17, 'Update', '修改', 'Update', '2022-03-04 15:25:21', '2022-03-04 15:25:21');
INSERT INTO "public"."SysMenuFunction" VALUES ('92b39a10-3927-4ee7-0f6a-08d9fdad00ab', 40, 23, 'Delete', '删除', 'Delete', '2022-03-04 15:25:50', '2022-03-04 15:25:50');
INSERT INTO "public"."SysMenuFunction" VALUES ('9426768e-b90d-41e1-0f67-08d9fdad00ab', 10, 23, 'Display', '显示', 'Display', '2022-03-04 15:25:50', '2022-03-04 15:25:50');
INSERT INTO "public"."SysMenuFunction" VALUES ('a03d56d7-4b0d-47cc-0f6b-08d9fdad00ab', 50, 23, 'Save', '保存', 'Save', '2022-03-04 15:25:50', '2022-03-04 15:25:50');
INSERT INTO "public"."SysMenuFunction" VALUES ('a1ddd02f-8c21-4d79-0f21-08d9fdad00ab', 10, 5, 'Display', '显示', 'Display', '2022-03-04 15:24:30', '2022-03-04 15:24:30');
INSERT INTO "public"."SysMenuFunction" VALUES ('a3754771-f6e9-4a23-0f2c-08d9fdad00ab', 60, 13, 'Search', '检索', 'Search', '2022-03-04 15:25:07', '2022-03-04 15:25:07');
INSERT INTO "public"."SysMenuFunction" VALUES ('a46e07d3-c722-4548-0f35-08d9fdad00ab', 70, 15, 'Export', '导出', 'Export', '2022-03-04 15:25:14', '2022-03-04 15:25:14');
INSERT INTO "public"."SysMenuFunction" VALUES ('a726455f-1c29-4be0-0f45-08d9fdad00ab', 70, 17, 'Export', '导出', 'Export', '2022-03-04 15:25:21', '2022-03-04 15:25:21');
INSERT INTO "public"."SysMenuFunction" VALUES ('a7cd04db-bbe3-49b6-0f1e-08d9fdad00ab', 10, 2, 'Display', '显示', 'Display', '2022-03-18 12:06:20', '2022-03-18 12:06:20');
INSERT INTO "public"."SysMenuFunction" VALUES ('a9503588-e6f7-420b-0f65-08d9fdad00ab', 70, 21, 'Export', '导出', 'Export', '2022-03-04 15:25:40', '2022-03-04 15:25:40');
INSERT INTO "public"."SysMenuFunction" VALUES ('b5881044-afb8-40b2-0f28-08d9fdad00ab', 20, 13, 'Insert', '添加', 'Insert', '2022-03-04 15:25:07', '2022-03-04 15:25:07');
INSERT INTO "public"."SysMenuFunction" VALUES ('b7533a90-dae4-4263-0f24-08d9fdad00ab', 10, 9, 'Display', '显示', 'Display', '2022-03-04 15:24:43', '2022-03-04 15:24:43');
INSERT INTO "public"."SysMenuFunction" VALUES ('b96f977c-a36e-4e7f-0f2d-08d9fdad00ab', 70, 13, 'Export', '导出', 'Export', '2022-03-04 15:25:07', '2022-03-04 15:25:07');
INSERT INTO "public"."SysMenuFunction" VALUES ('b98a365e-6fb4-4efb-0f69-08d9fdad00ab', 30, 23, 'Update', '修改', 'Update', '2022-03-04 15:25:50', '2022-03-04 15:25:50');
INSERT INTO "public"."SysMenuFunction" VALUES ('bd6ae6da-1ca6-46c2-0f3a-08d9fdad00ab', 40, 16, 'Delete', '删除', 'Delete', '2022-04-22 22:24:03', '2022-04-22 22:24:03');
INSERT INTO "public"."SysMenuFunction" VALUES ('beb87004-5cfb-417a-0f34-08d9fdad00ab', 60, 15, 'Search', '检索', 'Search', '2022-03-04 15:25:14', '2022-03-04 15:25:14');
INSERT INTO "public"."SysMenuFunction" VALUES ('c67a0abe-daec-491b-0f38-08d9fdad00ab', 20, 16, 'Insert', '添加', 'Insert', '2022-04-22 22:24:03', '2022-04-22 22:24:03');
INSERT INTO "public"."SysMenuFunction" VALUES ('c6ba141b-99ba-4114-0f5f-08d9fdad00ab', 10, 21, 'Display', '显示', 'Display', '2022-03-04 15:25:40', '2022-03-04 15:25:40');
INSERT INTO "public"."SysMenuFunction" VALUES ('c77c812a-1601-4311-0f70-08d9fdad00ab', 10, 19, 'Display', '显示', 'Display', '2022-03-04 15:26:00', '2022-03-04 15:26:00');
INSERT INTO "public"."SysMenuFunction" VALUES ('c8edbb79-567e-461b-0f36-08d9fdad00ab', 80, 15, 'Print', '打印', 'Print', '2022-03-04 15:25:14', '2022-03-04 15:25:14');
INSERT INTO "public"."SysMenuFunction" VALUES ('c9e5fff0-6744-47d7-0f66-08d9fdad00ab', 80, 21, 'Print', '打印', 'Print', '2022-03-04 15:25:40', '2022-03-04 15:25:40');
INSERT INTO "public"."SysMenuFunction" VALUES ('cce82eb4-7fc5-4308-0f30-08d9fdad00ab', 20, 15, 'Insert', '添加', 'Insert', '2022-03-04 15:25:14', '2022-03-04 15:25:14');
INSERT INTO "public"."SysMenuFunction" VALUES ('d2e6ea60-2cf6-478a-0f23-08d9fdad00ab', 10, 8, 'Display', '显示', 'Display', '2022-03-04 15:24:40', '2022-03-04 15:24:40');
INSERT INTO "public"."SysMenuFunction" VALUES ('db3ab8bd-7709-41a2-0f47-08d9fdad00ab', 10, 25, 'Display', '显示', 'Display', '2022-03-04 15:25:28', '2022-03-04 15:25:28');
INSERT INTO "public"."SysMenuFunction" VALUES ('dee401b1-e20e-496e-0f43-08d9fdad00ab', 50, 17, 'Save', '保存', 'Save', '2022-03-04 15:25:21', '2022-03-04 15:25:21');
INSERT INTO "public"."SysMenuFunction" VALUES ('e2319118-42cc-41a2-0f6c-08d9fdad00ab', 60, 23, 'Search', '检索', 'Search', '2022-03-04 15:25:50', '2022-03-04 15:25:50');
INSERT INTO "public"."SysMenuFunction" VALUES ('e991934a-0d30-416b-0f68-08d9fdad00ab', 20, 23, 'Insert', '添加', 'Insert', '2022-03-04 15:25:50', '2022-03-04 15:25:50');
INSERT INTO "public"."SysMenuFunction" VALUES ('eb958545-6449-40db-0f27-08d9fdad00ab', 10, 13, 'Display', '显示', 'Display', '2022-03-04 15:25:07', '2022-03-04 15:25:07');
INSERT INTO "public"."SysMenuFunction" VALUES ('ec535908-8671-4928-0f25-08d9fdad00ab', 10, 10, 'Display', '显示', 'Display', '2022-03-04 15:24:47', '2022-03-04 15:24:47');
INSERT INTO "public"."SysMenuFunction" VALUES ('ef70b789-21ee-4850-0f1b-08d9fdad00ab', 10, 22, 'Display', '显示', 'Display', '2022-03-04 15:16:44', '2022-03-04 15:16:44');
INSERT INTO "public"."SysMenuFunction" VALUES ('f36b9b06-2826-425f-0f64-08d9fdad00ab', 60, 21, 'Search', '检索', 'Search', '2022-03-04 15:25:40', '2022-03-04 15:25:40');
INSERT INTO "public"."SysMenuFunction" VALUES ('f4621fbe-6b40-4454-0f2a-08d9fdad00ab', 40, 13, 'Delete', '删除', 'Delete', '2022-03-04 15:25:07', '2022-03-04 15:25:07');
INSERT INTO "public"."SysMenuFunction" VALUES ('f4c73ac0-c66d-4988-0f61-08d9fdad00ab', 30, 21, 'Update', '修改', 'Update', '2022-03-04 15:25:40', '2022-03-04 15:25:40');
INSERT INTO "public"."SysMenuFunction" VALUES ('f64cfe50-1ef1-457f-0f20-08d9fdad00ab', 10, 3, 'Display', '显示', 'Display', '2022-03-04 15:24:24', '2022-03-04 15:24:24');
INSERT INTO "public"."SysMenuFunction" VALUES ('fe6465bf-e429-45bd-0f48-08d9fdad00ab', 20, 25, 'Insert', '添加', 'Insert', '2022-03-04 15:25:28', '2022-03-04 15:25:28');

-- ----------------------------
-- Table structure for SysOperationLog
-- ----------------------------
DROP TABLE IF EXISTS "public"."SysOperationLog";
CREATE TABLE "public"."SysOperationLog" (
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
  "LastModificationTime" timestamp(6) NOT NULL,
  "CreationTime" timestamp(6) NOT NULL
)
;

-- ----------------------------
-- Records of SysOperationLog
-- ----------------------------
INSERT INTO "public"."SysOperationLog" VALUES ('da8c1a5a-b1ff-4c3a-8f42-e3623c18143a', '/', '0.0.0.1', '', '', '', 38, 'Chrome102', 'Windows10', NULL, NULL, NULL, '2022-05-27 14:13:36.586648', '2022-05-27 14:13:36.586646');
INSERT INTO "public"."SysOperationLog" VALUES ('2f7fbcba-48e1-48d8-b064-2f6b6330f7de', '/_framework/aspnetcore-browser-refresh.js', '0.0.0.1', '', '', '', 0, 'Chrome102', 'Windows10', NULL, NULL, NULL, '2022-05-27 14:13:36.914505', '2022-05-27 14:13:36.914504');
INSERT INTO "public"."SysOperationLog" VALUES ('402c46dd-b7e5-438c-9a65-ffdcf7e485ce', '/_vs/browserLink', '0.0.0.1', '', '', '', 0, 'Chrome102', 'Windows10', NULL, NULL, NULL, '2022-05-27 14:13:36.929702', '2022-05-27 14:13:36.929699');
INSERT INTO "public"."SysOperationLog" VALUES ('4fc97844-4ac6-401d-ae01-11e586f2efab', '/api/account/check', '0.0.0.1', '', '{"userName":"admin","userPassword":"123456"}', '', 392, 'Chrome102', 'Windows10', NULL, NULL, NULL, '2022-05-27 14:14:16.764481', '2022-05-27 14:14:16.764481');
INSERT INTO "public"."SysOperationLog" VALUES ('19892fee-4091-4a39-a4ae-a8c00751b8f7', '/api/admin/SysUser/info', '0.0.0.1', '', '', '', 153, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', '系统账号', '获取用户信息', '2022-05-27 14:14:17.164736', '2022-05-27 14:14:17.164736');
INSERT INTO "public"."SysOperationLog" VALUES ('961424c3-c125-495f-a063-dd799578835b', '/api/admin/Member/findList/10/1', '0.0.0.1', '', '{"name":""}', '', 196, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', '会员', '查看列表', '2022-05-27 14:14:20.869502', '2022-05-27 14:14:20.869501');
INSERT INTO "public"."SysOperationLog" VALUES ('68dfc40f-c361-42f7-a8e8-1ce88ad5ddc0', '/client/NaN', '0.0.0.1', '', '', '', 0, 'Chrome102', 'Windows10', NULL, NULL, NULL, '2022-05-27 14:14:20.916372', '2022-05-27 14:14:20.916371');
INSERT INTO "public"."SysOperationLog" VALUES ('f8492791-f4f7-4dc3-b215-fe25232009ae', '/', '0.0.0.1', '', '', '', 21, 'Chrome102', 'Windows10', NULL, NULL, NULL, '2022-06-08 21:26:55.875258', '2022-06-08 21:26:55.875256');
INSERT INTO "public"."SysOperationLog" VALUES ('e7dfdb57-77d1-4120-b92b-65049e48a0b6', '/api/admin/SysUser/info', '0.0.0.1', '', '', '', 170, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', '系统账号', '获取用户信息', '2022-06-08 21:26:56.881214', '2022-06-08 21:26:56.881213');
INSERT INTO "public"."SysOperationLog" VALUES ('ee0217e3-3390-496d-9df7-5564cf7def85', '/api/admin/LowCodeTable/findList/10/1', '0.0.0.1', '', '{"tableName":null,"entityName":null,"displayName":null}', '', 202, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 'LowCodeTableController', NULL, '2022-06-08 21:27:07.440598', '2022-06-08 21:27:07.440597');
INSERT INTO "public"."SysOperationLog" VALUES ('4d598300-3b5e-4399-bd29-3d8b0097c80e', '/api/admin/Member/findList/10/1', '0.0.0.1', '', '{"name":""}', '', 67, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', '会员', '查看列表', '2022-06-08 21:27:09.794422', '2022-06-08 21:27:09.794421');
INSERT INTO "public"."SysOperationLog" VALUES ('b1f88e5b-1a9f-4334-91b8-215c33f61ce8', '/client/NaN', '0.0.0.1', '', '', '', 0, 'Chrome102', 'Windows10', NULL, NULL, NULL, '2022-06-08 21:27:09.856195', '2022-06-08 21:27:09.856195');
INSERT INTO "public"."SysOperationLog" VALUES ('7c971f43-6c55-4981-a150-ae4b68c08f05', '/client/NaN', '0.0.0.1', '', '', '', 0, 'Chrome102', 'Windows10', NULL, NULL, NULL, '2022-06-08 21:27:12.223517', '2022-06-08 21:27:12.223516');
INSERT INTO "public"."SysOperationLog" VALUES ('df671b1a-3a6b-4d68-83db-e17fa11a45b9', '/api/admin/SysOrganization/sysOrganizationTree', '0.0.0.1', '', '{}', '', 72, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', '组织机构', '查看组织架构树', '2022-06-08 21:27:12.408955', '2022-06-08 21:27:12.408954');
INSERT INTO "public"."SysOperationLog" VALUES ('ce5a2b6c-19e4-4e40-be52-b249f486b8db', '/api/admin/SysUser/findList/10/1', '0.0.0.1', '', '{"name":null,"loginName":null,"organizationId":null}', '', 109, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', '系统账号', '查看数据', '2022-06-08 21:27:12.457042', '2022-06-08 21:27:12.457042');
INSERT INTO "public"."SysOperationLog" VALUES ('eb1b46bb-5d1d-4e93-b4c2-fb60ae12f5f0', '/api/admin/QuartzTasks/findList/', '0.0.0.1', '', '', '', 335, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', NULL, '查看列表', '2022-06-08 21:27:14.938539', '2022-06-08 21:27:14.938538');
INSERT INTO "public"."SysOperationLog" VALUES ('b8fb68ad-fd27-48af-b686-08cececd4e6c', '/api/admin/LowCodeTableInfo/findList/20/1', '0.0.0.1', '', '{"columnName":null,"describe":null,"low_Code_TableId":"6323638b-a45f-4a76-886e-69a9e9be0901"}', '', 26, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 'LowCodeSearchController', NULL, '2022-06-08 21:27:19.730813', '2022-06-08 21:27:19.730812');
INSERT INTO "public"."SysOperationLog" VALUES ('ed597212-985a-48c4-970c-57c339762d40', '/api/admin/LowCodeTableInfo/change', '0.0.0.1', '', '[{"id":"5bcf7406-75cc-4171-d545-08da3d8d5a26","isPrimary":true,"isIdentity":false,"isNullable":false,"position":164,"columnName":"Id","describe":"","databaseColumnType":"uniqueidentifier","csType":"Guid","csField":"Id","displayName":null,"low_Code_TableId":"6323638b-a45f-4a76-886e-69a9e9be0901","lastModificationTime":"2022-05-25","creationTime":"2022-05-24","_X_ROW_KEY":"row_117"},{"id":"e5418d61-916f-45fd-d549-08da3d8d5a26","isPrimary":false,"isIdentity":false,"isNullable":true,"position":165,"columnName":"LastModificationTime","describe":"","databaseColumnType":"datetime2","csType":"DateTime","csField":"LastModificationTime","displayName":"更新时间","low_Code_TableId":"6323638b-a45f-4a76-886e-69a9e9be0901","lastModificationTime":"2022-05-25","creationTime":"2022-05-24","_X_ROW_KEY":"row_118"},{"id":"46bac66f-3cf0-46b3-d546-08da3d8d5a26","isPrimary":false,"isIdentity":false,"isNullable":true,"position":166,"columnName":"CreationTime","describe":"","databaseColumnType":"datetime2","csType":"DateTime","csField":"CreationTime","displayName":"创建时间","low_Code_TableId":"6323638b-a45f-4a76-886e-69a9e9be0901","lastModificationTime":"2022-05-25","creationTime":"2022-05-24","_X_ROW_KEY":"row_119"},{"id":"4b5bc027-5663-463a-d54b-08da3d8d5a26","isPrimary":false,"isIdentity":false,"isNullable":true,"position":167,"columnName":"Name","describe":"","databaseColumnType":"nvarchar(255)","csType":"String","csField":"Name","displayName":"用户名称","low_Code_TableId":"6323638b-a45f-4a76-886e-69a9e9be0901","lastModificationTime":"2022-05-25","creationTime":"2022-05-24","_X_ROW_KEY":"row_120"},{"id":"7cbe8988-cbac-4ea2-d54a-08da3d8d5a26","isPrimary":false,"isIdentity":false,"isNullable":true,"position":168,"columnName":"LoginName","describe":"","databaseColumnType":"nvarchar(255)","csType":"String","csField":"LoginName","displayName":"登录名称","low_Code_TableId":"6323638b-a45f-4a76-886e-69a9e9be0901","lastModificationTime":"2022-05-25","creationTime":"2022-05-24","_X_ROW_KEY":"row_121"},{"id":"e36410b5-cb7c-4fc3-d54d-08da3d8d5a26","isPrimary":false,"isIdentity":false,"isNullable":true,"position":169,"columnName":"Password","describe":"","databaseColumnType":"nvarchar(255)","csType":"String","csField":"Password","displayName":"密码","low_Code_TableId":"6323638b-a45f-4a76-886e-69a9e9be0901","lastModificationTime":"2022-05-25","creationTime":"2022-05-24","_X_ROW_KEY":"row_122"},{"id":"c82d5132-6cda-463e-d54e-08da3d8d5a26","isPrimary":false,"isIdentity":false,"isNullable":true,"position":170,"columnName":"Phone","describe":"","databaseColumnType":"nvarchar(255)","csType":"String","csField":"Phone","displayName":"联系电话","low_Code_TableId":"6323638b-a45f-4a76-886e-69a9e9be0901","lastModificationTime":"2022-05-25","creationTime":"2022-05-24","_X_ROW_KEY":"row_123"},{"id":"287314b2-3141-4957-d548-08da3d8d5a26","isPrimary":false,"isIdentity":false,"isNullable":false,"position":171,"columnName":"Email","describe":"","databaseColumnType":"nvarchar(255)","csType":"String","csField":"Email","displayName":"电子邮箱","low_Code_TableId":"6323638b-a45f-4a76-886e-69a9e9be0901","lastModificationTime":"2022-05-25","creationTime":"2022-05-24","_X_ROW_KEY":"row_124"},{"id":"a6752bd9-f3d6-451f-d547-08da3d8d5a26","isPrimary":false,"isIdentity":false,"isNullable":true,"position":172,"columnName":"DeleteLock","describe":"","databaseColumnType":"bit","csType":"Boolean","csField":"DeleteLock","displayName":"删除锁","low_Code_TableId":"6323638b-a45f-4a76-886e-69a9e9be0901","lastModificationTime":"2022-05-25","creationTime":"2022-05-24","_X_ROW_KEY":"row_125"},{"id":"5a9fa990-b6d6-445f-d54c-08da3d8d5a26","isPrimary":false,"isIdentity":false,"isNullable":true,"position":173,"columnName":"OrganizationId","describe":"","databaseColumnType":"int","csType":"Int32","csField":"OrganizationId","displayName":"组织id","low_Code_TableId":"6323638b-a45f-4a76-886e-69a9e9be0901","lastModificationTime":"2022-05-25","creationTime":"2022-05-24","_X_ROW_KEY":"row_126"}]', '', 40, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 'LowCodeSearchController', NULL, '2022-06-08 21:27:46.521733', '2022-06-08 21:27:46.521733');
INSERT INTO "public"."SysOperationLog" VALUES ('be98c3cf-6972-4ac9-aa52-906a2453061b', '/api/admin/LowCodeTableInfo/findList/20/1', '0.0.0.1', '', '{"columnName":null,"describe":null,"low_Code_TableId":"6323638b-a45f-4a76-886e-69a9e9be0901"}', '', 82, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 'LowCodeSearchController', NULL, '2022-06-08 21:27:46.646383', '2022-06-08 21:27:46.646382');
INSERT INTO "public"."SysOperationLog" VALUES ('1901cdfb-08ff-4112-bdfd-aafc1b7287a5', '/client/NaN', '0.0.0.1', '', '', '', 0, 'Chrome102', 'Windows10', NULL, NULL, NULL, '2022-06-08 21:27:49.248526', '2022-06-08 21:27:49.248525');
INSERT INTO "public"."SysOperationLog" VALUES ('691bbb99-9684-4310-986b-10a195a1fe95', '/client/NaN', '0.0.0.1', '', '', '', 0, 'Chrome102', 'Windows10', NULL, NULL, NULL, '2022-06-08 21:27:50.216899', '2022-06-08 21:27:50.216898');
INSERT INTO "public"."SysOperationLog" VALUES ('75b8f499-e20d-448f-a32e-de241dced40a', '/api/admin/LowCodeTable/findList/10/2', '0.0.0.1', '', '{"tableName":null,"entityName":null,"displayName":null}', '', 71, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 'LowCodeTableController', NULL, '2022-06-08 21:27:51.345952', '2022-06-08 21:27:51.345952');
INSERT INTO "public"."SysOperationLog" VALUES ('709d41fe-7673-4de6-9ed6-8c437f85aecb', '/api/admin/LowCodeTableInfo/findList/20/1', '0.0.0.1', '', '{"columnName":null,"describe":null,"low_Code_TableId":"73c97832-4e7f-4758-86d2-94327971b5fd"}', '', 8, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 'LowCodeSearchController', NULL, '2022-06-08 21:27:53.372154', '2022-06-08 21:27:53.372154');
INSERT INTO "public"."SysOperationLog" VALUES ('c2d15ac6-59d9-4fde-8e07-e8be6fbe0481', '/api/admin/QuartzTasks/findList/', '0.0.0.1', '', '', '', 11, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', NULL, '查看列表', '2022-06-08 21:28:14.632874', '2022-06-08 21:28:14.632873');
INSERT INTO "public"."SysOperationLog" VALUES ('a6dd4043-1907-4ce5-840e-a956cff2109b', '/api/admin/LowCodeTableInfo/change', '0.0.0.1', '', '[{"id":"e75b8650-ee49-4f83-d4d2-08da3d8d5a26","isPrimary":true,"isIdentity":false,"isNullable":false,"position":70,"columnName":"Id","describe":"","databaseColumnType":"uniqueidentifier","csType":"Guid","csField":"Id","displayName":null,"low_Code_TableId":"73c97832-4e7f-4758-86d2-94327971b5fd","lastModificationTime":"2022-05-24","creationTime":"2022-05-24","_X_ROW_KEY":"row_147"},{"id":"bf24a276-6ed0-49d4-d4d9-08da3d8d5a26","isPrimary":false,"isIdentity":false,"isNullable":true,"position":71,"columnName":"Number","describe":"","databaseColumnType":"nvarchar(255)","csType":"String","csField":"Number","displayName":"编号","low_Code_TableId":"73c97832-4e7f-4758-86d2-94327971b5fd","lastModificationTime":"2022-05-24","creationTime":"2022-05-24","_X_ROW_KEY":"row_148"},{"id":"d1eb49cf-c053-4226-d4d8-08da3d8d5a26","isPrimary":false,"isIdentity":false,"isNullable":true,"position":72,"columnName":"Name","describe":"","databaseColumnType":"nvarchar(255)","csType":"String","csField":"Name","displayName":"会员名称","low_Code_TableId":"73c97832-4e7f-4758-86d2-94327971b5fd","lastModificationTime":"2022-05-24","creationTime":"2022-05-24","_X_ROW_KEY":"row_149"},{"id":"669b87ce-c694-4c8c-d4da-08da3d8d5a26","isPrimary":false,"isIdentity":false,"isNullable":true,"position":73,"columnName":"Phone","describe":"","databaseColumnType":"nvarchar(255)","csType":"String","csField":"Phone","displayName":"联系电话","low_Code_TableId":"73c97832-4e7f-4758-86d2-94327971b5fd","lastModificationTime":"2022-05-24","creationTime":"2022-05-24","_X_ROW_KEY":"row_150"},{"id":"72ac247c-d792-4fee-d4dc-08da3d8d5a26","isPrimary":false,"isIdentity":false,"isNullable":true,"position":74,"columnName":"Sex","describe":"","databaseColumnType":"nvarchar(255)","csType":"String","csField":"Sex","displayName":"性别","low_Code_TableId":"73c97832-4e7f-4758-86d2-94327971b5fd","lastModificationTime":"2022-05-24","creationTime":"2022-05-24","_X_ROW_KEY":"row_151"},{"id":"b7fbb61f-94fc-4242-d4d3-08da3d8d5a26","isPrimary":false,"isIdentity":false,"isNullable":true,"position":75,"columnName":"Birthday","describe":"","databaseColumnType":"datetime2","csType":"DateTime","csField":"Birthday","displayName":"生日","low_Code_TableId":"73c97832-4e7f-4758-86d2-94327971b5fd","lastModificationTime":"2022-05-24","creationTime":"2022-05-24","_X_ROW_KEY":"row_152"},{"id":"f03ac01c-e0cf-4f13-d4db-08da3d8d5a26","isPrimary":false,"isIdentity":false,"isNullable":true,"position":76,"columnName":"Photo","describe":"","databaseColumnType":"nvarchar(255)","csType":"String","csField":"Photo","displayName":"头像","low_Code_TableId":"73c97832-4e7f-4758-86d2-94327971b5fd","lastModificationTime":"2022-05-24","creationTime":"2022-05-24","_X_ROW_KEY":"row_153"},{"id":"8326ca11-09f1-4c38-d4d6-08da3d8d5a26","isPrimary":false,"isIdentity":false,"isNullable":true,"position":77,"columnName":"Introduce","describe":"","databaseColumnType":"nvarchar(255)","csType":"String","csField":"Introduce","displayName":"简介","low_Code_TableId":"73c97832-4e7f-4758-86d2-94327971b5fd","lastModificationTime":"2022-05-24","creationTime":"2022-05-24","_X_ROW_KEY":"row_154"},{"id":"e4245f5f-bffa-43f0-d4d5-08da3d8d5a26","isPrimary":false,"isIdentity":false,"isNullable":true,"position":78,"columnName":"FilePath","describe":"","databaseColumnType":"nvarchar(255)","csType":"String","csField":"FilePath","displayName":"文件地址","low_Code_TableId":"73c97832-4e7f-4758-86d2-94327971b5fd","lastModificationTime":"2022-05-24","creationTime":"2022-05-24","_X_ROW_KEY":"row_155"},{"id":"837b058b-a88e-4107-d4dd-08da3d8d5a26","isPrimary":false,"isIdentity":false,"isNullable":true,"position":79,"columnName":"UserId","describe":"","databaseColumnType":"uniqueidentifier","csType":"Guid","csField":"UserId","displayName":"所属用户","low_Code_TableId":"73c97832-4e7f-4758-86d2-94327971b5fd","lastModificationTime":"2022-05-24","creationTime":"2022-05-24","_X_ROW_KEY":"row_156"},{"id":"5541e535-7cbe-43d2-d4d4-08da3d8d5a26","isPrimary":false,"isIdentity":false,"isNullable":true,"position":80,"columnName":"CreationTime","describe":"","databaseColumnType":"datetime2","csType":"DateTime","csField":"CreationTime","displayName":"创建时间","low_Code_TableId":"73c97832-4e7f-4758-86d2-94327971b5fd","lastModificationTime":"2022-05-24","creationTime":"2022-05-24","_X_ROW_KEY":"row_157"},{"id":"897a208c-2e13-46f1-d4d7-08da3d8d5a26","isPrimary":false,"isIdentity":false,"isNullable":true,"position":81,"columnName":"LastModificationTime","describe":"","databaseColumnType":"datetime2","csType":"DateTime","csField":"LastModificationTime","displayName":"更新时间","low_Code_TableId":"73c97832-4e7f-4758-86d2-94327971b5fd","lastModificationTime":"2022-05-24","creationTime":"2022-05-24","_X_ROW_KEY":"row_158"}]', '', 15, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 'LowCodeSearchController', NULL, '2022-06-08 21:28:49.941168', '2022-06-08 21:28:49.941168');
INSERT INTO "public"."SysOperationLog" VALUES ('56fc43d9-ae66-4cbb-a026-d0313e5e8677', '/api/admin/LowCodeTableInfo/findList/20/1', '0.0.0.1', '', '{"columnName":null,"describe":null,"low_Code_TableId":"73c97832-4e7f-4758-86d2-94327971b5fd"}', '', 97, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 'LowCodeSearchController', NULL, '2022-06-08 21:28:50.186529', '2022-06-08 21:28:50.186528');
INSERT INTO "public"."SysOperationLog" VALUES ('9430060c-db93-40c7-8538-3d4918791ba5', '/api/admin/CodeGeneration/getCode', '0.0.0.1', '', '{"tableName":"Member","type":"HZY.Models","codeText":""}', '', 123, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', NULL, '获取代码', '2022-06-08 21:28:51.313715', '2022-06-08 21:28:51.313715');
INSERT INTO "public"."SysOperationLog" VALUES ('a5da624b-88d7-4ef3-a511-87bbc9da7a95', '/api/admin/SysUser/info', '0.0.0.1', '', '', '', 10, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', '系统账号', '获取用户信息', '2022-06-08 21:28:53.459302', '2022-06-08 21:28:53.459301');
INSERT INTO "public"."SysOperationLog" VALUES ('946796a1-bb53-4251-b7e2-a669a7e501d8', '/api/admin/LowCodeTable/findList/10/1', '0.0.0.1', '', '{"tableName":null,"entityName":null,"displayName":null}', '', 90, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 'LowCodeTableController', NULL, '2022-06-08 21:28:53.83462', '2022-06-08 21:28:53.834618');

-- ----------------------------
-- Table structure for SysOrganization
-- ----------------------------
DROP TABLE IF EXISTS "public"."SysOrganization";
CREATE TABLE "public"."SysOrganization" (
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
  "LastModificationTime" timestamp(6) NOT NULL,
  "CreationTime" timestamp(6) NOT NULL
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
  "Code" text COLLATE "pg_catalog"."default",
  "Name" text COLLATE "pg_catalog"."default",
  "State" int4 NOT NULL,
  "Remarks" text COLLATE "pg_catalog"."default",
  "LastModificationTime" timestamp(6) NOT NULL,
  "CreationTime" timestamp(6) NOT NULL
)
;

-- ----------------------------
-- Records of SysPost
-- ----------------------------
INSERT INTO "public"."SysPost" VALUES ('0716b4b0-9a06-43e9-8ae8-82c74875f83e', 2, 'se', '项目经理', 1, NULL, '2021-05-27 20:26:35', '2021-05-27 20:26:35');
INSERT INTO "public"."SysPost" VALUES ('96927c30-41d0-4ced-8e29-cbed35c90fb0', 1, 'ceo', '董事长', 1, NULL, '2021-05-27 20:26:22', '2021-05-27 20:26:22');
INSERT INTO "public"."SysPost" VALUES ('e46af329-6d08-442c-9837-f22cff954411', 4, 'user', '普通员工', 1, NULL, '2022-04-23 21:50:55', '2021-05-27 20:26:52');
INSERT INTO "public"."SysPost" VALUES ('f0bd38c2-f1de-4bd9-e2db-08da00a93622', 5, 'dotnet_engineer', 'DotNet软件工程师', 1, NULL, '2022-03-08 10:13:18', '2022-03-08 10:13:18');
INSERT INTO "public"."SysPost" VALUES ('f0c67537-8094-429a-b474-f54ac518609e', 3, 'hr', '人力资源', 1, NULL, '2021-05-27 20:26:44', '2021-05-27 20:26:44');

-- ----------------------------
-- Table structure for SysRole
-- ----------------------------
DROP TABLE IF EXISTS "public"."SysRole";
CREATE TABLE "public"."SysRole" (
  "Id" uuid NOT NULL,
  "Number" int4,
  "Name" text COLLATE "pg_catalog"."default",
  "Remark" text COLLATE "pg_catalog"."default",
  "DeleteLock" bool NOT NULL,
  "LastModificationTime" timestamp(6) NOT NULL,
  "CreationTime" timestamp(6) NOT NULL
)
;

-- ----------------------------
-- Records of SysRole
-- ----------------------------
INSERT INTO "public"."SysRole" VALUES ('18fa4771-6f58-46a3-80d2-6f0f5e9972e3', 1, '超级管理员', '拥有所有权限', 't', '2021-01-10 11:25:12', '2016-07-06 17:59:20');
INSERT INTO "public"."SysRole" VALUES ('40ff1844-c099-4061-98e0-cd6e544fcfd3', 2, '普通用户', '普通用户', 't', '2021-01-30 00:51:17', '2016-07-06 17:59:20');

-- ----------------------------
-- Table structure for SysRoleMenuFunction
-- ----------------------------
DROP TABLE IF EXISTS "public"."SysRoleMenuFunction";
CREATE TABLE "public"."SysRoleMenuFunction" (
  "Id" uuid NOT NULL,
  "RoleId" uuid NOT NULL,
  "MenuId" int4 NOT NULL,
  "MenuFunctionId" uuid NOT NULL,
  "LastModificationTime" timestamp(6) NOT NULL,
  "CreationTime" timestamp(6) NOT NULL
)
;

-- ----------------------------
-- Records of SysRoleMenuFunction
-- ----------------------------
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('03e8fe58-17fe-4284-8916-08da250bdf25', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 6, '1cb6fbe1-4a6c-4aad-0f22-08d9fdad00ab', '2022-04-23 17:30:14', '2022-04-23 17:30:14');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('07e218fc-2298-4954-8917-08da250bdf25', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 8, 'd2e6ea60-2cf6-478a-0f23-08d9fdad00ab', '2022-04-23 17:30:14', '2022-04-23 17:30:14');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('234fac8d-c4ee-46e2-891a-08da250bdf25', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 11, '3bc0e68f-d03d-4e99-0f26-08d9fdad00ab', '2022-04-23 17:30:14', '2022-04-23 17:30:14');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('3a82a6ed-573a-4cba-8920-08da250bdf25', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 13, 'a3754771-f6e9-4a23-0f2c-08d9fdad00ab', '2022-04-23 17:30:14', '2022-04-23 17:30:14');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('3c0cbca5-310f-41db-891b-08da250bdf25', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 13, 'eb958545-6449-40db-0f27-08d9fdad00ab', '2022-04-23 17:30:14', '2022-04-23 17:30:14');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('47cf05e0-72b6-486f-8914-08da250bdf25', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 3, 'f64cfe50-1ef1-457f-0f20-08d9fdad00ab', '2022-04-23 17:30:14', '2022-04-23 17:30:14');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('47d72c2c-d4e1-4d3e-8923-08da250bdf25', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 15, '13f3f74d-c6fc-4488-0f2f-08d9fdad00ab', '2022-04-23 17:30:14', '2022-04-23 17:30:14');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('4854c7f2-e61b-4a3a-891d-08da250bdf25', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 13, '106fb69a-8bb5-4559-0f29-08d9fdad00ab', '2022-04-23 17:30:14', '2022-04-23 17:30:14');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('62941ac4-12b1-4427-8926-08da250bdf25', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 32, '6c09c0c0-72fa-4842-0f1f-08d9fdad00ab', '2022-04-23 17:30:14', '2022-04-23 17:30:14');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('723496de-edf5-4abb-8913-08da250bdf25', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 2, 'a7cd04db-bbe3-49b6-0f1e-08d9fdad00ab', '2022-04-23 17:30:14', '2022-04-23 17:30:14');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('8284a625-2407-44ca-891f-08da250bdf25', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 13, '523b53b5-8159-4a16-0f2b-08d9fdad00ab', '2022-04-23 17:30:14', '2022-04-23 17:30:14');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('a9b2d796-7fb4-4d61-8919-08da250bdf25', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 10, 'ec535908-8671-4928-0f25-08d9fdad00ab', '2022-04-23 17:30:14', '2022-04-23 17:30:14');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('aacc3780-8729-43df-8922-08da250bdf25', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 13, '541d9045-47b2-4629-0f2e-08d9fdad00ab', '2022-04-23 17:30:14', '2022-04-23 17:30:14');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('b03f0d20-4079-462a-891c-08da250bdf25', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 13, 'b5881044-afb8-40b2-0f28-08d9fdad00ab', '2022-04-23 17:30:14', '2022-04-23 17:30:14');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('cb8ad405-affd-4aa9-8915-08da250bdf25', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 5, 'a1ddd02f-8c21-4d79-0f21-08d9fdad00ab', '2022-04-23 17:30:14', '2022-04-23 17:30:14');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('d05aadea-113c-4d48-8924-08da250bdf25', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 19, 'c77c812a-1601-4311-0f70-08d9fdad00ab', '2022-04-23 17:30:14', '2022-04-23 17:30:14');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('d44f1f28-b588-4b68-8918-08da250bdf25', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 9, 'b7533a90-dae4-4263-0f24-08d9fdad00ab', '2022-04-23 17:30:14', '2022-04-23 17:30:14');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('d461b335-cc62-4af1-8925-08da250bdf25', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 28, '3f6d0af7-5386-4d3a-0f71-08d9fdad00ab', '2022-04-23 17:30:14', '2022-04-23 17:30:14');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('da031f6c-e0ec-4460-891e-08da250bdf25', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 13, 'f4621fbe-6b40-4454-0f2a-08d9fdad00ab', '2022-04-23 17:30:14', '2022-04-23 17:30:14');
INSERT INTO "public"."SysRoleMenuFunction" VALUES ('f55a6ab8-e54f-4c31-8921-08da250bdf25', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 13, 'b96f977c-a36e-4e7f-0f2d-08d9fdad00ab', '2022-04-23 17:30:14', '2022-04-23 17:30:14');

-- ----------------------------
-- Table structure for SysUser
-- ----------------------------
DROP TABLE IF EXISTS "public"."SysUser";
CREATE TABLE "public"."SysUser" (
  "Id" uuid NOT NULL,
  "Name" text COLLATE "pg_catalog"."default" NOT NULL,
  "LoginName" text COLLATE "pg_catalog"."default" NOT NULL,
  "Password" text COLLATE "pg_catalog"."default",
  "Phone" text COLLATE "pg_catalog"."default",
  "Email" text COLLATE "pg_catalog"."default" NOT NULL,
  "DeleteLock" bool NOT NULL,
  "OrganizationId" int4,
  "LastModificationTime" timestamp(6) NOT NULL,
  "CreationTime" timestamp(6) NOT NULL
)
;

-- ----------------------------
-- Records of SysUser
-- ----------------------------
INSERT INTO "public"."SysUser" VALUES ('0198459e-2034-4533-b843-5d227ad20740', '超级管理员', 'admin', 'E10ADC3949BA59ABBE56E057F20F883E', '10000000000', '1396510655@qq.com', 't', 7, '2022-03-08 17:27:36', '2017-04-06 19:55:53');
INSERT INTO "public"."SysUser" VALUES ('1550d6d4-0529-4fdd-62dc-08da00e3d8a0', '鲁迅', '鲁迅', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 'f', 7, '2022-03-08 17:30:56', '2022-03-08 17:21:56');
INSERT INTO "public"."SysUser" VALUES ('3739f349-7995-4c63-62d8-08da00e3d8a0', '白居易', '白居易', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 'f', 7, '2022-03-08 17:17:58', '2022-03-08 17:17:58');
INSERT INTO "public"."SysUser" VALUES ('4fd6a740-0cf1-4975-62d6-08da00e3d8a0', '李商隐', '李商隐', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 'f', 7, '2022-03-08 17:14:13', '2022-03-08 17:14:13');
INSERT INTO "public"."SysUser" VALUES ('5722af0f-2366-4fc9-62d5-08da00e3d8a0', '杜甫', '杜甫', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 'f', 7, '2022-03-08 17:13:02', '2022-03-08 17:13:02');
INSERT INTO "public"."SysUser" VALUES ('a1b6dafb-2b6a-4ff9-62da-08da00e3d8a0', '屈原', '屈原', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 'f', 7, '2022-03-08 17:19:55', '2022-03-08 17:19:55');
INSERT INTO "public"."SysUser" VALUES ('a3f9784c-5f00-4ec9-62d9-08da00e3d8a0', '陶渊明 ', '陶渊明 ', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 'f', 7, '2022-03-08 17:19:22', '2022-03-08 17:19:22');
INSERT INTO "public"."SysUser" VALUES ('ac18f496-e93d-42f0-b59e-e321acc85335', '李白', 'libai', 'E10ADC3949BA59ABBE56E057F20F883E', '12345678900', '12345678900@live.com', 't', 7, '2022-03-08 10:12:14', '2017-04-06 19:55:53');
INSERT INTO "public"."SysUser" VALUES ('cc186fe2-ee27-4292-62db-08da00e3d8a0', '孟浩然', '孟浩然', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 'f', 7, '2022-03-08 17:20:20', '2022-03-08 17:20:20');
INSERT INTO "public"."SysUser" VALUES ('e225e163-31c9-4da9-62d7-08da00e3d8a0', '苏轼', '苏轼', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 'f', 7, '2022-03-08 17:15:07', '2022-03-08 17:15:07');

-- ----------------------------
-- Table structure for SysUserPost
-- ----------------------------
DROP TABLE IF EXISTS "public"."SysUserPost";
CREATE TABLE "public"."SysUserPost" (
  "Id" uuid NOT NULL,
  "UserId" uuid NOT NULL,
  "PostId" uuid NOT NULL,
  "LastModificationTime" timestamp(6) NOT NULL,
  "CreationTime" timestamp(6) NOT NULL
)
;

-- ----------------------------
-- Records of SysUserPost
-- ----------------------------
INSERT INTO "public"."SysUserPost" VALUES ('0c1a55ba-6bd3-4810-a494-a6b9b7374d4d', 'ac18f496-e93d-42f0-b59e-e321acc85335', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', '2022-03-08 10:13:35', '2022-03-08 10:13:35');
INSERT INTO "public"."SysUserPost" VALUES ('575bf085-47bb-42f2-8b68-620cf460b164', '0198459e-2034-4533-b843-5d227ad20740', '96927c30-41d0-4ced-8e29-cbed35c90fb0', '2022-03-08 17:29:22', '2022-03-08 17:29:22');
INSERT INTO "public"."SysUserPost" VALUES ('6133b794-efc7-4ebc-b7cf-2cf72fa768f8', '1550d6d4-0529-4fdd-62dc-08da00e3d8a0', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', '2022-04-23 17:55:33', '2022-04-23 17:55:33');
INSERT INTO "public"."SysUserPost" VALUES ('6c34f115-28dd-441a-81d5-f6598c97d44a', 'a3f9784c-5f00-4ec9-62d9-08da00e3d8a0', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', '2022-03-08 17:19:22', '2022-03-08 17:19:22');
INSERT INTO "public"."SysUserPost" VALUES ('6f671077-c98d-4106-9736-bf2edb6db58d', '4fd6a740-0cf1-4975-62d6-08da00e3d8a0', 'e46af329-6d08-442c-9837-f22cff954411', '2022-03-08 17:14:13', '2022-03-08 17:14:13');
INSERT INTO "public"."SysUserPost" VALUES ('8100145c-9cd0-49bf-9a62-25c9e508bc1c', 'a1b6dafb-2b6a-4ff9-62da-08da00e3d8a0', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', '2022-03-08 17:19:55', '2022-03-08 17:19:55');
INSERT INTO "public"."SysUserPost" VALUES ('978fc672-d829-4dad-abc7-071810c5ad18', 'e225e163-31c9-4da9-62d7-08da00e3d8a0', 'e46af329-6d08-442c-9837-f22cff954411', '2022-03-08 17:15:08', '2022-03-08 17:15:08');
INSERT INTO "public"."SysUserPost" VALUES ('af1bec7e-3309-4629-9606-72eefa1826b3', 'cc186fe2-ee27-4292-62db-08da00e3d8a0', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', '2022-03-08 17:20:20', '2022-03-08 17:20:20');
INSERT INTO "public"."SysUserPost" VALUES ('b797ff16-d6f7-45db-83ec-f910b2612926', '4fd6a740-0cf1-4975-62d6-08da00e3d8a0', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', '2022-03-08 17:14:13', '2022-03-08 17:14:13');
INSERT INTO "public"."SysUserPost" VALUES ('b97331a7-e281-4027-aade-9f068558826a', '5722af0f-2366-4fc9-62d5-08da00e3d8a0', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', '2022-03-08 17:13:02', '2022-03-08 17:13:02');
INSERT INTO "public"."SysUserPost" VALUES ('d4e0ae0b-3573-4901-8fd7-9bb2c88ebe94', '3739f349-7995-4c63-62d8-08da00e3d8a0', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', '2022-03-08 17:17:58', '2022-03-08 17:17:58');
INSERT INTO "public"."SysUserPost" VALUES ('e64ef93c-2ce5-4b1d-a5d0-a9de937c5a3f', 'e225e163-31c9-4da9-62d7-08da00e3d8a0', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', '2022-03-08 17:15:07', '2022-03-08 17:15:07');

-- ----------------------------
-- Table structure for SysUserRole
-- ----------------------------
DROP TABLE IF EXISTS "public"."SysUserRole";
CREATE TABLE "public"."SysUserRole" (
  "Id" uuid NOT NULL,
  "UserId" uuid NOT NULL,
  "RoleId" uuid NOT NULL,
  "LastModificationTime" timestamp(6) NOT NULL,
  "CreationTime" timestamp(6) NOT NULL
)
;

-- ----------------------------
-- Records of SysUserRole
-- ----------------------------
INSERT INTO "public"."SysUserRole" VALUES ('1c9f81df-c8a0-45bb-a272-c84bd3af0c19', '0198459e-2034-4533-b843-5d227ad20740', '18fa4771-6f58-46a3-80d2-6f0f5e9972e3', '2022-03-08 17:29:22', '2022-03-08 17:29:22');
INSERT INTO "public"."SysUserRole" VALUES ('1fe23f57-97c5-4670-9064-88d7d972cd28', 'e225e163-31c9-4da9-62d7-08da00e3d8a0', '40ff1844-c099-4061-98e0-cd6e544fcfd3', '2022-03-08 17:15:07', '2022-03-08 17:15:07');
INSERT INTO "public"."SysUserRole" VALUES ('45b7d5af-4d2c-465e-a4b6-99e52af9aee5', '3739f349-7995-4c63-62d8-08da00e3d8a0', '40ff1844-c099-4061-98e0-cd6e544fcfd3', '2022-03-08 17:17:58', '2022-03-08 17:17:58');
INSERT INTO "public"."SysUserRole" VALUES ('66472deb-3a40-4e48-b3e7-931e166f9d56', '1550d6d4-0529-4fdd-62dc-08da00e3d8a0', '40ff1844-c099-4061-98e0-cd6e544fcfd3', '2022-04-23 17:55:33', '2022-04-23 17:55:33');
INSERT INTO "public"."SysUserRole" VALUES ('a646def7-0581-4ce9-947e-400360c339f9', 'a1b6dafb-2b6a-4ff9-62da-08da00e3d8a0', '40ff1844-c099-4061-98e0-cd6e544fcfd3', '2022-03-08 17:19:55', '2022-03-08 17:19:55');
INSERT INTO "public"."SysUserRole" VALUES ('a9f8a23b-8c2f-43cc-97af-8ed6f4c4d097', '4fd6a740-0cf1-4975-62d6-08da00e3d8a0', '40ff1844-c099-4061-98e0-cd6e544fcfd3', '2022-03-08 17:14:13', '2022-03-08 17:14:13');
INSERT INTO "public"."SysUserRole" VALUES ('ad5014f2-92e8-4109-9ca4-013a92390f8b', 'cc186fe2-ee27-4292-62db-08da00e3d8a0', '40ff1844-c099-4061-98e0-cd6e544fcfd3', '2022-03-08 17:20:20', '2022-03-08 17:20:20');
INSERT INTO "public"."SysUserRole" VALUES ('ce9f61ac-79d8-426f-9066-36962c017bf6', '5722af0f-2366-4fc9-62d5-08da00e3d8a0', '40ff1844-c099-4061-98e0-cd6e544fcfd3', '2022-03-08 17:13:02', '2022-03-08 17:13:02');
INSERT INTO "public"."SysUserRole" VALUES ('dbc656a6-4264-417d-97d8-577e1218feca', 'a3f9784c-5f00-4ec9-62d9-08da00e3d8a0', '40ff1844-c099-4061-98e0-cd6e544fcfd3', '2022-03-08 17:19:22', '2022-03-08 17:19:22');
INSERT INTO "public"."SysUserRole" VALUES ('fa1fdf14-3847-4194-894c-cd935a3dd9e6', 'ac18f496-e93d-42f0-b59e-e321acc85335', '40ff1844-c099-4061-98e0-cd6e544fcfd3', '2022-03-08 10:13:35', '2022-03-08 10:13:35');

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
INSERT INTO "public"."__EFMigrationsHistory" VALUES ('20220527061100_pgsql_init', '6.0.5');

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."SysDictionary_Id_seq"
OWNED BY "public"."SysDictionary"."Id";
SELECT setval('"public"."SysDictionary_Id_seq"', 5, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."SysMenu_Id_seq"
OWNED BY "public"."SysMenu"."Id";
SELECT setval('"public"."SysMenu_Id_seq"', 38, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."SysOrganization_Id_seq"
OWNED BY "public"."SysOrganization"."Id";
SELECT setval('"public"."SysOrganization_Id_seq"', 13, false);

-- ----------------------------
-- Primary Key structure for table FlowApprovalStepUsers
-- ----------------------------
ALTER TABLE "public"."FlowApprovalStepUsers" ADD CONSTRAINT "PK_FlowApprovalStepUsers" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table FlowApprovalSteps
-- ----------------------------
ALTER TABLE "public"."FlowApprovalSteps" ADD CONSTRAINT "PK_FlowApprovalSteps" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table FlowApprovals
-- ----------------------------
ALTER TABLE "public"."FlowApprovals" ADD CONSTRAINT "PK_FlowApprovals" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table FlowNodes
-- ----------------------------
ALTER TABLE "public"."FlowNodes" ADD CONSTRAINT "PK_FlowNodes" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table Flows
-- ----------------------------
ALTER TABLE "public"."Flows" ADD CONSTRAINT "PK_Flows" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table LowCodeList
-- ----------------------------
ALTER TABLE "public"."LowCodeList" ADD CONSTRAINT "PK_LowCodeList" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table LowCodeSearch
-- ----------------------------
ALTER TABLE "public"."LowCodeSearch" ADD CONSTRAINT "PK_LowCodeSearch" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table LowCodeTable
-- ----------------------------
ALTER TABLE "public"."LowCodeTable" ADD CONSTRAINT "PK_LowCodeTable" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table LowCodeTableInfo
-- ----------------------------
ALTER TABLE "public"."LowCodeTableInfo" ADD CONSTRAINT "PK_LowCodeTableInfo" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table Member
-- ----------------------------
ALTER TABLE "public"."Member" ADD CONSTRAINT "PK_Member" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table SysDataAuthority
-- ----------------------------
ALTER TABLE "public"."SysDataAuthority" ADD CONSTRAINT "PK_SysDataAuthority" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table SysDataAuthorityCustom
-- ----------------------------
ALTER TABLE "public"."SysDataAuthorityCustom" ADD CONSTRAINT "PK_SysDataAuthorityCustom" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table SysDictionary
-- ----------------------------
ALTER TABLE "public"."SysDictionary" ADD CONSTRAINT "PK_SysDictionary" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table SysFunction
-- ----------------------------
ALTER TABLE "public"."SysFunction" ADD CONSTRAINT "PK_SysFunction" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table SysMenu
-- ----------------------------
ALTER TABLE "public"."SysMenu" ADD CONSTRAINT "PK_SysMenu" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table SysMenuFunction
-- ----------------------------
ALTER TABLE "public"."SysMenuFunction" ADD CONSTRAINT "PK_SysMenuFunction" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table SysOperationLog
-- ----------------------------
ALTER TABLE "public"."SysOperationLog" ADD CONSTRAINT "PK_SysOperationLog" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table SysOrganization
-- ----------------------------
ALTER TABLE "public"."SysOrganization" ADD CONSTRAINT "PK_SysOrganization" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table SysPost
-- ----------------------------
ALTER TABLE "public"."SysPost" ADD CONSTRAINT "PK_SysPost" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table SysRole
-- ----------------------------
ALTER TABLE "public"."SysRole" ADD CONSTRAINT "PK_SysRole" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table SysRoleMenuFunction
-- ----------------------------
ALTER TABLE "public"."SysRoleMenuFunction" ADD CONSTRAINT "PK_SysRoleMenuFunction" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table SysUser
-- ----------------------------
ALTER TABLE "public"."SysUser" ADD CONSTRAINT "PK_SysUser" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table SysUserPost
-- ----------------------------
ALTER TABLE "public"."SysUserPost" ADD CONSTRAINT "PK_SysUserPost" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table SysUserRole
-- ----------------------------
ALTER TABLE "public"."SysUserRole" ADD CONSTRAINT "PK_SysUserRole" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table __EFMigrationsHistory
-- ----------------------------
ALTER TABLE "public"."__EFMigrationsHistory" ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");
