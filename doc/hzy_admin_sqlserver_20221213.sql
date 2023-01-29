/*
 Navicat Premium Data Transfer

 Source Server         : 本地_SqlServer
 Source Server Type    : SQL Server
 Source Server Version : 15002095
 Source Host           : .:1433
 Source Catalog        : hzy_admin_sqlserver_20221213
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 15002095
 File Encoding         : 65001

 Date: 29/01/2023 17:32:38
*/


-- ----------------------------
-- Table structure for __EFMigrationsHistory
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[__EFMigrationsHistory]') AND type IN ('U'))
	DROP TABLE [dbo].[__EFMigrationsHistory]
GO

CREATE TABLE [dbo].[__EFMigrationsHistory] (
  [MigrationId] nvarchar(150) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [ProductVersion] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[__EFMigrationsHistory] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of __EFMigrationsHistory
-- ----------------------------
INSERT INTO [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221212083357_SqlServer_init', N'6.0.9')
GO


-- ----------------------------
-- Table structure for flow
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[flow]') AND type IN ('U'))
	DROP TABLE [dbo].[flow]
GO

CREATE TABLE [dbo].[flow] (
  [Id] uniqueidentifier  NOT NULL,
  [CreatorUserId] uniqueidentifier  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [LastModificationTime] datetime2(7)  NULL,
  [Number] int  NULL,
  [Code] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Name] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Remark] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[flow] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of flow
-- ----------------------------

-- ----------------------------
-- Table structure for flow_approval
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[flow_approval]') AND type IN ('U'))
	DROP TABLE [dbo].[flow_approval]
GO

CREATE TABLE [dbo].[flow_approval] (
  [Id] uniqueidentifier  NOT NULL,
  [CreatorUserId] uniqueidentifier  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [LastModificationTime] datetime2(7)  NULL,
  [UserId] uniqueidentifier  NOT NULL,
  [UserName] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [LaunchTime] datetime2(7)  NOT NULL,
  [FormId] uniqueidentifier  NOT NULL,
  [FlowId] uniqueidentifier  NOT NULL,
  [FlowCode] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [FlowName] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[flow_approval] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of flow_approval
-- ----------------------------

-- ----------------------------
-- Table structure for flow_approval_step_history
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[flow_approval_step_history]') AND type IN ('U'))
	DROP TABLE [dbo].[flow_approval_step_history]
GO

CREATE TABLE [dbo].[flow_approval_step_history] (
  [Id] uniqueidentifier  NOT NULL,
  [CreatorUserId] uniqueidentifier  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [LastModificationTime] datetime2(7)  NULL,
  [Sort] int  NOT NULL,
  [FlowNodeId] uniqueidentifier  NOT NULL,
  [FlowNodeName] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [SortMore] int  NOT NULL,
  [State] int  NOT NULL,
  [Opinions] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [UserId] uniqueidentifier  NOT NULL,
  [UserName] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [ApprovalDate] datetime2(7)  NOT NULL
)
GO

ALTER TABLE [dbo].[flow_approval_step_history] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of flow_approval_step_history
-- ----------------------------

-- ----------------------------
-- Table structure for flow_approval_step_history_user
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[flow_approval_step_history_user]') AND type IN ('U'))
	DROP TABLE [dbo].[flow_approval_step_history_user]
GO

CREATE TABLE [dbo].[flow_approval_step_history_user] (
  [Id] uniqueidentifier  NOT NULL,
  [CreatorUserId] uniqueidentifier  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [LastModificationTime] datetime2(7)  NULL,
  [FlowApprovalStepHistoryId] uniqueidentifier  NOT NULL,
  [FlowNodeId] uniqueidentifier  NOT NULL,
  [FlowNodeName] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [UserId] uniqueidentifier  NOT NULL,
  [UserName] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[flow_approval_step_history_user] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of flow_approval_step_history_user
-- ----------------------------

-- ----------------------------
-- Table structure for flow_node
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[flow_node]') AND type IN ('U'))
	DROP TABLE [dbo].[flow_node]
GO

CREATE TABLE [dbo].[flow_node] (
  [Id] uniqueidentifier  NOT NULL,
  [CreatorUserId] uniqueidentifier  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [LastModificationTime] datetime2(7)  NULL,
  [FlowId] uniqueidentifier  NOT NULL,
  [Sort] int  NULL,
  [Name] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [RoleId] uniqueidentifier  NOT NULL,
  [Remark] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[flow_node] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of flow_node
-- ----------------------------

-- ----------------------------
-- Table structure for low_code_list
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[low_code_list]') AND type IN ('U'))
	DROP TABLE [dbo].[low_code_list]
GO

CREATE TABLE [dbo].[low_code_list] (
  [Id] uniqueidentifier  NOT NULL,
  [CreatorUserId] uniqueidentifier  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [LastModificationTime] datetime2(7)  NULL,
  [Low_Code_TableId] uniqueidentifier  NOT NULL,
  [Low_Code_Table_InfoId] uniqueidentifier  NOT NULL,
  [ForeignKeyTableId] uniqueidentifier  NOT NULL,
  [ForeignKeyTableFieldName] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[low_code_list] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of low_code_list
-- ----------------------------

-- ----------------------------
-- Table structure for low_code_search
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[low_code_search]') AND type IN ('U'))
	DROP TABLE [dbo].[low_code_search]
GO

CREATE TABLE [dbo].[low_code_search] (
  [Id] uniqueidentifier  NOT NULL,
  [CreatorUserId] uniqueidentifier  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [LastModificationTime] datetime2(7)  NULL,
  [Low_Code_TableId] uniqueidentifier  NOT NULL,
  [Low_Code_Table_InfoId] uniqueidentifier  NOT NULL
)
GO

ALTER TABLE [dbo].[low_code_search] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of low_code_search
-- ----------------------------

-- ----------------------------
-- Table structure for low_code_table
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[low_code_table]') AND type IN ('U'))
	DROP TABLE [dbo].[low_code_table]
GO

CREATE TABLE [dbo].[low_code_table] (
  [Id] uniqueidentifier  NOT NULL,
  [CreatorUserId] uniqueidentifier  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [LastModificationTime] datetime2(7)  NULL,
  [TableName] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Schema] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Type] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [DisplayName] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [EntityName] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Remark] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [ProjectRootPath] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [ModelPath] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [ServicePath] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [ControllerPath] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [ClientIndexPath] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [ClientInfoPath] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [ClientServicePath] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [IsCover] bit  NULL
)
GO

ALTER TABLE [dbo].[low_code_table] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of low_code_table
-- ----------------------------
INSERT INTO [dbo].[low_code_table] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [ClientIndexPath], [ClientInfoPath], [ClientServicePath], [IsCover]) VALUES (N'69B24F04-0ED3-45FC-91D9-0DC929175A57', NULL, N'2022-04-17 00:00:00.0000000', NULL, N'2022-08-01 20:32:25.0000000', N'sys_user_post', N'dbo', N'TABLE', N'用户与岗位', N'SysUserPost', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [ClientIndexPath], [ClientInfoPath], [ClientServicePath], [IsCover]) VALUES (N'7F94E0DB-FC63-40DC-BFE3-18C5AAD75975', NULL, N'2022-07-29 00:00:00.0000000', NULL, N'2022-08-01 20:32:25.0000000', N'flow_approval_step_history_user', N'dbo', N'TABLE', N'', N'FlowApprovalStepHistoryUser', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [ClientIndexPath], [ClientInfoPath], [ClientServicePath], [IsCover]) VALUES (N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', NULL, N'2022-05-23 00:00:00.0000000', NULL, N'2022-08-01 20:32:25.0000000', N'low_code_table', N'dbo', N'TABLE', N'低代码表', N'LowCodeTable', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [ClientIndexPath], [ClientInfoPath], [ClientServicePath], [IsCover]) VALUES (N'651BB982-1130-4E1C-9070-36B90DCF2324', NULL, N'2022-04-17 00:00:00.0000000', NULL, N'2022-07-29 21:59:11.0000000', N'flow_approval_step', NULL, NULL, N'工作流审批步骤配置', N'FlowApprovalStep', NULL, NULL, N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [ClientIndexPath], [ClientInfoPath], [ClientServicePath], [IsCover]) VALUES (N'524E71B4-CBF7-4248-8B29-3F99B43F2EB2', NULL, N'2022-04-17 00:00:00.0000000', NULL, N'2022-08-01 20:32:25.0000000', N'sys_data_authority_custom', N'dbo', N'TABLE', N'自定义数据权限', N'SysDataAuthorityCustom', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [ClientIndexPath], [ClientInfoPath], [ClientServicePath], [IsCover]) VALUES (N'7AD3B915-F0BD-443A-89CD-42D41DD6C554', NULL, N'2022-04-17 00:00:00.0000000', NULL, N'2022-07-29 21:59:11.0000000', N'flow_approval_step_user', NULL, NULL, N'工作流用户审批步骤', N'FlowApprovalStepUser', NULL, NULL, N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [ClientIndexPath], [ClientInfoPath], [ClientServicePath], [IsCover]) VALUES (N'1A8DF018-79F8-4E26-B4EB-4B735AAE7275', NULL, N'2022-04-17 00:00:00.0000000', NULL, N'2022-08-01 20:32:25.0000000', N'flow', N'dbo', N'TABLE', N'审批流', N'Flow', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [ClientIndexPath], [ClientInfoPath], [ClientServicePath], [IsCover]) VALUES (N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', NULL, N'2022-04-17 00:00:00.0000000', NULL, N'2022-08-01 20:32:25.0000000', N'sys_operation_log', N'dbo', N'TABLE', N'操作日志', N'SysOperationLog', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [ClientIndexPath], [ClientInfoPath], [ClientServicePath], [IsCover]) VALUES (N'2AE9E532-7D9A-474B-B629-50A39945C44D', NULL, N'2022-04-17 00:00:00.0000000', NULL, N'2022-08-01 20:32:25.0000000', N'sys_menu_function', N'dbo', N'TABLE', N'菜单功能', N'SysMenuFunction', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [ClientIndexPath], [ClientInfoPath], [ClientServicePath], [IsCover]) VALUES (N'D8948C56-C5BD-4061-B272-5417375F38F0', NULL, N'2022-04-17 00:00:00.0000000', NULL, N'2022-08-01 20:32:25.0000000', N'flow_approval', N'dbo', N'TABLE', N'审批流审批', N'FlowApproval', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [ClientIndexPath], [ClientInfoPath], [ClientServicePath], [IsCover]) VALUES (N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', NULL, N'2022-04-17 00:00:00.0000000', NULL, N'2022-08-01 20:32:25.0000000', N'sys_organization', N'dbo', N'TABLE', N'组织', N'SysOrganization', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [ClientIndexPath], [ClientInfoPath], [ClientServicePath], [IsCover]) VALUES (N'6323638B-A45F-4A76-886E-69A9E9BE0901', NULL, N'2022-04-17 00:00:00.0000000', NULL, N'2022-08-01 20:32:25.0000000', N'sys_user', N'dbo', N'TABLE', N'用户', N'SysUser', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [ClientIndexPath], [ClientInfoPath], [ClientServicePath], [IsCover]) VALUES (N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', NULL, N'2022-05-23 00:00:00.0000000', NULL, N'2022-08-01 20:32:25.0000000', N'low_code_table_info', N'dbo', N'TABLE', N'低代码表信息', N'LowCodeTableInfo', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [ClientIndexPath], [ClientInfoPath], [ClientServicePath], [IsCover]) VALUES (N'AF37F705-7BA0-4883-B1BE-8A274EA4C026', NULL, N'2022-04-17 00:00:00.0000000', NULL, N'2022-08-01 20:32:25.0000000', N'sys_dictionary', N'dbo', N'TABLE', N'数据字典', N'SysDictionary', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [ClientIndexPath], [ClientInfoPath], [ClientServicePath], [IsCover]) VALUES (N'73C97832-4E7F-4758-86D2-94327971B5FD', NULL, N'2022-04-17 00:00:00.0000000', NULL, N'2022-08-01 20:32:25.0000000', N'member', N'dbo', N'TABLE', N'会员', N'Member', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [ClientIndexPath], [ClientInfoPath], [ClientServicePath], [IsCover]) VALUES (N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', NULL, N'2022-04-17 00:00:00.0000000', NULL, N'2022-08-01 20:32:25.0000000', N'sys_menu', N'dbo', N'TABLE', N'菜单', N'SysMenu', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [ClientIndexPath], [ClientInfoPath], [ClientServicePath], [IsCover]) VALUES (N'F3D7BBB3-C1FB-4D61-92A4-9BC101811335', NULL, N'2022-04-17 00:00:00.0000000', NULL, N'2022-08-01 20:32:25.0000000', N'sys_role', N'dbo', N'TABLE', N'角色', N'SysRole', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [ClientIndexPath], [ClientInfoPath], [ClientServicePath], [IsCover]) VALUES (N'852F53FF-0D00-4C32-AA55-A9C11993751B', NULL, N'2022-05-23 00:00:00.0000000', NULL, N'2022-08-01 20:32:25.0000000', N'low_code_list', N'dbo', N'TABLE', N'低代码列表', N'LowCodeList', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [ClientIndexPath], [ClientInfoPath], [ClientServicePath], [IsCover]) VALUES (N'AE6D94D8-6A15-4348-B600-AA17E4B61718', NULL, N'2022-04-17 00:00:00.0000000', NULL, N'2022-08-01 20:32:25.0000000', N'flow_node', N'dbo', N'TABLE', N'工作流节点', N'FlowNode', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [ClientIndexPath], [ClientInfoPath], [ClientServicePath], [IsCover]) VALUES (N'69EDD8A8-1D24-478C-A909-B82039EDCEC0', NULL, N'2022-05-23 00:00:00.0000000', NULL, N'2022-08-01 20:32:25.0000000', N'low_code_search', N'dbo', N'TABLE', N'低代码检索表', N'LowCodeSearch', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [ClientIndexPath], [ClientInfoPath], [ClientServicePath], [IsCover]) VALUES (N'18FBB18E-CB29-45D8-A5F3-C0121C57680A', NULL, N'2022-07-29 00:00:00.0000000', NULL, N'2022-08-01 20:32:25.0000000', N'flow_approval_step_history', N'dbo', N'TABLE', N'', N'FlowApprovalStepHistory', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [ClientIndexPath], [ClientInfoPath], [ClientServicePath], [IsCover]) VALUES (N'6FABC67A-8B48-49A6-8BA1-C8A32C499D36', NULL, N'2022-04-17 00:00:00.0000000', NULL, N'2022-08-01 20:32:25.0000000', N'sys_function', N'dbo', N'TABLE', N'功能', N'SysFunction', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [ClientIndexPath], [ClientInfoPath], [ClientServicePath], [IsCover]) VALUES (N'0A8BDB18-758A-4798-9FFC-E7031DCBF262', NULL, N'2022-04-17 00:00:00.0000000', NULL, N'2022-08-01 20:32:25.0000000', N'sys_post', N'dbo', N'TABLE', N'岗位', N'SysPost', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [ClientIndexPath], [ClientInfoPath], [ClientServicePath], [IsCover]) VALUES (N'8DA38D20-8A09-4E81-8DD8-ED6702AEE380', NULL, N'2022-04-17 00:00:00.0000000', NULL, N'2022-08-01 20:32:25.0000000', N'sys_role_menu_function', N'dbo', N'TABLE', N'角色菜单功能关联', N'SysRoleMenuFunction', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [ClientIndexPath], [ClientInfoPath], [ClientServicePath], [IsCover]) VALUES (N'E79DB53B-7162-4669-9B5E-F860501475AC', NULL, N'2022-04-17 00:00:00.0000000', NULL, N'2022-08-01 20:32:25.0000000', N'sys_data_authority', N'dbo', N'TABLE', N'数据权限', N'SysDataAuthority', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [ClientIndexPath], [ClientInfoPath], [ClientServicePath], [IsCover]) VALUES (N'3DA5D264-2E8D-460C-A10C-FF9A6BB57A60', NULL, N'2022-04-17 00:00:00.0000000', NULL, N'2022-08-01 20:32:25.0000000', N'sys_user_role', N'dbo', N'TABLE', N'用户与角色', N'SysUserRole', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO


-- ----------------------------
-- Table structure for low_code_table_info
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[low_code_table_info]') AND type IN ('U'))
	DROP TABLE [dbo].[low_code_table_info]
GO

CREATE TABLE [dbo].[low_code_table_info] (
  [Id] uniqueidentifier  NOT NULL,
  [CreatorUserId] uniqueidentifier  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [LastModificationTime] datetime2(7)  NULL,
  [Low_Code_TableId] uniqueidentifier  NOT NULL,
  [IsPrimary] bit  NOT NULL,
  [IsIdentity] bit  NOT NULL,
  [IsNullable] bit  NOT NULL,
  [Position] int  NOT NULL,
  [ColumnName] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Describe] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [DatabaseColumnType] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [CsType] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [CsField] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [MaxLength] int  NULL,
  [DisplayName] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[low_code_table_info] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of low_code_table_info
-- ----------------------------
INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'60019CD9-49EB-489B-97B5-08DA39A2EF6C', NULL, N'2022-05-19 00:00:00.0000000', NULL, N'2022-05-19 22:26:18.0000000', N'3DA5D264-2E8D-460C-A10C-FF9A6BB57A60', N'1', N'0', N'0', N'170', N'Id', N'Id', N'uniqueidentifier', N'Guid', N'Id', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'825E69B9-CD33-4AB8-97B6-08DA39A2EF6C', NULL, N'2022-05-19 00:00:00.0000000', NULL, N'2022-05-19 22:26:18.0000000', N'3DA5D264-2E8D-460C-A10C-FF9A6BB57A60', N'0', N'0', N'1', N'174', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'252AC7B2-0E62-48E1-97B7-08DA39A2EF6C', NULL, N'2022-05-19 00:00:00.0000000', NULL, N'2022-05-19 22:26:18.0000000', N'3DA5D264-2E8D-460C-A10C-FF9A6BB57A60', N'0', N'0', N'1', N'173', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'2029BB6D-A0F2-41DE-97B8-08DA39A2EF6C', NULL, N'2022-05-19 00:00:00.0000000', NULL, N'2022-05-19 22:26:18.0000000', N'3DA5D264-2E8D-460C-A10C-FF9A6BB57A60', N'0', N'0', N'1', N'172', N'RoleId', N'', N'uniqueidentifier', N'Guid', N'RoleId', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'18B4430B-765D-4A71-97B9-08DA39A2EF6C', NULL, N'2022-05-19 00:00:00.0000000', NULL, N'2022-05-19 22:26:18.0000000', N'3DA5D264-2E8D-460C-A10C-FF9A6BB57A60', N'0', N'0', N'1', N'171', N'UserId', N'', N'uniqueidentifier', N'Guid', N'UserId', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'A72C0341-82E8-48AD-D481-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'1A8DF018-79F8-4E26-B4EB-4B735AAE7275', N'1', N'0', N'0', N'24', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'70E30A70-99F9-44B3-D482-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'1A8DF018-79F8-4E26-B4EB-4B735AAE7275', N'0', N'0', N'1', N'28', N'Code', N'编码', N'nvarchar(255)', N'String', N'Code', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'5FC01EB0-4833-4E93-D483-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'1A8DF018-79F8-4E26-B4EB-4B735AAE7275', N'0', N'0', N'1', N'26', N'CreationTime', N'', N'datetime', N'DateTime', N'CreationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'FD9ABF54-3C88-44B0-D484-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'1A8DF018-79F8-4E26-B4EB-4B735AAE7275', N'0', N'0', N'1', N'25', N'LastModificationTime', N'', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'06F4F5A9-F63F-4E47-D485-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'1A8DF018-79F8-4E26-B4EB-4B735AAE7275', N'0', N'0', N'1', N'29', N'Name', N'流程名称', N'nvarchar(255)', N'String', N'Name', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'5CB41F1C-E68A-47F9-D486-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'1A8DF018-79F8-4E26-B4EB-4B735AAE7275', N'0', N'0', N'1', N'27', N'Number', N'排序号', N'int', N'Int32', N'Number', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'F21D4C33-E65A-4DFE-D487-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'1A8DF018-79F8-4E26-B4EB-4B735AAE7275', N'0', N'0', N'1', N'30', N'Remark', N'备注', N'nvarchar(255)', N'String', N'Remark', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'B9BBAB1D-0A03-4D07-D488-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'D8948C56-C5BD-4061-B272-5417375F38F0', N'1', N'0', N'0', N'31', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'01CA178C-112A-4A49-D489-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'D8948C56-C5BD-4061-B272-5417375F38F0', N'0', N'0', N'1', N'33', N'CreationTime', N'', N'datetime', N'DateTime', N'CreationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'A0FDEB45-C9FE-439B-D48A-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'D8948C56-C5BD-4061-B272-5417375F38F0', N'0', N'0', N'1', N'39', N'FlowCode', N'流程编码', N'varchar(255)', N'String', N'FlowCode', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'2B4747ED-0409-4D14-D48B-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'D8948C56-C5BD-4061-B272-5417375F38F0', N'0', N'0', N'1', N'38', N'FlowId', N'流程Id', N'uniqueidentifier', N'Guid', N'FlowId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'F00CDE73-2294-40D6-D48C-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'D8948C56-C5BD-4061-B272-5417375F38F0', N'0', N'0', N'1', N'40', N'FlowName', N'流程名称', N'varchar(255)', N'String', N'FlowName', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'CAAE5D6F-F9C7-4EDB-D48D-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'D8948C56-C5BD-4061-B272-5417375F38F0', N'0', N'0', N'1', N'37', N'FormId', N'表单Id', N'varchar(50)', N'String', N'FormId', N'50', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'609A52AA-48B2-4E64-D48E-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'D8948C56-C5BD-4061-B272-5417375F38F0', N'0', N'0', N'1', N'32', N'LastModificationTime', N'', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'3071360B-C1EF-4DFF-D48F-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'D8948C56-C5BD-4061-B272-5417375F38F0', N'0', N'0', N'1', N'36', N'LaunchTime', N'发起时间', N'datetime', N'DateTime', N'LaunchTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'ACF079D0-3DB9-43F7-D490-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'D8948C56-C5BD-4061-B272-5417375F38F0', N'0', N'0', N'1', N'34', N'UserId', N'发起人Id', N'uniqueidentifier', N'Guid', N'UserId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'6284C929-4115-4C17-D491-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'D8948C56-C5BD-4061-B272-5417375F38F0', N'0', N'0', N'1', N'35', N'UserName', N'发起人', N'varchar(255)', N'String', N'UserName', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'F5C93CC7-50A6-4E0E-D492-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'651BB982-1130-4E1C-9070-36B90DCF2324', N'1', N'0', N'0', N'41', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'F6D23541-2FCA-40E6-D493-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'52', N'ApprovalDate', N'审批时间', N'datetime', N'DateTime', N'ApprovalDate', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'8AD408DB-B5AA-4CB7-D494-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'43', N'CreationTime', N'', N'datetime', N'DateTime', N'CreationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'2FFAA9EE-C286-4F90-D495-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'45', N'FlowNodeId', N'审批流节点Id', N'uniqueidentifier', N'Guid', N'FlowNodeId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'AAA312A2-73FB-4C84-D496-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'46', N'FlowNodeName', N'审批流节点名称', N'varchar(255)', N'String', N'FlowNodeName', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'043612F1-E16A-4C44-D497-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'42', N'LastModificationTime', N'', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'A8BE7873-7CE4-4CB2-D498-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'49', N'OpinIons', N'步骤审批意见', N'varchar(255)', N'String', N'OpinIons', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'E8E60481-FB7F-4F1D-D499-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'44', N'Sort', N'步骤顺序号', N'int', N'Int32', N'Sort', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'2A1C3F3D-4EFC-472B-D49A-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'47', N'SortMore', N'多次审批顺序号（可能是多次审批次数）', N'int', N'Int32', N'SortMore', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'CBD75568-2ECE-4F90-D49B-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'48', N'State', N'步骤状态（待审批、同意、不同意、回退升级审批）', N'int', N'Int32', N'State', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'E67FD0C6-A997-4956-D49C-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'50', N'UserId', N'步骤审批人Id', N'uniqueidentifier', N'Guid', N'UserId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'24DB7ED8-1A4F-4B25-D49D-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'51', N'UserName', N'步骤审批人名称', N'varchar(255)', N'String', N'UserName', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'E346CF76-EC76-4409-D49E-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'7AD3B915-F0BD-443A-89CD-42D41DD6C554', N'1', N'0', N'0', N'53', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'AE55FABC-3944-4A36-D49F-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'7AD3B915-F0BD-443A-89CD-42D41DD6C554', N'0', N'0', N'1', N'55', N'CreationTime', N'', N'datetime', N'DateTime', N'CreationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'B754AF63-F1DE-4000-D4A0-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'7AD3B915-F0BD-443A-89CD-42D41DD6C554', N'0', N'0', N'1', N'56', N'FlowApprovalStepId', N'步骤Id', N'uniqueidentifier', N'Guid', N'FlowApprovalStepId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'495FE86E-5BD6-44D4-D4A1-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'7AD3B915-F0BD-443A-89CD-42D41DD6C554', N'0', N'0', N'1', N'57', N'FlowNodeId', N'审批节点Id', N'uniqueidentifier', N'Guid', N'FlowNodeId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'D48C70E6-4549-41B6-D4A2-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'7AD3B915-F0BD-443A-89CD-42D41DD6C554', N'0', N'0', N'1', N'58', N'FlowNodeName', N'审批节点名称', N'varchar(500)', N'String', N'FlowNodeName', N'500', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'0E864B91-B667-4F53-D4A3-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'7AD3B915-F0BD-443A-89CD-42D41DD6C554', N'0', N'0', N'1', N'54', N'LastModificationTime', N'', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'92BC9094-160E-4338-D4A4-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'7AD3B915-F0BD-443A-89CD-42D41DD6C554', N'0', N'0', N'1', N'59', N'UserId', N'审批人Id', N'uniqueidentifier', N'Guid', N'UserId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'0CFC881C-98D4-4A2C-D4A5-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'7AD3B915-F0BD-443A-89CD-42D41DD6C554', N'0', N'0', N'1', N'60', N'UserName', N'审批人名称', N'varchar(500)', N'String', N'UserName', N'500', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'2819DFE7-F12B-483C-D4A6-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'AE6D94D8-6A15-4348-B600-AA17E4B61718', N'1', N'0', N'0', N'61', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'0E19400D-1876-4FE3-D4A7-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'AE6D94D8-6A15-4348-B600-AA17E4B61718', N'0', N'0', N'1', N'63', N'CreationTime', N'', N'datetime', N'DateTime', N'CreationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'5CA84ECF-5971-45BC-D4A8-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'AE6D94D8-6A15-4348-B600-AA17E4B61718', N'0', N'0', N'1', N'65', N'FlowCode', N'', N'nvarchar(255)', N'String', N'FlowCode', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'9BC385E0-10EE-4299-D4A9-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'AE6D94D8-6A15-4348-B600-AA17E4B61718', N'0', N'0', N'1', N'64', N'FlowId', N'', N'uniqueidentifier', N'Guid', N'FlowId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'D45AC420-E348-4D6B-D4AA-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'AE6D94D8-6A15-4348-B600-AA17E4B61718', N'0', N'0', N'1', N'62', N'LastModificationTime', N'', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'0DF6B078-B248-4C83-D4AB-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'AE6D94D8-6A15-4348-B600-AA17E4B61718', N'0', N'0', N'1', N'67', N'Name', N'', N'nvarchar(255)', N'String', N'Name', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'2321AAC8-0EED-4B87-D4AC-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'AE6D94D8-6A15-4348-B600-AA17E4B61718', N'0', N'0', N'1', N'69', N'Remark', N'', N'nvarchar(255)', N'String', N'Remark', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'73D17476-E006-4530-D4AD-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'AE6D94D8-6A15-4348-B600-AA17E4B61718', N'0', N'0', N'1', N'68', N'RoleId', N'', N'uniqueidentifier', N'Guid', N'RoleId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'E571FD26-B1A8-4648-D4AE-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'AE6D94D8-6A15-4348-B600-AA17E4B61718', N'0', N'0', N'1', N'66', N'Sort', N'', N'int', N'Int32', N'Sort', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'C2F1A286-2B35-41D6-D4AF-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'852F53FF-0D00-4C32-AA55-A9C11993751B', N'1', N'0', N'0', N'189', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'92C1FFFC-5A00-468C-D4B0-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'852F53FF-0D00-4C32-AA55-A9C11993751B', N'0', N'0', N'1', N'191', N'CreationTime', N'', N'datetime', N'DateTime', N'CreationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'7B900BAF-65DF-4910-D4B1-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'852F53FF-0D00-4C32-AA55-A9C11993751B', N'0', N'0', N'1', N'195', N'ForeignKeyTableFieldName', N'', N'varchar(50)', N'String', N'ForeignKeyTableFieldName', N'50', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'E7FACEE2-5132-4003-D4B2-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'852F53FF-0D00-4C32-AA55-A9C11993751B', N'0', N'0', N'1', N'194', N'ForeignKeyTableId', N'', N'uniqueidentifier', N'Guid', N'ForeignKeyTableId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'2AE91C1D-D618-4267-D4B3-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'852F53FF-0D00-4C32-AA55-A9C11993751B', N'0', N'0', N'1', N'190', N'LastModificationTime', N'', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'A2660342-556E-4AEF-D4B4-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'852F53FF-0D00-4C32-AA55-A9C11993751B', N'0', N'0', N'1', N'193', N'Low_Code_Table_InfoId', N'', N'uniqueidentifier', N'Guid', N'Low_Code_Table_InfoId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'585E18EA-AB50-4216-D4B5-08DA3D8D5A26', NULL, N'2022-05-24 21:57:33.0000000', NULL, N'2022-05-24 21:57:33.0000000', N'852F53FF-0D00-4C32-AA55-A9C11993751B', N'0', N'0', N'1', N'192', N'Low_Code_TableId', N'', N'uniqueidentifier', N'Guid', N'Low_Code_TableId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'7C7400ED-EC08-4832-D4B6-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'69EDD8A8-1D24-478C-A909-B82039EDCEC0', N'1', N'0', N'0', N'184', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'A29E0236-9C06-4A70-D4B7-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'69EDD8A8-1D24-478C-A909-B82039EDCEC0', N'0', N'0', N'1', N'186', N'CreationTime', N'', N'datetime', N'DateTime', N'CreationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'8237D289-05CF-485B-D4B8-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'69EDD8A8-1D24-478C-A909-B82039EDCEC0', N'0', N'0', N'1', N'185', N'LastModificationTime', N'', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'1A2A9E15-DC83-49E1-D4B9-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'69EDD8A8-1D24-478C-A909-B82039EDCEC0', N'0', N'0', N'1', N'188', N'Low_Code_Table_InfoId', N'', N'uniqueidentifier', N'Guid', N'Low_Code_Table_InfoId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'7B4DF31F-36A3-477C-D4BA-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'69EDD8A8-1D24-478C-A909-B82039EDCEC0', N'0', N'0', N'1', N'187', N'Low_Code_TableId', N'', N'uniqueidentifier', N'Guid', N'Low_Code_TableId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'9B1B319A-E9DC-406D-D4C4-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'1', N'0', N'0', N'196', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'11AFCF11-9B42-47CE-D4C5-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'204', N'ColumnName', N'', N'varchar(500)', N'String', N'ColumnName', N'500', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'1E40D97A-49EE-4727-D4C6-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'198', N'CreationTime', N'', N'datetime', N'DateTime', N'CreationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'E0E9D3C3-B713-419C-D4C7-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'208', N'CsField', N'', N'varchar(50)', N'String', N'CsField', N'50', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'EB846AC3-723E-4207-D4C8-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'207', N'CsType', N'', N'varchar(50)', N'String', N'CsType', N'50', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'48B12860-84DE-4F7B-D4C9-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'206', N'DatabaseColumnType', N'', N'varchar(50)', N'String', N'DatabaseColumnType', N'50', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'3B959124-21D2-45B9-D4CA-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'205', N'Describe', N'', N'varchar(50)', N'String', N'Describe', N'50', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'86B95BF0-4418-46BA-D4CB-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'201', N'IsIdentity', N'', N'bit', N'Boolean', N'IsIdentity', N'1', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'5FEA8348-AA6B-4577-D4CC-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'202', N'IsNullable', N'', N'bit', N'Boolean', N'IsNullable', N'1', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'1D3C8224-A3A5-4B88-D4CD-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'200', N'IsPrimary', N'', N'bit', N'Boolean', N'IsPrimary', N'1', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'CF99D60B-2392-493C-D4CE-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'197', N'LastModificationTime', N'', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'F221DA94-0A1D-4CE7-D4CF-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'199', N'Low_Code_TableId', N'', N'uniqueidentifier', N'Guid', N'Low_Code_TableId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'DE43269D-D43B-4A77-D4D0-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'209', N'MaxLength', N'', N'int', N'Int32', N'MaxLength', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'4AAA1E18-8C06-4806-D4D1-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'203', N'Position', N'', N'int', N'Int32', N'Position', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'E75B8650-EE49-4F83-D4D2-08DA3D8D5A26', NULL, N'2022-05-24 00:00:00.0000000', NULL, N'2022-06-08 21:20:04.0000000', N'73C97832-4E7F-4758-86D2-94327971B5FD', N'1', N'0', N'0', N'70', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'B7FBB61F-94FC-4242-D4D3-08DA3D8D5A26', NULL, N'2022-05-24 00:00:00.0000000', NULL, N'2022-06-08 21:20:04.0000000', N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'75', N'Birthday', N'', N'datetime2', N'DateTime', N'Birthday', NULL, N'生日')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'5541E535-7CBE-43D2-D4D4-08DA3D8D5A26', NULL, N'2022-05-24 00:00:00.0000000', NULL, N'2022-06-08 21:20:04.0000000', N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'80', N'CreationTime', N'创建时间', N'datetime2', N'DateTime', N'CreationTime', NULL, N'创建时间')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'E4245F5F-BFFA-43F0-D4D5-08DA3D8D5A26', NULL, N'2022-05-24 00:00:00.0000000', NULL, N'2022-06-08 21:20:04.0000000', N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'78', N'FilePath', N'文件地址', N'nvarchar(255)', N'String', N'FilePath', NULL, N'文件地址')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'8326CA11-09F1-4C38-D4D6-08DA3D8D5A26', NULL, N'2022-05-24 00:00:00.0000000', NULL, N'2022-06-08 21:20:04.0000000', N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'77', N'Introduce', N'', N'nvarchar(255)', N'String', N'Introduce', NULL, N'简介')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'897A208C-2E13-46F1-D4D7-08DA3D8D5A26', NULL, N'2022-05-24 00:00:00.0000000', NULL, N'2022-06-08 21:20:04.0000000', N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'81', N'LastModificationTime', N'更新时间', N'datetime2', N'DateTime', N'LastModificationTime', NULL, N'更新时间')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'D1EB49CF-C053-4226-D4D8-08DA3D8D5A26', NULL, N'2022-05-24 00:00:00.0000000', NULL, N'2022-06-08 21:20:04.0000000', N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'72', N'Name', N'', N'nvarchar(255)', N'String', N'Name', NULL, N'会员名称')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'BF24A276-6ED0-49D4-D4D9-08DA3D8D5A26', NULL, N'2022-05-24 00:00:00.0000000', NULL, N'2022-06-08 21:20:04.0000000', N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'71', N'Number', N'', N'nvarchar(255)', N'String', N'Number', NULL, N'编号')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'669B87CE-C694-4C8C-D4DA-08DA3D8D5A26', NULL, N'2022-05-24 00:00:00.0000000', NULL, N'2022-06-08 21:20:04.0000000', N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'73', N'Phone', N'', N'nvarchar(255)', N'String', N'Phone', NULL, N'联系电话')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'F03AC01C-E0CF-4F13-D4DB-08DA3D8D5A26', NULL, N'2022-05-24 00:00:00.0000000', NULL, N'2022-06-08 21:20:04.0000000', N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'76', N'Photo', N'', N'nvarchar(255)', N'String', N'Photo', NULL, N'头像')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'72AC247C-D792-4FEE-D4DC-08DA3D8D5A26', NULL, N'2022-05-24 00:00:00.0000000', NULL, N'2022-06-08 21:20:04.0000000', N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'74', N'Sex', N'', N'nvarchar(255)', N'String', N'Sex', NULL, N'性别')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'837B058B-A88E-4107-D4DD-08DA3D8D5A26', NULL, N'2022-05-24 00:00:00.0000000', NULL, N'2022-06-08 21:20:04.0000000', N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'79', N'UserId', N'所属用户', N'uniqueidentifier', N'Guid', N'UserId', NULL, N'所属用户')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'97284D66-88B9-478F-D4E5-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'E79DB53B-7162-4669-9B5E-F860501475AC', N'1', N'0', N'0', N'82', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'B6422CB6-498E-4FF5-D4E6-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'E79DB53B-7162-4669-9B5E-F860501475AC', N'0', N'0', N'1', N'84', N'CreationTime', N'', N'datetime', N'DateTime', N'CreationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'9DE60DD7-A403-442D-D4E7-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'E79DB53B-7162-4669-9B5E-F860501475AC', N'0', N'0', N'1', N'83', N'LastModificationTime', N'', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'0F908E1D-4A82-42C1-D4E8-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'E79DB53B-7162-4669-9B5E-F860501475AC', N'0', N'0', N'1', N'86', N'PermissionType', N'数据权限类型', N'int', N'Int32', N'PermissionType', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'9C9F9672-3FA0-4C65-D4E9-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'E79DB53B-7162-4669-9B5E-F860501475AC', N'0', N'0', N'1', N'85', N'RoleId', N'', N'uniqueidentifier', N'Guid', N'RoleId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'DF559C6B-6F60-467C-D4EA-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'524E71B4-CBF7-4248-8B29-3F99B43F2EB2', N'1', N'0', N'0', N'87', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'2341DCB1-8056-4A7C-D4EB-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'524E71B4-CBF7-4248-8B29-3F99B43F2EB2', N'0', N'0', N'1', N'89', N'CreationTime', N'', N'datetime', N'DateTime', N'CreationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'6304E602-84A1-4C57-D4EC-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'524E71B4-CBF7-4248-8B29-3F99B43F2EB2', N'0', N'0', N'1', N'88', N'LastModificationTime', N'', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'DE898F57-ABE7-4D2C-D4ED-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'524E71B4-CBF7-4248-8B29-3F99B43F2EB2', N'0', N'0', N'1', N'90', N'SysDataAuthorityId', N'', N'uniqueidentifier', N'Guid', N'SysDataAuthorityId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'325AF03C-CBB7-4DE6-D4EE-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'524E71B4-CBF7-4248-8B29-3F99B43F2EB2', N'0', N'0', N'0', N'91', N'SysOrganizationId', N'', N'int', N'Int32', N'SysOrganizationId', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'BBAC9A7C-6E62-4FE6-D4EF-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'AF37F705-7BA0-4883-B1BE-8A274EA4C026', N'0', N'0', N'1', N'96', N'Code', N'编码', N'varchar(255)', N'String', N'Code', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'2CA9AA7E-321E-47F0-D4F0-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'AF37F705-7BA0-4883-B1BE-8A274EA4C026', N'0', N'0', N'1', N'94', N'CreationTime', N'创建时间', N'datetime', N'DateTime', N'CreationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'AB5C0B3D-8871-42FD-D4F1-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'AF37F705-7BA0-4883-B1BE-8A274EA4C026', N'0', N'1', N'0', N'92', N'Id', N'id', N'int', N'Int32', N'Id', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'ABA55AD7-7153-4658-D4F2-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'AF37F705-7BA0-4883-B1BE-8A274EA4C026', N'0', N'0', N'1', N'93', N'LastModificationTime', N'更新时间', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'29B765BD-36F4-462F-D4F3-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'AF37F705-7BA0-4883-B1BE-8A274EA4C026', N'0', N'0', N'1', N'98', N'Name', N'分组名/键', N'varchar(255)', N'String', N'Name', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'6E69CF9B-D9CD-4C31-D4F4-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'AF37F705-7BA0-4883-B1BE-8A274EA4C026', N'0', N'0', N'1', N'99', N'ParentId', N'父级分组id', N'int', N'Int32', N'ParentId', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'84A87E33-8B66-4B9A-D4F5-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'AF37F705-7BA0-4883-B1BE-8A274EA4C026', N'0', N'0', N'1', N'95', N'Sort', N'排序号', N'int', N'Int32', N'Sort', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'9A850F29-2DD2-4779-D4F6-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'AF37F705-7BA0-4883-B1BE-8A274EA4C026', N'0', N'0', N'1', N'97', N'Value', N'值', N'varchar(255)', N'String', N'Value', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'E1316750-62A4-46AA-D4F7-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'6FABC67A-8B48-49A6-8BA1-C8A32C499D36', N'1', N'0', N'0', N'100', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'743D6EAB-B4C8-4A15-D4F8-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'6FABC67A-8B48-49A6-8BA1-C8A32C499D36', N'0', N'0', N'1', N'103', N'ByName', N'', N'nvarchar(255)', N'String', N'ByName', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'82EE25D2-4E01-4100-D4F9-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'6FABC67A-8B48-49A6-8BA1-C8A32C499D36', N'0', N'0', N'1', N'106', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'A61101B5-8E66-4456-D4FA-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'6FABC67A-8B48-49A6-8BA1-C8A32C499D36', N'0', N'0', N'1', N'105', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'AAA5FAE3-8C5B-4427-D4FB-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'6FABC67A-8B48-49A6-8BA1-C8A32C499D36', N'0', N'0', N'1', N'102', N'Name', N'', N'nvarchar(255)', N'String', N'Name', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'F9FD0E13-4E5D-42B4-D4FC-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'6FABC67A-8B48-49A6-8BA1-C8A32C499D36', N'0', N'0', N'1', N'101', N'Number', N'', N'int', N'Int32', N'Number', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'646614D9-D7F3-42C5-D4FD-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'6FABC67A-8B48-49A6-8BA1-C8A32C499D36', N'0', N'0', N'1', N'104', N'Remark', N'', N'nvarchar(255)', N'String', N'Remark', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'498327EB-5676-4091-D4FE-08DA3D8D5A26', NULL, N'2022-05-24 00:00:00.0000000', NULL, N'2022-05-24 21:58:07.0000000', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'1', N'1', N'0', N'107', N'Id', N'', N'int', N'Int32', N'Id', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'3133985D-586C-4C4E-D4FF-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'119', N'Close', N'', N'bit', N'Boolean', N'Close', N'1', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'78757B0D-D9EE-45EA-D500-08DA3D8D5A26', NULL, N'2022-05-24 00:00:00.0000000', NULL, N'2022-05-24 21:58:07.0000000', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'115', N'ComponentName', N'', N'nvarchar(255)', N'String', N'ComponentName', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'2006AC52-BB49-4E41-D501-08DA3D8D5A26', NULL, N'2022-05-24 00:00:00.0000000', NULL, N'2022-05-24 21:58:07.0000000', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'109', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'F5193134-B39D-4CA0-D502-08DA3D8D5A26', NULL, N'2022-05-24 00:00:00.0000000', NULL, N'2022-05-24 21:58:07.0000000', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'116', N'Icon', N'', N'nvarchar(255)', N'String', N'Icon', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'12E9E9AD-5631-4DC8-D503-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'122', N'JumpUrl', N'', N'varchar(255)', N'String', N'JumpUrl', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'B1F89F8D-8E22-4C4A-D504-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'120', N'KeepAlive', N'', N'bit', N'Boolean', N'KeepAlive', N'1', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'7211AEA6-EB91-41E5-D505-08DA3D8D5A26', NULL, N'2022-05-24 00:00:00.0000000', NULL, N'2022-05-24 21:58:07.0000000', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'108', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'B52A9E8C-DFFB-40B7-D506-08DA3D8D5A26', NULL, N'2022-05-24 00:00:00.0000000', NULL, N'2022-05-24 21:58:07.0000000', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'110', N'LevelCode', N'', N'varchar(50)', N'String', N'LevelCode', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'E74C1F4B-AF12-4EAA-D507-08DA3D8D5A26', NULL, N'2022-05-24 00:00:00.0000000', NULL, N'2022-05-24 21:58:07.0000000', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'112', N'Name', N'', N'nvarchar(255)', N'String', N'Name', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'235B67F8-62D2-480E-D508-08DA3D8D5A26', NULL, N'2022-05-24 00:00:00.0000000', NULL, N'2022-05-24 21:58:07.0000000', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'111', N'Number', N'编号', N'int', N'Int32', N'Number', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'F029B676-48AC-4BA3-D509-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'117', N'ParentId', N'', N'int', N'Int32', N'ParentId', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'5AA598A9-6E52-4AE4-D50A-08DA3D8D5A26', NULL, N'2022-05-24 00:00:00.0000000', NULL, N'2022-05-24 21:58:07.0000000', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'114', N'Router', N'', N'nvarchar(255)', N'String', N'Router', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'1916E619-4818-4C63-D50B-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'118', N'Show', N'', N'bit', N'Boolean', N'Show', N'1', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'D0FBF229-7204-4494-D50C-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'121', N'State', N'', N'bit', N'Boolean', N'State', N'1', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'6C3BB548-AAFC-4F16-D50D-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'123', N'Type', N'', N'int', N'Int32', N'Type', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'19FA02FE-FB8F-4631-D50E-08DA3D8D5A26', NULL, N'2022-05-24 00:00:00.0000000', NULL, N'2022-05-24 21:58:07.0000000', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'113', N'Url', N'', N'nvarchar(255)', N'String', N'Url', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'9C4158F4-B5B5-4928-D50F-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'2AE9E532-7D9A-474B-B629-50A39945C44D', N'1', N'0', N'0', N'124', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'FBF2D2C1-454B-4898-D510-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'2AE9E532-7D9A-474B-B629-50A39945C44D', N'0', N'0', N'1', N'126', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'6CFE3B57-006F-436B-D511-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'2AE9E532-7D9A-474B-B629-50A39945C44D', N'0', N'0', N'1', N'129', N'FunctionCode', N'', N'varchar(100)', N'String', N'FunctionCode', N'100', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'A908815C-C0E6-4565-D512-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'2AE9E532-7D9A-474B-B629-50A39945C44D', N'0', N'0', N'1', N'130', N'FunctionName', N'', N'varchar(100)', N'String', N'FunctionName', N'100', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'E4DD55F0-9697-43AE-D513-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'2AE9E532-7D9A-474B-B629-50A39945C44D', N'0', N'0', N'1', N'125', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'29D08351-9091-4C91-D514-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'2AE9E532-7D9A-474B-B629-50A39945C44D', N'0', N'0', N'1', N'128', N'MenuId', N'', N'int', N'Int32', N'MenuId', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'C7B2AD1D-ECB0-4497-D515-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'2AE9E532-7D9A-474B-B629-50A39945C44D', N'0', N'0', N'1', N'127', N'Number', N'', N'int', N'Int32', N'Number', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'9A050102-6300-46EF-D516-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'2AE9E532-7D9A-474B-B629-50A39945C44D', N'0', N'0', N'1', N'131', N'Remark', N'', N'varchar(100)', N'String', N'Remark', N'100', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'BA392537-C1C5-4ECC-D517-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'1', N'0', N'0', N'1', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'EE8CA902-4E27-40C5-D518-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'14', N'ActionDisplayName', N'', N'varchar(255)', N'String', N'ActionDisplayName', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'200FF922-513C-4B19-D519-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'4', N'Api', N'接口地址', N'varchar(500)', N'String', N'Api', N'500', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'063D44B8-6CE2-47A6-D51A-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'9', N'Browser', N'', N'varchar(255)', N'String', N'Browser', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'A62BB184-93B0-40E3-D51B-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'13', N'ControllerDisplayName', N'', N'varchar(255)', N'String', N'ControllerDisplayName', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'0AA2DAAB-50DF-4397-D51C-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'3', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'5F5C2997-DAA8-491C-D51D-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'6', N'Form', N'表单信息', N'varchar(MAX)', N'String', N'Form', N'-1', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'1D881E59-D88E-497F-D51E-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'7', N'FormBody', N'json表单信息', N'varchar(MAX)', N'String', N'FormBody', N'-1', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'CA605278-6972-48B4-D51F-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'5', N'Ip', N'ip地址', N'varchar(255)', N'String', N'Ip', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'A932F1CE-A55A-480B-D520-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'2', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'4736479F-6089-4141-D521-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'10', N'OS', N'', N'varchar(255)', N'String', N'OS', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'4467BF43-6E95-4798-D522-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'8', N'QueryString', N'地址栏信息', N'varchar(MAX)', N'String', N'QueryString', N'-1', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'0888B15F-3BD2-4881-D523-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'0', N'12', N'TakeUpTime', N'接口耗时（毫秒）', N'bigint', N'Int64', N'TakeUpTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'66718DE6-5C1A-4229-D524-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'11', N'UserId', N'当前操作人id', N'uniqueidentifier', N'Guid', N'UserId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'D6008705-0D21-42AC-D525-08DA3D8D5A26', NULL, N'2022-05-24 00:00:00.0000000', NULL, N'2022-06-09 21:20:26.0000000', N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'1', N'1', N'0', N'132', N'Id', N'', N'int', N'Int32', N'Id', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'0B45E9BB-B9F1-4A2F-D526-08DA3D8D5A26', NULL, N'2022-05-24 00:00:00.0000000', NULL, N'2022-06-09 21:20:26.0000000', N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'0', N'0', N'1', N'142', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'CE802713-74F5-4F30-D527-08DA3D8D5A26', NULL, N'2022-05-24 00:00:00.0000000', NULL, N'2022-06-09 21:20:26.0000000', N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'0', N'0', N'1', N'138', N'Email', N'', N'nvarchar(255)', N'String', N'Email', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'19A7504C-F740-4B49-D528-08DA3D8D5A26', NULL, N'2022-05-24 00:00:00.0000000', NULL, N'2022-06-09 21:20:26.0000000', N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'0', N'0', N'1', N'141', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'CF2E3691-AB88-4420-D529-08DA3D8D5A26', NULL, N'2022-05-24 00:00:00.0000000', NULL, N'2022-06-09 21:20:26.0000000', N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'0', N'0', N'1', N'136', N'Leader', N'', N'nvarchar(255)', N'String', N'Leader', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'11F3D291-CF7A-4143-D52A-08DA3D8D5A26', NULL, N'2022-05-24 00:00:00.0000000', NULL, N'2022-06-09 21:20:26.0000000', N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'0', N'0', N'1', N'135', N'LevelCode', N'', N'varchar(50)', N'String', N'LevelCode', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'1121D642-49E8-4B25-D52B-08DA3D8D5A26', NULL, N'2022-05-24 00:00:00.0000000', NULL, N'2022-06-09 21:20:26.0000000', N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'0', N'0', N'1', N'133', N'Name', N'', N'nvarchar(255)', N'String', N'Name', NULL, N'组织名称')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'5AED3FEB-3D77-4E1E-D52C-08DA3D8D5A26', NULL, N'2022-05-24 00:00:00.0000000', NULL, N'2022-06-09 21:20:26.0000000', N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'0', N'0', N'1', N'134', N'OrderNumber', N'', N'int', N'Int32', N'OrderNumber', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'042A59E2-72C1-4C38-D52D-08DA3D8D5A26', NULL, N'2022-05-24 00:00:00.0000000', NULL, N'2022-06-09 21:20:26.0000000', N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'0', N'0', N'1', N'140', N'ParentId', N'', N'int', N'Int32', N'ParentId', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'EA63351C-C203-4D40-D52E-08DA3D8D5A26', NULL, N'2022-05-24 00:00:00.0000000', NULL, N'2022-06-09 21:20:26.0000000', N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'0', N'0', N'1', N'137', N'Phone', N'', N'nvarchar(255)', N'String', N'Phone', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'B9BFCA2E-F72B-4A3F-D52F-08DA3D8D5A26', NULL, N'2022-05-24 00:00:00.0000000', NULL, N'2022-06-09 21:20:26.0000000', N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'0', N'0', N'1', N'139', N'State', N'', N'int', N'Int32', N'State', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'6AA13B8F-1E3C-4750-D530-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'0A8BDB18-758A-4798-9FFC-E7031DCBF262', N'1', N'0', N'0', N'143', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'B76500C1-91F8-4E44-D531-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'0A8BDB18-758A-4798-9FFC-E7031DCBF262', N'0', N'0', N'1', N'145', N'Code', N'', N'nvarchar(255)', N'String', N'Code', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'134C9F62-ABD2-476E-D532-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'0A8BDB18-758A-4798-9FFC-E7031DCBF262', N'0', N'0', N'1', N'150', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'5257AD4F-589D-40D0-D533-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'0A8BDB18-758A-4798-9FFC-E7031DCBF262', N'0', N'0', N'1', N'149', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'1790B4D5-51B2-4DC0-D534-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'0A8BDB18-758A-4798-9FFC-E7031DCBF262', N'0', N'0', N'1', N'146', N'Name', N'', N'nvarchar(255)', N'String', N'Name', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'2286C948-4F0D-4B66-D535-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'0A8BDB18-758A-4798-9FFC-E7031DCBF262', N'0', N'0', N'1', N'144', N'Number', N'', N'int', N'Int32', N'Number', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'5F9A4A78-1BB9-4592-D536-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'0A8BDB18-758A-4798-9FFC-E7031DCBF262', N'0', N'0', N'1', N'148', N'Remarks', N'', N'nvarchar(255)', N'String', N'Remarks', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'564A907B-1F47-4849-D537-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'0A8BDB18-758A-4798-9FFC-E7031DCBF262', N'0', N'0', N'1', N'147', N'State', N'', N'int', N'Int32', N'State', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'69875823-326C-4E13-D538-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'F3D7BBB3-C1FB-4D61-92A4-9BC101811335', N'1', N'0', N'0', N'151', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'42430604-7090-442D-D539-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'F3D7BBB3-C1FB-4D61-92A4-9BC101811335', N'0', N'0', N'1', N'153', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'3F7E43C9-762F-48EA-D53A-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'F3D7BBB3-C1FB-4D61-92A4-9BC101811335', N'0', N'0', N'1', N'157', N'DeleteLock', N'', N'bit', N'Boolean', N'DeleteLock', N'1', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'517CBFE0-275D-4F36-D53B-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'F3D7BBB3-C1FB-4D61-92A4-9BC101811335', N'0', N'0', N'1', N'152', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'BE481209-565B-4099-D53C-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'F3D7BBB3-C1FB-4D61-92A4-9BC101811335', N'0', N'0', N'1', N'155', N'Name', N'', N'nvarchar(255)', N'String', N'Name', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'DD367FD5-2030-43B2-D53D-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'F3D7BBB3-C1FB-4D61-92A4-9BC101811335', N'0', N'0', N'1', N'154', N'Number', N'', N'int', N'Int32', N'Number', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'DBE000FC-4895-42F2-D53E-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'F3D7BBB3-C1FB-4D61-92A4-9BC101811335', N'0', N'0', N'1', N'156', N'Remark', N'', N'nvarchar(255)', N'String', N'Remark', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'7B6DF0CD-C31B-4508-D53F-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'8DA38D20-8A09-4E81-8DD8-ED6702AEE380', N'1', N'0', N'0', N'158', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'1213C179-E366-4E3C-D540-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'8DA38D20-8A09-4E81-8DD8-ED6702AEE380', N'0', N'0', N'1', N'163', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'B24AC0E3-71AB-4D48-D541-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'8DA38D20-8A09-4E81-8DD8-ED6702AEE380', N'0', N'0', N'1', N'162', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'6C934348-BE20-4C9E-D542-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'8DA38D20-8A09-4E81-8DD8-ED6702AEE380', N'0', N'0', N'1', N'161', N'MenuFunctionId', N'', N'uniqueidentifier', N'Guid', N'MenuFunctionId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'D41BD8DB-1B3F-48FA-D543-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'8DA38D20-8A09-4E81-8DD8-ED6702AEE380', N'0', N'0', N'1', N'160', N'MenuId', N'', N'int', N'Int32', N'MenuId', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'F24F0E45-209E-46B7-D544-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'8DA38D20-8A09-4E81-8DD8-ED6702AEE380', N'0', N'0', N'1', N'159', N'RoleId', N'', N'uniqueidentifier', N'Guid', N'RoleId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'5BCF7406-75CC-4171-D545-08DA3D8D5A26', NULL, N'2022-05-24 00:00:00.0000000', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-07 11:06:31.0000000', N'6323638B-A45F-4A76-886E-69A9E9BE0901', N'1', N'0', N'0', N'164', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'46BAC66F-3CF0-46B3-D546-08DA3D8D5A26', NULL, N'2022-05-24 00:00:00.0000000', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-07 11:06:31.0000000', N'6323638B-A45F-4A76-886E-69A9E9BE0901', N'0', N'0', N'1', N'166', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', NULL, N'创建时间')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'A6752BD9-F3D6-451F-D547-08DA3D8D5A26', NULL, N'2022-05-24 00:00:00.0000000', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-07 11:06:31.0000000', N'6323638B-A45F-4A76-886E-69A9E9BE0901', N'0', N'0', N'1', N'172', N'DeleteLock', N'', N'bit', N'Boolean', N'DeleteLock', NULL, N'删除锁')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'287314B2-3141-4957-D548-08DA3D8D5A26', NULL, N'2022-05-24 00:00:00.0000000', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-07 11:06:31.0000000', N'6323638B-A45F-4A76-886E-69A9E9BE0901', N'0', N'0', N'0', N'171', N'Email', N'', N'nvarchar(255)', N'String', N'Email', NULL, N'电子邮箱')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'E5418D61-916F-45FD-D549-08DA3D8D5A26', NULL, N'2022-05-24 00:00:00.0000000', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-07 11:06:31.0000000', N'6323638B-A45F-4A76-886E-69A9E9BE0901', N'0', N'0', N'1', N'165', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', NULL, N'更新时间')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'7CBE8988-CBAC-4EA2-D54A-08DA3D8D5A26', NULL, N'2022-05-24 00:00:00.0000000', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-07 11:06:31.0000000', N'6323638B-A45F-4A76-886E-69A9E9BE0901', N'0', N'0', N'1', N'168', N'LoginName', N'', N'nvarchar(255)', N'String', N'LoginName', NULL, N'登录名称')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'4B5BC027-5663-463A-D54B-08DA3D8D5A26', NULL, N'2022-05-24 00:00:00.0000000', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-07 11:06:31.0000000', N'6323638B-A45F-4A76-886E-69A9E9BE0901', N'0', N'0', N'1', N'167', N'Name', N'', N'nvarchar(255)', N'String', N'Name', NULL, N'用户名称')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'5A9FA990-B6D6-445F-D54C-08DA3D8D5A26', NULL, N'2022-05-24 00:00:00.0000000', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-07 11:06:31.0000000', N'6323638B-A45F-4A76-886E-69A9E9BE0901', N'0', N'0', N'1', N'173', N'OrganizationId', N'', N'int', N'Int32', N'OrganizationId', NULL, N'组织id')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'E36410B5-CB7C-4FC3-D54D-08DA3D8D5A26', NULL, N'2022-05-24 00:00:00.0000000', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-07 11:06:31.0000000', N'6323638B-A45F-4A76-886E-69A9E9BE0901', N'0', N'0', N'1', N'169', N'Password', N'', N'nvarchar(255)', N'String', N'Password', NULL, N'密码')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'C82D5132-6CDA-463E-D54E-08DA3D8D5A26', NULL, N'2022-05-24 00:00:00.0000000', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-07 11:06:31.0000000', N'6323638B-A45F-4A76-886E-69A9E9BE0901', N'0', N'0', N'1', N'170', N'Phone', N'', N'nvarchar(255)', N'String', N'Phone', NULL, N'联系电话')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'A9766BBB-21BF-46DA-D54F-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'69B24F04-0ED3-45FC-91D9-0DC929175A57', N'1', N'0', N'0', N'174', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'F731CCD3-9A9C-4DDA-D550-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'69B24F04-0ED3-45FC-91D9-0DC929175A57', N'0', N'0', N'1', N'178', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'135E23DB-540B-4096-D551-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'69B24F04-0ED3-45FC-91D9-0DC929175A57', N'0', N'0', N'1', N'177', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'4C479D54-530F-4652-D552-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'69B24F04-0ED3-45FC-91D9-0DC929175A57', N'0', N'0', N'1', N'176', N'PostId', N'', N'uniqueidentifier', N'Guid', N'PostId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'CB5F9ECF-9317-4B11-D553-08DA3D8D5A26', NULL, N'2022-05-24 21:57:34.0000000', NULL, N'2022-05-24 21:57:34.0000000', N'69B24F04-0ED3-45FC-91D9-0DC929175A57', N'0', N'0', N'1', N'175', N'UserId', N'', N'uniqueidentifier', N'Guid', N'UserId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'51D2EB90-7AB9-4763-3387-08DA716A5C08', NULL, N'2022-07-29 21:58:05.0000000', NULL, N'2022-07-29 21:58:05.0000000', N'18FBB18E-CB29-45D8-A5F3-C0121C57680A', N'1', N'0', N'0', N'20', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'C1AE4945-25FC-45E9-3388-08DA716A5C08', NULL, N'2022-07-29 21:58:05.0000000', NULL, N'2022-07-29 21:58:05.0000000', N'18FBB18E-CB29-45D8-A5F3-C0121C57680A', N'0', N'0', N'0', N'29', N'ApprovalDate', N'', N'datetime2', N'DateTime', N'ApprovalDate', N'8', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'22527FE7-BD5C-4E6C-3389-08DA716A5C08', NULL, N'2022-07-29 21:58:05.0000000', NULL, N'2022-07-29 21:58:05.0000000', N'18FBB18E-CB29-45D8-A5F3-C0121C57680A', N'0', N'0', N'0', N'31', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', N'8', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'7485DEED-E9E8-4AA6-338A-08DA716A5C08', NULL, N'2022-07-29 21:58:05.0000000', NULL, N'2022-07-29 21:58:05.0000000', N'18FBB18E-CB29-45D8-A5F3-C0121C57680A', N'0', N'0', N'0', N'22', N'FlowNodeId', N'', N'uniqueidentifier', N'Guid', N'FlowNodeId', N'16', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'50B6B2FC-3E73-457C-338B-08DA716A5C08', NULL, N'2022-07-29 21:58:05.0000000', NULL, N'2022-07-29 21:58:05.0000000', N'18FBB18E-CB29-45D8-A5F3-C0121C57680A', N'0', N'0', N'1', N'23', N'FlowNodeName', N'', N'nvarchar(MAX)', N'String', N'FlowNodeName', N'-1', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'DB4510E1-40D2-4DB4-338C-08DA716A5C08', NULL, N'2022-07-29 21:58:05.0000000', NULL, N'2022-07-29 21:58:05.0000000', N'18FBB18E-CB29-45D8-A5F3-C0121C57680A', N'0', N'0', N'0', N'30', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', N'8', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'BF3DBEDF-ADE0-4E20-338D-08DA716A5C08', NULL, N'2022-07-29 21:58:05.0000000', NULL, N'2022-07-29 21:58:05.0000000', N'18FBB18E-CB29-45D8-A5F3-C0121C57680A', N'0', N'0', N'1', N'26', N'Opinions', N'', N'nvarchar(MAX)', N'String', N'Opinions', N'-1', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'95414873-486D-4609-338E-08DA716A5C08', NULL, N'2022-07-29 21:58:05.0000000', NULL, N'2022-07-29 21:58:05.0000000', N'18FBB18E-CB29-45D8-A5F3-C0121C57680A', N'0', N'0', N'0', N'21', N'Sort', N'', N'int', N'Int32', N'Sort', N'4', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'8F107C7C-E4F5-4647-338F-08DA716A5C08', NULL, N'2022-07-29 21:58:05.0000000', NULL, N'2022-07-29 21:58:05.0000000', N'18FBB18E-CB29-45D8-A5F3-C0121C57680A', N'0', N'0', N'0', N'24', N'SortMore', N'', N'int', N'Int32', N'SortMore', N'4', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'79D371FB-B37A-4D32-3390-08DA716A5C08', NULL, N'2022-07-29 21:58:05.0000000', NULL, N'2022-07-29 21:58:05.0000000', N'18FBB18E-CB29-45D8-A5F3-C0121C57680A', N'0', N'0', N'0', N'25', N'State', N'', N'int', N'Int32', N'State', N'4', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'3D9C98E4-2AC7-40FD-3391-08DA716A5C08', NULL, N'2022-07-29 21:58:05.0000000', NULL, N'2022-07-29 21:58:05.0000000', N'18FBB18E-CB29-45D8-A5F3-C0121C57680A', N'0', N'0', N'0', N'27', N'UserId', N'', N'uniqueidentifier', N'Guid', N'UserId', N'16', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'022C287A-11E3-4234-3392-08DA716A5C08', NULL, N'2022-07-29 21:58:05.0000000', NULL, N'2022-07-29 21:58:05.0000000', N'18FBB18E-CB29-45D8-A5F3-C0121C57680A', N'0', N'0', N'1', N'28', N'UserName', N'', N'nvarchar(MAX)', N'String', N'UserName', N'-1', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'59F5D993-E502-4FEE-3393-08DA716A5C08', NULL, N'2022-07-29 21:58:05.0000000', NULL, N'2022-07-29 21:58:05.0000000', N'7F94E0DB-FC63-40DC-BFE3-18C5AAD75975', N'1', N'0', N'0', N'32', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'CB4A19D3-35DD-416D-3394-08DA716A5C08', NULL, N'2022-07-29 21:58:05.0000000', NULL, N'2022-07-29 21:58:05.0000000', N'7F94E0DB-FC63-40DC-BFE3-18C5AAD75975', N'0', N'0', N'0', N'39', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', N'8', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'D550FB44-F912-434E-3395-08DA716A5C08', NULL, N'2022-07-29 21:58:05.0000000', NULL, N'2022-07-29 21:58:05.0000000', N'7F94E0DB-FC63-40DC-BFE3-18C5AAD75975', N'0', N'0', N'0', N'33', N'FlowApprovalStepHistoryId', N'', N'uniqueidentifier', N'Guid', N'FlowApprovalStepHistoryId', N'16', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'A7263191-1E30-42C5-3396-08DA716A5C08', NULL, N'2022-07-29 21:58:05.0000000', NULL, N'2022-07-29 21:58:05.0000000', N'7F94E0DB-FC63-40DC-BFE3-18C5AAD75975', N'0', N'0', N'0', N'34', N'FlowNodeId', N'', N'uniqueidentifier', N'Guid', N'FlowNodeId', N'16', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'CCC3F055-79C4-4E63-3397-08DA716A5C08', NULL, N'2022-07-29 21:58:05.0000000', NULL, N'2022-07-29 21:58:05.0000000', N'7F94E0DB-FC63-40DC-BFE3-18C5AAD75975', N'0', N'0', N'1', N'35', N'FlowNodeName', N'', N'nvarchar(MAX)', N'String', N'FlowNodeName', N'-1', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'D5E76D95-BEED-43C9-3398-08DA716A5C08', NULL, N'2022-07-29 21:58:05.0000000', NULL, N'2022-07-29 21:58:05.0000000', N'7F94E0DB-FC63-40DC-BFE3-18C5AAD75975', N'0', N'0', N'0', N'38', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', N'8', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'9059BF44-23A0-4E12-3399-08DA716A5C08', NULL, N'2022-07-29 21:58:05.0000000', NULL, N'2022-07-29 21:58:05.0000000', N'7F94E0DB-FC63-40DC-BFE3-18C5AAD75975', N'0', N'0', N'0', N'36', N'UserId', N'', N'uniqueidentifier', N'Guid', N'UserId', N'16', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'643C3AA6-D639-46BD-339A-08DA716A5C08', NULL, N'2022-07-29 21:58:05.0000000', NULL, N'2022-07-29 21:58:05.0000000', N'7F94E0DB-FC63-40DC-BFE3-18C5AAD75975', N'0', N'0', N'1', N'37', N'UserName', N'', N'nvarchar(MAX)', N'String', N'UserName', N'-1', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'1FBF9CEA-3E4C-401B-243F-08DA717DBCAA', NULL, N'2022-07-30 00:16:47.0000000', NULL, N'2022-07-30 00:16:47.0000000', N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'1', N'0', N'0', N'203', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'7EC46123-3852-4B62-2440-08DA717DBCAA', NULL, N'2022-07-30 00:16:47.0000000', NULL, N'2022-07-30 00:16:47.0000000', N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'215', N'ControllerPath', N'', N'varchar(50)', N'String', N'ControllerPath', N'50', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'BE6F08B8-B14B-4253-2441-08DA717DBCAA', NULL, N'2022-07-30 00:16:47.0000000', NULL, N'2022-07-30 00:16:47.0000000', N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'0', N'205', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', N'8', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'A06381EF-E532-4B7A-2442-08DA717DBCAA', NULL, N'2022-07-30 00:16:47.0000000', NULL, N'2022-07-30 00:16:47.0000000', N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'209', N'DisplayName', N'', N'nvarchar(MAX)', N'String', N'DisplayName', N'-1', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'3051FB7C-F075-4D91-2443-08DA717DBCAA', NULL, N'2022-07-30 00:16:47.0000000', NULL, N'2022-07-30 00:16:47.0000000', N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'210', N'EntityName', N'', N'nvarchar(MAX)', N'String', N'EntityName', N'-1', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'B755E2AF-1164-47DE-2444-08DA717DBCAA', NULL, N'2022-07-30 00:16:47.0000000', NULL, N'2022-07-30 00:16:47.0000000', N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'216', N'IndexVuePath', N'', N'varchar(50)', N'String', N'IndexVuePath', N'50', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'54A0ED42-104E-4E2A-2445-08DA717DBCAA', NULL, N'2022-07-30 00:16:47.0000000', NULL, N'2022-07-30 00:16:47.0000000', N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'217', N'InfoVuePath', N'', N'varchar(50)', N'String', N'InfoVuePath', N'50', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'1BD2134C-3A2A-4E1B-2446-08DA717DBCAA', NULL, N'2022-07-30 00:16:47.0000000', NULL, N'2022-07-30 00:16:47.0000000', N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'219', N'IsCover', N'', N'bit', N'Boolean', N'IsCover', N'1', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'8E5F9439-6B90-423A-2447-08DA717DBCAA', NULL, N'2022-07-30 00:16:47.0000000', NULL, N'2022-07-30 00:16:47.0000000', N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'0', N'204', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', N'8', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'C6042620-D052-4A60-2448-08DA717DBCAA', NULL, N'2022-07-30 00:16:47.0000000', NULL, N'2022-07-30 00:16:47.0000000', N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'213', N'ModelPath', N'', N'varchar(50)', N'String', N'ModelPath', N'50', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'CAFF37BF-4E91-4934-2449-08DA717DBCAA', NULL, N'2022-07-30 00:16:47.0000000', NULL, N'2022-07-30 00:16:47.0000000', N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'212', N'ProjectRootPath', N'', N'varchar(50)', N'String', N'ProjectRootPath', N'50', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'803C2D4B-4A80-43B0-244A-08DA717DBCAA', NULL, N'2022-07-30 00:16:47.0000000', NULL, N'2022-07-30 00:16:47.0000000', N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'211', N'Remark', N'', N'nvarchar(MAX)', N'String', N'Remark', N'-1', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'158B1C2D-FA67-4696-244B-08DA717DBCAA', NULL, N'2022-07-30 00:16:47.0000000', NULL, N'2022-07-30 00:16:47.0000000', N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'207', N'Schema', N'', N'nvarchar(MAX)', N'String', N'Schema', N'-1', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'13775DE6-200D-43E0-244C-08DA717DBCAA', NULL, N'2022-07-30 00:16:47.0000000', NULL, N'2022-07-30 00:16:47.0000000', N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'218', N'ServiceJsPath', N'', N'varchar(50)', N'String', N'ServiceJsPath', N'50', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'AAECFDA3-F48D-4CD5-244D-08DA717DBCAA', NULL, N'2022-07-30 00:16:47.0000000', NULL, N'2022-07-30 00:16:47.0000000', N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'214', N'ServicePath', N'', N'varchar(50)', N'String', N'ServicePath', N'50', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'26F16D3D-9C42-4F86-244E-08DA717DBCAA', NULL, N'2022-07-30 00:16:47.0000000', NULL, N'2022-07-30 00:16:47.0000000', N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'206', N'TableName', N'', N'nvarchar(MAX)', N'String', N'TableName', N'-1', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'59CFB48C-8D3F-43D7-244F-08DA717DBCAA', NULL, N'2022-07-30 00:16:47.0000000', NULL, N'2022-07-30 00:16:47.0000000', N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'208', N'Type', N'', N'nvarchar(MAX)', N'String', N'Type', N'-1', N'')
GO


