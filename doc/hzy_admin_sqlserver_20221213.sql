/*
 Navicat Premium Data Transfer

 Source Server         : 本地_SqlServer
 Source Server Type    : SQL Server
 Source Server Version : 14001000
 Source Host           : .:1433
 Source Catalog        : hzy_admin_sqlserver_20221212
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 14001000
 File Encoding         : 65001

 Date: 13/12/2022 22:23:19
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
  [ModuleUrl] varchar(500) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[sys_menu] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of sys_menu
-- ----------------------------
SET IDENTITY_INSERT [dbo].[sys_menu] ON
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl]) VALUES (N'1', NULL, N'2021-05-28 11:49:02.0000000', NULL, N'2022-03-04 12:25:39.0000000', N'1', N'10', N'更多示例', NULL, NULL, NULL, NULL, N'MoreOutlined', NULL, N'1', N'1', N'1', N'1', N'1', N'1', NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl]) VALUES (N'2', NULL, N'2021-01-16 16:05:22.0000000', NULL, N'2022-03-18 12:06:20.0000000', N'1.2', N'10', N'查看更多组件', N'AppComponentsCom', N'views/example/AppComponents.vue', N'/app/components', NULL, N'LayoutOutlined', N'1', N'1', N'1', N'1', N'1', N'2', N'1', NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl]) VALUES (N'3', NULL, N'2020-12-17 14:58:05.0000000', NULL, N'2022-03-04 12:26:14.0000000', N'1.3', N'30', N'按钮', N'ButtonCom', N'views/example/Button.vue', N'/button', NULL, N'AppstoreOutlined', N'1', N'1', N'1', N'1', N'1', N'2', N'1', NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl]) VALUES (N'4', NULL, N'2021-01-16 16:06:33.0000000', NULL, N'2022-03-04 12:26:21.0000000', N'1.4', N'40', N'图表 AntV G2', NULL, NULL, NULL, NULL, N'PieChartOutlined', N'1', N'1', N'1', N'1', N'1', N'1', N'1', NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl]) VALUES (N'5', NULL, N'2021-01-16 16:07:24.0000000', NULL, N'2022-03-04 12:26:25.0000000', N'1.4.5', N'10', N'基础图表', N'ChartBaseCom', N'views/example/chart/Base.vue', N'/chart/base', NULL, NULL, N'4', N'1', N'1', N'1', N'1', N'2', N'1', NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl]) VALUES (N'6', NULL, N'2021-01-16 16:10:06.0000000', NULL, N'2022-03-04 12:26:28.0000000', N'1.4.6', N'20', N'更多图表', N'ChartMoreCom', N'views/example/chart/More.vue', N'/chart/more', NULL, NULL, N'4', N'1', N'1', N'1', N'1', N'2', N'1', NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl]) VALUES (N'7', NULL, N'2018-03-10 12:16:38.0000000', NULL, N'2022-03-04 12:26:34.0000000', N'1.7', N'50', N'表格管理', NULL, NULL, NULL, NULL, N'TableOutlined', N'1', N'1', N'1', N'1', N'1', N'1', N'1', NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl]) VALUES (N'8', NULL, N'2020-12-17 14:49:12.0000000', NULL, N'2022-03-04 12:26:38.0000000', N'1.7.8', N'100', N'基础列表', N'BaseListCom', N'views/example/BaseList.vue', N'/base/list', NULL, NULL, N'7', N'1', N'1', N'1', N'1', N'2', N'1', NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl]) VALUES (N'9', NULL, N'2020-12-17 14:51:07.0000000', NULL, N'2022-03-04 12:26:41.0000000', N'1.7.9', N'110', N'标准表格', N'ListIndexCom', N'views/example/list/Index.vue', N'/list', NULL, NULL, N'7', N'1', N'1', N'1', N'1', N'2', N'1', NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl]) VALUES (N'10', NULL, N'2021-01-18 19:34:28.0000000', NULL, N'2022-03-04 12:26:46.0000000', N'1.10', N'60', N'富文本编辑器', N'EditorCom', N'views/example/Editor.vue', N'/editor', NULL, N'PicRightOutlined', N'1', N'1', N'1', N'1', N'1', N'2', N'1', NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl]) VALUES (N'11', NULL, N'2021-08-05 21:51:12.0000000', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-13 21:57:11.3135871', N'1.11', N'70', N'微前端', N'', N'', N'', N'', N'RadarChartOutlined', N'1', N'1', N'1', N'1', N'1', N'2', N'2', N'http://rapidscada.com.cn/#/')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl]) VALUES (N'12', NULL, N'2018-03-10 12:16:38.0000000', NULL, N'2022-03-04 12:25:43.0000000', N'12', N'50', N'基础信息', NULL, NULL, NULL, NULL, N'GoldOutlined', NULL, N'1', N'1', N'1', N'1', N'1', N'1', NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl]) VALUES (N'13', NULL, N'2018-03-10 12:16:38.0000000', NULL, N'2022-03-04 12:26:55.0000000', N'12.13', N'10', N'会员管理', N'base_member', N'views/base/member/Index.vue', N'/base/member', NULL, N'UsergroupAddOutlined', N'12', N'1', N'1', N'1', N'1', N'2', N'1', NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl]) VALUES (N'14', NULL, N'2018-03-10 12:16:38.0000000', NULL, N'2022-03-04 12:25:46.0000000', N'14', N'100', N'系统管理', NULL, NULL, NULL, NULL, N'DesktopOutlined', NULL, N'1', N'1', N'1', N'1', N'1', N'1', NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl]) VALUES (N'15', NULL, N'2018-03-10 12:16:38.0000000', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-04 16:28:51.0000000', N'14.15', N'100', N'账户管理', N'system_user', N'views/system/sys_user/Index.vue', N'/system/user', NULL, N'UserOutlined', N'14', N'1', N'1', N'1', N'1', N'2', N'1', NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl]) VALUES (N'16', NULL, N'2018-03-10 12:16:38.0000000', NULL, N'2022-04-22 22:24:03.0000000', N'14.16', N'110', N'角色管理', N'system_role', N'views/system/sys_role/Index.vue', N'/system/role', NULL, N'TeamOutlined', N'14', N'1', N'1', N'1', N'1', N'2', N'1', NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl]) VALUES (N'17', NULL, N'2018-03-10 12:16:38.0000000', NULL, N'2022-03-04 12:27:11.0000000', N'14.17', N'120', N'功能管理', N'system_function', N'views/system/sys_function/Index.vue', N'/system/function', NULL, N'ControlOutlined', N'14', N'1', N'1', N'1', N'1', N'2', N'1', NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl]) VALUES (N'19', NULL, N'2018-03-10 12:16:38.0000000', NULL, N'2022-03-04 12:27:19.0000000', N'14.19', N'150', N'个人中心', N'system_personal_center', N'views/system/personal_center/Index.vue', N'/system/personal/center', NULL, N'FormOutlined', N'14', N'1', N'1', N'1', N'1', N'2', N'1', NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl]) VALUES (N'20', NULL, N'2021-05-27 17:29:49.0000000', NULL, N'2022-03-04 12:27:23.0000000', N'14.20', N'160', N'岗位管理', N'system_post', N'views/system/sys_post/Index.vue', N'/system/post', NULL, N'IdcardOutlined', N'14', N'1', N'1', N'1', N'1', N'2', N'1', NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl]) VALUES (N'21', NULL, N'2021-05-27 20:27:56.0000000', NULL, N'2022-03-04 12:27:27.0000000', N'14.21', N'170', N'组织机构', N'system_organization', N'views/system/sys_organization/Index.vue', N'/system/organization', NULL, N'ClusterOutlined', N'14', N'1', N'1', N'1', N'1', N'2', N'1', NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl]) VALUES (N'22', NULL, N'2018-03-10 12:17:03.0000000', NULL, N'2022-03-04 12:27:41.0000000', N'29.22', N'10', N'接口文档', N'swagger', N'views/development_tool/Swagger.vue', N'/development_tool/swagger', NULL, N'FileSearchOutlined', N'29', N'1', N'1', N'1', N'1', N'2', N'1', NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl]) VALUES (N'23', NULL, N'2021-07-25 21:50:01.0000000', NULL, N'2022-03-04 12:27:31.0000000', N'14.23', N'190', N'数据字典', N'system_dictionary', N'views/system/sys_dictionary/Index.vue', N'/system/dictionary', NULL, N'FileDoneOutlined', N'14', N'1', N'1', N'1', N'1', N'2', N'1', NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl]) VALUES (N'24', NULL, N'2021-08-05 21:24:54.0000000', NULL, N'2022-03-04 12:27:35.0000000', N'14.24', N'200', N'操作日志', N'sys_operation_log', N'views/system/sys_operation_log/Index.vue', N'/system/sys_operation_log', N'', N'ContainerOutlined', N'14', N'1', N'1', N'1', N'1', N'2', N'1', NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl]) VALUES (N'25', NULL, N'2018-03-10 12:16:38.0000000', NULL, N'2022-03-04 12:27:15.0000000', N'14.25', N'130', N'菜单功能', N'system_menu', N'views/system/sys_menu/Index.vue', N'/system/menu', NULL, N'MenuOutlined', N'14', N'1', N'1', N'1', N'1', N'2', N'1', NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl]) VALUES (N'28', NULL, N'2021-12-29 17:13:26.0000000', NULL, N'2022-03-04 12:26:00.0000000', N'1.28', N'1', N'Vxe-Table', N'VxeTableCom', N'views/example/VxeTable.vue', N'/vxe/table', NULL, N'BorderlessTableOutlined', N'1', N'1', N'1', N'1', N'1', N'2', N'1', NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl]) VALUES (N'29', NULL, N'2022-01-12 14:17:21.0000000', NULL, N'2022-03-04 12:25:49.0000000', N'29', N'200', N'开发工具', NULL, NULL, NULL, NULL, N'CodepenOutlined', NULL, N'1', N'1', N'1', N'1', N'1', N'1', NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl]) VALUES (N'30', NULL, N'2022-01-12 14:22:04.0000000', NULL, N'2022-03-04 12:27:44.0000000', N'29.30', N'20', N'定时任务', N'TimedTaskCom', N'views/development_tool/timed_task/Index.vue', N'/development_tool/timed_task', NULL, N'FieldTimeOutlined', N'29', N'1', N'1', N'1', N'1', N'2', N'1', NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl]) VALUES (N'31', NULL, N'2022-01-12 15:39:46.0000000', NULL, N'2022-05-24 22:05:57.0000000', N'29.31', N'30', N'代码生成', N'LowCode', N'views/development_tool/low_code/Index.vue', N'/development-tool/low-code', NULL, N'CodeTwoTone', N'29', N'1', N'1', N'1', N'1', N'2', N'1', NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl]) VALUES (N'32', NULL, N'2022-02-24 10:51:38.0000000', NULL, N'2022-03-18 12:06:38.0000000', N'1.32', N'20', N'图标展示', N'IconsVue', N'views/example/Icons.vue', N'/icons', NULL, N'TagsTwoTone', N'1', N'1', N'1', N'1', N'1', N'2', N'1', NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl]) VALUES (N'33', NULL, N'2022-04-10 10:55:41.0000000', NULL, N'2022-04-10 10:56:17.0000000', N'29.33', N'40', N'EFCore监控台', N'monitor_efcore', N'views/development_tool/monitor_efcore/Index.vue', N'/development_tool/monitor/efcore', NULL, N'DashboardFilled', N'29', N'1', N'1', N'1', N'1', N'2', N'1', NULL)
GO

INSERT INTO [dbo].[sys_menu] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [Mode], [ModuleUrl]) VALUES (N'36', NULL, N'2022-04-17 17:45:25.0000000', NULL, N'2022-04-17 17:49:13.0000000', N'12.13.36', N'1', N'详情', N'base_member_info_Details', N'views/base/member/components/Details.vue', N'/base/member/details/:id/:title', NULL, NULL, N'13', N'0', N'1', N'1', N'1', N'2', N'1', NULL)
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

INSERT INTO [dbo].[sys_menu_function] ([Id], [CreatorUserId], [CreationTime], [LastModifierUserId], [LastModificationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'3BC0E68F-D03D-4E99-0F26-08D9FDAD00AB', N'0198459E-2034-4533-B843-5D227AD20740', N'2022-12-13 21:57:11.3470627', NULL, N'2022-03-04 15:24:53.0000000', N'10', N'11', N'Display', N'显示', N'Display')
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
DBCC CHECKIDENT ('[dbo].[sys_menu]', RESEED, 36)
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

