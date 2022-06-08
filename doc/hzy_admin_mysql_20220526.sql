/*
 Navicat Premium Data Transfer

 Source Server         : 本地_MySql
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : hzy_admin_mysql_20220526

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 08/06/2022 21:26:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for __efmigrationshistory
-- ----------------------------
DROP TABLE IF EXISTS `__efmigrationshistory`;
CREATE TABLE `__efmigrationshistory`  (
  `MigrationId` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProductVersion` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`MigrationId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of __efmigrationshistory
-- ----------------------------
INSERT INTO `__efmigrationshistory` VALUES ('20220527061934_mysql_init', '6.0.5');

-- ----------------------------
-- Table structure for flowapprovals
-- ----------------------------
DROP TABLE IF EXISTS `flowapprovals`;
CREATE TABLE `flowapprovals`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `UserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `UserName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `LaunchTime` datetime(6) NOT NULL,
  `FormId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `FlowId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `FlowCode` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `FlowName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `LastModificationTime` datetime(6) NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flowapprovals
-- ----------------------------

-- ----------------------------
-- Table structure for flowapprovalsteps
-- ----------------------------
DROP TABLE IF EXISTS `flowapprovalsteps`;
CREATE TABLE `flowapprovalsteps`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Sort` int(0) NOT NULL,
  `FlowNodeId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `FlowNodeName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `SortMore` int(0) NOT NULL,
  `State` int(0) NOT NULL,
  `Opinions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `UserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `UserName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ApprovalDate` datetime(6) NOT NULL,
  `LastModificationTime` datetime(6) NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flowapprovalsteps
-- ----------------------------

-- ----------------------------
-- Table structure for flowapprovalstepusers
-- ----------------------------
DROP TABLE IF EXISTS `flowapprovalstepusers`;
CREATE TABLE `flowapprovalstepusers`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `FlowApprovalStepId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `FlowNodeId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `FlowNodeName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `UserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `UserName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `LastModificationTime` datetime(6) NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flowapprovalstepusers
-- ----------------------------

-- ----------------------------
-- Table structure for flownodes
-- ----------------------------
DROP TABLE IF EXISTS `flownodes`;
CREATE TABLE `flownodes`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `FlowId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Sort` int(0) NULL DEFAULT NULL,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `RoleId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `LastModificationTime` datetime(6) NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flownodes
-- ----------------------------

-- ----------------------------
-- Table structure for flows
-- ----------------------------
DROP TABLE IF EXISTS `flows`;
CREATE TABLE `flows`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Number` int(0) NULL DEFAULT NULL,
  `Code` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `LastModificationTime` datetime(6) NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flows
-- ----------------------------

-- ----------------------------
-- Table structure for lowcodelist
-- ----------------------------
DROP TABLE IF EXISTS `lowcodelist`;
CREATE TABLE `lowcodelist`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Low_Code_TableId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Low_Code_Table_InfoId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `ForeignKeyTableId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `ForeignKeyTableFieldName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `LastModificationTime` datetime(6) NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lowcodelist
-- ----------------------------

-- ----------------------------
-- Table structure for lowcodesearch
-- ----------------------------
DROP TABLE IF EXISTS `lowcodesearch`;
CREATE TABLE `lowcodesearch`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Low_Code_TableId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Low_Code_Table_InfoId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `LastModificationTime` datetime(6) NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lowcodesearch
-- ----------------------------

-- ----------------------------
-- Table structure for lowcodetable
-- ----------------------------
DROP TABLE IF EXISTS `lowcodetable`;
CREATE TABLE `lowcodetable`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `TableName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Schema` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Type` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `DisplayName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `EntityName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `LastModificationTime` datetime(6) NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lowcodetable
-- ----------------------------
INSERT INTO `lowcodetable` VALUES ('0a8bdb18-758a-4798-9ffc-e7031dcbf262', 'SysPost', 'dbo', 'TABLE', '岗位', 'SysPost', NULL, '2022-05-24 21:57:34.000000', '2022-04-17 00:00:00.000000');
INSERT INTO `lowcodetable` VALUES ('1a8df018-79f8-4e26-b4eb-4b735aae7275', 'Flow', 'dbo', 'TABLE', '审批流', 'Flow', NULL, '2022-05-24 21:57:34.000000', '2022-04-17 00:00:00.000000');
INSERT INTO `lowcodetable` VALUES ('2ae9e532-7d9a-474b-b629-50a39945c44d', 'SysMenuFunction', 'dbo', 'TABLE', '菜单功能', 'SysMenuFunction', NULL, '2022-05-24 21:57:34.000000', '2022-04-17 00:00:00.000000');
INSERT INTO `lowcodetable` VALUES ('3da5d264-2e8d-460c-a10c-ff9a6bb57a60', 'SysUserRole', 'dbo', 'TABLE', '用户与角色', 'SysUserRole', NULL, '2022-05-24 21:57:34.000000', '2022-04-17 00:00:00.000000');
INSERT INTO `lowcodetable` VALUES ('524e71b4-cbf7-4248-8b29-3f99b43f2eb2', 'SysDataAuthorityCustom', 'dbo', 'TABLE', '自定义数据权限', 'SysDataAuthorityCustom', NULL, '2022-05-24 21:57:34.000000', '2022-04-17 00:00:00.000000');
INSERT INTO `lowcodetable` VALUES ('60cceba1-28bf-4d1d-b603-4edf95d512b8', 'SysOperationLog', 'dbo', 'TABLE', '操作日志', 'SysOperationLog', NULL, '2022-05-24 21:57:34.000000', '2022-04-17 00:00:00.000000');
INSERT INTO `lowcodetable` VALUES ('6323638b-a45f-4a76-886e-69a9e9be0901', 'SysUser', 'dbo', 'TABLE', '用户', 'SysUser', NULL, '2022-05-24 21:57:34.000000', '2022-04-17 00:00:00.000000');
INSERT INTO `lowcodetable` VALUES ('651bb982-1130-4e1c-9070-36b90dcf2324', 'FlowApprovalStep', 'dbo', 'TABLE', '工作流审批步骤配置', 'FlowApprovalStep', NULL, '2022-05-24 21:57:34.000000', '2022-04-17 00:00:00.000000');
INSERT INTO `lowcodetable` VALUES ('69b24f04-0ed3-45fc-91d9-0dc929175a57', 'SysUserPost', 'dbo', 'TABLE', '用户与岗位', 'SysUserPost', NULL, '2022-05-24 21:57:34.000000', '2022-04-17 00:00:00.000000');
INSERT INTO `lowcodetable` VALUES ('69edd8a8-1d24-478c-a909-b82039edcec0', 'LowCodeSearch', 'dbo', 'TABLE', '低代码检索表', 'LowCodeSearch', NULL, '2022-05-24 21:57:34.000000', '2022-05-23 00:00:00.000000');
INSERT INTO `lowcodetable` VALUES ('6ba9805c-916e-4d2c-99d0-216fcbc361cc', 'LowCodeTable', 'dbo', 'TABLE', '低代码表', 'LowCodeTable', NULL, '2022-05-24 21:57:34.000000', '2022-05-23 00:00:00.000000');
INSERT INTO `lowcodetable` VALUES ('6fabc67a-8b48-49a6-8ba1-c8a32c499d36', 'SysFunction', 'dbo', 'TABLE', '功能', 'SysFunction', NULL, '2022-05-24 21:57:34.000000', '2022-04-17 00:00:00.000000');
INSERT INTO `lowcodetable` VALUES ('73c97832-4e7f-4758-86d2-94327971b5fd', 'Member', 'dbo', 'TABLE', '会员', 'Member', NULL, '2022-05-24 21:57:34.000000', '2022-04-17 00:00:00.000000');
INSERT INTO `lowcodetable` VALUES ('79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 'LowCodeTableInfo', 'dbo', 'TABLE', '低代码表信息', 'LowCodeTableInfo', NULL, '2022-05-24 21:57:34.000000', '2022-05-23 00:00:00.000000');
INSERT INTO `lowcodetable` VALUES ('7ad3b915-f0bd-443a-89cd-42d41dd6c554', 'FlowApprovalStepUser', 'dbo', 'TABLE', '工作流用户审批步骤', 'FlowApprovalStepUser', NULL, '2022-05-24 21:57:34.000000', '2022-04-17 00:00:00.000000');
INSERT INTO `lowcodetable` VALUES ('852f53ff-0d00-4c32-aa55-a9c11993751b', 'LowCodeList', 'dbo', 'TABLE', '低代码列表', 'LowCodeList', NULL, '2022-05-24 21:57:34.000000', '2022-05-23 00:00:00.000000');
INSERT INTO `lowcodetable` VALUES ('8da38d20-8a09-4e81-8dd8-ed6702aee380', 'SysRoleMenuFunction', 'dbo', 'TABLE', '角色菜单功能关联', 'SysRoleMenuFunction', NULL, '2022-05-24 21:57:34.000000', '2022-04-17 00:00:00.000000');
INSERT INTO `lowcodetable` VALUES ('ae6d94d8-6a15-4348-b600-aa17e4b61718', 'FlowNode', 'dbo', 'TABLE', '工作流节点', 'FlowNode', NULL, '2022-05-24 21:57:34.000000', '2022-04-17 00:00:00.000000');
INSERT INTO `lowcodetable` VALUES ('af37f705-7ba0-4883-b1be-8a274ea4c026', 'SysDictionary', 'dbo', 'TABLE', '数据字典', 'SysDictionary', NULL, '2022-05-24 21:57:34.000000', '2022-04-17 00:00:00.000000');
INSERT INTO `lowcodetable` VALUES ('c5883367-42aa-43b8-9577-4720a2253efa', 'News', 'dbo', 'TABLE', '资讯', 'News', NULL, '2022-05-24 21:57:34.000000', '2022-04-28 00:00:00.000000');
INSERT INTO `lowcodetable` VALUES ('d2600250-6f32-4d7d-8395-96cc9fa36db4', 'SysMenu', 'dbo', 'TABLE', '菜单', 'SysMenu', NULL, '2022-05-24 21:57:34.000000', '2022-04-17 00:00:00.000000');
INSERT INTO `lowcodetable` VALUES ('d26d07cb-158a-4cb2-8b20-5dfd5181af54', 'SysOrganization', 'dbo', 'TABLE', '组织', 'SysOrganization', NULL, '2022-05-24 21:57:34.000000', '2022-04-17 00:00:00.000000');
INSERT INTO `lowcodetable` VALUES ('d8948c56-c5bd-4061-b272-5417375f38f0', 'FlowApproval', 'dbo', 'TABLE', '审批流审批', 'FlowApproval', NULL, '2022-05-24 21:57:34.000000', '2022-04-17 00:00:00.000000');
INSERT INTO `lowcodetable` VALUES ('e79db53b-7162-4669-9b5e-f860501475ac', 'SysDataAuthority', 'dbo', 'TABLE', '数据权限', 'SysDataAuthority', NULL, '2022-05-24 21:57:34.000000', '2022-04-17 00:00:00.000000');
INSERT INTO `lowcodetable` VALUES ('f3d7bbb3-c1fb-4d61-92a4-9bc101811335', 'SysRole', 'dbo', 'TABLE', '角色', 'SysRole', NULL, '2022-05-24 21:57:34.000000', '2022-04-17 00:00:00.000000');

-- ----------------------------
-- Table structure for lowcodetableinfo
-- ----------------------------
DROP TABLE IF EXISTS `lowcodetableinfo`;
CREATE TABLE `lowcodetableinfo`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Low_Code_TableId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `IsPrimary` tinyint(1) NOT NULL,
  `IsIdentity` tinyint(1) NOT NULL,
  `IsNullable` tinyint(1) NOT NULL,
  `Position` int(0) NOT NULL,
  `ColumnName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Describe` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `DatabaseColumnType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `CsType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `CsField` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `MaxLength` int(0) NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `DisplayName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lowcodetableinfo
-- ----------------------------
INSERT INTO `lowcodetableinfo` VALUES ('01ca178c-112a-4a49-d489-08da3d8d5a26', 'd8948c56-c5bd-4061-b272-5417375f38f0', 0, 0, 1, 33, 'CreationTime', '', 'datetime', 'DateTime', 'CreationTime', 8, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('02ffafb8-cf9b-441c-d4c2-08da3d8d5a26', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 0, 0, 1, 18, 'TableName', '', 'varchar(50)', 'String', 'TableName', 50, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('042a59e2-72c1-4c38-d52d-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 0, 0, 1, 140, 'ParentId', '', 'int', 'Int32', 'ParentId', NULL, '2022-06-08 21:25:35.914488', '2022-05-24 00:00:00.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('043612f1-e16a-4c44-d497-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 0, 0, 1, 42, 'LastModificationTime', '', 'datetime', 'DateTime', 'LastModificationTime', 8, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('063d44b8-6ce2-47a6-d51a-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 0, 0, 1, 9, 'Browser', '', 'varchar(255)', 'String', 'Browser', 255, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('06f4f5a9-f63f-4e47-d485-08da3d8d5a26', '1a8df018-79f8-4e26-b4eb-4b735aae7275', 0, 0, 1, 29, 'Name', '流程名称', 'nvarchar(255)', 'String', 'Name', 255, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('0888b15f-3bd2-4881-d523-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 0, 0, 0, 12, 'TakeUpTime', '接口耗时（毫秒）', 'bigint', 'Int64', 'TakeUpTime', 8, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('0aa2daab-50df-4397-d51c-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 0, 0, 1, 3, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', 6, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('0b45e9bb-b9f1-4a2f-d526-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 0, 0, 1, 142, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', NULL, '2022-06-08 21:25:35.914488', '2022-05-24 00:00:00.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('0cfc881c-98d4-4a2c-d4a5-08da3d8d5a26', '7ad3b915-f0bd-443a-89cd-42d41dd6c554', 0, 0, 1, 60, 'UserName', '审批人名称', 'varchar(500)', 'String', 'UserName', 500, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('0df6b078-b248-4c83-d4ab-08da3d8d5a26', 'ae6d94d8-6a15-4348-b600-aa17e4b61718', 0, 0, 1, 67, 'Name', '', 'nvarchar(255)', 'String', 'Name', 255, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('0e19400d-1876-4fe3-d4a7-08da3d8d5a26', 'ae6d94d8-6a15-4348-b600-aa17e4b61718', 0, 0, 1, 63, 'CreationTime', '', 'datetime', 'DateTime', 'CreationTime', 8, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('0e864b91-b667-4f53-d4a3-08da3d8d5a26', '7ad3b915-f0bd-443a-89cd-42d41dd6c554', 0, 0, 1, 54, 'LastModificationTime', '', 'datetime', 'DateTime', 'LastModificationTime', 8, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('0f0c03e3-604f-489f-d4bf-08da3d8d5a26', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 0, 0, 1, 16, 'LastModificationTime', '', 'datetime', 'DateTime', 'LastModificationTime', 8, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('0f908e1d-4a82-42c1-d4e8-08da3d8d5a26', 'e79db53b-7162-4669-9b5e-f860501475ac', 0, 0, 1, 86, 'PermissionType', '数据权限类型', 'int', 'Int32', 'PermissionType', 4, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('1121d642-49e8-4b25-d52b-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 0, 0, 1, 133, 'Name', '', 'nvarchar(255)', 'String', 'Name', NULL, '2022-06-08 21:25:35.914488', '2022-05-24 00:00:00.000000', '组织名称');
INSERT INTO `lowcodetableinfo` VALUES ('11afcf11-9b42-47ce-d4c5-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 0, 0, 1, 204, 'ColumnName', '', 'varchar(500)', 'String', 'ColumnName', 500, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('11f3d291-cf7a-4143-d52a-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 0, 0, 1, 135, 'LevelCode', '', 'varchar(50)', 'String', 'LevelCode', NULL, '2022-06-08 21:25:35.914488', '2022-05-24 00:00:00.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('1213c179-e366-4e3c-d540-08da3d8d5a26', '8da38d20-8a09-4e81-8dd8-ed6702aee380', 0, 0, 1, 163, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', 6, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('12e9e9ad-5631-4dc8-d503-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 0, 0, 1, 122, 'JumpUrl', '', 'varchar(255)', 'String', 'JumpUrl', 255, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('134c9f62-abd2-476e-d532-08da3d8d5a26', '0a8bdb18-758a-4798-9ffc-e7031dcbf262', 0, 0, 1, 150, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', 6, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('135e23db-540b-4096-d551-08da3d8d5a26', '69b24f04-0ed3-45fc-91d9-0dc929175a57', 0, 0, 1, 177, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', 6, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('1790b4d5-51b2-4dc0-d534-08da3d8d5a26', '0a8bdb18-758a-4798-9ffc-e7031dcbf262', 0, 0, 1, 146, 'Name', '', 'nvarchar(255)', 'String', 'Name', 255, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('18b4430b-765d-4a71-97b9-08da39a2ef6c', '3da5d264-2e8d-460c-a10c-ff9a6bb57a60', 0, 0, 1, 171, 'UserId', '', 'uniqueidentifier', 'Guid', 'UserId', NULL, '2022-05-19 22:26:18.000000', '2022-05-19 00:00:00.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('1916e619-4818-4c63-d50b-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 0, 0, 1, 118, 'Show', '', 'bit', 'Boolean', 'Show', 1, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('19a7504c-f740-4b49-d528-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 0, 0, 1, 141, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', NULL, '2022-06-08 21:25:35.914488', '2022-05-24 00:00:00.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('19fa02fe-fb8f-4631-d50e-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 0, 0, 1, 113, 'Url', '', 'nvarchar(255)', 'String', 'Url', NULL, '2022-05-24 21:58:07.000000', '2022-05-24 00:00:00.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('1a2a9e15-dc83-49e1-d4b9-08da3d8d5a26', '69edd8a8-1d24-478c-a909-b82039edcec0', 0, 0, 1, 188, 'Low_Code_Table_InfoId', '', 'uniqueidentifier', 'Guid', 'Low_Code_Table_InfoId', 16, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('1d3c8224-a3a5-4b88-d4cd-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 0, 0, 1, 200, 'IsPrimary', '', 'bit', 'Boolean', 'IsPrimary', 1, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('1d881e59-d88e-497f-d51e-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 0, 0, 1, 7, 'FormBody', 'json表单信息', 'varchar(MAX)', 'String', 'FormBody', -1, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('1e40d97a-49ee-4727-d4c6-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 0, 0, 1, 198, 'CreationTime', '', 'datetime', 'DateTime', 'CreationTime', 8, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('2006ac52-bb49-4e41-d501-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 0, 0, 1, 109, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', NULL, '2022-05-24 21:58:07.000000', '2022-05-24 00:00:00.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('200ff922-513c-4b19-d519-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 0, 0, 1, 4, 'Api', '接口地址', 'varchar(500)', 'String', 'Api', 500, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('2029bb6d-a0f2-41de-97b8-08da39a2ef6c', '3da5d264-2e8d-460c-a10c-ff9a6bb57a60', 0, 0, 1, 172, 'RoleId', '', 'uniqueidentifier', 'Guid', 'RoleId', NULL, '2022-05-19 22:26:18.000000', '2022-05-19 00:00:00.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('2286c948-4f0d-4b66-d535-08da3d8d5a26', '0a8bdb18-758a-4798-9ffc-e7031dcbf262', 0, 0, 1, 144, 'Number', '', 'int', 'Int32', 'Number', 4, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('2321aac8-0eed-4b87-d4ac-08da3d8d5a26', 'ae6d94d8-6a15-4348-b600-aa17e4b61718', 0, 0, 1, 69, 'Remark', '', 'nvarchar(255)', 'String', 'Remark', 255, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('2341dcb1-8056-4a7c-d4eb-08da3d8d5a26', '524e71b4-cbf7-4248-8b29-3f99b43f2eb2', 0, 0, 1, 89, 'CreationTime', '', 'datetime', 'DateTime', 'CreationTime', 8, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('235b67f8-62d2-480e-d508-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 0, 0, 1, 111, 'Number', '编号', 'int', 'Int32', 'Number', NULL, '2022-05-24 21:58:07.000000', '2022-05-24 00:00:00.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('24db7ed8-1a4f-4b25-d49d-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 0, 0, 1, 51, 'UserName', '步骤审批人名称', 'varchar(255)', 'String', 'UserName', 255, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('252ac7b2-0e62-48e1-97b7-08da39a2ef6c', '3da5d264-2e8d-460c-a10c-ff9a6bb57a60', 0, 0, 1, 173, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', NULL, '2022-05-19 22:26:18.000000', '2022-05-19 00:00:00.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('2819dfe7-f12b-483c-d4a6-08da3d8d5a26', 'ae6d94d8-6a15-4348-b600-aa17e4b61718', 1, 0, 0, 61, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('287314b2-3141-4957-d548-08da3d8d5a26', '6323638b-a45f-4a76-886e-69a9e9be0901', 0, 0, 0, 171, 'Email', '', 'nvarchar(255)', 'String', 'Email', NULL, '2022-06-08 21:26:01.987339', '2022-05-24 00:00:00.000000', '电子邮箱');
INSERT INTO `lowcodetableinfo` VALUES ('29b765bd-36f4-462f-d4f3-08da3d8d5a26', 'af37f705-7ba0-4883-b1be-8a274ea4c026', 0, 0, 1, 98, 'Name', '分组名/键', 'varchar(255)', 'String', 'Name', 255, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('29d08351-9091-4c91-d514-08da3d8d5a26', '2ae9e532-7d9a-474b-b629-50a39945c44d', 0, 0, 1, 128, 'MenuId', '', 'int', 'Int32', 'MenuId', 4, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('2a1c3f3d-4efc-472b-d49a-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 0, 0, 1, 47, 'SortMore', '多次审批顺序号（可能是多次审批次数）', 'int', 'Int32', 'SortMore', 4, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('2ae91c1d-d618-4267-d4b3-08da3d8d5a26', '852f53ff-0d00-4c32-aa55-a9c11993751b', 0, 0, 1, 190, 'LastModificationTime', '', 'datetime', 'DateTime', 'LastModificationTime', 8, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('2b4747ed-0409-4d14-d48b-08da3d8d5a26', 'd8948c56-c5bd-4061-b272-5417375f38f0', 0, 0, 1, 38, 'FlowId', '流程Id', 'uniqueidentifier', 'Guid', 'FlowId', 16, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('2ca9aa7e-321e-47f0-d4f0-08da3d8d5a26', 'af37f705-7ba0-4883-b1be-8a274ea4c026', 0, 0, 1, 94, 'CreationTime', '创建时间', 'datetime', 'DateTime', 'CreationTime', 8, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('2ffaa9ee-c286-4f90-d495-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 0, 0, 1, 45, 'FlowNodeId', '审批流节点Id', 'uniqueidentifier', 'Guid', 'FlowNodeId', 16, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('3071360b-c1ef-4dff-d48f-08da3d8d5a26', 'd8948c56-c5bd-4061-b272-5417375f38f0', 0, 0, 1, 36, 'LaunchTime', '发起时间', 'datetime', 'DateTime', 'LaunchTime', 8, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('3133985d-586c-4c4e-d4ff-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 0, 0, 1, 119, 'Close', '', 'bit', 'Boolean', 'Close', 1, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('31f56d34-2216-45b0-d4df-08da3d8d5a26', 'c5883367-42aa-43b8-9577-4720a2253efa', 0, 0, 1, 214, 'Author', '', 'varchar(50)', 'String', 'Author', 50, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('325af03c-cbb7-4de6-d4ee-08da3d8d5a26', '524e71b4-cbf7-4248-8b29-3f99b43f2eb2', 0, 0, 0, 91, 'SysOrganizationId', '', 'int', 'Int32', 'SysOrganizationId', 4, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('3ab15f84-8722-4837-d4c3-08da3d8d5a26', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 0, 0, 1, 20, 'Type', '', 'int', 'Int32', 'Type', 4, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('3b959124-21d2-45b9-d4ca-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 0, 0, 1, 205, 'Describe', '', 'varchar(50)', 'String', 'Describe', 50, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('3f7e43c9-762f-48ea-d53a-08da3d8d5a26', 'f3d7bbb3-c1fb-4d61-92a4-9bc101811335', 0, 0, 1, 157, 'DeleteLock', '', 'bit', 'Boolean', 'DeleteLock', 1, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('42430604-7090-442d-d539-08da3d8d5a26', 'f3d7bbb3-c1fb-4d61-92a4-9bc101811335', 0, 0, 1, 153, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', 6, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('441e03ec-ecb7-4172-d4c1-08da3d8d5a26', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 0, 0, 1, 19, 'Schema', '', 'varchar(50)', 'String', 'Schema', 50, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('4467bf43-6e95-4798-d522-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 0, 0, 1, 8, 'QueryString', '地址栏信息', 'varchar(MAX)', 'String', 'QueryString', -1, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('46bac66f-3cf0-46b3-d546-08da3d8d5a26', '6323638b-a45f-4a76-886e-69a9e9be0901', 0, 0, 1, 166, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', NULL, '2022-06-08 21:26:01.987339', '2022-05-24 00:00:00.000000', '创建时间');
INSERT INTO `lowcodetableinfo` VALUES ('4736479f-6089-4141-d521-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 0, 0, 1, 10, 'OS', '', 'varchar(255)', 'String', 'OS', 255, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('48b12860-84de-4f7b-d4c9-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 0, 0, 1, 206, 'DatabaseColumnType', '', 'varchar(50)', 'String', 'DatabaseColumnType', 50, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('495fe86e-5bd6-44d4-d4a1-08da3d8d5a26', '7ad3b915-f0bd-443a-89cd-42d41dd6c554', 0, 0, 1, 57, 'FlowNodeId', '审批节点Id', 'uniqueidentifier', 'Guid', 'FlowNodeId', 16, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('498327eb-5676-4091-d4fe-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 1, 1, 0, 107, 'Id', '', 'int', 'Int32', 'Id', NULL, '2022-05-24 21:58:07.000000', '2022-05-24 00:00:00.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('4aaa1e18-8c06-4806-d4d1-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 0, 0, 1, 203, 'Position', '', 'int', 'Int32', 'Position', 4, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('4b5bc027-5663-463a-d54b-08da3d8d5a26', '6323638b-a45f-4a76-886e-69a9e9be0901', 0, 0, 1, 167, 'Name', '', 'nvarchar(255)', 'String', 'Name', NULL, '2022-06-08 21:26:01.987339', '2022-05-24 00:00:00.000000', '用户名称');
INSERT INTO `lowcodetableinfo` VALUES ('4c479d54-530f-4652-d552-08da3d8d5a26', '69b24f04-0ed3-45fc-91d9-0dc929175a57', 0, 0, 1, 176, 'PostId', '', 'uniqueidentifier', 'Guid', 'PostId', 16, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('517cbfe0-275d-4f36-d53b-08da3d8d5a26', 'f3d7bbb3-c1fb-4d61-92a4-9bc101811335', 0, 0, 1, 152, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', 6, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('5257ad4f-589d-40d0-d533-08da3d8d5a26', '0a8bdb18-758a-4798-9ffc-e7031dcbf262', 0, 0, 1, 149, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', 6, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('5541e535-7cbe-43d2-d4d4-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 0, 0, 1, 80, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', NULL, '2022-06-08 21:23:44.815115', '2022-05-24 00:00:00.000000', '创建时间');
INSERT INTO `lowcodetableinfo` VALUES ('564a907b-1f47-4849-d537-08da3d8d5a26', '0a8bdb18-758a-4798-9ffc-e7031dcbf262', 0, 0, 1, 147, 'State', '', 'int', 'Int32', 'State', 4, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('585e18ea-ab50-4216-d4b5-08da3d8d5a26', '852f53ff-0d00-4c32-aa55-a9c11993751b', 0, 0, 1, 192, 'Low_Code_TableId', '', 'uniqueidentifier', 'Guid', 'Low_Code_TableId', 16, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('5a9fa990-b6d6-445f-d54c-08da3d8d5a26', '6323638b-a45f-4a76-886e-69a9e9be0901', 0, 0, 1, 173, 'OrganizationId', '', 'int', 'Int32', 'OrganizationId', NULL, '2022-06-08 21:26:01.987339', '2022-05-24 00:00:00.000000', '组织id');
INSERT INTO `lowcodetableinfo` VALUES ('5aa598a9-6e52-4ae4-d50a-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 0, 0, 1, 114, 'Router', '', 'nvarchar(255)', 'String', 'Router', NULL, '2022-05-24 21:58:07.000000', '2022-05-24 00:00:00.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('5aed3feb-3d77-4e1e-d52c-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 0, 0, 1, 134, 'OrderNumber', '', 'int', 'Int32', 'OrderNumber', NULL, '2022-06-08 21:25:35.914488', '2022-05-24 00:00:00.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('5bcf7406-75cc-4171-d545-08da3d8d5a26', '6323638b-a45f-4a76-886e-69a9e9be0901', 1, 0, 0, 164, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', NULL, '2022-06-08 21:26:01.987339', '2022-05-24 00:00:00.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('5ca84ecf-5971-45bc-d4a8-08da3d8d5a26', 'ae6d94d8-6a15-4348-b600-aa17e4b61718', 0, 0, 1, 65, 'FlowCode', '', 'nvarchar(255)', 'String', 'FlowCode', 255, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('5cb41f1c-e68a-47f9-d486-08da3d8d5a26', '1a8df018-79f8-4e26-b4eb-4b735aae7275', 0, 0, 1, 27, 'Number', '排序号', 'int', 'Int32', 'Number', 4, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('5e4c83fd-7071-4997-d4be-08da3d8d5a26', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 0, 0, 1, 22, 'EntityName', '', 'varchar(50)', 'String', 'EntityName', 50, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('5f28be90-e415-46dd-d4e3-08da3d8d5a26', 'c5883367-42aa-43b8-9577-4720a2253efa', 0, 0, 1, 215, 'Time', '', 'datetime', 'DateTime', 'Time', 8, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('5f5c2997-daa8-491c-d51d-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 0, 0, 1, 6, 'Form', '表单信息', 'varchar(MAX)', 'String', 'Form', -1, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('5f9a4a78-1bb9-4592-d536-08da3d8d5a26', '0a8bdb18-758a-4798-9ffc-e7031dcbf262', 0, 0, 1, 148, 'Remarks', '', 'nvarchar(255)', 'String', 'Remarks', 255, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('5fc01eb0-4833-4e93-d483-08da3d8d5a26', '1a8df018-79f8-4e26-b4eb-4b735aae7275', 0, 0, 1, 26, 'CreationTime', '', 'datetime', 'DateTime', 'CreationTime', 8, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('5fea8348-aa6b-4577-d4cc-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 0, 0, 1, 202, 'IsNullable', '', 'bit', 'Boolean', 'IsNullable', 1, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('60019cd9-49eb-489b-97b5-08da39a2ef6c', '3da5d264-2e8d-460c-a10c-ff9a6bb57a60', 1, 0, 0, 170, 'Id', 'Id', 'uniqueidentifier', 'Guid', 'Id', NULL, '2022-05-19 22:26:18.000000', '2022-05-19 00:00:00.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('609a52aa-48b2-4e64-d48e-08da3d8d5a26', 'd8948c56-c5bd-4061-b272-5417375f38f0', 0, 0, 1, 32, 'LastModificationTime', '', 'datetime', 'DateTime', 'LastModificationTime', 8, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('6284c929-4115-4c17-d491-08da3d8d5a26', 'd8948c56-c5bd-4061-b272-5417375f38f0', 0, 0, 1, 35, 'UserName', '发起人', 'varchar(255)', 'String', 'UserName', 255, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('6304e602-84a1-4c57-d4ec-08da3d8d5a26', '524e71b4-cbf7-4248-8b29-3f99b43f2eb2', 0, 0, 1, 88, 'LastModificationTime', '', 'datetime', 'DateTime', 'LastModificationTime', 8, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('646614d9-d7f3-42c5-d4fd-08da3d8d5a26', '6fabc67a-8b48-49a6-8ba1-c8a32c499d36', 0, 0, 1, 104, 'Remark', '', 'nvarchar(255)', 'String', 'Remark', 255, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('66718de6-5c1a-4229-d524-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 0, 0, 1, 11, 'UserId', '当前操作人id', 'uniqueidentifier', 'Guid', 'UserId', 16, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('669b87ce-c694-4c8c-d4da-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 0, 0, 1, 73, 'Phone', '', 'nvarchar(255)', 'String', 'Phone', NULL, '2022-06-08 21:23:44.815115', '2022-05-24 00:00:00.000000', '联系电话');
INSERT INTO `lowcodetableinfo` VALUES ('69875823-326c-4e13-d538-08da3d8d5a26', 'f3d7bbb3-c1fb-4d61-92a4-9bc101811335', 1, 0, 0, 151, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('6aa13b8f-1e3c-4750-d530-08da3d8d5a26', '0a8bdb18-758a-4798-9ffc-e7031dcbf262', 1, 0, 0, 143, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('6c3bb548-aafc-4f16-d50d-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 0, 0, 1, 123, 'Type', '', 'int', 'Int32', 'Type', 4, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('6c934348-be20-4c9e-d542-08da3d8d5a26', '8da38d20-8a09-4e81-8dd8-ed6702aee380', 0, 0, 1, 161, 'MenuFunctionId', '', 'uniqueidentifier', 'Guid', 'MenuFunctionId', 16, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('6cfe3b57-006f-436b-d511-08da3d8d5a26', '2ae9e532-7d9a-474b-b629-50a39945c44d', 0, 0, 1, 129, 'FunctionCode', '', 'varchar(100)', 'String', 'FunctionCode', 100, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('6e69cf9b-d9cd-4c31-d4f4-08da3d8d5a26', 'af37f705-7ba0-4883-b1be-8a274ea4c026', 0, 0, 1, 99, 'ParentId', '父级分组id', 'int', 'Int32', 'ParentId', 4, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('6fe5687c-bfaf-4e2f-d4e0-08da3d8d5a26', 'c5883367-42aa-43b8-9577-4720a2253efa', 0, 0, 1, 216, 'Content', '', 'varchar(MAX)', 'String', 'Content', -1, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('70e30a70-99f9-44b3-d482-08da3d8d5a26', '1a8df018-79f8-4e26-b4eb-4b735aae7275', 0, 0, 1, 28, 'Code', '编码', 'nvarchar(255)', 'String', 'Code', 255, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('7211aea6-eb91-41e5-d505-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 0, 0, 1, 108, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', NULL, '2022-05-24 21:58:07.000000', '2022-05-24 00:00:00.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('72ac247c-d792-4fee-d4dc-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 0, 0, 1, 74, 'Sex', '', 'nvarchar(255)', 'String', 'Sex', NULL, '2022-06-08 21:23:44.815115', '2022-05-24 00:00:00.000000', '性别');
INSERT INTO `lowcodetableinfo` VALUES ('73d17476-e006-4530-d4ad-08da3d8d5a26', 'ae6d94d8-6a15-4348-b600-aa17e4b61718', 0, 0, 1, 68, 'RoleId', '', 'uniqueidentifier', 'Guid', 'RoleId', 16, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('743d6eab-b4c8-4a15-d4f8-08da3d8d5a26', '6fabc67a-8b48-49a6-8ba1-c8a32c499d36', 0, 0, 1, 103, 'ByName', '', 'nvarchar(255)', 'String', 'ByName', 255, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('78757b0d-d9ee-45ea-d500-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 0, 0, 1, 115, 'ComponentName', '', 'nvarchar(255)', 'String', 'ComponentName', NULL, '2022-05-24 21:58:07.000000', '2022-05-24 00:00:00.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('7b4df31f-36a3-477c-d4ba-08da3d8d5a26', '69edd8a8-1d24-478c-a909-b82039edcec0', 0, 0, 1, 187, 'Low_Code_TableId', '', 'uniqueidentifier', 'Guid', 'Low_Code_TableId', 16, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('7b6df0cd-c31b-4508-d53f-08da3d8d5a26', '8da38d20-8a09-4e81-8dd8-ed6702aee380', 1, 0, 0, 158, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('7b900baf-65df-4910-d4b1-08da3d8d5a26', '852f53ff-0d00-4c32-aa55-a9c11993751b', 0, 0, 1, 195, 'ForeignKeyTableFieldName', '', 'varchar(50)', 'String', 'ForeignKeyTableFieldName', 50, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('7c7400ed-ec08-4832-d4b6-08da3d8d5a26', '69edd8a8-1d24-478c-a909-b82039edcec0', 1, 0, 0, 184, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('7cbe8988-cbac-4ea2-d54a-08da3d8d5a26', '6323638b-a45f-4a76-886e-69a9e9be0901', 0, 0, 1, 168, 'LoginName', '', 'nvarchar(255)', 'String', 'LoginName', NULL, '2022-06-08 21:26:01.987339', '2022-05-24 00:00:00.000000', '登录名称');
INSERT INTO `lowcodetableinfo` VALUES ('804e418f-3206-4090-d4e4-08da3d8d5a26', 'c5883367-42aa-43b8-9577-4720a2253efa', 0, 0, 1, 213, 'Title', '', 'varchar(50)', 'String', 'Title', 50, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('8237d289-05cf-485b-d4b8-08da3d8d5a26', '69edd8a8-1d24-478c-a909-b82039edcec0', 0, 0, 1, 185, 'LastModificationTime', '', 'datetime', 'DateTime', 'LastModificationTime', 8, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('825e69b9-cd33-4ab8-97b6-08da39a2ef6c', '3da5d264-2e8d-460c-a10c-ff9a6bb57a60', 0, 0, 1, 174, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', NULL, '2022-05-19 22:26:18.000000', '2022-05-19 00:00:00.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('82ee25d2-4e01-4100-d4f9-08da3d8d5a26', '6fabc67a-8b48-49a6-8ba1-c8a32c499d36', 0, 0, 1, 106, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', 6, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('8326ca11-09f1-4c38-d4d6-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 0, 0, 1, 77, 'Introduce', '', 'nvarchar(255)', 'String', 'Introduce', NULL, '2022-06-08 21:23:44.815115', '2022-05-24 00:00:00.000000', '简介');
INSERT INTO `lowcodetableinfo` VALUES ('837b058b-a88e-4107-d4dd-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 0, 0, 1, 79, 'UserId', '', 'uniqueidentifier', 'Guid', 'UserId', NULL, '2022-06-08 21:23:44.815115', '2022-05-24 00:00:00.000000', '所属用户');
INSERT INTO `lowcodetableinfo` VALUES ('8430c5a1-6c73-4733-d4bc-08da3d8d5a26', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 0, 0, 1, 17, 'CreationTime', '', 'datetime', 'DateTime', 'CreationTime', 8, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('84a87e33-8b66-4b9a-d4f5-08da3d8d5a26', 'af37f705-7ba0-4883-b1be-8a274ea4c026', 0, 0, 1, 95, 'Sort', '排序号', 'int', 'Int32', 'Sort', 4, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('86b95bf0-4418-46ba-d4cb-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 0, 0, 1, 201, 'IsIdentity', '', 'bit', 'Boolean', 'IsIdentity', 1, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('897a208c-2e13-46f1-d4d7-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 0, 0, 1, 81, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', NULL, '2022-06-08 21:23:44.815115', '2022-05-24 00:00:00.000000', '更新时间');
INSERT INTO `lowcodetableinfo` VALUES ('8ad408db-b5aa-4cb7-d494-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 0, 0, 1, 43, 'CreationTime', '', 'datetime', 'DateTime', 'CreationTime', 8, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('92bc9094-160e-4338-d4a4-08da3d8d5a26', '7ad3b915-f0bd-443a-89cd-42d41dd6c554', 0, 0, 1, 59, 'UserId', '审批人Id', 'uniqueidentifier', 'Guid', 'UserId', 16, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('92c1fffc-5a00-468c-d4b0-08da3d8d5a26', '852f53ff-0d00-4c32-aa55-a9c11993751b', 0, 0, 1, 191, 'CreationTime', '', 'datetime', 'DateTime', 'CreationTime', 8, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('97284d66-88b9-478f-d4e5-08da3d8d5a26', 'e79db53b-7162-4669-9b5e-f860501475ac', 1, 0, 0, 82, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('9a050102-6300-46ef-d516-08da3d8d5a26', '2ae9e532-7d9a-474b-b629-50a39945c44d', 0, 0, 1, 131, 'Remark', '', 'varchar(100)', 'String', 'Remark', 100, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('9a850f29-2dd2-4779-d4f6-08da3d8d5a26', 'af37f705-7ba0-4883-b1be-8a274ea4c026', 0, 0, 1, 97, 'Value', '值', 'varchar(255)', 'String', 'Value', 255, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('9b1b319a-e9dc-406d-d4c4-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 1, 0, 0, 196, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('9bc385e0-10ee-4299-d4a9-08da3d8d5a26', 'ae6d94d8-6a15-4348-b600-aa17e4b61718', 0, 0, 1, 64, 'FlowId', '', 'uniqueidentifier', 'Guid', 'FlowId', 16, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('9c4158f4-b5b5-4928-d50f-08da3d8d5a26', '2ae9e532-7d9a-474b-b629-50a39945c44d', 1, 0, 0, 124, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('9c9f9672-3fa0-4c65-d4e9-08da3d8d5a26', 'e79db53b-7162-4669-9b5e-f860501475ac', 0, 0, 1, 85, 'RoleId', '', 'uniqueidentifier', 'Guid', 'RoleId', 16, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('9de60dd7-a403-442d-d4e7-08da3d8d5a26', 'e79db53b-7162-4669-9b5e-f860501475ac', 0, 0, 1, 83, 'LastModificationTime', '', 'datetime', 'DateTime', 'LastModificationTime', 8, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('a0fdeb45-c9fe-439b-d48a-08da3d8d5a26', 'd8948c56-c5bd-4061-b272-5417375f38f0', 0, 0, 1, 39, 'FlowCode', '流程编码', 'varchar(255)', 'String', 'FlowCode', 255, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('a2660342-556e-4aef-d4b4-08da3d8d5a26', '852f53ff-0d00-4c32-aa55-a9c11993751b', 0, 0, 1, 193, 'Low_Code_Table_InfoId', '', 'uniqueidentifier', 'Guid', 'Low_Code_Table_InfoId', 16, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('a29e0236-9c06-4a70-d4b7-08da3d8d5a26', '69edd8a8-1d24-478c-a909-b82039edcec0', 0, 0, 1, 186, 'CreationTime', '', 'datetime', 'DateTime', 'CreationTime', 8, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('a61101b5-8e66-4456-d4fa-08da3d8d5a26', '6fabc67a-8b48-49a6-8ba1-c8a32c499d36', 0, 0, 1, 105, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', 6, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('a62bb184-93b0-40e3-d51b-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 0, 0, 1, 13, 'ControllerDisplayName', '', 'varchar(255)', 'String', 'ControllerDisplayName', 255, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('a6752bd9-f3d6-451f-d547-08da3d8d5a26', '6323638b-a45f-4a76-886e-69a9e9be0901', 0, 0, 1, 172, 'DeleteLock', '', 'bit', 'Boolean', 'DeleteLock', NULL, '2022-06-08 21:26:01.987339', '2022-05-24 00:00:00.000000', '删除锁');
INSERT INTO `lowcodetableinfo` VALUES ('a72c0341-82e8-48ad-d481-08da3d8d5a26', '1a8df018-79f8-4e26-b4eb-4b735aae7275', 1, 0, 0, 24, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('a8be7873-7ce4-4cb2-d498-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 0, 0, 1, 49, 'OpinIons', '步骤审批意见', 'varchar(255)', 'String', 'OpinIons', 255, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('a908815c-c0e6-4565-d512-08da3d8d5a26', '2ae9e532-7d9a-474b-b629-50a39945c44d', 0, 0, 1, 130, 'FunctionName', '', 'varchar(100)', 'String', 'FunctionName', 100, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('a932f1ce-a55a-480b-d520-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 0, 0, 1, 2, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', 6, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('a9766bbb-21bf-46da-d54f-08da3d8d5a26', '69b24f04-0ed3-45fc-91d9-0dc929175a57', 1, 0, 0, 174, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('aaa312a2-73fb-4c84-d496-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 0, 0, 1, 46, 'FlowNodeName', '审批流节点名称', 'varchar(255)', 'String', 'FlowNodeName', 255, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('aaa5fae3-8c5b-4427-d4fb-08da3d8d5a26', '6fabc67a-8b48-49a6-8ba1-c8a32c499d36', 0, 0, 1, 102, 'Name', '', 'nvarchar(255)', 'String', 'Name', 255, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('ab5c0b3d-8871-42fd-d4f1-08da3d8d5a26', 'af37f705-7ba0-4883-b1be-8a274ea4c026', 0, 1, 0, 92, 'Id', 'id', 'int', 'Int32', 'Id', 4, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('aba55ad7-7153-4658-d4f2-08da3d8d5a26', 'af37f705-7ba0-4883-b1be-8a274ea4c026', 0, 0, 1, 93, 'LastModificationTime', '更新时间', 'datetime', 'DateTime', 'LastModificationTime', 8, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('acf079d0-3db9-43f7-d490-08da3d8d5a26', 'd8948c56-c5bd-4061-b272-5417375f38f0', 0, 0, 1, 34, 'UserId', '发起人Id', 'uniqueidentifier', 'Guid', 'UserId', 16, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('ae55fabc-3944-4a36-d49f-08da3d8d5a26', '7ad3b915-f0bd-443a-89cd-42d41dd6c554', 0, 0, 1, 55, 'CreationTime', '', 'datetime', 'DateTime', 'CreationTime', 8, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('b1f89f8d-8e22-4c4a-d504-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 0, 0, 1, 120, 'KeepAlive', '', 'bit', 'Boolean', 'KeepAlive', 1, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('b24ac0e3-71ab-4d48-d541-08da3d8d5a26', '8da38d20-8a09-4e81-8dd8-ed6702aee380', 0, 0, 1, 162, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', 6, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('b52a9e8c-dffb-40b7-d506-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 0, 0, 1, 110, 'LevelCode', '', 'varchar(50)', 'String', 'LevelCode', NULL, '2022-05-24 21:58:07.000000', '2022-05-24 00:00:00.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('b6422cb6-498e-4ff5-d4e6-08da3d8d5a26', 'e79db53b-7162-4669-9b5e-f860501475ac', 0, 0, 1, 84, 'CreationTime', '', 'datetime', 'DateTime', 'CreationTime', 8, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('b754af63-f1de-4000-d4a0-08da3d8d5a26', '7ad3b915-f0bd-443a-89cd-42d41dd6c554', 0, 0, 1, 56, 'FlowApprovalStepId', '步骤Id', 'uniqueidentifier', 'Guid', 'FlowApprovalStepId', 16, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('b76500c1-91f8-4e44-d531-08da3d8d5a26', '0a8bdb18-758a-4798-9ffc-e7031dcbf262', 0, 0, 1, 145, 'Code', '', 'nvarchar(255)', 'String', 'Code', 255, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('b7fbb61f-94fc-4242-d4d3-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 0, 0, 1, 75, 'Birthday', '', 'datetime2', 'DateTime', 'Birthday', NULL, '2022-06-08 21:23:44.815115', '2022-05-24 00:00:00.000000', '生日');
INSERT INTO `lowcodetableinfo` VALUES ('b97d19d1-948a-489f-d4bb-08da3d8d5a26', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 1, 0, 0, 15, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('b9bbab1d-0a03-4d07-d488-08da3d8d5a26', 'd8948c56-c5bd-4061-b272-5417375f38f0', 1, 0, 0, 31, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('b9bfca2e-f72b-4a3f-d52f-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 0, 0, 1, 139, 'State', '', 'int', 'Int32', 'State', NULL, '2022-06-08 21:25:35.914488', '2022-05-24 00:00:00.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('ba392537-c1c5-4ecc-d517-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 1, 0, 0, 1, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('bbac9a7c-6e62-4fe6-d4ef-08da3d8d5a26', 'af37f705-7ba0-4883-b1be-8a274ea4c026', 0, 0, 1, 96, 'Code', '编码', 'varchar(255)', 'String', 'Code', 255, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('be481209-565b-4099-d53c-08da3d8d5a26', 'f3d7bbb3-c1fb-4d61-92a4-9bc101811335', 0, 0, 1, 155, 'Name', '', 'nvarchar(255)', 'String', 'Name', 255, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('be86a4ee-e843-4c2a-d4e1-08da3d8d5a26', 'c5883367-42aa-43b8-9577-4720a2253efa', 0, 0, 1, 212, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', 6, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('bf24a276-6ed0-49d4-d4d9-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 0, 0, 1, 71, 'Number', '', 'nvarchar(255)', 'String', 'Number', NULL, '2022-06-08 21:23:44.815114', '2022-05-24 00:00:00.000000', '编号');
INSERT INTO `lowcodetableinfo` VALUES ('bfec557a-1223-49ec-d4de-08da3d8d5a26', 'c5883367-42aa-43b8-9577-4720a2253efa', 1, 0, 0, 210, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('c03ba636-abb2-43f7-d4e2-08da3d8d5a26', 'c5883367-42aa-43b8-9577-4720a2253efa', 0, 0, 1, 211, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', 6, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('c2f1a286-2b35-41d6-d4af-08da3d8d5a26', '852f53ff-0d00-4c32-aa55-a9c11993751b', 1, 0, 0, 189, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('c7b2ad1d-ecb0-4497-d515-08da3d8d5a26', '2ae9e532-7d9a-474b-b629-50a39945c44d', 0, 0, 1, 127, 'Number', '', 'int', 'Int32', 'Number', 4, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('c82d5132-6cda-463e-d54e-08da3d8d5a26', '6323638b-a45f-4a76-886e-69a9e9be0901', 0, 0, 1, 170, 'Phone', '', 'nvarchar(255)', 'String', 'Phone', NULL, '2022-06-08 21:26:01.987339', '2022-05-24 00:00:00.000000', '联系电话');
INSERT INTO `lowcodetableinfo` VALUES ('ca605278-6972-48b4-d51f-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 0, 0, 1, 5, 'Ip', 'ip地址', 'varchar(255)', 'String', 'Ip', 255, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('caae5d6f-f9c7-4edb-d48d-08da3d8d5a26', 'd8948c56-c5bd-4061-b272-5417375f38f0', 0, 0, 1, 37, 'FormId', '表单Id', 'varchar(50)', 'String', 'FormId', 50, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('cb5f9ecf-9317-4b11-d553-08da3d8d5a26', '69b24f04-0ed3-45fc-91d9-0dc929175a57', 0, 0, 1, 175, 'UserId', '', 'uniqueidentifier', 'Guid', 'UserId', 16, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('cbd75568-2ece-4f90-d49b-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 0, 0, 1, 48, 'State', '步骤状态（待审批、同意、不同意、回退升级审批）', 'int', 'Int32', 'State', 4, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('ce802713-74f5-4f30-d527-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 0, 0, 1, 138, 'Email', '', 'nvarchar(255)', 'String', 'Email', NULL, '2022-06-08 21:25:35.914488', '2022-05-24 00:00:00.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('cf2e3691-ab88-4420-d529-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 0, 0, 1, 136, 'Leader', '', 'nvarchar(255)', 'String', 'Leader', NULL, '2022-06-08 21:25:35.914488', '2022-05-24 00:00:00.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('cf99d60b-2392-493c-d4ce-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 0, 0, 1, 197, 'LastModificationTime', '', 'datetime', 'DateTime', 'LastModificationTime', 8, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('d0fbf229-7204-4494-d50c-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 0, 0, 1, 121, 'State', '', 'bit', 'Boolean', 'State', 1, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('d1eb49cf-c053-4226-d4d8-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 0, 0, 1, 72, 'Name', '', 'nvarchar(255)', 'String', 'Name', NULL, '2022-06-08 21:23:44.815114', '2022-05-24 00:00:00.000000', '会员名称');
INSERT INTO `lowcodetableinfo` VALUES ('d41bd8db-1b3f-48fa-d543-08da3d8d5a26', '8da38d20-8a09-4e81-8dd8-ed6702aee380', 0, 0, 1, 160, 'MenuId', '', 'int', 'Int32', 'MenuId', 4, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('d45ac420-e348-4d6b-d4aa-08da3d8d5a26', 'ae6d94d8-6a15-4348-b600-aa17e4b61718', 0, 0, 1, 62, 'LastModificationTime', '', 'datetime', 'DateTime', 'LastModificationTime', 8, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('d48c70e6-4549-41b6-d4a2-08da3d8d5a26', '7ad3b915-f0bd-443a-89cd-42d41dd6c554', 0, 0, 1, 58, 'FlowNodeName', '审批节点名称', 'varchar(500)', 'String', 'FlowNodeName', 500, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('d6008705-0d21-42ac-d525-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 1, 1, 0, 132, 'Id', '', 'int', 'Int32', 'Id', NULL, '2022-06-08 21:25:35.914488', '2022-05-24 00:00:00.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('d7ef7a4e-f4b9-4ac4-d4bd-08da3d8d5a26', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 0, 0, 1, 21, 'DisplayName', '', 'varchar(200)', 'String', 'DisplayName', 200, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('dbe000fc-4895-42f2-d53e-08da3d8d5a26', 'f3d7bbb3-c1fb-4d61-92a4-9bc101811335', 0, 0, 1, 156, 'Remark', '', 'nvarchar(255)', 'String', 'Remark', 255, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('dd367fd5-2030-43b2-d53d-08da3d8d5a26', 'f3d7bbb3-c1fb-4d61-92a4-9bc101811335', 0, 0, 1, 154, 'Number', '', 'int', 'Int32', 'Number', 4, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('de43269d-d43b-4a77-d4d0-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 0, 0, 1, 209, 'MaxLength', '', 'int', 'Int32', 'MaxLength', 4, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('de898f57-abe7-4d2c-d4ed-08da3d8d5a26', '524e71b4-cbf7-4248-8b29-3f99b43f2eb2', 0, 0, 1, 90, 'SysDataAuthorityId', '', 'uniqueidentifier', 'Guid', 'SysDataAuthorityId', 16, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('df559c6b-6f60-467c-d4ea-08da3d8d5a26', '524e71b4-cbf7-4248-8b29-3f99b43f2eb2', 1, 0, 0, 87, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('e0e9d3c3-b713-419c-d4c7-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 0, 0, 1, 208, 'CsField', '', 'varchar(50)', 'String', 'CsField', 50, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('e1316750-62a4-46aa-d4f7-08da3d8d5a26', '6fabc67a-8b48-49a6-8ba1-c8a32c499d36', 1, 0, 0, 100, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('e346cf76-ec76-4409-d49e-08da3d8d5a26', '7ad3b915-f0bd-443a-89cd-42d41dd6c554', 1, 0, 0, 53, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('e36410b5-cb7c-4fc3-d54d-08da3d8d5a26', '6323638b-a45f-4a76-886e-69a9e9be0901', 0, 0, 1, 169, 'Password', '', 'nvarchar(255)', 'String', 'Password', NULL, '2022-06-08 21:26:01.987339', '2022-05-24 00:00:00.000000', '密码');
INSERT INTO `lowcodetableinfo` VALUES ('e4245f5f-bffa-43f0-d4d5-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 0, 0, 1, 78, 'FilePath', '', 'nvarchar(255)', 'String', 'FilePath', NULL, '2022-06-08 21:23:44.815115', '2022-05-24 00:00:00.000000', '文件地址');
INSERT INTO `lowcodetableinfo` VALUES ('e4dd55f0-9697-43ae-d513-08da3d8d5a26', '2ae9e532-7d9a-474b-b629-50a39945c44d', 0, 0, 1, 125, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', 6, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('e5418d61-916f-45fd-d549-08da3d8d5a26', '6323638b-a45f-4a76-886e-69a9e9be0901', 0, 0, 1, 165, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', NULL, '2022-06-08 21:26:01.987339', '2022-05-24 00:00:00.000000', '更新时间');
INSERT INTO `lowcodetableinfo` VALUES ('e571fd26-b1a8-4648-d4ae-08da3d8d5a26', 'ae6d94d8-6a15-4348-b600-aa17e4b61718', 0, 0, 1, 66, 'Sort', '', 'int', 'Int32', 'Sort', 4, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('e67fd0c6-a997-4956-d49c-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 0, 0, 1, 50, 'UserId', '步骤审批人Id', 'uniqueidentifier', 'Guid', 'UserId', 16, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('e74c1f4b-af12-4eaa-d507-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 0, 0, 1, 112, 'Name', '', 'nvarchar(255)', 'String', 'Name', NULL, '2022-05-24 21:58:07.000000', '2022-05-24 00:00:00.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('e75b8650-ee49-4f83-d4d2-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 1, 0, 0, 70, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', NULL, '2022-06-08 21:23:44.815113', '2022-05-24 00:00:00.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('e7facee2-5132-4003-d4b2-08da3d8d5a26', '852f53ff-0d00-4c32-aa55-a9c11993751b', 0, 0, 1, 194, 'ForeignKeyTableId', '', 'uniqueidentifier', 'Guid', 'ForeignKeyTableId', 16, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('e8e60481-fb7f-4f1d-d499-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 0, 0, 1, 44, 'Sort', '步骤顺序号', 'int', 'Int32', 'Sort', 4, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('ea63351c-c203-4d40-d52e-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 0, 0, 1, 137, 'Phone', '', 'nvarchar(255)', 'String', 'Phone', NULL, '2022-06-08 21:25:35.914488', '2022-05-24 00:00:00.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('eb846ac3-723e-4207-d4c8-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 0, 0, 1, 207, 'CsType', '', 'varchar(50)', 'String', 'CsType', 50, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('ee8ca902-4e27-40c5-d518-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 0, 0, 1, 14, 'ActionDisplayName', '', 'varchar(255)', 'String', 'ActionDisplayName', 255, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('f00cde73-2294-40d6-d48c-08da3d8d5a26', 'd8948c56-c5bd-4061-b272-5417375f38f0', 0, 0, 1, 40, 'FlowName', '流程名称', 'varchar(255)', 'String', 'FlowName', 255, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('f029b676-48ac-4ba3-d509-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 0, 0, 1, 117, 'ParentId', '', 'int', 'Int32', 'ParentId', 4, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('f03ac01c-e0cf-4f13-d4db-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 0, 0, 1, 76, 'Photo', '', 'nvarchar(255)', 'String', 'Photo', NULL, '2022-06-08 21:23:44.815115', '2022-05-24 00:00:00.000000', '头像');
INSERT INTO `lowcodetableinfo` VALUES ('f21d4c33-e65a-4dfe-d487-08da3d8d5a26', '1a8df018-79f8-4e26-b4eb-4b735aae7275', 0, 0, 1, 30, 'Remark', '备注', 'nvarchar(255)', 'String', 'Remark', 255, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('f221da94-0a1d-4ce7-d4cf-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 0, 0, 1, 199, 'Low_Code_TableId', '', 'uniqueidentifier', 'Guid', 'Low_Code_TableId', 16, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('f24f0e45-209e-46b7-d544-08da3d8d5a26', '8da38d20-8a09-4e81-8dd8-ed6702aee380', 0, 0, 1, 159, 'RoleId', '', 'uniqueidentifier', 'Guid', 'RoleId', 16, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('f5193134-b39d-4ca0-d502-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 0, 0, 1, 116, 'Icon', '', 'nvarchar(255)', 'String', 'Icon', NULL, '2022-05-24 21:58:07.000000', '2022-05-24 00:00:00.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('f5c93cc7-50a6-4e0e-d492-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 1, 0, 0, 41, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('f6d23541-2fca-40e6-d493-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 0, 0, 1, 52, 'ApprovalDate', '审批时间', 'datetime', 'DateTime', 'ApprovalDate', 8, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('f731ccd3-9a9c-4dda-d550-08da3d8d5a26', '69b24f04-0ed3-45fc-91d9-0dc929175a57', 0, 0, 1, 178, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', 6, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('f9fd0e13-4e5d-42b4-d4fc-08da3d8d5a26', '6fabc67a-8b48-49a6-8ba1-c8a32c499d36', 0, 0, 1, 101, 'Number', '', 'int', 'Int32', 'Number', 4, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('fa8b1456-88f3-4d4e-d4c0-08da3d8d5a26', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 0, 0, 1, 23, 'Remark', '', 'varchar(500)', 'String', 'Remark', 500, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('fbf2d2c1-454b-4898-d510-08da3d8d5a26', '2ae9e532-7d9a-474b-b629-50a39945c44d', 0, 0, 1, 126, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', 6, '2022-05-24 21:57:34.000000', '2022-05-24 21:57:34.000000', NULL);
INSERT INTO `lowcodetableinfo` VALUES ('fd9abf54-3c88-44b0-d484-08da3d8d5a26', '1a8df018-79f8-4e26-b4eb-4b735aae7275', 0, 0, 1, 25, 'LastModificationTime', '', 'datetime', 'DateTime', 'LastModificationTime', 8, '2022-05-24 21:57:33.000000', '2022-05-24 21:57:33.000000', NULL);

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Number` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Phone` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Sex` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Birthday` datetime(6) NOT NULL,
  `Photo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Introduce` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `FilePath` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `UserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `LastModificationTime` datetime(6) NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('96a1aa3d-a61a-42d0-954a-c71753fb2065', '123', '123', '123', '女', '2018-04-25 23:00:00.000000', NULL, '<p>123</p>', NULL, 'ac18f496-e93d-42f0-b59e-e321acc85335', '2021-04-18 22:08:06.000000', '2020-10-24 00:07:42.000000');
INSERT INTO `member` VALUES ('9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', '1', '测试会员', '18510912123', '男', '2019-07-08 11:47:24.000000', 'http://localhost:5600http://localhost:5600http://localhost:5600/upload/files/20210118/time_232747_old_name_hzy.png', '<p>999888</p>', '/upload/files/20210118/time_233310_old_name_hzy.png', 'ac18f496-e93d-42f0-b59e-e321acc85335', '2022-05-08 16:46:21.000000', '2018-04-25 23:00:00.000000');

-- ----------------------------
-- Table structure for sysdataauthority
-- ----------------------------
DROP TABLE IF EXISTS `sysdataauthority`;
CREATE TABLE `sysdataauthority`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `PermissionType` int(0) NOT NULL,
  `RoleId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `LastModificationTime` datetime(6) NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sysdataauthority
-- ----------------------------
INSERT INTO `sysdataauthority` VALUES ('0228a5b5-2202-4ba0-6e48-08da205da7b7', 5, '18fa4771-6f58-46a3-80d2-6f0f5e9972e3', '2022-04-17 18:33:04.000000', '2022-04-17 18:33:04.000000');
INSERT INTO `sysdataauthority` VALUES ('d09bf250-c5b0-41cb-237d-08da00442990', 5, '40ff1844-c099-4061-98e0-cd6e544fcfd3', '2022-03-08 10:02:22.000000', '2022-03-07 22:09:58.000000');

-- ----------------------------
-- Table structure for sysdataauthoritycustom
-- ----------------------------
DROP TABLE IF EXISTS `sysdataauthoritycustom`;
CREATE TABLE `sysdataauthoritycustom`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `SysDataAuthorityId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `SysOrganizationId` int(0) NOT NULL,
  `LastModificationTime` datetime(6) NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sysdataauthoritycustom
-- ----------------------------

-- ----------------------------
-- Table structure for sysdictionary
-- ----------------------------
DROP TABLE IF EXISTS `sysdictionary`;
CREATE TABLE `sysdictionary`  (
  `Id` int(0) NOT NULL AUTO_INCREMENT,
  `Sort` int(0) NOT NULL,
  `Code` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ParentId` int(0) NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sysdictionary
-- ----------------------------
INSERT INTO `sysdictionary` VALUES (1, 1, 'news_type', '资讯类别', NULL, NULL, '2021-07-25 22:39:34.000000', '2021-07-25 22:31:30.000000');
INSERT INTO `sysdictionary` VALUES (2, 1, 'news_type_nan', '男', '1', 1, '2021-07-25 22:40:30.000000', '2021-07-25 22:38:49.000000');
INSERT INTO `sysdictionary` VALUES (3, 2, 'news_type_nv', '女', '2', 1, '2022-04-23 22:18:52.000000', '2021-07-25 22:40:47.000000');

-- ----------------------------
-- Table structure for sysfunction
-- ----------------------------
DROP TABLE IF EXISTS `sysfunction`;
CREATE TABLE `sysfunction`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Number` int(0) NULL DEFAULT NULL,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ByName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `LastModificationTime` datetime(6) NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sysfunction
-- ----------------------------
INSERT INTO `sysfunction` VALUES ('2401f4d0-60b0-4e2e-903f-84c603373572', 70, '导出', 'Export', 'Export', '2021-04-18 22:08:06.000000', '2016-06-20 13:40:52.000000');
INSERT INTO `sysfunction` VALUES ('383e7ee2-7690-46ac-9230-65155c84aa30', 50, '保存', 'Save', 'Save', '2021-04-18 22:08:06.000000', '2016-06-20 13:40:52.000000');
INSERT INTO `sysfunction` VALUES ('9c388461-2704-4c5e-a729-72c17e9018e1', 40, '删除', 'Delete', 'Delete', '2021-04-18 22:08:06.000000', '2016-06-20 13:40:52.000000');
INSERT INTO `sysfunction` VALUES ('b6fd5425-504a-46a9-993b-2f8dc9158eb8', 80, '打印', 'Print', 'Print', '2021-04-18 22:08:06.000000', '2016-06-20 13:40:52.000000');
INSERT INTO `sysfunction` VALUES ('bffefb1c-8988-4ddf-b4ac-81c2b30e80cd', 20, '添加', 'Insert', 'Insert', '2021-04-18 22:08:06.000000', '2016-06-20 13:40:52.000000');
INSERT INTO `sysfunction` VALUES ('c9518758-b2e1-4f51-b517-5282e273889c', 10, '显示', 'Display', 'Display', '2021-04-18 22:08:06.000000', '2016-06-20 13:40:52.000000');
INSERT INTO `sysfunction` VALUES ('e7ef2a05-8317-41c3-b588-99519fe88bf9', 30, '修改', 'Update', 'Update', '2021-04-18 22:08:06.000000', '2016-06-20 13:40:52.000000');
INSERT INTO `sysfunction` VALUES ('f27ecb0a-197d-47b1-b243-59a8c71302bf', 60, '检索', 'Search', 'Search', '2021-04-18 22:08:06.000000', '2016-06-20 13:40:52.000000');

-- ----------------------------
-- Table structure for sysmenu
-- ----------------------------
DROP TABLE IF EXISTS `sysmenu`;
CREATE TABLE `sysmenu`  (
  `Id` int(0) NOT NULL AUTO_INCREMENT,
  `LevelCode` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Number` int(0) NULL DEFAULT NULL,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ComponentName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Url` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Router` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `JumpUrl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Icon` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ParentId` int(0) NULL DEFAULT NULL,
  `Show` tinyint(1) NOT NULL,
  `Close` tinyint(1) NOT NULL,
  `KeepAlive` tinyint(1) NOT NULL,
  `State` tinyint(1) NOT NULL,
  `Type` int(0) NOT NULL,
  `LastModificationTime` datetime(6) NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sysmenu
-- ----------------------------
INSERT INTO `sysmenu` VALUES (1, '1', 10, '更多示例', NULL, NULL, NULL, NULL, 'MoreOutlined', NULL, 1, 1, 1, 1, 1, '2022-03-04 12:25:39.000000', '2021-05-28 11:49:02.000000');
INSERT INTO `sysmenu` VALUES (2, '1.2', 10, 'Antd Vue3.0组件', 'AppComponentsCom', 'views/AppComponents.vue', '/app/components', NULL, 'LayoutOutlined', 1, 1, 1, 1, 1, 2, '2022-03-18 12:06:20.000000', '2021-01-16 16:05:22.000000');
INSERT INTO `sysmenu` VALUES (3, '1.3', 30, '按钮', 'ButtonCom', 'views/Button.vue', '/button', NULL, 'AppstoreOutlined', 1, 1, 1, 1, 1, 2, '2022-03-04 12:26:14.000000', '2020-12-17 14:58:05.000000');
INSERT INTO `sysmenu` VALUES (4, '1.4', 40, '图表 AntV G2', NULL, NULL, NULL, NULL, 'PieChartOutlined', 1, 1, 1, 1, 1, 1, '2022-03-04 12:26:21.000000', '2021-01-16 16:06:33.000000');
INSERT INTO `sysmenu` VALUES (5, '1.4.5', 10, '基础图表', 'ChartBaseCom', 'views/chart/Base.vue', '/chart/base', NULL, NULL, 4, 1, 1, 1, 1, 2, '2022-03-04 12:26:25.000000', '2021-01-16 16:07:24.000000');
INSERT INTO `sysmenu` VALUES (6, '1.4.6', 20, '更多图表', 'ChartMoreCom', 'views/chart/More.vue', '/chart/more', NULL, NULL, 4, 1, 1, 1, 1, 2, '2022-03-04 12:26:28.000000', '2021-01-16 16:10:06.000000');
INSERT INTO `sysmenu` VALUES (7, '1.7', 50, '表格管理', NULL, NULL, NULL, NULL, 'TableOutlined', 1, 1, 1, 1, 1, 1, '2022-03-04 12:26:34.000000', '2018-03-10 12:16:38.000000');
INSERT INTO `sysmenu` VALUES (8, '1.7.8', 100, '基础列表', 'BaseListCom', 'views/BaseList.vue', '/base/list', NULL, NULL, 7, 1, 1, 1, 1, 2, '2022-03-04 12:26:38.000000', '2020-12-17 14:49:12.000000');
INSERT INTO `sysmenu` VALUES (9, '1.7.9', 110, '标准表格', 'ListIndexCom', 'views/list/Index.vue', '/list', NULL, NULL, 7, 1, 1, 1, 1, 2, '2022-03-04 12:26:41.000000', '2020-12-17 14:51:07.000000');
INSERT INTO `sysmenu` VALUES (10, '1.10', 60, '富文本编辑器', 'EditorCom', 'views/Editor.vue', '/editor', NULL, 'PicRightOutlined', 1, 1, 1, 1, 1, 2, '2022-03-04 12:26:46.000000', '2021-01-18 19:34:28.000000');
INSERT INTO `sysmenu` VALUES (11, '1.11', 70, '跳转外部地址', 'ExternalJumpCom', 'components/ExternalJump.vue', '/external/jump/:path(.*)', 'https://antv.vision/zh', 'RadarChartOutlined', 1, 1, 1, 1, 1, 2, '2022-03-04 12:26:49.000000', '2021-08-05 21:51:12.000000');
INSERT INTO `sysmenu` VALUES (12, '12', 50, '基础信息', NULL, NULL, NULL, NULL, 'GoldOutlined', NULL, 1, 1, 1, 1, 1, '2022-03-04 12:25:43.000000', '2018-03-10 12:16:38.000000');
INSERT INTO `sysmenu` VALUES (13, '12.13', 10, '会员管理', 'base_member', 'views/base/member/Index.vue', '/base/member', NULL, 'UsergroupAddOutlined', 12, 1, 1, 1, 1, 2, '2022-03-04 12:26:55.000000', '2018-03-10 12:16:38.000000');
INSERT INTO `sysmenu` VALUES (14, '14', 100, '系统管理', NULL, NULL, NULL, NULL, 'DesktopOutlined', NULL, 1, 1, 1, 1, 1, '2022-03-04 12:25:46.000000', '2018-03-10 12:16:38.000000');
INSERT INTO `sysmenu` VALUES (15, '14.15', 100, '账户管理', 'system_user', 'views/system/user/Index.vue', '/system/user', NULL, 'UserOutlined', 14, 1, 1, 1, 1, 2, '2022-03-04 12:27:02.000000', '2018-03-10 12:16:38.000000');
INSERT INTO `sysmenu` VALUES (16, '14.16', 110, '角色管理', 'system_role', 'views/system/role/Index.vue', '/system/role', NULL, 'TeamOutlined', 14, 1, 1, 1, 1, 2, '2022-04-22 22:24:03.000000', '2018-03-10 12:16:38.000000');
INSERT INTO `sysmenu` VALUES (17, '14.17', 120, '功能管理', 'system_function', 'views/system/function/Index.vue', '/system/function', NULL, 'ControlOutlined', 14, 1, 1, 1, 1, 2, '2022-03-04 12:27:11.000000', '2018-03-10 12:16:38.000000');
INSERT INTO `sysmenu` VALUES (19, '14.19', 150, '个人中心', 'system_personal_center', 'views/system/personal_center/Index.vue', '/system/personal/center', NULL, 'FormOutlined', 14, 1, 1, 1, 1, 2, '2022-03-04 12:27:19.000000', '2018-03-10 12:16:38.000000');
INSERT INTO `sysmenu` VALUES (20, '14.20', 160, '岗位管理', 'system_post', 'views/system/post/Index.vue', '/system/post', NULL, 'IdcardOutlined', 14, 1, 1, 1, 1, 2, '2022-03-04 12:27:23.000000', '2021-05-27 17:29:49.000000');
INSERT INTO `sysmenu` VALUES (21, '14.21', 170, '组织机构', 'system_organization', 'views/system/organization/Index.vue', '/system/organization', NULL, 'ClusterOutlined', 14, 1, 1, 1, 1, 2, '2022-03-04 12:27:27.000000', '2021-05-27 20:27:56.000000');
INSERT INTO `sysmenu` VALUES (22, '29.22', 10, '接口文档', 'swagger', 'views/development_tool/Swagger.vue', '/development_tool/swagger', NULL, 'FileSearchOutlined', 29, 1, 1, 1, 1, 2, '2022-03-04 12:27:41.000000', '2018-03-10 12:17:03.000000');
INSERT INTO `sysmenu` VALUES (23, '14.23', 190, '数据字典', 'system_dictionary', 'views/system/dictionary/Index.vue', '/system/dictionary', NULL, 'FileDoneOutlined', 14, 1, 1, 1, 1, 2, '2022-03-04 12:27:31.000000', '2021-07-25 21:50:01.000000');
INSERT INTO `sysmenu` VALUES (24, '14.24', 200, '操作日志', 'sys_operation_log', 'views/system/sys_operation_log/Index.vue', '/system/sys_operation_log', '', 'ContainerOutlined', 14, 1, 1, 1, 1, 2, '2022-03-04 12:27:35.000000', '2021-08-05 21:24:54.000000');
INSERT INTO `sysmenu` VALUES (25, '14.25', 130, '菜单功能', 'system_menu', 'views/system/menu/Index.vue', '/system/menu', NULL, 'MenuOutlined', 14, 1, 1, 1, 1, 2, '2022-03-04 12:27:15.000000', '2018-03-10 12:16:38.000000');
INSERT INTO `sysmenu` VALUES (28, '1.28', 1, 'Vxe-Table', 'VxeTableCom', 'views/VxeTable.vue', '/vxe/table', NULL, 'BorderlessTableOutlined', 1, 1, 1, 1, 1, 2, '2022-03-04 12:26:00.000000', '2021-12-29 17:13:26.000000');
INSERT INTO `sysmenu` VALUES (29, '29', 200, '开发工具', NULL, NULL, NULL, NULL, 'CodepenOutlined', NULL, 1, 1, 1, 1, 1, '2022-03-04 12:25:49.000000', '2022-01-12 14:17:21.000000');
INSERT INTO `sysmenu` VALUES (30, '29.30', 20, '定时任务', 'TimedTaskCom', 'views/development_tool/timed_task/Index.vue', '/development_tool/timed_task', NULL, 'FieldTimeOutlined', 29, 1, 1, 1, 1, 2, '2022-03-04 12:27:44.000000', '2022-01-12 14:22:04.000000');
INSERT INTO `sysmenu` VALUES (31, '29.31', 30, '代码生成', 'LowCode', 'views/development_tool/low_code/Index.vue', '/development-tool/low-code', NULL, 'CodeTwoTone', 29, 1, 1, 1, 1, 2, '2022-05-24 22:05:57.000000', '2022-01-12 15:39:46.000000');
INSERT INTO `sysmenu` VALUES (32, '1.32', 20, '图标展示', 'IconsVue', 'views/Icons.vue', '/icons', NULL, 'TagsTwoTone', 1, 1, 1, 1, 1, 2, '2022-03-18 12:06:38.000000', '2022-02-24 10:51:38.000000');
INSERT INTO `sysmenu` VALUES (33, '29.33', 40, 'EFCore监控台', 'monitor_ef_core', 'views/development_tool/monitor_ef_core/Index.vue', '/development_tool/monitor/efcore', NULL, 'DashboardFilled', 29, 1, 1, 1, 1, 2, '2022-04-10 10:56:17.000000', '2022-04-10 10:55:41.000000');
INSERT INTO `sysmenu` VALUES (36, '12.13.36', 1, '详情', 'base_member_info_Details', 'views/base/member/components/Details.vue', '/base/member/details/:id/:title', NULL, NULL, 13, 0, 1, 1, 1, 2, '2022-04-17 17:49:13.000000', '2022-04-17 17:45:25.000000');

-- ----------------------------
-- Table structure for sysmenufunction
-- ----------------------------
DROP TABLE IF EXISTS `sysmenufunction`;
CREATE TABLE `sysmenufunction`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Number` int(0) NULL DEFAULT NULL,
  `MenuId` int(0) NOT NULL,
  `FunctionCode` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `FunctionName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `LastModificationTime` datetime(6) NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sysmenufunction
-- ----------------------------
INSERT INTO `sysmenufunction` VALUES ('0073cce2-ff42-496c-9ff6-08da204fcecb', 10, 36, 'Display', '显示', 'Display', '2022-04-17 20:40:12.000000', '2022-04-17 20:40:12.000000');
INSERT INTO `sysmenufunction` VALUES ('0984a2e1-3722-41d4-0f6d-08d9fdad00ab', 70, 23, 'Export', '导出', 'Export', '2022-03-04 15:25:50.000000', '2022-03-04 15:25:50.000000');
INSERT INTO `sysmenufunction` VALUES ('0a85e4fd-5a1c-47f6-0f60-08d9fdad00ab', 20, 21, 'Insert', '添加', 'Insert', '2022-03-04 15:25:40.000000', '2022-03-04 15:25:40.000000');
INSERT INTO `sysmenufunction` VALUES ('0ad6a459-1d9d-4512-0f32-08d9fdad00ab', 40, 15, 'Delete', '删除', 'Delete', '2022-03-04 15:25:14.000000', '2022-03-04 15:25:14.000000');
INSERT INTO `sysmenufunction` VALUES ('0b27e69f-af16-4481-0f44-08d9fdad00ab', 60, 17, 'Search', '检索', 'Search', '2022-03-04 15:25:21.000000', '2022-03-04 15:25:21.000000');
INSERT INTO `sysmenufunction` VALUES ('0caa6e7d-92b0-4814-0f46-08d9fdad00ab', 80, 17, 'Print', '打印', 'Print', '2022-03-04 15:25:21.000000', '2022-03-04 15:25:21.000000');
INSERT INTO `sysmenufunction` VALUES ('106fb69a-8bb5-4559-0f29-08d9fdad00ab', 30, 13, 'Update', '修改', 'Update', '2022-03-04 15:25:07.000000', '2022-03-04 15:25:07.000000');
INSERT INTO `sysmenufunction` VALUES ('13f3f74d-c6fc-4488-0f2f-08d9fdad00ab', 10, 15, 'Display', '显示', 'Display', '2022-03-04 15:25:14.000000', '2022-03-04 15:25:14.000000');
INSERT INTO `sysmenufunction` VALUES ('14783a71-e265-4d6b-0f3b-08d9fdad00ab', 50, 16, 'Save', '保存', 'Save', '2022-04-22 22:24:03.000000', '2022-04-22 22:24:03.000000');
INSERT INTO `sysmenufunction` VALUES ('1cb6fbe1-4a6c-4aad-0f22-08d9fdad00ab', 10, 6, 'Display', '显示', 'Display', '2022-03-04 15:24:34.000000', '2022-03-04 15:24:34.000000');
INSERT INTO `sysmenufunction` VALUES ('1d831d57-6634-45d7-0f6e-08d9fdad00ab', 80, 23, 'Print', '打印', 'Print', '2022-03-04 15:25:50.000000', '2022-03-04 15:25:50.000000');
INSERT INTO `sysmenufunction` VALUES ('1e69df5d-d1e9-4bc8-0f4d-08d9fdad00ab', 70, 25, 'Export', '导出', 'Export', '2022-03-04 15:25:28.000000', '2022-03-04 15:25:28.000000');
INSERT INTO `sysmenufunction` VALUES ('20ab5395-d57c-49db-0f4a-08d9fdad00ab', 40, 25, 'Delete', '删除', 'Delete', '2022-03-04 15:25:28.000000', '2022-03-04 15:25:28.000000');
INSERT INTO `sysmenufunction` VALUES ('2186550d-246c-4552-e2d8-08d9fdefa8f8', 60, 24, 'Search', '检索', 'Search', '2022-03-04 23:00:02.000000', '2022-03-04 23:00:02.000000');
INSERT INTO `sysmenufunction` VALUES ('22a675f6-efda-481d-0f59-08d9fdad00ab', 30, 20, 'Update', '修改', 'Update', '2022-03-04 15:25:36.000000', '2022-03-04 15:25:36.000000');
INSERT INTO `sysmenufunction` VALUES ('2469188c-21de-492a-0f5e-08d9fdad00ab', 80, 20, 'Print', '打印', 'Print', '2022-03-04 15:25:36.000000', '2022-03-04 15:25:36.000000');
INSERT INTO `sysmenufunction` VALUES ('2fea8f87-2a13-4c95-0f3c-08d9fdad00ab', 60, 16, 'Search', '检索', 'Search', '2022-04-22 22:24:03.000000', '2022-04-22 22:24:03.000000');
INSERT INTO `sysmenufunction` VALUES ('33c80938-82c8-4299-0f12-08d9fdad00ab', 10, 30, 'Display', '显示', 'Display', '2022-03-04 15:17:09.000000', '2022-03-04 15:17:09.000000');
INSERT INTO `sysmenufunction` VALUES ('37d3e492-62da-47a4-0f33-08d9fdad00ab', 50, 15, 'Save', '保存', 'Save', '2022-03-04 15:25:14.000000', '2022-03-04 15:25:14.000000');
INSERT INTO `sysmenufunction` VALUES ('38b4704d-7c5d-4f89-a2e7-08da3d8e6577', 60, 31, 'Search', '检索', 'Search', '2022-05-24 22:05:57.000000', '2022-05-24 22:05:57.000000');
INSERT INTO `sysmenufunction` VALUES ('3bc0e68f-d03d-4e99-0f26-08d9fdad00ab', 10, 11, 'Display', '显示', 'Display', '2022-03-04 15:24:53.000000', '2022-03-04 15:24:53.000000');
INSERT INTO `sysmenufunction` VALUES ('3cb3cbc7-9e45-4cc3-0f62-08d9fdad00ab', 40, 21, 'Delete', '删除', 'Delete', '2022-03-04 15:25:40.000000', '2022-03-04 15:25:40.000000');
INSERT INTO `sysmenufunction` VALUES ('3e44c6f5-e090-40a1-0f58-08d9fdad00ab', 20, 20, 'Insert', '添加', 'Insert', '2022-03-04 15:25:36.000000', '2022-03-04 15:25:36.000000');
INSERT INTO `sysmenufunction` VALUES ('3f6d0af7-5386-4d3a-0f71-08d9fdad00ab', 10, 28, 'Display', '显示', 'Display', '2022-03-04 15:40:52.000000', '2022-03-04 15:40:52.000000');
INSERT INTO `sysmenufunction` VALUES ('41cb1942-573a-4d63-0f4b-08d9fdad00ab', 50, 25, 'Save', '保存', 'Save', '2022-03-04 15:25:28.000000', '2022-03-04 15:25:28.000000');
INSERT INTO `sysmenufunction` VALUES ('437fbf85-8704-4e87-0f3d-08d9fdad00ab', 70, 16, 'Export', '导出', 'Export', '2022-04-22 22:24:03.000000', '2022-04-22 22:24:03.000000');
INSERT INTO `sysmenufunction` VALUES ('45e2ca86-4823-4fb9-0f57-08d9fdad00ab', 10, 20, 'Display', '显示', 'Display', '2022-03-04 15:25:36.000000', '2022-03-04 15:25:36.000000');
INSERT INTO `sysmenufunction` VALUES ('48f0a694-0539-4e69-a2e4-08da3d8e6577', 10, 31, 'Display', '显示', 'Display', '2022-05-24 22:05:57.000000', '2022-05-24 22:05:57.000000');
INSERT INTO `sysmenufunction` VALUES ('4a67fcdb-a7a9-4e3c-0f49-08d9fdad00ab', 30, 25, 'Update', '修改', 'Update', '2022-03-04 15:25:28.000000', '2022-03-04 15:25:28.000000');
INSERT INTO `sysmenufunction` VALUES ('4bbbe120-0cc6-4a08-0f4e-08d9fdad00ab', 80, 25, 'Print', '打印', 'Print', '2022-03-04 15:25:28.000000', '2022-03-04 15:25:28.000000');
INSERT INTO `sysmenufunction` VALUES ('4dbf096d-d3d3-4565-a2e5-08da3d8e6577', 40, 31, 'Delete', '删除', 'Delete', '2022-05-24 22:05:57.000000', '2022-05-24 22:05:57.000000');
INSERT INTO `sysmenufunction` VALUES ('523b53b5-8159-4a16-0f2b-08d9fdad00ab', 50, 13, 'Save', '保存', 'Save', '2022-03-04 15:25:07.000000', '2022-03-04 15:25:07.000000');
INSERT INTO `sysmenufunction` VALUES ('53fdb4a0-ca6e-4568-0f3f-08d9fdad00ab', 10, 17, 'Display', '显示', 'Display', '2022-03-04 15:25:21.000000', '2022-03-04 15:25:21.000000');
INSERT INTO `sysmenufunction` VALUES ('541d9045-47b2-4629-0f2e-08d9fdad00ab', 80, 13, 'Print', '打印', 'Print', '2022-03-04 15:25:07.000000', '2022-03-04 15:25:07.000000');
INSERT INTO `sysmenufunction` VALUES ('54743c86-ac73-4345-0f5d-08d9fdad00ab', 70, 20, 'Export', '导出', 'Export', '2022-03-04 15:25:36.000000', '2022-03-04 15:25:36.000000');
INSERT INTO `sysmenufunction` VALUES ('550f874b-e804-44a0-0f37-08d9fdad00ab', 10, 16, 'Display', '显示', 'Display', '2022-04-22 22:24:03.000000', '2022-04-22 22:24:03.000000');
INSERT INTO `sysmenufunction` VALUES ('55750f56-edc9-4771-e2d6-08d9fdefa8f8', 10, 24, 'Display', '显示', 'Display', '2022-03-04 23:00:02.000000', '2022-03-04 23:00:02.000000');
INSERT INTO `sysmenufunction` VALUES ('5e4e87bd-c179-4b5b-0f5c-08d9fdad00ab', 60, 20, 'Search', '检索', 'Search', '2022-03-04 15:25:36.000000', '2022-03-04 15:25:36.000000');
INSERT INTO `sysmenufunction` VALUES ('616c4e4a-fb61-49cf-0f5b-08d9fdad00ab', 50, 20, 'Save', '保存', 'Save', '2022-03-04 15:25:36.000000', '2022-03-04 15:25:36.000000');
INSERT INTO `sysmenufunction` VALUES ('687254ae-0d76-4788-a4e8-08da1a9d9949', 10, 33, 'Display', '显示', 'Display', '2022-04-10 10:56:17.000000', '2022-04-10 10:56:17.000000');
INSERT INTO `sysmenufunction` VALUES ('69da651e-787b-42e5-0f5a-08d9fdad00ab', 40, 20, 'Delete', '删除', 'Delete', '2022-03-04 15:25:36.000000', '2022-03-04 15:25:36.000000');
INSERT INTO `sysmenufunction` VALUES ('6b009415-eadf-4dab-0f3e-08d9fdad00ab', 80, 16, 'Print', '打印', 'Print', '2022-04-22 22:24:03.000000', '2022-04-22 22:24:03.000000');
INSERT INTO `sysmenufunction` VALUES ('6b209d5a-b366-4a61-0f63-08d9fdad00ab', 50, 21, 'Save', '保存', 'Save', '2022-03-04 15:25:40.000000', '2022-03-04 15:25:40.000000');
INSERT INTO `sysmenufunction` VALUES ('6c09c0c0-72fa-4842-0f1f-08d9fdad00ab', 10, 32, 'Display', '显示', 'Display', '2022-03-18 12:06:38.000000', '2022-03-18 12:06:38.000000');
INSERT INTO `sysmenufunction` VALUES ('7694fbf5-e28d-424c-e2d7-08d9fdefa8f8', 40, 24, 'Delete', '删除', 'Delete', '2022-03-04 23:00:02.000000', '2022-03-04 23:00:02.000000');
INSERT INTO `sysmenufunction` VALUES ('7e0f6c84-d7f1-4243-0f4c-08d9fdad00ab', 60, 25, 'Search', '检索', 'Search', '2022-03-04 15:25:28.000000', '2022-03-04 15:25:28.000000');
INSERT INTO `sysmenufunction` VALUES ('7ea8f706-bfe5-42b2-0f42-08d9fdad00ab', 40, 17, 'Delete', '删除', 'Delete', '2022-03-04 15:25:21.000000', '2022-03-04 15:25:21.000000');
INSERT INTO `sysmenufunction` VALUES ('823ac05d-65e4-4216-0f39-08d9fdad00ab', 30, 16, 'Update', '修改', 'Update', '2022-04-22 22:24:03.000000', '2022-04-22 22:24:03.000000');
INSERT INTO `sysmenufunction` VALUES ('8564e4d8-d7f4-4f12-0f31-08d9fdad00ab', 30, 15, 'Update', '修改', 'Update', '2022-03-04 15:25:14.000000', '2022-03-04 15:25:14.000000');
INSERT INTO `sysmenufunction` VALUES ('86465238-c51c-45d5-0f40-08d9fdad00ab', 20, 17, 'Insert', '添加', 'Insert', '2022-03-04 15:25:21.000000', '2022-03-04 15:25:21.000000');
INSERT INTO `sysmenufunction` VALUES ('86ff83fd-d34a-4290-0f41-08d9fdad00ab', 30, 17, 'Update', '修改', 'Update', '2022-03-04 15:25:21.000000', '2022-03-04 15:25:21.000000');
INSERT INTO `sysmenufunction` VALUES ('92b39a10-3927-4ee7-0f6a-08d9fdad00ab', 40, 23, 'Delete', '删除', 'Delete', '2022-03-04 15:25:50.000000', '2022-03-04 15:25:50.000000');
INSERT INTO `sysmenufunction` VALUES ('9426768e-b90d-41e1-0f67-08d9fdad00ab', 10, 23, 'Display', '显示', 'Display', '2022-03-04 15:25:50.000000', '2022-03-04 15:25:50.000000');
INSERT INTO `sysmenufunction` VALUES ('a03d56d7-4b0d-47cc-0f6b-08d9fdad00ab', 50, 23, 'Save', '保存', 'Save', '2022-03-04 15:25:50.000000', '2022-03-04 15:25:50.000000');
INSERT INTO `sysmenufunction` VALUES ('a1ddd02f-8c21-4d79-0f21-08d9fdad00ab', 10, 5, 'Display', '显示', 'Display', '2022-03-04 15:24:30.000000', '2022-03-04 15:24:30.000000');
INSERT INTO `sysmenufunction` VALUES ('a3754771-f6e9-4a23-0f2c-08d9fdad00ab', 60, 13, 'Search', '检索', 'Search', '2022-03-04 15:25:07.000000', '2022-03-04 15:25:07.000000');
INSERT INTO `sysmenufunction` VALUES ('a46e07d3-c722-4548-0f35-08d9fdad00ab', 70, 15, 'Export', '导出', 'Export', '2022-03-04 15:25:14.000000', '2022-03-04 15:25:14.000000');
INSERT INTO `sysmenufunction` VALUES ('a726455f-1c29-4be0-0f45-08d9fdad00ab', 70, 17, 'Export', '导出', 'Export', '2022-03-04 15:25:21.000000', '2022-03-04 15:25:21.000000');
INSERT INTO `sysmenufunction` VALUES ('a7cd04db-bbe3-49b6-0f1e-08d9fdad00ab', 10, 2, 'Display', '显示', 'Display', '2022-03-18 12:06:20.000000', '2022-03-18 12:06:20.000000');
INSERT INTO `sysmenufunction` VALUES ('a9503588-e6f7-420b-0f65-08d9fdad00ab', 70, 21, 'Export', '导出', 'Export', '2022-03-04 15:25:40.000000', '2022-03-04 15:25:40.000000');
INSERT INTO `sysmenufunction` VALUES ('b5881044-afb8-40b2-0f28-08d9fdad00ab', 20, 13, 'Insert', '添加', 'Insert', '2022-03-04 15:25:07.000000', '2022-03-04 15:25:07.000000');
INSERT INTO `sysmenufunction` VALUES ('b7533a90-dae4-4263-0f24-08d9fdad00ab', 10, 9, 'Display', '显示', 'Display', '2022-03-04 15:24:43.000000', '2022-03-04 15:24:43.000000');
INSERT INTO `sysmenufunction` VALUES ('b96f977c-a36e-4e7f-0f2d-08d9fdad00ab', 70, 13, 'Export', '导出', 'Export', '2022-03-04 15:25:07.000000', '2022-03-04 15:25:07.000000');
INSERT INTO `sysmenufunction` VALUES ('b98a365e-6fb4-4efb-0f69-08d9fdad00ab', 30, 23, 'Update', '修改', 'Update', '2022-03-04 15:25:50.000000', '2022-03-04 15:25:50.000000');
INSERT INTO `sysmenufunction` VALUES ('bd6ae6da-1ca6-46c2-0f3a-08d9fdad00ab', 40, 16, 'Delete', '删除', 'Delete', '2022-04-22 22:24:03.000000', '2022-04-22 22:24:03.000000');
INSERT INTO `sysmenufunction` VALUES ('beb87004-5cfb-417a-0f34-08d9fdad00ab', 60, 15, 'Search', '检索', 'Search', '2022-03-04 15:25:14.000000', '2022-03-04 15:25:14.000000');
INSERT INTO `sysmenufunction` VALUES ('c67a0abe-daec-491b-0f38-08d9fdad00ab', 20, 16, 'Insert', '添加', 'Insert', '2022-04-22 22:24:03.000000', '2022-04-22 22:24:03.000000');
INSERT INTO `sysmenufunction` VALUES ('c6ba141b-99ba-4114-0f5f-08d9fdad00ab', 10, 21, 'Display', '显示', 'Display', '2022-03-04 15:25:40.000000', '2022-03-04 15:25:40.000000');
INSERT INTO `sysmenufunction` VALUES ('c77c812a-1601-4311-0f70-08d9fdad00ab', 10, 19, 'Display', '显示', 'Display', '2022-03-04 15:26:00.000000', '2022-03-04 15:26:00.000000');
INSERT INTO `sysmenufunction` VALUES ('c8edbb79-567e-461b-0f36-08d9fdad00ab', 80, 15, 'Print', '打印', 'Print', '2022-03-04 15:25:14.000000', '2022-03-04 15:25:14.000000');
INSERT INTO `sysmenufunction` VALUES ('c9e5fff0-6744-47d7-0f66-08d9fdad00ab', 80, 21, 'Print', '打印', 'Print', '2022-03-04 15:25:40.000000', '2022-03-04 15:25:40.000000');
INSERT INTO `sysmenufunction` VALUES ('cce82eb4-7fc5-4308-0f30-08d9fdad00ab', 20, 15, 'Insert', '添加', 'Insert', '2022-03-04 15:25:14.000000', '2022-03-04 15:25:14.000000');
INSERT INTO `sysmenufunction` VALUES ('d2e6ea60-2cf6-478a-0f23-08d9fdad00ab', 10, 8, 'Display', '显示', 'Display', '2022-03-04 15:24:40.000000', '2022-03-04 15:24:40.000000');
INSERT INTO `sysmenufunction` VALUES ('db3ab8bd-7709-41a2-0f47-08d9fdad00ab', 10, 25, 'Display', '显示', 'Display', '2022-03-04 15:25:28.000000', '2022-03-04 15:25:28.000000');
INSERT INTO `sysmenufunction` VALUES ('dee401b1-e20e-496e-0f43-08d9fdad00ab', 50, 17, 'Save', '保存', 'Save', '2022-03-04 15:25:21.000000', '2022-03-04 15:25:21.000000');
INSERT INTO `sysmenufunction` VALUES ('e2319118-42cc-41a2-0f6c-08d9fdad00ab', 60, 23, 'Search', '检索', 'Search', '2022-03-04 15:25:50.000000', '2022-03-04 15:25:50.000000');
INSERT INTO `sysmenufunction` VALUES ('e991934a-0d30-416b-0f68-08d9fdad00ab', 20, 23, 'Insert', '添加', 'Insert', '2022-03-04 15:25:50.000000', '2022-03-04 15:25:50.000000');
INSERT INTO `sysmenufunction` VALUES ('eb958545-6449-40db-0f27-08d9fdad00ab', 10, 13, 'Display', '显示', 'Display', '2022-03-04 15:25:07.000000', '2022-03-04 15:25:07.000000');
INSERT INTO `sysmenufunction` VALUES ('ec535908-8671-4928-0f25-08d9fdad00ab', 10, 10, 'Display', '显示', 'Display', '2022-03-04 15:24:47.000000', '2022-03-04 15:24:47.000000');
INSERT INTO `sysmenufunction` VALUES ('ef70b789-21ee-4850-0f1b-08d9fdad00ab', 10, 22, 'Display', '显示', 'Display', '2022-03-04 15:16:44.000000', '2022-03-04 15:16:44.000000');
INSERT INTO `sysmenufunction` VALUES ('f36b9b06-2826-425f-0f64-08d9fdad00ab', 60, 21, 'Search', '检索', 'Search', '2022-03-04 15:25:40.000000', '2022-03-04 15:25:40.000000');
INSERT INTO `sysmenufunction` VALUES ('f4621fbe-6b40-4454-0f2a-08d9fdad00ab', 40, 13, 'Delete', '删除', 'Delete', '2022-03-04 15:25:07.000000', '2022-03-04 15:25:07.000000');
INSERT INTO `sysmenufunction` VALUES ('f4c73ac0-c66d-4988-0f61-08d9fdad00ab', 30, 21, 'Update', '修改', 'Update', '2022-03-04 15:25:40.000000', '2022-03-04 15:25:40.000000');
INSERT INTO `sysmenufunction` VALUES ('f64cfe50-1ef1-457f-0f20-08d9fdad00ab', 10, 3, 'Display', '显示', 'Display', '2022-03-04 15:24:24.000000', '2022-03-04 15:24:24.000000');
INSERT INTO `sysmenufunction` VALUES ('fe6465bf-e429-45bd-0f48-08d9fdad00ab', 20, 25, 'Insert', '添加', 'Insert', '2022-03-04 15:25:28.000000', '2022-03-04 15:25:28.000000');

-- ----------------------------
-- Table structure for sysoperationlog
-- ----------------------------
DROP TABLE IF EXISTS `sysoperationlog`;
CREATE TABLE `sysoperationlog`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Api` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Ip` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Form` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `FormBody` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `QueryString` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `TakeUpTime` bigint(0) NOT NULL,
  `Browser` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `OS` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `UserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `ControllerDisplayName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ActionDisplayName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `LastModificationTime` datetime(6) NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sysoperationlog
-- ----------------------------
INSERT INTO `sysoperationlog` VALUES ('08da4951-ee27-4469-8f60-f84ddf0ba9e1', '/', '127.0.0.1', '', '', '', 35, 'Chrome102', 'Windows10', NULL, NULL, NULL, '2022-06-08 21:22:26.403058', '2022-06-08 21:22:26.403056');
INSERT INTO `sysoperationlog` VALUES ('08da4951-eeb2-468f-873d-bad87f96d0b8', '/api/admin/SysUser/info', '0.0.0.1', '', '', '', 255, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', '系统账号', '获取用户信息', '2022-06-08 21:22:27.228650', '2022-06-08 21:22:27.228648');
INSERT INTO `sysoperationlog` VALUES ('08da4951-eed1-43d8-8d57-923ec67fff8b', '/api/admin/QuartzTasks/findList/', '0.0.0.1', '', '', '', 430, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', NULL, '查看列表', '2022-06-08 21:22:27.421872', '2022-06-08 21:22:27.421870');
INSERT INTO `sysoperationlog` VALUES ('08da4951-f0b8-489d-829b-c13cb93a1ded', '/api/admin/LowCodeTable/findList/10/1', '0.0.0.1', '', '{\"tableName\":null,\"entityName\":null,\"displayName\":null}', '', 170, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 'LowCodeTableController', NULL, '2022-06-08 21:22:30.615269', '2022-06-08 21:22:30.615268');
INSERT INTO `sysoperationlog` VALUES ('08da4951-f24a-466e-838e-2f260efb1acb', '/api/admin/LowCodeTable/findList/10/2', '0.0.0.1', '', '{\"tableName\":null,\"entityName\":null,\"displayName\":null}', '', 72, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 'LowCodeTableController', NULL, '2022-06-08 21:22:33.248856', '2022-06-08 21:22:33.248855');
INSERT INTO `sysoperationlog` VALUES ('08da4951-f3c3-48d0-838c-b54a2249ebb4', '/api/admin/LowCodeTableInfo/findList/20/1', '0.0.0.1', '', '{\"columnName\":null,\"describe\":null,\"low_Code_TableId\":\"73c97832-4e7f-4758-86d2-94327971b5fd\"}', '', 31, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 'LowCodeSearchController', NULL, '2022-06-08 21:22:35.720521', '2022-06-08 21:22:35.720520');
INSERT INTO `sysoperationlog` VALUES ('08da4952-1cfe-494c-864a-839568629a45', '/api/admin/LowCodeTableInfo/change', '0.0.0.1', '', '[{\"id\":\"e75b8650-ee49-4f83-d4d2-08da3d8d5a26\",\"isPrimary\":true,\"isIdentity\":false,\"isNullable\":false,\"position\":70,\"columnName\":\"Id\",\"describe\":\"\",\"databaseColumnType\":\"uniqueidentifier\",\"csType\":\"Guid\",\"csField\":\"Id\",\"displayName\":null,\"low_Code_TableId\":\"73c97832-4e7f-4758-86d2-94327971b5fd\",\"lastModificationTime\":\"2022-05-24\",\"creationTime\":\"2022-05-24\",\"_X_ROW_KEY\":\"row_67\"},{\"id\":\"bf24a276-6ed0-49d4-d4d9-08da3d8d5a26\",\"isPrimary\":false,\"isIdentity\":false,\"isNullable\":true,\"position\":71,\"columnName\":\"Number\",\"describe\":\"\",\"databaseColumnType\":\"nvarchar(255)\",\"csType\":\"String\",\"csField\":\"Number\",\"displayName\":\"编号\",\"low_Code_TableId\":\"73c97832-4e7f-4758-86d2-94327971b5fd\",\"lastModificationTime\":\"2022-05-24\",\"creationTime\":\"2022-05-24\",\"_X_ROW_KEY\":\"row_68\"},{\"id\":\"d1eb49cf-c053-4226-d4d8-08da3d8d5a26\",\"isPrimary\":false,\"isIdentity\":false,\"isNullable\":true,\"position\":72,\"columnName\":\"Name\",\"describe\":\"\",\"databaseColumnType\":\"nvarchar(255)\",\"csType\":\"String\",\"csField\":\"Name\",\"displayName\":\"会员名称\",\"low_Code_TableId\":\"73c97832-4e7f-4758-86d2-94327971b5fd\",\"lastModificationTime\":\"2022-05-24\",\"creationTime\":\"2022-05-24\",\"_X_ROW_KEY\":\"row_69\"},{\"id\":\"669b87ce-c694-4c8c-d4da-08da3d8d5a26\",\"isPrimary\":false,\"isIdentity\":false,\"isNullable\":true,\"position\":73,\"columnName\":\"Phone\",\"describe\":\"\",\"databaseColumnType\":\"nvarchar(255)\",\"csType\":\"String\",\"csField\":\"Phone\",\"displayName\":\"联系电话\",\"low_Code_TableId\":\"73c97832-4e7f-4758-86d2-94327971b5fd\",\"lastModificationTime\":\"2022-05-24\",\"creationTime\":\"2022-05-24\",\"_X_ROW_KEY\":\"row_70\"},{\"id\":\"72ac247c-d792-4fee-d4dc-08da3d8d5a26\",\"isPrimary\":false,\"isIdentity\":false,\"isNullable\":true,\"position\":74,\"columnName\":\"Sex\",\"describe\":\"\",\"databaseColumnType\":\"nvarchar(255)\",\"csType\":\"String\",\"csField\":\"Sex\",\"displayName\":\"性别\",\"low_Code_TableId\":\"73c97832-4e7f-4758-86d2-94327971b5fd\",\"lastModificationTime\":\"2022-05-24\",\"creationTime\":\"2022-05-24\",\"_X_ROW_KEY\":\"row_71\"},{\"id\":\"b7fbb61f-94fc-4242-d4d3-08da3d8d5a26\",\"isPrimary\":false,\"isIdentity\":false,\"isNullable\":true,\"position\":75,\"columnName\":\"Birthday\",\"describe\":\"\",\"databaseColumnType\":\"datetime2\",\"csType\":\"DateTime\",\"csField\":\"Birthday\",\"displayName\":\"生日\",\"low_Code_TableId\":\"73c97832-4e7f-4758-86d2-94327971b5fd\",\"lastModificationTime\":\"2022-05-24\",\"creationTime\":\"2022-05-24\",\"_X_ROW_KEY\":\"row_72\"},{\"id\":\"f03ac01c-e0cf-4f13-d4db-08da3d8d5a26\",\"isPrimary\":false,\"isIdentity\":false,\"isNullable\":true,\"position\":76,\"columnName\":\"Photo\",\"describe\":\"\",\"databaseColumnType\":\"nvarchar(255)\",\"csType\":\"String\",\"csField\":\"Photo\",\"displayName\":\"头像\",\"low_Code_TableId\":\"73c97832-4e7f-4758-86d2-94327971b5fd\",\"lastModificationTime\":\"2022-05-24\",\"creationTime\":\"2022-05-24\",\"_X_ROW_KEY\":\"row_73\"},{\"id\":\"8326ca11-09f1-4c38-d4d6-08da3d8d5a26\",\"isPrimary\":false,\"isIdentity\":false,\"isNullable\":true,\"position\":77,\"columnName\":\"Introduce\",\"describe\":\"\",\"databaseColumnType\":\"nvarchar(255)\",\"csType\":\"String\",\"csField\":\"Introduce\",\"displayName\":\"简介\",\"low_Code_TableId\":\"73c97832-4e7f-4758-86d2-94327971b5fd\",\"lastModificationTime\":\"2022-05-24\",\"creationTime\":\"2022-05-24\",\"_X_ROW_KEY\":\"row_74\"},{\"id\":\"e4245f5f-bffa-43f0-d4d5-08da3d8d5a26\",\"isPrimary\":false,\"isIdentity\":false,\"isNullable\":true,\"position\":78,\"columnName\":\"FilePath\",\"describe\":\"\",\"databaseColumnType\":\"nvarchar(255)\",\"csType\":\"String\",\"csField\":\"FilePath\",\"displayName\":\"文件地址\",\"low_Code_TableId\":\"73c97832-4e7f-4758-86d2-94327971b5fd\",\"lastModificationTime\":\"2022-05-24\",\"creationTime\":\"2022-05-24\",\"_X_ROW_KEY\":\"row_75\"},{\"id\":\"837b058b-a88e-4107-d4dd-08da3d8d5a26\",\"isPrimary\":false,\"isIdentity\":false,\"isNullable\":true,\"position\":79,\"columnName\":\"UserId\",\"describe\":\"\",\"databaseColumnType\":\"uniqueidentifier\",\"csType\":\"Guid\",\"csField\":\"UserId\",\"displayName\":\"所属用户\",\"low_Code_TableId\":\"73c97832-4e7f-4758-86d2-94327971b5fd\",\"lastModificationTime\":\"2022-05-24\",\"creationTime\":\"2022-05-24\",\"_X_ROW_KEY\":\"row_76\"},{\"id\":\"5541e535-7cbe-43d2-d4d4-08da3d8d5a26\",\"isPrimary\":false,\"isIdentity\":false,\"isNullable\":true,\"position\":80,\"columnName\":\"CreationTime\",\"describe\":\"\",\"databaseColumnType\":\"datetime2\",\"csType\":\"DateTime\",\"csField\":\"CreationTime\",\"displayName\":\"创建时间\",\"low_Code_TableId\":\"73c97832-4e7f-4758-86d2-94327971b5fd\",\"lastModificationTime\":\"2022-05-24\",\"creationTime\":\"2022-05-24\",\"_X_ROW_KEY\":\"row_77\"},{\"id\":\"897a208c-2e13-46f1-d4d7-08da3d8d5a26\",\"isPrimary\":false,\"isIdentity\":false,\"isNullable\":true,\"position\":81,\"columnName\":\"LastModificationTime\",\"describe\":\"\",\"databaseColumnType\":\"datetime2\",\"csType\":\"DateTime\",\"csField\":\"LastModificationTime\",\"displayName\":\"更新时间\",\"low_Code_TableId\":\"73c97832-4e7f-4758-86d2-94327971b5fd\",\"lastModificationTime\":\"2022-05-24\",\"creationTime\":\"2022-05-24\",\"_X_ROW_KEY\":\"row_78\"}]', '', 53, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 'LowCodeSearchController', NULL, '2022-06-08 21:23:44.893991', '2022-06-08 21:23:44.893990');
INSERT INTO `sysoperationlog` VALUES ('08da4952-1d0e-4f83-8567-1060555f42f1', '/api/admin/LowCodeTableInfo/findList/20/1', '0.0.0.1', '', '{\"columnName\":null,\"describe\":null,\"low_Code_TableId\":\"73c97832-4e7f-4758-86d2-94327971b5fd\"}', '', 63, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 'LowCodeSearchController', NULL, '2022-06-08 21:23:45.001341', '2022-06-08 21:23:45.001341');
INSERT INTO `sysoperationlog` VALUES ('08da4952-1e06-4cb1-8330-585569d57f96', '/api/admin/CodeGeneration/getCode', '0.0.0.1', '', '{\"tableName\":\"Member\",\"type\":\"HZY.Models\",\"codeText\":\"\"}', '', 124, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', NULL, '获取代码', '2022-06-08 21:23:46.625513', '2022-06-08 21:23:46.625513');
INSERT INTO `sysoperationlog` VALUES ('08da4952-209b-4308-8826-21f39162dd23', '/api/admin/Member/findList/10/1', '0.0.0.1', '', '{\"name\":\"\"}', '', 66, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', '会员', '查看列表', '2022-06-08 21:23:50.953495', '2022-06-08 21:23:50.953494');
INSERT INTO `sysoperationlog` VALUES ('08da4952-20a2-4549-812c-4aa6c54e011b', '/client/NaN', '0.0.0.1', '', '', '', 0, 'Chrome102', 'Windows10', NULL, NULL, NULL, '2022-06-08 21:23:51.000255', '2022-06-08 21:23:51.000254');
INSERT INTO `sysoperationlog` VALUES ('08da4952-230d-4b35-87aa-8690580bbf8a', '/client/NaN', '0.0.0.1', '', '', '', 0, 'Chrome102', 'Windows10', NULL, NULL, NULL, '2022-06-08 21:23:55.059441', '2022-06-08 21:23:55.059440');
INSERT INTO `sysoperationlog` VALUES ('08da4952-233c-4cb6-8f7a-45099bf5e65a', '/client/NaN', '0.0.0.1', '', '', '', 0, 'Chrome102', 'Windows10', NULL, NULL, NULL, '2022-06-08 21:23:55.368050', '2022-06-08 21:23:55.368049');
INSERT INTO `sysoperationlog` VALUES ('08da4952-2378-40a3-8a4a-77b78972a7ce', '/client/NaN', '0.0.0.1', '', '', '', 0, 'Chrome102', 'Windows10', NULL, NULL, NULL, '2022-06-08 21:23:55.756263', '2022-06-08 21:23:55.756262');
INSERT INTO `sysoperationlog` VALUES ('08da4952-23a7-435d-85e7-7ba57ab2f0e0', '/client/NaN', '0.0.0.1', '', '', '', 0, 'Chrome102', 'Windows10', NULL, NULL, NULL, '2022-06-08 21:23:56.065454', '2022-06-08 21:23:56.065453');
INSERT INTO `sysoperationlog` VALUES ('08da4952-23ee-46f5-8825-8f80633c00d3', '/client/NaN', '0.0.0.1', '', '', '', 0, 'Chrome102', 'Windows10', NULL, NULL, NULL, '2022-06-08 21:23:56.532259', '2022-06-08 21:23:56.532258');
INSERT INTO `sysoperationlog` VALUES ('08da4952-241b-4618-8faf-3976137b088f', '/client/NaN', '0.0.0.1', '', '', '', 0, 'Chrome102', 'Windows10', NULL, NULL, NULL, '2022-06-08 21:23:56.826747', '2022-06-08 21:23:56.826747');
INSERT INTO `sysoperationlog` VALUES ('08da4952-2452-4959-8d44-551821a3ed18', '/client/NaN', '0.0.0.1', '', '', '', 0, 'Chrome102', 'Windows10', NULL, NULL, NULL, '2022-06-08 21:23:57.188540', '2022-06-08 21:23:57.188539');
INSERT INTO `sysoperationlog` VALUES ('08da4952-24be-4520-8e3c-8ccddd3c76b1', '/client/NaN', '0.0.0.1', '', '', '', 0, 'Chrome102', 'Windows10', NULL, NULL, NULL, '2022-06-08 21:23:57.894649', '2022-06-08 21:23:57.894649');
INSERT INTO `sysoperationlog` VALUES ('08da4952-250f-4818-842e-6a97b14f851b', '/client/NaN', '0.0.0.1', '', '', '', 0, 'Chrome102', 'Windows10', NULL, NULL, NULL, '2022-06-08 21:23:58.426756', '2022-06-08 21:23:58.426755');
INSERT INTO `sysoperationlog` VALUES ('08da4952-253c-4fd2-83ea-2d0e8708cf75', '/client/NaN', '0.0.0.1', '', '', '', 0, 'Chrome102', 'Windows10', NULL, NULL, NULL, '2022-06-08 21:23:58.724792', '2022-06-08 21:23:58.724792');
INSERT INTO `sysoperationlog` VALUES ('08da4952-2576-435b-82b6-e1f88d6097ee', '/client/NaN', '0.0.0.1', '', '', '', 0, 'Chrome102', 'Windows10', NULL, NULL, NULL, '2022-06-08 21:23:59.099769', '2022-06-08 21:23:59.099768');
INSERT INTO `sysoperationlog` VALUES ('08da4952-2724-41fb-80ac-e3674687eed4', '/client/NaN', '127.0.0.1', '', '', '', 0, 'Chrome102', 'Windows10', NULL, NULL, NULL, '2022-06-08 21:24:01.917707', '2022-06-08 21:24:01.917706');
INSERT INTO `sysoperationlog` VALUES ('08da4952-272d-4bdd-8133-a2a392fc497f', '/api/admin/SysOrganization/sysOrganizationTree', '0.0.0.1', '', '{}', '', 68, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', '组织机构', '查看组织架构树', '2022-06-08 21:24:01.980232', '2022-06-08 21:24:01.980231');
INSERT INTO `sysoperationlog` VALUES ('08da4952-2747-4784-8278-135130c5bf07', '/api/admin/SysUser/findList/10/1', '0.0.0.1', '', '{\"name\":null,\"loginName\":null,\"organizationId\":null}', '', 86, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', '系统账号', '查看数据', '2022-06-08 21:24:02.148882', '2022-06-08 21:24:02.148881');
INSERT INTO `sysoperationlog` VALUES ('08da4952-2e3d-40f1-8f1e-e63f2a100958', '/api/admin/SysRole/findList/10/1', '0.0.0.1', '', '{\"name\":null}', '', 53, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', '角色', '查看表格', '2022-06-08 21:24:13.824700', '2022-06-08 21:24:13.824699');
INSERT INTO `sysoperationlog` VALUES ('08da4952-2ef7-45c3-833c-45125730d1f6', '/api/admin/SysFunction/findList/10/1', '0.0.0.1', '', '{\"name\":null}', '', 38, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', '功能', '查看数据列表', '2022-06-08 21:24:15.045646', '2022-06-08 21:24:15.045645');
INSERT INTO `sysoperationlog` VALUES ('08da4952-2fac-45dd-8173-a63ec389aad4', '/api/admin/SysMenu/getAll', '0.0.0.1', '', '{\"name\":null}', '', 40, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', '菜单', '获取所有的菜单', '2022-06-08 21:24:16.231951', '2022-06-08 21:24:16.231949');
INSERT INTO `sysoperationlog` VALUES ('08da4952-30b5-4be9-8587-f887387d1724', '/api/admin/SysPost/findList/10/1', '0.0.0.1', '', '{\"name\":null}', '', 24, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', '岗位', '查看列表', '2022-06-08 21:24:17.971068', '2022-06-08 21:24:17.971067');
INSERT INTO `sysoperationlog` VALUES ('08da4952-33ce-49c3-8264-59acebe41061', '/api/admin/LowCodeTable/findList/10/1', '0.0.0.1', '', '{\"tableName\":null,\"entityName\":null,\"displayName\":null}', '', 65, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 'LowCodeTableController', NULL, '2022-06-08 21:24:23.167177', '2022-06-08 21:24:23.167176');
INSERT INTO `sysoperationlog` VALUES ('08da4952-34e9-47b0-8dc6-2d7084742570', '/api/admin/LowCodeTableInfo/findList/20/1', '0.0.0.1', '', '{\"columnName\":null,\"describe\":null,\"low_Code_TableId\":\"6323638b-a45f-4a76-886e-69a9e9be0901\"}', '', 11, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 'LowCodeSearchController', NULL, '2022-06-08 21:24:25.021052', '2022-06-08 21:24:25.021050');
INSERT INTO `sysoperationlog` VALUES ('08da4952-34fc-431b-83e2-4d8a70275dea', '/api/admin/CodeGeneration/getCode', '0.0.0.1', '', '{\"tableName\":\"SysUser\",\"type\":\"HZY.Models\",\"codeText\":\"\"}', '', 142, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', NULL, '获取代码', '2022-06-08 21:24:25.143655', '2022-06-08 21:24:25.143640');
INSERT INTO `sysoperationlog` VALUES ('08da4952-4432-4899-8639-6b878eb02084', '/api/admin/LowCodeTableInfo/change', '0.0.0.1', '', '[{\"id\":\"5bcf7406-75cc-4171-d545-08da3d8d5a26\",\"isPrimary\":true,\"isIdentity\":false,\"isNullable\":false,\"position\":164,\"columnName\":\"Id\",\"describe\":\"\",\"databaseColumnType\":\"uniqueidentifier\",\"csType\":\"Guid\",\"csField\":\"Id\",\"displayName\":null,\"low_Code_TableId\":\"6323638b-a45f-4a76-886e-69a9e9be0901\",\"lastModificationTime\":\"2022-05-25\",\"creationTime\":\"2022-05-24\",\"_X_ROW_KEY\":\"row_282\"},{\"id\":\"e5418d61-916f-45fd-d549-08da3d8d5a26\",\"isPrimary\":false,\"isIdentity\":false,\"isNullable\":true,\"position\":165,\"columnName\":\"LastModificationTime\",\"describe\":\"\",\"databaseColumnType\":\"datetime2\",\"csType\":\"DateTime\",\"csField\":\"LastModificationTime\",\"displayName\":null,\"low_Code_TableId\":\"6323638b-a45f-4a76-886e-69a9e9be0901\",\"lastModificationTime\":\"2022-05-25\",\"creationTime\":\"2022-05-24\",\"_X_ROW_KEY\":\"row_283\"},{\"id\":\"46bac66f-3cf0-46b3-d546-08da3d8d5a26\",\"isPrimary\":false,\"isIdentity\":false,\"isNullable\":true,\"position\":166,\"columnName\":\"CreationTime\",\"describe\":\"\",\"databaseColumnType\":\"datetime2\",\"csType\":\"DateTime\",\"csField\":\"CreationTime\",\"displayName\":null,\"low_Code_TableId\":\"6323638b-a45f-4a76-886e-69a9e9be0901\",\"lastModificationTime\":\"2022-05-25\",\"creationTime\":\"2022-05-24\",\"_X_ROW_KEY\":\"row_284\"},{\"id\":\"4b5bc027-5663-463a-d54b-08da3d8d5a26\",\"isPrimary\":false,\"isIdentity\":false,\"isNullable\":true,\"position\":167,\"columnName\":\"Name\",\"describe\":\"\",\"databaseColumnType\":\"nvarchar(255)\",\"csType\":\"String\",\"csField\":\"Name\",\"displayName\":\"用户名称\",\"low_Code_TableId\":\"6323638b-a45f-4a76-886e-69a9e9be0901\",\"lastModificationTime\":\"2022-05-25\",\"creationTime\":\"2022-05-24\",\"_X_ROW_KEY\":\"row_285\"},{\"id\":\"7cbe8988-cbac-4ea2-d54a-08da3d8d5a26\",\"isPrimary\":false,\"isIdentity\":false,\"isNullable\":true,\"position\":168,\"columnName\":\"LoginName\",\"describe\":\"\",\"databaseColumnType\":\"nvarchar(255)\",\"csType\":\"String\",\"csField\":\"LoginName\",\"displayName\":\"登录名称\",\"low_Code_TableId\":\"6323638b-a45f-4a76-886e-69a9e9be0901\",\"lastModificationTime\":\"2022-05-25\",\"creationTime\":\"2022-05-24\",\"_X_ROW_KEY\":\"row_286\"},{\"id\":\"e36410b5-cb7c-4fc3-d54d-08da3d8d5a26\",\"isPrimary\":false,\"isIdentity\":false,\"isNullable\":true,\"position\":169,\"columnName\":\"Password\",\"describe\":\"\",\"databaseColumnType\":\"nvarchar(255)\",\"csType\":\"String\",\"csField\":\"Password\",\"displayName\":\"密码\",\"low_Code_TableId\":\"6323638b-a45f-4a76-886e-69a9e9be0901\",\"lastModificationTime\":\"2022-05-25\",\"creationTime\":\"2022-05-24\",\"_X_ROW_KEY\":\"row_287\"},{\"id\":\"c82d5132-6cda-463e-d54e-08da3d8d5a26\",\"isPrimary\":false,\"isIdentity\":false,\"isNullable\":true,\"position\":170,\"columnName\":\"Phone\",\"describe\":\"\",\"databaseColumnType\":\"nvarchar(255)\",\"csType\":\"String\",\"csField\":\"Phone\",\"displayName\":\"联系电话\",\"low_Code_TableId\":\"6323638b-a45f-4a76-886e-69a9e9be0901\",\"lastModificationTime\":\"2022-05-25\",\"creationTime\":\"2022-05-24\",\"_X_ROW_KEY\":\"row_288\"},{\"id\":\"287314b2-3141-4957-d548-08da3d8d5a26\",\"isPrimary\":false,\"isIdentity\":false,\"isNullable\":false,\"position\":171,\"columnName\":\"Email\",\"describe\":\"\",\"databaseColumnType\":\"nvarchar(255)\",\"csType\":\"String\",\"csField\":\"Email\",\"displayName\":\"电子邮箱\",\"low_Code_TableId\":\"6323638b-a45f-4a76-886e-69a9e9be0901\",\"lastModificationTime\":\"2022-05-25\",\"creationTime\":\"2022-05-24\",\"_X_ROW_KEY\":\"row_289\"},{\"id\":\"a6752bd9-f3d6-451f-d547-08da3d8d5a26\",\"isPrimary\":false,\"isIdentity\":false,\"isNullable\":true,\"position\":172,\"columnName\":\"DeleteLock\",\"describe\":\"\",\"databaseColumnType\":\"bit\",\"csType\":\"Boolean\",\"csField\":\"DeleteLock\",\"displayName\":\"删除锁\",\"low_Code_TableId\":\"6323638b-a45f-4a76-886e-69a9e9be0901\",\"lastModificationTime\":\"2022-05-25\",\"creationTime\":\"2022-05-24\",\"_X_ROW_KEY\":\"row_290\"},{\"id\":\"5a9fa990-b6d6-445f-d54c-08da3d8d5a26\",\"isPrimary\":false,\"isIdentity\":false,\"isNullable\":true,\"position\":173,\"columnName\":\"OrganizationId\",\"describe\":\"\",\"databaseColumnType\":\"int\",\"csType\":\"Int32\",\"csField\":\"OrganizationId\",\"displayName\":\"组织id\",\"low_Code_TableId\":\"6323638b-a45f-4a76-886e-69a9e9be0901\",\"lastModificationTime\":\"2022-05-25\",\"creationTime\":\"2022-05-24\",\"_X_ROW_KEY\":\"row_291\"}]', '', 20, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 'LowCodeSearchController', NULL, '2022-06-08 21:24:50.665604', '2022-06-08 21:24:50.665603');
INSERT INTO `sysoperationlog` VALUES ('08da4952-4443-4432-8e18-0378f2a17aeb', '/api/admin/LowCodeTableInfo/findList/20/1', '0.0.0.1', '', '{\"columnName\":null,\"describe\":null,\"low_Code_TableId\":\"6323638b-a45f-4a76-886e-69a9e9be0901\"}', '', 70, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 'LowCodeSearchController', NULL, '2022-06-08 21:24:50.775202', '2022-06-08 21:24:50.775201');
INSERT INTO `sysoperationlog` VALUES ('08da4952-4519-4804-8eb8-e4a8575a7aff', '/api/admin/CodeGeneration/getCode', '0.0.0.1', '', '{\"tableName\":\"SysUser\",\"type\":\"HZY.Models\",\"codeText\":\"\"}', '', 113, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', NULL, '获取代码', '2022-06-08 21:24:52.179240', '2022-06-08 21:24:52.179239');
INSERT INTO `sysoperationlog` VALUES ('08da4952-4852-4bd3-8998-2405d7401a50', '/api/admin/SysOrganization/sysOrganizationTree', '0.0.0.1', '', '{}', '', 31, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', '组织机构', '查看组织架构树', '2022-06-08 21:24:57.587546', '2022-06-08 21:24:57.587545');
INSERT INTO `sysoperationlog` VALUES ('08da4952-485e-49ca-8055-f0c9f8b537b8', '/api/admin/SysUser/findList/10/1', '0.0.0.1', '', '{\"name\":null,\"loginName\":null,\"organizationId\":null}', '', 22, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', '系统账号', '查看数据', '2022-06-08 21:24:57.665307', '2022-06-08 21:24:57.665307');
INSERT INTO `sysoperationlog` VALUES ('08da4952-4a22-42f4-8a88-e55d164f6160', '/api/admin/SysOrganization/sysOrganizationTree', '0.0.0.1', '', '{}', '', 30, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', '组织机构', '查看组织架构树', '2022-06-08 21:25:00.624736', '2022-06-08 21:25:00.624735');
INSERT INTO `sysoperationlog` VALUES ('08da4952-4a2d-4f6c-8481-f7eeb7281ce7', '/api/admin/SysUser/findList/10/1', '0.0.0.1', '', '{\"name\":null,\"loginName\":null,\"organizationId\":null}', '', 24, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', '系统账号', '查看数据', '2022-06-08 21:25:00.701945', '2022-06-08 21:25:00.701944');
INSERT INTO `sysoperationlog` VALUES ('08da4952-5885-4f39-872f-6dd1535a0bd3', '/api/admin/LowCodeTableInfo/findList/20/1', '0.0.0.1', '', '{\"columnName\":null,\"describe\":null,\"low_Code_TableId\":\"d26d07cb-158a-4cb2-8b20-5dfd5181af54\"}', '', 11, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 'LowCodeSearchController', NULL, '2022-06-08 21:25:24.766691', '2022-06-08 21:25:24.766690');
INSERT INTO `sysoperationlog` VALUES ('08da4952-5896-489b-88f7-a3a9bf08cafb', '/api/admin/CodeGeneration/getCode', '0.0.0.1', '', '{\"tableName\":\"SysOrganization\",\"type\":\"HZY.Models\",\"codeText\":\"\"}', '', 121, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', NULL, '获取代码', '2022-06-08 21:25:24.875382', '2022-06-08 21:25:24.875381');
INSERT INTO `sysoperationlog` VALUES ('08da4952-5f32-4805-812c-f4d650cf7cdf', '/api/admin/LowCodeTableInfo/change', '0.0.0.1', '', '[{\"id\":\"d6008705-0d21-42ac-d525-08da3d8d5a26\",\"isPrimary\":true,\"isIdentity\":true,\"isNullable\":false,\"position\":132,\"columnName\":\"Id\",\"describe\":\"\",\"databaseColumnType\":\"int\",\"csType\":\"Int32\",\"csField\":\"Id\",\"displayName\":null,\"low_Code_TableId\":\"d26d07cb-158a-4cb2-8b20-5dfd5181af54\",\"lastModificationTime\":\"2022-05-24\",\"creationTime\":\"2022-05-24\",\"_X_ROW_KEY\":\"row_368\"},{\"id\":\"1121d642-49e8-4b25-d52b-08da3d8d5a26\",\"isPrimary\":false,\"isIdentity\":false,\"isNullable\":true,\"position\":133,\"columnName\":\"Name\",\"describe\":\"\",\"databaseColumnType\":\"nvarchar(255)\",\"csType\":\"String\",\"csField\":\"Name\",\"displayName\":\"组织名称\",\"low_Code_TableId\":\"d26d07cb-158a-4cb2-8b20-5dfd5181af54\",\"lastModificationTime\":\"2022-05-24\",\"creationTime\":\"2022-05-24\",\"_X_ROW_KEY\":\"row_369\"},{\"id\":\"5aed3feb-3d77-4e1e-d52c-08da3d8d5a26\",\"isPrimary\":false,\"isIdentity\":false,\"isNullable\":true,\"position\":134,\"columnName\":\"OrderNumber\",\"describe\":\"\",\"databaseColumnType\":\"int\",\"csType\":\"Int32\",\"csField\":\"OrderNumber\",\"displayName\":null,\"low_Code_TableId\":\"d26d07cb-158a-4cb2-8b20-5dfd5181af54\",\"lastModificationTime\":\"2022-05-24\",\"creationTime\":\"2022-05-24\",\"_X_ROW_KEY\":\"row_370\"},{\"id\":\"11f3d291-cf7a-4143-d52a-08da3d8d5a26\",\"isPrimary\":false,\"isIdentity\":false,\"isNullable\":true,\"position\":135,\"columnName\":\"LevelCode\",\"describe\":\"\",\"databaseColumnType\":\"varchar(50)\",\"csType\":\"String\",\"csField\":\"LevelCode\",\"displayName\":null,\"low_Code_TableId\":\"d26d07cb-158a-4cb2-8b20-5dfd5181af54\",\"lastModificationTime\":\"2022-05-24\",\"creationTime\":\"2022-05-24\",\"_X_ROW_KEY\":\"row_371\"},{\"id\":\"cf2e3691-ab88-4420-d529-08da3d8d5a26\",\"isPrimary\":false,\"isIdentity\":false,\"isNullable\":true,\"position\":136,\"columnName\":\"Leader\",\"describe\":\"\",\"databaseColumnType\":\"nvarchar(255)\",\"csType\":\"String\",\"csField\":\"Leader\",\"displayName\":null,\"low_Code_TableId\":\"d26d07cb-158a-4cb2-8b20-5dfd5181af54\",\"lastModificationTime\":\"2022-05-24\",\"creationTime\":\"2022-05-24\",\"_X_ROW_KEY\":\"row_372\"},{\"id\":\"ea63351c-c203-4d40-d52e-08da3d8d5a26\",\"isPrimary\":false,\"isIdentity\":false,\"isNullable\":true,\"position\":137,\"columnName\":\"Phone\",\"describe\":\"\",\"databaseColumnType\":\"nvarchar(255)\",\"csType\":\"String\",\"csField\":\"Phone\",\"displayName\":null,\"low_Code_TableId\":\"d26d07cb-158a-4cb2-8b20-5dfd5181af54\",\"lastModificationTime\":\"2022-05-24\",\"creationTime\":\"2022-05-24\",\"_X_ROW_KEY\":\"row_373\"},{\"id\":\"ce802713-74f5-4f30-d527-08da3d8d5a26\",\"isPrimary\":false,\"isIdentity\":false,\"isNullable\":true,\"position\":138,\"columnName\":\"Email\",\"describe\":\"\",\"databaseColumnType\":\"nvarchar(255)\",\"csType\":\"String\",\"csField\":\"Email\",\"displayName\":null,\"low_Code_TableId\":\"d26d07cb-158a-4cb2-8b20-5dfd5181af54\",\"lastModificationTime\":\"2022-05-24\",\"creationTime\":\"2022-05-24\",\"_X_ROW_KEY\":\"row_374\"},{\"id\":\"b9bfca2e-f72b-4a3f-d52f-08da3d8d5a26\",\"isPrimary\":false,\"isIdentity\":false,\"isNullable\":true,\"position\":139,\"columnName\":\"State\",\"describe\":\"\",\"databaseColumnType\":\"int\",\"csType\":\"Int32\",\"csField\":\"State\",\"displayName\":null,\"low_Code_TableId\":\"d26d07cb-158a-4cb2-8b20-5dfd5181af54\",\"lastModificationTime\":\"2022-05-24\",\"creationTime\":\"2022-05-24\",\"_X_ROW_KEY\":\"row_375\"},{\"id\":\"042a59e2-72c1-4c38-d52d-08da3d8d5a26\",\"isPrimary\":false,\"isIdentity\":false,\"isNullable\":true,\"position\":140,\"columnName\":\"ParentId\",\"describe\":\"\",\"databaseColumnType\":\"int\",\"csType\":\"Int32\",\"csField\":\"ParentId\",\"displayName\":null,\"low_Code_TableId\":\"d26d07cb-158a-4cb2-8b20-5dfd5181af54\",\"lastModificationTime\":\"2022-05-24\",\"creationTime\":\"2022-05-24\",\"_X_ROW_KEY\":\"row_376\"},{\"id\":\"19a7504c-f740-4b49-d528-08da3d8d5a26\",\"isPrimary\":false,\"isIdentity\":false,\"isNullable\":true,\"position\":141,\"columnName\":\"LastModificationTime\",\"describe\":\"\",\"databaseColumnType\":\"datetime2\",\"csType\":\"DateTime\",\"csField\":\"LastModificationTime\",\"displayName\":null,\"low_Code_TableId\":\"d26d07cb-158a-4cb2-8b20-5dfd5181af54\",\"lastModificationTime\":\"2022-05-24\",\"creationTime\":\"2022-05-24\",\"_X_ROW_KEY\":\"row_377\"},{\"id\":\"0b45e9bb-b9f1-4a2f-d526-08da3d8d5a26\",\"isPrimary\":false,\"isIdentity\":false,\"isNullable\":true,\"position\":142,\"columnName\":\"CreationTime\",\"describe\":\"\",\"databaseColumnType\":\"datetime2\",\"csType\":\"DateTime\",\"csField\":\"CreationTime\",\"displayName\":null,\"low_Code_TableId\":\"d26d07cb-158a-4cb2-8b20-5dfd5181af54\",\"lastModificationTime\":\"2022-05-24\",\"creationTime\":\"2022-05-24\",\"_X_ROW_KEY\":\"row_378\"}]', '', 23, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 'LowCodeSearchController', NULL, '2022-06-08 21:25:35.963835', '2022-06-08 21:25:35.963834');
INSERT INTO `sysoperationlog` VALUES ('08da4952-5f43-4177-8143-7ad597a05fb8', '/api/admin/LowCodeTableInfo/findList/20/1', '0.0.0.1', '', '{\"columnName\":null,\"describe\":null,\"low_Code_TableId\":\"d26d07cb-158a-4cb2-8b20-5dfd5181af54\"}', '', 59, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 'LowCodeSearchController', NULL, '2022-06-08 21:25:36.072552', '2022-06-08 21:25:36.072551');
INSERT INTO `sysoperationlog` VALUES ('08da4952-60bb-40e4-835c-5377bebec3db', '/api/admin/LowCodeTable/findList/10/1', '0.0.0.1', '', '{\"tableName\":null,\"entityName\":null,\"displayName\":null}', '', 63, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 'LowCodeTableController', NULL, '2022-06-08 21:25:38.536464', '2022-06-08 21:25:38.536463');
INSERT INTO `sysoperationlog` VALUES ('08da4952-612f-463e-894b-e31f8970af08', '/client/NaN', '0.0.0.1', '', '', '', 0, 'Chrome102', 'Windows10', NULL, NULL, NULL, '2022-06-08 21:25:39.298890', '2022-06-08 21:25:39.298890');
INSERT INTO `sysoperationlog` VALUES ('08da4952-6209-4846-8d71-c4393dad7e11', '/client/NaN', '0.0.0.1', '', '', '', 0, 'Chrome102', 'Windows10', NULL, NULL, NULL, '2022-06-08 21:25:40.728431', '2022-06-08 21:25:40.728430');
INSERT INTO `sysoperationlog` VALUES ('08da4952-6304-4a4f-8d87-f486ed1a133e', '/api/admin/SysOrganization/sysOrganizationTree', '0.0.0.1', '', '{}', '', 29, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', '组织机构', '查看组织架构树', '2022-06-08 21:25:42.374191', '2022-06-08 21:25:42.374190');
INSERT INTO `sysoperationlog` VALUES ('08da4952-6310-4839-8100-bb27efcceb51', '/api/admin/SysUser/findList/10/1', '0.0.0.1', '', '{\"name\":null,\"loginName\":null,\"organizationId\":null}', '', 20, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', '系统账号', '查看数据', '2022-06-08 21:25:42.451969', '2022-06-08 21:25:42.451969');
INSERT INTO `sysoperationlog` VALUES ('08da4952-6803-43e0-8830-4832499bd14d', '/api/admin/LowCodeTableInfo/findList/20/1', '0.0.0.1', '', '{\"columnName\":null,\"describe\":null,\"low_Code_TableId\":\"6323638b-a45f-4a76-886e-69a9e9be0901\"}', '', 10, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 'LowCodeSearchController', NULL, '2022-06-08 21:25:50.753606', '2022-06-08 21:25:50.753606');
INSERT INTO `sysoperationlog` VALUES ('08da4952-6ebe-42e2-899e-49bbf2bc5f4b', '/api/admin/LowCodeTableInfo/change', '0.0.0.1', '', '[{\"id\":\"5bcf7406-75cc-4171-d545-08da3d8d5a26\",\"isPrimary\":true,\"isIdentity\":false,\"isNullable\":false,\"position\":164,\"columnName\":\"Id\",\"describe\":\"\",\"databaseColumnType\":\"uniqueidentifier\",\"csType\":\"Guid\",\"csField\":\"Id\",\"displayName\":null,\"low_Code_TableId\":\"6323638b-a45f-4a76-886e-69a9e9be0901\",\"lastModificationTime\":\"2022-06-08\",\"creationTime\":\"2022-05-24\",\"_X_ROW_KEY\":\"row_479\"},{\"id\":\"e5418d61-916f-45fd-d549-08da3d8d5a26\",\"isPrimary\":false,\"isIdentity\":false,\"isNullable\":true,\"position\":165,\"columnName\":\"LastModificationTime\",\"describe\":\"\",\"databaseColumnType\":\"datetime2\",\"csType\":\"DateTime\",\"csField\":\"LastModificationTime\",\"displayName\":\"更新时间\",\"low_Code_TableId\":\"6323638b-a45f-4a76-886e-69a9e9be0901\",\"lastModificationTime\":\"2022-06-08\",\"creationTime\":\"2022-05-24\",\"_X_ROW_KEY\":\"row_480\"},{\"id\":\"46bac66f-3cf0-46b3-d546-08da3d8d5a26\",\"isPrimary\":false,\"isIdentity\":false,\"isNullable\":true,\"position\":166,\"columnName\":\"CreationTime\",\"describe\":\"\",\"databaseColumnType\":\"datetime2\",\"csType\":\"DateTime\",\"csField\":\"CreationTime\",\"displayName\":\"创建时间\",\"low_Code_TableId\":\"6323638b-a45f-4a76-886e-69a9e9be0901\",\"lastModificationTime\":\"2022-06-08\",\"creationTime\":\"2022-05-24\",\"_X_ROW_KEY\":\"row_481\"},{\"id\":\"4b5bc027-5663-463a-d54b-08da3d8d5a26\",\"isPrimary\":false,\"isIdentity\":false,\"isNullable\":true,\"position\":167,\"columnName\":\"Name\",\"describe\":\"\",\"databaseColumnType\":\"nvarchar(255)\",\"csType\":\"String\",\"csField\":\"Name\",\"displayName\":\"用户名称\",\"low_Code_TableId\":\"6323638b-a45f-4a76-886e-69a9e9be0901\",\"lastModificationTime\":\"2022-06-08\",\"creationTime\":\"2022-05-24\",\"_X_ROW_KEY\":\"row_482\"},{\"id\":\"7cbe8988-cbac-4ea2-d54a-08da3d8d5a26\",\"isPrimary\":false,\"isIdentity\":false,\"isNullable\":true,\"position\":168,\"columnName\":\"LoginName\",\"describe\":\"\",\"databaseColumnType\":\"nvarchar(255)\",\"csType\":\"String\",\"csField\":\"LoginName\",\"displayName\":\"登录名称\",\"low_Code_TableId\":\"6323638b-a45f-4a76-886e-69a9e9be0901\",\"lastModificationTime\":\"2022-06-08\",\"creationTime\":\"2022-05-24\",\"_X_ROW_KEY\":\"row_483\"},{\"id\":\"e36410b5-cb7c-4fc3-d54d-08da3d8d5a26\",\"isPrimary\":false,\"isIdentity\":false,\"isNullable\":true,\"position\":169,\"columnName\":\"Password\",\"describe\":\"\",\"databaseColumnType\":\"nvarchar(255)\",\"csType\":\"String\",\"csField\":\"Password\",\"displayName\":\"密码\",\"low_Code_TableId\":\"6323638b-a45f-4a76-886e-69a9e9be0901\",\"lastModificationTime\":\"2022-06-08\",\"creationTime\":\"2022-05-24\",\"_X_ROW_KEY\":\"row_484\"},{\"id\":\"c82d5132-6cda-463e-d54e-08da3d8d5a26\",\"isPrimary\":false,\"isIdentity\":false,\"isNullable\":true,\"position\":170,\"columnName\":\"Phone\",\"describe\":\"\",\"databaseColumnType\":\"nvarchar(255)\",\"csType\":\"String\",\"csField\":\"Phone\",\"displayName\":\"联系电话\",\"low_Code_TableId\":\"6323638b-a45f-4a76-886e-69a9e9be0901\",\"lastModificationTime\":\"2022-06-08\",\"creationTime\":\"2022-05-24\",\"_X_ROW_KEY\":\"row_485\"},{\"id\":\"287314b2-3141-4957-d548-08da3d8d5a26\",\"isPrimary\":false,\"isIdentity\":false,\"isNullable\":false,\"position\":171,\"columnName\":\"Email\",\"describe\":\"\",\"databaseColumnType\":\"nvarchar(255)\",\"csType\":\"String\",\"csField\":\"Email\",\"displayName\":\"电子邮箱\",\"low_Code_TableId\":\"6323638b-a45f-4a76-886e-69a9e9be0901\",\"lastModificationTime\":\"2022-06-08\",\"creationTime\":\"2022-05-24\",\"_X_ROW_KEY\":\"row_486\"},{\"id\":\"a6752bd9-f3d6-451f-d547-08da3d8d5a26\",\"isPrimary\":false,\"isIdentity\":false,\"isNullable\":true,\"position\":172,\"columnName\":\"DeleteLock\",\"describe\":\"\",\"databaseColumnType\":\"bit\",\"csType\":\"Boolean\",\"csField\":\"DeleteLock\",\"displayName\":\"删除锁\",\"low_Code_TableId\":\"6323638b-a45f-4a76-886e-69a9e9be0901\",\"lastModificationTime\":\"2022-06-08\",\"creationTime\":\"2022-05-24\",\"_X_ROW_KEY\":\"row_487\"},{\"id\":\"5a9fa990-b6d6-445f-d54c-08da3d8d5a26\",\"isPrimary\":false,\"isIdentity\":false,\"isNullable\":true,\"position\":173,\"columnName\":\"OrganizationId\",\"describe\":\"\",\"databaseColumnType\":\"int\",\"csType\":\"Int32\",\"csField\":\"OrganizationId\",\"displayName\":\"组织id\",\"low_Code_TableId\":\"6323638b-a45f-4a76-886e-69a9e9be0901\",\"lastModificationTime\":\"2022-06-08\",\"creationTime\":\"2022-05-24\",\"_X_ROW_KEY\":\"row_488\"}]', '', 17, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 'LowCodeSearchController', NULL, '2022-06-08 21:26:02.045069', '2022-06-08 21:26:02.045069');
INSERT INTO `sysoperationlog` VALUES ('08da4952-6ece-4997-8d8c-49d6bbb4949f', '/api/admin/LowCodeTableInfo/findList/20/1', '0.0.0.1', '', '{\"columnName\":null,\"describe\":null,\"low_Code_TableId\":\"6323638b-a45f-4a76-886e-69a9e9be0901\"}', '', 70, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 'LowCodeSearchController', NULL, '2022-06-08 21:26:02.152663', '2022-06-08 21:26:02.152662');
INSERT INTO `sysoperationlog` VALUES ('08da4952-712a-43a2-8af6-22c0651a47da', '/client/NaN', '0.0.0.1', '', '', '', 0, 'Chrome102', 'Windows10', NULL, NULL, NULL, '2022-06-08 21:26:06.108620', '2022-06-08 21:26:06.108619');
INSERT INTO `sysoperationlog` VALUES ('08da4952-7181-4b99-8d78-5c4fe5bd78df', '/client/NaN', '0.0.0.1', '', '', '', 0, 'Chrome102', 'Windows10', NULL, NULL, NULL, '2022-06-08 21:26:06.682020', '2022-06-08 21:26:06.682019');
INSERT INTO `sysoperationlog` VALUES ('08da4952-7269-48d2-89c9-f92d2bbbce93', '/api/admin/SysOrganization/sysOrganizationTree', '0.0.0.1', '', '{}', '', 40, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', '组织机构', '查看组织架构树', '2022-06-08 21:26:08.201346', '2022-06-08 21:26:08.201345');
INSERT INTO `sysoperationlog` VALUES ('08da4952-727a-423b-88f8-19104d267721', '/api/admin/SysUser/findList/10/1', '0.0.0.1', '', '{\"name\":null,\"loginName\":null,\"organizationId\":null}', '', 22, 'Chrome102', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', '系统账号', '查看数据', '2022-06-08 21:26:08.310070', '2022-06-08 21:26:08.310069');

-- ----------------------------
-- Table structure for sysorganization
-- ----------------------------
DROP TABLE IF EXISTS `sysorganization`;
CREATE TABLE `sysorganization`  (
  `Id` int(0) NOT NULL AUTO_INCREMENT,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `OrderNumber` int(0) NULL DEFAULT NULL,
  `LevelCode` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Leader` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Phone` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Email` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `State` int(0) NULL DEFAULT NULL,
  `ParentId` int(0) NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sysorganization
-- ----------------------------
INSERT INTO `sysorganization` VALUES (1, '阿里巴巴集团', 1, '1', 'hzy', '18410912184', '18410912184@qq.com', 1, NULL, '2021-05-27 20:50:31.000000', '2021-05-27 20:50:31.000000');
INSERT INTO `sysorganization` VALUES (2, '北京分部', 3, '1.2', '北京分部', '132123', '13131', 1, 1, '2021-12-28 16:13:34.000000', '2021-05-27 22:33:44.000000');
INSERT INTO `sysorganization` VALUES (3, '市场部门', 1, '1.2.3', '市场部门', '234124234', '234234@qq.com', 1, 2, '2021-05-27 22:33:57.000000', '2021-05-27 22:33:57.000000');
INSERT INTO `sysorganization` VALUES (4, '财务部门', 2, '1.2.4', '财务部门', '435543535', '123@qq.com', 1, 2, '2021-05-27 22:34:11.000000', '2021-05-27 22:34:11.000000');
INSERT INTO `sysorganization` VALUES (5, '成都分部', 2, '1.5', '成都分部', '123123123', '123@qq.com', 1, 1, '2021-05-27 22:31:45.000000', '2021-05-27 21:01:50.000000');
INSERT INTO `sysorganization` VALUES (7, '研发部门', 1, '1.5.7', '研发部门', '1234323423', '12312@qq.com', 1, 5, '2021-05-27 22:32:29.000000', '2021-05-27 22:32:08.000000');
INSERT INTO `sysorganization` VALUES (9, '运维部门', 4, '1.5.9', '运维部门', '1232133452', '12341@qq.com', 1, 5, '2022-03-08 17:07:47.000000', '2021-05-27 22:33:25.000000');
INSERT INTO `sysorganization` VALUES (10, '测试部门', 3, '1.5.10', '测试部门', '12313', '123123@qq.com', 1, 5, '2021-05-27 22:32:59.000000', '2021-05-27 22:32:59.000000');
INSERT INTO `sysorganization` VALUES (11, '技术部门', 2, '1.5.11', '技术部门', '12345678911', '12345678901@qq.com', 1, 5, '2022-03-08 17:07:37.000000', '2022-03-08 17:00:20.000000');

-- ----------------------------
-- Table structure for syspost
-- ----------------------------
DROP TABLE IF EXISTS `syspost`;
CREATE TABLE `syspost`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Number` int(0) NULL DEFAULT NULL,
  `Code` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `State` int(0) NOT NULL,
  `Remarks` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `LastModificationTime` datetime(6) NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of syspost
-- ----------------------------
INSERT INTO `syspost` VALUES ('0716b4b0-9a06-43e9-8ae8-82c74875f83e', 2, 'se', '项目经理', 1, NULL, '2021-05-27 20:26:35.000000', '2021-05-27 20:26:35.000000');
INSERT INTO `syspost` VALUES ('96927c30-41d0-4ced-8e29-cbed35c90fb0', 1, 'ceo', '董事长', 1, NULL, '2021-05-27 20:26:22.000000', '2021-05-27 20:26:22.000000');
INSERT INTO `syspost` VALUES ('e46af329-6d08-442c-9837-f22cff954411', 4, 'user', '普通员工', 1, NULL, '2022-04-23 21:50:55.000000', '2021-05-27 20:26:52.000000');
INSERT INTO `syspost` VALUES ('f0bd38c2-f1de-4bd9-e2db-08da00a93622', 5, 'dotnet_engineer', 'DotNet软件工程师', 1, NULL, '2022-03-08 10:13:18.000000', '2022-03-08 10:13:18.000000');
INSERT INTO `syspost` VALUES ('f0c67537-8094-429a-b474-f54ac518609e', 3, 'hr', '人力资源', 1, NULL, '2021-05-27 20:26:44.000000', '2021-05-27 20:26:44.000000');

-- ----------------------------
-- Table structure for sysrole
-- ----------------------------
DROP TABLE IF EXISTS `sysrole`;
CREATE TABLE `sysrole`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Number` int(0) NULL DEFAULT NULL,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `DeleteLock` tinyint(1) NOT NULL,
  `LastModificationTime` datetime(6) NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sysrole
-- ----------------------------
INSERT INTO `sysrole` VALUES ('18fa4771-6f58-46a3-80d2-6f0f5e9972e3', 1, '超级管理员', '拥有所有权限', 1, '2021-01-10 11:25:12.000000', '2016-07-06 17:59:20.000000');
INSERT INTO `sysrole` VALUES ('40ff1844-c099-4061-98e0-cd6e544fcfd3', 2, '普通用户', '普通用户', 1, '2021-01-30 00:51:17.000000', '2016-07-06 17:59:20.000000');

-- ----------------------------
-- Table structure for sysrolemenufunction
-- ----------------------------
DROP TABLE IF EXISTS `sysrolemenufunction`;
CREATE TABLE `sysrolemenufunction`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `RoleId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `MenuId` int(0) NOT NULL,
  `MenuFunctionId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `LastModificationTime` datetime(6) NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sysrolemenufunction
-- ----------------------------
INSERT INTO `sysrolemenufunction` VALUES ('03e8fe58-17fe-4284-8916-08da250bdf25', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 6, '1cb6fbe1-4a6c-4aad-0f22-08d9fdad00ab', '2022-04-23 17:30:14.000000', '2022-04-23 17:30:14.000000');
INSERT INTO `sysrolemenufunction` VALUES ('07e218fc-2298-4954-8917-08da250bdf25', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 8, 'd2e6ea60-2cf6-478a-0f23-08d9fdad00ab', '2022-04-23 17:30:14.000000', '2022-04-23 17:30:14.000000');
INSERT INTO `sysrolemenufunction` VALUES ('234fac8d-c4ee-46e2-891a-08da250bdf25', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 11, '3bc0e68f-d03d-4e99-0f26-08d9fdad00ab', '2022-04-23 17:30:14.000000', '2022-04-23 17:30:14.000000');
INSERT INTO `sysrolemenufunction` VALUES ('3a82a6ed-573a-4cba-8920-08da250bdf25', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 13, 'a3754771-f6e9-4a23-0f2c-08d9fdad00ab', '2022-04-23 17:30:14.000000', '2022-04-23 17:30:14.000000');
INSERT INTO `sysrolemenufunction` VALUES ('3c0cbca5-310f-41db-891b-08da250bdf25', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 13, 'eb958545-6449-40db-0f27-08d9fdad00ab', '2022-04-23 17:30:14.000000', '2022-04-23 17:30:14.000000');
INSERT INTO `sysrolemenufunction` VALUES ('47cf05e0-72b6-486f-8914-08da250bdf25', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 3, 'f64cfe50-1ef1-457f-0f20-08d9fdad00ab', '2022-04-23 17:30:14.000000', '2022-04-23 17:30:14.000000');
INSERT INTO `sysrolemenufunction` VALUES ('47d72c2c-d4e1-4d3e-8923-08da250bdf25', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 15, '13f3f74d-c6fc-4488-0f2f-08d9fdad00ab', '2022-04-23 17:30:14.000000', '2022-04-23 17:30:14.000000');
INSERT INTO `sysrolemenufunction` VALUES ('4854c7f2-e61b-4a3a-891d-08da250bdf25', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 13, '106fb69a-8bb5-4559-0f29-08d9fdad00ab', '2022-04-23 17:30:14.000000', '2022-04-23 17:30:14.000000');
INSERT INTO `sysrolemenufunction` VALUES ('62941ac4-12b1-4427-8926-08da250bdf25', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 32, '6c09c0c0-72fa-4842-0f1f-08d9fdad00ab', '2022-04-23 17:30:14.000000', '2022-04-23 17:30:14.000000');
INSERT INTO `sysrolemenufunction` VALUES ('723496de-edf5-4abb-8913-08da250bdf25', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 2, 'a7cd04db-bbe3-49b6-0f1e-08d9fdad00ab', '2022-04-23 17:30:14.000000', '2022-04-23 17:30:14.000000');
INSERT INTO `sysrolemenufunction` VALUES ('8284a625-2407-44ca-891f-08da250bdf25', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 13, '523b53b5-8159-4a16-0f2b-08d9fdad00ab', '2022-04-23 17:30:14.000000', '2022-04-23 17:30:14.000000');
INSERT INTO `sysrolemenufunction` VALUES ('a9b2d796-7fb4-4d61-8919-08da250bdf25', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 10, 'ec535908-8671-4928-0f25-08d9fdad00ab', '2022-04-23 17:30:14.000000', '2022-04-23 17:30:14.000000');
INSERT INTO `sysrolemenufunction` VALUES ('aacc3780-8729-43df-8922-08da250bdf25', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 13, '541d9045-47b2-4629-0f2e-08d9fdad00ab', '2022-04-23 17:30:14.000000', '2022-04-23 17:30:14.000000');
INSERT INTO `sysrolemenufunction` VALUES ('b03f0d20-4079-462a-891c-08da250bdf25', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 13, 'b5881044-afb8-40b2-0f28-08d9fdad00ab', '2022-04-23 17:30:14.000000', '2022-04-23 17:30:14.000000');
INSERT INTO `sysrolemenufunction` VALUES ('cb8ad405-affd-4aa9-8915-08da250bdf25', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 5, 'a1ddd02f-8c21-4d79-0f21-08d9fdad00ab', '2022-04-23 17:30:14.000000', '2022-04-23 17:30:14.000000');
INSERT INTO `sysrolemenufunction` VALUES ('d05aadea-113c-4d48-8924-08da250bdf25', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 19, 'c77c812a-1601-4311-0f70-08d9fdad00ab', '2022-04-23 17:30:14.000000', '2022-04-23 17:30:14.000000');
INSERT INTO `sysrolemenufunction` VALUES ('d44f1f28-b588-4b68-8918-08da250bdf25', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 9, 'b7533a90-dae4-4263-0f24-08d9fdad00ab', '2022-04-23 17:30:14.000000', '2022-04-23 17:30:14.000000');
INSERT INTO `sysrolemenufunction` VALUES ('d461b335-cc62-4af1-8925-08da250bdf25', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 28, '3f6d0af7-5386-4d3a-0f71-08d9fdad00ab', '2022-04-23 17:30:14.000000', '2022-04-23 17:30:14.000000');
INSERT INTO `sysrolemenufunction` VALUES ('da031f6c-e0ec-4460-891e-08da250bdf25', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 13, 'f4621fbe-6b40-4454-0f2a-08d9fdad00ab', '2022-04-23 17:30:14.000000', '2022-04-23 17:30:14.000000');
INSERT INTO `sysrolemenufunction` VALUES ('f55a6ab8-e54f-4c31-8921-08da250bdf25', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 13, 'b96f977c-a36e-4e7f-0f2d-08d9fdad00ab', '2022-04-23 17:30:14.000000', '2022-04-23 17:30:14.000000');

-- ----------------------------
-- Table structure for sysuser
-- ----------------------------
DROP TABLE IF EXISTS `sysuser`;
CREATE TABLE `sysuser`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `LoginName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Password` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Phone` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Email` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DeleteLock` tinyint(1) NOT NULL,
  `OrganizationId` int(0) NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sysuser
-- ----------------------------
INSERT INTO `sysuser` VALUES ('0198459e-2034-4533-b843-5d227ad20740', '超级管理员', 'admin', 'E10ADC3949BA59ABBE56E057F20F883E', '10000000000', '1396510655@qq.com', 1, 7, '2022-03-08 17:27:36.000000', '2017-04-06 19:55:53.000000');
INSERT INTO `sysuser` VALUES ('1550d6d4-0529-4fdd-62dc-08da00e3d8a0', '鲁迅', '鲁迅', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 0, 7, '2022-03-08 17:30:56.000000', '2022-03-08 17:21:56.000000');
INSERT INTO `sysuser` VALUES ('3739f349-7995-4c63-62d8-08da00e3d8a0', '白居易', '白居易', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 0, 7, '2022-03-08 17:17:58.000000', '2022-03-08 17:17:58.000000');
INSERT INTO `sysuser` VALUES ('4fd6a740-0cf1-4975-62d6-08da00e3d8a0', '李商隐', '李商隐', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 0, 7, '2022-03-08 17:14:13.000000', '2022-03-08 17:14:13.000000');
INSERT INTO `sysuser` VALUES ('5722af0f-2366-4fc9-62d5-08da00e3d8a0', '杜甫', '杜甫', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 0, 7, '2022-03-08 17:13:02.000000', '2022-03-08 17:13:02.000000');
INSERT INTO `sysuser` VALUES ('a1b6dafb-2b6a-4ff9-62da-08da00e3d8a0', '屈原', '屈原', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 0, 7, '2022-03-08 17:19:55.000000', '2022-03-08 17:19:55.000000');
INSERT INTO `sysuser` VALUES ('a3f9784c-5f00-4ec9-62d9-08da00e3d8a0', '陶渊明 ', '陶渊明 ', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 0, 7, '2022-03-08 17:19:22.000000', '2022-03-08 17:19:22.000000');
INSERT INTO `sysuser` VALUES ('ac18f496-e93d-42f0-b59e-e321acc85335', '李白', 'libai', 'E10ADC3949BA59ABBE56E057F20F883E', '12345678900', '12345678900@live.com', 1, 7, '2022-03-08 10:12:14.000000', '2017-04-06 19:55:53.000000');
INSERT INTO `sysuser` VALUES ('cc186fe2-ee27-4292-62db-08da00e3d8a0', '孟浩然', '孟浩然', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 0, 7, '2022-03-08 17:20:20.000000', '2022-03-08 17:20:20.000000');
INSERT INTO `sysuser` VALUES ('e225e163-31c9-4da9-62d7-08da00e3d8a0', '苏轼', '苏轼', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 0, 7, '2022-03-08 17:15:07.000000', '2022-03-08 17:15:07.000000');

-- ----------------------------
-- Table structure for sysuserpost
-- ----------------------------
DROP TABLE IF EXISTS `sysuserpost`;
CREATE TABLE `sysuserpost`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `UserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `PostId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `LastModificationTime` datetime(6) NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sysuserpost
-- ----------------------------
INSERT INTO `sysuserpost` VALUES ('0c1a55ba-6bd3-4810-a494-a6b9b7374d4d', 'ac18f496-e93d-42f0-b59e-e321acc85335', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', '2022-03-08 10:13:35.000000', '2022-03-08 10:13:35.000000');
INSERT INTO `sysuserpost` VALUES ('575bf085-47bb-42f2-8b68-620cf460b164', '0198459e-2034-4533-b843-5d227ad20740', '96927c30-41d0-4ced-8e29-cbed35c90fb0', '2022-03-08 17:29:22.000000', '2022-03-08 17:29:22.000000');
INSERT INTO `sysuserpost` VALUES ('6133b794-efc7-4ebc-b7cf-2cf72fa768f8', '1550d6d4-0529-4fdd-62dc-08da00e3d8a0', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', '2022-04-23 17:55:33.000000', '2022-04-23 17:55:33.000000');
INSERT INTO `sysuserpost` VALUES ('6c34f115-28dd-441a-81d5-f6598c97d44a', 'a3f9784c-5f00-4ec9-62d9-08da00e3d8a0', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', '2022-03-08 17:19:22.000000', '2022-03-08 17:19:22.000000');
INSERT INTO `sysuserpost` VALUES ('6f671077-c98d-4106-9736-bf2edb6db58d', '4fd6a740-0cf1-4975-62d6-08da00e3d8a0', 'e46af329-6d08-442c-9837-f22cff954411', '2022-03-08 17:14:13.000000', '2022-03-08 17:14:13.000000');
INSERT INTO `sysuserpost` VALUES ('8100145c-9cd0-49bf-9a62-25c9e508bc1c', 'a1b6dafb-2b6a-4ff9-62da-08da00e3d8a0', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', '2022-03-08 17:19:55.000000', '2022-03-08 17:19:55.000000');
INSERT INTO `sysuserpost` VALUES ('978fc672-d829-4dad-abc7-071810c5ad18', 'e225e163-31c9-4da9-62d7-08da00e3d8a0', 'e46af329-6d08-442c-9837-f22cff954411', '2022-03-08 17:15:08.000000', '2022-03-08 17:15:08.000000');
INSERT INTO `sysuserpost` VALUES ('af1bec7e-3309-4629-9606-72eefa1826b3', 'cc186fe2-ee27-4292-62db-08da00e3d8a0', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', '2022-03-08 17:20:20.000000', '2022-03-08 17:20:20.000000');
INSERT INTO `sysuserpost` VALUES ('b797ff16-d6f7-45db-83ec-f910b2612926', '4fd6a740-0cf1-4975-62d6-08da00e3d8a0', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', '2022-03-08 17:14:13.000000', '2022-03-08 17:14:13.000000');
INSERT INTO `sysuserpost` VALUES ('b97331a7-e281-4027-aade-9f068558826a', '5722af0f-2366-4fc9-62d5-08da00e3d8a0', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', '2022-03-08 17:13:02.000000', '2022-03-08 17:13:02.000000');
INSERT INTO `sysuserpost` VALUES ('d4e0ae0b-3573-4901-8fd7-9bb2c88ebe94', '3739f349-7995-4c63-62d8-08da00e3d8a0', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', '2022-03-08 17:17:58.000000', '2022-03-08 17:17:58.000000');
INSERT INTO `sysuserpost` VALUES ('e64ef93c-2ce5-4b1d-a5d0-a9de937c5a3f', 'e225e163-31c9-4da9-62d7-08da00e3d8a0', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', '2022-03-08 17:15:07.000000', '2022-03-08 17:15:07.000000');

-- ----------------------------
-- Table structure for sysuserrole
-- ----------------------------
DROP TABLE IF EXISTS `sysuserrole`;
CREATE TABLE `sysuserrole`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `UserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `RoleId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `LastModificationTime` datetime(6) NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sysuserrole
-- ----------------------------
INSERT INTO `sysuserrole` VALUES ('1c9f81df-c8a0-45bb-a272-c84bd3af0c19', '0198459e-2034-4533-b843-5d227ad20740', '18fa4771-6f58-46a3-80d2-6f0f5e9972e3', '2022-03-08 17:29:22.000000', '2022-03-08 17:29:22.000000');
INSERT INTO `sysuserrole` VALUES ('1fe23f57-97c5-4670-9064-88d7d972cd28', 'e225e163-31c9-4da9-62d7-08da00e3d8a0', '40ff1844-c099-4061-98e0-cd6e544fcfd3', '2022-03-08 17:15:07.000000', '2022-03-08 17:15:07.000000');
INSERT INTO `sysuserrole` VALUES ('45b7d5af-4d2c-465e-a4b6-99e52af9aee5', '3739f349-7995-4c63-62d8-08da00e3d8a0', '40ff1844-c099-4061-98e0-cd6e544fcfd3', '2022-03-08 17:17:58.000000', '2022-03-08 17:17:58.000000');
INSERT INTO `sysuserrole` VALUES ('66472deb-3a40-4e48-b3e7-931e166f9d56', '1550d6d4-0529-4fdd-62dc-08da00e3d8a0', '40ff1844-c099-4061-98e0-cd6e544fcfd3', '2022-04-23 17:55:33.000000', '2022-04-23 17:55:33.000000');
INSERT INTO `sysuserrole` VALUES ('a646def7-0581-4ce9-947e-400360c339f9', 'a1b6dafb-2b6a-4ff9-62da-08da00e3d8a0', '40ff1844-c099-4061-98e0-cd6e544fcfd3', '2022-03-08 17:19:55.000000', '2022-03-08 17:19:55.000000');
INSERT INTO `sysuserrole` VALUES ('a9f8a23b-8c2f-43cc-97af-8ed6f4c4d097', '4fd6a740-0cf1-4975-62d6-08da00e3d8a0', '40ff1844-c099-4061-98e0-cd6e544fcfd3', '2022-03-08 17:14:13.000000', '2022-03-08 17:14:13.000000');
INSERT INTO `sysuserrole` VALUES ('ad5014f2-92e8-4109-9ca4-013a92390f8b', 'cc186fe2-ee27-4292-62db-08da00e3d8a0', '40ff1844-c099-4061-98e0-cd6e544fcfd3', '2022-03-08 17:20:20.000000', '2022-03-08 17:20:20.000000');
INSERT INTO `sysuserrole` VALUES ('ce9f61ac-79d8-426f-9066-36962c017bf6', '5722af0f-2366-4fc9-62d5-08da00e3d8a0', '40ff1844-c099-4061-98e0-cd6e544fcfd3', '2022-03-08 17:13:02.000000', '2022-03-08 17:13:02.000000');
INSERT INTO `sysuserrole` VALUES ('dbc656a6-4264-417d-97d8-577e1218feca', 'a3f9784c-5f00-4ec9-62d9-08da00e3d8a0', '40ff1844-c099-4061-98e0-cd6e544fcfd3', '2022-03-08 17:19:22.000000', '2022-03-08 17:19:22.000000');
INSERT INTO `sysuserrole` VALUES ('fa1fdf14-3847-4194-894c-cd935a3dd9e6', 'ac18f496-e93d-42f0-b59e-e321acc85335', '40ff1844-c099-4061-98e0-cd6e544fcfd3', '2022-03-08 10:13:35.000000', '2022-03-08 10:13:35.000000');

SET FOREIGN_KEY_CHECKS = 1;