-- ----------------------------
-- Table structure for member
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[member]') AND type IN ('U'))
	DROP TABLE [dbo].[member]
GO

CREATE TABLE [dbo].[member] (
  [Id] uniqueidentifier  NOT NULL,
  [CreatorUserId] uniqueidentifier  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [LastModificationTime] datetime2(7)  NULL,
  [Number] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Name] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Phone] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Sex] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Birthday] datetime2(7)  NOT NULL,
  [Photo] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Introduce] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [FilePath] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [UserId] uniqueidentifier  NOT NULL
)
GO

ALTER TABLE [dbo].[member] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO [dbo].[member] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [Name], [Phone], [Sex], [Birthday], [Photo], [Introduce], [FilePath], [UserId]) VALUES (N'96A1AA3D-A61A-42D0-954A-C71753FB2065', NULL, N'2020-10-24 00:07:42.0000000', NULL, N'2022-07-31 00:03:48.0000000', N'123', N'123', N'123', N'女', N'2018-04-25 23:00:00.0000000', N'[{"uid":"d80bbe3d-7296-4eb9-965a-cb3f03d3def7","name":"time_000335_old_name_微信图片_20200413162625.jpg","percent":100,"status":"done","thumbUrl":"/upload/files/20220731/time_000335_old_name_微信图片_20200413162625.jpg","url":"/upload/files/20220731/time_000335_old_name_微信图片_20200413162625.jpg"}]', N'<p>123</p>', N'[{"uid":"a6778e9d-6c2e-4d23-91c9-d0d10756d177","name":"time_000345_old_name_hzy.png","percent":100,"status":"done","thumbUrl":"/upload/files/20220731/time_000345_old_name_hzy.png","url":"/upload/files/20220731/time_000345_old_name_hzy.png"}]', N'AC18F496-E93D-42F0-B59E-E321ACC85335')
GO

INSERT INTO [dbo].[member] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [Name], [Phone], [Sex], [Birthday], [Photo], [Introduce], [FilePath], [UserId]) VALUES (N'9A604AA2-9AE6-4A2F-8DDB-D9E0289EAD9E', NULL, N'2018-04-25 23:00:00.0000000', NULL, N'2022-07-31 00:03:23.0000000', N'1', N'测试会员', N'18510912123', N'男', N'2019-07-08 11:47:24.0000000', N'[{"uid":"6f5aed63-0fdc-4752-9c2b-3f66cbfa77bf","name":"time_000222_old_name_微信图片_20200521081252.jpg","percent":100,"status":"done","thumbUrl":"/upload/files/20220731/time_000222_old_name_微信图片_20200521081252.jpg","url":"/upload/files/20220731/time_000222_old_name_微信图片_20200521081252.jpg"}]', N'<p>999888</p>', N'[{"uid":"35828ad6-cbba-4bcb-9c97-141d5b31acc7","name":"time_000320_old_name_Ko.js增删改查例子.txt","percent":100,"status":"done","thumbUrl":"/upload/files/20220731/time_000320_old_name_Ko.js增删改查例子.txt","url":"/upload/files/20220731/time_000320_old_name_Ko.js增删改查例子.txt"}]', N'AC18F496-E93D-42F0-B59E-E321ACC85335')
GO


-- ----------------------------
-- Table structure for quartz_job_task
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[quartz_job_task]') AND type IN ('U'))
	DROP TABLE [dbo].[quartz_job_task]
GO

CREATE TABLE [dbo].[quartz_job_task] (
  [Id] uniqueidentifier  NOT NULL,
  [CreatorUserId] uniqueidentifier  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [LastModificationTime] datetime2(7)  NULL,
  [Name] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [GroupName] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Cron] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [ApiUrl] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [HeaderToken] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [RequsetMode] int  NULL,
  [Remark] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [State] int  NULL,
  [ExecuteTime] datetime2(7)  NULL
)
GO

ALTER TABLE [dbo].[quartz_job_task] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建人id',
'SCHEMA', N'dbo',
'TABLE', N'quartz_job_task',
'COLUMN', N'CreatorUserId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'quartz_job_task',
'COLUMN', N'CreationTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新人id',
'SCHEMA', N'dbo',
'TABLE', N'quartz_job_task',
'COLUMN', N'LastModifierUserId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新时间',
'SCHEMA', N'dbo',
'TABLE', N'quartz_job_task',
'COLUMN', N'LastModificationTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'任务名称',
'SCHEMA', N'dbo',
'TABLE', N'quartz_job_task',
'COLUMN', N'Name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'分组名称',
'SCHEMA', N'dbo',
'TABLE', N'quartz_job_task',
'COLUMN', N'GroupName'
GO

EXEC sp_addextendedproperty
'MS_Description', N'间隔表达式',
'SCHEMA', N'dbo',
'TABLE', N'quartz_job_task',
'COLUMN', N'Cron'
GO

EXEC sp_addextendedproperty
'MS_Description', N'请求地址',
'SCHEMA', N'dbo',
'TABLE', N'quartz_job_task',
'COLUMN', N'ApiUrl'
GO

EXEC sp_addextendedproperty
'MS_Description', N'请求 token 密钥',
'SCHEMA', N'dbo',
'TABLE', N'quartz_job_task',
'COLUMN', N'HeaderToken'
GO

EXEC sp_addextendedproperty
'MS_Description', N'请求方式（0=Post，1=Get，2=Delete）',
'SCHEMA', N'dbo',
'TABLE', N'quartz_job_task',
'COLUMN', N'RequsetMode'
GO

