/*
 Navicat Premium Data Transfer

 Source Server         : 本地_SqlServer
 Source Server Type    : SQL Server
 Source Server Version : 14001000
 Source Host           : .:1433
 Source Catalog        : hzy_admin_sqlserver_20220920
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 14001000
 File Encoding         : 65001

 Date: 20/09/2022 20:42:29
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

-- ----------------------------
-- Table structure for flow
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[flow]') AND type IN ('U'))
	DROP TABLE [dbo].[flow]
GO

CREATE TABLE [dbo].[flow] (
  [Id] uniqueidentifier  NOT NULL,
  [LastModificationTime] datetime2(7)  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [CreatorUserId] uniqueidentifier  NOT NULL,
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
  [LastModificationTime] datetime2(7)  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [CreatorUserId] uniqueidentifier  NOT NULL,
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
  [LastModificationTime] datetime2(7)  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [CreatorUserId] uniqueidentifier  NULL,
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
  [LastModificationTime] datetime2(7)  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [CreatorUserId] uniqueidentifier  NULL,
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
  [LastModificationTime] datetime2(7)  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [CreatorUserId] uniqueidentifier  NULL,
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
  [LastModificationTime] datetime2(7)  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [CreatorUserId] uniqueidentifier  NULL,
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
  [LastModificationTime] datetime2(7)  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [CreatorUserId] uniqueidentifier  NULL,
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
  [LastModificationTime] datetime2(7)  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [CreatorUserId] uniqueidentifier  NULL,
  [TableName] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Schema] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Type] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [DisplayName] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [EntityName] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Remark] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [ProjectRootPath] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [ModelPath] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [ServicePath] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [ControllerPath] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [IndexVuePath] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [InfoVuePath] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [ServiceJsPath] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [IsCover] bit  NULL
)
GO

ALTER TABLE [dbo].[low_code_table] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of low_code_table
-- ----------------------------
INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'69B24F04-0ED3-45FC-91D9-0DC929175A57', N'2022-08-01 20:32:25.3341382', N'2022-04-17 00:00:00.0000000', NULL, NULL, N'sys_user_post', N'dbo', N'TABLE', N'用户与岗位', N'SysUserPost', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'7F94E0DB-FC63-40DC-BFE3-18C5AAD75975', N'2022-08-01 20:32:25.3341369', N'2022-07-29 00:00:00.0000000', NULL, NULL, N'flow_approval_step_history_user', N'dbo', N'TABLE', N'', N'FlowApprovalStepHistoryUser', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'2022-08-01 20:32:25.3341372', N'2022-05-23 00:00:00.0000000', NULL, NULL, N'low_code_table', N'dbo', N'TABLE', N'低代码表', N'LowCodeTable', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'651BB982-1130-4E1C-9070-36B90DCF2324', N'2022-07-29 21:59:11.3821074', N'2022-04-17 00:00:00.0000000', NULL, NULL, N'flow_approval_step', NULL, NULL, N'工作流审批步骤配置', N'FlowApprovalStep', NULL, NULL, N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'524E71B4-CBF7-4248-8B29-3F99B43F2EB2', N'2022-08-01 20:32:25.3341374', N'2022-04-17 00:00:00.0000000', NULL, NULL, N'sys_data_authority_custom', N'dbo', N'TABLE', N'自定义数据权限', N'SysDataAuthorityCustom', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'7AD3B915-F0BD-443A-89CD-42D41DD6C554', N'2022-07-29 21:59:11.3821072', N'2022-04-17 00:00:00.0000000', NULL, NULL, N'flow_approval_step_user', NULL, NULL, N'工作流用户审批步骤', N'FlowApprovalStepUser', NULL, NULL, N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'1A8DF018-79F8-4E26-B4EB-4B735AAE7275', N'2022-08-01 20:32:25.3341367', N'2022-04-17 00:00:00.0000000', NULL, NULL, N'flow', N'dbo', N'TABLE', N'审批流', N'Flow', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'2022-08-01 20:32:25.3341377', N'2022-04-17 00:00:00.0000000', NULL, NULL, N'sys_operation_log', N'dbo', N'TABLE', N'操作日志', N'SysOperationLog', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'2AE9E532-7D9A-474B-B629-50A39945C44D', N'2022-08-01 20:32:25.3341377', N'2022-04-17 00:00:00.0000000', NULL, NULL, N'sys_menu_function', N'dbo', N'TABLE', N'菜单功能', N'SysMenuFunction', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'D8948C56-C5BD-4061-B272-5417375F38F0', N'2022-08-01 20:32:25.3341368', N'2022-04-17 00:00:00.0000000', NULL, NULL, N'flow_approval', N'dbo', N'TABLE', N'审批流审批', N'FlowApproval', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'2022-08-01 20:32:25.3341378', N'2022-04-17 00:00:00.0000000', NULL, NULL, N'sys_organization', N'dbo', N'TABLE', N'组织', N'SysOrganization', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'6323638B-A45F-4A76-886E-69A9E9BE0901', N'2022-08-01 20:32:25.3341381', N'2022-04-17 00:00:00.0000000', NULL, NULL, N'sys_user', N'dbo', N'TABLE', N'用户', N'SysUser', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'2022-08-01 20:32:25.3341373', N'2022-05-23 00:00:00.0000000', NULL, NULL, N'low_code_table_info', N'dbo', N'TABLE', N'低代码表信息', N'LowCodeTableInfo', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'AF37F705-7BA0-4883-B1BE-8A274EA4C026', N'2022-08-01 20:32:25.3341375', N'2022-04-17 00:00:00.0000000', NULL, NULL, N'sys_dictionary', N'dbo', N'TABLE', N'数据字典', N'SysDictionary', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'73C97832-4E7F-4758-86D2-94327971B5FD', N'2022-08-01 20:32:25.3341373', N'2022-04-17 00:00:00.0000000', NULL, NULL, N'member', N'dbo', N'TABLE', N'会员', N'Member', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'2022-08-01 20:32:25.3341376', N'2022-04-17 00:00:00.0000000', NULL, NULL, N'sys_menu', N'dbo', N'TABLE', N'菜单', N'SysMenu', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'F3D7BBB3-C1FB-4D61-92A4-9BC101811335', N'2022-08-01 20:32:25.3341379', N'2022-04-17 00:00:00.0000000', NULL, NULL, N'sys_role', N'dbo', N'TABLE', N'角色', N'SysRole', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'852F53FF-0D00-4C32-AA55-A9C11993751B', N'2022-08-01 20:32:25.3341370', N'2022-05-23 00:00:00.0000000', NULL, NULL, N'low_code_list', N'dbo', N'TABLE', N'低代码列表', N'LowCodeList', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'AE6D94D8-6A15-4348-B600-AA17E4B61718', N'2022-08-01 20:32:25.3341370', N'2022-04-17 00:00:00.0000000', NULL, NULL, N'flow_node', N'dbo', N'TABLE', N'工作流节点', N'FlowNode', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'69EDD8A8-1D24-478C-A909-B82039EDCEC0', N'2022-08-01 20:32:25.3341371', N'2022-05-23 00:00:00.0000000', NULL, NULL, N'low_code_search', N'dbo', N'TABLE', N'低代码检索表', N'LowCodeSearch', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'18FBB18E-CB29-45D8-A5F3-C0121C57680A', N'2022-08-01 20:32:25.3341368', N'2022-07-29 00:00:00.0000000', NULL, NULL, N'flow_approval_step_history', N'dbo', N'TABLE', N'', N'FlowApprovalStepHistory', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'6FABC67A-8B48-49A6-8BA1-C8A32C499D36', N'2022-08-01 20:32:25.3341376', N'2022-04-17 00:00:00.0000000', NULL, NULL, N'sys_function', N'dbo', N'TABLE', N'功能', N'SysFunction', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'0A8BDB18-758A-4798-9FFC-E7031DCBF262', N'2022-08-01 20:32:25.3341379', N'2022-04-17 00:00:00.0000000', NULL, NULL, N'sys_post', N'dbo', N'TABLE', N'岗位', N'SysPost', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'8DA38D20-8A09-4E81-8DD8-ED6702AEE380', N'2022-08-01 20:32:25.3341380', N'2022-04-17 00:00:00.0000000', NULL, NULL, N'sys_role_menu_function', N'dbo', N'TABLE', N'角色菜单功能关联', N'SysRoleMenuFunction', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'E79DB53B-7162-4669-9B5E-F860501475AC', N'2022-08-01 20:32:25.3341374', N'2022-04-17 00:00:00.0000000', NULL, NULL, N'sys_data_authority', N'dbo', N'TABLE', N'数据权限', N'SysDataAuthority', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'3DA5D264-2E8D-460C-A10C-FF9A6BB57A60', N'2022-08-01 20:32:25.3341382', N'2022-04-17 00:00:00.0000000', NULL, NULL, N'sys_user_role', N'dbo', N'TABLE', N'用户与角色', N'SysUserRole', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO


-- ----------------------------
-- Table structure for low_code_table_info
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[low_code_table_info]') AND type IN ('U'))
	DROP TABLE [dbo].[low_code_table_info]
GO

CREATE TABLE [dbo].[low_code_table_info] (
  [Id] uniqueidentifier  NOT NULL,
  [LastModificationTime] datetime2(7)  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [CreatorUserId] uniqueidentifier  NULL,
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
INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'60019CD9-49EB-489B-97B5-08DA39A2EF6C', N'2022-05-19 22:26:18.0000000', N'2022-05-19 00:00:00.0000000', NULL, NULL, N'3DA5D264-2E8D-460C-A10C-FF9A6BB57A60', N'1', N'0', N'0', N'170', N'Id', N'Id', N'uniqueidentifier', N'Guid', N'Id', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'825E69B9-CD33-4AB8-97B6-08DA39A2EF6C', N'2022-05-19 22:26:18.0000000', N'2022-05-19 00:00:00.0000000', NULL, NULL, N'3DA5D264-2E8D-460C-A10C-FF9A6BB57A60', N'0', N'0', N'1', N'174', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'252AC7B2-0E62-48E1-97B7-08DA39A2EF6C', N'2022-05-19 22:26:18.0000000', N'2022-05-19 00:00:00.0000000', NULL, NULL, N'3DA5D264-2E8D-460C-A10C-FF9A6BB57A60', N'0', N'0', N'1', N'173', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'2029BB6D-A0F2-41DE-97B8-08DA39A2EF6C', N'2022-05-19 22:26:18.0000000', N'2022-05-19 00:00:00.0000000', NULL, NULL, N'3DA5D264-2E8D-460C-A10C-FF9A6BB57A60', N'0', N'0', N'1', N'172', N'RoleId', N'', N'uniqueidentifier', N'Guid', N'RoleId', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'18B4430B-765D-4A71-97B9-08DA39A2EF6C', N'2022-05-19 22:26:18.0000000', N'2022-05-19 00:00:00.0000000', NULL, NULL, N'3DA5D264-2E8D-460C-A10C-FF9A6BB57A60', N'0', N'0', N'1', N'171', N'UserId', N'', N'uniqueidentifier', N'Guid', N'UserId', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'A72C0341-82E8-48AD-D481-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'1A8DF018-79F8-4E26-B4EB-4B735AAE7275', N'1', N'0', N'0', N'24', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'70E30A70-99F9-44B3-D482-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'1A8DF018-79F8-4E26-B4EB-4B735AAE7275', N'0', N'0', N'1', N'28', N'Code', N'编码', N'nvarchar(255)', N'String', N'Code', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'5FC01EB0-4833-4E93-D483-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'1A8DF018-79F8-4E26-B4EB-4B735AAE7275', N'0', N'0', N'1', N'26', N'CreationTime', N'', N'datetime', N'DateTime', N'CreationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'FD9ABF54-3C88-44B0-D484-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'1A8DF018-79F8-4E26-B4EB-4B735AAE7275', N'0', N'0', N'1', N'25', N'LastModificationTime', N'', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'06F4F5A9-F63F-4E47-D485-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'1A8DF018-79F8-4E26-B4EB-4B735AAE7275', N'0', N'0', N'1', N'29', N'Name', N'流程名称', N'nvarchar(255)', N'String', N'Name', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'5CB41F1C-E68A-47F9-D486-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'1A8DF018-79F8-4E26-B4EB-4B735AAE7275', N'0', N'0', N'1', N'27', N'Number', N'排序号', N'int', N'Int32', N'Number', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'F21D4C33-E65A-4DFE-D487-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'1A8DF018-79F8-4E26-B4EB-4B735AAE7275', N'0', N'0', N'1', N'30', N'Remark', N'备注', N'nvarchar(255)', N'String', N'Remark', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'B9BBAB1D-0A03-4D07-D488-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'D8948C56-C5BD-4061-B272-5417375F38F0', N'1', N'0', N'0', N'31', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'01CA178C-112A-4A49-D489-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'D8948C56-C5BD-4061-B272-5417375F38F0', N'0', N'0', N'1', N'33', N'CreationTime', N'', N'datetime', N'DateTime', N'CreationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'A0FDEB45-C9FE-439B-D48A-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'D8948C56-C5BD-4061-B272-5417375F38F0', N'0', N'0', N'1', N'39', N'FlowCode', N'流程编码', N'varchar(255)', N'String', N'FlowCode', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'2B4747ED-0409-4D14-D48B-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'D8948C56-C5BD-4061-B272-5417375F38F0', N'0', N'0', N'1', N'38', N'FlowId', N'流程Id', N'uniqueidentifier', N'Guid', N'FlowId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'F00CDE73-2294-40D6-D48C-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'D8948C56-C5BD-4061-B272-5417375F38F0', N'0', N'0', N'1', N'40', N'FlowName', N'流程名称', N'varchar(255)', N'String', N'FlowName', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'CAAE5D6F-F9C7-4EDB-D48D-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'D8948C56-C5BD-4061-B272-5417375F38F0', N'0', N'0', N'1', N'37', N'FormId', N'表单Id', N'varchar(50)', N'String', N'FormId', N'50', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'609A52AA-48B2-4E64-D48E-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'D8948C56-C5BD-4061-B272-5417375F38F0', N'0', N'0', N'1', N'32', N'LastModificationTime', N'', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'3071360B-C1EF-4DFF-D48F-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'D8948C56-C5BD-4061-B272-5417375F38F0', N'0', N'0', N'1', N'36', N'LaunchTime', N'发起时间', N'datetime', N'DateTime', N'LaunchTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'ACF079D0-3DB9-43F7-D490-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'D8948C56-C5BD-4061-B272-5417375F38F0', N'0', N'0', N'1', N'34', N'UserId', N'发起人Id', N'uniqueidentifier', N'Guid', N'UserId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'6284C929-4115-4C17-D491-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'D8948C56-C5BD-4061-B272-5417375F38F0', N'0', N'0', N'1', N'35', N'UserName', N'发起人', N'varchar(255)', N'String', N'UserName', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'F5C93CC7-50A6-4E0E-D492-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'651BB982-1130-4E1C-9070-36B90DCF2324', N'1', N'0', N'0', N'41', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'F6D23541-2FCA-40E6-D493-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'52', N'ApprovalDate', N'审批时间', N'datetime', N'DateTime', N'ApprovalDate', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'8AD408DB-B5AA-4CB7-D494-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'43', N'CreationTime', N'', N'datetime', N'DateTime', N'CreationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'2FFAA9EE-C286-4F90-D495-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'45', N'FlowNodeId', N'审批流节点Id', N'uniqueidentifier', N'Guid', N'FlowNodeId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'AAA312A2-73FB-4C84-D496-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'46', N'FlowNodeName', N'审批流节点名称', N'varchar(255)', N'String', N'FlowNodeName', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'043612F1-E16A-4C44-D497-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'42', N'LastModificationTime', N'', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'A8BE7873-7CE4-4CB2-D498-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'49', N'OpinIons', N'步骤审批意见', N'varchar(255)', N'String', N'OpinIons', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'E8E60481-FB7F-4F1D-D499-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'44', N'Sort', N'步骤顺序号', N'int', N'Int32', N'Sort', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'2A1C3F3D-4EFC-472B-D49A-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'47', N'SortMore', N'多次审批顺序号（可能是多次审批次数）', N'int', N'Int32', N'SortMore', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'CBD75568-2ECE-4F90-D49B-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'48', N'State', N'步骤状态（待审批、同意、不同意、回退升级审批）', N'int', N'Int32', N'State', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'E67FD0C6-A997-4956-D49C-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'50', N'UserId', N'步骤审批人Id', N'uniqueidentifier', N'Guid', N'UserId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'24DB7ED8-1A4F-4B25-D49D-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'51', N'UserName', N'步骤审批人名称', N'varchar(255)', N'String', N'UserName', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'E346CF76-EC76-4409-D49E-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'7AD3B915-F0BD-443A-89CD-42D41DD6C554', N'1', N'0', N'0', N'53', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'AE55FABC-3944-4A36-D49F-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'7AD3B915-F0BD-443A-89CD-42D41DD6C554', N'0', N'0', N'1', N'55', N'CreationTime', N'', N'datetime', N'DateTime', N'CreationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'B754AF63-F1DE-4000-D4A0-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'7AD3B915-F0BD-443A-89CD-42D41DD6C554', N'0', N'0', N'1', N'56', N'FlowApprovalStepId', N'步骤Id', N'uniqueidentifier', N'Guid', N'FlowApprovalStepId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'495FE86E-5BD6-44D4-D4A1-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'7AD3B915-F0BD-443A-89CD-42D41DD6C554', N'0', N'0', N'1', N'57', N'FlowNodeId', N'审批节点Id', N'uniqueidentifier', N'Guid', N'FlowNodeId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'D48C70E6-4549-41B6-D4A2-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'7AD3B915-F0BD-443A-89CD-42D41DD6C554', N'0', N'0', N'1', N'58', N'FlowNodeName', N'审批节点名称', N'varchar(500)', N'String', N'FlowNodeName', N'500', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'0E864B91-B667-4F53-D4A3-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'7AD3B915-F0BD-443A-89CD-42D41DD6C554', N'0', N'0', N'1', N'54', N'LastModificationTime', N'', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'92BC9094-160E-4338-D4A4-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'7AD3B915-F0BD-443A-89CD-42D41DD6C554', N'0', N'0', N'1', N'59', N'UserId', N'审批人Id', N'uniqueidentifier', N'Guid', N'UserId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'0CFC881C-98D4-4A2C-D4A5-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'7AD3B915-F0BD-443A-89CD-42D41DD6C554', N'0', N'0', N'1', N'60', N'UserName', N'审批人名称', N'varchar(500)', N'String', N'UserName', N'500', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'2819DFE7-F12B-483C-D4A6-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'AE6D94D8-6A15-4348-B600-AA17E4B61718', N'1', N'0', N'0', N'61', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'0E19400D-1876-4FE3-D4A7-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'AE6D94D8-6A15-4348-B600-AA17E4B61718', N'0', N'0', N'1', N'63', N'CreationTime', N'', N'datetime', N'DateTime', N'CreationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'5CA84ECF-5971-45BC-D4A8-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'AE6D94D8-6A15-4348-B600-AA17E4B61718', N'0', N'0', N'1', N'65', N'FlowCode', N'', N'nvarchar(255)', N'String', N'FlowCode', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'9BC385E0-10EE-4299-D4A9-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'AE6D94D8-6A15-4348-B600-AA17E4B61718', N'0', N'0', N'1', N'64', N'FlowId', N'', N'uniqueidentifier', N'Guid', N'FlowId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'D45AC420-E348-4D6B-D4AA-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'AE6D94D8-6A15-4348-B600-AA17E4B61718', N'0', N'0', N'1', N'62', N'LastModificationTime', N'', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'0DF6B078-B248-4C83-D4AB-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'AE6D94D8-6A15-4348-B600-AA17E4B61718', N'0', N'0', N'1', N'67', N'Name', N'', N'nvarchar(255)', N'String', N'Name', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'2321AAC8-0EED-4B87-D4AC-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'AE6D94D8-6A15-4348-B600-AA17E4B61718', N'0', N'0', N'1', N'69', N'Remark', N'', N'nvarchar(255)', N'String', N'Remark', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'73D17476-E006-4530-D4AD-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'AE6D94D8-6A15-4348-B600-AA17E4B61718', N'0', N'0', N'1', N'68', N'RoleId', N'', N'uniqueidentifier', N'Guid', N'RoleId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'E571FD26-B1A8-4648-D4AE-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'AE6D94D8-6A15-4348-B600-AA17E4B61718', N'0', N'0', N'1', N'66', N'Sort', N'', N'int', N'Int32', N'Sort', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'C2F1A286-2B35-41D6-D4AF-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'852F53FF-0D00-4C32-AA55-A9C11993751B', N'1', N'0', N'0', N'189', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'92C1FFFC-5A00-468C-D4B0-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'852F53FF-0D00-4C32-AA55-A9C11993751B', N'0', N'0', N'1', N'191', N'CreationTime', N'', N'datetime', N'DateTime', N'CreationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'7B900BAF-65DF-4910-D4B1-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'852F53FF-0D00-4C32-AA55-A9C11993751B', N'0', N'0', N'1', N'195', N'ForeignKeyTableFieldName', N'', N'varchar(50)', N'String', N'ForeignKeyTableFieldName', N'50', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'E7FACEE2-5132-4003-D4B2-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'852F53FF-0D00-4C32-AA55-A9C11993751B', N'0', N'0', N'1', N'194', N'ForeignKeyTableId', N'', N'uniqueidentifier', N'Guid', N'ForeignKeyTableId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'2AE91C1D-D618-4267-D4B3-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'852F53FF-0D00-4C32-AA55-A9C11993751B', N'0', N'0', N'1', N'190', N'LastModificationTime', N'', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'A2660342-556E-4AEF-D4B4-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'852F53FF-0D00-4C32-AA55-A9C11993751B', N'0', N'0', N'1', N'193', N'Low_Code_Table_InfoId', N'', N'uniqueidentifier', N'Guid', N'Low_Code_Table_InfoId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'585E18EA-AB50-4216-D4B5-08DA3D8D5A26', N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000', NULL, NULL, N'852F53FF-0D00-4C32-AA55-A9C11993751B', N'0', N'0', N'1', N'192', N'Low_Code_TableId', N'', N'uniqueidentifier', N'Guid', N'Low_Code_TableId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'7C7400ED-EC08-4832-D4B6-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'69EDD8A8-1D24-478C-A909-B82039EDCEC0', N'1', N'0', N'0', N'184', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'A29E0236-9C06-4A70-D4B7-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'69EDD8A8-1D24-478C-A909-B82039EDCEC0', N'0', N'0', N'1', N'186', N'CreationTime', N'', N'datetime', N'DateTime', N'CreationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'8237D289-05CF-485B-D4B8-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'69EDD8A8-1D24-478C-A909-B82039EDCEC0', N'0', N'0', N'1', N'185', N'LastModificationTime', N'', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'1A2A9E15-DC83-49E1-D4B9-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'69EDD8A8-1D24-478C-A909-B82039EDCEC0', N'0', N'0', N'1', N'188', N'Low_Code_Table_InfoId', N'', N'uniqueidentifier', N'Guid', N'Low_Code_Table_InfoId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'7B4DF31F-36A3-477C-D4BA-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'69EDD8A8-1D24-478C-A909-B82039EDCEC0', N'0', N'0', N'1', N'187', N'Low_Code_TableId', N'', N'uniqueidentifier', N'Guid', N'Low_Code_TableId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'9B1B319A-E9DC-406D-D4C4-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'1', N'0', N'0', N'196', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'11AFCF11-9B42-47CE-D4C5-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'204', N'ColumnName', N'', N'varchar(500)', N'String', N'ColumnName', N'500', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'1E40D97A-49EE-4727-D4C6-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'198', N'CreationTime', N'', N'datetime', N'DateTime', N'CreationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'E0E9D3C3-B713-419C-D4C7-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'208', N'CsField', N'', N'varchar(50)', N'String', N'CsField', N'50', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'EB846AC3-723E-4207-D4C8-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'207', N'CsType', N'', N'varchar(50)', N'String', N'CsType', N'50', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'48B12860-84DE-4F7B-D4C9-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'206', N'DatabaseColumnType', N'', N'varchar(50)', N'String', N'DatabaseColumnType', N'50', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'3B959124-21D2-45B9-D4CA-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'205', N'Describe', N'', N'varchar(50)', N'String', N'Describe', N'50', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'86B95BF0-4418-46BA-D4CB-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'201', N'IsIdentity', N'', N'bit', N'Boolean', N'IsIdentity', N'1', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'5FEA8348-AA6B-4577-D4CC-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'202', N'IsNullable', N'', N'bit', N'Boolean', N'IsNullable', N'1', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'1D3C8224-A3A5-4B88-D4CD-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'200', N'IsPrimary', N'', N'bit', N'Boolean', N'IsPrimary', N'1', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'CF99D60B-2392-493C-D4CE-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'197', N'LastModificationTime', N'', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'F221DA94-0A1D-4CE7-D4CF-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'199', N'Low_Code_TableId', N'', N'uniqueidentifier', N'Guid', N'Low_Code_TableId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'DE43269D-D43B-4A77-D4D0-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'209', N'MaxLength', N'', N'int', N'Int32', N'MaxLength', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'4AAA1E18-8C06-4806-D4D1-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'203', N'Position', N'', N'int', N'Int32', N'Position', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'E75B8650-EE49-4F83-D4D2-08DA3D8D5A26', N'2022-06-08 21:20:04.0000000', N'2022-05-24 00:00:00.0000000', NULL, NULL, N'73C97832-4E7F-4758-86D2-94327971B5FD', N'1', N'0', N'0', N'70', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'B7FBB61F-94FC-4242-D4D3-08DA3D8D5A26', N'2022-06-08 21:20:04.0000000', N'2022-05-24 00:00:00.0000000', NULL, NULL, N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'75', N'Birthday', N'', N'datetime2', N'DateTime', N'Birthday', NULL, N'生日')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'5541E535-7CBE-43D2-D4D4-08DA3D8D5A26', N'2022-06-08 21:20:04.0000000', N'2022-05-24 00:00:00.0000000', NULL, NULL, N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'80', N'CreationTime', N'创建时间', N'datetime2', N'DateTime', N'CreationTime', NULL, N'创建时间')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'E4245F5F-BFFA-43F0-D4D5-08DA3D8D5A26', N'2022-06-08 21:20:04.0000000', N'2022-05-24 00:00:00.0000000', NULL, NULL, N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'78', N'FilePath', N'文件地址', N'nvarchar(255)', N'String', N'FilePath', NULL, N'文件地址')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'8326CA11-09F1-4C38-D4D6-08DA3D8D5A26', N'2022-06-08 21:20:04.0000000', N'2022-05-24 00:00:00.0000000', NULL, NULL, N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'77', N'Introduce', N'', N'nvarchar(255)', N'String', N'Introduce', NULL, N'简介')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'897A208C-2E13-46F1-D4D7-08DA3D8D5A26', N'2022-06-08 21:20:04.0000000', N'2022-05-24 00:00:00.0000000', NULL, NULL, N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'81', N'LastModificationTime', N'更新时间', N'datetime2', N'DateTime', N'LastModificationTime', NULL, N'更新时间')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'D1EB49CF-C053-4226-D4D8-08DA3D8D5A26', N'2022-06-08 21:20:04.0000000', N'2022-05-24 00:00:00.0000000', NULL, NULL, N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'72', N'Name', N'', N'nvarchar(255)', N'String', N'Name', NULL, N'会员名称')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'BF24A276-6ED0-49D4-D4D9-08DA3D8D5A26', N'2022-06-08 21:20:04.0000000', N'2022-05-24 00:00:00.0000000', NULL, NULL, N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'71', N'Number', N'', N'nvarchar(255)', N'String', N'Number', NULL, N'编号')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'669B87CE-C694-4C8C-D4DA-08DA3D8D5A26', N'2022-06-08 21:20:04.0000000', N'2022-05-24 00:00:00.0000000', NULL, NULL, N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'73', N'Phone', N'', N'nvarchar(255)', N'String', N'Phone', NULL, N'联系电话')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'F03AC01C-E0CF-4F13-D4DB-08DA3D8D5A26', N'2022-06-08 21:20:04.0000000', N'2022-05-24 00:00:00.0000000', NULL, NULL, N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'76', N'Photo', N'', N'nvarchar(255)', N'String', N'Photo', NULL, N'头像')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'72AC247C-D792-4FEE-D4DC-08DA3D8D5A26', N'2022-06-08 21:20:04.0000000', N'2022-05-24 00:00:00.0000000', NULL, NULL, N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'74', N'Sex', N'', N'nvarchar(255)', N'String', N'Sex', NULL, N'性别')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'837B058B-A88E-4107-D4DD-08DA3D8D5A26', N'2022-06-08 21:20:04.0000000', N'2022-05-24 00:00:00.0000000', NULL, NULL, N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'79', N'UserId', N'所属用户', N'uniqueidentifier', N'Guid', N'UserId', NULL, N'所属用户')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'97284D66-88B9-478F-D4E5-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'E79DB53B-7162-4669-9B5E-F860501475AC', N'1', N'0', N'0', N'82', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'B6422CB6-498E-4FF5-D4E6-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'E79DB53B-7162-4669-9B5E-F860501475AC', N'0', N'0', N'1', N'84', N'CreationTime', N'', N'datetime', N'DateTime', N'CreationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'9DE60DD7-A403-442D-D4E7-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'E79DB53B-7162-4669-9B5E-F860501475AC', N'0', N'0', N'1', N'83', N'LastModificationTime', N'', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'0F908E1D-4A82-42C1-D4E8-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'E79DB53B-7162-4669-9B5E-F860501475AC', N'0', N'0', N'1', N'86', N'PermissionType', N'数据权限类型', N'int', N'Int32', N'PermissionType', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'9C9F9672-3FA0-4C65-D4E9-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'E79DB53B-7162-4669-9B5E-F860501475AC', N'0', N'0', N'1', N'85', N'RoleId', N'', N'uniqueidentifier', N'Guid', N'RoleId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'DF559C6B-6F60-467C-D4EA-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'524E71B4-CBF7-4248-8B29-3F99B43F2EB2', N'1', N'0', N'0', N'87', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'2341DCB1-8056-4A7C-D4EB-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'524E71B4-CBF7-4248-8B29-3F99B43F2EB2', N'0', N'0', N'1', N'89', N'CreationTime', N'', N'datetime', N'DateTime', N'CreationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'6304E602-84A1-4C57-D4EC-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'524E71B4-CBF7-4248-8B29-3F99B43F2EB2', N'0', N'0', N'1', N'88', N'LastModificationTime', N'', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'DE898F57-ABE7-4D2C-D4ED-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'524E71B4-CBF7-4248-8B29-3F99B43F2EB2', N'0', N'0', N'1', N'90', N'SysDataAuthorityId', N'', N'uniqueidentifier', N'Guid', N'SysDataAuthorityId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'325AF03C-CBB7-4DE6-D4EE-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'524E71B4-CBF7-4248-8B29-3F99B43F2EB2', N'0', N'0', N'0', N'91', N'SysOrganizationId', N'', N'int', N'Int32', N'SysOrganizationId', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'BBAC9A7C-6E62-4FE6-D4EF-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'AF37F705-7BA0-4883-B1BE-8A274EA4C026', N'0', N'0', N'1', N'96', N'Code', N'编码', N'varchar(255)', N'String', N'Code', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'2CA9AA7E-321E-47F0-D4F0-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'AF37F705-7BA0-4883-B1BE-8A274EA4C026', N'0', N'0', N'1', N'94', N'CreationTime', N'创建时间', N'datetime', N'DateTime', N'CreationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'AB5C0B3D-8871-42FD-D4F1-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'AF37F705-7BA0-4883-B1BE-8A274EA4C026', N'0', N'1', N'0', N'92', N'Id', N'id', N'int', N'Int32', N'Id', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'ABA55AD7-7153-4658-D4F2-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'AF37F705-7BA0-4883-B1BE-8A274EA4C026', N'0', N'0', N'1', N'93', N'LastModificationTime', N'更新时间', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'29B765BD-36F4-462F-D4F3-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'AF37F705-7BA0-4883-B1BE-8A274EA4C026', N'0', N'0', N'1', N'98', N'Name', N'分组名/键', N'varchar(255)', N'String', N'Name', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'6E69CF9B-D9CD-4C31-D4F4-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'AF37F705-7BA0-4883-B1BE-8A274EA4C026', N'0', N'0', N'1', N'99', N'ParentId', N'父级分组id', N'int', N'Int32', N'ParentId', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'84A87E33-8B66-4B9A-D4F5-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'AF37F705-7BA0-4883-B1BE-8A274EA4C026', N'0', N'0', N'1', N'95', N'Sort', N'排序号', N'int', N'Int32', N'Sort', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'9A850F29-2DD2-4779-D4F6-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'AF37F705-7BA0-4883-B1BE-8A274EA4C026', N'0', N'0', N'1', N'97', N'Value', N'值', N'varchar(255)', N'String', N'Value', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'E1316750-62A4-46AA-D4F7-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'6FABC67A-8B48-49A6-8BA1-C8A32C499D36', N'1', N'0', N'0', N'100', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'743D6EAB-B4C8-4A15-D4F8-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'6FABC67A-8B48-49A6-8BA1-C8A32C499D36', N'0', N'0', N'1', N'103', N'ByName', N'', N'nvarchar(255)', N'String', N'ByName', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'82EE25D2-4E01-4100-D4F9-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'6FABC67A-8B48-49A6-8BA1-C8A32C499D36', N'0', N'0', N'1', N'106', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'A61101B5-8E66-4456-D4FA-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'6FABC67A-8B48-49A6-8BA1-C8A32C499D36', N'0', N'0', N'1', N'105', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'AAA5FAE3-8C5B-4427-D4FB-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'6FABC67A-8B48-49A6-8BA1-C8A32C499D36', N'0', N'0', N'1', N'102', N'Name', N'', N'nvarchar(255)', N'String', N'Name', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'F9FD0E13-4E5D-42B4-D4FC-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'6FABC67A-8B48-49A6-8BA1-C8A32C499D36', N'0', N'0', N'1', N'101', N'Number', N'', N'int', N'Int32', N'Number', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'646614D9-D7F3-42C5-D4FD-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'6FABC67A-8B48-49A6-8BA1-C8A32C499D36', N'0', N'0', N'1', N'104', N'Remark', N'', N'nvarchar(255)', N'String', N'Remark', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'498327EB-5676-4091-D4FE-08DA3D8D5A26', N'2022-05-24 21:58:07.0000000', N'2022-05-24 00:00:00.0000000', NULL, NULL, N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'1', N'1', N'0', N'107', N'Id', N'', N'int', N'Int32', N'Id', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'3133985D-586C-4C4E-D4FF-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'119', N'Close', N'', N'bit', N'Boolean', N'Close', N'1', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'78757B0D-D9EE-45EA-D500-08DA3D8D5A26', N'2022-05-24 21:58:07.0000000', N'2022-05-24 00:00:00.0000000', NULL, NULL, N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'115', N'ComponentName', N'', N'nvarchar(255)', N'String', N'ComponentName', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'2006AC52-BB49-4E41-D501-08DA3D8D5A26', N'2022-05-24 21:58:07.0000000', N'2022-05-24 00:00:00.0000000', NULL, NULL, N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'109', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'F5193134-B39D-4CA0-D502-08DA3D8D5A26', N'2022-05-24 21:58:07.0000000', N'2022-05-24 00:00:00.0000000', NULL, NULL, N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'116', N'Icon', N'', N'nvarchar(255)', N'String', N'Icon', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'12E9E9AD-5631-4DC8-D503-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'122', N'JumpUrl', N'', N'varchar(255)', N'String', N'JumpUrl', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'B1F89F8D-8E22-4C4A-D504-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'120', N'KeepAlive', N'', N'bit', N'Boolean', N'KeepAlive', N'1', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'7211AEA6-EB91-41E5-D505-08DA3D8D5A26', N'2022-05-24 21:58:07.0000000', N'2022-05-24 00:00:00.0000000', NULL, NULL, N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'108', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'B52A9E8C-DFFB-40B7-D506-08DA3D8D5A26', N'2022-05-24 21:58:07.0000000', N'2022-05-24 00:00:00.0000000', NULL, NULL, N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'110', N'LevelCode', N'', N'varchar(50)', N'String', N'LevelCode', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'E74C1F4B-AF12-4EAA-D507-08DA3D8D5A26', N'2022-05-24 21:58:07.0000000', N'2022-05-24 00:00:00.0000000', NULL, NULL, N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'112', N'Name', N'', N'nvarchar(255)', N'String', N'Name', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'235B67F8-62D2-480E-D508-08DA3D8D5A26', N'2022-05-24 21:58:07.0000000', N'2022-05-24 00:00:00.0000000', NULL, NULL, N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'111', N'Number', N'编号', N'int', N'Int32', N'Number', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'F029B676-48AC-4BA3-D509-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'117', N'ParentId', N'', N'int', N'Int32', N'ParentId', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'5AA598A9-6E52-4AE4-D50A-08DA3D8D5A26', N'2022-05-24 21:58:07.0000000', N'2022-05-24 00:00:00.0000000', NULL, NULL, N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'114', N'Router', N'', N'nvarchar(255)', N'String', N'Router', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'1916E619-4818-4C63-D50B-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'118', N'Show', N'', N'bit', N'Boolean', N'Show', N'1', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'D0FBF229-7204-4494-D50C-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'121', N'State', N'', N'bit', N'Boolean', N'State', N'1', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'6C3BB548-AAFC-4F16-D50D-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'123', N'Type', N'', N'int', N'Int32', N'Type', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'19FA02FE-FB8F-4631-D50E-08DA3D8D5A26', N'2022-05-24 21:58:07.0000000', N'2022-05-24 00:00:00.0000000', NULL, NULL, N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'113', N'Url', N'', N'nvarchar(255)', N'String', N'Url', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'9C4158F4-B5B5-4928-D50F-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'2AE9E532-7D9A-474B-B629-50A39945C44D', N'1', N'0', N'0', N'124', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'FBF2D2C1-454B-4898-D510-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'2AE9E532-7D9A-474B-B629-50A39945C44D', N'0', N'0', N'1', N'126', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'6CFE3B57-006F-436B-D511-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'2AE9E532-7D9A-474B-B629-50A39945C44D', N'0', N'0', N'1', N'129', N'FunctionCode', N'', N'varchar(100)', N'String', N'FunctionCode', N'100', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'A908815C-C0E6-4565-D512-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'2AE9E532-7D9A-474B-B629-50A39945C44D', N'0', N'0', N'1', N'130', N'FunctionName', N'', N'varchar(100)', N'String', N'FunctionName', N'100', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'E4DD55F0-9697-43AE-D513-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'2AE9E532-7D9A-474B-B629-50A39945C44D', N'0', N'0', N'1', N'125', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'29D08351-9091-4C91-D514-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'2AE9E532-7D9A-474B-B629-50A39945C44D', N'0', N'0', N'1', N'128', N'MenuId', N'', N'int', N'Int32', N'MenuId', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'C7B2AD1D-ECB0-4497-D515-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'2AE9E532-7D9A-474B-B629-50A39945C44D', N'0', N'0', N'1', N'127', N'Number', N'', N'int', N'Int32', N'Number', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'9A050102-6300-46EF-D516-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'2AE9E532-7D9A-474B-B629-50A39945C44D', N'0', N'0', N'1', N'131', N'Remark', N'', N'varchar(100)', N'String', N'Remark', N'100', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'BA392537-C1C5-4ECC-D517-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'1', N'0', N'0', N'1', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'EE8CA902-4E27-40C5-D518-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'14', N'ActionDisplayName', N'', N'varchar(255)', N'String', N'ActionDisplayName', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'200FF922-513C-4B19-D519-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'4', N'Api', N'接口地址', N'varchar(500)', N'String', N'Api', N'500', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'063D44B8-6CE2-47A6-D51A-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'9', N'Browser', N'', N'varchar(255)', N'String', N'Browser', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'A62BB184-93B0-40E3-D51B-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'13', N'ControllerDisplayName', N'', N'varchar(255)', N'String', N'ControllerDisplayName', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'0AA2DAAB-50DF-4397-D51C-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'3', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'5F5C2997-DAA8-491C-D51D-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'6', N'Form', N'表单信息', N'varchar(MAX)', N'String', N'Form', N'-1', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'1D881E59-D88E-497F-D51E-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'7', N'FormBody', N'json表单信息', N'varchar(MAX)', N'String', N'FormBody', N'-1', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'CA605278-6972-48B4-D51F-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'5', N'Ip', N'ip地址', N'varchar(255)', N'String', N'Ip', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'A932F1CE-A55A-480B-D520-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'2', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'4736479F-6089-4141-D521-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'10', N'OS', N'', N'varchar(255)', N'String', N'OS', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'4467BF43-6E95-4798-D522-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'8', N'QueryString', N'地址栏信息', N'varchar(MAX)', N'String', N'QueryString', N'-1', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'0888B15F-3BD2-4881-D523-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'0', N'12', N'TakeUpTime', N'接口耗时（毫秒）', N'bigint', N'Int64', N'TakeUpTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'66718DE6-5C1A-4229-D524-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'11', N'UserId', N'当前操作人id', N'uniqueidentifier', N'Guid', N'UserId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'D6008705-0D21-42AC-D525-08DA3D8D5A26', N'2022-06-09 21:20:26.0000000', N'2022-05-24 00:00:00.0000000', NULL, NULL, N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'1', N'1', N'0', N'132', N'Id', N'', N'int', N'Int32', N'Id', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'0B45E9BB-B9F1-4A2F-D526-08DA3D8D5A26', N'2022-06-09 21:20:26.0000000', N'2022-05-24 00:00:00.0000000', NULL, NULL, N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'0', N'0', N'1', N'142', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'CE802713-74F5-4F30-D527-08DA3D8D5A26', N'2022-06-09 21:20:26.0000000', N'2022-05-24 00:00:00.0000000', NULL, NULL, N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'0', N'0', N'1', N'138', N'Email', N'', N'nvarchar(255)', N'String', N'Email', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'19A7504C-F740-4B49-D528-08DA3D8D5A26', N'2022-06-09 21:20:26.0000000', N'2022-05-24 00:00:00.0000000', NULL, NULL, N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'0', N'0', N'1', N'141', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'CF2E3691-AB88-4420-D529-08DA3D8D5A26', N'2022-06-09 21:20:26.0000000', N'2022-05-24 00:00:00.0000000', NULL, NULL, N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'0', N'0', N'1', N'136', N'Leader', N'', N'nvarchar(255)', N'String', N'Leader', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'11F3D291-CF7A-4143-D52A-08DA3D8D5A26', N'2022-06-09 21:20:26.0000000', N'2022-05-24 00:00:00.0000000', NULL, NULL, N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'0', N'0', N'1', N'135', N'LevelCode', N'', N'varchar(50)', N'String', N'LevelCode', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'1121D642-49E8-4B25-D52B-08DA3D8D5A26', N'2022-06-09 21:20:26.0000000', N'2022-05-24 00:00:00.0000000', NULL, NULL, N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'0', N'0', N'1', N'133', N'Name', N'', N'nvarchar(255)', N'String', N'Name', NULL, N'组织名称')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'5AED3FEB-3D77-4E1E-D52C-08DA3D8D5A26', N'2022-06-09 21:20:26.0000000', N'2022-05-24 00:00:00.0000000', NULL, NULL, N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'0', N'0', N'1', N'134', N'OrderNumber', N'', N'int', N'Int32', N'OrderNumber', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'042A59E2-72C1-4C38-D52D-08DA3D8D5A26', N'2022-06-09 21:20:26.0000000', N'2022-05-24 00:00:00.0000000', NULL, NULL, N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'0', N'0', N'1', N'140', N'ParentId', N'', N'int', N'Int32', N'ParentId', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'EA63351C-C203-4D40-D52E-08DA3D8D5A26', N'2022-06-09 21:20:26.0000000', N'2022-05-24 00:00:00.0000000', NULL, NULL, N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'0', N'0', N'1', N'137', N'Phone', N'', N'nvarchar(255)', N'String', N'Phone', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'B9BFCA2E-F72B-4A3F-D52F-08DA3D8D5A26', N'2022-06-09 21:20:26.0000000', N'2022-05-24 00:00:00.0000000', NULL, NULL, N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'0', N'0', N'1', N'139', N'State', N'', N'int', N'Int32', N'State', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'6AA13B8F-1E3C-4750-D530-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'0A8BDB18-758A-4798-9FFC-E7031DCBF262', N'1', N'0', N'0', N'143', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'B76500C1-91F8-4E44-D531-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'0A8BDB18-758A-4798-9FFC-E7031DCBF262', N'0', N'0', N'1', N'145', N'Code', N'', N'nvarchar(255)', N'String', N'Code', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'134C9F62-ABD2-476E-D532-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'0A8BDB18-758A-4798-9FFC-E7031DCBF262', N'0', N'0', N'1', N'150', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'5257AD4F-589D-40D0-D533-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'0A8BDB18-758A-4798-9FFC-E7031DCBF262', N'0', N'0', N'1', N'149', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'1790B4D5-51B2-4DC0-D534-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'0A8BDB18-758A-4798-9FFC-E7031DCBF262', N'0', N'0', N'1', N'146', N'Name', N'', N'nvarchar(255)', N'String', N'Name', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'2286C948-4F0D-4B66-D535-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'0A8BDB18-758A-4798-9FFC-E7031DCBF262', N'0', N'0', N'1', N'144', N'Number', N'', N'int', N'Int32', N'Number', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'5F9A4A78-1BB9-4592-D536-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'0A8BDB18-758A-4798-9FFC-E7031DCBF262', N'0', N'0', N'1', N'148', N'Remarks', N'', N'nvarchar(255)', N'String', N'Remarks', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'564A907B-1F47-4849-D537-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'0A8BDB18-758A-4798-9FFC-E7031DCBF262', N'0', N'0', N'1', N'147', N'State', N'', N'int', N'Int32', N'State', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'69875823-326C-4E13-D538-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'F3D7BBB3-C1FB-4D61-92A4-9BC101811335', N'1', N'0', N'0', N'151', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'42430604-7090-442D-D539-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'F3D7BBB3-C1FB-4D61-92A4-9BC101811335', N'0', N'0', N'1', N'153', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'3F7E43C9-762F-48EA-D53A-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'F3D7BBB3-C1FB-4D61-92A4-9BC101811335', N'0', N'0', N'1', N'157', N'DeleteLock', N'', N'bit', N'Boolean', N'DeleteLock', N'1', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'517CBFE0-275D-4F36-D53B-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'F3D7BBB3-C1FB-4D61-92A4-9BC101811335', N'0', N'0', N'1', N'152', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'BE481209-565B-4099-D53C-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'F3D7BBB3-C1FB-4D61-92A4-9BC101811335', N'0', N'0', N'1', N'155', N'Name', N'', N'nvarchar(255)', N'String', N'Name', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'DD367FD5-2030-43B2-D53D-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'F3D7BBB3-C1FB-4D61-92A4-9BC101811335', N'0', N'0', N'1', N'154', N'Number', N'', N'int', N'Int32', N'Number', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'DBE000FC-4895-42F2-D53E-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'F3D7BBB3-C1FB-4D61-92A4-9BC101811335', N'0', N'0', N'1', N'156', N'Remark', N'', N'nvarchar(255)', N'String', N'Remark', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'7B6DF0CD-C31B-4508-D53F-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'8DA38D20-8A09-4E81-8DD8-ED6702AEE380', N'1', N'0', N'0', N'158', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'1213C179-E366-4E3C-D540-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'8DA38D20-8A09-4E81-8DD8-ED6702AEE380', N'0', N'0', N'1', N'163', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'B24AC0E3-71AB-4D48-D541-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'8DA38D20-8A09-4E81-8DD8-ED6702AEE380', N'0', N'0', N'1', N'162', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'6C934348-BE20-4C9E-D542-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'8DA38D20-8A09-4E81-8DD8-ED6702AEE380', N'0', N'0', N'1', N'161', N'MenuFunctionId', N'', N'uniqueidentifier', N'Guid', N'MenuFunctionId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'D41BD8DB-1B3F-48FA-D543-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'8DA38D20-8A09-4E81-8DD8-ED6702AEE380', N'0', N'0', N'1', N'160', N'MenuId', N'', N'int', N'Int32', N'MenuId', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'F24F0E45-209E-46B7-D544-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'8DA38D20-8A09-4E81-8DD8-ED6702AEE380', N'0', N'0', N'1', N'159', N'RoleId', N'', N'uniqueidentifier', N'Guid', N'RoleId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'5BCF7406-75CC-4171-D545-08DA3D8D5A26', N'2022-06-09 21:20:04.0000000', N'2022-05-24 00:00:00.0000000', NULL, NULL, N'6323638B-A45F-4A76-886E-69A9E9BE0901', N'1', N'0', N'0', N'164', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'46BAC66F-3CF0-46B3-D546-08DA3D8D5A26', N'2022-06-09 21:20:04.0000000', N'2022-05-24 00:00:00.0000000', NULL, NULL, N'6323638B-A45F-4A76-886E-69A9E9BE0901', N'0', N'0', N'1', N'166', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', NULL, N'创建时间')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'A6752BD9-F3D6-451F-D547-08DA3D8D5A26', N'2022-06-09 21:20:04.0000000', N'2022-05-24 00:00:00.0000000', NULL, NULL, N'6323638B-A45F-4A76-886E-69A9E9BE0901', N'0', N'0', N'1', N'172', N'DeleteLock', N'', N'bit', N'Boolean', N'DeleteLock', NULL, N'删除锁')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'287314B2-3141-4957-D548-08DA3D8D5A26', N'2022-06-09 21:20:04.0000000', N'2022-05-24 00:00:00.0000000', NULL, NULL, N'6323638B-A45F-4A76-886E-69A9E9BE0901', N'0', N'0', N'0', N'171', N'Email', N'', N'nvarchar(255)', N'String', N'Email', NULL, N'电子邮箱')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'E5418D61-916F-45FD-D549-08DA3D8D5A26', N'2022-06-09 21:20:04.0000000', N'2022-05-24 00:00:00.0000000', NULL, NULL, N'6323638B-A45F-4A76-886E-69A9E9BE0901', N'0', N'0', N'1', N'165', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', NULL, N'更新时间')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'7CBE8988-CBAC-4EA2-D54A-08DA3D8D5A26', N'2022-06-09 21:20:04.0000000', N'2022-05-24 00:00:00.0000000', NULL, NULL, N'6323638B-A45F-4A76-886E-69A9E9BE0901', N'0', N'0', N'1', N'168', N'LoginName', N'', N'nvarchar(255)', N'String', N'LoginName', NULL, N'登录名称')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'4B5BC027-5663-463A-D54B-08DA3D8D5A26', N'2022-06-09 21:20:04.0000000', N'2022-05-24 00:00:00.0000000', NULL, NULL, N'6323638B-A45F-4A76-886E-69A9E9BE0901', N'0', N'0', N'1', N'167', N'Name', N'', N'nvarchar(255)', N'String', N'Name', NULL, N'用户名称')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'5A9FA990-B6D6-445F-D54C-08DA3D8D5A26', N'2022-06-09 21:20:04.0000000', N'2022-05-24 00:00:00.0000000', NULL, NULL, N'6323638B-A45F-4A76-886E-69A9E9BE0901', N'0', N'0', N'1', N'173', N'OrganizationId', N'', N'int', N'Int32', N'OrganizationId', NULL, N'组织id')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'E36410B5-CB7C-4FC3-D54D-08DA3D8D5A26', N'2022-06-09 21:20:04.0000000', N'2022-05-24 00:00:00.0000000', NULL, NULL, N'6323638B-A45F-4A76-886E-69A9E9BE0901', N'0', N'0', N'1', N'169', N'Password', N'', N'nvarchar(255)', N'String', N'Password', NULL, N'密码')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'C82D5132-6CDA-463E-D54E-08DA3D8D5A26', N'2022-06-09 21:20:04.0000000', N'2022-05-24 00:00:00.0000000', NULL, NULL, N'6323638B-A45F-4A76-886E-69A9E9BE0901', N'0', N'0', N'1', N'170', N'Phone', N'', N'nvarchar(255)', N'String', N'Phone', NULL, N'联系电话')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'A9766BBB-21BF-46DA-D54F-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'69B24F04-0ED3-45FC-91D9-0DC929175A57', N'1', N'0', N'0', N'174', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'F731CCD3-9A9C-4DDA-D550-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'69B24F04-0ED3-45FC-91D9-0DC929175A57', N'0', N'0', N'1', N'178', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'135E23DB-540B-4096-D551-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'69B24F04-0ED3-45FC-91D9-0DC929175A57', N'0', N'0', N'1', N'177', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'4C479D54-530F-4652-D552-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'69B24F04-0ED3-45FC-91D9-0DC929175A57', N'0', N'0', N'1', N'176', N'PostId', N'', N'uniqueidentifier', N'Guid', N'PostId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'CB5F9ECF-9317-4B11-D553-08DA3D8D5A26', N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000', NULL, NULL, N'69B24F04-0ED3-45FC-91D9-0DC929175A57', N'0', N'0', N'1', N'175', N'UserId', N'', N'uniqueidentifier', N'Guid', N'UserId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'51D2EB90-7AB9-4763-3387-08DA716A5C08', N'2022-07-29 21:58:05.1912627', N'2022-07-29 21:58:05.1912626', NULL, NULL, N'18FBB18E-CB29-45D8-A5F3-C0121C57680A', N'1', N'0', N'0', N'20', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'C1AE4945-25FC-45E9-3388-08DA716A5C08', N'2022-07-29 21:58:05.1912626', N'2022-07-29 21:58:05.1912625', NULL, NULL, N'18FBB18E-CB29-45D8-A5F3-C0121C57680A', N'0', N'0', N'0', N'29', N'ApprovalDate', N'', N'datetime2', N'DateTime', N'ApprovalDate', N'8', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'22527FE7-BD5C-4E6C-3389-08DA716A5C08', N'2022-07-29 21:58:05.1912625', N'2022-07-29 21:58:05.1912625', NULL, NULL, N'18FBB18E-CB29-45D8-A5F3-C0121C57680A', N'0', N'0', N'0', N'31', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', N'8', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'7485DEED-E9E8-4AA6-338A-08DA716A5C08', N'2022-07-29 21:58:05.1912624', N'2022-07-29 21:58:05.1912624', NULL, NULL, N'18FBB18E-CB29-45D8-A5F3-C0121C57680A', N'0', N'0', N'0', N'22', N'FlowNodeId', N'', N'uniqueidentifier', N'Guid', N'FlowNodeId', N'16', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'50B6B2FC-3E73-457C-338B-08DA716A5C08', N'2022-07-29 21:58:05.1912623', N'2022-07-29 21:58:05.1912619', NULL, NULL, N'18FBB18E-CB29-45D8-A5F3-C0121C57680A', N'0', N'0', N'1', N'23', N'FlowNodeName', N'', N'nvarchar(MAX)', N'String', N'FlowNodeName', N'-1', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'DB4510E1-40D2-4DB4-338C-08DA716A5C08', N'2022-07-29 21:58:05.1912628', N'2022-07-29 21:58:05.1912627', NULL, NULL, N'18FBB18E-CB29-45D8-A5F3-C0121C57680A', N'0', N'0', N'0', N'30', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', N'8', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'BF3DBEDF-ADE0-4E20-338D-08DA716A5C08', N'2022-07-29 21:58:05.1912628', N'2022-07-29 21:58:05.1912628', NULL, NULL, N'18FBB18E-CB29-45D8-A5F3-C0121C57680A', N'0', N'0', N'1', N'26', N'Opinions', N'', N'nvarchar(MAX)', N'String', N'Opinions', N'-1', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'95414873-486D-4609-338E-08DA716A5C08', N'2022-07-29 21:58:05.1912629', N'2022-07-29 21:58:05.1912629', NULL, NULL, N'18FBB18E-CB29-45D8-A5F3-C0121C57680A', N'0', N'0', N'0', N'21', N'Sort', N'', N'int', N'Int32', N'Sort', N'4', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'8F107C7C-E4F5-4647-338F-08DA716A5C08', N'2022-07-29 21:58:05.1912630', N'2022-07-29 21:58:05.1912630', NULL, NULL, N'18FBB18E-CB29-45D8-A5F3-C0121C57680A', N'0', N'0', N'0', N'24', N'SortMore', N'', N'int', N'Int32', N'SortMore', N'4', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'79D371FB-B37A-4D32-3390-08DA716A5C08', N'2022-07-29 21:58:05.1912631', N'2022-07-29 21:58:05.1912631', NULL, NULL, N'18FBB18E-CB29-45D8-A5F3-C0121C57680A', N'0', N'0', N'0', N'25', N'State', N'', N'int', N'Int32', N'State', N'4', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'3D9C98E4-2AC7-40FD-3391-08DA716A5C08', N'2022-07-29 21:58:05.1912632', N'2022-07-29 21:58:05.1912631', NULL, NULL, N'18FBB18E-CB29-45D8-A5F3-C0121C57680A', N'0', N'0', N'0', N'27', N'UserId', N'', N'uniqueidentifier', N'Guid', N'UserId', N'16', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'022C287A-11E3-4234-3392-08DA716A5C08', N'2022-07-29 21:58:05.1912633', N'2022-07-29 21:58:05.1912632', NULL, NULL, N'18FBB18E-CB29-45D8-A5F3-C0121C57680A', N'0', N'0', N'1', N'28', N'UserName', N'', N'nvarchar(MAX)', N'String', N'UserName', N'-1', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'59F5D993-E502-4FEE-3393-08DA716A5C08', N'2022-07-29 21:58:05.2184615', N'2022-07-29 21:58:05.2184614', NULL, NULL, N'7F94E0DB-FC63-40DC-BFE3-18C5AAD75975', N'1', N'0', N'0', N'32', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'CB4A19D3-35DD-416D-3394-08DA716A5C08', N'2022-07-29 21:58:05.2184614', N'2022-07-29 21:58:05.2184614', NULL, NULL, N'7F94E0DB-FC63-40DC-BFE3-18C5AAD75975', N'0', N'0', N'0', N'39', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', N'8', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'D550FB44-F912-434E-3395-08DA716A5C08', N'2022-07-29 21:58:05.2184613', N'2022-07-29 21:58:05.2184613', NULL, NULL, N'7F94E0DB-FC63-40DC-BFE3-18C5AAD75975', N'0', N'0', N'0', N'33', N'FlowApprovalStepHistoryId', N'', N'uniqueidentifier', N'Guid', N'FlowApprovalStepHistoryId', N'16', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'A7263191-1E30-42C5-3396-08DA716A5C08', N'2022-07-29 21:58:05.2184612', N'2022-07-29 21:58:05.2184612', NULL, NULL, N'7F94E0DB-FC63-40DC-BFE3-18C5AAD75975', N'0', N'0', N'0', N'34', N'FlowNodeId', N'', N'uniqueidentifier', N'Guid', N'FlowNodeId', N'16', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'CCC3F055-79C4-4E63-3397-08DA716A5C08', N'2022-07-29 21:58:05.2184612', N'2022-07-29 21:58:05.2184611', NULL, NULL, N'7F94E0DB-FC63-40DC-BFE3-18C5AAD75975', N'0', N'0', N'1', N'35', N'FlowNodeName', N'', N'nvarchar(MAX)', N'String', N'FlowNodeName', N'-1', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'D5E76D95-BEED-43C9-3398-08DA716A5C08', N'2022-07-29 21:58:05.2184611', N'2022-07-29 21:58:05.2184610', NULL, NULL, N'7F94E0DB-FC63-40DC-BFE3-18C5AAD75975', N'0', N'0', N'0', N'38', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', N'8', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'9059BF44-23A0-4E12-3399-08DA716A5C08', N'2022-07-29 21:58:05.2184610', N'2022-07-29 21:58:05.2184609', NULL, NULL, N'7F94E0DB-FC63-40DC-BFE3-18C5AAD75975', N'0', N'0', N'0', N'36', N'UserId', N'', N'uniqueidentifier', N'Guid', N'UserId', N'16', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'643C3AA6-D639-46BD-339A-08DA716A5C08', N'2022-07-29 21:58:05.2184609', N'2022-07-29 21:58:05.2184605', NULL, NULL, N'7F94E0DB-FC63-40DC-BFE3-18C5AAD75975', N'0', N'0', N'1', N'37', N'UserName', N'', N'nvarchar(MAX)', N'String', N'UserName', N'-1', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'1FBF9CEA-3E4C-401B-243F-08DA717DBCAA', N'2022-07-30 00:16:47.6478963', N'2022-07-30 00:16:47.6478949', NULL, NULL, N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'1', N'0', N'0', N'203', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'7EC46123-3852-4B62-2440-08DA717DBCAA', N'2022-07-30 00:16:47.6478964', N'2022-07-30 00:16:47.6478964', NULL, NULL, N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'215', N'ControllerPath', N'', N'varchar(50)', N'String', N'ControllerPath', N'50', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'BE6F08B8-B14B-4253-2441-08DA717DBCAA', N'2022-07-30 00:16:47.6478965', N'2022-07-30 00:16:47.6478964', NULL, NULL, N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'0', N'205', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', N'8', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'A06381EF-E532-4B7A-2442-08DA717DBCAA', N'2022-07-30 00:16:47.6478966', N'2022-07-30 00:16:47.6478965', NULL, NULL, N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'209', N'DisplayName', N'', N'nvarchar(MAX)', N'String', N'DisplayName', N'-1', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'3051FB7C-F075-4D91-2443-08DA717DBCAA', N'2022-07-30 00:16:47.6478967', N'2022-07-30 00:16:47.6478967', NULL, NULL, N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'210', N'EntityName', N'', N'nvarchar(MAX)', N'String', N'EntityName', N'-1', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'B755E2AF-1164-47DE-2444-08DA717DBCAA', N'2022-07-30 00:16:47.6478968', N'2022-07-30 00:16:47.6478967', NULL, NULL, N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'216', N'IndexVuePath', N'', N'varchar(50)', N'String', N'IndexVuePath', N'50', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'54A0ED42-104E-4E2A-2445-08DA717DBCAA', N'2022-07-30 00:16:47.6478969', N'2022-07-30 00:16:47.6478968', NULL, NULL, N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'217', N'InfoVuePath', N'', N'varchar(50)', N'String', N'InfoVuePath', N'50', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'1BD2134C-3A2A-4E1B-2446-08DA717DBCAA', N'2022-07-30 00:16:47.6478970', N'2022-07-30 00:16:47.6478969', NULL, NULL, N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'219', N'IsCover', N'', N'bit', N'Boolean', N'IsCover', N'1', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'8E5F9439-6B90-423A-2447-08DA717DBCAA', N'2022-07-30 00:16:47.6478971', N'2022-07-30 00:16:47.6478970', NULL, NULL, N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'0', N'204', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', N'8', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'C6042620-D052-4A60-2448-08DA717DBCAA', N'2022-07-30 00:16:47.6478972', N'2022-07-30 00:16:47.6478971', NULL, NULL, N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'213', N'ModelPath', N'', N'varchar(50)', N'String', N'ModelPath', N'50', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'CAFF37BF-4E91-4934-2449-08DA717DBCAA', N'2022-07-30 00:16:47.6478973', N'2022-07-30 00:16:47.6478972', NULL, NULL, N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'212', N'ProjectRootPath', N'', N'varchar(50)', N'String', N'ProjectRootPath', N'50', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'803C2D4B-4A80-43B0-244A-08DA717DBCAA', N'2022-07-30 00:16:47.6478974', N'2022-07-30 00:16:47.6478973', NULL, NULL, N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'211', N'Remark', N'', N'nvarchar(MAX)', N'String', N'Remark', N'-1', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'158B1C2D-FA67-4696-244B-08DA717DBCAA', N'2022-07-30 00:16:47.6478975', N'2022-07-30 00:16:47.6478974', NULL, NULL, N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'207', N'Schema', N'', N'nvarchar(MAX)', N'String', N'Schema', N'-1', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'13775DE6-200D-43E0-244C-08DA717DBCAA', N'2022-07-30 00:16:47.6478976', N'2022-07-30 00:16:47.6478975', NULL, NULL, N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'218', N'ServiceJsPath', N'', N'varchar(50)', N'String', N'ServiceJsPath', N'50', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'AAECFDA3-F48D-4CD5-244D-08DA717DBCAA', N'2022-07-30 00:16:47.6478977', N'2022-07-30 00:16:47.6478976', NULL, NULL, N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'214', N'ServicePath', N'', N'varchar(50)', N'String', N'ServicePath', N'50', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'26F16D3D-9C42-4F86-244E-08DA717DBCAA', N'2022-07-30 00:16:47.6478978', N'2022-07-30 00:16:47.6478977', NULL, NULL, N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'206', N'TableName', N'', N'nvarchar(MAX)', N'String', N'TableName', N'-1', N'')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'59CFB48C-8D3F-43D7-244F-08DA717DBCAA', N'2022-07-30 00:16:47.6478979', N'2022-07-30 00:16:47.6478978', NULL, NULL, N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'208', N'Type', N'', N'nvarchar(MAX)', N'String', N'Type', N'-1', N'')
GO


-- ----------------------------
-- Table structure for member
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[member]') AND type IN ('U'))
	DROP TABLE [dbo].[member]
GO

CREATE TABLE [dbo].[member] (
  [Id] uniqueidentifier  NOT NULL,
  [LastModificationTime] datetime2(7)  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [CreatorUserId] uniqueidentifier  NULL,
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
INSERT INTO [dbo].[member] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [Name], [Phone], [Sex], [Birthday], [Photo], [Introduce], [FilePath], [UserId]) VALUES (N'96A1AA3D-A61A-42D0-954A-C71753FB2065', N'2022-07-31 00:03:48.0039130', N'2020-10-24 00:07:42.0000000', NULL, NULL, N'123', N'123', N'123', N'女', N'2018-04-25 23:00:00.0000000', N'[{"uid":"d80bbe3d-7296-4eb9-965a-cb3f03d3def7","name":"time_000335_old_name_微信图片_20200413162625.jpg","percent":100,"status":"done","thumbUrl":"/upload/files/20220731/time_000335_old_name_微信图片_20200413162625.jpg","url":"/upload/files/20220731/time_000335_old_name_微信图片_20200413162625.jpg"}]', N'<p>123</p>', N'[{"uid":"a6778e9d-6c2e-4d23-91c9-d0d10756d177","name":"time_000345_old_name_hzy.png","percent":100,"status":"done","thumbUrl":"/upload/files/20220731/time_000345_old_name_hzy.png","url":"/upload/files/20220731/time_000345_old_name_hzy.png"}]', N'AC18F496-E93D-42F0-B59E-E321ACC85335')
GO

INSERT INTO [dbo].[member] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [Name], [Phone], [Sex], [Birthday], [Photo], [Introduce], [FilePath], [UserId]) VALUES (N'9A604AA2-9AE6-4A2F-8DDB-D9E0289EAD9E', N'2022-07-31 00:03:23.9947478', N'2018-04-25 23:00:00.0000000', NULL, NULL, N'1', N'测试会员', N'18510912123', N'男', N'2019-07-08 11:47:24.0000000', N'[{"uid":"6f5aed63-0fdc-4752-9c2b-3f66cbfa77bf","name":"time_000222_old_name_微信图片_20200521081252.jpg","percent":100,"status":"done","thumbUrl":"/upload/files/20220731/time_000222_old_name_微信图片_20200521081252.jpg","url":"/upload/files/20220731/time_000222_old_name_微信图片_20200521081252.jpg"}]', N'<p>999888</p>', N'[{"uid":"35828ad6-cbba-4bcb-9c97-141d5b31acc7","name":"time_000320_old_name_Ko.js增删改查例子.txt","percent":100,"status":"done","thumbUrl":"/upload/files/20220731/time_000320_old_name_Ko.js增删改查例子.txt","url":"/upload/files/20220731/time_000320_old_name_Ko.js增删改查例子.txt"}]', N'AC18F496-E93D-42F0-B59E-E321ACC85335')
GO


-- ----------------------------
-- Table structure for sys_data_authority
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_data_authority]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_data_authority]
GO

CREATE TABLE [dbo].[sys_data_authority] (
  [Id] uniqueidentifier  NOT NULL,
  [LastModificationTime] datetime2(7)  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [CreatorUserId] uniqueidentifier  NULL,
  [PermissionType] int  NOT NULL,
  [RoleId] uniqueidentifier  NOT NULL
)
GO

ALTER TABLE [dbo].[sys_data_authority] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of sys_data_authority
-- ----------------------------
INSERT INTO [dbo].[sys_data_authority] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [PermissionType], [RoleId]) VALUES (N'D09BF250-C5B0-41CB-237D-08DA00442990', N'2022-07-06 21:53:17.0000000', N'2022-03-07 22:09:58.0000000', NULL, NULL, N'5', N'40FF1844-C099-4061-98E0-CD6E544FCFD3')
GO

INSERT INTO [dbo].[sys_data_authority] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [PermissionType], [RoleId]) VALUES (N'0228A5B5-2202-4BA0-6E48-08DA205DA7B7', N'2022-04-17 18:33:04.0000000', N'2022-04-17 18:33:04.0000000', NULL, NULL, N'5', N'18FA4771-6F58-46A3-80D2-6F0F5E9972E3')
GO


-- ----------------------------
-- Table structure for sys_data_authority_custom
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_data_authority_custom]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_data_authority_custom]
GO

CREATE TABLE [dbo].[sys_data_authority_custom] (
  [Id] uniqueidentifier  NOT NULL,
  [LastModificationTime] datetime2(7)  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [CreatorUserId] uniqueidentifier  NULL,
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
  [LastModificationTime] datetime2(7)  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [CreatorUserId] uniqueidentifier  NULL,
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

INSERT INTO [dbo].[sys_dictionary] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Sort], [Code], [Name], [Value], [ParentId]) VALUES (N'1', N'2021-07-25 22:39:34.0000000', N'2021-07-25 22:31:30.0000000', NULL, NULL, N'1', N'news_type', N'资讯类别', NULL, NULL)
GO

INSERT INTO [dbo].[sys_dictionary] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Sort], [Code], [Name], [Value], [ParentId]) VALUES (N'2', N'2021-07-25 22:40:30.0000000', N'2021-07-25 22:38:49.0000000', NULL, NULL, N'1', N'news_type_nan', N'男', N'1', N'1')
GO

INSERT INTO [dbo].[sys_dictionary] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Sort], [Code], [Name], [Value], [ParentId]) VALUES (N'3', N'2022-07-06 21:55:30.0000000', N'2021-07-25 22:40:47.0000000', NULL, NULL, N'2', N'news_type_nv', N'女', N'2', N'1')
GO

INSERT INTO [dbo].[sys_dictionary] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Sort], [Code], [Name], [Value], [ParentId]) VALUES (N'4', N'2022-06-29 20:55:46.0000000', N'2022-06-29 20:55:46.0000000', NULL, NULL, N'0', N'3', N'未知', N'3', N'1')
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
  [LastModificationTime] datetime2(7)  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [CreatorUserId] uniqueidentifier  NULL,
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
INSERT INTO [dbo].[sys_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [Name], [ByName], [Remark]) VALUES (N'B6FD5425-504A-46A9-993B-2F8DC9158EB8', N'2021-04-18 22:08:06.0000000', N'2022-06-16 17:28:00.0000000', NULL, NULL, N'80', N'打印', N'Print', N'Print')
GO

INSERT INTO [dbo].[sys_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [Name], [ByName], [Remark]) VALUES (N'C9518758-B2E1-4F51-B517-5282E273889C', N'2021-04-18 22:08:06.0000000', N'2016-06-20 13:40:52.0000000', NULL, NULL, N'10', N'显示', N'Display', N'Display')
GO

INSERT INTO [dbo].[sys_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [Name], [ByName], [Remark]) VALUES (N'F27ECB0A-197D-47B1-B243-59A8C71302BF', N'2021-04-18 22:08:06.0000000', N'2016-06-20 13:40:52.0000000', NULL, NULL, N'60', N'检索', N'Search', N'Search')
GO

INSERT INTO [dbo].[sys_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [Name], [ByName], [Remark]) VALUES (N'383E7EE2-7690-46AC-9230-65155C84AA30', N'2021-04-18 22:08:06.0000000', N'2016-06-20 13:40:52.0000000', NULL, NULL, N'50', N'保存', N'Save', N'Save')
GO

INSERT INTO [dbo].[sys_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [Name], [ByName], [Remark]) VALUES (N'9C388461-2704-4C5E-A729-72C17E9018E1', N'2021-04-18 22:08:06.0000000', N'2016-06-20 13:40:52.0000000', NULL, NULL, N'40', N'删除', N'Delete', N'Delete')
GO

INSERT INTO [dbo].[sys_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [Name], [ByName], [Remark]) VALUES (N'BFFEFB1C-8988-4DDF-B4AC-81C2B30E80CD', N'2021-04-18 22:08:06.0000000', N'2016-06-20 13:40:52.0000000', NULL, NULL, N'20', N'添加', N'Insert', N'Insert')
GO

INSERT INTO [dbo].[sys_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [Name], [ByName], [Remark]) VALUES (N'2401F4D0-60B0-4E2E-903F-84C603373572', N'2021-04-18 22:08:06.0000000', N'2016-06-20 13:40:52.0000000', NULL, NULL, N'70', N'导出', N'Export', N'Export')
GO

INSERT INTO [dbo].[sys_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [Name], [ByName], [Remark]) VALUES (N'E7EF2A05-8317-41C3-B588-99519FE88BF9', N'2021-04-18 22:08:06.0000000', N'2016-06-20 13:40:52.0000000', NULL, NULL, N'30', N'修改', N'Update', N'Update')
GO


-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_menu]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_menu]
GO

CREATE TABLE [dbo].[sys_menu] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [LastModificationTime] datetime2(7)  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [CreatorUserId] uniqueidentifier  NULL,
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
  [Type] int  NOT NULL
)
GO

ALTER TABLE [dbo].[sys_menu] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of sys_menu
-- ----------------------------
SET IDENTITY_INSERT [dbo].[sys_menu] ON
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type]) VALUES (N'1', N'2022-03-04 12:25:39.0000000', N'2021-05-28 11:49:02.0000000', NULL, NULL, N'1', N'10', N'更多示例', NULL, NULL, NULL, NULL, N'MoreOutlined', NULL, N'1', N'1', N'1', N'1', N'1')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type]) VALUES (N'2', N'2022-03-18 12:06:20.0000000', N'2021-01-16 16:05:22.0000000', NULL, NULL, N'1.2', N'10', N'Antd Vue3.0组件', N'AppComponentsCom', N'views/AppComponents.vue', N'/app/components', NULL, N'LayoutOutlined', N'1', N'1', N'1', N'1', N'1', N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type]) VALUES (N'3', N'2022-03-04 12:26:14.0000000', N'2020-12-17 14:58:05.0000000', NULL, NULL, N'1.3', N'30', N'按钮', N'ButtonCom', N'views/Button.vue', N'/button', NULL, N'AppstoreOutlined', N'1', N'1', N'1', N'1', N'1', N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type]) VALUES (N'4', N'2022-03-04 12:26:21.0000000', N'2021-01-16 16:06:33.0000000', NULL, NULL, N'1.4', N'40', N'图表 AntV G2', NULL, NULL, NULL, NULL, N'PieChartOutlined', N'1', N'1', N'1', N'1', N'1', N'1')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type]) VALUES (N'5', N'2022-03-04 12:26:25.0000000', N'2021-01-16 16:07:24.0000000', NULL, NULL, N'1.4.5', N'10', N'基础图表', N'ChartBaseCom', N'views/chart/Base.vue', N'/chart/base', NULL, NULL, N'4', N'1', N'1', N'1', N'1', N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type]) VALUES (N'6', N'2022-03-04 12:26:28.0000000', N'2021-01-16 16:10:06.0000000', NULL, NULL, N'1.4.6', N'20', N'更多图表', N'ChartMoreCom', N'views/chart/More.vue', N'/chart/more', NULL, NULL, N'4', N'1', N'1', N'1', N'1', N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type]) VALUES (N'7', N'2022-03-04 12:26:34.0000000', N'2018-03-10 12:16:38.0000000', NULL, NULL, N'1.7', N'50', N'表格管理', NULL, NULL, NULL, NULL, N'TableOutlined', N'1', N'1', N'1', N'1', N'1', N'1')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type]) VALUES (N'8', N'2022-03-04 12:26:38.0000000', N'2020-12-17 14:49:12.0000000', NULL, NULL, N'1.7.8', N'100', N'基础列表', N'BaseListCom', N'views/BaseList.vue', N'/base/list', NULL, NULL, N'7', N'1', N'1', N'1', N'1', N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type]) VALUES (N'9', N'2022-03-04 12:26:41.0000000', N'2020-12-17 14:51:07.0000000', NULL, NULL, N'1.7.9', N'110', N'标准表格', N'ListIndexCom', N'views/list/Index.vue', N'/list', NULL, NULL, N'7', N'1', N'1', N'1', N'1', N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type]) VALUES (N'10', N'2022-03-04 12:26:46.0000000', N'2021-01-18 19:34:28.0000000', NULL, NULL, N'1.10', N'60', N'富文本编辑器', N'EditorCom', N'views/Editor.vue', N'/editor', NULL, N'PicRightOutlined', N'1', N'1', N'1', N'1', N'1', N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type]) VALUES (N'11', N'2022-03-04 12:26:49.0000000', N'2021-08-05 21:51:12.0000000', NULL, NULL, N'1.11', N'70', N'跳转外部地址', N'ExternalJumpCom', N'components/ExternalJump.vue', N'/external/jump/:path(.*)', N'https://antv.vision/zh', N'RadarChartOutlined', N'1', N'1', N'1', N'1', N'1', N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type]) VALUES (N'12', N'2022-03-04 12:25:43.0000000', N'2018-03-10 12:16:38.0000000', NULL, NULL, N'12', N'50', N'基础信息', NULL, NULL, NULL, NULL, N'GoldOutlined', NULL, N'1', N'1', N'1', N'1', N'1')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type]) VALUES (N'13', N'2022-03-04 12:26:55.0000000', N'2018-03-10 12:16:38.0000000', NULL, NULL, N'12.13', N'10', N'会员管理', N'base_member', N'views/base/member/Index.vue', N'/base/member', NULL, N'UsergroupAddOutlined', N'12', N'1', N'1', N'1', N'1', N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type]) VALUES (N'14', N'2022-03-04 12:25:46.0000000', N'2018-03-10 12:16:38.0000000', NULL, NULL, N'14', N'100', N'系统管理', NULL, NULL, NULL, NULL, N'DesktopOutlined', NULL, N'1', N'1', N'1', N'1', N'1')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type]) VALUES (N'15', N'2022-03-04 12:27:02.0000000', N'2018-03-10 12:16:38.0000000', NULL, NULL, N'14.15', N'100', N'账户管理', N'system_user', N'views/system/user/Index.vue', N'/system/user', NULL, N'UserOutlined', N'14', N'1', N'1', N'1', N'1', N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type]) VALUES (N'16', N'2022-04-22 22:24:03.0000000', N'2018-03-10 12:16:38.0000000', NULL, NULL, N'14.16', N'110', N'角色管理', N'system_role', N'views/system/role/Index.vue', N'/system/role', NULL, N'TeamOutlined', N'14', N'1', N'1', N'1', N'1', N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type]) VALUES (N'17', N'2022-03-04 12:27:11.0000000', N'2018-03-10 12:16:38.0000000', NULL, NULL, N'14.17', N'120', N'功能管理', N'system_function', N'views/system/function/Index.vue', N'/system/function', NULL, N'ControlOutlined', N'14', N'1', N'1', N'1', N'1', N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type]) VALUES (N'19', N'2022-03-04 12:27:19.0000000', N'2018-03-10 12:16:38.0000000', NULL, NULL, N'14.19', N'150', N'个人中心', N'system_personal_center', N'views/system/personal_center/Index.vue', N'/system/personal/center', NULL, N'FormOutlined', N'14', N'1', N'1', N'1', N'1', N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type]) VALUES (N'20', N'2022-03-04 12:27:23.0000000', N'2021-05-27 17:29:49.0000000', NULL, NULL, N'14.20', N'160', N'岗位管理', N'system_post', N'views/system/post/Index.vue', N'/system/post', NULL, N'IdcardOutlined', N'14', N'1', N'1', N'1', N'1', N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type]) VALUES (N'21', N'2022-03-04 12:27:27.0000000', N'2021-05-27 20:27:56.0000000', NULL, NULL, N'14.21', N'170', N'组织机构', N'system_organization', N'views/system/organization/Index.vue', N'/system/organization', NULL, N'ClusterOutlined', N'14', N'1', N'1', N'1', N'1', N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type]) VALUES (N'22', N'2022-03-04 12:27:41.0000000', N'2018-03-10 12:17:03.0000000', NULL, NULL, N'29.22', N'10', N'接口文档', N'swagger', N'views/development_tool/Swagger.vue', N'/development_tool/swagger', NULL, N'FileSearchOutlined', N'29', N'1', N'1', N'1', N'1', N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type]) VALUES (N'23', N'2022-03-04 12:27:31.0000000', N'2021-07-25 21:50:01.0000000', NULL, NULL, N'14.23', N'190', N'数据字典', N'system_dictionary', N'views/system/dictionary/Index.vue', N'/system/dictionary', NULL, N'FileDoneOutlined', N'14', N'1', N'1', N'1', N'1', N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type]) VALUES (N'24', N'2022-03-04 12:27:35.0000000', N'2021-08-05 21:24:54.0000000', NULL, NULL, N'14.24', N'200', N'操作日志', N'sys_operation_log', N'views/system/sys_operation_log/Index.vue', N'/system/sys_operation_log', N'', N'ContainerOutlined', N'14', N'1', N'1', N'1', N'1', N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type]) VALUES (N'25', N'2022-03-04 12:27:15.0000000', N'2018-03-10 12:16:38.0000000', NULL, NULL, N'14.25', N'130', N'菜单功能', N'system_menu', N'views/system/menu/Index.vue', N'/system/menu', NULL, N'MenuOutlined', N'14', N'1', N'1', N'1', N'1', N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type]) VALUES (N'28', N'2022-03-04 12:26:00.0000000', N'2021-12-29 17:13:26.0000000', NULL, NULL, N'1.28', N'1', N'Vxe-Table', N'VxeTableCom', N'views/VxeTable.vue', N'/vxe/table', NULL, N'BorderlessTableOutlined', N'1', N'1', N'1', N'1', N'1', N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type]) VALUES (N'29', N'2022-03-04 12:25:49.0000000', N'2022-01-12 14:17:21.0000000', NULL, NULL, N'29', N'200', N'开发工具', NULL, NULL, NULL, NULL, N'CodepenOutlined', NULL, N'1', N'1', N'1', N'1', N'1')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type]) VALUES (N'30', N'2022-03-04 12:27:44.0000000', N'2022-01-12 14:22:04.0000000', NULL, NULL, N'29.30', N'20', N'定时任务', N'TimedTaskCom', N'views/development_tool/timed_task/Index.vue', N'/development_tool/timed_task', NULL, N'FieldTimeOutlined', N'29', N'1', N'1', N'1', N'1', N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type]) VALUES (N'31', N'2022-05-24 22:05:57.0000000', N'2022-01-12 15:39:46.0000000', NULL, NULL, N'29.31', N'30', N'代码生成', N'LowCode', N'views/development_tool/low_code/Index.vue', N'/development-tool/low-code', NULL, N'CodeTwoTone', N'29', N'1', N'1', N'1', N'1', N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type]) VALUES (N'32', N'2022-03-18 12:06:38.0000000', N'2022-02-24 10:51:38.0000000', NULL, NULL, N'1.32', N'20', N'图标展示', N'IconsVue', N'views/Icons.vue', N'/icons', NULL, N'TagsTwoTone', N'1', N'1', N'1', N'1', N'1', N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type]) VALUES (N'33', N'2022-04-10 10:56:17.0000000', N'2022-04-10 10:55:41.0000000', NULL, NULL, N'29.33', N'40', N'EFCore监控台', N'monitor_ef_core', N'views/development_tool/monitor_ef_core/Index.vue', N'/development_tool/monitor/efcore', NULL, N'DashboardFilled', N'29', N'1', N'1', N'1', N'1', N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type]) VALUES (N'36', N'2022-04-17 17:49:13.0000000', N'2022-04-17 17:45:25.0000000', NULL, NULL, N'12.13.36', N'1', N'详情', N'base_member_info_Details', N'views/base/member/components/Details.vue', N'/base/member/details/:id/:title', NULL, NULL, N'13', N'0', N'1', N'1', N'1', N'2')
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
  [LastModificationTime] datetime2(7)  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [CreatorUserId] uniqueidentifier  NULL,
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
INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'33C80938-82C8-4299-0F12-08D9FDAD00AB', N'2022-03-04 15:17:09.0000000', N'2022-03-04 15:17:09.0000000', NULL, NULL, N'10', N'30', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'EF70B789-21EE-4850-0F1B-08D9FDAD00AB', N'2022-03-04 15:16:44.0000000', N'2022-03-04 15:16:44.0000000', NULL, NULL, N'10', N'22', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'A7CD04DB-BBE3-49B6-0F1E-08D9FDAD00AB', N'2022-03-18 12:06:20.0000000', N'2022-03-18 12:06:20.0000000', NULL, NULL, N'10', N'2', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'6C09C0C0-72FA-4842-0F1F-08D9FDAD00AB', N'2022-03-18 12:06:38.0000000', N'2022-03-18 12:06:38.0000000', NULL, NULL, N'10', N'32', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'F64CFE50-1EF1-457F-0F20-08D9FDAD00AB', N'2022-03-04 15:24:24.0000000', N'2022-03-04 15:24:24.0000000', NULL, NULL, N'10', N'3', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'A1DDD02F-8C21-4D79-0F21-08D9FDAD00AB', N'2022-03-04 15:24:30.0000000', N'2022-03-04 15:24:30.0000000', NULL, NULL, N'10', N'5', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'1CB6FBE1-4A6C-4AAD-0F22-08D9FDAD00AB', N'2022-03-04 15:24:34.0000000', N'2022-03-04 15:24:34.0000000', NULL, NULL, N'10', N'6', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'D2E6EA60-2CF6-478A-0F23-08D9FDAD00AB', N'2022-03-04 15:24:40.0000000', N'2022-03-04 15:24:40.0000000', NULL, NULL, N'10', N'8', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'B7533A90-DAE4-4263-0F24-08D9FDAD00AB', N'2022-03-04 15:24:43.0000000', N'2022-03-04 15:24:43.0000000', NULL, NULL, N'10', N'9', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'EC535908-8671-4928-0F25-08D9FDAD00AB', N'2022-03-04 15:24:47.0000000', N'2022-03-04 15:24:47.0000000', NULL, NULL, N'10', N'10', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'3BC0E68F-D03D-4E99-0F26-08D9FDAD00AB', N'2022-03-04 15:24:53.0000000', N'2022-03-04 15:24:53.0000000', NULL, NULL, N'10', N'11', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'EB958545-6449-40DB-0F27-08D9FDAD00AB', N'2022-03-04 15:25:07.0000000', N'2022-03-04 15:25:07.0000000', NULL, NULL, N'10', N'13', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'B5881044-AFB8-40B2-0F28-08D9FDAD00AB', N'2022-03-04 15:25:07.0000000', N'2022-03-04 15:25:07.0000000', NULL, NULL, N'20', N'13', N'Insert', N'添加', N'Insert')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'106FB69A-8BB5-4559-0F29-08D9FDAD00AB', N'2022-03-04 15:25:07.0000000', N'2022-03-04 15:25:07.0000000', NULL, NULL, N'30', N'13', N'Update', N'修改', N'Update')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'F4621FBE-6B40-4454-0F2A-08D9FDAD00AB', N'2022-03-04 15:25:07.0000000', N'2022-03-04 15:25:07.0000000', NULL, NULL, N'40', N'13', N'Delete', N'删除', N'Delete')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'523B53B5-8159-4A16-0F2B-08D9FDAD00AB', N'2022-03-04 15:25:07.0000000', N'2022-03-04 15:25:07.0000000', NULL, NULL, N'50', N'13', N'Save', N'保存', N'Save')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'A3754771-F6E9-4A23-0F2C-08D9FDAD00AB', N'2022-03-04 15:25:07.0000000', N'2022-03-04 15:25:07.0000000', NULL, NULL, N'60', N'13', N'Search', N'检索', N'Search')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'B96F977C-A36E-4E7F-0F2D-08D9FDAD00AB', N'2022-03-04 15:25:07.0000000', N'2022-03-04 15:25:07.0000000', NULL, NULL, N'70', N'13', N'Export', N'导出', N'Export')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'541D9045-47B2-4629-0F2E-08D9FDAD00AB', N'2022-03-04 15:25:07.0000000', N'2022-03-04 15:25:07.0000000', NULL, NULL, N'80', N'13', N'Print', N'打印', N'Print')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'13F3F74D-C6FC-4488-0F2F-08D9FDAD00AB', N'2022-03-04 15:25:14.0000000', N'2022-03-04 15:25:14.0000000', NULL, NULL, N'10', N'15', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'CCE82EB4-7FC5-4308-0F30-08D9FDAD00AB', N'2022-03-04 15:25:14.0000000', N'2022-03-04 15:25:14.0000000', NULL, NULL, N'20', N'15', N'Insert', N'添加', N'Insert')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'8564E4D8-D7F4-4F12-0F31-08D9FDAD00AB', N'2022-03-04 15:25:14.0000000', N'2022-03-04 15:25:14.0000000', NULL, NULL, N'30', N'15', N'Update', N'修改', N'Update')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'0AD6A459-1D9D-4512-0F32-08D9FDAD00AB', N'2022-03-04 15:25:14.0000000', N'2022-03-04 15:25:14.0000000', NULL, NULL, N'40', N'15', N'Delete', N'删除', N'Delete')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'37D3E492-62DA-47A4-0F33-08D9FDAD00AB', N'2022-03-04 15:25:14.0000000', N'2022-03-04 15:25:14.0000000', NULL, NULL, N'50', N'15', N'Save', N'保存', N'Save')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'BEB87004-5CFB-417A-0F34-08D9FDAD00AB', N'2022-03-04 15:25:14.0000000', N'2022-03-04 15:25:14.0000000', NULL, NULL, N'60', N'15', N'Search', N'检索', N'Search')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'A46E07D3-C722-4548-0F35-08D9FDAD00AB', N'2022-03-04 15:25:14.0000000', N'2022-03-04 15:25:14.0000000', NULL, NULL, N'70', N'15', N'Export', N'导出', N'Export')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'C8EDBB79-567E-461B-0F36-08D9FDAD00AB', N'2022-03-04 15:25:14.0000000', N'2022-03-04 15:25:14.0000000', NULL, NULL, N'80', N'15', N'Print', N'打印', N'Print')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'550F874B-E804-44A0-0F37-08D9FDAD00AB', N'2022-04-22 22:24:03.0000000', N'2022-04-22 22:24:03.0000000', NULL, NULL, N'10', N'16', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'C67A0ABE-DAEC-491B-0F38-08D9FDAD00AB', N'2022-04-22 22:24:03.0000000', N'2022-04-22 22:24:03.0000000', NULL, NULL, N'20', N'16', N'Insert', N'添加', N'Insert')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'823AC05D-65E4-4216-0F39-08D9FDAD00AB', N'2022-04-22 22:24:03.0000000', N'2022-04-22 22:24:03.0000000', NULL, NULL, N'30', N'16', N'Update', N'修改', N'Update')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'BD6AE6DA-1CA6-46C2-0F3A-08D9FDAD00AB', N'2022-04-22 22:24:03.0000000', N'2022-04-22 22:24:03.0000000', NULL, NULL, N'40', N'16', N'Delete', N'删除', N'Delete')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'14783A71-E265-4D6B-0F3B-08D9FDAD00AB', N'2022-04-22 22:24:03.0000000', N'2022-04-22 22:24:03.0000000', NULL, NULL, N'50', N'16', N'Save', N'保存', N'Save')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'2FEA8F87-2A13-4C95-0F3C-08D9FDAD00AB', N'2022-04-22 22:24:03.0000000', N'2022-04-22 22:24:03.0000000', NULL, NULL, N'60', N'16', N'Search', N'检索', N'Search')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'437FBF85-8704-4E87-0F3D-08D9FDAD00AB', N'2022-04-22 22:24:03.0000000', N'2022-04-22 22:24:03.0000000', NULL, NULL, N'70', N'16', N'Export', N'导出', N'Export')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'6B009415-EADF-4DAB-0F3E-08D9FDAD00AB', N'2022-04-22 22:24:03.0000000', N'2022-04-22 22:24:03.0000000', NULL, NULL, N'80', N'16', N'Print', N'打印', N'Print')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'53FDB4A0-CA6E-4568-0F3F-08D9FDAD00AB', N'2022-03-04 15:25:21.0000000', N'2022-03-04 15:25:21.0000000', NULL, NULL, N'10', N'17', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'86465238-C51C-45D5-0F40-08D9FDAD00AB', N'2022-03-04 15:25:21.0000000', N'2022-03-04 15:25:21.0000000', NULL, NULL, N'20', N'17', N'Insert', N'添加', N'Insert')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'86FF83FD-D34A-4290-0F41-08D9FDAD00AB', N'2022-03-04 15:25:21.0000000', N'2022-03-04 15:25:21.0000000', NULL, NULL, N'30', N'17', N'Update', N'修改', N'Update')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'7EA8F706-BFE5-42B2-0F42-08D9FDAD00AB', N'2022-03-04 15:25:21.0000000', N'2022-03-04 15:25:21.0000000', NULL, NULL, N'40', N'17', N'Delete', N'删除', N'Delete')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'DEE401B1-E20E-496E-0F43-08D9FDAD00AB', N'2022-03-04 15:25:21.0000000', N'2022-03-04 15:25:21.0000000', NULL, NULL, N'50', N'17', N'Save', N'保存', N'Save')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'0B27E69F-AF16-4481-0F44-08D9FDAD00AB', N'2022-03-04 15:25:21.0000000', N'2022-03-04 15:25:21.0000000', NULL, NULL, N'60', N'17', N'Search', N'检索', N'Search')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'A726455F-1C29-4BE0-0F45-08D9FDAD00AB', N'2022-03-04 15:25:21.0000000', N'2022-03-04 15:25:21.0000000', NULL, NULL, N'70', N'17', N'Export', N'导出', N'Export')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'0CAA6E7D-92B0-4814-0F46-08D9FDAD00AB', N'2022-03-04 15:25:21.0000000', N'2022-03-04 15:25:21.0000000', NULL, NULL, N'80', N'17', N'Print', N'打印', N'Print')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'DB3AB8BD-7709-41A2-0F47-08D9FDAD00AB', N'2022-03-04 15:25:28.0000000', N'2022-03-04 15:25:28.0000000', NULL, NULL, N'10', N'25', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'FE6465BF-E429-45BD-0F48-08D9FDAD00AB', N'2022-03-04 15:25:28.0000000', N'2022-03-04 15:25:28.0000000', NULL, NULL, N'20', N'25', N'Insert', N'添加', N'Insert')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'4A67FCDB-A7A9-4E3C-0F49-08D9FDAD00AB', N'2022-03-04 15:25:28.0000000', N'2022-03-04 15:25:28.0000000', NULL, NULL, N'30', N'25', N'Update', N'修改', N'Update')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'20AB5395-D57C-49DB-0F4A-08D9FDAD00AB', N'2022-03-04 15:25:28.0000000', N'2022-03-04 15:25:28.0000000', NULL, NULL, N'40', N'25', N'Delete', N'删除', N'Delete')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'41CB1942-573A-4D63-0F4B-08D9FDAD00AB', N'2022-03-04 15:25:28.0000000', N'2022-03-04 15:25:28.0000000', NULL, NULL, N'50', N'25', N'Save', N'保存', N'Save')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'7E0F6C84-D7F1-4243-0F4C-08D9FDAD00AB', N'2022-03-04 15:25:28.0000000', N'2022-03-04 15:25:28.0000000', NULL, NULL, N'60', N'25', N'Search', N'检索', N'Search')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'1E69DF5D-D1E9-4BC8-0F4D-08D9FDAD00AB', N'2022-03-04 15:25:28.0000000', N'2022-03-04 15:25:28.0000000', NULL, NULL, N'70', N'25', N'Export', N'导出', N'Export')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'4BBBE120-0CC6-4A08-0F4E-08D9FDAD00AB', N'2022-03-04 15:25:28.0000000', N'2022-03-04 15:25:28.0000000', NULL, NULL, N'80', N'25', N'Print', N'打印', N'Print')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'45E2CA86-4823-4FB9-0F57-08D9FDAD00AB', N'2022-03-04 15:25:36.0000000', N'2022-03-04 15:25:36.0000000', NULL, NULL, N'10', N'20', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'3E44C6F5-E090-40A1-0F58-08D9FDAD00AB', N'2022-03-04 15:25:36.0000000', N'2022-03-04 15:25:36.0000000', NULL, NULL, N'20', N'20', N'Insert', N'添加', N'Insert')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'22A675F6-EFDA-481D-0F59-08D9FDAD00AB', N'2022-03-04 15:25:36.0000000', N'2022-03-04 15:25:36.0000000', NULL, NULL, N'30', N'20', N'Update', N'修改', N'Update')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'69DA651E-787B-42E5-0F5A-08D9FDAD00AB', N'2022-03-04 15:25:36.0000000', N'2022-03-04 15:25:36.0000000', NULL, NULL, N'40', N'20', N'Delete', N'删除', N'Delete')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'616C4E4A-FB61-49CF-0F5B-08D9FDAD00AB', N'2022-03-04 15:25:36.0000000', N'2022-03-04 15:25:36.0000000', NULL, NULL, N'50', N'20', N'Save', N'保存', N'Save')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'5E4E87BD-C179-4B5B-0F5C-08D9FDAD00AB', N'2022-03-04 15:25:36.0000000', N'2022-03-04 15:25:36.0000000', NULL, NULL, N'60', N'20', N'Search', N'检索', N'Search')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'54743C86-AC73-4345-0F5D-08D9FDAD00AB', N'2022-03-04 15:25:36.0000000', N'2022-03-04 15:25:36.0000000', NULL, NULL, N'70', N'20', N'Export', N'导出', N'Export')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'2469188C-21DE-492A-0F5E-08D9FDAD00AB', N'2022-03-04 15:25:36.0000000', N'2022-03-04 15:25:36.0000000', NULL, NULL, N'80', N'20', N'Print', N'打印', N'Print')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'C6BA141B-99BA-4114-0F5F-08D9FDAD00AB', N'2022-03-04 15:25:40.0000000', N'2022-03-04 15:25:40.0000000', NULL, NULL, N'10', N'21', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'0A85E4FD-5A1C-47F6-0F60-08D9FDAD00AB', N'2022-03-04 15:25:40.0000000', N'2022-03-04 15:25:40.0000000', NULL, NULL, N'20', N'21', N'Insert', N'添加', N'Insert')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'F4C73AC0-C66D-4988-0F61-08D9FDAD00AB', N'2022-03-04 15:25:40.0000000', N'2022-03-04 15:25:40.0000000', NULL, NULL, N'30', N'21', N'Update', N'修改', N'Update')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'3CB3CBC7-9E45-4CC3-0F62-08D9FDAD00AB', N'2022-03-04 15:25:40.0000000', N'2022-03-04 15:25:40.0000000', NULL, NULL, N'40', N'21', N'Delete', N'删除', N'Delete')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'6B209D5A-B366-4A61-0F63-08D9FDAD00AB', N'2022-03-04 15:25:40.0000000', N'2022-03-04 15:25:40.0000000', NULL, NULL, N'50', N'21', N'Save', N'保存', N'Save')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'F36B9B06-2826-425F-0F64-08D9FDAD00AB', N'2022-03-04 15:25:40.0000000', N'2022-03-04 15:25:40.0000000', NULL, NULL, N'60', N'21', N'Search', N'检索', N'Search')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'A9503588-E6F7-420B-0F65-08D9FDAD00AB', N'2022-03-04 15:25:40.0000000', N'2022-03-04 15:25:40.0000000', NULL, NULL, N'70', N'21', N'Export', N'导出', N'Export')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'C9E5FFF0-6744-47D7-0F66-08D9FDAD00AB', N'2022-03-04 15:25:40.0000000', N'2022-03-04 15:25:40.0000000', NULL, NULL, N'80', N'21', N'Print', N'打印', N'Print')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'9426768E-B90D-41E1-0F67-08D9FDAD00AB', N'2022-03-04 15:25:50.0000000', N'2022-03-04 15:25:50.0000000', NULL, NULL, N'10', N'23', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'E991934A-0D30-416B-0F68-08D9FDAD00AB', N'2022-03-04 15:25:50.0000000', N'2022-03-04 15:25:50.0000000', NULL, NULL, N'20', N'23', N'Insert', N'添加', N'Insert')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'B98A365E-6FB4-4EFB-0F69-08D9FDAD00AB', N'2022-03-04 15:25:50.0000000', N'2022-03-04 15:25:50.0000000', NULL, NULL, N'30', N'23', N'Update', N'修改', N'Update')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'92B39A10-3927-4EE7-0F6A-08D9FDAD00AB', N'2022-03-04 15:25:50.0000000', N'2022-03-04 15:25:50.0000000', NULL, NULL, N'40', N'23', N'Delete', N'删除', N'Delete')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'A03D56D7-4B0D-47CC-0F6B-08D9FDAD00AB', N'2022-03-04 15:25:50.0000000', N'2022-03-04 15:25:50.0000000', NULL, NULL, N'50', N'23', N'Save', N'保存', N'Save')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'E2319118-42CC-41A2-0F6C-08D9FDAD00AB', N'2022-03-04 15:25:50.0000000', N'2022-03-04 15:25:50.0000000', NULL, NULL, N'60', N'23', N'Search', N'检索', N'Search')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'0984A2E1-3722-41D4-0F6D-08D9FDAD00AB', N'2022-03-04 15:25:50.0000000', N'2022-03-04 15:25:50.0000000', NULL, NULL, N'70', N'23', N'Export', N'导出', N'Export')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'1D831D57-6634-45D7-0F6E-08D9FDAD00AB', N'2022-03-04 15:25:50.0000000', N'2022-03-04 15:25:50.0000000', NULL, NULL, N'80', N'23', N'Print', N'打印', N'Print')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'C77C812A-1601-4311-0F70-08D9FDAD00AB', N'2022-03-04 15:26:00.0000000', N'2022-03-04 15:26:00.0000000', NULL, NULL, N'10', N'19', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'3F6D0AF7-5386-4D3A-0F71-08D9FDAD00AB', N'2022-03-04 15:40:52.0000000', N'2022-03-04 15:40:52.0000000', NULL, NULL, N'10', N'28', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'55750F56-EDC9-4771-E2D6-08D9FDEFA8F8', N'2022-03-04 23:00:02.0000000', N'2022-03-04 23:00:02.0000000', NULL, NULL, N'10', N'24', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'7694FBF5-E28D-424C-E2D7-08D9FDEFA8F8', N'2022-03-04 23:00:02.0000000', N'2022-03-04 23:00:02.0000000', NULL, NULL, N'40', N'24', N'Delete', N'删除', N'Delete')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'2186550D-246C-4552-E2D8-08D9FDEFA8F8', N'2022-03-04 23:00:02.0000000', N'2022-03-04 23:00:02.0000000', NULL, NULL, N'60', N'24', N'Search', N'检索', N'Search')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'687254AE-0D76-4788-A4E8-08DA1A9D9949', N'2022-04-10 10:56:17.0000000', N'2022-04-10 10:56:17.0000000', NULL, NULL, N'10', N'33', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'0073CCE2-FF42-496C-9FF6-08DA204FCECB', N'2022-04-17 20:40:12.0000000', N'2022-04-17 20:40:12.0000000', NULL, NULL, N'10', N'36', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'48F0A694-0539-4E69-A2E4-08DA3D8E6577', N'2022-05-24 22:05:57.0000000', N'2022-05-24 22:05:57.0000000', NULL, NULL, N'10', N'31', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'4DBF096D-D3D3-4565-A2E5-08DA3D8E6577', N'2022-05-24 22:05:57.0000000', N'2022-05-24 22:05:57.0000000', NULL, NULL, N'40', N'31', N'Delete', N'删除', N'Delete')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'38B4704D-7C5D-4F89-A2E7-08DA3D8E6577', N'2022-05-24 22:05:57.0000000', N'2022-05-24 22:05:57.0000000', NULL, NULL, N'60', N'31', N'Search', N'检索', N'Search')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'7890CC93-DED0-4C18-B325-08DA716B6134', N'2022-07-29 22:35:08.5150335', N'2022-07-29 22:35:08.5150322', NULL, NULL, N'10', N'37', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'8D82D688-77DD-4CA6-B326-08DA716B6134', N'2022-07-29 22:35:08.5150337', N'2022-07-29 22:35:08.5150336', NULL, NULL, N'20', N'37', N'Insert', N'添加', N'Insert')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'628C6E8C-3FC6-4DD0-B327-08DA716B6134', N'2022-07-29 22:35:08.5150338', N'2022-07-29 22:35:08.5150337', NULL, NULL, N'30', N'37', N'Update', N'修改', N'Update')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'377B961C-3DEE-445A-B328-08DA716B6134', N'2022-07-29 22:35:08.5150339', N'2022-07-29 22:35:08.5150338', NULL, NULL, N'40', N'37', N'Delete', N'删除', N'Delete')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'25774728-1C9A-476A-B329-08DA716B6134', N'2022-07-29 22:35:08.5150340', N'2022-07-29 22:35:08.5150339', NULL, NULL, N'50', N'37', N'Save', N'保存', N'Save')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'A63BE630-AC04-40AA-B32A-08DA716B6134', N'2022-07-29 22:35:08.5150341', N'2022-07-29 22:35:08.5150340', NULL, NULL, N'60', N'37', N'Search', N'检索', N'Search')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'BFC1476C-DB0D-4DB4-B32B-08DA716B6134', N'2022-07-29 22:35:08.5150342', N'2022-07-29 22:35:08.5150341', NULL, NULL, N'70', N'37', N'Export', N'导出', N'Export')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'F8C7EE2C-842E-402E-B32C-08DA716B6134', N'2022-07-29 22:35:08.5150343', N'2022-07-29 22:35:08.5150342', NULL, NULL, N'80', N'37', N'Print', N'打印', N'Print')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'DDD08D34-55A2-43EB-B32D-08DA716B6134', N'2022-07-29 22:16:34.6119656', N'2022-07-29 22:16:34.6119640', NULL, NULL, N'10', N'38', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'09B50A32-5748-408C-B32E-08DA716B6134', N'2022-07-29 22:16:34.6119657', N'2022-07-29 22:16:34.6119657', NULL, NULL, N'20', N'38', N'Insert', N'添加', N'Insert')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'299C81A3-66A6-4FF2-B32F-08DA716B6134', N'2022-07-29 22:16:34.6119658', N'2022-07-29 22:16:34.6119658', NULL, NULL, N'30', N'38', N'Update', N'修改', N'Update')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'B3847204-1AFA-4F58-B330-08DA716B6134', N'2022-07-29 22:16:34.6119659', N'2022-07-29 22:16:34.6119659', NULL, NULL, N'40', N'38', N'Delete', N'删除', N'Delete')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'01D95CC7-BC8C-4735-B331-08DA716B6134', N'2022-07-29 22:16:34.6119660', N'2022-07-29 22:16:34.6119660', NULL, NULL, N'50', N'38', N'Save', N'保存', N'Save')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'FC75B3A0-2A84-48F2-B332-08DA716B6134', N'2022-07-29 22:16:34.6119662', N'2022-07-29 22:16:34.6119661', NULL, NULL, N'60', N'38', N'Search', N'检索', N'Search')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'FCCD54AB-9E7D-4184-B333-08DA716B6134', N'2022-07-29 22:16:34.6119663', N'2022-07-29 22:16:34.6119663', NULL, NULL, N'70', N'38', N'Export', N'导出', N'Export')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'38F4D17C-D4A1-44F3-B334-08DA716B6134', N'2022-07-29 22:16:34.6119664', N'2022-07-29 22:16:34.6119664', NULL, NULL, N'80', N'38', N'Print', N'打印', N'Print')
GO


-- ----------------------------
-- Table structure for sys_operation_log
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_operation_log]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_operation_log]
GO

CREATE TABLE [dbo].[sys_operation_log] (
  [Id] uniqueidentifier  NOT NULL,
  [LastModificationTime] datetime2(7)  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [CreatorUserId] uniqueidentifier  NULL,
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
INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2B15A020-5024-43D3-26A7-08DA71EA27AD', N'2022-07-30 13:12:52.9656238', N'2022-07-30 13:12:52.9656222', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'2', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E65B1B19-D1CA-4C9D-26A8-08DA71EA27AD', N'2022-07-30 13:12:54.3261588', N'2022-07-30 13:12:54.3261572', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'437', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2422CF96-A2F0-4C4A-26A9-08DA71EA27AD', N'2022-07-30 13:13:08.3847798', N'2022-07-30 13:13:08.3847790', NULL, NULL, N'/api/admin/SysOrganization/sysOrganizationTree', N'0.0.0.1', N'', N'{}', N'', N'91', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'组织机构', N'查看组织架构树')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2178900A-5C08-48AD-26AA-08DA71EA27AD', N'2022-07-30 13:13:08.9497078', N'2022-07-30 13:13:08.9497064', NULL, NULL, N'/api/admin/SysUser/findList/10/1', N'0.0.0.1', N'', N'{"name":null,"loginName":null,"organizationId":null}', N'', N'481', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查看数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0881A4EA-6D24-496F-26AB-08DA71EA27AD', N'2022-07-30 13:14:50.5664771', N'2022-07-30 13:14:50.5664765', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'17', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'FB52287F-318A-4A28-26AC-08DA71EA27AD', N'2022-07-30 13:14:50.8497212', N'2022-07-30 13:14:50.8497207', NULL, NULL, N'/api/admin/SysOrganization/sysOrganizationTree', N'0.0.0.1', N'', N'{}', N'', N'47', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'组织机构', N'查看组织架构树')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E3B8D508-AB7F-494C-26AD-08DA71EA27AD', N'2022-07-30 13:14:50.9428101', N'2022-07-30 13:14:50.9428096', NULL, NULL, N'/api/admin/SysUser/findList/10/1', N'0.0.0.1', N'', N'{"name":null,"loginName":null,"organizationId":null}', N'', N'27', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查看数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'EE55E99D-7E20-416E-26AE-08DA71EA27AD', N'2022-07-30 13:14:53.4816999', N'2022-07-30 13:14:53.4816990', NULL, NULL, N'/api/admin/SysRole/findList/10/1', N'0.0.0.1', N'', N'{"name":null}', N'', N'46', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'角色', N'查看表格')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F93C5E5D-64D6-4A66-26AF-08DA71EA27AD', N'2022-07-30 13:14:56.2737148', N'2022-07-30 13:14:56.2737141', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'126', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'28A6587A-8739-43C3-26B0-08DA71EA27AD', N'2022-07-30 13:14:57.7210100', N'2022-07-30 13:14:57.7210091', NULL, NULL, N'/api/admin/LowCodeTableInfo/findList/20/1', N'0.0.0.1', N'', N'{"columnName":null,"describe":null,"low_Code_TableId":"6323638b-a45f-4a76-886e-69a9e9be0901"}', N'', N'28', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeSearchController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7728B4FC-DA64-46CA-26B1-08DA71EA27AD', N'2022-07-30 13:14:59.5768544', N'2022-07-30 13:14:59.5768538', NULL, NULL, N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"sys_user","type":"HZY.Models","codeText":""}', N'', N'229', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'97710DA2-7858-41AD-26B2-08DA71EA27AD', N'2022-07-30 13:15:29.3697010', N'2022-07-30 13:15:29.3697004', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'9', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B8E37C55-6C78-4409-26B3-08DA71EA27AD', N'2022-07-30 13:15:29.8180965', N'2022-07-30 13:15:29.8180953', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'144', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'421359AD-5766-4D09-26B4-08DA71EA27AD', N'2022-07-30 13:15:30.9663733', N'2022-07-30 13:15:30.9663727', NULL, NULL, N'/api/admin/LowCodeTableInfo/findList/20/1', N'0.0.0.1', N'', N'{"columnName":null,"describe":null,"low_Code_TableId":"6323638b-a45f-4a76-886e-69a9e9be0901"}', N'', N'7', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeSearchController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'953E65C0-EC38-40B1-26B5-08DA71EA27AD', N'2022-07-30 13:15:31.8115318', N'2022-07-30 13:15:31.8115311', NULL, NULL, N'/api/admin/LowCodeTable/findForm/6323638b-a45f-4a76-886e-69a9e9be0901', N'0.0.0.1', N'', N'', N'', N'28', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9F689E47-62B6-4AA3-26B6-08DA71EA27AD', N'2022-07-30 13:15:33.4411822', N'2022-07-30 13:15:33.4411815', NULL, NULL, N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"sys_user","type":"HZY.Models","codeText":""}', N'', N'173', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'135AB500-D8B2-4111-26B7-08DA71EA27AD', N'2022-07-30 13:15:34.5453865', N'2022-07-30 13:15:34.5453860', NULL, NULL, N'/api/admin/LowCodeTable/findForm/6323638b-a45f-4a76-886e-69a9e9be0901', N'0.0.0.1', N'', N'', N'', N'4', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2B3BB29A-1F93-4D89-26B8-08DA71EA27AD', N'2022-07-30 13:15:43.5033984', N'2022-07-30 13:15:43.5033978', NULL, NULL, N'/api/admin/LowCodeTable/update', N'0.0.0.1', N'', N'{"tableName":"sys_user","schema":"dbo","type":"TABLE","displayName":"用户","entityName":"SysUser","remark":null,"projectRootPath":"HzyAdmin","modelPath":"hzy-admin-server/HZY.Models/Entities/","servicePath":"hzy-admin-server/HZY.Services.Admin/","controllerPath":"hzy-admin-server/HZY.Controllers.Admin/","indexVuePath":"hzy-admin-client/src/views/my/","infoVuePath":"hzy-admin-client/src/views/my/","serviceJsPath":"hzy-admin-client/src/service/my/","isCover":false,"id":"6323638b-a45f-4a76-886e-69a9e9be0901","lastModificationTime":"2022-07-30 12:48:34","creationTime":"2022-04-17 00:00:00"}', N'', N'53', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'编辑表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'CAF39443-280E-4D22-26B9-08DA71EA27AD', N'2022-07-30 13:15:45.3369382', N'2022-07-30 13:15:45.3369376', NULL, NULL, N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"sys_user","type":"HZY.Models","codeText":""}', N'', N'194', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7A798EDC-34B3-4CBB-26BA-08DA71EA27AD', N'2022-07-30 13:15:45.8906498', N'2022-07-30 13:15:45.8906493', NULL, NULL, N'/api/admin/LowCodeTable/findForm/6323638b-a45f-4a76-886e-69a9e9be0901', N'0.0.0.1', N'', N'', N'', N'5', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'343F9234-5B6C-486F-26BB-08DA71EA27AD', N'2022-07-30 13:15:47.4466780', N'2022-07-30 13:15:47.4466773', NULL, NULL, N'/api/admin/LowCodeTable/findForm/6323638b-a45f-4a76-886e-69a9e9be0901', N'0.0.0.1', N'', N'', N'', N'3', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'361F9607-9A8D-4E93-D62A-08DA7224EEFD', N'2022-07-30 20:13:38.2637856', N'2022-07-30 20:13:38.2637844', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'5', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5CA2F21D-CAEF-4B69-D62B-08DA7224EEFD', N'2022-07-30 20:13:40.3616160', N'2022-07-30 20:13:40.3616147', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'557', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'4D197A0B-8552-48AB-D62C-08DA7224EEFD', N'2022-07-30 20:13:52.7151889', N'2022-07-30 20:13:52.7151883', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'432', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'4FCA4D77-8F39-4A13-D62D-08DA7224EEFD', N'2022-07-30 20:13:55.4582227', N'2022-07-30 20:13:55.4582223', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/2', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'170', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0A1E3EAF-9E8C-4BF1-D62E-08DA7224EEFD', N'2022-07-30 20:13:57.8911933', N'2022-07-30 20:13:57.8911928', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'154', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'4A404D13-4AEA-4A43-D62F-08DA7224EEFD', N'2022-07-30 20:14:00.5708637', N'2022-07-30 20:14:00.5708632', NULL, NULL, N'/api/admin/LowCodeTable/synchronization', N'0.0.0.1', N'', N'', N'', N'1222', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'AF107168-D286-4396-D630-08DA7224EEFD', N'2022-07-30 20:14:00.7819908', N'2022-07-30 20:14:00.7819903', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'146', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'908310DE-578A-46DF-D631-08DA7224EEFD', N'2022-07-30 20:14:04.2645347', N'2022-07-30 20:14:04.2645340', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/2', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'156', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1449D321-170B-493D-D632-08DA7224EEFD', N'2022-07-30 20:14:06.1342126', N'2022-07-30 20:14:06.1342110', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/3', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'210', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'485C8854-4A44-4B7B-D633-08DA7224EEFD', N'2022-07-30 20:14:19.8749730', N'2022-07-30 20:14:19.8749721', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/3', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'163', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'563C14D6-C6D8-40B9-D634-08DA7224EEFD', N'2022-07-30 20:17:13.8409974', N'2022-07-30 20:17:13.8409967', NULL, NULL, N'/api/admin/LowCodeTable/synchronization', N'0.0.0.1', N'', N'', N'', N'1078', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1A3FEB46-75A3-4758-D635-08DA7224EEFD', N'2022-07-30 20:17:14.1334916', N'2022-07-30 20:17:14.1334909', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/3', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'196', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0F842C3F-BA29-40DA-B966-08DA72261B4C', N'2022-07-30 20:22:02.1059490', N'2022-07-30 20:22:02.1059475', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'5', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'34F2E340-848D-4048-B967-08DA72261B4C', N'2022-07-30 20:22:03.3038679', N'2022-07-30 20:22:03.3038668', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'455', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F26BCF5B-DF70-4017-B968-08DA72261B4C', N'2022-07-30 20:22:09.9187152', N'2022-07-30 20:22:09.9187145', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'442', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3EEEBC57-E81D-4005-B969-08DA72261B4C', N'2022-07-30 20:22:24.6668211', N'2022-07-30 20:22:24.6668201', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/2', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'207', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'BF9A5E50-D3D0-411D-B96A-08DA72261B4C', N'2022-07-30 20:22:27.0494572', N'2022-07-30 20:22:27.0494567', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/3', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'157', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7BFD3F5E-935A-4704-B96B-08DA72261B4C', N'2022-07-30 20:22:29.4934518', N'2022-07-30 20:22:29.4934512', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/2', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'151', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2182B3C2-EB87-4D34-B96C-08DA72261B4C', N'2022-07-30 20:22:37.1137127', N'2022-07-30 20:22:37.1137050', NULL, NULL, N'/api/admin/LowCodeTable/synchronization', N'0.0.0.1', N'', N'', N'', N'1009', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1D2F3BB9-F48E-46E6-B96D-08DA72261B4C', N'2022-07-30 20:22:37.3415585', N'2022-07-30 20:22:37.3415580', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/2', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'159', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B943D051-A0FE-4483-B96E-08DA72261B4C', N'2022-07-30 20:22:40.2405473', N'2022-07-30 20:22:40.2405466', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'190', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0FDD8B57-F289-4C1E-B96F-08DA72261B4C', N'2022-07-30 20:22:57.5863900', N'2022-07-30 20:22:57.5863895', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'200', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'222DBB1A-04B5-4265-B970-08DA72261B4C', N'2022-07-30 20:23:23.3845117', N'2022-07-30 20:23:23.3845112', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'166', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B727FFDE-83E1-40B9-B971-08DA72261B4C', N'2022-07-30 20:23:24.4292369', N'2022-07-30 20:23:24.4292362', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'202', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'379E372A-FE7F-4CEF-3279-08DA722667A8', N'2022-07-30 20:24:10.2262549', N'2022-07-30 20:24:10.2262535', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'5', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5F6C70D6-414D-4EC5-327A-08DA722667A8', N'2022-07-30 20:24:11.4872956', N'2022-07-30 20:24:11.4872946', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'476', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'BB3510C9-8C00-4CC8-327B-08DA722667A8', N'2022-07-30 20:24:15.6473471', N'2022-07-30 20:24:15.6473463', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'461', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0F5DBEAA-12A7-48D6-327C-08DA722667A8', N'2022-07-30 20:24:38.0300285', N'2022-07-30 20:24:38.0300280', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/2', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'240', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5449A4CA-3E97-4A5F-327D-08DA722667A8', N'2022-07-30 20:24:40.1485428', N'2022-07-30 20:24:40.1485423', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/3', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'160', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'47EF0A66-CCEF-4A45-327E-08DA722667A8', N'2022-07-30 20:24:49.3081709', N'2022-07-30 20:24:49.3081705', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'158', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'14243924-92FD-4463-327F-08DA722667A8', N'2022-07-30 20:25:07.4207010', N'2022-07-30 20:25:07.4207005', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/2', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'151', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'38EC81C4-D7DD-456C-3280-08DA722667A8', N'2022-07-30 20:25:08.5085425', N'2022-07-30 20:25:08.5085421', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/3', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'171', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D70F6551-15B1-41EC-3281-08DA722667A8', N'2022-07-30 20:25:09.8191612', N'2022-07-30 20:25:09.8191605', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'159', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7AD59FA0-4645-4810-3282-08DA722667A8', N'2022-07-30 20:25:15.3931064', N'2022-07-30 20:25:15.3931059', NULL, NULL, N'/api/admin/LowCodeTableInfo/findList/20/1', N'0.0.0.1', N'', N'{"columnName":null,"describe":null,"low_Code_TableId":"4cdafaad-c4f7-43d2-97be-7281d21d5466"}', N'', N'73', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeSearchController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'70264833-C292-4145-3283-08DA722667A8', N'2022-07-30 20:25:17.1399131', N'2022-07-30 20:25:17.1399124', NULL, NULL, N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"sys_file_library","type":"HZY.Models","codeText":""}', N'', N'437', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B39F8A42-3701-4B28-3284-08DA722667A8', N'2022-07-30 20:25:18.2667584', N'2022-07-30 20:25:18.2667579', NULL, NULL, N'/api/admin/LowCodeTable/findForm/4cdafaad-c4f7-43d2-97be-7281d21d5466', N'0.0.0.1', N'', N'', N'', N'45', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2DE6F06E-3957-42BF-3285-08DA722667A8', N'2022-07-30 20:25:57.7556342', N'2022-07-30 20:25:57.7556337', NULL, NULL, N'/api/admin/LowCodeTable/change', N'0.0.0.1', N'', N'[{"id":"4cdafaad-c4f7-43d2-97be-7281d21d5466","tableName":"sys_file_library","displayName":"文件库","entityName":"SysFileLibrary","remark":"用于记录系统上传的文件","lastModificationTime":"2022-07-30","creationTime":"2022-07-30","_X_ROW_KEY":"row_78"},{"id":"18fbb18e-cb29-45d8-a5f3-c0121c57680a","tableName":"flow_approval_step_history","displayName":"","entityName":"FlowApprovalStepHistory","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-07-29","_X_ROW_KEY":"row_79"},{"id":"7f94e0db-fc63-40dc-bfe3-18c5aad75975","tableName":"flow_approval_step_history_user","displayName":"","entityName":"FlowApprovalStepHistoryUser","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-07-29","_X_ROW_KEY":"row_80"},{"id":"a9e68076-84d2-449f-a7c2-134f09984dfb","tableName":"__EFMigrationsHistory","displayName":"","entityName":"Efmigrationshistory","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-07-29","_X_ROW_KEY":"row_81"},{"id":"852f53ff-0d00-4c32-aa55-a9c11993751b","tableName":"low_code_list","displayName":"低代码列表","entityName":"LowCodeList","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-05-23","_X_ROW_KEY":"row_82"},{"id":"6ba9805c-916e-4d2c-99d0-216fcbc361cc","tableName":"low_code_table","displayName":"低代码表","entityName":"LowCodeTable","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-05-23","_X_ROW_KEY":"row_83"},{"id":"79fbd4ec-9f4e-45dc-8065-70f2eb422cdf","tableName":"low_code_table_info","displayName":"低代码表信息","entityName":"LowCodeTableInfo","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-05-23","_X_ROW_KEY":"row_84"},{"id":"69edd8a8-1d24-478c-a909-b82039edcec0","tableName":"low_code_search","displayName":"低代码检索表","entityName":"LowCodeSearch","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-05-23","_X_ROW_KEY":"row_85"},{"id":"d8948c56-c5bd-4061-b272-5417375f38f0","tableName":"flow_approval","displayName":"审批流审批","entityName":"FlowApproval","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-04-17","_X_ROW_KEY":"row_86"},{"id":"ae6d94d8-6a15-4348-b600-aa17e4b61718","tableName":"flow_node","displayName":"工作流节点","entityName":"FlowNode","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-04-17","_X_ROW_KEY":"row_87"}]', N'', N'110', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0E4BE058-9C4A-4AAA-3286-08DA722667A8', N'2022-07-30 20:25:58.0146967', N'2022-07-30 20:25:58.0146962', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'182', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2FAAEF47-9445-4CB7-3287-08DA722667A8', N'2022-07-30 20:26:01.0728834', N'2022-07-30 20:26:01.0728827', NULL, NULL, N'/api/admin/LowCodeTableInfo/findList/20/1', N'0.0.0.1', N'', N'{"columnName":null,"describe":null,"low_Code_TableId":"4cdafaad-c4f7-43d2-97be-7281d21d5466"}', N'', N'82', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeSearchController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9CB77FC0-0E28-423D-3288-08DA722667A8', N'2022-07-30 20:26:15.9459406', N'2022-07-30 20:26:15.9459402', NULL, NULL, N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"sys_file_library","type":"HZY.Models","codeText":""}', N'', N'259', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F3186CB0-C667-4455-3289-08DA722667A8', N'2022-07-30 20:26:20.5673500', N'2022-07-30 20:26:20.5673496', NULL, NULL, N'/api/admin/LowCodeTable/findForm/4cdafaad-c4f7-43d2-97be-7281d21d5466', N'0.0.0.1', N'', N'', N'', N'31', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'292A3A9B-7134-4054-328A-08DA722667A8', N'2022-07-30 20:26:23.4382697', N'2022-07-30 20:26:23.4382687', NULL, NULL, N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"sys_file_library","type":"HZY.Models","codeText":""}', N'', N'260', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8706D8C1-E68F-43B6-328B-08DA722667A8', N'2022-07-30 20:26:24.1441599', N'2022-07-30 20:26:24.1441590', NULL, NULL, N'/api/admin/LowCodeTable/findForm/4cdafaad-c4f7-43d2-97be-7281d21d5466', N'0.0.0.1', N'', N'', N'', N'36', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'FC28D6D9-5BC4-4743-328C-08DA722667A8', N'2022-07-30 20:26:32.7583253', N'2022-07-30 20:26:32.7583247', NULL, NULL, N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"sys_file_library","type":"HZY.Models","codeText":""}', N'', N'276', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'EB28CD19-2B26-480F-328D-08DA722667A8', N'2022-07-30 20:26:40.1296084', N'2022-07-30 20:26:40.1296079', NULL, NULL, N'/api/admin/LowCodeTable/findForm/4cdafaad-c4f7-43d2-97be-7281d21d5466', N'0.0.0.1', N'', N'', N'', N'32', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'13D9B4B0-C13A-4194-328E-08DA722667A8', N'2022-07-30 20:29:48.1734373', N'2022-07-30 20:29:48.1734368', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'122', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5A8431D6-DAC6-4364-328F-08DA722667A8', N'2022-07-30 20:30:06.6406427', N'2022-07-30 20:30:06.6406419', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'182', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'60C323E4-5A8C-46B9-3290-08DA722667A8', N'2022-07-30 20:30:22.9586332', N'2022-07-30 20:30:22.9586327', NULL, NULL, N'/api/admin/LowCodeTableInfo/findList/20/1', N'0.0.0.1', N'', N'{"columnName":null,"describe":null,"low_Code_TableId":"4cdafaad-c4f7-43d2-97be-7281d21d5466"}', N'', N'252', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeSearchController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'681B9E24-DC8E-4ED5-3291-08DA722667A8', N'2022-07-30 20:30:22.9888827', N'2022-07-30 20:30:22.9888821', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'336', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A5D1576B-DF35-40FA-3292-08DA722667A8', N'2022-07-30 20:30:23.7309287', N'2022-07-30 20:30:23.7309281', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'166', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'BF7699E3-C6DB-4416-3293-08DA722667A8', N'2022-07-30 20:30:26.3314978', N'2022-07-30 20:30:26.3314970', NULL, NULL, N'/api/admin/LowCodeTable/synchronization', N'0.0.0.1', N'', N'', N'', N'1163', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D0FF28AB-D990-46F7-3294-08DA722667A8', N'2022-07-30 20:30:26.5773625', N'2022-07-30 20:30:26.5773619', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'174', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'ABE1BFF8-1250-4BEC-3295-08DA722667A8', N'2022-07-30 20:30:28.3785262', N'2022-07-30 20:30:28.3785241', NULL, NULL, N'/api/admin/LowCodeTableInfo/findList/20/1', N'0.0.0.1', N'', N'{"columnName":null,"describe":null,"low_Code_TableId":"4cdafaad-c4f7-43d2-97be-7281d21d5466"}', N'', N'47', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeSearchController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3C70D35C-9924-4545-3296-08DA722667A8', N'2022-07-30 20:30:28.4656954', N'2022-07-30 20:30:28.4656945', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'187', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'412C825D-2EAA-4E9A-3297-08DA722667A8', N'2022-07-30 20:30:29.9236785', N'2022-07-30 20:30:29.9236779', NULL, NULL, N'/api/admin/LowCodeTable/findForm/4cdafaad-c4f7-43d2-97be-7281d21d5466', N'0.0.0.1', N'', N'', N'', N'52', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E0AC59DB-882F-47E0-3298-08DA722667A8', N'2022-07-30 20:30:35.3119422', N'2022-07-30 20:30:35.3119417', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'157', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'04986B74-8DA5-4485-3299-08DA722667A8', N'2022-07-30 20:30:39.7310398', N'2022-07-30 20:30:39.7310386', NULL, NULL, N'/api/admin/LowCodeTable/change', N'0.0.0.1', N'', N'[{"id":"4cdafaad-c4f7-43d2-97be-7281d21d5466","tableName":"sys_file_library","displayName":"文件库","entityName":"SysFileLibrary","remark":"用于记录系统上传的文件","lastModificationTime":"2022-07-30","creationTime":"2022-07-30","_X_ROW_KEY":"row_119"},{"id":"18fbb18e-cb29-45d8-a5f3-c0121c57680a","tableName":"flow_approval_step_history","displayName":"","entityName":"FlowApprovalStepHistory","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-07-29","_X_ROW_KEY":"row_120"},{"id":"7f94e0db-fc63-40dc-bfe3-18c5aad75975","tableName":"flow_approval_step_history_user","displayName":"","entityName":"FlowApprovalStepHistoryUser","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-07-29","_X_ROW_KEY":"row_121"},{"id":"a9e68076-84d2-449f-a7c2-134f09984dfb","tableName":"__EFMigrationsHistory","displayName":"","entityName":"Efmigrationshistory","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-07-29","_X_ROW_KEY":"row_122"},{"id":"852f53ff-0d00-4c32-aa55-a9c11993751b","tableName":"low_code_list","displayName":"低代码列表","entityName":"LowCodeList","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-05-23","_X_ROW_KEY":"row_123"},{"id":"6ba9805c-916e-4d2c-99d0-216fcbc361cc","tableName":"low_code_table","displayName":"低代码表","entityName":"LowCodeTable","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-05-23","_X_ROW_KEY":"row_124"},{"id":"79fbd4ec-9f4e-45dc-8065-70f2eb422cdf","tableName":"low_code_table_info","displayName":"低代码表信息","entityName":"LowCodeTableInfo","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-05-23","_X_ROW_KEY":"row_125"},{"id":"69edd8a8-1d24-478c-a909-b82039edcec0","tableName":"low_code_search","displayName":"低代码检索表","entityName":"LowCodeSearch","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-05-23","_X_ROW_KEY":"row_126"},{"id":"d8948c56-c5bd-4061-b272-5417375f38f0","tableName":"flow_approval","displayName":"审批流审批","entityName":"FlowApproval","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-04-17","_X_ROW_KEY":"row_127"},{"id":"ae6d94d8-6a15-4348-b600-aa17e4b61718","tableName":"flow_node","displayName":"工作流节点","entityName":"FlowNode","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-04-17","_X_ROW_KEY":"row_128"}]', N'', N'60', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7C6F40C7-9F4F-4346-329A-08DA722667A8', N'2022-07-30 20:30:39.9833377', N'2022-07-30 20:30:39.9833372', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'179', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'38E2D836-1D7D-4284-329B-08DA722667A8', N'2022-07-30 20:30:42.1019570', N'2022-07-30 20:30:42.1019565', NULL, NULL, N'/api/admin/LowCodeTableInfo/findList/20/1', N'0.0.0.1', N'', N'{"columnName":null,"describe":null,"low_Code_TableId":"4cdafaad-c4f7-43d2-97be-7281d21d5466"}', N'', N'75', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeSearchController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'20B3BF33-CA16-4AC7-329C-08DA722667A8', N'2022-07-30 20:30:42.1908031', N'2022-07-30 20:30:42.1908018', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'211', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0CD6A3AF-423E-4477-329D-08DA722667A8', N'2022-07-30 20:30:43.5972669', N'2022-07-30 20:30:43.5972662', NULL, NULL, N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"sys_file_library","type":"HZY.Models","codeText":""}', N'', N'275', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'EB3141FD-AAFB-4ED4-329E-08DA722667A8', N'2022-07-30 20:30:44.3257477', N'2022-07-30 20:30:44.3257472', NULL, NULL, N'/api/admin/LowCodeTable/findForm/4cdafaad-c4f7-43d2-97be-7281d21d5466', N'0.0.0.1', N'', N'', N'', N'26', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'4D448ADB-BD8B-4268-329F-08DA722667A8', N'2022-07-30 20:30:54.6366236', N'2022-07-30 20:30:54.6366230', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'161', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'659FD6A1-E2B7-4B2D-7055-08DA722888E8', N'2022-07-30 20:39:24.9413791', N'2022-07-30 20:39:24.9413779', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'4', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'19008BB7-800A-48DA-7056-08DA722888E8', N'2022-07-30 20:39:26.1199305', N'2022-07-30 20:39:26.1199293', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'482', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'58CDD139-D63C-4270-7057-08DA722888E8', N'2022-07-30 20:39:57.0301777', N'2022-07-30 20:39:57.0301770', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'120', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1DABBFE9-C20E-4EEC-7058-08DA722888E8', N'2022-07-30 20:40:00.6205827', N'2022-07-30 20:40:00.6205821', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'472', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'259AEE30-9480-4D93-7059-08DA722888E8', N'2022-07-30 20:40:08.7378553', N'2022-07-30 20:40:08.7378548', NULL, NULL, N'/api/admin/LowCodeTable/synchronization', N'0.0.0.1', N'', N'', N'', N'970', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'31EE7B43-216E-4F7E-705A-08DA722888E8', N'2022-07-30 20:40:08.9770678', N'2022-07-30 20:40:08.9770672', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'154', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'983F9359-CA80-46CE-705B-08DA722888E8', N'2022-07-30 20:40:10.5610642', N'2022-07-30 20:40:10.5610637', NULL, NULL, N'/api/admin/LowCodeTableInfo/findList/20/1', N'0.0.0.1', N'', N'{"columnName":null,"describe":null,"low_Code_TableId":"4cdafaad-c4f7-43d2-97be-7281d21d5466"}', N'', N'73', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeSearchController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'91D5DEE3-42BA-449F-705C-08DA722888E8', N'2022-07-30 20:40:12.3768428', N'2022-07-30 20:40:12.3768419', NULL, NULL, N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"sys_file_library","type":"HZY.Models","codeText":""}', N'', N'317', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E0F91E62-CC4B-4CD8-705D-08DA722888E8', N'2022-07-30 20:40:13.0686461', N'2022-07-30 20:40:13.0686457', NULL, NULL, N'/api/admin/LowCodeTable/findForm/4cdafaad-c4f7-43d2-97be-7281d21d5466', N'0.0.0.1', N'', N'', N'', N'41', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C5F69218-311C-4D07-705E-08DA722888E8', N'2022-07-30 20:40:15.9521003', N'2022-07-30 20:40:15.9520998', NULL, NULL, N'/api/admin/LowCodeTable/change', N'0.0.0.1', N'', N'[{"id":"4cdafaad-c4f7-43d2-97be-7281d21d5466","tableName":"sys_file_library","displayName":"文件库","entityName":"SysFileLibrary","remark":"用于记录系统上传的文件","lastModificationTime":"2022-07-30","creationTime":"2022-07-30","_X_ROW_KEY":"row_32"},{"id":"7f94e0db-fc63-40dc-bfe3-18c5aad75975","tableName":"flow_approval_step_history_user","displayName":"","entityName":"FlowApprovalStepHistoryUser","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-07-29","_X_ROW_KEY":"row_33"},{"id":"18fbb18e-cb29-45d8-a5f3-c0121c57680a","tableName":"flow_approval_step_history","displayName":"","entityName":"FlowApprovalStepHistory","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-07-29","_X_ROW_KEY":"row_34"},{"id":"a9e68076-84d2-449f-a7c2-134f09984dfb","tableName":"__EFMigrationsHistory","displayName":"","entityName":"Efmigrationshistory","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-07-29","_X_ROW_KEY":"row_35"},{"id":"79fbd4ec-9f4e-45dc-8065-70f2eb422cdf","tableName":"low_code_table_info","displayName":"低代码表信息","entityName":"LowCodeTableInfo","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-05-23","_X_ROW_KEY":"row_36"},{"id":"6ba9805c-916e-4d2c-99d0-216fcbc361cc","tableName":"low_code_table","displayName":"低代码表","entityName":"LowCodeTable","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-05-23","_X_ROW_KEY":"row_37"},{"id":"69edd8a8-1d24-478c-a909-b82039edcec0","tableName":"low_code_search","displayName":"低代码检索表","entityName":"LowCodeSearch","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-05-23","_X_ROW_KEY":"row_38"},{"id":"852f53ff-0d00-4c32-aa55-a9c11993751b","tableName":"low_code_list","displayName":"低代码列表","entityName":"LowCodeList","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-05-23","_X_ROW_KEY":"row_39"},{"id":"3da5d264-2e8d-460c-a10c-ff9a6bb57a60","tableName":"sys_user_role","displayName":"用户与角色","entityName":"SysUserRole","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-04-17","_X_ROW_KEY":"row_40"},{"id":"69b24f04-0ed3-45fc-91d9-0dc929175a57","tableName":"sys_user_post","displayName":"用户与岗位","entityName":"SysUserPost","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-04-17","_X_ROW_KEY":"row_41"}]', N'', N'84', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E2A8975B-AF64-4A07-705F-08DA722888E8', N'2022-07-30 20:40:16.1791395', N'2022-07-30 20:40:16.1791390', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'157', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'54F57160-2CB3-4047-7060-08DA722888E8', N'2022-07-30 20:40:17.5633261', N'2022-07-30 20:40:17.5633255', NULL, NULL, N'/api/admin/LowCodeTableInfo/findList/20/1', N'0.0.0.1', N'', N'{"columnName":null,"describe":null,"low_Code_TableId":"4cdafaad-c4f7-43d2-97be-7281d21d5466"}', N'', N'49', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeSearchController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1EB6345C-D22C-4EB1-7061-08DA722888E8', N'2022-07-30 20:40:18.9551524', N'2022-07-30 20:40:18.9551518', NULL, NULL, N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"sys_file_library","type":"HZY.Models","codeText":""}', N'', N'245', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'21E806E4-8679-4BB3-7062-08DA722888E8', N'2022-07-30 20:40:19.6632198', N'2022-07-30 20:40:19.6632189', NULL, NULL, N'/api/admin/LowCodeTable/findForm/4cdafaad-c4f7-43d2-97be-7281d21d5466', N'0.0.0.1', N'', N'', N'', N'25', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F60689C5-8C53-421C-7063-08DA722888E8', N'2022-07-30 20:40:58.1353424', N'2022-07-30 20:40:58.1353418', NULL, NULL, N'/api/admin/LowCodeTableInfo/findList/20/1', N'0.0.0.1', N'', N'{"columnName":null,"describe":null,"low_Code_TableId":"4cdafaad-c4f7-43d2-97be-7281d21d5466"}', N'', N'50', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeSearchController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3E1F5A9E-FF73-42D0-7064-08DA722888E8', N'2022-07-30 20:40:59.9560685', N'2022-07-30 20:40:59.9560680', NULL, NULL, N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"sys_file_library","type":"HZY.Models","codeText":""}', N'', N'260', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F5656F6D-7A6B-4656-7065-08DA722888E8', N'2022-07-30 20:41:11.3140775', N'2022-07-30 20:41:11.3140767', NULL, NULL, N'/api/admin/LowCodeTable/findForm/4cdafaad-c4f7-43d2-97be-7281d21d5466', N'0.0.0.1', N'', N'', N'', N'26', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5DEFA4B1-C1D6-424C-7066-08DA722888E8', N'2022-07-30 20:42:03.9378897', N'2022-07-30 20:42:03.9378890', NULL, NULL, N'/api/admin/LowCodeTable/synchronization', N'0.0.0.1', N'', N'', N'', N'912', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1C4E89BE-050D-402B-7067-08DA722888E8', N'2022-07-30 20:42:04.2811199', N'2022-07-30 20:42:04.2811191', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'211', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3181F20F-265D-4FF6-7068-08DA722888E8', N'2022-07-30 20:42:15.4823752', N'2022-07-30 20:42:15.4823744', NULL, NULL, N'/api/admin/LowCodeTable/deleteList', N'0.0.0.1', N'', N'["4cdafaad-c4f7-43d2-97be-7281d21d5466"]', N'', N'102', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E7045FD3-56A5-4C6F-7069-08DA722888E8', N'2022-07-30 20:42:15.8235505', N'2022-07-30 20:42:15.8235496', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'207', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'85097E38-C592-49AB-706A-08DA722888E8', N'2022-07-30 20:42:27.9990258', N'2022-07-30 20:42:27.9990252', NULL, NULL, N'/api/admin/LowCodeTable/change', N'0.0.0.1', N'', N'[{"id":"8480181e-6ff6-4d1d-ab57-f48f29a5a4cd","tableName":"file_library","displayName":"文件库","entityName":"FileLibrary","remark":"用于记录系统上传的文件","lastModificationTime":"2022-07-30","creationTime":"2022-07-30","_X_ROW_KEY":"row_120"},{"id":"18fbb18e-cb29-45d8-a5f3-c0121c57680a","tableName":"flow_approval_step_history","displayName":"","entityName":"FlowApprovalStepHistory","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-07-29","_X_ROW_KEY":"row_121"},{"id":"7f94e0db-fc63-40dc-bfe3-18c5aad75975","tableName":"flow_approval_step_history_user","displayName":"","entityName":"FlowApprovalStepHistoryUser","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-07-29","_X_ROW_KEY":"row_122"},{"id":"a9e68076-84d2-449f-a7c2-134f09984dfb","tableName":"__EFMigrationsHistory","displayName":"","entityName":"Efmigrationshistory","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-07-29","_X_ROW_KEY":"row_123"},{"id":"79fbd4ec-9f4e-45dc-8065-70f2eb422cdf","tableName":"low_code_table_info","displayName":"低代码表信息","entityName":"LowCodeTableInfo","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-05-23","_X_ROW_KEY":"row_124"},{"id":"6ba9805c-916e-4d2c-99d0-216fcbc361cc","tableName":"low_code_table","displayName":"低代码表","entityName":"LowCodeTable","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-05-23","_X_ROW_KEY":"row_125"},{"id":"69edd8a8-1d24-478c-a909-b82039edcec0","tableName":"low_code_search","displayName":"低代码检索表","entityName":"LowCodeSearch","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-05-23","_X_ROW_KEY":"row_126"},{"id":"852f53ff-0d00-4c32-aa55-a9c11993751b","tableName":"low_code_list","displayName":"低代码列表","entityName":"LowCodeList","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-05-23","_X_ROW_KEY":"row_127"},{"id":"69b24f04-0ed3-45fc-91d9-0dc929175a57","tableName":"sys_user_post","displayName":"用户与岗位","entityName":"SysUserPost","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-04-17","_X_ROW_KEY":"row_128"},{"id":"3da5d264-2e8d-460c-a10c-ff9a6bb57a60","tableName":"sys_user_role","displayName":"用户与角色","entityName":"SysUserRole","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-04-17","_X_ROW_KEY":"row_129"}]', N'', N'63', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'093B5AF4-2BE6-427D-706B-08DA722888E8', N'2022-07-30 20:42:28.2350963', N'2022-07-30 20:42:28.2350958', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'169', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D3F40222-499F-4BAB-706C-08DA722888E8', N'2022-07-30 20:42:30.9061870', N'2022-07-30 20:42:30.9061865', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/2', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'164', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E4816152-1ED0-495D-706D-08DA722888E8', N'2022-07-30 20:42:31.6165168', N'2022-07-30 20:42:31.6165162', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/3', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'155', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B7D219F1-EFD4-4738-706E-08DA722888E8', N'2022-07-30 20:42:34.5739380', N'2022-07-30 20:42:34.5739374', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'144', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A63F1F12-02AA-45E9-706F-08DA722888E8', N'2022-07-30 20:42:38.0098651', N'2022-07-30 20:42:38.0098643', NULL, NULL, N'/api/admin/LowCodeTableInfo/findList/20/1', N'0.0.0.1', N'', N'{"columnName":null,"describe":null,"low_Code_TableId":"8480181e-6ff6-4d1d-ab57-f48f29a5a4cd"}', N'', N'347', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeSearchController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'6FAEF095-DEBE-47E4-7070-08DA722888E8', N'2022-07-30 20:42:38.1660191', N'2022-07-30 20:42:38.1660184', NULL, NULL, N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"file_library","type":"HZY.Models","codeText":""}', N'', N'486', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'FC017150-D52D-41C0-7071-08DA722888E8', N'2022-07-30 20:42:40.0999879', N'2022-07-30 20:42:40.0999872', NULL, NULL, N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"file_library","type":"HZY.Models","codeText":""}', N'', N'252', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'DC912D3E-C250-464C-7072-08DA722888E8', N'2022-07-30 20:42:40.8876770', N'2022-07-30 20:42:40.8876764', NULL, NULL, N'/api/admin/LowCodeTable/findForm/8480181e-6ff6-4d1d-ab57-f48f29a5a4cd', N'0.0.0.1', N'', N'', N'', N'30', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'DEE8E751-91AF-4436-7073-08DA722888E8', N'2022-07-30 20:42:45.0451888', N'2022-07-30 20:42:45.0451878', NULL, NULL, N'/api/admin/CodeGeneration/AutoImprotProject', N'0.0.0.1', N'', N'{"tableName":"file_library"}', N'', N'2320', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'生成代码并自动导入项目')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5AA6647C-BD61-41F9-7074-08DA722888E8', N'2022-07-30 20:42:46.0185831', N'2022-07-30 20:42:46.0185823', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'34', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8F9C169B-2115-4795-7075-08DA722888E8', N'2022-07-30 20:42:47.3320759', N'2022-07-30 20:42:47.3320748', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'285', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1D68D77C-17B5-4941-7076-08DA722888E8', N'2022-07-30 20:43:09.7383624', N'2022-07-30 20:43:09.7383618', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'42', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0F7FF8DF-1637-4525-7077-08DA722888E8', N'2022-07-30 20:43:10.5932557', N'2022-07-30 20:43:10.5932552', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'151', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1A5BE0C6-2D17-4610-7078-08DA722888E8', N'2022-07-30 20:44:14.8502304', N'2022-07-30 20:44:14.8502297', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'43', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7E8D32A2-DE86-4F53-7079-08DA722888E8', N'2022-07-30 20:44:15.3810367', N'2022-07-30 20:44:15.3810362', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'173', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'63AAA10B-CE95-406B-707A-08DA722888E8', N'2022-07-30 20:44:17.0066438', N'2022-07-30 20:44:17.0066432', NULL, NULL, N'/api/admin/LowCodeTableInfo/findList/20/1', N'0.0.0.1', N'', N'{"columnName":null,"describe":null,"low_Code_TableId":"8480181e-6ff6-4d1d-ab57-f48f29a5a4cd"}', N'', N'76', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeSearchController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A2719924-35D0-4898-707B-08DA722888E8', N'2022-07-30 20:44:19.5490540', N'2022-07-30 20:44:19.5490534', NULL, NULL, N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"file_library","type":"HZY.Models","codeText":""}', N'', N'236', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'51FA640A-6814-4DF5-707C-08DA722888E8', N'2022-07-30 20:44:20.0972697', N'2022-07-30 20:44:20.0972690', NULL, NULL, N'/api/admin/LowCodeTable/findForm/8480181e-6ff6-4d1d-ab57-f48f29a5a4cd', N'0.0.0.1', N'', N'', N'', N'39', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5BE4A291-4B68-4232-707D-08DA722888E8', N'2022-07-30 20:44:27.7864665', N'2022-07-30 20:44:27.7864659', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'40', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3C042EA6-3B40-4F89-707E-08DA722888E8', N'2022-07-30 20:44:28.5349474', N'2022-07-30 20:44:28.5349469', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'191', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E985D05D-712F-40DB-707F-08DA722888E8', N'2022-07-30 20:44:31.2776100', N'2022-07-30 20:44:31.2776093', NULL, NULL, N'/api/admin/LowCodeTableInfo/findList/20/1', N'0.0.0.1', N'', N'{"columnName":null,"describe":null,"low_Code_TableId":"8480181e-6ff6-4d1d-ab57-f48f29a5a4cd"}', N'', N'82', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeSearchController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'926D84FD-7A70-4C71-7080-08DA722888E8', N'2022-07-30 20:44:31.3056593', N'2022-07-30 20:44:31.3056587', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'246', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'70A99535-AAF2-468B-7081-08DA722888E8', N'2022-07-30 20:44:32.9182529', N'2022-07-30 20:44:32.9182521', NULL, NULL, N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"file_library","type":"HZY.Models","codeText":""}', N'', N'238', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2C832547-2076-4381-7082-08DA722888E8', N'2022-07-30 20:44:35.0332110', N'2022-07-30 20:44:35.0332102', NULL, NULL, N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"file_library","type":"HZY.Models","codeText":""}', N'', N'231', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'6A84FF58-4E26-402F-7083-08DA722888E8', N'2022-07-30 20:44:38.2269345', N'2022-07-30 20:44:38.2269337', NULL, NULL, N'/api/admin/LowCodeTable/findForm/8480181e-6ff6-4d1d-ab57-f48f29a5a4cd', N'0.0.0.1', N'', N'', N'', N'26', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2B50F19C-1354-4E90-7084-08DA722888E8', N'2022-07-30 20:45:03.7702011', N'2022-07-30 20:45:03.7702005', NULL, NULL, N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"file_library","type":"HZY.Models","codeText":""}', N'', N'247', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E7AEDA98-9C65-42E0-7085-08DA722888E8', N'2022-07-30 20:45:05.6953705', N'2022-07-30 20:45:05.6953699', NULL, NULL, N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"file_library","type":"HZY.Models","codeText":""}', N'', N'263', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'46878732-47A4-4E03-7086-08DA722888E8', N'2022-07-30 20:45:05.9354230', N'2022-07-30 20:45:05.9354224', NULL, NULL, N'/api/admin/LowCodeTable/findForm/8480181e-6ff6-4d1d-ab57-f48f29a5a4cd', N'0.0.0.1', N'', N'', N'', N'28', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'965D2B33-5DB7-4BEC-7087-08DA722888E8', N'2022-07-30 20:45:07.9388271', N'2022-07-30 20:45:07.9388265', NULL, NULL, N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"file_library","type":"HZY.Models","codeText":""}', N'', N'239', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E0885556-04CD-4224-7088-08DA722888E8', N'2022-07-30 20:45:08.2540549', N'2022-07-30 20:45:08.2540542', NULL, NULL, N'/api/admin/LowCodeTable/findForm/8480181e-6ff6-4d1d-ab57-f48f29a5a4cd', N'0.0.0.1', N'', N'', N'', N'26', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D1DCAE47-79DC-4E95-7089-08DA722888E8', N'2022-07-30 20:45:11.8185062', N'2022-07-30 20:45:11.8185057', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'176', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0915E02F-45B6-4406-2596-08DA7229A1A5', N'2022-07-30 20:47:16.0218918', N'2022-07-30 20:47:16.0218906', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'7', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'6BEACAE5-CA20-49DC-2597-08DA7229A1A5', N'2022-07-30 20:47:16.6718920', N'2022-07-30 20:47:16.6718912', NULL, NULL, N'/api/account/check', N'0.0.0.1', N'', N'{"userName":"admin","userPassword":"123456"}', N'', N'1336', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2F261DF4-548B-41EF-2598-08DA7229A1A5', N'2022-07-30 20:47:17.2963133', N'2022-07-30 20:47:17.2963121', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'346', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'4F465908-E513-4454-2599-08DA7229A1A5', N'2022-07-30 20:47:23.4018401', N'2022-07-30 20:47:23.4018396', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'391', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'6ED7160C-B38B-4C74-259A-08DA7229A1A5', N'2022-07-30 20:47:26.6966472', N'2022-07-30 20:47:26.6966465', NULL, NULL, N'/api/admin/LowCodeTableInfo/findList/20/1', N'0.0.0.1', N'', N'{"columnName":null,"describe":null,"low_Code_TableId":"8480181e-6ff6-4d1d-ab57-f48f29a5a4cd"}', N'', N'99', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeSearchController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'46743D43-7FA6-43D9-259B-08DA7229A1A5', N'2022-07-30 20:47:26.7218299', N'2022-07-30 20:47:26.7218291', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'221', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B4A3F3E5-0DBC-46E3-259C-08DA7229A1A5', N'2022-07-30 20:47:28.4458678', N'2022-07-30 20:47:28.4458673', NULL, NULL, N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"file_library","type":"HZY.Models","codeText":""}', N'', N'283', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'821AA227-B72D-4CE1-259D-08DA7229A1A5', N'2022-07-30 20:47:29.1031390', N'2022-07-30 20:47:29.1031385', NULL, NULL, N'/api/admin/LowCodeTable/findForm/8480181e-6ff6-4d1d-ab57-f48f29a5a4cd', N'0.0.0.1', N'', N'', N'', N'43', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F4EAB8E7-CB7A-4DC9-259E-08DA7229A1A5', N'2022-07-30 20:47:34.6622992', N'2022-07-30 20:47:34.6622980', NULL, NULL, N'/api/admin/CodeGeneration/AutoImprotProject', N'0.0.0.1', N'', N'{"tableName":"file_library"}', N'', N'2131', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'生成代码并自动导入项目')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'909D3F34-A0A5-45FA-259F-08DA7229A1A5', N'2022-07-30 20:47:35.9685713', N'2022-07-30 20:47:35.9685706', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'74', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C83FA041-3A75-4E68-25A0-08DA7229A1A5', N'2022-07-30 20:47:40.0272394', N'2022-07-30 20:47:40.0272388', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'28', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'4CF55F9F-A796-4CF9-25A1-08DA7229A1A5', N'2022-07-30 20:47:45.5806512', N'2022-07-30 20:47:45.5806506', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'30', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'CDBA0E17-95F0-4E62-25A2-08DA7229A1A5', N'2022-07-30 20:51:31.7381302', N'2022-07-30 20:51:31.7381296', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'73', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E5758363-080A-43AE-25A3-08DA7229A1A5', N'2022-07-30 20:51:34.6335654', N'2022-07-30 20:51:34.6335650', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'151', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E82FEAD6-1A0E-4DE9-25A4-08DA7229A1A5', N'2022-07-30 20:51:36.7144206', N'2022-07-30 20:51:36.7144201', NULL, NULL, N'/api/admin/LowCodeTableInfo/findList/20/1', N'0.0.0.1', N'', N'{"columnName":null,"describe":null,"low_Code_TableId":"8480181e-6ff6-4d1d-ab57-f48f29a5a4cd"}', N'', N'75', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeSearchController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1CEBD028-2538-4BB8-25A5-08DA7229A1A5', N'2022-07-30 20:51:36.7591880', N'2022-07-30 20:51:36.7591871', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'216', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'84809714-9343-44FD-25A6-08DA7229A1A5', N'2022-07-30 20:51:37.7708009', N'2022-07-30 20:51:37.7708002', NULL, NULL, N'/api/admin/LowCodeTable/findForm/8480181e-6ff6-4d1d-ab57-f48f29a5a4cd', N'0.0.0.1', N'', N'', N'', N'35', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'03FFB58F-6977-4E88-7274-08DA722B4195', N'2022-07-30 20:58:53.8377150', N'2022-07-30 20:58:53.8377136', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'6', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'83839AE2-5C50-4F82-7275-08DA722B4195', N'2022-07-30 20:59:04.2453236', N'2022-07-30 20:59:04.2453226', NULL, NULL, N'/api/account/check', N'0.0.0.1', N'', N'{"userName":"admin","userPassword":"123456"}', N'', N'972', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'27139D2D-BAAB-4D79-7276-08DA722B4195', N'2022-07-30 20:59:05.0024746', N'2022-07-30 20:59:05.0024738', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'393', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2AE34F4C-3689-4CE0-7277-08DA722B4195', N'2022-07-30 20:59:08.8398352', N'2022-07-30 20:59:08.8398347', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'381', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'BF9A3FD9-B565-430A-7278-08DA722B4195', N'2022-07-30 20:59:11.3535813', N'2022-07-30 20:59:11.3535807', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'538', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C71EA633-0BD0-4A59-7279-08DA722B4195', N'2022-07-30 20:59:11.3560980', N'2022-07-30 20:59:11.3560975', NULL, NULL, N'/api/admin/LowCodeTableInfo/findList/20/1', N'0.0.0.1', N'', N'{"columnName":null,"describe":null,"low_Code_TableId":"8480181e-6ff6-4d1d-ab57-f48f29a5a4cd"}', N'', N'391', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeSearchController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9B6C5A6F-9B2C-4058-727A-08DA722B4195', N'2022-07-30 20:59:12.6413062', N'2022-07-30 20:59:12.6413057', NULL, NULL, N'/api/admin/LowCodeTable/findForm/8480181e-6ff6-4d1d-ab57-f48f29a5a4cd', N'0.0.0.1', N'', N'', N'', N'47', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'15B672A3-74EC-4F24-727B-08DA722B4195', N'2022-07-30 20:59:23.7014178', N'2022-07-30 20:59:23.7014164', NULL, NULL, N'/api/admin/CodeGeneration/AutoImprotProject', N'0.0.0.1', N'', N'{"tableName":"file_library"}', N'', N'2303', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'生成代码并自动导入项目')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'92C4B871-9B7E-464A-727C-08DA722B4195', N'2022-07-30 20:59:24.7078871', N'2022-07-30 20:59:24.7078864', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'74', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C1261678-AFCB-454B-727D-08DA722B4195', N'2022-07-30 20:59:25.8685930', N'2022-07-30 20:59:25.8685924', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'303', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3DB8895C-EED6-476A-727E-08DA722B4195', N'2022-07-30 20:59:53.9599843', N'2022-07-30 20:59:53.9599833', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'48', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F7574673-33C0-42A3-727F-08DA722B4195', N'2022-07-30 20:59:54.6961662', N'2022-07-30 20:59:54.6961656', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'178', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'05013666-2D92-4E7D-7280-08DA722B4195', N'2022-07-30 20:59:56.3212279', N'2022-07-30 20:59:56.3212274', NULL, NULL, N'/api/admin/LowCodeTableInfo/findList/20/1', N'0.0.0.1', N'', N'{"columnName":null,"describe":null,"low_Code_TableId":"8480181e-6ff6-4d1d-ab57-f48f29a5a4cd"}', N'', N'98', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeSearchController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1DE55651-6199-4E7B-7281-08DA722B4195', N'2022-07-30 20:59:56.3821505', N'2022-07-30 20:59:56.3821499', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'276', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2B237190-9A9D-47E7-7282-08DA722B4195', N'2022-07-30 20:59:58.5782656', N'2022-07-30 20:59:58.5782650', NULL, NULL, N'/api/admin/LowCodeTable/findForm/8480181e-6ff6-4d1d-ab57-f48f29a5a4cd', N'0.0.0.1', N'', N'', N'', N'32', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'CBA010F7-84B5-4E7D-7283-08DA722B4195', N'2022-07-30 21:00:01.9846822', N'2022-07-30 21:00:01.9846810', NULL, NULL, N'/api/admin/CodeGeneration/AutoImprotProject', N'0.0.0.1', N'', N'{"tableName":"file_library"}', N'', N'2177', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'生成代码并自动导入项目')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2391BEC1-3FFA-4A2B-7284-08DA722B4195', N'2022-07-30 21:00:03.2236341', N'2022-07-30 21:00:03.2236333', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'29', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'4CE3DB8C-A89B-4CB4-7285-08DA722B4195', N'2022-07-30 21:00:04.5540344', N'2022-07-30 21:00:04.5540338', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'203', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'EB417728-3EE8-48DF-7286-08DA722B4195', N'2022-07-30 21:00:40.3754444', N'2022-07-30 21:00:40.3754435', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'105', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'772CAE3D-60C9-4641-7287-08DA722B4195', N'2022-07-30 21:00:41.9080125', N'2022-07-30 21:00:41.9080116', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'289', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'21ABC84B-067E-4152-E32A-08DA722BF22C', N'2022-07-30 21:03:49.9774481', N'2022-07-30 21:03:49.9774465', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'5', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'12D14218-9749-48A1-E32B-08DA722BF22C', N'2022-07-30 21:04:04.7737935', N'2022-07-30 21:04:04.7737925', NULL, NULL, N'/api/account/check', N'0.0.0.1', N'', N'{"userName":"admin","userPassword":"123456"}', N'', N'990', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'48FFAA6C-0E8D-4E43-E32C-08DA722BF22C', N'2022-07-30 21:04:05.4679327', N'2022-07-30 21:04:05.4679318', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'370', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'388ED421-BEE7-4946-E32D-08DA722BF22C', N'2022-07-30 21:04:10.7926334', N'2022-07-30 21:04:10.7926328', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'394', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'FA2DD815-C74E-4235-E32E-08DA722BF22C', N'2022-07-30 21:04:12.9223434', N'2022-07-30 21:04:12.9223429', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'437', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1FCFBBCD-8E9A-4AD6-E32F-08DA722BF22C', N'2022-07-30 21:04:12.9644885', N'2022-07-30 21:04:12.9644878', NULL, NULL, N'/api/admin/LowCodeTableInfo/findList/20/1', N'0.0.0.1', N'', N'{"columnName":null,"describe":null,"low_Code_TableId":"8480181e-6ff6-4d1d-ab57-f48f29a5a4cd"}', N'', N'372', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeSearchController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B97B1CAF-2A85-4884-E330-08DA722BF22C', N'2022-07-30 21:04:14.5140489', N'2022-07-30 21:04:14.5140484', NULL, NULL, N'/api/admin/LowCodeTable/findForm/8480181e-6ff6-4d1d-ab57-f48f29a5a4cd', N'0.0.0.1', N'', N'', N'', N'42', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'59252DB8-A024-452E-E331-08DA722BF22C', N'2022-07-30 21:04:18.6587400', N'2022-07-30 21:04:18.6587382', NULL, NULL, N'/api/admin/CodeGeneration/AutoImprotProject', N'0.0.0.1', N'', N'{"tableName":"file_library"}', N'', N'2641', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'生成代码并自动导入项目')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'BFC58B28-C528-41EE-E332-08DA722BF22C', N'2022-07-30 21:04:19.6955623', N'2022-07-30 21:04:19.6955613', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'89', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'82624ED7-CF8D-4E41-E333-08DA722BF22C', N'2022-07-30 21:04:21.2824804', N'2022-07-30 21:04:21.2824788', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'350', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7EFCBC26-ACA8-42B5-88DF-08DA722C9AE7', N'2022-07-30 21:08:33.0625851', N'2022-07-30 21:08:33.0625839', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'5', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'EBECDD9D-6098-4E7A-88E0-08DA722C9AE7', N'2022-07-30 21:08:35.5968703', N'2022-07-30 21:08:35.5968691', NULL, NULL, N'/api/account/check', N'0.0.0.1', N'', N'{"userName":"admin","userPassword":"123456"}', N'', N'831', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0B0831BF-8C5E-4058-88E1-08DA722C9AE7', N'2022-07-30 21:08:36.1858671', N'2022-07-30 21:08:36.1858661', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'339', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3EB3975B-6E13-481B-88E2-08DA722C9AE7', N'2022-07-30 21:08:43.2242247', N'2022-07-30 21:08:43.2242241', NULL, NULL, N'/api/account/check', N'0.0.0.1', N'', N'{"userName":"admin","userPassword":"123456"}', N'', N'38', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'781DF0CF-8E87-4154-88E3-08DA722C9AE7', N'2022-07-30 21:08:43.4215257', N'2022-07-30 21:08:43.4215252', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'114', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9E935B96-1F0E-4536-88E4-08DA722C9AE7', N'2022-07-30 21:08:48.0341212', N'2022-07-30 21:08:48.0341205', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'26', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3A6BF225-B2A6-4AE7-88E5-08DA722C9AE7', N'2022-07-30 21:08:48.8532247', N'2022-07-30 21:08:48.8532240', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'402', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1541E5D3-D440-4E9A-88E6-08DA722C9AE7', N'2022-07-30 21:08:51.0680899', N'2022-07-30 21:08:51.0680892', NULL, NULL, N'/api/admin/LowCodeTableInfo/findList/20/1', N'0.0.0.1', N'', N'{"columnName":null,"describe":null,"low_Code_TableId":"8480181e-6ff6-4d1d-ab57-f48f29a5a4cd"}', N'', N'360', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeSearchController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'4E37350F-84CE-4E2A-88E7-08DA722C9AE7', N'2022-07-30 21:08:51.0741424', N'2022-07-30 21:08:51.0741416', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'478', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A0860BB8-4EA8-45B9-88E8-08DA722C9AE7', N'2022-07-30 21:08:52.1471571', N'2022-07-30 21:08:52.1471566', NULL, NULL, N'/api/admin/LowCodeTable/findForm/8480181e-6ff6-4d1d-ab57-f48f29a5a4cd', N'0.0.0.1', N'', N'', N'', N'55', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'FF870F03-ACA3-43B4-88E9-08DA722C9AE7', N'2022-07-30 21:08:55.6664687', N'2022-07-30 21:08:55.6664675', NULL, NULL, N'/api/admin/CodeGeneration/AutoImprotProject', N'0.0.0.1', N'', N'{"tableName":"file_library"}', N'', N'2110', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'生成代码并自动导入项目')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'6812E6D6-1F82-491A-88EA-08DA722C9AE7', N'2022-07-30 21:08:56.6565904', N'2022-07-30 21:08:56.6565896', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'57', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'FDFBA3B1-022C-4646-88EB-08DA722C9AE7', N'2022-07-30 21:08:57.7808170', N'2022-07-30 21:08:57.7808164', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'214', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'377D9367-7507-4D73-9CD6-08DA722DE9E8', N'2022-07-30 21:17:55.1110509', N'2022-07-30 21:17:55.1110492', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'5', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'725F4B96-6B1B-4011-9CD7-08DA722DE9E8', N'2022-07-30 21:19:10.8881820', N'2022-07-30 21:19:10.8881811', NULL, NULL, N'/api/account/check', N'0.0.0.1', N'', N'{"userName":"admin","userPassword":"123456"}', N'', N'947', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'438395E1-C0C9-43FA-9CD8-08DA722DE9E8', N'2022-07-30 21:19:11.6085573', N'2022-07-30 21:19:11.6085563', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'337', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'DD8AE96B-6D47-4DF6-9CD9-08DA722DE9E8', N'2022-07-30 21:19:15.8334326', N'2022-07-30 21:19:15.8334321', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'475', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'532AFAD3-B06D-48F3-9CDA-08DA722DE9E8', N'2022-07-30 21:19:19.7152512', N'2022-07-30 21:19:19.7152507', NULL, NULL, N'/api/admin/LowCodeTable/deleteList', N'0.0.0.1', N'', N'["8480181e-6ff6-4d1d-ab57-f48f29a5a4cd"]', N'', N'99', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'23AEAF41-FB28-4177-9CDB-08DA722DE9E8', N'2022-07-30 21:19:20.0659441', N'2022-07-30 21:19:20.0659436', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'267', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3428F9E2-7CAB-4770-EF05-08DA722F2D1E', N'2022-07-30 21:26:57.4265347', N'2022-07-30 21:26:57.4265335', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'7', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5F41A10E-C8B2-475F-EF06-08DA722F2D1E', N'2022-07-30 21:26:58.9643327', N'2022-07-30 21:26:58.9643306', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'538', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2C8C8978-49FE-4ED8-EF07-08DA722F2D1E', N'2022-07-30 21:27:07.1601012', N'2022-07-30 21:27:07.1600998', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'137', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'297980AA-C5F7-445B-EF08-08DA722F2D1E', N'2022-07-30 21:27:08.1308053', N'2022-07-30 21:27:08.1308046', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'433', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'34B5A8C4-8118-4DF8-EF09-08DA722F2D1E', N'2022-07-30 21:27:18.3127116', N'2022-07-30 21:27:18.3127110', NULL, NULL, N'/api/admin/LowCodeTableInfo/findList/20/1', N'0.0.0.1', N'', N'{"columnName":null,"describe":null,"low_Code_TableId":"69edd8a8-1d24-478c-a909-b82039edcec0"}', N'', N'393', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeSearchController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'058935C0-157E-406B-EF0A-08DA722F2D1E', N'2022-07-30 21:27:18.3205064', N'2022-07-30 21:27:18.3205054', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'500', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5FC10E75-E5A2-4406-EF0B-08DA722F2D1E', N'2022-07-30 21:27:19.4189736', N'2022-07-30 21:27:19.4189728', NULL, NULL, N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"low_code_search","type":"HZY.Models","codeText":""}', N'', N'310', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9457EE10-7148-413B-EF0C-08DA722F2D1E', N'2022-07-30 21:27:20.3619316', N'2022-07-30 21:27:20.3619311', NULL, NULL, N'/api/admin/LowCodeTable/findForm/69edd8a8-1d24-478c-a909-b82039edcec0', N'0.0.0.1', N'', N'', N'', N'65', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D67356DE-77E3-488D-EF0D-08DA722F2D1E', N'2022-07-30 21:27:23.0105582', N'2022-07-30 21:27:23.0105572', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'169', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'AC71DFCD-B323-4409-6190-08DA7233D278', N'2022-07-30 22:00:12.8676455', N'2022-07-30 22:00:12.8676439', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'5', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A7B38AEC-C332-48A3-6191-08DA7233D278', N'2022-07-30 22:00:14.9087436', N'2022-07-30 22:00:14.9087427', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'521', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B7955AC4-DAE7-4C73-F242-08DA723412AD', N'2022-07-30 22:02:00.6282214', N'2022-07-30 22:02:00.6282202', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'7', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5F9F779C-5313-4F6A-F243-08DA723412AD', N'2022-07-30 22:02:02.0654126', N'2022-07-30 22:02:02.0654114', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'478', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0B635722-C36D-4D5B-F244-08DA723412AD', N'2022-07-30 22:04:27.8496361', N'2022-07-30 22:04:27.8496348', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'125', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3CB64345-7D96-477A-F245-08DA723412AD', N'2022-07-30 22:04:29.2242205', N'2022-07-30 22:04:29.2242199', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'431', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B3E5E476-9FA8-4CB9-F246-08DA723412AD', N'2022-07-30 22:04:31.7486224', N'2022-07-30 22:04:31.7486214', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'116', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'79F44F9E-4E9E-4EE0-F247-08DA723412AD', N'2022-07-30 22:04:33.2040797', N'2022-07-30 22:04:33.2040791', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'90', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A5B623EF-771B-4B09-F248-08DA723412AD', N'2022-07-30 22:04:44.5054484', N'2022-07-30 22:04:44.5054476', NULL, NULL, N'/upload', N'0.0.0.1', N'{}', N'------WebKitFormBoundaryEqrNMAh1ZAswn2mj
Content-Disposition: form-data; name="file"; filename="HZY.IOT.png"
Content-Type: image/png

�PNG

', N'', N'0', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A3F28FB3-BAAF-4F69-D06E-08DA72349AFD', N'2022-07-30 22:05:49.3451054', N'2022-07-30 22:05:49.3451034', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'5', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E89E0354-CC0D-4428-D06F-08DA72349AFD', N'2022-07-30 22:05:50.7480507', N'2022-07-30 22:05:50.7480497', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'466', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'81A0C758-BF05-4DA1-D070-08DA72349AFD', N'2022-07-30 22:05:58.0039079', N'2022-07-30 22:05:58.0039070', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'145', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1B6B8637-EEE6-421B-D071-08DA72349AFD', N'2022-07-30 22:05:59.2843814', N'2022-07-30 22:05:59.2843804', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'433', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'6CC60F98-57E7-4E73-D072-08DA72349AFD', N'2022-07-30 22:06:02.5633121', N'2022-07-30 22:06:02.5633113', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'98', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0D09E434-2989-40B4-D073-08DA72349AFD', N'2022-07-30 22:06:06.1049017', N'2022-07-30 22:06:06.1048997', NULL, NULL, N'/upload/uploadFile', N'0.0.0.1', N'{}', N'------WebKitFormBoundaryo4uAvFX332OuBqgA
Content-Disposition: form-data; name="file"; filename="HZY.IOT.png"
Content-Type: image/png

�PNG

', N'', N'0', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'45631DE0-C39D-44E3-416C-08DA7234E615', N'2022-07-30 22:07:55.1752363', N'2022-07-30 22:07:55.1752348', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'7', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'6C376B6F-517B-4A8B-416D-08DA7234E615', N'2022-07-30 22:07:56.3159652', N'2022-07-30 22:07:56.3159643', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'437', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F2277E98-931B-4620-416E-08DA7234E615', N'2022-07-30 22:08:45.2824200', N'2022-07-30 22:08:45.2824185', NULL, NULL, N'/upload/uploadFile', N'0.0.0.1', N'{}', N'------WebKitFormBoundarynJjqWgXWbzsp36rk
Content-Disposition: form-data; name="file"; filename="HZY.IOT.png"
Content-Type: image/png

�PNG

', N'', N'0', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'683FE263-FE64-4709-416F-08DA7234E615', N'2022-07-30 22:09:04.7166272', N'2022-07-30 22:09:04.7166265', NULL, NULL, N'/upload/uploadFile', N'0.0.0.1', N'{}', N'------WebKitFormBoundaryivXZfXqOc8FMFhgb
Content-Disposition: form-data; name="file"; filename="HZY.IOT.png"
Content-Type: image/png

�PNG

', N'', N'0', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'DC7189E6-785A-494B-C655-08DA723552A0', N'2022-07-30 22:10:57.3185094', N'2022-07-30 22:10:57.3185082', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'7', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3478A0E2-1CF0-446D-C656-08DA723552A0', N'2022-07-30 22:11:16.3160602', N'2022-07-30 22:11:16.3160592', NULL, NULL, N'/api/account/check', N'0.0.0.1', N'', N'{"userName":"admin","userPassword":"123456"}', N'', N'921', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'82DA242E-554B-4EE3-C657-08DA723552A0', N'2022-07-30 22:11:17.0064844', N'2022-07-30 22:11:17.0064832', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'358', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'6A51E831-FB4E-44E0-C658-08DA723552A0', N'2022-07-30 22:11:24.9389003', N'2022-07-30 22:11:24.9388998', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'440', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'91611B7E-DA6A-4569-C659-08DA723552A0', N'2022-07-30 22:11:27.7369904', N'2022-07-30 22:11:27.7369898', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'137', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'668FA6EB-D428-4C5E-C65A-08DA723552A0', N'2022-07-30 22:11:30.6533567', N'2022-07-30 22:11:30.6533561', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'94', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B99961DC-425F-4906-C65B-08DA723552A0', N'2022-07-30 22:11:33.9777506', N'2022-07-30 22:11:33.9777486', NULL, NULL, N'/upload/uploadFile', N'0.0.0.1', N'{}', N'------WebKitFormBoundaryR8TufUg7Na3LnBC2
Content-Disposition: form-data; name="file"; filename="HZY.IOT.png"
Content-Type: image/png

�PNG

', N'', N'0', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'74D020B7-F82E-40F0-C65C-08DA723552A0', N'2022-07-30 22:12:06.0978567', N'2022-07-30 22:12:06.0978556', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'139', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'777C620E-BC63-4076-C65D-08DA723552A0', N'2022-07-30 22:12:06.8987448', N'2022-07-30 22:12:06.8987440', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'81', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C5ECDAAD-4592-41D9-C65E-08DA723552A0', N'2022-07-30 22:12:09.1131037', N'2022-07-30 22:12:09.1131029', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'34', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'342B366A-6D74-42A1-5278-08DA7235A0F2', N'2022-07-30 22:13:08.6584259', N'2022-07-30 22:13:08.6584243', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'7', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3E02C946-EC9D-4A93-5279-08DA7235A0F2', N'2022-07-30 22:13:09.7564134', N'2022-07-30 22:13:09.7564121', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'472', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'21C287F0-3E46-47C7-527A-08DA7235A0F2', N'2022-07-30 22:13:09.7989408', N'2022-07-30 22:13:09.7989402', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'97', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'12AE8E52-F31A-46E2-527B-08DA7235A0F2', N'2022-07-30 22:13:11.0789741', N'2022-07-30 22:13:11.0789725', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'355', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A4EB07D3-6977-4DB4-527C-08DA7235A0F2', N'2022-07-30 22:13:14.0972557', N'2022-07-30 22:13:14.0972553', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'107', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'33D0F667-9492-4ABE-527D-08DA7235A0F2', N'2022-07-30 22:13:34.6439119', N'2022-07-30 22:13:34.6439106', NULL, NULL, N'/api/upload/uploadFile', N'0.0.0.1', N'{}', N'------WebKitFormBoundaryeSeryJhcZAsZqSOB
Content-Disposition: form-data; name="file"; filename="HZY.IOT.png"
Content-Type: image/png

�PNG

', N'', N'16569', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'537E45C0-05F2-4BCF-527E-08DA7235A0F2', N'2022-07-30 22:14:40.2917265', N'2022-07-30 22:14:40.2917259', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'114', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0D0D2AA4-29EF-4EE8-527F-08DA7235A0F2', N'2022-07-30 22:14:41.1162328', N'2022-07-30 22:14:41.1162313', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'72', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D0E28035-6094-4306-5280-08DA7235A0F2', N'2022-07-30 22:14:44.2184845', N'2022-07-30 22:14:44.2184835', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'51', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9A3120EC-E589-447A-5281-08DA7235A0F2', N'2022-07-30 22:16:51.5932117', N'2022-07-30 22:16:51.5932110', NULL, NULL, N'/api/upload/uploadFile', N'0.0.0.1', N'{}', N'------WebKitFormBoundaryKj8NquIvVwG54WuT
Content-Disposition: form-data; name="file"; filename="HZY.IOT.png"
Content-Type: image/png

�PNG

', N'', N'124103', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'80A1E1E7-8A15-4219-5282-08DA7235A0F2', N'2022-07-30 22:16:51.6061405', N'2022-07-30 22:16:51.6061398', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'43', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F4CF2408-7CA7-4F35-5283-08DA7235A0F2', N'2022-07-30 22:16:52.9817002', N'2022-07-30 22:16:52.9816993', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'121', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F9A8860B-0080-4EF9-5284-08DA7235A0F2', N'2022-07-30 22:16:55.6860667', N'2022-07-30 22:16:55.6860654', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'50', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'75A3B508-776D-4E78-5285-08DA7235A0F2', N'2022-07-30 22:17:00.9115221', N'2022-07-30 22:17:00.9115216', NULL, NULL, N'/api/upload/uploadFile', N'0.0.0.1', N'{}', N'------WebKitFormBoundarykdhisJx172zcNUgQ
Content-Disposition: form-data; name="file"; filename="HZY.IOT.png"
Content-Type: image/png

�PNG

', N'', N'2041', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'FB74FC95-B500-4877-5286-08DA7235A0F2', N'2022-07-30 22:18:06.0780117', N'2022-07-30 22:18:06.0780107', NULL, NULL, N'/api/upload/uploadFile', N'0.0.0.1', N'{}', N'------WebKitFormBoundary428tL8IX9ocW4maD
Content-Disposition: form-data; name="file"; filename="QQ图片20220723232748.png"
Content-Type: image/png

�PNG

', N'', N'3255', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E009F89C-CCDF-4B00-5287-08DA7235A0F2', N'2022-07-30 22:22:28.5317661', N'2022-07-30 22:22:28.5317656', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'83', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0A8ADBF4-E98C-4CB6-5288-08DA7235A0F2', N'2022-07-30 22:24:43.7001357', N'2022-07-30 22:24:43.7001350', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'275', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'483C6A33-E7A9-4C29-5289-08DA7235A0F2', N'2022-07-30 22:24:43.7088720', N'2022-07-30 22:24:43.7088712', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'280', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C59E9740-C20E-449C-528A-08DA7235A0F2', N'2022-07-30 22:24:43.8140371', N'2022-07-30 22:24:43.8140365', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'296', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F6DA1D75-203B-4FDB-528B-08DA7235A0F2', N'2022-07-30 22:24:43.8379521', N'2022-07-30 22:24:43.8379514', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'199', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5E97698F-3D4C-4834-528C-08DA7235A0F2', N'2022-07-30 22:25:05.3575895', N'2022-07-30 22:25:05.3575890', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'111', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'BD59FBCA-4B60-4A18-528D-08DA7235A0F2', N'2022-07-30 22:25:10.6348856', N'2022-07-30 22:25:10.6348848', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'41', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'4D413E77-14EE-49DE-528E-08DA7235A0F2', N'2022-07-30 22:25:11.4105277', N'2022-07-30 22:25:11.4105271', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'85', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A9ACA2BF-5129-4E9C-0DC4-08DA72376E0A', N'2022-07-30 22:26:02.5279478', N'2022-07-30 22:26:02.5279463', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'5', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'30D92240-0D05-42F3-0DC5-08DA72376E0A', N'2022-07-30 22:26:04.3105956', N'2022-07-30 22:26:04.3105938', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'590', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'4DBE075B-C1EC-461C-0DC6-08DA72376E0A', N'2022-07-30 22:26:04.3163594', N'2022-07-30 22:26:04.3163576', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'131', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B7CD7A50-8506-4DA9-0DC7-08DA72376E0A', N'2022-07-30 22:26:05.2156354', N'2022-07-30 22:26:05.2156350', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'356', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8D72B606-9125-453B-0DC8-08DA72376E0A', N'2022-07-30 22:26:06.9648459', N'2022-07-30 22:26:06.9648454', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'141', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D0438776-084C-4EE4-0DC9-08DA72376E0A', N'2022-07-30 22:26:20.4314963', N'2022-07-30 22:26:20.4314954', NULL, NULL, N'/api/upload/uploadFile', N'0.0.0.1', N'{}', N'------WebKitFormBoundaryF6BzYaa7VAAyXFQp
Content-Disposition: form-data; name="file"; filename="HZY.IOT.png"
Content-Type: image/png

�PNG

', N'', N'180', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8CAB9019-7F08-407F-504F-08DA7237AD4D', N'2022-07-30 22:27:48.4288978', N'2022-07-30 22:27:48.4288962', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'7', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1AB3EC3C-5B78-4F8F-5050-08DA7237AD4D', N'2022-07-30 22:27:52.9416870', N'2022-07-30 22:27:52.9416859', NULL, NULL, N'/api/account/check', N'0.0.0.1', N'', N'{"userName":"admin","userPassword":"123456"}', N'', N'889', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'29E34D5B-7CB0-445A-5051-08DA7237AD4D', N'2022-07-30 22:27:53.5996826', N'2022-07-30 22:27:53.5996814', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'370', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B6047099-6D45-4749-5052-08DA7237AD4D', N'2022-07-30 22:27:58.0507698', N'2022-07-30 22:27:58.0507690', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'34', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'EF47928F-63A5-48AD-5053-08DA7237AD4D', N'2022-07-30 22:28:07.1975661', N'2022-07-30 22:28:07.1975655', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'454', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C6F9A54C-0AB1-4565-5054-08DA7237AD4D', N'2022-07-30 22:28:09.1068163', N'2022-07-30 22:28:09.1068157', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'137', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'10C26D35-0909-42D5-5055-08DA7237AD4D', N'2022-07-30 22:28:13.2390652', N'2022-07-30 22:28:13.2390646', NULL, NULL, N'/api/upload/uploadFile', N'0.0.0.1', N'{}', N'------WebKitFormBoundaryjYkoboGQWZM96hLx
Content-Disposition: form-data; name="file"; filename="HZY.IOT.png"
Content-Type: image/png

�PNG

', N'', N'189', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A0914772-9091-46D8-5056-08DA7237AD4D', N'2022-07-30 22:30:33.3266572', N'2022-07-30 22:30:33.3266563', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'156', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'143165BC-EEDA-4DFC-5057-08DA7237AD4D', N'2022-07-30 22:30:34.0643945', N'2022-07-30 22:30:34.0643938', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'83', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7AE35683-70AE-48A7-5058-08DA7237AD4D', N'2022-07-30 22:30:36.3819874', N'2022-07-30 22:30:36.3819865', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'20', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D4D647C5-0BE1-410B-5059-08DA7237AD4D', N'2022-07-30 22:30:37.1773511', N'2022-07-30 22:30:37.1773504', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'87', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'50E0CE6D-7887-4DF9-505A-08DA7237AD4D', N'2022-07-30 22:30:39.9432528', N'2022-07-30 22:30:39.9432519', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'64', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7E181AD1-398D-43AD-505B-08DA7237AD4D', N'2022-07-30 22:30:45.1996561', N'2022-07-30 22:30:45.1996543', NULL, NULL, N'/api/upload/uploadFile', N'0.0.0.1', N'{}', N'------WebKitFormBoundaryNIV6z6JASb7YHcUA
Content-Disposition: form-data; name="file"; filename="HZY.IOT.png"
Content-Type: image/png

�PNG

', N'', N'161', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'6BE53B45-1132-4153-505C-08DA7237AD4D', N'2022-07-30 22:30:54.1476121', N'2022-07-30 22:30:54.1476115', NULL, NULL, N'/api/admin/Member/update', N'0.0.0.1', N'', N'{"number":"1","name":"测试会员","phone":"18510912123","sex":"男","birthday":"2019-07-08 11:47:24","photo":"http://localhost:5600http://localhost:5600http://localhost:5600http://localhost:5600/upload/files/20210118/time_232747_old_name_hzy.png","introduce":"<p>999888</p>","filePath":"[{\"uid\":\"21148664-4b37-4b38-aad0-cc1d80ddcb1c\",\"name\":\"time_223045_old_name_HZY.IOT.png\",\"percent\":100,\"status\":\"success\",\"thumbUrl\":\"/upload/files/20220730/time_223045_old_name_HZY.IOT.png\",\"url\":\"/upload/files/20220730/time_223045_old_name_HZY.IOT.png\"}]","userId":"ac18f496-e93d-42f0-b59e-e321acc85335","id":"9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e","lastModificationTime":"2022-05-08 16:46:21","creationTime":"2018-04-25 23:00:00"}', N'', N'123', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'编辑表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'AC014EC7-F936-4A87-505D-08DA7237AD4D', N'2022-07-30 22:30:54.3706266', N'2022-07-30 22:30:54.3706259', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'89', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5ADE59FA-3547-4E53-505E-08DA7237AD4D', N'2022-07-30 22:30:56.9775324', N'2022-07-30 22:30:56.9775319', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'74', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'92C9C591-8A59-4EDF-D358-08DA72385157', N'2022-07-30 22:32:23.8123019', N'2022-07-30 22:32:23.8123004', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'9', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'349810C4-2EEC-4039-D359-08DA72385157', N'2022-07-30 22:32:25.0107849', N'2022-07-30 22:32:25.0107841', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'514', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'DBBB6335-7333-41D9-D35A-08DA72385157', N'2022-07-30 22:32:37.7965781', N'2022-07-30 22:32:37.7965776', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'95', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3B20EA3E-9B77-40DC-D35B-08DA72385157', N'2022-07-30 22:32:38.7508376', N'2022-07-30 22:32:38.7508371', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'431', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'346072AE-1C20-46C4-D35C-08DA72385157', N'2022-07-30 22:32:44.7458564', N'2022-07-30 22:32:44.7458559', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'115', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5D05093D-2F44-4FDD-D35D-08DA72385157', N'2022-07-30 22:40:09.6090609', N'2022-07-30 22:40:09.6090604', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'120', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'DA0E94D9-3D0A-454D-D35E-08DA72385157', N'2022-07-30 22:40:10.5247949', N'2022-07-30 22:40:10.5247939', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'68', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F5E3211C-DB71-4AB3-D35F-08DA72385157', N'2022-07-30 22:40:10.6481419', N'2022-07-30 22:40:10.6481415', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'6', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3582B0C8-9BC2-4E2A-D360-08DA72385157', N'2022-07-30 22:40:12.6423342', N'2022-07-30 22:40:12.6423335', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'44', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C7A7BE81-D2F4-4877-D361-08DA72385157', N'2022-07-30 22:40:18.3095813', N'2022-07-30 22:40:18.3095806', NULL, NULL, N'/api/admin/Member/findForm/96a1aa3d-a61a-42d0-954a-c71753fb2065', N'0.0.0.1', N'', N'', N'', N'57', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'4E176698-C271-4832-D362-08DA72385157', N'2022-07-30 22:40:29.7243177', N'2022-07-30 22:40:29.7243171', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'48', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'43FFC275-55D9-4927-CF98-08DA7239C21B', N'2022-07-30 22:42:42.3827712', N'2022-07-30 22:42:42.3827701', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'6', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2EE88F86-ED81-42CE-CF99-08DA7239C21B', N'2022-07-30 22:42:43.6481037', N'2022-07-30 22:42:43.6481028', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'456', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E2B51D76-61B4-4273-CF9A-08DA7239C21B', N'2022-07-30 22:42:52.6594206', N'2022-07-30 22:42:52.6594198', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'164', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'851FE2FB-BF99-43F4-CF9B-08DA7239C21B', N'2022-07-30 22:42:58.7172018', N'2022-07-30 22:42:58.7172010', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'101', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'16F14FE5-0DA1-4E14-CF9C-08DA7239C21B', N'2022-07-30 22:43:00.0731615', N'2022-07-30 22:43:00.0731610', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'551', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1A30EE97-B7C3-46A8-CF9D-08DA7239C21B', N'2022-07-30 22:43:00.2292582', N'2022-07-30 22:43:00.2292577', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'5', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'851E0F62-28E0-4832-CF9E-08DA7239C21B', N'2022-07-30 22:43:00.3509288', N'2022-07-30 22:43:00.3509279', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'5', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'BB05C27E-20E5-47B7-CF9F-08DA7239C21B', N'2022-07-30 22:43:01.3570539', N'2022-07-30 22:43:01.3570533', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'67', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C7F9FD1B-0EBC-41B2-CFA0-08DA7239C21B', N'2022-07-30 22:43:51.9861837', N'2022-07-30 22:43:51.9861833', NULL, NULL, N'/api/upload/uploadFile', N'0.0.0.1', N'{}', N'------WebKitFormBoundary09wCLXTQYLJjIyfD
Content-Disposition: form-data; name="avatar"; filename="QQ图片20220723232748.png"
Content-Type: image/png

�PNG

', N'', N'42788', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'18A3A82E-D30A-4A6F-CFA1-08DA7239C21B', N'2022-07-30 22:43:54.9203681', N'2022-07-30 22:43:54.9203674', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'52', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'360CDC04-75B8-45D2-CFA2-08DA7239C21B', N'2022-07-30 22:43:55.7150414', N'2022-07-30 22:43:55.7150405', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'70', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'EFF9DCE7-5B1C-414C-CFA3-08DA7239C21B', N'2022-07-30 22:43:55.8576894', N'2022-07-30 22:43:55.8576884', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'3', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C8C60C0C-4D54-4476-CFA4-08DA7239C21B', N'2022-07-30 22:43:57.2728794', N'2022-07-30 22:43:57.2728787', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'42', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'55DA728D-8065-4AAF-CFA5-08DA7239C21B', N'2022-07-30 22:44:02.9724063', N'2022-07-30 22:44:02.9724057', NULL, NULL, N'/api/upload/uploadFile', N'0.0.0.1', N'{}', N'------WebKitFormBoundaryvm1NAdpcc5kMsmwp
Content-Disposition: form-data; name="file"; filename="QQ图片20220723232748.png"
Content-Type: image/png

�PNG

', N'', N'146', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'EFBE77B4-153D-461D-CFA6-08DA7239C21B', N'2022-07-30 22:44:32.8446576', N'2022-07-30 22:44:32.8446568', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'59', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'15ADAA51-E4C9-4688-CFA7-08DA7239C21B', N'2022-07-30 22:44:33.6423885', N'2022-07-30 22:44:33.6423878', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'80', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'CFAC38A0-533B-421F-CFA8-08DA7239C21B', N'2022-07-30 22:44:33.7744065', N'2022-07-30 22:44:33.7744058', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'3', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'AF35D901-1E16-4A2D-CFA9-08DA7239C21B', N'2022-07-30 22:44:33.9052906', N'2022-07-30 22:44:33.9052899', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'4', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D526EDD0-9912-4D91-CFAA-08DA7239C21B', N'2022-07-30 22:44:35.3825383', N'2022-07-30 22:44:35.3825375', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'40', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5F4F6D6E-B389-491C-CFAB-08DA7239C21B', N'2022-07-30 22:44:42.4927909', N'2022-07-30 22:44:42.4927902', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'45', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7D6D5FA5-954C-44CA-CFAC-08DA7239C21B', N'2022-07-30 22:45:56.2096731', N'2022-07-30 22:45:56.2096723', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'93', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9CFB8C80-DB48-437F-CFAD-08DA7239C21B', N'2022-07-30 22:45:57.0207527', N'2022-07-30 22:45:57.0207518', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'93', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'DCCD5ECE-1726-447E-CFAE-08DA7239C21B', N'2022-07-30 22:45:57.1516372', N'2022-07-30 22:45:57.1516363', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'4', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C247AEFA-1F99-423D-CFAF-08DA7239C21B', N'2022-07-30 22:45:59.2783804', N'2022-07-30 22:45:59.2783798', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'56', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3CF748BD-44E4-40A3-CFB0-08DA7239C21B', N'2022-07-30 22:46:07.3486943', N'2022-07-30 22:46:07.3486936', NULL, NULL, N'/api/upload/uploadFile', N'0.0.0.1', N'{}', N'------WebKitFormBoundaryaT9wUqhtyHHcXn6f
Content-Disposition: form-data; name="file"; filename="QQ图片20220723232748.png"
Content-Type: image/png

�PNG

', N'', N'117', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'6C2035CD-9F5E-47BB-CFB1-08DA7239C21B', N'2022-07-30 22:47:38.2596905', N'2022-07-30 22:47:38.2596898', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'64', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D7E73A49-2814-4FFD-CFB2-08DA7239C21B', N'2022-07-30 22:47:39.0692574', N'2022-07-30 22:47:39.0692567', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'63', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B6D6BB48-BF66-474C-CFB3-08DA7239C21B', N'2022-07-30 22:47:39.2346224', N'2022-07-30 22:47:39.2346206', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'3', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'741BBCBD-CDE2-454E-CFB4-08DA7239C21B', N'2022-07-30 22:47:40.4102305', N'2022-07-30 22:47:40.4102285', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'81', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7F6DBA73-9DBA-45A3-CFB5-08DA7239C21B', N'2022-07-30 22:47:44.6627508', N'2022-07-30 22:47:44.6627503', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'2', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'61ED0326-8ADF-4F99-CFB6-08DA7239C21B', N'2022-07-30 22:47:47.3872771', N'2022-07-30 22:47:47.3872764', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'33', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8400EEA6-B2F5-4404-CFB7-08DA7239C21B', N'2022-07-30 22:48:26.6309994', N'2022-07-30 22:48:26.6309984', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'125', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2DCC1F5A-23AB-4B9A-CFB8-08DA7239C21B', N'2022-07-30 22:48:27.7976950', N'2022-07-30 22:48:27.7976940', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'101', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'FE3750FB-828B-4B82-CFB9-08DA7239C21B', N'2022-07-30 22:48:27.9594376', N'2022-07-30 22:48:27.9594367', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'4', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D5DB7834-9761-4A73-CFBA-08DA7239C21B', N'2022-07-30 22:48:32.8440146', N'2022-07-30 22:48:32.8440140', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'50', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D941233C-6105-419C-CFBB-08DA7239C21B', N'2022-07-30 22:48:38.9103856', N'2022-07-30 22:48:38.9103848', NULL, NULL, N'/api/upload/uploadFile', N'0.0.0.1', N'{}', N'------WebKitFormBoundaryJg9obDgC25PxPhRe
Content-Disposition: form-data; name="file"; filename="HZY.IOT.png"
Content-Type: image/png

�PNG

', N'', N'40', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A9A47265-5A1C-4707-CFBC-08DA7239C21B', N'2022-07-30 22:50:17.2742460', N'2022-07-30 22:50:17.2742449', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'86', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'CE12BD7A-A333-4695-CFBD-08DA7239C21B', N'2022-07-30 22:50:18.1341249', N'2022-07-30 22:50:18.1341243', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'74', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'06F7AC72-F7CF-4B76-CFBE-08DA7239C21B', N'2022-07-30 22:50:18.2474935', N'2022-07-30 22:50:18.2474929', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'3', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'86164D7F-95EB-4987-CFBF-08DA7239C21B', N'2022-07-30 22:50:19.6172142', N'2022-07-30 22:50:19.6172135', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'62', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'DA31809A-29B4-4E93-CFC0-08DA7239C21B', N'2022-07-30 22:51:06.3087410', N'2022-07-30 22:51:06.3087400', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'34', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7CC74026-0FDB-4163-CFC1-08DA7239C21B', N'2022-07-30 22:51:07.2688959', N'2022-07-30 22:51:07.2688946', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'61', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8F62E769-167D-4852-CFC2-08DA7239C21B', N'2022-07-30 22:51:07.4244673', N'2022-07-30 22:51:07.4244666', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'4', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'29B806B4-151E-4FD8-CFC3-08DA7239C21B', N'2022-07-30 22:51:08.5146229', N'2022-07-30 22:51:08.5146221', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'56', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'911AED97-A966-44DC-CFC4-08DA7239C21B', N'2022-07-30 22:52:27.2022104', N'2022-07-30 22:52:27.2022095', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'123', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A497E545-5F92-4C93-CFC5-08DA7239C21B', N'2022-07-30 22:52:28.3376962', N'2022-07-30 22:52:28.3376951', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'95', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'05C9F406-0F05-4814-CFC6-08DA7239C21B', N'2022-07-30 22:52:28.4524022', N'2022-07-30 22:52:28.4524014', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'3', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'DF5C1580-6ED0-494C-CFC7-08DA7239C21B', N'2022-07-30 22:52:29.5024468', N'2022-07-30 22:52:29.5024462', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'37', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'506C0AA4-E0B0-4C69-CFC8-08DA7239C21B', N'2022-07-30 22:53:08.8272265', N'2022-07-30 22:53:08.8272258', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'95', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2030A23E-74BA-4442-CFC9-08DA7239C21B', N'2022-07-30 22:53:09.5731367', N'2022-07-30 22:53:09.5731361', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'74', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E821F214-D1EC-44C0-CFCA-08DA7239C21B', N'2022-07-30 22:53:09.6997858', N'2022-07-30 22:53:09.6997850', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'5', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'FDFD9F57-CD36-4FF9-CFCB-08DA7239C21B', N'2022-07-30 22:53:10.8967374', N'2022-07-30 22:53:10.8967366', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'107', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'89DDA203-DA3F-45A8-CFCC-08DA7239C21B', N'2022-07-30 22:53:30.1806476', N'2022-07-30 22:53:30.1806468', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'69', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'550DF66A-5CB5-406C-CFCD-08DA7239C21B', N'2022-07-30 22:53:31.0927666', N'2022-07-30 22:53:31.0927660', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'61', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2FD5904E-ADF6-4179-CFCE-08DA7239C21B', N'2022-07-30 22:53:31.2371551', N'2022-07-30 22:53:31.2371537', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'3', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'209DA10B-2D6E-4E99-CFCF-08DA7239C21B', N'2022-07-30 22:53:32.2260967', N'2022-07-30 22:53:32.2260958', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'52', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'AC47B905-E57F-4E89-CFD0-08DA7239C21B', N'2022-07-30 22:53:57.4658813', N'2022-07-30 22:53:57.4658807', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'24', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'564A00F8-216C-4998-CFD1-08DA7239C21B', N'2022-07-30 22:53:58.2587301', N'2022-07-30 22:53:58.2587290', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'70', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'EF75A44D-0FEA-479D-CFD2-08DA7239C21B', N'2022-07-30 22:53:58.3829061', N'2022-07-30 22:53:58.3829053', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'3', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'BD9ED828-4AF7-4D96-CFD3-08DA7239C21B', N'2022-07-30 22:53:59.5032178', N'2022-07-30 22:53:59.5032170', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'71', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A86C770E-2E16-4BD9-CFD4-08DA7239C21B', N'2022-07-30 22:54:02.4747377', N'2022-07-30 22:54:02.4747372', NULL, NULL, N'/api/upload/uploadFile', N'0.0.0.1', N'{}', N'------WebKitFormBoundaryX2dJNLJesTZnuFsq
Content-Disposition: form-data; name="file"; filename="HZY.IOT.png"
Content-Type: image/png

�PNG

', N'', N'31', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'513FFEA6-261E-4C34-CFD5-08DA7239C21B', N'2022-07-30 22:54:18.7307309', N'2022-07-30 22:54:18.7307286', NULL, NULL, N'/api/admin/Member/update', N'0.0.0.1', N'', N'{"number":"1","name":"测试会员","phone":"18510912123","sex":"男","birthday":"2019-07-08 11:47:24","photo":"[{\"uid\":\"d73253d6-9de1-428e-a03c-b63fd4b9bc13\",\"name\":\"time_225402_old_name_HZY.IOT.png\",\"percent\":100,\"status\":\"done\",\"thumbUrl\":\"/upload/files/20220730/time_225402_old_name_HZY.IOT.png\",\"url\":\"http://localhost:5600/upload/files/20220730/time_225402_old_name_HZY.IOT.png\"}]","introduce":"<p>999888</p>","filePath":"[null]","userId":"ac18f496-e93d-42f0-b59e-e321acc85335","id":"9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e","lastModificationTime":"2022-07-30 22:30:54","creationTime":"2018-04-25 23:00:00"}', N'', N'133', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'编辑表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'ECA86FCF-2393-4AD6-CFD6-08DA7239C21B', N'2022-07-30 22:54:18.9495450', N'2022-07-30 22:54:18.9495443', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'76', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3E33B9E2-8C69-423C-CFD7-08DA7239C21B', N'2022-07-30 22:54:22.5205617', N'2022-07-30 22:54:22.5205599', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'26', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'149EEBAD-6681-4ED4-CFD8-08DA7239C21B', N'2022-07-30 22:54:23.2369017', N'2022-07-30 22:54:23.2369012', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'75', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'422BE130-6299-4F95-CFD9-08DA7239C21B', N'2022-07-30 22:54:24.7009075', N'2022-07-30 22:54:24.7009065', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'55', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D7B735C4-0A5F-49E6-CFDA-08DA7239C21B', N'2022-07-30 22:54:52.1403344', N'2022-07-30 22:54:52.1403338', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'93', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'86E08E3D-5B55-4F4D-CFDB-08DA7239C21B', N'2022-07-30 22:54:52.9609524', N'2022-07-30 22:54:52.9609517', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'76', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E2D4E4A3-D9D5-4748-CFDC-08DA7239C21B', N'2022-07-30 22:54:54.1774977', N'2022-07-30 22:54:54.1774954', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'68', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B44B3D2C-7E03-41DF-CFDD-08DA7239C21B', N'2022-07-30 22:58:21.9558300', N'2022-07-30 22:58:21.9558292', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'62', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9B600287-3C52-496C-CFDE-08DA7239C21B', N'2022-07-30 22:58:34.5135511', N'2022-07-30 22:58:34.5135504', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'448', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8FC02297-538E-4BD1-CFDF-08DA7239C21B', N'2022-07-30 22:58:34.5173167', N'2022-07-30 22:58:34.5173161', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'451', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F9DE5F15-BBE7-47B4-CFE0-08DA7239C21B', N'2022-07-30 22:58:36.9226215', N'2022-07-30 22:58:36.9226208', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'34', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9F3BF890-A7CC-456A-CFE1-08DA7239C21B', N'2022-07-30 22:58:37.7910074', N'2022-07-30 22:58:37.7910067', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'73', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'072F34A5-6EE1-4832-CFE2-08DA7239C21B', N'2022-07-30 22:58:39.1974734', N'2022-07-30 22:58:39.1974726', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'49', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E36E352E-4D44-4808-CFE3-08DA7239C21B', N'2022-07-30 22:58:57.5584035', N'2022-07-30 22:58:57.5584028', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'51', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'CD97622A-8109-409C-CFE4-08DA7239C21B', N'2022-07-30 22:58:58.4962765', N'2022-07-30 22:58:58.4962757', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'93', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'20BBA98E-390A-448F-CFE5-08DA7239C21B', N'2022-07-30 22:58:59.8683656', N'2022-07-30 22:58:59.8683648', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'59', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D5167C78-6E24-4F0C-CFE6-08DA7239C21B', N'2022-07-30 23:00:57.4547193', N'2022-07-30 23:00:57.4547179', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'37', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'FB4FA04B-C70E-4404-CFE7-08DA7239C21B', N'2022-07-30 23:00:58.3232742', N'2022-07-30 23:00:58.3232733', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'111', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0D39244B-04D6-41EE-CFE8-08DA7239C21B', N'2022-07-30 23:00:59.5302940', N'2022-07-30 23:00:59.5302927', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'41', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'44A624C2-0B45-4154-CFE9-08DA7239C21B', N'2022-07-30 23:01:21.7069538', N'2022-07-30 23:01:21.7069528', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'107', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D6AB0D03-8E7B-4491-CFEA-08DA7239C21B', N'2022-07-30 23:01:22.6168166', N'2022-07-30 23:01:22.6168152', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'90', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'218019BF-B02E-47B4-CFEB-08DA7239C21B', N'2022-07-30 23:01:24.2916009', N'2022-07-30 23:01:24.2916003', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'48', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'EE5450DB-D8EF-4DDF-CFEC-08DA7239C21B', N'2022-07-30 23:03:04.8670270', N'2022-07-30 23:03:04.8670264', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'46', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'BF198C56-7D1B-4118-CFED-08DA7239C21B', N'2022-07-30 23:03:06.1038268', N'2022-07-30 23:03:06.1038260', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'82', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A3B94B9A-0ED1-4CFB-CFEE-08DA7239C21B', N'2022-07-30 23:03:44.9903836', N'2022-07-30 23:03:44.9903803', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'53', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'473B9A5E-2BEE-4F9F-CFEF-08DA7239C21B', N'2022-07-30 23:03:46.0378199', N'2022-07-30 23:03:46.0378188', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'81', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'6D7D7B7C-E171-4163-CFF0-08DA7239C21B', N'2022-07-30 23:03:47.8264421', N'2022-07-30 23:03:47.8264414', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'47', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8C63AD49-D387-4BC1-CFF1-08DA7239C21B', N'2022-07-30 23:04:09.1492592', N'2022-07-30 23:04:09.1492584', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'93', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'746A6285-CE3F-4A0C-CFF2-08DA7239C21B', N'2022-07-30 23:04:10.0037048', N'2022-07-30 23:04:10.0037028', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'115', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3DE5B9F8-3DBE-4760-CFF3-08DA7239C21B', N'2022-07-30 23:04:11.1163958', N'2022-07-30 23:04:11.1163952', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'31', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'681BC8D6-C2AE-4F97-CFF4-08DA7239C21B', N'2022-07-30 23:05:00.8315433', N'2022-07-30 23:05:00.8315426', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'108', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9E412483-E7BB-42FE-CFF5-08DA7239C21B', N'2022-07-30 23:05:01.7065157', N'2022-07-30 23:05:01.7065147', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'75', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'4D68AB2A-B940-4CFD-CFF6-08DA7239C21B', N'2022-07-30 23:05:04.1598716', N'2022-07-30 23:05:04.1598709', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'44', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E3C8AAC0-A459-460A-CFF7-08DA7239C21B', N'2022-07-30 23:05:46.2689416', N'2022-07-30 23:05:46.2689408', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'122', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'35BB442B-DD2E-496A-CFF8-08DA7239C21B', N'2022-07-30 23:05:47.0348107', N'2022-07-30 23:05:47.0348093', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'61', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2AC95CE9-81A9-4091-CFF9-08DA7239C21B', N'2022-07-30 23:05:48.2345055', N'2022-07-30 23:05:48.2345048', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'38', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'63B940B6-8B92-413F-CFFA-08DA7239C21B', N'2022-07-30 23:06:22.2078428', N'2022-07-30 23:06:22.2078417', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'72', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'30828AE2-5670-4871-CFFB-08DA7239C21B', N'2022-07-30 23:06:23.3946434', N'2022-07-30 23:06:23.3946424', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'57', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'17AFEDBD-FFDB-4F07-CFFC-08DA7239C21B', N'2022-07-30 23:06:25.6732810', N'2022-07-30 23:06:25.6732801', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'43', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8124AEEE-F048-46C3-CFFD-08DA7239C21B', N'2022-07-30 23:09:02.1070777', N'2022-07-30 23:09:02.1070770', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'44', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E3C59764-63EA-4806-CFFE-08DA7239C21B', N'2022-07-30 23:09:03.2789125', N'2022-07-30 23:09:03.2789116', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'139', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'585BB3C1-23D8-4D73-CFFF-08DA7239C21B', N'2022-07-30 23:09:04.9940246', N'2022-07-30 23:09:04.9940238', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'30', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'EC86E5A2-F8F1-4E43-D000-08DA7239C21B', N'2022-07-30 23:10:19.6810913', N'2022-07-30 23:10:19.6810903', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'147', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7D7D20BA-D06E-4DC2-D001-08DA7239C21B', N'2022-07-30 23:10:20.8493489', N'2022-07-30 23:10:20.8493480', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'85', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F45E8567-8CC0-4B54-D002-08DA7239C21B', N'2022-07-30 23:10:23.1910268', N'2022-07-30 23:10:23.1910260', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'40', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'BA269FEF-B35D-49D2-D003-08DA7239C21B', N'2022-07-30 23:10:40.6869426', N'2022-07-30 23:10:40.6869420', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'41', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1764C879-F5AF-4307-D004-08DA7239C21B', N'2022-07-30 23:10:41.4927684', N'2022-07-30 23:10:41.4927678', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'65', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E05E2C46-BDD3-488E-D005-08DA7239C21B', N'2022-07-30 23:10:42.7911596', N'2022-07-30 23:10:42.7911589', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'45', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D7DA4507-AFD9-48B0-D006-08DA7239C21B', N'2022-07-30 23:12:00.3234644', N'2022-07-30 23:12:00.3234637', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'59', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3A81219B-8FB7-4BD8-D007-08DA7239C21B', N'2022-07-30 23:12:01.4022669', N'2022-07-30 23:12:01.4022657', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'103', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'34F4D8BF-6E4F-4C57-D008-08DA7239C21B', N'2022-07-30 23:12:02.5627241', N'2022-07-30 23:12:02.5627231', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'67', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'6CF19790-8AB1-40B1-D009-08DA7239C21B', N'2022-07-30 23:12:22.9988459', N'2022-07-30 23:12:22.9988451', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'59', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'961926EF-568E-43DC-D00A-08DA7239C21B', N'2022-07-30 23:12:24.0314225', N'2022-07-30 23:12:24.0314218', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'63', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9485850F-DA63-4C10-D00B-08DA7239C21B', N'2022-07-30 23:12:25.0022765', N'2022-07-30 23:12:25.0022758', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'45', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'299D5B96-2102-47EF-D00C-08DA7239C21B', N'2022-07-30 23:12:52.4138888', N'2022-07-30 23:12:52.4138881', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'44', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F45838E9-E214-4C9E-D00D-08DA7239C21B', N'2022-07-30 23:12:53.6087975', N'2022-07-30 23:12:53.6087969', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'81', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'12E808C4-A4DA-4598-D00E-08DA7239C21B', N'2022-07-30 23:12:54.4956019', N'2022-07-30 23:12:54.4956011', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'41', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'657A3F4D-D1E7-4D3E-D00F-08DA7239C21B', N'2022-07-30 23:13:34.7017051', N'2022-07-30 23:13:34.7017043', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'103', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'6482EB8C-3DD2-4C70-D010-08DA7239C21B', N'2022-07-30 23:13:35.5079996', N'2022-07-30 23:13:35.5079987', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'63', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'32061F2B-3E9E-4EE4-D011-08DA7239C21B', N'2022-07-30 23:13:36.7090200', N'2022-07-30 23:13:36.7090194', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'40', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'DB55ED15-E0F1-4B3C-D012-08DA7239C21B', N'2022-07-30 23:14:24.2967841', N'2022-07-30 23:14:24.2967830', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'68', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0AFE858A-55A1-458E-D013-08DA7239C21B', N'2022-07-30 23:14:25.2577715', N'2022-07-30 23:14:25.2577706', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'61', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8476EFFF-F6DB-46C5-D014-08DA7239C21B', N'2022-07-30 23:14:27.1727021', N'2022-07-30 23:14:27.1727013', NULL, NULL, N'/api/admin/Member/findForm', N'0.0.0.1', N'', N'', N'', N'100', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2B102D58-8F6A-4D91-D015-08DA7239C21B', N'2022-07-30 23:14:30.2783163', N'2022-07-30 23:14:30.2783158', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'46', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F41E33AE-A243-4488-D016-08DA7239C21B', N'2022-07-30 23:14:45.1595775', N'2022-07-30 23:14:45.1595770', NULL, NULL, N'/api/upload/uploadFile', N'0.0.0.1', N'{}', N'------WebKitFormBoundary4tAGZcS0n3TBgkIe
Content-Disposition: form-data; name="file"; filename="QQ图片20220723232748.png"
Content-Type: image/png

�PNG

', N'', N'135', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'23E5C994-3953-49CB-D017-08DA7239C21B', N'2022-07-30 23:14:47.6622512', N'2022-07-30 23:14:47.6622502', NULL, NULL, N'/api/admin/Member/update', N'0.0.0.1', N'', N'{"number":"1","name":"测试会员","phone":"18510912123","sex":"男","birthday":"2019-07-08 11:47:24","photo":"[null]","introduce":"<p>999888</p>","filePath":"[{\"uid\":\"8fac267b-f40e-40ab-95af-eb96b00664fa\",\"name\":\"time_231445_old_name_QQ图片20220723232748.png\",\"percent\":100,\"status\":\"done\",\"thumbUrl\":\"/upload/files/20220730/time_231445_old_name_QQ图片20220723232748.png\",\"url\":\"http://localhost:5600/upload/files/20220730/time_231445_old_name_QQ图片20220723232748.png\"}]","userId":"ac18f496-e93d-42f0-b59e-e321acc85335","id":"9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e","lastModificationTime":"2022-07-30 22:54:18","creationTime":"2018-04-25 23:00:00"}', N'', N'49', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'编辑表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'597A013D-9634-4786-D018-08DA7239C21B', N'2022-07-30 23:14:47.8932586', N'2022-07-30 23:14:47.8932577', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'70', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'6F279942-6F0D-4304-D019-08DA7239C21B', N'2022-07-30 23:14:49.3524911', N'2022-07-30 23:14:49.3524905', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'32', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'54DF7D20-714B-4AF2-D01A-08DA7239C21B', N'2022-07-30 23:16:33.7483142', N'2022-07-30 23:16:33.7483133', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'118', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'EB532EFD-51C0-4374-D01B-08DA7239C21B', N'2022-07-30 23:16:34.6479883', N'2022-07-30 23:16:34.6479875', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'60', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'AD664750-1D5D-4FE4-D01C-08DA7239C21B', N'2022-07-30 23:16:34.7738675', N'2022-07-30 23:16:34.7738668', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'4', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F51E2223-B3C2-4416-D01D-08DA7239C21B', N'2022-07-30 23:16:36.3597205', N'2022-07-30 23:16:36.3597197', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'36', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'75B713ED-3329-406B-D01E-08DA7239C21B', N'2022-07-30 23:17:26.3956461', N'2022-07-30 23:17:26.3956451', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'104', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F4EE0176-3AC4-4118-D01F-08DA7239C21B', N'2022-07-30 23:17:27.2237720', N'2022-07-30 23:17:27.2237713', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'85', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'AED48BB9-F200-4BCE-D020-08DA7239C21B', N'2022-07-30 23:17:27.3365197', N'2022-07-30 23:17:27.3365182', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'3', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'ED5A2ACE-E808-44BC-D021-08DA7239C21B', N'2022-07-30 23:17:28.3910123', N'2022-07-30 23:17:28.3910117', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'50', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1C7BE8DC-AE13-49E9-D022-08DA7239C21B', N'2022-07-30 23:17:31.4838638', N'2022-07-30 23:17:31.4838632', NULL, NULL, N'/api/upload/uploadFile', N'0.0.0.1', N'{}', N'------WebKitFormBoundaryBkLVTTx1xZcbctR2
Content-Disposition: form-data; name="file"; filename="HZY.IOT.png"
Content-Type: image/png

�PNG

', N'', N'37', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'53E9796B-1274-4AD9-D023-08DA7239C21B', N'2022-07-30 23:17:34.2764148', N'2022-07-30 23:17:34.2764142', NULL, NULL, N'/api/admin/Member/update', N'0.0.0.1', N'', N'{"number":"1","name":"测试会员","phone":"18510912123","sex":"男","birthday":"2019-07-08 11:47:24","photo":"[{\"uid\":\"63ab2dc5-9677-47d2-975a-4145fe7f45d9\",\"name\":\"time_231731_old_name_HZY.IOT.png\",\"percent\":100,\"status\":\"done\",\"thumbUrl\":\"/upload/files/20220730/time_231731_old_name_HZY.IOT.png\",\"url\":\"http://localhost:5600/upload/files/20220730/time_231731_old_name_HZY.IOT.png\"}]","introduce":"<p>999888</p>","filePath":"[{\"uid\":\"8fac267b-f40e-40ab-95af-eb96b00664fa\",\"name\":\"time_231445_old_name_QQ图片20220723232748.png\",\"percent\":100,\"status\":\"done\",\"thumbUrl\":\"/upload/files/20220730/time_231445_old_name_QQ图片20220723232748.png\",\"url\":\"http://localhost:5600/upload/files/20220730/time_231445_old_name_QQ图片20220723232748.png\"}]","userId":"ac18f496-e93d-42f0-b59e-e321acc85335","id":"9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e","lastModificationTime":"2022-07-30 23:14:47","creationTime":"2018-04-25 23:00:00"}', N'', N'43', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'编辑表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8481A85D-8A21-448E-D024-08DA7239C21B', N'2022-07-30 23:17:34.5009806', N'2022-07-30 23:17:34.5009799', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'86', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0C06C007-90DC-4B1D-D025-08DA7239C21B', N'2022-07-30 23:17:36.4848484', N'2022-07-30 23:17:36.4848476', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'73', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'41A96AA3-0B51-4370-D026-08DA7239C21B', N'2022-07-30 23:17:52.4874384', N'2022-07-30 23:17:52.4874377', NULL, NULL, N'/favicon.ico', N'0.0.0.1', N'', N'', N'', N'0', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'DCC23A13-14D9-40E1-D027-08DA7239C21B', N'2022-07-30 23:18:01.8859896', N'2022-07-30 23:18:01.8859887', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'35', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8DB17472-8E7C-4276-D028-08DA7239C21B', N'2022-07-30 23:18:02.4367221', N'2022-07-30 23:18:02.4367216', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'63', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E5CFA833-FD5A-4223-D029-08DA7239C21B', N'2022-07-30 23:18:03.2704072', N'2022-07-30 23:18:03.2704063', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'34', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9F6D19C2-28D2-4BDA-D02A-08DA7239C21B', N'2022-07-30 23:18:05.0972597', N'2022-07-30 23:18:05.0972592', NULL, NULL, N'/api/admin/Member/update', N'0.0.0.1', N'', N'{"number":"1","name":"测试会员","phone":"18510912123","sex":"男","birthday":"2019-07-08 11:47:24","photo":"[{\"uid\":\"63ab2dc5-9677-47d2-975a-4145fe7f45d9\",\"name\":\"time_231731_old_name_HZY.IOT.png\",\"percent\":100,\"status\":\"done\",\"thumbUrl\":\"/upload/files/20220730/time_231731_old_name_HZY.IOT.png\",\"url\":\"http://localhost:5600/upload/files/20220730/time_231731_old_name_HZY.IOT.png\"}]","introduce":"<p>999888</p>","filePath":"[{\"uid\":\"8fac267b-f40e-40ab-95af-eb96b00664fa\",\"name\":\"time_231445_old_name_QQ图片20220723232748.png\",\"percent\":100,\"status\":\"done\",\"thumbUrl\":\"/upload/files/20220730/time_231445_old_name_QQ图片20220723232748.png\",\"url\":\"http://localhost:5600/upload/files/20220730/time_231445_old_name_QQ图片20220723232748.png\"}]","userId":"ac18f496-e93d-42f0-b59e-e321acc85335","id":"9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e","lastModificationTime":"2022-07-30 23:17:34","creationTime":"2018-04-25 23:00:00"}', N'', N'38', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'编辑表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B83FEFD2-5338-42A0-D02B-08DA7239C21B', N'2022-07-30 23:18:05.2786682', N'2022-07-30 23:18:05.2786676', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'75', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'20E01D27-2510-4988-D02C-08DA7239C21B', N'2022-07-30 23:18:06.5798034', N'2022-07-30 23:18:06.5798027', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'35', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'82572D06-3C84-4CC8-D02D-08DA7239C21B', N'2022-07-30 23:18:36.5616216', N'2022-07-30 23:18:36.5616210', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'26', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E3CAB371-4B0B-4F20-D02E-08DA7239C21B', N'2022-07-30 23:18:37.1148462', N'2022-07-30 23:18:37.1148456', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'69', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B056BE5C-FD7B-4D35-D02F-08DA7239C21B', N'2022-07-30 23:18:38.5831779', N'2022-07-30 23:18:38.5831772', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'48', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'BA119A0F-3FC3-46EE-D030-08DA7239C21B', N'2022-07-30 23:21:41.0194152', N'2022-07-30 23:21:41.0194139', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'53', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C8DC3D44-3F06-4435-D031-08DA7239C21B', N'2022-07-30 23:21:41.6125343', N'2022-07-30 23:21:41.6125336', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'75', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C8CA7C5B-7A81-4066-D032-08DA7239C21B', N'2022-07-30 23:21:42.8335553', N'2022-07-30 23:21:42.8335547', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'30', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'87ECE65E-25E5-40F2-D033-08DA7239C21B', N'2022-07-30 23:22:28.3530006', N'2022-07-30 23:22:28.3529999', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'42', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'72614B2A-1CE1-48AE-D034-08DA7239C21B', N'2022-07-30 23:22:29.0004364', N'2022-07-30 23:22:29.0004356', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'75', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'480203EF-AA07-44D2-D035-08DA7239C21B', N'2022-07-30 23:22:30.4581392', N'2022-07-30 23:22:30.4581385', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'36', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'36C99884-EA29-48DE-D036-08DA7239C21B', N'2022-07-30 23:25:02.1530087', N'2022-07-30 23:25:02.1530079', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'89', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B3D51346-618F-41F6-D037-08DA7239C21B', N'2022-07-30 23:25:03.4225558', N'2022-07-30 23:25:03.4225554', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'51', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'16222718-51F3-4DAB-D038-08DA7239C21B', N'2022-07-30 23:25:08.8012105', N'2022-07-30 23:25:08.8012097', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'51', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'DC0AFCF5-2EBA-44F7-D039-08DA7239C21B', N'2022-07-30 23:25:27.2172996', N'2022-07-30 23:25:27.2172988', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'60', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E3A89784-5049-45E2-D03A-08DA7239C21B', N'2022-07-30 23:25:32.7062689', N'2022-07-30 23:25:32.7062683', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'125', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2EF34A61-3DCF-4670-D03B-08DA7239C21B', N'2022-07-30 23:25:36.3637227', N'2022-07-30 23:25:36.3637223', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'45', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D90C6117-4DE0-41D9-D03C-08DA7239C21B', N'2022-07-30 23:25:43.8747071', N'2022-07-30 23:25:43.8747065', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'57', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'065683D5-854A-46E5-D03D-08DA7239C21B', N'2022-07-30 23:25:50.0016153', N'2022-07-30 23:25:50.0016147', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'45', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'CD060AE3-4D4E-4BD1-D03E-08DA7239C21B', N'2022-07-30 23:26:12.9460708', N'2022-07-30 23:26:12.9460704', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'81', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E5FA7E39-D248-4D5C-D03F-08DA7239C21B', N'2022-07-30 23:26:13.5665060', N'2022-07-30 23:26:13.5665039', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'100', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3842AE7D-1093-49A0-D040-08DA7239C21B', N'2022-07-30 23:26:13.6732550', N'2022-07-30 23:26:13.6732545', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'2', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'725A9AFF-42BC-4723-D041-08DA7239C21B', N'2022-07-30 23:26:16.1449848', N'2022-07-30 23:26:16.1449842', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'48', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'FDABB8FC-6A87-4A1F-D042-08DA7239C21B', N'2022-07-30 23:26:18.5765004', N'2022-07-30 23:26:18.5764998', NULL, NULL, N'/api/admin/Member/findForm/96a1aa3d-a61a-42d0-954a-c71753fb2065', N'0.0.0.1', N'', N'', N'', N'34', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'00CE91E6-D69E-492A-D043-08DA7239C21B', N'2022-07-30 23:26:21.9914268', N'2022-07-30 23:26:21.9914260', NULL, NULL, N'/api/admin/Member/findForm/96a1aa3d-a61a-42d0-954a-c71753fb2065', N'0.0.0.1', N'', N'', N'', N'52', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'906B366F-4354-402A-D044-08DA7239C21B', N'2022-07-30 23:28:45.9217271', N'2022-07-30 23:28:45.9217265', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'52', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7B1A4177-1EF1-4AF1-D045-08DA7239C21B', N'2022-07-30 23:28:46.5384085', N'2022-07-30 23:28:46.5384079', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'115', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'ACFAFAFD-A977-453F-D046-08DA7239C21B', N'2022-07-30 23:28:46.6634952', N'2022-07-30 23:28:46.6634943', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'3', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'23F7062C-595A-4B1A-D047-08DA7239C21B', N'2022-07-30 23:28:47.8806332', N'2022-07-30 23:28:47.8806324', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'36', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'6D72766F-0283-4633-D048-08DA7239C21B', N'2022-07-30 23:28:49.4546065', N'2022-07-30 23:28:49.4546058', NULL, NULL, N'/api/admin/Member/findForm/96a1aa3d-a61a-42d0-954a-c71753fb2065', N'0.0.0.1', N'', N'', N'', N'30', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'75135ED7-5C49-4D9B-D049-08DA7239C21B', N'2022-07-30 23:29:22.3867133', N'2022-07-30 23:29:22.3867127', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'29', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'141DA8EB-3C20-4398-D04A-08DA7239C21B', N'2022-07-30 23:29:23.0263059', N'2022-07-30 23:29:23.0263053', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'67', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D50C031A-8340-46D0-D04B-08DA7239C21B', N'2022-07-30 23:29:23.1531981', N'2022-07-30 23:29:23.1531975', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'3', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2DD8D4AF-E6CF-4DEC-D04C-08DA7239C21B', N'2022-07-30 23:29:24.0015733', N'2022-07-30 23:29:24.0015726', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'43', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1C6E878E-7DE0-4BA6-D04D-08DA7239C21B', N'2022-07-30 23:29:25.7053963', N'2022-07-30 23:29:25.7053955', NULL, NULL, N'/api/admin/Member/findForm/96a1aa3d-a61a-42d0-954a-c71753fb2065', N'0.0.0.1', N'', N'', N'', N'37', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'01EF46A7-EE9A-47A0-D04E-08DA7239C21B', N'2022-07-30 23:29:28.2656058', N'2022-07-30 23:29:28.2656052', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'31', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2469274C-BCC0-478C-D04F-08DA7239C21B', N'2022-07-30 23:29:29.5195731', N'2022-07-30 23:29:29.5195725', NULL, NULL, N'/api/admin/Member/findForm/96a1aa3d-a61a-42d0-954a-c71753fb2065', N'0.0.0.1', N'', N'', N'', N'37', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E32E483A-F80E-4435-D050-08DA7239C21B', N'2022-07-30 23:29:34.6263157', N'2022-07-30 23:29:34.6263151', NULL, NULL, N'/api/admin/Member/findForm/96a1aa3d-a61a-42d0-954a-c71753fb2065', N'0.0.0.1', N'', N'', N'', N'32', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9DB6F11D-1DB0-42BC-D051-08DA7239C21B', N'2022-07-30 23:29:36.3427739', N'2022-07-30 23:29:36.3427731', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'49', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8DEF34DF-89EF-4861-D052-08DA7239C21B', N'2022-07-30 23:30:09.7735262', N'2022-07-30 23:30:09.7735255', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'53', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3BAF2FB5-E154-4675-D053-08DA7239C21B', N'2022-07-30 23:30:11.8332743', N'2022-07-30 23:30:11.8332738', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'42', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'582E5D23-90FE-4CE2-D054-08DA7239C21B', N'2022-07-30 23:30:11.9534389', N'2022-07-30 23:30:11.9534384', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'3', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'32162BD1-F5A1-49D1-D055-08DA7239C21B', N'2022-07-30 23:30:22.1836001', N'2022-07-30 23:30:22.1835995', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'75', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'738694CF-4949-4753-D056-08DA7239C21B', N'2022-07-30 23:30:22.2587234', N'2022-07-30 23:30:22.2587229', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'3', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F4B53E23-A7BA-4CA0-D057-08DA7239C21B', N'2022-07-30 23:30:26.4563029', N'2022-07-30 23:30:26.4563025', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'49', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'90F0321C-0DBB-4C06-D058-08DA7239C21B', N'2022-07-30 23:30:26.5223334', N'2022-07-30 23:30:26.5223328', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'2', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A7B06CEE-FFD6-48C7-D059-08DA7239C21B', N'2022-07-30 23:30:36.0606801', N'2022-07-30 23:30:36.0606788', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'47', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A14DD54C-F0AB-4D40-D05A-08DA7239C21B', N'2022-07-30 23:30:36.1408029', N'2022-07-30 23:30:36.1408024', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'5', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'CEE1D751-C734-4D91-D05B-08DA7239C21B', N'2022-07-30 23:30:38.7002961', N'2022-07-30 23:30:38.7002956', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'68', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D1F05DA4-EF86-4ACE-D05C-08DA7239C21B', N'2022-07-30 23:30:38.7728838', N'2022-07-30 23:30:38.7728832', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'3', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'4F4C02DD-2B54-4D70-D05D-08DA7239C21B', N'2022-07-30 23:30:42.5479571', N'2022-07-30 23:30:42.5479565', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'45', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F18017E7-3739-4E46-D05E-08DA7239C21B', N'2022-07-30 23:30:42.6090238', N'2022-07-30 23:30:42.6090227', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'2', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5B59D622-3A22-454B-D05F-08DA7239C21B', N'2022-07-30 23:30:48.5428290', N'2022-07-30 23:30:48.5428283', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'66', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0254EF9A-62A4-48D2-D060-08DA7239C21B', N'2022-07-30 23:30:48.6223940', N'2022-07-30 23:30:48.6223934', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'3', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D02154B3-252D-4DCD-D061-08DA7239C21B', N'2022-07-30 23:30:50.1985790', N'2022-07-30 23:30:50.1985598', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'53', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8A59F910-F038-40A3-D062-08DA7239C21B', N'2022-07-30 23:30:50.2581380', N'2022-07-30 23:30:50.2581373', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'2', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F2518BDC-436B-4439-D063-08DA7239C21B', N'2022-07-30 23:30:56.1377262', N'2022-07-30 23:30:56.1377253', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'53', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'688C8478-34CE-4C4B-D064-08DA7239C21B', N'2022-07-30 23:30:58.6209450', N'2022-07-30 23:30:58.6209442', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'71', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'BA23CEB1-B554-42C7-D065-08DA7239C21B', N'2022-07-30 23:31:05.1619523', N'2022-07-30 23:31:05.1619517', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'26', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7F02791F-2CCA-4CEA-D066-08DA7239C21B', N'2022-07-30 23:31:06.0823657', N'2022-07-30 23:31:06.0823647', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'84', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F74F263D-86B4-4DD0-D067-08DA7239C21B', N'2022-07-30 23:31:29.2318029', N'2022-07-30 23:31:29.2318022', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'71', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3FBC569B-EA47-4B24-D068-08DA7239C21B', N'2022-07-30 23:32:15.1281195', N'2022-07-30 23:32:15.1281189', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'69', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5230E033-DC99-44F4-D069-08DA7239C21B', N'2022-07-30 23:32:29.0341920', N'2022-07-30 23:32:29.0341913', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'36', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D79F7F6D-0AFF-4AE2-D06A-08DA7239C21B', N'2022-07-30 23:32:29.8221181', N'2022-07-30 23:32:29.8221173', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'77', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'6A80D179-9AE3-48A5-D06B-08DA7239C21B', N'2022-07-30 23:32:31.7723609', N'2022-07-30 23:32:31.7723598', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'44', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A1A65C0B-581C-438F-7862-08DA72411B6A', N'2022-07-30 23:35:18.5896866', N'2022-07-30 23:35:18.5896850', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'4', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2326874B-4BBE-40AA-7863-08DA72411B6A', N'2022-07-30 23:35:20.0684693', N'2022-07-30 23:35:20.0684683', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'469', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'958F43A4-2313-44C6-7864-08DA72411B6A', N'2022-07-30 23:36:25.5126167', N'2022-07-30 23:36:25.5126160', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'120', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D9D9E093-E65F-41D1-7865-08DA72411B6A', N'2022-07-30 23:36:26.7039547', N'2022-07-30 23:36:26.7039542', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'434', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'39787313-5FE6-4BEF-7866-08DA72411B6A', N'2022-07-30 23:36:28.3932580', N'2022-07-30 23:36:28.3932573', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'110', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E288BBE8-73FE-461C-7867-08DA72411B6A', N'2022-07-30 23:36:32.3540490', N'2022-07-30 23:36:32.3540484', NULL, NULL, N'/api/upload/uploadFile', N'0.0.0.1', N'{}', N'------WebKitFormBoundary6s6wDaYtBI6Jl2rv
Content-Disposition: form-data; name="file"; filename="HZY.IOT.png"
Content-Type: image/png

�PNG

', N'', N'80', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'844ED551-0D12-4A40-7868-08DA72411B6A', N'2022-07-30 23:36:34.8105349', N'2022-07-30 23:36:34.8105344', NULL, NULL, N'/api/admin/Member/update', N'0.0.0.1', N'', N'{"number":"1","name":"测试会员","phone":"18510912123","sex":"男","birthday":"2019-07-08 11:47:24","photo":"[{\"uid\":\"6663eb95-ac2b-4b0a-a788-a42b503b5d7d\",\"name\":\"time_233632_old_name_HZY.IOT.png\",\"percent\":100,\"status\":\"done\",\"thumbUrl\":\"/upload/files/20220730/time_233632_old_name_HZY.IOT.png\",\"url\":\"/upload/files/20220730/time_233632_old_name_HZY.IOT.png\"}]","introduce":"<p>999888</p>","filePath":"","userId":"ac18f496-e93d-42f0-b59e-e321acc85335","id":"9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e","lastModificationTime":"2022-07-30 23:18:05","creationTime":"2018-04-25 23:00:00"}', N'', N'105', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'编辑表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'051CAA5B-A0CE-4CBD-7869-08DA72411B6A', N'2022-07-30 23:36:35.0519064', N'2022-07-30 23:36:35.0519058', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'93', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8C9D08D7-7AA2-4CC1-786A-08DA72411B6A', N'2022-07-30 23:36:39.4314401', N'2022-07-30 23:36:39.4314393', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'37', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'06406DFB-006D-4E13-786B-08DA72411B6A', N'2022-07-30 23:37:02.0801124', N'2022-07-30 23:37:02.0801118', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'73', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A0D0065D-5515-4CA0-786C-08DA72411B6A', N'2022-07-30 23:37:04.0069489', N'2022-07-30 23:37:04.0069483', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'44', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2A5926CC-F108-47E9-786D-08DA72411B6A', N'2022-07-30 23:37:04.8700142', N'2022-07-30 23:37:04.8700125', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'84', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F6030C05-B5CB-46D5-786E-08DA72411B6A', N'2022-07-30 23:37:19.0577888', N'2022-07-30 23:37:19.0577876', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'63', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C987F976-2AC1-4945-786F-08DA72411B6A', N'2022-07-30 23:37:21.9772266', N'2022-07-30 23:37:21.9772259', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'28', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2C7179A4-C343-4C9A-7870-08DA72411B6A', N'2022-07-30 23:37:22.9305327', N'2022-07-30 23:37:22.9305317', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'83', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C0DDBE5F-5B99-4999-7871-08DA72411B6A', N'2022-07-30 23:37:24.7546740', N'2022-07-30 23:37:24.7546733', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'151', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3F9860E7-873C-44D2-DCBE-08DA7242215D', N'2022-07-30 23:42:38.1531186', N'2022-07-30 23:42:38.1531177', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'5', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2FC9360A-0097-49AD-DCBF-08DA7242215D', N'2022-07-30 23:42:59.7434911', N'2022-07-30 23:42:59.7434902', NULL, NULL, N'/api/account/check', N'0.0.0.1', N'', N'{"userName":"admin","userPassword":"123456"}', N'', N'960', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'842A1B8D-B653-4820-DCC0-08DA7242215D', N'2022-07-30 23:43:00.5458092', N'2022-07-30 23:43:00.5458077', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'402', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F86696A1-CD61-44E9-DCC1-08DA7242215D', N'2022-07-30 23:43:02.9288104', N'2022-07-30 23:43:02.9288095', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'37', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C9D246DE-AE86-4398-DCC2-08DA7242215D', N'2022-07-30 23:43:07.9219908', N'2022-07-30 23:43:07.9219900', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'454', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F3FAC695-1E35-4417-DCC3-08DA7242215D', N'2022-07-30 23:43:09.8906791', N'2022-07-30 23:43:09.8906784', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'109', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1BB9E292-0D8E-4947-DCC4-08DA7242215D', N'2022-07-30 23:43:14.8379411', N'2022-07-30 23:43:14.8379406', NULL, NULL, N'/api/upload/uploadFile', N'0.0.0.1', N'{}', N'------WebKitFormBoundaryGoHcIWfB2FzMTjyF
Content-Disposition: form-data; name="file"; filename="QQ图片20220723232748.png"
Content-Type: image/png

�PNG

', N'', N'313', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E261DE02-061B-491F-DCC5-08DA7242215D', N'2022-07-30 23:43:17.5065661', N'2022-07-30 23:43:17.5065655', NULL, NULL, N'/api/admin/Member/update', N'0.0.0.1', N'', N'{"number":"1","name":"测试会员","phone":"18510912123","sex":"男","birthday":"2019-07-08 11:47:24","photo":"[{\"uid\":\"6663eb95-ac2b-4b0a-a788-a42b503b5d7d\",\"name\":\"time_233632_old_name_HZY.IOT.png\",\"percent\":100,\"status\":\"done\",\"thumbUrl\":\"/upload/files/20220730/time_233632_old_name_HZY.IOT.png\",\"url\":\"/upload/files/20220730/time_233632_old_name_HZY.IOT.png\"}]","introduce":"<p>999888</p>","filePath":"[{\"uid\":\"aa5ffa41-e397-4c8f-b770-3f09e1a051be\",\"name\":\"time_234314_old_name_QQ图片20220723232748.png\",\"percent\":100,\"status\":\"done\",\"thumbUrl\":\"/upload/files/20220730/time_234314_old_name_QQ图片20220723232748.png\",\"url\":\"/upload/files/20220730/time_234314_old_name_QQ图片20220723232748.png\"}]","userId":"ac18f496-e93d-42f0-b59e-e321acc85335","id":"9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e","lastModificationTime":"2022-07-30 23:36:34","creationTime":"2018-04-25 23:00:00"}', N'', N'146', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'编辑表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'DAFEE660-F783-48C5-DCC6-08DA7242215D', N'2022-07-30 23:43:17.7347741', N'2022-07-30 23:43:17.7347733', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'77', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'CF56409D-2E3A-42CA-DCC7-08DA7242215D', N'2022-07-30 23:43:19.3410556', N'2022-07-30 23:43:19.3410549', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'97', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F2925352-223E-4C9E-DCC8-08DA7242215D', N'2022-07-30 23:44:14.8520982', N'2022-07-30 23:44:14.8520975', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'180', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C1E4B2FD-756D-4653-DCC9-08DA7242215D', N'2022-07-30 23:45:30.0144654', N'2022-07-30 23:45:30.0144645', NULL, NULL, N'/api/admin/SysOrganization/sysOrganizationTree', N'0.0.0.1', N'', N'{}', N'', N'144', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'组织机构', N'查看组织架构树')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9D04AF15-4C77-4DCE-DCCA-08DA7242215D', N'2022-07-30 23:45:30.4247328', N'2022-07-30 23:45:30.4247323', NULL, NULL, N'/api/admin/SysUser/findList/10/1', N'0.0.0.1', N'', N'{"name":null,"loginName":null,"organizationId":null}', N'', N'255', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查看数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F0CA9627-609D-48AF-DCCB-08DA7242215D', N'2022-07-30 23:46:55.4147090', N'2022-07-30 23:46:55.4147083', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'89', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7CCCDC52-B8C1-436F-DCCC-08DA7242215D', N'2022-07-30 23:46:56.4282720', N'2022-07-30 23:46:56.4282713', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'172', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'825D8438-0D41-4681-DCCD-08DA7242215D', N'2022-07-30 23:46:57.5239234', N'2022-07-30 23:46:57.5239225', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'63', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A8C3690F-7009-4F66-DCCE-08DA7242215D', N'2022-07-30 23:47:04.4651386', N'2022-07-30 23:47:04.4651379', NULL, NULL, N'/api/upload/uploadFile', N'0.0.0.1', N'{}', N'------WebKitFormBoundary7pzTR9SlU1Xb3KwJ
Content-Disposition: form-data; name="file"; filename="成都3D大屏展示数据.txt"
Content-Type: text/plain

1、库存：(商业库存总量，品规数)、（工商共库总量，品规数)
2、分拣：当天总量，下发标准烟总量，异形总量、所有线分拣总量
3、配送：（送货总量，户数总量），（已配送和未配送总量，户数总量） 
4、工业车辆：来货总量、来货货车总数

	库存单位：箱
	分拣单位：箱
	配送单位：送货：条   户数：户
	车辆单位：车辆：量   来货：

1、分拣总量		V
2、配送任务总量		V
3、园区内车辆总数		目前无法提供
4、在岗人员数量		V
5、园区总用电量		X
6、当前已分拣量		X
7、当前已完成量		X
8、工业送货车辆数量		V
10、来访人员数量		V		
11、每小时用电量		目前无法提供
12、未分拣量		X
13、未完成量		X
14、总库存、和百分比	X
------WebKitFormBoundary7pzTR9SlU1Xb3KwJ--
', N'', N'49', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'24DF3C43-3D66-4F5E-DCCF-08DA7242215D', N'2022-07-30 23:49:11.5281773', N'2022-07-30 23:49:11.5281761', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'107', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E6BB4CBA-A6CF-4F51-DCD0-08DA7242215D', N'2022-07-30 23:49:12.5717490', N'2022-07-30 23:49:12.5717479', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'95', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9EAA7E10-BF53-47EA-DCD1-08DA7242215D', N'2022-07-30 23:49:13.8324616', N'2022-07-30 23:49:13.8324607', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'135', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D2A09194-BC5B-44C4-DCD2-08DA7242215D', N'2022-07-30 23:49:17.7405574', N'2022-07-30 23:49:17.7405569', NULL, NULL, N'/api/upload/uploadFile', N'0.0.0.1', N'{}', N'------WebKitFormBoundaryoUFdYMjUN6RVIsZm
Content-Disposition: form-data; name="file"; filename="React 项目搭建步骤.txt"
Content-Type: text/plain

1��ʹ�� create-react-app �React���ּ� �������£�

cnpm install -g create-react-app --����ȫ�ֵ�create-react-app ����
create-react-app my-app-name --����app 
cnpm run eject --�����ص�webpack �����ļ���ʾ����
cnpm start --����app

2������antd-mobile ��� �������£�
cnpm install antd-mobile --save
npm install babel-plugin-import --save-dev     --�Զ�����CSS��JS����������������antd-mobile������CSS�ļ�
��װ��Ϻ��ڸ�Ŀ¼�½��ļ�������: .babelrc �������£�
{
  "presets": [
    "react-app"
  ],
  "plugins": [
    [
      "import",
        {
          "libraryName": "antd-mobile",
          "style": "css"
        }
      ]
    ]
}


����ο���ַ��https://mobile.ant.design/docs/react/use-with-create-react-app-cn



react.js�������ڷ�4�����̣�

         1.�״���Ⱦ��

                 getDefaultProps

                 getInitialState

                 componentWillMount

                 render

                 componentDidMount

        2.������props�����仯

             componentWillReceiveProps

             shouldComponentUpdate

             componentWillUpdate

             render

             componentDidUpdate

        3. ��״̬state�����仯

            shouldComponentUpdate

            componentWillUpdate

            render

            componentDidUpdate

         4.����

             componentWillUnmount

����ֱ�ӿ�������£���Ҫ���������ÿ��������һ�����ͣ��ͻ��������׵������ˣ�

          getDefaultProps���������֮ǰ���ȵ��ã�ȫ����ֻ��һ����

          getInitialState����ʼ�����״̬

          componentWillMount�������Ⱦ֮ǰ���ã������������һ����Ĭ�����ԣ�Ĭ��״̬���������Ⱦ֮ǰ���߼�����

          render:��Ⱦ������˲���������һ������DOM�����ڴ���

          componentDidMount�������Ⱦ֮��Ĳ���������ҵ�񳡾�����������в����ڴ˺����д�������

          componentWillReceiveProps��������е�Ĭ������props�����˱仯���˷��������õ�

          shouldComponentUpdate��������յ��µ�props����state��ʱ����ã��˺�������ֵ������ԭ��������ṹ�Ƿ�������Ⱦ

          componentWillUpdate������ڶ�����Ⱦ֮ǰ����

          componentDidUpdate������ڶ�����Ⱦ֮�����

          componentWillUnmount���������ʱ����

��Щ����react.js�淶�õĲ������̣��������Ͽ��Կ�������"will"�ĺ���������render֮ǰ���ã�����"Did"������render֮����ã��и�����һ����ʽ���ڲ������UI����չҵ�񳡾������˺ܶࡣ��һ���ڴ���������ô��������������ڶ���ģ�
------WebKitFormBoundaryoUFdYMjUN6RVIsZm--
', N'', N'37', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'FEA1B276-03E2-4E94-DCD3-08DA7242215D', N'2022-07-30 23:49:51.7014257', N'2022-07-30 23:49:51.7014247', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'122', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'AF6DD92C-5781-4F9B-DCD4-08DA7242215D', N'2022-07-30 23:49:52.4571223', N'2022-07-30 23:49:52.4571215', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'66', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B1DBC6B9-00CF-47C9-DCD5-08DA7242215D', N'2022-07-30 23:49:53.8433474', N'2022-07-30 23:49:53.8433466', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'44', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B51910A0-2027-45B3-DCD6-08DA7242215D', N'2022-07-30 23:50:00.5953565', N'2022-07-30 23:50:00.5953555', NULL, NULL, N'/api/upload/uploadFile', N'0.0.0.1', N'{}', N'------WebKitFormBoundaryHQ1QGWhUrtmtY4gz
Content-Disposition: form-data; name="file"; filename="React 项目搭建步骤.txt"
Content-Type: text/plain

1��ʹ�� create-react-app �React���ּ� �������£�

cnpm install -g create-react-app --����ȫ�ֵ�create-react-app ����
create-react-app my-app-name --����app 
cnpm run eject --�����ص�webpack �����ļ���ʾ����
cnpm start --����app

2������antd-mobile ��� �������£�
cnpm install antd-mobile --save
npm install babel-plugin-import --save-dev     --�Զ�����CSS��JS����������������antd-mobile������CSS�ļ�
��װ��Ϻ��ڸ�Ŀ¼�½��ļ�������: .babelrc �������£�
{
  "presets": [
    "react-app"
  ],
  "plugins": [
    [
      "import",
        {
          "libraryName": "antd-mobile",
          "style": "css"
        }
      ]
    ]
}


����ο���ַ��https://mobile.ant.design/docs/react/use-with-create-react-app-cn



react.js�������ڷ�4�����̣�

         1.�״���Ⱦ��

                 getDefaultProps

                 getInitialState

                 componentWillMount

                 render

                 componentDidMount

        2.������props�����仯

             componentWillReceiveProps

             shouldComponentUpdate

             componentWillUpdate

             render

             componentDidUpdate

        3. ��״̬state�����仯

            shouldComponentUpdate

            componentWillUpdate

            render

            componentDidUpdate

         4.����

             componentWillUnmount

����ֱ�ӿ�������£���Ҫ���������ÿ��������һ�����ͣ��ͻ��������׵������ˣ�

          getDefaultProps���������֮ǰ���ȵ��ã�ȫ����ֻ��һ����

          getInitialState����ʼ�����״̬

          componentWillMount�������Ⱦ֮ǰ���ã������������һ����Ĭ�����ԣ�Ĭ��״̬���������Ⱦ֮ǰ���߼�����

          render:��Ⱦ������˲���������һ������DOM�����ڴ���

          componentDidMount�������Ⱦ֮��Ĳ���������ҵ�񳡾�����������в����ڴ˺����д�������

          componentWillReceiveProps��������е�Ĭ������props�����˱仯���˷��������õ�

          shouldComponentUpdate��������յ��µ�props����state��ʱ����ã��˺�������ֵ������ԭ��������ṹ�Ƿ�������Ⱦ

          componentWillUpdate������ڶ�����Ⱦ֮ǰ����

          componentDidUpdate������ڶ�����Ⱦ֮�����

          componentWillUnmount���������ʱ����

��Щ����react.js�淶�õĲ������̣��������Ͽ��Կ�������"will"�ĺ���������render֮ǰ���ã�����"Did"������render֮����ã��и�����һ����ʽ���ڲ������UI����չҵ�񳡾������˺ܶࡣ��һ���ڴ���������ô��������������ڶ���ģ�
------WebKitFormBoundaryHQ1QGWhUrtmtY4gz--
', N'', N'34', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2095B91D-00C8-4E0C-DCD7-08DA7242215D', N'2022-07-30 23:54:03.3575969', N'2022-07-30 23:54:03.3575960', NULL, NULL, N'/api/admin/Member/update', N'0.0.0.1', N'', N'{"number":"1","name":"测试会员","phone":"18510912123","sex":"男","birthday":"2019-07-08 11:47:24","photo":"[{\"uid\":\"6663eb95-ac2b-4b0a-a788-a42b503b5d7d\",\"name\":\"time_233632_old_name_HZY.IOT.png\",\"percent\":100,\"status\":\"done\",\"thumbUrl\":\"/upload/files/20220730/time_233632_old_name_HZY.IOT.png\",\"url\":\"/upload/files/20220730/time_233632_old_name_HZY.IOT.png\"}]","introduce":"<p>999888</p>","filePath":"[{\"uid\":\"9ddbaa46-b72c-4a55-abf0-91e6514bca25\",\"name\":\"time_235000_old_name_React 项目搭建步骤.txt\",\"percent\":100,\"status\":\"done\",\"thumbUrl\":\"/upload/files/20220730/time_235000_old_name_React 项目搭建步骤.txt\",\"url\":\"/upload/files/20220730/time_235000_old_name_React 项目搭建步骤.txt\"}]","userId":"ac18f496-e93d-42f0-b59e-e321acc85335","id":"9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e","lastModificationTime":"2022-07-30 23:43:17","creationTime":"2018-04-25 23:00:00"}', N'', N'98', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'编辑表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'FA11F963-0D91-4C77-DCD8-08DA7242215D', N'2022-07-30 23:54:03.5355638', N'2022-07-30 23:54:03.5355632', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'67', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D7F3F56C-52F9-4C5A-DCD9-08DA7242215D', N'2022-07-30 23:54:04.9934010', N'2022-07-30 23:54:04.9934004', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'36', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'77619C47-ADFE-4A95-DCDA-08DA7242215D', N'2022-07-30 23:55:37.7993873', N'2022-07-30 23:55:37.7993864', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'72', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'271D49AC-A89A-46CF-DCDB-08DA7242215D', N'2022-07-30 23:55:38.7253498', N'2022-07-30 23:55:38.7253491', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'78', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'206C10BD-3ED3-46C9-DCDC-08DA7242215D', N'2022-07-30 23:55:39.9828737', N'2022-07-30 23:55:39.9828725', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'52', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2FA840AF-D9B0-4CD8-DCDD-08DA7242215D', N'2022-07-30 23:55:44.5866136', N'2022-07-30 23:55:44.5866131', NULL, NULL, N'/api/upload/uploadFile', N'0.0.0.1', N'{}', N'------WebKitFormBoundaryMmyRXSrVU8A2yAhU
Content-Disposition: form-data; name="file"; filename="QQ图片20220723232748.png"
Content-Type: image/png

�PNG

', N'', N'123', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0F157DB7-B8D2-4311-DCDE-08DA7242215D', N'2022-07-30 23:55:45.9241057', N'2022-07-30 23:55:45.9241050', NULL, NULL, N'/api/admin/Member/update', N'0.0.0.1', N'', N'{"number":"1","name":"测试会员","phone":"18510912123","sex":"男","birthday":"2019-07-08 11:47:24","photo":"[{\"uid\":\"6663eb95-ac2b-4b0a-a788-a42b503b5d7d\",\"name\":\"time_233632_old_name_HZY.IOT.png\",\"percent\":100,\"status\":\"done\",\"thumbUrl\":\"/upload/files/20220730/time_233632_old_name_HZY.IOT.png\",\"url\":\"/upload/files/20220730/time_233632_old_name_HZY.IOT.png\"}]","introduce":"<p>999888</p>","filePath":"[{\"uid\":\"9ddbaa46-b72c-4a55-abf0-91e6514bca25\",\"name\":\"time_235000_old_name_React 项目搭建步骤.txt\",\"percent\":100,\"status\":\"done\",\"thumbUrl\":\"/upload/files/20220730/time_235000_old_name_React 项目搭建步骤.txt\",\"url\":\"/upload/files/20220730/time_235000_old_name_React 项目搭建步骤.txt\"},{\"uid\":\"0f11e9ac-a9ff-4ca9-a2ab-b11478f15d25\",\"name\":\"time_235544_old_name_QQ图片20220723232748.png\",\"percent\":100,\"status\":\"done\",\"thumbUrl\":\"/upload/files/20220730/time_235544_old_name_QQ图片20220723232748.png\",\"url\":\"/upload/files/20220730/time_235544_old_name_QQ图片20220723232748.png\"}]","userId":"ac18f496-e93d-42f0-b59e-e321acc85335","id":"9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e","lastModificationTime":"2022-07-30 23:54:03","creationTime":"2018-04-25 23:00:00"}', N'', N'37', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'编辑表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5FB28D98-2154-4A7A-DCDF-08DA7242215D', N'2022-07-30 23:55:46.1408188', N'2022-07-30 23:55:46.1408180', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'79', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F2DDBB8F-46DB-4467-DCE0-08DA7242215D', N'2022-07-30 23:55:47.3213902', N'2022-07-30 23:55:47.3213893', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'51', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'4EE1ECF0-48F9-458B-DCE1-08DA7242215D', N'2022-07-30 23:58:16.6573664', N'2022-07-30 23:58:16.6573657', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'107', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'186ABE80-4A83-427B-DCE2-08DA7242215D', N'2022-07-30 23:58:17.6213457', N'2022-07-30 23:58:17.6213450', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'85', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'360BC34A-4FD7-4E2A-DCE3-08DA7242215D', N'2022-07-30 23:58:19.1580259', N'2022-07-30 23:58:19.1580250', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'60', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'BBA7C9D3-20E0-4F39-DCE4-08DA7242215D', N'2022-07-30 23:58:31.3790139', N'2022-07-30 23:58:31.3790134', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'44', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'86A4FC27-C203-4C1D-DCE5-08DA7242215D', N'2022-07-30 23:58:32.0197784', N'2022-07-30 23:58:32.0197777', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'55', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'930ADD9B-7DB8-476D-DCE6-08DA7242215D', N'2022-07-30 23:59:26.4959671', N'2022-07-30 23:59:26.4959645', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'33', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'EFE877D1-D963-49BB-DCE7-08DA7242215D', N'2022-07-30 23:59:27.0658445', N'2022-07-30 23:59:27.0658439', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'101', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D5CA3E20-BD49-4538-DCE8-08DA7242215D', N'2022-07-30 23:59:33.9009381', N'2022-07-30 23:59:33.9009375', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'58', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'678BA65A-50BE-46C7-DCE9-08DA7242215D', N'2022-07-30 23:59:36.8642461', N'2022-07-30 23:59:36.8642455', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'30', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E69F3E48-AA9B-4202-DCEA-08DA7242215D', N'2022-07-30 23:59:37.4094159', N'2022-07-30 23:59:37.4094153', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'87', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2A81995E-30A2-4B4E-DCEB-08DA7242215D', N'2022-07-30 23:59:38.8531652', N'2022-07-30 23:59:38.8531644', NULL, NULL, N'/api/admin/Member/findForm/96a1aa3d-a61a-42d0-954a-c71753fb2065', N'0.0.0.1', N'', N'', N'', N'39', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'54064F8D-D2CB-491A-22B9-08DA72449FEF', N'2022-07-31 00:00:29.6333463', N'2022-07-31 00:00:29.6333449', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'6', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D3159EA0-8433-4C6F-22BA-08DA72449FEF', N'2022-07-31 00:00:31.2344371', N'2022-07-31 00:00:31.2344363', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'489', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C5DF6B4F-D695-4D49-22BB-08DA72449FEF', N'2022-07-31 00:00:38.1136599', N'2022-07-31 00:00:38.1136587', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'104', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'34C4326C-3A0A-40E4-22BC-08DA72449FEF', N'2022-07-31 00:00:39.0439346', N'2022-07-31 00:00:39.0439341', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'364', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'77A5364B-07AC-4EBD-22BD-08DA72449FEF', N'2022-07-31 00:00:39.1203114', N'2022-07-31 00:00:39.1203109', NULL, NULL, N'/upload/files/20220730/time_233632_old_name_HZY.IOT.png', N'0.0.0.1', N'', N'', N'', N'0', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'711783E5-559A-4487-22BE-08DA72449FEF', N'2022-07-31 00:00:40.8787199', N'2022-07-31 00:00:40.8787195', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'85', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'BF851BAF-356F-41FA-22BF-08DA72449FEF', N'2022-07-31 00:00:40.9648337', N'2022-07-31 00:00:40.9648330', NULL, NULL, N'/upload/files/20220730/time_233632_old_name_HZY.IOT.png', N'0.0.0.1', N'', N'', N'', N'0', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5C303E12-8E38-4C4E-22C0-08DA72449FEF', N'2022-07-31 00:01:00.2015181', N'2022-07-31 00:01:00.2015176', NULL, NULL, N'/api/upload/uploadFile', N'0.0.0.1', N'{}', N'------WebKitFormBoundaryP3LqoAVCJ37xA8Vl
Content-Disposition: form-data; name="file"; filename="微信图片_20200521081252.jpg"
Content-Type: image/jpeg

����', N'', N'71', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A168290F-E715-4389-22C1-08DA72449FEF', N'2022-07-31 00:01:12.4052374', N'2022-07-31 00:01:12.4052369', NULL, NULL, N'/api/upload/uploadFile', N'0.0.0.1', N'{}', N'------WebKitFormBoundaryT8z5CJUeBCACSALK
Content-Disposition: form-data; name="file"; filename="微信图片_20200521081252.jpg"
Content-Type: image/jpeg

����', N'', N'36', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'13D20AC9-2C63-4A65-22C2-08DA72449FEF', N'2022-07-31 00:02:01.2208195', N'2022-07-31 00:02:01.2208186', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'54', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'FB243949-DB00-40D4-22C3-08DA72449FEF', N'2022-07-31 00:02:02.2402340', N'2022-07-31 00:02:02.2402334', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'74', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B8832015-C3E5-4845-22C4-08DA72449FEF', N'2022-07-31 00:02:02.3516911', N'2022-07-31 00:02:02.3516905', NULL, NULL, N'/upload/files/20220730/time_233632_old_name_HZY.IOT.png', N'0.0.0.1', N'', N'', N'', N'0', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D705529B-A57A-4220-22C5-08DA72449FEF', N'2022-07-31 00:02:16.2547902', N'2022-07-31 00:02:16.2547897', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'45', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7B56C0F9-0DA8-4DC1-22C6-08DA72449FEF', N'2022-07-31 00:02:17.0415744', N'2022-07-31 00:02:17.0415737', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'81', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D064BA80-2495-4A88-22C7-08DA72449FEF', N'2022-07-31 00:02:17.2075019', N'2022-07-31 00:02:17.2075006', NULL, NULL, N'/upload/files/20220730/time_233632_old_name_HZY.IOT.png', N'0.0.0.1', N'', N'', N'', N'0', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0410B819-69A6-4B09-22C8-08DA72449FEF', N'2022-07-31 00:02:18.3278138', N'2022-07-31 00:02:18.3278129', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'71', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F0ED321F-1237-4CB2-22C9-08DA72449FEF', N'2022-07-31 00:02:22.3170298', N'2022-07-31 00:02:22.3170293', NULL, NULL, N'/api/upload/uploadFile', N'0.0.0.1', N'{}', N'------WebKitFormBoundaryCv3DitC3NRLApNfP
Content-Disposition: form-data; name="file"; filename="微信图片_20200521081252.jpg"
Content-Type: image/jpeg

����', N'', N'50', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'458403CE-F01A-42E4-22CA-08DA72449FEF', N'2022-07-31 00:02:28.2370517', N'2022-07-31 00:02:28.2370511', NULL, NULL, N'/api/admin/Member/update', N'0.0.0.1', N'', N'{"number":"1","name":"测试会员","phone":"18510912123","sex":"男","birthday":"2019-07-08 11:47:24","photo":"[{\"uid\":\"6f5aed63-0fdc-4752-9c2b-3f66cbfa77bf\",\"name\":\"time_000222_old_name_微信图片_20200521081252.jpg\",\"percent\":100,\"status\":\"done\",\"thumbUrl\":\"/upload/files/20220731/time_000222_old_name_微信图片_20200521081252.jpg\",\"url\":\"/upload/files/20220731/time_000222_old_name_微信图片_20200521081252.jpg\"}]","introduce":"<p>999888</p>","filePath":"[{\"uid\":\"9ddbaa46-b72c-4a55-abf0-91e6514bca25\",\"name\":\"time_235000_old_name_React 项目搭建步骤.txt\",\"percent\":100,\"status\":\"done\",\"thumbUrl\":\"/upload/files/20220730/time_235000_old_name_React 项目搭建步骤.txt\",\"url\":\"http://localhost:5600/upload/files/20220730/time_235000_old_name_React 项目搭建步骤.txt\"},{\"uid\":\"0f11e9ac-a9ff-4ca9-a2ab-b11478f15d25\",\"name\":\"time_235544_old_name_QQ图片20220723232748.png\",\"percent\":100,\"status\":\"done\",\"thumbUrl\":\"/upload/files/20220730/time_235544_old_name_QQ图片20220723232748.png\",\"url\":\"http://localhost:5600/upload/files/20220730/time_235544_old_name_QQ图片20220723232748.png\"}]","userId":"ac18f496-e93d-42f0-b59e-e321acc85335","id":"9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e","lastModificationTime":"2022-07-30 23:55:45","creationTime":"2018-04-25 23:00:00"}', N'', N'115', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'编辑表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3F694674-D3FF-419A-22CB-08DA72449FEF', N'2022-07-31 00:02:28.4673683', N'2022-07-31 00:02:28.4673676', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'91', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F43420A4-508A-4458-22CC-08DA72449FEF', N'2022-07-31 00:02:30.1206112', N'2022-07-31 00:02:30.1206105', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'62', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A3E3DCEF-EF0D-43CA-22CD-08DA72449FEF', N'2022-07-31 00:02:59.3922819', N'2022-07-31 00:02:59.3922810', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'112', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'4DA402CE-A1B6-4723-22CE-08DA72449FEF', N'2022-07-31 00:03:00.5549411', N'2022-07-31 00:03:00.5549404', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'70', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'67D43A2D-243A-4A13-22CF-08DA72449FEF', N'2022-07-31 00:03:01.7729125', N'2022-07-31 00:03:01.7729118', NULL, NULL, N'/api/admin/Member/findForm/9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e', N'0.0.0.1', N'', N'', N'', N'74', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'19BF9248-AD9A-4682-22D0-08DA72449FEF', N'2022-07-31 00:03:20.1005167', N'2022-07-31 00:03:20.1005161', NULL, NULL, N'/api/upload/uploadFile', N'0.0.0.1', N'{}', N'------WebKitFormBoundaryOphNpwvzuB6OOm28
Content-Disposition: form-data; name="file"; filename="Ko.js增删改查例子.txt"
Content-Type: text/plain

http://www.cnblogs.com/landeanfen/p/5400654.html
------WebKitFormBoundaryOphNpwvzuB6OOm28--
', N'', N'64', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D1F5A5C9-2F9E-4761-22D1-08DA72449FEF', N'2022-07-31 00:03:24.0459134', N'2022-07-31 00:03:24.0459128', NULL, NULL, N'/api/admin/Member/update', N'0.0.0.1', N'', N'{"number":"1","name":"测试会员","phone":"18510912123","sex":"男","birthday":"2019-07-08 11:47:24","photo":"[{\"uid\":\"6f5aed63-0fdc-4752-9c2b-3f66cbfa77bf\",\"name\":\"time_000222_old_name_微信图片_20200521081252.jpg\",\"percent\":100,\"status\":\"done\",\"thumbUrl\":\"/upload/files/20220731/time_000222_old_name_微信图片_20200521081252.jpg\",\"url\":\"/upload/files/20220731/time_000222_old_name_微信图片_20200521081252.jpg\"}]","introduce":"<p>999888</p>","filePath":"[{\"uid\":\"35828ad6-cbba-4bcb-9c97-141d5b31acc7\",\"name\":\"time_000320_old_name_Ko.js增删改查例子.txt\",\"percent\":100,\"status\":\"done\",\"thumbUrl\":\"/upload/files/20220731/time_000320_old_name_Ko.js增删改查例子.txt\",\"url\":\"/upload/files/20220731/time_000320_old_name_Ko.js增删改查例子.txt\"}]","userId":"ac18f496-e93d-42f0-b59e-e321acc85335","id":"9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e","lastModificationTime":"2022-07-31 00:02:28","creationTime":"2018-04-25 23:00:00"}', N'', N'48', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'编辑表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F4F8F8A4-5F93-4C2A-22D2-08DA72449FEF', N'2022-07-31 00:03:24.3037445', N'2022-07-31 00:03:24.3037439', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'117', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3D77587B-6C75-4865-22D3-08DA72449FEF', N'2022-07-31 00:03:26.1762353', N'2022-07-31 00:03:26.1762347', NULL, NULL, N'/api/admin/Member/findForm/96a1aa3d-a61a-42d0-954a-c71753fb2065', N'0.0.0.1', N'', N'', N'', N'118', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'6E317B0D-CB1D-4651-22D4-08DA72449FEF', N'2022-07-31 00:03:35.5804680', N'2022-07-31 00:03:35.5804674', NULL, NULL, N'/api/upload/uploadFile', N'0.0.0.1', N'{}', N'------WebKitFormBoundaryQk7AWuiIpMAfxvWP
Content-Disposition: form-data; name="file"; filename="微信图片_20200413162625.jpg"
Content-Type: image/jpeg

����,Exif', N'', N'279', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E7B09A6B-0FC8-40B1-22D5-08DA72449FEF', N'2022-07-31 00:03:46.0546852', N'2022-07-31 00:03:46.0546845', NULL, NULL, N'/api/upload/uploadFile', N'0.0.0.1', N'{}', N'------WebKitFormBoundaryLJvU9HJ3k6QIo2Hq
Content-Disposition: form-data; name="file"; filename="hzy.png"
Content-Type: image/png

�PNG

', N'', N'50', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D8ECA324-0185-4B11-22D6-08DA72449FEF', N'2022-07-31 00:03:48.1012057', N'2022-07-31 00:03:48.1012047', NULL, NULL, N'/api/admin/Member/update', N'0.0.0.1', N'', N'{"number":"123","name":"123","phone":"123","sex":"女","birthday":"2018-04-25 23:00:00","photo":"[{\"uid\":\"d80bbe3d-7296-4eb9-965a-cb3f03d3def7\",\"name\":\"time_000335_old_name_微信图片_20200413162625.jpg\",\"percent\":100,\"status\":\"done\",\"thumbUrl\":\"/upload/files/20220731/time_000335_old_name_微信图片_20200413162625.jpg\",\"url\":\"/upload/files/20220731/time_000335_old_name_微信图片_20200413162625.jpg\"}]","introduce":"<p>123</p>","filePath":"[{\"uid\":\"a6778e9d-6c2e-4d23-91c9-d0d10756d177\",\"name\":\"time_000345_old_name_hzy.png\",\"percent\":100,\"status\":\"done\",\"thumbUrl\":\"/upload/files/20220731/time_000345_old_name_hzy.png\",\"url\":\"/upload/files/20220731/time_000345_old_name_hzy.png\"}]","userId":"ac18f496-e93d-42f0-b59e-e321acc85335","id":"96a1aa3d-a61a-42d0-954a-c71753fb2065","lastModificationTime":"2021-04-18 22:08:06","creationTime":"2020-10-24 00:07:42"}', N'', N'47', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'编辑表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'27A4A2DF-0D3F-4C3C-22D7-08DA72449FEF', N'2022-07-31 00:03:48.3375780', N'2022-07-31 00:03:48.3375775', NULL, NULL, N'/api/admin/Member/findList/10/1', N'0.0.0.1', N'', N'{"name":""}', N'', N'65', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看列表')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'FFDCE9BF-AAB9-46FF-22D8-08DA72449FEF', N'2022-07-31 00:03:50.1977314', N'2022-07-31 00:03:50.1977307', NULL, NULL, N'/api/admin/Member/findForm/96a1aa3d-a61a-42d0-954a-c71753fb2065', N'0.0.0.1', N'', N'', N'', N'43', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'会员', N'查看表单')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'700F4493-96BC-4F07-73D6-08DA73B9BFDF', N'2022-08-01 20:31:25.5060132', N'2022-08-01 20:31:25.5060121', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'7', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'4B1774D4-FAA5-451D-73D7-08DA73B9BFDF', N'2022-08-01 20:32:08.4858733', N'2022-08-01 20:32:08.4858720', NULL, NULL, N'/api/account/check', N'0.0.0.1', N'', N'{"userName":"admin","userPassword":"123456"}', N'', N'1258', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A875A97A-E76D-4883-73D8-08DA73B9BFDF', N'2022-08-01 20:32:09.2484443', N'2022-08-01 20:32:09.2484430', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'375', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'AC876A33-6D4C-4804-73D9-08DA73B9BFDF', N'2022-08-01 20:32:21.9892314', N'2022-08-01 20:32:21.9892307', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'472', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D8F1AE54-8397-4A14-73DA-08DA73B9BFDF', N'2022-08-01 20:32:26.1132817', N'2022-08-01 20:32:26.1132811', NULL, NULL, N'/api/admin/LowCodeTable/synchronization', N'0.0.0.1', N'', N'', N'', N'977', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'756ACCFF-AAD4-490F-73DB-08DA73B9BFDF', N'2022-08-01 20:32:26.3819810', N'2022-08-01 20:32:26.3819805', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'180', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'2B757117-08BE-401E-73DC-08DA73B9BFDF', N'2022-08-01 20:32:34.6845150', N'2022-08-01 20:32:34.6845144', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'188', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'82698EB7-76A0-436A-73DD-08DA73B9BFDF', N'2022-08-01 20:32:35.9389932', N'2022-08-01 20:32:35.9389923', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'229', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'CBE1F447-964F-425A-73DE-08DA73B9BFDF', N'2022-08-01 20:32:38.3923949', N'2022-08-01 20:32:38.3923944', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/2', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'174', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E0E56AB5-FDC2-4757-73DF-08DA73B9BFDF', N'2022-08-01 20:32:40.6776823', N'2022-08-01 20:32:40.6776818', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/3', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'163', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'EAA9AE58-F95A-424B-E070-08DA73C9337C', N'2022-08-01 22:22:01.9178499', N'2022-08-01 22:22:01.9178482', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'9', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'42B94417-FC7F-49A0-E071-08DA73C9337C', N'2022-08-01 22:22:03.4476176', N'2022-08-01 22:22:03.4476160', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'554', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'508E6FEC-8FFB-4849-8B01-08DA755AAB41', N'2022-08-03 22:15:50.9602419', N'2022-08-03 22:15:50.9602408', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'8', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'23153490-2706-4CF7-8B02-08DA755AAB41', N'2022-08-03 22:16:05.0981132', N'2022-08-03 22:16:05.0981123', NULL, NULL, N'/api/account/check', N'0.0.0.1', N'', N'{"userName":"admin","userPassword":"123456"}', N'', N'1104', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'87DBA97D-8F43-4978-8B03-08DA755AAB41', N'2022-08-03 22:16:05.7217113', N'2022-08-03 22:16:05.7217104', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'339', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'09AF7BE2-B047-4BF9-8B04-08DA755AAB41', N'2022-08-03 22:16:10.9241331', N'2022-08-03 22:16:10.9241325', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'426', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'BAF32FBA-ADA0-4135-94DF-08DA755B2248', N'2022-08-03 22:19:10.6185115', N'2022-08-03 22:19:10.6185102', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'4', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'4BB6DA05-9E85-4677-94E0-08DA755B2248', N'2022-08-03 22:19:11.8014654', N'2022-08-03 22:19:11.8014643', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'453', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'DB3538D8-6039-46DF-94E1-08DA755B2248', N'2022-08-03 22:19:37.0129862', N'2022-08-03 22:19:37.0129856', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'471', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'11BD67FD-105D-4B36-411C-08DA755DA19A', N'2022-08-03 22:37:03.2623851', N'2022-08-03 22:37:03.2623839', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'6', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A5CF5FBA-0F72-470E-411D-08DA755DA19A', N'2022-08-03 22:37:04.3869315', N'2022-08-03 22:37:04.3869305', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'445', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5112C646-B2A4-4446-411E-08DA755DA19A', N'2022-08-03 22:38:07.3570334', N'2022-08-03 22:38:07.3570327', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'478', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'DD1E8AA2-506A-4FBD-411F-08DA755DA19A', N'2022-08-03 22:38:32.2244038', N'2022-08-03 22:38:32.2244033', NULL, NULL, N'/api/admin/LowCodeTable/deleteList', N'0.0.0.1', N'', N'["a9e68076-84d2-449f-a7c2-134f09984dfb"]', N'', N'22054', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'16EA5123-C5F6-4CA0-4120-08DA755DA19A', N'2022-08-03 22:38:40.1810659', N'2022-08-03 22:38:40.1810654', NULL, NULL, N'/api/admin/LowCodeTable/deleteList', N'0.0.0.1', N'', N'["a9e68076-84d2-449f-a7c2-134f09984dfb"]', N'', N'3775', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F303677E-F936-4935-4121-08DA755DA19A', N'2022-08-03 22:40:24.9522797', N'2022-08-03 22:40:24.9522791', NULL, NULL, N'/api/admin/LowCodeTable/deleteList', N'0.0.0.1', N'', N'["a9e68076-84d2-449f-a7c2-134f09984dfb"]', N'', N'102043', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'69D7FD85-22AB-472E-4122-08DA755DA19A', N'2022-08-03 22:40:43.3671860', N'2022-08-03 22:40:43.3671855', NULL, NULL, N'/api/admin/LowCodeTable/deleteList', N'0.0.0.1', N'', N'["a9e68076-84d2-449f-a7c2-134f09984dfb"]', N'', N'14489', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'6EF73477-8551-464A-0178-08DA755E35C4', N'2022-08-03 22:41:11.7281988', N'2022-08-03 22:41:11.7281976', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'5', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'43AC46D0-3F7A-43E9-0179-08DA755E35C4', N'2022-08-03 22:41:12.9166751', N'2022-08-03 22:41:12.9166740', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'518', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'82951F87-8067-46B0-017A-08DA755E35C4', N'2022-08-03 22:41:42.3278933', N'2022-08-03 22:41:42.3278926', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'457', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E6258DF0-0BA1-4E4B-9445-08DA755F289E', N'2022-08-03 22:47:59.1965134', N'2022-08-03 22:47:59.1965123', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'5', N'Edge103', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'88B0258E-55B5-4C8D-9446-08DA755F289E', N'2022-08-03 22:48:00.3147433', N'2022-08-03 22:48:00.3147424', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'419', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F0EF4FDD-BF12-4ABE-9447-08DA755F289E', N'2022-08-03 22:48:37.9297828', N'2022-08-03 22:48:37.9297819', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'461', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C425038E-C31F-41BF-9448-08DA755F289E', N'2022-08-03 22:48:41.0493216', N'2022-08-03 22:48:41.0493210', NULL, NULL, N'/api/admin/LowCodeTableInfo/findList/20/1', N'0.0.0.1', N'', N'{"columnName":null,"describe":null,"low_Code_TableId":"a9e68076-84d2-449f-a7c2-134f09984dfb"}', N'', N'429', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeSearchController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9DC628C8-F1D7-4E01-9449-08DA755F289E', N'2022-08-03 22:48:41.0718686', N'2022-08-03 22:48:41.0718681', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'483', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'49F82515-1FA9-4ECB-944A-08DA755F289E', N'2022-08-03 22:48:41.8620769', N'2022-08-03 22:48:41.8620760', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'195', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'067EAF81-76F6-4763-944B-08DA755F289E', N'2022-08-03 22:49:51.6085231', N'2022-08-03 22:49:51.6085224', NULL, NULL, N'/api/admin/LowCodeTable/deleteList', N'0.0.0.1', N'', N'["a9e68076-84d2-449f-a7c2-134f09984dfb"]', N'', N'67048', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'AB5256ED-E9BD-4663-944C-08DA755F289E', N'2022-08-03 22:49:51.8382379', N'2022-08-03 22:49:51.8382374', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'136', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D3C58536-B665-4759-6F6D-08DA7ACCA947', N'2022-08-10 20:34:26.1016926', N'2022-08-10 20:34:26.1016912', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'95', N'Edge104', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'BBCBB11F-D173-4A68-6F6E-08DA7ACCA947', N'2022-08-10 20:34:47.9240057', N'2022-08-10 20:34:47.9240045', NULL, NULL, N'/api/account/check', N'0.0.0.1', N'', N'{"userName":"admin","userPassword":"123456"}', N'', N'1510', N'Edge104', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'07F400AE-79FE-4CE9-6F6F-08DA7ACCA947', N'2022-08-10 20:34:48.6820580', N'2022-08-10 20:34:48.6820568', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'381', N'Edge104', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'BDD426FB-0DDA-4D04-6F70-08DA7ACCA947', N'2022-08-10 20:34:49.1479184', N'2022-08-10 20:34:49.1479178', NULL, NULL, N'/hub/negotiate', N'0.0.0.1', N'', N'', N'?negotiateVersion=1', N'27', N'Edge104', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'AE78526F-5D30-4698-B840-08DA7F8CD72E', N'2022-08-16 21:40:11.1491683', N'2022-08-16 21:40:11.1491667', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'92', N'Edge104', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'EF8DF4AF-DAD1-42B6-B841-08DA7F8CD72E', N'2022-08-16 21:40:17.0111087', N'2022-08-16 21:40:17.0111071', NULL, NULL, N'/api/account/check', N'0.0.0.1', N'', N'{"userName":"admin","userPassword":"123456"}', N'', N'1278', N'Edge104', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'DC2B5208-B914-4C2F-B842-08DA7F8CD72E', N'2022-08-16 21:40:17.8217993', N'2022-08-16 21:40:17.8217976', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'456', N'Edge104', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'91133B00-888F-44CC-B843-08DA7F8CD72E', N'2022-08-16 21:40:18.2824880', N'2022-08-16 21:40:18.2824872', NULL, NULL, N'/hub/negotiate', N'0.0.0.1', N'', N'', N'?negotiateVersion=1', N'31', N'Edge104', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'033E6B3D-0C9E-4327-B844-08DA7F8CD72E', N'2022-08-16 21:40:28.4740419', N'2022-08-16 21:40:28.4740410', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'700', N'Edge104', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7BA7D81E-76F1-4086-B845-08DA7F8CD72E', N'2022-08-16 21:40:35.5363694', N'2022-08-16 21:40:35.5363684', NULL, NULL, N'/api/admin/LowCodeTableInfo/findList/20/1', N'0.0.0.1', N'', N'{"columnName":null,"describe":null,"low_Code_TableId":"79fbd4ec-9f4e-45dc-8065-70f2eb422cdf"}', N'', N'262', N'Edge104', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeSearchController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'20BACBDF-6679-4CDC-B846-08DA7F8CD72E', N'2022-08-16 21:40:35.6053844', N'2022-08-16 21:40:35.6053833', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'414', N'Edge104', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C7B302A3-4460-4E03-B847-08DA7F8CD72E', N'2022-08-16 21:40:37.7280604', N'2022-08-16 21:40:37.7280598', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'207', N'Edge104', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'66607313-EF40-4DDC-B848-08DA7F8CD72E', N'2022-08-16 21:40:39.4063050', N'2022-08-16 21:40:39.4063044', NULL, NULL, N'/api/admin/LowCodeTableInfo/findList/20/1', N'0.0.0.1', N'', N'{"columnName":null,"describe":null,"low_Code_TableId":"69edd8a8-1d24-478c-a909-b82039edcec0"}', N'', N'123', N'Edge104', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeSearchController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0FB305CC-F528-423E-B849-08DA7F8CD72E', N'2022-08-16 21:40:39.5118276', N'2022-08-16 21:40:39.5118252', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'329', N'Edge104', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D92F6B90-EB60-4938-B84A-08DA7F8CD72E', N'2022-08-16 21:40:40.8158239', N'2022-08-16 21:40:40.8158227', NULL, NULL, N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"low_code_search","type":"HZY.Models","codeText":""}', N'', N'436', N'Edge104', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A597CC47-644F-44D7-B84B-08DA7F8CD72E', N'2022-08-16 21:40:42.2142922', N'2022-08-16 21:40:42.2142911', NULL, NULL, N'/api/admin/LowCodeTable/findForm/69edd8a8-1d24-478c-a909-b82039edcec0', N'0.0.0.1', N'', N'', N'', N'68', N'Edge104', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'B8BE9E56-44D5-447B-B84C-08DA7F8CD72E', N'2022-08-16 21:40:47.5602235', N'2022-08-16 21:40:47.5602225', NULL, NULL, N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"low_code_search","type":"HZY.Models","codeText":""}', N'', N'305', N'Edge104', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'6C775852-D4F3-4317-B84D-08DA7F8CD72E', N'2022-08-16 21:40:48.9428412', N'2022-08-16 21:40:48.9428404', NULL, NULL, N'/api/admin/LowCodeTable/findForm/69edd8a8-1d24-478c-a909-b82039edcec0', N'0.0.0.1', N'', N'', N'', N'39', N'Edge104', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'7EA6F87E-D4D4-40FF-B84E-08DA7F8CD72E', N'2022-08-16 21:40:49.8377925', N'2022-08-16 21:40:49.8377919', NULL, NULL, N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"low_code_search","type":"HZY.Models","codeText":""}', N'', N'328', N'Edge104', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'CF40A4EB-5FB9-4EA6-B84F-08DA7F8CD72E', N'2022-08-16 21:40:54.2700390', N'2022-08-16 21:40:54.2700381', NULL, NULL, N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'285', N'Edge104', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5BE0C8B9-BE6B-4199-B850-08DA7F8CD72E', N'2022-08-16 21:41:15.2614998', N'2022-08-16 21:41:15.2614990', NULL, NULL, N'/hub', N'0.0.0.1', N'', N'', N'?id=GXvRa0RT4wPzBvXOl6vmiQ', N'56615', N'Edge104', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'3FBDAC1F-9981-4954-55B9-08DA866015B6', N'2022-08-25 14:07:26.7678623', N'2022-08-25 14:07:26.7678611', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'81', N'Edge104', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'CCF1F375-B0DD-4657-55BA-08DA866015B6', N'2022-08-25 14:08:32.1630846', N'2022-08-25 14:08:32.1630835', NULL, NULL, N'/api/account/check', N'0.0.0.1', N'', N'{"userName":"admin","userPassword":"123456"}', N'', N'860', N'Edge104', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'9F022D38-7087-4AF0-55BB-08DA866015B6', N'2022-08-25 14:08:32.8220886', N'2022-08-25 14:08:32.8220876', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'371', N'Edge104', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'75009109-7B24-4649-55BC-08DA866015B6', N'2022-08-25 14:08:33.1879711', N'2022-08-25 14:08:33.1879706', NULL, NULL, N'/hub/negotiate', N'0.0.0.1', N'', N'', N'?negotiateVersion=1', N'21', N'Edge104', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'C858734C-1507-46C5-55BD-08DA866015B6', N'2022-08-25 14:08:38.8497686', N'2022-08-25 14:08:38.8497681', NULL, NULL, N'/api/admin/SysOrganization/sysOrganizationTree', N'0.0.0.1', N'', N'{}', N'', N'81', N'Edge104', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'组织机构', N'查看组织架构树')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'5A58292D-C026-4F03-55BE-08DA866015B6', N'2022-08-25 14:08:39.1873340', N'2022-08-25 14:08:39.1873335', NULL, NULL, N'/api/admin/SysUser/findList/10/1', N'0.0.0.1', N'', N'{"name":null,"loginName":null,"organizationId":null}', N'', N'466', N'Edge104', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查看数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0BB31D4E-320F-47DC-55BF-08DA866015B6', N'2022-08-25 14:08:41.0507097', N'2022-08-25 14:08:41.0507092', NULL, NULL, N'/hub', N'0.0.0.1', N'', N'', N'?id=-637h0jZK-8Wmw9WdprleQ', N'7656', N'Edge104', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'64C0C72F-F932-4C3D-55C0-08DA866015B6', N'2022-08-25 14:08:41.3191431', N'2022-08-25 14:08:41.3191425', NULL, NULL, N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'30', N'Edge104', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'85A5BA47-7E15-407C-55C1-08DA866015B6', N'2022-08-25 14:08:41.4690939', N'2022-08-25 14:08:41.4690933', NULL, NULL, N'/hub/negotiate', N'0.0.0.1', N'', N'', N'?negotiateVersion=1', N'3', N'Edge104', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'402A761F-4730-4F05-55C2-08DA866015B6', N'2022-08-25 14:08:41.7106437', N'2022-08-25 14:08:41.7106431', NULL, NULL, N'/api/admin/SysOrganization/sysOrganizationTree', N'0.0.0.1', N'', N'{}', N'', N'104', N'Edge104', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'组织机构', N'查看组织架构树')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'AC741CCF-A98E-4A5E-55C3-08DA866015B6', N'2022-08-25 14:08:41.8367405', N'2022-08-25 14:08:41.8367399', NULL, NULL, N'/api/admin/SysUser/findList/10/1', N'0.0.0.1', N'', N'{"name":null,"loginName":null,"organizationId":null}', N'', N'50', N'Edge104', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查看数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'82B72BD1-18A4-4C73-5F4A-08DA86605A66', N'2022-08-25 14:09:21.9160658', N'2022-08-25 14:09:21.9160647', NULL, NULL, N'/', N'0.0.0.1', N'', N'', N'', N'81', N'Edge104', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'4CE34C27-AD56-4FD8-67F9-08DA9B02707A', NULL, N'2022-09-20 20:20:00.6979480', NULL, N'00000000-0000-0000-0000-000000000000', N'/', N'0.0.0.1', N'', N'', N'', N'81', N'Edge105', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'EF586752-5ED0-4B39-67FA-08DA9B02707A', NULL, N'2022-09-20 20:20:08.9843133', NULL, N'00000000-0000-0000-0000-000000000000', N'/api/account/check', N'0.0.0.1', N'', N'{"userName":"admin","userPassword":"123456"}', N'', N'1211', N'Edge105', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'850202D2-8683-4B27-67FB-08DA9B02707A', NULL, N'2022-09-20 20:20:09.9807184', NULL, N'00000000-0000-0000-0000-000000000000', N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'602', N'Edge105', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'84FF83A2-54EA-4718-BB3F-08DA9B0319A2', NULL, N'2022-09-20 20:24:44.7871707', NULL, N'00000000-0000-0000-0000-000000000000', N'/', N'0.0.0.1', N'', N'', N'', N'77', N'Edge105', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E1696AA5-CF5A-492C-BB40-08DA9B0319A2', NULL, N'2022-09-20 20:24:46.2099625', NULL, N'00000000-0000-0000-0000-000000000000', N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'539', N'Edge105', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'525EAC20-F884-46DA-BB41-08DA9B0319A2', NULL, N'2022-09-20 20:24:46.7104450', NULL, N'00000000-0000-0000-0000-000000000000', N'/hub/negotiate', N'0.0.0.1', N'', N'', N'?negotiateVersion=1', N'28', N'Edge105', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'237DE42C-7505-42BA-BB42-08DA9B0319A2', NULL, N'2022-09-20 20:24:54.2750643', NULL, N'00000000-0000-0000-0000-000000000000', N'/api/admin/SysOrganization/sysOrganizationTree', N'0.0.0.1', N'', N'{}', N'', N'104', N'Edge105', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'组织机构', N'查看组织架构树')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'6A1AC761-7543-4A84-BB43-08DA9B0319A2', NULL, N'2022-09-20 20:24:55.0712331', NULL, N'00000000-0000-0000-0000-000000000000', N'/api/admin/SysUser/findList/10/1', N'0.0.0.1', N'', N'{"name":null,"loginName":null,"organizationId":null}', N'', N'908', N'Edge105', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查看数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'F6B75091-D6AA-43E7-CB30-08DA9B044D89', NULL, N'2022-09-20 20:33:21.1047180', NULL, N'00000000-0000-0000-0000-000000000000', N'/', N'0.0.0.1', N'', N'', N'', N'65', N'Edge105', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'251B0AAA-3812-400E-CB31-08DA9B044D89', NULL, N'2022-09-20 20:33:23.1283518', NULL, N'00000000-0000-0000-0000-000000000000', N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'621', N'Edge105', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1B8FF038-1D6F-4E9C-CB32-08DA9B044D89', NULL, N'2022-09-20 20:33:23.3870806', NULL, N'00000000-0000-0000-0000-000000000000', N'/hub/negotiate', N'0.0.0.1', N'', N'', N'?negotiateVersion=1', N'24', N'Edge105', N'Windows10', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'D2E93274-0CA8-407F-CB33-08DA9B044D89', NULL, N'2022-09-20 20:33:27.6232023', NULL, N'00000000-0000-0000-0000-000000000000', N'/api/admin/SysOrganization/sysOrganizationTree', N'0.0.0.1', N'', N'{}', N'', N'157', N'Edge105', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'组织机构', N'查看组织架构树')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'0355877A-C431-4BB9-CB34-08DA9B044D89', NULL, N'2022-09-20 20:33:28.1520397', NULL, N'00000000-0000-0000-0000-000000000000', N'/api/admin/SysUser/findList/10/1', N'0.0.0.1', N'', N'{"name":null,"loginName":null,"organizationId":null}', N'', N'675', N'Edge105', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查看数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'E309353E-2D5D-4852-CB35-08DA9B044D89', NULL, N'2022-09-20 20:33:30.3914022', NULL, N'00000000-0000-0000-0000-000000000000', N'/api/admin/SysUser/findList/10/1', N'0.0.0.1', N'', N'{"name":null,"loginName":null,"organizationId":null}', N'', N'72', N'Edge105', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查看数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'A1CC1525-BB64-41F1-CB36-08DA9B044D89', NULL, N'2022-09-20 20:33:31.7269642', NULL, N'00000000-0000-0000-0000-000000000000', N'/api/admin/SysUser/findList/10/1', N'0.0.0.1', N'', N'{"name":null,"loginName":null,"organizationId":null}', N'', N'82', N'Edge105', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查看数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'8A41FA24-ABDB-40E1-CB37-08DA9B044D89', NULL, N'2022-09-20 20:33:32.2132077', NULL, N'00000000-0000-0000-0000-000000000000', N'/api/admin/SysUser/findList/10/1', N'0.0.0.1', N'', N'{"name":null,"loginName":null,"organizationId":null}', N'', N'49', N'Edge105', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查看数据')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'1F1EA851-01C0-4513-CB38-08DA9B044D89', NULL, N'2022-09-20 20:34:02.2063950', NULL, N'00000000-0000-0000-0000-000000000000', N'/api/admin/SysOrganization/sysOrganizationTree', N'0.0.0.1', N'', N'{}', N'', N'69', N'Edge105', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'组织机构', N'查看组织架构树')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName]) VALUES (N'97375529-5C8F-49B9-CB39-08DA9B044D89', NULL, N'2022-09-20 20:34:02.2374350', NULL, N'00000000-0000-0000-0000-000000000000', N'/api/admin/SysUser/findForm/a3f9784c-5f00-4ec9-62d9-08da00e3d8a0', N'0.0.0.1', N'', N'', N'', N'109', N'Edge105', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查询数据')
GO


-- ----------------------------
-- Table structure for sys_organization
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_organization]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_organization]
GO

CREATE TABLE [dbo].[sys_organization] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [LastModificationTime] datetime2(7)  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [CreatorUserId] uniqueidentifier  NULL,
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

INSERT INTO [dbo].[sys_organization] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Name], [OrderNumber], [LevelCode], [Leader], [Phone], [Email], [State], [ParentId]) VALUES (N'1', N'2021-05-27 20:50:31.0000000', N'2021-05-27 20:50:31.0000000', NULL, NULL, N'阿里巴巴集团', N'1', N'1', N'hzy', N'18410912184', N'18410912184@qq.com', N'1', NULL)
GO

INSERT INTO [dbo].[sys_organization] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Name], [OrderNumber], [LevelCode], [Leader], [Phone], [Email], [State], [ParentId]) VALUES (N'2', N'2021-12-28 16:13:34.0000000', N'2021-05-27 22:33:44.0000000', NULL, NULL, N'北京分部', N'3', N'1.2', N'北京分部', N'132123', N'13131', N'1', N'1')
GO

INSERT INTO [dbo].[sys_organization] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Name], [OrderNumber], [LevelCode], [Leader], [Phone], [Email], [State], [ParentId]) VALUES (N'3', N'2021-05-27 22:33:57.0000000', N'2021-05-27 22:33:57.0000000', NULL, NULL, N'市场部门', N'1', N'1.2.3', N'市场部门', N'234124234', N'234234@qq.com', N'1', N'2')
GO

INSERT INTO [dbo].[sys_organization] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Name], [OrderNumber], [LevelCode], [Leader], [Phone], [Email], [State], [ParentId]) VALUES (N'4', N'2021-05-27 22:34:11.0000000', N'2021-05-27 22:34:11.0000000', NULL, NULL, N'财务部门', N'2', N'1.2.4', N'财务部门', N'435543535', N'123@qq.com', N'1', N'2')
GO

INSERT INTO [dbo].[sys_organization] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Name], [OrderNumber], [LevelCode], [Leader], [Phone], [Email], [State], [ParentId]) VALUES (N'5', N'2021-05-27 22:31:45.0000000', N'2021-05-27 21:01:50.0000000', NULL, NULL, N'成都分部', N'2', N'1.5', N'成都分部', N'123123123', N'123@qq.com', N'1', N'1')
GO

INSERT INTO [dbo].[sys_organization] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Name], [OrderNumber], [LevelCode], [Leader], [Phone], [Email], [State], [ParentId]) VALUES (N'7', N'2021-05-27 22:32:29.0000000', N'2021-05-27 22:32:08.0000000', NULL, NULL, N'研发部门', N'1', N'1.5.7', N'研发部门', N'1234323423', N'12312@qq.com', N'1', N'5')
GO

INSERT INTO [dbo].[sys_organization] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Name], [OrderNumber], [LevelCode], [Leader], [Phone], [Email], [State], [ParentId]) VALUES (N'9', N'2022-03-08 17:07:47.0000000', N'2021-05-27 22:33:25.0000000', NULL, NULL, N'运维部门', N'4', N'1.5.9', N'运维部门', N'1232133452', N'12341@qq.com', N'1', N'5')
GO

INSERT INTO [dbo].[sys_organization] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Name], [OrderNumber], [LevelCode], [Leader], [Phone], [Email], [State], [ParentId]) VALUES (N'10', N'2021-05-27 22:32:59.0000000', N'2021-05-27 22:32:59.0000000', NULL, NULL, N'测试部门', N'3', N'1.5.10', N'测试部门', N'12313', N'123123@qq.com', N'1', N'5')
GO

INSERT INTO [dbo].[sys_organization] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Name], [OrderNumber], [LevelCode], [Leader], [Phone], [Email], [State], [ParentId]) VALUES (N'11', N'2022-03-08 17:07:37.0000000', N'2022-03-08 17:00:20.0000000', NULL, NULL, N'技术部门', N'2', N'1.5.11', N'技术部门', N'12345678911', N'12345678901@qq.com', N'1', N'5')
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
  [LastModificationTime] datetime2(7)  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [CreatorUserId] uniqueidentifier  NULL,
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
INSERT INTO [dbo].[sys_post] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [Code], [Name], [State], [Remarks]) VALUES (N'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622', N'2022-03-08 10:13:18.0000000', N'2022-03-08 10:13:18.0000000', NULL, NULL, N'5', N'dotnet_engineer', N'DotNet软件工程师', N'1', NULL)
GO

INSERT INTO [dbo].[sys_post] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [Code], [Name], [State], [Remarks]) VALUES (N'0716B4B0-9A06-43E9-8AE8-82C74875F83E', N'2021-05-27 20:26:35.0000000', N'2021-05-27 20:26:35.0000000', NULL, NULL, N'2', N'se', N'项目经理', N'1', NULL)
GO

INSERT INTO [dbo].[sys_post] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [Code], [Name], [State], [Remarks]) VALUES (N'96927C30-41D0-4CED-8E29-CBED35C90FB0', N'2021-05-27 20:26:22.0000000', N'2021-05-27 20:26:22.0000000', NULL, NULL, N'1', N'ceo', N'董事长', N'1', NULL)
GO

INSERT INTO [dbo].[sys_post] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [Code], [Name], [State], [Remarks]) VALUES (N'E46AF329-6D08-442C-9837-F22CFF954411', N'2022-04-23 21:50:55.0000000', N'2021-05-27 20:26:52.0000000', NULL, NULL, N'4', N'user', N'普通员工', N'1', NULL)
GO

INSERT INTO [dbo].[sys_post] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [Code], [Name], [State], [Remarks]) VALUES (N'F0C67537-8094-429A-B474-F54AC518609E', N'2021-05-27 20:26:44.0000000', N'2021-05-27 20:26:44.0000000', NULL, NULL, N'3', N'hr', N'人力资源', N'1', NULL)
GO


-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_role]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_role]
GO

CREATE TABLE [dbo].[sys_role] (
  [Id] uniqueidentifier  NOT NULL,
  [LastModificationTime] datetime2(7)  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [CreatorUserId] uniqueidentifier  NULL,
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
INSERT INTO [dbo].[sys_role] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [Name], [Remark], [DeleteLock]) VALUES (N'18FA4771-6F58-46A3-80D2-6F0F5E9972E3', N'2021-01-10 11:25:12.0000000', N'2016-07-06 17:59:20.0000000', NULL, NULL, N'1', N'超级管理员', N'拥有所有权限', N'1')
GO

INSERT INTO [dbo].[sys_role] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Number], [Name], [Remark], [DeleteLock]) VALUES (N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'2021-01-30 00:51:17.0000000', N'2016-07-06 17:59:20.0000000', NULL, NULL, N'2', N'普通用户', N'普通用户', N'1')
GO


-- ----------------------------
-- Table structure for sys_role_menu_function
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_role_menu_function]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_role_menu_function]
GO

CREATE TABLE [dbo].[sys_role_menu_function] (
  [Id] uniqueidentifier  NOT NULL,
  [LastModificationTime] datetime2(7)  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [CreatorUserId] uniqueidentifier  NULL,
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
INSERT INTO [dbo].[sys_role_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [RoleId], [MenuId], [MenuFunctionId]) VALUES (N'31E97CAE-1A79-4066-0368-08DA5F56B13D', N'2022-07-06 21:51:57.0000000', N'2022-07-06 21:51:57.0000000', NULL, NULL, N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'2', N'A7CD04DB-BBE3-49B6-0F1E-08D9FDAD00AB')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [RoleId], [MenuId], [MenuFunctionId]) VALUES (N'28D17DAA-B64E-4946-0369-08DA5F56B13D', N'2022-07-06 21:51:57.0000000', N'2022-07-06 21:51:57.0000000', NULL, NULL, N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'3', N'F64CFE50-1EF1-457F-0F20-08D9FDAD00AB')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [RoleId], [MenuId], [MenuFunctionId]) VALUES (N'3D15457F-C009-44E4-036A-08DA5F56B13D', N'2022-07-06 21:51:57.0000000', N'2022-07-06 21:51:57.0000000', NULL, NULL, N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'5', N'A1DDD02F-8C21-4D79-0F21-08D9FDAD00AB')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [RoleId], [MenuId], [MenuFunctionId]) VALUES (N'653FFA0A-9A3F-447A-036B-08DA5F56B13D', N'2022-07-06 21:51:57.0000000', N'2022-07-06 21:51:57.0000000', NULL, NULL, N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'6', N'1CB6FBE1-4A6C-4AAD-0F22-08D9FDAD00AB')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [RoleId], [MenuId], [MenuFunctionId]) VALUES (N'6C20DD18-622A-4C81-036C-08DA5F56B13D', N'2022-07-06 21:51:57.0000000', N'2022-07-06 21:51:57.0000000', NULL, NULL, N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'8', N'D2E6EA60-2CF6-478A-0F23-08D9FDAD00AB')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [RoleId], [MenuId], [MenuFunctionId]) VALUES (N'EF9CBB6D-70F0-4246-036D-08DA5F56B13D', N'2022-07-06 21:51:57.0000000', N'2022-07-06 21:51:57.0000000', NULL, NULL, N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'9', N'B7533A90-DAE4-4263-0F24-08D9FDAD00AB')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [RoleId], [MenuId], [MenuFunctionId]) VALUES (N'CF58224E-9D8A-4DD7-036E-08DA5F56B13D', N'2022-07-06 21:51:57.0000000', N'2022-07-06 21:51:57.0000000', NULL, NULL, N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'10', N'EC535908-8671-4928-0F25-08D9FDAD00AB')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [RoleId], [MenuId], [MenuFunctionId]) VALUES (N'CD8357E8-E0B8-4A44-036F-08DA5F56B13D', N'2022-07-06 21:51:57.0000000', N'2022-07-06 21:51:57.0000000', NULL, NULL, N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'11', N'3BC0E68F-D03D-4E99-0F26-08D9FDAD00AB')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [RoleId], [MenuId], [MenuFunctionId]) VALUES (N'F90CD8A1-2FAE-40ED-0370-08DA5F56B13D', N'2022-07-06 21:51:57.0000000', N'2022-07-06 21:51:57.0000000', NULL, NULL, N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'13', N'EB958545-6449-40DB-0F27-08D9FDAD00AB')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [RoleId], [MenuId], [MenuFunctionId]) VALUES (N'95E2AD9F-F876-4881-0371-08DA5F56B13D', N'2022-07-06 21:51:57.0000000', N'2022-07-06 21:51:57.0000000', NULL, NULL, N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'13', N'B5881044-AFB8-40B2-0F28-08D9FDAD00AB')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [RoleId], [MenuId], [MenuFunctionId]) VALUES (N'3CE23BF9-F697-4D68-0372-08DA5F56B13D', N'2022-07-06 21:51:57.0000000', N'2022-07-06 21:51:57.0000000', NULL, NULL, N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'13', N'106FB69A-8BB5-4559-0F29-08D9FDAD00AB')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [RoleId], [MenuId], [MenuFunctionId]) VALUES (N'9CDB59FA-4C72-4ADF-0373-08DA5F56B13D', N'2022-07-06 21:51:57.0000000', N'2022-07-06 21:51:57.0000000', NULL, NULL, N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'13', N'F4621FBE-6B40-4454-0F2A-08D9FDAD00AB')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [RoleId], [MenuId], [MenuFunctionId]) VALUES (N'D11FB2B1-54D2-4151-0374-08DA5F56B13D', N'2022-07-06 21:51:57.0000000', N'2022-07-06 21:51:57.0000000', NULL, NULL, N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'13', N'523B53B5-8159-4A16-0F2B-08D9FDAD00AB')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [RoleId], [MenuId], [MenuFunctionId]) VALUES (N'4DF2715F-2A1E-45C2-0375-08DA5F56B13D', N'2022-07-06 21:51:57.0000000', N'2022-07-06 21:51:57.0000000', NULL, NULL, N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'13', N'A3754771-F6E9-4A23-0F2C-08D9FDAD00AB')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [RoleId], [MenuId], [MenuFunctionId]) VALUES (N'390F485A-5F50-475B-0376-08DA5F56B13D', N'2022-07-06 21:51:57.0000000', N'2022-07-06 21:51:57.0000000', NULL, NULL, N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'13', N'B96F977C-A36E-4E7F-0F2D-08D9FDAD00AB')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [RoleId], [MenuId], [MenuFunctionId]) VALUES (N'A10FDD9A-93DF-47D6-0377-08DA5F56B13D', N'2022-07-06 21:51:57.0000000', N'2022-07-06 21:51:57.0000000', NULL, NULL, N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'13', N'541D9045-47B2-4629-0F2E-08D9FDAD00AB')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [RoleId], [MenuId], [MenuFunctionId]) VALUES (N'B414E6E7-AB37-48AB-0378-08DA5F56B13D', N'2022-07-06 21:51:57.0000000', N'2022-07-06 21:51:57.0000000', NULL, NULL, N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'15', N'13F3F74D-C6FC-4488-0F2F-08D9FDAD00AB')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [RoleId], [MenuId], [MenuFunctionId]) VALUES (N'509AD581-1589-41A3-0379-08DA5F56B13D', N'2022-07-06 21:51:57.0000000', N'2022-07-06 21:51:57.0000000', NULL, NULL, N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'19', N'C77C812A-1601-4311-0F70-08D9FDAD00AB')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [RoleId], [MenuId], [MenuFunctionId]) VALUES (N'BC7AD808-E114-47AE-037A-08DA5F56B13D', N'2022-07-06 21:51:57.0000000', N'2022-07-06 21:51:57.0000000', NULL, NULL, N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'28', N'3F6D0AF7-5386-4D3A-0F71-08D9FDAD00AB')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [RoleId], [MenuId], [MenuFunctionId]) VALUES (N'AA9A9BA6-A5CF-4620-037B-08DA5F56B13D', N'2022-07-06 21:51:57.0000000', N'2022-07-06 21:51:57.0000000', NULL, NULL, N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'32', N'6C09C0C0-72FA-4842-0F1F-08D9FDAD00AB')
GO


-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_user]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_user]
GO

CREATE TABLE [dbo].[sys_user] (
  [Id] uniqueidentifier  NOT NULL,
  [LastModificationTime] datetime2(7)  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [CreatorUserId] uniqueidentifier  NULL,
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
INSERT INTO [dbo].[sys_user] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Name], [LoginName], [Password], [Phone], [Email], [DeleteLock], [OrganizationId]) VALUES (N'5722AF0F-2366-4FC9-62D5-08DA00E3D8A0', N'2022-03-08 17:13:02.0000000', N'2022-03-08 17:13:02.0000000', NULL, NULL, N'杜甫', N'杜甫', N'46F94C8DE14FB36680850768FF1B7F2A', N'12345678900', N'12345678900@qq.com', N'0', N'7')
GO

INSERT INTO [dbo].[sys_user] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Name], [LoginName], [Password], [Phone], [Email], [DeleteLock], [OrganizationId]) VALUES (N'4FD6A740-0CF1-4975-62D6-08DA00E3D8A0', N'2022-03-08 17:14:13.0000000', N'2022-03-08 17:14:13.0000000', NULL, NULL, N'李商隐', N'李商隐', N'46F94C8DE14FB36680850768FF1B7F2A', N'12345678900', N'12345678900@qq.com', N'0', N'7')
GO

INSERT INTO [dbo].[sys_user] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Name], [LoginName], [Password], [Phone], [Email], [DeleteLock], [OrganizationId]) VALUES (N'E225E163-31C9-4DA9-62D7-08DA00E3D8A0', N'2022-03-08 17:15:07.0000000', N'2022-03-08 17:15:07.0000000', NULL, NULL, N'苏轼', N'苏轼', N'46F94C8DE14FB36680850768FF1B7F2A', N'12345678900', N'12345678900@qq.com', N'0', N'7')
GO

INSERT INTO [dbo].[sys_user] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Name], [LoginName], [Password], [Phone], [Email], [DeleteLock], [OrganizationId]) VALUES (N'3739F349-7995-4C63-62D8-08DA00E3D8A0', N'2022-03-08 17:17:58.0000000', N'2022-03-08 17:17:58.0000000', NULL, NULL, N'白居易', N'白居易', N'46F94C8DE14FB36680850768FF1B7F2A', N'12345678900', N'12345678900@qq.com', N'0', N'7')
GO

INSERT INTO [dbo].[sys_user] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Name], [LoginName], [Password], [Phone], [Email], [DeleteLock], [OrganizationId]) VALUES (N'A3F9784C-5F00-4EC9-62D9-08DA00E3D8A0', N'2022-03-08 17:19:22.0000000', N'2022-03-08 17:19:22.0000000', NULL, NULL, N'陶渊明 ', N'陶渊明 ', N'46F94C8DE14FB36680850768FF1B7F2A', N'12345678900', N'12345678900@qq.com', N'0', N'7')
GO

INSERT INTO [dbo].[sys_user] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Name], [LoginName], [Password], [Phone], [Email], [DeleteLock], [OrganizationId]) VALUES (N'A1B6DAFB-2B6A-4FF9-62DA-08DA00E3D8A0', N'2022-03-08 17:19:55.0000000', N'2022-03-08 17:19:55.0000000', NULL, NULL, N'屈原', N'屈原', N'46F94C8DE14FB36680850768FF1B7F2A', N'12345678900', N'12345678900@qq.com', N'0', N'7')
GO

INSERT INTO [dbo].[sys_user] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Name], [LoginName], [Password], [Phone], [Email], [DeleteLock], [OrganizationId]) VALUES (N'CC186FE2-EE27-4292-62DB-08DA00E3D8A0', N'2022-03-08 17:20:20.0000000', N'2022-03-08 17:20:20.0000000', NULL, NULL, N'孟浩然', N'孟浩然', N'46F94C8DE14FB36680850768FF1B7F2A', N'12345678900', N'12345678900@qq.com', N'0', N'7')
GO

INSERT INTO [dbo].[sys_user] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Name], [LoginName], [Password], [Phone], [Email], [DeleteLock], [OrganizationId]) VALUES (N'1550D6D4-0529-4FDD-62DC-08DA00E3D8A0', N'2022-03-08 17:30:56.0000000', N'2022-03-08 17:21:56.0000000', NULL, NULL, N'鲁迅', N'鲁迅', N'46F94C8DE14FB36680850768FF1B7F2A', N'12345678900', N'12345678900@qq.com', N'0', N'7')
GO

INSERT INTO [dbo].[sys_user] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Name], [LoginName], [Password], [Phone], [Email], [DeleteLock], [OrganizationId]) VALUES (N'0198459E-2034-4533-B843-5D227AD20740', N'2022-03-08 17:27:36.0000000', N'2017-04-06 19:55:53.0000000', NULL, NULL, N'超级管理员', N'admin', N'E10ADC3949BA59ABBE56E057F20F883E', N'10000000000', N'1396510655@qq.com', N'1', N'7')
GO

INSERT INTO [dbo].[sys_user] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [Name], [LoginName], [Password], [Phone], [Email], [DeleteLock], [OrganizationId]) VALUES (N'AC18F496-E93D-42F0-B59E-E321ACC85335', N'2022-03-08 10:12:14.0000000', N'2017-04-06 19:55:53.0000000', NULL, NULL, N'李白', N'libai', N'E10ADC3949BA59ABBE56E057F20F883E', N'12345678900', N'12345678900@live.com', N'1', N'7')
GO


-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_user_post]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_user_post]
GO

CREATE TABLE [dbo].[sys_user_post] (
  [Id] uniqueidentifier  NOT NULL,
  [LastModificationTime] datetime2(7)  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [CreatorUserId] uniqueidentifier  NULL,
  [UserId] uniqueidentifier  NOT NULL,
  [PostId] uniqueidentifier  NOT NULL
)
GO

ALTER TABLE [dbo].[sys_user_post] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO [dbo].[sys_user_post] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [UserId], [PostId]) VALUES (N'978FC672-D829-4DAD-ABC7-071810C5AD18', N'2022-03-08 17:15:08.0000000', N'2022-03-08 17:15:08.0000000', NULL, NULL, N'E225E163-31C9-4DA9-62D7-08DA00E3D8A0', N'E46AF329-6D08-442C-9837-F22CFF954411')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [UserId], [PostId]) VALUES (N'DA9B04C9-D1EF-4721-8A94-4558DFE2EB7D', N'2022-06-21 19:59:02.0000000', N'2022-06-21 19:59:02.0000000', NULL, NULL, N'A1B6DAFB-2B6A-4FF9-62DA-08DA00E3D8A0', N'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [UserId], [PostId]) VALUES (N'575BF085-47BB-42F2-8B68-620CF460B164', N'2022-03-08 17:29:22.0000000', N'2022-03-08 17:29:22.0000000', NULL, NULL, N'0198459E-2034-4533-B843-5D227AD20740', N'96927C30-41D0-4CED-8E29-CBED35C90FB0')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [UserId], [PostId]) VALUES (N'AF1BEC7E-3309-4629-9606-72EEFA1826B3', N'2022-03-08 17:20:20.0000000', N'2022-03-08 17:20:20.0000000', NULL, NULL, N'CC186FE2-EE27-4292-62DB-08DA00E3D8A0', N'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [UserId], [PostId]) VALUES (N'B669EC48-AA60-441A-B59D-7F9BE7B94155', N'2022-07-06 21:49:13.0000000', N'2022-07-06 21:49:13.0000000', NULL, NULL, N'1550D6D4-0529-4FDD-62DC-08DA00E3D8A0', N'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [UserId], [PostId]) VALUES (N'D4E0AE0B-3573-4901-8FD7-9BB2C88EBE94', N'2022-03-08 17:17:58.0000000', N'2022-03-08 17:17:58.0000000', NULL, NULL, N'3739F349-7995-4C63-62D8-08DA00E3D8A0', N'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [UserId], [PostId]) VALUES (N'B97331A7-E281-4027-AADE-9F068558826A', N'2022-03-08 17:13:02.0000000', N'2022-03-08 17:13:02.0000000', NULL, NULL, N'5722AF0F-2366-4FC9-62D5-08DA00E3D8A0', N'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [UserId], [PostId]) VALUES (N'0C1A55BA-6BD3-4810-A494-A6B9B7374D4D', N'2022-03-08 10:13:35.0000000', N'2022-03-08 10:13:35.0000000', NULL, NULL, N'AC18F496-E93D-42F0-B59E-E321ACC85335', N'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [UserId], [PostId]) VALUES (N'E64EF93C-2CE5-4B1D-A5D0-A9DE937C5A3F', N'2022-03-08 17:15:07.0000000', N'2022-03-08 17:15:07.0000000', NULL, NULL, N'E225E163-31C9-4DA9-62D7-08DA00E3D8A0', N'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [UserId], [PostId]) VALUES (N'6F671077-C98D-4106-9736-BF2EDB6DB58D', N'2022-03-08 17:14:13.0000000', N'2022-03-08 17:14:13.0000000', NULL, NULL, N'4FD6A740-0CF1-4975-62D6-08DA00E3D8A0', N'E46AF329-6D08-442C-9837-F22CFF954411')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [UserId], [PostId]) VALUES (N'6C34F115-28DD-441A-81D5-F6598C97D44A', N'2022-03-08 17:19:22.0000000', N'2022-03-08 17:19:22.0000000', NULL, NULL, N'A3F9784C-5F00-4EC9-62D9-08DA00E3D8A0', N'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [UserId], [PostId]) VALUES (N'B797FF16-D6F7-45DB-83EC-F910B2612926', N'2022-03-08 17:14:13.0000000', N'2022-03-08 17:14:13.0000000', NULL, NULL, N'4FD6A740-0CF1-4975-62D6-08DA00E3D8A0', N'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622')
GO


-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_user_role]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_user_role]
GO

CREATE TABLE [dbo].[sys_user_role] (
  [Id] uniqueidentifier  NOT NULL,
  [LastModificationTime] datetime2(7)  NULL,
  [CreationTime] datetime2(7)  NOT NULL,
  [LastModifierUserId] uniqueidentifier  NULL,
  [CreatorUserId] uniqueidentifier  NULL,
  [UserId] uniqueidentifier  NOT NULL,
  [RoleId] uniqueidentifier  NOT NULL
)
GO

ALTER TABLE [dbo].[sys_user_role] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO [dbo].[sys_user_role] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [UserId], [RoleId]) VALUES (N'AD5014F2-92E8-4109-9CA4-013A92390F8B', N'2022-03-08 17:20:20.0000000', N'2022-03-08 17:20:20.0000000', NULL, NULL, N'CC186FE2-EE27-4292-62DB-08DA00E3D8A0', N'40FF1844-C099-4061-98E0-CD6E544FCFD3')
GO

INSERT INTO [dbo].[sys_user_role] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [UserId], [RoleId]) VALUES (N'CE9F61AC-79D8-426F-9066-36962C017BF6', N'2022-03-08 17:13:02.0000000', N'2022-03-08 17:13:02.0000000', NULL, NULL, N'5722AF0F-2366-4FC9-62D5-08DA00E3D8A0', N'40FF1844-C099-4061-98E0-CD6E544FCFD3')
GO

INSERT INTO [dbo].[sys_user_role] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [UserId], [RoleId]) VALUES (N'DBC656A6-4264-417D-97D8-577E1218FECA', N'2022-03-08 17:19:22.0000000', N'2022-03-08 17:19:22.0000000', NULL, NULL, N'A3F9784C-5F00-4EC9-62D9-08DA00E3D8A0', N'40FF1844-C099-4061-98E0-CD6E544FCFD3')
GO

INSERT INTO [dbo].[sys_user_role] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [UserId], [RoleId]) VALUES (N'9B7BEE51-2FB4-4ABA-B680-6EEA512919EB', N'2022-06-21 19:59:02.0000000', N'2022-06-21 19:59:02.0000000', NULL, NULL, N'A1B6DAFB-2B6A-4FF9-62DA-08DA00E3D8A0', N'40FF1844-C099-4061-98E0-CD6E544FCFD3')
GO

INSERT INTO [dbo].[sys_user_role] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [UserId], [RoleId]) VALUES (N'23D32064-6EB8-4EA9-9B2A-7E2F09F53E4D', N'2022-07-06 21:49:13.0000000', N'2022-07-06 21:49:13.0000000', NULL, NULL, N'1550D6D4-0529-4FDD-62DC-08DA00E3D8A0', N'40FF1844-C099-4061-98E0-CD6E544FCFD3')
GO

INSERT INTO [dbo].[sys_user_role] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [UserId], [RoleId]) VALUES (N'1FE23F57-97C5-4670-9064-88D7D972CD28', N'2022-03-08 17:15:07.0000000', N'2022-03-08 17:15:07.0000000', NULL, NULL, N'E225E163-31C9-4DA9-62D7-08DA00E3D8A0', N'40FF1844-C099-4061-98E0-CD6E544FCFD3')
GO

INSERT INTO [dbo].[sys_user_role] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [UserId], [RoleId]) VALUES (N'A9F8A23B-8C2F-43CC-97AF-8ED6F4C4D097', N'2022-03-08 17:14:13.0000000', N'2022-03-08 17:14:13.0000000', NULL, NULL, N'4FD6A740-0CF1-4975-62D6-08DA00E3D8A0', N'40FF1844-C099-4061-98E0-CD6E544FCFD3')
GO

INSERT INTO [dbo].[sys_user_role] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [UserId], [RoleId]) VALUES (N'45B7D5AF-4D2C-465E-A4B6-99E52AF9AEE5', N'2022-03-08 17:17:58.0000000', N'2022-03-08 17:17:58.0000000', NULL, NULL, N'3739F349-7995-4C63-62D8-08DA00E3D8A0', N'40FF1844-C099-4061-98E0-CD6E544FCFD3')
GO

INSERT INTO [dbo].[sys_user_role] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [UserId], [RoleId]) VALUES (N'1C9F81DF-C8A0-45BB-A272-C84BD3AF0C19', N'2022-03-08 17:29:22.0000000', N'2022-03-08 17:29:22.0000000', NULL, NULL, N'0198459E-2034-4533-B843-5D227AD20740', N'18FA4771-6F58-46A3-80D2-6F0F5E9972E3')
GO

INSERT INTO [dbo].[sys_user_role] ([Id], [LastModificationTime], [CreationTime], [LastModifierUserId], [CreatorUserId], [UserId], [RoleId]) VALUES (N'FA1FDF14-3847-4194-894C-CD935A3DD9E6', N'2022-03-08 10:13:35.0000000', N'2022-03-08 10:13:35.0000000', NULL, NULL, N'AC18F496-E93D-42F0-B59E-E321ACC85335', N'40FF1844-C099-4061-98E0-CD6E544FCFD3')
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

