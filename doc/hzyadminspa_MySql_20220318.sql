/*
 Navicat Premium Data Transfer

 Source Server         : 本地_MySql
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : hzyadminspa20220318

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 18/03/2022 11:33:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `Id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Birthday` datetime NULL DEFAULT NULL,
  `Photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Introduce` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FilePath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UserId` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CreationTime` datetime NULL DEFAULT NULL,
  `LastModificationTime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('96A1AA3D-A61A-42D0-954A-C71753FB2065', '123', '123', '123', '女', '2018-04-25 23:00:00', NULL, '<p>123</p>', NULL, 'AC18F496-E93D-42F0-B59E-E321ACC85335', '2020-10-24 00:07:42', '2021-04-18 22:08:06');
INSERT INTO `member` VALUES ('9A604AA2-9AE6-4A2F-8DDB-D9E0289EAD9E', '1', '测试会员', '18510912123', '男', '2019-07-08 11:47:24', '/upload/files/20210118/time_232747_old_name_hzy.png', '<p>888</p>', '/upload/files/20210118/time_233310_old_name_hzy.png', 'AC18F496-E93D-42F0-B59E-E321ACC85335', '2018-04-25 23:00:00', '2021-01-19 14:19:47');

-- ----------------------------
-- Table structure for sysdataauthority
-- ----------------------------
DROP TABLE IF EXISTS `sysdataauthority`;
CREATE TABLE `sysdataauthority`  (
  `Id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LastModificationTime` datetime NULL DEFAULT NULL,
  `CreationTime` datetime NULL DEFAULT NULL,
  `RoleId` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PermissionType` int NULL DEFAULT NULL COMMENT '数据权限类型',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sysdataauthority
-- ----------------------------
INSERT INTO `sysdataauthority` VALUES ('40C10217-B94C-43EC-237E-08DA00442990', '2022-03-18 09:45:30', '2022-03-07 22:10:18', '40FF1844-C099-4061-98E0-CD6E544FCFD3', 5);

-- ----------------------------
-- Table structure for sysdataauthoritycustom
-- ----------------------------
DROP TABLE IF EXISTS `sysdataauthoritycustom`;
CREATE TABLE `sysdataauthoritycustom`  (
  `Id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LastModificationTime` datetime NULL DEFAULT NULL,
  `CreationTime` datetime NULL DEFAULT NULL,
  `SysDataAuthorityId` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SysOrganizationId` int NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sysdataauthoritycustom
-- ----------------------------

-- ----------------------------
-- Table structure for sysdictionary
-- ----------------------------
DROP TABLE IF EXISTS `sysdictionary`;
CREATE TABLE `sysdictionary`  (
  `Id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `LastModificationTime` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `CreationTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `Sort` int NULL DEFAULT NULL COMMENT '排序号',
  `Code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码',
  `Value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值',
  `Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分组名/键',
  `ParentId` int NULL DEFAULT NULL COMMENT '父级分组id',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据字典' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sysdictionary
-- ----------------------------
INSERT INTO `sysdictionary` VALUES (1, '2021-07-25 22:39:35', '2021-07-25 22:31:30', 1, 'news_type', NULL, '资讯类别', NULL);
INSERT INTO `sysdictionary` VALUES (2, '2021-07-25 22:40:30', '2021-07-25 22:38:49', 1, 'news_type_nan', '1', '男', 1);
INSERT INTO `sysdictionary` VALUES (3, '2021-07-25 22:40:53', '2021-07-25 22:40:48', 2, 'news_type_nv', '2', '女', 1);

-- ----------------------------
-- Table structure for sysfunction
-- ----------------------------
DROP TABLE IF EXISTS `sysfunction`;
CREATE TABLE `sysfunction`  (
  `Id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Number` int NULL DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ByName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime NULL DEFAULT NULL,
  `CreationTime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sysfunction
-- ----------------------------
INSERT INTO `sysfunction` VALUES ('2401F4D0-60B0-4E2E-903F-84C603373572', 70, '导出', 'Export', 'Export', '2021-04-18 22:08:06', '2016-06-20 13:40:52');
INSERT INTO `sysfunction` VALUES ('383E7EE2-7690-46AC-9230-65155C84AA30', 50, '保存', 'Save', 'Save', '2021-04-18 22:08:06', '2016-06-20 13:40:52');
INSERT INTO `sysfunction` VALUES ('9C388461-2704-4C5E-A729-72C17E9018E1', 40, '删除', 'Delete', 'Delete', '2021-04-18 22:08:06', '2016-06-20 13:40:52');
INSERT INTO `sysfunction` VALUES ('B6FD5425-504A-46A9-993B-2F8DC9158EB8', 80, '打印', 'Print', 'Print', '2021-04-18 22:08:06', '2016-06-20 13:40:52');
INSERT INTO `sysfunction` VALUES ('BFFEFB1C-8988-4DDF-B4AC-81C2B30E80CD', 20, '添加', 'Insert', 'Insert', '2021-04-18 22:08:06', '2016-06-20 13:40:52');
INSERT INTO `sysfunction` VALUES ('C9518758-B2E1-4F51-B517-5282E273889C', 10, '显示', 'Display', 'Display', '2021-04-18 22:08:06', '2016-06-20 13:40:52');
INSERT INTO `sysfunction` VALUES ('E7EF2A05-8317-41C3-B588-99519FE88BF9', 30, '修改', 'Update', 'Update', '2021-04-18 22:08:06', '2016-06-20 13:40:52');
INSERT INTO `sysfunction` VALUES ('F27ECB0A-197D-47B1-B243-59A8C71302BF', 60, '检索', 'Search', 'Search', '2021-04-18 22:08:06', '2016-06-20 13:40:52');

-- ----------------------------
-- Table structure for sysmenu
-- ----------------------------
DROP TABLE IF EXISTS `sysmenu`;
CREATE TABLE `sysmenu`  (
  `Id` int NOT NULL AUTO_INCREMENT,
  `LastModificationTime` datetime NULL DEFAULT NULL,
  `CreationTime` datetime NULL DEFAULT NULL,
  `LevelCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Number` int NULL DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Router` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ComponentName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ParentId` int NULL DEFAULT NULL,
  `Show` tinyint NULL DEFAULT NULL,
  `Close` tinyint NULL DEFAULT NULL,
  `KeepAlive` tinyint NULL DEFAULT NULL,
  `State` tinyint NULL DEFAULT NULL,
  `JumpUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Type` int NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sysmenu
-- ----------------------------
INSERT INTO `sysmenu` VALUES (1, '2022-03-04 12:25:39', '2021-05-28 11:49:02', '1', 10, '更多示例', NULL, NULL, NULL, 'MoreOutlined', NULL, 1, 1, 1, 1, NULL, 1);
INSERT INTO `sysmenu` VALUES (2, '2022-03-04 12:26:04', '2021-01-16 16:05:22', '1.2', 10, 'Antd Vue3.0组件', 'views/AntdVueComponents.vue', '/antd/vue/components', 'AntdVueComponentsCom', 'LayoutOutlined', 1, 1, 1, 1, 1, NULL, 2);
INSERT INTO `sysmenu` VALUES (3, '2022-03-04 12:26:14', '2020-12-17 14:58:05', '1.3', 30, '按钮', 'views/Button.vue', '/button', 'ButtonCom', 'AppstoreOutlined', 1, 1, 1, 1, 1, NULL, 2);
INSERT INTO `sysmenu` VALUES (4, '2022-03-04 12:26:21', '2021-01-16 16:06:33', '1.4', 40, '图表 AntV G2', NULL, NULL, NULL, 'PieChartOutlined', 1, 1, 1, 1, 1, NULL, 1);
INSERT INTO `sysmenu` VALUES (5, '2022-03-04 12:26:25', '2021-01-16 16:07:24', '1.4.5', 10, '基础图表', 'views/chart/Base.vue', '/chart/base', 'ChartBaseCom', NULL, 4, 1, 1, 1, 1, NULL, 2);
INSERT INTO `sysmenu` VALUES (6, '2022-03-04 12:26:28', '2021-01-16 16:10:06', '1.4.6', 20, '更多图表', 'views/chart/More.vue', '/chart/more', 'ChartMoreCom', NULL, 4, 1, 1, 1, 1, NULL, 2);
INSERT INTO `sysmenu` VALUES (7, '2022-03-04 12:26:34', '2018-03-10 12:16:38', '1.7', 50, '表格管理', NULL, NULL, NULL, 'TableOutlined', 1, 1, 1, 1, 1, NULL, 1);
INSERT INTO `sysmenu` VALUES (8, '2022-03-04 12:26:38', '2020-12-17 14:49:12', '1.7.8', 100, '基础列表', 'views/BaseList.vue', '/base/list', 'BaseListCom', NULL, 7, 1, 1, 1, 1, NULL, 2);
INSERT INTO `sysmenu` VALUES (9, '2022-03-04 12:26:41', '2020-12-17 14:51:07', '1.7.9', 110, '标准表格', 'views/list/Index.vue', '/list', 'ListIndexCom', NULL, 7, 1, 1, 1, 1, NULL, 2);
INSERT INTO `sysmenu` VALUES (10, '2022-03-04 12:26:46', '2021-01-18 19:34:28', '1.10', 60, '富文本编辑器', 'views/Editor.vue', '/editor', 'EditorCom', 'PicRightOutlined', 1, 1, 1, 1, 1, NULL, 2);
INSERT INTO `sysmenu` VALUES (11, '2022-03-04 12:26:49', '2021-08-05 21:51:12', '1.11', 70, '跳转外部地址', 'components/ExternalJump.vue', '/external/jump/:path(.*)', 'ExternalJumpCom', 'RadarChartOutlined', 1, 1, 1, 1, 1, 'https://antv.vision/zh', 2);
INSERT INTO `sysmenu` VALUES (12, '2022-03-04 12:25:43', '2018-03-10 12:16:38', '12', 50, '基础信息', NULL, NULL, NULL, 'GoldOutlined', NULL, 1, 1, 1, 1, NULL, 1);
INSERT INTO `sysmenu` VALUES (13, '2022-03-04 12:26:55', '2018-03-10 12:16:38', '12.13', 10, '会员管理', 'views/base/member/Index.vue', '/base/member', 'base_member', 'UsergroupAddOutlined', 12, 1, 1, 1, 1, NULL, 2);
INSERT INTO `sysmenu` VALUES (14, '2022-03-04 12:25:46', '2018-03-10 12:16:38', '14', 100, '系统管理', NULL, NULL, NULL, 'DesktopOutlined', NULL, 1, 1, 1, 1, NULL, 1);
INSERT INTO `sysmenu` VALUES (15, '2022-03-04 12:27:02', '2018-03-10 12:16:38', '14.15', 100, '账户管理', 'views/system/user/Index.vue', '/system/user', 'system_user', 'UserOutlined', 14, 1, 1, 1, 1, NULL, 2);
INSERT INTO `sysmenu` VALUES (16, '2022-03-04 12:27:07', '2018-03-10 12:16:38', '14.16', 110, '角色管理', 'views/system/role/Index.vue', '/system/role', 'system_role', 'TeamOutlined', 14, 1, 1, 1, 1, NULL, 2);
INSERT INTO `sysmenu` VALUES (17, '2022-03-04 12:27:11', '2018-03-10 12:16:38', '14.17', 120, '功能管理', 'views/system/function/Index.vue', '/system/function', 'system_function', 'ControlOutlined', 14, 1, 1, 1, 1, NULL, 2);
INSERT INTO `sysmenu` VALUES (19, '2022-03-04 12:27:19', '2018-03-10 12:16:38', '14.19', 150, '个人中心', 'views/system/personal_center/Index.vue', '/system/personal/center', 'system_personal_center', 'FormOutlined', 14, 1, 1, 1, 1, NULL, 2);
INSERT INTO `sysmenu` VALUES (20, '2022-03-04 12:27:23', '2021-05-27 17:29:49', '14.20', 160, '岗位管理', 'views/system/post/Index.vue', '/system/post', 'system_post', 'IdcardOutlined', 14, 1, 1, 1, 1, NULL, 2);
INSERT INTO `sysmenu` VALUES (21, '2022-03-04 12:27:27', '2021-05-27 20:27:56', '14.21', 170, '组织机构', 'views/system/organization/Index.vue', '/system/organization', 'system_organization', 'ClusterOutlined', 14, 1, 1, 1, 1, NULL, 2);
INSERT INTO `sysmenu` VALUES (22, '2022-03-04 12:27:41', '2018-03-10 12:17:03', '29.22', 10, '接口文档', 'views/development_tool/Swagger.vue', '/development_tool/swagger', 'swagger', 'FileSearchOutlined', 29, 1, 1, 1, 1, NULL, 2);
INSERT INTO `sysmenu` VALUES (23, '2022-03-04 12:27:31', '2021-07-25 21:50:01', '14.23', 190, '数据字典', 'views/system/dictionary/Index.vue', '/system/dictionary', 'system_dictionary', 'FileDoneOutlined', 14, 1, 1, 1, 1, NULL, 2);
INSERT INTO `sysmenu` VALUES (24, '2022-03-04 12:27:35', '2021-08-05 21:24:54', '14.24', 200, '操作日志', 'views/system/sys_operation_log/Index.vue', '/system/sys_operation_log', 'sys_operation_log', 'ContainerOutlined', 14, 1, 1, 1, 1, '', 2);
INSERT INTO `sysmenu` VALUES (25, '2022-03-04 12:27:15', '2018-03-10 12:16:38', '14.25', 130, '菜单功能', 'views/system/menu/Index.vue', '/system/menu', 'system_menu', 'MenuOutlined', 14, 1, 1, 1, 1, NULL, 2);
INSERT INTO `sysmenu` VALUES (28, '2022-03-04 12:26:00', '2021-12-29 17:13:26', '1.28', 1, 'Vxe-Table', 'views/VxeTable.vue', '/vxe/table', 'VxeTableCom', 'BorderlessTableOutlined', 1, 1, 1, 1, 1, NULL, 2);
INSERT INTO `sysmenu` VALUES (29, '2022-03-04 12:25:49', '2022-01-12 14:17:21', '29', 200, '开发工具', NULL, NULL, NULL, 'CodepenOutlined', NULL, 1, 1, 1, 1, NULL, 1);
INSERT INTO `sysmenu` VALUES (30, '2022-03-04 12:27:44', '2022-01-12 14:22:04', '29.30', 20, '定时任务', 'views/development_tool/timed_task/Index.vue', '/development_tool/timed_task', 'TimedTaskCom', 'FieldTimeOutlined', 29, 1, 1, 1, 1, NULL, 2);
INSERT INTO `sysmenu` VALUES (31, '2022-03-04 12:27:48', '2022-01-12 15:39:46', '29.31', 30, '代码生成', 'views/development_tool/code_generation/Index.vue', '/development_tool/code_generation', 'code_generation_index', 'CodeTwoTone', 29, 1, 1, 1, 1, NULL, 2);
INSERT INTO `sysmenu` VALUES (32, '2022-03-04 12:26:08', '2022-02-24 10:51:38', '1.32', 20, '图标展示', 'views/AntdIcons.vue', '/antd/icons', 'AntdIconsCom', 'TagsTwoTone', 1, 1, 1, 1, 1, NULL, 2);

-- ----------------------------
-- Table structure for sysmenufunction
-- ----------------------------
DROP TABLE IF EXISTS `sysmenufunction`;
CREATE TABLE `sysmenufunction`  (
  `Id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LastModificationTime` datetime NULL DEFAULT NULL,
  `CreationTime` datetime NULL DEFAULT NULL,
  `Number` int NULL DEFAULT NULL,
  `MenuId` int NULL DEFAULT NULL,
  `FunctionCode` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FunctionName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sysmenufunction
-- ----------------------------
INSERT INTO `sysmenufunction` VALUES ('0984A2E1-3722-41D4-0F6D-08D9FDAD00AB', '2022-03-04 15:25:50', '2022-03-04 15:25:50', 70, 23, 'Export', '导出', 'Export');
INSERT INTO `sysmenufunction` VALUES ('0A85E4FD-5A1C-47F6-0F60-08D9FDAD00AB', '2022-03-04 15:25:40', '2022-03-04 15:25:40', 20, 21, 'Insert', '添加', 'Insert');
INSERT INTO `sysmenufunction` VALUES ('0AD6A459-1D9D-4512-0F32-08D9FDAD00AB', '2022-03-04 15:25:14', '2022-03-04 15:25:14', 40, 15, 'Delete', '删除', 'Delete');
INSERT INTO `sysmenufunction` VALUES ('0B27E69F-AF16-4481-0F44-08D9FDAD00AB', '2022-03-04 15:25:21', '2022-03-04 15:25:21', 60, 17, 'Search', '检索', 'Search');
INSERT INTO `sysmenufunction` VALUES ('0CAA6E7D-92B0-4814-0F46-08D9FDAD00AB', '2022-03-04 15:25:21', '2022-03-04 15:25:21', 80, 17, 'Print', '打印', 'Print');
INSERT INTO `sysmenufunction` VALUES ('106FB69A-8BB5-4559-0F29-08D9FDAD00AB', '2022-03-04 15:25:07', '2022-03-04 15:25:07', 30, 13, 'Update', '修改', 'Update');
INSERT INTO `sysmenufunction` VALUES ('13F3F74D-C6FC-4488-0F2F-08D9FDAD00AB', '2022-03-04 15:25:14', '2022-03-04 15:25:14', 10, 15, 'Display', '显示', 'Display');
INSERT INTO `sysmenufunction` VALUES ('14783A71-E265-4D6B-0F3B-08D9FDAD00AB', '2022-03-04 15:25:18', '2022-03-04 15:25:18', 50, 16, 'Save', '保存', 'Save');
INSERT INTO `sysmenufunction` VALUES ('1CB6FBE1-4A6C-4AAD-0F22-08D9FDAD00AB', '2022-03-04 15:24:34', '2022-03-04 15:24:34', 10, 6, 'Display', '显示', 'Display');
INSERT INTO `sysmenufunction` VALUES ('1D831D57-6634-45D7-0F6E-08D9FDAD00AB', '2022-03-04 15:25:50', '2022-03-04 15:25:50', 80, 23, 'Print', '打印', 'Print');
INSERT INTO `sysmenufunction` VALUES ('1E69DF5D-D1E9-4BC8-0F4D-08D9FDAD00AB', '2022-03-04 15:25:28', '2022-03-04 15:25:28', 70, 25, 'Export', '导出', 'Export');
INSERT INTO `sysmenufunction` VALUES ('20AB5395-D57C-49DB-0F4A-08D9FDAD00AB', '2022-03-04 15:25:28', '2022-03-04 15:25:28', 40, 25, 'Delete', '删除', 'Delete');
INSERT INTO `sysmenufunction` VALUES ('2186550D-246C-4552-E2D8-08D9FDEFA8F8', '2022-03-04 23:00:02', '2022-03-04 23:00:02', 60, 24, 'Search', '检索', 'Search');
INSERT INTO `sysmenufunction` VALUES ('22A675F6-EFDA-481D-0F59-08D9FDAD00AB', '2022-03-04 15:25:36', '2022-03-04 15:25:36', 30, 20, 'Update', '修改', 'Update');
INSERT INTO `sysmenufunction` VALUES ('2469188C-21DE-492A-0F5E-08D9FDAD00AB', '2022-03-04 15:25:36', '2022-03-04 15:25:36', 80, 20, 'Print', '打印', 'Print');
INSERT INTO `sysmenufunction` VALUES ('2FEA8F87-2A13-4C95-0F3C-08D9FDAD00AB', '2022-03-04 15:25:18', '2022-03-04 15:25:18', 60, 16, 'Search', '检索', 'Search');
INSERT INTO `sysmenufunction` VALUES ('33C80938-82C8-4299-0F12-08D9FDAD00AB', '2022-03-04 15:17:09', '2022-03-04 15:17:09', 10, 30, 'Display', '显示', 'Display');
INSERT INTO `sysmenufunction` VALUES ('37D3E492-62DA-47A4-0F33-08D9FDAD00AB', '2022-03-04 15:25:14', '2022-03-04 15:25:14', 50, 15, 'Save', '保存', 'Save');
INSERT INTO `sysmenufunction` VALUES ('3BC0E68F-D03D-4E99-0F26-08D9FDAD00AB', '2022-03-04 15:24:53', '2022-03-04 15:24:53', 10, 11, 'Display', '显示', 'Display');
INSERT INTO `sysmenufunction` VALUES ('3CB3CBC7-9E45-4CC3-0F62-08D9FDAD00AB', '2022-03-04 15:25:40', '2022-03-04 15:25:40', 40, 21, 'Delete', '删除', 'Delete');
INSERT INTO `sysmenufunction` VALUES ('3E44C6F5-E090-40A1-0F58-08D9FDAD00AB', '2022-03-04 15:25:36', '2022-03-04 15:25:36', 20, 20, 'Insert', '添加', 'Insert');
INSERT INTO `sysmenufunction` VALUES ('3F6D0AF7-5386-4D3A-0F71-08D9FDAD00AB', '2022-03-04 15:40:52', '2022-03-04 15:40:52', 10, 28, 'Display', '显示', 'Display');
INSERT INTO `sysmenufunction` VALUES ('41CB1942-573A-4D63-0F4B-08D9FDAD00AB', '2022-03-04 15:25:28', '2022-03-04 15:25:28', 50, 25, 'Save', '保存', 'Save');
INSERT INTO `sysmenufunction` VALUES ('437FBF85-8704-4E87-0F3D-08D9FDAD00AB', '2022-03-04 15:25:18', '2022-03-04 15:25:18', 70, 16, 'Export', '导出', 'Export');
INSERT INTO `sysmenufunction` VALUES ('45E2CA86-4823-4FB9-0F57-08D9FDAD00AB', '2022-03-04 15:25:36', '2022-03-04 15:25:36', 10, 20, 'Display', '显示', 'Display');
INSERT INTO `sysmenufunction` VALUES ('4A67FCDB-A7A9-4E3C-0F49-08D9FDAD00AB', '2022-03-04 15:25:28', '2022-03-04 15:25:28', 30, 25, 'Update', '修改', 'Update');
INSERT INTO `sysmenufunction` VALUES ('4BBBE120-0CC6-4A08-0F4E-08D9FDAD00AB', '2022-03-04 15:25:28', '2022-03-04 15:25:28', 80, 25, 'Print', '打印', 'Print');
INSERT INTO `sysmenufunction` VALUES ('523B53B5-8159-4A16-0F2B-08D9FDAD00AB', '2022-03-04 15:25:07', '2022-03-04 15:25:07', 50, 13, 'Save', '保存', 'Save');
INSERT INTO `sysmenufunction` VALUES ('53FDB4A0-CA6E-4568-0F3F-08D9FDAD00AB', '2022-03-04 15:25:21', '2022-03-04 15:25:21', 10, 17, 'Display', '显示', 'Display');
INSERT INTO `sysmenufunction` VALUES ('541D9045-47B2-4629-0F2E-08D9FDAD00AB', '2022-03-04 15:25:07', '2022-03-04 15:25:07', 80, 13, 'Print', '打印', 'Print');
INSERT INTO `sysmenufunction` VALUES ('54743C86-AC73-4345-0F5D-08D9FDAD00AB', '2022-03-04 15:25:36', '2022-03-04 15:25:36', 70, 20, 'Export', '导出', 'Export');
INSERT INTO `sysmenufunction` VALUES ('550F874B-E804-44A0-0F37-08D9FDAD00AB', '2022-03-04 15:25:18', '2022-03-04 15:25:18', 10, 16, 'Display', '显示', 'Display');
INSERT INTO `sysmenufunction` VALUES ('55750F56-EDC9-4771-E2D6-08D9FDEFA8F8', '2022-03-04 23:00:02', '2022-03-04 23:00:02', 10, 24, 'Display', '显示', 'Display');
INSERT INTO `sysmenufunction` VALUES ('5E4E87BD-C179-4B5B-0F5C-08D9FDAD00AB', '2022-03-04 15:25:36', '2022-03-04 15:25:36', 60, 20, 'Search', '检索', 'Search');
INSERT INTO `sysmenufunction` VALUES ('616C4E4A-FB61-49CF-0F5B-08D9FDAD00AB', '2022-03-04 15:25:36', '2022-03-04 15:25:36', 50, 20, 'Save', '保存', 'Save');
INSERT INTO `sysmenufunction` VALUES ('69DA651E-787B-42E5-0F5A-08D9FDAD00AB', '2022-03-04 15:25:36', '2022-03-04 15:25:36', 40, 20, 'Delete', '删除', 'Delete');
INSERT INTO `sysmenufunction` VALUES ('6B009415-EADF-4DAB-0F3E-08D9FDAD00AB', '2022-03-04 15:25:18', '2022-03-04 15:25:18', 80, 16, 'Print', '打印', 'Print');
INSERT INTO `sysmenufunction` VALUES ('6B209D5A-B366-4A61-0F63-08D9FDAD00AB', '2022-03-04 15:25:40', '2022-03-04 15:25:40', 50, 21, 'Save', '保存', 'Save');
INSERT INTO `sysmenufunction` VALUES ('6C09C0C0-72FA-4842-0F1F-08D9FDAD00AB', '2022-03-04 15:24:21', '2022-03-04 15:24:21', 10, 32, 'Display', '显示', 'Display');
INSERT INTO `sysmenufunction` VALUES ('7694FBF5-E28D-424C-E2D7-08D9FDEFA8F8', '2022-03-04 23:00:02', '2022-03-04 23:00:02', 40, 24, 'Delete', '删除', 'Delete');
INSERT INTO `sysmenufunction` VALUES ('7E0F6C84-D7F1-4243-0F4C-08D9FDAD00AB', '2022-03-04 15:25:28', '2022-03-04 15:25:28', 60, 25, 'Search', '检索', 'Search');
INSERT INTO `sysmenufunction` VALUES ('7EA8F706-BFE5-42B2-0F42-08D9FDAD00AB', '2022-03-04 15:25:21', '2022-03-04 15:25:21', 40, 17, 'Delete', '删除', 'Delete');
INSERT INTO `sysmenufunction` VALUES ('823AC05D-65E4-4216-0F39-08D9FDAD00AB', '2022-03-04 15:25:18', '2022-03-04 15:25:18', 30, 16, 'Update', '修改', 'Update');
INSERT INTO `sysmenufunction` VALUES ('8564E4D8-D7F4-4F12-0F31-08D9FDAD00AB', '2022-03-04 15:25:14', '2022-03-04 15:25:14', 30, 15, 'Update', '修改', 'Update');
INSERT INTO `sysmenufunction` VALUES ('86465238-C51C-45D5-0F40-08D9FDAD00AB', '2022-03-04 15:25:21', '2022-03-04 15:25:21', 20, 17, 'Insert', '添加', 'Insert');
INSERT INTO `sysmenufunction` VALUES ('86FF83FD-D34A-4290-0F41-08D9FDAD00AB', '2022-03-04 15:25:21', '2022-03-04 15:25:21', 30, 17, 'Update', '修改', 'Update');
INSERT INTO `sysmenufunction` VALUES ('92B39A10-3927-4EE7-0F6A-08D9FDAD00AB', '2022-03-04 15:25:50', '2022-03-04 15:25:50', 40, 23, 'Delete', '删除', 'Delete');
INSERT INTO `sysmenufunction` VALUES ('9426768E-B90D-41E1-0F67-08D9FDAD00AB', '2022-03-04 15:25:50', '2022-03-04 15:25:50', 10, 23, 'Display', '显示', 'Display');
INSERT INTO `sysmenufunction` VALUES ('A03D56D7-4B0D-47CC-0F6B-08D9FDAD00AB', '2022-03-04 15:25:50', '2022-03-04 15:25:50', 50, 23, 'Save', '保存', 'Save');
INSERT INTO `sysmenufunction` VALUES ('A1DDD02F-8C21-4D79-0F21-08D9FDAD00AB', '2022-03-04 15:24:30', '2022-03-04 15:24:30', 10, 5, 'Display', '显示', 'Display');
INSERT INTO `sysmenufunction` VALUES ('A3754771-F6E9-4A23-0F2C-08D9FDAD00AB', '2022-03-04 15:25:07', '2022-03-04 15:25:07', 60, 13, 'Search', '检索', 'Search');
INSERT INTO `sysmenufunction` VALUES ('A46E07D3-C722-4548-0F35-08D9FDAD00AB', '2022-03-04 15:25:14', '2022-03-04 15:25:14', 70, 15, 'Export', '导出', 'Export');
INSERT INTO `sysmenufunction` VALUES ('A726455F-1C29-4BE0-0F45-08D9FDAD00AB', '2022-03-04 15:25:21', '2022-03-04 15:25:21', 70, 17, 'Export', '导出', 'Export');
INSERT INTO `sysmenufunction` VALUES ('A7CD04DB-BBE3-49B6-0F1E-08D9FDAD00AB', '2022-03-04 15:24:16', '2022-03-04 15:24:16', 10, 2, 'Display', '显示', 'Display');
INSERT INTO `sysmenufunction` VALUES ('A9503588-E6F7-420B-0F65-08D9FDAD00AB', '2022-03-04 15:25:40', '2022-03-04 15:25:40', 70, 21, 'Export', '导出', 'Export');
INSERT INTO `sysmenufunction` VALUES ('B5881044-AFB8-40B2-0F28-08D9FDAD00AB', '2022-03-04 15:25:07', '2022-03-04 15:25:07', 20, 13, 'Insert', '添加', 'Insert');
INSERT INTO `sysmenufunction` VALUES ('B7533A90-DAE4-4263-0F24-08D9FDAD00AB', '2022-03-04 15:24:43', '2022-03-04 15:24:43', 10, 9, 'Display', '显示', 'Display');
INSERT INTO `sysmenufunction` VALUES ('B96F977C-A36E-4E7F-0F2D-08D9FDAD00AB', '2022-03-04 15:25:07', '2022-03-04 15:25:07', 70, 13, 'Export', '导出', 'Export');
INSERT INTO `sysmenufunction` VALUES ('B98A365E-6FB4-4EFB-0F69-08D9FDAD00AB', '2022-03-04 15:25:50', '2022-03-04 15:25:50', 30, 23, 'Update', '修改', 'Update');
INSERT INTO `sysmenufunction` VALUES ('BD6AE6DA-1CA6-46C2-0F3A-08D9FDAD00AB', '2022-03-04 15:25:18', '2022-03-04 15:25:18', 40, 16, 'Delete', '删除', 'Delete');
INSERT INTO `sysmenufunction` VALUES ('BEB87004-5CFB-417A-0F34-08D9FDAD00AB', '2022-03-04 15:25:14', '2022-03-04 15:25:14', 60, 15, 'Search', '检索', 'Search');
INSERT INTO `sysmenufunction` VALUES ('C67A0ABE-DAEC-491B-0F38-08D9FDAD00AB', '2022-03-04 15:25:18', '2022-03-04 15:25:18', 20, 16, 'Insert', '添加', 'Insert');
INSERT INTO `sysmenufunction` VALUES ('C6BA141B-99BA-4114-0F5F-08D9FDAD00AB', '2022-03-04 15:25:40', '2022-03-04 15:25:40', 10, 21, 'Display', '显示', 'Display');
INSERT INTO `sysmenufunction` VALUES ('C77C812A-1601-4311-0F70-08D9FDAD00AB', '2022-03-04 15:26:00', '2022-03-04 15:26:00', 10, 19, 'Display', '显示', 'Display');
INSERT INTO `sysmenufunction` VALUES ('C8EDBB79-567E-461B-0F36-08D9FDAD00AB', '2022-03-04 15:25:14', '2022-03-04 15:25:14', 80, 15, 'Print', '打印', 'Print');
INSERT INTO `sysmenufunction` VALUES ('C9E5FFF0-6744-47D7-0F66-08D9FDAD00AB', '2022-03-04 15:25:40', '2022-03-04 15:25:40', 80, 21, 'Print', '打印', 'Print');
INSERT INTO `sysmenufunction` VALUES ('CCE82EB4-7FC5-4308-0F30-08D9FDAD00AB', '2022-03-04 15:25:14', '2022-03-04 15:25:14', 20, 15, 'Insert', '添加', 'Insert');
INSERT INTO `sysmenufunction` VALUES ('D2E6EA60-2CF6-478A-0F23-08D9FDAD00AB', '2022-03-04 15:24:40', '2022-03-04 15:24:40', 10, 8, 'Display', '显示', 'Display');
INSERT INTO `sysmenufunction` VALUES ('dab12c2f-1f4d-4347-0f1c-08d9fdad00ab', '2022-03-18 09:48:59', '2022-03-18 09:48:59', 10, 31, 'Display', '显示', 'Display');
INSERT INTO `sysmenufunction` VALUES ('DB3AB8BD-7709-41A2-0F47-08D9FDAD00AB', '2022-03-04 15:25:28', '2022-03-04 15:25:28', 10, 25, 'Display', '显示', 'Display');
INSERT INTO `sysmenufunction` VALUES ('DEE401B1-E20E-496E-0F43-08D9FDAD00AB', '2022-03-04 15:25:21', '2022-03-04 15:25:21', 50, 17, 'Save', '保存', 'Save');
INSERT INTO `sysmenufunction` VALUES ('E2319118-42CC-41A2-0F6C-08D9FDAD00AB', '2022-03-04 15:25:50', '2022-03-04 15:25:50', 60, 23, 'Search', '检索', 'Search');
INSERT INTO `sysmenufunction` VALUES ('E991934A-0D30-416B-0F68-08D9FDAD00AB', '2022-03-04 15:25:50', '2022-03-04 15:25:50', 20, 23, 'Insert', '添加', 'Insert');
INSERT INTO `sysmenufunction` VALUES ('EB958545-6449-40DB-0F27-08D9FDAD00AB', '2022-03-04 15:25:07', '2022-03-04 15:25:07', 10, 13, 'Display', '显示', 'Display');
INSERT INTO `sysmenufunction` VALUES ('EC535908-8671-4928-0F25-08D9FDAD00AB', '2022-03-04 15:24:47', '2022-03-04 15:24:47', 10, 10, 'Display', '显示', 'Display');
INSERT INTO `sysmenufunction` VALUES ('EF70B789-21EE-4850-0F1B-08D9FDAD00AB', '2022-03-04 15:16:44', '2022-03-04 15:16:44', 10, 22, 'Display', '显示', 'Display');
INSERT INTO `sysmenufunction` VALUES ('F36B9B06-2826-425F-0F64-08D9FDAD00AB', '2022-03-04 15:25:40', '2022-03-04 15:25:40', 60, 21, 'Search', '检索', 'Search');
INSERT INTO `sysmenufunction` VALUES ('F4621FBE-6B40-4454-0F2A-08D9FDAD00AB', '2022-03-04 15:25:07', '2022-03-04 15:25:07', 40, 13, 'Delete', '删除', 'Delete');
INSERT INTO `sysmenufunction` VALUES ('F4C73AC0-C66D-4988-0F61-08D9FDAD00AB', '2022-03-04 15:25:40', '2022-03-04 15:25:40', 30, 21, 'Update', '修改', 'Update');
INSERT INTO `sysmenufunction` VALUES ('F64CFE50-1EF1-457F-0F20-08D9FDAD00AB', '2022-03-04 15:24:24', '2022-03-04 15:24:24', 10, 3, 'Display', '显示', 'Display');
INSERT INTO `sysmenufunction` VALUES ('FE6465BF-E429-45BD-0F48-08D9FDAD00AB', '2022-03-04 15:25:28', '2022-03-04 15:25:28', 20, 25, 'Insert', '添加', 'Insert');

-- ----------------------------
-- Table structure for sysoperationlog
-- ----------------------------
DROP TABLE IF EXISTS `sysoperationlog`;
CREATE TABLE `sysoperationlog`  (
  `Id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Api` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '接口地址',
  `Ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `Form` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '表单信息',
  `FormBody` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'json表单信息',
  `QueryString` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '地址栏信息',
  `Browser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UserId` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前操作人id',
  `TakeUpTime` bigint NOT NULL COMMENT '接口耗时（毫秒）',
  `LastModificationTime` datetime NULL DEFAULT NULL,
  `CreationTime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sysoperationlog
-- ----------------------------
INSERT INTO `sysoperationlog` VALUES ('08da0881-9da8-45b7-8e99-1968583e22dc', '/api/admin/SysOperationLog/deleteAllData', '0.0.0.1', '', '', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 860, '2022-03-18 09:50:02', '2022-03-18 09:50:02');
INSERT INTO `sysoperationlog` VALUES ('08da0881-9db2-40f1-8d45-b460973e4d04', '/api/admin/SysOperationLog/findList/10/1', '0.0.0.1', '', '{\"name\":null}', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 25, '2022-03-18 09:50:02', '2022-03-18 09:50:02');
INSERT INTO `sysoperationlog` VALUES ('08da088a-eedb-43d7-8c1d-ed05a2e560cb', '/api/admin/SysUser/info', '0.0.0.1', '', '', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 269, '2022-03-18 10:56:43', '2022-03-18 10:56:43');
INSERT INTO `sysoperationlog` VALUES ('08da088a-fab5-4b6f-871c-ba76a169d809', '/api/admin/SysUser/info', '0.0.0.1', '', '', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 49, '2022-03-18 10:57:03', '2022-03-18 10:57:03');
INSERT INTO `sysoperationlog` VALUES ('08da088b-054c-4299-8985-7f9972057014', '/api/account/check', '0.0.0.1', '', '{\"userName\":\"admin\",\"userPassword\":\"123456\"}', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 108, '2022-03-18 10:57:21', '2022-03-18 10:57:21');
INSERT INTO `sysoperationlog` VALUES ('08da088b-6e2e-499e-89f2-177e5126fa5f', '/api/admin/SysUser/info', '0.0.0.1', '', '', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 241, '2022-03-18 11:00:17', '2022-03-18 11:00:17');
INSERT INTO `sysoperationlog` VALUES ('08da088b-a441-4d09-8d8e-08acb8d3d006', '/api/account/check', '0.0.0.1', '', '{\"userName\":\"admin\",\"userPassword\":\"123456\"}', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 80905, '2022-03-18 11:01:48', '2022-03-18 11:01:48');
INSERT INTO `sysoperationlog` VALUES ('08da088b-a44f-4ade-837d-c92194155639', '/api/admin/SysUser/info', '0.0.0.1', '', '', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 30, '2022-03-18 11:01:48', '2022-03-18 11:01:48');
INSERT INTO `sysoperationlog` VALUES ('08da088c-c605-42c7-8315-f0a5e1eae7a8', '/api/admin/SysUser/info', '0.0.0.1', '', '', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 243, '2022-03-18 11:09:54', '2022-03-18 11:09:54');
INSERT INTO `sysoperationlog` VALUES ('08da088c-cba8-45c9-8e48-94e48d6dc4f7', '/api/admin/SysMenu/getAll', '0.0.0.1', '', '{\"name\":null}', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 77, '2022-03-18 11:10:03', '2022-03-18 11:10:03');
INSERT INTO `sysoperationlog` VALUES ('08da088c-cc6a-448e-8be1-678c86dd958b', '/api/admin/SysMenu/findForm', '0.0.0.1', '', '', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 71, '2022-03-18 11:10:04', '2022-03-18 11:10:04');
INSERT INTO `sysoperationlog` VALUES ('08da088c-f13b-4868-8035-e29c9d7a7941', '/api/admin/SysMenu/saveForm', '0.0.0.1', '', '{\"id\":\"\",\"form\":{\"id\":0,\"levelCode\":null,\"number\":\"1\",\"name\":\"2\",\"componentName\":\"2\",\"url\":\"2\",\"router\":\"2\",\"jumpUrl\":\"2\",\"icon\":null,\"parentId\":null,\"show\":true,\"close\":true,\"keepAlive\":true,\"state\":true,\"type\":2,\"lastModificationTime\":\"0001-01-01 00:00:00\",\"creationTime\":\"0001-01-01 00:00:00\"},\"allFunctions\":[{\"number\":10,\"name\":\"显示\",\"byName\":\"Display\",\"remark\":\"Display\",\"id\":\"c9518758-b2e1-4f51-b517-5282e273889c\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":20,\"name\":\"添加\",\"byName\":\"Insert\",\"remark\":\"Insert\",\"id\":\"bffefb1c-8988-4ddf-b4ac-81c2b30e80cd\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":30,\"name\":\"修改\",\"byName\":\"Update\",\"remark\":\"Update\",\"id\":\"e7ef2a05-8317-41c3-b588-99519fe88bf9\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":40,\"name\":\"删除\",\"byName\":\"Delete\",\"remark\":\"Delete\",\"id\":\"9c388461-2704-4c5e-a729-72c17e9018e1\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":50,\"name\":\"保存\",\"byName\":\"Save\",\"remark\":\"Save\",\"id\":\"383e7ee2-7690-46ac-9230-65155c84aa30\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":60,\"name\":\"检索\",\"byName\":\"Search\",\"remark\":\"Search\",\"id\":\"f27ecb0a-197d-47b1-b243-59a8c71302bf\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":70,\"name\":\"导出\",\"byName\":\"Export\",\"remark\":\"Export\",\"id\":\"2401f4d0-60b0-4e2e-903f-84c603373572\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":80,\"name\":\"打印\",\"byName\":\"Print\",\"remark\":\"Print\",\"id\":\"b6fd5425-504a-46a9-993b-2f8dc9158eb8\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"}],\"menuFunctionList\":[{\"number\":10,\"menuId\":\"\",\"functionCode\":\"Display\",\"functionName\":\"显示\",\"remark\":\"Display\"}]}', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 23644, '2022-03-18 11:11:06', '2022-03-18 11:11:06');
INSERT INTO `sysoperationlog` VALUES ('08da088c-f172-4ac0-8544-1c4a8f9edd4c', '/api/admin/SysUser/info', '0.0.0.1', '', '', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 33, '2022-03-18 11:11:07', '2022-03-18 11:11:07');
INSERT INTO `sysoperationlog` VALUES ('08da088c-f1a4-4845-8696-c59cbbb1fbab', '/api/admin/SysMenu/getAll', '0.0.0.1', '', '{\"name\":null}', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 23, '2022-03-18 11:11:07', '2022-03-18 11:11:07');
INSERT INTO `sysoperationlog` VALUES ('08da088c-f473-48bb-8c05-17ce4ff3b121', '/api/admin/SysMenu/findForm', '0.0.0.1', '', '', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 39, '2022-03-18 11:11:12', '2022-03-18 11:11:12');
INSERT INTO `sysoperationlog` VALUES ('08da088c-fafb-4fc7-87be-b784cf8d769c', '/api/admin/SysMenu/findForm', '0.0.0.1', '', '', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 46, '2022-03-18 11:11:23', '2022-03-18 11:11:23');
INSERT INTO `sysoperationlog` VALUES ('08da088d-0404-45ff-840e-2c8b59c27136', '/api/admin/SysUser/info', '0.0.0.1', '', '', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 46, '2022-03-18 11:11:38', '2022-03-18 11:11:38');
INSERT INTO `sysoperationlog` VALUES ('08da088d-0433-4878-87a0-f69b61392607', '/api/admin/SysMenu/getAll', '0.0.0.1', '', '{\"name\":null}', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 28, '2022-03-18 11:11:38', '2022-03-18 11:11:38');
INSERT INTO `sysoperationlog` VALUES ('08da088d-0512-4bcd-8a0b-4f1a9de3eef5', '/api/admin/SysMenu/findForm', '0.0.0.1', '', '', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 32, '2022-03-18 11:11:39', '2022-03-18 11:11:39');
INSERT INTO `sysoperationlog` VALUES ('08da088d-0b78-4ea4-8bf5-5b6b02fd4e6b', '/api/admin/SysUser/info', '0.0.0.1', '', '', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 30, '2022-03-18 11:11:50', '2022-03-18 11:11:50');
INSERT INTO `sysoperationlog` VALUES ('08da088d-0ba2-4199-8329-21b9961855c1', '/api/admin/SysMenu/getAll', '0.0.0.1', '', '{\"name\":null}', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 25, '2022-03-18 11:11:50', '2022-03-18 11:11:50');
INSERT INTO `sysoperationlog` VALUES ('08da088d-0c31-4917-8591-cf8513ff9856', '/api/admin/SysMenu/findForm', '0.0.0.1', '', '', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 30, '2022-03-18 11:11:51', '2022-03-18 11:11:51');
INSERT INTO `sysoperationlog` VALUES ('08da088d-fc54-4ede-840a-1d6b1316e910', '/api/account/check', '0.0.0.1', '', '{\"userName\":\"admin\",\"userPassword\":\"123456\"}', '', 'Chrome99', 'Windows10', NULL, 2494, '2022-03-18 11:18:34', '2022-03-18 11:18:34');
INSERT INTO `sysoperationlog` VALUES ('08da088e-0523-41c2-840e-2235e093eeea', '/api/account/check', '0.0.0.1', '', '{\"userName\":\"admin\",\"userPassword\":\"123456\"}', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 45, '2022-03-18 11:18:49', '2022-03-18 11:18:49');
INSERT INTO `sysoperationlog` VALUES ('08da088e-12ed-469d-882c-77825d8ec759', '/api/account/check', '0.0.0.1', '', '{\"userName\":\"admin\",\"userPassword\":\"123456\"}', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 27, '2022-03-18 11:19:12', '2022-03-18 11:19:12');
INSERT INTO `sysoperationlog` VALUES ('08da088e-13b0-4b55-824e-ed2f7abb81b8', '/api/account/check', '0.0.0.1', '', '{\"userName\":\"admin\",\"userPassword\":\"123456\"}', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 22, '2022-03-18 11:19:14', '2022-03-18 11:19:14');
INSERT INTO `sysoperationlog` VALUES ('08da088e-1e54-4b00-8e68-8cb22f9207fb', '/api/account/check', '0.0.0.1', '', '{\"userName\":\"admin\",\"userPassword\":\"123456\"}', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 31, '2022-03-18 11:19:31', '2022-03-18 11:19:31');
INSERT INTO `sysoperationlog` VALUES ('08da088e-3d88-47fa-81d4-d5c789254d11', '/api/admin/SysUser/info', '0.0.0.1', '', '', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 228, '2022-03-18 11:20:24', '2022-03-18 11:20:24');
INSERT INTO `sysoperationlog` VALUES ('08da088e-3e91-464c-8e0a-95701c754c68', '/api/account/check', '0.0.0.1', '', '{\"userName\":\"admin\",\"userPassword\":\"123456\"}', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 110, '2022-03-18 11:20:25', '2022-03-18 11:20:25');
INSERT INTO `sysoperationlog` VALUES ('08da088e-3e9f-41e0-8938-ba74890e2d0b', '/api/admin/SysUser/info', '0.0.0.1', '', '', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 38, '2022-03-18 11:20:26', '2022-03-18 11:20:26');
INSERT INTO `sysoperationlog` VALUES ('08da088e-455b-4d2a-8701-ab55aae53da5', '/api/admin/SysMenu/getAll', '0.0.0.1', '', '{\"name\":null}', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 81, '2022-03-18 11:20:37', '2022-03-18 11:20:37');
INSERT INTO `sysoperationlog` VALUES ('08da088e-4610-4a0a-8328-f26b729543b5', '/api/admin/SysMenu/findForm', '0.0.0.1', '', '', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 61, '2022-03-18 11:20:38', '2022-03-18 11:20:38');
INSERT INTO `sysoperationlog` VALUES ('08da088e-6c8a-4bd3-8074-4e80fed95699', '/api/admin/SysUser/info', '0.0.0.1', '', '', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 47, '2022-03-18 11:21:43', '2022-03-18 11:21:43');
INSERT INTO `sysoperationlog` VALUES ('08da088e-6c97-4ce3-82f8-8cfcc2909db0', '/api/admin/SysMenu/saveForm', '0.0.0.1', '', '{\"id\":\"\",\"form\":{\"id\":0,\"levelCode\":null,\"number\":\"1\",\"name\":\"11\",\"componentName\":\"1\",\"url\":\"1\",\"router\":\"1\",\"jumpUrl\":\"1\",\"icon\":null,\"parentId\":null,\"show\":true,\"close\":true,\"keepAlive\":true,\"state\":true,\"type\":2,\"lastModificationTime\":\"0001-01-01 00:00:00\",\"creationTime\":\"0001-01-01 00:00:00\"},\"allFunctions\":[{\"number\":10,\"name\":\"显示\",\"byName\":\"Display\",\"remark\":\"Display\",\"id\":\"c9518758-b2e1-4f51-b517-5282e273889c\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":20,\"name\":\"添加\",\"byName\":\"Insert\",\"remark\":\"Insert\",\"id\":\"bffefb1c-8988-4ddf-b4ac-81c2b30e80cd\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":30,\"name\":\"修改\",\"byName\":\"Update\",\"remark\":\"Update\",\"id\":\"e7ef2a05-8317-41c3-b588-99519fe88bf9\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":40,\"name\":\"删除\",\"byName\":\"Delete\",\"remark\":\"Delete\",\"id\":\"9c388461-2704-4c5e-a729-72c17e9018e1\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":50,\"name\":\"保存\",\"byName\":\"Save\",\"remark\":\"Save\",\"id\":\"383e7ee2-7690-46ac-9230-65155c84aa30\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":60,\"name\":\"检索\",\"byName\":\"Search\",\"remark\":\"Search\",\"id\":\"f27ecb0a-197d-47b1-b243-59a8c71302bf\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":70,\"name\":\"导出\",\"byName\":\"Export\",\"remark\":\"Export\",\"id\":\"2401f4d0-60b0-4e2e-903f-84c603373572\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":80,\"name\":\"打印\",\"byName\":\"Print\",\"remark\":\"Print\",\"id\":\"b6fd5425-504a-46a9-993b-2f8dc9158eb8\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"}],\"menuFunctionList\":[{\"number\":10,\"menuId\":\"\",\"functionCode\":\"Display\",\"functionName\":\"显示\",\"remark\":\"Display\"}]}', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 53736, '2022-03-18 11:21:43', '2022-03-18 11:21:43');
INSERT INTO `sysoperationlog` VALUES ('08da088e-6cc9-4682-8be8-567a866a30eb', '/api/admin/SysMenu/getAll', '0.0.0.1', '', '{\"name\":null}', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 33, '2022-03-18 11:21:43', '2022-03-18 11:21:43');
INSERT INTO `sysoperationlog` VALUES ('08da088e-6e8d-4326-8eaa-ac159918db60', '/api/admin/SysMenu/findForm', '0.0.0.1', '', '', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 40, '2022-03-18 11:21:46', '2022-03-18 11:21:46');
INSERT INTO `sysoperationlog` VALUES ('08da088e-724e-4c16-8a5b-1945f065a847', '/api/admin/SysMenu/saveForm', '0.0.0.1', '', '{\"id\":\"\",\"form\":{\"id\":0,\"levelCode\":null,\"number\":\"1\",\"name\":\"1\",\"componentName\":\"1\",\"url\":\"1\",\"router\":\"1\",\"jumpUrl\":\"1\",\"icon\":null,\"parentId\":null,\"show\":true,\"close\":true,\"keepAlive\":true,\"state\":true,\"type\":2,\"lastModificationTime\":\"0001-01-01 00:00:00\",\"creationTime\":\"0001-01-01 00:00:00\"},\"allFunctions\":[{\"number\":10,\"name\":\"显示\",\"byName\":\"Display\",\"remark\":\"Display\",\"id\":\"c9518758-b2e1-4f51-b517-5282e273889c\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":20,\"name\":\"添加\",\"byName\":\"Insert\",\"remark\":\"Insert\",\"id\":\"bffefb1c-8988-4ddf-b4ac-81c2b30e80cd\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":30,\"name\":\"修改\",\"byName\":\"Update\",\"remark\":\"Update\",\"id\":\"e7ef2a05-8317-41c3-b588-99519fe88bf9\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":40,\"name\":\"删除\",\"byName\":\"Delete\",\"remark\":\"Delete\",\"id\":\"9c388461-2704-4c5e-a729-72c17e9018e1\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":50,\"name\":\"保存\",\"byName\":\"Save\",\"remark\":\"Save\",\"id\":\"383e7ee2-7690-46ac-9230-65155c84aa30\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":60,\"name\":\"检索\",\"byName\":\"Search\",\"remark\":\"Search\",\"id\":\"f27ecb0a-197d-47b1-b243-59a8c71302bf\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":70,\"name\":\"导出\",\"byName\":\"Export\",\"remark\":\"Export\",\"id\":\"2401f4d0-60b0-4e2e-903f-84c603373572\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":80,\"name\":\"打印\",\"byName\":\"Print\",\"remark\":\"Print\",\"id\":\"b6fd5425-504a-46a9-993b-2f8dc9158eb8\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"}],\"menuFunctionList\":[{\"number\":10,\"menuId\":0,\"functionCode\":\"Display\",\"functionName\":\"显示\",\"remark\":\"Display\"}]}', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 709, '2022-03-18 11:21:52', '2022-03-18 11:21:52');
INSERT INTO `sysoperationlog` VALUES ('08da088e-9bc3-49eb-814e-92745f77b910', '/api/admin/SysUser/info', '0.0.0.1', '', '', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 221, '2022-03-18 11:23:02', '2022-03-18 11:23:02');
INSERT INTO `sysoperationlog` VALUES ('08da088e-a0bd-4c04-80fd-cde7c25fb6a6', '/api/admin/SysMenu/saveForm', '0.0.0.1', '', '{\"id\":\"\",\"form\":{\"id\":0,\"levelCode\":null,\"number\":\"1\",\"name\":\"1\",\"componentName\":\"1\",\"url\":\"1\",\"router\":\"1\",\"jumpUrl\":\"1\",\"icon\":null,\"parentId\":null,\"show\":true,\"close\":true,\"keepAlive\":true,\"state\":true,\"type\":2,\"lastModificationTime\":\"0001-01-01 00:00:00\",\"creationTime\":\"0001-01-01 00:00:00\"},\"allFunctions\":[{\"number\":10,\"name\":\"显示\",\"byName\":\"Display\",\"remark\":\"Display\",\"id\":\"c9518758-b2e1-4f51-b517-5282e273889c\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":20,\"name\":\"添加\",\"byName\":\"Insert\",\"remark\":\"Insert\",\"id\":\"bffefb1c-8988-4ddf-b4ac-81c2b30e80cd\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":30,\"name\":\"修改\",\"byName\":\"Update\",\"remark\":\"Update\",\"id\":\"e7ef2a05-8317-41c3-b588-99519fe88bf9\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":40,\"name\":\"删除\",\"byName\":\"Delete\",\"remark\":\"Delete\",\"id\":\"9c388461-2704-4c5e-a729-72c17e9018e1\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":50,\"name\":\"保存\",\"byName\":\"Save\",\"remark\":\"Save\",\"id\":\"383e7ee2-7690-46ac-9230-65155c84aa30\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":60,\"name\":\"检索\",\"byName\":\"Search\",\"remark\":\"Search\",\"id\":\"f27ecb0a-197d-47b1-b243-59a8c71302bf\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":70,\"name\":\"导出\",\"byName\":\"Export\",\"remark\":\"Export\",\"id\":\"2401f4d0-60b0-4e2e-903f-84c603373572\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":80,\"name\":\"打印\",\"byName\":\"Print\",\"remark\":\"Print\",\"id\":\"b6fd5425-504a-46a9-993b-2f8dc9158eb8\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"}],\"menuFunctionList\":[{\"number\":10,\"menuId\":0,\"functionCode\":\"Display\",\"functionName\":\"显示\",\"remark\":\"Display\"}]}', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 470, '2022-03-18 11:23:10', '2022-03-18 11:23:10');
INSERT INTO `sysoperationlog` VALUES ('08da088e-b35e-4ae0-88e4-29d66ed8533a', '/api/admin/SysMenu/saveForm', '0.0.0.1', '', '{\"id\":\"\",\"form\":{\"id\":0,\"levelCode\":null,\"number\":\"1\",\"name\":\"1\",\"componentName\":\"1\",\"url\":\"1\",\"router\":\"1\",\"jumpUrl\":\"1\",\"icon\":null,\"parentId\":null,\"show\":true,\"close\":true,\"keepAlive\":true,\"state\":true,\"type\":2,\"lastModificationTime\":\"0001-01-01 00:00:00\",\"creationTime\":\"0001-01-01 00:00:00\"},\"allFunctions\":[{\"number\":10,\"name\":\"显示\",\"byName\":\"Display\",\"remark\":\"Display\",\"id\":\"c9518758-b2e1-4f51-b517-5282e273889c\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":20,\"name\":\"添加\",\"byName\":\"Insert\",\"remark\":\"Insert\",\"id\":\"bffefb1c-8988-4ddf-b4ac-81c2b30e80cd\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":30,\"name\":\"修改\",\"byName\":\"Update\",\"remark\":\"Update\",\"id\":\"e7ef2a05-8317-41c3-b588-99519fe88bf9\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":40,\"name\":\"删除\",\"byName\":\"Delete\",\"remark\":\"Delete\",\"id\":\"9c388461-2704-4c5e-a729-72c17e9018e1\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":50,\"name\":\"保存\",\"byName\":\"Save\",\"remark\":\"Save\",\"id\":\"383e7ee2-7690-46ac-9230-65155c84aa30\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":60,\"name\":\"检索\",\"byName\":\"Search\",\"remark\":\"Search\",\"id\":\"f27ecb0a-197d-47b1-b243-59a8c71302bf\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":70,\"name\":\"导出\",\"byName\":\"Export\",\"remark\":\"Export\",\"id\":\"2401f4d0-60b0-4e2e-903f-84c603373572\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":80,\"name\":\"打印\",\"byName\":\"Print\",\"remark\":\"Print\",\"id\":\"b6fd5425-504a-46a9-993b-2f8dc9158eb8\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"}],\"menuFunctionList\":[{\"number\":10,\"menuId\":0,\"functionCode\":\"Display\",\"functionName\":\"显示\",\"remark\":\"Display\"}]}', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 22206, '2022-03-18 11:23:41', '2022-03-18 11:23:41');
INSERT INTO `sysoperationlog` VALUES ('08da088e-f7e0-4b77-8eaa-9aa8d9886192', '/api/admin/SysMenu/saveForm', '0.0.0.1', '', '{\"id\":\"\",\"form\":{\"id\":0,\"levelCode\":null,\"number\":\"1\",\"name\":\"1\",\"componentName\":\"1\",\"url\":\"1\",\"router\":\"1\",\"jumpUrl\":\"1\",\"icon\":null,\"parentId\":null,\"show\":true,\"close\":true,\"keepAlive\":true,\"state\":true,\"type\":2,\"lastModificationTime\":\"0001-01-01 00:00:00\",\"creationTime\":\"0001-01-01 00:00:00\"},\"allFunctions\":[{\"number\":10,\"name\":\"显示\",\"byName\":\"Display\",\"remark\":\"Display\",\"id\":\"c9518758-b2e1-4f51-b517-5282e273889c\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":20,\"name\":\"添加\",\"byName\":\"Insert\",\"remark\":\"Insert\",\"id\":\"bffefb1c-8988-4ddf-b4ac-81c2b30e80cd\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":30,\"name\":\"修改\",\"byName\":\"Update\",\"remark\":\"Update\",\"id\":\"e7ef2a05-8317-41c3-b588-99519fe88bf9\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":40,\"name\":\"删除\",\"byName\":\"Delete\",\"remark\":\"Delete\",\"id\":\"9c388461-2704-4c5e-a729-72c17e9018e1\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":50,\"name\":\"保存\",\"byName\":\"Save\",\"remark\":\"Save\",\"id\":\"383e7ee2-7690-46ac-9230-65155c84aa30\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":60,\"name\":\"检索\",\"byName\":\"Search\",\"remark\":\"Search\",\"id\":\"f27ecb0a-197d-47b1-b243-59a8c71302bf\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":70,\"name\":\"导出\",\"byName\":\"Export\",\"remark\":\"Export\",\"id\":\"2401f4d0-60b0-4e2e-903f-84c603373572\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":80,\"name\":\"打印\",\"byName\":\"Print\",\"remark\":\"Print\",\"id\":\"b6fd5425-504a-46a9-993b-2f8dc9158eb8\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"}],\"menuFunctionList\":[{\"number\":10,\"menuId\":0,\"functionCode\":\"Display\",\"functionName\":\"显示\",\"remark\":\"Display\"}]}', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 110270, '2022-03-18 11:25:36', '2022-03-18 11:25:36');
INSERT INTO `sysoperationlog` VALUES ('08da088f-27d7-4415-8d12-3259e37786d0', '/api/admin/SysUser/info', '0.0.0.1', '', '', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 68, '2022-03-18 11:26:57', '2022-03-18 11:26:57');
INSERT INTO `sysoperationlog` VALUES ('08da088f-2809-4dcb-8c77-3f3b0488dc28', '/api/admin/SysMenu/getAll', '0.0.0.1', '', '{\"name\":null}', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 54, '2022-03-18 11:26:57', '2022-03-18 11:26:57');
INSERT INTO `sysoperationlog` VALUES ('08da088f-28bb-45d8-88b8-e2d2633a5ce9', '/api/admin/SysMenu/findForm', '0.0.0.1', '', '', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 66, '2022-03-18 11:26:58', '2022-03-18 11:26:58');
INSERT INTO `sysoperationlog` VALUES ('08da088f-3c7f-4141-8cb1-b5909265a2f9', '/api/admin/SysMenu/saveForm', '0.0.0.1', '', '{\"id\":\"\",\"form\":{\"id\":0,\"levelCode\":null,\"number\":\"1\",\"name\":\"1\",\"componentName\":\"1\",\"url\":\"1\",\"router\":\"1\",\"jumpUrl\":\"1\",\"icon\":null,\"parentId\":null,\"show\":true,\"close\":true,\"keepAlive\":true,\"state\":true,\"type\":2,\"lastModificationTime\":\"0001-01-01 00:00:00\",\"creationTime\":\"0001-01-01 00:00:00\"},\"allFunctions\":[{\"number\":10,\"name\":\"显示\",\"byName\":\"Display\",\"remark\":\"Display\",\"id\":\"c9518758-b2e1-4f51-b517-5282e273889c\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":20,\"name\":\"添加\",\"byName\":\"Insert\",\"remark\":\"Insert\",\"id\":\"bffefb1c-8988-4ddf-b4ac-81c2b30e80cd\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":30,\"name\":\"修改\",\"byName\":\"Update\",\"remark\":\"Update\",\"id\":\"e7ef2a05-8317-41c3-b588-99519fe88bf9\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":40,\"name\":\"删除\",\"byName\":\"Delete\",\"remark\":\"Delete\",\"id\":\"9c388461-2704-4c5e-a729-72c17e9018e1\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":50,\"name\":\"保存\",\"byName\":\"Save\",\"remark\":\"Save\",\"id\":\"383e7ee2-7690-46ac-9230-65155c84aa30\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":60,\"name\":\"检索\",\"byName\":\"Search\",\"remark\":\"Search\",\"id\":\"f27ecb0a-197d-47b1-b243-59a8c71302bf\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":70,\"name\":\"导出\",\"byName\":\"Export\",\"remark\":\"Export\",\"id\":\"2401f4d0-60b0-4e2e-903f-84c603373572\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"},{\"number\":80,\"name\":\"打印\",\"byName\":\"Print\",\"remark\":\"Print\",\"id\":\"b6fd5425-504a-46a9-993b-2f8dc9158eb8\",\"lastModificationTime\":\"2021-04-18 22:08:06\",\"creationTime\":\"2016-06-20 13:40:52\"}],\"menuFunctionList\":[{\"number\":10,\"menuId\":0,\"functionCode\":\"Display\",\"functionName\":\"显示\",\"remark\":\"Display\"}]}', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 24460, '2022-03-18 11:27:31', '2022-03-18 11:27:31');
INSERT INTO `sysoperationlog` VALUES ('08da088f-3c91-4eab-8a81-5e65d262314c', '/api/admin/SysMenu/getAll', '0.0.0.1', '', '{\"name\":null}', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 22, '2022-03-18 11:27:32', '2022-03-18 11:27:32');
INSERT INTO `sysoperationlog` VALUES ('08da088f-402f-4ef6-8566-0ed9a562841d', '/api/admin/SysMenu/deleteList', '0.0.0.1', '', '[33]', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 159, '2022-03-18 11:27:38', '2022-03-18 11:27:38');
INSERT INTO `sysoperationlog` VALUES ('08da088f-4047-449e-826e-48f835a6effe', '/api/admin/SysMenu/getAll', '0.0.0.1', '', '{\"name\":null}', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 23, '2022-03-18 11:27:38', '2022-03-18 11:27:38');
INSERT INTO `sysoperationlog` VALUES ('08da088f-d77b-4ead-839d-6bbef1c8b005', '/api/account/check', '0.0.0.1', '', '{\"userName\":\"admin\",\"userPassword\":\"123456\"}', '', 'Chrome99', 'Windows10', NULL, 524, '2022-03-18 11:31:52', '2022-03-18 11:31:52');
INSERT INTO `sysoperationlog` VALUES ('08da088f-d7c2-4aca-8cd7-3b4e360369e2', '/api/admin/SysUser/info', '0.0.0.1', '', '', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 187, '2022-03-18 11:31:52', '2022-03-18 11:31:52');
INSERT INTO `sysoperationlog` VALUES ('08da088f-d8bf-4f4f-84d5-4528f4a8d1df', '/api/admin/SysUser/info', '0.0.0.1', '', '', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 1, '2022-03-18 11:31:54', '2022-03-18 11:31:54');
INSERT INTO `sysoperationlog` VALUES ('08da088f-daa1-4d29-8e52-92de347fb28a', '/api/admin/Member/findList/10/1', '0.0.0.1', '', '{\"name\":\"\"}', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 116, '2022-03-18 11:31:57', '2022-03-18 11:31:57');
INSERT INTO `sysoperationlog` VALUES ('08da088f-dcce-434a-83d7-1063d2c114c9', '/api/admin/SysOrganization/sysOrganizationTree', '0.0.0.1', '', '{}', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 181, '2022-03-18 11:32:00', '2022-03-18 11:32:00');
INSERT INTO `sysoperationlog` VALUES ('08da088f-dce8-4677-8bf5-bc74236d9b67', '/api/admin/SysUser/findList/10/1', '0.0.0.1', '', '{\"name\":null,\"loginName\":null,\"organizationId\":null}', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 106, '2022-03-18 11:32:01', '2022-03-18 11:32:01');
INSERT INTO `sysoperationlog` VALUES ('08da088f-de4d-41c0-823e-e4453bf9a0bb', '/api/admin/SysRole/findList/10/1', '0.0.0.1', '', '{\"name\":null}', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 57, '2022-03-18 11:32:03', '2022-03-18 11:32:03');
INSERT INTO `sysoperationlog` VALUES ('08da088f-dfa5-43ed-877c-5843aadce06e', '/api/admin/SysRoleMenuFunction/getRoleMenuFunctionByRoleId/40ff1844-c099-4061-98e0-cd6e544fcfd3', '0.0.0.1', '', '', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 62, '2022-03-18 11:32:05', '2022-03-18 11:32:05');
INSERT INTO `sysoperationlog` VALUES ('08da088f-e09d-4785-8aa8-c0ec417689d9', '/api/admin/SysDataAuthority/getDataAuthorityByRoleId/40ff1844-c099-4061-98e0-cd6e544fcfd3', '0.0.0.1', '', '', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 69, '2022-03-18 11:32:07', '2022-03-18 11:32:07');
INSERT INTO `sysoperationlog` VALUES ('08da088f-e0b3-4f99-8c1f-c3ad6d99bead', '/api/admin/SysOrganization/sysOrganizationTree', '0.0.0.1', '', '{}', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 105, '2022-03-18 11:32:07', '2022-03-18 11:32:07');
INSERT INTO `sysoperationlog` VALUES ('08da088f-e1d6-4293-8ce0-af6bb78defc0', '/api/admin/SysFunction/findList/10/1', '0.0.0.1', '', '{\"name\":null}', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 61, '2022-03-18 11:32:09', '2022-03-18 11:32:09');
INSERT INTO `sysoperationlog` VALUES ('08da088f-e2d4-425d-8556-d26f3abea1c3', '/api/admin/SysMenu/getAll', '0.0.0.1', '', '{\"name\":null}', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 40, '2022-03-18 11:32:11', '2022-03-18 11:32:11');
INSERT INTO `sysoperationlog` VALUES ('08da088f-e457-42e2-8bbf-ac81053c18ec', '/api/admin/SysPost/findList/10/1', '0.0.0.1', '', '{\"name\":null}', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 45, '2022-03-18 11:32:13', '2022-03-18 11:32:13');
INSERT INTO `sysoperationlog` VALUES ('08da088f-e50d-48f5-8b75-ec974c866965', '/api/admin/SysOrganization/findList/', '0.0.0.1', '', '{\"name\":null,\"state\":1}', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 32, '2022-03-18 11:32:14', '2022-03-18 11:32:14');
INSERT INTO `sysoperationlog` VALUES ('08da088f-e5bb-4707-87f5-46e67adeb0e9', '/api/admin/SysDictionary/findList/10/1', '0.0.0.1', '', '{\"name\":null,\"parentId\":null}', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 77, '2022-03-18 11:32:15', '2022-03-18 11:32:15');
INSERT INTO `sysoperationlog` VALUES ('08da088f-e5bc-4b53-81c2-c45085dcd566', '/api/admin/SysDictionary/getDictionaryTree', '0.0.0.1', '', '', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 104, '2022-03-18 11:32:15', '2022-03-18 11:32:15');
INSERT INTO `sysoperationlog` VALUES ('08da088f-e652-4159-88b5-12131a2a7ec4', '/api/admin/SysOperationLog/findList/10/1', '0.0.0.1', '', '{\"name\":null}', '', 'Chrome99', 'Windows10', '0198459e-2034-4533-b843-5d227ad20740', 45, '2022-03-18 11:32:16', '2022-03-18 11:32:16');

-- ----------------------------
-- Table structure for sysorganization
-- ----------------------------
DROP TABLE IF EXISTS `sysorganization`;
CREATE TABLE `sysorganization`  (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OrderNumber` int NULL DEFAULT NULL,
  `LevelCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Leader` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `State` int NULL DEFAULT NULL,
  `ParentId` int NULL DEFAULT NULL,
  `LastModificationTime` datetime NULL DEFAULT NULL,
  `CreationTime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sysorganization
-- ----------------------------
INSERT INTO `sysorganization` VALUES (1, '阿里巴巴集团', 1, '1', 'hzy', '18410912184', '18410912184@qq.com', 1, NULL, '2021-05-27 20:50:31', '2021-05-27 20:50:31');
INSERT INTO `sysorganization` VALUES (2, '北京分部', 3, '1.2', '北京分部', '132123', '13131', 1, 1, '2021-12-28 16:13:34', '2021-05-27 22:33:44');
INSERT INTO `sysorganization` VALUES (3, '市场部门', 1, '1.2.3', '市场部门', '234124234', '234234@qq.com', 1, 2, '2021-05-27 22:33:57', '2021-05-27 22:33:57');
INSERT INTO `sysorganization` VALUES (4, '财务部门', 2, '1.2.4', '财务部门', '435543535', '123@qq.com', 1, 2, '2021-05-27 22:34:11', '2021-05-27 22:34:11');
INSERT INTO `sysorganization` VALUES (5, '成都分部', 2, '1.5', '成都分部', '123123123', '123@qq.com', 1, 1, '2021-05-27 22:31:45', '2021-05-27 21:01:50');
INSERT INTO `sysorganization` VALUES (7, '研发部门', 1, '1.5.7', '研发部门', '1234323423', '12312@qq.com', 1, 5, '2021-05-27 22:32:29', '2021-05-27 22:32:08');
INSERT INTO `sysorganization` VALUES (9, '运维部门', 4, '1.5.9', '运维部门', '1232133452', '12341@qq.com', 1, 5, '2022-03-08 17:07:47', '2021-05-27 22:33:25');
INSERT INTO `sysorganization` VALUES (10, '测试部门', 3, '1.5.10', '测试部门', '12313', '123123@qq.com', 1, 5, '2021-05-27 22:32:59', '2021-05-27 22:32:59');
INSERT INTO `sysorganization` VALUES (11, '技术部门', 2, '1.5.11', '技术部门', '12345678911', '12345678901@qq.com', 1, 5, '2022-03-08 17:07:37', '2022-03-08 17:00:20');

-- ----------------------------
-- Table structure for syspost
-- ----------------------------
DROP TABLE IF EXISTS `syspost`;
CREATE TABLE `syspost`  (
  `Id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Number` int NULL DEFAULT NULL,
  `Code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `State` int NULL DEFAULT NULL,
  `Remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime NULL DEFAULT NULL,
  `CreationTime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of syspost
-- ----------------------------
INSERT INTO `syspost` VALUES ('0716B4B0-9A06-43E9-8AE8-82C74875F83E', 2, 'se', '项目经理', 1, NULL, '2021-05-27 20:26:35', '2021-05-27 20:26:35');
INSERT INTO `syspost` VALUES ('96927C30-41D0-4CED-8E29-CBED35C90FB0', 1, 'ceo', '董事长', 1, NULL, '2021-05-27 20:26:22', '2021-05-27 20:26:22');
INSERT INTO `syspost` VALUES ('E46AF329-6D08-442C-9837-F22CFF954411', 4, 'user', '普通员工', 1, NULL, '2021-05-27 20:26:52', '2021-05-27 20:26:52');
INSERT INTO `syspost` VALUES ('F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622', 5, 'dotnet_engineer', 'DotNet软件工程师', 1, NULL, '2022-03-08 10:13:18', '2022-03-08 10:13:18');
INSERT INTO `syspost` VALUES ('F0C67537-8094-429A-B474-F54AC518609E', 3, 'hr', '人力资源', 1, NULL, '2021-05-27 20:26:44', '2021-05-27 20:26:44');

-- ----------------------------
-- Table structure for sysrole
-- ----------------------------
DROP TABLE IF EXISTS `sysrole`;
CREATE TABLE `sysrole`  (
  `Id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LastModificationTime` datetime NULL DEFAULT NULL,
  `CreationTime` datetime NULL DEFAULT NULL,
  `Number` int NULL DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DeleteLock` tinyint NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sysrole
-- ----------------------------
INSERT INTO `sysrole` VALUES ('18FA4771-6F58-46A3-80D2-6F0F5E9972E3', '2021-01-10 11:25:12', '2016-07-06 17:59:20', 1, '超级管理员', '拥有所有权限', 1);
INSERT INTO `sysrole` VALUES ('40FF1844-C099-4061-98E0-CD6E544FCFD3', '2021-01-30 00:51:17', '2016-07-06 17:59:20', 2, '普通用户', '普通用户', 1);

-- ----------------------------
-- Table structure for sysrolemenufunction
-- ----------------------------
DROP TABLE IF EXISTS `sysrolemenufunction`;
CREATE TABLE `sysrolemenufunction`  (
  `Id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `RoleId` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MenuId` int NULL DEFAULT NULL,
  `MenuFunctionId` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime NULL DEFAULT NULL,
  `CreationTime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sysrolemenufunction
-- ----------------------------
INSERT INTO `sysrolemenufunction` VALUES ('02B217C2-9AA8-4102-50C2-08DA0046A5B6', '40FF1844-C099-4061-98E0-CD6E544FCFD3', 13, 'F4621FBE-6B40-4454-0F2A-08D9FDAD00AB', '2022-03-07 22:27:45', '2022-03-07 22:27:45');
INSERT INTO `sysrolemenufunction` VALUES ('0A2DA8BA-74A6-4BDC-50C3-08DA0046A5B6', '40FF1844-C099-4061-98E0-CD6E544FCFD3', 13, '523B53B5-8159-4A16-0F2B-08D9FDAD00AB', '2022-03-07 22:27:45', '2022-03-07 22:27:45');
INSERT INTO `sysrolemenufunction` VALUES ('24E9A375-893B-4432-50CA-08DA0046A5B6', '40FF1844-C099-4061-98E0-CD6E544FCFD3', 32, '6C09C0C0-72FA-4842-0F1F-08D9FDAD00AB', '2022-03-07 22:27:45', '2022-03-07 22:27:45');
INSERT INTO `sysrolemenufunction` VALUES ('25F59BC4-B4A2-4B0E-50C4-08DA0046A5B6', '40FF1844-C099-4061-98E0-CD6E544FCFD3', 13, 'A3754771-F6E9-4A23-0F2C-08D9FDAD00AB', '2022-03-07 22:27:45', '2022-03-07 22:27:45');
INSERT INTO `sysrolemenufunction` VALUES ('2DADAF13-6DDC-4458-50BC-08DA0046A5B6', '40FF1844-C099-4061-98E0-CD6E544FCFD3', 9, 'B7533A90-DAE4-4263-0F24-08D9FDAD00AB', '2022-03-07 22:27:45', '2022-03-07 22:27:45');
INSERT INTO `sysrolemenufunction` VALUES ('537EE83D-2022-40F1-50BA-08DA0046A5B6', '40FF1844-C099-4061-98E0-CD6E544FCFD3', 6, '1CB6FBE1-4A6C-4AAD-0F22-08D9FDAD00AB', '2022-03-07 22:27:45', '2022-03-07 22:27:45');
INSERT INTO `sysrolemenufunction` VALUES ('59F64FDF-1DC8-4031-50BF-08DA0046A5B6', '40FF1844-C099-4061-98E0-CD6E544FCFD3', 13, 'EB958545-6449-40DB-0F27-08D9FDAD00AB', '2022-03-07 22:27:45', '2022-03-07 22:27:45');
INSERT INTO `sysrolemenufunction` VALUES ('5B3530FD-A94F-47AE-50C9-08DA0046A5B6', '40FF1844-C099-4061-98E0-CD6E544FCFD3', 28, '3F6D0AF7-5386-4D3A-0F71-08D9FDAD00AB', '2022-03-07 22:27:45', '2022-03-07 22:27:45');
INSERT INTO `sysrolemenufunction` VALUES ('6623169B-0573-4F75-50C7-08DA0046A5B6', '40FF1844-C099-4061-98E0-CD6E544FCFD3', 15, '13F3F74D-C6FC-4488-0F2F-08D9FDAD00AB', '2022-03-07 22:27:45', '2022-03-07 22:27:45');
INSERT INTO `sysrolemenufunction` VALUES ('6AC3E66C-48BE-4262-50C8-08DA0046A5B6', '40FF1844-C099-4061-98E0-CD6E544FCFD3', 19, 'C77C812A-1601-4311-0F70-08D9FDAD00AB', '2022-03-07 22:27:45', '2022-03-07 22:27:45');
INSERT INTO `sysrolemenufunction` VALUES ('74857E94-3AEA-4161-50B9-08DA0046A5B6', '40FF1844-C099-4061-98E0-CD6E544FCFD3', 5, 'A1DDD02F-8C21-4D79-0F21-08D9FDAD00AB', '2022-03-07 22:27:45', '2022-03-07 22:27:45');
INSERT INTO `sysrolemenufunction` VALUES ('82220BFF-16F7-4413-50C6-08DA0046A5B6', '40FF1844-C099-4061-98E0-CD6E544FCFD3', 13, '541D9045-47B2-4629-0F2E-08D9FDAD00AB', '2022-03-07 22:27:45', '2022-03-07 22:27:45');
INSERT INTO `sysrolemenufunction` VALUES ('8E81677B-0B69-4AA2-50B7-08DA0046A5B6', '40FF1844-C099-4061-98E0-CD6E544FCFD3', 2, 'A7CD04DB-BBE3-49B6-0F1E-08D9FDAD00AB', '2022-03-07 22:27:45', '2022-03-07 22:27:45');
INSERT INTO `sysrolemenufunction` VALUES ('A96009AD-B7E9-4EB6-50BE-08DA0046A5B6', '40FF1844-C099-4061-98E0-CD6E544FCFD3', 11, '3BC0E68F-D03D-4E99-0F26-08D9FDAD00AB', '2022-03-07 22:27:45', '2022-03-07 22:27:45');
INSERT INTO `sysrolemenufunction` VALUES ('B2A39591-7A0C-419D-50BD-08DA0046A5B6', '40FF1844-C099-4061-98E0-CD6E544FCFD3', 10, 'EC535908-8671-4928-0F25-08D9FDAD00AB', '2022-03-07 22:27:45', '2022-03-07 22:27:45');
INSERT INTO `sysrolemenufunction` VALUES ('BCC9DD20-62FF-4A1B-50BB-08DA0046A5B6', '40FF1844-C099-4061-98E0-CD6E544FCFD3', 8, 'D2E6EA60-2CF6-478A-0F23-08D9FDAD00AB', '2022-03-07 22:27:45', '2022-03-07 22:27:45');
INSERT INTO `sysrolemenufunction` VALUES ('C3F0D869-EB3A-4966-50C5-08DA0046A5B6', '40FF1844-C099-4061-98E0-CD6E544FCFD3', 13, 'B96F977C-A36E-4E7F-0F2D-08D9FDAD00AB', '2022-03-07 22:27:45', '2022-03-07 22:27:45');
INSERT INTO `sysrolemenufunction` VALUES ('C6C7C04B-D22E-4AAD-50B8-08DA0046A5B6', '40FF1844-C099-4061-98E0-CD6E544FCFD3', 3, 'F64CFE50-1EF1-457F-0F20-08D9FDAD00AB', '2022-03-07 22:27:45', '2022-03-07 22:27:45');
INSERT INTO `sysrolemenufunction` VALUES ('E6D2ABFF-C1D4-4855-50C1-08DA0046A5B6', '40FF1844-C099-4061-98E0-CD6E544FCFD3', 13, '106FB69A-8BB5-4559-0F29-08D9FDAD00AB', '2022-03-07 22:27:45', '2022-03-07 22:27:45');
INSERT INTO `sysrolemenufunction` VALUES ('F3C080A9-DDAB-4BCE-50C0-08DA0046A5B6', '40FF1844-C099-4061-98E0-CD6E544FCFD3', 13, 'B5881044-AFB8-40B2-0F28-08D9FDAD00AB', '2022-03-07 22:27:45', '2022-03-07 22:27:45');

-- ----------------------------
-- Table structure for sysuser
-- ----------------------------
DROP TABLE IF EXISTS `sysuser`;
CREATE TABLE `sysuser`  (
  `Id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LastModificationTime` datetime NULL DEFAULT NULL,
  `CreationTime` datetime NULL DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LoginName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DeleteLock` tinyint NULL DEFAULT NULL,
  `OrganizationId` int NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sysuser
-- ----------------------------
INSERT INTO `sysuser` VALUES ('0198459E-2034-4533-B843-5D227AD20740', '2022-03-08 17:27:36', '2017-04-06 19:55:53', '超级管理员', 'admin', 'E10ADC3949BA59ABBE56E057F20F883E', '10000000000', '1396510655@qq.com', 1, 7);
INSERT INTO `sysuser` VALUES ('1550D6D4-0529-4FDD-62DC-08DA00E3D8A0', '2022-03-18 09:44:41', '2022-03-08 17:21:56', '鲁迅', '鲁迅', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 0, 7);
INSERT INTO `sysuser` VALUES ('3739F349-7995-4C63-62D8-08DA00E3D8A0', '2022-03-08 17:17:58', '2022-03-08 17:17:58', '白居易', '白居易', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 0, 7);
INSERT INTO `sysuser` VALUES ('4FD6A740-0CF1-4975-62D6-08DA00E3D8A0', '2022-03-08 17:14:13', '2022-03-08 17:14:13', '李商隐', '李商隐', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 0, 7);
INSERT INTO `sysuser` VALUES ('5722AF0F-2366-4FC9-62D5-08DA00E3D8A0', '2022-03-08 17:13:02', '2022-03-08 17:13:02', '杜甫', '杜甫', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 0, 7);
INSERT INTO `sysuser` VALUES ('A1B6DAFB-2B6A-4FF9-62DA-08DA00E3D8A0', '2022-03-08 17:19:55', '2022-03-08 17:19:55', '屈原', '屈原', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 0, 7);
INSERT INTO `sysuser` VALUES ('A3F9784C-5F00-4EC9-62D9-08DA00E3D8A0', '2022-03-08 17:19:22', '2022-03-08 17:19:22', '陶渊明 ', '陶渊明 ', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 0, 7);
INSERT INTO `sysuser` VALUES ('AC18F496-E93D-42F0-B59E-E321ACC85335', '2022-03-08 10:12:14', '2017-04-06 19:55:53', '李白', 'libai', 'E10ADC3949BA59ABBE56E057F20F883E', '12345678900', '12345678900@live.com', 1, 7);
INSERT INTO `sysuser` VALUES ('CC186FE2-EE27-4292-62DB-08DA00E3D8A0', '2022-03-08 17:20:20', '2022-03-08 17:20:20', '孟浩然', '孟浩然', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 0, 7);
INSERT INTO `sysuser` VALUES ('E225E163-31C9-4DA9-62D7-08DA00E3D8A0', '2022-03-08 17:15:07', '2022-03-08 17:15:07', '苏轼', '苏轼', '46F94C8DE14FB36680850768FF1B7F2A', '12345678900', '12345678900@qq.com', 0, 7);

-- ----------------------------
-- Table structure for sysuserpost
-- ----------------------------
DROP TABLE IF EXISTS `sysuserpost`;
CREATE TABLE `sysuserpost`  (
  `Id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `UserId` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PostId` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime NULL DEFAULT NULL,
  `CreationTime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sysuserpost
-- ----------------------------
INSERT INTO `sysuserpost` VALUES ('0C1A55BA-6BD3-4810-A494-A6B9B7374D4D', 'AC18F496-E93D-42F0-B59E-E321ACC85335', 'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622', '2022-03-08 10:13:35', '2022-03-08 10:13:35');
INSERT INTO `sysuserpost` VALUES ('2aa64ba7-1e8c-4a8c-8b71-c28d66c26a0b', '1550d6d4-0529-4fdd-62dc-08da00e3d8a0', 'f0bd38c2-f1de-4bd9-e2db-08da00a93622', '2022-03-18 09:44:41', '2022-03-18 09:44:41');
INSERT INTO `sysuserpost` VALUES ('575BF085-47BB-42F2-8B68-620CF460B164', '0198459E-2034-4533-B843-5D227AD20740', '96927C30-41D0-4CED-8E29-CBED35C90FB0', '2022-03-08 17:29:22', '2022-03-08 17:29:22');
INSERT INTO `sysuserpost` VALUES ('6C34F115-28DD-441A-81D5-F6598C97D44A', 'A3F9784C-5F00-4EC9-62D9-08DA00E3D8A0', 'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622', '2022-03-08 17:19:22', '2022-03-08 17:19:22');
INSERT INTO `sysuserpost` VALUES ('6F671077-C98D-4106-9736-BF2EDB6DB58D', '4FD6A740-0CF1-4975-62D6-08DA00E3D8A0', 'E46AF329-6D08-442C-9837-F22CFF954411', '2022-03-08 17:14:13', '2022-03-08 17:14:13');
INSERT INTO `sysuserpost` VALUES ('8100145C-9CD0-49BF-9A62-25C9E508BC1C', 'A1B6DAFB-2B6A-4FF9-62DA-08DA00E3D8A0', 'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622', '2022-03-08 17:19:55', '2022-03-08 17:19:55');
INSERT INTO `sysuserpost` VALUES ('978FC672-D829-4DAD-ABC7-071810C5AD18', 'E225E163-31C9-4DA9-62D7-08DA00E3D8A0', 'E46AF329-6D08-442C-9837-F22CFF954411', '2022-03-08 17:15:08', '2022-03-08 17:15:08');
INSERT INTO `sysuserpost` VALUES ('AF1BEC7E-3309-4629-9606-72EEFA1826B3', 'CC186FE2-EE27-4292-62DB-08DA00E3D8A0', 'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622', '2022-03-08 17:20:20', '2022-03-08 17:20:20');
INSERT INTO `sysuserpost` VALUES ('B797FF16-D6F7-45DB-83EC-F910B2612926', '4FD6A740-0CF1-4975-62D6-08DA00E3D8A0', 'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622', '2022-03-08 17:14:13', '2022-03-08 17:14:13');
INSERT INTO `sysuserpost` VALUES ('B97331A7-E281-4027-AADE-9F068558826A', '5722AF0F-2366-4FC9-62D5-08DA00E3D8A0', 'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622', '2022-03-08 17:13:02', '2022-03-08 17:13:02');
INSERT INTO `sysuserpost` VALUES ('D4E0AE0B-3573-4901-8FD7-9BB2C88EBE94', '3739F349-7995-4C63-62D8-08DA00E3D8A0', 'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622', '2022-03-08 17:17:58', '2022-03-08 17:17:58');
INSERT INTO `sysuserpost` VALUES ('E64EF93C-2CE5-4B1D-A5D0-A9DE937C5A3F', 'E225E163-31C9-4DA9-62D7-08DA00E3D8A0', 'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622', '2022-03-08 17:15:07', '2022-03-08 17:15:07');

-- ----------------------------
-- Table structure for sysuserrole
-- ----------------------------
DROP TABLE IF EXISTS `sysuserrole`;
CREATE TABLE `sysuserrole`  (
  `Id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `UserId` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RoleId` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime NULL DEFAULT NULL,
  `CreationTime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sysuserrole
-- ----------------------------
INSERT INTO `sysuserrole` VALUES ('1C9F81DF-C8A0-45BB-A272-C84BD3AF0C19', '0198459E-2034-4533-B843-5D227AD20740', '18FA4771-6F58-46A3-80D2-6F0F5E9972E3', '2022-03-08 17:29:22', '2022-03-08 17:29:22');
INSERT INTO `sysuserrole` VALUES ('1FE23F57-97C5-4670-9064-88D7D972CD28', 'E225E163-31C9-4DA9-62D7-08DA00E3D8A0', '40FF1844-C099-4061-98E0-CD6E544FCFD3', '2022-03-08 17:15:07', '2022-03-08 17:15:07');
INSERT INTO `sysuserrole` VALUES ('45B7D5AF-4D2C-465E-A4B6-99E52AF9AEE5', '3739F349-7995-4C63-62D8-08DA00E3D8A0', '40FF1844-C099-4061-98E0-CD6E544FCFD3', '2022-03-08 17:17:58', '2022-03-08 17:17:58');
INSERT INTO `sysuserrole` VALUES ('9af21d1a-d1ce-4fe7-9100-99c35fe9653d', '1550d6d4-0529-4fdd-62dc-08da00e3d8a0', '40ff1844-c099-4061-98e0-cd6e544fcfd3', '2022-03-18 09:44:41', '2022-03-18 09:44:41');
INSERT INTO `sysuserrole` VALUES ('A646DEF7-0581-4CE9-947E-400360C339F9', 'A1B6DAFB-2B6A-4FF9-62DA-08DA00E3D8A0', '40FF1844-C099-4061-98E0-CD6E544FCFD3', '2022-03-08 17:19:55', '2022-03-08 17:19:55');
INSERT INTO `sysuserrole` VALUES ('A9F8A23B-8C2F-43CC-97AF-8ED6F4C4D097', '4FD6A740-0CF1-4975-62D6-08DA00E3D8A0', '40FF1844-C099-4061-98E0-CD6E544FCFD3', '2022-03-08 17:14:13', '2022-03-08 17:14:13');
INSERT INTO `sysuserrole` VALUES ('AD5014F2-92E8-4109-9CA4-013A92390F8B', 'CC186FE2-EE27-4292-62DB-08DA00E3D8A0', '40FF1844-C099-4061-98E0-CD6E544FCFD3', '2022-03-08 17:20:20', '2022-03-08 17:20:20');
INSERT INTO `sysuserrole` VALUES ('CE9F61AC-79D8-426F-9066-36962C017BF6', '5722AF0F-2366-4FC9-62D5-08DA00E3D8A0', '40FF1844-C099-4061-98E0-CD6E544FCFD3', '2022-03-08 17:13:02', '2022-03-08 17:13:02');
INSERT INTO `sysuserrole` VALUES ('DBC656A6-4264-417D-97D8-577E1218FECA', 'A3F9784C-5F00-4EC9-62D9-08DA00E3D8A0', '40FF1844-C099-4061-98E0-CD6E544FCFD3', '2022-03-08 17:19:22', '2022-03-08 17:19:22');
INSERT INTO `sysuserrole` VALUES ('FA1FDF14-3847-4194-894C-CD935A3DD9E6', 'AC18F496-E93D-42F0-B59E-E321ACC85335', '40FF1844-C099-4061-98E0-CD6E544FCFD3', '2022-03-08 10:13:35', '2022-03-08 10:13:35');

SET FOREIGN_KEY_CHECKS = 1;