EXEC sp_addextendedproperty
'MS_Description', N'备注',
'SCHEMA', N'dbo',
'TABLE', N'quartz_job_task',
'COLUMN', N'Remark'
GO

EXEC sp_addextendedproperty
'MS_Description', N'运行状态（0=未运行，1=运行中）',
'SCHEMA', N'dbo',
'TABLE', N'quartz_job_task',
'COLUMN', N'State'
GO

EXEC sp_addextendedproperty
'MS_Description', N'最后执行时间',
'SCHEMA', N'dbo',
'TABLE', N'quartz_job_task',
'COLUMN', N'ExecuteTime'
GO


-- ----------------------------
-- Records of quartz_job_task
-- ----------------------------
INSERT INTO [dbo].[quartz_job_task] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Name], [GroupName], [Cron], [ApiUrl], [HeaderToken], [RequsetMode], [Remark], [State], [ExecuteTime]) VALUES (N'0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 11:36:30.8960328', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 17:32:40.0799593', N'默认测试接口', N'TEST', N'0/10 * * * * ?', N'http://localhost:5600/api/job/JobTest/Test', N'', N'1', N'用于测试', N'1', N'2023-01-29 17:32:40.0479575')
GO


-- ----------------------------
-- Table structure for quartz_job_task_log
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[quartz_job_task_log]') AND type IN ('U'))
	DROP TABLE [dbo].[quartz_job_task_log]
GO

CREATE TABLE [dbo].[quartz_job_task_log] (
  [Id] uniqueidentifier  NOT NULL,
  [CreatorUserId] uniqueidentifier  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [LastModificationTime] datetime2(7)  NULL,
  [JobTaskId] uniqueidentifier  NULL,
  [Text] varchar(max) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[quartz_job_task_log] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建人id',
'SCHEMA', N'dbo',
'TABLE', N'quartz_job_task_log',
'COLUMN', N'CreatorUserId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'quartz_job_task_log',
'COLUMN', N'CreationTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新人id',
'SCHEMA', N'dbo',
'TABLE', N'quartz_job_task_log',
'COLUMN', N'LastModifierUserId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新时间',
'SCHEMA', N'dbo',
'TABLE', N'quartz_job_task_log',
'COLUMN', N'LastModificationTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'作业任务id',
'SCHEMA', N'dbo',
'TABLE', N'quartz_job_task_log',
'COLUMN', N'JobTaskId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'日志内容',
'SCHEMA', N'dbo',
'TABLE', N'quartz_job_task_log',
'COLUMN', N'Text'
GO


-- ----------------------------
-- Records of quartz_job_task_log
-- ----------------------------
INSERT INTO [dbo].[quartz_job_task_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [JobTaskId], [Text]) VALUES (N'947B18B8-4ABF-4FDA-A612-0F8CE8EF746A', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 17:12:50.0875068', NULL, NULL, N'0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', N'任务=默认测试接口|组=TEST|2023-01-29|StartTime= 17:12:50:037|EndTime=17:12:50:071|耗时=35 毫秒|结果=调用测试接口成功!')
GO

INSERT INTO [dbo].[quartz_job_task_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [JobTaskId], [Text]) VALUES (N'8F1A6859-B3EA-48AB-894A-158F85369947', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 16:55:05.3355662', NULL, NULL, N'0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', N'任务=默认测试接口|组=TEST|2023-01-29|StartTime= 16:55:00:158|EndTime=16:55:05:239|耗时=5091 毫秒|结果=调用测试接口成功!')
GO

INSERT INTO [dbo].[quartz_job_task_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [JobTaskId], [Text]) VALUES (N'C465AD9C-62BD-406F-92D4-19FAF88F0940', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 12:02:23.2676236', NULL, NULL, N'0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', N'任务=默认测试接口|组=TEST|2023-01-29|StartTime= 12:02:15:195|EndTime=12:02:21:961|耗时=11296 毫秒|结果=调用测试接口成功!')
GO

INSERT INTO [dbo].[quartz_job_task_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [JobTaskId], [Text]) VALUES (N'4EBD9D4D-28AE-4736-BD1A-1BEF6C77A37F', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 17:32:40.1392256', NULL, NULL, N'0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', N'任务=默认测试接口|组=TEST|2023-01-29|StartTime= 17:32:40:047|EndTime=17:32:40:080|耗时=36 毫秒|结果=调用测试接口成功!')
GO

INSERT INTO [dbo].[quartz_job_task_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [JobTaskId], [Text]) VALUES (N'897F4058-C5DF-4814-8C49-2420348415CC', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 17:32:00.0679601', NULL, NULL, N'0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', N'任务=默认测试接口|组=TEST|2023-01-29|StartTime= 17:32:00:011|EndTime=17:32:00:047|耗时=40 毫秒|结果=调用测试接口成功!')
GO

INSERT INTO [dbo].[quartz_job_task_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [JobTaskId], [Text]) VALUES (N'A980D08F-2F2A-4017-8788-2BFB433DF66D', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 17:31:50.2686443', NULL, NULL, N'0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', N'任务=默认测试接口|组=TEST|2023-01-29|StartTime= 17:31:50:079|EndTime=17:31:50:236|耗时=160 毫秒|结果=调用测试接口成功!')
GO

INSERT INTO [dbo].[quartz_job_task_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [JobTaskId], [Text]) VALUES (N'1234C67D-7015-48C4-B21D-364D485F75A3', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 17:32:30.0552264', NULL, NULL, N'0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', N'任务=默认测试接口|组=TEST|2023-01-29|StartTime= 17:32:30:012|EndTime=17:32:30:038|耗时=28 毫秒|结果=调用测试接口成功!')
GO

INSERT INTO [dbo].[quartz_job_task_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [JobTaskId], [Text]) VALUES (N'1C2D3627-2C2C-4D6E-9219-3756E581F7EA', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 12:03:00.1142360', NULL, NULL, N'0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', N'任务=默认测试接口|组=TEST|2023-01-29|StartTime= 12:03:00:036|EndTime=12:03:00:100|耗时=65 毫秒|结果=调用测试接口成功!')
GO

INSERT INTO [dbo].[quartz_job_task_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [JobTaskId], [Text]) VALUES (N'BE1A1FE0-C856-487A-B7FD-37F1D3958115', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 12:02:30.1068233', NULL, NULL, N'0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', N'任务=默认测试接口|组=TEST|2023-01-29|StartTime= 12:02:30:056|EndTime=12:02:30:101|耗时=49 毫秒|结果=调用测试接口成功!')
GO

INSERT INTO [dbo].[quartz_job_task_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [JobTaskId], [Text]) VALUES (N'D5BFA210-65B2-4483-8B9A-3AEB47F98176', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 12:03:40.0564040', NULL, NULL, N'0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', N'任务=默认测试接口|组=TEST|2023-01-29|StartTime= 12:03:40:021|EndTime=12:03:40:053|耗时=33 毫秒|结果=调用测试接口成功!')
GO

INSERT INTO [dbo].[quartz_job_task_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [JobTaskId], [Text]) VALUES (N'72B10C0E-620F-4AC9-BF9A-3FCE7EAE1B88', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 17:12:33.4134916', NULL, NULL, N'0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', N'任务=默认测试接口|组=TEST|2023-01-29|StartTime= 17:12:30:940|EndTime=17:12:33:283|耗时=2372 毫秒|结果=调用测试接口成功!')
GO

INSERT INTO [dbo].[quartz_job_task_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [JobTaskId], [Text]) VALUES (N'BCA6690C-AB03-4677-93A2-471E55CED8EE', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 12:04:20.0879536', NULL, NULL, N'0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', N'任务=默认测试接口|组=TEST|2023-01-29|StartTime= 12:04:20:058|EndTime=12:04:20:084|耗时=28 毫秒|结果=调用测试接口成功!')
GO

INSERT INTO [dbo].[quartz_job_task_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [JobTaskId], [Text]) VALUES (N'95A4AA46-FDB3-4C29-8089-5A413D8BE776', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 17:32:10.0783313', NULL, NULL, N'0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', N'任务=默认测试接口|组=TEST|2023-01-29|StartTime= 17:32:10:040|EndTime=17:32:10:067|耗时=29 毫秒|结果=调用测试接口成功!')
GO

INSERT INTO [dbo].[quartz_job_task_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [JobTaskId], [Text]) VALUES (N'7354BC3B-FA15-4645-8B54-63F1A7265D2F', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 12:03:20.0730241', NULL, NULL, N'0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', N'任务=默认测试接口|组=TEST|2023-01-29|StartTime= 12:03:20:039|EndTime=12:03:20:070|耗时=32 毫秒|结果=调用测试接口成功!')
GO

INSERT INTO [dbo].[quartz_job_task_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [JobTaskId], [Text]) VALUES (N'F8CD7E8E-100B-43FA-BA4B-8A778BBF429C', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 12:03:50.0555428', NULL, NULL, N'0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', N'任务=默认测试接口|组=TEST|2023-01-29|StartTime= 12:03:50:016|EndTime=12:03:50:052|耗时=37 毫秒|结果=调用测试接口成功!')
GO

INSERT INTO [dbo].[quartz_job_task_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [JobTaskId], [Text]) VALUES (N'81E0A17C-5022-4974-B56B-9010102F1B03', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 12:02:40.0516349', NULL, NULL, N'0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', N'任务=默认测试接口|组=TEST|2023-01-29|StartTime= 12:02:40:020|EndTime=12:02:40:048|耗时=29 毫秒|结果=调用测试接口成功!')
GO

INSERT INTO [dbo].[quartz_job_task_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [JobTaskId], [Text]) VALUES (N'658213B8-C975-409A-B490-92995B27795C', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 17:32:20.0754942', NULL, NULL, N'0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', N'任务=默认测试接口|组=TEST|2023-01-29|StartTime= 17:32:20:036|EndTime=17:32:20:066|耗时=31 毫秒|结果=调用测试接口成功!')
GO

INSERT INTO [dbo].[quartz_job_task_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [JobTaskId], [Text]) VALUES (N'2FCFC8D3-F7EE-47D8-87CC-B5EE4DE561AF', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 12:02:29.2383986', NULL, NULL, N'0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', N'任务=默认测试接口|组=TEST|2023-01-29|StartTime= 12:02:29:183|EndTime=12:02:29:234|耗时=54 毫秒|结果=调用测试接口成功!')
GO

INSERT INTO [dbo].[quartz_job_task_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [JobTaskId], [Text]) VALUES (N'D03B92DD-13C5-40FC-9E61-BFAC59BBB31A', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 12:02:50.0725874', NULL, NULL, N'0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', N'任务=默认测试接口|组=TEST|2023-01-29|StartTime= 12:02:50:038|EndTime=12:02:50:069|耗时=33 毫秒|结果=调用测试接口成功!')
GO

INSERT INTO [dbo].[quartz_job_task_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [JobTaskId], [Text]) VALUES (N'86DAA3AC-93CF-4FD2-AA93-C5A04F3AE968', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 16:55:20.2155604', NULL, NULL, N'0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', N'任务=默认测试接口|组=TEST|2023-01-29|StartTime= 16:55:20:039|EndTime=16:55:20:064|耗时=27 毫秒|结果=调用测试接口成功!')
GO

INSERT INTO [dbo].[quartz_job_task_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [JobTaskId], [Text]) VALUES (N'D8004A93-C4F5-498B-B9AA-C7301460F5B9', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 16:54:10.7758372', NULL, NULL, N'0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', N'任务=默认测试接口|组=TEST|2023-01-29|StartTime= 16:54:10:120|EndTime=16:54:10:662|耗时=552 毫秒|结果=调用测试接口成功!')
GO

INSERT INTO [dbo].[quartz_job_task_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [JobTaskId], [Text]) VALUES (N'3ECDC0F9-0937-440D-8E8C-D4EA126EF35C', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 12:04:00.1135006', NULL, NULL, N'0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', N'任务=默认测试接口|组=TEST|2023-01-29|StartTime= 12:04:00:041|EndTime=12:04:00:110|耗时=70 毫秒|结果=调用测试接口成功!')
GO

INSERT INTO [dbo].[quartz_job_task_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [JobTaskId], [Text]) VALUES (N'FFBBF252-55B1-438F-86B8-E2D6F1AB692A', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 17:12:40.0951002', NULL, NULL, N'0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', N'任务=默认测试接口|组=TEST|2023-01-29|StartTime= 17:12:40:056|EndTime=17:12:40:083|耗时=30 毫秒|结果=调用测试接口成功!')
GO

INSERT INTO [dbo].[quartz_job_task_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [JobTaskId], [Text]) VALUES (N'95DA5460-0C80-4DF7-9AAB-E4EE40D1B924', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 12:04:10.0433504', NULL, NULL, N'0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', N'任务=默认测试接口|组=TEST|2023-01-29|StartTime= 12:04:10:005|EndTime=12:04:10:039|耗时=36 毫秒|结果=调用测试接口成功!')
GO

INSERT INTO [dbo].[quartz_job_task_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [JobTaskId], [Text]) VALUES (N'D70E6344-D373-498A-AE19-E7CD84603E47', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 12:03:10.4333444', NULL, NULL, N'0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', N'任务=默认测试接口|组=TEST|2023-01-29|StartTime= 12:03:10:006|EndTime=12:03:10:430|耗时=427 毫秒|结果=调用测试接口成功!')
GO

INSERT INTO [dbo].[quartz_job_task_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [JobTaskId], [Text]) VALUES (N'1C5D8474-8BC6-4586-A93D-F1DFFF5B2BE7', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 16:55:10.1081606', NULL, NULL, N'0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', N'任务=默认测试接口|组=TEST|2023-01-29|StartTime= 16:55:10:054|EndTime=16:55:10:092|耗时=41 毫秒|结果=调用测试接口成功!')
GO

INSERT INTO [dbo].[quartz_job_task_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [JobTaskId], [Text]) VALUES (N'E375C7F0-7B26-4C0E-8B86-F3A7F298C8FA', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 12:03:30.0837588', NULL, NULL, N'0AF155D7-A8EE-4A07-AB1A-40DD0C77D7EA', N'任务=默认测试接口|组=TEST|2023-01-29|StartTime= 12:03:30:052|EndTime=12:03:30:080|耗时=30 毫秒|结果=调用测试接口成功!')
GO


-- ----------------------------
-- Table structure for sys_data_authority
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_data_authority]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_data_authority]
GO

CREATE TABLE [dbo].[sys_data_authority] (
  [Id] uniqueidentifier  NOT NULL,
  [CreatorUserId] uniqueidentifier  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [LastModificationTime] datetime2(7)  NULL,
  [PermissionType] int  NOT NULL,
  [RoleId] uniqueidentifier  NOT NULL
)
GO

ALTER TABLE [dbo].[sys_data_authority] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of sys_data_authority
-- ----------------------------
INSERT INTO [dbo].[sys_data_authority] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [PermissionType], [RoleId]) VALUES (N'D09BF250-C5B0-41CB-237D-08DA00442990', NULL, N'2022-03-07 22:09:58.0000000', NULL, N'2022-07-06 21:53:17.0000000', N'5', N'40FF1844-C099-4061-98E0-CD6E544FCFD3')
GO

INSERT INTO [dbo].[sys_data_authority] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [PermissionType], [RoleId]) VALUES (N'0228A5B5-2202-4BA0-6E48-08DA205DA7B7', NULL, N'2022-04-17 18:33:04.0000000', NULL, N'2022-04-17 18:33:04.0000000', N'5', N'18FA4771-6F58-46A3-80D2-6F0F5E9972E3')
GO


-- ----------------------------
-- Table structure for sys_data_authority_custom
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_data_authority_custom]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_data_authority_custom]
GO

CREATE TABLE [dbo].[sys_data_authority_custom] (
  [Id] uniqueidentifier  NOT NULL,
  [CreatorUserId] uniqueidentifier  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [LastModificationTime] datetime2(7)  NULL,
  [SysDataAuthorityId] uniqueidentifier  NULL,
  [SysOrganizationId] int  NOT NULL
)
GO

ALTER TABLE [dbo].[sys_data_authority_custom] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of sys_data_authority_custom
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dictionary
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_dictionary]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_dictionary]
GO

CREATE TABLE [dbo].[sys_dictionary] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [CreatorUserId] uniqueidentifier  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [LastModificationTime] datetime2(7)  NULL,
  [Sort] int  NOT NULL,
  [Code] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Name] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Value] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [ParentId] int  NULL
)
GO

ALTER TABLE [dbo].[sys_dictionary] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of sys_dictionary
-- ----------------------------
SET IDENTITY_INSERT [dbo].[sys_dictionary] ON
GO

INSERT INTO [dbo].[sys_dictionary] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Sort], [Code], [Name], [Value], [ParentId]) VALUES (N'1', NULL, N'2021-07-25 22:31:30.0000000', NULL, N'2021-07-25 22:39:34.0000000', N'1', N'news_type', N'资讯类别', NULL, NULL)
GO

INSERT INTO [dbo].[sys_dictionary] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Sort], [Code], [Name], [Value], [ParentId]) VALUES (N'2', NULL, N'2021-07-25 22:38:49.0000000', NULL, N'2021-07-25 22:40:30.0000000', N'1', N'news_type_nan', N'男', N'1', N'1')
GO

INSERT INTO [dbo].[sys_dictionary] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Sort], [Code], [Name], [Value], [ParentId]) VALUES (N'3', NULL, N'2021-07-25 22:40:47.0000000', NULL, N'2022-07-06 21:55:30.0000000', N'2', N'news_type_nv', N'女', N'2', N'1')
GO

INSERT INTO [dbo].[sys_dictionary] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Sort], [Code], [Name], [Value], [ParentId]) VALUES (N'4', NULL, N'2022-06-29 20:55:46.0000000', NULL, N'2022-06-29 20:55:46.0000000', N'0', N'3', N'未知', N'3', N'1')
GO

SET IDENTITY_INSERT [dbo].[sys_dictionary] OFF
GO


-- ----------------------------
-- Table structure for sys_function
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_function]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_function]
GO

CREATE TABLE [dbo].[sys_function] (
  [Id] uniqueidentifier  NOT NULL,
  [CreatorUserId] uniqueidentifier  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [LastModificationTime] datetime2(7)  NULL,
  [Number] int  NULL,
  [Name] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [ByName] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Remark] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[sys_function] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of sys_function
-- ----------------------------
INSERT INTO [dbo].[sys_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [Name], [ByName], [Remark]) VALUES (N'B6FD5425-504A-46A9-993B-2F8DC9158EB8', NULL, N'2022-06-16 17:28:00.0000000', NULL, N'2021-04-18 22:08:06.0000000', N'80', N'打印', N'Print', N'Print')
GO

INSERT INTO [dbo].[sys_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [Name], [ByName], [Remark]) VALUES (N'C9518758-B2E1-4F51-B517-5282E273889C', NULL, N'2016-06-20 13:40:52.0000000', NULL, N'2021-04-18 22:08:06.0000000', N'10', N'显示', N'Display', N'Display')
GO

INSERT INTO [dbo].[sys_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [Name], [ByName], [Remark]) VALUES (N'F27ECB0A-197D-47B1-B243-59A8C71302BF', NULL, N'2016-06-20 13:40:52.0000000', NULL, N'2021-04-18 22:08:06.0000000', N'60', N'检索', N'Search', N'Search')
GO

INSERT INTO [dbo].[sys_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [Name], [ByName], [Remark]) VALUES (N'383E7EE2-7690-46AC-9230-65155C84AA30', NULL, N'2016-06-20 13:40:52.0000000', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-09-28 22:12:02.0000000', N'50', N'保存', N'Save', N'Save')
GO

INSERT INTO [dbo].[sys_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [Name], [ByName], [Remark]) VALUES (N'9C388461-2704-4C5E-A729-72C17E9018E1', NULL, N'2016-06-20 13:40:52.0000000', NULL, N'2021-04-18 22:08:06.0000000', N'40', N'删除', N'Delete', N'Delete')
GO

INSERT INTO [dbo].[sys_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [Name], [ByName], [Remark]) VALUES (N'BFFEFB1C-8988-4DDF-B4AC-81C2B30E80CD', NULL, N'2016-06-20 13:40:52.0000000', NULL, N'2021-04-18 22:08:06.0000000', N'20', N'添加', N'Insert', N'Insert')
GO

INSERT INTO [dbo].[sys_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [Name], [ByName], [Remark]) VALUES (N'2401F4D0-60B0-4E2E-903F-84C603373572', NULL, N'2016-06-20 13:40:52.0000000', NULL, N'2021-04-18 22:08:06.0000000', N'70', N'导出', N'Export', N'Export')
GO

INSERT INTO [dbo].[sys_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [Name], [ByName], [Remark]) VALUES (N'E7EF2A05-8317-41C3-B588-99519FE88BF9', NULL, N'2016-06-20 13:40:52.0000000', NULL, N'2021-04-18 22:08:06.0000000', N'30', N'修改', N'Update', N'Update')
GO


-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_menu]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_menu]
GO

CREATE TABLE [dbo].[sys_menu] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [CreatorUserId] uniqueidentifier  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [LastModificationTime] datetime2(7)  NULL,
  [LevelCode] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Number] int  NULL,
  [Name] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [ComponentName] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Url] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Router] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [JumpUrl] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Icon] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [ParentId] int  NULL,
  [Show] bit  NOT NULL,
  [Close] bit  NOT NULL,
  [KeepAlive] bit  NOT NULL,
  [State] bit  NOT NULL,
  [Type] int  NOT NULL,
  [Mode] int  NOT NULL,
  [ModuleUrl] varchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [ModuleUrlPro] varchar(500) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[sys_menu] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of sys_menu
-- ----------------------------
SET IDENTITY_INSERT [dbo].[sys_menu] ON
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl], [ModuleUrlPro]) VALUES (N'1', NULL, N'2021-05-28 11:49:02.0000000', NULL, N'2022-03-04 12:25:39.0000000', N'1', N'10', N'更多示例', NULL, NULL, NULL, NULL, N'MoreOutlined', NULL, N'1', N'1', N'1', N'1', N'1', N'1', NULL, NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl], [ModuleUrlPro]) VALUES (N'2', NULL, N'2021-01-16 16:05:22.0000000', NULL, N'2022-03-18 12:06:20.0000000', N'1.2', N'10', N'查看更多组件', N'AppComponentsCom', N'views/example/AppComponents.vue', N'/app/components', NULL, N'LayoutOutlined', N'1', N'1', N'1', N'1', N'1', N'2', N'1', NULL, NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl], [ModuleUrlPro]) VALUES (N'3', NULL, N'2020-12-17 14:58:05.0000000', NULL, N'2022-03-04 12:26:14.0000000', N'1.3', N'30', N'按钮', N'ButtonCom', N'views/example/Button.vue', N'/button', NULL, N'AppstoreOutlined', N'1', N'1', N'1', N'1', N'1', N'2', N'1', NULL, NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl], [ModuleUrlPro]) VALUES (N'4', NULL, N'2021-01-16 16:06:33.0000000', NULL, N'2022-03-04 12:26:21.0000000', N'1.4', N'40', N'图表 AntV G2', NULL, NULL, NULL, NULL, N'PieChartOutlined', N'1', N'1', N'1', N'1', N'1', N'1', N'1', NULL, NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl], [ModuleUrlPro]) VALUES (N'5', NULL, N'2021-01-16 16:07:24.0000000', NULL, N'2022-03-04 12:26:25.0000000', N'1.4.5', N'10', N'基础图表', N'ChartBaseCom', N'views/example/chart/Base.vue', N'/chart/base', NULL, NULL, N'4', N'1', N'1', N'1', N'1', N'2', N'1', NULL, NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl], [ModuleUrlPro]) VALUES (N'6', NULL, N'2021-01-16 16:10:06.0000000', NULL, N'2022-03-04 12:26:28.0000000', N'1.4.6', N'20', N'更多图表', N'ChartMoreCom', N'views/example/chart/More.vue', N'/chart/more', NULL, NULL, N'4', N'1', N'1', N'1', N'1', N'2', N'1', NULL, NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl], [ModuleUrlPro]) VALUES (N'7', NULL, N'2018-03-10 12:16:38.0000000', NULL, N'2022-03-04 12:26:34.0000000', N'1.7', N'50', N'表格管理', NULL, NULL, NULL, NULL, N'TableOutlined', N'1', N'1', N'1', N'1', N'1', N'1', N'1', NULL, NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl], [ModuleUrlPro]) VALUES (N'8', NULL, N'2020-12-17 14:49:12.0000000', NULL, N'2022-03-04 12:26:38.0000000', N'1.7.8', N'100', N'基础列表', N'BaseListCom', N'views/example/BaseList.vue', N'/base/list', NULL, NULL, N'7', N'1', N'1', N'1', N'1', N'2', N'1', NULL, NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl], [ModuleUrlPro]) VALUES (N'9', NULL, N'2020-12-17 14:51:07.0000000', NULL, N'2022-03-04 12:26:41.0000000', N'1.7.9', N'110', N'标准表格', N'ListIndexCom', N'views/example/list/Index.vue', N'/list', NULL, NULL, N'7', N'1', N'1', N'1', N'1', N'2', N'1', NULL, NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl], [ModuleUrlPro]) VALUES (N'10', NULL, N'2021-01-18 19:34:28.0000000', NULL, N'2022-03-04 12:26:46.0000000', N'1.10', N'60', N'富文本编辑器', N'EditorCom', N'views/example/Editor.vue', N'/editor', NULL, N'PicRightOutlined', N'1', N'1', N'1', N'1', N'1', N'2', N'1', NULL, NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl], [ModuleUrlPro]) VALUES (N'11', NULL, N'2021-08-05 21:51:12.0000000', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-17 16:25:29.0304633', N'1.11', N'70', N'微前端', N'Iframe', N'core/components/Iframe.vue', N'/iframe', N'', N'RadarChartOutlined', N'1', N'1', N'1', N'1', N'1', N'2', N'2', N'http://rapidscada.com.cn/#/', N'https://www.yuque.com/u378909/yidf7v/bs256p')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl], [ModuleUrlPro]) VALUES (N'12', NULL, N'2018-03-10 12:16:38.0000000', NULL, N'2022-03-04 12:25:43.0000000', N'12', N'50', N'基础信息', NULL, NULL, NULL, NULL, N'GoldOutlined', NULL, N'1', N'1', N'1', N'1', N'1', N'1', NULL, NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl], [ModuleUrlPro]) VALUES (N'13', NULL, N'2018-03-10 12:16:38.0000000', NULL, N'2022-03-04 12:26:55.0000000', N'12.13', N'10', N'会员管理', N'base_member', N'views/base/member/Index.vue', N'/base/member', NULL, N'UsergroupAddOutlined', N'12', N'1', N'1', N'1', N'1', N'2', N'1', NULL, NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl], [ModuleUrlPro]) VALUES (N'14', NULL, N'2018-03-10 12:16:38.0000000', NULL, N'2022-03-04 12:25:46.0000000', N'14', N'100', N'系统管理', NULL, NULL, NULL, NULL, N'DesktopOutlined', NULL, N'1', N'1', N'1', N'1', N'1', N'1', NULL, NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl], [ModuleUrlPro]) VALUES (N'15', NULL, N'2018-03-10 12:16:38.0000000', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-04 16:28:51.0000000', N'14.15', N'100', N'账户管理', N'system_user', N'views/system/sys_user/Index.vue', N'/system/user', NULL, N'UserOutlined', N'14', N'1', N'1', N'1', N'1', N'2', N'1', NULL, NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl], [ModuleUrlPro]) VALUES (N'16', NULL, N'2018-03-10 12:16:38.0000000', NULL, N'2022-04-22 22:24:03.0000000', N'14.16', N'110', N'角色管理', N'system_role', N'views/system/sys_role/Index.vue', N'/system/role', NULL, N'TeamOutlined', N'14', N'1', N'1', N'1', N'1', N'2', N'1', NULL, NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl], [ModuleUrlPro]) VALUES (N'17', NULL, N'2018-03-10 12:16:38.0000000', NULL, N'2022-03-04 12:27:11.0000000', N'14.17', N'120', N'功能管理', N'system_function', N'views/system/sys_function/Index.vue', N'/system/function', NULL, N'ControlOutlined', N'14', N'1', N'1', N'1', N'1', N'2', N'1', NULL, NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl], [ModuleUrlPro]) VALUES (N'19', NULL, N'2018-03-10 12:16:38.0000000', NULL, N'2022-03-04 12:27:19.0000000', N'14.19', N'150', N'个人中心', N'system_personal_center', N'views/system/personal_center/Index.vue', N'/system/personal/center', NULL, N'FormOutlined', N'14', N'1', N'1', N'1', N'1', N'2', N'1', NULL, NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl], [ModuleUrlPro]) VALUES (N'20', NULL, N'2021-05-27 17:29:49.0000000', NULL, N'2022-03-04 12:27:23.0000000', N'14.20', N'160', N'岗位管理', N'system_post', N'views/system/sys_post/Index.vue', N'/system/post', NULL, N'IdcardOutlined', N'14', N'1', N'1', N'1', N'1', N'2', N'1', NULL, NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl], [ModuleUrlPro]) VALUES (N'21', NULL, N'2021-05-27 20:27:56.0000000', NULL, N'2022-03-04 12:27:27.0000000', N'14.21', N'170', N'组织机构', N'system_organization', N'views/system/sys_organization/Index.vue', N'/system/organization', NULL, N'ClusterOutlined', N'14', N'1', N'1', N'1', N'1', N'2', N'1', NULL, NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl], [ModuleUrlPro]) VALUES (N'22', NULL, N'2018-03-10 12:17:03.0000000', NULL, N'2022-03-04 12:27:41.0000000', N'29.22', N'10', N'接口文档', N'swagger', N'views/development_tool/Swagger.vue', N'/development_tool/swagger', NULL, N'FileSearchOutlined', N'29', N'1', N'1', N'1', N'1', N'2', N'1', NULL, NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl], [ModuleUrlPro]) VALUES (N'23', NULL, N'2021-07-25 21:50:01.0000000', NULL, N'2022-03-04 12:27:31.0000000', N'14.23', N'190', N'数据字典', N'system_dictionary', N'views/system/sys_dictionary/Index.vue', N'/system/dictionary', NULL, N'FileDoneOutlined', N'14', N'1', N'1', N'1', N'1', N'2', N'1', NULL, NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl], [ModuleUrlPro]) VALUES (N'24', NULL, N'2021-08-05 21:24:54.0000000', NULL, N'2022-03-04 12:27:35.0000000', N'14.24', N'200', N'操作日志', N'sys_operation_log', N'views/system/sys_operation_log/Index.vue', N'/system/sys_operation_log', N'', N'ContainerOutlined', N'14', N'1', N'1', N'1', N'1', N'2', N'1', NULL, NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl], [ModuleUrlPro]) VALUES (N'25', NULL, N'2018-03-10 12:16:38.0000000', NULL, N'2022-03-04 12:27:15.0000000', N'14.25', N'130', N'菜单功能', N'system_menu', N'views/system/sys_menu/Index.vue', N'/system/menu', NULL, N'MenuOutlined', N'14', N'1', N'1', N'1', N'1', N'2', N'1', NULL, NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl], [ModuleUrlPro]) VALUES (N'28', NULL, N'2021-12-29 17:13:26.0000000', NULL, N'2022-03-04 12:26:00.0000000', N'1.28', N'1', N'Vxe-Table', N'VxeTableCom', N'views/example/VxeTable.vue', N'/vxe/table', NULL, N'BorderlessTableOutlined', N'1', N'1', N'1', N'1', N'1', N'2', N'1', NULL, NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl], [ModuleUrlPro]) VALUES (N'29', NULL, N'2022-01-12 14:17:21.0000000', NULL, N'2022-03-04 12:25:49.0000000', N'29', N'200', N'开发工具', NULL, NULL, NULL, NULL, N'CodepenOutlined', NULL, N'1', N'1', N'1', N'1', N'1', N'1', NULL, NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl], [ModuleUrlPro]) VALUES (N'30', NULL, N'2022-01-12 14:22:04.0000000', NULL, N'2022-03-04 12:27:44.0000000', N'29.30', N'20', N'定时任务', N'TimedTaskCom', N'views/development_tool/timed_task/Index.vue', N'/development_tool/timed_task', NULL, N'FieldTimeOutlined', N'29', N'1', N'1', N'1', N'1', N'2', N'1', NULL, NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl], [ModuleUrlPro]) VALUES (N'31', NULL, N'2022-01-12 15:39:46.0000000', NULL, N'2022-05-24 22:05:57.0000000', N'29.31', N'30', N'代码生成', N'LowCode', N'views/development_tool/low_code/Index.vue', N'/development-tool/low-code', NULL, N'CodeTwoTone', N'29', N'1', N'1', N'1', N'1', N'2', N'1', NULL, NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl], [ModuleUrlPro]) VALUES (N'32', NULL, N'2022-02-24 10:51:38.0000000', NULL, N'2022-03-18 12:06:38.0000000', N'1.32', N'20', N'图标展示', N'IconsVue', N'views/example/Icons.vue', N'/icons', NULL, N'TagsTwoTone', N'1', N'1', N'1', N'1', N'1', N'2', N'1', NULL, NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl], [ModuleUrlPro]) VALUES (N'33', NULL, N'2022-04-10 10:55:41.0000000', NULL, N'2022-04-10 10:56:17.0000000', N'29.33', N'40', N'EFCore监控台', N'monitor_efcore', N'views/development_tool/monitor_efcore/Index.vue', N'/development_tool/monitor/efcore', NULL, N'DashboardFilled', N'29', N'1', N'1', N'1', N'1', N'2', N'1', NULL, NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl], [ModuleUrlPro]) VALUES (N'36', NULL, N'2022-04-17 17:45:25.0000000', NULL, N'2022-04-17 17:49:13.0000000', N'12.13.36', N'1', N'详情', N'base_member_info_Details', N'views/base/member/components/Details.vue', N'/base/member/details/:id/:title', NULL, NULL, N'13', N'0', N'1', N'1', N'1', N'2', N'1', NULL, NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl], [ModuleUrlPro]) VALUES (N'37', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-16 15:00:53.0000000', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-16 17:30:09.9426258', N'1.37', N'80', N'微前端2', N'Iframe123', N'core/components/Iframe.vue', N'/iframe123', NULL, N'AlipaySquareFilled', N'1', N'1', N'1', N'1', N'1', N'2', N'2', N'https://www.yuque.com/u378909/yidf7v/zx6egc', NULL)
GO

SET IDENTITY_INSERT [dbo].[sys_menu] OFF
GO


-- ----------------------------
-- Table structure for sys_menu_function
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_menu_function]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_menu_function]
GO

CREATE TABLE [dbo].[sys_menu_function] (
  [Id] uniqueidentifier  NOT NULL,
  [CreatorUserId] uniqueidentifier  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [LastModificationTime] datetime2(7)  NULL,
  [Number] int  NULL,
  [MenuId] int  NOT NULL,
  [FunctionCode] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [FunctionName] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Remark] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[sys_menu_function] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of sys_menu_function
