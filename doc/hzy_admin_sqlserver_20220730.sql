/*
 Navicat Premium Data Transfer

 Source Server         : 本地_SqlServer
 Source Server Type    : SQL Server
 Source Server Version : 14001000
 Source Host           : .:1433
 Source Catalog        : hzy_admin_sqlserver_20220730
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 14001000
 File Encoding         : 65001

 Date: 30/07/2022 21:32:22
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
  [Number] int  NULL,
  [Code] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Name] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Remark] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [LastModificationTime] datetime2(7)  NOT NULL,
  [CreationTime] datetime2(7)  NOT NULL
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
  [UserId] uniqueidentifier  NOT NULL,
  [UserName] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [LaunchTime] datetime2(7)  NOT NULL,
  [FormId] uniqueidentifier  NOT NULL,
  [FlowId] uniqueidentifier  NOT NULL,
  [FlowCode] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [FlowName] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [LastModificationTime] datetime2(7)  NOT NULL,
  [CreationTime] datetime2(7)  NOT NULL
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
  [Sort] int  NOT NULL,
  [FlowNodeId] uniqueidentifier  NOT NULL,
  [FlowNodeName] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [SortMore] int  NOT NULL,
  [State] int  NOT NULL,
  [Opinions] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [UserId] uniqueidentifier  NOT NULL,
  [UserName] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [ApprovalDate] datetime2(7)  NOT NULL,
  [LastModificationTime] datetime2(7)  NOT NULL,
  [CreationTime] datetime2(7)  NOT NULL
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
  [FlowApprovalStepHistoryId] uniqueidentifier  NOT NULL,
  [FlowNodeId] uniqueidentifier  NOT NULL,
  [FlowNodeName] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [UserId] uniqueidentifier  NOT NULL,
  [UserName] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [LastModificationTime] datetime2(7)  NOT NULL,
  [CreationTime] datetime2(7)  NOT NULL
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
  [FlowId] uniqueidentifier  NOT NULL,
  [Sort] int  NULL,
  [Name] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [RoleId] uniqueidentifier  NOT NULL,
  [Remark] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [LastModificationTime] datetime2(7)  NOT NULL,
  [CreationTime] datetime2(7)  NOT NULL
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
  [Low_Code_TableId] uniqueidentifier  NOT NULL,
  [Low_Code_Table_InfoId] uniqueidentifier  NOT NULL,
  [ForeignKeyTableId] uniqueidentifier  NOT NULL,
  [ForeignKeyTableFieldName] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [LastModificationTime] datetime2(7)  NOT NULL,
  [CreationTime] datetime2(7)  NOT NULL
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
  [Low_Code_TableId] uniqueidentifier  NOT NULL,
  [Low_Code_Table_InfoId] uniqueidentifier  NOT NULL,
  [LastModificationTime] datetime2(7)  NOT NULL,
  [CreationTime] datetime2(7)  NOT NULL
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
  [LastModificationTime] datetime2(7)  NOT NULL,
  [CreationTime] datetime2(7)  NOT NULL,
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
INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'69B24F04-0ED3-45FC-91D9-0DC929175A57', N'2022-07-30 20:42:27.9390120', N'2022-04-17 00:00:00.0000000', N'sys_user_post', N'dbo', N'TABLE', N'用户与岗位', N'SysUserPost', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'A9E68076-84D2-449F-A7C2-134F09984DFB', N'2022-07-30 20:42:27.9390117', N'2022-07-29 00:00:00.0000000', N'__EFMigrationsHistory', N'dbo', N'TABLE', N'', N'Efmigrationshistory', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'7F94E0DB-FC63-40DC-BFE3-18C5AAD75975', N'2022-07-30 20:42:27.9390117', N'2022-07-29 00:00:00.0000000', N'flow_approval_step_history_user', N'dbo', N'TABLE', N'', N'FlowApprovalStepHistoryUser', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'2022-07-30 20:42:27.9390118', N'2022-05-23 00:00:00.0000000', N'low_code_table', N'dbo', N'TABLE', N'低代码表', N'LowCodeTable', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'651BB982-1130-4E1C-9070-36B90DCF2324', N'2022-07-29 21:59:11.3821074', N'2022-04-17 00:00:00.0000000', N'flow_approval_step', NULL, NULL, N'工作流审批步骤配置', N'FlowApprovalStep', NULL, NULL, N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'524E71B4-CBF7-4248-8B29-3F99B43F2EB2', N'2022-07-30 20:42:03.2295445', N'2022-04-17 00:00:00.0000000', N'sys_data_authority_custom', N'dbo', N'TABLE', N'自定义数据权限', N'SysDataAuthorityCustom', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'7AD3B915-F0BD-443A-89CD-42D41DD6C554', N'2022-07-29 21:59:11.3821072', N'2022-04-17 00:00:00.0000000', N'flow_approval_step_user', NULL, NULL, N'工作流用户审批步骤', N'FlowApprovalStepUser', NULL, NULL, N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'1A8DF018-79F8-4E26-B4EB-4B735AAE7275', N'2022-07-30 20:42:03.2295439', N'2022-04-17 00:00:00.0000000', N'flow', N'dbo', N'TABLE', N'审批流', N'Flow', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'2022-07-30 20:42:03.2295448', N'2022-04-17 00:00:00.0000000', N'sys_operation_log', N'dbo', N'TABLE', N'操作日志', N'SysOperationLog', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'2AE9E532-7D9A-474B-B629-50A39945C44D', N'2022-07-30 20:42:03.2295447', N'2022-04-17 00:00:00.0000000', N'sys_menu_function', N'dbo', N'TABLE', N'菜单功能', N'SysMenuFunction', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'D8948C56-C5BD-4061-B272-5417375F38F0', N'2022-07-30 20:42:03.2295440', N'2022-04-17 00:00:00.0000000', N'flow_approval', N'dbo', N'TABLE', N'审批流审批', N'FlowApproval', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'2022-07-30 20:42:03.2295448', N'2022-04-17 00:00:00.0000000', N'sys_organization', N'dbo', N'TABLE', N'组织', N'SysOrganization', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'6323638B-A45F-4A76-886E-69A9E9BE0901', N'2022-07-30 20:42:03.2295450', N'2022-04-17 00:00:00.0000000', N'sys_user', N'dbo', N'TABLE', N'用户', N'SysUser', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'2022-07-30 20:42:27.9390118', N'2022-05-23 00:00:00.0000000', N'low_code_table_info', N'dbo', N'TABLE', N'低代码表信息', N'LowCodeTableInfo', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'AF37F705-7BA0-4883-B1BE-8A274EA4C026', N'2022-07-30 20:42:03.2295446', N'2022-04-17 00:00:00.0000000', N'sys_dictionary', N'dbo', N'TABLE', N'数据字典', N'SysDictionary', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'73C97832-4E7F-4758-86D2-94327971B5FD', N'2022-07-30 20:42:03.2295444', N'2022-04-17 00:00:00.0000000', N'member', N'dbo', N'TABLE', N'会员', N'Member', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'2022-07-30 20:42:03.2295447', N'2022-04-17 00:00:00.0000000', N'sys_menu', N'dbo', N'TABLE', N'菜单', N'SysMenu', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'F3D7BBB3-C1FB-4D61-92A4-9BC101811335', N'2022-07-30 20:42:03.2295449', N'2022-04-17 00:00:00.0000000', N'sys_role', N'dbo', N'TABLE', N'角色', N'SysRole', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'852F53FF-0D00-4C32-AA55-A9C11993751B', N'2022-07-30 20:42:27.9390120', N'2022-05-23 00:00:00.0000000', N'low_code_list', N'dbo', N'TABLE', N'低代码列表', N'LowCodeList', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'AE6D94D8-6A15-4348-B600-AA17E4B61718', N'2022-07-30 20:42:03.2295442', N'2022-04-17 00:00:00.0000000', N'flow_node', N'dbo', N'TABLE', N'工作流节点', N'FlowNode', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'69EDD8A8-1D24-478C-A909-B82039EDCEC0', N'2022-07-30 20:42:27.9390119', N'2022-05-23 00:00:00.0000000', N'low_code_search', N'dbo', N'TABLE', N'低代码检索表', N'LowCodeSearch', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'18FBB18E-CB29-45D8-A5F3-C0121C57680A', N'2022-07-30 20:42:27.9390116', N'2022-07-29 00:00:00.0000000', N'flow_approval_step_history', N'dbo', N'TABLE', N'', N'FlowApprovalStepHistory', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'6FABC67A-8B48-49A6-8BA1-C8A32C499D36', N'2022-07-30 20:42:03.2295446', N'2022-04-17 00:00:00.0000000', N'sys_function', N'dbo', N'TABLE', N'功能', N'SysFunction', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'0A8BDB18-758A-4798-9FFC-E7031DCBF262', N'2022-07-30 20:42:03.2295449', N'2022-04-17 00:00:00.0000000', N'sys_post', N'dbo', N'TABLE', N'岗位', N'SysPost', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'8DA38D20-8A09-4E81-8DD8-ED6702AEE380', N'2022-07-30 20:42:03.2295450', N'2022-04-17 00:00:00.0000000', N'sys_role_menu_function', N'dbo', N'TABLE', N'角色菜单功能关联', N'SysRoleMenuFunction', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'E79DB53B-7162-4669-9B5E-F860501475AC', N'2022-07-30 20:42:03.2295445', N'2022-04-17 00:00:00.0000000', N'sys_data_authority', N'dbo', N'TABLE', N'数据权限', N'SysDataAuthority', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark], [ProjectRootPath], [ModelPath], [ServicePath], [ControllerPath], [IndexVuePath], [InfoVuePath], [ServiceJsPath], [IsCover]) VALUES (N'3DA5D264-2E8D-460C-A10C-FF9A6BB57A60', N'2022-07-30 20:42:27.9390121', N'2022-04-17 00:00:00.0000000', N'sys_user_role', N'dbo', N'TABLE', N'用户与角色', N'SysUserRole', NULL, N'HzyAdmin', N'hzy-admin-server/HZY.Models/Entities/App/', N'hzy-admin-server/HZY.Services.Admin/App/', N'hzy-admin-server/HZY.Controllers.Admin/App/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/views/app/', N'hzy-admin-client/src/service/app/', N'0')
GO


-- ----------------------------
-- Table structure for low_code_table_info
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[low_code_table_info]') AND type IN ('U'))
	DROP TABLE [dbo].[low_code_table_info]
GO

CREATE TABLE [dbo].[low_code_table_info] (
  [Id] uniqueidentifier  NOT NULL,
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
  [DisplayName] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [LastModificationTime] datetime2(7)  NOT NULL,
  [CreationTime] datetime2(7)  NOT NULL
)
GO

ALTER TABLE [dbo].[low_code_table_info] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of low_code_table_info
-- ----------------------------
INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'60019CD9-49EB-489B-97B5-08DA39A2EF6C', N'3DA5D264-2E8D-460C-A10C-FF9A6BB57A60', N'1', N'0', N'0', N'170', N'Id', N'Id', N'uniqueidentifier', N'Guid', N'Id', NULL, NULL, N'2022-05-19 22:26:18.0000000', N'2022-05-19 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'825E69B9-CD33-4AB8-97B6-08DA39A2EF6C', N'3DA5D264-2E8D-460C-A10C-FF9A6BB57A60', N'0', N'0', N'1', N'174', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', NULL, NULL, N'2022-05-19 22:26:18.0000000', N'2022-05-19 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'252AC7B2-0E62-48E1-97B7-08DA39A2EF6C', N'3DA5D264-2E8D-460C-A10C-FF9A6BB57A60', N'0', N'0', N'1', N'173', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', NULL, NULL, N'2022-05-19 22:26:18.0000000', N'2022-05-19 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'2029BB6D-A0F2-41DE-97B8-08DA39A2EF6C', N'3DA5D264-2E8D-460C-A10C-FF9A6BB57A60', N'0', N'0', N'1', N'172', N'RoleId', N'', N'uniqueidentifier', N'Guid', N'RoleId', NULL, NULL, N'2022-05-19 22:26:18.0000000', N'2022-05-19 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'18B4430B-765D-4A71-97B9-08DA39A2EF6C', N'3DA5D264-2E8D-460C-A10C-FF9A6BB57A60', N'0', N'0', N'1', N'171', N'UserId', N'', N'uniqueidentifier', N'Guid', N'UserId', NULL, NULL, N'2022-05-19 22:26:18.0000000', N'2022-05-19 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'A72C0341-82E8-48AD-D481-08DA3D8D5A26', N'1A8DF018-79F8-4E26-B4EB-4B735AAE7275', N'1', N'0', N'0', N'24', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'70E30A70-99F9-44B3-D482-08DA3D8D5A26', N'1A8DF018-79F8-4E26-B4EB-4B735AAE7275', N'0', N'0', N'1', N'28', N'Code', N'编码', N'nvarchar(255)', N'String', N'Code', N'255', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'5FC01EB0-4833-4E93-D483-08DA3D8D5A26', N'1A8DF018-79F8-4E26-B4EB-4B735AAE7275', N'0', N'0', N'1', N'26', N'CreationTime', N'', N'datetime', N'DateTime', N'CreationTime', N'8', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'FD9ABF54-3C88-44B0-D484-08DA3D8D5A26', N'1A8DF018-79F8-4E26-B4EB-4B735AAE7275', N'0', N'0', N'1', N'25', N'LastModificationTime', N'', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'06F4F5A9-F63F-4E47-D485-08DA3D8D5A26', N'1A8DF018-79F8-4E26-B4EB-4B735AAE7275', N'0', N'0', N'1', N'29', N'Name', N'流程名称', N'nvarchar(255)', N'String', N'Name', N'255', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'5CB41F1C-E68A-47F9-D486-08DA3D8D5A26', N'1A8DF018-79F8-4E26-B4EB-4B735AAE7275', N'0', N'0', N'1', N'27', N'Number', N'排序号', N'int', N'Int32', N'Number', N'4', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'F21D4C33-E65A-4DFE-D487-08DA3D8D5A26', N'1A8DF018-79F8-4E26-B4EB-4B735AAE7275', N'0', N'0', N'1', N'30', N'Remark', N'备注', N'nvarchar(255)', N'String', N'Remark', N'255', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'B9BBAB1D-0A03-4D07-D488-08DA3D8D5A26', N'D8948C56-C5BD-4061-B272-5417375F38F0', N'1', N'0', N'0', N'31', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'01CA178C-112A-4A49-D489-08DA3D8D5A26', N'D8948C56-C5BD-4061-B272-5417375F38F0', N'0', N'0', N'1', N'33', N'CreationTime', N'', N'datetime', N'DateTime', N'CreationTime', N'8', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'A0FDEB45-C9FE-439B-D48A-08DA3D8D5A26', N'D8948C56-C5BD-4061-B272-5417375F38F0', N'0', N'0', N'1', N'39', N'FlowCode', N'流程编码', N'varchar(255)', N'String', N'FlowCode', N'255', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'2B4747ED-0409-4D14-D48B-08DA3D8D5A26', N'D8948C56-C5BD-4061-B272-5417375F38F0', N'0', N'0', N'1', N'38', N'FlowId', N'流程Id', N'uniqueidentifier', N'Guid', N'FlowId', N'16', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'F00CDE73-2294-40D6-D48C-08DA3D8D5A26', N'D8948C56-C5BD-4061-B272-5417375F38F0', N'0', N'0', N'1', N'40', N'FlowName', N'流程名称', N'varchar(255)', N'String', N'FlowName', N'255', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'CAAE5D6F-F9C7-4EDB-D48D-08DA3D8D5A26', N'D8948C56-C5BD-4061-B272-5417375F38F0', N'0', N'0', N'1', N'37', N'FormId', N'表单Id', N'varchar(50)', N'String', N'FormId', N'50', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'609A52AA-48B2-4E64-D48E-08DA3D8D5A26', N'D8948C56-C5BD-4061-B272-5417375F38F0', N'0', N'0', N'1', N'32', N'LastModificationTime', N'', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'3071360B-C1EF-4DFF-D48F-08DA3D8D5A26', N'D8948C56-C5BD-4061-B272-5417375F38F0', N'0', N'0', N'1', N'36', N'LaunchTime', N'发起时间', N'datetime', N'DateTime', N'LaunchTime', N'8', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'ACF079D0-3DB9-43F7-D490-08DA3D8D5A26', N'D8948C56-C5BD-4061-B272-5417375F38F0', N'0', N'0', N'1', N'34', N'UserId', N'发起人Id', N'uniqueidentifier', N'Guid', N'UserId', N'16', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'6284C929-4115-4C17-D491-08DA3D8D5A26', N'D8948C56-C5BD-4061-B272-5417375F38F0', N'0', N'0', N'1', N'35', N'UserName', N'发起人', N'varchar(255)', N'String', N'UserName', N'255', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'F5C93CC7-50A6-4E0E-D492-08DA3D8D5A26', N'651BB982-1130-4E1C-9070-36B90DCF2324', N'1', N'0', N'0', N'41', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'F6D23541-2FCA-40E6-D493-08DA3D8D5A26', N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'52', N'ApprovalDate', N'审批时间', N'datetime', N'DateTime', N'ApprovalDate', N'8', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'8AD408DB-B5AA-4CB7-D494-08DA3D8D5A26', N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'43', N'CreationTime', N'', N'datetime', N'DateTime', N'CreationTime', N'8', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'2FFAA9EE-C286-4F90-D495-08DA3D8D5A26', N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'45', N'FlowNodeId', N'审批流节点Id', N'uniqueidentifier', N'Guid', N'FlowNodeId', N'16', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'AAA312A2-73FB-4C84-D496-08DA3D8D5A26', N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'46', N'FlowNodeName', N'审批流节点名称', N'varchar(255)', N'String', N'FlowNodeName', N'255', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'043612F1-E16A-4C44-D497-08DA3D8D5A26', N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'42', N'LastModificationTime', N'', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'A8BE7873-7CE4-4CB2-D498-08DA3D8D5A26', N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'49', N'OpinIons', N'步骤审批意见', N'varchar(255)', N'String', N'OpinIons', N'255', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'E8E60481-FB7F-4F1D-D499-08DA3D8D5A26', N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'44', N'Sort', N'步骤顺序号', N'int', N'Int32', N'Sort', N'4', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'2A1C3F3D-4EFC-472B-D49A-08DA3D8D5A26', N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'47', N'SortMore', N'多次审批顺序号（可能是多次审批次数）', N'int', N'Int32', N'SortMore', N'4', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'CBD75568-2ECE-4F90-D49B-08DA3D8D5A26', N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'48', N'State', N'步骤状态（待审批、同意、不同意、回退升级审批）', N'int', N'Int32', N'State', N'4', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'E67FD0C6-A997-4956-D49C-08DA3D8D5A26', N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'50', N'UserId', N'步骤审批人Id', N'uniqueidentifier', N'Guid', N'UserId', N'16', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'24DB7ED8-1A4F-4B25-D49D-08DA3D8D5A26', N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'51', N'UserName', N'步骤审批人名称', N'varchar(255)', N'String', N'UserName', N'255', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'E346CF76-EC76-4409-D49E-08DA3D8D5A26', N'7AD3B915-F0BD-443A-89CD-42D41DD6C554', N'1', N'0', N'0', N'53', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'AE55FABC-3944-4A36-D49F-08DA3D8D5A26', N'7AD3B915-F0BD-443A-89CD-42D41DD6C554', N'0', N'0', N'1', N'55', N'CreationTime', N'', N'datetime', N'DateTime', N'CreationTime', N'8', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'B754AF63-F1DE-4000-D4A0-08DA3D8D5A26', N'7AD3B915-F0BD-443A-89CD-42D41DD6C554', N'0', N'0', N'1', N'56', N'FlowApprovalStepId', N'步骤Id', N'uniqueidentifier', N'Guid', N'FlowApprovalStepId', N'16', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'495FE86E-5BD6-44D4-D4A1-08DA3D8D5A26', N'7AD3B915-F0BD-443A-89CD-42D41DD6C554', N'0', N'0', N'1', N'57', N'FlowNodeId', N'审批节点Id', N'uniqueidentifier', N'Guid', N'FlowNodeId', N'16', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'D48C70E6-4549-41B6-D4A2-08DA3D8D5A26', N'7AD3B915-F0BD-443A-89CD-42D41DD6C554', N'0', N'0', N'1', N'58', N'FlowNodeName', N'审批节点名称', N'varchar(500)', N'String', N'FlowNodeName', N'500', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'0E864B91-B667-4F53-D4A3-08DA3D8D5A26', N'7AD3B915-F0BD-443A-89CD-42D41DD6C554', N'0', N'0', N'1', N'54', N'LastModificationTime', N'', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'92BC9094-160E-4338-D4A4-08DA3D8D5A26', N'7AD3B915-F0BD-443A-89CD-42D41DD6C554', N'0', N'0', N'1', N'59', N'UserId', N'审批人Id', N'uniqueidentifier', N'Guid', N'UserId', N'16', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'0CFC881C-98D4-4A2C-D4A5-08DA3D8D5A26', N'7AD3B915-F0BD-443A-89CD-42D41DD6C554', N'0', N'0', N'1', N'60', N'UserName', N'审批人名称', N'varchar(500)', N'String', N'UserName', N'500', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'2819DFE7-F12B-483C-D4A6-08DA3D8D5A26', N'AE6D94D8-6A15-4348-B600-AA17E4B61718', N'1', N'0', N'0', N'61', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'0E19400D-1876-4FE3-D4A7-08DA3D8D5A26', N'AE6D94D8-6A15-4348-B600-AA17E4B61718', N'0', N'0', N'1', N'63', N'CreationTime', N'', N'datetime', N'DateTime', N'CreationTime', N'8', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'5CA84ECF-5971-45BC-D4A8-08DA3D8D5A26', N'AE6D94D8-6A15-4348-B600-AA17E4B61718', N'0', N'0', N'1', N'65', N'FlowCode', N'', N'nvarchar(255)', N'String', N'FlowCode', N'255', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'9BC385E0-10EE-4299-D4A9-08DA3D8D5A26', N'AE6D94D8-6A15-4348-B600-AA17E4B61718', N'0', N'0', N'1', N'64', N'FlowId', N'', N'uniqueidentifier', N'Guid', N'FlowId', N'16', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'D45AC420-E348-4D6B-D4AA-08DA3D8D5A26', N'AE6D94D8-6A15-4348-B600-AA17E4B61718', N'0', N'0', N'1', N'62', N'LastModificationTime', N'', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'0DF6B078-B248-4C83-D4AB-08DA3D8D5A26', N'AE6D94D8-6A15-4348-B600-AA17E4B61718', N'0', N'0', N'1', N'67', N'Name', N'', N'nvarchar(255)', N'String', N'Name', N'255', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'2321AAC8-0EED-4B87-D4AC-08DA3D8D5A26', N'AE6D94D8-6A15-4348-B600-AA17E4B61718', N'0', N'0', N'1', N'69', N'Remark', N'', N'nvarchar(255)', N'String', N'Remark', N'255', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'73D17476-E006-4530-D4AD-08DA3D8D5A26', N'AE6D94D8-6A15-4348-B600-AA17E4B61718', N'0', N'0', N'1', N'68', N'RoleId', N'', N'uniqueidentifier', N'Guid', N'RoleId', N'16', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'E571FD26-B1A8-4648-D4AE-08DA3D8D5A26', N'AE6D94D8-6A15-4348-B600-AA17E4B61718', N'0', N'0', N'1', N'66', N'Sort', N'', N'int', N'Int32', N'Sort', N'4', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'C2F1A286-2B35-41D6-D4AF-08DA3D8D5A26', N'852F53FF-0D00-4C32-AA55-A9C11993751B', N'1', N'0', N'0', N'189', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'92C1FFFC-5A00-468C-D4B0-08DA3D8D5A26', N'852F53FF-0D00-4C32-AA55-A9C11993751B', N'0', N'0', N'1', N'191', N'CreationTime', N'', N'datetime', N'DateTime', N'CreationTime', N'8', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'7B900BAF-65DF-4910-D4B1-08DA3D8D5A26', N'852F53FF-0D00-4C32-AA55-A9C11993751B', N'0', N'0', N'1', N'195', N'ForeignKeyTableFieldName', N'', N'varchar(50)', N'String', N'ForeignKeyTableFieldName', N'50', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'E7FACEE2-5132-4003-D4B2-08DA3D8D5A26', N'852F53FF-0D00-4C32-AA55-A9C11993751B', N'0', N'0', N'1', N'194', N'ForeignKeyTableId', N'', N'uniqueidentifier', N'Guid', N'ForeignKeyTableId', N'16', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'2AE91C1D-D618-4267-D4B3-08DA3D8D5A26', N'852F53FF-0D00-4C32-AA55-A9C11993751B', N'0', N'0', N'1', N'190', N'LastModificationTime', N'', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'A2660342-556E-4AEF-D4B4-08DA3D8D5A26', N'852F53FF-0D00-4C32-AA55-A9C11993751B', N'0', N'0', N'1', N'193', N'Low_Code_Table_InfoId', N'', N'uniqueidentifier', N'Guid', N'Low_Code_Table_InfoId', N'16', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'585E18EA-AB50-4216-D4B5-08DA3D8D5A26', N'852F53FF-0D00-4C32-AA55-A9C11993751B', N'0', N'0', N'1', N'192', N'Low_Code_TableId', N'', N'uniqueidentifier', N'Guid', N'Low_Code_TableId', N'16', NULL, N'2022-05-24 21:57:33.0000000', N'2022-05-24 21:57:33.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'7C7400ED-EC08-4832-D4B6-08DA3D8D5A26', N'69EDD8A8-1D24-478C-A909-B82039EDCEC0', N'1', N'0', N'0', N'184', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'A29E0236-9C06-4A70-D4B7-08DA3D8D5A26', N'69EDD8A8-1D24-478C-A909-B82039EDCEC0', N'0', N'0', N'1', N'186', N'CreationTime', N'', N'datetime', N'DateTime', N'CreationTime', N'8', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'8237D289-05CF-485B-D4B8-08DA3D8D5A26', N'69EDD8A8-1D24-478C-A909-B82039EDCEC0', N'0', N'0', N'1', N'185', N'LastModificationTime', N'', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'1A2A9E15-DC83-49E1-D4B9-08DA3D8D5A26', N'69EDD8A8-1D24-478C-A909-B82039EDCEC0', N'0', N'0', N'1', N'188', N'Low_Code_Table_InfoId', N'', N'uniqueidentifier', N'Guid', N'Low_Code_Table_InfoId', N'16', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'7B4DF31F-36A3-477C-D4BA-08DA3D8D5A26', N'69EDD8A8-1D24-478C-A909-B82039EDCEC0', N'0', N'0', N'1', N'187', N'Low_Code_TableId', N'', N'uniqueidentifier', N'Guid', N'Low_Code_TableId', N'16', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'9B1B319A-E9DC-406D-D4C4-08DA3D8D5A26', N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'1', N'0', N'0', N'196', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'11AFCF11-9B42-47CE-D4C5-08DA3D8D5A26', N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'204', N'ColumnName', N'', N'varchar(500)', N'String', N'ColumnName', N'500', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'1E40D97A-49EE-4727-D4C6-08DA3D8D5A26', N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'198', N'CreationTime', N'', N'datetime', N'DateTime', N'CreationTime', N'8', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'E0E9D3C3-B713-419C-D4C7-08DA3D8D5A26', N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'208', N'CsField', N'', N'varchar(50)', N'String', N'CsField', N'50', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'EB846AC3-723E-4207-D4C8-08DA3D8D5A26', N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'207', N'CsType', N'', N'varchar(50)', N'String', N'CsType', N'50', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'48B12860-84DE-4F7B-D4C9-08DA3D8D5A26', N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'206', N'DatabaseColumnType', N'', N'varchar(50)', N'String', N'DatabaseColumnType', N'50', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'3B959124-21D2-45B9-D4CA-08DA3D8D5A26', N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'205', N'Describe', N'', N'varchar(50)', N'String', N'Describe', N'50', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'86B95BF0-4418-46BA-D4CB-08DA3D8D5A26', N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'201', N'IsIdentity', N'', N'bit', N'Boolean', N'IsIdentity', N'1', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'5FEA8348-AA6B-4577-D4CC-08DA3D8D5A26', N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'202', N'IsNullable', N'', N'bit', N'Boolean', N'IsNullable', N'1', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'1D3C8224-A3A5-4B88-D4CD-08DA3D8D5A26', N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'200', N'IsPrimary', N'', N'bit', N'Boolean', N'IsPrimary', N'1', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'CF99D60B-2392-493C-D4CE-08DA3D8D5A26', N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'197', N'LastModificationTime', N'', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'F221DA94-0A1D-4CE7-D4CF-08DA3D8D5A26', N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'199', N'Low_Code_TableId', N'', N'uniqueidentifier', N'Guid', N'Low_Code_TableId', N'16', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'DE43269D-D43B-4A77-D4D0-08DA3D8D5A26', N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'209', N'MaxLength', N'', N'int', N'Int32', N'MaxLength', N'4', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'4AAA1E18-8C06-4806-D4D1-08DA3D8D5A26', N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'203', N'Position', N'', N'int', N'Int32', N'Position', N'4', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'E75B8650-EE49-4F83-D4D2-08DA3D8D5A26', N'73C97832-4E7F-4758-86D2-94327971B5FD', N'1', N'0', N'0', N'70', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', NULL, NULL, N'2022-06-08 21:20:04.0000000', N'2022-05-24 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'B7FBB61F-94FC-4242-D4D3-08DA3D8D5A26', N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'75', N'Birthday', N'', N'datetime2', N'DateTime', N'Birthday', NULL, N'生日', N'2022-06-08 21:20:04.0000000', N'2022-05-24 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'5541E535-7CBE-43D2-D4D4-08DA3D8D5A26', N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'80', N'CreationTime', N'创建时间', N'datetime2', N'DateTime', N'CreationTime', NULL, N'创建时间', N'2022-06-08 21:20:04.0000000', N'2022-05-24 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'E4245F5F-BFFA-43F0-D4D5-08DA3D8D5A26', N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'78', N'FilePath', N'文件地址', N'nvarchar(255)', N'String', N'FilePath', NULL, N'文件地址', N'2022-06-08 21:20:04.0000000', N'2022-05-24 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'8326CA11-09F1-4C38-D4D6-08DA3D8D5A26', N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'77', N'Introduce', N'', N'nvarchar(255)', N'String', N'Introduce', NULL, N'简介', N'2022-06-08 21:20:04.0000000', N'2022-05-24 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'897A208C-2E13-46F1-D4D7-08DA3D8D5A26', N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'81', N'LastModificationTime', N'更新时间', N'datetime2', N'DateTime', N'LastModificationTime', NULL, N'更新时间', N'2022-06-08 21:20:04.0000000', N'2022-05-24 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'D1EB49CF-C053-4226-D4D8-08DA3D8D5A26', N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'72', N'Name', N'', N'nvarchar(255)', N'String', N'Name', NULL, N'会员名称', N'2022-06-08 21:20:04.0000000', N'2022-05-24 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'BF24A276-6ED0-49D4-D4D9-08DA3D8D5A26', N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'71', N'Number', N'', N'nvarchar(255)', N'String', N'Number', NULL, N'编号', N'2022-06-08 21:20:04.0000000', N'2022-05-24 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'669B87CE-C694-4C8C-D4DA-08DA3D8D5A26', N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'73', N'Phone', N'', N'nvarchar(255)', N'String', N'Phone', NULL, N'联系电话', N'2022-06-08 21:20:04.0000000', N'2022-05-24 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'F03AC01C-E0CF-4F13-D4DB-08DA3D8D5A26', N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'76', N'Photo', N'', N'nvarchar(255)', N'String', N'Photo', NULL, N'头像', N'2022-06-08 21:20:04.0000000', N'2022-05-24 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'72AC247C-D792-4FEE-D4DC-08DA3D8D5A26', N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'74', N'Sex', N'', N'nvarchar(255)', N'String', N'Sex', NULL, N'性别', N'2022-06-08 21:20:04.0000000', N'2022-05-24 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'837B058B-A88E-4107-D4DD-08DA3D8D5A26', N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'79', N'UserId', N'所属用户', N'uniqueidentifier', N'Guid', N'UserId', NULL, N'所属用户', N'2022-06-08 21:20:04.0000000', N'2022-05-24 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'97284D66-88B9-478F-D4E5-08DA3D8D5A26', N'E79DB53B-7162-4669-9B5E-F860501475AC', N'1', N'0', N'0', N'82', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'B6422CB6-498E-4FF5-D4E6-08DA3D8D5A26', N'E79DB53B-7162-4669-9B5E-F860501475AC', N'0', N'0', N'1', N'84', N'CreationTime', N'', N'datetime', N'DateTime', N'CreationTime', N'8', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'9DE60DD7-A403-442D-D4E7-08DA3D8D5A26', N'E79DB53B-7162-4669-9B5E-F860501475AC', N'0', N'0', N'1', N'83', N'LastModificationTime', N'', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'0F908E1D-4A82-42C1-D4E8-08DA3D8D5A26', N'E79DB53B-7162-4669-9B5E-F860501475AC', N'0', N'0', N'1', N'86', N'PermissionType', N'数据权限类型', N'int', N'Int32', N'PermissionType', N'4', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'9C9F9672-3FA0-4C65-D4E9-08DA3D8D5A26', N'E79DB53B-7162-4669-9B5E-F860501475AC', N'0', N'0', N'1', N'85', N'RoleId', N'', N'uniqueidentifier', N'Guid', N'RoleId', N'16', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'DF559C6B-6F60-467C-D4EA-08DA3D8D5A26', N'524E71B4-CBF7-4248-8B29-3F99B43F2EB2', N'1', N'0', N'0', N'87', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'2341DCB1-8056-4A7C-D4EB-08DA3D8D5A26', N'524E71B4-CBF7-4248-8B29-3F99B43F2EB2', N'0', N'0', N'1', N'89', N'CreationTime', N'', N'datetime', N'DateTime', N'CreationTime', N'8', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'6304E602-84A1-4C57-D4EC-08DA3D8D5A26', N'524E71B4-CBF7-4248-8B29-3F99B43F2EB2', N'0', N'0', N'1', N'88', N'LastModificationTime', N'', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'DE898F57-ABE7-4D2C-D4ED-08DA3D8D5A26', N'524E71B4-CBF7-4248-8B29-3F99B43F2EB2', N'0', N'0', N'1', N'90', N'SysDataAuthorityId', N'', N'uniqueidentifier', N'Guid', N'SysDataAuthorityId', N'16', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'325AF03C-CBB7-4DE6-D4EE-08DA3D8D5A26', N'524E71B4-CBF7-4248-8B29-3F99B43F2EB2', N'0', N'0', N'0', N'91', N'SysOrganizationId', N'', N'int', N'Int32', N'SysOrganizationId', N'4', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'BBAC9A7C-6E62-4FE6-D4EF-08DA3D8D5A26', N'AF37F705-7BA0-4883-B1BE-8A274EA4C026', N'0', N'0', N'1', N'96', N'Code', N'编码', N'varchar(255)', N'String', N'Code', N'255', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'2CA9AA7E-321E-47F0-D4F0-08DA3D8D5A26', N'AF37F705-7BA0-4883-B1BE-8A274EA4C026', N'0', N'0', N'1', N'94', N'CreationTime', N'创建时间', N'datetime', N'DateTime', N'CreationTime', N'8', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'AB5C0B3D-8871-42FD-D4F1-08DA3D8D5A26', N'AF37F705-7BA0-4883-B1BE-8A274EA4C026', N'0', N'1', N'0', N'92', N'Id', N'id', N'int', N'Int32', N'Id', N'4', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'ABA55AD7-7153-4658-D4F2-08DA3D8D5A26', N'AF37F705-7BA0-4883-B1BE-8A274EA4C026', N'0', N'0', N'1', N'93', N'LastModificationTime', N'更新时间', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'29B765BD-36F4-462F-D4F3-08DA3D8D5A26', N'AF37F705-7BA0-4883-B1BE-8A274EA4C026', N'0', N'0', N'1', N'98', N'Name', N'分组名/键', N'varchar(255)', N'String', N'Name', N'255', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'6E69CF9B-D9CD-4C31-D4F4-08DA3D8D5A26', N'AF37F705-7BA0-4883-B1BE-8A274EA4C026', N'0', N'0', N'1', N'99', N'ParentId', N'父级分组id', N'int', N'Int32', N'ParentId', N'4', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'84A87E33-8B66-4B9A-D4F5-08DA3D8D5A26', N'AF37F705-7BA0-4883-B1BE-8A274EA4C026', N'0', N'0', N'1', N'95', N'Sort', N'排序号', N'int', N'Int32', N'Sort', N'4', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'9A850F29-2DD2-4779-D4F6-08DA3D8D5A26', N'AF37F705-7BA0-4883-B1BE-8A274EA4C026', N'0', N'0', N'1', N'97', N'Value', N'值', N'varchar(255)', N'String', N'Value', N'255', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'E1316750-62A4-46AA-D4F7-08DA3D8D5A26', N'6FABC67A-8B48-49A6-8BA1-C8A32C499D36', N'1', N'0', N'0', N'100', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'743D6EAB-B4C8-4A15-D4F8-08DA3D8D5A26', N'6FABC67A-8B48-49A6-8BA1-C8A32C499D36', N'0', N'0', N'1', N'103', N'ByName', N'', N'nvarchar(255)', N'String', N'ByName', N'255', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'82EE25D2-4E01-4100-D4F9-08DA3D8D5A26', N'6FABC67A-8B48-49A6-8BA1-C8A32C499D36', N'0', N'0', N'1', N'106', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', N'6', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'A61101B5-8E66-4456-D4FA-08DA3D8D5A26', N'6FABC67A-8B48-49A6-8BA1-C8A32C499D36', N'0', N'0', N'1', N'105', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', N'6', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'AAA5FAE3-8C5B-4427-D4FB-08DA3D8D5A26', N'6FABC67A-8B48-49A6-8BA1-C8A32C499D36', N'0', N'0', N'1', N'102', N'Name', N'', N'nvarchar(255)', N'String', N'Name', N'255', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'F9FD0E13-4E5D-42B4-D4FC-08DA3D8D5A26', N'6FABC67A-8B48-49A6-8BA1-C8A32C499D36', N'0', N'0', N'1', N'101', N'Number', N'', N'int', N'Int32', N'Number', N'4', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'646614D9-D7F3-42C5-D4FD-08DA3D8D5A26', N'6FABC67A-8B48-49A6-8BA1-C8A32C499D36', N'0', N'0', N'1', N'104', N'Remark', N'', N'nvarchar(255)', N'String', N'Remark', N'255', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'498327EB-5676-4091-D4FE-08DA3D8D5A26', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'1', N'1', N'0', N'107', N'Id', N'', N'int', N'Int32', N'Id', NULL, NULL, N'2022-05-24 21:58:07.0000000', N'2022-05-24 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'3133985D-586C-4C4E-D4FF-08DA3D8D5A26', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'119', N'Close', N'', N'bit', N'Boolean', N'Close', N'1', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'78757B0D-D9EE-45EA-D500-08DA3D8D5A26', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'115', N'ComponentName', N'', N'nvarchar(255)', N'String', N'ComponentName', NULL, NULL, N'2022-05-24 21:58:07.0000000', N'2022-05-24 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'2006AC52-BB49-4E41-D501-08DA3D8D5A26', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'109', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', NULL, NULL, N'2022-05-24 21:58:07.0000000', N'2022-05-24 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'F5193134-B39D-4CA0-D502-08DA3D8D5A26', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'116', N'Icon', N'', N'nvarchar(255)', N'String', N'Icon', NULL, NULL, N'2022-05-24 21:58:07.0000000', N'2022-05-24 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'12E9E9AD-5631-4DC8-D503-08DA3D8D5A26', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'122', N'JumpUrl', N'', N'varchar(255)', N'String', N'JumpUrl', N'255', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'B1F89F8D-8E22-4C4A-D504-08DA3D8D5A26', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'120', N'KeepAlive', N'', N'bit', N'Boolean', N'KeepAlive', N'1', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'7211AEA6-EB91-41E5-D505-08DA3D8D5A26', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'108', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', NULL, NULL, N'2022-05-24 21:58:07.0000000', N'2022-05-24 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'B52A9E8C-DFFB-40B7-D506-08DA3D8D5A26', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'110', N'LevelCode', N'', N'varchar(50)', N'String', N'LevelCode', NULL, NULL, N'2022-05-24 21:58:07.0000000', N'2022-05-24 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'E74C1F4B-AF12-4EAA-D507-08DA3D8D5A26', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'112', N'Name', N'', N'nvarchar(255)', N'String', N'Name', NULL, NULL, N'2022-05-24 21:58:07.0000000', N'2022-05-24 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'235B67F8-62D2-480E-D508-08DA3D8D5A26', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'111', N'Number', N'编号', N'int', N'Int32', N'Number', NULL, NULL, N'2022-05-24 21:58:07.0000000', N'2022-05-24 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'F029B676-48AC-4BA3-D509-08DA3D8D5A26', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'117', N'ParentId', N'', N'int', N'Int32', N'ParentId', N'4', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'5AA598A9-6E52-4AE4-D50A-08DA3D8D5A26', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'114', N'Router', N'', N'nvarchar(255)', N'String', N'Router', NULL, NULL, N'2022-05-24 21:58:07.0000000', N'2022-05-24 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'1916E619-4818-4C63-D50B-08DA3D8D5A26', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'118', N'Show', N'', N'bit', N'Boolean', N'Show', N'1', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'D0FBF229-7204-4494-D50C-08DA3D8D5A26', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'121', N'State', N'', N'bit', N'Boolean', N'State', N'1', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'6C3BB548-AAFC-4F16-D50D-08DA3D8D5A26', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'123', N'Type', N'', N'int', N'Int32', N'Type', N'4', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'19FA02FE-FB8F-4631-D50E-08DA3D8D5A26', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'113', N'Url', N'', N'nvarchar(255)', N'String', N'Url', NULL, NULL, N'2022-05-24 21:58:07.0000000', N'2022-05-24 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'9C4158F4-B5B5-4928-D50F-08DA3D8D5A26', N'2AE9E532-7D9A-474B-B629-50A39945C44D', N'1', N'0', N'0', N'124', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'FBF2D2C1-454B-4898-D510-08DA3D8D5A26', N'2AE9E532-7D9A-474B-B629-50A39945C44D', N'0', N'0', N'1', N'126', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', N'6', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'6CFE3B57-006F-436B-D511-08DA3D8D5A26', N'2AE9E532-7D9A-474B-B629-50A39945C44D', N'0', N'0', N'1', N'129', N'FunctionCode', N'', N'varchar(100)', N'String', N'FunctionCode', N'100', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'A908815C-C0E6-4565-D512-08DA3D8D5A26', N'2AE9E532-7D9A-474B-B629-50A39945C44D', N'0', N'0', N'1', N'130', N'FunctionName', N'', N'varchar(100)', N'String', N'FunctionName', N'100', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'E4DD55F0-9697-43AE-D513-08DA3D8D5A26', N'2AE9E532-7D9A-474B-B629-50A39945C44D', N'0', N'0', N'1', N'125', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', N'6', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'29D08351-9091-4C91-D514-08DA3D8D5A26', N'2AE9E532-7D9A-474B-B629-50A39945C44D', N'0', N'0', N'1', N'128', N'MenuId', N'', N'int', N'Int32', N'MenuId', N'4', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'C7B2AD1D-ECB0-4497-D515-08DA3D8D5A26', N'2AE9E532-7D9A-474B-B629-50A39945C44D', N'0', N'0', N'1', N'127', N'Number', N'', N'int', N'Int32', N'Number', N'4', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'9A050102-6300-46EF-D516-08DA3D8D5A26', N'2AE9E532-7D9A-474B-B629-50A39945C44D', N'0', N'0', N'1', N'131', N'Remark', N'', N'varchar(100)', N'String', N'Remark', N'100', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'BA392537-C1C5-4ECC-D517-08DA3D8D5A26', N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'1', N'0', N'0', N'1', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'EE8CA902-4E27-40C5-D518-08DA3D8D5A26', N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'14', N'ActionDisplayName', N'', N'varchar(255)', N'String', N'ActionDisplayName', N'255', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'200FF922-513C-4B19-D519-08DA3D8D5A26', N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'4', N'Api', N'接口地址', N'varchar(500)', N'String', N'Api', N'500', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'063D44B8-6CE2-47A6-D51A-08DA3D8D5A26', N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'9', N'Browser', N'', N'varchar(255)', N'String', N'Browser', N'255', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'A62BB184-93B0-40E3-D51B-08DA3D8D5A26', N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'13', N'ControllerDisplayName', N'', N'varchar(255)', N'String', N'ControllerDisplayName', N'255', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'0AA2DAAB-50DF-4397-D51C-08DA3D8D5A26', N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'3', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', N'6', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'5F5C2997-DAA8-491C-D51D-08DA3D8D5A26', N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'6', N'Form', N'表单信息', N'varchar(MAX)', N'String', N'Form', N'-1', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'1D881E59-D88E-497F-D51E-08DA3D8D5A26', N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'7', N'FormBody', N'json表单信息', N'varchar(MAX)', N'String', N'FormBody', N'-1', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'CA605278-6972-48B4-D51F-08DA3D8D5A26', N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'5', N'Ip', N'ip地址', N'varchar(255)', N'String', N'Ip', N'255', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'A932F1CE-A55A-480B-D520-08DA3D8D5A26', N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'2', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', N'6', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'4736479F-6089-4141-D521-08DA3D8D5A26', N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'10', N'OS', N'', N'varchar(255)', N'String', N'OS', N'255', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'4467BF43-6E95-4798-D522-08DA3D8D5A26', N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'8', N'QueryString', N'地址栏信息', N'varchar(MAX)', N'String', N'QueryString', N'-1', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'0888B15F-3BD2-4881-D523-08DA3D8D5A26', N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'0', N'12', N'TakeUpTime', N'接口耗时（毫秒）', N'bigint', N'Int64', N'TakeUpTime', N'8', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'66718DE6-5C1A-4229-D524-08DA3D8D5A26', N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'11', N'UserId', N'当前操作人id', N'uniqueidentifier', N'Guid', N'UserId', N'16', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'D6008705-0D21-42AC-D525-08DA3D8D5A26', N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'1', N'1', N'0', N'132', N'Id', N'', N'int', N'Int32', N'Id', NULL, NULL, N'2022-06-09 21:20:26.0000000', N'2022-05-24 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'0B45E9BB-B9F1-4A2F-D526-08DA3D8D5A26', N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'0', N'0', N'1', N'142', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', NULL, NULL, N'2022-06-09 21:20:26.0000000', N'2022-05-24 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'CE802713-74F5-4F30-D527-08DA3D8D5A26', N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'0', N'0', N'1', N'138', N'Email', N'', N'nvarchar(255)', N'String', N'Email', NULL, NULL, N'2022-06-09 21:20:26.0000000', N'2022-05-24 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'19A7504C-F740-4B49-D528-08DA3D8D5A26', N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'0', N'0', N'1', N'141', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', NULL, NULL, N'2022-06-09 21:20:26.0000000', N'2022-05-24 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'CF2E3691-AB88-4420-D529-08DA3D8D5A26', N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'0', N'0', N'1', N'136', N'Leader', N'', N'nvarchar(255)', N'String', N'Leader', NULL, NULL, N'2022-06-09 21:20:26.0000000', N'2022-05-24 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'11F3D291-CF7A-4143-D52A-08DA3D8D5A26', N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'0', N'0', N'1', N'135', N'LevelCode', N'', N'varchar(50)', N'String', N'LevelCode', NULL, NULL, N'2022-06-09 21:20:26.0000000', N'2022-05-24 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'1121D642-49E8-4B25-D52B-08DA3D8D5A26', N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'0', N'0', N'1', N'133', N'Name', N'', N'nvarchar(255)', N'String', N'Name', NULL, N'组织名称', N'2022-06-09 21:20:26.0000000', N'2022-05-24 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'5AED3FEB-3D77-4E1E-D52C-08DA3D8D5A26', N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'0', N'0', N'1', N'134', N'OrderNumber', N'', N'int', N'Int32', N'OrderNumber', NULL, NULL, N'2022-06-09 21:20:26.0000000', N'2022-05-24 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'042A59E2-72C1-4C38-D52D-08DA3D8D5A26', N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'0', N'0', N'1', N'140', N'ParentId', N'', N'int', N'Int32', N'ParentId', NULL, NULL, N'2022-06-09 21:20:26.0000000', N'2022-05-24 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'EA63351C-C203-4D40-D52E-08DA3D8D5A26', N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'0', N'0', N'1', N'137', N'Phone', N'', N'nvarchar(255)', N'String', N'Phone', NULL, NULL, N'2022-06-09 21:20:26.0000000', N'2022-05-24 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'B9BFCA2E-F72B-4A3F-D52F-08DA3D8D5A26', N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'0', N'0', N'1', N'139', N'State', N'', N'int', N'Int32', N'State', NULL, NULL, N'2022-06-09 21:20:26.0000000', N'2022-05-24 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'6AA13B8F-1E3C-4750-D530-08DA3D8D5A26', N'0A8BDB18-758A-4798-9FFC-E7031DCBF262', N'1', N'0', N'0', N'143', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'B76500C1-91F8-4E44-D531-08DA3D8D5A26', N'0A8BDB18-758A-4798-9FFC-E7031DCBF262', N'0', N'0', N'1', N'145', N'Code', N'', N'nvarchar(255)', N'String', N'Code', N'255', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'134C9F62-ABD2-476E-D532-08DA3D8D5A26', N'0A8BDB18-758A-4798-9FFC-E7031DCBF262', N'0', N'0', N'1', N'150', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', N'6', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'5257AD4F-589D-40D0-D533-08DA3D8D5A26', N'0A8BDB18-758A-4798-9FFC-E7031DCBF262', N'0', N'0', N'1', N'149', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', N'6', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'1790B4D5-51B2-4DC0-D534-08DA3D8D5A26', N'0A8BDB18-758A-4798-9FFC-E7031DCBF262', N'0', N'0', N'1', N'146', N'Name', N'', N'nvarchar(255)', N'String', N'Name', N'255', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'2286C948-4F0D-4B66-D535-08DA3D8D5A26', N'0A8BDB18-758A-4798-9FFC-E7031DCBF262', N'0', N'0', N'1', N'144', N'Number', N'', N'int', N'Int32', N'Number', N'4', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'5F9A4A78-1BB9-4592-D536-08DA3D8D5A26', N'0A8BDB18-758A-4798-9FFC-E7031DCBF262', N'0', N'0', N'1', N'148', N'Remarks', N'', N'nvarchar(255)', N'String', N'Remarks', N'255', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'564A907B-1F47-4849-D537-08DA3D8D5A26', N'0A8BDB18-758A-4798-9FFC-E7031DCBF262', N'0', N'0', N'1', N'147', N'State', N'', N'int', N'Int32', N'State', N'4', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'69875823-326C-4E13-D538-08DA3D8D5A26', N'F3D7BBB3-C1FB-4D61-92A4-9BC101811335', N'1', N'0', N'0', N'151', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'42430604-7090-442D-D539-08DA3D8D5A26', N'F3D7BBB3-C1FB-4D61-92A4-9BC101811335', N'0', N'0', N'1', N'153', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', N'6', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'3F7E43C9-762F-48EA-D53A-08DA3D8D5A26', N'F3D7BBB3-C1FB-4D61-92A4-9BC101811335', N'0', N'0', N'1', N'157', N'DeleteLock', N'', N'bit', N'Boolean', N'DeleteLock', N'1', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'517CBFE0-275D-4F36-D53B-08DA3D8D5A26', N'F3D7BBB3-C1FB-4D61-92A4-9BC101811335', N'0', N'0', N'1', N'152', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', N'6', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'BE481209-565B-4099-D53C-08DA3D8D5A26', N'F3D7BBB3-C1FB-4D61-92A4-9BC101811335', N'0', N'0', N'1', N'155', N'Name', N'', N'nvarchar(255)', N'String', N'Name', N'255', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'DD367FD5-2030-43B2-D53D-08DA3D8D5A26', N'F3D7BBB3-C1FB-4D61-92A4-9BC101811335', N'0', N'0', N'1', N'154', N'Number', N'', N'int', N'Int32', N'Number', N'4', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'DBE000FC-4895-42F2-D53E-08DA3D8D5A26', N'F3D7BBB3-C1FB-4D61-92A4-9BC101811335', N'0', N'0', N'1', N'156', N'Remark', N'', N'nvarchar(255)', N'String', N'Remark', N'255', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'7B6DF0CD-C31B-4508-D53F-08DA3D8D5A26', N'8DA38D20-8A09-4E81-8DD8-ED6702AEE380', N'1', N'0', N'0', N'158', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'1213C179-E366-4E3C-D540-08DA3D8D5A26', N'8DA38D20-8A09-4E81-8DD8-ED6702AEE380', N'0', N'0', N'1', N'163', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', N'6', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'B24AC0E3-71AB-4D48-D541-08DA3D8D5A26', N'8DA38D20-8A09-4E81-8DD8-ED6702AEE380', N'0', N'0', N'1', N'162', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', N'6', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'6C934348-BE20-4C9E-D542-08DA3D8D5A26', N'8DA38D20-8A09-4E81-8DD8-ED6702AEE380', N'0', N'0', N'1', N'161', N'MenuFunctionId', N'', N'uniqueidentifier', N'Guid', N'MenuFunctionId', N'16', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'D41BD8DB-1B3F-48FA-D543-08DA3D8D5A26', N'8DA38D20-8A09-4E81-8DD8-ED6702AEE380', N'0', N'0', N'1', N'160', N'MenuId', N'', N'int', N'Int32', N'MenuId', N'4', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'F24F0E45-209E-46B7-D544-08DA3D8D5A26', N'8DA38D20-8A09-4E81-8DD8-ED6702AEE380', N'0', N'0', N'1', N'159', N'RoleId', N'', N'uniqueidentifier', N'Guid', N'RoleId', N'16', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'5BCF7406-75CC-4171-D545-08DA3D8D5A26', N'6323638B-A45F-4A76-886E-69A9E9BE0901', N'1', N'0', N'0', N'164', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', NULL, NULL, N'2022-06-09 21:20:04.0000000', N'2022-05-24 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'46BAC66F-3CF0-46B3-D546-08DA3D8D5A26', N'6323638B-A45F-4A76-886E-69A9E9BE0901', N'0', N'0', N'1', N'166', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', NULL, N'创建时间', N'2022-06-09 21:20:04.0000000', N'2022-05-24 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'A6752BD9-F3D6-451F-D547-08DA3D8D5A26', N'6323638B-A45F-4A76-886E-69A9E9BE0901', N'0', N'0', N'1', N'172', N'DeleteLock', N'', N'bit', N'Boolean', N'DeleteLock', NULL, N'删除锁', N'2022-06-09 21:20:04.0000000', N'2022-05-24 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'287314B2-3141-4957-D548-08DA3D8D5A26', N'6323638B-A45F-4A76-886E-69A9E9BE0901', N'0', N'0', N'0', N'171', N'Email', N'', N'nvarchar(255)', N'String', N'Email', NULL, N'电子邮箱', N'2022-06-09 21:20:04.0000000', N'2022-05-24 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'E5418D61-916F-45FD-D549-08DA3D8D5A26', N'6323638B-A45F-4A76-886E-69A9E9BE0901', N'0', N'0', N'1', N'165', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', NULL, N'更新时间', N'2022-06-09 21:20:04.0000000', N'2022-05-24 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'7CBE8988-CBAC-4EA2-D54A-08DA3D8D5A26', N'6323638B-A45F-4A76-886E-69A9E9BE0901', N'0', N'0', N'1', N'168', N'LoginName', N'', N'nvarchar(255)', N'String', N'LoginName', NULL, N'登录名称', N'2022-06-09 21:20:04.0000000', N'2022-05-24 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'4B5BC027-5663-463A-D54B-08DA3D8D5A26', N'6323638B-A45F-4A76-886E-69A9E9BE0901', N'0', N'0', N'1', N'167', N'Name', N'', N'nvarchar(255)', N'String', N'Name', NULL, N'用户名称', N'2022-06-09 21:20:04.0000000', N'2022-05-24 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'5A9FA990-B6D6-445F-D54C-08DA3D8D5A26', N'6323638B-A45F-4A76-886E-69A9E9BE0901', N'0', N'0', N'1', N'173', N'OrganizationId', N'', N'int', N'Int32', N'OrganizationId', NULL, N'组织id', N'2022-06-09 21:20:04.0000000', N'2022-05-24 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'E36410B5-CB7C-4FC3-D54D-08DA3D8D5A26', N'6323638B-A45F-4A76-886E-69A9E9BE0901', N'0', N'0', N'1', N'169', N'Password', N'', N'nvarchar(255)', N'String', N'Password', NULL, N'密码', N'2022-06-09 21:20:04.0000000', N'2022-05-24 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'C82D5132-6CDA-463E-D54E-08DA3D8D5A26', N'6323638B-A45F-4A76-886E-69A9E9BE0901', N'0', N'0', N'1', N'170', N'Phone', N'', N'nvarchar(255)', N'String', N'Phone', NULL, N'联系电话', N'2022-06-09 21:20:04.0000000', N'2022-05-24 00:00:00.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'A9766BBB-21BF-46DA-D54F-08DA3D8D5A26', N'69B24F04-0ED3-45FC-91D9-0DC929175A57', N'1', N'0', N'0', N'174', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'F731CCD3-9A9C-4DDA-D550-08DA3D8D5A26', N'69B24F04-0ED3-45FC-91D9-0DC929175A57', N'0', N'0', N'1', N'178', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', N'6', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'135E23DB-540B-4096-D551-08DA3D8D5A26', N'69B24F04-0ED3-45FC-91D9-0DC929175A57', N'0', N'0', N'1', N'177', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', N'6', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'4C479D54-530F-4652-D552-08DA3D8D5A26', N'69B24F04-0ED3-45FC-91D9-0DC929175A57', N'0', N'0', N'1', N'176', N'PostId', N'', N'uniqueidentifier', N'Guid', N'PostId', N'16', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'CB5F9ECF-9317-4B11-D553-08DA3D8D5A26', N'69B24F04-0ED3-45FC-91D9-0DC929175A57', N'0', N'0', N'1', N'175', N'UserId', N'', N'uniqueidentifier', N'Guid', N'UserId', N'16', NULL, N'2022-05-24 21:57:34.0000000', N'2022-05-24 21:57:34.0000000')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'92DA4C9A-A430-493E-3381-08DA716A5C08', N'A9E68076-84D2-449F-A7C2-134F09984DFB', N'1', N'0', N'0', N'1', N'MigrationId', N'', N'nvarchar(150)', N'String', N'MigrationId', N'150', N'', N'2022-07-29 21:58:05.0966658', N'2022-07-29 21:58:05.0966657')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'70E3AD35-4FFA-4A96-3382-08DA716A5C08', N'A9E68076-84D2-449F-A7C2-134F09984DFB', N'0', N'0', N'0', N'2', N'ProductVersion', N'', N'nvarchar(32)', N'String', N'ProductVersion', N'32', N'', N'2022-07-29 21:58:05.0966657', N'2022-07-29 21:58:05.0966644')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'51D2EB90-7AB9-4763-3387-08DA716A5C08', N'18FBB18E-CB29-45D8-A5F3-C0121C57680A', N'1', N'0', N'0', N'20', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', N'', N'2022-07-29 21:58:05.1912627', N'2022-07-29 21:58:05.1912626')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'C1AE4945-25FC-45E9-3388-08DA716A5C08', N'18FBB18E-CB29-45D8-A5F3-C0121C57680A', N'0', N'0', N'0', N'29', N'ApprovalDate', N'', N'datetime2', N'DateTime', N'ApprovalDate', N'8', N'', N'2022-07-29 21:58:05.1912626', N'2022-07-29 21:58:05.1912625')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'22527FE7-BD5C-4E6C-3389-08DA716A5C08', N'18FBB18E-CB29-45D8-A5F3-C0121C57680A', N'0', N'0', N'0', N'31', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', N'8', N'', N'2022-07-29 21:58:05.1912625', N'2022-07-29 21:58:05.1912625')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'7485DEED-E9E8-4AA6-338A-08DA716A5C08', N'18FBB18E-CB29-45D8-A5F3-C0121C57680A', N'0', N'0', N'0', N'22', N'FlowNodeId', N'', N'uniqueidentifier', N'Guid', N'FlowNodeId', N'16', N'', N'2022-07-29 21:58:05.1912624', N'2022-07-29 21:58:05.1912624')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'50B6B2FC-3E73-457C-338B-08DA716A5C08', N'18FBB18E-CB29-45D8-A5F3-C0121C57680A', N'0', N'0', N'1', N'23', N'FlowNodeName', N'', N'nvarchar(MAX)', N'String', N'FlowNodeName', N'-1', N'', N'2022-07-29 21:58:05.1912623', N'2022-07-29 21:58:05.1912619')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'DB4510E1-40D2-4DB4-338C-08DA716A5C08', N'18FBB18E-CB29-45D8-A5F3-C0121C57680A', N'0', N'0', N'0', N'30', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', N'8', N'', N'2022-07-29 21:58:05.1912628', N'2022-07-29 21:58:05.1912627')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'BF3DBEDF-ADE0-4E20-338D-08DA716A5C08', N'18FBB18E-CB29-45D8-A5F3-C0121C57680A', N'0', N'0', N'1', N'26', N'Opinions', N'', N'nvarchar(MAX)', N'String', N'Opinions', N'-1', N'', N'2022-07-29 21:58:05.1912628', N'2022-07-29 21:58:05.1912628')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'95414873-486D-4609-338E-08DA716A5C08', N'18FBB18E-CB29-45D8-A5F3-C0121C57680A', N'0', N'0', N'0', N'21', N'Sort', N'', N'int', N'Int32', N'Sort', N'4', N'', N'2022-07-29 21:58:05.1912629', N'2022-07-29 21:58:05.1912629')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'8F107C7C-E4F5-4647-338F-08DA716A5C08', N'18FBB18E-CB29-45D8-A5F3-C0121C57680A', N'0', N'0', N'0', N'24', N'SortMore', N'', N'int', N'Int32', N'SortMore', N'4', N'', N'2022-07-29 21:58:05.1912630', N'2022-07-29 21:58:05.1912630')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'79D371FB-B37A-4D32-3390-08DA716A5C08', N'18FBB18E-CB29-45D8-A5F3-C0121C57680A', N'0', N'0', N'0', N'25', N'State', N'', N'int', N'Int32', N'State', N'4', N'', N'2022-07-29 21:58:05.1912631', N'2022-07-29 21:58:05.1912631')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'3D9C98E4-2AC7-40FD-3391-08DA716A5C08', N'18FBB18E-CB29-45D8-A5F3-C0121C57680A', N'0', N'0', N'0', N'27', N'UserId', N'', N'uniqueidentifier', N'Guid', N'UserId', N'16', N'', N'2022-07-29 21:58:05.1912632', N'2022-07-29 21:58:05.1912631')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'022C287A-11E3-4234-3392-08DA716A5C08', N'18FBB18E-CB29-45D8-A5F3-C0121C57680A', N'0', N'0', N'1', N'28', N'UserName', N'', N'nvarchar(MAX)', N'String', N'UserName', N'-1', N'', N'2022-07-29 21:58:05.1912633', N'2022-07-29 21:58:05.1912632')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'59F5D993-E502-4FEE-3393-08DA716A5C08', N'7F94E0DB-FC63-40DC-BFE3-18C5AAD75975', N'1', N'0', N'0', N'32', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', N'', N'2022-07-29 21:58:05.2184615', N'2022-07-29 21:58:05.2184614')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'CB4A19D3-35DD-416D-3394-08DA716A5C08', N'7F94E0DB-FC63-40DC-BFE3-18C5AAD75975', N'0', N'0', N'0', N'39', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', N'8', N'', N'2022-07-29 21:58:05.2184614', N'2022-07-29 21:58:05.2184614')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'D550FB44-F912-434E-3395-08DA716A5C08', N'7F94E0DB-FC63-40DC-BFE3-18C5AAD75975', N'0', N'0', N'0', N'33', N'FlowApprovalStepHistoryId', N'', N'uniqueidentifier', N'Guid', N'FlowApprovalStepHistoryId', N'16', N'', N'2022-07-29 21:58:05.2184613', N'2022-07-29 21:58:05.2184613')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'A7263191-1E30-42C5-3396-08DA716A5C08', N'7F94E0DB-FC63-40DC-BFE3-18C5AAD75975', N'0', N'0', N'0', N'34', N'FlowNodeId', N'', N'uniqueidentifier', N'Guid', N'FlowNodeId', N'16', N'', N'2022-07-29 21:58:05.2184612', N'2022-07-29 21:58:05.2184612')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'CCC3F055-79C4-4E63-3397-08DA716A5C08', N'7F94E0DB-FC63-40DC-BFE3-18C5AAD75975', N'0', N'0', N'1', N'35', N'FlowNodeName', N'', N'nvarchar(MAX)', N'String', N'FlowNodeName', N'-1', N'', N'2022-07-29 21:58:05.2184612', N'2022-07-29 21:58:05.2184611')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'D5E76D95-BEED-43C9-3398-08DA716A5C08', N'7F94E0DB-FC63-40DC-BFE3-18C5AAD75975', N'0', N'0', N'0', N'38', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', N'8', N'', N'2022-07-29 21:58:05.2184611', N'2022-07-29 21:58:05.2184610')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'9059BF44-23A0-4E12-3399-08DA716A5C08', N'7F94E0DB-FC63-40DC-BFE3-18C5AAD75975', N'0', N'0', N'0', N'36', N'UserId', N'', N'uniqueidentifier', N'Guid', N'UserId', N'16', N'', N'2022-07-29 21:58:05.2184610', N'2022-07-29 21:58:05.2184609')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'643C3AA6-D639-46BD-339A-08DA716A5C08', N'7F94E0DB-FC63-40DC-BFE3-18C5AAD75975', N'0', N'0', N'1', N'37', N'UserName', N'', N'nvarchar(MAX)', N'String', N'UserName', N'-1', N'', N'2022-07-29 21:58:05.2184609', N'2022-07-29 21:58:05.2184605')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'1FBF9CEA-3E4C-401B-243F-08DA717DBCAA', N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'1', N'0', N'0', N'203', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', N'', N'2022-07-30 00:16:47.6478963', N'2022-07-30 00:16:47.6478949')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'7EC46123-3852-4B62-2440-08DA717DBCAA', N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'215', N'ControllerPath', N'', N'varchar(50)', N'String', N'ControllerPath', N'50', N'', N'2022-07-30 00:16:47.6478964', N'2022-07-30 00:16:47.6478964')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'BE6F08B8-B14B-4253-2441-08DA717DBCAA', N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'0', N'205', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', N'8', N'', N'2022-07-30 00:16:47.6478965', N'2022-07-30 00:16:47.6478964')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'A06381EF-E532-4B7A-2442-08DA717DBCAA', N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'209', N'DisplayName', N'', N'nvarchar(MAX)', N'String', N'DisplayName', N'-1', N'', N'2022-07-30 00:16:47.6478966', N'2022-07-30 00:16:47.6478965')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'3051FB7C-F075-4D91-2443-08DA717DBCAA', N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'210', N'EntityName', N'', N'nvarchar(MAX)', N'String', N'EntityName', N'-1', N'', N'2022-07-30 00:16:47.6478967', N'2022-07-30 00:16:47.6478967')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'B755E2AF-1164-47DE-2444-08DA717DBCAA', N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'216', N'IndexVuePath', N'', N'varchar(50)', N'String', N'IndexVuePath', N'50', N'', N'2022-07-30 00:16:47.6478968', N'2022-07-30 00:16:47.6478967')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'54A0ED42-104E-4E2A-2445-08DA717DBCAA', N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'217', N'InfoVuePath', N'', N'varchar(50)', N'String', N'InfoVuePath', N'50', N'', N'2022-07-30 00:16:47.6478969', N'2022-07-30 00:16:47.6478968')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'1BD2134C-3A2A-4E1B-2446-08DA717DBCAA', N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'219', N'IsCover', N'', N'bit', N'Boolean', N'IsCover', N'1', N'', N'2022-07-30 00:16:47.6478970', N'2022-07-30 00:16:47.6478969')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'8E5F9439-6B90-423A-2447-08DA717DBCAA', N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'0', N'204', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', N'8', N'', N'2022-07-30 00:16:47.6478971', N'2022-07-30 00:16:47.6478970')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'C6042620-D052-4A60-2448-08DA717DBCAA', N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'213', N'ModelPath', N'', N'varchar(50)', N'String', N'ModelPath', N'50', N'', N'2022-07-30 00:16:47.6478972', N'2022-07-30 00:16:47.6478971')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'CAFF37BF-4E91-4934-2449-08DA717DBCAA', N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'212', N'ProjectRootPath', N'', N'varchar(50)', N'String', N'ProjectRootPath', N'50', N'', N'2022-07-30 00:16:47.6478973', N'2022-07-30 00:16:47.6478972')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'803C2D4B-4A80-43B0-244A-08DA717DBCAA', N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'211', N'Remark', N'', N'nvarchar(MAX)', N'String', N'Remark', N'-1', N'', N'2022-07-30 00:16:47.6478974', N'2022-07-30 00:16:47.6478973')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'158B1C2D-FA67-4696-244B-08DA717DBCAA', N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'207', N'Schema', N'', N'nvarchar(MAX)', N'String', N'Schema', N'-1', N'', N'2022-07-30 00:16:47.6478975', N'2022-07-30 00:16:47.6478974')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'13775DE6-200D-43E0-244C-08DA717DBCAA', N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'218', N'ServiceJsPath', N'', N'varchar(50)', N'String', N'ServiceJsPath', N'50', N'', N'2022-07-30 00:16:47.6478976', N'2022-07-30 00:16:47.6478975')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'AAECFDA3-F48D-4CD5-244D-08DA717DBCAA', N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'214', N'ServicePath', N'', N'varchar(50)', N'String', N'ServicePath', N'50', N'', N'2022-07-30 00:16:47.6478977', N'2022-07-30 00:16:47.6478976')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'26F16D3D-9C42-4F86-244E-08DA717DBCAA', N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'206', N'TableName', N'', N'nvarchar(MAX)', N'String', N'TableName', N'-1', N'', N'2022-07-30 00:16:47.6478978', N'2022-07-30 00:16:47.6478977')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName], [LastModificationTime], [CreationTime]) VALUES (N'59CFB48C-8D3F-43D7-244F-08DA717DBCAA', N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'208', N'Type', N'', N'nvarchar(MAX)', N'String', N'Type', N'-1', N'', N'2022-07-30 00:16:47.6478979', N'2022-07-30 00:16:47.6478978')
GO


-- ----------------------------
-- Table structure for member
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[member]') AND type IN ('U'))
	DROP TABLE [dbo].[member]
GO

CREATE TABLE [dbo].[member] (
  [Id] uniqueidentifier  NOT NULL,
  [Number] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Name] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Phone] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Sex] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Birthday] datetime2(7)  NOT NULL,
  [Photo] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Introduce] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [FilePath] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [UserId] uniqueidentifier  NOT NULL,
  [LastModificationTime] datetime2(7)  NOT NULL,
  [CreationTime] datetime2(7)  NOT NULL
)
GO

ALTER TABLE [dbo].[member] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO [dbo].[member] ([Id], [Number], [Name], [Phone], [Sex], [Birthday], [Photo], [Introduce], [FilePath], [UserId], [LastModificationTime], [CreationTime]) VALUES (N'96A1AA3D-A61A-42D0-954A-C71753FB2065', N'123', N'123', N'123', N'女', N'2018-04-25 23:00:00.0000000', NULL, N'<p>123</p>', NULL, N'AC18F496-E93D-42F0-B59E-E321ACC85335', N'2021-04-18 22:08:06.0000000', N'2020-10-24 00:07:42.0000000')
GO

INSERT INTO [dbo].[member] ([Id], [Number], [Name], [Phone], [Sex], [Birthday], [Photo], [Introduce], [FilePath], [UserId], [LastModificationTime], [CreationTime]) VALUES (N'9A604AA2-9AE6-4A2F-8DDB-D9E0289EAD9E', N'1', N'测试会员', N'18510912123', N'男', N'2019-07-08 11:47:24.0000000', N'http://localhost:5600http://localhost:5600http://localhost:5600/upload/files/20210118/time_232747_old_name_hzy.png', N'<p>999888</p>', N'/upload/files/20210118/time_233310_old_name_hzy.png', N'AC18F496-E93D-42F0-B59E-E321ACC85335', N'2022-05-08 16:46:21.0000000', N'2018-04-25 23:00:00.0000000')
GO


-- ----------------------------
-- Table structure for sys_data_authority
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_data_authority]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_data_authority]
GO

CREATE TABLE [dbo].[sys_data_authority] (
  [Id] uniqueidentifier  NOT NULL,
  [PermissionType] int  NOT NULL,
  [RoleId] uniqueidentifier  NOT NULL,
  [LastModificationTime] datetime2(7)  NOT NULL,
  [CreationTime] datetime2(7)  NOT NULL
)
GO

ALTER TABLE [dbo].[sys_data_authority] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of sys_data_authority
-- ----------------------------
INSERT INTO [dbo].[sys_data_authority] ([Id], [PermissionType], [RoleId], [LastModificationTime], [CreationTime]) VALUES (N'D09BF250-C5B0-41CB-237D-08DA00442990', N'5', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'2022-07-06 21:53:17.0000000', N'2022-03-07 22:09:58.0000000')
GO

INSERT INTO [dbo].[sys_data_authority] ([Id], [PermissionType], [RoleId], [LastModificationTime], [CreationTime]) VALUES (N'0228A5B5-2202-4BA0-6E48-08DA205DA7B7', N'5', N'18FA4771-6F58-46A3-80D2-6F0F5E9972E3', N'2022-04-17 18:33:04.0000000', N'2022-04-17 18:33:04.0000000')
GO


-- ----------------------------
-- Table structure for sys_data_authority_custom
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_data_authority_custom]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_data_authority_custom]
GO

CREATE TABLE [dbo].[sys_data_authority_custom] (
  [Id] uniqueidentifier  NOT NULL,
  [SysDataAuthorityId] uniqueidentifier  NULL,
  [SysOrganizationId] int  NOT NULL,
  [LastModificationTime] datetime2(7)  NOT NULL,
  [CreationTime] datetime2(7)  NOT NULL
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
  [Sort] int  NOT NULL,
  [Code] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Name] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Value] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [ParentId] int  NULL,
  [LastModificationTime] datetime2(7)  NOT NULL,
  [CreationTime] datetime2(7)  NOT NULL
)
GO

ALTER TABLE [dbo].[sys_dictionary] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of sys_dictionary
-- ----------------------------
SET IDENTITY_INSERT [dbo].[sys_dictionary] ON
GO

INSERT INTO [dbo].[sys_dictionary] ([Id], [Sort], [Code], [Name], [Value], [ParentId], [LastModificationTime], [CreationTime]) VALUES (N'1', N'1', N'news_type', N'资讯类别', NULL, NULL, N'2021-07-25 22:39:34.0000000', N'2021-07-25 22:31:30.0000000')
GO

INSERT INTO [dbo].[sys_dictionary] ([Id], [Sort], [Code], [Name], [Value], [ParentId], [LastModificationTime], [CreationTime]) VALUES (N'2', N'1', N'news_type_nan', N'男', N'1', N'1', N'2021-07-25 22:40:30.0000000', N'2021-07-25 22:38:49.0000000')
GO

INSERT INTO [dbo].[sys_dictionary] ([Id], [Sort], [Code], [Name], [Value], [ParentId], [LastModificationTime], [CreationTime]) VALUES (N'3', N'2', N'news_type_nv', N'女', N'2', N'1', N'2022-07-06 21:55:30.0000000', N'2021-07-25 22:40:47.0000000')
GO

INSERT INTO [dbo].[sys_dictionary] ([Id], [Sort], [Code], [Name], [Value], [ParentId], [LastModificationTime], [CreationTime]) VALUES (N'4', N'0', N'3', N'未知', N'3', N'1', N'2022-06-29 20:55:46.0000000', N'2022-06-29 20:55:46.0000000')
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
  [Number] int  NULL,
  [Name] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [ByName] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Remark] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [LastModificationTime] datetime2(7)  NOT NULL,
  [CreationTime] datetime2(7)  NOT NULL
)
GO

ALTER TABLE [dbo].[sys_function] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of sys_function
-- ----------------------------
INSERT INTO [dbo].[sys_function] ([Id], [Number], [Name], [ByName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'B6FD5425-504A-46A9-993B-2F8DC9158EB8', N'80', N'打印', N'Print', N'Print', N'2021-04-18 22:08:06.0000000', N'2022-06-16 17:28:00.0000000')
GO

INSERT INTO [dbo].[sys_function] ([Id], [Number], [Name], [ByName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'C9518758-B2E1-4F51-B517-5282E273889C', N'10', N'显示', N'Display', N'Display', N'2021-04-18 22:08:06.0000000', N'2016-06-20 13:40:52.0000000')
GO

INSERT INTO [dbo].[sys_function] ([Id], [Number], [Name], [ByName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'F27ECB0A-197D-47B1-B243-59A8C71302BF', N'60', N'检索', N'Search', N'Search', N'2021-04-18 22:08:06.0000000', N'2016-06-20 13:40:52.0000000')
GO

INSERT INTO [dbo].[sys_function] ([Id], [Number], [Name], [ByName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'383E7EE2-7690-46AC-9230-65155C84AA30', N'50', N'保存', N'Save', N'Save', N'2021-04-18 22:08:06.0000000', N'2016-06-20 13:40:52.0000000')
GO

INSERT INTO [dbo].[sys_function] ([Id], [Number], [Name], [ByName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'9C388461-2704-4C5E-A729-72C17E9018E1', N'40', N'删除', N'Delete', N'Delete', N'2021-04-18 22:08:06.0000000', N'2016-06-20 13:40:52.0000000')
GO

INSERT INTO [dbo].[sys_function] ([Id], [Number], [Name], [ByName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'BFFEFB1C-8988-4DDF-B4AC-81C2B30E80CD', N'20', N'添加', N'Insert', N'Insert', N'2021-04-18 22:08:06.0000000', N'2016-06-20 13:40:52.0000000')
GO

INSERT INTO [dbo].[sys_function] ([Id], [Number], [Name], [ByName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'2401F4D0-60B0-4E2E-903F-84C603373572', N'70', N'导出', N'Export', N'Export', N'2021-04-18 22:08:06.0000000', N'2016-06-20 13:40:52.0000000')
GO

INSERT INTO [dbo].[sys_function] ([Id], [Number], [Name], [ByName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'E7EF2A05-8317-41C3-B588-99519FE88BF9', N'30', N'修改', N'Update', N'Update', N'2021-04-18 22:08:06.0000000', N'2016-06-20 13:40:52.0000000')
GO


-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_menu]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_menu]
GO

CREATE TABLE [dbo].[sys_menu] (
  [Id] int  IDENTITY(1,1) NOT NULL,
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
  [LastModificationTime] datetime2(7)  NOT NULL,
  [CreationTime] datetime2(7)  NOT NULL
)
GO

ALTER TABLE [dbo].[sys_menu] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of sys_menu
-- ----------------------------
SET IDENTITY_INSERT [dbo].[sys_menu] ON
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [LastModificationTime], [CreationTime]) VALUES (N'1', N'1', N'10', N'更多示例', NULL, NULL, NULL, NULL, N'MoreOutlined', NULL, N'1', N'1', N'1', N'1', N'1', N'2022-03-04 12:25:39.0000000', N'2021-05-28 11:49:02.0000000')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [LastModificationTime], [CreationTime]) VALUES (N'2', N'1.2', N'10', N'Antd Vue3.0组件', N'AppComponentsCom', N'views/AppComponents.vue', N'/app/components', NULL, N'LayoutOutlined', N'1', N'1', N'1', N'1', N'1', N'2', N'2022-03-18 12:06:20.0000000', N'2021-01-16 16:05:22.0000000')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [LastModificationTime], [CreationTime]) VALUES (N'3', N'1.3', N'30', N'按钮', N'ButtonCom', N'views/Button.vue', N'/button', NULL, N'AppstoreOutlined', N'1', N'1', N'1', N'1', N'1', N'2', N'2022-03-04 12:26:14.0000000', N'2020-12-17 14:58:05.0000000')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [LastModificationTime], [CreationTime]) VALUES (N'4', N'1.4', N'40', N'图表 AntV G2', NULL, NULL, NULL, NULL, N'PieChartOutlined', N'1', N'1', N'1', N'1', N'1', N'1', N'2022-03-04 12:26:21.0000000', N'2021-01-16 16:06:33.0000000')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [LastModificationTime], [CreationTime]) VALUES (N'5', N'1.4.5', N'10', N'基础图表', N'ChartBaseCom', N'views/chart/Base.vue', N'/chart/base', NULL, NULL, N'4', N'1', N'1', N'1', N'1', N'2', N'2022-03-04 12:26:25.0000000', N'2021-01-16 16:07:24.0000000')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [LastModificationTime], [CreationTime]) VALUES (N'6', N'1.4.6', N'20', N'更多图表', N'ChartMoreCom', N'views/chart/More.vue', N'/chart/more', NULL, NULL, N'4', N'1', N'1', N'1', N'1', N'2', N'2022-03-04 12:26:28.0000000', N'2021-01-16 16:10:06.0000000')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [LastModificationTime], [CreationTime]) VALUES (N'7', N'1.7', N'50', N'表格管理', NULL, NULL, NULL, NULL, N'TableOutlined', N'1', N'1', N'1', N'1', N'1', N'1', N'2022-03-04 12:26:34.0000000', N'2018-03-10 12:16:38.0000000')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [LastModificationTime], [CreationTime]) VALUES (N'8', N'1.7.8', N'100', N'基础列表', N'BaseListCom', N'views/BaseList.vue', N'/base/list', NULL, NULL, N'7', N'1', N'1', N'1', N'1', N'2', N'2022-03-04 12:26:38.0000000', N'2020-12-17 14:49:12.0000000')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [LastModificationTime], [CreationTime]) VALUES (N'9', N'1.7.9', N'110', N'标准表格', N'ListIndexCom', N'views/list/Index.vue', N'/list', NULL, NULL, N'7', N'1', N'1', N'1', N'1', N'2', N'2022-03-04 12:26:41.0000000', N'2020-12-17 14:51:07.0000000')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [LastModificationTime], [CreationTime]) VALUES (N'10', N'1.10', N'60', N'富文本编辑器', N'EditorCom', N'views/Editor.vue', N'/editor', NULL, N'PicRightOutlined', N'1', N'1', N'1', N'1', N'1', N'2', N'2022-03-04 12:26:46.0000000', N'2021-01-18 19:34:28.0000000')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [LastModificationTime], [CreationTime]) VALUES (N'11', N'1.11', N'70', N'跳转外部地址', N'ExternalJumpCom', N'components/ExternalJump.vue', N'/external/jump/:path(.*)', N'https://antv.vision/zh', N'RadarChartOutlined', N'1', N'1', N'1', N'1', N'1', N'2', N'2022-03-04 12:26:49.0000000', N'2021-08-05 21:51:12.0000000')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [LastModificationTime], [CreationTime]) VALUES (N'12', N'12', N'50', N'基础信息', NULL, NULL, NULL, NULL, N'GoldOutlined', NULL, N'1', N'1', N'1', N'1', N'1', N'2022-03-04 12:25:43.0000000', N'2018-03-10 12:16:38.0000000')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [LastModificationTime], [CreationTime]) VALUES (N'13', N'12.13', N'10', N'会员管理', N'base_member', N'views/base/member/Index.vue', N'/base/member', NULL, N'UsergroupAddOutlined', N'12', N'1', N'1', N'1', N'1', N'2', N'2022-03-04 12:26:55.0000000', N'2018-03-10 12:16:38.0000000')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [LastModificationTime], [CreationTime]) VALUES (N'14', N'14', N'100', N'系统管理', NULL, NULL, NULL, NULL, N'DesktopOutlined', NULL, N'1', N'1', N'1', N'1', N'1', N'2022-03-04 12:25:46.0000000', N'2018-03-10 12:16:38.0000000')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [LastModificationTime], [CreationTime]) VALUES (N'15', N'14.15', N'100', N'账户管理', N'system_user', N'views/system/user/Index.vue', N'/system/user', NULL, N'UserOutlined', N'14', N'1', N'1', N'1', N'1', N'2', N'2022-03-04 12:27:02.0000000', N'2018-03-10 12:16:38.0000000')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [LastModificationTime], [CreationTime]) VALUES (N'16', N'14.16', N'110', N'角色管理', N'system_role', N'views/system/role/Index.vue', N'/system/role', NULL, N'TeamOutlined', N'14', N'1', N'1', N'1', N'1', N'2', N'2022-04-22 22:24:03.0000000', N'2018-03-10 12:16:38.0000000')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [LastModificationTime], [CreationTime]) VALUES (N'17', N'14.17', N'120', N'功能管理', N'system_function', N'views/system/function/Index.vue', N'/system/function', NULL, N'ControlOutlined', N'14', N'1', N'1', N'1', N'1', N'2', N'2022-03-04 12:27:11.0000000', N'2018-03-10 12:16:38.0000000')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [LastModificationTime], [CreationTime]) VALUES (N'19', N'14.19', N'150', N'个人中心', N'system_personal_center', N'views/system/personal_center/Index.vue', N'/system/personal/center', NULL, N'FormOutlined', N'14', N'1', N'1', N'1', N'1', N'2', N'2022-03-04 12:27:19.0000000', N'2018-03-10 12:16:38.0000000')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [LastModificationTime], [CreationTime]) VALUES (N'20', N'14.20', N'160', N'岗位管理', N'system_post', N'views/system/post/Index.vue', N'/system/post', NULL, N'IdcardOutlined', N'14', N'1', N'1', N'1', N'1', N'2', N'2022-03-04 12:27:23.0000000', N'2021-05-27 17:29:49.0000000')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [LastModificationTime], [CreationTime]) VALUES (N'21', N'14.21', N'170', N'组织机构', N'system_organization', N'views/system/organization/Index.vue', N'/system/organization', NULL, N'ClusterOutlined', N'14', N'1', N'1', N'1', N'1', N'2', N'2022-03-04 12:27:27.0000000', N'2021-05-27 20:27:56.0000000')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [LastModificationTime], [CreationTime]) VALUES (N'22', N'29.22', N'10', N'接口文档', N'swagger', N'views/development_tool/Swagger.vue', N'/development_tool/swagger', NULL, N'FileSearchOutlined', N'29', N'1', N'1', N'1', N'1', N'2', N'2022-03-04 12:27:41.0000000', N'2018-03-10 12:17:03.0000000')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [LastModificationTime], [CreationTime]) VALUES (N'23', N'14.23', N'190', N'数据字典', N'system_dictionary', N'views/system/dictionary/Index.vue', N'/system/dictionary', NULL, N'FileDoneOutlined', N'14', N'1', N'1', N'1', N'1', N'2', N'2022-03-04 12:27:31.0000000', N'2021-07-25 21:50:01.0000000')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [LastModificationTime], [CreationTime]) VALUES (N'24', N'14.24', N'200', N'操作日志', N'sys_operation_log', N'views/system/sys_operation_log/Index.vue', N'/system/sys_operation_log', N'', N'ContainerOutlined', N'14', N'1', N'1', N'1', N'1', N'2', N'2022-03-04 12:27:35.0000000', N'2021-08-05 21:24:54.0000000')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [LastModificationTime], [CreationTime]) VALUES (N'25', N'14.25', N'130', N'菜单功能', N'system_menu', N'views/system/menu/Index.vue', N'/system/menu', NULL, N'MenuOutlined', N'14', N'1', N'1', N'1', N'1', N'2', N'2022-03-04 12:27:15.0000000', N'2018-03-10 12:16:38.0000000')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [LastModificationTime], [CreationTime]) VALUES (N'28', N'1.28', N'1', N'Vxe-Table', N'VxeTableCom', N'views/VxeTable.vue', N'/vxe/table', NULL, N'BorderlessTableOutlined', N'1', N'1', N'1', N'1', N'1', N'2', N'2022-03-04 12:26:00.0000000', N'2021-12-29 17:13:26.0000000')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [LastModificationTime], [CreationTime]) VALUES (N'29', N'29', N'200', N'开发工具', NULL, NULL, NULL, NULL, N'CodepenOutlined', NULL, N'1', N'1', N'1', N'1', N'1', N'2022-03-04 12:25:49.0000000', N'2022-01-12 14:17:21.0000000')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [LastModificationTime], [CreationTime]) VALUES (N'30', N'29.30', N'20', N'定时任务', N'TimedTaskCom', N'views/development_tool/timed_task/Index.vue', N'/development_tool/timed_task', NULL, N'FieldTimeOutlined', N'29', N'1', N'1', N'1', N'1', N'2', N'2022-03-04 12:27:44.0000000', N'2022-01-12 14:22:04.0000000')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [LastModificationTime], [CreationTime]) VALUES (N'31', N'29.31', N'30', N'代码生成', N'LowCode', N'views/development_tool/low_code/Index.vue', N'/development-tool/low-code', NULL, N'CodeTwoTone', N'29', N'1', N'1', N'1', N'1', N'2', N'2022-05-24 22:05:57.0000000', N'2022-01-12 15:39:46.0000000')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [LastModificationTime], [CreationTime]) VALUES (N'32', N'1.32', N'20', N'图标展示', N'IconsVue', N'views/Icons.vue', N'/icons', NULL, N'TagsTwoTone', N'1', N'1', N'1', N'1', N'1', N'2', N'2022-03-18 12:06:38.0000000', N'2022-02-24 10:51:38.0000000')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [LastModificationTime], [CreationTime]) VALUES (N'33', N'29.33', N'40', N'EFCore监控台', N'monitor_ef_core', N'views/development_tool/monitor_ef_core/Index.vue', N'/development_tool/monitor/efcore', NULL, N'DashboardFilled', N'29', N'1', N'1', N'1', N'1', N'2', N'2022-04-10 10:56:17.0000000', N'2022-04-10 10:55:41.0000000')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LevelCode], [Number], [Name], [ComponentName], [Url], [Router], [JumpUrl], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [Type], [LastModificationTime], [CreationTime]) VALUES (N'36', N'12.13.36', N'1', N'详情', N'base_member_info_Details', N'views/base/member/components/Details.vue', N'/base/member/details/:id/:title', NULL, NULL, N'13', N'0', N'1', N'1', N'1', N'2', N'2022-04-17 17:49:13.0000000', N'2022-04-17 17:45:25.0000000')
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
  [Number] int  NULL,
  [MenuId] int  NOT NULL,
  [FunctionCode] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [FunctionName] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Remark] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [LastModificationTime] datetime2(7)  NOT NULL,
  [CreationTime] datetime2(7)  NOT NULL
)
GO

ALTER TABLE [dbo].[sys_menu_function] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of sys_menu_function
-- ----------------------------
INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'33C80938-82C8-4299-0F12-08D9FDAD00AB', N'10', N'30', N'Display', N'显示', N'Display', N'2022-03-04 15:17:09.0000000', N'2022-03-04 15:17:09.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'EF70B789-21EE-4850-0F1B-08D9FDAD00AB', N'10', N'22', N'Display', N'显示', N'Display', N'2022-03-04 15:16:44.0000000', N'2022-03-04 15:16:44.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'A7CD04DB-BBE3-49B6-0F1E-08D9FDAD00AB', N'10', N'2', N'Display', N'显示', N'Display', N'2022-03-18 12:06:20.0000000', N'2022-03-18 12:06:20.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'6C09C0C0-72FA-4842-0F1F-08D9FDAD00AB', N'10', N'32', N'Display', N'显示', N'Display', N'2022-03-18 12:06:38.0000000', N'2022-03-18 12:06:38.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'F64CFE50-1EF1-457F-0F20-08D9FDAD00AB', N'10', N'3', N'Display', N'显示', N'Display', N'2022-03-04 15:24:24.0000000', N'2022-03-04 15:24:24.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'A1DDD02F-8C21-4D79-0F21-08D9FDAD00AB', N'10', N'5', N'Display', N'显示', N'Display', N'2022-03-04 15:24:30.0000000', N'2022-03-04 15:24:30.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'1CB6FBE1-4A6C-4AAD-0F22-08D9FDAD00AB', N'10', N'6', N'Display', N'显示', N'Display', N'2022-03-04 15:24:34.0000000', N'2022-03-04 15:24:34.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'D2E6EA60-2CF6-478A-0F23-08D9FDAD00AB', N'10', N'8', N'Display', N'显示', N'Display', N'2022-03-04 15:24:40.0000000', N'2022-03-04 15:24:40.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'B7533A90-DAE4-4263-0F24-08D9FDAD00AB', N'10', N'9', N'Display', N'显示', N'Display', N'2022-03-04 15:24:43.0000000', N'2022-03-04 15:24:43.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'EC535908-8671-4928-0F25-08D9FDAD00AB', N'10', N'10', N'Display', N'显示', N'Display', N'2022-03-04 15:24:47.0000000', N'2022-03-04 15:24:47.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'3BC0E68F-D03D-4E99-0F26-08D9FDAD00AB', N'10', N'11', N'Display', N'显示', N'Display', N'2022-03-04 15:24:53.0000000', N'2022-03-04 15:24:53.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'EB958545-6449-40DB-0F27-08D9FDAD00AB', N'10', N'13', N'Display', N'显示', N'Display', N'2022-03-04 15:25:07.0000000', N'2022-03-04 15:25:07.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'B5881044-AFB8-40B2-0F28-08D9FDAD00AB', N'20', N'13', N'Insert', N'添加', N'Insert', N'2022-03-04 15:25:07.0000000', N'2022-03-04 15:25:07.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'106FB69A-8BB5-4559-0F29-08D9FDAD00AB', N'30', N'13', N'Update', N'修改', N'Update', N'2022-03-04 15:25:07.0000000', N'2022-03-04 15:25:07.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'F4621FBE-6B40-4454-0F2A-08D9FDAD00AB', N'40', N'13', N'Delete', N'删除', N'Delete', N'2022-03-04 15:25:07.0000000', N'2022-03-04 15:25:07.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'523B53B5-8159-4A16-0F2B-08D9FDAD00AB', N'50', N'13', N'Save', N'保存', N'Save', N'2022-03-04 15:25:07.0000000', N'2022-03-04 15:25:07.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'A3754771-F6E9-4A23-0F2C-08D9FDAD00AB', N'60', N'13', N'Search', N'检索', N'Search', N'2022-03-04 15:25:07.0000000', N'2022-03-04 15:25:07.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'B96F977C-A36E-4E7F-0F2D-08D9FDAD00AB', N'70', N'13', N'Export', N'导出', N'Export', N'2022-03-04 15:25:07.0000000', N'2022-03-04 15:25:07.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'541D9045-47B2-4629-0F2E-08D9FDAD00AB', N'80', N'13', N'Print', N'打印', N'Print', N'2022-03-04 15:25:07.0000000', N'2022-03-04 15:25:07.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'13F3F74D-C6FC-4488-0F2F-08D9FDAD00AB', N'10', N'15', N'Display', N'显示', N'Display', N'2022-03-04 15:25:14.0000000', N'2022-03-04 15:25:14.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'CCE82EB4-7FC5-4308-0F30-08D9FDAD00AB', N'20', N'15', N'Insert', N'添加', N'Insert', N'2022-03-04 15:25:14.0000000', N'2022-03-04 15:25:14.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'8564E4D8-D7F4-4F12-0F31-08D9FDAD00AB', N'30', N'15', N'Update', N'修改', N'Update', N'2022-03-04 15:25:14.0000000', N'2022-03-04 15:25:14.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'0AD6A459-1D9D-4512-0F32-08D9FDAD00AB', N'40', N'15', N'Delete', N'删除', N'Delete', N'2022-03-04 15:25:14.0000000', N'2022-03-04 15:25:14.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'37D3E492-62DA-47A4-0F33-08D9FDAD00AB', N'50', N'15', N'Save', N'保存', N'Save', N'2022-03-04 15:25:14.0000000', N'2022-03-04 15:25:14.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'BEB87004-5CFB-417A-0F34-08D9FDAD00AB', N'60', N'15', N'Search', N'检索', N'Search', N'2022-03-04 15:25:14.0000000', N'2022-03-04 15:25:14.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'A46E07D3-C722-4548-0F35-08D9FDAD00AB', N'70', N'15', N'Export', N'导出', N'Export', N'2022-03-04 15:25:14.0000000', N'2022-03-04 15:25:14.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'C8EDBB79-567E-461B-0F36-08D9FDAD00AB', N'80', N'15', N'Print', N'打印', N'Print', N'2022-03-04 15:25:14.0000000', N'2022-03-04 15:25:14.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'550F874B-E804-44A0-0F37-08D9FDAD00AB', N'10', N'16', N'Display', N'显示', N'Display', N'2022-04-22 22:24:03.0000000', N'2022-04-22 22:24:03.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'C67A0ABE-DAEC-491B-0F38-08D9FDAD00AB', N'20', N'16', N'Insert', N'添加', N'Insert', N'2022-04-22 22:24:03.0000000', N'2022-04-22 22:24:03.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'823AC05D-65E4-4216-0F39-08D9FDAD00AB', N'30', N'16', N'Update', N'修改', N'Update', N'2022-04-22 22:24:03.0000000', N'2022-04-22 22:24:03.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'BD6AE6DA-1CA6-46C2-0F3A-08D9FDAD00AB', N'40', N'16', N'Delete', N'删除', N'Delete', N'2022-04-22 22:24:03.0000000', N'2022-04-22 22:24:03.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'14783A71-E265-4D6B-0F3B-08D9FDAD00AB', N'50', N'16', N'Save', N'保存', N'Save', N'2022-04-22 22:24:03.0000000', N'2022-04-22 22:24:03.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'2FEA8F87-2A13-4C95-0F3C-08D9FDAD00AB', N'60', N'16', N'Search', N'检索', N'Search', N'2022-04-22 22:24:03.0000000', N'2022-04-22 22:24:03.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'437FBF85-8704-4E87-0F3D-08D9FDAD00AB', N'70', N'16', N'Export', N'导出', N'Export', N'2022-04-22 22:24:03.0000000', N'2022-04-22 22:24:03.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'6B009415-EADF-4DAB-0F3E-08D9FDAD00AB', N'80', N'16', N'Print', N'打印', N'Print', N'2022-04-22 22:24:03.0000000', N'2022-04-22 22:24:03.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'53FDB4A0-CA6E-4568-0F3F-08D9FDAD00AB', N'10', N'17', N'Display', N'显示', N'Display', N'2022-03-04 15:25:21.0000000', N'2022-03-04 15:25:21.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'86465238-C51C-45D5-0F40-08D9FDAD00AB', N'20', N'17', N'Insert', N'添加', N'Insert', N'2022-03-04 15:25:21.0000000', N'2022-03-04 15:25:21.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'86FF83FD-D34A-4290-0F41-08D9FDAD00AB', N'30', N'17', N'Update', N'修改', N'Update', N'2022-03-04 15:25:21.0000000', N'2022-03-04 15:25:21.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'7EA8F706-BFE5-42B2-0F42-08D9FDAD00AB', N'40', N'17', N'Delete', N'删除', N'Delete', N'2022-03-04 15:25:21.0000000', N'2022-03-04 15:25:21.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'DEE401B1-E20E-496E-0F43-08D9FDAD00AB', N'50', N'17', N'Save', N'保存', N'Save', N'2022-03-04 15:25:21.0000000', N'2022-03-04 15:25:21.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'0B27E69F-AF16-4481-0F44-08D9FDAD00AB', N'60', N'17', N'Search', N'检索', N'Search', N'2022-03-04 15:25:21.0000000', N'2022-03-04 15:25:21.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'A726455F-1C29-4BE0-0F45-08D9FDAD00AB', N'70', N'17', N'Export', N'导出', N'Export', N'2022-03-04 15:25:21.0000000', N'2022-03-04 15:25:21.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'0CAA6E7D-92B0-4814-0F46-08D9FDAD00AB', N'80', N'17', N'Print', N'打印', N'Print', N'2022-03-04 15:25:21.0000000', N'2022-03-04 15:25:21.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'DB3AB8BD-7709-41A2-0F47-08D9FDAD00AB', N'10', N'25', N'Display', N'显示', N'Display', N'2022-03-04 15:25:28.0000000', N'2022-03-04 15:25:28.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'FE6465BF-E429-45BD-0F48-08D9FDAD00AB', N'20', N'25', N'Insert', N'添加', N'Insert', N'2022-03-04 15:25:28.0000000', N'2022-03-04 15:25:28.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'4A67FCDB-A7A9-4E3C-0F49-08D9FDAD00AB', N'30', N'25', N'Update', N'修改', N'Update', N'2022-03-04 15:25:28.0000000', N'2022-03-04 15:25:28.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'20AB5395-D57C-49DB-0F4A-08D9FDAD00AB', N'40', N'25', N'Delete', N'删除', N'Delete', N'2022-03-04 15:25:28.0000000', N'2022-03-04 15:25:28.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'41CB1942-573A-4D63-0F4B-08D9FDAD00AB', N'50', N'25', N'Save', N'保存', N'Save', N'2022-03-04 15:25:28.0000000', N'2022-03-04 15:25:28.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'7E0F6C84-D7F1-4243-0F4C-08D9FDAD00AB', N'60', N'25', N'Search', N'检索', N'Search', N'2022-03-04 15:25:28.0000000', N'2022-03-04 15:25:28.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'1E69DF5D-D1E9-4BC8-0F4D-08D9FDAD00AB', N'70', N'25', N'Export', N'导出', N'Export', N'2022-03-04 15:25:28.0000000', N'2022-03-04 15:25:28.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'4BBBE120-0CC6-4A08-0F4E-08D9FDAD00AB', N'80', N'25', N'Print', N'打印', N'Print', N'2022-03-04 15:25:28.0000000', N'2022-03-04 15:25:28.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'45E2CA86-4823-4FB9-0F57-08D9FDAD00AB', N'10', N'20', N'Display', N'显示', N'Display', N'2022-03-04 15:25:36.0000000', N'2022-03-04 15:25:36.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'3E44C6F5-E090-40A1-0F58-08D9FDAD00AB', N'20', N'20', N'Insert', N'添加', N'Insert', N'2022-03-04 15:25:36.0000000', N'2022-03-04 15:25:36.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'22A675F6-EFDA-481D-0F59-08D9FDAD00AB', N'30', N'20', N'Update', N'修改', N'Update', N'2022-03-04 15:25:36.0000000', N'2022-03-04 15:25:36.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'69DA651E-787B-42E5-0F5A-08D9FDAD00AB', N'40', N'20', N'Delete', N'删除', N'Delete', N'2022-03-04 15:25:36.0000000', N'2022-03-04 15:25:36.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'616C4E4A-FB61-49CF-0F5B-08D9FDAD00AB', N'50', N'20', N'Save', N'保存', N'Save', N'2022-03-04 15:25:36.0000000', N'2022-03-04 15:25:36.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'5E4E87BD-C179-4B5B-0F5C-08D9FDAD00AB', N'60', N'20', N'Search', N'检索', N'Search', N'2022-03-04 15:25:36.0000000', N'2022-03-04 15:25:36.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'54743C86-AC73-4345-0F5D-08D9FDAD00AB', N'70', N'20', N'Export', N'导出', N'Export', N'2022-03-04 15:25:36.0000000', N'2022-03-04 15:25:36.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'2469188C-21DE-492A-0F5E-08D9FDAD00AB', N'80', N'20', N'Print', N'打印', N'Print', N'2022-03-04 15:25:36.0000000', N'2022-03-04 15:25:36.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'C6BA141B-99BA-4114-0F5F-08D9FDAD00AB', N'10', N'21', N'Display', N'显示', N'Display', N'2022-03-04 15:25:40.0000000', N'2022-03-04 15:25:40.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'0A85E4FD-5A1C-47F6-0F60-08D9FDAD00AB', N'20', N'21', N'Insert', N'添加', N'Insert', N'2022-03-04 15:25:40.0000000', N'2022-03-04 15:25:40.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'F4C73AC0-C66D-4988-0F61-08D9FDAD00AB', N'30', N'21', N'Update', N'修改', N'Update', N'2022-03-04 15:25:40.0000000', N'2022-03-04 15:25:40.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'3CB3CBC7-9E45-4CC3-0F62-08D9FDAD00AB', N'40', N'21', N'Delete', N'删除', N'Delete', N'2022-03-04 15:25:40.0000000', N'2022-03-04 15:25:40.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'6B209D5A-B366-4A61-0F63-08D9FDAD00AB', N'50', N'21', N'Save', N'保存', N'Save', N'2022-03-04 15:25:40.0000000', N'2022-03-04 15:25:40.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'F36B9B06-2826-425F-0F64-08D9FDAD00AB', N'60', N'21', N'Search', N'检索', N'Search', N'2022-03-04 15:25:40.0000000', N'2022-03-04 15:25:40.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'A9503588-E6F7-420B-0F65-08D9FDAD00AB', N'70', N'21', N'Export', N'导出', N'Export', N'2022-03-04 15:25:40.0000000', N'2022-03-04 15:25:40.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'C9E5FFF0-6744-47D7-0F66-08D9FDAD00AB', N'80', N'21', N'Print', N'打印', N'Print', N'2022-03-04 15:25:40.0000000', N'2022-03-04 15:25:40.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'9426768E-B90D-41E1-0F67-08D9FDAD00AB', N'10', N'23', N'Display', N'显示', N'Display', N'2022-03-04 15:25:50.0000000', N'2022-03-04 15:25:50.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'E991934A-0D30-416B-0F68-08D9FDAD00AB', N'20', N'23', N'Insert', N'添加', N'Insert', N'2022-03-04 15:25:50.0000000', N'2022-03-04 15:25:50.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'B98A365E-6FB4-4EFB-0F69-08D9FDAD00AB', N'30', N'23', N'Update', N'修改', N'Update', N'2022-03-04 15:25:50.0000000', N'2022-03-04 15:25:50.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'92B39A10-3927-4EE7-0F6A-08D9FDAD00AB', N'40', N'23', N'Delete', N'删除', N'Delete', N'2022-03-04 15:25:50.0000000', N'2022-03-04 15:25:50.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'A03D56D7-4B0D-47CC-0F6B-08D9FDAD00AB', N'50', N'23', N'Save', N'保存', N'Save', N'2022-03-04 15:25:50.0000000', N'2022-03-04 15:25:50.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'E2319118-42CC-41A2-0F6C-08D9FDAD00AB', N'60', N'23', N'Search', N'检索', N'Search', N'2022-03-04 15:25:50.0000000', N'2022-03-04 15:25:50.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'0984A2E1-3722-41D4-0F6D-08D9FDAD00AB', N'70', N'23', N'Export', N'导出', N'Export', N'2022-03-04 15:25:50.0000000', N'2022-03-04 15:25:50.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'1D831D57-6634-45D7-0F6E-08D9FDAD00AB', N'80', N'23', N'Print', N'打印', N'Print', N'2022-03-04 15:25:50.0000000', N'2022-03-04 15:25:50.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'C77C812A-1601-4311-0F70-08D9FDAD00AB', N'10', N'19', N'Display', N'显示', N'Display', N'2022-03-04 15:26:00.0000000', N'2022-03-04 15:26:00.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'3F6D0AF7-5386-4D3A-0F71-08D9FDAD00AB', N'10', N'28', N'Display', N'显示', N'Display', N'2022-03-04 15:40:52.0000000', N'2022-03-04 15:40:52.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'55750F56-EDC9-4771-E2D6-08D9FDEFA8F8', N'10', N'24', N'Display', N'显示', N'Display', N'2022-03-04 23:00:02.0000000', N'2022-03-04 23:00:02.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'7694FBF5-E28D-424C-E2D7-08D9FDEFA8F8', N'40', N'24', N'Delete', N'删除', N'Delete', N'2022-03-04 23:00:02.0000000', N'2022-03-04 23:00:02.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'2186550D-246C-4552-E2D8-08D9FDEFA8F8', N'60', N'24', N'Search', N'检索', N'Search', N'2022-03-04 23:00:02.0000000', N'2022-03-04 23:00:02.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'687254AE-0D76-4788-A4E8-08DA1A9D9949', N'10', N'33', N'Display', N'显示', N'Display', N'2022-04-10 10:56:17.0000000', N'2022-04-10 10:56:17.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'0073CCE2-FF42-496C-9FF6-08DA204FCECB', N'10', N'36', N'Display', N'显示', N'Display', N'2022-04-17 20:40:12.0000000', N'2022-04-17 20:40:12.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'48F0A694-0539-4E69-A2E4-08DA3D8E6577', N'10', N'31', N'Display', N'显示', N'Display', N'2022-05-24 22:05:57.0000000', N'2022-05-24 22:05:57.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'4DBF096D-D3D3-4565-A2E5-08DA3D8E6577', N'40', N'31', N'Delete', N'删除', N'Delete', N'2022-05-24 22:05:57.0000000', N'2022-05-24 22:05:57.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'38B4704D-7C5D-4F89-A2E7-08DA3D8E6577', N'60', N'31', N'Search', N'检索', N'Search', N'2022-05-24 22:05:57.0000000', N'2022-05-24 22:05:57.0000000')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'7890CC93-DED0-4C18-B325-08DA716B6134', N'10', N'37', N'Display', N'显示', N'Display', N'2022-07-29 22:35:08.5150335', N'2022-07-29 22:35:08.5150322')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'8D82D688-77DD-4CA6-B326-08DA716B6134', N'20', N'37', N'Insert', N'添加', N'Insert', N'2022-07-29 22:35:08.5150337', N'2022-07-29 22:35:08.5150336')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'628C6E8C-3FC6-4DD0-B327-08DA716B6134', N'30', N'37', N'Update', N'修改', N'Update', N'2022-07-29 22:35:08.5150338', N'2022-07-29 22:35:08.5150337')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'377B961C-3DEE-445A-B328-08DA716B6134', N'40', N'37', N'Delete', N'删除', N'Delete', N'2022-07-29 22:35:08.5150339', N'2022-07-29 22:35:08.5150338')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'25774728-1C9A-476A-B329-08DA716B6134', N'50', N'37', N'Save', N'保存', N'Save', N'2022-07-29 22:35:08.5150340', N'2022-07-29 22:35:08.5150339')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'A63BE630-AC04-40AA-B32A-08DA716B6134', N'60', N'37', N'Search', N'检索', N'Search', N'2022-07-29 22:35:08.5150341', N'2022-07-29 22:35:08.5150340')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'BFC1476C-DB0D-4DB4-B32B-08DA716B6134', N'70', N'37', N'Export', N'导出', N'Export', N'2022-07-29 22:35:08.5150342', N'2022-07-29 22:35:08.5150341')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'F8C7EE2C-842E-402E-B32C-08DA716B6134', N'80', N'37', N'Print', N'打印', N'Print', N'2022-07-29 22:35:08.5150343', N'2022-07-29 22:35:08.5150342')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'DDD08D34-55A2-43EB-B32D-08DA716B6134', N'10', N'38', N'Display', N'显示', N'Display', N'2022-07-29 22:16:34.6119656', N'2022-07-29 22:16:34.6119640')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'09B50A32-5748-408C-B32E-08DA716B6134', N'20', N'38', N'Insert', N'添加', N'Insert', N'2022-07-29 22:16:34.6119657', N'2022-07-29 22:16:34.6119657')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'299C81A3-66A6-4FF2-B32F-08DA716B6134', N'30', N'38', N'Update', N'修改', N'Update', N'2022-07-29 22:16:34.6119658', N'2022-07-29 22:16:34.6119658')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'B3847204-1AFA-4F58-B330-08DA716B6134', N'40', N'38', N'Delete', N'删除', N'Delete', N'2022-07-29 22:16:34.6119659', N'2022-07-29 22:16:34.6119659')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'01D95CC7-BC8C-4735-B331-08DA716B6134', N'50', N'38', N'Save', N'保存', N'Save', N'2022-07-29 22:16:34.6119660', N'2022-07-29 22:16:34.6119660')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'FC75B3A0-2A84-48F2-B332-08DA716B6134', N'60', N'38', N'Search', N'检索', N'Search', N'2022-07-29 22:16:34.6119662', N'2022-07-29 22:16:34.6119661')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'FCCD54AB-9E7D-4184-B333-08DA716B6134', N'70', N'38', N'Export', N'导出', N'Export', N'2022-07-29 22:16:34.6119663', N'2022-07-29 22:16:34.6119663')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'38F4D17C-D4A1-44F3-B334-08DA716B6134', N'80', N'38', N'Print', N'打印', N'Print', N'2022-07-29 22:16:34.6119664', N'2022-07-29 22:16:34.6119664')
GO


-- ----------------------------
-- Table structure for sys_operation_log
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_operation_log]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_operation_log]
GO

CREATE TABLE [dbo].[sys_operation_log] (
  [Id] uniqueidentifier  NOT NULL,
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
  [ActionDisplayName] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [LastModificationTime] datetime2(7)  NOT NULL,
  [CreationTime] datetime2(7)  NOT NULL
)
GO

ALTER TABLE [dbo].[sys_operation_log] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of sys_operation_log
-- ----------------------------
INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'2B15A020-5024-43D3-26A7-08DA71EA27AD', N'/', N'0.0.0.1', N'', N'', N'', N'2', N'Edge103', N'Windows10', NULL, NULL, NULL, N'2022-07-30 13:12:52.9656238', N'2022-07-30 13:12:52.9656222')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'E65B1B19-D1CA-4C9D-26A8-08DA71EA27AD', N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'437', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息', N'2022-07-30 13:12:54.3261588', N'2022-07-30 13:12:54.3261572')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'2422CF96-A2F0-4C4A-26A9-08DA71EA27AD', N'/api/admin/SysOrganization/sysOrganizationTree', N'0.0.0.1', N'', N'{}', N'', N'91', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'组织机构', N'查看组织架构树', N'2022-07-30 13:13:08.3847798', N'2022-07-30 13:13:08.3847790')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'2178900A-5C08-48AD-26AA-08DA71EA27AD', N'/api/admin/SysUser/findList/10/1', N'0.0.0.1', N'', N'{"name":null,"loginName":null,"organizationId":null}', N'', N'481', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查看数据', N'2022-07-30 13:13:08.9497078', N'2022-07-30 13:13:08.9497064')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'0881A4EA-6D24-496F-26AB-08DA71EA27AD', N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'17', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息', N'2022-07-30 13:14:50.5664771', N'2022-07-30 13:14:50.5664765')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'FB52287F-318A-4A28-26AC-08DA71EA27AD', N'/api/admin/SysOrganization/sysOrganizationTree', N'0.0.0.1', N'', N'{}', N'', N'47', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'组织机构', N'查看组织架构树', N'2022-07-30 13:14:50.8497212', N'2022-07-30 13:14:50.8497207')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'E3B8D508-AB7F-494C-26AD-08DA71EA27AD', N'/api/admin/SysUser/findList/10/1', N'0.0.0.1', N'', N'{"name":null,"loginName":null,"organizationId":null}', N'', N'27', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'查看数据', N'2022-07-30 13:14:50.9428101', N'2022-07-30 13:14:50.9428096')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'EE55E99D-7E20-416E-26AE-08DA71EA27AD', N'/api/admin/SysRole/findList/10/1', N'0.0.0.1', N'', N'{"name":null}', N'', N'46', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'角色', N'查看表格', N'2022-07-30 13:14:53.4816999', N'2022-07-30 13:14:53.4816990')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'F93C5E5D-64D6-4A66-26AF-08DA71EA27AD', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'126', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 13:14:56.2737148', N'2022-07-30 13:14:56.2737141')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'28A6587A-8739-43C3-26B0-08DA71EA27AD', N'/api/admin/LowCodeTableInfo/findList/20/1', N'0.0.0.1', N'', N'{"columnName":null,"describe":null,"low_Code_TableId":"6323638b-a45f-4a76-886e-69a9e9be0901"}', N'', N'28', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeSearchController', NULL, N'2022-07-30 13:14:57.7210100', N'2022-07-30 13:14:57.7210091')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'7728B4FC-DA64-46CA-26B1-08DA71EA27AD', N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"sys_user","type":"HZY.Models","codeText":""}', N'', N'229', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码', N'2022-07-30 13:14:59.5768544', N'2022-07-30 13:14:59.5768538')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'97710DA2-7858-41AD-26B2-08DA71EA27AD', N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'9', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息', N'2022-07-30 13:15:29.3697010', N'2022-07-30 13:15:29.3697004')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'B8E37C55-6C78-4409-26B3-08DA71EA27AD', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'144', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 13:15:29.8180965', N'2022-07-30 13:15:29.8180953')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'421359AD-5766-4D09-26B4-08DA71EA27AD', N'/api/admin/LowCodeTableInfo/findList/20/1', N'0.0.0.1', N'', N'{"columnName":null,"describe":null,"low_Code_TableId":"6323638b-a45f-4a76-886e-69a9e9be0901"}', N'', N'7', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeSearchController', NULL, N'2022-07-30 13:15:30.9663733', N'2022-07-30 13:15:30.9663727')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'953E65C0-EC38-40B1-26B5-08DA71EA27AD', N'/api/admin/LowCodeTable/findForm/6323638b-a45f-4a76-886e-69a9e9be0901', N'0.0.0.1', N'', N'', N'', N'28', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据', N'2022-07-30 13:15:31.8115318', N'2022-07-30 13:15:31.8115311')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'9F689E47-62B6-4AA3-26B6-08DA71EA27AD', N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"sys_user","type":"HZY.Models","codeText":""}', N'', N'173', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码', N'2022-07-30 13:15:33.4411822', N'2022-07-30 13:15:33.4411815')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'135AB500-D8B2-4111-26B7-08DA71EA27AD', N'/api/admin/LowCodeTable/findForm/6323638b-a45f-4a76-886e-69a9e9be0901', N'0.0.0.1', N'', N'', N'', N'4', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据', N'2022-07-30 13:15:34.5453865', N'2022-07-30 13:15:34.5453860')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'2B3BB29A-1F93-4D89-26B8-08DA71EA27AD', N'/api/admin/LowCodeTable/update', N'0.0.0.1', N'', N'{"tableName":"sys_user","schema":"dbo","type":"TABLE","displayName":"用户","entityName":"SysUser","remark":null,"projectRootPath":"HzyAdmin","modelPath":"hzy-admin-server/HZY.Models/Entities/","servicePath":"hzy-admin-server/HZY.Services.Admin/","controllerPath":"hzy-admin-server/HZY.Controllers.Admin/","indexVuePath":"hzy-admin-client/src/views/my/","infoVuePath":"hzy-admin-client/src/views/my/","serviceJsPath":"hzy-admin-client/src/service/my/","isCover":false,"id":"6323638b-a45f-4a76-886e-69a9e9be0901","lastModificationTime":"2022-07-30 12:48:34","creationTime":"2022-04-17 00:00:00"}', N'', N'53', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'编辑表单', N'2022-07-30 13:15:43.5033984', N'2022-07-30 13:15:43.5033978')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'CAF39443-280E-4D22-26B9-08DA71EA27AD', N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"sys_user","type":"HZY.Models","codeText":""}', N'', N'194', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码', N'2022-07-30 13:15:45.3369382', N'2022-07-30 13:15:45.3369376')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'7A798EDC-34B3-4CBB-26BA-08DA71EA27AD', N'/api/admin/LowCodeTable/findForm/6323638b-a45f-4a76-886e-69a9e9be0901', N'0.0.0.1', N'', N'', N'', N'5', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据', N'2022-07-30 13:15:45.8906498', N'2022-07-30 13:15:45.8906493')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'343F9234-5B6C-486F-26BB-08DA71EA27AD', N'/api/admin/LowCodeTable/findForm/6323638b-a45f-4a76-886e-69a9e9be0901', N'0.0.0.1', N'', N'', N'', N'3', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据', N'2022-07-30 13:15:47.4466780', N'2022-07-30 13:15:47.4466773')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'361F9607-9A8D-4E93-D62A-08DA7224EEFD', N'/', N'0.0.0.1', N'', N'', N'', N'5', N'Edge103', N'Windows10', NULL, NULL, NULL, N'2022-07-30 20:13:38.2637856', N'2022-07-30 20:13:38.2637844')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'5CA2F21D-CAEF-4B69-D62B-08DA7224EEFD', N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'557', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息', N'2022-07-30 20:13:40.3616160', N'2022-07-30 20:13:40.3616147')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'4D197A0B-8552-48AB-D62C-08DA7224EEFD', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'432', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:13:52.7151889', N'2022-07-30 20:13:52.7151883')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'4FCA4D77-8F39-4A13-D62D-08DA7224EEFD', N'/api/admin/LowCodeTable/findList/10/2', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'170', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:13:55.4582227', N'2022-07-30 20:13:55.4582223')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'0A1E3EAF-9E8C-4BF1-D62E-08DA7224EEFD', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'154', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:13:57.8911933', N'2022-07-30 20:13:57.8911928')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'4A404D13-4AEA-4A43-D62F-08DA7224EEFD', N'/api/admin/LowCodeTable/synchronization', N'0.0.0.1', N'', N'', N'', N'1222', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:14:00.5708637', N'2022-07-30 20:14:00.5708632')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'AF107168-D286-4396-D630-08DA7224EEFD', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'146', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:14:00.7819908', N'2022-07-30 20:14:00.7819903')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'908310DE-578A-46DF-D631-08DA7224EEFD', N'/api/admin/LowCodeTable/findList/10/2', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'156', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:14:04.2645347', N'2022-07-30 20:14:04.2645340')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'1449D321-170B-493D-D632-08DA7224EEFD', N'/api/admin/LowCodeTable/findList/10/3', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'210', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:14:06.1342126', N'2022-07-30 20:14:06.1342110')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'485C8854-4A44-4B7B-D633-08DA7224EEFD', N'/api/admin/LowCodeTable/findList/10/3', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'163', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:14:19.8749730', N'2022-07-30 20:14:19.8749721')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'563C14D6-C6D8-40B9-D634-08DA7224EEFD', N'/api/admin/LowCodeTable/synchronization', N'0.0.0.1', N'', N'', N'', N'1078', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:17:13.8409974', N'2022-07-30 20:17:13.8409967')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'1A3FEB46-75A3-4758-D635-08DA7224EEFD', N'/api/admin/LowCodeTable/findList/10/3', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'196', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:17:14.1334916', N'2022-07-30 20:17:14.1334909')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'0F842C3F-BA29-40DA-B966-08DA72261B4C', N'/', N'0.0.0.1', N'', N'', N'', N'5', N'Edge103', N'Windows10', NULL, NULL, NULL, N'2022-07-30 20:22:02.1059490', N'2022-07-30 20:22:02.1059475')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'34F2E340-848D-4048-B967-08DA72261B4C', N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'455', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息', N'2022-07-30 20:22:03.3038679', N'2022-07-30 20:22:03.3038668')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'F26BCF5B-DF70-4017-B968-08DA72261B4C', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'442', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:22:09.9187152', N'2022-07-30 20:22:09.9187145')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'3EEEBC57-E81D-4005-B969-08DA72261B4C', N'/api/admin/LowCodeTable/findList/10/2', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'207', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:22:24.6668211', N'2022-07-30 20:22:24.6668201')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'BF9A5E50-D3D0-411D-B96A-08DA72261B4C', N'/api/admin/LowCodeTable/findList/10/3', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'157', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:22:27.0494572', N'2022-07-30 20:22:27.0494567')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'7BFD3F5E-935A-4704-B96B-08DA72261B4C', N'/api/admin/LowCodeTable/findList/10/2', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'151', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:22:29.4934518', N'2022-07-30 20:22:29.4934512')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'2182B3C2-EB87-4D34-B96C-08DA72261B4C', N'/api/admin/LowCodeTable/synchronization', N'0.0.0.1', N'', N'', N'', N'1009', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:22:37.1137127', N'2022-07-30 20:22:37.1137050')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'1D2F3BB9-F48E-46E6-B96D-08DA72261B4C', N'/api/admin/LowCodeTable/findList/10/2', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'159', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:22:37.3415585', N'2022-07-30 20:22:37.3415580')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'B943D051-A0FE-4483-B96E-08DA72261B4C', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'190', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:22:40.2405473', N'2022-07-30 20:22:40.2405466')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'0FDD8B57-F289-4C1E-B96F-08DA72261B4C', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'200', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:22:57.5863900', N'2022-07-30 20:22:57.5863895')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'222DBB1A-04B5-4265-B970-08DA72261B4C', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'166', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:23:23.3845117', N'2022-07-30 20:23:23.3845112')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'B727FFDE-83E1-40B9-B971-08DA72261B4C', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'202', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:23:24.4292369', N'2022-07-30 20:23:24.4292362')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'379E372A-FE7F-4CEF-3279-08DA722667A8', N'/', N'0.0.0.1', N'', N'', N'', N'5', N'Edge103', N'Windows10', NULL, NULL, NULL, N'2022-07-30 20:24:10.2262549', N'2022-07-30 20:24:10.2262535')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'5F6C70D6-414D-4EC5-327A-08DA722667A8', N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'476', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息', N'2022-07-30 20:24:11.4872956', N'2022-07-30 20:24:11.4872946')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'BB3510C9-8C00-4CC8-327B-08DA722667A8', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'461', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:24:15.6473471', N'2022-07-30 20:24:15.6473463')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'0F5DBEAA-12A7-48D6-327C-08DA722667A8', N'/api/admin/LowCodeTable/findList/10/2', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'240', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:24:38.0300285', N'2022-07-30 20:24:38.0300280')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'5449A4CA-3E97-4A5F-327D-08DA722667A8', N'/api/admin/LowCodeTable/findList/10/3', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'160', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:24:40.1485428', N'2022-07-30 20:24:40.1485423')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'47EF0A66-CCEF-4A45-327E-08DA722667A8', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'158', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:24:49.3081709', N'2022-07-30 20:24:49.3081705')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'14243924-92FD-4463-327F-08DA722667A8', N'/api/admin/LowCodeTable/findList/10/2', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'151', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:25:07.4207010', N'2022-07-30 20:25:07.4207005')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'38EC81C4-D7DD-456C-3280-08DA722667A8', N'/api/admin/LowCodeTable/findList/10/3', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'171', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:25:08.5085425', N'2022-07-30 20:25:08.5085421')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'D70F6551-15B1-41EC-3281-08DA722667A8', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'159', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:25:09.8191612', N'2022-07-30 20:25:09.8191605')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'7AD59FA0-4645-4810-3282-08DA722667A8', N'/api/admin/LowCodeTableInfo/findList/20/1', N'0.0.0.1', N'', N'{"columnName":null,"describe":null,"low_Code_TableId":"4cdafaad-c4f7-43d2-97be-7281d21d5466"}', N'', N'73', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeSearchController', NULL, N'2022-07-30 20:25:15.3931064', N'2022-07-30 20:25:15.3931059')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'70264833-C292-4145-3283-08DA722667A8', N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"sys_file_library","type":"HZY.Models","codeText":""}', N'', N'437', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码', N'2022-07-30 20:25:17.1399131', N'2022-07-30 20:25:17.1399124')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'B39F8A42-3701-4B28-3284-08DA722667A8', N'/api/admin/LowCodeTable/findForm/4cdafaad-c4f7-43d2-97be-7281d21d5466', N'0.0.0.1', N'', N'', N'', N'45', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据', N'2022-07-30 20:25:18.2667584', N'2022-07-30 20:25:18.2667579')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'2DE6F06E-3957-42BF-3285-08DA722667A8', N'/api/admin/LowCodeTable/change', N'0.0.0.1', N'', N'[{"id":"4cdafaad-c4f7-43d2-97be-7281d21d5466","tableName":"sys_file_library","displayName":"文件库","entityName":"SysFileLibrary","remark":"用于记录系统上传的文件","lastModificationTime":"2022-07-30","creationTime":"2022-07-30","_X_ROW_KEY":"row_78"},{"id":"18fbb18e-cb29-45d8-a5f3-c0121c57680a","tableName":"flow_approval_step_history","displayName":"","entityName":"FlowApprovalStepHistory","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-07-29","_X_ROW_KEY":"row_79"},{"id":"7f94e0db-fc63-40dc-bfe3-18c5aad75975","tableName":"flow_approval_step_history_user","displayName":"","entityName":"FlowApprovalStepHistoryUser","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-07-29","_X_ROW_KEY":"row_80"},{"id":"a9e68076-84d2-449f-a7c2-134f09984dfb","tableName":"__EFMigrationsHistory","displayName":"","entityName":"Efmigrationshistory","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-07-29","_X_ROW_KEY":"row_81"},{"id":"852f53ff-0d00-4c32-aa55-a9c11993751b","tableName":"low_code_list","displayName":"低代码列表","entityName":"LowCodeList","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-05-23","_X_ROW_KEY":"row_82"},{"id":"6ba9805c-916e-4d2c-99d0-216fcbc361cc","tableName":"low_code_table","displayName":"低代码表","entityName":"LowCodeTable","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-05-23","_X_ROW_KEY":"row_83"},{"id":"79fbd4ec-9f4e-45dc-8065-70f2eb422cdf","tableName":"low_code_table_info","displayName":"低代码表信息","entityName":"LowCodeTableInfo","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-05-23","_X_ROW_KEY":"row_84"},{"id":"69edd8a8-1d24-478c-a909-b82039edcec0","tableName":"low_code_search","displayName":"低代码检索表","entityName":"LowCodeSearch","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-05-23","_X_ROW_KEY":"row_85"},{"id":"d8948c56-c5bd-4061-b272-5417375f38f0","tableName":"flow_approval","displayName":"审批流审批","entityName":"FlowApproval","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-04-17","_X_ROW_KEY":"row_86"},{"id":"ae6d94d8-6a15-4348-b600-aa17e4b61718","tableName":"flow_node","displayName":"工作流节点","entityName":"FlowNode","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-04-17","_X_ROW_KEY":"row_87"}]', N'', N'110', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:25:57.7556342', N'2022-07-30 20:25:57.7556337')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'0E4BE058-9C4A-4AAA-3286-08DA722667A8', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'182', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:25:58.0146967', N'2022-07-30 20:25:58.0146962')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'2FAAEF47-9445-4CB7-3287-08DA722667A8', N'/api/admin/LowCodeTableInfo/findList/20/1', N'0.0.0.1', N'', N'{"columnName":null,"describe":null,"low_Code_TableId":"4cdafaad-c4f7-43d2-97be-7281d21d5466"}', N'', N'82', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeSearchController', NULL, N'2022-07-30 20:26:01.0728834', N'2022-07-30 20:26:01.0728827')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'9CB77FC0-0E28-423D-3288-08DA722667A8', N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"sys_file_library","type":"HZY.Models","codeText":""}', N'', N'259', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码', N'2022-07-30 20:26:15.9459406', N'2022-07-30 20:26:15.9459402')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'F3186CB0-C667-4455-3289-08DA722667A8', N'/api/admin/LowCodeTable/findForm/4cdafaad-c4f7-43d2-97be-7281d21d5466', N'0.0.0.1', N'', N'', N'', N'31', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据', N'2022-07-30 20:26:20.5673500', N'2022-07-30 20:26:20.5673496')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'292A3A9B-7134-4054-328A-08DA722667A8', N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"sys_file_library","type":"HZY.Models","codeText":""}', N'', N'260', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码', N'2022-07-30 20:26:23.4382697', N'2022-07-30 20:26:23.4382687')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'8706D8C1-E68F-43B6-328B-08DA722667A8', N'/api/admin/LowCodeTable/findForm/4cdafaad-c4f7-43d2-97be-7281d21d5466', N'0.0.0.1', N'', N'', N'', N'36', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据', N'2022-07-30 20:26:24.1441599', N'2022-07-30 20:26:24.1441590')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'FC28D6D9-5BC4-4743-328C-08DA722667A8', N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"sys_file_library","type":"HZY.Models","codeText":""}', N'', N'276', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码', N'2022-07-30 20:26:32.7583253', N'2022-07-30 20:26:32.7583247')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'EB28CD19-2B26-480F-328D-08DA722667A8', N'/api/admin/LowCodeTable/findForm/4cdafaad-c4f7-43d2-97be-7281d21d5466', N'0.0.0.1', N'', N'', N'', N'32', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据', N'2022-07-30 20:26:40.1296084', N'2022-07-30 20:26:40.1296079')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'13D9B4B0-C13A-4194-328E-08DA722667A8', N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'122', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息', N'2022-07-30 20:29:48.1734373', N'2022-07-30 20:29:48.1734368')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'5A8431D6-DAC6-4364-328F-08DA722667A8', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'182', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:30:06.6406427', N'2022-07-30 20:30:06.6406419')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'60C323E4-5A8C-46B9-3290-08DA722667A8', N'/api/admin/LowCodeTableInfo/findList/20/1', N'0.0.0.1', N'', N'{"columnName":null,"describe":null,"low_Code_TableId":"4cdafaad-c4f7-43d2-97be-7281d21d5466"}', N'', N'252', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeSearchController', NULL, N'2022-07-30 20:30:22.9586332', N'2022-07-30 20:30:22.9586327')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'681B9E24-DC8E-4ED5-3291-08DA722667A8', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'336', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:30:22.9888827', N'2022-07-30 20:30:22.9888821')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'A5D1576B-DF35-40FA-3292-08DA722667A8', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'166', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:30:23.7309287', N'2022-07-30 20:30:23.7309281')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'BF7699E3-C6DB-4416-3293-08DA722667A8', N'/api/admin/LowCodeTable/synchronization', N'0.0.0.1', N'', N'', N'', N'1163', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:30:26.3314978', N'2022-07-30 20:30:26.3314970')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'D0FF28AB-D990-46F7-3294-08DA722667A8', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'174', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:30:26.5773625', N'2022-07-30 20:30:26.5773619')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'ABE1BFF8-1250-4BEC-3295-08DA722667A8', N'/api/admin/LowCodeTableInfo/findList/20/1', N'0.0.0.1', N'', N'{"columnName":null,"describe":null,"low_Code_TableId":"4cdafaad-c4f7-43d2-97be-7281d21d5466"}', N'', N'47', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeSearchController', NULL, N'2022-07-30 20:30:28.3785262', N'2022-07-30 20:30:28.3785241')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'3C70D35C-9924-4545-3296-08DA722667A8', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'187', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:30:28.4656954', N'2022-07-30 20:30:28.4656945')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'412C825D-2EAA-4E9A-3297-08DA722667A8', N'/api/admin/LowCodeTable/findForm/4cdafaad-c4f7-43d2-97be-7281d21d5466', N'0.0.0.1', N'', N'', N'', N'52', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据', N'2022-07-30 20:30:29.9236785', N'2022-07-30 20:30:29.9236779')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'E0AC59DB-882F-47E0-3298-08DA722667A8', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'157', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:30:35.3119422', N'2022-07-30 20:30:35.3119417')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'04986B74-8DA5-4485-3299-08DA722667A8', N'/api/admin/LowCodeTable/change', N'0.0.0.1', N'', N'[{"id":"4cdafaad-c4f7-43d2-97be-7281d21d5466","tableName":"sys_file_library","displayName":"文件库","entityName":"SysFileLibrary","remark":"用于记录系统上传的文件","lastModificationTime":"2022-07-30","creationTime":"2022-07-30","_X_ROW_KEY":"row_119"},{"id":"18fbb18e-cb29-45d8-a5f3-c0121c57680a","tableName":"flow_approval_step_history","displayName":"","entityName":"FlowApprovalStepHistory","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-07-29","_X_ROW_KEY":"row_120"},{"id":"7f94e0db-fc63-40dc-bfe3-18c5aad75975","tableName":"flow_approval_step_history_user","displayName":"","entityName":"FlowApprovalStepHistoryUser","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-07-29","_X_ROW_KEY":"row_121"},{"id":"a9e68076-84d2-449f-a7c2-134f09984dfb","tableName":"__EFMigrationsHistory","displayName":"","entityName":"Efmigrationshistory","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-07-29","_X_ROW_KEY":"row_122"},{"id":"852f53ff-0d00-4c32-aa55-a9c11993751b","tableName":"low_code_list","displayName":"低代码列表","entityName":"LowCodeList","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-05-23","_X_ROW_KEY":"row_123"},{"id":"6ba9805c-916e-4d2c-99d0-216fcbc361cc","tableName":"low_code_table","displayName":"低代码表","entityName":"LowCodeTable","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-05-23","_X_ROW_KEY":"row_124"},{"id":"79fbd4ec-9f4e-45dc-8065-70f2eb422cdf","tableName":"low_code_table_info","displayName":"低代码表信息","entityName":"LowCodeTableInfo","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-05-23","_X_ROW_KEY":"row_125"},{"id":"69edd8a8-1d24-478c-a909-b82039edcec0","tableName":"low_code_search","displayName":"低代码检索表","entityName":"LowCodeSearch","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-05-23","_X_ROW_KEY":"row_126"},{"id":"d8948c56-c5bd-4061-b272-5417375f38f0","tableName":"flow_approval","displayName":"审批流审批","entityName":"FlowApproval","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-04-17","_X_ROW_KEY":"row_127"},{"id":"ae6d94d8-6a15-4348-b600-aa17e4b61718","tableName":"flow_node","displayName":"工作流节点","entityName":"FlowNode","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-04-17","_X_ROW_KEY":"row_128"}]', N'', N'60', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:30:39.7310398', N'2022-07-30 20:30:39.7310386')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'7C6F40C7-9F4F-4346-329A-08DA722667A8', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'179', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:30:39.9833377', N'2022-07-30 20:30:39.9833372')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'38E2D836-1D7D-4284-329B-08DA722667A8', N'/api/admin/LowCodeTableInfo/findList/20/1', N'0.0.0.1', N'', N'{"columnName":null,"describe":null,"low_Code_TableId":"4cdafaad-c4f7-43d2-97be-7281d21d5466"}', N'', N'75', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeSearchController', NULL, N'2022-07-30 20:30:42.1019570', N'2022-07-30 20:30:42.1019565')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'20B3BF33-CA16-4AC7-329C-08DA722667A8', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'211', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:30:42.1908031', N'2022-07-30 20:30:42.1908018')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'0CD6A3AF-423E-4477-329D-08DA722667A8', N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"sys_file_library","type":"HZY.Models","codeText":""}', N'', N'275', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码', N'2022-07-30 20:30:43.5972669', N'2022-07-30 20:30:43.5972662')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'EB3141FD-AAFB-4ED4-329E-08DA722667A8', N'/api/admin/LowCodeTable/findForm/4cdafaad-c4f7-43d2-97be-7281d21d5466', N'0.0.0.1', N'', N'', N'', N'26', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据', N'2022-07-30 20:30:44.3257477', N'2022-07-30 20:30:44.3257472')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'4D448ADB-BD8B-4268-329F-08DA722667A8', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'161', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:30:54.6366236', N'2022-07-30 20:30:54.6366230')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'659FD6A1-E2B7-4B2D-7055-08DA722888E8', N'/', N'0.0.0.1', N'', N'', N'', N'4', N'Edge103', N'Windows10', NULL, NULL, NULL, N'2022-07-30 20:39:24.9413791', N'2022-07-30 20:39:24.9413779')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'19008BB7-800A-48DA-7056-08DA722888E8', N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'482', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息', N'2022-07-30 20:39:26.1199305', N'2022-07-30 20:39:26.1199293')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'58CDD139-D63C-4270-7057-08DA722888E8', N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'120', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息', N'2022-07-30 20:39:57.0301777', N'2022-07-30 20:39:57.0301770')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'1DABBFE9-C20E-4EEC-7058-08DA722888E8', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'472', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:40:00.6205827', N'2022-07-30 20:40:00.6205821')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'259AEE30-9480-4D93-7059-08DA722888E8', N'/api/admin/LowCodeTable/synchronization', N'0.0.0.1', N'', N'', N'', N'970', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:40:08.7378553', N'2022-07-30 20:40:08.7378548')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'31EE7B43-216E-4F7E-705A-08DA722888E8', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'154', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:40:08.9770678', N'2022-07-30 20:40:08.9770672')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'983F9359-CA80-46CE-705B-08DA722888E8', N'/api/admin/LowCodeTableInfo/findList/20/1', N'0.0.0.1', N'', N'{"columnName":null,"describe":null,"low_Code_TableId":"4cdafaad-c4f7-43d2-97be-7281d21d5466"}', N'', N'73', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeSearchController', NULL, N'2022-07-30 20:40:10.5610642', N'2022-07-30 20:40:10.5610637')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'91D5DEE3-42BA-449F-705C-08DA722888E8', N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"sys_file_library","type":"HZY.Models","codeText":""}', N'', N'317', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码', N'2022-07-30 20:40:12.3768428', N'2022-07-30 20:40:12.3768419')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'E0F91E62-CC4B-4CD8-705D-08DA722888E8', N'/api/admin/LowCodeTable/findForm/4cdafaad-c4f7-43d2-97be-7281d21d5466', N'0.0.0.1', N'', N'', N'', N'41', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据', N'2022-07-30 20:40:13.0686461', N'2022-07-30 20:40:13.0686457')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'C5F69218-311C-4D07-705E-08DA722888E8', N'/api/admin/LowCodeTable/change', N'0.0.0.1', N'', N'[{"id":"4cdafaad-c4f7-43d2-97be-7281d21d5466","tableName":"sys_file_library","displayName":"文件库","entityName":"SysFileLibrary","remark":"用于记录系统上传的文件","lastModificationTime":"2022-07-30","creationTime":"2022-07-30","_X_ROW_KEY":"row_32"},{"id":"7f94e0db-fc63-40dc-bfe3-18c5aad75975","tableName":"flow_approval_step_history_user","displayName":"","entityName":"FlowApprovalStepHistoryUser","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-07-29","_X_ROW_KEY":"row_33"},{"id":"18fbb18e-cb29-45d8-a5f3-c0121c57680a","tableName":"flow_approval_step_history","displayName":"","entityName":"FlowApprovalStepHistory","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-07-29","_X_ROW_KEY":"row_34"},{"id":"a9e68076-84d2-449f-a7c2-134f09984dfb","tableName":"__EFMigrationsHistory","displayName":"","entityName":"Efmigrationshistory","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-07-29","_X_ROW_KEY":"row_35"},{"id":"79fbd4ec-9f4e-45dc-8065-70f2eb422cdf","tableName":"low_code_table_info","displayName":"低代码表信息","entityName":"LowCodeTableInfo","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-05-23","_X_ROW_KEY":"row_36"},{"id":"6ba9805c-916e-4d2c-99d0-216fcbc361cc","tableName":"low_code_table","displayName":"低代码表","entityName":"LowCodeTable","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-05-23","_X_ROW_KEY":"row_37"},{"id":"69edd8a8-1d24-478c-a909-b82039edcec0","tableName":"low_code_search","displayName":"低代码检索表","entityName":"LowCodeSearch","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-05-23","_X_ROW_KEY":"row_38"},{"id":"852f53ff-0d00-4c32-aa55-a9c11993751b","tableName":"low_code_list","displayName":"低代码列表","entityName":"LowCodeList","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-05-23","_X_ROW_KEY":"row_39"},{"id":"3da5d264-2e8d-460c-a10c-ff9a6bb57a60","tableName":"sys_user_role","displayName":"用户与角色","entityName":"SysUserRole","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-04-17","_X_ROW_KEY":"row_40"},{"id":"69b24f04-0ed3-45fc-91d9-0dc929175a57","tableName":"sys_user_post","displayName":"用户与岗位","entityName":"SysUserPost","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-04-17","_X_ROW_KEY":"row_41"}]', N'', N'84', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:40:15.9521003', N'2022-07-30 20:40:15.9520998')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'E2A8975B-AF64-4A07-705F-08DA722888E8', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'157', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:40:16.1791395', N'2022-07-30 20:40:16.1791390')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'54F57160-2CB3-4047-7060-08DA722888E8', N'/api/admin/LowCodeTableInfo/findList/20/1', N'0.0.0.1', N'', N'{"columnName":null,"describe":null,"low_Code_TableId":"4cdafaad-c4f7-43d2-97be-7281d21d5466"}', N'', N'49', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeSearchController', NULL, N'2022-07-30 20:40:17.5633261', N'2022-07-30 20:40:17.5633255')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'1EB6345C-D22C-4EB1-7061-08DA722888E8', N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"sys_file_library","type":"HZY.Models","codeText":""}', N'', N'245', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码', N'2022-07-30 20:40:18.9551524', N'2022-07-30 20:40:18.9551518')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'21E806E4-8679-4BB3-7062-08DA722888E8', N'/api/admin/LowCodeTable/findForm/4cdafaad-c4f7-43d2-97be-7281d21d5466', N'0.0.0.1', N'', N'', N'', N'25', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据', N'2022-07-30 20:40:19.6632198', N'2022-07-30 20:40:19.6632189')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'F60689C5-8C53-421C-7063-08DA722888E8', N'/api/admin/LowCodeTableInfo/findList/20/1', N'0.0.0.1', N'', N'{"columnName":null,"describe":null,"low_Code_TableId":"4cdafaad-c4f7-43d2-97be-7281d21d5466"}', N'', N'50', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeSearchController', NULL, N'2022-07-30 20:40:58.1353424', N'2022-07-30 20:40:58.1353418')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'3E1F5A9E-FF73-42D0-7064-08DA722888E8', N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"sys_file_library","type":"HZY.Models","codeText":""}', N'', N'260', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码', N'2022-07-30 20:40:59.9560685', N'2022-07-30 20:40:59.9560680')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'F5656F6D-7A6B-4656-7065-08DA722888E8', N'/api/admin/LowCodeTable/findForm/4cdafaad-c4f7-43d2-97be-7281d21d5466', N'0.0.0.1', N'', N'', N'', N'26', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据', N'2022-07-30 20:41:11.3140775', N'2022-07-30 20:41:11.3140767')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'5DEFA4B1-C1D6-424C-7066-08DA722888E8', N'/api/admin/LowCodeTable/synchronization', N'0.0.0.1', N'', N'', N'', N'912', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:42:03.9378897', N'2022-07-30 20:42:03.9378890')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'1C4E89BE-050D-402B-7067-08DA722888E8', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'211', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:42:04.2811199', N'2022-07-30 20:42:04.2811191')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'3181F20F-265D-4FF6-7068-08DA722888E8', N'/api/admin/LowCodeTable/deleteList', N'0.0.0.1', N'', N'["4cdafaad-c4f7-43d2-97be-7281d21d5466"]', N'', N'102', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:42:15.4823752', N'2022-07-30 20:42:15.4823744')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'E7045FD3-56A5-4C6F-7069-08DA722888E8', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'207', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:42:15.8235505', N'2022-07-30 20:42:15.8235496')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'85097E38-C592-49AB-706A-08DA722888E8', N'/api/admin/LowCodeTable/change', N'0.0.0.1', N'', N'[{"id":"8480181e-6ff6-4d1d-ab57-f48f29a5a4cd","tableName":"file_library","displayName":"文件库","entityName":"FileLibrary","remark":"用于记录系统上传的文件","lastModificationTime":"2022-07-30","creationTime":"2022-07-30","_X_ROW_KEY":"row_120"},{"id":"18fbb18e-cb29-45d8-a5f3-c0121c57680a","tableName":"flow_approval_step_history","displayName":"","entityName":"FlowApprovalStepHistory","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-07-29","_X_ROW_KEY":"row_121"},{"id":"7f94e0db-fc63-40dc-bfe3-18c5aad75975","tableName":"flow_approval_step_history_user","displayName":"","entityName":"FlowApprovalStepHistoryUser","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-07-29","_X_ROW_KEY":"row_122"},{"id":"a9e68076-84d2-449f-a7c2-134f09984dfb","tableName":"__EFMigrationsHistory","displayName":"","entityName":"Efmigrationshistory","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-07-29","_X_ROW_KEY":"row_123"},{"id":"79fbd4ec-9f4e-45dc-8065-70f2eb422cdf","tableName":"low_code_table_info","displayName":"低代码表信息","entityName":"LowCodeTableInfo","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-05-23","_X_ROW_KEY":"row_124"},{"id":"6ba9805c-916e-4d2c-99d0-216fcbc361cc","tableName":"low_code_table","displayName":"低代码表","entityName":"LowCodeTable","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-05-23","_X_ROW_KEY":"row_125"},{"id":"69edd8a8-1d24-478c-a909-b82039edcec0","tableName":"low_code_search","displayName":"低代码检索表","entityName":"LowCodeSearch","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-05-23","_X_ROW_KEY":"row_126"},{"id":"852f53ff-0d00-4c32-aa55-a9c11993751b","tableName":"low_code_list","displayName":"低代码列表","entityName":"LowCodeList","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-05-23","_X_ROW_KEY":"row_127"},{"id":"69b24f04-0ed3-45fc-91d9-0dc929175a57","tableName":"sys_user_post","displayName":"用户与岗位","entityName":"SysUserPost","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-04-17","_X_ROW_KEY":"row_128"},{"id":"3da5d264-2e8d-460c-a10c-ff9a6bb57a60","tableName":"sys_user_role","displayName":"用户与角色","entityName":"SysUserRole","remark":null,"lastModificationTime":"2022-07-30","creationTime":"2022-04-17","_X_ROW_KEY":"row_129"}]', N'', N'63', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:42:27.9990258', N'2022-07-30 20:42:27.9990252')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'093B5AF4-2BE6-427D-706B-08DA722888E8', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'169', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:42:28.2350963', N'2022-07-30 20:42:28.2350958')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'D3F40222-499F-4BAB-706C-08DA722888E8', N'/api/admin/LowCodeTable/findList/10/2', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'164', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:42:30.9061870', N'2022-07-30 20:42:30.9061865')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'E4816152-1ED0-495D-706D-08DA722888E8', N'/api/admin/LowCodeTable/findList/10/3', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'155', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:42:31.6165168', N'2022-07-30 20:42:31.6165162')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'B7D219F1-EFD4-4738-706E-08DA722888E8', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'144', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:42:34.5739380', N'2022-07-30 20:42:34.5739374')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'A63F1F12-02AA-45E9-706F-08DA722888E8', N'/api/admin/LowCodeTableInfo/findList/20/1', N'0.0.0.1', N'', N'{"columnName":null,"describe":null,"low_Code_TableId":"8480181e-6ff6-4d1d-ab57-f48f29a5a4cd"}', N'', N'347', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeSearchController', NULL, N'2022-07-30 20:42:38.0098651', N'2022-07-30 20:42:38.0098643')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'6FAEF095-DEBE-47E4-7070-08DA722888E8', N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"file_library","type":"HZY.Models","codeText":""}', N'', N'486', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码', N'2022-07-30 20:42:38.1660191', N'2022-07-30 20:42:38.1660184')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'FC017150-D52D-41C0-7071-08DA722888E8', N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"file_library","type":"HZY.Models","codeText":""}', N'', N'252', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码', N'2022-07-30 20:42:40.0999879', N'2022-07-30 20:42:40.0999872')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'DC912D3E-C250-464C-7072-08DA722888E8', N'/api/admin/LowCodeTable/findForm/8480181e-6ff6-4d1d-ab57-f48f29a5a4cd', N'0.0.0.1', N'', N'', N'', N'30', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据', N'2022-07-30 20:42:40.8876770', N'2022-07-30 20:42:40.8876764')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'DEE8E751-91AF-4436-7073-08DA722888E8', N'/api/admin/CodeGeneration/AutoImprotProject', N'0.0.0.1', N'', N'{"tableName":"file_library"}', N'', N'2320', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'生成代码并自动导入项目', N'2022-07-30 20:42:45.0451888', N'2022-07-30 20:42:45.0451878')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'5AA6647C-BD61-41F9-7074-08DA722888E8', N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'34', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息', N'2022-07-30 20:42:46.0185831', N'2022-07-30 20:42:46.0185823')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'8F9C169B-2115-4795-7075-08DA722888E8', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'285', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:42:47.3320759', N'2022-07-30 20:42:47.3320748')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'1D68D77C-17B5-4941-7076-08DA722888E8', N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'42', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息', N'2022-07-30 20:43:09.7383624', N'2022-07-30 20:43:09.7383618')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'0F7FF8DF-1637-4525-7077-08DA722888E8', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'151', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:43:10.5932557', N'2022-07-30 20:43:10.5932552')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'1A5BE0C6-2D17-4610-7078-08DA722888E8', N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'43', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息', N'2022-07-30 20:44:14.8502304', N'2022-07-30 20:44:14.8502297')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'7E8D32A2-DE86-4F53-7079-08DA722888E8', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'173', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:44:15.3810367', N'2022-07-30 20:44:15.3810362')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'63AAA10B-CE95-406B-707A-08DA722888E8', N'/api/admin/LowCodeTableInfo/findList/20/1', N'0.0.0.1', N'', N'{"columnName":null,"describe":null,"low_Code_TableId":"8480181e-6ff6-4d1d-ab57-f48f29a5a4cd"}', N'', N'76', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeSearchController', NULL, N'2022-07-30 20:44:17.0066438', N'2022-07-30 20:44:17.0066432')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'A2719924-35D0-4898-707B-08DA722888E8', N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"file_library","type":"HZY.Models","codeText":""}', N'', N'236', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码', N'2022-07-30 20:44:19.5490540', N'2022-07-30 20:44:19.5490534')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'51FA640A-6814-4DF5-707C-08DA722888E8', N'/api/admin/LowCodeTable/findForm/8480181e-6ff6-4d1d-ab57-f48f29a5a4cd', N'0.0.0.1', N'', N'', N'', N'39', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据', N'2022-07-30 20:44:20.0972697', N'2022-07-30 20:44:20.0972690')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'5BE4A291-4B68-4232-707D-08DA722888E8', N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'40', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息', N'2022-07-30 20:44:27.7864665', N'2022-07-30 20:44:27.7864659')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'3C042EA6-3B40-4F89-707E-08DA722888E8', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'191', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:44:28.5349474', N'2022-07-30 20:44:28.5349469')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'E985D05D-712F-40DB-707F-08DA722888E8', N'/api/admin/LowCodeTableInfo/findList/20/1', N'0.0.0.1', N'', N'{"columnName":null,"describe":null,"low_Code_TableId":"8480181e-6ff6-4d1d-ab57-f48f29a5a4cd"}', N'', N'82', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeSearchController', NULL, N'2022-07-30 20:44:31.2776100', N'2022-07-30 20:44:31.2776093')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'926D84FD-7A70-4C71-7080-08DA722888E8', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'246', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:44:31.3056593', N'2022-07-30 20:44:31.3056587')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'70A99535-AAF2-468B-7081-08DA722888E8', N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"file_library","type":"HZY.Models","codeText":""}', N'', N'238', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码', N'2022-07-30 20:44:32.9182529', N'2022-07-30 20:44:32.9182521')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'2C832547-2076-4381-7082-08DA722888E8', N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"file_library","type":"HZY.Models","codeText":""}', N'', N'231', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码', N'2022-07-30 20:44:35.0332110', N'2022-07-30 20:44:35.0332102')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'6A84FF58-4E26-402F-7083-08DA722888E8', N'/api/admin/LowCodeTable/findForm/8480181e-6ff6-4d1d-ab57-f48f29a5a4cd', N'0.0.0.1', N'', N'', N'', N'26', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据', N'2022-07-30 20:44:38.2269345', N'2022-07-30 20:44:38.2269337')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'2B50F19C-1354-4E90-7084-08DA722888E8', N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"file_library","type":"HZY.Models","codeText":""}', N'', N'247', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码', N'2022-07-30 20:45:03.7702011', N'2022-07-30 20:45:03.7702005')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'E7AEDA98-9C65-42E0-7085-08DA722888E8', N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"file_library","type":"HZY.Models","codeText":""}', N'', N'263', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码', N'2022-07-30 20:45:05.6953705', N'2022-07-30 20:45:05.6953699')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'46878732-47A4-4E03-7086-08DA722888E8', N'/api/admin/LowCodeTable/findForm/8480181e-6ff6-4d1d-ab57-f48f29a5a4cd', N'0.0.0.1', N'', N'', N'', N'28', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据', N'2022-07-30 20:45:05.9354230', N'2022-07-30 20:45:05.9354224')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'965D2B33-5DB7-4BEC-7087-08DA722888E8', N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"file_library","type":"HZY.Models","codeText":""}', N'', N'239', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码', N'2022-07-30 20:45:07.9388271', N'2022-07-30 20:45:07.9388265')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'E0885556-04CD-4224-7088-08DA722888E8', N'/api/admin/LowCodeTable/findForm/8480181e-6ff6-4d1d-ab57-f48f29a5a4cd', N'0.0.0.1', N'', N'', N'', N'26', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据', N'2022-07-30 20:45:08.2540549', N'2022-07-30 20:45:08.2540542')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'D1DCAE47-79DC-4E95-7089-08DA722888E8', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'176', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:45:11.8185062', N'2022-07-30 20:45:11.8185057')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'0915E02F-45B6-4406-2596-08DA7229A1A5', N'/', N'0.0.0.1', N'', N'', N'', N'7', N'Edge103', N'Windows10', NULL, NULL, NULL, N'2022-07-30 20:47:16.0218918', N'2022-07-30 20:47:16.0218906')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'6BEACAE5-CA20-49DC-2597-08DA7229A1A5', N'/api/account/check', N'0.0.0.1', N'', N'{"userName":"admin","userPassword":"123456"}', N'', N'1336', N'Edge103', N'Windows10', NULL, NULL, NULL, N'2022-07-30 20:47:16.6718920', N'2022-07-30 20:47:16.6718912')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'2F261DF4-548B-41EF-2598-08DA7229A1A5', N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'346', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息', N'2022-07-30 20:47:17.2963133', N'2022-07-30 20:47:17.2963121')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'4F465908-E513-4454-2599-08DA7229A1A5', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'391', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:47:23.4018401', N'2022-07-30 20:47:23.4018396')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'6ED7160C-B38B-4C74-259A-08DA7229A1A5', N'/api/admin/LowCodeTableInfo/findList/20/1', N'0.0.0.1', N'', N'{"columnName":null,"describe":null,"low_Code_TableId":"8480181e-6ff6-4d1d-ab57-f48f29a5a4cd"}', N'', N'99', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeSearchController', NULL, N'2022-07-30 20:47:26.6966472', N'2022-07-30 20:47:26.6966465')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'46743D43-7FA6-43D9-259B-08DA7229A1A5', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'221', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:47:26.7218299', N'2022-07-30 20:47:26.7218291')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'B4A3F3E5-0DBC-46E3-259C-08DA7229A1A5', N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"file_library","type":"HZY.Models","codeText":""}', N'', N'283', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码', N'2022-07-30 20:47:28.4458678', N'2022-07-30 20:47:28.4458673')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'821AA227-B72D-4CE1-259D-08DA7229A1A5', N'/api/admin/LowCodeTable/findForm/8480181e-6ff6-4d1d-ab57-f48f29a5a4cd', N'0.0.0.1', N'', N'', N'', N'43', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据', N'2022-07-30 20:47:29.1031390', N'2022-07-30 20:47:29.1031385')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'F4EAB8E7-CB7A-4DC9-259E-08DA7229A1A5', N'/api/admin/CodeGeneration/AutoImprotProject', N'0.0.0.1', N'', N'{"tableName":"file_library"}', N'', N'2131', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'生成代码并自动导入项目', N'2022-07-30 20:47:34.6622992', N'2022-07-30 20:47:34.6622980')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'909D3F34-A0A5-45FA-259F-08DA7229A1A5', N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'74', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息', N'2022-07-30 20:47:35.9685713', N'2022-07-30 20:47:35.9685706')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'C83FA041-3A75-4E68-25A0-08DA7229A1A5', N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'28', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息', N'2022-07-30 20:47:40.0272394', N'2022-07-30 20:47:40.0272388')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'4CF55F9F-A796-4CF9-25A1-08DA7229A1A5', N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'30', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息', N'2022-07-30 20:47:45.5806512', N'2022-07-30 20:47:45.5806506')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'CDBA0E17-95F0-4E62-25A2-08DA7229A1A5', N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'73', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息', N'2022-07-30 20:51:31.7381302', N'2022-07-30 20:51:31.7381296')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'E5758363-080A-43AE-25A3-08DA7229A1A5', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'151', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:51:34.6335654', N'2022-07-30 20:51:34.6335650')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'E82FEAD6-1A0E-4DE9-25A4-08DA7229A1A5', N'/api/admin/LowCodeTableInfo/findList/20/1', N'0.0.0.1', N'', N'{"columnName":null,"describe":null,"low_Code_TableId":"8480181e-6ff6-4d1d-ab57-f48f29a5a4cd"}', N'', N'75', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeSearchController', NULL, N'2022-07-30 20:51:36.7144206', N'2022-07-30 20:51:36.7144201')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'1CEBD028-2538-4BB8-25A5-08DA7229A1A5', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'216', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:51:36.7591880', N'2022-07-30 20:51:36.7591871')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'84809714-9343-44FD-25A6-08DA7229A1A5', N'/api/admin/LowCodeTable/findForm/8480181e-6ff6-4d1d-ab57-f48f29a5a4cd', N'0.0.0.1', N'', N'', N'', N'35', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据', N'2022-07-30 20:51:37.7708009', N'2022-07-30 20:51:37.7708002')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'03FFB58F-6977-4E88-7274-08DA722B4195', N'/', N'0.0.0.1', N'', N'', N'', N'6', N'Edge103', N'Windows10', NULL, NULL, NULL, N'2022-07-30 20:58:53.8377150', N'2022-07-30 20:58:53.8377136')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'83839AE2-5C50-4F82-7275-08DA722B4195', N'/api/account/check', N'0.0.0.1', N'', N'{"userName":"admin","userPassword":"123456"}', N'', N'972', N'Edge103', N'Windows10', NULL, NULL, NULL, N'2022-07-30 20:59:04.2453236', N'2022-07-30 20:59:04.2453226')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'27139D2D-BAAB-4D79-7276-08DA722B4195', N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'393', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息', N'2022-07-30 20:59:05.0024746', N'2022-07-30 20:59:05.0024738')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'2AE34F4C-3689-4CE0-7277-08DA722B4195', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'381', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:59:08.8398352', N'2022-07-30 20:59:08.8398347')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'BF9A3FD9-B565-430A-7278-08DA722B4195', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'538', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:59:11.3535813', N'2022-07-30 20:59:11.3535807')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'C71EA633-0BD0-4A59-7279-08DA722B4195', N'/api/admin/LowCodeTableInfo/findList/20/1', N'0.0.0.1', N'', N'{"columnName":null,"describe":null,"low_Code_TableId":"8480181e-6ff6-4d1d-ab57-f48f29a5a4cd"}', N'', N'391', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeSearchController', NULL, N'2022-07-30 20:59:11.3560980', N'2022-07-30 20:59:11.3560975')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'9B6C5A6F-9B2C-4058-727A-08DA722B4195', N'/api/admin/LowCodeTable/findForm/8480181e-6ff6-4d1d-ab57-f48f29a5a4cd', N'0.0.0.1', N'', N'', N'', N'47', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据', N'2022-07-30 20:59:12.6413062', N'2022-07-30 20:59:12.6413057')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'15B672A3-74EC-4F24-727B-08DA722B4195', N'/api/admin/CodeGeneration/AutoImprotProject', N'0.0.0.1', N'', N'{"tableName":"file_library"}', N'', N'2303', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'生成代码并自动导入项目', N'2022-07-30 20:59:23.7014178', N'2022-07-30 20:59:23.7014164')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'92C4B871-9B7E-464A-727C-08DA722B4195', N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'74', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息', N'2022-07-30 20:59:24.7078871', N'2022-07-30 20:59:24.7078864')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'C1261678-AFCB-454B-727D-08DA722B4195', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'303', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:59:25.8685930', N'2022-07-30 20:59:25.8685924')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'3DB8895C-EED6-476A-727E-08DA722B4195', N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'48', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息', N'2022-07-30 20:59:53.9599843', N'2022-07-30 20:59:53.9599833')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'F7574673-33C0-42A3-727F-08DA722B4195', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'178', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:59:54.6961662', N'2022-07-30 20:59:54.6961656')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'05013666-2D92-4E7D-7280-08DA722B4195', N'/api/admin/LowCodeTableInfo/findList/20/1', N'0.0.0.1', N'', N'{"columnName":null,"describe":null,"low_Code_TableId":"8480181e-6ff6-4d1d-ab57-f48f29a5a4cd"}', N'', N'98', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeSearchController', NULL, N'2022-07-30 20:59:56.3212279', N'2022-07-30 20:59:56.3212274')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'1DE55651-6199-4E7B-7281-08DA722B4195', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'276', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 20:59:56.3821505', N'2022-07-30 20:59:56.3821499')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'2B237190-9A9D-47E7-7282-08DA722B4195', N'/api/admin/LowCodeTable/findForm/8480181e-6ff6-4d1d-ab57-f48f29a5a4cd', N'0.0.0.1', N'', N'', N'', N'32', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据', N'2022-07-30 20:59:58.5782656', N'2022-07-30 20:59:58.5782650')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'CBA010F7-84B5-4E7D-7283-08DA722B4195', N'/api/admin/CodeGeneration/AutoImprotProject', N'0.0.0.1', N'', N'{"tableName":"file_library"}', N'', N'2177', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'生成代码并自动导入项目', N'2022-07-30 21:00:01.9846822', N'2022-07-30 21:00:01.9846810')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'2391BEC1-3FFA-4A2B-7284-08DA722B4195', N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'29', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息', N'2022-07-30 21:00:03.2236341', N'2022-07-30 21:00:03.2236333')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'4CE3DB8C-A89B-4CB4-7285-08DA722B4195', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'203', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 21:00:04.5540344', N'2022-07-30 21:00:04.5540338')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'EB417728-3EE8-48DF-7286-08DA722B4195', N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'105', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息', N'2022-07-30 21:00:40.3754444', N'2022-07-30 21:00:40.3754435')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'772CAE3D-60C9-4641-7287-08DA722B4195', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'289', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 21:00:41.9080125', N'2022-07-30 21:00:41.9080116')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'21ABC84B-067E-4152-E32A-08DA722BF22C', N'/', N'0.0.0.1', N'', N'', N'', N'5', N'Edge103', N'Windows10', NULL, NULL, NULL, N'2022-07-30 21:03:49.9774481', N'2022-07-30 21:03:49.9774465')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'12D14218-9749-48A1-E32B-08DA722BF22C', N'/api/account/check', N'0.0.0.1', N'', N'{"userName":"admin","userPassword":"123456"}', N'', N'990', N'Edge103', N'Windows10', NULL, NULL, NULL, N'2022-07-30 21:04:04.7737935', N'2022-07-30 21:04:04.7737925')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'48FFAA6C-0E8D-4E43-E32C-08DA722BF22C', N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'370', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息', N'2022-07-30 21:04:05.4679327', N'2022-07-30 21:04:05.4679318')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'388ED421-BEE7-4946-E32D-08DA722BF22C', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'394', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 21:04:10.7926334', N'2022-07-30 21:04:10.7926328')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'FA2DD815-C74E-4235-E32E-08DA722BF22C', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'437', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 21:04:12.9223434', N'2022-07-30 21:04:12.9223429')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'1FCFBBCD-8E9A-4AD6-E32F-08DA722BF22C', N'/api/admin/LowCodeTableInfo/findList/20/1', N'0.0.0.1', N'', N'{"columnName":null,"describe":null,"low_Code_TableId":"8480181e-6ff6-4d1d-ab57-f48f29a5a4cd"}', N'', N'372', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeSearchController', NULL, N'2022-07-30 21:04:12.9644885', N'2022-07-30 21:04:12.9644878')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'B97B1CAF-2A85-4884-E330-08DA722BF22C', N'/api/admin/LowCodeTable/findForm/8480181e-6ff6-4d1d-ab57-f48f29a5a4cd', N'0.0.0.1', N'', N'', N'', N'42', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据', N'2022-07-30 21:04:14.5140489', N'2022-07-30 21:04:14.5140484')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'59252DB8-A024-452E-E331-08DA722BF22C', N'/api/admin/CodeGeneration/AutoImprotProject', N'0.0.0.1', N'', N'{"tableName":"file_library"}', N'', N'2641', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'生成代码并自动导入项目', N'2022-07-30 21:04:18.6587400', N'2022-07-30 21:04:18.6587382')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'BFC58B28-C528-41EE-E332-08DA722BF22C', N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'89', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息', N'2022-07-30 21:04:19.6955623', N'2022-07-30 21:04:19.6955613')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'82624ED7-CF8D-4E41-E333-08DA722BF22C', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'350', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 21:04:21.2824804', N'2022-07-30 21:04:21.2824788')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'7EFCBC26-ACA8-42B5-88DF-08DA722C9AE7', N'/', N'0.0.0.1', N'', N'', N'', N'5', N'Edge103', N'Windows10', NULL, NULL, NULL, N'2022-07-30 21:08:33.0625851', N'2022-07-30 21:08:33.0625839')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'EBECDD9D-6098-4E7A-88E0-08DA722C9AE7', N'/api/account/check', N'0.0.0.1', N'', N'{"userName":"admin","userPassword":"123456"}', N'', N'831', N'Edge103', N'Windows10', NULL, NULL, NULL, N'2022-07-30 21:08:35.5968703', N'2022-07-30 21:08:35.5968691')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'0B0831BF-8C5E-4058-88E1-08DA722C9AE7', N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'339', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息', N'2022-07-30 21:08:36.1858671', N'2022-07-30 21:08:36.1858661')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'3EB3975B-6E13-481B-88E2-08DA722C9AE7', N'/api/account/check', N'0.0.0.1', N'', N'{"userName":"admin","userPassword":"123456"}', N'', N'38', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, NULL, N'2022-07-30 21:08:43.2242247', N'2022-07-30 21:08:43.2242241')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'781DF0CF-8E87-4154-88E3-08DA722C9AE7', N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'114', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息', N'2022-07-30 21:08:43.4215257', N'2022-07-30 21:08:43.4215252')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'9E935B96-1F0E-4536-88E4-08DA722C9AE7', N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'26', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息', N'2022-07-30 21:08:48.0341212', N'2022-07-30 21:08:48.0341205')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'3A6BF225-B2A6-4AE7-88E5-08DA722C9AE7', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'402', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 21:08:48.8532247', N'2022-07-30 21:08:48.8532240')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'1541E5D3-D440-4E9A-88E6-08DA722C9AE7', N'/api/admin/LowCodeTableInfo/findList/20/1', N'0.0.0.1', N'', N'{"columnName":null,"describe":null,"low_Code_TableId":"8480181e-6ff6-4d1d-ab57-f48f29a5a4cd"}', N'', N'360', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeSearchController', NULL, N'2022-07-30 21:08:51.0680899', N'2022-07-30 21:08:51.0680892')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'4E37350F-84CE-4E2A-88E7-08DA722C9AE7', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'478', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 21:08:51.0741424', N'2022-07-30 21:08:51.0741416')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'A0860BB8-4EA8-45B9-88E8-08DA722C9AE7', N'/api/admin/LowCodeTable/findForm/8480181e-6ff6-4d1d-ab57-f48f29a5a4cd', N'0.0.0.1', N'', N'', N'', N'55', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据', N'2022-07-30 21:08:52.1471571', N'2022-07-30 21:08:52.1471566')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'FF870F03-ACA3-43B4-88E9-08DA722C9AE7', N'/api/admin/CodeGeneration/AutoImprotProject', N'0.0.0.1', N'', N'{"tableName":"file_library"}', N'', N'2110', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'生成代码并自动导入项目', N'2022-07-30 21:08:55.6664687', N'2022-07-30 21:08:55.6664675')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'6812E6D6-1F82-491A-88EA-08DA722C9AE7', N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'57', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息', N'2022-07-30 21:08:56.6565904', N'2022-07-30 21:08:56.6565896')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'FDFBA3B1-022C-4646-88EB-08DA722C9AE7', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'214', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 21:08:57.7808170', N'2022-07-30 21:08:57.7808164')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'377D9367-7507-4D73-9CD6-08DA722DE9E8', N'/', N'0.0.0.1', N'', N'', N'', N'5', N'Edge103', N'Windows10', NULL, NULL, NULL, N'2022-07-30 21:17:55.1110509', N'2022-07-30 21:17:55.1110492')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'725F4B96-6B1B-4011-9CD7-08DA722DE9E8', N'/api/account/check', N'0.0.0.1', N'', N'{"userName":"admin","userPassword":"123456"}', N'', N'947', N'Edge103', N'Windows10', NULL, NULL, NULL, N'2022-07-30 21:19:10.8881820', N'2022-07-30 21:19:10.8881811')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'438395E1-C0C9-43FA-9CD8-08DA722DE9E8', N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'337', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息', N'2022-07-30 21:19:11.6085573', N'2022-07-30 21:19:11.6085563')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'DD8AE96B-6D47-4DF6-9CD9-08DA722DE9E8', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'475', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 21:19:15.8334326', N'2022-07-30 21:19:15.8334321')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'532AFAD3-B06D-48F3-9CDA-08DA722DE9E8', N'/api/admin/LowCodeTable/deleteList', N'0.0.0.1', N'', N'["8480181e-6ff6-4d1d-ab57-f48f29a5a4cd"]', N'', N'99', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 21:19:19.7152512', N'2022-07-30 21:19:19.7152507')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'23AEAF41-FB28-4177-9CDB-08DA722DE9E8', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'267', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 21:19:20.0659441', N'2022-07-30 21:19:20.0659436')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'3428F9E2-7CAB-4770-EF05-08DA722F2D1E', N'/', N'0.0.0.1', N'', N'', N'', N'7', N'Edge103', N'Windows10', NULL, NULL, NULL, N'2022-07-30 21:26:57.4265347', N'2022-07-30 21:26:57.4265335')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'5F41A10E-C8B2-475F-EF06-08DA722F2D1E', N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'538', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息', N'2022-07-30 21:26:58.9643327', N'2022-07-30 21:26:58.9643306')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'2C8C8978-49FE-4ED8-EF07-08DA722F2D1E', N'/api/admin/SysUser/info', N'0.0.0.1', N'', N'', N'', N'137', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'系统账号', N'获取用户信息', N'2022-07-30 21:27:07.1601012', N'2022-07-30 21:27:07.1600998')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'297980AA-C5F7-445B-EF08-08DA722F2D1E', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'433', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 21:27:08.1308053', N'2022-07-30 21:27:08.1308046')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'34B5A8C4-8118-4DF8-EF09-08DA722F2D1E', N'/api/admin/LowCodeTableInfo/findList/20/1', N'0.0.0.1', N'', N'{"columnName":null,"describe":null,"low_Code_TableId":"69edd8a8-1d24-478c-a909-b82039edcec0"}', N'', N'393', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeSearchController', NULL, N'2022-07-30 21:27:18.3127116', N'2022-07-30 21:27:18.3127110')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'058935C0-157E-406B-EF0A-08DA722F2D1E', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'500', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 21:27:18.3205064', N'2022-07-30 21:27:18.3205054')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'5FC10E75-E5A2-4406-EF0B-08DA722F2D1E', N'/api/admin/CodeGeneration/getCode', N'0.0.0.1', N'', N'{"tableName":"low_code_search","type":"HZY.Models","codeText":""}', N'', N'310', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', NULL, N'获取代码', N'2022-07-30 21:27:19.4189736', N'2022-07-30 21:27:19.4189728')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'9457EE10-7148-413B-EF0C-08DA722F2D1E', N'/api/admin/LowCodeTable/findForm/69edd8a8-1d24-478c-a909-b82039edcec0', N'0.0.0.1', N'', N'', N'', N'65', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', N'查询数据', N'2022-07-30 21:27:20.3619316', N'2022-07-30 21:27:20.3619311')
GO

INSERT INTO [dbo].[sys_operation_log] ([Id], [Api], [Ip], [Form], [FormBody], [QueryString], [TakeUpTime], [Browser], [OS], [UserId], [ControllerDisplayName], [ActionDisplayName], [LastModificationTime], [CreationTime]) VALUES (N'D67356DE-77E3-488D-EF0D-08DA722F2D1E', N'/api/admin/LowCodeTable/findList/10/1', N'0.0.0.1', N'', N'{"tableName":null,"entityName":null,"displayName":null}', N'', N'169', N'Edge103', N'Windows10', N'0198459E-2034-4533-B843-5D227AD20740', N'LowCodeTableController', NULL, N'2022-07-30 21:27:23.0105582', N'2022-07-30 21:27:23.0105572')
GO


-- ----------------------------
-- Table structure for sys_organization
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_organization]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_organization]
GO

CREATE TABLE [dbo].[sys_organization] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [Name] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [OrderNumber] int  NULL,
  [LevelCode] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Leader] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Phone] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Email] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [State] int  NULL,
  [ParentId] int  NULL,
  [LastModificationTime] datetime2(7)  NOT NULL,
  [CreationTime] datetime2(7)  NOT NULL
)
GO

ALTER TABLE [dbo].[sys_organization] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of sys_organization
-- ----------------------------
SET IDENTITY_INSERT [dbo].[sys_organization] ON
GO

INSERT INTO [dbo].[sys_organization] ([Id], [Name], [OrderNumber], [LevelCode], [Leader], [Phone], [Email], [State], [ParentId], [LastModificationTime], [CreationTime]) VALUES (N'1', N'阿里巴巴集团', N'1', N'1', N'hzy', N'18410912184', N'18410912184@qq.com', N'1', NULL, N'2021-05-27 20:50:31.0000000', N'2021-05-27 20:50:31.0000000')
GO

INSERT INTO [dbo].[sys_organization] ([Id], [Name], [OrderNumber], [LevelCode], [Leader], [Phone], [Email], [State], [ParentId], [LastModificationTime], [CreationTime]) VALUES (N'2', N'北京分部', N'3', N'1.2', N'北京分部', N'132123', N'13131', N'1', N'1', N'2021-12-28 16:13:34.0000000', N'2021-05-27 22:33:44.0000000')
GO

INSERT INTO [dbo].[sys_organization] ([Id], [Name], [OrderNumber], [LevelCode], [Leader], [Phone], [Email], [State], [ParentId], [LastModificationTime], [CreationTime]) VALUES (N'3', N'市场部门', N'1', N'1.2.3', N'市场部门', N'234124234', N'234234@qq.com', N'1', N'2', N'2021-05-27 22:33:57.0000000', N'2021-05-27 22:33:57.0000000')
GO

INSERT INTO [dbo].[sys_organization] ([Id], [Name], [OrderNumber], [LevelCode], [Leader], [Phone], [Email], [State], [ParentId], [LastModificationTime], [CreationTime]) VALUES (N'4', N'财务部门', N'2', N'1.2.4', N'财务部门', N'435543535', N'123@qq.com', N'1', N'2', N'2021-05-27 22:34:11.0000000', N'2021-05-27 22:34:11.0000000')
GO

INSERT INTO [dbo].[sys_organization] ([Id], [Name], [OrderNumber], [LevelCode], [Leader], [Phone], [Email], [State], [ParentId], [LastModificationTime], [CreationTime]) VALUES (N'5', N'成都分部', N'2', N'1.5', N'成都分部', N'123123123', N'123@qq.com', N'1', N'1', N'2021-05-27 22:31:45.0000000', N'2021-05-27 21:01:50.0000000')
GO

INSERT INTO [dbo].[sys_organization] ([Id], [Name], [OrderNumber], [LevelCode], [Leader], [Phone], [Email], [State], [ParentId], [LastModificationTime], [CreationTime]) VALUES (N'7', N'研发部门', N'1', N'1.5.7', N'研发部门', N'1234323423', N'12312@qq.com', N'1', N'5', N'2021-05-27 22:32:29.0000000', N'2021-05-27 22:32:08.0000000')
GO

INSERT INTO [dbo].[sys_organization] ([Id], [Name], [OrderNumber], [LevelCode], [Leader], [Phone], [Email], [State], [ParentId], [LastModificationTime], [CreationTime]) VALUES (N'9', N'运维部门', N'4', N'1.5.9', N'运维部门', N'1232133452', N'12341@qq.com', N'1', N'5', N'2022-03-08 17:07:47.0000000', N'2021-05-27 22:33:25.0000000')
GO

INSERT INTO [dbo].[sys_organization] ([Id], [Name], [OrderNumber], [LevelCode], [Leader], [Phone], [Email], [State], [ParentId], [LastModificationTime], [CreationTime]) VALUES (N'10', N'测试部门', N'3', N'1.5.10', N'测试部门', N'12313', N'123123@qq.com', N'1', N'5', N'2021-05-27 22:32:59.0000000', N'2021-05-27 22:32:59.0000000')
GO

INSERT INTO [dbo].[sys_organization] ([Id], [Name], [OrderNumber], [LevelCode], [Leader], [Phone], [Email], [State], [ParentId], [LastModificationTime], [CreationTime]) VALUES (N'11', N'技术部门', N'2', N'1.5.11', N'技术部门', N'12345678911', N'12345678901@qq.com', N'1', N'5', N'2022-03-08 17:07:37.0000000', N'2022-03-08 17:00:20.0000000')
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
  [Number] int  NULL,
  [Code] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Name] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [State] int  NOT NULL,
  [Remarks] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [LastModificationTime] datetime2(7)  NOT NULL,
  [CreationTime] datetime2(7)  NOT NULL
)
GO

ALTER TABLE [dbo].[sys_post] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO [dbo].[sys_post] ([Id], [Number], [Code], [Name], [State], [Remarks], [LastModificationTime], [CreationTime]) VALUES (N'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622', N'5', N'dotnet_engineer', N'DotNet软件工程师', N'1', NULL, N'2022-03-08 10:13:18.0000000', N'2022-03-08 10:13:18.0000000')
GO

INSERT INTO [dbo].[sys_post] ([Id], [Number], [Code], [Name], [State], [Remarks], [LastModificationTime], [CreationTime]) VALUES (N'0716B4B0-9A06-43E9-8AE8-82C74875F83E', N'2', N'se', N'项目经理', N'1', NULL, N'2021-05-27 20:26:35.0000000', N'2021-05-27 20:26:35.0000000')
GO

INSERT INTO [dbo].[sys_post] ([Id], [Number], [Code], [Name], [State], [Remarks], [LastModificationTime], [CreationTime]) VALUES (N'96927C30-41D0-4CED-8E29-CBED35C90FB0', N'1', N'ceo', N'董事长', N'1', NULL, N'2021-05-27 20:26:22.0000000', N'2021-05-27 20:26:22.0000000')
GO

INSERT INTO [dbo].[sys_post] ([Id], [Number], [Code], [Name], [State], [Remarks], [LastModificationTime], [CreationTime]) VALUES (N'E46AF329-6D08-442C-9837-F22CFF954411', N'4', N'user', N'普通员工', N'1', NULL, N'2022-04-23 21:50:55.0000000', N'2021-05-27 20:26:52.0000000')
GO

INSERT INTO [dbo].[sys_post] ([Id], [Number], [Code], [Name], [State], [Remarks], [LastModificationTime], [CreationTime]) VALUES (N'F0C67537-8094-429A-B474-F54AC518609E', N'3', N'hr', N'人力资源', N'1', NULL, N'2021-05-27 20:26:44.0000000', N'2021-05-27 20:26:44.0000000')
GO


-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_role]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_role]
GO

CREATE TABLE [dbo].[sys_role] (
  [Id] uniqueidentifier  NOT NULL,
  [Number] int  NULL,
  [Name] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Remark] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [DeleteLock] bit  NOT NULL,
  [LastModificationTime] datetime2(7)  NOT NULL,
  [CreationTime] datetime2(7)  NOT NULL
)
GO

ALTER TABLE [dbo].[sys_role] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO [dbo].[sys_role] ([Id], [Number], [Name], [Remark], [DeleteLock], [LastModificationTime], [CreationTime]) VALUES (N'18FA4771-6F58-46A3-80D2-6F0F5E9972E3', N'1', N'超级管理员', N'拥有所有权限', N'1', N'2021-01-10 11:25:12.0000000', N'2016-07-06 17:59:20.0000000')
GO

INSERT INTO [dbo].[sys_role] ([Id], [Number], [Name], [Remark], [DeleteLock], [LastModificationTime], [CreationTime]) VALUES (N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'2', N'普通用户', N'普通用户', N'1', N'2021-01-30 00:51:17.0000000', N'2016-07-06 17:59:20.0000000')
GO


-- ----------------------------
-- Table structure for sys_role_menu_function
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_role_menu_function]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_role_menu_function]
GO

CREATE TABLE [dbo].[sys_role_menu_function] (
  [Id] uniqueidentifier  NOT NULL,
  [RoleId] uniqueidentifier  NOT NULL,
  [MenuId] int  NOT NULL,
  [MenuFunctionId] uniqueidentifier  NOT NULL,
  [LastModificationTime] datetime2(7)  NOT NULL,
  [CreationTime] datetime2(7)  NOT NULL
)
GO

ALTER TABLE [dbo].[sys_role_menu_function] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of sys_role_menu_function
-- ----------------------------
INSERT INTO [dbo].[sys_role_menu_function] ([Id], [RoleId], [MenuId], [MenuFunctionId], [LastModificationTime], [CreationTime]) VALUES (N'31E97CAE-1A79-4066-0368-08DA5F56B13D', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'2', N'A7CD04DB-BBE3-49B6-0F1E-08D9FDAD00AB', N'2022-07-06 21:51:57.0000000', N'2022-07-06 21:51:57.0000000')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [RoleId], [MenuId], [MenuFunctionId], [LastModificationTime], [CreationTime]) VALUES (N'28D17DAA-B64E-4946-0369-08DA5F56B13D', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'3', N'F64CFE50-1EF1-457F-0F20-08D9FDAD00AB', N'2022-07-06 21:51:57.0000000', N'2022-07-06 21:51:57.0000000')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [RoleId], [MenuId], [MenuFunctionId], [LastModificationTime], [CreationTime]) VALUES (N'3D15457F-C009-44E4-036A-08DA5F56B13D', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'5', N'A1DDD02F-8C21-4D79-0F21-08D9FDAD00AB', N'2022-07-06 21:51:57.0000000', N'2022-07-06 21:51:57.0000000')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [RoleId], [MenuId], [MenuFunctionId], [LastModificationTime], [CreationTime]) VALUES (N'653FFA0A-9A3F-447A-036B-08DA5F56B13D', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'6', N'1CB6FBE1-4A6C-4AAD-0F22-08D9FDAD00AB', N'2022-07-06 21:51:57.0000000', N'2022-07-06 21:51:57.0000000')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [RoleId], [MenuId], [MenuFunctionId], [LastModificationTime], [CreationTime]) VALUES (N'6C20DD18-622A-4C81-036C-08DA5F56B13D', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'8', N'D2E6EA60-2CF6-478A-0F23-08D9FDAD00AB', N'2022-07-06 21:51:57.0000000', N'2022-07-06 21:51:57.0000000')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [RoleId], [MenuId], [MenuFunctionId], [LastModificationTime], [CreationTime]) VALUES (N'EF9CBB6D-70F0-4246-036D-08DA5F56B13D', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'9', N'B7533A90-DAE4-4263-0F24-08D9FDAD00AB', N'2022-07-06 21:51:57.0000000', N'2022-07-06 21:51:57.0000000')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [RoleId], [MenuId], [MenuFunctionId], [LastModificationTime], [CreationTime]) VALUES (N'CF58224E-9D8A-4DD7-036E-08DA5F56B13D', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'10', N'EC535908-8671-4928-0F25-08D9FDAD00AB', N'2022-07-06 21:51:57.0000000', N'2022-07-06 21:51:57.0000000')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [RoleId], [MenuId], [MenuFunctionId], [LastModificationTime], [CreationTime]) VALUES (N'CD8357E8-E0B8-4A44-036F-08DA5F56B13D', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'11', N'3BC0E68F-D03D-4E99-0F26-08D9FDAD00AB', N'2022-07-06 21:51:57.0000000', N'2022-07-06 21:51:57.0000000')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [RoleId], [MenuId], [MenuFunctionId], [LastModificationTime], [CreationTime]) VALUES (N'F90CD8A1-2FAE-40ED-0370-08DA5F56B13D', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'13', N'EB958545-6449-40DB-0F27-08D9FDAD00AB', N'2022-07-06 21:51:57.0000000', N'2022-07-06 21:51:57.0000000')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [RoleId], [MenuId], [MenuFunctionId], [LastModificationTime], [CreationTime]) VALUES (N'95E2AD9F-F876-4881-0371-08DA5F56B13D', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'13', N'B5881044-AFB8-40B2-0F28-08D9FDAD00AB', N'2022-07-06 21:51:57.0000000', N'2022-07-06 21:51:57.0000000')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [RoleId], [MenuId], [MenuFunctionId], [LastModificationTime], [CreationTime]) VALUES (N'3CE23BF9-F697-4D68-0372-08DA5F56B13D', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'13', N'106FB69A-8BB5-4559-0F29-08D9FDAD00AB', N'2022-07-06 21:51:57.0000000', N'2022-07-06 21:51:57.0000000')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [RoleId], [MenuId], [MenuFunctionId], [LastModificationTime], [CreationTime]) VALUES (N'9CDB59FA-4C72-4ADF-0373-08DA5F56B13D', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'13', N'F4621FBE-6B40-4454-0F2A-08D9FDAD00AB', N'2022-07-06 21:51:57.0000000', N'2022-07-06 21:51:57.0000000')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [RoleId], [MenuId], [MenuFunctionId], [LastModificationTime], [CreationTime]) VALUES (N'D11FB2B1-54D2-4151-0374-08DA5F56B13D', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'13', N'523B53B5-8159-4A16-0F2B-08D9FDAD00AB', N'2022-07-06 21:51:57.0000000', N'2022-07-06 21:51:57.0000000')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [RoleId], [MenuId], [MenuFunctionId], [LastModificationTime], [CreationTime]) VALUES (N'4DF2715F-2A1E-45C2-0375-08DA5F56B13D', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'13', N'A3754771-F6E9-4A23-0F2C-08D9FDAD00AB', N'2022-07-06 21:51:57.0000000', N'2022-07-06 21:51:57.0000000')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [RoleId], [MenuId], [MenuFunctionId], [LastModificationTime], [CreationTime]) VALUES (N'390F485A-5F50-475B-0376-08DA5F56B13D', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'13', N'B96F977C-A36E-4E7F-0F2D-08D9FDAD00AB', N'2022-07-06 21:51:57.0000000', N'2022-07-06 21:51:57.0000000')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [RoleId], [MenuId], [MenuFunctionId], [LastModificationTime], [CreationTime]) VALUES (N'A10FDD9A-93DF-47D6-0377-08DA5F56B13D', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'13', N'541D9045-47B2-4629-0F2E-08D9FDAD00AB', N'2022-07-06 21:51:57.0000000', N'2022-07-06 21:51:57.0000000')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [RoleId], [MenuId], [MenuFunctionId], [LastModificationTime], [CreationTime]) VALUES (N'B414E6E7-AB37-48AB-0378-08DA5F56B13D', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'15', N'13F3F74D-C6FC-4488-0F2F-08D9FDAD00AB', N'2022-07-06 21:51:57.0000000', N'2022-07-06 21:51:57.0000000')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [RoleId], [MenuId], [MenuFunctionId], [LastModificationTime], [CreationTime]) VALUES (N'509AD581-1589-41A3-0379-08DA5F56B13D', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'19', N'C77C812A-1601-4311-0F70-08D9FDAD00AB', N'2022-07-06 21:51:57.0000000', N'2022-07-06 21:51:57.0000000')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [RoleId], [MenuId], [MenuFunctionId], [LastModificationTime], [CreationTime]) VALUES (N'BC7AD808-E114-47AE-037A-08DA5F56B13D', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'28', N'3F6D0AF7-5386-4D3A-0F71-08D9FDAD00AB', N'2022-07-06 21:51:57.0000000', N'2022-07-06 21:51:57.0000000')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [RoleId], [MenuId], [MenuFunctionId], [LastModificationTime], [CreationTime]) VALUES (N'AA9A9BA6-A5CF-4620-037B-08DA5F56B13D', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'32', N'6C09C0C0-72FA-4842-0F1F-08D9FDAD00AB', N'2022-07-06 21:51:57.0000000', N'2022-07-06 21:51:57.0000000')
GO


-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_user]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_user]
GO

CREATE TABLE [dbo].[sys_user] (
  [Id] uniqueidentifier  NOT NULL,
  [Name] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [LoginName] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Password] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Phone] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Email] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [DeleteLock] bit  NOT NULL,
  [OrganizationId] int  NULL,
  [LastModificationTime] datetime2(7)  NOT NULL,
  [CreationTime] datetime2(7)  NOT NULL
)
GO

ALTER TABLE [dbo].[sys_user] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO [dbo].[sys_user] ([Id], [Name], [LoginName], [Password], [Phone], [Email], [DeleteLock], [OrganizationId], [LastModificationTime], [CreationTime]) VALUES (N'5722AF0F-2366-4FC9-62D5-08DA00E3D8A0', N'杜甫', N'杜甫', N'46F94C8DE14FB36680850768FF1B7F2A', N'12345678900', N'12345678900@qq.com', N'0', N'7', N'2022-03-08 17:13:02.0000000', N'2022-03-08 17:13:02.0000000')
GO

INSERT INTO [dbo].[sys_user] ([Id], [Name], [LoginName], [Password], [Phone], [Email], [DeleteLock], [OrganizationId], [LastModificationTime], [CreationTime]) VALUES (N'4FD6A740-0CF1-4975-62D6-08DA00E3D8A0', N'李商隐', N'李商隐', N'46F94C8DE14FB36680850768FF1B7F2A', N'12345678900', N'12345678900@qq.com', N'0', N'7', N'2022-03-08 17:14:13.0000000', N'2022-03-08 17:14:13.0000000')
GO

INSERT INTO [dbo].[sys_user] ([Id], [Name], [LoginName], [Password], [Phone], [Email], [DeleteLock], [OrganizationId], [LastModificationTime], [CreationTime]) VALUES (N'E225E163-31C9-4DA9-62D7-08DA00E3D8A0', N'苏轼', N'苏轼', N'46F94C8DE14FB36680850768FF1B7F2A', N'12345678900', N'12345678900@qq.com', N'0', N'7', N'2022-03-08 17:15:07.0000000', N'2022-03-08 17:15:07.0000000')
GO

INSERT INTO [dbo].[sys_user] ([Id], [Name], [LoginName], [Password], [Phone], [Email], [DeleteLock], [OrganizationId], [LastModificationTime], [CreationTime]) VALUES (N'3739F349-7995-4C63-62D8-08DA00E3D8A0', N'白居易', N'白居易', N'46F94C8DE14FB36680850768FF1B7F2A', N'12345678900', N'12345678900@qq.com', N'0', N'7', N'2022-03-08 17:17:58.0000000', N'2022-03-08 17:17:58.0000000')
GO

INSERT INTO [dbo].[sys_user] ([Id], [Name], [LoginName], [Password], [Phone], [Email], [DeleteLock], [OrganizationId], [LastModificationTime], [CreationTime]) VALUES (N'A3F9784C-5F00-4EC9-62D9-08DA00E3D8A0', N'陶渊明 ', N'陶渊明 ', N'46F94C8DE14FB36680850768FF1B7F2A', N'12345678900', N'12345678900@qq.com', N'0', N'7', N'2022-03-08 17:19:22.0000000', N'2022-03-08 17:19:22.0000000')
GO

INSERT INTO [dbo].[sys_user] ([Id], [Name], [LoginName], [Password], [Phone], [Email], [DeleteLock], [OrganizationId], [LastModificationTime], [CreationTime]) VALUES (N'A1B6DAFB-2B6A-4FF9-62DA-08DA00E3D8A0', N'屈原', N'屈原', N'46F94C8DE14FB36680850768FF1B7F2A', N'12345678900', N'12345678900@qq.com', N'0', N'7', N'2022-03-08 17:19:55.0000000', N'2022-03-08 17:19:55.0000000')
GO

INSERT INTO [dbo].[sys_user] ([Id], [Name], [LoginName], [Password], [Phone], [Email], [DeleteLock], [OrganizationId], [LastModificationTime], [CreationTime]) VALUES (N'CC186FE2-EE27-4292-62DB-08DA00E3D8A0', N'孟浩然', N'孟浩然', N'46F94C8DE14FB36680850768FF1B7F2A', N'12345678900', N'12345678900@qq.com', N'0', N'7', N'2022-03-08 17:20:20.0000000', N'2022-03-08 17:20:20.0000000')
GO

INSERT INTO [dbo].[sys_user] ([Id], [Name], [LoginName], [Password], [Phone], [Email], [DeleteLock], [OrganizationId], [LastModificationTime], [CreationTime]) VALUES (N'1550D6D4-0529-4FDD-62DC-08DA00E3D8A0', N'鲁迅', N'鲁迅', N'46F94C8DE14FB36680850768FF1B7F2A', N'12345678900', N'12345678900@qq.com', N'0', N'7', N'2022-03-08 17:30:56.0000000', N'2022-03-08 17:21:56.0000000')
GO

INSERT INTO [dbo].[sys_user] ([Id], [Name], [LoginName], [Password], [Phone], [Email], [DeleteLock], [OrganizationId], [LastModificationTime], [CreationTime]) VALUES (N'0198459E-2034-4533-B843-5D227AD20740', N'超级管理员', N'admin', N'E10ADC3949BA59ABBE56E057F20F883E', N'10000000000', N'1396510655@qq.com', N'1', N'7', N'2022-03-08 17:27:36.0000000', N'2017-04-06 19:55:53.0000000')
GO

INSERT INTO [dbo].[sys_user] ([Id], [Name], [LoginName], [Password], [Phone], [Email], [DeleteLock], [OrganizationId], [LastModificationTime], [CreationTime]) VALUES (N'AC18F496-E93D-42F0-B59E-E321ACC85335', N'李白', N'libai', N'E10ADC3949BA59ABBE56E057F20F883E', N'12345678900', N'12345678900@live.com', N'1', N'7', N'2022-03-08 10:12:14.0000000', N'2017-04-06 19:55:53.0000000')
GO


-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_user_post]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_user_post]
GO

CREATE TABLE [dbo].[sys_user_post] (
  [Id] uniqueidentifier  NOT NULL,
  [UserId] uniqueidentifier  NOT NULL,
  [PostId] uniqueidentifier  NOT NULL,
  [LastModificationTime] datetime2(7)  NOT NULL,
  [CreationTime] datetime2(7)  NOT NULL
)
GO

ALTER TABLE [dbo].[sys_user_post] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO [dbo].[sys_user_post] ([Id], [UserId], [PostId], [LastModificationTime], [CreationTime]) VALUES (N'978FC672-D829-4DAD-ABC7-071810C5AD18', N'E225E163-31C9-4DA9-62D7-08DA00E3D8A0', N'E46AF329-6D08-442C-9837-F22CFF954411', N'2022-03-08 17:15:08.0000000', N'2022-03-08 17:15:08.0000000')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [UserId], [PostId], [LastModificationTime], [CreationTime]) VALUES (N'DA9B04C9-D1EF-4721-8A94-4558DFE2EB7D', N'A1B6DAFB-2B6A-4FF9-62DA-08DA00E3D8A0', N'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622', N'2022-06-21 19:59:02.0000000', N'2022-06-21 19:59:02.0000000')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [UserId], [PostId], [LastModificationTime], [CreationTime]) VALUES (N'575BF085-47BB-42F2-8B68-620CF460B164', N'0198459E-2034-4533-B843-5D227AD20740', N'96927C30-41D0-4CED-8E29-CBED35C90FB0', N'2022-03-08 17:29:22.0000000', N'2022-03-08 17:29:22.0000000')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [UserId], [PostId], [LastModificationTime], [CreationTime]) VALUES (N'AF1BEC7E-3309-4629-9606-72EEFA1826B3', N'CC186FE2-EE27-4292-62DB-08DA00E3D8A0', N'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622', N'2022-03-08 17:20:20.0000000', N'2022-03-08 17:20:20.0000000')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [UserId], [PostId], [LastModificationTime], [CreationTime]) VALUES (N'B669EC48-AA60-441A-B59D-7F9BE7B94155', N'1550D6D4-0529-4FDD-62DC-08DA00E3D8A0', N'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622', N'2022-07-06 21:49:13.0000000', N'2022-07-06 21:49:13.0000000')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [UserId], [PostId], [LastModificationTime], [CreationTime]) VALUES (N'D4E0AE0B-3573-4901-8FD7-9BB2C88EBE94', N'3739F349-7995-4C63-62D8-08DA00E3D8A0', N'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622', N'2022-03-08 17:17:58.0000000', N'2022-03-08 17:17:58.0000000')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [UserId], [PostId], [LastModificationTime], [CreationTime]) VALUES (N'B97331A7-E281-4027-AADE-9F068558826A', N'5722AF0F-2366-4FC9-62D5-08DA00E3D8A0', N'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622', N'2022-03-08 17:13:02.0000000', N'2022-03-08 17:13:02.0000000')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [UserId], [PostId], [LastModificationTime], [CreationTime]) VALUES (N'0C1A55BA-6BD3-4810-A494-A6B9B7374D4D', N'AC18F496-E93D-42F0-B59E-E321ACC85335', N'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622', N'2022-03-08 10:13:35.0000000', N'2022-03-08 10:13:35.0000000')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [UserId], [PostId], [LastModificationTime], [CreationTime]) VALUES (N'E64EF93C-2CE5-4B1D-A5D0-A9DE937C5A3F', N'E225E163-31C9-4DA9-62D7-08DA00E3D8A0', N'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622', N'2022-03-08 17:15:07.0000000', N'2022-03-08 17:15:07.0000000')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [UserId], [PostId], [LastModificationTime], [CreationTime]) VALUES (N'6F671077-C98D-4106-9736-BF2EDB6DB58D', N'4FD6A740-0CF1-4975-62D6-08DA00E3D8A0', N'E46AF329-6D08-442C-9837-F22CFF954411', N'2022-03-08 17:14:13.0000000', N'2022-03-08 17:14:13.0000000')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [UserId], [PostId], [LastModificationTime], [CreationTime]) VALUES (N'6C34F115-28DD-441A-81D5-F6598C97D44A', N'A3F9784C-5F00-4EC9-62D9-08DA00E3D8A0', N'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622', N'2022-03-08 17:19:22.0000000', N'2022-03-08 17:19:22.0000000')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [UserId], [PostId], [LastModificationTime], [CreationTime]) VALUES (N'B797FF16-D6F7-45DB-83EC-F910B2612926', N'4FD6A740-0CF1-4975-62D6-08DA00E3D8A0', N'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622', N'2022-03-08 17:14:13.0000000', N'2022-03-08 17:14:13.0000000')
GO


-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_user_role]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_user_role]
GO

CREATE TABLE [dbo].[sys_user_role] (
  [Id] uniqueidentifier  NOT NULL,
  [UserId] uniqueidentifier  NOT NULL,
  [RoleId] uniqueidentifier  NOT NULL,
  [LastModificationTime] datetime2(7)  NOT NULL,
  [CreationTime] datetime2(7)  NOT NULL
)
GO

ALTER TABLE [dbo].[sys_user_role] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO [dbo].[sys_user_role] ([Id], [UserId], [RoleId], [LastModificationTime], [CreationTime]) VALUES (N'AD5014F2-92E8-4109-9CA4-013A92390F8B', N'CC186FE2-EE27-4292-62DB-08DA00E3D8A0', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'2022-03-08 17:20:20.0000000', N'2022-03-08 17:20:20.0000000')
GO

INSERT INTO [dbo].[sys_user_role] ([Id], [UserId], [RoleId], [LastModificationTime], [CreationTime]) VALUES (N'CE9F61AC-79D8-426F-9066-36962C017BF6', N'5722AF0F-2366-4FC9-62D5-08DA00E3D8A0', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'2022-03-08 17:13:02.0000000', N'2022-03-08 17:13:02.0000000')
GO

INSERT INTO [dbo].[sys_user_role] ([Id], [UserId], [RoleId], [LastModificationTime], [CreationTime]) VALUES (N'DBC656A6-4264-417D-97D8-577E1218FECA', N'A3F9784C-5F00-4EC9-62D9-08DA00E3D8A0', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'2022-03-08 17:19:22.0000000', N'2022-03-08 17:19:22.0000000')
GO

INSERT INTO [dbo].[sys_user_role] ([Id], [UserId], [RoleId], [LastModificationTime], [CreationTime]) VALUES (N'9B7BEE51-2FB4-4ABA-B680-6EEA512919EB', N'A1B6DAFB-2B6A-4FF9-62DA-08DA00E3D8A0', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'2022-06-21 19:59:02.0000000', N'2022-06-21 19:59:02.0000000')
GO

INSERT INTO [dbo].[sys_user_role] ([Id], [UserId], [RoleId], [LastModificationTime], [CreationTime]) VALUES (N'23D32064-6EB8-4EA9-9B2A-7E2F09F53E4D', N'1550D6D4-0529-4FDD-62DC-08DA00E3D8A0', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'2022-07-06 21:49:13.0000000', N'2022-07-06 21:49:13.0000000')
GO

INSERT INTO [dbo].[sys_user_role] ([Id], [UserId], [RoleId], [LastModificationTime], [CreationTime]) VALUES (N'1FE23F57-97C5-4670-9064-88D7D972CD28', N'E225E163-31C9-4DA9-62D7-08DA00E3D8A0', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'2022-03-08 17:15:07.0000000', N'2022-03-08 17:15:07.0000000')
GO

INSERT INTO [dbo].[sys_user_role] ([Id], [UserId], [RoleId], [LastModificationTime], [CreationTime]) VALUES (N'A9F8A23B-8C2F-43CC-97AF-8ED6F4C4D097', N'4FD6A740-0CF1-4975-62D6-08DA00E3D8A0', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'2022-03-08 17:14:13.0000000', N'2022-03-08 17:14:13.0000000')
GO

INSERT INTO [dbo].[sys_user_role] ([Id], [UserId], [RoleId], [LastModificationTime], [CreationTime]) VALUES (N'45B7D5AF-4D2C-465E-A4B6-99E52AF9AEE5', N'3739F349-7995-4C63-62D8-08DA00E3D8A0', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'2022-03-08 17:17:58.0000000', N'2022-03-08 17:17:58.0000000')
GO

INSERT INTO [dbo].[sys_user_role] ([Id], [UserId], [RoleId], [LastModificationTime], [CreationTime]) VALUES (N'1C9F81DF-C8A0-45BB-A272-C84BD3AF0C19', N'0198459E-2034-4533-B843-5D227AD20740', N'18FA4771-6F58-46A3-80D2-6F0F5E9972E3', N'2022-03-08 17:29:22.0000000', N'2022-03-08 17:29:22.0000000')
GO

INSERT INTO [dbo].[sys_user_role] ([Id], [UserId], [RoleId], [LastModificationTime], [CreationTime]) VALUES (N'FA1FDF14-3847-4194-894C-CD935A3DD9E6', N'AC18F496-E93D-42F0-B59E-E321ACC85335', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'2022-03-08 10:13:35.0000000', N'2022-03-08 10:13:35.0000000')
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
DBCC CHECKIDENT ('[dbo].[sys_menu]', RESEED, 38)
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

