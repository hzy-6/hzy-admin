/*
 Navicat Premium Data Transfer

 Source Server         : 本地_MySql
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : hzy_admin_mysql_20221213

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 29/01/2023 20:35:20
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
INSERT INTO `__efmigrationshistory` VALUES ('20221219015312_mysql_init', '6.0.9');

-- ----------------------------
-- Table structure for flow
-- ----------------------------
DROP TABLE IF EXISTS `flow`;
CREATE TABLE `flow`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Number` int NULL DEFAULT NULL,
  `Code` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `CreatorUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `LastModifierUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow
-- ----------------------------

-- ----------------------------
-- Table structure for flow_approval
-- ----------------------------
DROP TABLE IF EXISTS `flow_approval`;
CREATE TABLE `flow_approval`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `UserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `UserName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `LaunchTime` datetime(6) NOT NULL,
  `FormId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `FlowId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `FlowCode` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `FlowName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `CreatorUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `LastModifierUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_approval
-- ----------------------------

-- ----------------------------
-- Table structure for flow_approval_step_history
-- ----------------------------
DROP TABLE IF EXISTS `flow_approval_step_history`;
CREATE TABLE `flow_approval_step_history`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Sort` int NOT NULL,
  `FlowNodeId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `FlowNodeName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `SortMore` int NOT NULL,
  `State` int NOT NULL,
  `Opinions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `UserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `UserName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ApprovalDate` datetime(6) NOT NULL,
  `CreatorUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `LastModifierUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_approval_step_history
-- ----------------------------

-- ----------------------------
-- Table structure for flow_approval_step_history_user
-- ----------------------------
DROP TABLE IF EXISTS `flow_approval_step_history_user`;
CREATE TABLE `flow_approval_step_history_user`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `FlowApprovalStepHistoryId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `FlowNodeId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `FlowNodeName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `UserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `UserName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `CreatorUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `LastModifierUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_approval_step_history_user
-- ----------------------------

-- ----------------------------
-- Table structure for flow_node
-- ----------------------------
DROP TABLE IF EXISTS `flow_node`;
CREATE TABLE `flow_node`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `FlowId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Sort` int NULL DEFAULT NULL,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `RoleId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `CreatorUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `LastModifierUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_node
-- ----------------------------

-- ----------------------------
-- Table structure for low_code_list
-- ----------------------------
DROP TABLE IF EXISTS `low_code_list`;
CREATE TABLE `low_code_list`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Low_Code_TableId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Low_Code_Table_InfoId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `ForeignKeyTableId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `ForeignKeyTableFieldName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `CreatorUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `LastModifierUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of low_code_list
-- ----------------------------

-- ----------------------------
-- Table structure for low_code_search
-- ----------------------------
DROP TABLE IF EXISTS `low_code_search`;
CREATE TABLE `low_code_search`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Low_Code_TableId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Low_Code_Table_InfoId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `CreatorUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `LastModifierUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of low_code_search
-- ----------------------------

-- ----------------------------
-- Table structure for low_code_table
-- ----------------------------
DROP TABLE IF EXISTS `low_code_table`;
CREATE TABLE `low_code_table`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `TableName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Schema` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Type` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `DisplayName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `EntityName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ProjectRootPath` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ModelPath` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ServicePath` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ControllerPath` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ClientIndexPath` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ClientInfoPath` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ClientServicePath` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `IsCover` tinyint(1) NULL DEFAULT NULL,
  `CreatorUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `LastModifierUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of low_code_table
-- ----------------------------
INSERT INTO `low_code_table` VALUES ('0a8bdb18-758a-4798-9ffc-e7031dcbf262', 'sys_post', 'dbo', 'TABLE', '岗位', 'SysPost', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 0, NULL, '2022-04-17 00:00:00.000000', NULL, '2022-08-01 20:32:25.000000');
INSERT INTO `low_code_table` VALUES ('18fbb18e-cb29-45d8-a5f3-c0121c57680a', 'flow_approval_step_history', 'dbo', 'TABLE', '', 'FlowApprovalStepHistory', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 0, NULL, '2022-07-29 00:00:00.000000', NULL, '2022-08-01 20:32:25.000000');
INSERT INTO `low_code_table` VALUES ('1a8df018-79f8-4e26-b4eb-4b735aae7275', 'flow', 'dbo', 'TABLE', '审批流', 'Flow', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 0, NULL, '2022-04-17 00:00:00.000000', NULL, '2022-08-01 20:32:25.000000');
INSERT INTO `low_code_table` VALUES ('2ae9e532-7d9a-474b-b629-50a39945c44d', 'sys_menu_function', 'dbo', 'TABLE', '菜单功能', 'SysMenuFunction', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 0, NULL, '2022-04-17 00:00:00.000000', NULL, '2022-08-01 20:32:25.000000');
INSERT INTO `low_code_table` VALUES ('3da5d264-2e8d-460c-a10c-ff9a6bb57a60', 'sys_user_role', 'dbo', 'TABLE', '用户与角色', 'SysUserRole', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 0, NULL, '2022-04-17 00:00:00.000000', NULL, '2022-08-01 20:32:25.000000');
INSERT INTO `low_code_table` VALUES ('524e71b4-cbf7-4248-8b29-3f99b43f2eb2', 'sys_data_authority_custom', 'dbo', 'TABLE', '自定义数据权限', 'SysDataAuthorityCustom', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 0, NULL, '2022-04-17 00:00:00.000000', NULL, '2022-08-01 20:32:25.000000');
INSERT INTO `low_code_table` VALUES ('60cceba1-28bf-4d1d-b603-4edf95d512b8', 'sys_operation_log', 'dbo', 'TABLE', '操作日志', 'SysOperationLog', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 0, NULL, '2022-04-17 00:00:00.000000', NULL, '2022-08-01 20:32:25.000000');
INSERT INTO `low_code_table` VALUES ('6323638b-a45f-4a76-886e-69a9e9be0901', 'sys_user', 'dbo', 'TABLE', '用户', 'SysUser', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 0, NULL, '2022-04-17 00:00:00.000000', NULL, '2022-08-01 20:32:25.000000');
INSERT INTO `low_code_table` VALUES ('651bb982-1130-4e1c-9070-36b90dcf2324', 'flow_approval_step', NULL, NULL, '工作流审批步骤配置', 'FlowApprovalStep', NULL, NULL, 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 0, NULL, '2022-04-17 00:00:00.000000', NULL, '2022-07-29 21:59:11.000000');
INSERT INTO `low_code_table` VALUES ('69b24f04-0ed3-45fc-91d9-0dc929175a57', 'sys_user_post', 'dbo', 'TABLE', '用户与岗位', 'SysUserPost', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 0, NULL, '2022-04-17 00:00:00.000000', NULL, '2022-08-01 20:32:25.000000');
INSERT INTO `low_code_table` VALUES ('69edd8a8-1d24-478c-a909-b82039edcec0', 'low_code_search', 'dbo', 'TABLE', '低代码检索表', 'LowCodeSearch', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 0, NULL, '2022-05-23 00:00:00.000000', NULL, '2022-08-01 20:32:25.000000');
INSERT INTO `low_code_table` VALUES ('6ba9805c-916e-4d2c-99d0-216fcbc361cc', 'low_code_table', 'dbo', 'TABLE', '低代码表', 'LowCodeTable', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 0, NULL, '2022-05-23 00:00:00.000000', NULL, '2022-08-01 20:32:25.000000');
INSERT INTO `low_code_table` VALUES ('6fabc67a-8b48-49a6-8ba1-c8a32c499d36', 'sys_function', 'dbo', 'TABLE', '功能', 'SysFunction', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 0, NULL, '2022-04-17 00:00:00.000000', NULL, '2022-08-01 20:32:25.000000');
INSERT INTO `low_code_table` VALUES ('73c97832-4e7f-4758-86d2-94327971b5fd', 'member', 'dbo', 'TABLE', '会员', 'Member', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 0, NULL, '2022-04-17 00:00:00.000000', NULL, '2022-08-01 20:32:25.000000');
INSERT INTO `low_code_table` VALUES ('79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 'low_code_table_info', 'dbo', 'TABLE', '低代码表信息', 'LowCodeTableInfo', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 0, NULL, '2022-05-23 00:00:00.000000', NULL, '2022-08-01 20:32:25.000000');
INSERT INTO `low_code_table` VALUES ('7ad3b915-f0bd-443a-89cd-42d41dd6c554', 'flow_approval_step_user', NULL, NULL, '工作流用户审批步骤', 'FlowApprovalStepUser', NULL, NULL, 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 0, NULL, '2022-04-17 00:00:00.000000', NULL, '2022-07-29 21:59:11.000000');
INSERT INTO `low_code_table` VALUES ('7f94e0db-fc63-40dc-bfe3-18c5aad75975', 'flow_approval_step_history_user', 'dbo', 'TABLE', '', 'FlowApprovalStepHistoryUser', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 0, NULL, '2022-07-29 00:00:00.000000', NULL, '2022-08-01 20:32:25.000000');
INSERT INTO `low_code_table` VALUES ('852f53ff-0d00-4c32-aa55-a9c11993751b', 'low_code_list', 'dbo', 'TABLE', '低代码列表', 'LowCodeList', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 0, NULL, '2022-05-23 00:00:00.000000', NULL, '2022-08-01 20:32:25.000000');
INSERT INTO `low_code_table` VALUES ('8da38d20-8a09-4e81-8dd8-ed6702aee380', 'sys_role_menu_function', 'dbo', 'TABLE', '角色菜单功能关联', 'SysRoleMenuFunction', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 0, NULL, '2022-04-17 00:00:00.000000', NULL, '2022-08-01 20:32:25.000000');
INSERT INTO `low_code_table` VALUES ('ae6d94d8-6a15-4348-b600-aa17e4b61718', 'flow_node', 'dbo', 'TABLE', '工作流节点', 'FlowNode', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 0, NULL, '2022-04-17 00:00:00.000000', NULL, '2022-08-01 20:32:25.000000');
INSERT INTO `low_code_table` VALUES ('af37f705-7ba0-4883-b1be-8a274ea4c026', 'sys_dictionary', 'dbo', 'TABLE', '数据字典', 'SysDictionary', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 0, NULL, '2022-04-17 00:00:00.000000', NULL, '2022-08-01 20:32:25.000000');
INSERT INTO `low_code_table` VALUES ('d2600250-6f32-4d7d-8395-96cc9fa36db4', 'sys_menu', 'dbo', 'TABLE', '菜单', 'SysMenu', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 0, NULL, '2022-04-17 00:00:00.000000', NULL, '2022-08-01 20:32:25.000000');
INSERT INTO `low_code_table` VALUES ('d26d07cb-158a-4cb2-8b20-5dfd5181af54', 'sys_organization', 'dbo', 'TABLE', '组织', 'SysOrganization', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 0, NULL, '2022-04-17 00:00:00.000000', NULL, '2022-08-01 20:32:25.000000');
INSERT INTO `low_code_table` VALUES ('d8948c56-c5bd-4061-b272-5417375f38f0', 'flow_approval', 'dbo', 'TABLE', '审批流审批', 'FlowApproval', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 0, NULL, '2022-04-17 00:00:00.000000', NULL, '2022-08-01 20:32:25.000000');
INSERT INTO `low_code_table` VALUES ('e79db53b-7162-4669-9b5e-f860501475ac', 'sys_data_authority', 'dbo', 'TABLE', '数据权限', 'SysDataAuthority', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 0, NULL, '2022-04-17 00:00:00.000000', NULL, '2022-08-01 20:32:25.000000');
INSERT INTO `low_code_table` VALUES ('f3d7bbb3-c1fb-4d61-92a4-9bc101811335', 'sys_role', 'dbo', 'TABLE', '角色', 'SysRole', NULL, 'HzyAdmin', 'hzy-admin-server/HZY.Models/Entities/App/', 'hzy-admin-server/HZY.Services.Admin/App/', 'hzy-admin-server/HZY.Controllers.Admin/App/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/views/app/', 'hzy-admin-client/src/service/app/', 0, NULL, '2022-04-17 00:00:00.000000', NULL, '2022-08-01 20:32:25.000000');

-- ----------------------------
-- Table structure for low_code_table_info
-- ----------------------------
DROP TABLE IF EXISTS `low_code_table_info`;
CREATE TABLE `low_code_table_info`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Low_Code_TableId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `IsPrimary` tinyint(1) NOT NULL,
  `IsIdentity` tinyint(1) NOT NULL,
  `IsNullable` tinyint(1) NOT NULL,
  `Position` int NOT NULL,
  `ColumnName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Describe` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `DatabaseColumnType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `CsType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `CsField` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `MaxLength` int NULL DEFAULT NULL,
  `DisplayName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `CreatorUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `LastModifierUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of low_code_table_info
-- ----------------------------
INSERT INTO `low_code_table_info` VALUES ('01ca178c-112a-4a49-d489-08da3d8d5a26', 'd8948c56-c5bd-4061-b272-5417375f38f0', 0, 0, 1, 33, 'CreationTime', '', 'datetime', 'DateTime', 'CreationTime', 8, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('022c287a-11e3-4234-3392-08da716a5c08', '18fbb18e-cb29-45d8-a5f3-c0121c57680a', 0, 0, 1, 28, 'UserName', '', 'nvarchar(MAX)', 'String', 'UserName', -1, '', NULL, '2022-07-29 21:58:05.000000', NULL, '2022-07-29 21:58:05.000000');
INSERT INTO `low_code_table_info` VALUES ('042a59e2-72c1-4c38-d52d-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 0, 0, 1, 140, 'ParentId', '', 'int', 'Int32', 'ParentId', NULL, NULL, NULL, '2022-05-24 00:00:00.000000', NULL, '2022-06-09 21:20:26.000000');
INSERT INTO `low_code_table_info` VALUES ('043612f1-e16a-4c44-d497-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 0, 0, 1, 42, 'LastModificationTime', '', 'datetime', 'DateTime', 'LastModificationTime', 8, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('063d44b8-6ce2-47a6-d51a-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 0, 0, 1, 9, 'Browser', '', 'varchar(255)', 'String', 'Browser', 255, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('06f4f5a9-f63f-4e47-d485-08da3d8d5a26', '1a8df018-79f8-4e26-b4eb-4b735aae7275', 0, 0, 1, 29, 'Name', '流程名称', 'nvarchar(255)', 'String', 'Name', 255, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('0888b15f-3bd2-4881-d523-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 0, 0, 0, 12, 'TakeUpTime', '接口耗时（毫秒）', 'bigint', 'Int64', 'TakeUpTime', 8, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('0aa2daab-50df-4397-d51c-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 0, 0, 1, 3, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', 6, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('0b45e9bb-b9f1-4a2f-d526-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 0, 0, 1, 142, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', NULL, NULL, NULL, '2022-05-24 00:00:00.000000', NULL, '2022-06-09 21:20:26.000000');
INSERT INTO `low_code_table_info` VALUES ('0cfc881c-98d4-4a2c-d4a5-08da3d8d5a26', '7ad3b915-f0bd-443a-89cd-42d41dd6c554', 0, 0, 1, 60, 'UserName', '审批人名称', 'varchar(500)', 'String', 'UserName', 500, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('0df6b078-b248-4c83-d4ab-08da3d8d5a26', 'ae6d94d8-6a15-4348-b600-aa17e4b61718', 0, 0, 1, 67, 'Name', '', 'nvarchar(255)', 'String', 'Name', 255, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('0e19400d-1876-4fe3-d4a7-08da3d8d5a26', 'ae6d94d8-6a15-4348-b600-aa17e4b61718', 0, 0, 1, 63, 'CreationTime', '', 'datetime', 'DateTime', 'CreationTime', 8, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('0e864b91-b667-4f53-d4a3-08da3d8d5a26', '7ad3b915-f0bd-443a-89cd-42d41dd6c554', 0, 0, 1, 54, 'LastModificationTime', '', 'datetime', 'DateTime', 'LastModificationTime', 8, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('0f908e1d-4a82-42c1-d4e8-08da3d8d5a26', 'e79db53b-7162-4669-9b5e-f860501475ac', 0, 0, 1, 86, 'PermissionType', '数据权限类型', 'int', 'Int32', 'PermissionType', 4, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('1121d642-49e8-4b25-d52b-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 0, 0, 1, 133, 'Name', '', 'nvarchar(255)', 'String', 'Name', NULL, '组织名称', NULL, '2022-05-24 00:00:00.000000', NULL, '2022-06-09 21:20:26.000000');
INSERT INTO `low_code_table_info` VALUES ('11afcf11-9b42-47ce-d4c5-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 0, 0, 1, 204, 'ColumnName', '', 'varchar(500)', 'String', 'ColumnName', 500, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('11f3d291-cf7a-4143-d52a-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 0, 0, 1, 135, 'LevelCode', '', 'varchar(50)', 'String', 'LevelCode', NULL, NULL, NULL, '2022-05-24 00:00:00.000000', NULL, '2022-06-09 21:20:26.000000');
INSERT INTO `low_code_table_info` VALUES ('1213c179-e366-4e3c-d540-08da3d8d5a26', '8da38d20-8a09-4e81-8dd8-ed6702aee380', 0, 0, 1, 163, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', 6, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('12e9e9ad-5631-4dc8-d503-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 0, 0, 1, 122, 'JumpUrl', '', 'varchar(255)', 'String', 'JumpUrl', 255, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('134c9f62-abd2-476e-d532-08da3d8d5a26', '0a8bdb18-758a-4798-9ffc-e7031dcbf262', 0, 0, 1, 150, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', 6, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('135e23db-540b-4096-d551-08da3d8d5a26', '69b24f04-0ed3-45fc-91d9-0dc929175a57', 0, 0, 1, 177, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', 6, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('13775de6-200d-43e0-244c-08da717dbcaa', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 0, 0, 1, 218, 'ServiceJsPath', '', 'varchar(50)', 'String', 'ServiceJsPath', 50, '', NULL, '2022-07-30 00:16:47.000000', NULL, '2022-07-30 00:16:47.000000');
INSERT INTO `low_code_table_info` VALUES ('158b1c2d-fa67-4696-244b-08da717dbcaa', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 0, 0, 1, 207, 'Schema', '', 'nvarchar(MAX)', 'String', 'Schema', -1, '', NULL, '2022-07-30 00:16:47.000000', NULL, '2022-07-30 00:16:47.000000');
INSERT INTO `low_code_table_info` VALUES ('1790b4d5-51b2-4dc0-d534-08da3d8d5a26', '0a8bdb18-758a-4798-9ffc-e7031dcbf262', 0, 0, 1, 146, 'Name', '', 'nvarchar(255)', 'String', 'Name', 255, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('18b4430b-765d-4a71-97b9-08da39a2ef6c', '3da5d264-2e8d-460c-a10c-ff9a6bb57a60', 0, 0, 1, 171, 'UserId', '', 'uniqueidentifier', 'Guid', 'UserId', NULL, NULL, NULL, '2022-05-19 00:00:00.000000', NULL, '2022-05-19 22:26:18.000000');
INSERT INTO `low_code_table_info` VALUES ('1916e619-4818-4c63-d50b-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 0, 0, 1, 118, 'Show', '', 'bit', 'Boolean', 'Show', 1, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('19a7504c-f740-4b49-d528-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 0, 0, 1, 141, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', NULL, NULL, NULL, '2022-05-24 00:00:00.000000', NULL, '2022-06-09 21:20:26.000000');
INSERT INTO `low_code_table_info` VALUES ('19fa02fe-fb8f-4631-d50e-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 0, 0, 1, 113, 'Url', '', 'nvarchar(255)', 'String', 'Url', NULL, NULL, NULL, '2022-05-24 00:00:00.000000', NULL, '2022-05-24 21:58:07.000000');
INSERT INTO `low_code_table_info` VALUES ('1a2a9e15-dc83-49e1-d4b9-08da3d8d5a26', '69edd8a8-1d24-478c-a909-b82039edcec0', 0, 0, 1, 188, 'Low_Code_Table_InfoId', '', 'uniqueidentifier', 'Guid', 'Low_Code_Table_InfoId', 16, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('1bd2134c-3a2a-4e1b-2446-08da717dbcaa', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 0, 0, 1, 219, 'IsCover', '', 'bit', 'Boolean', 'IsCover', 1, '', NULL, '2022-07-30 00:16:47.000000', NULL, '2022-07-30 00:16:47.000000');
INSERT INTO `low_code_table_info` VALUES ('1d3c8224-a3a5-4b88-d4cd-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 0, 0, 1, 200, 'IsPrimary', '', 'bit', 'Boolean', 'IsPrimary', 1, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('1d881e59-d88e-497f-d51e-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 0, 0, 1, 7, 'FormBody', 'json表单信息', 'varchar(MAX)', 'String', 'FormBody', -1, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('1e40d97a-49ee-4727-d4c6-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 0, 0, 1, 198, 'CreationTime', '', 'datetime', 'DateTime', 'CreationTime', 8, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('1fbf9cea-3e4c-401b-243f-08da717dbcaa', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 1, 0, 0, 203, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '', NULL, '2022-07-30 00:16:47.000000', NULL, '2022-07-30 00:16:47.000000');
INSERT INTO `low_code_table_info` VALUES ('2006ac52-bb49-4e41-d501-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 0, 0, 1, 109, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', NULL, NULL, NULL, '2022-05-24 00:00:00.000000', NULL, '2022-05-24 21:58:07.000000');
INSERT INTO `low_code_table_info` VALUES ('200ff922-513c-4b19-d519-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 0, 0, 1, 4, 'Api', '接口地址', 'varchar(500)', 'String', 'Api', 500, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('2029bb6d-a0f2-41de-97b8-08da39a2ef6c', '3da5d264-2e8d-460c-a10c-ff9a6bb57a60', 0, 0, 1, 172, 'RoleId', '', 'uniqueidentifier', 'Guid', 'RoleId', NULL, NULL, NULL, '2022-05-19 00:00:00.000000', NULL, '2022-05-19 22:26:18.000000');
INSERT INTO `low_code_table_info` VALUES ('22527fe7-bd5c-4e6c-3389-08da716a5c08', '18fbb18e-cb29-45d8-a5f3-c0121c57680a', 0, 0, 0, 31, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', 8, '', NULL, '2022-07-29 21:58:05.000000', NULL, '2022-07-29 21:58:05.000000');
INSERT INTO `low_code_table_info` VALUES ('2286c948-4f0d-4b66-d535-08da3d8d5a26', '0a8bdb18-758a-4798-9ffc-e7031dcbf262', 0, 0, 1, 144, 'Number', '', 'int', 'Int32', 'Number', 4, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('2321aac8-0eed-4b87-d4ac-08da3d8d5a26', 'ae6d94d8-6a15-4348-b600-aa17e4b61718', 0, 0, 1, 69, 'Remark', '', 'nvarchar(255)', 'String', 'Remark', 255, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('2341dcb1-8056-4a7c-d4eb-08da3d8d5a26', '524e71b4-cbf7-4248-8b29-3f99b43f2eb2', 0, 0, 1, 89, 'CreationTime', '', 'datetime', 'DateTime', 'CreationTime', 8, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('235b67f8-62d2-480e-d508-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 0, 0, 1, 111, 'Number', '编号', 'int', 'Int32', 'Number', NULL, NULL, NULL, '2022-05-24 00:00:00.000000', NULL, '2022-05-24 21:58:07.000000');
INSERT INTO `low_code_table_info` VALUES ('24db7ed8-1a4f-4b25-d49d-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 0, 0, 1, 51, 'UserName', '步骤审批人名称', 'varchar(255)', 'String', 'UserName', 255, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('252ac7b2-0e62-48e1-97b7-08da39a2ef6c', '3da5d264-2e8d-460c-a10c-ff9a6bb57a60', 0, 0, 1, 173, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', NULL, NULL, NULL, '2022-05-19 00:00:00.000000', NULL, '2022-05-19 22:26:18.000000');
INSERT INTO `low_code_table_info` VALUES ('26f16d3d-9c42-4f86-244e-08da717dbcaa', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 0, 0, 1, 206, 'TableName', '', 'nvarchar(MAX)', 'String', 'TableName', -1, '', NULL, '2022-07-30 00:16:47.000000', NULL, '2022-07-30 00:16:47.000000');
INSERT INTO `low_code_table_info` VALUES ('2819dfe7-f12b-483c-d4a6-08da3d8d5a26', 'ae6d94d8-6a15-4348-b600-aa17e4b61718', 1, 0, 0, 61, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('287314b2-3141-4957-d548-08da3d8d5a26', '6323638b-a45f-4a76-886e-69a9e9be0901', 0, 0, 0, 171, 'Email', '', 'nvarchar(255)', 'String', 'Email', NULL, '电子邮箱', NULL, '2022-05-24 00:00:00.000000', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-07 11:06:31.000000');
INSERT INTO `low_code_table_info` VALUES ('29b765bd-36f4-462f-d4f3-08da3d8d5a26', 'af37f705-7ba0-4883-b1be-8a274ea4c026', 0, 0, 1, 98, 'Name', '分组名/键', 'varchar(255)', 'String', 'Name', 255, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('29d08351-9091-4c91-d514-08da3d8d5a26', '2ae9e532-7d9a-474b-b629-50a39945c44d', 0, 0, 1, 128, 'MenuId', '', 'int', 'Int32', 'MenuId', 4, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('2a1c3f3d-4efc-472b-d49a-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 0, 0, 1, 47, 'SortMore', '多次审批顺序号（可能是多次审批次数）', 'int', 'Int32', 'SortMore', 4, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('2ae91c1d-d618-4267-d4b3-08da3d8d5a26', '852f53ff-0d00-4c32-aa55-a9c11993751b', 0, 0, 1, 190, 'LastModificationTime', '', 'datetime', 'DateTime', 'LastModificationTime', 8, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('2b4747ed-0409-4d14-d48b-08da3d8d5a26', 'd8948c56-c5bd-4061-b272-5417375f38f0', 0, 0, 1, 38, 'FlowId', '流程Id', 'uniqueidentifier', 'Guid', 'FlowId', 16, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('2ca9aa7e-321e-47f0-d4f0-08da3d8d5a26', 'af37f705-7ba0-4883-b1be-8a274ea4c026', 0, 0, 1, 94, 'CreationTime', '创建时间', 'datetime', 'DateTime', 'CreationTime', 8, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('2ffaa9ee-c286-4f90-d495-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 0, 0, 1, 45, 'FlowNodeId', '审批流节点Id', 'uniqueidentifier', 'Guid', 'FlowNodeId', 16, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('3051fb7c-f075-4d91-2443-08da717dbcaa', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 0, 0, 1, 210, 'EntityName', '', 'nvarchar(MAX)', 'String', 'EntityName', -1, '', NULL, '2022-07-30 00:16:47.000000', NULL, '2022-07-30 00:16:47.000000');
INSERT INTO `low_code_table_info` VALUES ('3071360b-c1ef-4dff-d48f-08da3d8d5a26', 'd8948c56-c5bd-4061-b272-5417375f38f0', 0, 0, 1, 36, 'LaunchTime', '发起时间', 'datetime', 'DateTime', 'LaunchTime', 8, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('3133985d-586c-4c4e-d4ff-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 0, 0, 1, 119, 'Close', '', 'bit', 'Boolean', 'Close', 1, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('325af03c-cbb7-4de6-d4ee-08da3d8d5a26', '524e71b4-cbf7-4248-8b29-3f99b43f2eb2', 0, 0, 0, 91, 'SysOrganizationId', '', 'int', 'Int32', 'SysOrganizationId', 4, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('3b959124-21d2-45b9-d4ca-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 0, 0, 1, 205, 'Describe', '', 'varchar(50)', 'String', 'Describe', 50, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('3d9c98e4-2ac7-40fd-3391-08da716a5c08', '18fbb18e-cb29-45d8-a5f3-c0121c57680a', 0, 0, 0, 27, 'UserId', '', 'uniqueidentifier', 'Guid', 'UserId', 16, '', NULL, '2022-07-29 21:58:05.000000', NULL, '2022-07-29 21:58:05.000000');
INSERT INTO `low_code_table_info` VALUES ('3f7e43c9-762f-48ea-d53a-08da3d8d5a26', 'f3d7bbb3-c1fb-4d61-92a4-9bc101811335', 0, 0, 1, 157, 'DeleteLock', '', 'bit', 'Boolean', 'DeleteLock', 1, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('42430604-7090-442d-d539-08da3d8d5a26', 'f3d7bbb3-c1fb-4d61-92a4-9bc101811335', 0, 0, 1, 153, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', 6, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('4467bf43-6e95-4798-d522-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 0, 0, 1, 8, 'QueryString', '地址栏信息', 'varchar(MAX)', 'String', 'QueryString', -1, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('46bac66f-3cf0-46b3-d546-08da3d8d5a26', '6323638b-a45f-4a76-886e-69a9e9be0901', 0, 0, 1, 166, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', NULL, '创建时间', NULL, '2022-05-24 00:00:00.000000', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-07 11:06:31.000000');
INSERT INTO `low_code_table_info` VALUES ('4736479f-6089-4141-d521-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 0, 0, 1, 10, 'OS', '', 'varchar(255)', 'String', 'OS', 255, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('48b12860-84de-4f7b-d4c9-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 0, 0, 1, 206, 'DatabaseColumnType', '', 'varchar(50)', 'String', 'DatabaseColumnType', 50, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('495fe86e-5bd6-44d4-d4a1-08da3d8d5a26', '7ad3b915-f0bd-443a-89cd-42d41dd6c554', 0, 0, 1, 57, 'FlowNodeId', '审批节点Id', 'uniqueidentifier', 'Guid', 'FlowNodeId', 16, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('498327eb-5676-4091-d4fe-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 1, 1, 0, 107, 'Id', '', 'int', 'Int32', 'Id', NULL, NULL, NULL, '2022-05-24 00:00:00.000000', NULL, '2022-05-24 21:58:07.000000');
INSERT INTO `low_code_table_info` VALUES ('4aaa1e18-8c06-4806-d4d1-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 0, 0, 1, 203, 'Position', '', 'int', 'Int32', 'Position', 4, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('4b5bc027-5663-463a-d54b-08da3d8d5a26', '6323638b-a45f-4a76-886e-69a9e9be0901', 0, 0, 1, 167, 'Name', '', 'nvarchar(255)', 'String', 'Name', NULL, '用户名称', NULL, '2022-05-24 00:00:00.000000', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-07 11:06:31.000000');
INSERT INTO `low_code_table_info` VALUES ('4c479d54-530f-4652-d552-08da3d8d5a26', '69b24f04-0ed3-45fc-91d9-0dc929175a57', 0, 0, 1, 176, 'PostId', '', 'uniqueidentifier', 'Guid', 'PostId', 16, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('50b6b2fc-3e73-457c-338b-08da716a5c08', '18fbb18e-cb29-45d8-a5f3-c0121c57680a', 0, 0, 1, 23, 'FlowNodeName', '', 'nvarchar(MAX)', 'String', 'FlowNodeName', -1, '', NULL, '2022-07-29 21:58:05.000000', NULL, '2022-07-29 21:58:05.000000');
INSERT INTO `low_code_table_info` VALUES ('517cbfe0-275d-4f36-d53b-08da3d8d5a26', 'f3d7bbb3-c1fb-4d61-92a4-9bc101811335', 0, 0, 1, 152, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', 6, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('51d2eb90-7ab9-4763-3387-08da716a5c08', '18fbb18e-cb29-45d8-a5f3-c0121c57680a', 1, 0, 0, 20, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '', NULL, '2022-07-29 21:58:05.000000', NULL, '2022-07-29 21:58:05.000000');
INSERT INTO `low_code_table_info` VALUES ('5257ad4f-589d-40d0-d533-08da3d8d5a26', '0a8bdb18-758a-4798-9ffc-e7031dcbf262', 0, 0, 1, 149, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', 6, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('54a0ed42-104e-4e2a-2445-08da717dbcaa', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 0, 0, 1, 217, 'InfoVuePath', '', 'varchar(50)', 'String', 'InfoVuePath', 50, '', NULL, '2022-07-30 00:16:47.000000', NULL, '2022-07-30 00:16:47.000000');
INSERT INTO `low_code_table_info` VALUES ('5541e535-7cbe-43d2-d4d4-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 0, 0, 1, 80, 'CreationTime', '创建时间', 'datetime2', 'DateTime', 'CreationTime', NULL, '创建时间', NULL, '2022-05-24 00:00:00.000000', NULL, '2022-06-08 21:20:04.000000');
INSERT INTO `low_code_table_info` VALUES ('564a907b-1f47-4849-d537-08da3d8d5a26', '0a8bdb18-758a-4798-9ffc-e7031dcbf262', 0, 0, 1, 147, 'State', '', 'int', 'Int32', 'State', 4, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('585e18ea-ab50-4216-d4b5-08da3d8d5a26', '852f53ff-0d00-4c32-aa55-a9c11993751b', 0, 0, 1, 192, 'Low_Code_TableId', '', 'uniqueidentifier', 'Guid', 'Low_Code_TableId', 16, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('59cfb48c-8d3f-43d7-244f-08da717dbcaa', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 0, 0, 1, 208, 'Type', '', 'nvarchar(MAX)', 'String', 'Type', -1, '', NULL, '2022-07-30 00:16:47.000000', NULL, '2022-07-30 00:16:47.000000');
INSERT INTO `low_code_table_info` VALUES ('59f5d993-e502-4fee-3393-08da716a5c08', '7f94e0db-fc63-40dc-bfe3-18c5aad75975', 1, 0, 0, 32, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, '', NULL, '2022-07-29 21:58:05.000000', NULL, '2022-07-29 21:58:05.000000');
INSERT INTO `low_code_table_info` VALUES ('5a9fa990-b6d6-445f-d54c-08da3d8d5a26', '6323638b-a45f-4a76-886e-69a9e9be0901', 0, 0, 1, 173, 'OrganizationId', '', 'int', 'Int32', 'OrganizationId', NULL, '组织id', NULL, '2022-05-24 00:00:00.000000', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-07 11:06:31.000000');
INSERT INTO `low_code_table_info` VALUES ('5aa598a9-6e52-4ae4-d50a-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 0, 0, 1, 114, 'Router', '', 'nvarchar(255)', 'String', 'Router', NULL, NULL, NULL, '2022-05-24 00:00:00.000000', NULL, '2022-05-24 21:58:07.000000');
INSERT INTO `low_code_table_info` VALUES ('5aed3feb-3d77-4e1e-d52c-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 0, 0, 1, 134, 'OrderNumber', '', 'int', 'Int32', 'OrderNumber', NULL, NULL, NULL, '2022-05-24 00:00:00.000000', NULL, '2022-06-09 21:20:26.000000');
INSERT INTO `low_code_table_info` VALUES ('5bcf7406-75cc-4171-d545-08da3d8d5a26', '6323638b-a45f-4a76-886e-69a9e9be0901', 1, 0, 0, 164, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', NULL, NULL, NULL, '2022-05-24 00:00:00.000000', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-07 11:06:31.000000');
INSERT INTO `low_code_table_info` VALUES ('5ca84ecf-5971-45bc-d4a8-08da3d8d5a26', 'ae6d94d8-6a15-4348-b600-aa17e4b61718', 0, 0, 1, 65, 'FlowCode', '', 'nvarchar(255)', 'String', 'FlowCode', 255, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('5cb41f1c-e68a-47f9-d486-08da3d8d5a26', '1a8df018-79f8-4e26-b4eb-4b735aae7275', 0, 0, 1, 27, 'Number', '排序号', 'int', 'Int32', 'Number', 4, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('5f5c2997-daa8-491c-d51d-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 0, 0, 1, 6, 'Form', '表单信息', 'varchar(MAX)', 'String', 'Form', -1, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('5f9a4a78-1bb9-4592-d536-08da3d8d5a26', '0a8bdb18-758a-4798-9ffc-e7031dcbf262', 0, 0, 1, 148, 'Remarks', '', 'nvarchar(255)', 'String', 'Remarks', 255, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('5fc01eb0-4833-4e93-d483-08da3d8d5a26', '1a8df018-79f8-4e26-b4eb-4b735aae7275', 0, 0, 1, 26, 'CreationTime', '', 'datetime', 'DateTime', 'CreationTime', 8, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('5fea8348-aa6b-4577-d4cc-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 0, 0, 1, 202, 'IsNullable', '', 'bit', 'Boolean', 'IsNullable', 1, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('60019cd9-49eb-489b-97b5-08da39a2ef6c', '3da5d264-2e8d-460c-a10c-ff9a6bb57a60', 1, 0, 0, 170, 'Id', 'Id', 'uniqueidentifier', 'Guid', 'Id', NULL, NULL, NULL, '2022-05-19 00:00:00.000000', NULL, '2022-05-19 22:26:18.000000');
INSERT INTO `low_code_table_info` VALUES ('609a52aa-48b2-4e64-d48e-08da3d8d5a26', 'd8948c56-c5bd-4061-b272-5417375f38f0', 0, 0, 1, 32, 'LastModificationTime', '', 'datetime', 'DateTime', 'LastModificationTime', 8, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('6284c929-4115-4c17-d491-08da3d8d5a26', 'd8948c56-c5bd-4061-b272-5417375f38f0', 0, 0, 1, 35, 'UserName', '发起人', 'varchar(255)', 'String', 'UserName', 255, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('6304e602-84a1-4c57-d4ec-08da3d8d5a26', '524e71b4-cbf7-4248-8b29-3f99b43f2eb2', 0, 0, 1, 88, 'LastModificationTime', '', 'datetime', 'DateTime', 'LastModificationTime', 8, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('643c3aa6-d639-46bd-339a-08da716a5c08', '7f94e0db-fc63-40dc-bfe3-18c5aad75975', 0, 0, 1, 37, 'UserName', '', 'nvarchar(MAX)', 'String', 'UserName', -1, '', NULL, '2022-07-29 21:58:05.000000', NULL, '2022-07-29 21:58:05.000000');
INSERT INTO `low_code_table_info` VALUES ('646614d9-d7f3-42c5-d4fd-08da3d8d5a26', '6fabc67a-8b48-49a6-8ba1-c8a32c499d36', 0, 0, 1, 104, 'Remark', '', 'nvarchar(255)', 'String', 'Remark', 255, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('66718de6-5c1a-4229-d524-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 0, 0, 1, 11, 'UserId', '当前操作人id', 'uniqueidentifier', 'Guid', 'UserId', 16, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('669b87ce-c694-4c8c-d4da-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 0, 0, 1, 73, 'Phone', '', 'nvarchar(255)', 'String', 'Phone', NULL, '联系电话', NULL, '2022-05-24 00:00:00.000000', NULL, '2022-06-08 21:20:04.000000');
INSERT INTO `low_code_table_info` VALUES ('69875823-326c-4e13-d538-08da3d8d5a26', 'f3d7bbb3-c1fb-4d61-92a4-9bc101811335', 1, 0, 0, 151, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('6aa13b8f-1e3c-4750-d530-08da3d8d5a26', '0a8bdb18-758a-4798-9ffc-e7031dcbf262', 1, 0, 0, 143, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('6c3bb548-aafc-4f16-d50d-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 0, 0, 1, 123, 'Type', '', 'int', 'Int32', 'Type', 4, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('6c934348-be20-4c9e-d542-08da3d8d5a26', '8da38d20-8a09-4e81-8dd8-ed6702aee380', 0, 0, 1, 161, 'MenuFunctionId', '', 'uniqueidentifier', 'Guid', 'MenuFunctionId', 16, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('6cfe3b57-006f-436b-d511-08da3d8d5a26', '2ae9e532-7d9a-474b-b629-50a39945c44d', 0, 0, 1, 129, 'FunctionCode', '', 'varchar(100)', 'String', 'FunctionCode', 100, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('6e69cf9b-d9cd-4c31-d4f4-08da3d8d5a26', 'af37f705-7ba0-4883-b1be-8a274ea4c026', 0, 0, 1, 99, 'ParentId', '父级分组id', 'int', 'Int32', 'ParentId', 4, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('70e30a70-99f9-44b3-d482-08da3d8d5a26', '1a8df018-79f8-4e26-b4eb-4b735aae7275', 0, 0, 1, 28, 'Code', '编码', 'nvarchar(255)', 'String', 'Code', 255, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('7211aea6-eb91-41e5-d505-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 0, 0, 1, 108, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', NULL, NULL, NULL, '2022-05-24 00:00:00.000000', NULL, '2022-05-24 21:58:07.000000');
INSERT INTO `low_code_table_info` VALUES ('72ac247c-d792-4fee-d4dc-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 0, 0, 1, 74, 'Sex', '', 'nvarchar(255)', 'String', 'Sex', NULL, '性别', NULL, '2022-05-24 00:00:00.000000', NULL, '2022-06-08 21:20:04.000000');
INSERT INTO `low_code_table_info` VALUES ('73d17476-e006-4530-d4ad-08da3d8d5a26', 'ae6d94d8-6a15-4348-b600-aa17e4b61718', 0, 0, 1, 68, 'RoleId', '', 'uniqueidentifier', 'Guid', 'RoleId', 16, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('743d6eab-b4c8-4a15-d4f8-08da3d8d5a26', '6fabc67a-8b48-49a6-8ba1-c8a32c499d36', 0, 0, 1, 103, 'ByName', '', 'nvarchar(255)', 'String', 'ByName', 255, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('7485deed-e9e8-4aa6-338a-08da716a5c08', '18fbb18e-cb29-45d8-a5f3-c0121c57680a', 0, 0, 0, 22, 'FlowNodeId', '', 'uniqueidentifier', 'Guid', 'FlowNodeId', 16, '', NULL, '2022-07-29 21:58:05.000000', NULL, '2022-07-29 21:58:05.000000');
INSERT INTO `low_code_table_info` VALUES ('78757b0d-d9ee-45ea-d500-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 0, 0, 1, 115, 'ComponentName', '', 'nvarchar(255)', 'String', 'ComponentName', NULL, NULL, NULL, '2022-05-24 00:00:00.000000', NULL, '2022-05-24 21:58:07.000000');
INSERT INTO `low_code_table_info` VALUES ('79d371fb-b37a-4d32-3390-08da716a5c08', '18fbb18e-cb29-45d8-a5f3-c0121c57680a', 0, 0, 0, 25, 'State', '', 'int', 'Int32', 'State', 4, '', NULL, '2022-07-29 21:58:05.000000', NULL, '2022-07-29 21:58:05.000000');
INSERT INTO `low_code_table_info` VALUES ('7b4df31f-36a3-477c-d4ba-08da3d8d5a26', '69edd8a8-1d24-478c-a909-b82039edcec0', 0, 0, 1, 187, 'Low_Code_TableId', '', 'uniqueidentifier', 'Guid', 'Low_Code_TableId', 16, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('7b6df0cd-c31b-4508-d53f-08da3d8d5a26', '8da38d20-8a09-4e81-8dd8-ed6702aee380', 1, 0, 0, 158, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('7b900baf-65df-4910-d4b1-08da3d8d5a26', '852f53ff-0d00-4c32-aa55-a9c11993751b', 0, 0, 1, 195, 'ForeignKeyTableFieldName', '', 'varchar(50)', 'String', 'ForeignKeyTableFieldName', 50, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('7c7400ed-ec08-4832-d4b6-08da3d8d5a26', '69edd8a8-1d24-478c-a909-b82039edcec0', 1, 0, 0, 184, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('7cbe8988-cbac-4ea2-d54a-08da3d8d5a26', '6323638b-a45f-4a76-886e-69a9e9be0901', 0, 0, 1, 168, 'LoginName', '', 'nvarchar(255)', 'String', 'LoginName', NULL, '登录名称', NULL, '2022-05-24 00:00:00.000000', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-07 11:06:31.000000');
INSERT INTO `low_code_table_info` VALUES ('7ec46123-3852-4b62-2440-08da717dbcaa', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 0, 0, 1, 215, 'ControllerPath', '', 'varchar(50)', 'String', 'ControllerPath', 50, '', NULL, '2022-07-30 00:16:47.000000', NULL, '2022-07-30 00:16:47.000000');
INSERT INTO `low_code_table_info` VALUES ('803c2d4b-4a80-43b0-244a-08da717dbcaa', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 0, 0, 1, 211, 'Remark', '', 'nvarchar(MAX)', 'String', 'Remark', -1, '', NULL, '2022-07-30 00:16:47.000000', NULL, '2022-07-30 00:16:47.000000');
INSERT INTO `low_code_table_info` VALUES ('8237d289-05cf-485b-d4b8-08da3d8d5a26', '69edd8a8-1d24-478c-a909-b82039edcec0', 0, 0, 1, 185, 'LastModificationTime', '', 'datetime', 'DateTime', 'LastModificationTime', 8, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('825e69b9-cd33-4ab8-97b6-08da39a2ef6c', '3da5d264-2e8d-460c-a10c-ff9a6bb57a60', 0, 0, 1, 174, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', NULL, NULL, NULL, '2022-05-19 00:00:00.000000', NULL, '2022-05-19 22:26:18.000000');
INSERT INTO `low_code_table_info` VALUES ('82ee25d2-4e01-4100-d4f9-08da3d8d5a26', '6fabc67a-8b48-49a6-8ba1-c8a32c499d36', 0, 0, 1, 106, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', 6, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('8326ca11-09f1-4c38-d4d6-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 0, 0, 1, 77, 'Introduce', '', 'nvarchar(255)', 'String', 'Introduce', NULL, '简介', NULL, '2022-05-24 00:00:00.000000', NULL, '2022-06-08 21:20:04.000000');
INSERT INTO `low_code_table_info` VALUES ('837b058b-a88e-4107-d4dd-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 0, 0, 1, 79, 'UserId', '所属用户', 'uniqueidentifier', 'Guid', 'UserId', NULL, '所属用户', NULL, '2022-05-24 00:00:00.000000', NULL, '2022-06-08 21:20:04.000000');
INSERT INTO `low_code_table_info` VALUES ('84a87e33-8b66-4b9a-d4f5-08da3d8d5a26', 'af37f705-7ba0-4883-b1be-8a274ea4c026', 0, 0, 1, 95, 'Sort', '排序号', 'int', 'Int32', 'Sort', 4, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('86b95bf0-4418-46ba-d4cb-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 0, 0, 1, 201, 'IsIdentity', '', 'bit', 'Boolean', 'IsIdentity', 1, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('897a208c-2e13-46f1-d4d7-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 0, 0, 1, 81, 'LastModificationTime', '更新时间', 'datetime2', 'DateTime', 'LastModificationTime', NULL, '更新时间', NULL, '2022-05-24 00:00:00.000000', NULL, '2022-06-08 21:20:04.000000');
INSERT INTO `low_code_table_info` VALUES ('8ad408db-b5aa-4cb7-d494-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 0, 0, 1, 43, 'CreationTime', '', 'datetime', 'DateTime', 'CreationTime', 8, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('8e5f9439-6b90-423a-2447-08da717dbcaa', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 0, 0, 0, 204, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', 8, '', NULL, '2022-07-30 00:16:47.000000', NULL, '2022-07-30 00:16:47.000000');
INSERT INTO `low_code_table_info` VALUES ('8f107c7c-e4f5-4647-338f-08da716a5c08', '18fbb18e-cb29-45d8-a5f3-c0121c57680a', 0, 0, 0, 24, 'SortMore', '', 'int', 'Int32', 'SortMore', 4, '', NULL, '2022-07-29 21:58:05.000000', NULL, '2022-07-29 21:58:05.000000');
INSERT INTO `low_code_table_info` VALUES ('9059bf44-23a0-4e12-3399-08da716a5c08', '7f94e0db-fc63-40dc-bfe3-18c5aad75975', 0, 0, 0, 36, 'UserId', '', 'uniqueidentifier', 'Guid', 'UserId', 16, '', NULL, '2022-07-29 21:58:05.000000', NULL, '2022-07-29 21:58:05.000000');
INSERT INTO `low_code_table_info` VALUES ('92bc9094-160e-4338-d4a4-08da3d8d5a26', '7ad3b915-f0bd-443a-89cd-42d41dd6c554', 0, 0, 1, 59, 'UserId', '审批人Id', 'uniqueidentifier', 'Guid', 'UserId', 16, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('92c1fffc-5a00-468c-d4b0-08da3d8d5a26', '852f53ff-0d00-4c32-aa55-a9c11993751b', 0, 0, 1, 191, 'CreationTime', '', 'datetime', 'DateTime', 'CreationTime', 8, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('95414873-486d-4609-338e-08da716a5c08', '18fbb18e-cb29-45d8-a5f3-c0121c57680a', 0, 0, 0, 21, 'Sort', '', 'int', 'Int32', 'Sort', 4, '', NULL, '2022-07-29 21:58:05.000000', NULL, '2022-07-29 21:58:05.000000');
INSERT INTO `low_code_table_info` VALUES ('97284d66-88b9-478f-d4e5-08da3d8d5a26', 'e79db53b-7162-4669-9b5e-f860501475ac', 1, 0, 0, 82, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('9a050102-6300-46ef-d516-08da3d8d5a26', '2ae9e532-7d9a-474b-b629-50a39945c44d', 0, 0, 1, 131, 'Remark', '', 'varchar(100)', 'String', 'Remark', 100, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('9a850f29-2dd2-4779-d4f6-08da3d8d5a26', 'af37f705-7ba0-4883-b1be-8a274ea4c026', 0, 0, 1, 97, 'Value', '值', 'varchar(255)', 'String', 'Value', 255, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('9b1b319a-e9dc-406d-d4c4-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 1, 0, 0, 196, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('9bc385e0-10ee-4299-d4a9-08da3d8d5a26', 'ae6d94d8-6a15-4348-b600-aa17e4b61718', 0, 0, 1, 64, 'FlowId', '', 'uniqueidentifier', 'Guid', 'FlowId', 16, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('9c4158f4-b5b5-4928-d50f-08da3d8d5a26', '2ae9e532-7d9a-474b-b629-50a39945c44d', 1, 0, 0, 124, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('9c9f9672-3fa0-4c65-d4e9-08da3d8d5a26', 'e79db53b-7162-4669-9b5e-f860501475ac', 0, 0, 1, 85, 'RoleId', '', 'uniqueidentifier', 'Guid', 'RoleId', 16, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('9de60dd7-a403-442d-d4e7-08da3d8d5a26', 'e79db53b-7162-4669-9b5e-f860501475ac', 0, 0, 1, 83, 'LastModificationTime', '', 'datetime', 'DateTime', 'LastModificationTime', 8, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('a06381ef-e532-4b7a-2442-08da717dbcaa', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 0, 0, 1, 209, 'DisplayName', '', 'nvarchar(MAX)', 'String', 'DisplayName', -1, '', NULL, '2022-07-30 00:16:47.000000', NULL, '2022-07-30 00:16:47.000000');
INSERT INTO `low_code_table_info` VALUES ('a0fdeb45-c9fe-439b-d48a-08da3d8d5a26', 'd8948c56-c5bd-4061-b272-5417375f38f0', 0, 0, 1, 39, 'FlowCode', '流程编码', 'varchar(255)', 'String', 'FlowCode', 255, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('a2660342-556e-4aef-d4b4-08da3d8d5a26', '852f53ff-0d00-4c32-aa55-a9c11993751b', 0, 0, 1, 193, 'Low_Code_Table_InfoId', '', 'uniqueidentifier', 'Guid', 'Low_Code_Table_InfoId', 16, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('a29e0236-9c06-4a70-d4b7-08da3d8d5a26', '69edd8a8-1d24-478c-a909-b82039edcec0', 0, 0, 1, 186, 'CreationTime', '', 'datetime', 'DateTime', 'CreationTime', 8, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('a61101b5-8e66-4456-d4fa-08da3d8d5a26', '6fabc67a-8b48-49a6-8ba1-c8a32c499d36', 0, 0, 1, 105, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', 6, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('a62bb184-93b0-40e3-d51b-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 0, 0, 1, 13, 'ControllerDisplayName', '', 'varchar(255)', 'String', 'ControllerDisplayName', 255, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('a6752bd9-f3d6-451f-d547-08da3d8d5a26', '6323638b-a45f-4a76-886e-69a9e9be0901', 0, 0, 1, 172, 'DeleteLock', '', 'bit', 'Boolean', 'DeleteLock', NULL, '删除锁', NULL, '2022-05-24 00:00:00.000000', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-07 11:06:31.000000');
INSERT INTO `low_code_table_info` VALUES ('a7263191-1e30-42c5-3396-08da716a5c08', '7f94e0db-fc63-40dc-bfe3-18c5aad75975', 0, 0, 0, 34, 'FlowNodeId', '', 'uniqueidentifier', 'Guid', 'FlowNodeId', 16, '', NULL, '2022-07-29 21:58:05.000000', NULL, '2022-07-29 21:58:05.000000');
INSERT INTO `low_code_table_info` VALUES ('a72c0341-82e8-48ad-d481-08da3d8d5a26', '1a8df018-79f8-4e26-b4eb-4b735aae7275', 1, 0, 0, 24, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('a8be7873-7ce4-4cb2-d498-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 0, 0, 1, 49, 'OpinIons', '步骤审批意见', 'varchar(255)', 'String', 'OpinIons', 255, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('a908815c-c0e6-4565-d512-08da3d8d5a26', '2ae9e532-7d9a-474b-b629-50a39945c44d', 0, 0, 1, 130, 'FunctionName', '', 'varchar(100)', 'String', 'FunctionName', 100, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('a932f1ce-a55a-480b-d520-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 0, 0, 1, 2, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', 6, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('a9766bbb-21bf-46da-d54f-08da3d8d5a26', '69b24f04-0ed3-45fc-91d9-0dc929175a57', 1, 0, 0, 174, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('aaa312a2-73fb-4c84-d496-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 0, 0, 1, 46, 'FlowNodeName', '审批流节点名称', 'varchar(255)', 'String', 'FlowNodeName', 255, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('aaa5fae3-8c5b-4427-d4fb-08da3d8d5a26', '6fabc67a-8b48-49a6-8ba1-c8a32c499d36', 0, 0, 1, 102, 'Name', '', 'nvarchar(255)', 'String', 'Name', 255, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('aaecfda3-f48d-4cd5-244d-08da717dbcaa', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 0, 0, 1, 214, 'ServicePath', '', 'varchar(50)', 'String', 'ServicePath', 50, '', NULL, '2022-07-30 00:16:47.000000', NULL, '2022-07-30 00:16:47.000000');
INSERT INTO `low_code_table_info` VALUES ('ab5c0b3d-8871-42fd-d4f1-08da3d8d5a26', 'af37f705-7ba0-4883-b1be-8a274ea4c026', 0, 1, 0, 92, 'Id', 'id', 'int', 'Int32', 'Id', 4, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('aba55ad7-7153-4658-d4f2-08da3d8d5a26', 'af37f705-7ba0-4883-b1be-8a274ea4c026', 0, 0, 1, 93, 'LastModificationTime', '更新时间', 'datetime', 'DateTime', 'LastModificationTime', 8, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('acf079d0-3db9-43f7-d490-08da3d8d5a26', 'd8948c56-c5bd-4061-b272-5417375f38f0', 0, 0, 1, 34, 'UserId', '发起人Id', 'uniqueidentifier', 'Guid', 'UserId', 16, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('ae55fabc-3944-4a36-d49f-08da3d8d5a26', '7ad3b915-f0bd-443a-89cd-42d41dd6c554', 0, 0, 1, 55, 'CreationTime', '', 'datetime', 'DateTime', 'CreationTime', 8, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('b1f89f8d-8e22-4c4a-d504-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 0, 0, 1, 120, 'KeepAlive', '', 'bit', 'Boolean', 'KeepAlive', 1, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('b24ac0e3-71ab-4d48-d541-08da3d8d5a26', '8da38d20-8a09-4e81-8dd8-ed6702aee380', 0, 0, 1, 162, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', 6, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('b52a9e8c-dffb-40b7-d506-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 0, 0, 1, 110, 'LevelCode', '', 'varchar(50)', 'String', 'LevelCode', NULL, NULL, NULL, '2022-05-24 00:00:00.000000', NULL, '2022-05-24 21:58:07.000000');
INSERT INTO `low_code_table_info` VALUES ('b6422cb6-498e-4ff5-d4e6-08da3d8d5a26', 'e79db53b-7162-4669-9b5e-f860501475ac', 0, 0, 1, 84, 'CreationTime', '', 'datetime', 'DateTime', 'CreationTime', 8, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('b754af63-f1de-4000-d4a0-08da3d8d5a26', '7ad3b915-f0bd-443a-89cd-42d41dd6c554', 0, 0, 1, 56, 'FlowApprovalStepId', '步骤Id', 'uniqueidentifier', 'Guid', 'FlowApprovalStepId', 16, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('b755e2af-1164-47de-2444-08da717dbcaa', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 0, 0, 1, 216, 'IndexVuePath', '', 'varchar(50)', 'String', 'IndexVuePath', 50, '', NULL, '2022-07-30 00:16:47.000000', NULL, '2022-07-30 00:16:47.000000');
INSERT INTO `low_code_table_info` VALUES ('b76500c1-91f8-4e44-d531-08da3d8d5a26', '0a8bdb18-758a-4798-9ffc-e7031dcbf262', 0, 0, 1, 145, 'Code', '', 'nvarchar(255)', 'String', 'Code', 255, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('b7fbb61f-94fc-4242-d4d3-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 0, 0, 1, 75, 'Birthday', '', 'datetime2', 'DateTime', 'Birthday', NULL, '生日', NULL, '2022-05-24 00:00:00.000000', NULL, '2022-06-08 21:20:04.000000');
INSERT INTO `low_code_table_info` VALUES ('b9bbab1d-0a03-4d07-d488-08da3d8d5a26', 'd8948c56-c5bd-4061-b272-5417375f38f0', 1, 0, 0, 31, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('b9bfca2e-f72b-4a3f-d52f-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 0, 0, 1, 139, 'State', '', 'int', 'Int32', 'State', NULL, NULL, NULL, '2022-05-24 00:00:00.000000', NULL, '2022-06-09 21:20:26.000000');
INSERT INTO `low_code_table_info` VALUES ('ba392537-c1c5-4ecc-d517-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 1, 0, 0, 1, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('bbac9a7c-6e62-4fe6-d4ef-08da3d8d5a26', 'af37f705-7ba0-4883-b1be-8a274ea4c026', 0, 0, 1, 96, 'Code', '编码', 'varchar(255)', 'String', 'Code', 255, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('be481209-565b-4099-d53c-08da3d8d5a26', 'f3d7bbb3-c1fb-4d61-92a4-9bc101811335', 0, 0, 1, 155, 'Name', '', 'nvarchar(255)', 'String', 'Name', 255, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('be6f08b8-b14b-4253-2441-08da717dbcaa', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 0, 0, 0, 205, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', 8, '', NULL, '2022-07-30 00:16:47.000000', NULL, '2022-07-30 00:16:47.000000');
INSERT INTO `low_code_table_info` VALUES ('bf24a276-6ed0-49d4-d4d9-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 0, 0, 1, 71, 'Number', '', 'nvarchar(255)', 'String', 'Number', NULL, '编号', NULL, '2022-05-24 00:00:00.000000', NULL, '2022-06-08 21:20:04.000000');
INSERT INTO `low_code_table_info` VALUES ('bf3dbedf-ade0-4e20-338d-08da716a5c08', '18fbb18e-cb29-45d8-a5f3-c0121c57680a', 0, 0, 1, 26, 'Opinions', '', 'nvarchar(MAX)', 'String', 'Opinions', -1, '', NULL, '2022-07-29 21:58:05.000000', NULL, '2022-07-29 21:58:05.000000');
INSERT INTO `low_code_table_info` VALUES ('c1ae4945-25fc-45e9-3388-08da716a5c08', '18fbb18e-cb29-45d8-a5f3-c0121c57680a', 0, 0, 0, 29, 'ApprovalDate', '', 'datetime2', 'DateTime', 'ApprovalDate', 8, '', NULL, '2022-07-29 21:58:05.000000', NULL, '2022-07-29 21:58:05.000000');
INSERT INTO `low_code_table_info` VALUES ('c2f1a286-2b35-41d6-d4af-08da3d8d5a26', '852f53ff-0d00-4c32-aa55-a9c11993751b', 1, 0, 0, 189, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('c6042620-d052-4a60-2448-08da717dbcaa', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 0, 0, 1, 213, 'ModelPath', '', 'varchar(50)', 'String', 'ModelPath', 50, '', NULL, '2022-07-30 00:16:47.000000', NULL, '2022-07-30 00:16:47.000000');
INSERT INTO `low_code_table_info` VALUES ('c7b2ad1d-ecb0-4497-d515-08da3d8d5a26', '2ae9e532-7d9a-474b-b629-50a39945c44d', 0, 0, 1, 127, 'Number', '', 'int', 'Int32', 'Number', 4, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('c82d5132-6cda-463e-d54e-08da3d8d5a26', '6323638b-a45f-4a76-886e-69a9e9be0901', 0, 0, 1, 170, 'Phone', '', 'nvarchar(255)', 'String', 'Phone', NULL, '联系电话', NULL, '2022-05-24 00:00:00.000000', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-07 11:06:31.000000');
INSERT INTO `low_code_table_info` VALUES ('ca605278-6972-48b4-d51f-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 0, 0, 1, 5, 'Ip', 'ip地址', 'varchar(255)', 'String', 'Ip', 255, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('caae5d6f-f9c7-4edb-d48d-08da3d8d5a26', 'd8948c56-c5bd-4061-b272-5417375f38f0', 0, 0, 1, 37, 'FormId', '表单Id', 'varchar(50)', 'String', 'FormId', 50, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('caff37bf-4e91-4934-2449-08da717dbcaa', '6ba9805c-916e-4d2c-99d0-216fcbc361cc', 0, 0, 1, 212, 'ProjectRootPath', '', 'varchar(50)', 'String', 'ProjectRootPath', 50, '', NULL, '2022-07-30 00:16:47.000000', NULL, '2022-07-30 00:16:47.000000');
INSERT INTO `low_code_table_info` VALUES ('cb4a19d3-35dd-416d-3394-08da716a5c08', '7f94e0db-fc63-40dc-bfe3-18c5aad75975', 0, 0, 0, 39, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', 8, '', NULL, '2022-07-29 21:58:05.000000', NULL, '2022-07-29 21:58:05.000000');
INSERT INTO `low_code_table_info` VALUES ('cb5f9ecf-9317-4b11-d553-08da3d8d5a26', '69b24f04-0ed3-45fc-91d9-0dc929175a57', 0, 0, 1, 175, 'UserId', '', 'uniqueidentifier', 'Guid', 'UserId', 16, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('cbd75568-2ece-4f90-d49b-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 0, 0, 1, 48, 'State', '步骤状态（待审批、同意、不同意、回退升级审批）', 'int', 'Int32', 'State', 4, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('ccc3f055-79c4-4e63-3397-08da716a5c08', '7f94e0db-fc63-40dc-bfe3-18c5aad75975', 0, 0, 1, 35, 'FlowNodeName', '', 'nvarchar(MAX)', 'String', 'FlowNodeName', -1, '', NULL, '2022-07-29 21:58:05.000000', NULL, '2022-07-29 21:58:05.000000');
INSERT INTO `low_code_table_info` VALUES ('ce802713-74f5-4f30-d527-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 0, 0, 1, 138, 'Email', '', 'nvarchar(255)', 'String', 'Email', NULL, NULL, NULL, '2022-05-24 00:00:00.000000', NULL, '2022-06-09 21:20:26.000000');
INSERT INTO `low_code_table_info` VALUES ('cf2e3691-ab88-4420-d529-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 0, 0, 1, 136, 'Leader', '', 'nvarchar(255)', 'String', 'Leader', NULL, NULL, NULL, '2022-05-24 00:00:00.000000', NULL, '2022-06-09 21:20:26.000000');
INSERT INTO `low_code_table_info` VALUES ('cf99d60b-2392-493c-d4ce-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 0, 0, 1, 197, 'LastModificationTime', '', 'datetime', 'DateTime', 'LastModificationTime', 8, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('d0fbf229-7204-4494-d50c-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 0, 0, 1, 121, 'State', '', 'bit', 'Boolean', 'State', 1, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('d1eb49cf-c053-4226-d4d8-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 0, 0, 1, 72, 'Name', '', 'nvarchar(255)', 'String', 'Name', NULL, '会员名称', NULL, '2022-05-24 00:00:00.000000', NULL, '2022-06-08 21:20:04.000000');
INSERT INTO `low_code_table_info` VALUES ('d41bd8db-1b3f-48fa-d543-08da3d8d5a26', '8da38d20-8a09-4e81-8dd8-ed6702aee380', 0, 0, 1, 160, 'MenuId', '', 'int', 'Int32', 'MenuId', 4, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('d45ac420-e348-4d6b-d4aa-08da3d8d5a26', 'ae6d94d8-6a15-4348-b600-aa17e4b61718', 0, 0, 1, 62, 'LastModificationTime', '', 'datetime', 'DateTime', 'LastModificationTime', 8, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('d48c70e6-4549-41b6-d4a2-08da3d8d5a26', '7ad3b915-f0bd-443a-89cd-42d41dd6c554', 0, 0, 1, 58, 'FlowNodeName', '审批节点名称', 'varchar(500)', 'String', 'FlowNodeName', 500, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('d550fb44-f912-434e-3395-08da716a5c08', '7f94e0db-fc63-40dc-bfe3-18c5aad75975', 0, 0, 0, 33, 'FlowApprovalStepHistoryId', '', 'uniqueidentifier', 'Guid', 'FlowApprovalStepHistoryId', 16, '', NULL, '2022-07-29 21:58:05.000000', NULL, '2022-07-29 21:58:05.000000');
INSERT INTO `low_code_table_info` VALUES ('d5e76d95-beed-43c9-3398-08da716a5c08', '7f94e0db-fc63-40dc-bfe3-18c5aad75975', 0, 0, 0, 38, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', 8, '', NULL, '2022-07-29 21:58:05.000000', NULL, '2022-07-29 21:58:05.000000');
INSERT INTO `low_code_table_info` VALUES ('d6008705-0d21-42ac-d525-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 1, 1, 0, 132, 'Id', '', 'int', 'Int32', 'Id', NULL, NULL, NULL, '2022-05-24 00:00:00.000000', NULL, '2022-06-09 21:20:26.000000');
INSERT INTO `low_code_table_info` VALUES ('db4510e1-40d2-4db4-338c-08da716a5c08', '18fbb18e-cb29-45d8-a5f3-c0121c57680a', 0, 0, 0, 30, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', 8, '', NULL, '2022-07-29 21:58:05.000000', NULL, '2022-07-29 21:58:05.000000');
INSERT INTO `low_code_table_info` VALUES ('dbe000fc-4895-42f2-d53e-08da3d8d5a26', 'f3d7bbb3-c1fb-4d61-92a4-9bc101811335', 0, 0, 1, 156, 'Remark', '', 'nvarchar(255)', 'String', 'Remark', 255, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('dd367fd5-2030-43b2-d53d-08da3d8d5a26', 'f3d7bbb3-c1fb-4d61-92a4-9bc101811335', 0, 0, 1, 154, 'Number', '', 'int', 'Int32', 'Number', 4, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('de43269d-d43b-4a77-d4d0-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 0, 0, 1, 209, 'MaxLength', '', 'int', 'Int32', 'MaxLength', 4, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('de898f57-abe7-4d2c-d4ed-08da3d8d5a26', '524e71b4-cbf7-4248-8b29-3f99b43f2eb2', 0, 0, 1, 90, 'SysDataAuthorityId', '', 'uniqueidentifier', 'Guid', 'SysDataAuthorityId', 16, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('df559c6b-6f60-467c-d4ea-08da3d8d5a26', '524e71b4-cbf7-4248-8b29-3f99b43f2eb2', 1, 0, 0, 87, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('e0e9d3c3-b713-419c-d4c7-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 0, 0, 1, 208, 'CsField', '', 'varchar(50)', 'String', 'CsField', 50, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('e1316750-62a4-46aa-d4f7-08da3d8d5a26', '6fabc67a-8b48-49a6-8ba1-c8a32c499d36', 1, 0, 0, 100, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('e346cf76-ec76-4409-d49e-08da3d8d5a26', '7ad3b915-f0bd-443a-89cd-42d41dd6c554', 1, 0, 0, 53, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('e36410b5-cb7c-4fc3-d54d-08da3d8d5a26', '6323638b-a45f-4a76-886e-69a9e9be0901', 0, 0, 1, 169, 'Password', '', 'nvarchar(255)', 'String', 'Password', NULL, '密码', NULL, '2022-05-24 00:00:00.000000', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-07 11:06:31.000000');
INSERT INTO `low_code_table_info` VALUES ('e4245f5f-bffa-43f0-d4d5-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 0, 0, 1, 78, 'FilePath', '文件地址', 'nvarchar(255)', 'String', 'FilePath', NULL, '文件地址', NULL, '2022-05-24 00:00:00.000000', NULL, '2022-06-08 21:20:04.000000');
INSERT INTO `low_code_table_info` VALUES ('e4dd55f0-9697-43ae-d513-08da3d8d5a26', '2ae9e532-7d9a-474b-b629-50a39945c44d', 0, 0, 1, 125, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', 6, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('e5418d61-916f-45fd-d549-08da3d8d5a26', '6323638b-a45f-4a76-886e-69a9e9be0901', 0, 0, 1, 165, 'LastModificationTime', '', 'datetime2', 'DateTime', 'LastModificationTime', NULL, '更新时间', NULL, '2022-05-24 00:00:00.000000', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-07 11:06:31.000000');
INSERT INTO `low_code_table_info` VALUES ('e571fd26-b1a8-4648-d4ae-08da3d8d5a26', 'ae6d94d8-6a15-4348-b600-aa17e4b61718', 0, 0, 1, 66, 'Sort', '', 'int', 'Int32', 'Sort', 4, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('e67fd0c6-a997-4956-d49c-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 0, 0, 1, 50, 'UserId', '步骤审批人Id', 'uniqueidentifier', 'Guid', 'UserId', 16, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('e74c1f4b-af12-4eaa-d507-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 0, 0, 1, 112, 'Name', '', 'nvarchar(255)', 'String', 'Name', NULL, NULL, NULL, '2022-05-24 00:00:00.000000', NULL, '2022-05-24 21:58:07.000000');
INSERT INTO `low_code_table_info` VALUES ('e75b8650-ee49-4f83-d4d2-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 1, 0, 0, 70, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', NULL, NULL, NULL, '2022-05-24 00:00:00.000000', NULL, '2022-06-08 21:20:04.000000');
INSERT INTO `low_code_table_info` VALUES ('e7facee2-5132-4003-d4b2-08da3d8d5a26', '852f53ff-0d00-4c32-aa55-a9c11993751b', 0, 0, 1, 194, 'ForeignKeyTableId', '', 'uniqueidentifier', 'Guid', 'ForeignKeyTableId', 16, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('e8e60481-fb7f-4f1d-d499-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 0, 0, 1, 44, 'Sort', '步骤顺序号', 'int', 'Int32', 'Sort', 4, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('ea63351c-c203-4d40-d52e-08da3d8d5a26', 'd26d07cb-158a-4cb2-8b20-5dfd5181af54', 0, 0, 1, 137, 'Phone', '', 'nvarchar(255)', 'String', 'Phone', NULL, NULL, NULL, '2022-05-24 00:00:00.000000', NULL, '2022-06-09 21:20:26.000000');
INSERT INTO `low_code_table_info` VALUES ('eb846ac3-723e-4207-d4c8-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 0, 0, 1, 207, 'CsType', '', 'varchar(50)', 'String', 'CsType', 50, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('ee8ca902-4e27-40c5-d518-08da3d8d5a26', '60cceba1-28bf-4d1d-b603-4edf95d512b8', 0, 0, 1, 14, 'ActionDisplayName', '', 'varchar(255)', 'String', 'ActionDisplayName', 255, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('f00cde73-2294-40d6-d48c-08da3d8d5a26', 'd8948c56-c5bd-4061-b272-5417375f38f0', 0, 0, 1, 40, 'FlowName', '流程名称', 'varchar(255)', 'String', 'FlowName', 255, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('f029b676-48ac-4ba3-d509-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 0, 0, 1, 117, 'ParentId', '', 'int', 'Int32', 'ParentId', 4, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('f03ac01c-e0cf-4f13-d4db-08da3d8d5a26', '73c97832-4e7f-4758-86d2-94327971b5fd', 0, 0, 1, 76, 'Photo', '', 'nvarchar(255)', 'String', 'Photo', NULL, '头像', NULL, '2022-05-24 00:00:00.000000', NULL, '2022-06-08 21:20:04.000000');
INSERT INTO `low_code_table_info` VALUES ('f21d4c33-e65a-4dfe-d487-08da3d8d5a26', '1a8df018-79f8-4e26-b4eb-4b735aae7275', 0, 0, 1, 30, 'Remark', '备注', 'nvarchar(255)', 'String', 'Remark', 255, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('f221da94-0a1d-4ce7-d4cf-08da3d8d5a26', '79fbd4ec-9f4e-45dc-8065-70f2eb422cdf', 0, 0, 1, 199, 'Low_Code_TableId', '', 'uniqueidentifier', 'Guid', 'Low_Code_TableId', 16, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('f24f0e45-209e-46b7-d544-08da3d8d5a26', '8da38d20-8a09-4e81-8dd8-ed6702aee380', 0, 0, 1, 159, 'RoleId', '', 'uniqueidentifier', 'Guid', 'RoleId', 16, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('f5193134-b39d-4ca0-d502-08da3d8d5a26', 'd2600250-6f32-4d7d-8395-96cc9fa36db4', 0, 0, 1, 116, 'Icon', '', 'nvarchar(255)', 'String', 'Icon', NULL, NULL, NULL, '2022-05-24 00:00:00.000000', NULL, '2022-05-24 21:58:07.000000');
INSERT INTO `low_code_table_info` VALUES ('f5c93cc7-50a6-4e0e-d492-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 1, 0, 0, 41, 'Id', '', 'uniqueidentifier', 'Guid', 'Id', 16, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('f6d23541-2fca-40e6-d493-08da3d8d5a26', '651bb982-1130-4e1c-9070-36b90dcf2324', 0, 0, 1, 52, 'ApprovalDate', '审批时间', 'datetime', 'DateTime', 'ApprovalDate', 8, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');
INSERT INTO `low_code_table_info` VALUES ('f731ccd3-9a9c-4dda-d550-08da3d8d5a26', '69b24f04-0ed3-45fc-91d9-0dc929175a57', 0, 0, 1, 178, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', 6, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('f9fd0e13-4e5d-42b4-d4fc-08da3d8d5a26', '6fabc67a-8b48-49a6-8ba1-c8a32c499d36', 0, 0, 1, 101, 'Number', '', 'int', 'Int32', 'Number', 4, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('fbf2d2c1-454b-4898-d510-08da3d8d5a26', '2ae9e532-7d9a-474b-b629-50a39945c44d', 0, 0, 1, 126, 'CreationTime', '', 'datetime2', 'DateTime', 'CreationTime', 6, NULL, NULL, '2022-05-24 21:57:34.000000', NULL, '2022-05-24 21:57:34.000000');
INSERT INTO `low_code_table_info` VALUES ('fd9abf54-3c88-44b0-d484-08da3d8d5a26', '1a8df018-79f8-4e26-b4eb-4b735aae7275', 0, 0, 1, 25, 'LastModificationTime', '', 'datetime', 'DateTime', 'LastModificationTime', 8, NULL, NULL, '2022-05-24 21:57:33.000000', NULL, '2022-05-24 21:57:33.000000');

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
  `CreatorUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `LastModifierUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('96a1aa3d-a61a-42d0-954a-c71753fb2065', '123', '123', '123', '女', '2018-04-25 23:00:00.000000', '[{\"uid\":\"d80bbe3d-7296-4eb9-965a-cb3f03d3def7\",\"name\":\"time_000335_old_name_微信图片_20200413162625.jpg\",\"percent\":100,\"status\":\"done\",\"thumbUrl\":\"/upload/files/20220731/time_000335_old_name_微信图片_20200413162625.jpg\",\"url\":\"/upload/files/20220731/time_000335_old_name_微信图片_20200413162625.jpg\"}]', '<p>123</p>', '[{\"uid\":\"a6778e9d-6c2e-4d23-91c9-d0d10756d177\",\"name\":\"time_000345_old_name_hzy.png\",\"percent\":100,\"status\":\"done\",\"thumbUrl\":\"/upload/files/20220731/time_000345_old_name_hzy.png\",\"url\":\"/upload/files/20220731/time_000345_old_name_hzy.png\"}]', 'ac18f496-e93d-42f0-b59e-e321acc85335', NULL, '2020-10-24 00:07:42.000000', NULL, '2022-07-31 00:03:48.000000');
INSERT INTO `member` VALUES ('9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', '1', '测试会员', '18510912123', '男', '2019-07-08 11:47:24.000000', '[{\"uid\":\"6f5aed63-0fdc-4752-9c2b-3f66cbfa77bf\",\"name\":\"time_000222_old_name_微信图片_20200521081252.jpg\",\"percent\":100,\"status\":\"done\",\"thumbUrl\":\"/upload/files/20220731/time_000222_old_name_微信图片_20200521081252.jpg\",\"url\":\"/upload/files/20220731/time_000222_old_name_微信图片_20200521081252.jpg\"}]', '<p>999888</p>', '[{\"uid\":\"35828ad6-cbba-4bcb-9c97-141d5b31acc7\",\"name\":\"time_000320_old_name_Ko.js增删改查例子.txt\",\"percent\":100,\"status\":\"done\",\"thumbUrl\":\"/upload/files/20220731/time_000320_old_name_Ko.js增删改查例子.txt\",\"url\":\"/upload/files/20220731/time_000320_old_name_Ko.js增删改查例子.txt\"}]', 'ac18f496-e93d-42f0-b59e-e321acc85335', NULL, '2018-04-25 23:00:00.000000', NULL, '2022-07-31 00:03:23.000000');

-- ----------------------------
-- Table structure for quartz_job_task
-- ----------------------------
DROP TABLE IF EXISTS `quartz_job_task`;
CREATE TABLE `quartz_job_task`  (
  `Id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CreatorUserId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人id',
  `CreationTime` datetime NOT NULL COMMENT '创建时间',
  `LastModifierUserId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人id',
  `LastModificationTime` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `GroupName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分组名称',
  `Cron` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '间隔表达式',
  `ApiUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求地址',
  `HeaderToken` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求 token 密钥',
  `RequsetMode` int NULL DEFAULT NULL COMMENT '请求方式（0=Post，1=Get，2=Delete）',
  `Remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `State` int NULL DEFAULT NULL COMMENT '运行状态（0=未运行，1=运行中）',
  `ExecuteTime` datetime NULL DEFAULT NULL COMMENT '最后执行时间',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quartz_job_task
-- ----------------------------
INSERT INTO `quartz_job_task` VALUES ('0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', '00000000-0000-0000-0000-000000000000', '2023-01-29 11:36:31', '00000000-0000-0000-0000-000000000000', '2023-01-29 17:32:40', '默认测试接口', 'TEST', '0/10 * * * * ?', 'http://localhost:5600/api/job/JobTest/Test', '', 1, '用于测试', 1, '2023-01-29 17:32:40');

-- ----------------------------
-- Table structure for quartz_job_task_log
-- ----------------------------
DROP TABLE IF EXISTS `quartz_job_task_log`;
CREATE TABLE `quartz_job_task_log`  (
  `Id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CreatorUserId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人id',
  `CreationTime` datetime NOT NULL COMMENT '创建时间',
  `LastModifierUserId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人id',
  `LastModificationTime` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `JobTaskId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '作业任务id',
  `Text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '日志内容',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quartz_job_task_log
-- ----------------------------
INSERT INTO `quartz_job_task_log` VALUES ('1234C67D-7015-48C4-B21D-364D485F75A3', '00000000-0000-0000-0000-000000000000', '2023-01-29 17:32:30', NULL, NULL, '0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', '任务=默认测试接口|组=TEST|2023-01-29|StartTime= 17:32:30:012|EndTime=17:32:30:038|耗时=28 毫秒|结果=调用测试接口成功!');
INSERT INTO `quartz_job_task_log` VALUES ('1C2D3627-2C2C-4D6E-9219-3756E581F7EA', '00000000-0000-0000-0000-000000000000', '2023-01-29 12:03:00', NULL, NULL, '0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', '任务=默认测试接口|组=TEST|2023-01-29|StartTime= 12:03:00:036|EndTime=12:03:00:100|耗时=65 毫秒|结果=调用测试接口成功!');
INSERT INTO `quartz_job_task_log` VALUES ('1C5D8474-8BC6-4586-A93D-F1DFFF5B2BE7', '00000000-0000-0000-0000-000000000000', '2023-01-29 16:55:10', NULL, NULL, '0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', '任务=默认测试接口|组=TEST|2023-01-29|StartTime= 16:55:10:054|EndTime=16:55:10:092|耗时=41 毫秒|结果=调用测试接口成功!');
INSERT INTO `quartz_job_task_log` VALUES ('2FCFC8D3-F7EE-47D8-87CC-B5EE4DE561AF', '00000000-0000-0000-0000-000000000000', '2023-01-29 12:02:29', NULL, NULL, '0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', '任务=默认测试接口|组=TEST|2023-01-29|StartTime= 12:02:29:183|EndTime=12:02:29:234|耗时=54 毫秒|结果=调用测试接口成功!');
INSERT INTO `quartz_job_task_log` VALUES ('3ECDC0F9-0937-440D-8E8C-D4EA126EF35C', '00000000-0000-0000-0000-000000000000', '2023-01-29 12:04:00', NULL, NULL, '0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', '任务=默认测试接口|组=TEST|2023-01-29|StartTime= 12:04:00:041|EndTime=12:04:00:110|耗时=70 毫秒|结果=调用测试接口成功!');
INSERT INTO `quartz_job_task_log` VALUES ('4EBD9D4D-28AE-4736-BD1A-1BEF6C77A37F', '00000000-0000-0000-0000-000000000000', '2023-01-29 17:32:40', NULL, NULL, '0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', '任务=默认测试接口|组=TEST|2023-01-29|StartTime= 17:32:40:047|EndTime=17:32:40:080|耗时=36 毫秒|结果=调用测试接口成功!');
INSERT INTO `quartz_job_task_log` VALUES ('658213B8-C975-409A-B490-92995B27795C', '00000000-0000-0000-0000-000000000000', '2023-01-29 17:32:20', NULL, NULL, '0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', '任务=默认测试接口|组=TEST|2023-01-29|StartTime= 17:32:20:036|EndTime=17:32:20:066|耗时=31 毫秒|结果=调用测试接口成功!');
INSERT INTO `quartz_job_task_log` VALUES ('72B10C0E-620F-4AC9-BF9A-3FCE7EAE1B88', '00000000-0000-0000-0000-000000000000', '2023-01-29 17:12:33', NULL, NULL, '0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', '任务=默认测试接口|组=TEST|2023-01-29|StartTime= 17:12:30:940|EndTime=17:12:33:283|耗时=2372 毫秒|结果=调用测试接口成功!');
INSERT INTO `quartz_job_task_log` VALUES ('7354BC3B-FA15-4645-8B54-63F1A7265D2F', '00000000-0000-0000-0000-000000000000', '2023-01-29 12:03:20', NULL, NULL, '0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', '任务=默认测试接口|组=TEST|2023-01-29|StartTime= 12:03:20:039|EndTime=12:03:20:070|耗时=32 毫秒|结果=调用测试接口成功!');
INSERT INTO `quartz_job_task_log` VALUES ('81E0A17C-5022-4974-B56B-9010102F1B03', '00000000-0000-0000-0000-000000000000', '2023-01-29 12:02:40', NULL, NULL, '0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', '任务=默认测试接口|组=TEST|2023-01-29|StartTime= 12:02:40:020|EndTime=12:02:40:048|耗时=29 毫秒|结果=调用测试接口成功!');
INSERT INTO `quartz_job_task_log` VALUES ('86DAA3AC-93CF-4FD2-AA93-C5A04F3AE968', '00000000-0000-0000-0000-000000000000', '2023-01-29 16:55:20', NULL, NULL, '0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', '任务=默认测试接口|组=TEST|2023-01-29|StartTime= 16:55:20:039|EndTime=16:55:20:064|耗时=27 毫秒|结果=调用测试接口成功!');
INSERT INTO `quartz_job_task_log` VALUES ('897F4058-C5DF-4814-8C49-2420348415CC', '00000000-0000-0000-0000-000000000000', '2023-01-29 17:32:00', NULL, NULL, '0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', '任务=默认测试接口|组=TEST|2023-01-29|StartTime= 17:32:00:011|EndTime=17:32:00:047|耗时=40 毫秒|结果=调用测试接口成功!');
INSERT INTO `quartz_job_task_log` VALUES ('8F1A6859-B3EA-48AB-894A-158F85369947', '00000000-0000-0000-0000-000000000000', '2023-01-29 16:55:05', NULL, NULL, '0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', '任务=默认测试接口|组=TEST|2023-01-29|StartTime= 16:55:00:158|EndTime=16:55:05:239|耗时=5091 毫秒|结果=调用测试接口成功!');
INSERT INTO `quartz_job_task_log` VALUES ('947B18B8-4ABF-4FDA-A612-0F8CE8EF746A', '00000000-0000-0000-0000-000000000000', '2023-01-29 17:12:50', NULL, NULL, '0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', '任务=默认测试接口|组=TEST|2023-01-29|StartTime= 17:12:50:037|EndTime=17:12:50:071|耗时=35 毫秒|结果=调用测试接口成功!');
INSERT INTO `quartz_job_task_log` VALUES ('95A4AA46-FDB3-4C29-8089-5A413D8BE776', '00000000-0000-0000-0000-000000000000', '2023-01-29 17:32:10', NULL, NULL, '0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', '任务=默认测试接口|组=TEST|2023-01-29|StartTime= 17:32:10:040|EndTime=17:32:10:067|耗时=29 毫秒|结果=调用测试接口成功!');
INSERT INTO `quartz_job_task_log` VALUES ('95DA5460-0C80-4DF7-9AAB-E4EE40D1B924', '00000000-0000-0000-0000-000000000000', '2023-01-29 12:04:10', NULL, NULL, '0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', '任务=默认测试接口|组=TEST|2023-01-29|StartTime= 12:04:10:005|EndTime=12:04:10:039|耗时=36 毫秒|结果=调用测试接口成功!');
INSERT INTO `quartz_job_task_log` VALUES ('A980D08F-2F2A-4017-8788-2BFB433DF66D', '00000000-0000-0000-0000-000000000000', '2023-01-29 17:31:50', NULL, NULL, '0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', '任务=默认测试接口|组=TEST|2023-01-29|StartTime= 17:31:50:079|EndTime=17:31:50:236|耗时=160 毫秒|结果=调用测试接口成功!');
INSERT INTO `quartz_job_task_log` VALUES ('BCA6690C-AB03-4677-93A2-471E55CED8EE', '00000000-0000-0000-0000-000000000000', '2023-01-29 12:04:20', NULL, NULL, '0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', '任务=默认测试接口|组=TEST|2023-01-29|StartTime= 12:04:20:058|EndTime=12:04:20:084|耗时=28 毫秒|结果=调用测试接口成功!');
INSERT INTO `quartz_job_task_log` VALUES ('BE1A1FE0-C856-487A-B7FD-37F1D3958115', '00000000-0000-0000-0000-000000000000', '2023-01-29 12:02:30', NULL, NULL, '0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', '任务=默认测试接口|组=TEST|2023-01-29|StartTime= 12:02:30:056|EndTime=12:02:30:101|耗时=49 毫秒|结果=调用测试接口成功!');
INSERT INTO `quartz_job_task_log` VALUES ('C465AD9C-62BD-406F-92D4-19FAF88F0940', '00000000-0000-0000-0000-000000000000', '2023-01-29 12:02:23', NULL, NULL, '0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', '任务=默认测试接口|组=TEST|2023-01-29|StartTime= 12:02:15:195|EndTime=12:02:21:961|耗时=11296 毫秒|结果=调用测试接口成功!');
INSERT INTO `quartz_job_task_log` VALUES ('D03B92DD-13C5-40FC-9E61-BFAC59BBB31A', '00000000-0000-0000-0000-000000000000', '2023-01-29 12:02:50', NULL, NULL, '0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', '任务=默认测试接口|组=TEST|2023-01-29|StartTime= 12:02:50:038|EndTime=12:02:50:069|耗时=33 毫秒|结果=调用测试接口成功!');
INSERT INTO `quartz_job_task_log` VALUES ('D5BFA210-65B2-4483-8B9A-3AEB47F98176', '00000000-0000-0000-0000-000000000000', '2023-01-29 12:03:40', NULL, NULL, '0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', '任务=默认测试接口|组=TEST|2023-01-29|StartTime= 12:03:40:021|EndTime=12:03:40:053|耗时=33 毫秒|结果=调用测试接口成功!');
INSERT INTO `quartz_job_task_log` VALUES ('D70E6344-D373-498A-AE19-E7CD84603E47', '00000000-0000-0000-0000-000000000000', '2023-01-29 12:03:10', NULL, NULL, '0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', '任务=默认测试接口|组=TEST|2023-01-29|StartTime= 12:03:10:006|EndTime=12:03:10:430|耗时=427 毫秒|结果=调用测试接口成功!');
INSERT INTO `quartz_job_task_log` VALUES ('D8004A93-C4F5-498B-B9AA-C7301460F5B9', '00000000-0000-0000-0000-000000000000', '2023-01-29 16:54:11', NULL, NULL, '0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', '任务=默认测试接口|组=TEST|2023-01-29|StartTime= 16:54:10:120|EndTime=16:54:10:662|耗时=552 毫秒|结果=调用测试接口成功!');
INSERT INTO `quartz_job_task_log` VALUES ('E375C7F0-7B26-4C0E-8B86-F3A7F298C8FA', '00000000-0000-0000-0000-000000000000', '2023-01-29 12:03:30', NULL, NULL, '0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', '任务=默认测试接口|组=TEST|2023-01-29|StartTime= 12:03:30:052|EndTime=12:03:30:080|耗时=30 毫秒|结果=调用测试接口成功!');
INSERT INTO `quartz_job_task_log` VALUES ('F8CD7E8E-100B-43FA-BA4B-8A778BBF429C', '00000000-0000-0000-0000-000000000000', '2023-01-29 12:03:50', NULL, NULL, '0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', '任务=默认测试接口|组=TEST|2023-01-29|StartTime= 12:03:50:016|EndTime=12:03:50:052|耗时=37 毫秒|结果=调用测试接口成功!');
INSERT INTO `quartz_job_task_log` VALUES ('FFBBF252-55B1-438F-86B8-E2D6F1AB692A', '00000000-0000-0000-0000-000000000000', '2023-01-29 17:12:40', NULL, NULL, '0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', '任务=默认测试接口|组=TEST|2023-01-29|StartTime= 17:12:40:056|EndTime=17:12:40:083|耗时=30 毫秒|结果=调用测试接口成功!');

-- ----------------------------
-- Table structure for sys_data_authority
-- ----------------------------
DROP TABLE IF EXISTS `sys_data_authority`;
CREATE TABLE `sys_data_authority`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `PermissionType` int NOT NULL,
  `RoleId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `CreatorUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `LastModifierUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_data_authority
-- ----------------------------
INSERT INTO `sys_data_authority` VALUES ('0228a5b5-2202-4ba0-6e48-08da205da7b7', 5, '18fa4771-6f58-46a3-80d2-6f0f5e9972e3', NULL, '2022-04-17 18:33:04.000000', NULL, '2022-04-17 18:33:04.000000');
INSERT INTO `sys_data_authority` VALUES ('d09bf250-c5b0-41cb-237d-08da00442990', 5, '40ff1844-c099-4061-98e0-cd6e544fcfd3', NULL, '2022-03-07 22:09:58.000000', NULL, '2022-07-06 21:53:17.000000');

-- ----------------------------
-- Table structure for sys_data_authority_custom
-- ----------------------------
DROP TABLE IF EXISTS `sys_data_authority_custom`;
CREATE TABLE `sys_data_authority_custom`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `SysDataAuthorityId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `SysOrganizationId` int NOT NULL,
  `CreatorUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `LastModifierUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_data_authority_custom
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary`;
CREATE TABLE `sys_dictionary`  (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Sort` int NOT NULL,
  `Code` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ParentId` int NULL DEFAULT NULL,
  `CreatorUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `LastModifierUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dictionary
-- ----------------------------
INSERT INTO `sys_dictionary` VALUES (1, 1, 'news_type', '资讯类别', NULL, NULL, NULL, '2021-07-25 22:31:30.000000', NULL, '2021-07-25 22:39:34.000000');
INSERT INTO `sys_dictionary` VALUES (2, 1, 'news_type_nan', '男', '1', 1, NULL, '2021-07-25 22:38:49.000000', NULL, '2021-07-25 22:40:30.000000');
INSERT INTO `sys_dictionary` VALUES (3, 2, 'news_type_nv', '女', '2', 1, NULL, '2021-07-25 22:40:47.000000', NULL, '2022-07-06 21:55:30.000000');
INSERT INTO `sys_dictionary` VALUES (4, 0, '3', '未知', '3', 1, NULL, '2022-06-29 20:55:46.000000', NULL, '2022-06-29 20:55:46.000000');

-- ----------------------------
-- Table structure for sys_function
-- ----------------------------
DROP TABLE IF EXISTS `sys_function`;
CREATE TABLE `sys_function`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Number` int NULL DEFAULT NULL,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ByName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `CreatorUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `LastModifierUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_function
-- ----------------------------
INSERT INTO `sys_function` VALUES ('2401f4d0-60b0-4e2e-903f-84c603373572', 70, '导出', 'Export', 'Export', NULL, '2016-06-20 13:40:52.000000', NULL, '2021-04-18 22:08:06.000000');
INSERT INTO `sys_function` VALUES ('383e7ee2-7690-46ac-9230-65155c84aa30', 50, '保存', 'Save', 'Save', NULL, '2016-06-20 13:40:52.000000', '0198459e-2034-4533-b843-5d227ad20740', '2022-09-28 22:12:02.000000');
INSERT INTO `sys_function` VALUES ('9c388461-2704-4c5e-a729-72c17e9018e1', 40, '删除', 'Delete', 'Delete', NULL, '2016-06-20 13:40:52.000000', NULL, '2021-04-18 22:08:06.000000');
INSERT INTO `sys_function` VALUES ('b6fd5425-504a-46a9-993b-2f8dc9158eb8', 80, '打印', 'Print', 'Print', NULL, '2022-06-16 17:28:00.000000', NULL, '2021-04-18 22:08:06.000000');
INSERT INTO `sys_function` VALUES ('bffefb1c-8988-4ddf-b4ac-81c2b30e80cd', 20, '添加', 'Insert', 'Insert', NULL, '2016-06-20 13:40:52.000000', NULL, '2021-04-18 22:08:06.000000');
INSERT INTO `sys_function` VALUES ('c9518758-b2e1-4f51-b517-5282e273889c', 10, '显示', 'Display', 'Display', NULL, '2016-06-20 13:40:52.000000', NULL, '2021-04-18 22:08:06.000000');
INSERT INTO `sys_function` VALUES ('e7ef2a05-8317-41c3-b588-99519fe88bf9', 30, '修改', 'Update', 'Update', NULL, '2016-06-20 13:40:52.000000', NULL, '2021-04-18 22:08:06.000000');
INSERT INTO `sys_function` VALUES ('f27ecb0a-197d-47b1-b243-59a8c71302bf', 60, '检索', 'Search', 'Search', NULL, '2016-06-20 13:40:52.000000', NULL, '2021-04-18 22:08:06.000000');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `Id` int NOT NULL AUTO_INCREMENT,
  `LevelCode` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Number` int NULL DEFAULT NULL,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ComponentName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Url` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Router` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `JumpUrl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Icon` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ParentId` int NULL DEFAULT NULL,
  `Show` tinyint(1) NOT NULL,
  `Close` tinyint(1) NOT NULL,
  `KeepAlive` tinyint(1) NOT NULL,
  `State` tinyint(1) NOT NULL,
  `Type` int NOT NULL,
  `Mode` int NOT NULL,
  `ModuleUrl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ModuleUrlPro` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `CreatorUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `LastModifierUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '1', 10, '更多示例', NULL, NULL, NULL, NULL, 'MoreOutlined', NULL, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, '2021-05-28 11:49:02.000000', NULL, '2022-03-04 12:25:39.000000');
INSERT INTO `sys_menu` VALUES (2, '1.2', 10, '查看更多组件', 'AppComponentsCom', 'views/example/AppComponents.vue', '/app/components', NULL, 'LayoutOutlined', 1, 1, 1, 1, 1, 2, 1, NULL, NULL, NULL, '2021-01-16 16:05:22.000000', NULL, '2022-03-18 12:06:20.000000');
INSERT INTO `sys_menu` VALUES (3, '1.3', 30, '按钮', 'ButtonCom', 'views/example/Button.vue', '/button', NULL, 'AppstoreOutlined', 1, 1, 1, 1, 1, 2, 1, NULL, NULL, NULL, '2020-12-17 14:58:05.000000', NULL, '2022-03-04 12:26:14.000000');
INSERT INTO `sys_menu` VALUES (4, '1.4', 40, '图表 AntV G2', NULL, NULL, NULL, NULL, 'PieChartOutlined', 1, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, '2021-01-16 16:06:33.000000', NULL, '2022-03-04 12:26:21.000000');
INSERT INTO `sys_menu` VALUES (5, '1.4.5', 10, '基础图表', 'ChartBaseCom', 'views/example/chart/Base.vue', '/chart/base', NULL, NULL, 4, 1, 1, 1, 1, 2, 1, NULL, NULL, NULL, '2021-01-16 16:07:24.000000', NULL, '2022-03-04 12:26:25.000000');
INSERT INTO `sys_menu` VALUES (6, '1.4.6', 20, '更多图表', 'ChartMoreCom', 'views/example/chart/More.vue', '/chart/more', NULL, NULL, 4, 1, 1, 1, 1, 2, 1, NULL, NULL, NULL, '2021-01-16 16:10:06.000000', NULL, '2022-03-04 12:26:28.000000');
INSERT INTO `sys_menu` VALUES (7, '1.7', 50, '表格管理', NULL, NULL, NULL, NULL, 'TableOutlined', 1, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, '2018-03-10 12:16:38.000000', NULL, '2022-03-04 12:26:34.000000');
INSERT INTO `sys_menu` VALUES (8, '1.7.8', 100, '基础列表', 'BaseListCom', 'views/example/BaseList.vue', '/base/list', NULL, NULL, 7, 1, 1, 1, 1, 2, 1, NULL, NULL, NULL, '2020-12-17 14:49:12.000000', NULL, '2022-03-04 12:26:38.000000');
INSERT INTO `sys_menu` VALUES (9, '1.7.9', 110, '标准表格', 'ListIndexCom', 'views/example/list/Index.vue', '/list', NULL, NULL, 7, 1, 1, 1, 1, 2, 1, NULL, NULL, NULL, '2020-12-17 14:51:07.000000', NULL, '2022-03-04 12:26:41.000000');
INSERT INTO `sys_menu` VALUES (10, '1.10', 60, '富文本编辑器', 'EditorCom', 'views/example/Editor.vue', '/editor', NULL, 'PicRightOutlined', 1, 1, 1, 1, 1, 2, 1, NULL, NULL, NULL, '2021-01-18 19:34:28.000000', NULL, '2022-03-04 12:26:46.000000');
INSERT INTO `sys_menu` VALUES (11, '1.11', 70, '微前端', 'Iframe', 'core/components/Iframe.vue', '/iframe', '', 'RadarChartOutlined', 1, 1, 1, 1, 1, 2, 2, 'http://rapidscada.com.cn/#/', 'https://www.yuque.com/u378909/yidf7v/bs256p', NULL, '2021-08-05 21:51:12.000000', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-17 16:25:29.000000');
INSERT INTO `sys_menu` VALUES (12, '12', 50, '基础信息', NULL, NULL, NULL, NULL, 'GoldOutlined', NULL, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, '2018-03-10 12:16:38.000000', NULL, '2022-03-04 12:25:43.000000');
INSERT INTO `sys_menu` VALUES (13, '12.13', 10, '会员管理', 'base_member', 'views/base/member/Index.vue', '/base/member', NULL, 'UsergroupAddOutlined', 12, 1, 1, 1, 1, 2, 1, NULL, NULL, NULL, '2018-03-10 12:16:38.000000', NULL, '2022-03-04 12:26:55.000000');
INSERT INTO `sys_menu` VALUES (14, '14', 100, '系统管理', NULL, NULL, NULL, NULL, 'DesktopOutlined', NULL, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, '2018-03-10 12:16:38.000000', NULL, '2022-03-04 12:25:46.000000');
INSERT INTO `sys_menu` VALUES (15, '14.15', 100, '账户管理', 'system_user', 'views/system/sys_user/Index.vue', '/system/user', NULL, 'UserOutlined', 14, 1, 1, 1, 1, 2, 1, NULL, NULL, NULL, '2018-03-10 12:16:38.000000', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-04 16:28:51.000000');
INSERT INTO `sys_menu` VALUES (16, '14.16', 110, '角色管理', 'system_role', 'views/system/sys_role/Index.vue', '/system/role', NULL, 'TeamOutlined', 14, 1, 1, 1, 1, 2, 1, NULL, NULL, NULL, '2018-03-10 12:16:38.000000', NULL, '2022-04-22 22:24:03.000000');
INSERT INTO `sys_menu` VALUES (17, '14.17', 120, '功能管理', 'system_function', 'views/system/sys_function/Index.vue', '/system/function', NULL, 'ControlOutlined', 14, 1, 1, 1, 1, 2, 1, NULL, NULL, NULL, '2018-03-10 12:16:38.000000', NULL, '2022-03-04 12:27:11.000000');
INSERT INTO `sys_menu` VALUES (19, '14.19', 150, '个人中心', 'system_personal_center', 'views/system/personal_center/Index.vue', '/system/personal/center', NULL, 'FormOutlined', 14, 1, 1, 1, 1, 2, 1, NULL, NULL, NULL, '2018-03-10 12:16:38.000000', NULL, '2022-03-04 12:27:19.000000');
INSERT INTO `sys_menu` VALUES (20, '14.20', 160, '岗位管理', 'system_post', 'views/system/sys_post/Index.vue', '/system/post', NULL, 'IdcardOutlined', 14, 1, 1, 1, 1, 2, 1, NULL, NULL, NULL, '2021-05-27 17:29:49.000000', NULL, '2022-03-04 12:27:23.000000');
INSERT INTO `sys_menu` VALUES (21, '14.21', 170, '组织机构', 'system_organization', 'views/system/sys_organization/Index.vue', '/system/organization', NULL, 'ClusterOutlined', 14, 1, 1, 1, 1, 2, 1, NULL, NULL, NULL, '2021-05-27 20:27:56.000000', NULL, '2022-03-04 12:27:27.000000');
INSERT INTO `sys_menu` VALUES (22, '29.22', 10, '接口文档', 'swagger', 'views/development_tool/Swagger.vue', '/development_tool/swagger', NULL, 'FileSearchOutlined', 29, 1, 1, 1, 1, 2, 1, NULL, NULL, NULL, '2018-03-10 12:17:03.000000', NULL, '2022-03-04 12:27:41.000000');
INSERT INTO `sys_menu` VALUES (23, '14.23', 190, '数据字典', 'system_dictionary', 'views/system/sys_dictionary/Index.vue', '/system/dictionary', NULL, 'FileDoneOutlined', 14, 1, 1, 1, 1, 2, 1, NULL, NULL, NULL, '2021-07-25 21:50:01.000000', NULL, '2022-03-04 12:27:31.000000');
INSERT INTO `sys_menu` VALUES (24, '14.24', 200, '操作日志', 'sys_operation_log', 'views/system/sys_operation_log/Index.vue', '/system/sys_operation_log', '', 'ContainerOutlined', 14, 1, 1, 1, 1, 2, 1, NULL, NULL, NULL, '2021-08-05 21:24:54.000000', NULL, '2022-03-04 12:27:35.000000');
INSERT INTO `sys_menu` VALUES (25, '14.25', 130, '菜单功能', 'system_menu', 'views/system/sys_menu/Index.vue', '/system/menu', NULL, 'MenuOutlined', 14, 1, 1, 1, 1, 2, 1, NULL, NULL, NULL, '2018-03-10 12:16:38.000000', NULL, '2022-03-04 12:27:15.000000');
INSERT INTO `sys_menu` VALUES (28, '1.28', 1, 'Vxe-Table', 'VxeTableCom', 'views/example/VxeTable.vue', '/vxe/table', NULL, 'BorderlessTableOutlined', 1, 1, 1, 1, 1, 2, 1, NULL, NULL, NULL, '2021-12-29 17:13:26.000000', NULL, '2022-03-04 12:26:00.000000');
INSERT INTO `sys_menu` VALUES (29, '29', 200, '开发工具', NULL, NULL, NULL, NULL, 'CodepenOutlined', NULL, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, '2022-01-12 14:17:21.000000', NULL, '2022-03-04 12:25:49.000000');
INSERT INTO `sys_menu` VALUES (30, '29.30', 20, '定时任务', 'TimedTaskCom', 'views/development_tool/timed_task/Index.vue', '/development_tool/timed_task', NULL, 'FieldTimeOutlined', 29, 1, 1, 1, 1, 2, 1, NULL, NULL, NULL, '2022-01-12 14:22:04.000000', NULL, '2022-03-04 12:27:44.000000');
INSERT INTO `sys_menu` VALUES (31, '29.31', 30, '代码生成', 'LowCode', 'views/development_tool/low_code/Index.vue', '/development-tool/low-code', NULL, 'CodeTwoTone', 29, 1, 1, 1, 1, 2, 1, NULL, NULL, NULL, '2022-01-12 15:39:46.000000', NULL, '2022-05-24 22:05:57.000000');
INSERT INTO `sys_menu` VALUES (32, '1.32', 20, '图标展示', 'IconsVue', 'views/example/Icons.vue', '/icons', NULL, 'TagsTwoTone', 1, 1, 1, 1, 1, 2, 1, NULL, NULL, NULL, '2022-02-24 10:51:38.000000', NULL, '2022-03-18 12:06:38.000000');
INSERT INTO `sys_menu` VALUES (33, '29.33', 40, 'EFCore监控台', 'monitor_efcore', 'views/development_tool/monitor_efcore/Index.vue', '/development_tool/monitor/efcore', NULL, 'DashboardFilled', 29, 1, 1, 1, 1, 2, 1, NULL, NULL, NULL, '2022-04-10 10:55:41.000000', NULL, '2022-04-10 10:56:17.000000');
INSERT INTO `sys_menu` VALUES (36, '12.13.36', 1, '详情', 'base_member_info_Details', 'views/base/member/components/Details.vue', '/base/member/details/:id/:title', NULL, NULL, 13, 0, 1, 1, 1, 2, 1, NULL, NULL, NULL, '2022-04-17 17:45:25.000000', NULL, '2022-04-17 17:49:13.000000');
INSERT INTO `sys_menu` VALUES (37, '1.37', 80, '微前端2', 'Iframe123', 'core/components/Iframe.vue', '/iframe123', NULL, 'AlipaySquareFilled', 1, 1, 1, 1, 1, 2, 2, 'https://www.yuque.com/u378909/yidf7v/zx6egc', 'https://www.yuque.com/u378909/yidf7v/fezgu5', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-16 15:00:53.000000', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-16 17:30:09.000000');

-- ----------------------------
-- Table structure for sys_menu_function
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_function`;
CREATE TABLE `sys_menu_function`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Number` int NULL DEFAULT NULL,
  `MenuId` int NOT NULL,
  `FunctionCode` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `FunctionName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `CreatorUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `LastModifierUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu_function
-- ----------------------------
INSERT INTO `sys_menu_function` VALUES ('0073cce2-ff42-496c-9ff6-08da204fcecb', 10, 36, 'Display', '显示', 'Display', NULL, '2022-04-17 20:40:12.000000', NULL, '2022-04-17 20:40:12.000000');
INSERT INTO `sys_menu_function` VALUES ('0984a2e1-3722-41d4-0f6d-08d9fdad00ab', 70, 23, 'Export', '导出', 'Export', NULL, '2022-03-04 15:25:50.000000', NULL, '2022-03-04 15:25:50.000000');
INSERT INTO `sys_menu_function` VALUES ('0a85e4fd-5a1c-47f6-0f60-08d9fdad00ab', 20, 21, 'Insert', '添加', 'Insert', NULL, '2022-03-04 15:25:40.000000', NULL, '2022-03-04 15:25:40.000000');
INSERT INTO `sys_menu_function` VALUES ('0ad6a459-1d9d-4512-0f32-08d9fdad00ab', 40, 15, 'Delete', '删除', 'Delete', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-04 16:28:51.000000', NULL, '2022-03-04 15:25:14.000000');
INSERT INTO `sys_menu_function` VALUES ('0b27e69f-af16-4481-0f44-08d9fdad00ab', 60, 17, 'Search', '检索', 'Search', NULL, '2022-03-04 15:25:21.000000', NULL, '2022-03-04 15:25:21.000000');
INSERT INTO `sys_menu_function` VALUES ('0caa6e7d-92b0-4814-0f46-08d9fdad00ab', 80, 17, 'Print', '打印', 'Print', NULL, '2022-03-04 15:25:21.000000', NULL, '2022-03-04 15:25:21.000000');
INSERT INTO `sys_menu_function` VALUES ('106fb69a-8bb5-4559-0f29-08d9fdad00ab', 30, 13, 'Update', '修改', 'Update', NULL, '2022-03-04 15:25:07.000000', NULL, '2022-03-04 15:25:07.000000');
INSERT INTO `sys_menu_function` VALUES ('13f3f74d-c6fc-4488-0f2f-08d9fdad00ab', 10, 15, 'Display', '显示', 'Display', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-04 16:28:51.000000', NULL, '2022-03-04 15:25:14.000000');
INSERT INTO `sys_menu_function` VALUES ('14783a71-e265-4d6b-0f3b-08d9fdad00ab', 50, 16, 'Save', '保存', 'Save', NULL, '2022-04-22 22:24:03.000000', NULL, '2022-04-22 22:24:03.000000');
INSERT INTO `sys_menu_function` VALUES ('1cb6fbe1-4a6c-4aad-0f22-08d9fdad00ab', 10, 6, 'Display', '显示', 'Display', NULL, '2022-03-04 15:24:34.000000', NULL, '2022-03-04 15:24:34.000000');
INSERT INTO `sys_menu_function` VALUES ('1d831d57-6634-45d7-0f6e-08d9fdad00ab', 80, 23, 'Print', '打印', 'Print', NULL, '2022-03-04 15:25:50.000000', NULL, '2022-03-04 15:25:50.000000');
INSERT INTO `sys_menu_function` VALUES ('1e69df5d-d1e9-4bc8-0f4d-08d9fdad00ab', 70, 25, 'Export', '导出', 'Export', NULL, '2022-03-04 15:25:28.000000', NULL, '2022-03-04 15:25:28.000000');
INSERT INTO `sys_menu_function` VALUES ('20ab5395-d57c-49db-0f4a-08d9fdad00ab', 40, 25, 'Delete', '删除', 'Delete', NULL, '2022-03-04 15:25:28.000000', NULL, '2022-03-04 15:25:28.000000');
INSERT INTO `sys_menu_function` VALUES ('216e9ad6-cc3f-4e72-c083-08dadf3345bd', 50, 37, 'Save', '保存', 'Save', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-16 17:30:09.000000', NULL, NULL);
INSERT INTO `sys_menu_function` VALUES ('2186550d-246c-4552-e2d8-08d9fdefa8f8', 60, 24, 'Search', '检索', 'Search', NULL, '2022-03-04 23:00:02.000000', NULL, '2022-03-04 23:00:02.000000');
INSERT INTO `sys_menu_function` VALUES ('22a675f6-efda-481d-0f59-08d9fdad00ab', 30, 20, 'Update', '修改', 'Update', NULL, '2022-03-04 15:25:36.000000', NULL, '2022-03-04 15:25:36.000000');
INSERT INTO `sys_menu_function` VALUES ('2469188c-21de-492a-0f5e-08d9fdad00ab', 80, 20, 'Print', '打印', 'Print', NULL, '2022-03-04 15:25:36.000000', NULL, '2022-03-04 15:25:36.000000');
INSERT INTO `sys_menu_function` VALUES ('2fea8f87-2a13-4c95-0f3c-08d9fdad00ab', 60, 16, 'Search', '检索', 'Search', NULL, '2022-04-22 22:24:03.000000', NULL, '2022-04-22 22:24:03.000000');
INSERT INTO `sys_menu_function` VALUES ('33c80938-82c8-4299-0f12-08d9fdad00ab', 10, 30, 'Display', '显示', 'Display', NULL, '2022-03-04 15:17:09.000000', NULL, '2022-03-04 15:17:09.000000');
INSERT INTO `sys_menu_function` VALUES ('37d3e492-62da-47a4-0f33-08d9fdad00ab', 50, 15, 'Save', '保存', 'Save', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-04 16:28:51.000000', NULL, '2022-03-04 15:25:14.000000');
INSERT INTO `sys_menu_function` VALUES ('38b4704d-7c5d-4f89-a2e7-08da3d8e6577', 60, 31, 'Search', '检索', 'Search', NULL, '2022-05-24 22:05:57.000000', NULL, '2022-05-24 22:05:57.000000');
INSERT INTO `sys_menu_function` VALUES ('3bc0e68f-d03d-4e99-0f26-08d9fdad00ab', 10, 11, 'Display', '显示', 'Display', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-17 16:25:29.000000', NULL, '2022-03-04 15:24:53.000000');
INSERT INTO `sys_menu_function` VALUES ('3cb3cbc7-9e45-4cc3-0f62-08d9fdad00ab', 40, 21, 'Delete', '删除', 'Delete', NULL, '2022-03-04 15:25:40.000000', NULL, '2022-03-04 15:25:40.000000');
INSERT INTO `sys_menu_function` VALUES ('3e44c6f5-e090-40a1-0f58-08d9fdad00ab', 20, 20, 'Insert', '添加', 'Insert', NULL, '2022-03-04 15:25:36.000000', NULL, '2022-03-04 15:25:36.000000');
INSERT INTO `sys_menu_function` VALUES ('3f6d0af7-5386-4d3a-0f71-08d9fdad00ab', 10, 28, 'Display', '显示', 'Display', NULL, '2022-03-04 15:40:52.000000', NULL, '2022-03-04 15:40:52.000000');
INSERT INTO `sys_menu_function` VALUES ('41cb1942-573a-4d63-0f4b-08d9fdad00ab', 50, 25, 'Save', '保存', 'Save', NULL, '2022-03-04 15:25:28.000000', NULL, '2022-03-04 15:25:28.000000');
INSERT INTO `sys_menu_function` VALUES ('437fbf85-8704-4e87-0f3d-08d9fdad00ab', 70, 16, 'Export', '导出', 'Export', NULL, '2022-04-22 22:24:03.000000', NULL, '2022-04-22 22:24:03.000000');
INSERT INTO `sys_menu_function` VALUES ('45e2ca86-4823-4fb9-0f57-08d9fdad00ab', 10, 20, 'Display', '显示', 'Display', NULL, '2022-03-04 15:25:36.000000', NULL, '2022-03-04 15:25:36.000000');
INSERT INTO `sys_menu_function` VALUES ('47e1a6a3-4c89-46bf-c080-08dadf3345bd', 20, 37, 'Insert', '添加', 'Insert', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-16 17:30:09.000000', NULL, NULL);
INSERT INTO `sys_menu_function` VALUES ('48f0a694-0539-4e69-a2e4-08da3d8e6577', 10, 31, 'Display', '显示', 'Display', NULL, '2022-05-24 22:05:57.000000', NULL, '2022-05-24 22:05:57.000000');
INSERT INTO `sys_menu_function` VALUES ('4a67fcdb-a7a9-4e3c-0f49-08d9fdad00ab', 30, 25, 'Update', '修改', 'Update', NULL, '2022-03-04 15:25:28.000000', NULL, '2022-03-04 15:25:28.000000');
INSERT INTO `sys_menu_function` VALUES ('4bbbe120-0cc6-4a08-0f4e-08d9fdad00ab', 80, 25, 'Print', '打印', 'Print', NULL, '2022-03-04 15:25:28.000000', NULL, '2022-03-04 15:25:28.000000');
INSERT INTO `sys_menu_function` VALUES ('4dbf096d-d3d3-4565-a2e5-08da3d8e6577', 40, 31, 'Delete', '删除', 'Delete', NULL, '2022-05-24 22:05:57.000000', NULL, '2022-05-24 22:05:57.000000');
INSERT INTO `sys_menu_function` VALUES ('4e7cd8df-2e35-4d5e-c084-08dadf3345bd', 60, 37, 'Search', '检索', 'Search', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-16 17:30:09.000000', NULL, NULL);
INSERT INTO `sys_menu_function` VALUES ('523b53b5-8159-4a16-0f2b-08d9fdad00ab', 50, 13, 'Save', '保存', 'Save', NULL, '2022-03-04 15:25:07.000000', NULL, '2022-03-04 15:25:07.000000');
INSERT INTO `sys_menu_function` VALUES ('53fdb4a0-ca6e-4568-0f3f-08d9fdad00ab', 10, 17, 'Display', '显示', 'Display', NULL, '2022-03-04 15:25:21.000000', NULL, '2022-03-04 15:25:21.000000');
INSERT INTO `sys_menu_function` VALUES ('541d9045-47b2-4629-0f2e-08d9fdad00ab', 80, 13, 'Print', '打印', 'Print', NULL, '2022-03-04 15:25:07.000000', NULL, '2022-03-04 15:25:07.000000');
INSERT INTO `sys_menu_function` VALUES ('54743c86-ac73-4345-0f5d-08d9fdad00ab', 70, 20, 'Export', '导出', 'Export', NULL, '2022-03-04 15:25:36.000000', NULL, '2022-03-04 15:25:36.000000');
INSERT INTO `sys_menu_function` VALUES ('550f874b-e804-44a0-0f37-08d9fdad00ab', 10, 16, 'Display', '显示', 'Display', NULL, '2022-04-22 22:24:03.000000', NULL, '2022-04-22 22:24:03.000000');
INSERT INTO `sys_menu_function` VALUES ('55750f56-edc9-4771-e2d6-08d9fdefa8f8', 10, 24, 'Display', '显示', 'Display', NULL, '2022-03-04 23:00:02.000000', NULL, '2022-03-04 23:00:02.000000');
INSERT INTO `sys_menu_function` VALUES ('576f8a5d-1c47-47c9-c086-08dadf3345bd', 80, 37, 'Print', '打印', 'Print', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-16 17:30:09.000000', NULL, NULL);
INSERT INTO `sys_menu_function` VALUES ('5e4e87bd-c179-4b5b-0f5c-08d9fdad00ab', 60, 20, 'Search', '检索', 'Search', NULL, '2022-03-04 15:25:36.000000', NULL, '2022-03-04 15:25:36.000000');
INSERT INTO `sys_menu_function` VALUES ('616c4e4a-fb61-49cf-0f5b-08d9fdad00ab', 50, 20, 'Save', '保存', 'Save', NULL, '2022-03-04 15:25:36.000000', NULL, '2022-03-04 15:25:36.000000');
INSERT INTO `sys_menu_function` VALUES ('687254ae-0d76-4788-a4e8-08da1a9d9949', 10, 33, 'Display', '显示', 'Display', NULL, '2022-04-10 10:56:17.000000', NULL, '2022-04-10 10:56:17.000000');
INSERT INTO `sys_menu_function` VALUES ('69da651e-787b-42e5-0f5a-08d9fdad00ab', 40, 20, 'Delete', '删除', 'Delete', NULL, '2022-03-04 15:25:36.000000', NULL, '2022-03-04 15:25:36.000000');
INSERT INTO `sys_menu_function` VALUES ('6b009415-eadf-4dab-0f3e-08d9fdad00ab', 80, 16, 'Print', '打印', 'Print', NULL, '2022-04-22 22:24:03.000000', NULL, '2022-04-22 22:24:03.000000');
INSERT INTO `sys_menu_function` VALUES ('6b209d5a-b366-4a61-0f63-08d9fdad00ab', 50, 21, 'Save', '保存', 'Save', NULL, '2022-03-04 15:25:40.000000', NULL, '2022-03-04 15:25:40.000000');
INSERT INTO `sys_menu_function` VALUES ('6c09c0c0-72fa-4842-0f1f-08d9fdad00ab', 10, 32, 'Display', '显示', 'Display', NULL, '2022-03-18 12:06:38.000000', NULL, '2022-03-18 12:06:38.000000');
INSERT INTO `sys_menu_function` VALUES ('7694fbf5-e28d-424c-e2d7-08d9fdefa8f8', 40, 24, 'Delete', '删除', 'Delete', NULL, '2022-03-04 23:00:02.000000', NULL, '2022-03-04 23:00:02.000000');
INSERT INTO `sys_menu_function` VALUES ('7e0f6c84-d7f1-4243-0f4c-08d9fdad00ab', 60, 25, 'Search', '检索', 'Search', NULL, '2022-03-04 15:25:28.000000', NULL, '2022-03-04 15:25:28.000000');
INSERT INTO `sys_menu_function` VALUES ('7ea8f706-bfe5-42b2-0f42-08d9fdad00ab', 40, 17, 'Delete', '删除', 'Delete', NULL, '2022-03-04 15:25:21.000000', NULL, '2022-03-04 15:25:21.000000');
INSERT INTO `sys_menu_function` VALUES ('823ac05d-65e4-4216-0f39-08d9fdad00ab', 30, 16, 'Update', '修改', 'Update', NULL, '2022-04-22 22:24:03.000000', NULL, '2022-04-22 22:24:03.000000');
INSERT INTO `sys_menu_function` VALUES ('8564e4d8-d7f4-4f12-0f31-08d9fdad00ab', 30, 15, 'Update', '修改', 'Update', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-04 16:28:51.000000', NULL, '2022-03-04 15:25:14.000000');
INSERT INTO `sys_menu_function` VALUES ('86465238-c51c-45d5-0f40-08d9fdad00ab', 20, 17, 'Insert', '添加', 'Insert', NULL, '2022-03-04 15:25:21.000000', NULL, '2022-03-04 15:25:21.000000');
INSERT INTO `sys_menu_function` VALUES ('86ff83fd-d34a-4290-0f41-08d9fdad00ab', 30, 17, 'Update', '修改', 'Update', NULL, '2022-03-04 15:25:21.000000', NULL, '2022-03-04 15:25:21.000000');
INSERT INTO `sys_menu_function` VALUES ('92b39a10-3927-4ee7-0f6a-08d9fdad00ab', 40, 23, 'Delete', '删除', 'Delete', NULL, '2022-03-04 15:25:50.000000', NULL, '2022-03-04 15:25:50.000000');
INSERT INTO `sys_menu_function` VALUES ('9426768e-b90d-41e1-0f67-08d9fdad00ab', 10, 23, 'Display', '显示', 'Display', NULL, '2022-03-04 15:25:50.000000', NULL, '2022-03-04 15:25:50.000000');
INSERT INTO `sys_menu_function` VALUES ('9c9b41fd-db96-48cf-c07f-08dadf3345bd', 10, 37, 'Display', '显示', 'Display', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-16 17:30:09.000000', NULL, NULL);
INSERT INTO `sys_menu_function` VALUES ('a03d56d7-4b0d-47cc-0f6b-08d9fdad00ab', 50, 23, 'Save', '保存', 'Save', NULL, '2022-03-04 15:25:50.000000', NULL, '2022-03-04 15:25:50.000000');
INSERT INTO `sys_menu_function` VALUES ('a1ddd02f-8c21-4d79-0f21-08d9fdad00ab', 10, 5, 'Display', '显示', 'Display', NULL, '2022-03-04 15:24:30.000000', NULL, '2022-03-04 15:24:30.000000');
INSERT INTO `sys_menu_function` VALUES ('a3754771-f6e9-4a23-0f2c-08d9fdad00ab', 60, 13, 'Search', '检索', 'Search', NULL, '2022-03-04 15:25:07.000000', NULL, '2022-03-04 15:25:07.000000');
INSERT INTO `sys_menu_function` VALUES ('a46e07d3-c722-4548-0f35-08d9fdad00ab', 70, 15, 'Export', '导出', 'Export', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-04 16:28:51.000000', NULL, '2022-03-04 15:25:14.000000');
INSERT INTO `sys_menu_function` VALUES ('a726455f-1c29-4be0-0f45-08d9fdad00ab', 70, 17, 'Export', '导出', 'Export', NULL, '2022-03-04 15:25:21.000000', NULL, '2022-03-04 15:25:21.000000');
INSERT INTO `sys_menu_function` VALUES ('a7cd04db-bbe3-49b6-0f1e-08d9fdad00ab', 10, 2, 'Display', '显示', 'Display', NULL, '2022-03-18 12:06:20.000000', NULL, '2022-03-18 12:06:20.000000');
INSERT INTO `sys_menu_function` VALUES ('a9503588-e6f7-420b-0f65-08d9fdad00ab', 70, 21, 'Export', '导出', 'Export', NULL, '2022-03-04 15:25:40.000000', NULL, '2022-03-04 15:25:40.000000');
INSERT INTO `sys_menu_function` VALUES ('b5881044-afb8-40b2-0f28-08d9fdad00ab', 20, 13, 'Insert', '添加', 'Insert', NULL, '2022-03-04 15:25:07.000000', NULL, '2022-03-04 15:25:07.000000');
INSERT INTO `sys_menu_function` VALUES ('b7533a90-dae4-4263-0f24-08d9fdad00ab', 10, 9, 'Display', '显示', 'Display', NULL, '2022-03-04 15:24:43.000000', NULL, '2022-03-04 15:24:43.000000');
INSERT INTO `sys_menu_function` VALUES ('b96f977c-a36e-4e7f-0f2d-08d9fdad00ab', 70, 13, 'Export', '导出', 'Export', NULL, '2022-03-04 15:25:07.000000', NULL, '2022-03-04 15:25:07.000000');
INSERT INTO `sys_menu_function` VALUES ('b98a365e-6fb4-4efb-0f69-08d9fdad00ab', 30, 23, 'Update', '修改', 'Update', NULL, '2022-03-04 15:25:50.000000', NULL, '2022-03-04 15:25:50.000000');
INSERT INTO `sys_menu_function` VALUES ('bd6ae6da-1ca6-46c2-0f3a-08d9fdad00ab', 40, 16, 'Delete', '删除', 'Delete', NULL, '2022-04-22 22:24:03.000000', NULL, '2022-04-22 22:24:03.000000');
INSERT INTO `sys_menu_function` VALUES ('beb87004-5cfb-417a-0f34-08d9fdad00ab', 60, 15, 'Search', '检索', 'Search', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-04 16:28:51.000000', NULL, '2022-03-04 15:25:14.000000');
INSERT INTO `sys_menu_function` VALUES ('c6400925-a381-4679-c082-08dadf3345bd', 40, 37, 'Delete', '删除', 'Delete', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-16 17:30:09.000000', NULL, NULL);
INSERT INTO `sys_menu_function` VALUES ('c67a0abe-daec-491b-0f38-08d9fdad00ab', 20, 16, 'Insert', '添加', 'Insert', NULL, '2022-04-22 22:24:03.000000', NULL, '2022-04-22 22:24:03.000000');
INSERT INTO `sys_menu_function` VALUES ('c6ba141b-99ba-4114-0f5f-08d9fdad00ab', 10, 21, 'Display', '显示', 'Display', NULL, '2022-03-04 15:25:40.000000', NULL, '2022-03-04 15:25:40.000000');
INSERT INTO `sys_menu_function` VALUES ('c77c812a-1601-4311-0f70-08d9fdad00ab', 10, 19, 'Display', '显示', 'Display', NULL, '2022-03-04 15:26:00.000000', NULL, '2022-03-04 15:26:00.000000');
INSERT INTO `sys_menu_function` VALUES ('c8edbb79-567e-461b-0f36-08d9fdad00ab', 80, 15, 'Print', '打印', 'Print', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-04 16:28:51.000000', NULL, '2022-03-04 15:25:14.000000');
INSERT INTO `sys_menu_function` VALUES ('c981aa0b-d60e-4160-c085-08dadf3345bd', 70, 37, 'Export', '导出', 'Export', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-16 17:30:09.000000', NULL, NULL);
INSERT INTO `sys_menu_function` VALUES ('c9e5fff0-6744-47d7-0f66-08d9fdad00ab', 80, 21, 'Print', '打印', 'Print', NULL, '2022-03-04 15:25:40.000000', NULL, '2022-03-04 15:25:40.000000');
INSERT INTO `sys_menu_function` VALUES ('cce82eb4-7fc5-4308-0f30-08d9fdad00ab', 20, 15, 'Insert', '添加', 'Insert', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-04 16:28:51.000000', NULL, '2022-03-04 15:25:14.000000');
INSERT INTO `sys_menu_function` VALUES ('d2e6ea60-2cf6-478a-0f23-08d9fdad00ab', 10, 8, 'Display', '显示', 'Display', NULL, '2022-03-04 15:24:40.000000', NULL, '2022-03-04 15:24:40.000000');
INSERT INTO `sys_menu_function` VALUES ('d51a17af-163e-4a74-c081-08dadf3345bd', 30, 37, 'Update', '修改', 'Update', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-16 17:30:09.000000', NULL, NULL);
INSERT INTO `sys_menu_function` VALUES ('db3ab8bd-7709-41a2-0f47-08d9fdad00ab', 10, 25, 'Display', '显示', 'Display', NULL, '2022-03-04 15:25:28.000000', NULL, '2022-03-04 15:25:28.000000');
INSERT INTO `sys_menu_function` VALUES ('dee401b1-e20e-496e-0f43-08d9fdad00ab', 50, 17, 'Save', '保存', 'Save', NULL, '2022-03-04 15:25:21.000000', NULL, '2022-03-04 15:25:21.000000');
INSERT INTO `sys_menu_function` VALUES ('e2319118-42cc-41a2-0f6c-08d9fdad00ab', 60, 23, 'Search', '检索', 'Search', NULL, '2022-03-04 15:25:50.000000', NULL, '2022-03-04 15:25:50.000000');
INSERT INTO `sys_menu_function` VALUES ('e991934a-0d30-416b-0f68-08d9fdad00ab', 20, 23, 'Insert', '添加', 'Insert', NULL, '2022-03-04 15:25:50.000000', NULL, '2022-03-04 15:25:50.000000');
INSERT INTO `sys_menu_function` VALUES ('eb958545-6449-40db-0f27-08d9fdad00ab', 10, 13, 'Display', '显示', 'Display', NULL, '2022-03-04 15:25:07.000000', NULL, '2022-03-04 15:25:07.000000');
INSERT INTO `sys_menu_function` VALUES ('ec535908-8671-4928-0f25-08d9fdad00ab', 10, 10, 'Display', '显示', 'Display', NULL, '2022-03-04 15:24:47.000000', NULL, '2022-03-04 15:24:47.000000');
INSERT INTO `sys_menu_function` VALUES ('ef70b789-21ee-4850-0f1b-08d9fdad00ab', 10, 22, 'Display', '显示', 'Display', NULL, '2022-03-04 15:16:44.000000', NULL, '2022-03-04 15:16:44.000000');
INSERT INTO `sys_menu_function` VALUES ('f36b9b06-2826-425f-0f64-08d9fdad00ab', 60, 21, 'Search', '检索', 'Search', NULL, '2022-03-04 15:25:40.000000', NULL, '2022-03-04 15:25:40.000000');
INSERT INTO `sys_menu_function` VALUES ('f4621fbe-6b40-4454-0f2a-08d9fdad00ab', 40, 13, 'Delete', '删除', 'Delete', NULL, '2022-03-04 15:25:07.000000', NULL, '2022-03-04 15:25:07.000000');
INSERT INTO `sys_menu_function` VALUES ('f4c73ac0-c66d-4988-0f61-08d9fdad00ab', 30, 21, 'Update', '修改', 'Update', NULL, '2022-03-04 15:25:40.000000', NULL, '2022-03-04 15:25:40.000000');
INSERT INTO `sys_menu_function` VALUES ('f64cfe50-1ef1-457f-0f20-08d9fdad00ab', 10, 3, 'Display', '显示', 'Display', NULL, '2022-03-04 15:24:24.000000', NULL, '2022-03-04 15:24:24.000000');
INSERT INTO `sys_menu_function` VALUES ('fe6465bf-e429-45bd-0f48-08d9fdad00ab', 20, 25, 'Insert', '添加', 'Insert', NULL, '2022-03-04 15:25:28.000000', NULL, '2022-03-04 15:25:28.000000');

-- ----------------------------
-- Table structure for sys_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_operation_log`;
CREATE TABLE `sys_operation_log`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Api` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Ip` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Form` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `FormBody` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `QueryString` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `TakeUpTime` bigint NOT NULL,
  `Browser` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `OS` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `UserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `ControllerDisplayName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ActionDisplayName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `CreatorUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `LastModifierUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_operation_log
-- ----------------------------
INSERT INTO `sys_operation_log` VALUES ('08dae163-efa4-43d0-8e7e-d6d568bab644', '/', '0.0.0.1', '', '', '', 82, 'Edge108', 'Windows10', NULL, NULL, NULL, '00000000-0000-0000-0000-000000000000', '2022-12-19 09:54:16.753921', NULL, NULL);
INSERT INTO `sys_operation_log` VALUES ('08dae163-f16a-4b0b-809b-2f8370a8645f', '/api/admin/SysUser/info', '0.0.0.1', '', '', '', 155, 'Edge108', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', '系统账号', '获取当前用户信息', '00000000-0000-0000-0000-000000000000', '2022-12-19 09:54:19.466606', NULL, NULL);
INSERT INTO `sys_operation_log` VALUES ('08dae163-f2bd-43a4-88fe-920b381d30c9', '/api/account/check', '0.0.0.1', '', '{\"userName\":\"admin\",\"userPassword\":\"123456\"}', '', 181, 'Edge108', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', NULL, NULL, '00000000-0000-0000-0000-000000000000', '2022-12-19 09:54:21.684820', NULL, NULL);
INSERT INTO `sys_operation_log` VALUES ('08dae163-f335-4610-8fe7-71850d49c856', '/api/admin/SysUser/info', '0.0.0.1', '', '', '', 673, 'Edge108', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', '系统账号', '获取当前用户信息', '00000000-0000-0000-0000-000000000000', '2022-12-19 09:54:22.472170', NULL, NULL);

-- ----------------------------
-- Table structure for sys_organization
-- ----------------------------
DROP TABLE IF EXISTS `sys_organization`;
CREATE TABLE `sys_organization`  (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `OrderNumber` int NULL DEFAULT NULL,
  `LevelCode` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Leader` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Phone` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Email` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `State` int NULL DEFAULT NULL,
  `ParentId` int NULL DEFAULT NULL,
  `CreatorUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `LastModifierUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_organization
-- ----------------------------
INSERT INTO `sys_organization` VALUES (1, '阿里巴巴集团', 1, '1', 'hzy', '18410912184', '18410912184@qq.com', 1, NULL, NULL, '2021-05-27 20:50:31.000000', NULL, '2021-05-27 20:50:31.000000');
INSERT INTO `sys_organization` VALUES (2, '北京分部', 3, '1.2', '北京分部', '132123', '13131', 1, 1, NULL, '2021-05-27 22:33:44.000000', NULL, '2021-12-28 16:13:34.000000');
INSERT INTO `sys_organization` VALUES (3, '市场部门', 1, '1.2.3', '市场部门', '234124234', '234234@qq.com', 1, 2, NULL, '2021-05-27 22:33:57.000000', NULL, '2021-05-27 22:33:57.000000');
INSERT INTO `sys_organization` VALUES (4, '财务部门', 2, '1.2.4', '财务部门', '435543535', '123@qq.com', 1, 2, NULL, '2021-05-27 22:34:11.000000', NULL, '2021-05-27 22:34:11.000000');
INSERT INTO `sys_organization` VALUES (5, '成都分部', 2, '1.5', '成都分部', '123123123', '123@qq.com', 1, 1, NULL, '2021-05-27 21:01:50.000000', NULL, '2021-05-27 22:31:45.000000');
INSERT INTO `sys_organization` VALUES (7, '研发部门', 1, '1.5.7', '研发部门', '1234323423', '12312@qq.com', 1, 5, NULL, '2021-05-27 22:32:08.000000', NULL, '2021-05-27 22:32:29.000000');
INSERT INTO `sys_organization` VALUES (9, '运维部门', 4, '1.5.9', '运维部门', '1232133452', '12341@qq.com', 1, 5, NULL, '2021-05-27 22:33:25.000000', NULL, '2022-03-08 17:07:47.000000');
INSERT INTO `sys_organization` VALUES (10, '测试部门', 3, '1.5.10', '测试部门', '12313', '123123@qq.com', 1, 5, NULL, '2021-05-27 22:32:59.000000', NULL, '2021-05-27 22:32:59.000000');
INSERT INTO `sys_organization` VALUES (11, '技术部门', 2, '1.5.11', '技术部门', '12345678911', '12345678901@qq.com', 1, 5, NULL, '2022-03-08 17:00:20.000000', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-04 17:50:10.000000');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Number` int NULL DEFAULT NULL,
  `Code` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `State` int NOT NULL,
  `Remarks` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `CreatorUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `LastModifierUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('0716b4b0-9a06-43e9-8ae8-82c74875f83e', 2, 'se', '项目经理', 1, NULL, NULL, '2021-05-27 20:26:35.000000', NULL, '2021-05-27 20:26:35.000000');
INSERT INTO `sys_post` VALUES ('96927c30-41d0-4ced-8e29-cbed35c90fb0', 1, 'ceo', '董事长', 1, NULL, NULL, '2021-05-27 20:26:22.000000', NULL, '2021-05-27 20:26:22.000000');
INSERT INTO `sys_post` VALUES ('e46af329-6d08-442c-9837-f22cff954411', 4, 'user', '普通员工', 1, NULL, NULL, '2021-05-27 20:26:52.000000', NULL, '2022-04-23 21:50:55.000000');
INSERT INTO `sys_post` VALUES ('f0bd38c2-f1de-4bd9-e2db-08da00a93622', 5, 'dotnet_engineer', 'DotNet软件工程师', 1, NULL, NULL, '2022-03-08 10:13:18.000000', NULL, '2022-03-08 10:13:18.000000');
INSERT INTO `sys_post` VALUES ('f0c67537-8094-429a-b474-f54ac518609e', 3, 'hr', '人力资源', 1, NULL, NULL, '2021-05-27 20:26:44.000000', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-04 17:03:50.000000');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Number` int NULL DEFAULT NULL,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `DeleteLock` tinyint(1) NOT NULL,
  `CreatorUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `LastModifierUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('18fa4771-6f58-46a3-80d2-6f0f5e9972e3', 1, '超级管理员', '超级管理员', 1, NULL, '2016-07-06 17:59:20.000000', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-04 14:02:19.000000');
INSERT INTO `sys_role` VALUES ('40ff1844-c099-4061-98e0-cd6e544fcfd3', 2, '普通用户', '普通用户', 1, NULL, '2016-07-06 17:59:20.000000', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-04 14:04:32.000000');

-- ----------------------------
-- Table structure for sys_role_menu_function
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu_function`;
CREATE TABLE `sys_role_menu_function`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `RoleId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `MenuId` int NOT NULL,
  `MenuFunctionId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `CreatorUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `LastModifierUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu_function
-- ----------------------------
INSERT INTO `sys_role_menu_function` VALUES ('7af695f2-0a26-464d-15e0-08dad5c66e71', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 2, 'a7cd04db-bbe3-49b6-0f1e-08d9fdad00ab', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-04 15:09:05.000000', NULL, NULL);
INSERT INTO `sys_role_menu_function` VALUES ('cd6175d8-67cc-4f62-15e2-08dad5c66e71', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 19, 'c77c812a-1601-4311-0f70-08d9fdad00ab', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-04 15:09:05.000000', NULL, NULL);
INSERT INTO `sys_role_menu_function` VALUES ('cf8e1d9e-74e5-4f1e-15e1-08dad5c66e71', '40ff1844-c099-4061-98e0-cd6e544fcfd3', 3, 'f64cfe50-1ef1-457f-0f20-08d9fdad00ab', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-04 15:09:05.000000', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `LoginName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Password` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Phone` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Email` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DeleteLock` tinyint(1) NOT NULL,
  `OrganizationId` int NULL DEFAULT NULL,
  `CreatorUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `LastModifierUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('0198459e-2034-4533-b843-5d227ad20740', '超级管理员', 'admin', 'E10ADC3949BA59ABBE56E057F20F883E', '10000000000', '1396510655@qq.com', 1, 7, NULL, '2017-04-06 19:55:53.000000', NULL, '2022-03-08 17:27:36.000000');
INSERT INTO `sys_user` VALUES ('3739f349-7995-4c63-62d8-08da00e3d8a0', '白居易', '白居易', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 0, 7, NULL, '2022-03-08 17:17:58.000000', NULL, '2022-03-08 17:17:58.000000');
INSERT INTO `sys_user` VALUES ('4fd6a740-0cf1-4975-62d6-08da00e3d8a0', '李商隐', '李商隐', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 0, 7, NULL, '2022-03-08 17:14:13.000000', NULL, '2022-03-08 17:14:13.000000');
INSERT INTO `sys_user` VALUES ('5722af0f-2366-4fc9-62d5-08da00e3d8a0', '杜甫', '杜甫', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 0, 7, NULL, '2022-03-08 17:13:02.000000', NULL, '2022-03-08 17:13:02.000000');
INSERT INTO `sys_user` VALUES ('a1b6dafb-2b6a-4ff9-62da-08da00e3d8a0', '屈原', '屈原', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 0, 7, NULL, '2022-03-08 17:19:55.000000', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-04 12:06:00.000000');
INSERT INTO `sys_user` VALUES ('a3f9784c-5f00-4ec9-62d9-08da00e3d8a0', '陶渊明 ', '陶渊明 ', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 0, 7, NULL, '2022-03-08 17:19:22.000000', NULL, '2022-03-08 17:19:22.000000');
INSERT INTO `sys_user` VALUES ('ac18f496-e93d-42f0-b59e-e321acc85335', '李白', 'libai', 'E10ADC3949BA59ABBE56E057F20F883E', '12345678900', '12345678900@live.com', 1, 7, NULL, '2017-04-06 19:55:53.000000', NULL, '2022-03-08 10:12:14.000000');
INSERT INTO `sys_user` VALUES ('e225e163-31c9-4da9-62d7-08da00e3d8a0', '苏轼', '苏轼', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 0, 7, NULL, '2022-03-08 17:15:07.000000', NULL, '2022-03-08 17:15:07.000000');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `UserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `PostId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `CreatorUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `LastModifierUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('0c1a55ba-6bd3-4810-a494-a6b9b7374d4d', 'ac18f496-e93d-42f0-b59e-e321acc85335', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', NULL, '2022-03-08 10:13:35.000000', NULL, '2022-03-08 10:13:35.000000');
INSERT INTO `sys_user_post` VALUES ('12c6bb86-494a-48c8-b8f4-1fad0e20ce49', 'fff73fa3-4298-4794-0d99-08daa158397b', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', '0198459e-2034-4533-b843-5d227ad20740', '2022-09-28 21:49:23.000000', NULL, NULL);
INSERT INTO `sys_user_post` VALUES ('14f4aa4e-c910-40b3-ae8f-158d91bd06d9', 'e225e163-31c9-4da9-62d7-08da00e3d8a0', 'e46af329-6d08-442c-9837-f22cff954411', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-12 10:36:51.000000', NULL, '2022-03-08 17:15:08.000000');
INSERT INTO `sys_user_post` VALUES ('3d1b49b9-bd55-4f75-aad7-e7b10e080d00', 'a1b6dafb-2b6a-4ff9-62da-08da00e3d8a0', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-04 12:06:00.000000', NULL, '2022-06-21 19:59:02.000000');
INSERT INTO `sys_user_post` VALUES ('575bf085-47bb-42f2-8b68-620cf460b164', '0198459e-2034-4533-b843-5d227ad20740', '96927c30-41d0-4ced-8e29-cbed35c90fb0', NULL, '2022-03-08 17:29:22.000000', NULL, '2022-03-08 17:29:22.000000');
INSERT INTO `sys_user_post` VALUES ('6c34f115-28dd-441a-81d5-f6598c97d44a', 'a3f9784c-5f00-4ec9-62d9-08da00e3d8a0', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', NULL, '2022-03-08 17:19:22.000000', NULL, '2022-03-08 17:19:22.000000');
INSERT INTO `sys_user_post` VALUES ('6f671077-c98d-4106-9736-bf2edb6db58d', '4fd6a740-0cf1-4975-62d6-08da00e3d8a0', 'e46af329-6d08-442c-9837-f22cff954411', NULL, '2022-03-08 17:14:13.000000', NULL, '2022-03-08 17:14:13.000000');
INSERT INTO `sys_user_post` VALUES ('8af7ff30-7411-423d-85a3-13740c5fef87', 'e225e163-31c9-4da9-62d7-08da00e3d8a0', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-12 10:36:51.000000', NULL, '2022-03-08 17:15:07.000000');
INSERT INTO `sys_user_post` VALUES ('9eb74344-044d-4d86-a9f0-197ba416b964', '3739f349-7995-4c63-62d8-08da00e3d8a0', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', '0198459e-2034-4533-b843-5d227ad20740', '2022-10-20 21:02:11.000000', NULL, '2022-03-08 17:17:58.000000');
INSERT INTO `sys_user_post` VALUES ('ade7e59b-0163-49ee-b2ce-12a59b90b0cf', '4c178551-1f0f-463c-0d9a-08daa158397b', '0716b4b0-9a06-43e9-8ae8-82c74875f83e', '0198459e-2034-4533-b843-5d227ad20740', '2022-09-28 21:49:42.000000', NULL, NULL);
INSERT INTO `sys_user_post` VALUES ('af1bec7e-3309-4629-9606-72eefa1826b3', 'cc186fe2-ee27-4292-62db-08da00e3d8a0', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', NULL, '2022-03-08 17:20:20.000000', NULL, '2022-03-08 17:20:20.000000');
INSERT INTO `sys_user_post` VALUES ('b669ec48-aa60-441a-b59d-7f9be7b94155', '1550d6d4-0529-4fdd-62dc-08da00e3d8a0', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', NULL, '2022-07-06 21:49:13.000000', NULL, '2022-07-06 21:49:13.000000');
INSERT INTO `sys_user_post` VALUES ('b797ff16-d6f7-45db-83ec-f910b2612926', '4fd6a740-0cf1-4975-62d6-08da00e3d8a0', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', NULL, '2022-03-08 17:14:13.000000', NULL, '2022-03-08 17:14:13.000000');
INSERT INTO `sys_user_post` VALUES ('b97331a7-e281-4027-aade-9f068558826a', '5722af0f-2366-4fc9-62d5-08da00e3d8a0', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', NULL, '2022-03-08 17:13:02.000000', NULL, '2022-03-08 17:13:02.000000');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `UserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `RoleId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `CreatorUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `LastModifierUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1c9f81df-c8a0-45bb-a272-c84bd3af0c19', '0198459e-2034-4533-b843-5d227ad20740', '18fa4771-6f58-46a3-80d2-6f0f5e9972e3', NULL, '2022-03-08 17:29:22.000000', NULL, '2022-03-08 17:29:22.000000');
INSERT INTO `sys_user_role` VALUES ('3da871b8-fda5-4935-b532-0ff0b3c3913b', 'a1b6dafb-2b6a-4ff9-62da-08da00e3d8a0', '40ff1844-c099-4061-98e0-cd6e544fcfd3', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-04 12:06:00.000000', NULL, '2022-06-21 19:59:02.000000');
INSERT INTO `sys_user_role` VALUES ('982f0a52-e8c8-4b9f-91c7-beb592d6502d', 'e225e163-31c9-4da9-62d7-08da00e3d8a0', '40ff1844-c099-4061-98e0-cd6e544fcfd3', '0198459e-2034-4533-b843-5d227ad20740', '2022-12-12 10:36:51.000000', NULL, '2022-03-08 17:15:07.000000');
INSERT INTO `sys_user_role` VALUES ('a9f8a23b-8c2f-43cc-97af-8ed6f4c4d097', '4fd6a740-0cf1-4975-62d6-08da00e3d8a0', '40ff1844-c099-4061-98e0-cd6e544fcfd3', NULL, '2022-03-08 17:14:13.000000', NULL, '2022-03-08 17:14:13.000000');
INSERT INTO `sys_user_role` VALUES ('ce9f61ac-79d8-426f-9066-36962c017bf6', '5722af0f-2366-4fc9-62d5-08da00e3d8a0', '40ff1844-c099-4061-98e0-cd6e544fcfd3', NULL, '2022-03-08 17:13:02.000000', NULL, '2022-03-08 17:13:02.000000');
INSERT INTO `sys_user_role` VALUES ('dbc656a6-4264-417d-97d8-577e1218feca', 'a3f9784c-5f00-4ec9-62d9-08da00e3d8a0', '40ff1844-c099-4061-98e0-cd6e544fcfd3', NULL, '2022-03-08 17:19:22.000000', NULL, '2022-03-08 17:19:22.000000');
INSERT INTO `sys_user_role` VALUES ('e5396c4c-2b8c-468d-94c3-8d5be0e559c1', '3739f349-7995-4c63-62d8-08da00e3d8a0', '40ff1844-c099-4061-98e0-cd6e544fcfd3', '0198459e-2034-4533-b843-5d227ad20740', '2022-10-20 21:02:11.000000', NULL, '2022-03-08 17:17:58.000000');
INSERT INTO `sys_user_role` VALUES ('fa1fdf14-3847-4194-894c-cd935a3dd9e6', 'ac18f496-e93d-42f0-b59e-e321acc85335', '40ff1844-c099-4061-98e0-cd6e544fcfd3', NULL, '2022-03-08 10:13:35.000000', NULL, '2022-03-08 10:13:35.000000');

SET FOREIGN_KEY_CHECKS = 1;