-- ----------------------------
INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'33C80938-82C8-4299-0F12-08D9FDAD00AB', NULL, N'2022-03-04 15:17:09.0000000', NULL, N'2022-03-04 15:17:09.0000000', N'10', N'30', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'EF70B789-21EE-4850-0F1B-08D9FDAD00AB', NULL, N'2022-03-04 15:16:44.0000000', NULL, N'2022-03-04 15:16:44.0000000', N'10', N'22', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'A7CD04DB-BBE3-49B6-0F1E-08D9FDAD00AB', NULL, N'2022-03-18 12:06:20.0000000', NULL, N'2022-03-18 12:06:20.0000000', N'10', N'2', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'6C09C0C0-72FA-4842-0F1F-08D9FDAD00AB', NULL, N'2022-03-18 12:06:38.0000000', NULL, N'2022-03-18 12:06:38.0000000', N'10', N'32', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'F64CFE50-1EF1-457F-0F20-08D9FDAD00AB', NULL, N'2022-03-04 15:24:24.0000000', NULL, N'2022-03-04 15:24:24.0000000', N'10', N'3', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'A1DDD02F-8C21-4D79-0F21-08D9FDAD00AB', NULL, N'2022-03-04 15:24:30.0000000', NULL, N'2022-03-04 15:24:30.0000000', N'10', N'5', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'1CB6FBE1-4A6C-4AAD-0F22-08D9FDAD00AB', NULL, N'2022-03-04 15:24:34.0000000', NULL, N'2022-03-04 15:24:34.0000000', N'10', N'6', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'D2E6EA60-2CF6-478A-0F23-08D9FDAD00AB', NULL, N'2022-03-04 15:24:40.0000000', NULL, N'2022-03-04 15:24:40.0000000', N'10', N'8', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'B7533A90-DAE4-4263-0F24-08D9FDAD00AB', NULL, N'2022-03-04 15:24:43.0000000', NULL, N'2022-03-04 15:24:43.0000000', N'10', N'9', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'EC535908-8671-4928-0F25-08D9FDAD00AB', NULL, N'2022-03-04 15:24:47.0000000', NULL, N'2022-03-04 15:24:47.0000000', N'10', N'10', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'3BC0E68F-D03D-4E99-0F26-08D9FDAD00AB', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-17 16:25:29.0433132', NULL, N'2022-03-04 15:24:53.0000000', N'10', N'11', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'EB958545-6449-40DB-0F27-08D9FDAD00AB', NULL, N'2022-03-04 15:25:07.0000000', NULL, N'2022-03-04 15:25:07.0000000', N'10', N'13', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'B5881044-AFB8-40B2-0F28-08D9FDAD00AB', NULL, N'2022-03-04 15:25:07.0000000', NULL, N'2022-03-04 15:25:07.0000000', N'20', N'13', N'Insert', N'添加', N'Insert')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'106FB69A-8BB5-4559-0F29-08D9FDAD00AB', NULL, N'2022-03-04 15:25:07.0000000', NULL, N'2022-03-04 15:25:07.0000000', N'30', N'13', N'Update', N'修改', N'Update')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'F4621FBE-6B40-4454-0F2A-08D9FDAD00AB', NULL, N'2022-03-04 15:25:07.0000000', NULL, N'2022-03-04 15:25:07.0000000', N'40', N'13', N'Delete', N'删除', N'Delete')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'523B53B5-8159-4A16-0F2B-08D9FDAD00AB', NULL, N'2022-03-04 15:25:07.0000000', NULL, N'2022-03-04 15:25:07.0000000', N'50', N'13', N'Save', N'保存', N'Save')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'A3754771-F6E9-4A23-0F2C-08D9FDAD00AB', NULL, N'2022-03-04 15:25:07.0000000', NULL, N'2022-03-04 15:25:07.0000000', N'60', N'13', N'Search', N'检索', N'Search')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'B96F977C-A36E-4E7F-0F2D-08D9FDAD00AB', NULL, N'2022-03-04 15:25:07.0000000', NULL, N'2022-03-04 15:25:07.0000000', N'70', N'13', N'Export', N'导出', N'Export')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'541D9045-47B2-4629-0F2E-08D9FDAD00AB', NULL, N'2022-03-04 15:25:07.0000000', NULL, N'2022-03-04 15:25:07.0000000', N'80', N'13', N'Print', N'打印', N'Print')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'13F3F74D-C6FC-4488-0F2F-08D9FDAD00AB', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-04 16:28:51.0000000', NULL, N'2022-03-04 15:25:14.0000000', N'10', N'15', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'CCE82EB4-7FC5-4308-0F30-08D9FDAD00AB', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-04 16:28:51.0000000', NULL, N'2022-03-04 15:25:14.0000000', N'20', N'15', N'Insert', N'添加', N'Insert')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'8564E4D8-D7F4-4F12-0F31-08D9FDAD00AB', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-04 16:28:51.0000000', NULL, N'2022-03-04 15:25:14.0000000', N'30', N'15', N'Update', N'修改', N'Update')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'0AD6A459-1D9D-4512-0F32-08D9FDAD00AB', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-04 16:28:51.0000000', NULL, N'2022-03-04 15:25:14.0000000', N'40', N'15', N'Delete', N'删除', N'Delete')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'37D3E492-62DA-47A4-0F33-08D9FDAD00AB', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-04 16:28:51.0000000', NULL, N'2022-03-04 15:25:14.0000000', N'50', N'15', N'Save', N'保存', N'Save')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'BEB87004-5CFB-417A-0F34-08D9FDAD00AB', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-04 16:28:51.0000000', NULL, N'2022-03-04 15:25:14.0000000', N'60', N'15', N'Search', N'检索', N'Search')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'A46E07D3-C722-4548-0F35-08D9FDAD00AB', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-04 16:28:51.0000000', NULL, N'2022-03-04 15:25:14.0000000', N'70', N'15', N'Export', N'导出', N'Export')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'C8EDBB79-567E-461B-0F36-08D9FDAD00AB', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-04 16:28:51.0000000', NULL, N'2022-03-04 15:25:14.0000000', N'80', N'15', N'Print', N'打印', N'Print')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'550F874B-E804-44A0-0F37-08D9FDAD00AB', NULL, N'2022-04-22 22:24:03.0000000', NULL, N'2022-04-22 22:24:03.0000000', N'10', N'16', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'C67A0ABE-DAEC-491B-0F38-08D9FDAD00AB', NULL, N'2022-04-22 22:24:03.0000000', NULL, N'2022-04-22 22:24:03.0000000', N'20', N'16', N'Insert', N'添加', N'Insert')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'823AC05D-65E4-4216-0F39-08D9FDAD00AB', NULL, N'2022-04-22 22:24:03.0000000', NULL, N'2022-04-22 22:24:03.0000000', N'30', N'16', N'Update', N'修改', N'Update')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'BD6AE6DA-1CA6-46C2-0F3A-08D9FDAD00AB', NULL, N'2022-04-22 22:24:03.0000000', NULL, N'2022-04-22 22:24:03.0000000', N'40', N'16', N'Delete', N'删除', N'Delete')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'14783A71-E265-4D6B-0F3B-08D9FDAD00AB', NULL, N'2022-04-22 22:24:03.0000000', NULL, N'2022-04-22 22:24:03.0000000', N'50', N'16', N'Save', N'保存', N'Save')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'2FEA8F87-2A13-4C95-0F3C-08D9FDAD00AB', NULL, N'2022-04-22 22:24:03.0000000', NULL, N'2022-04-22 22:24:03.0000000', N'60', N'16', N'Search', N'检索', N'Search')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'437FBF85-8704-4E87-0F3D-08D9FDAD00AB', NULL, N'2022-04-22 22:24:03.0000000', NULL, N'2022-04-22 22:24:03.0000000', N'70', N'16', N'Export', N'导出', N'Export')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'6B009415-EADF-4DAB-0F3E-08D9FDAD00AB', NULL, N'2022-04-22 22:24:03.0000000', NULL, N'2022-04-22 22:24:03.0000000', N'80', N'16', N'Print', N'打印', N'Print')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'53FDB4A0-CA6E-4568-0F3F-08D9FDAD00AB', NULL, N'2022-03-04 15:25:21.0000000', NULL, N'2022-03-04 15:25:21.0000000', N'10', N'17', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'86465238-C51C-45D5-0F40-08D9FDAD00AB', NULL, N'2022-03-04 15:25:21.0000000', NULL, N'2022-03-04 15:25:21.0000000', N'20', N'17', N'Insert', N'添加', N'Insert')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'86FF83FD-D34A-4290-0F41-08D9FDAD00AB', NULL, N'2022-03-04 15:25:21.0000000', NULL, N'2022-03-04 15:25:21.0000000', N'30', N'17', N'Update', N'修改', N'Update')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'7EA8F706-BFE5-42B2-0F42-08D9FDAD00AB', NULL, N'2022-03-04 15:25:21.0000000', NULL, N'2022-03-04 15:25:21.0000000', N'40', N'17', N'Delete', N'删除', N'Delete')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'DEE401B1-E20E-496E-0F43-08D9FDAD00AB', NULL, N'2022-03-04 15:25:21.0000000', NULL, N'2022-03-04 15:25:21.0000000', N'50', N'17', N'Save', N'保存', N'Save')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'0B27E69F-AF16-4481-0F44-08D9FDAD00AB', NULL, N'2022-03-04 15:25:21.0000000', NULL, N'2022-03-04 15:25:21.0000000', N'60', N'17', N'Search', N'检索', N'Search')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'A726455F-1C29-4BE0-0F45-08D9FDAD00AB', NULL, N'2022-03-04 15:25:21.0000000', NULL, N'2022-03-04 15:25:21.0000000', N'70', N'17', N'Export', N'导出', N'Export')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'0CAA6E7D-92B0-4814-0F46-08D9FDAD00AB', NULL, N'2022-03-04 15:25:21.0000000', NULL, N'2022-03-04 15:25:21.0000000', N'80', N'17', N'Print', N'打印', N'Print')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'DB3AB8BD-7709-41A2-0F47-08D9FDAD00AB', NULL, N'2022-03-04 15:25:28.0000000', NULL, N'2022-03-04 15:25:28.0000000', N'10', N'25', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'FE6465BF-E429-45BD-0F48-08D9FDAD00AB', NULL, N'2022-03-04 15:25:28.0000000', NULL, N'2022-03-04 15:25:28.0000000', N'20', N'25', N'Insert', N'添加', N'Insert')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'4A67FCDB-A7A9-4E3C-0F49-08D9FDAD00AB', NULL, N'2022-03-04 15:25:28.0000000', NULL, N'2022-03-04 15:25:28.0000000', N'30', N'25', N'Update', N'修改', N'Update')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'20AB5395-D57C-49DB-0F4A-08D9FDAD00AB', NULL, N'2022-03-04 15:25:28.0000000', NULL, N'2022-03-04 15:25:28.0000000', N'40', N'25', N'Delete', N'删除', N'Delete')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'41CB1942-573A-4D63-0F4B-08D9FDAD00AB', NULL, N'2022-03-04 15:25:28.0000000', NULL, N'2022-03-04 15:25:28.0000000', N'50', N'25', N'Save', N'保存', N'Save')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'7E0F6C84-D7F1-4243-0F4C-08D9FDAD00AB', NULL, N'2022-03-04 15:25:28.0000000', NULL, N'2022-03-04 15:25:28.0000000', N'60', N'25', N'Search', N'检索', N'Search')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'1E69DF5D-D1E9-4BC8-0F4D-08D9FDAD00AB', NULL, N'2022-03-04 15:25:28.0000000', NULL, N'2022-03-04 15:25:28.0000000', N'70', N'25', N'Export', N'导出', N'Export')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'4BBBE120-0CC6-4A08-0F4E-08D9FDAD00AB', NULL, N'2022-03-04 15:25:28.0000000', NULL, N'2022-03-04 15:25:28.0000000', N'80', N'25', N'Print', N'打印', N'Print')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'45E2CA86-4823-4FB9-0F57-08D9FDAD00AB', NULL, N'2022-03-04 15:25:36.0000000', NULL, N'2022-03-04 15:25:36.0000000', N'10', N'20', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'3E44C6F5-E090-40A1-0F58-08D9FDAD00AB', NULL, N'2022-03-04 15:25:36.0000000', NULL, N'2022-03-04 15:25:36.0000000', N'20', N'20', N'Insert', N'添加', N'Insert')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'22A675F6-EFDA-481D-0F59-08D9FDAD00AB', NULL, N'2022-03-04 15:25:36.0000000', NULL, N'2022-03-04 15:25:36.0000000', N'30', N'20', N'Update', N'修改', N'Update')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'69DA651E-787B-42E5-0F5A-08D9FDAD00AB', NULL, N'2022-03-04 15:25:36.0000000', NULL, N'2022-03-04 15:25:36.0000000', N'40', N'20', N'Delete', N'删除', N'Delete')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'616C4E4A-FB61-49CF-0F5B-08D9FDAD00AB', NULL, N'2022-03-04 15:25:36.0000000', NULL, N'2022-03-04 15:25:36.0000000', N'50', N'20', N'Save', N'保存', N'Save')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'5E4E87BD-C179-4B5B-0F5C-08D9FDAD00AB', NULL, N'2022-03-04 15:25:36.0000000', NULL, N'2022-03-04 15:25:36.0000000', N'60', N'20', N'Search', N'检索', N'Search')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'54743C86-AC73-4345-0F5D-08D9FDAD00AB', NULL, N'2022-03-04 15:25:36.0000000', NULL, N'2022-03-04 15:25:36.0000000', N'70', N'20', N'Export', N'导出', N'Export')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'2469188C-21DE-492A-0F5E-08D9FDAD00AB', NULL, N'2022-03-04 15:25:36.0000000', NULL, N'2022-03-04 15:25:36.0000000', N'80', N'20', N'Print', N'打印', N'Print')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'C6BA141B-99BA-4114-0F5F-08D9FDAD00AB', NULL, N'2022-03-04 15:25:40.0000000', NULL, N'2022-03-04 15:25:40.0000000', N'10', N'21', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'0A85E4FD-5A1C-47F6-0F60-08D9FDAD00AB', NULL, N'2022-03-04 15:25:40.0000000', NULL, N'2022-03-04 15:25:40.0000000', N'20', N'21', N'Insert', N'添加', N'Insert')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'F4C73AC0-C66D-4988-0F61-08D9FDAD00AB', NULL, N'2022-03-04 15:25:40.0000000', NULL, N'2022-03-04 15:25:40.0000000', N'30', N'21', N'Update', N'修改', N'Update')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'3CB3CBC7-9E45-4CC3-0F62-08D9FDAD00AB', NULL, N'2022-03-04 15:25:40.0000000', NULL, N'2022-03-04 15:25:40.0000000', N'40', N'21', N'Delete', N'删除', N'Delete')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'6B209D5A-B366-4A61-0F63-08D9FDAD00AB', NULL, N'2022-03-04 15:25:40.0000000', NULL, N'2022-03-04 15:25:40.0000000', N'50', N'21', N'Save', N'保存', N'Save')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'F36B9B06-2826-425F-0F64-08D9FDAD00AB', NULL, N'2022-03-04 15:25:40.0000000', NULL, N'2022-03-04 15:25:40.0000000', N'60', N'21', N'Search', N'检索', N'Search')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'A9503588-E6F7-420B-0F65-08D9FDAD00AB', NULL, N'2022-03-04 15:25:40.0000000', NULL, N'2022-03-04 15:25:40.0000000', N'70', N'21', N'Export', N'导出', N'Export')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'C9E5FFF0-6744-47D7-0F66-08D9FDAD00AB', NULL, N'2022-03-04 15:25:40.0000000', NULL, N'2022-03-04 15:25:40.0000000', N'80', N'21', N'Print', N'打印', N'Print')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'9426768E-B90D-41E1-0F67-08D9FDAD00AB', NULL, N'2022-03-04 15:25:50.0000000', NULL, N'2022-03-04 15:25:50.0000000', N'10', N'23', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'E991934A-0D30-416B-0F68-08D9FDAD00AB', NULL, N'2022-03-04 15:25:50.0000000', NULL, N'2022-03-04 15:25:50.0000000', N'20', N'23', N'Insert', N'添加', N'Insert')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'B98A365E-6FB4-4EFB-0F69-08D9FDAD00AB', NULL, N'2022-03-04 15:25:50.0000000', NULL, N'2022-03-04 15:25:50.0000000', N'30', N'23', N'Update', N'修改', N'Update')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'92B39A10-3927-4EE7-0F6A-08D9FDAD00AB', NULL, N'2022-03-04 15:25:50.0000000', NULL, N'2022-03-04 15:25:50.0000000', N'40', N'23', N'Delete', N'删除', N'Delete')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'A03D56D7-4B0D-47CC-0F6B-08D9FDAD00AB', NULL, N'2022-03-04 15:25:50.0000000', NULL, N'2022-03-04 15:25:50.0000000', N'50', N'23', N'Save', N'保存', N'Save')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'E2319118-42CC-41A2-0F6C-08D9FDAD00AB', NULL, N'2022-03-04 15:25:50.0000000', NULL, N'2022-03-04 15:25:50.0000000', N'60', N'23', N'Search', N'检索', N'Search')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'0984A2E1-3722-41D4-0F6D-08D9FDAD00AB', NULL, N'2022-03-04 15:25:50.0000000', NULL, N'2022-03-04 15:25:50.0000000', N'70', N'23', N'Export', N'导出', N'Export')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'1D831D57-6634-45D7-0F6E-08D9FDAD00AB', NULL, N'2022-03-04 15:25:50.0000000', NULL, N'2022-03-04 15:25:50.0000000', N'80', N'23', N'Print', N'打印', N'Print')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'C77C812A-1601-4311-0F70-08D9FDAD00AB', NULL, N'2022-03-04 15:26:00.0000000', NULL, N'2022-03-04 15:26:00.0000000', N'10', N'19', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'3F6D0AF7-5386-4D3A-0F71-08D9FDAD00AB', NULL, N'2022-03-04 15:40:52.0000000', NULL, N'2022-03-04 15:40:52.0000000', N'10', N'28', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'55750F56-EDC9-4771-E2D6-08D9FDEFA8F8', NULL, N'2022-03-04 23:00:02.0000000', NULL, N'2022-03-04 23:00:02.0000000', N'10', N'24', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'7694FBF5-E28D-424C-E2D7-08D9FDEFA8F8', NULL, N'2022-03-04 23:00:02.0000000', NULL, N'2022-03-04 23:00:02.0000000', N'40', N'24', N'Delete', N'删除', N'Delete')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'2186550D-246C-4552-E2D8-08D9FDEFA8F8', NULL, N'2022-03-04 23:00:02.0000000', NULL, N'2022-03-04 23:00:02.0000000', N'60', N'24', N'Search', N'检索', N'Search')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'687254AE-0D76-4788-A4E8-08DA1A9D9949', NULL, N'2022-04-10 10:56:17.0000000', NULL, N'2022-04-10 10:56:17.0000000', N'10', N'33', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'0073CCE2-FF42-496C-9FF6-08DA204FCECB', NULL, N'2022-04-17 20:40:12.0000000', NULL, N'2022-04-17 20:40:12.0000000', N'10', N'36', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'48F0A694-0539-4E69-A2E4-08DA3D8E6577', NULL, N'2022-05-24 22:05:57.0000000', NULL, N'2022-05-24 22:05:57.0000000', N'10', N'31', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'4DBF096D-D3D3-4565-A2E5-08DA3D8E6577', NULL, N'2022-05-24 22:05:57.0000000', NULL, N'2022-05-24 22:05:57.0000000', N'40', N'31', N'Delete', N'删除', N'Delete')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'38B4704D-7C5D-4F89-A2E7-08DA3D8E6577', NULL, N'2022-05-24 22:05:57.0000000', NULL, N'2022-05-24 22:05:57.0000000', N'60', N'31', N'Search', N'检索', N'Search')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'9C9B41FD-DB96-48CF-C07F-08DADF3345BD', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-16 17:30:09.9542259', NULL, NULL, N'10', N'37', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'47E1A6A3-4C89-46BF-C080-08DADF3345BD', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-16 17:30:09.9542276', NULL, NULL, N'20', N'37', N'Insert', N'添加', N'Insert')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'D51A17AF-163E-4A74-C081-08DADF3345BD', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-16 17:30:09.9542277', NULL, NULL, N'30', N'37', N'Update', N'修改', N'Update')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'C6400925-A381-4679-C082-08DADF3345BD', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-16 17:30:09.9542278', NULL, NULL, N'40', N'37', N'Delete', N'删除', N'Delete')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'216E9AD6-CC3F-4E72-C083-08DADF3345BD', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-16 17:30:09.9542278', NULL, NULL, N'50', N'37', N'Save', N'保存', N'Save')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'4E7CD8DF-2E35-4D5E-C084-08DADF3345BD', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-16 17:30:09.9542279', NULL, NULL, N'60', N'37', N'Search', N'检索', N'Search')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'C981AA0B-D60E-4160-C085-08DADF3345BD', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-16 17:30:09.9542279', NULL, NULL, N'70', N'37', N'Export', N'导出', N'Export')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'576F8A5D-1C47-47C9-C086-08DADF3345BD', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-16 17:30:09.9542280', NULL, NULL, N'80', N'37', N'Print', N'打印', N'Print')
GO


-- ----------------------------
-- Table structure for sys_operation_log
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_operation_log]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_operation_log]
GO

CREATE TABLE [dbo].[sys_operation_log] (
  [Id] uniqueidentifier  NOT NULL,
  [CreatorUserId] uniqueidentifier  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [LastModificationTime] datetime2(7)  NULL,
  [Api] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Ip] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Form] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [FormBody] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [QueryString] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [TakeUpTime] bigint  NOT NULL,
  [Browser] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [OS] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [UserId] uniqueidentifier  NULL,
  [ControllerDisplayName] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [ActionDisplayName] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[sys_operation_log] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of sys_operation_log
-- ----------------------------
INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'42F32115-6D96-4032-D33D-08DADC1D165F', N'00000000-0000-0000-0000-000000000000', N'2022-12-12 16:44:31.6121048', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'66', N'Edge108', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'652204D2-80A8-4EC9-D33E-08DADC1D165F', N'00000000-0000-0000-0000-000000000000', N'2022-12-12 16:44:33.6019139', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'599', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'295F32E8-DDEF-4DEE-78A5-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:15:27.8874428', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'77', N'Edge108', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8C86D92A-C0F1-4FB4-78A6-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:15:28.6663188', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'284', N'Edge108', N'Windows10', NULL, N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E40B8FE2-0B67-4796-78A7-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:15:40.6104207', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'494', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'370EAAF7-D8C1-4E14-78A8-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:15:51.5084929', NULL, NULL, N'/api/admin/SysOrganization/sysOrganizationTree', N'0.0.0.1', N'', N'{}', N'', N'400', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'组织机构', N'查看组织架构树')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F25F0E4A-52C0-4C80-78A9-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:15:51.6565810', NULL, NULL, N'/api/admin/SysUser/findList/10/1', N'0.0.0.1', N'', N'{}', N'', N'559', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查看数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0DC6BE61-BD70-4D86-78AA-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:15:53.3068980', NULL, NULL, N'/api/admin/SysOrganization/sysOrganizationTree', N'0.0.0.1', N'', N'{}', N'', N'53', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'组织机构', N'查看组织架构树')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'BA37C71D-E700-461A-78AB-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:15:53.3942863', NULL, NULL, N'/api/admin/SysUser/findForm/3739f349-7995-4c63-62d8-08da00e3d8a0', N'0.0.0.1', N'', N'', N'', N'180', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查询数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'943B7AA2-EB00-465E-78AC-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:19:12.7694428', NULL, NULL, N'/api/admin/SysUser/findList/10/1', N'0.0.0.1', N'', N'{}', N'', N'118', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查看数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'573CDF9B-292A-4B27-78AD-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:19:13.4462406', NULL, NULL, N'/api/admin/SysUser/findList/10/1', N'0.0.0.1', N'', N'{}', N'', N'56', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查看数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'103A9C22-4D8A-42FF-78AE-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:22:40.7843122', NULL, NULL, N'/api/admin/SysUser/findForm/4fd6a740-0cf1-4975-62d6-08da00e3d8a0', N'0.0.0.1', N'', N'', N'', N'115', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查询数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1896765E-ADF8-4D0C-78AF-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:22:40.8505629', NULL, NULL, N'/api/admin/SysOrganization/sysOrganizationTree', N'0.0.0.1', N'', N'{}', N'', N'119', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'组织机构', N'查看组织架构树')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'65CAB090-B711-4F59-78B0-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:29:55.1826278', NULL, NULL, N'/api/admin/SysUser/findForm/4fd6a740-0cf1-4975-62d6-08da00e3d8a0', N'0.0.0.1', N'', N'', N'', N'183', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查询数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'26FE9CA5-0023-451B-78B1-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:29:55.2007863', NULL, NULL, N'/api/admin/SysOrganization/sysOrganizationTree', N'0.0.0.1', N'', N'{}', N'', N'203', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'组织机构', N'查看组织架构树')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'DD8F3921-3791-4156-78B2-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:32:00.7518453', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'62', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E71D605A-F255-48CD-78B3-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:32:06.1299117', NULL, NULL, N'/api/admin/SysMenu/findForm/17', N'0.0.0.1', N'', N'', N'', N'74', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'811B4D3F-4860-4CB0-78B4-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:34:44.3233701', NULL, NULL, N'/api/admin/SysMenu/findForm/25', N'0.0.0.1', N'', N'', N'', N'127', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A895D95B-4AF4-49B3-78B5-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:35:39.2000260', NULL, NULL, N'/api/admin/SysMenu/findForm', N'0.0.0.1', N'', N'', N'', N'37', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'08864048-BD98-4468-78B6-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:38:58.2066610', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'107', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D4EE4F59-5E01-4614-78B7-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:38:59.2427649', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'68', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2735530A-7F1E-4BAF-78B8-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:39:04.9949386', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'12', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'11C2D19A-2E25-4360-78B9-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:39:05.9351773', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'30', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2E338EA8-3B6F-45BA-78BA-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:39:10.0054404', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'114', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'89A63C82-8938-401D-78BB-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:39:10.9981737', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'26', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8CAD4FFA-EF36-483F-78BC-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:39:23.5934470', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'115', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'21522284-985D-47B3-78BD-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:39:24.3800673', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'25', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'51A50DB4-D0A7-407C-78BE-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:39:36.5999424', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'131', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C5C7CC79-4698-40C1-78BF-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:39:44.4719898', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'20', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5FE9719B-9BAE-45E1-78C0-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:39:45.3174968', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'25', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'6AAF52DE-0895-40CE-78C1-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:39:46.5719013', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'14', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'331445CD-4E01-46F9-78C2-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:39:47.4033730', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'26', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'48E8B4CB-0CAF-4738-78C3-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:39:49.3078213', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'128', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'FB25EB92-40AE-46C0-78C4-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:39:50.2623333', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'27', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'758E3BF8-9CEC-4CC1-78C5-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:39:51.5139573', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'12', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1963A5EC-5AFE-43D4-78C6-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:39:52.3293478', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'25', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8B36199E-D74F-431B-78C7-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:40:07.2222510', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'105', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E3A88E73-31A6-4E62-78C8-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:40:08.0688457', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'29', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2F113EE5-6FF1-4F53-78C9-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:40:49.0432969', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'171', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B9D91A06-EA1B-4F98-78CA-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:40:49.8368190', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'28', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'BDFB39BB-B71E-47FC-78CB-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:41:18.4381274', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'150', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'25CB7DBA-BE5C-4212-78CC-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:41:19.5928959', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'40', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'BFEFF7AF-FF50-47D7-78CD-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:41:21.4408678', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'23', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F5331C88-0808-4D33-78CE-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:41:21.8224293', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'37', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'DDF98757-815C-43E0-78CF-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:42:07.4450995', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'120', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'59B5CD1F-093B-4B6E-78D0-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:42:10.6777301', NULL, NULL, N'/api/admin/SysOrganization/sysOrganizationTree', N'0.0.0.1', N'', N'{}', N'', N'64', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'组织机构', N'查看组织架构树')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'179BFC18-A6C7-4DDA-78D1-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:42:10.6984468', NULL, NULL, N'/api/admin/SysUser/findList/10/1', N'0.0.0.1', N'', N'{}', N'', N'102', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查看数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'615D1CE2-72D2-4988-78D2-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:44:41.9388281', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'144', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'20C63D92-BC26-4B68-78D3-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:44:43.1855830', NULL, NULL, N'/api/admin/SysOrganization/sysOrganizationTree', N'0.0.0.1', N'', N'{}', N'', N'101', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'组织机构', N'查看组织架构树')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'EF1BF5F3-4A52-4A55-78D4-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:44:43.2557543', NULL, NULL, N'/api/admin/SysUser/findList/10/1', N'0.0.0.1', N'', N'{}', N'', N'129', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查看数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'57063152-6EE7-4135-78D5-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:53:19.9671761', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'261', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9C47314F-8069-4307-78D6-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:53:27.5607394', NULL, NULL, N'/api/admin/SysOrganization/sysOrganizationTree', N'0.0.0.1', N'', N'{}', N'', N'59', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'组织机构', N'查看组织架构树')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'AAD35401-6D36-4884-78D7-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 16:53:27.5905051', NULL, NULL, N'/api/admin/SysUser/findList/10/1', N'0.0.0.1', N'', N'{}', N'', N'89', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查看数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'DB795F35-11E5-4019-78D8-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:04:29.6476434', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'260', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2B2B71AB-4861-453B-78D9-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:04:30.8290704', NULL, NULL, N'/api/admin/SysOrganization/sysOrganizationTree', N'0.0.0.1', N'', N'{}', N'', N'128', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'组织机构', N'查看组织架构树')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C668A221-EBD4-4827-78DA-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:04:30.8652192', NULL, NULL, N'/api/admin/SysUser/findList/10/1', N'0.0.0.1', N'', N'{}', N'', N'173', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查看数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B1F6BBBF-6D1E-4A36-78DB-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:04:36.1765745', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'14', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'051749AE-C6F7-4DA2-78DC-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:04:37.1878810', NULL, NULL, N'/api/admin/SysOrganization/sysOrganizationTree', N'0.0.0.1', N'', N'{}', N'', N'53', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'组织机构', N'查看组织架构树')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'37832898-DB59-49A8-78DD-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:04:37.2127897', NULL, NULL, N'/api/admin/SysUser/findList/10/1', N'0.0.0.1', N'', N'{}', N'', N'72', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查看数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'03EB1DDF-D04E-4338-78DE-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:04:38.7817287', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'20', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'4D275A86-2DBE-41F0-78DF-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:04:39.5662299', NULL, NULL, N'/api/admin/SysOrganization/sysOrganizationTree', N'0.0.0.1', N'', N'{}', N'', N'46', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'组织机构', N'查看组织架构树')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'BF4DA784-A775-4B2D-78E0-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:04:39.5693451', NULL, NULL, N'/api/admin/SysUser/findList/10/1', N'0.0.0.1', N'', N'{}', N'', N'57', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查看数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'973883C4-BC4C-4033-78E1-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:04:45.0361085', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'117', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3A490777-74D6-4C28-78E2-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:04:45.9327802', NULL, NULL, N'/api/admin/SysOrganization/sysOrganizationTree', N'0.0.0.1', N'', N'{}', N'', N'45', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'组织机构', N'查看组织架构树')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E602639F-10DE-4EFD-78E3-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:04:45.9399079', NULL, NULL, N'/api/admin/SysUser/findList/10/1', N'0.0.0.1', N'', N'{}', N'', N'58', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查看数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2F24DD41-2DFF-4D98-78E4-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:04:48.8583182', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'16', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'89A4AD8D-0CC1-4D6A-78E5-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:04:49.7124045', NULL, NULL, N'/api/admin/SysOrganization/sysOrganizationTree', N'0.0.0.1', N'', N'{}', N'', N'64', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'组织机构', N'查看组织架构树')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'90EEA023-DE91-4E0C-78E6-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:04:49.7178650', NULL, NULL, N'/api/admin/SysUser/findList/10/1', N'0.0.0.1', N'', N'{}', N'', N'62', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查看数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'491F3C84-C0C1-4DBD-78E7-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:04:50.6788405', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'14', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'773C5F26-9980-4A17-78E8-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:04:51.5387793', NULL, NULL, N'/api/admin/SysUser/findList/10/1', N'0.0.0.1', N'', N'{}', N'', N'62', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查看数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'92DF2388-53A7-4C7F-78E9-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:04:51.5461515', NULL, NULL, N'/api/admin/SysOrganization/sysOrganizationTree', N'0.0.0.1', N'', N'{}', N'', N'69', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'组织机构', N'查看组织架构树')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'6168ED13-19D4-418C-78EA-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:04:55.8546502', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'104', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'83109880-3ABB-418D-78EB-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:04:56.7587142', NULL, NULL, N'/api/admin/SysOrganization/sysOrganizationTree', N'0.0.0.1', N'', N'{}', N'', N'50', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'组织机构', N'查看组织架构树')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'73853754-EF7C-46E0-78EC-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:04:56.7678496', NULL, NULL, N'/api/admin/SysUser/findList/10/1', N'0.0.0.1', N'', N'{}', N'', N'55', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查看数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'90AA3693-81ED-480D-78ED-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:04:58.1655626', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'17', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D59D7DA4-B5FB-4EC0-78EE-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:04:58.9674928', NULL, NULL, N'/api/admin/SysOrganization/sysOrganizationTree', N'0.0.0.1', N'', N'{}', N'', N'49', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'组织机构', N'查看组织架构树')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'137F9CDE-C32E-437D-78EF-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:04:58.9781847', NULL, NULL, N'/api/admin/SysUser/findList/10/1', N'0.0.0.1', N'', N'{}', N'', N'59', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查看数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'11EF3EAC-DB85-4E6E-78F0-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:05:02.1080871', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'17', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'49E793B3-ED81-439D-78F1-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:05:02.9249597', NULL, NULL, N'/api/admin/SysOrganization/sysOrganizationTree', N'0.0.0.1', N'', N'{}', N'', N'42', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'组织机构', N'查看组织架构树')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B2B72636-D4E2-4CBA-78F2-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:05:02.9481804', NULL, NULL, N'/api/admin/SysUser/findList/10/1', N'0.0.0.1', N'', N'{}', N'', N'46', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查看数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E9EAD9DF-414B-4B83-78F3-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:05:07.9856256', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'117', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8058F15F-8CBD-4BAC-78F4-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:05:08.9035864', NULL, NULL, N'/api/admin/SysOrganization/sysOrganizationTree', N'0.0.0.1', N'', N'{}', N'', N'49', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'组织机构', N'查看组织架构树')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7F3190DC-7EDB-4F13-78F5-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:05:08.9213059', NULL, NULL, N'/api/admin/SysUser/findList/10/1', N'0.0.0.1', N'', N'{}', N'', N'55', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查看数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2F3D7B61-0A2A-4C35-78F6-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:05:09.5721232', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'103', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7F92A8FC-907B-4435-78F7-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:05:10.4238004', NULL, NULL, N'/api/admin/SysOrganization/sysOrganizationTree', N'0.0.0.1', N'', N'{}', N'', N'42', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'组织机构', N'查看组织架构树')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'CE1EED97-522C-4ABA-78F8-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:05:10.4344163', NULL, NULL, N'/api/admin/SysUser/findList/10/1', N'0.0.0.1', N'', N'{}', N'', N'51', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查看数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'410759A1-FF09-4416-78F9-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:05:12.5575715', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'14', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7B077301-97CA-42A6-78FA-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:05:13.3318891', NULL, NULL, N'/api/admin/SysOrganization/sysOrganizationTree', N'0.0.0.1', N'', N'{}', N'', N'64', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'组织机构', N'查看组织架构树')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'602F04AF-2B69-4402-78FB-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:05:13.3519731', NULL, NULL, N'/api/admin/SysUser/findList/10/1', N'0.0.0.1', N'', N'{}', N'', N'80', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查看数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1F788359-A1A6-43DD-78FC-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:05:45.0906687', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'156', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'81E53ADA-6178-4FA6-78FD-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:05:46.2723230', NULL, NULL, N'/api/admin/SysOrganization/sysOrganizationTree', N'0.0.0.1', N'', N'{}', N'', N'41', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'组织机构', N'查看组织架构树')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'052E53DE-AAD9-41CF-78FE-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:05:46.3527211', NULL, NULL, N'/api/admin/SysUser/findList/10/1', N'0.0.0.1', N'', N'{}', N'', N'132', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查看数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'FF8E3F7D-AC29-45BE-78FF-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:06:01.3854360', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'106', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D34DEA11-5426-46B6-7900-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:06:02.3343318', NULL, NULL, N'/api/admin/SysOrganization/sysOrganizationTree', N'0.0.0.1', N'', N'{}', N'', N'45', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'组织机构', N'查看组织架构树')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F5BB52BB-A7C2-4491-7901-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:06:02.3393346', NULL, NULL, N'/api/admin/SysUser/findList/10/1', N'0.0.0.1', N'', N'{}', N'', N'57', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查看数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'DA454ED6-937C-4201-7902-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:06:29.5797402', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'213', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'75EBA611-8FD1-495B-7903-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:06:30.8359942', NULL, NULL, N'/api/admin/SysOrganization/sysOrganizationTree', N'0.0.0.1', N'', N'{}', N'', N'45', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'组织机构', N'查看组织架构树')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B28DBF8F-62CA-4512-7904-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:06:30.8509747', NULL, NULL, N'/api/admin/SysUser/findList/10/1', N'0.0.0.1', N'', N'{}', N'', N'98', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查看数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'77BFE0D5-FBAC-4271-7905-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:06:33.4729669', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'15', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'54C1527A-7639-43C4-7906-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:06:41.5834757', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'108', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'18490736-8739-45E4-7907-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:06:42.5565049', NULL, NULL, N'/api/admin/SysOrganization/sysOrganizationTree', N'0.0.0.1', N'', N'{}', N'', N'43', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'组织机构', N'查看组织架构树')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D106B5CB-E6F5-466C-7908-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:06:42.5774724', NULL, NULL, N'/api/admin/SysUser/findList/10/1', N'0.0.0.1', N'', N'{}', N'', N'66', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查看数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'FB5D78B4-3014-4CD7-7909-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:20:51.1281548', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'135', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1B2863EA-3FD4-419E-790A-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:20:52.2880260', NULL, NULL, N'/api/admin/SysOrganization/sysOrganizationTree', N'0.0.0.1', N'', N'{}', N'', N'53', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'组织机构', N'查看组织架构树')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'AF1D229D-4E81-486B-790B-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:20:52.3104731', NULL, NULL, N'/api/admin/SysUser/findList/10/1', N'0.0.0.1', N'', N'{}', N'', N'105', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查看数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0E2A9116-1BAB-40A3-790C-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:20:55.0711921', NULL, NULL, N'/api/admin/SysOrganization/sysOrganizationTree', N'0.0.0.1', N'', N'{}', N'', N'95', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'组织机构', N'查看组织架构树')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8FE698DD-5AAE-4E6D-790D-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:20:55.0913510', NULL, NULL, N'/api/admin/SysUser/findForm/3739f349-7995-4c63-62d8-08da00e3d8a0', N'0.0.0.1', N'', N'', N'', N'74', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查询数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'554470DB-C0CA-457B-790E-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:20:58.1879684', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'33', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'FA343CAE-7ECB-4A58-790F-08DADCE23174', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:21:01.8597932', NULL, NULL, N'/api/admin/SysMenu/findForm/11', N'0.0.0.1', N'', N'', N'', N'44', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'007D0111-6092-463A-39B9-08DADCEB7553', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:21:47.2815548', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'81', N'Edge108', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D83397D3-B71A-4438-39BA-08DADCEB7553', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:21:47.6744541', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'282', N'Edge108', N'Windows10', NULL, N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'85C4F133-E011-4D7F-39BB-08DADCEB7553', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:22:29.1589777', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'662', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'128320A7-D9AF-4A70-39BC-08DADCEB7553', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:22:30.1422159', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'120', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1767BD48-8E26-4F5D-39BD-08DADCEB7553', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 17:22:33.9493882', NULL, NULL, N'/api/admin/SysMenu/findForm/11', N'0.0.0.1', N'', N'', N'', N'115', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8CD4D55D-5851-4803-B4F1-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 20:29:46.5684851', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'82', N'Edge108', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'61DB6E4B-8DCF-49B3-B4F2-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 20:29:47.8681734', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'360', N'Edge108', N'Windows10', NULL, N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'ACDAC891-D59B-495D-B4F3-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 20:30:40.6542728', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'18', N'Edge108', N'Windows10', NULL, N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1B8B2905-EE77-49CB-B4F4-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 20:30:43.0437483', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'25', N'Edge108', N'Windows10', NULL, N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'904FA88A-1619-4582-B4F5-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 20:33:52.1035134', NULL, NULL, N'/api/account/check', N'0.0.0.1', N'', N'{"userName":"admin","userPassword":"123456"}', N'', N'944', N'Edge108', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F981F603-0063-4D18-B4F6-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 20:33:53.2477253', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'619', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'4A7DC381-468E-48A4-B4F7-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 20:34:18.4203569', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'287', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'00456E54-7C74-4BC0-B4F8-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 20:38:03.8478598', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'241', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'97C56311-72F0-47CC-B4F9-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 20:38:08.4434870', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{}', N'', N'341', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2D967CFE-B7B7-4632-B4FA-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 20:44:21.6207301', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'248', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'DAD14F75-CED3-407D-B4FB-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 20:44:23.9203733', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'17', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9CBD6F3B-6870-4618-B4FC-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 20:44:29.3409651', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'20', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A4788AC2-4C49-4E1C-B4FD-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 20:44:32.4596214', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'201', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1F457F92-5557-48F2-B4FE-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 20:44:33.4347121', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'148', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'589F2D2E-B747-442A-B4FF-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 20:45:00.5340116', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'230', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'54ED33C9-2E68-4FDB-B500-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 20:45:07.2992284', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'19', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'31464F8A-DC54-433D-B501-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 20:45:11.4064938', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'218', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C7DD761C-2621-4F22-B502-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 20:45:15.0200936', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'30', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9D8901D8-604F-4337-B503-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 20:45:17.7996255', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'25', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'696FDCB9-988C-4652-B504-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 20:45:27.9700945', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'133', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C9AF292C-BE07-4C3D-B505-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 20:45:29.4731448', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'21', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D8E76B58-C75E-4619-B506-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 20:45:31.7033307', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'21', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'BB6F22D0-2D1C-49DA-B507-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 20:45:56.5918470', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'259', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'53E4E7E1-E3F1-46F2-B508-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 20:46:02.5026681', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'31', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F3CD3935-6547-47CE-B509-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 20:46:04.3523031', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'22', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1A59DA3F-9966-4911-B50A-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 20:46:24.2980077', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'177', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'FE4D6AFC-212E-44C8-B50B-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 20:46:26.3151046', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'31', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1874E02F-BA7D-40B5-B50C-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 20:46:27.6873663', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'160', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'6819B729-B692-4B71-B50D-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 20:46:36.4986972', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'29', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8BDA607D-16E9-4E14-B50E-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 20:46:39.4469153', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'158', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'10DBE8A1-7F6A-4D60-B50F-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 20:46:42.8478732', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'22', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8FBC9249-9FE7-4AAE-B510-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 20:46:47.6515894', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'19', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8B4BEF02-812B-4BFA-B511-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 20:48:42.2489012', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'196', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'77EDB27A-DD63-4243-B512-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 20:48:52.2215251', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'23', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'89818F25-B13A-4DA1-B513-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 20:48:54.2543499', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'162', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F5720FDD-7911-456A-B514-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 20:48:56.6671999', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'21', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'6804D2EA-C51C-4C1E-B515-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 20:49:03.1537959', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'28', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C8494FCF-E932-468E-B516-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 20:49:05.7431105', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'211', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'AA69ADD3-CE95-4800-B517-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:02:22.9403015', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'227', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'BD1A2628-6A3B-4318-B518-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:02:28.3926222', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'24', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2AE73D2A-062B-40FC-B519-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:02:39.7931010', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'178', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E2F404E7-F711-4A2A-B51A-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:02:50.5188043', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'413', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C375D577-D9E9-4199-B51B-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:02:58.2237068', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'18', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'37CFE231-B328-47BA-B51C-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:03:01.0440408', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'221', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'287027E7-F7F1-4768-B51D-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:47:14.5022478', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'187', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F29D331C-7CFF-42B1-B51E-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:47:15.3381728', NULL, NULL, N'/api/admin/SysOrganization/sysOrganizationTree', N'0.0.0.1', N'', N'{}', N'', N'137', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'组织机构', N'查看组织架构树')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'BFC59C98-4B20-4459-B51F-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:47:15.4170574', NULL, NULL, N'/api/admin/SysUser/findList/10/1', N'0.0.0.1', N'', N'{}', N'', N'233', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查看数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'EF1C67B2-E553-464D-B520-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:47:19.1685997', NULL, NULL, N'/api/admin/SysRole/findList/10/1', N'0.0.0.1', N'', N'{}', N'', N'127', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'角色', N'查看表格')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A402969C-9D7E-4A72-B521-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:52:46.7203788', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'174', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'863EBA5A-FD4C-44D6-B522-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:52:48.1538926', NULL, NULL, N'/api/admin/SysRole/findList/10/1', N'0.0.0.1', N'', N'{}', N'', N'71', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'角色', N'查看表格')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1C8FAC0A-DAD0-48DA-B523-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:52:51.7165533', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'29', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E80AA972-182A-4AAC-B524-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:52:52.3688530', NULL, NULL, N'/api/admin/SysRole/findList/10/1', N'0.0.0.1', N'', N'{}', N'', N'86', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'角色', N'查看表格')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'29AC650E-2FAF-4BF2-B525-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:53:25.7653481', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'202', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'48B899A0-9C09-44B9-B526-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:53:27.3150809', NULL, NULL, N'/api/admin/SysRole/findList/10/1', N'0.0.0.1', N'', N'{}', N'', N'43', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'角色', N'查看表格')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'57525761-8E28-4D47-B527-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:53:31.6364427', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'24', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'15EA22C6-403E-4A2E-B528-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:53:32.1422336', NULL, NULL, N'/api/admin/SysRole/findList/10/1', N'0.0.0.1', N'', N'{}', N'', N'75', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'角色', N'查看表格')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A178F7EA-3E1A-41CE-B529-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:53:58.4918356', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'200', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'EF98CDCE-737A-4391-B52A-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:54:02.6018751', NULL, NULL, N'/api/admin/SysOrganization/sysOrganizationTree', N'0.0.0.1', N'', N'{}', N'', N'79', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'组织机构', N'查看组织架构树')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'815C57E0-C04A-4F8B-B52B-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:54:02.6112758', NULL, NULL, N'/api/admin/SysUser/findList/10/1', N'0.0.0.1', N'', N'{}', N'', N'100', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查看数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'ED347534-8A8F-4202-B52C-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:54:05.9359947', NULL, NULL, N'/api/admin/SysOrganization/sysOrganizationTree', N'0.0.0.1', N'', N'{}', N'', N'77', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'组织机构', N'查看组织架构树')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'6064D146-DF71-4E46-B52D-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:54:06.0808613', NULL, NULL, N'/api/admin/SysUser/findForm/a3f9784c-5f00-4ec9-62d9-08da00e3d8a0', N'0.0.0.1', N'', N'', N'', N'156', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查询数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E7B4678C-3A37-4CC8-B52E-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:54:58.2671880', NULL, NULL, N'/api/admin/SysRole/findList/10/1', N'0.0.0.1', N'', N'{}', N'', N'51', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'角色', N'查看表格')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F19C239D-F5F2-4AF3-B52F-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:54:59.6320231', NULL, NULL, N'/api/admin/SysFunction/findList/10/1', N'0.0.0.1', N'', N'{}', N'', N'67', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'功能', N'查看数据列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D7940B59-0039-4386-B530-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:55:01.2665139', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'86', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D31244D3-1612-470C-B531-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:55:04.2627619', NULL, NULL, N'/api/admin/SysPost/findList/10/1', N'0.0.0.1', N'', N'{}', N'', N'61', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'岗位', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'ECAF11F9-09C6-4BC3-B532-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:55:05.7143471', NULL, NULL, N'/api/admin/SysOrganization/findList', N'0.0.0.1', N'', N'{}', N'', N'48', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'组织机构', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'BCDC6E70-5CC9-4EDF-B533-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:55:07.0248553', NULL, NULL, N'/api/admin/SysDictionary/findList', N'0.0.0.1', N'', N'{}', N'', N'74', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'数据字典', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'EBF21901-E320-44F4-B534-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:55:08.6655250', NULL, NULL, N'/api/admin/SysOperationLog/findList/10/1', N'0.0.0.1', N'', N'{"rangeTime":[]}', N'', N'75', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'操作日志', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'6DFEB363-2FF1-4B5E-B535-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:55:28.5308068', NULL, NULL, N'/api/admin/SysOperationLog/findForm/d31244d3-1612-470c-b531-08dadd05b84d', N'0.0.0.1', N'', N'', N'', N'45', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'操作日志', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'65E6F028-3851-458A-B536-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:55:31.2674712', NULL, NULL, N'/api/admin/SysOperationLog/findForm/d31244d3-1612-470c-b531-08dadd05b84d', N'0.0.0.1', N'', N'', N'', N'27', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'操作日志', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C9840378-F0A5-4022-B537-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:55:50.8838885', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'196', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1A31AD64-5C41-45C8-B538-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:55:51.9693926', NULL, NULL, N'/api/admin/SysOrganization/sysOrganizationTree', N'0.0.0.1', N'', N'{}', N'', N'96', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'组织机构', N'查看组织架构树')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0D9BFFBF-AF9B-45B2-B539-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:55:52.0119774', NULL, NULL, N'/api/admin/SysUser/findList/10/1', N'0.0.0.1', N'', N'{}', N'', N'125', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查看数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9B156C76-9B3B-4D02-B53A-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:56:08.7797799', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'147', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'452F46F8-3CF8-4E21-B53B-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:56:09.6616393', NULL, NULL, N'/api/admin/SysOrganization/sysOrganizationTree', N'0.0.0.1', N'', N'{}', N'', N'75', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'组织机构', N'查看组织架构树')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'EF934B38-B66A-4CAC-B53C-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:56:09.7009468', NULL, NULL, N'/api/admin/SysUser/findList/10/1', N'0.0.0.1', N'', N'{}', N'', N'104', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查看数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B8378035-D969-4A58-B53D-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:56:37.2725969', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'33', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'BB5275AF-8F19-4EDC-B53E-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:56:42.2052049', NULL, NULL, N'/api/admin/SysMenu/findForm/11', N'0.0.0.1', N'', N'', N'', N'81', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'AEEA98DB-D8D9-4D77-B53F-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:57:11.4030324', NULL, NULL, N'/api/admin/SysMenu/update', N'0.0.0.1', N'', N'{"id":11,"form":{"levelCode":"1.11","number":70,"name":"跳转外部地址","componentName":"","url":"","router":"","jumpUrl":"","icon":"RadarChartOutlined","parentId":1,"show":true,"close":true,"keepAlive":true,"state":true,"type":2,"mode":2,"moduleUrl":"https://www.baidu.com","id":11,"lastModifierUserId":null,"lastModificationTime":"2022-03-04 12:26:49","creatorUserId":null,"creationTime":"2021-08-05 21:51:12"},"allFunctions":[{"number":10,"name":"显示","byName":"Display","remark":"Display","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"c9518758-b2e1-4f51-b517-5282e273889c"},{"number":20,"name":"添加","byName":"Insert","remark":"Insert","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"bffefb1c-8988-4ddf-b4ac-81c2b30e80cd"},{"number":30,"name":"修改","byName":"Update","remark":"Update","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"e7ef2a05-8317-41c3-b588-99519fe88bf9"},{"number":40,"name":"删除","byName":"Delete","remark":"Delete","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"9c388461-2704-4c5e-a729-72c17e9018e1"},{"number":50,"name":"保存","byName":"Save","remark":"Save","lastModifierUserId":"0198459e-2034-4533-b843-5d227ad20740","lastModificationTime":"2022-09-28 22:12:02","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"383e7ee2-7690-46ac-9230-65155c84aa30"},{"number":60,"name":"检索","byName":"Search","remark":"Search","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"f27ecb0a-197d-47b1-b243-59a8c71302bf"},{"number":70,"name":"导出","byName":"Export","remark":"Export","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"2401f4d0-60b0-4e2e-903f-84c603373572"},{"number":80,"name":"打印","byName":"Print","remark":"Print","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2022-06-16 17:28:00","id":"b6fd5425-504a-46a9-993b-2f8dc9158eb8"}],"menuFunctionList":[{"number":10,"menuId":11,"functionCode":"Display","functionName":"显示","remark":"Display","lastModifierUserId":null,"lastModificationTime":"2022-03-04 15:24:53","creatorUserId":null,"creationTime":"2022-03-04 15:24:53","id":"3bc0e68f-d03d-4e99-0f26-08d9fdad00ab"}]}', N'', N'229', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'编辑表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'65FA1BE3-16F1-4163-B540-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:57:11.6954254', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'66', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'12B27B34-6BEB-4666-B541-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:57:14.7078319', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'134', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'4402DF93-CFED-4376-B542-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:57:15.2317464', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'54', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'73DFD627-1C36-4CF4-B543-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:58:37.9599824', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'108', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9247C13F-9D79-4FDD-B544-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:58:51.8957856', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'145', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'32AE1471-6BDC-4A81-B545-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:58:52.8519329', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'43', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'FEFB5E9A-2895-4EC8-B546-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:59:34.0492412', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'214', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'790D08FA-6CB7-484F-B547-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:59:35.5825298', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'23', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F3941882-65B4-4615-B548-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:59:36.2039352', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'66', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'78B3DCBE-521F-49F8-B549-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 21:59:59.2459263', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'165', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0F6AC85A-1418-42D3-B54A-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:00:00.9343466', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'31', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F5EF53ED-CF71-4481-B54B-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:00:13.9349392', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'234', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1EDF26F7-C34C-458E-B54C-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:00:15.6555816', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'26', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'FEB8D11E-503B-456C-B54D-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:00:19.9492785', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'27', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3881A025-020F-4DA0-B54E-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:00:21.5255316', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'40', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'360886B2-05F9-4289-B54F-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:00:26.7457931', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'189', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'DF5D11E5-6C83-4957-B550-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:00:28.0456610', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'28', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'BF3639AF-8ADC-4A53-B551-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:00:29.6034510', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'18', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A12EC3F0-E2D8-4025-B552-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:00:30.8167076', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'34', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'21254A8C-74BE-4167-B553-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:00:40.1641262', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'222', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A55A5F1A-B25D-41A1-B554-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:00:41.5870647', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'50', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'4FF88F18-6A3D-4B15-B555-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:00:44.2097140', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'20', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'79B09A19-4386-41A1-B556-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:00:45.6931089', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'47', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'463D7636-697F-41B7-B557-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:00:48.4098725', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'21', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'FE873B6D-8131-40E6-B558-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:00:49.7762902', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'37', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7394AA4C-0729-4CB8-B559-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:00:52.6941576', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'196', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B6D7C52B-8066-4B7C-B55A-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:00:53.9311290', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'33', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7A5B55BA-98F8-4153-B55B-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:00:55.4650544', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'25', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C7FA4565-5134-47FE-B55C-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:00:56.8682105', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'64', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'28B79EA0-D8C6-4C29-B55D-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:00:58.1980838', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'24', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E4F1771B-6EDA-4B6C-B55E-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:00:58.7070589', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'71', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'EE695775-DED5-4AF9-B55F-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:01:20.1008391', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'182', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F33B00E9-ADD2-4C45-B560-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:01:21.6800547', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'45', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'37335713-D529-4AB2-B561-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:02:08.3558340', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'163', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1486B550-FB4B-4E35-B562-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:02:10.9838097', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'21', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'335422A3-7C64-4767-B563-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:02:19.1437451', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'144', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5736C2AD-DB02-46CA-B564-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:02:20.7671448', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'16', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'53AEBC98-D17A-4E0A-B565-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:02:21.3423003', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'27', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7EEDF3F4-E2EE-400F-B566-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:02:22.7857439', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'152', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D82723C1-057D-4FC6-B567-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:02:24.0379660', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'35', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'AD9F357B-4127-4063-B568-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:02:26.6729155', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'19', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E0177074-AB3C-4A31-B569-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:02:27.9879141', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'41', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'296A1C9E-9FD5-4207-B56A-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:02:42.9720904', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'317', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'07024268-E589-4279-B56B-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:02:45.6306367', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'220', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'48E3B8C5-E950-494D-B56C-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:02:50.9065642', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'150', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'689E3710-32EC-4075-B56D-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:02:52.1270121', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'166', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8F9A63C7-AE57-4785-B56E-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:02:53.2170493', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'29', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0134723B-A779-44ED-B56F-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:02:54.5039893', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'114', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3AC7816E-05F1-49C4-B570-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:02:55.7598995', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'35', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'34430294-9E12-49E3-B571-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:03:00.6176669', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'19', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0821DA2B-BA25-4815-B572-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:03:02.0017899', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'52', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3E7170D6-6A50-4117-B573-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:03:02.8206874', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'24', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'CDA8F418-B78C-4D7A-B574-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:03:03.4173395', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'61', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5F29615A-46BF-4F39-B575-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:03:53.8755465', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'186', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'114A5260-7535-4B39-B576-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:03:55.6933188', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'32', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B095FCDD-B844-48A4-B577-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:06:23.7597472', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'220', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'FC8C9C25-8C99-444B-B578-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:06:25.2607256', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'71', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9CCB3800-F572-478D-B579-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:07:15.2404511', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'160', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3F3BF76F-9699-4726-B57A-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:08:34.2536071', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'267', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'EDE15C1A-C3F0-42A2-B57B-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:09:26.3328468', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'255', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'913AB895-5A6D-43F6-B57C-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:10:31.9216937', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'87', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7F6B740A-E066-4BC7-B57D-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:14:44.3418488', NULL, NULL, N'/api/admin/SysMenu/findForm/11', N'0.0.0.1', N'', N'', N'', N'39', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'91737D14-C234-4D75-B57E-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:17:39.5577744', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'234', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0445A92F-6397-47B6-B57F-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:17:41.1883263', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'43', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'08D31B1D-034E-413A-B580-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:18:42.6220476', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'196', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'79B30448-FC30-40A2-B581-08DADD05B84D', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 22:18:44.2621144', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'111', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'296357FC-4A4C-47BF-EB20-08DADD1FC1BD', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 23:36:09.2806584', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'80', N'Edge108', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2903AED3-A330-418A-EB21-08DADD1FC1BD', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 23:36:13.7489679', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'1350', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E6ADE806-B435-4E35-EB22-08DADD1FC1BD', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 23:36:35.9252613', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'270', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'80B302A9-3D26-4527-EB23-08DADD1FC1BD', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 23:37:20.9117060', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'292', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A7909285-22DD-4EB1-EB24-08DADD1FC1BD', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 23:37:23.6751994', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'28', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'65BE7829-B1F7-485C-EB25-08DADD1FC1BD', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 23:37:28.9067540', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'25', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'AD0A169B-174B-488F-EB26-08DADD1FC1BD', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 23:37:31.2889046', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'212', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'EBF2FABE-2F57-4F8A-EB27-08DADD1FC1BD', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 23:37:42.4863460', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'290', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B5C98012-784C-44A6-EB28-08DADD1FC1BD', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 23:37:45.3262447', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'17', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'43A03F2F-6100-4092-EB29-08DADD1FC1BD', N'00000000-0000-0000-0000-000000000000', N'2022-12-13 23:45:44.0678851', NULL, NULL, N'/client/index.html', N'0.0.0.1', N'', N'', N'', N'0', N'Edge108', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'361C3506-DD03-4B23-8884-08DADE655D58', N'00000000-0000-0000-0000-000000000000', N'2022-12-15 14:26:56.7822185', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'96', N'Edge108', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'10B6349A-A122-4D0A-8885-08DADE655D58', N'00000000-0000-0000-0000-000000000000', N'2022-12-15 14:26:58.2522445', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'390', N'Edge108', N'Windows10', NULL, N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'05103721-AA02-471A-8886-08DADE655D58', N'00000000-0000-0000-0000-000000000000', N'2022-12-15 14:27:01.3247572', NULL, NULL, N'/api/account/check', N'0.0.0.1', N'', N'{"userName":"admin","userPassword":"123456"}', N'', N'1146', N'Edge108', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D4947798-074A-4DB8-8887-08DADE655D58', N'00000000-0000-0000-0000-000000000000', N'2022-12-15 14:27:02.5498936', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'687', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D4DF1B52-DB43-4663-8888-08DADE655D58', N'00000000-0000-0000-0000-000000000000', N'2022-12-15 14:27:21.6077106', NULL, NULL, N'/api/admin/SysMenu/FindList/1/1', N'0.0.0.1', N'', N'{
  "creatorUserId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
  "creationTime": "2022-12-15T06:27:17.785Z",
  "lastModifierUserId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
  "lastModificationTime": "2022-12-15T06:27:17.785Z",
  "id": 0,
  "levelCode": "string",
  "number": 0,
  "name": "string",
  "componentName": "string",
  "url": "string",
  "router": "string",
  "jumpUrl": "string",
  "icon": "string",
  "parentId": 0,
  "show": true,
  "close": true,
  "keepAlive": true,
  "state": true,
  "type": 1,
  "mode": 1,
  "moduleUrl": "string"
}', N'', N'30', N'Edge108', N'Windows10', NULL, N'菜单', N'查询列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7135A749-E0C7-4CF7-8889-08DADE655D58', N'00000000-0000-0000-0000-000000000000', N'2022-12-15 14:29:41.4552537', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'290', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'57205D2E-FD28-4F91-888A-08DADE655D58', N'00000000-0000-0000-0000-000000000000', N'2022-12-15 14:32:19.1293020', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'165', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8B01395B-6A49-48D3-90F4-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 14:51:27.6379176', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'66', N'Edge108', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'4A87B33B-468D-4FD6-90F5-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 14:51:28.5393729', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'280', N'Edge108', N'Windows10', NULL, N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E2A1E175-8F00-493C-90F6-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 14:51:48.7795753', NULL, NULL, N'/api/account/check', N'0.0.0.1', N'', N'{"userName":"admin","userPassword":"123456"}', N'', N'984', N'Edge108', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'DA45823C-CC5D-448A-90F7-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 14:51:49.7519603', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'497', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'6BB05C66-F4DB-45E6-90F8-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 14:52:01.1280995', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'18', N'Edge108', N'Windows10', NULL, N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2C174DC7-C6B9-4628-90F9-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 14:52:02.9904460', NULL, NULL, N'/api/account/check', N'0.0.0.1', N'', N'{"userName":"admin","userPassword":"123456"}', N'', N'36', N'Edge108', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'32AA871B-2B4E-4E29-90FA-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 14:52:03.3777469', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'281', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'37C31D2E-F765-4393-90FB-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 14:52:11.4223129', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'74', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C6510BDF-A626-46EF-90FC-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 14:52:18.4628556', NULL, NULL, N'/api/admin/SysMenu/findForm/11', N'0.0.0.1', N'', N'', N'', N'104', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1B628926-334D-4F5F-90FD-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 14:53:11.9634033', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'246', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'AB6C05F3-FB6B-45F1-90FE-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 14:53:13.8310774', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'38', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B86EC9D6-8071-434A-90FF-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 14:54:00.1994952', NULL, NULL, N'/api/admin/SysMenu/findForm/11', N'0.0.0.1', N'', N'', N'', N'35', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'CD19E53B-98CC-4BD3-9100-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 14:54:50.8555418', NULL, NULL, N'/api/admin/SysMenu/update', N'0.0.0.1', N'', N'{"id":11,"form":{"levelCode":"1.11","number":70,"name":"微前端","componentName":"Iframe","url":"views/base/Iframe.vue","router":"/iframe","jumpUrl":"","icon":"RadarChartOutlined","parentId":1,"show":true,"close":true,"keepAlive":true,"state":true,"type":2,"mode":1,"moduleUrl":"http://rapidscada.com.cn/#/","id":11,"lastModifierUserId":"0198459e-2034-4533-b843-5d227ad20740","lastModificationTime":"2022-12-13 21:57:11","creatorUserId":null,"creationTime":"2021-08-05 21:51:12"},"allFunctions":[{"number":10,"name":"显示","byName":"Display","remark":"Display","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"c9518758-b2e1-4f51-b517-5282e273889c"},{"number":20,"name":"添加","byName":"Insert","remark":"Insert","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"bffefb1c-8988-4ddf-b4ac-81c2b30e80cd"},{"number":30,"name":"修改","byName":"Update","remark":"Update","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"e7ef2a05-8317-41c3-b588-99519fe88bf9"},{"number":40,"name":"删除","byName":"Delete","remark":"Delete","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"9c388461-2704-4c5e-a729-72c17e9018e1"},{"number":50,"name":"保存","byName":"Save","remark":"Save","lastModifierUserId":"0198459e-2034-4533-b843-5d227ad20740","lastModificationTime":"2022-09-28 22:12:02","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"383e7ee2-7690-46ac-9230-65155c84aa30"},{"number":60,"name":"检索","byName":"Search","remark":"Search","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"f27ecb0a-197d-47b1-b243-59a8c71302bf"},{"number":70,"name":"导出","byName":"Export","remark":"Export","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"2401f4d0-60b0-4e2e-903f-84c603373572"},{"number":80,"name":"打印","byName":"Print","remark":"Print","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2022-06-16 17:28:00","id":"b6fd5425-504a-46a9-993b-2f8dc9158eb8"}],"menuFunctionList":[{"number":10,"menuId":11,"functionCode":"Display","functionName":"显示","remark":"Display","lastModifierUserId":null,"lastModificationTime":"2022-03-04 15:24:53","creatorUserId":"0198459e-2034-4533-b843-5d227ad20740","creationTime":"2022-12-13 21:57:11","id":"3bc0e68f-d03d-4e99-0f26-08d9fdad00ab"}]}', N'', N'308', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'编辑表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'677425EB-ACAB-4713-9101-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 14:54:51.1114968', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'41', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9218F833-DE09-4618-9102-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 14:54:55.6649480', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'154', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'20BE30D4-1151-4BC0-9103-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 14:54:57.1442306', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'65', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9BBE6495-0199-45CF-9104-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 14:58:30.5357380', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'264', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'6106AD62-E3E9-439A-9105-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 14:59:19.8758553', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'166', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'23E07D2C-4C12-46D1-9106-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 14:59:36.0869248', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'37', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2CCB2937-9AB8-498F-9107-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 14:59:43.5723776', NULL, NULL, N'/api/admin/SysMenu/findForm', N'0.0.0.1', N'', N'', N'', N'111', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'58EC2ABE-18F8-45AF-9108-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:00:53.3320241', NULL, NULL, N'/api/admin/SysMenu/create', N'0.0.0.1', N'', N'{"id":"","form":{"levelCode":null,"number":"80","name":"微前端2","componentName":"Iframe","url":"views/base/Iframe.vue","router":"/iframe123","jumpUrl":null,"icon":"AlipaySquareFilled","parentId":1,"show":true,"close":true,"keepAlive":true,"state":true,"type":2,"mode":1,"moduleUrl":"https://www.yuque.com/u378909/yidf7v/zx6egc","id":0,"lastModifierUserId":null,"lastModificationTime":null,"creatorUserId":null,"creationTime":"0001-01-01 00:00:00"},"allFunctions":[{"number":10,"name":"显示","byName":"Display","remark":"Display","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"c9518758-b2e1-4f51-b517-5282e273889c"},{"number":20,"name":"添加","byName":"Insert","remark":"Insert","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"bffefb1c-8988-4ddf-b4ac-81c2b30e80cd"},{"number":30,"name":"修改","byName":"Update","remark":"Update","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"e7ef2a05-8317-41c3-b588-99519fe88bf9"},{"number":40,"name":"删除","byName":"Delete","remark":"Delete","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"9c388461-2704-4c5e-a729-72c17e9018e1"},{"number":50,"name":"保存","byName":"Save","remark":"Save","lastModifierUserId":"0198459e-2034-4533-b843-5d227ad20740","lastModificationTime":"2022-09-28 22:12:02","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"383e7ee2-7690-46ac-9230-65155c84aa30"},{"number":60,"name":"检索","byName":"Search","remark":"Search","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"f27ecb0a-197d-47b1-b243-59a8c71302bf"},{"number":70,"name":"导出","byName":"Export","remark":"Export","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"2401f4d0-60b0-4e2e-903f-84c603373572"},{"number":80,"name":"打印","byName":"Print","remark":"Print","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2022-06-16 17:28:00","id":"b6fd5425-504a-46a9-993b-2f8dc9158eb8"}],"menuFunctionList":[{"number":10,"menuId":0,"functionCode":"Display","functionName":"显示","remark":"Display"},{"number":20,"menuId":0,"functionCode":"Insert","functionName":"添加","remark":"Insert"},{"number":30,"menuId":0,"functionCode":"Update","functionName":"修改","remark":"Update"},{"number":40,"menuId":0,"functionCode":"Delete","functionName":"删除","remark":"Delete"},{"number":50,"menuId":0,"functionCode":"Save","functionName":"保存","remark":"Save"},{"number":60,"menuId":0,"functionCode":"Search","functionName":"检索","remark":"Search"},{"number":70,"menuId":0,"functionCode":"Export","functionName":"导出","remark":"Export"},{"number":80,"menuId":0,"functionCode":"Print","functionName":"打印","remark":"Print"}]}', N'', N'133', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'创建表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E1564CCA-FE2B-43A0-9109-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:00:53.5634724', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'37', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'18A86A2A-4B80-4FC1-910A-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:00:56.2544429', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'136', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'FEE68DE9-723B-4737-910B-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:00:56.9133883', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'85', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A1B82653-EBD7-466C-910C-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:01:05.7619486', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'28', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'FAF0A5E4-E8A8-4160-910D-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:01:06.5063434', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'65', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9B1E9817-3F14-4CF9-910E-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:01:49.9329076', NULL, NULL, N'/api/admin/SysMenu/findForm/11', N'0.0.0.1', N'', N'', N'', N'61', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E9BB3EBF-A979-46F7-910F-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:01:59.1323818', NULL, NULL, N'/api/admin/SysMenu/findForm/37', N'0.0.0.1', N'', N'', N'', N'44', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E8597ABE-059A-430A-9110-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:02:02.4980953', NULL, NULL, N'/api/admin/SysMenu/update', N'0.0.0.1', N'', N'{"id":37,"form":{"levelCode":"1.37","number":80,"name":"微前端2","componentName":"Iframe123","url":"views/base/Iframe.vue","router":"/iframe123","jumpUrl":null,"icon":"AlipaySquareFilled","parentId":1,"show":true,"close":true,"keepAlive":true,"state":true,"type":2,"mode":1,"moduleUrl":"https://www.yuque.com/u378909/yidf7v/zx6egc","id":37,"lastModifierUserId":"0198459e-2034-4533-b843-5d227ad20740","lastModificationTime":"2022-12-16 15:00:53","creatorUserId":"0198459e-2034-4533-b843-5d227ad20740","creationTime":"2022-12-16 15:00:53"},"allFunctions":[{"number":10,"name":"显示","byName":"Display","remark":"Display","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"c9518758-b2e1-4f51-b517-5282e273889c"},{"number":20,"name":"添加","byName":"Insert","remark":"Insert","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"bffefb1c-8988-4ddf-b4ac-81c2b30e80cd"},{"number":30,"name":"修改","byName":"Update","remark":"Update","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"e7ef2a05-8317-41c3-b588-99519fe88bf9"},{"number":40,"name":"删除","byName":"Delete","remark":"Delete","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"9c388461-2704-4c5e-a729-72c17e9018e1"},{"number":50,"name":"保存","byName":"Save","remark":"Save","lastModifierUserId":"0198459e-2034-4533-b843-5d227ad20740","lastModificationTime":"2022-09-28 22:12:02","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"383e7ee2-7690-46ac-9230-65155c84aa30"},{"number":60,"name":"检索","byName":"Search","remark":"Search","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"f27ecb0a-197d-47b1-b243-59a8c71302bf"},{"number":70,"name":"导出","byName":"Export","remark":"Export","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"2401f4d0-60b0-4e2e-903f-84c603373572"},{"number":80,"name":"打印","byName":"Print","remark":"Print","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2022-06-16 17:28:00","id":"b6fd5425-504a-46a9-993b-2f8dc9158eb8"}],"menuFunctionList":[{"number":10,"menuId":37,"functionCode":"Display","functionName":"显示","remark":"Display","lastModifierUserId":null,"lastModificationTime":null,"creatorUserId":"0198459e-2034-4533-b843-5d227ad20740","creationTime":"2022-12-16 15:00:53","id":"9c9b41fd-db96-48cf-c07f-08dadf3345bd"},{"number":20,"menuId":37,"functionCode":"Insert","functionName":"添加","remark":"Insert","lastModifierUserId":null,"lastModificationTime":null,"creatorUserId":"0198459e-2034-4533-b843-5d227ad20740","creationTime":"2022-12-16 15:00:53","id":"47e1a6a3-4c89-46bf-c080-08dadf3345bd"},{"number":30,"menuId":37,"functionCode":"Update","functionName":"修改","remark":"Update","lastModifierUserId":null,"lastModificationTime":null,"creatorUserId":"0198459e-2034-4533-b843-5d227ad20740","creationTime":"2022-12-16 15:00:53","id":"d51a17af-163e-4a74-c081-08dadf3345bd"},{"number":40,"menuId":37,"functionCode":"Delete","functionName":"删除","remark":"Delete","lastModifierUserId":null,"lastModificationTime":null,"creatorUserId":"0198459e-2034-4533-b843-5d227ad20740","creationTime":"2022-12-16 15:00:53","id":"c6400925-a381-4679-c082-08dadf3345bd"},{"number":50,"menuId":37,"functionCode":"Save","functionName":"保存","remark":"Save","lastModifierUserId":null,"lastModificationTime":null,"creatorUserId":"0198459e-2034-4533-b843-5d227ad20740","creationTime":"2022-12-16 15:00:53","id":"216e9ad6-cc3f-4e72-c083-08dadf3345bd"},{"number":60,"menuId":37,"functionCode":"Search","functionName":"检索","remark":"Search","lastModifierUserId":null,"lastModificationTime":null,"creatorUserId":"0198459e-2034-4533-b843-5d227ad20740","creationTime":"2022-12-16 15:00:53","id":"4e7cd8df-2e35-4d5e-c084-08dadf3345bd"},{"number":70,"menuId":37,"functionCode":"Export","functionName":"导出","remark":"Export","lastModifierUserId":null,"lastModificationTime":null,"creatorUserId":"0198459e-2034-4533-b843-5d227ad20740","creationTime":"2022-12-16 15:00:53","id":"c981aa0b-d60e-4160-c085-08dadf3345bd"},{"number":80,"menuId":37,"functionCode":"Print","functionName":"打印","remark":"Print","lastModifierUserId":null,"lastModificationTime":null,"creatorUserId":"0198459e-2034-4533-b843-5d227ad20740","creationTime":"2022-12-16 15:00:53","id":"576f8a5d-1c47-47c9-c086-08dadf3345bd"}]}', N'', N'71', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'编辑表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B481F265-E5AE-4ACC-9111-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:02:02.7217978', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'36', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'BBF58193-5590-4C8A-9112-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:02:04.5345435', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'204', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C9FB9222-C36D-4D76-9113-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:02:05.0242861', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'66', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'21875C7A-A967-44E9-9114-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:03:34.4904856', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'239', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'CF344D83-A442-441E-9115-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:03:40.1638267', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'27', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E1BBAACD-9F14-4372-9116-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:03:52.0816761', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'196', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C0E23B3D-F756-4384-9117-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:07:07.6161203', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'242', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'07506E34-B7BB-4D66-9118-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:07:09.9292818', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'31', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8220A7D3-1AC1-4035-9119-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:07:29.0034335', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'179', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0BE31AA3-4973-42C0-911A-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:07:54.8877637', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'226', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5D2B2592-20A9-4EA8-911B-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:11:04.6731009', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'290', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E78B7BD9-738B-4A3F-911C-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:11:37.0605960', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'221', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'217B5233-C77D-477E-911D-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:12:15.6076572', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'190', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'32A88AEB-816C-427C-911E-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:12:16.4679820', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'96', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'CEF29C98-BA06-43F4-911F-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:12:20.1562319', NULL, NULL, N'/api/admin/SysMenu/findForm/11', N'0.0.0.1', N'', N'', N'', N'40', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0C3A89C8-41BF-4D36-9120-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:12:46.8495945', NULL, NULL, N'/api/admin/SysMenu/update', N'0.0.0.1', N'', N'{"id":11,"form":{"levelCode":"1.11","number":70,"name":"微前端","componentName":"Iframe","url":"core/components/Iframe.vue","router":"/iframe","jumpUrl":"","icon":"RadarChartOutlined","parentId":1,"show":true,"close":true,"keepAlive":true,"state":true,"type":2,"mode":1,"moduleUrl":"http://rapidscada.com.cn/#/","id":11,"lastModifierUserId":"0198459e-2034-4533-b843-5d227ad20740","lastModificationTime":"2022-12-16 14:54:50","creatorUserId":null,"creationTime":"2021-08-05 21:51:12"},"allFunctions":[{"number":10,"name":"显示","byName":"Display","remark":"Display","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"c9518758-b2e1-4f51-b517-5282e273889c"},{"number":20,"name":"添加","byName":"Insert","remark":"Insert","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"bffefb1c-8988-4ddf-b4ac-81c2b30e80cd"},{"number":30,"name":"修改","byName":"Update","remark":"Update","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"e7ef2a05-8317-41c3-b588-99519fe88bf9"},{"number":40,"name":"删除","byName":"Delete","remark":"Delete","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"9c388461-2704-4c5e-a729-72c17e9018e1"},{"number":50,"name":"保存","byName":"Save","remark":"Save","lastModifierUserId":"0198459e-2034-4533-b843-5d227ad20740","lastModificationTime":"2022-09-28 22:12:02","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"383e7ee2-7690-46ac-9230-65155c84aa30"},{"number":60,"name":"检索","byName":"Search","remark":"Search","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"f27ecb0a-197d-47b1-b243-59a8c71302bf"},{"number":70,"name":"导出","byName":"Export","remark":"Export","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"2401f4d0-60b0-4e2e-903f-84c603373572"},{"number":80,"name":"打印","byName":"Print","remark":"Print","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2022-06-16 17:28:00","id":"b6fd5425-504a-46a9-993b-2f8dc9158eb8"}],"menuFunctionList":[{"number":10,"menuId":11,"functionCode":"Display","functionName":"显示","remark":"Display","lastModifierUserId":null,"lastModificationTime":"2022-03-04 15:24:53","creatorUserId":"0198459e-2034-4533-b843-5d227ad20740","creationTime":"2022-12-16 14:54:50","id":"3bc0e68f-d03d-4e99-0f26-08d9fdad00ab"}]}', N'', N'128', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'编辑表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C0EC4494-50D1-48B7-9121-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:12:47.1543919', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'43', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1CF0DEE6-0A66-4931-9122-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:12:48.8487705', NULL, NULL, N'/api/admin/SysMenu/findForm/37', N'0.0.0.1', N'', N'', N'', N'37', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B30DC0B5-8D3C-4788-9123-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:12:52.3637128', NULL, NULL, N'/api/admin/SysMenu/update', N'0.0.0.1', N'', N'{"id":37,"form":{"levelCode":"1.37","number":80,"name":"微前端2","componentName":"Iframe123","url":"core/components/Iframe.vue","router":"/iframe123","jumpUrl":null,"icon":"AlipaySquareFilled","parentId":1,"show":true,"close":true,"keepAlive":true,"state":true,"type":2,"mode":1,"moduleUrl":"https://www.yuque.com/u378909/yidf7v/zx6egc","id":37,"lastModifierUserId":"0198459e-2034-4533-b843-5d227ad20740","lastModificationTime":"2022-12-16 15:02:02","creatorUserId":"0198459e-2034-4533-b843-5d227ad20740","creationTime":"2022-12-16 15:00:53"},"allFunctions":[{"number":10,"name":"显示","byName":"Display","remark":"Display","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"c9518758-b2e1-4f51-b517-5282e273889c"},{"number":20,"name":"添加","byName":"Insert","remark":"Insert","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"bffefb1c-8988-4ddf-b4ac-81c2b30e80cd"},{"number":30,"name":"修改","byName":"Update","remark":"Update","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"e7ef2a05-8317-41c3-b588-99519fe88bf9"},{"number":40,"name":"删除","byName":"Delete","remark":"Delete","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"9c388461-2704-4c5e-a729-72c17e9018e1"},{"number":50,"name":"保存","byName":"Save","remark":"Save","lastModifierUserId":"0198459e-2034-4533-b843-5d227ad20740","lastModificationTime":"2022-09-28 22:12:02","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"383e7ee2-7690-46ac-9230-65155c84aa30"},{"number":60,"name":"检索","byName":"Search","remark":"Search","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"f27ecb0a-197d-47b1-b243-59a8c71302bf"},{"number":70,"name":"导出","byName":"Export","remark":"Export","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"2401f4d0-60b0-4e2e-903f-84c603373572"},{"number":80,"name":"打印","byName":"Print","remark":"Print","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2022-06-16 17:28:00","id":"b6fd5425-504a-46a9-993b-2f8dc9158eb8"}],"menuFunctionList":[{"number":10,"menuId":37,"functionCode":"Display","functionName":"显示","remark":"Display","lastModifierUserId":null,"lastModificationTime":null,"creatorUserId":"0198459e-2034-4533-b843-5d227ad20740","creationTime":"2022-12-16 15:02:02","id":"9c9b41fd-db96-48cf-c07f-08dadf3345bd"},{"number":20,"menuId":37,"functionCode":"Insert","functionName":"添加","remark":"Insert","lastModifierUserId":null,"lastModificationTime":null,"creatorUserId":"0198459e-2034-4533-b843-5d227ad20740","creationTime":"2022-12-16 15:02:02","id":"47e1a6a3-4c89-46bf-c080-08dadf3345bd"},{"number":30,"menuId":37,"functionCode":"Update","functionName":"修改","remark":"Update","lastModifierUserId":null,"lastModificationTime":null,"creatorUserId":"0198459e-2034-4533-b843-5d227ad20740","creationTime":"2022-12-16 15:02:02","id":"d51a17af-163e-4a74-c081-08dadf3345bd"},{"number":40,"menuId":37,"functionCode":"Delete","functionName":"删除","remark":"Delete","lastModifierUserId":null,"lastModificationTime":null,"creatorUserId":"0198459e-2034-4533-b843-5d227ad20740","creationTime":"2022-12-16 15:02:02","id":"c6400925-a381-4679-c082-08dadf3345bd"},{"number":50,"menuId":37,"functionCode":"Save","functionName":"保存","remark":"Save","lastModifierUserId":null,"lastModificationTime":null,"creatorUserId":"0198459e-2034-4533-b843-5d227ad20740","creationTime":"2022-12-16 15:02:02","id":"216e9ad6-cc3f-4e72-c083-08dadf3345bd"},{"number":60,"menuId":37,"functionCode":"Search","functionName":"检索","remark":"Search","lastModifierUserId":null,"lastModificationTime":null,"creatorUserId":"0198459e-2034-4533-b843-5d227ad20740","creationTime":"2022-12-16 15:02:02","id":"4e7cd8df-2e35-4d5e-c084-08dadf3345bd"},{"number":70,"menuId":37,"functionCode":"Export","functionName":"导出","remark":"Export","lastModifierUserId":null,"lastModificationTime":null,"creatorUserId":"0198459e-2034-4533-b843-5d227ad20740","creationTime":"2022-12-16 15:02:02","id":"c981aa0b-d60e-4160-c085-08dadf3345bd"},{"number":80,"menuId":37,"functionCode":"Print","functionName":"打印","remark":"Print","lastModifierUserId":null,"lastModificationTime":null,"creatorUserId":"0198459e-2034-4533-b843-5d227ad20740","creationTime":"2022-12-16 15:02:02","id":"576f8a5d-1c47-47c9-c086-08dadf3345bd"}]}', N'', N'92', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'编辑表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C58238C3-51DC-4A99-9124-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:12:52.6518717', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'52', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'72A0008D-1E8A-43A7-9125-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:12:54.5717515', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'148', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A88B913C-8DB0-45E2-9126-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:12:55.1991698', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'63', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C63BE8A3-9EE0-4173-9127-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:13:08.6384507', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'163', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E3ADF41A-0907-416E-9128-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:13:10.0906481', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'49', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'609B0DF9-C985-469C-9129-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:18:41.6781647', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'379', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3C48929C-B7AA-4333-912A-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:18:48.9393795', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'57', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'6E5BDDAE-AB58-4470-912B-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:18:55.8837526', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'243', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1DDBE0C6-C36E-4B61-912C-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:19:04.9671611', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'15', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'47503C63-3B39-4279-912D-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:21:48.5855053', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'184', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'887269C8-4FD3-477E-912E-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:21:51.9325454', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'24', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'4B702478-6F87-488F-912F-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:21:56.0246747', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'29', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C6A8E24A-D49B-4FB1-9130-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:22:01.1686584', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'172', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B6F6A58D-CF71-4D0E-9131-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:22:03.9650360', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'23', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9F48C8B8-C2A0-46E9-9132-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:22:08.0857008', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'28', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'FB2DC81D-70D2-4FC3-9133-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:22:10.8761018', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'25', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A398102B-2130-4726-9134-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:22:15.2554571', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'169', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'EBE3C6CA-B32F-4C73-9135-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:22:18.5494074', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'16', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8A30B128-67DA-48AA-9136-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:22:38.3568673', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'328', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'11C63CDA-6018-4BD7-9137-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:22:47.1215179', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'26', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'BC18AE5E-F7EA-418F-9138-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:22:54.2381572', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'329', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'819DEA88-2089-425F-9139-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:22:55.6871381', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'194', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'65BBED00-D3A4-413D-913A-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:22:58.5032250', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'18', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'53346964-8103-4D0A-913B-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:23:01.1389982', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'30', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'25F8F598-2442-4C10-913C-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:23:09.6365290', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'229', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F0BF4EAF-F6BB-4463-913D-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:23:22.1076028', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'202', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7E56B266-4832-42AC-913E-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:23:34.0936374', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'251', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'DDD49CB4-B52B-4331-913F-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:23:36.4272518', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'25', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D98D6C14-01F7-4B1B-9140-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:23:40.1504048', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'34', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7063C67F-8E88-40B6-9141-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:23:45.0657009', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'172', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'98CBCE77-F00D-43B1-9142-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:23:46.8044146', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'29', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B8878499-4AAF-4976-9143-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:23:50.5612818', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'25', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'DC5DCCA8-CB99-41DD-9144-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:23:58.8697064', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'211', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'224024AB-A265-4CA4-9145-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:24:43.3081047', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'235', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'15AD8FE5-743F-41A6-9146-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:32:50.4412156', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'564', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E46423E0-1BF1-45EE-9147-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:32:53.0928123', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'54', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C516D7AE-37AA-4CCE-9148-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:33:06.2155375', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'297', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C0C2C3BF-BAAB-409C-9149-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:33:08.1413478', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'312', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'AFA987C4-CB65-489E-914A-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:34:01.2337969', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'228', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'93F9B4D3-1D56-4312-914B-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:34:04.2826203', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'33', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'508A0B2F-23FA-4391-914C-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:34:11.8395677', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'209', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C2296F54-EDFF-4552-914D-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:34:47.2092955', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'267', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'511E133F-51D6-42CE-914E-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:34:51.2712390', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'18', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'45F641C9-D86C-4B01-914F-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:34:54.6851716', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'33', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B039F3BD-E112-4CB5-9150-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:35:25.8480124', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'200', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E24C8DD1-96B0-411B-9151-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:35:33.4440951', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'24', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D5442E91-B550-4312-9152-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:35:38.6381699', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'724', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'87DF2A97-7250-4D12-9153-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:35:42.1495539', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'45', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8A80E6B4-9BB2-4A11-9154-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:35:54.6671125', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'220', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'CF041BE7-F039-4ECD-9155-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:35:59.9096859', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'21', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E86CDF67-E31F-400C-9156-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:36:07.9684139', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'325', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3CA3207C-44BE-4EDC-9157-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:36:10.7160019', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'25', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0D6E738D-3199-45A5-9158-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:36:14.6656707', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'28', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C11E98EC-8D18-4992-9159-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:36:24.2345055', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'177', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8EFE94D9-30A9-45FD-915A-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:36:27.8018545', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'72', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5403BC21-BEB5-48BD-915B-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:36:43.9149712', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'185', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9542B76C-0E1C-4E50-915C-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:36:55.7914317', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'184', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'ABBA019B-A5FC-4CBE-915D-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:36:59.5413959', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'126', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E6D008FD-FE94-45FB-915E-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:37:04.2835935', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'25', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0AC1D2D6-1B55-4531-915F-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:37:26.2072070', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'237', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C524DCDC-AF97-488C-9160-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:37:29.1826340', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'86', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'484A19ED-34A5-4FF3-9161-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:37:32.6569654', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'30', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'023C24DF-BB03-454B-9162-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:37:35.7827622', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'84', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'898C6D99-C565-461A-9163-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:37:37.6309955', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'239', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'CBA9F299-D3EE-4AA7-9164-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:37:39.7393432', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'224', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'63A73EBD-DA80-4416-9165-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:37:42.2620870', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'24', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'64402BD1-BC1B-44A0-9166-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:37:45.9065616', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'22', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'397AB5C7-8BF1-4B54-9167-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:37:48.3688300', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'89', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'42124ECC-08AF-4017-9168-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:41:19.3160522', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'213', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3E6A15BC-415D-4E79-9169-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:42:32.4641229', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'341', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A3714846-BDE0-4F1B-916A-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:42:34.3751142', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'179', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7E075BCD-B481-4317-916B-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:42:41.0482822', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'23', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'36AACB31-F0BD-48F9-916C-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:42:43.1310216', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'27', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8FBA3532-74FD-42A7-916D-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:42:56.6267957', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'317', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'48C18C1F-6BEA-4E5C-916E-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:42:57.5911842', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'201', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'DDC212AF-A152-4C33-916F-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:43:07.5946362', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'21', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'17B4DE92-2530-45BF-9170-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:43:28.7577766', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'362', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'22638DF8-B3D8-4DC1-9171-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:43:32.9147145', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'26', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'6260D6F7-F2DA-4996-9172-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:43:47.8850156', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'173', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0D57AF03-2D39-4B64-9173-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:44:12.4314207', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'203', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'FEEC5BE8-81B7-4F54-9174-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:44:14.8939716', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'29', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B48017DC-E655-407F-9175-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:44:17.0107566', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'524', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F1E52980-595A-4DFB-9176-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:44:19.1237116', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'36', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B01AC025-382C-4F59-9177-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:44:32.7361064', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'226', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'6BE48196-DAF0-4480-9178-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:44:35.6111273', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'32', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'FD2A662B-134E-497F-9179-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:44:39.5662712', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'25', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'179FEC5A-EED8-4E81-917A-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:44:58.5304171', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'169', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1B7E4F2A-B162-43F0-917B-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:45:08.0758718', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'24', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C47A3E56-A77A-4FE3-917C-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:45:13.5356123', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'299', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A752E079-1812-4BB6-917D-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:45:51.5278762', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'320', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8FD2C5BE-B906-4D71-917E-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:46:33.7099050', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'220', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D0EA0A12-3BC9-4D21-917F-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:47:19.2725932', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'286', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'275BB6CB-E6A4-494B-9180-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:47:22.1593662', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'24', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'20C65E22-1B76-4AF5-9181-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:47:34.8745406', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'218', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B9665B03-DEB5-402A-9182-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:47:58.2509628', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'507', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5B9F412E-7295-4D29-9183-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:48:02.0719919', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'166', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'EDEB4CF1-8A7F-4999-9184-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:48:18.5497394', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'166', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'31A4AC3E-B456-4C2E-9185-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:48:28.0980466', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'90', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1C8F1A2C-6CDE-46F5-9186-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:48:30.4196858', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'228', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F80A2AC6-6A6A-41DD-9187-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:48:40.2816712', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'17', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A36365D3-466C-4433-9188-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:48:43.2617210', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'273', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'574CC9EC-3125-45D4-9189-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:48:45.9911878', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'17', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'DE21B18F-2476-40E2-918A-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:49:15.5716578', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'210', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9C79D2C6-C43B-4C82-918B-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:49:20.7738960', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'20', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9687A8EC-CF43-49EA-918C-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:50:35.4592616', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'236', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7D1055BE-E798-41F1-918D-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:50:49.3532029', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'438', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'96E55018-8A68-4995-918E-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:50:51.0029746', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'196', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F36167D4-C229-4B9A-918F-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:50:54.3677377', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'40', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'AC6D4CD2-A0BA-478F-9190-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:51:08.9655472', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'211', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'AA091228-072C-4F19-9191-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:51:11.3524821', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'36', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D5BA4F94-3287-41E5-9192-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:51:13.6168985', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'245', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'33A4A29B-6EC0-45E3-9193-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:51:16.9167475', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'18', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E98FA5DB-8802-4BEB-9194-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:56:05.1064188', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'279', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E07B6D3E-35AC-4E7B-9195-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:56:35.1743734', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'212', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'74CA19A8-F5D6-4DFE-9196-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:56:43.2600286', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'26', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'55D84784-2A7F-42EA-9197-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:56:45.8200374', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'217', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C7B87A00-3A72-4F86-9198-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:56:57.2113697', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'273', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'24051FB8-AD80-4FA9-9199-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:56:59.9601479', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'25', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2228B103-114E-4E81-919A-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:57:03.9160513', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'34', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'EEECD3B0-773B-4104-919B-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:57:05.7870245', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'177', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8C8EEE61-23A7-4223-919C-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:57:07.3630623', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'23', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D981D550-F378-4761-919D-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:57:28.4678231', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'213', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2DF44398-056B-47F2-919E-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:57:30.6768814', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'66', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'4CF8A6CE-5E8D-4056-919F-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:58:17.9266199', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'146', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'60FE7191-3BE1-43A8-91A0-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:58:23.8623777', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'16', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'BBAA394A-0279-4CD1-91A1-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:58:30.9950702', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'250', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'619CBE37-7AF5-4E59-91A2-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:58:38.3445397', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'19', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1A4B9A53-DBD4-48D5-91A3-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:58:43.2008514', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'237', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'6FCE9B20-CEC1-4206-91A4-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:58:47.3586187', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'251', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'48E99D3F-2E11-430C-91A5-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:58:48.4329050', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'321', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'4D0C7FA5-C7D6-450B-91A6-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:59:11.9935200', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'159', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'45536F38-5D16-4CD0-91A7-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:59:15.0110669', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'261', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5B2EAD22-787D-4438-91A8-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:59:49.4148849', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'254', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B29E312F-10D4-435F-91A9-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:59:51.9331541', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'17', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B8A18511-9DE9-48B5-91AA-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:59:55.1320364', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'40', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'6F8F280A-7A26-4F3A-91AB-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 15:59:56.2986969', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'309', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'68124E4F-3899-4395-91AC-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:01:02.4932202', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'285', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8DF839C1-3EB7-4706-91AD-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:01:05.7248549', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'76', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'4303A716-C982-44A5-91AE-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:01:07.7906318', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'290', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E4C7A6F3-C2BE-4E2E-91AF-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:01:16.7503407', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'19', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1F74E074-D9EE-47BB-91B0-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:01:18.6789454', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'225', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'249939EF-85F8-4DEA-91B1-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:02:23.9872020', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'193', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'36321925-C1C4-45A5-91B2-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:02:27.5977684', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'25', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'99FE34DD-3FD5-45F1-91B3-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:02:44.1954254', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'264', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A8E1A99E-F19F-4CD2-91B4-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:02:59.9125346', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'242', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'43B226C9-778C-47BA-91B5-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:03:02.5502508', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'26', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'32C3BB11-9EC2-4B67-91B6-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:03:11.4215710', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'279', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2A0E7E47-D8D0-478D-91B7-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:03:12.9450854', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'183', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'452CC28F-1EFA-45EC-91B8-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:03:16.2000281', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'17', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C306EEB7-E0A2-415C-91B9-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:03:19.6076012', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'31', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'31A23270-3C5D-4E15-91BA-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:05:07.2526318', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'322', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A6706CEF-D408-480B-91BB-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:07:18.5656313', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'296', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1E4679F3-766F-4BE8-91BC-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:07:22.7137449', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'31', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'71E0AC5B-E0DD-45C1-91BD-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:07:42.8533350', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'359', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C0C39D29-9FDB-4731-91BE-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:07:45.0991721', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'264', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9C2A7A72-8E1B-4DC2-91BF-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:07:50.3325758', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'23', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F6CCE91A-4E22-4480-91C0-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:08:19.2192885', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'169', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'FDF51A00-7D02-4B3E-91C1-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:09:01.8811214', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'317', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'823B8CFD-FD8C-4C1D-91C2-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:09:16.2056756', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'208', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A8573FBF-D61B-486E-91C3-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:10:00.9113665', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'257', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'BA160B3B-3653-4F79-91C4-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:10:10.5655533', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'28', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B3587D43-CF7A-47F5-91C5-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:10:13.6729860', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'329', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C2B28A3C-7B8F-4C25-91C6-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:11:14.1139231', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'275', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'43BE9BDA-D5DF-4720-91C7-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:11:19.7573691', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'25', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'AE10B582-59F9-47EB-91C8-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:11:22.4849018', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'176', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B6214277-123B-44C8-91C9-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:11:26.2271162', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'22', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'310CDAB0-59F3-4460-91CA-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:11:32.2652735', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'23', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0A924379-C9C6-40A2-91CB-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:11:37.2968423', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'316', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5B6EA046-6056-44EA-91CC-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:11:39.3026946', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'363', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A69A59E5-725E-4DF3-91CD-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:11:40.8824234', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'152', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2A2F5658-DCEC-4E60-91CE-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:11:44.0817256', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'25', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'124365E2-A06E-43D8-91CF-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:11:46.4437528', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'155', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3381780E-34AB-4113-91D0-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:11:50.0521579', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'18', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'4D07B006-EFD8-4AB6-91D1-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:11:53.0409080', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'36', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'701C0140-D0D5-4CDD-91D2-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:12:21.2106902', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'222', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5F32A694-C53F-411D-91D3-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:12:27.9301301', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'30', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E193B266-C2CD-4700-91D4-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:12:29.8077053', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'48', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'BA102C8D-D2A1-4E61-91D5-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:13:30.7291532', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'226', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'32F3D618-0B40-4E64-91D6-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:13:42.4526465', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'261', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'105A2814-6ED3-4A84-91D7-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:13:48.4126563', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'26', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3DD77E8B-7D87-4A3D-91D8-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:14:14.7624748', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'345', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'72BCE904-531A-4087-91D9-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:14:16.3469159', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'263', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C725F29F-A53F-4092-91DA-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:14:18.1350733', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'289', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7FD7E93E-0A44-4E2B-91DB-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:14:35.7194945', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'176', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'EC40595A-EA39-4015-91DC-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:14:37.8123817', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'18', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7E51B432-BDFC-4950-91DD-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:14:44.4577501', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'48', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'110A9175-0A8E-4098-91DE-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:15:15.3468559', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'228', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C9C2E2F1-8A30-4E8F-91DF-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:15:17.6880724', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'16', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'AF2D3B80-22CF-4D71-91E0-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:15:21.4345292', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'87', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'21818CDC-DE35-4C0E-91E1-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:15:23.2647558', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'253', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'049C1EDB-A1BF-4D85-91E2-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:15:24.8569117', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'34', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9425AD6A-09AD-4173-91E3-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:15:47.6692316', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'211', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'68D3FE90-FA42-4B50-91E4-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:16:10.4721150', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'169', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'179E08DE-D287-47F4-91E5-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:16:14.5864822', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'34', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'85B31742-B0F6-4666-91E6-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:16:48.8145733', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'216', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F90D0426-150C-4827-91E7-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:16:52.4982070', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'25', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'BA0751E2-2707-4B90-91E8-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:16:55.6243359', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'25', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9F452D5C-C8D0-4099-91E9-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:17:00.6484823', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'211', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'37FA49ED-95CB-4E84-91EA-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:17:44.1535945', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'186', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2D664AFF-6CF5-42EE-91EB-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:17:47.6832708', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'44', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'805C888E-9389-431D-91EC-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:20:43.6435555', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'469', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E97BDDEE-D427-492F-91ED-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:20:45.2560801', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'169', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'519329AA-C087-4F8E-91EE-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:20:51.9571087', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'17', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'47AC799D-90C0-4D18-91EF-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:20:55.9688825', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'228', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5239F536-6CAB-4BA0-91F0-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:20:57.6513083', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'48', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'AEEF1C63-C775-41EA-91F1-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:21:44.0863111', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'209', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E248C805-5D42-41C8-91F2-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:22:46.1257519', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'238', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'53824AF5-3823-4966-91F3-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:23:21.3165037', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'196', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'22A6228E-C9C8-4924-91F4-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:23:41.5187528', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'373', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D12B0E17-EF82-4765-91F5-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:23:43.0352613', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'224', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'15801152-238F-4A2D-91F6-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:23:45.3962314', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'35', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7251DD75-9A46-488E-91F7-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:24:27.0990544', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'178', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D3A34017-C684-4D5F-91F8-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:24:45.3405505', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'253', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'CC4C0C50-F587-4F31-91F9-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:24:47.9953122', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'23', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'EB323751-9987-4EEF-91FA-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:24:51.4145552', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'39', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B046A23F-351E-4BEC-91FB-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:25:36.0029232', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'329', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'4A0C8E44-BD5D-438B-91FC-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:25:38.2102017', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'18', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'938D7B2E-F82F-4C64-91FD-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:28:34.2739301', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'429', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8476443D-7117-41A0-91FE-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:28:39.0911930', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'17', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7C35C11F-ABF5-491C-91FF-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:28:56.3250637', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'224', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D7FD0E23-5F56-4A75-9200-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:29:00.7103303', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'20', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'BABCF799-09D1-44FA-9201-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:29:03.1601854', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'22', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C53483B7-3B99-4E4F-9202-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:30:40.8818088', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'241', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'6B8C2DAF-20D4-45D0-9203-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:34:43.1052280', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'237', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'DA39D339-B4FE-4892-9204-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:34:50.8742856', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'22', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'AFE84773-792A-47F5-9205-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:35:00.4913791', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'502', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2C096A58-B81E-4C3D-9206-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:35:01.4807677', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'315', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'77DAFFBF-F318-40AD-9207-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:35:08.6087585', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'32', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'6C12E969-9380-4ECD-9208-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:40:54.0043522', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'203', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'025DEDB3-7807-40C0-9209-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:41:51.5755540', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'308', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F829FDFE-D0FB-48CD-920A-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:41:53.3212212', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'185', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'65B74C21-9943-46F6-920B-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:42:04.2231999', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'149', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'AC2578B3-A6BA-4D67-920C-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:42:12.9173163', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'22', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'BD9C2197-50FB-4BA1-920D-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:42:45.1511072', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'353', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9F9B2FDD-CC46-4359-920E-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:43:00.8453929', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'216', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'147F32C8-9CB2-405F-920F-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:48:29.5995023', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'482', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5416D16F-E71C-485C-9210-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:48:31.4982338', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'218', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'DBEAC1FE-96B7-41D1-9211-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:48:33.2553859', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'153', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'EFE53A3E-B9CE-4C90-9212-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:48:42.4781395', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'27', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A02DF823-1567-496C-9213-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:48:44.3514601', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'152', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'38D52A74-B59B-4671-9214-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:48:46.1149925', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'73', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1D61DDA7-5E3D-4CDA-9215-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:49:06.4479740', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'389', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C081677B-5942-4EF2-9216-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:49:37.0079658', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'197', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'135C9D5E-3093-4404-9217-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:50:17.3102558', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'279', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'17F51CF1-4E67-467B-9218-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:50:43.3500053', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'222', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'35F98BC4-9FA5-445E-9219-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:50:46.8527050', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'87', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'39D4C982-8781-4C50-921A-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:52:00.2054576', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'203', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'65497C49-FE9A-40F6-921B-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:52:03.4369552', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'25', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'BBB5C7A5-5586-4751-921C-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:52:19.2326208', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'259', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'AE755387-4BE9-40B4-921D-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:52:23.3230368', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'20', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'35F27163-BF44-4118-921E-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:52:25.7471719', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'22', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'63E4A210-38C1-4382-921F-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:52:39.8721959', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'266', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'BB8B7A22-D8C7-4AED-9220-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:53:00.0102228', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'295', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C0762614-D7EB-42C6-9221-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:53:01.3324112', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'173', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8E7F6E6F-7F8A-4A83-9222-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:53:07.6779554', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'31', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'24D64271-667A-4C3F-9223-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:53:12.5876143', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'269', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9F5FD28F-7666-4B40-9224-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:53:15.1313668', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'27', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0CEC3FE2-5942-49AB-9225-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:53:32.2766865', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'255', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8B7168EF-317E-45B8-9226-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 16:59:54.6862956', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'292', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E24070AA-AD25-4D90-9227-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:00:00.0804259', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'20', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B36D7BB6-BEF5-4D42-9228-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:00:43.3044620', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'203', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'EFD019BC-FD8B-412F-9229-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:09:07.9822513', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'289', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8DC73F1A-3298-4D71-922A-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:09:15.0798245', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'23', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'926CB8C9-D904-4FD3-922B-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:09:57.2214838', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'502', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'548B79F3-C4DD-434D-922C-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:10:01.8742242', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'16', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E8394F08-E9FD-42B7-922D-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:10:06.4494525', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'24', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'887F146C-F31A-41BA-922E-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:11:44.0977899', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'312', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C5ECDC91-B201-4A5E-922F-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:11:55.9971824', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'211', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7E0AB62F-65E1-4BD5-9230-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:12:13.2540706', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'252', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'FF109087-7A44-4727-9231-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:12:20.1571883', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'28', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C9B5D0B9-B7CC-472C-9232-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:12:24.8696554', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'185', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'10CE4D32-A2D0-4566-9233-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:12:37.8641935', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'229', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5285983A-0DAE-4C00-9234-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:12:41.6084202', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'48', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3FE15E46-FA71-4C04-9235-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:12:47.1088104', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'52', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'4BF21304-C8AF-49D8-9236-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:12:51.5359560', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'274', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7DCD0D28-D505-4BE7-9237-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:12:55.0077551', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'29', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'504628B4-476F-4DF0-9238-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:13:32.1269796', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'217', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'421BD8DA-3EB2-46B4-9239-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:13:37.3731452', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'22', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B175A2C1-856E-4007-923A-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:13:40.5596785', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'21', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'34F6A41C-3EEC-46FF-923B-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:13:59.3026278', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'204', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'773F068F-BFD5-427D-923C-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:14:06.1742189', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'26', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F36DE85F-AB94-4D00-923D-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:14:09.9495302', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'210', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'46AA1BAD-1DB0-43F3-923E-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:14:11.3060733', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'21', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A9B1B2AF-DEC8-4D3D-923F-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:14:23.2626150', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'203', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'59578BB5-50C0-4924-9240-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:14:33.2337806', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'21', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'AFA4F3CE-4C65-464A-9241-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:14:56.3952847', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'214', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3E10E030-AC73-4BB1-9242-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:14:58.7349942', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'27', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'34FD53FB-4D0D-4ABE-9243-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:16:12.1921257', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'299', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0ECDEFA8-9BEE-40DC-9244-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:16:13.5873150', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'155', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'FA58ADAA-536F-496A-9245-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:16:20.0648813', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'84', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'05077CF7-797F-441B-9246-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:16:25.0566468', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'156', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9C25FAAC-DD6F-4915-9247-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:16:41.6037385', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'162', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B7B10E99-E35D-48F6-9248-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:16:47.1345834', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'23', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'FD15A979-E89F-47C6-9249-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:16:50.3046336', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'30', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2E361499-1D45-4595-924A-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:17:40.3564053', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'50', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'39CEBF0E-3FF1-410A-924B-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:17:46.7567359', NULL, NULL, N'/api/admin/SysMenu/findForm/22', N'0.0.0.1', N'', N'', N'', N'46', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D94A2AC3-AFE8-417C-924C-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:19:49.5391216', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'326', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A6133D1C-1C6F-427E-924D-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:19:52.8492425', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'45', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9623EC53-3FAF-4440-924E-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:29:55.8600118', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'258', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'19A602C3-F669-4F19-924F-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:29:58.7684454', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'88', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F5CC65FA-6EBE-4888-9250-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:30:02.7796583', NULL, NULL, N'/api/admin/SysMenu/findForm/11', N'0.0.0.1', N'', N'', N'', N'32', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8F71A5A0-FDC3-407D-9251-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:30:05.2653071', NULL, NULL, N'/api/admin/SysMenu/update', N'0.0.0.1', N'', N'{"id":11,"form":{"levelCode":"1.11","number":70,"name":"微前端","componentName":"Iframe","url":"core/components/Iframe.vue","router":"/iframe","jumpUrl":"","icon":"RadarChartOutlined","parentId":1,"show":true,"close":true,"keepAlive":true,"state":true,"type":2,"mode":2,"moduleUrl":"http://rapidscada.com.cn/#/","id":11,"lastModifierUserId":"0198459e-2034-4533-b843-5d227ad20740","lastModificationTime":"2022-12-16 15:12:46","creatorUserId":null,"creationTime":"2021-08-05 21:51:12"},"allFunctions":[{"number":10,"name":"显示","byName":"Display","remark":"Display","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"c9518758-b2e1-4f51-b517-5282e273889c"},{"number":20,"name":"添加","byName":"Insert","remark":"Insert","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"bffefb1c-8988-4ddf-b4ac-81c2b30e80cd"},{"number":30,"name":"修改","byName":"Update","remark":"Update","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"e7ef2a05-8317-41c3-b588-99519fe88bf9"},{"number":40,"name":"删除","byName":"Delete","remark":"Delete","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"9c388461-2704-4c5e-a729-72c17e9018e1"},{"number":50,"name":"保存","byName":"Save","remark":"Save","lastModifierUserId":"0198459e-2034-4533-b843-5d227ad20740","lastModificationTime":"2022-09-28 22:12:02","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"383e7ee2-7690-46ac-9230-65155c84aa30"},{"number":60,"name":"检索","byName":"Search","remark":"Search","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"f27ecb0a-197d-47b1-b243-59a8c71302bf"},{"number":70,"name":"导出","byName":"Export","remark":"Export","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"2401f4d0-60b0-4e2e-903f-84c603373572"},{"number":80,"name":"打印","byName":"Print","remark":"Print","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2022-06-16 17:28:00","id":"b6fd5425-504a-46a9-993b-2f8dc9158eb8"}],"menuFunctionList":[{"number":10,"menuId":11,"functionCode":"Display","functionName":"显示","remark":"Display","lastModifierUserId":null,"lastModificationTime":"2022-03-04 15:24:53","creatorUserId":"0198459e-2034-4533-b843-5d227ad20740","creationTime":"2022-12-16 15:12:46","id":"3bc0e68f-d03d-4e99-0f26-08d9fdad00ab"}]}', N'', N'77', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'编辑表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7E178308-6A44-4C71-9252-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:30:05.4747199', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'38', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B8921A67-8CEB-4EE7-9253-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:30:07.5173499', NULL, NULL, N'/api/admin/SysMenu/findForm/37', N'0.0.0.1', N'', N'', N'', N'39', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'DF5B869C-B070-4180-9254-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:30:09.9978068', NULL, NULL, N'/api/admin/SysMenu/update', N'0.0.0.1', N'', N'{"id":37,"form":{"levelCode":"1.37","number":80,"name":"微前端2","componentName":"Iframe123","url":"core/components/Iframe.vue","router":"/iframe123","jumpUrl":null,"icon":"AlipaySquareFilled","parentId":1,"show":true,"close":true,"keepAlive":true,"state":true,"type":2,"mode":2,"moduleUrl":"https://www.yuque.com/u378909/yidf7v/zx6egc","id":37,"lastModifierUserId":"0198459e-2034-4533-b843-5d227ad20740","lastModificationTime":"2022-12-16 15:12:52","creatorUserId":"0198459e-2034-4533-b843-5d227ad20740","creationTime":"2022-12-16 15:00:53"},"allFunctions":[{"number":10,"name":"显示","byName":"Display","remark":"Display","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"c9518758-b2e1-4f51-b517-5282e273889c"},{"number":20,"name":"添加","byName":"Insert","remark":"Insert","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"bffefb1c-8988-4ddf-b4ac-81c2b30e80cd"},{"number":30,"name":"修改","byName":"Update","remark":"Update","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"e7ef2a05-8317-41c3-b588-99519fe88bf9"},{"number":40,"name":"删除","byName":"Delete","remark":"Delete","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"9c388461-2704-4c5e-a729-72c17e9018e1"},{"number":50,"name":"保存","byName":"Save","remark":"Save","lastModifierUserId":"0198459e-2034-4533-b843-5d227ad20740","lastModificationTime":"2022-09-28 22:12:02","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"383e7ee2-7690-46ac-9230-65155c84aa30"},{"number":60,"name":"检索","byName":"Search","remark":"Search","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"f27ecb0a-197d-47b1-b243-59a8c71302bf"},{"number":70,"name":"导出","byName":"Export","remark":"Export","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"2401f4d0-60b0-4e2e-903f-84c603373572"},{"number":80,"name":"打印","byName":"Print","remark":"Print","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2022-06-16 17:28:00","id":"b6fd5425-504a-46a9-993b-2f8dc9158eb8"}],"menuFunctionList":[{"number":10,"menuId":37,"functionCode":"Display","functionName":"显示","remark":"Display","lastModifierUserId":null,"lastModificationTime":null,"creatorUserId":"0198459e-2034-4533-b843-5d227ad20740","creationTime":"2022-12-16 15:12:52","id":"9c9b41fd-db96-48cf-c07f-08dadf3345bd"},{"number":20,"menuId":37,"functionCode":"Insert","functionName":"添加","remark":"Insert","lastModifierUserId":null,"lastModificationTime":null,"creatorUserId":"0198459e-2034-4533-b843-5d227ad20740","creationTime":"2022-12-16 15:12:52","id":"47e1a6a3-4c89-46bf-c080-08dadf3345bd"},{"number":30,"menuId":37,"functionCode":"Update","functionName":"修改","remark":"Update","lastModifierUserId":null,"lastModificationTime":null,"creatorUserId":"0198459e-2034-4533-b843-5d227ad20740","creationTime":"2022-12-16 15:12:52","id":"d51a17af-163e-4a74-c081-08dadf3345bd"},{"number":40,"menuId":37,"functionCode":"Delete","functionName":"删除","remark":"Delete","lastModifierUserId":null,"lastModificationTime":null,"creatorUserId":"0198459e-2034-4533-b843-5d227ad20740","creationTime":"2022-12-16 15:12:52","id":"c6400925-a381-4679-c082-08dadf3345bd"},{"number":50,"menuId":37,"functionCode":"Save","functionName":"保存","remark":"Save","lastModifierUserId":null,"lastModificationTime":null,"creatorUserId":"0198459e-2034-4533-b843-5d227ad20740","creationTime":"2022-12-16 15:12:52","id":"216e9ad6-cc3f-4e72-c083-08dadf3345bd"},{"number":60,"menuId":37,"functionCode":"Search","functionName":"检索","remark":"Search","lastModifierUserId":null,"lastModificationTime":null,"creatorUserId":"0198459e-2034-4533-b843-5d227ad20740","creationTime":"2022-12-16 15:12:52","id":"4e7cd8df-2e35-4d5e-c084-08dadf3345bd"},{"number":70,"menuId":37,"functionCode":"Export","functionName":"导出","remark":"Export","lastModifierUserId":null,"lastModificationTime":null,"creatorUserId":"0198459e-2034-4533-b843-5d227ad20740","creationTime":"2022-12-16 15:12:52","id":"c981aa0b-d60e-4160-c085-08dadf3345bd"},{"number":80,"menuId":37,"functionCode":"Print","functionName":"打印","remark":"Print","lastModifierUserId":null,"lastModificationTime":null,"creatorUserId":"0198459e-2034-4533-b843-5d227ad20740","creationTime":"2022-12-16 15:12:52","id":"576f8a5d-1c47-47c9-c086-08dadf3345bd"}]}', N'', N'55', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'编辑表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'FD409028-AE46-476B-9255-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:30:10.1962471', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'38', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C5B2CB2C-F8EA-4B02-9256-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:30:12.0683551', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'140', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'670FE6CD-B85F-444E-9257-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:30:12.9703137', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'70', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'976335DE-2601-40D8-9258-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:31:01.6234656', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'256', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'EDF35C3B-3D99-485B-9259-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:31:05.4010270', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'85', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0A680457-BD1C-4592-925A-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:31:38.8283570', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'223', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A1CC633B-9C7B-48BF-925B-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:31:43.2539805', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'62', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3EFC7BD6-9F2A-4755-925C-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:32:46.3190700', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'276', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1454765D-CDDD-4EF7-925D-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:32:48.6017395', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'24', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5C258917-1CC5-4900-925E-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 17:36:35.3879180', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'275', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C658862F-A02F-4F42-925F-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:00:43.8258428', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'307', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'DA34D5C5-A757-4402-9260-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:04:10.1433106', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'255', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B2879581-C991-4B53-9261-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:06:40.6983948', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'287', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'DBA5D597-AB35-47FB-9262-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:07:58.3901246', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'185', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'619CA27C-B4F8-4494-9263-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:08:51.2417571', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'204', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E8C018B6-3308-4AA0-9264-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:09:26.3929381', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'256', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0C70943C-65F6-409E-9265-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:09:37.9760725', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'288', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8FF61B9A-C9D5-4933-9266-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:09:43.2567550', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'29', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'780D59BB-7FEE-4807-9267-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:10:16.9240745', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'300', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2E0DEB07-644D-4AAD-9268-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:11:03.0070168', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'188', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'56306E89-D0F4-4A78-9269-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:11:41.9451717', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'186', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'6EB111B3-3246-4E08-926A-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:14:24.4218919', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'230', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'BC02B801-2AE9-4E76-926B-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:15:09.0167780', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'268', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0F593DB8-8E06-44EE-926C-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:15:12.8409917', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'28', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5BE22CB5-6009-497A-926D-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:15:45.1452345', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'243', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'79378714-5A96-41A3-926E-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:16:02.7075725', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'236', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'63FEC8DC-3280-4EFE-926F-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:16:07.6168837', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'20', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'922DC7FE-090A-45CE-9270-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:16:09.9732630', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'25', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'923FA8E4-9B95-4103-9271-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:16:11.8142840', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'236', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'95CA5B8F-D95F-4D8E-9272-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:16:15.5130825', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'18', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8676058D-AC1C-431B-9273-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:16:23.6161494', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'285', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'4CBEC1E7-B9DD-4121-9274-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:16:28.7311257', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'34', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7A4047E1-58E2-46A4-9275-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:16:31.0352204', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'296', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'336CDC59-0029-4F8E-9276-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:16:59.3417729', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'173', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'CE3B2D07-2493-4BFE-9277-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:19:57.3572204', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'191', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1A8C4CED-58EF-4E5A-9278-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:20:01.7336758', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'37', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'54388D81-48F3-4114-9279-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:20:12.9455205', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'199', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'CABC604F-3770-4F7E-927A-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:20:42.7705822', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'182', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'520884DF-C56F-404F-927B-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:21:01.4282157', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'178', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'58DD6439-401D-430C-927C-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:21:08.4057420', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'19', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5DDA7C66-A324-466F-927D-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:21:15.8773628', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'266', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9C5FFFAD-2F81-40C5-927E-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:21:39.2803935', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'326', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8E64FB2A-6AE0-4F5A-927F-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:21:50.3131840', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'211', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8C05821D-B177-4458-9280-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:21:55.0536918', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'48', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A64BFC0E-0D1D-4DA6-9281-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:21:58.9641990', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'21', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'08DA53D1-8417-49C7-9282-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:22:02.3404332', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'202', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'4B105743-10D4-4C63-9283-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:22:10.2248024', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'36', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F226FF14-8CE7-40CB-9284-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:23:47.7097122', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'237', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'90286123-C4C4-45F1-9285-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:25:07.6049406', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'255', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'646B15B4-8E30-45C5-9286-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:25:52.7339578', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'373', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'890C44CF-894D-4944-9287-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:26:24.9806306', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'209', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C1D6F662-72D1-4959-9288-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:26:52.9220270', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'229', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'EB8C722D-B157-4DF1-9289-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:27:23.4501001', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'190', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'28D8D7AE-B631-4C35-928A-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:27:32.6160813', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'32', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'AFA6A4ED-2E61-4F14-928B-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:27:39.4345008', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'188', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'4F5F6B56-817D-44CD-928C-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:27:44.3017055', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'34', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F00CB4A3-EBEE-4B42-928D-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:32:00.6514910', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'236', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C73E59DE-F8EC-4474-928E-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:33:40.0190155', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'223', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'73BBA82B-A394-4B0E-928F-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:33:47.8806422', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'21', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'79F2D56F-4D52-41F4-9290-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:34:11.8388631', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'293', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E8F9FA41-0391-4399-9291-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:34:13.8149078', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'228', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'12666742-81DF-47CD-9292-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:34:15.4773468', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'139', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3214BDC0-566A-4D49-9293-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:34:20.6582258', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'22', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'77F4B0CE-F4C6-48DA-9294-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:34:24.2328837', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'22', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1256547F-1469-4466-9295-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:35:15.0079162', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'261', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'831E9A72-42C0-4E97-9296-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:35:18.0717099', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'16', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'03FE6C77-E0F7-46DA-9297-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:35:20.8301981', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'21', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'46571F13-BEB4-4C12-9298-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:36:29.0492335', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'235', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2C984D70-D88E-4ECC-9299-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:36:38.8630703', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'16', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F3C1DF98-7BA8-4D13-929A-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:36:47.1874935', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'167', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'BE8AF9CF-B45A-4C49-929B-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:36:53.7853221', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'21', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'78401460-2A53-4413-929C-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:36:57.5941287', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'168', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'887612DB-4FE2-4BE9-929D-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:37:13.8074140', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'179', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'35B3EC0E-240A-4F7F-929E-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:37:18.2502229', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'20', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E8CF13DF-1C47-4492-929F-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:37:21.7435782', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'27', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'47403446-E7BF-47F7-92A0-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:37:34.8478407', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'282', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1966B8DD-A843-477F-92A1-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:38:15.3187880', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'177', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'DCE5AB63-C732-4D06-92A2-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:38:24.6529591', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'28', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7FE03000-1ED5-43C5-92A3-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:39:39.4444421', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'307', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'CA6E6542-3180-449F-92A4-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:39:53.3756794', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'180', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'CC088558-F4B1-4C77-92A5-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:40:12.5670625', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'317', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3601ADB3-90DF-49AB-92A6-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:40:26.7000475', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'147', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'DFA7A1E3-DEEE-4A3E-92A7-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:40:30.6848700', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'22', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A0B4C585-2CBB-4705-92A8-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:40:33.9211167', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'23', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B47FE71A-726F-44F9-92A9-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:40:57.8969735', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'169', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'421DFD51-6EC8-4645-92AA-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:41:01.7678748', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'19', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3EF25BEF-4EA9-4393-92AB-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:41:07.9322375', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'59', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8583679B-D1D2-4920-92AC-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:41:15.9306464', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'263', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C2EF3951-006C-4ACB-92AD-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:41:24.4996439', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'15', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D8BD97A9-FCAB-4B84-92AE-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:41:28.4412264', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'279', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3D62E4B3-27FA-49CD-92AF-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:41:33.9256621', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'24', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2C49F4AD-3519-4E40-92B0-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:41:50.5859122', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'253', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'03571CDB-82CF-44D8-92B1-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:43:00.0428064', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'354', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9F537935-2B7A-4DAA-92B2-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:43:05.0223627', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'28', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'609B7E91-7B66-4589-92B3-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:43:34.2311327', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'279', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'CDB51746-AF43-4769-92B4-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:44:09.8500554', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'283', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0A511DAC-C178-474B-92B5-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:45:05.0029735', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'308', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9B21FB76-51E5-4DC7-92B6-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:45:50.9201922', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'185', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'149F883B-03AD-497E-92B7-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:45:56.7140576', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'23', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'86F30719-7133-4DC2-92B8-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:46:05.9150569', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'183', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'36271E9A-3DE9-4288-92B9-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:46:13.9015374', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'25', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'05B1A16A-F6B5-45C8-92BA-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:46:18.7655752', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'153', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'125E5859-0365-4D12-92BB-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:46:21.7901594', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'28', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3E47D3B1-7815-4210-92BC-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:46:23.8617791', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'332', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B5D7889F-16F5-4410-92BD-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:46:25.7937835', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'223', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F03813A0-CDC0-48AF-92BE-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:46:29.9048958', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'21', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E145F9C9-AC79-4135-92BF-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:46:34.4069428', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'22', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'253FAE0D-730B-471C-92C0-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:46:47.9677915', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'184', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'49C1BE08-60AF-4E6E-92C1-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:47:50.9772394', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'207', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'FDA3D08C-35E1-43A2-92C2-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:49:07.7161862', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'291', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E9921909-1438-4E8A-92C3-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:51:41.0073000', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'365', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'69BC1209-A5AD-438A-92C4-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:52:19.8403005', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'295', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'49B51282-ACA0-4137-92C5-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:52:27.5295410', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'26', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F591D391-E457-4AB7-92C6-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:53:22.7869279', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'301', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'6FF4AD8B-B2BF-415B-92C7-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:55:31.4819356', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'261', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'FD2D2E38-2ABB-4905-92C8-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:57:10.2631427', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'253', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'EB5A994C-3E18-4CF0-92C9-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 19:58:13.5907166', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'195', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'16F736F8-D078-4E38-92CA-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:01:15.3873894', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'199', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'65F34E46-340B-4744-92CB-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:03:56.1193867', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'249', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'29540BD1-74D2-4959-92CC-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:04:50.5600030', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'158', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D2B188CB-DA74-41C2-92CD-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:04:56.5767161', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'15', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C281B55C-5B0D-4509-92CE-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:05:24.5224776', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'391', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8F6394D3-3FD7-4318-92CF-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:06:29.4769628', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'185', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8432282B-28CF-4EA9-92D0-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:06:33.6910146', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'25', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'14543FFD-E6B4-479E-92D1-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:07:24.0935170', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'167', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'30D4D893-7D39-4EF6-92D2-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:08:12.1791062', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'362', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'769BA84E-B15F-48DA-92D3-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:08:15.2178431', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'18', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7D737BF6-D531-4F8D-92D4-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:08:21.6572878', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'15', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'594DD83A-2B78-4435-92D5-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:08:34.8820933', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'186', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'759047D5-438E-4895-92D6-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:08:40.5306177', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'40', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'11C925BB-EEDE-4B80-92D7-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:08:49.6749809', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'193', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E9FBC738-BBEF-40AF-92D8-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:08:56.4857941', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'24', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'51991818-B3AB-454C-92D9-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:09:00.3944451', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'163', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D9B0F7CC-BFEA-4B85-92DA-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:09:03.6821882', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'26', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9FBCB9D4-F511-4AB8-92DB-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:09:38.2575240', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'404', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3708FB04-680D-47D3-92DC-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:10:04.8384851', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'250', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'4259BF29-863A-43BE-92DD-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:11:19.1610628', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'227', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'AADC7791-845B-4C42-92DE-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:11:37.3667235', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'226', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'49939583-75E3-47CD-92DF-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:15:00.5024279', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'300', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'22F98067-658B-4380-92E0-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:15:48.2278814', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'195', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'BD9976DE-68D8-413C-92E1-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:16:52.3333357', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'337', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8F262CDA-E0A7-4BDA-92E2-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:17:12.5577195', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'240', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B474A477-906F-4DEC-92E3-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:17:32.6855602', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'236', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'6B89707D-0DD0-45B9-92E4-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:17:45.1894289', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'262', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A3327D15-397E-4740-92E5-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:18:13.1864363', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'286', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'422BE0CC-A1B0-4554-92E6-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:18:38.9875473', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'313', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'027376D9-6871-4DAC-92E7-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:19:19.9008603', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'264', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'36E7B69C-A7E6-4C36-92E8-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:21:29.4390001', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'213', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'74D9240C-E92E-4AFC-92E9-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:21:44.8484967', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'203', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'728ADC71-5C47-41D8-92EA-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:21:49.8236106', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'24', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'CB343FC1-2758-43CA-92EB-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:21:53.5959285', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'25', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C014FFFC-42AF-42B7-92EC-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:22:08.1921645', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'326', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'454A0DAC-80BE-4864-92ED-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:22:26.3443671', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'141', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'91B8BC3A-DE5F-4BCC-92EE-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:23:34.2344291', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'258', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'42CE4809-D5C1-4001-92EF-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:24:59.8191023', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'200', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A470FF6B-6563-41F0-92F0-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:27:26.3594152', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'229', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'044382F1-181E-428D-92F1-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:27:58.6424981', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'210', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'51F3B7A8-444A-4E04-92F2-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:28:00.4126033', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'25', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'DB541E24-A3D1-4478-92F3-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:29:17.0277002', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'208', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2F64CB2D-CE83-4916-92F4-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:29:33.3639230', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'204', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'44786767-C84A-4A70-92F5-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:37:51.3671922', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'219', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7A24008E-107D-465D-92F6-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:38:19.1946319', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'218', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9601F576-92AF-409D-92F7-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:38:51.9011366', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'267', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1126F515-B25C-4BFB-92F8-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:39:44.6342816', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'321', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A2FB1F34-AD65-4386-92F9-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:40:58.1250440', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'490', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'EFC0A140-F7EF-4184-92FA-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:41:31.2828579', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'212', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7354558F-366E-4ECB-92FB-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:41:54.1335868', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'288', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'6CD714B8-BC7C-42F2-92FC-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:45:03.2317544', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'318', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1F7764F4-3F4E-4356-92FD-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:55:59.3699628', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'274', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9223F12C-E093-4276-92FE-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:57:04.0707391', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'254', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5F84C92B-60D0-4DF5-92FF-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:57:33.3920383', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'470', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F74F16AD-2951-4A80-9300-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:57:35.5624401', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'164', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A4BF052A-6ECA-48E8-9301-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:57:54.0958046', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'365', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0E412E69-BE39-48E2-9302-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:58:51.1029751', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'206', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'776D4FE9-1F65-4D61-9303-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 20:59:44.7824977', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'243', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'DC4349A1-4486-4B37-9304-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 21:00:35.1433474', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'283', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3B24244D-F873-4436-9305-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 21:01:16.1013726', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'575', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1EE8D353-7397-4AD5-9306-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 21:02:14.9529882', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'268', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7C8B6773-21E4-44FF-9307-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 21:03:38.4289364', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'245', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8405255B-B419-4CB5-9308-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 21:13:42.5160134', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'220', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'04DF0463-F6DA-46AB-9309-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 21:14:17.6769709', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'275', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9E765F74-62FF-4FBD-930A-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 21:14:33.5532274', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'204', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7252EC87-ABBD-4096-930B-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 21:14:43.6621878', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'132', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'4C661C34-B663-4F23-930C-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 21:14:48.4047987', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'19', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'6F063DF4-AB3F-4F1E-930D-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 21:17:23.8918689', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'198', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C284707D-772B-41F9-930E-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 21:23:25.2890246', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'122', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'BA415FE9-35CF-47F1-930F-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 21:23:29.3997834', NULL, NULL, N'/api/admin/SysMenu/findForm/11', N'0.0.0.1', N'', N'', N'', N'39', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'70A569B2-9872-4DD5-9310-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 21:24:55.2582674', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'474', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B45C7DBD-6ED2-418C-9311-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 21:24:58.4562485', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'23', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'005D1493-F64B-40E6-9312-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 21:25:01.5482481', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'42', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D14A663B-B53E-4819-9313-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 21:26:31.9327545', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'284', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0B0BCFA8-4653-4767-9314-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 21:26:35.8475173', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'42', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'59CFE6AF-C4AC-4FD6-9315-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 21:27:01.1540657', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'226', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F8238F5A-81A7-4DED-9316-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 21:27:04.0495161', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'42', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E3D4EA73-0D29-45DE-9317-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 21:27:27.8551504', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'315', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B5FBA501-3515-4ABC-9318-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 21:27:54.5840560', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'262', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'85E26C35-42D4-49BC-9319-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 21:37:59.9113744', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'550', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'76CE1D81-62A0-4BEB-931A-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 21:49:06.6817200', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'273', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0650D5B9-2E62-40E2-931B-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 21:49:44.1037080', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'80', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'97DD4610-EBC3-4CD4-931C-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 21:49:52.6492621', NULL, NULL, N'/api/admin/SysMenu/findForm/11', N'0.0.0.1', N'', N'', N'', N'86', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'DE610710-6DBF-44AD-931D-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 21:54:49.8238412', NULL, NULL, N'/api/admin/SysMenu/findForm/37', N'0.0.0.1', N'', N'', N'', N'94', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'FF9B2B30-E738-4A44-931E-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:00:25.0380812', NULL, NULL, N'/api/account/check', N'0.0.0.1', N'', N'{"userName":"admin","userPassword":"123456"}', N'', N'67', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'22EF782A-04D9-4789-931F-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:00:25.3168230', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'156', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'AF6A829E-0814-4A31-9320-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:00:32.4953977', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'35', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5061803D-9F0F-4BA4-9321-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:00:37.6393158', NULL, NULL, N'/api/admin/SysMenu/findForm/37', N'0.0.0.1', N'', N'', N'', N'36', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B811F295-4DEC-40FD-9322-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:10:46.4447128', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'242', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F86F8169-5105-435D-9323-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:10:51.4688669', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'45', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E8AF1E69-7D14-494C-9324-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:11:22.1713077', NULL, NULL, N'/api/admin/SysMenu/findForm/37', N'0.0.0.1', N'', N'', N'', N'59', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D223BDE6-45C6-439A-9325-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:15:13.1602717', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'267', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3C96D9A4-FF05-4108-9326-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:15:16.7074498', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'37', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A10E2767-9421-4724-9327-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:15:20.4243843', NULL, NULL, N'/api/admin/SysMenu/findForm/37', N'0.0.0.1', N'', N'', N'', N'38', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'295D3E26-D9DC-4A7B-9328-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:18:39.2970718', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'262', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B1FB34B4-07AF-4CA3-9329-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:18:42.5693978', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'94', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'59F57A0F-DC5B-45F6-932A-08DADF31F46E', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:18:46.4375411', NULL, NULL, N'/api/admin/SysMenu/findForm/11', N'0.0.0.1', N'', N'', N'', N'54', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A4439E06-C5AD-43FE-A1C8-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:24:36.0199170', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'75', N'Edge108', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'01E0CB89-C1E6-4284-A1C9-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:24:40.2579035', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'844', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'88ADDAD9-7F8C-4439-A1CA-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:24:40.2903093', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'845', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C13CDDB2-6323-4128-A1CB-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:24:45.5598890', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'153', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8B136C7A-1761-4837-A1CC-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:24:49.3802092', NULL, NULL, N'/api/admin/SysMenu/findForm/11', N'0.0.0.1', N'', N'', N'', N'170', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D0F584A1-4C40-489A-A1CD-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:24:56.4429000', NULL, NULL, N'/api/admin/SysMenu/update', N'0.0.0.1', N'', N'{"id":11,"form":{"levelCode":"1.11","number":70,"name":"微前端","componentName":"Iframe","url":"core/components/Iframe.vue","router":"/iframe","jumpUrl":"","icon":"RadarChartOutlined","parentId":1,"show":true,"close":true,"keepAlive":true,"state":true,"type":2,"mode":2,"moduleUrl":"http://rapidscada.com.cn/#/","moduleUrlPro":"111","id":11,"lastModifierUserId":"0198459e-2034-4533-b843-5d227ad20740","lastModificationTime":"2022-12-16 17:30:05","creatorUserId":null,"creationTime":"2021-08-05 21:51:12"},"allFunctions":[{"number":10,"name":"显示","byName":"Display","remark":"Display","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"c9518758-b2e1-4f51-b517-5282e273889c"},{"number":20,"name":"添加","byName":"Insert","remark":"Insert","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"bffefb1c-8988-4ddf-b4ac-81c2b30e80cd"},{"number":30,"name":"修改","byName":"Update","remark":"Update","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"e7ef2a05-8317-41c3-b588-99519fe88bf9"},{"number":40,"name":"删除","byName":"Delete","remark":"Delete","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"9c388461-2704-4c5e-a729-72c17e9018e1"},{"number":50,"name":"保存","byName":"Save","remark":"Save","lastModifierUserId":"0198459e-2034-4533-b843-5d227ad20740","lastModificationTime":"2022-09-28 22:12:02","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"383e7ee2-7690-46ac-9230-65155c84aa30"},{"number":60,"name":"检索","byName":"Search","remark":"Search","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"f27ecb0a-197d-47b1-b243-59a8c71302bf"},{"number":70,"name":"导出","byName":"Export","remark":"Export","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"2401f4d0-60b0-4e2e-903f-84c603373572"},{"number":80,"name":"打印","byName":"Print","remark":"Print","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2022-06-16 17:28:00","id":"b6fd5425-504a-46a9-993b-2f8dc9158eb8"}],"menuFunctionList":[{"number":10,"menuId":11,"functionCode":"Display","functionName":"显示","remark":"Display","lastModifierUserId":null,"lastModificationTime":"2022-03-04 15:24:53","creatorUserId":"0198459e-2034-4533-b843-5d227ad20740","creationTime":"2022-12-16 17:30:05","id":"3bc0e68f-d03d-4e99-0f26-08d9fdad00ab"}]}', N'', N'300', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'编辑表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C9855B99-B694-4089-A1CE-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:24:56.6607033', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'43', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'25AAE6E7-A6B0-429C-A1CF-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:25:27.7515770', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'40', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'4449B976-A2DD-4749-A1D0-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:25:31.6374138', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'35', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5BFC1DE4-7772-4D5D-A1D1-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:25:35.2044728', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'37', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'36E78F29-5224-44A7-A1D2-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:25:45.4344079', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'35', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'EF7C3883-836B-4EB1-A1D3-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:25:47.8470789', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'38', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'96BDBAD2-D4DE-4C5A-A1D4-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:25:51.9933165', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'44', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'11936F7C-BC5C-4664-A1D5-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:26:19.2513048', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'125', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D62A6B4B-1CE4-49E3-A1D6-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:28:33.1810551', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'202', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'CC8BAC93-7301-4C19-A1D7-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:28:36.5100955', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'56', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A4EB3152-6A9D-4069-A1D8-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:28:37.8597843', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'22', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'FE1AF074-4271-435A-A1D9-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:28:38.8060687', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'103', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'FED305D1-AA3B-48D1-A1DA-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:28:56.1191273', NULL, NULL, N'/api/admin/SysMenu/findForm/11', N'0.0.0.1', N'', N'', N'', N'40', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'ED076DA2-183C-43E3-A1DB-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:29:20.0529227', NULL, NULL, N'/api/admin/SysMenu/update', N'0.0.0.1', N'', N'{"id":11,"form":{"levelCode":"1.11","number":70,"name":"微前端","componentName":"Iframe","url":"core/components/Iframe.vue","router":"/iframe","jumpUrl":"","icon":"RadarChartOutlined","parentId":1,"show":true,"close":true,"keepAlive":true,"state":true,"type":2,"mode":2,"moduleUrl":"https://www.yuque.com/u378909/irw2xs/mkotelqbfrlqux8e/edit#rFnU","moduleUrlPro":"http://rapidscada.com.cn/#/","id":11,"lastModifierUserId":"0198459e-2034-4533-b843-5d227ad20740","lastModificationTime":"2022-12-16 22:24:56","creatorUserId":null,"creationTime":"2021-08-05 21:51:12"},"allFunctions":[{"number":10,"name":"显示","byName":"Display","remark":"Display","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"c9518758-b2e1-4f51-b517-5282e273889c"},{"number":20,"name":"添加","byName":"Insert","remark":"Insert","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"bffefb1c-8988-4ddf-b4ac-81c2b30e80cd"},{"number":30,"name":"修改","byName":"Update","remark":"Update","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"e7ef2a05-8317-41c3-b588-99519fe88bf9"},{"number":40,"name":"删除","byName":"Delete","remark":"Delete","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"9c388461-2704-4c5e-a729-72c17e9018e1"},{"number":50,"name":"保存","byName":"Save","remark":"Save","lastModifierUserId":"0198459e-2034-4533-b843-5d227ad20740","lastModificationTime":"2022-09-28 22:12:02","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"383e7ee2-7690-46ac-9230-65155c84aa30"},{"number":60,"name":"检索","byName":"Search","remark":"Search","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"f27ecb0a-197d-47b1-b243-59a8c71302bf"},{"number":70,"name":"导出","byName":"Export","remark":"Export","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"2401f4d0-60b0-4e2e-903f-84c603373572"},{"number":80,"name":"打印","byName":"Print","remark":"Print","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2022-06-16 17:28:00","id":"b6fd5425-504a-46a9-993b-2f8dc9158eb8"}],"menuFunctionList":[{"number":10,"menuId":11,"functionCode":"Display","functionName":"显示","remark":"Display","lastModifierUserId":null,"lastModificationTime":"2022-03-04 15:24:53","creatorUserId":"0198459e-2034-4533-b843-5d227ad20740","creationTime":"2022-12-16 22:24:56","id":"3bc0e68f-d03d-4e99-0f26-08d9fdad00ab"}]}', N'', N'158', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'编辑表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'4E2C08B0-A510-46EA-A1DC-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:29:20.3252450', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'43', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'244C713A-4C33-4BDB-A1DD-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:29:22.6406353', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'308', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F307030D-30A9-4555-A1DE-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:29:23.7042385', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'57', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0061A31D-03C8-4B09-A1DF-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:49:57.9675974', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'324', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1F10CA5C-B1A7-4EBF-A1E0-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:49:58.1396245', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'217', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'CD0B086C-DC55-49FB-A1E1-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:49:58.3467237', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'27', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B367374D-AC12-45A7-A1E2-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:49:58.6461086', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'25', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'65082100-A442-4576-A1E3-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:50:09.3997929', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'323', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B1E317A1-1BD5-498B-A1E4-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:50:09.8215682', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'18', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8AC97270-DC2D-4F20-A1E5-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:50:15.4540513', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'26', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C511E01F-6DAE-46F4-A1E6-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:50:16.3420537', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'45', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E2EE1F18-F4C5-4942-A1E7-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:50:16.6512325', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'332', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E1FEB9EE-D43A-4550-A1E8-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:50:16.8556855', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'34', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'01EC3583-C487-489C-A1E9-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:50:25.4463647', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'60', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F75AC56D-4F95-49D0-A1EA-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:50:26.3504312', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'38', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'4F09AE87-2356-4A1C-A1EB-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:50:27.6864390', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'227', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E1D6902A-4C77-4C6B-A1EC-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:50:28.0630857', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'23', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2FE945D1-D545-4646-A1ED-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:50:29.4599537', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'137', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3BB793BC-FD6C-448C-A1EE-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:50:29.5852393', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'16', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'CCC49FBD-AA9C-44AE-A1EF-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:50:34.0248029', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'19', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'52F09942-8170-4CAB-A1F0-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:50:34.3479858', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'21', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F8BA5BB6-EA0C-4C68-A1F1-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:50:34.8956263', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'29', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2F069E5F-0BDD-41C3-A1F2-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:50:35.1786799', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'270', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B3E3B7E9-8BAB-4ED2-A1F3-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:52:18.5214801', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'196', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9D2A56B8-7222-48B9-A1F4-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:52:29.5187769', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'302', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9E161935-58D9-4FF6-A1F5-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:54:00.5413708', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'342', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C71F8A46-B9C9-46D1-A1F6-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:57:55.4120181', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'391', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D055B52E-B17C-431C-A1F7-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 22:58:38.1986451', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'222', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8BB38B22-2F78-4D14-A1F8-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 23:01:53.4582876', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'184', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B148CBF8-BDB8-4E97-A1F9-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 23:02:23.5351457', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'303', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C1A79B43-613D-4475-A1FA-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 23:02:47.6408381', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'209', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'DCF98E9B-B3F4-43B4-A1FB-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 23:03:03.4068266', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'228', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'75458828-9B57-440F-A1FC-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 23:04:30.6801480', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'244', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'60A4056E-F9B2-4C2C-A1FD-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 23:06:02.3994742', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'178', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7F07C690-F558-4CFC-A1FE-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 23:06:11.0100383', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'42', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'32893127-BE1F-4EAE-A1FF-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 23:07:07.7660017', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'465', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'62532AF8-54F1-48C6-A200-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 23:07:09.2948400', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'259', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'42A95A24-984D-4FA4-A201-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 23:07:18.4694489', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'18', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'DA6A6368-5E2A-4345-A202-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 23:07:58.2497223', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'256', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'919F440E-A083-4BAA-A203-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 23:08:11.9652814', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'275', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'CCD29C72-8A67-4ADE-A204-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 23:08:56.3790089', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'206', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A7DB31F0-5CEF-4A14-A205-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 23:08:59.0637370', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'31', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'02C12692-9383-4E02-A206-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 23:09:56.4462511', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'166', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2123DB1E-9337-40A9-A207-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 23:10:04.6081352', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'28', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C3B3E1F5-D51A-4B5C-A208-08DADF7141EB', N'00000000-0000-0000-0000-000000000000', N'2022-12-16 23:11:55.8749562', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'230', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'39DD60FA-C9C7-4B62-5CFA-08DAE0081E0B', N'00000000-0000-0000-0000-000000000000', N'2022-12-17 16:24:29.8502811', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'84', N'Edge108', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'84F8EE23-E2D3-44F6-5CFB-08DAE0081E0B', N'00000000-0000-0000-0000-000000000000', N'2022-12-17 16:24:33.3431098', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'151', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'CBD5522A-ABA1-45FC-5CFC-08DAE0081E0B', N'00000000-0000-0000-0000-000000000000', N'2022-12-17 16:24:33.4282389', NULL, NULL, N'/api/account/check', N'0.0.0.1', N'', N'{"userName":"admin","userPassword":"123456"}', N'', N'274', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B586EDCD-4901-41D9-5CFD-08DAE0081E0B', N'00000000-0000-0000-0000-000000000000', N'2022-12-17 16:24:34.2639708', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'695', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'95EE4E95-1AC7-4EB9-5CFE-08DAE0081E0B', N'00000000-0000-0000-0000-000000000000', N'2022-12-17 16:25:05.8496647', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'127', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5F17837A-4148-4641-5CFF-08DAE0081E0B', N'00000000-0000-0000-0000-000000000000', N'2022-12-17 16:25:09.3883707', NULL, NULL, N'/api/admin/SysMenu/findForm/11', N'0.0.0.1', N'', N'', N'', N'141', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C9DA6078-F4D9-40B0-5D00-08DAE0081E0B', N'00000000-0000-0000-0000-000000000000', N'2022-12-17 16:25:15.3100662', NULL, NULL, N'/api/admin/SysMenu/update', N'0.0.0.1', N'', N'{"id":11,"form":{"levelCode":"1.11","number":70,"name":"微前端","componentName":"Iframe","url":"core/components/Iframe.vue","router":"/iframe","jumpUrl":"","icon":"RadarChartOutlined","parentId":1,"show":true,"close":true,"keepAlive":true,"state":true,"type":2,"mode":2,"moduleUrl":"https://www.yuque.com/u378909/yidf7v/bs256p","moduleUrlPro":"http://rapidscada.com.cn/#/","id":11,"lastModifierUserId":"0198459e-2034-4533-b843-5d227ad20740","lastModificationTime":"2022-12-16 22:29:19","creatorUserId":null,"creationTime":"2021-08-05 21:51:12"},"allFunctions":[{"number":10,"name":"显示","byName":"Display","remark":"Display","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"c9518758-b2e1-4f51-b517-5282e273889c"},{"number":20,"name":"添加","byName":"Insert","remark":"Insert","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"bffefb1c-8988-4ddf-b4ac-81c2b30e80cd"},{"number":30,"name":"修改","byName":"Update","remark":"Update","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"e7ef2a05-8317-41c3-b588-99519fe88bf9"},{"number":40,"name":"删除","byName":"Delete","remark":"Delete","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"9c388461-2704-4c5e-a729-72c17e9018e1"},{"number":50,"name":"保存","byName":"Save","remark":"Save","lastModifierUserId":"0198459e-2034-4533-b843-5d227ad20740","lastModificationTime":"2022-09-28 22:12:02","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"383e7ee2-7690-46ac-9230-65155c84aa30"},{"number":60,"name":"检索","byName":"Search","remark":"Search","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"f27ecb0a-197d-47b1-b243-59a8c71302bf"},{"number":70,"name":"导出","byName":"Export","remark":"Export","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"2401f4d0-60b0-4e2e-903f-84c603373572"},{"number":80,"name":"打印","byName":"Print","remark":"Print","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2022-06-16 17:28:00","id":"b6fd5425-504a-46a9-993b-2f8dc9158eb8"}],"menuFunctionList":[{"number":10,"menuId":11,"functionCode":"Display","functionName":"显示","remark":"Display","lastModifierUserId":null,"lastModificationTime":"2022-03-04 15:24:53","creatorUserId":"0198459e-2034-4533-b843-5d227ad20740","creationTime":"2022-12-16 22:29:20","id":"3bc0e68f-d03d-4e99-0f26-08d9fdad00ab"}]}', N'', N'408', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'编辑表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9FB91738-E7B2-43DF-5D01-08DAE0081E0B', N'00000000-0000-0000-0000-000000000000', N'2022-12-17 16:25:15.6353666', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'37', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B0D96428-3228-484E-5D02-08DAE0081E0B', N'00000000-0000-0000-0000-000000000000', N'2022-12-17 16:25:19.9734519', NULL, NULL, N'/api/admin/SysMenu/findForm/11', N'0.0.0.1', N'', N'', N'', N'42', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'76B9D224-76C9-4141-5D03-08DAE0081E0B', N'00000000-0000-0000-0000-000000000000', N'2022-12-17 16:25:29.1312468', NULL, NULL, N'/api/admin/SysMenu/update', N'0.0.0.1', N'', N'{"id":11,"form":{"levelCode":"1.11","number":70,"name":"微前端","componentName":"Iframe","url":"core/components/Iframe.vue","router":"/iframe","jumpUrl":"","icon":"RadarChartOutlined","parentId":1,"show":true,"close":true,"keepAlive":true,"state":true,"type":2,"mode":2,"moduleUrl":"http://rapidscada.com.cn/#/","moduleUrlPro":"https://www.yuque.com/u378909/yidf7v/bs256p","id":11,"lastModifierUserId":"0198459e-2034-4533-b843-5d227ad20740","lastModificationTime":"2022-12-17 16:25:15","creatorUserId":null,"creationTime":"2021-08-05 21:51:12"},"allFunctions":[{"number":10,"name":"显示","byName":"Display","remark":"Display","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"c9518758-b2e1-4f51-b517-5282e273889c"},{"number":20,"name":"添加","byName":"Insert","remark":"Insert","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"bffefb1c-8988-4ddf-b4ac-81c2b30e80cd"},{"number":30,"name":"修改","byName":"Update","remark":"Update","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"e7ef2a05-8317-41c3-b588-99519fe88bf9"},{"number":40,"name":"删除","byName":"Delete","remark":"Delete","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"9c388461-2704-4c5e-a729-72c17e9018e1"},{"number":50,"name":"保存","byName":"Save","remark":"Save","lastModifierUserId":"0198459e-2034-4533-b843-5d227ad20740","lastModificationTime":"2022-09-28 22:12:02","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"383e7ee2-7690-46ac-9230-65155c84aa30"},{"number":60,"name":"检索","byName":"Search","remark":"Search","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"f27ecb0a-197d-47b1-b243-59a8c71302bf"},{"number":70,"name":"导出","byName":"Export","remark":"Export","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2016-06-20 13:40:52","id":"2401f4d0-60b0-4e2e-903f-84c603373572"},{"number":80,"name":"打印","byName":"Print","remark":"Print","lastModifierUserId":null,"lastModificationTime":"2021-04-18 22:08:06","creatorUserId":null,"creationTime":"2022-06-16 17:28:00","id":"b6fd5425-504a-46a9-993b-2f8dc9158eb8"}],"menuFunctionList":[{"number":10,"menuId":11,"functionCode":"Display","functionName":"显示","remark":"Display","lastModifierUserId":null,"lastModificationTime":"2022-03-04 15:24:53","creatorUserId":"0198459e-2034-4533-b843-5d227ad20740","creationTime":"2022-12-17 16:25:15","id":"3bc0e68f-d03d-4e99-0f26-08d9fdad00ab"}]}', N'', N'126', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'编辑表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0706E1D4-630D-472F-5D04-08DAE0081E0B', N'00000000-0000-0000-0000-000000000000', N'2022-12-17 16:25:29.5533059', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'77', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'840242BB-8DDE-457C-5D05-08DAE0081E0B', N'00000000-0000-0000-0000-000000000000', N'2022-12-17 16:26:48.3360743', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'306', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'EAAA3DC7-7A7D-4C54-5D06-08DAE0081E0B', N'00000000-0000-0000-0000-000000000000', N'2022-12-17 16:26:51.9697246', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'48', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'17A6CE32-7C8C-4C0D-5D07-08DAE0081E0B', N'00000000-0000-0000-0000-000000000000', N'2022-12-17 16:27:54.2183189', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'260', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'DA0F47E3-5C7A-4C4A-5D08-08DAE0081E0B', N'00000000-0000-0000-0000-000000000000', N'2022-12-17 16:27:59.0064388', NULL, NULL, N'/api/admin/SysMenu/getAll', N'0.0.0.1', N'', N'{}', N'', N'70', N'Edge108', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'菜单', N'获取所有的菜单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E2A60012-051B-424F-4C71-08DAF50F1D85', N'00000000-0000-0000-0000-000000000000', N'2023-01-13 10:37:29.6650834', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'79', N'Edge108', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'45A4FDF8-2A30-4197-4C72-08DAF50F1D85', N'00000000-0000-0000-0000-000000000000', N'2023-01-13 10:37:30.3047640', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'337', N'Edge108', N'Windows10', NULL, N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F59CFD23-3946-4A45-2B26-08DAF515E0F7', N'00000000-0000-0000-0000-000000000000', N'2023-01-13 11:25:54.6306703', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'82', N'Edge108', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8230622B-8685-46CB-2B27-08DAF515E0F7', N'00000000-0000-0000-0000-000000000000', N'2023-01-13 11:25:55.3538871', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'323', N'Edge108', N'Windows10', NULL, N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B9807562-B7F3-40C1-2930-08DAF5162859', N'00000000-0000-0000-0000-000000000000', N'2023-01-13 11:27:54.2562307', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'80', N'Edge108', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3C810608-6207-4361-2931-08DAF5162859', N'00000000-0000-0000-0000-000000000000', N'2023-01-13 11:27:54.8053885', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'373', N'Edge108', N'Windows10', NULL, N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'62BFEDFD-457F-440A-A032-08DAF5168517', N'00000000-0000-0000-0000-000000000000', N'2023-01-13 11:30:30.0010327', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'79', N'Edge108', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9278DDDD-BF02-4BE3-A033-08DAF5168517', N'00000000-0000-0000-0000-000000000000', N'2023-01-13 11:30:30.3722601', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'304', N'Edge108', N'Windows10', NULL, N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D8BB2AF8-183D-4B92-A034-08DAF5168517', N'00000000-0000-0000-0000-000000000000', N'2023-01-13 11:30:31.3824023', NULL, NULL, N'/favicon.ico', N'0.0.0.1', N'', N'', N'', N'0', N'Edge108', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F8BF6C0A-8CB6-41ED-4447-08DAF51742F2', N'00000000-0000-0000-0000-000000000000', N'2023-01-13 11:35:48.4074726', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'62', N'Edge108', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'DB09325D-6A8D-4660-4448-08DAF51742F2', N'00000000-0000-0000-0000-000000000000', N'2023-01-13 11:35:48.8923258', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'275', N'Edge108', N'Windows10', NULL, N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'4D60C66D-94A6-47B8-176F-08DAF518E033', N'00000000-0000-0000-0000-000000000000', N'2023-01-13 11:47:21.8969761', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'77', N'Edge108', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B69F7FB4-53D8-42F0-1770-08DAF518E033', N'00000000-0000-0000-0000-000000000000', N'2023-01-13 11:47:22.6363360', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'325', N'Edge108', N'Windows10', NULL, N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5FA55937-E36E-4EE6-1771-08DAF518E033', N'00000000-0000-0000-0000-000000000000', N'2023-01-13 11:47:36.4505774', NULL, NULL, N'/swwa', N'0.0.0.1', N'', N'', N'', N'0', N'Edge108', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F085630A-C8A1-4669-6FAF-08DAF51FA014', N'00000000-0000-0000-0000-000000000000', N'2023-01-13 12:35:40.5952446', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'76', N'Edge108', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'4AB4975C-AC28-4157-6FB0-08DAF51FA014', N'00000000-0000-0000-0000-000000000000', N'2023-01-13 12:35:41.7048520', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'366', N'Edge108', N'Windows10', NULL, N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'25F557F0-1BCD-4864-73C6-08DB00E253F6', N'00000000-0000-0000-0000-000000000000', N'2023-01-28 11:47:07.5479500', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'78', N'Edge109', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'4BE17024-E304-4316-73C7-08DB00E253F6', N'00000000-0000-0000-0000-000000000000', N'2023-01-28 11:47:08.9669581', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'334', N'Edge109', N'Windows10', NULL, N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8874E9D6-C73E-4EC3-73C8-08DB00E253F6', N'00000000-0000-0000-0000-000000000000', N'2023-01-28 11:48:06.2533773', NULL, NULL, N'/favicon.ico', N'0.0.0.1', N'', N'', N'', N'0', N'Edge109', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F234CA17-2762-4682-4BF1-08DB00E3A613', N'00000000-0000-0000-0000-000000000000', N'2023-01-28 11:56:34.8301274', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'79', N'Edge109', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3088ACDC-3B33-494B-4BF2-08DB00E3A613', N'00000000-0000-0000-0000-000000000000', N'2023-01-28 11:56:35.1844546', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'0', N'Edge109', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5B8B6CE4-875A-4CAA-4BF3-08DB00E3A613', N'00000000-0000-0000-0000-000000000000', N'2023-01-28 11:56:53.3717148', NULL, NULL, N'/favicon.ico', N'0.0.0.1', N'', N'', N'', N'0', N'Edge109', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'38DE964D-8C92-48C1-E217-08DB00E3D4F6', N'00000000-0000-0000-0000-000000000000', N'2023-01-28 11:57:53.6502289', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'80', N'Edge109', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1D9239AC-C279-40AA-E218-08DB00E3D4F6', N'00000000-0000-0000-0000-000000000000', N'2023-01-28 11:57:54.1697914', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'346', N'Edge109', N'Windows10', NULL, N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0032F545-B1E2-4CC4-56A8-08DB01017FF5', N'00000000-0000-0000-0000-000000000000', N'2023-01-28 15:30:15.8213477', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'63', N'Edge109', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'26172174-F821-42C2-56A9-08DB01017FF5', N'00000000-0000-0000-0000-000000000000', N'2023-01-28 15:30:16.1907781', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'210', N'Edge109', N'Windows10', NULL, N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'FD378F03-F6D3-44FE-56AA-08DB01017FF5', N'00000000-0000-0000-0000-000000000000', N'2023-01-28 15:30:55.0740684', NULL, NULL, N'/api/account/check', N'0.0.0.1', N'', N'{"userName":"admin","userPassword":"123456"}', N'', N'1259', N'Edge109', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2F57ED56-BE6D-4A77-56AB-08DB01017FF5', N'00000000-0000-0000-0000-000000000000', N'2023-01-28 15:30:56.0872612', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'500', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5CB5AF0E-CAF4-442C-ABD1-08DB01A9B979', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 11:34:27.7397356', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'81', N'Edge109', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B902A9C2-9F15-4265-ABD2-08DB01A9B979', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 11:34:28.1727519', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'188', N'Edge109', N'Windows10', NULL, N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'51A50C1B-C663-4519-F065-08DB01AA4196', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 11:38:16.3332286', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'79', N'Edge109', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3785A1AC-570C-4B64-F066-08DB01AA4196', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 11:38:16.6192151', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'283', N'Edge109', N'Windows10', NULL, N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D3A7AAF6-4A7D-45EF-F067-08DB01AA4196', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 11:38:23.8323938', NULL, NULL, N'/api/account/check', N'0.0.0.1', N'', N'{"userName":"admin","userPassword":"123456"}', N'', N'532', N'Edge109', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'60A23DA7-6286-44BB-F068-08DB01AA4196', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 11:38:24.7118987', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'485', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'230F06B4-28EB-4286-F069-08DB01AA4196', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 11:38:30.2962013', NULL, NULL, N'/api/admin/QuartzTasks/findList/', N'0.0.0.1', N'', N'{}', N'', N'48', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5EF38A56-CC52-4F1F-F06A-08DB01AA4196', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 11:38:46.0984626', NULL, NULL, N'/api/admin/QuartzTasks/findList/', N'0.0.0.1', N'', N'{}', N'', N'29', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B2461856-9D93-4218-F06B-08DB01AA4196', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 11:39:00.9504811', NULL, NULL, N'/api/admin/QuartzTasks/findList/', N'0.0.0.1', N'', N'{}', N'', N'455', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F09DEE62-F248-400B-795A-08DB01AA9009', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 11:40:27.9746540', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'174', N'Edge109', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0894ACF7-E4E7-4C78-795B-08DB01AA9009', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 11:40:29.0914448', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'595', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F2BEBDD1-E41D-4A0D-795C-08DB01AA9009', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 11:40:37.0334420', NULL, NULL, N'/api/admin/QuartzTasks/findList/', N'0.0.0.1', N'', N'{}', N'', N'70', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0001C162-E379-4108-795D-08DB01AA9009', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 11:41:07.6739130', NULL, NULL, N'/api/admin/QuartzTasks/findList/', N'0.0.0.1', N'', N'{}', N'', N'49', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'726490B4-ADF3-4D11-0D67-08DB01AAF5D4', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 11:43:18.7717261', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'79', N'Edge109', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'19130BDC-B2D4-41F1-0D68-08DB01AAF5D4', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 11:43:19.9456186', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'600', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0332974B-E494-4BF9-0D69-08DB01AAF5D4', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 11:43:29.7436352', NULL, NULL, N'/api/admin/QuartzTasks/findList/', N'0.0.0.1', N'', N'{}', N'', N'69', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'38687883-8C80-4E21-0D6A-08DB01AAF5D4', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 11:44:20.6236155', NULL, NULL, N'/api/admin/QuartzTasks/findList/', N'0.0.0.1', N'', N'{}', N'', N'155', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3B485243-2B6A-4BCB-D3F1-08DB01ABFD25', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 11:50:40.2781434', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'80', N'Edge109', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B4532610-FB58-4A35-D3F2-08DB01ABFD25', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 11:50:41.6017692', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'598', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'EF4E88F9-266B-4CD4-D3F3-08DB01ABFD25', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 11:51:39.5308511', NULL, NULL, N'/api/admin/QuartzTasks/findList/', N'0.0.0.1', N'', N'{}', N'', N'108', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'89FA53A6-3B85-41E7-D3F4-08DB01ABFD25', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 11:52:04.9779345', NULL, NULL, N'/api/admin/QuartzTasks/run', N'0.0.0.1', N'', N'["0af155d7-a8ee-4a07-ab1a-40dd0c77d7ea"]', N'', N'323', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'运行任务')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'48F10F5F-6948-469D-D3F5-08DB01ABFD25', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 11:52:09.6441261', NULL, NULL, N'/api/admin/QuartzTasks/findList/', N'0.0.0.1', N'', N'{}', N'', N'28', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'4161E8E5-C79D-43E0-D3F6-08DB01ABFD25', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 11:52:26.9178047', NULL, NULL, N'/api/admin/QuartzTasks/findList/', N'0.0.0.1', N'', N'{}', N'', N'23', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E2504B92-C524-4F5B-D3F7-08DB01ABFD25', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 11:52:39.6103400', NULL, NULL, N'/api/admin/QuartzTasks/findList/', N'0.0.0.1', N'', N'{}', N'', N'30', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'53650D4A-3A0E-48A2-7BDA-08DB01AC977C', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 11:54:59.4756772', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'83', N'Edge109', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C891B0D4-1FC8-49ED-7BDB-08DB01AC977C', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 11:55:01.0274370', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'591', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'DC023674-1ECB-4EBF-7BDC-08DB01AC977C', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 11:55:29.3411497', NULL, NULL, N'/api/admin/QuartzTasks/findList/', N'0.0.0.1', N'', N'{}', N'', N'80', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3B81DC63-1612-4BAD-7BDD-08DB01AC977C', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 11:55:31.1788006', NULL, NULL, N'/api/admin/QuartzTasks/run', N'0.0.0.1', N'', N'["0af155d7-a8ee-4a07-ab1a-40dd0c77d7ea"]', N'', N'608', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'运行任务')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'BAD60B32-F1C0-4868-7BDE-08DB01AC977C', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 11:55:59.6691346', NULL, NULL, N'/api/admin/QuartzTasks/findList/', N'0.0.0.1', N'', N'{}', N'', N'27', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'DC7FE704-FEEE-4EA1-DD69-08DB01AD2AF8', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 11:59:06.6772853', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'81', N'Edge109', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D60DC7D2-2F16-4C26-DD6A-08DB01AD2AF8', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 11:59:07.7241321', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'574', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'6DA616F9-1164-4AE9-D211-08DB01ADA03D', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 12:02:23.3505935', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'79', N'Edge109', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F7148C47-F626-400D-D212-08DB01ADA03D', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 12:02:30.1580739', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'535', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3948B9AD-A298-499E-D213-08DB01ADA03D', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 12:03:27.7522073', NULL, NULL, N'/api/admin/LowCodeTable/findList', N'0.0.0.1', N'', N'{"page":1,"size":10,"search":{},"searchSort":[]}', N'', N'526', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1B82F381-F1ED-4899-D214-08DB01ADA03D', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 12:03:27.8667099', NULL, NULL, N'/api/admin/QuartzTasks/findList/', N'0.0.0.1', N'', N'{}', N'', N'36', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'70385976-D46D-4FBA-D215-08DB01ADA03D', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 12:03:30.8612056', NULL, NULL, N'/api/admin/QuartzTasks/findList/', N'0.0.0.1', N'', N'{}', N'', N'27', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'934B3B50-7EF9-4EF0-D216-08DB01ADA03D', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 12:03:32.3290875', NULL, NULL, N'/api/admin/QuartzTasks/getJobLoggers/0af155d7-a8ee-4a07-ab1a-40dd0c77d7ea/1/10', N'0.0.0.1', N'', N'', N'', N'69', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'查看运行日志')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1649FCB7-6DAE-4C3D-D217-08DB01ADA03D', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 12:03:34.5065420', NULL, NULL, N'/api/admin/QuartzTasks/getJobLoggers/0af155d7-a8ee-4a07-ab1a-40dd0c77d7ea/2/10', N'0.0.0.1', N'', N'', N'', N'45', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'查看运行日志')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'BA781D96-7661-402C-D218-08DB01ADA03D', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 12:03:35.8400533', NULL, NULL, N'/api/admin/QuartzTasks/getJobLoggers/0af155d7-a8ee-4a07-ab1a-40dd0c77d7ea/2/10', N'0.0.0.1', N'', N'', N'', N'35', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'查看运行日志')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'34E84905-23E6-437B-D219-08DB01ADA03D', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 12:03:36.5938773', NULL, NULL, N'/api/admin/QuartzTasks/getJobLoggers/0af155d7-a8ee-4a07-ab1a-40dd0c77d7ea/2/10', N'0.0.0.1', N'', N'', N'', N'49', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'查看运行日志')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'88D753E4-0405-44DC-D21A-08DB01ADA03D', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 12:03:39.0126626', NULL, NULL, N'/api/admin/QuartzTasks/getJobLoggers/0af155d7-a8ee-4a07-ab1a-40dd0c77d7ea/1/10', N'0.0.0.1', N'', N'', N'', N'43', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'查看运行日志')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'42732E3B-6166-4651-D21B-08DB01ADA03D', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 12:03:58.6214261', NULL, NULL, N'/api/admin/QuartzTasks/findList/', N'0.0.0.1', N'', N'{}', N'', N'30', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3C650FA2-2C6C-4D26-D21C-08DB01ADA03D', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 12:04:09.4997948', NULL, NULL, N'/api/admin/QuartzTasks/getJobLoggers/0af155d7-a8ee-4a07-ab1a-40dd0c77d7ea/2/10', N'0.0.0.1', N'', N'', N'', N'35', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'查看运行日志')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B961A8DA-7057-450D-D21D-08DB01ADA03D', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 12:04:13.3980751', NULL, NULL, N'/api/admin/QuartzTasks/getJobLoggers/0af155d7-a8ee-4a07-ab1a-40dd0c77d7ea/3/10', N'0.0.0.1', N'', N'', N'', N'44', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'查看运行日志')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'66624163-5C65-4D96-D21E-08DB01ADA03D', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 12:04:16.2486331', NULL, NULL, N'/api/admin/QuartzTasks/getJobLoggers/0af155d7-a8ee-4a07-ab1a-40dd0c77d7ea/2/10', N'0.0.0.1', N'', N'', N'', N'36', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'查看运行日志')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'426A35CA-AF28-404A-D21F-08DB01ADA03D', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 12:04:19.3565759', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'217', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'4C98DA4C-4441-492C-D220-08DB01ADA03D', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 12:04:19.6464972', NULL, NULL, N'/api/admin/QuartzTasks/findList/', N'0.0.0.1', N'', N'{}', N'', N'27', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B7A8B236-8FA4-4573-D221-08DB01ADA03D', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 12:04:20.8830372', NULL, NULL, N'/api/admin/QuartzTasks/getJobLoggers/0af155d7-a8ee-4a07-ab1a-40dd0c77d7ea/1/10', N'0.0.0.1', N'', N'', N'', N'52', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'查看运行日志')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2AAA9CD6-DB1D-488A-D1AF-08DB01D66387', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 16:54:10.8032626', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'68', N'Edge109', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D0D86D41-D510-498D-D1B0-08DB01D66387', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 16:54:12.2039009', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'532', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F2B029AE-D01A-4F59-F577-08DB01D683C6', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 16:55:04.8885677', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'61', N'Edge109', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A56DCEA2-C2AE-4F3F-F578-08DB01D683C6', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 16:55:06.5553543', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'533', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0D40C4E7-045D-4FAC-BF82-08DB01D8F4C2', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 17:12:33.4540049', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'78', N'Edge109', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C30EE82E-1A80-4C75-BF83-08DB01D8F4C2', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 17:12:34.7262891', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'553', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'983C34C3-ED5B-4612-BF84-08DB01D8F4C2', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 17:12:37.4918461', NULL, NULL, N'/api/admin/QuartzTasks/findList/', N'0.0.0.1', N'', N'{}', N'', N'65', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'051ECF35-866B-4742-BF85-08DB01D8F4C2', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 17:12:43.4004113', NULL, NULL, N'/api/admin/QuartzTasks/findList/', N'0.0.0.1', N'', N'{}', N'', N'25', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1CFD6C15-CED9-4A57-BF86-08DB01D8F4C2', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 17:12:45.9437657', NULL, NULL, N'/api/admin/QuartzTasks/findList/', N'0.0.0.1', N'', N'{}', N'', N'25', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C3C17F76-4BFE-4DE8-BF87-08DB01D8F4C2', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 17:12:56.8876742', NULL, NULL, N'/api/admin/QuartzTasks/findList/', N'0.0.0.1', N'', N'{}', N'', N'33', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D01C61E9-5B21-4AD6-0F7E-08DB01DBA34D', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 17:31:45.3674879', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'77', N'Edge109', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2C68AC81-7C89-45C4-0F7F-08DB01DBA34D', N'00000000-0000-0000-0000-000000000000', N'2023-01-29 17:31:46.7689678', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'554', N'Edge109', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取当前用户信息')
GO


-- ----------------------------
-- Table structure for sys_organization
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_organization]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_organization]
GO

CREATE TABLE [dbo].[sys_organization] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [CreatorUserId] uniqueidentifier  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [LastModificationTime] datetime2(7)  NULL,
  [Name] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [OrderNumber] int  NULL,
  [LevelCode] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Leader] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Phone] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Email] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [State] int  NULL,
  [ParentId] int  NULL
)
GO

ALTER TABLE [dbo].[sys_organization] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of sys_organization
-- ----------------------------
SET IDENTITY_INSERT [dbo].[sys_organization] ON
GO

INSERT INTO [dbo].[sys_organization] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Name], [OrderNumber], [LevelCode], [Leader], [Phone], [Email], [State], [ParentId]) VALUES (N'1', NULL, N'2021-05-27 20:50:31.0000000', NULL, N'2021-05-27 20:50:31.0000000', N'阿里巴巴集团', N'1', N'1', N'hzy', N'18410912184', N'18410912184@qq.com', N'1', NULL)
GO

INSERT INTO [dbo].[sys_organization] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Name], [OrderNumber], [LevelCode], [Leader], [Phone], [Email], [State], [ParentId]) VALUES (N'2', NULL, N'2021-05-27 22:33:44.0000000', NULL, N'2021-12-28 16:13:34.0000000', N'北京分部', N'3', N'1.2', N'北京分部', N'132123', N'13131', N'1', N'1')
GO

INSERT INTO [dbo].[sys_organization] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Name], [OrderNumber], [LevelCode], [Leader], [Phone], [Email], [State], [ParentId]) VALUES (N'3', NULL, N'2021-05-27 22:33:57.0000000', NULL, N'2021-05-27 22:33:57.0000000', N'市场部门', N'1', N'1.2.3', N'市场部门', N'234124234', N'234234@qq.com', N'1', N'2')
GO

INSERT INTO [dbo].[sys_organization] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Name], [OrderNumber], [LevelCode], [Leader], [Phone], [Email], [State], [ParentId]) VALUES (N'4', NULL, N'2021-05-27 22:34:11.0000000', NULL, N'2021-05-27 22:34:11.0000000', N'财务部门', N'2', N'1.2.4', N'财务部门', N'435543535', N'123@qq.com', N'1', N'2')
GO

INSERT INTO [dbo].[sys_organization] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Name], [OrderNumber], [LevelCode], [Leader], [Phone], [Email], [State], [ParentId]) VALUES (N'5', NULL, N'2021-05-27 21:01:50.0000000', NULL, N'2021-05-27 22:31:45.0000000', N'成都分部', N'2', N'1.5', N'成都分部', N'123123123', N'123@qq.com', N'1', N'1')
GO

INSERT INTO [dbo].[sys_organization] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Name], [OrderNumber], [LevelCode], [Leader], [Phone], [Email], [State], [ParentId]) VALUES (N'7', NULL, N'2021-05-27 22:32:08.0000000', NULL, N'2021-05-27 22:32:29.0000000', N'研发部门', N'1', N'1.5.7', N'研发部门', N'1234323423', N'12312@qq.com', N'1', N'5')
GO

INSERT INTO [dbo].[sys_organization] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Name], [OrderNumber], [LevelCode], [Leader], [Phone], [Email], [State], [ParentId]) VALUES (N'9', NULL, N'2021-05-27 22:33:25.0000000', NULL, N'2022-03-08 17:07:47.0000000', N'运维部门', N'4', N'1.5.9', N'运维部门', N'1232133452', N'12341@qq.com', N'1', N'5')
GO

INSERT INTO [dbo].[sys_organization] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Name], [OrderNumber], [LevelCode], [Leader], [Phone], [Email], [State], [ParentId]) VALUES (N'10', NULL, N'2021-05-27 22:32:59.0000000', NULL, N'2021-05-27 22:32:59.0000000', N'测试部门', N'3', N'1.5.10', N'测试部门', N'12313', N'123123@qq.com', N'1', N'5')
GO

INSERT INTO [dbo].[sys_organization] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Name], [OrderNumber], [LevelCode], [Leader], [Phone], [Email], [State], [ParentId]) VALUES (N'11', NULL, N'2022-03-08 17:00:20.0000000', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-04 17:50:10.0000000', N'技术部门', N'2', N'1.5.11', N'技术部门', N'12345678911', N'12345678901@qq.com', N'1', N'5')
GO

SET IDENTITY_INSERT [dbo].[sys_organization] OFF
GO


-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_post]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_post]
GO

CREATE TABLE [dbo].[sys_post] (
  [Id] uniqueidentifier  NOT NULL,
  [CreatorUserId] uniqueidentifier  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [LastModificationTime] datetime2(7)  NULL,
  [Number] int  NULL,
  [Code] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Name] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [State] int  NOT NULL,
  [Remarks] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[sys_post] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO [dbo].[sys_post] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [Code], [Name], [State], [Remarks]) VALUES (N'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622', NULL, N'2022-03-08 10:13:18.0000000', NULL, N'2022-03-08 10:13:18.0000000', N'5', N'dotnet_engineer', N'DotNet软件工程师', N'1', NULL)
GO

INSERT INTO [dbo].[sys_post] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [Code], [Name], [State], [Remarks]) VALUES (N'0716B4B0-9A06-43E9-8AE8-82C74875F83E', NULL, N'2021-05-27 20:26:35.0000000', NULL, N'2021-05-27 20:26:35.0000000', N'2', N'se', N'项目经理', N'1', NULL)
GO

INSERT INTO [dbo].[sys_post] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [Code], [Name], [State], [Remarks]) VALUES (N'96927C30-41D0-4CED-8E29-CBED35C90FB0', NULL, N'2021-05-27 20:26:22.0000000', NULL, N'2021-05-27 20:26:22.0000000', N'1', N'ceo', N'董事长', N'1', NULL)
GO

INSERT INTO [dbo].[sys_post] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [Code], [Name], [State], [Remarks]) VALUES (N'E46AF329-6D08-442C-9837-F22CFF954411', NULL, N'2021-05-27 20:26:52.0000000', NULL, N'2022-04-23 21:50:55.0000000', N'4', N'user', N'普通员工', N'1', NULL)
GO

INSERT INTO [dbo].[sys_post] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [Code], [Name], [State], [Remarks]) VALUES (N'F0C67537-8094-429A-B474-F54AC518609E', NULL, N'2021-05-27 20:26:44.0000000', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-04 17:03:50.0000000', N'3', N'hr', N'人力资源', N'1', NULL)
GO


-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_role]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_role]
GO

CREATE TABLE [dbo].[sys_role] (
  [Id] uniqueidentifier  NOT NULL,
  [CreatorUserId] uniqueidentifier  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [LastModificationTime] datetime2(7)  NULL,
  [Number] int  NULL,
  [Name] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Remark] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [DeleteLock] bit  NOT NULL
)
GO

ALTER TABLE [dbo].[sys_role] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO [dbo].[sys_role] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [Name], [Remark], [DeleteLock]) VALUES (N'18FA4771-6F58-46A3-80D2-6F0F5E9972E3', NULL, N'2016-07-06 17:59:20.0000000', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-04 14:02:19.0000000', N'1', N'超级管理员', N'超级管理员', N'1')
GO

INSERT INTO [dbo].[sys_role] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [Name], [Remark], [DeleteLock]) VALUES (N'40FF1844-C099-4061-98E0-CD6E544FCFD3', NULL, N'2016-07-06 17:59:20.0000000', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-04 14:04:32.0000000', N'2', N'普通用户', N'普通用户', N'1')
GO


-- ----------------------------
-- Table structure for sys_role_menu_function
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_role_menu_function]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_role_menu_function]
GO

CREATE TABLE [dbo].[sys_role_menu_function] (
  [Id] uniqueidentifier  NOT NULL,
  [CreatorUserId] uniqueidentifier  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [LastModificationTime] datetime2(7)  NULL,
  [RoleId] uniqueidentifier  NOT NULL,
  [MenuId] int  NOT NULL,
  [MenuFunctionId] uniqueidentifier  NOT NULL
)
GO

ALTER TABLE [dbo].[sys_role_menu_function] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of sys_role_menu_function
-- ----------------------------
INSERT INTO [dbo].[sys_role_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [RoleId], [MenuId], [MenuFunctionId]) VALUES (N'7AF695F2-0A26-464D-15E0-08DAD5C66E71', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-04 15:09:05.0000000', NULL, NULL, N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'2', N'A7CD04DB-BBE3-49B6-0F1E-08D9FDAD00AB')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [RoleId], [MenuId], [MenuFunctionId]) VALUES (N'CF8E1D9E-74E5-4F1E-15E1-08DAD5C66E71', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-04 15:09:05.0000000', NULL, NULL, N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'3', N'F64CFE50-1EF1-457F-0F20-08D9FDAD00AB')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [RoleId], [MenuId], [MenuFunctionId]) VALUES (N'CD6175D8-67CC-4F62-15E2-08DAD5C66E71', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-04 15:09:05.0000000', NULL, NULL, N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'19', N'C77C812A-1601-4311-0F70-08D9FDAD00AB')
GO


-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_user]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_user]
GO

CREATE TABLE [dbo].[sys_user] (
  [Id] uniqueidentifier  NOT NULL,
  [CreatorUserId] uniqueidentifier  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [LastModificationTime] datetime2(7)  NULL,
  [Name] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [LoginName] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Password] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Phone] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Email] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [DeleteLock] bit  NOT NULL,
  [OrganizationId] int  NULL
)
GO

ALTER TABLE [dbo].[sys_user] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO [dbo].[sys_user] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Name], [LoginName], [Password], [Phone], [Email], [DeleteLock], [OrganizationId]) VALUES (N'5722AF0F-2366-4FC9-62D5-08DA00E3D8A0', NULL, N'2022-03-08 17:13:02.0000000', NULL, N'2022-03-08 17:13:02.0000000', N'杜甫', N'杜甫', N'46F94C8DE14FB36680850768FF1B7F2A', N'12345678900', N'12345678900@qq.com', N'0', N'7')
GO

INSERT INTO [dbo].[sys_user] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Name], [LoginName], [Password], [Phone], [Email], [DeleteLock], [OrganizationId]) VALUES (N'4FD6A740-0CF1-4975-62D6-08DA00E3D8A0', NULL, N'2022-03-08 17:14:13.0000000', NULL, N'2022-03-08 17:14:13.0000000', N'李商隐', N'李商隐', N'46F94C8DE14FB36680850768FF1B7F2A', N'12345678900', N'12345678900@qq.com', N'0', N'7')
GO

INSERT INTO [dbo].[sys_user] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Name], [LoginName], [Password], [Phone], [Email], [DeleteLock], [OrganizationId]) VALUES (N'E225E163-31C9-4DA9-62D7-08DA00E3D8A0', NULL, N'2022-03-08 17:15:07.0000000', NULL, N'2022-03-08 17:15:07.0000000', N'苏轼', N'苏轼', N'46F94C8DE14FB36680850768FF1B7F2A', N'12345678900', N'12345678900@qq.com', N'0', N'7')
GO

INSERT INTO [dbo].[sys_user] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Name], [LoginName], [Password], [Phone], [Email], [DeleteLock], [OrganizationId]) VALUES (N'3739F349-7995-4C63-62D8-08DA00E3D8A0', NULL, N'2022-03-08 17:17:58.0000000', NULL, N'2022-03-08 17:17:58.0000000', N'白居易', N'白居易', N'46F94C8DE14FB36680850768FF1B7F2A', N'12345678900', N'12345678900@qq.com', N'0', N'7')
GO

INSERT INTO [dbo].[sys_user] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Name], [LoginName], [Password], [Phone], [Email], [DeleteLock], [OrganizationId]) VALUES (N'A3F9784C-5F00-4EC9-62D9-08DA00E3D8A0', NULL, N'2022-03-08 17:19:22.0000000', NULL, N'2022-03-08 17:19:22.0000000', N'陶渊明 ', N'陶渊明 ', N'46F94C8DE14FB36680850768FF1B7F2A', N'12345678900', N'12345678900@qq.com', N'0', N'7')
GO

INSERT INTO [dbo].[sys_user] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Name], [LoginName], [Password], [Phone], [Email], [DeleteLock], [OrganizationId]) VALUES (N'A1B6DAFB-2B6A-4FF9-62DA-08DA00E3D8A0', NULL, N'2022-03-08 17:19:55.0000000', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-04 12:06:00.0000000', N'屈原', N'屈原', N'46F94C8DE14FB36680850768FF1B7F2A', N'12345678900', N'12345678900@qq.com', N'0', N'7')
GO

INSERT INTO [dbo].[sys_user] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Name], [LoginName], [Password], [Phone], [Email], [DeleteLock], [OrganizationId]) VALUES (N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'2017-04-06 19:55:53.0000000', NULL, N'2022-03-08 17:27:36.0000000', N'超级管理员', N'admin', N'E10ADC3949BA59ABBE56E057F20F883E', N'10000000000', N'1396510655@qq.com', N'1', N'7')
GO

INSERT INTO [dbo].[sys_user] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Name], [LoginName], [Password], [Phone], [Email], [DeleteLock], [OrganizationId]) VALUES (N'AC18F496-E93D-42F0-B59E-E321ACC85335', NULL, N'2017-04-06 19:55:53.0000000', NULL, N'2022-03-08 10:12:14.0000000', N'李白', N'libai', N'E10ADC3949BA59ABBE56E057F20F883E', N'12345678900', N'12345678900@live.com', N'1', N'7')
GO


-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_user_post]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_user_post]
GO

CREATE TABLE [dbo].[sys_user_post] (
  [Id] uniqueidentifier  NOT NULL,
  [CreatorUserId] uniqueidentifier  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [LastModificationTime] datetime2(7)  NULL,
  [UserId] uniqueidentifier  NOT NULL,
  [PostId] uniqueidentifier  NOT NULL
)
GO

ALTER TABLE [dbo].[sys_user_post] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO [dbo].[sys_user_post] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [UserId], [PostId]) VALUES (N'ADE7E59B-0163-49EE-B2CE-12A59B90B0CF', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-09-28 21:49:42.0000000', NULL, NULL, N'4C178551-1F0F-463C-0D9A-08DAA158397B', N'0716B4B0-9A06-43E9-8AE8-82C74875F83E')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [UserId], [PostId]) VALUES (N'8AF7FF30-7411-423D-85A3-13740C5FEF87', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-12 10:36:51.0000000', NULL, N'2022-03-08 17:15:07.0000000', N'E225E163-31C9-4DA9-62D7-08DA00E3D8A0', N'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [UserId], [PostId]) VALUES (N'14F4AA4E-C910-40B3-AE8F-158D91BD06D9', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-12 10:36:51.0000000', NULL, N'2022-03-08 17:15:08.0000000', N'E225E163-31C9-4DA9-62D7-08DA00E3D8A0', N'E46AF329-6D08-442C-9837-F22CFF954411')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [UserId], [PostId]) VALUES (N'9EB74344-044D-4D86-A9F0-197BA416B964', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-10-20 21:02:11.0000000', NULL, N'2022-03-08 17:17:58.0000000', N'3739F349-7995-4C63-62D8-08DA00E3D8A0', N'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [UserId], [PostId]) VALUES (N'12C6BB86-494A-48C8-B8F4-1FAD0E20CE49', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-09-28 21:49:23.0000000', NULL, NULL, N'FFF73FA3-4298-4794-0D99-08DAA158397B', N'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [UserId], [PostId]) VALUES (N'575BF085-47BB-42F2-8B68-620CF460B164', NULL, N'2022-03-08 17:29:22.0000000', NULL, N'2022-03-08 17:29:22.0000000', N'0198459E-2034-4533-B843-5D227AD20740', N'96927C30-41D0-4CED-8E29-CBED35C90FB0')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [UserId], [PostId]) VALUES (N'AF1BEC7E-3309-4629-9606-72EEFA1826B3', NULL, N'2022-03-08 17:20:20.0000000', NULL, N'2022-03-08 17:20:20.0000000', N'CC186FE2-EE27-4292-62DB-08DA00E3D8A0', N'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [UserId], [PostId]) VALUES (N'B669EC48-AA60-441A-B59D-7F9BE7B94155', NULL, N'2022-07-06 21:49:13.0000000', NULL, N'2022-07-06 21:49:13.0000000', N'1550D6D4-0529-4FDD-62DC-08DA00E3D8A0', N'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [UserId], [PostId]) VALUES (N'B97331A7-E281-4027-AADE-9F068558826A', NULL, N'2022-03-08 17:13:02.0000000', NULL, N'2022-03-08 17:13:02.0000000', N'5722AF0F-2366-4FC9-62D5-08DA00E3D8A0', N'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [UserId], [PostId]) VALUES (N'0C1A55BA-6BD3-4810-A494-A6B9B7374D4D', NULL, N'2022-03-08 10:13:35.0000000', NULL, N'2022-03-08 10:13:35.0000000', N'AC18F496-E93D-42F0-B59E-E321ACC85335', N'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [UserId], [PostId]) VALUES (N'6F671077-C98D-4106-9736-BF2EDB6DB58D', NULL, N'2022-03-08 17:14:13.0000000', NULL, N'2022-03-08 17:14:13.0000000', N'4FD6A740-0CF1-4975-62D6-08DA00E3D8A0', N'E46AF329-6D08-442C-9837-F22CFF954411')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [UserId], [PostId]) VALUES (N'3D1B49B9-BD55-4F75-AAD7-E7B10E080D00', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-04 12:06:00.0000000', NULL, N'2022-06-21 19:59:02.0000000', N'A1B6DAFB-2B6A-4FF9-62DA-08DA00E3D8A0', N'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [UserId], [PostId]) VALUES (N'6C34F115-28DD-441A-81D5-F6598C97D44A', NULL, N'2022-03-08 17:19:22.0000000', NULL, N'2022-03-08 17:19:22.0000000', N'A3F9784C-5F00-4EC9-62D9-08DA00E3D8A0', N'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [UserId], [PostId]) VALUES (N'B797FF16-D6F7-45DB-83EC-F910B2612926', NULL, N'2022-03-08 17:14:13.0000000', NULL, N'2022-03-08 17:14:13.0000000', N'4FD6A740-0CF1-4975-62D6-08DA00E3D8A0', N'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622')
GO


-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_user_role]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_user_role]
GO

CREATE TABLE [dbo].[sys_user_role] (
  [Id] uniqueidentifier  NOT NULL,
  [CreatorUserId] uniqueidentifier  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [LastModificationTime] datetime2(7)  NULL,
  [UserId] uniqueidentifier  NOT NULL,
  [RoleId] uniqueidentifier  NOT NULL
)
GO

ALTER TABLE [dbo].[sys_user_role] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO [dbo].[sys_user_role] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [UserId], [RoleId]) VALUES (N'3DA871B8-FDA5-4935-B532-0FF0B3C3913B', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-04 12:06:00.0000000', NULL, N'2022-06-21 19:59:02.0000000', N'A1B6DAFB-2B6A-4FF9-62DA-08DA00E3D8A0', N'40FF1844-C099-4061-98E0-CD6E544FCFD3')
GO

INSERT INTO [dbo].[sys_user_role] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [UserId], [RoleId]) VALUES (N'CE9F61AC-79D8-426F-9066-36962C017BF6', NULL, N'2022-03-08 17:13:02.0000000', NULL, N'2022-03-08 17:13:02.0000000', N'5722AF0F-2366-4FC9-62D5-08DA00E3D8A0', N'40FF1844-C099-4061-98E0-CD6E544FCFD3')
GO

INSERT INTO [dbo].[sys_user_role] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [UserId], [RoleId]) VALUES (N'DBC656A6-4264-417D-97D8-577E1218FECA', NULL, N'2022-03-08 17:19:22.0000000', NULL, N'2022-03-08 17:19:22.0000000', N'A3F9784C-5F00-4EC9-62D9-08DA00E3D8A0', N'40FF1844-C099-4061-98E0-CD6E544FCFD3')
GO

INSERT INTO [dbo].[sys_user_role] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [UserId], [RoleId]) VALUES (N'E5396C4C-2B8C-468D-94C3-8D5BE0E559C1', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-10-20 21:02:11.0000000', NULL, N'2022-03-08 17:17:58.0000000', N'3739F349-7995-4C63-62D8-08DA00E3D8A0', N'40FF1844-C099-4061-98E0-CD6E544FCFD3')
GO

INSERT INTO [dbo].[sys_user_role] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [UserId], [RoleId]) VALUES (N'A9F8A23B-8C2F-43CC-97AF-8ED6F4C4D097', NULL, N'2022-03-08 17:14:13.0000000', NULL, N'2022-03-08 17:14:13.0000000', N'4FD6A740-0CF1-4975-62D6-08DA00E3D8A0', N'40FF1844-C099-4061-98E0-CD6E544FCFD3')
GO

INSERT INTO [dbo].[sys_user_role] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [UserId], [RoleId]) VALUES (N'982F0A52-E8C8-4B9F-91C7-BEB592D6502D', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-12 10:36:51.0000000', NULL, N'2022-03-08 17:15:07.0000000', N'E225E163-31C9-4DA9-62D7-08DA00E3D8A0', N'40FF1844-C099-4061-98E0-CD6E544FCFD3')
GO

INSERT INTO [dbo].[sys_user_role] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [UserId], [RoleId]) VALUES (N'1C9F81DF-C8A0-45BB-A272-C84BD3AF0C19', NULL, N'2022-03-08 17:29:22.0000000', NULL, N'2022-03-08 17:29:22.0000000', N'0198459E-2034-4533-B843-5D227AD20740', N'18FA4771-6F58-46A3-80D2-6F0F5E9972E3')
GO

INSERT INTO [dbo].[sys_user_role] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [UserId], [RoleId]) VALUES (N'FA1FDF14-3847-4194-894C-CD935A3DD9E6', NULL, N'2022-03-08 10:13:35.0000000', NULL, N'2022-03-08 10:13:35.0000000', N'AC18F496-E93D-42F0-B59E-E321ACC85335', N'40FF1844-C099-4061-98E0-CD6E544FCFD3')
GO


-- ----------------------------
-- Primary Key structure for table __EFMigrationsHistory
-- ----------------------------
ALTER TABLE [dbo].[__EFMigrationsHistory] ADD CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED ([MigrationId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table flow
-- ----------------------------
ALTER TABLE [dbo].[flow] ADD CONSTRAINT [PK_flow] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table flow_approval
-- ----------------------------
ALTER TABLE [dbo].[flow_approval] ADD CONSTRAINT [PK_flow_approval] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table flow_approval_step_history
-- ----------------------------
ALTER TABLE [dbo].[flow_approval_step_history] ADD CONSTRAINT [PK_flow_approval_step_history] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table flow_approval_step_history_user
-- ----------------------------
ALTER TABLE [dbo].[flow_approval_step_history_user] ADD CONSTRAINT [PK_flow_approval_step_history_user] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table flow_node
-- ----------------------------
ALTER TABLE [dbo].[flow_node] ADD CONSTRAINT [PK_flow_node] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table low_code_list
-- ----------------------------
ALTER TABLE [dbo].[low_code_list] ADD CONSTRAINT [PK_low_code_list] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table low_code_search
-- ----------------------------
ALTER TABLE [dbo].[low_code_search] ADD CONSTRAINT [PK_low_code_search] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table low_code_table
-- ----------------------------
ALTER TABLE [dbo].[low_code_table] ADD CONSTRAINT [PK_low_code_table] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table low_code_table_info
-- ----------------------------
ALTER TABLE [dbo].[low_code_table_info] ADD CONSTRAINT [PK_low_code_table_info] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table member
-- ----------------------------
ALTER TABLE [dbo].[member] ADD CONSTRAINT [PK_member] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table quartz_job_task
-- ----------------------------
ALTER TABLE [dbo].[quartz_job_task] ADD CONSTRAINT [PK__sys_quar__3214EC07876CB510] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table quartz_job_task_log
-- ----------------------------
ALTER TABLE [dbo].[quartz_job_task_log] ADD CONSTRAINT [PK__sys_quar__3214EC07390562A8] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table sys_data_authority
-- ----------------------------
ALTER TABLE [dbo].[sys_data_authority] ADD CONSTRAINT [PK_sys_data_authority] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table sys_data_authority_custom
-- ----------------------------
ALTER TABLE [dbo].[sys_data_authority_custom] ADD CONSTRAINT [PK_sys_data_authority_custom] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for sys_dictionary
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[sys_dictionary]', RESEED, 4)
GO


-- ----------------------------
-- Primary Key structure for table sys_dictionary
-- ----------------------------
ALTER TABLE [dbo].[sys_dictionary] ADD CONSTRAINT [PK_sys_dictionary] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table sys_function
-- ----------------------------
ALTER TABLE [dbo].[sys_function] ADD CONSTRAINT [PK_sys_function] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for sys_menu
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[sys_menu]', RESEED, 37)
GO


-- ----------------------------
-- Primary Key structure for table sys_menu
-- ----------------------------
ALTER TABLE [dbo].[sys_menu] ADD CONSTRAINT [PK_sys_menu] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table sys_menu_function
-- ----------------------------
ALTER TABLE [dbo].[sys_menu_function] ADD CONSTRAINT [PK_sys_menu_function] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table sys_operation_log
-- ----------------------------
ALTER TABLE [dbo].[sys_operation_log] ADD CONSTRAINT [PK_sys_operation_log] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for sys_organization
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[sys_organization]', RESEED, 11)
GO


-- ----------------------------
-- Primary Key structure for table sys_organization
-- ----------------------------
ALTER TABLE [dbo].[sys_organization] ADD CONSTRAINT [PK_sys_organization] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table sys_post
-- ----------------------------
ALTER TABLE [dbo].[sys_post] ADD CONSTRAINT [PK_sys_post] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table sys_role
-- ----------------------------
ALTER TABLE [dbo].[sys_role] ADD CONSTRAINT [PK_sys_role] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table sys_role_menu_function
-- ----------------------------
ALTER TABLE [dbo].[sys_role_menu_function] ADD CONSTRAINT [PK_sys_role_menu_function] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table sys_user
-- ----------------------------
ALTER TABLE [dbo].[sys_user] ADD CONSTRAINT [PK_sys_user] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table sys_user_post
-- ----------------------------
ALTER TABLE [dbo].[sys_user_post] ADD CONSTRAINT [PK_sys_user_post] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table sys_user_role
-- ----------------------------
ALTER TABLE [dbo].[sys_user_role] ADD CONSTRAINT [PK_sys_user_role] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

