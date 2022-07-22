/*
 Navicat Premium Data Transfer

 Source Server         : 本地_SqlServer
 Source Server Type    : SQL Server
 Source Server Version : 14001000
 Source Host           : .:1433
 Source Catalog        : hzy_admin_sqlserver_20220705
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 14001000
 File Encoding         : 65001

 Date: 22/07/2022 09:37:16
*/


-- ----------------------------
-- Table structure for flow
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[flow]') AND type IN ('U'))
	DROP TABLE [dbo].[flow]
GO

CREATE TABLE [dbo].[flow] (
  [Id] uniqueidentifier  NOT NULL,
  [LastModificationTime] datetime  NULL,
  [CreationTime] datetime  NULL,
  [Number] int  NULL,
  [Code] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Name] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Remark] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[flow] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'排序号',
'SCHEMA', N'dbo',
'TABLE', N'flow',
'COLUMN', N'Number'
GO

EXEC sp_addextendedproperty
'MS_Description', N'编码',
'SCHEMA', N'dbo',
'TABLE', N'flow',
'COLUMN', N'Code'
GO

EXEC sp_addextendedproperty
'MS_Description', N'流程名称',
'SCHEMA', N'dbo',
'TABLE', N'flow',
'COLUMN', N'Name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'备注',
'SCHEMA', N'dbo',
'TABLE', N'flow',
'COLUMN', N'Remark'
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
  [LastModificationTime] datetime  NULL,
  [CreationTime] datetime  NULL,
  [UserId] uniqueidentifier  NULL,
  [UserName] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [LaunchTime] datetime  NULL,
  [FormId] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [FlowId] uniqueidentifier  NULL,
  [FlowCode] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [FlowName] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[flow_approval] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'发起人Id',
'SCHEMA', N'dbo',
'TABLE', N'flow_approval',
'COLUMN', N'UserId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'发起人',
'SCHEMA', N'dbo',
'TABLE', N'flow_approval',
'COLUMN', N'UserName'
GO

EXEC sp_addextendedproperty
'MS_Description', N'发起时间',
'SCHEMA', N'dbo',
'TABLE', N'flow_approval',
'COLUMN', N'LaunchTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'表单Id',
'SCHEMA', N'dbo',
'TABLE', N'flow_approval',
'COLUMN', N'FormId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'流程Id',
'SCHEMA', N'dbo',
'TABLE', N'flow_approval',
'COLUMN', N'FlowId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'流程编码',
'SCHEMA', N'dbo',
'TABLE', N'flow_approval',
'COLUMN', N'FlowCode'
GO

EXEC sp_addextendedproperty
'MS_Description', N'流程名称',
'SCHEMA', N'dbo',
'TABLE', N'flow_approval',
'COLUMN', N'FlowName'
GO


-- ----------------------------
-- Records of flow_approval
-- ----------------------------

-- ----------------------------
-- Table structure for flow_approval_step
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[flow_approval_step]') AND type IN ('U'))
	DROP TABLE [dbo].[flow_approval_step]
GO

CREATE TABLE [dbo].[flow_approval_step] (
  [Id] uniqueidentifier  NOT NULL,
  [LastModificationTime] datetime  NULL,
  [CreationTime] datetime  NULL,
  [Sort] int  NULL,
  [FlowNodeId] uniqueidentifier  NULL,
  [FlowNodeName] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [SortMore] int  NULL,
  [State] int  NULL,
  [OpinIons] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [UserId] uniqueidentifier  NULL,
  [UserName] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [ApprovalDate] datetime  NULL
)
GO

ALTER TABLE [dbo].[flow_approval_step] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'步骤顺序号',
'SCHEMA', N'dbo',
'TABLE', N'flow_approval_step',
'COLUMN', N'Sort'
GO

EXEC sp_addextendedproperty
'MS_Description', N'审批流节点Id',
'SCHEMA', N'dbo',
'TABLE', N'flow_approval_step',
'COLUMN', N'FlowNodeId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'审批流节点名称',
'SCHEMA', N'dbo',
'TABLE', N'flow_approval_step',
'COLUMN', N'FlowNodeName'
GO

EXEC sp_addextendedproperty
'MS_Description', N'多次审批顺序号（可能是多次审批次数）',
'SCHEMA', N'dbo',
'TABLE', N'flow_approval_step',
'COLUMN', N'SortMore'
GO

EXEC sp_addextendedproperty
'MS_Description', N'步骤状态（待审批、同意、不同意、回退升级审批）',
'SCHEMA', N'dbo',
'TABLE', N'flow_approval_step',
'COLUMN', N'State'
GO

EXEC sp_addextendedproperty
'MS_Description', N'步骤审批意见',
'SCHEMA', N'dbo',
'TABLE', N'flow_approval_step',
'COLUMN', N'OpinIons'
GO

EXEC sp_addextendedproperty
'MS_Description', N'步骤审批人Id',
'SCHEMA', N'dbo',
'TABLE', N'flow_approval_step',
'COLUMN', N'UserId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'步骤审批人名称',
'SCHEMA', N'dbo',
'TABLE', N'flow_approval_step',
'COLUMN', N'UserName'
GO

EXEC sp_addextendedproperty
'MS_Description', N'审批时间',
'SCHEMA', N'dbo',
'TABLE', N'flow_approval_step',
'COLUMN', N'ApprovalDate'
GO


-- ----------------------------
-- Records of flow_approval_step
-- ----------------------------

-- ----------------------------
-- Table structure for flow_approval_step_user
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[flow_approval_step_user]') AND type IN ('U'))
	DROP TABLE [dbo].[flow_approval_step_user]
GO

CREATE TABLE [dbo].[flow_approval_step_user] (
  [Id] uniqueidentifier  NOT NULL,
  [LastModificationTime] datetime  NULL,
  [CreationTime] datetime  NULL,
  [FlowApprovalStepId] uniqueidentifier  NULL,
  [FlowNodeId] uniqueidentifier  NULL,
  [FlowNodeName] varchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [UserId] uniqueidentifier  NULL,
  [UserName] varchar(500) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[flow_approval_step_user] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'步骤Id',
'SCHEMA', N'dbo',
'TABLE', N'flow_approval_step_user',
'COLUMN', N'FlowApprovalStepId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'审批节点Id',
'SCHEMA', N'dbo',
'TABLE', N'flow_approval_step_user',
'COLUMN', N'FlowNodeId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'审批节点名称',
'SCHEMA', N'dbo',
'TABLE', N'flow_approval_step_user',
'COLUMN', N'FlowNodeName'
GO

EXEC sp_addextendedproperty
'MS_Description', N'审批人Id',
'SCHEMA', N'dbo',
'TABLE', N'flow_approval_step_user',
'COLUMN', N'UserId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'审批人名称',
'SCHEMA', N'dbo',
'TABLE', N'flow_approval_step_user',
'COLUMN', N'UserName'
GO


-- ----------------------------
-- Records of flow_approval_step_user
-- ----------------------------

-- ----------------------------
-- Table structure for flow_node
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[flow_node]') AND type IN ('U'))
	DROP TABLE [dbo].[flow_node]
GO

CREATE TABLE [dbo].[flow_node] (
  [Id] uniqueidentifier  NOT NULL,
  [LastModificationTime] datetime  NULL,
  [CreationTime] datetime  NULL,
  [FlowId] uniqueidentifier  NULL,
  [FlowCode] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Sort] int  NULL,
  [Name] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [RoleId] uniqueidentifier  NULL,
  [Remark] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL
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
  [LastModificationTime] datetime  NULL,
  [CreationTime] datetime  NULL,
  [Low_Code_TableId] uniqueidentifier  NULL,
  [Low_Code_Table_InfoId] uniqueidentifier  NULL,
  [ForeignKeyTableId] uniqueidentifier  NULL,
  [ForeignKeyTableFieldName] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL
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
  [LastModificationTime] datetime  NULL,
  [CreationTime] datetime  NULL,
  [Low_Code_TableId] uniqueidentifier  NULL,
  [Low_Code_Table_InfoId] uniqueidentifier  NULL
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
  [LastModificationTime] datetime  NULL,
  [CreationTime] datetime  NULL,
  [TableName] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [Schema] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [Type] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [DisplayName] varchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [EntityName] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [Remark] varchar(500) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[low_code_table] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of low_code_table
-- ----------------------------
INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark]) VALUES (N'69B24F04-0ED3-45FC-91D9-0DC929175A57', N'2022-05-24 21:57:34.433', N'2022-04-17 00:00:00.000', N'sys_user_post', N'dbo', N'TABLE', N'用户与岗位', N'SysUserPost', NULL)
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark]) VALUES (N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'2022-05-24 21:57:34.433', N'2022-05-23 00:00:00.000', N'low_code_table', N'dbo', N'TABLE', N'低代码表', N'LowCodeTable', NULL)
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark]) VALUES (N'651BB982-1130-4E1C-9070-36B90DCF2324', N'2022-05-24 21:57:34.433', N'2022-04-17 00:00:00.000', N'flow_approval_step', N'dbo', N'TABLE', N'工作流审批步骤配置', N'FlowApprovalStep', NULL)
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark]) VALUES (N'524E71B4-CBF7-4248-8B29-3F99B43F2EB2', N'2022-05-24 21:57:34.433', N'2022-04-17 00:00:00.000', N'sys_data_authority_custom', N'dbo', N'TABLE', N'自定义数据权限', N'SysDataAuthorityCustom', NULL)
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark]) VALUES (N'7AD3B915-F0BD-443A-89CD-42D41DD6C554', N'2022-05-24 21:57:34.433', N'2022-04-17 00:00:00.000', N'flow_approval_step_user', N'dbo', N'TABLE', N'工作流用户审批步骤', N'FlowApprovalStepUser', NULL)
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark]) VALUES (N'1A8DF018-79F8-4E26-B4EB-4B735AAE7275', N'2022-05-24 21:57:34.433', N'2022-04-17 00:00:00.000', N'flow', N'dbo', N'TABLE', N'审批流', N'Flow', NULL)
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark]) VALUES (N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'2022-05-24 21:57:34.433', N'2022-04-17 00:00:00.000', N'sys_operation_log', N'dbo', N'TABLE', N'操作日志', N'SysOperationLog', NULL)
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark]) VALUES (N'2AE9E532-7D9A-474B-B629-50A39945C44D', N'2022-05-24 21:57:34.433', N'2022-04-17 00:00:00.000', N'sys_menu_function', N'dbo', N'TABLE', N'菜单功能', N'SysMenuFunction', NULL)
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark]) VALUES (N'D8948C56-C5BD-4061-B272-5417375F38F0', N'2022-05-24 21:57:34.433', N'2022-04-17 00:00:00.000', N'flow_approval', N'dbo', N'TABLE', N'审批流审批', N'FlowApproval', NULL)
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark]) VALUES (N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'2022-05-24 21:57:34.433', N'2022-04-17 00:00:00.000', N'sys_organization', N'dbo', N'TABLE', N'组织', N'SysOrganization', NULL)
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark]) VALUES (N'6323638B-A45F-4A76-886E-69A9E9BE0901', N'2022-05-24 21:57:34.433', N'2022-04-17 00:00:00.000', N'sys_user', N'dbo', N'TABLE', N'用户', N'SysUser', NULL)
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark]) VALUES (N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'2022-05-24 21:57:34.433', N'2022-05-23 00:00:00.000', N'low_code_table_info', N'dbo', N'TABLE', N'低代码表信息', N'LowCodeTableInfo', NULL)
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark]) VALUES (N'AF37F705-7BA0-4883-B1BE-8A274EA4C026', N'2022-05-24 21:57:34.433', N'2022-04-17 00:00:00.000', N'sys_dictionary', N'dbo', N'TABLE', N'数据字典', N'SysDictionary', NULL)
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark]) VALUES (N'73C97832-4E7F-4758-86D2-94327971B5FD', N'2022-05-24 21:57:34.433', N'2022-04-17 00:00:00.000', N'member', N'dbo', N'TABLE', N'会员', N'Member', NULL)
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark]) VALUES (N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'2022-05-24 21:57:34.433', N'2022-04-17 00:00:00.000', N'sys_menu', N'dbo', N'TABLE', N'菜单', N'SysMenu', NULL)
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark]) VALUES (N'F3D7BBB3-C1FB-4D61-92A4-9BC101811335', N'2022-05-24 21:57:34.433', N'2022-04-17 00:00:00.000', N'sys_role', N'dbo', N'TABLE', N'角色', N'SysRole', NULL)
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark]) VALUES (N'852F53FF-0D00-4C32-AA55-A9C11993751B', N'2022-05-24 21:57:34.433', N'2022-05-23 00:00:00.000', N'low_code_list', N'dbo', N'TABLE', N'低代码列表', N'LowCodeList', NULL)
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark]) VALUES (N'AE6D94D8-6A15-4348-B600-AA17E4B61718', N'2022-05-24 21:57:34.433', N'2022-04-17 00:00:00.000', N'flow_node', N'dbo', N'TABLE', N'工作流节点', N'FlowNode', NULL)
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark]) VALUES (N'69EDD8A8-1D24-478C-A909-B82039EDCEC0', N'2022-05-24 21:57:34.433', N'2022-05-23 00:00:00.000', N'low_code_search', N'dbo', N'TABLE', N'低代码检索表', N'LowCodeSearch', NULL)
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark]) VALUES (N'6FABC67A-8B48-49A6-8BA1-C8A32C499D36', N'2022-05-24 21:57:34.433', N'2022-04-17 00:00:00.000', N'sys_function', N'dbo', N'TABLE', N'功能', N'SysFunction', NULL)
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark]) VALUES (N'0A8BDB18-758A-4798-9FFC-E7031DCBF262', N'2022-05-24 21:57:34.433', N'2022-04-17 00:00:00.000', N'sys_post', N'dbo', N'TABLE', N'岗位', N'SysPost', NULL)
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark]) VALUES (N'8DA38D20-8A09-4E81-8DD8-ED6702AEE380', N'2022-05-24 21:57:34.433', N'2022-04-17 00:00:00.000', N'sys_role_menu_function', N'dbo', N'TABLE', N'角色菜单功能关联', N'SysRoleMenuFunction', NULL)
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark]) VALUES (N'E79DB53B-7162-4669-9B5E-F860501475AC', N'2022-05-24 21:57:34.433', N'2022-04-17 00:00:00.000', N'sys_data_authority', N'dbo', N'TABLE', N'数据权限', N'SysDataAuthority', NULL)
GO

INSERT INTO [dbo].[low_code_table] ([Id], [LastModificationTime], [CreationTime], [TableName], [Schema], [Type], [DisplayName], [EntityName], [Remark]) VALUES (N'3DA5D264-2E8D-460C-A10C-FF9A6BB57A60', N'2022-05-24 21:57:34.433', N'2022-04-17 00:00:00.000', N'sys_user_role', N'dbo', N'TABLE', N'用户与角色', N'SysUserRole', NULL)
GO


-- ----------------------------
-- Table structure for low_code_table_info
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[low_code_table_info]') AND type IN ('U'))
	DROP TABLE [dbo].[low_code_table_info]
GO

CREATE TABLE [dbo].[low_code_table_info] (
  [Id] uniqueidentifier  NOT NULL,
  [LastModificationTime] datetime  NULL,
  [CreationTime] datetime  NULL,
  [Low_Code_TableId] uniqueidentifier  NULL,
  [IsPrimary] bit  NULL,
  [IsIdentity] bit  NULL,
  [IsNullable] bit  NULL,
  [Position] int  NULL,
  [ColumnName] varchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [Describe] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [DatabaseColumnType] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [CsType] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [CsField] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [MaxLength] int  NULL,
  [DisplayName] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[low_code_table_info] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of low_code_table_info
-- ----------------------------
INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'60019CD9-49EB-489B-97B5-08DA39A2EF6C', N'2022-05-19 22:26:18.973', N'2022-05-19 00:00:00.000', N'3DA5D264-2E8D-460C-A10C-FF9A6BB57A60', N'1', N'0', N'0', N'170', N'Id', N'Id', N'uniqueidentifier', N'Guid', N'Id', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'825E69B9-CD33-4AB8-97B6-08DA39A2EF6C', N'2022-05-19 22:26:18.973', N'2022-05-19 00:00:00.000', N'3DA5D264-2E8D-460C-A10C-FF9A6BB57A60', N'0', N'0', N'1', N'174', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'252AC7B2-0E62-48E1-97B7-08DA39A2EF6C', N'2022-05-19 22:26:18.973', N'2022-05-19 00:00:00.000', N'3DA5D264-2E8D-460C-A10C-FF9A6BB57A60', N'0', N'0', N'1', N'173', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'2029BB6D-A0F2-41DE-97B8-08DA39A2EF6C', N'2022-05-19 22:26:18.973', N'2022-05-19 00:00:00.000', N'3DA5D264-2E8D-460C-A10C-FF9A6BB57A60', N'0', N'0', N'1', N'172', N'RoleId', N'', N'uniqueidentifier', N'Guid', N'RoleId', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'18B4430B-765D-4A71-97B9-08DA39A2EF6C', N'2022-05-19 22:26:18.973', N'2022-05-19 00:00:00.000', N'3DA5D264-2E8D-460C-A10C-FF9A6BB57A60', N'0', N'0', N'1', N'171', N'UserId', N'', N'uniqueidentifier', N'Guid', N'UserId', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'A72C0341-82E8-48AD-D481-08DA3D8D5A26', N'2022-05-24 21:57:33.877', N'2022-05-24 21:57:33.877', N'1A8DF018-79F8-4E26-B4EB-4B735AAE7275', N'1', N'0', N'0', N'24', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'70E30A70-99F9-44B3-D482-08DA3D8D5A26', N'2022-05-24 21:57:33.877', N'2022-05-24 21:57:33.877', N'1A8DF018-79F8-4E26-B4EB-4B735AAE7275', N'0', N'0', N'1', N'28', N'Code', N'编码', N'nvarchar(255)', N'String', N'Code', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'5FC01EB0-4833-4E93-D483-08DA3D8D5A26', N'2022-05-24 21:57:33.877', N'2022-05-24 21:57:33.877', N'1A8DF018-79F8-4E26-B4EB-4B735AAE7275', N'0', N'0', N'1', N'26', N'CreationTime', N'', N'datetime', N'DateTime', N'CreationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'FD9ABF54-3C88-44B0-D484-08DA3D8D5A26', N'2022-05-24 21:57:33.877', N'2022-05-24 21:57:33.877', N'1A8DF018-79F8-4E26-B4EB-4B735AAE7275', N'0', N'0', N'1', N'25', N'LastModificationTime', N'', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'06F4F5A9-F63F-4E47-D485-08DA3D8D5A26', N'2022-05-24 21:57:33.877', N'2022-05-24 21:57:33.877', N'1A8DF018-79F8-4E26-B4EB-4B735AAE7275', N'0', N'0', N'1', N'29', N'Name', N'流程名称', N'nvarchar(255)', N'String', N'Name', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'5CB41F1C-E68A-47F9-D486-08DA3D8D5A26', N'2022-05-24 21:57:33.877', N'2022-05-24 21:57:33.877', N'1A8DF018-79F8-4E26-B4EB-4B735AAE7275', N'0', N'0', N'1', N'27', N'Number', N'排序号', N'int', N'Int32', N'Number', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'F21D4C33-E65A-4DFE-D487-08DA3D8D5A26', N'2022-05-24 21:57:33.877', N'2022-05-24 21:57:33.877', N'1A8DF018-79F8-4E26-B4EB-4B735AAE7275', N'0', N'0', N'1', N'30', N'Remark', N'备注', N'nvarchar(255)', N'String', N'Remark', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'B9BBAB1D-0A03-4D07-D488-08DA3D8D5A26', N'2022-05-24 21:57:33.903', N'2022-05-24 21:57:33.903', N'D8948C56-C5BD-4061-B272-5417375F38F0', N'1', N'0', N'0', N'31', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'01CA178C-112A-4A49-D489-08DA3D8D5A26', N'2022-05-24 21:57:33.903', N'2022-05-24 21:57:33.903', N'D8948C56-C5BD-4061-B272-5417375F38F0', N'0', N'0', N'1', N'33', N'CreationTime', N'', N'datetime', N'DateTime', N'CreationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'A0FDEB45-C9FE-439B-D48A-08DA3D8D5A26', N'2022-05-24 21:57:33.903', N'2022-05-24 21:57:33.903', N'D8948C56-C5BD-4061-B272-5417375F38F0', N'0', N'0', N'1', N'39', N'FlowCode', N'流程编码', N'varchar(255)', N'String', N'FlowCode', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'2B4747ED-0409-4D14-D48B-08DA3D8D5A26', N'2022-05-24 21:57:33.903', N'2022-05-24 21:57:33.903', N'D8948C56-C5BD-4061-B272-5417375F38F0', N'0', N'0', N'1', N'38', N'FlowId', N'流程Id', N'uniqueidentifier', N'Guid', N'FlowId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'F00CDE73-2294-40D6-D48C-08DA3D8D5A26', N'2022-05-24 21:57:33.903', N'2022-05-24 21:57:33.903', N'D8948C56-C5BD-4061-B272-5417375F38F0', N'0', N'0', N'1', N'40', N'FlowName', N'流程名称', N'varchar(255)', N'String', N'FlowName', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'CAAE5D6F-F9C7-4EDB-D48D-08DA3D8D5A26', N'2022-05-24 21:57:33.903', N'2022-05-24 21:57:33.903', N'D8948C56-C5BD-4061-B272-5417375F38F0', N'0', N'0', N'1', N'37', N'FormId', N'表单Id', N'varchar(50)', N'String', N'FormId', N'50', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'609A52AA-48B2-4E64-D48E-08DA3D8D5A26', N'2022-05-24 21:57:33.903', N'2022-05-24 21:57:33.903', N'D8948C56-C5BD-4061-B272-5417375F38F0', N'0', N'0', N'1', N'32', N'LastModificationTime', N'', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'3071360B-C1EF-4DFF-D48F-08DA3D8D5A26', N'2022-05-24 21:57:33.903', N'2022-05-24 21:57:33.903', N'D8948C56-C5BD-4061-B272-5417375F38F0', N'0', N'0', N'1', N'36', N'LaunchTime', N'发起时间', N'datetime', N'DateTime', N'LaunchTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'ACF079D0-3DB9-43F7-D490-08DA3D8D5A26', N'2022-05-24 21:57:33.903', N'2022-05-24 21:57:33.903', N'D8948C56-C5BD-4061-B272-5417375F38F0', N'0', N'0', N'1', N'34', N'UserId', N'发起人Id', N'uniqueidentifier', N'Guid', N'UserId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'6284C929-4115-4C17-D491-08DA3D8D5A26', N'2022-05-24 21:57:33.903', N'2022-05-24 21:57:33.903', N'D8948C56-C5BD-4061-B272-5417375F38F0', N'0', N'0', N'1', N'35', N'UserName', N'发起人', N'varchar(255)', N'String', N'UserName', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'F5C93CC7-50A6-4E0E-D492-08DA3D8D5A26', N'2022-05-24 21:57:33.927', N'2022-05-24 21:57:33.927', N'651BB982-1130-4E1C-9070-36B90DCF2324', N'1', N'0', N'0', N'41', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'F6D23541-2FCA-40E6-D493-08DA3D8D5A26', N'2022-05-24 21:57:33.927', N'2022-05-24 21:57:33.927', N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'52', N'ApprovalDate', N'审批时间', N'datetime', N'DateTime', N'ApprovalDate', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'8AD408DB-B5AA-4CB7-D494-08DA3D8D5A26', N'2022-05-24 21:57:33.927', N'2022-05-24 21:57:33.927', N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'43', N'CreationTime', N'', N'datetime', N'DateTime', N'CreationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'2FFAA9EE-C286-4F90-D495-08DA3D8D5A26', N'2022-05-24 21:57:33.927', N'2022-05-24 21:57:33.927', N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'45', N'FlowNodeId', N'审批流节点Id', N'uniqueidentifier', N'Guid', N'FlowNodeId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'AAA312A2-73FB-4C84-D496-08DA3D8D5A26', N'2022-05-24 21:57:33.927', N'2022-05-24 21:57:33.927', N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'46', N'FlowNodeName', N'审批流节点名称', N'varchar(255)', N'String', N'FlowNodeName', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'043612F1-E16A-4C44-D497-08DA3D8D5A26', N'2022-05-24 21:57:33.927', N'2022-05-24 21:57:33.927', N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'42', N'LastModificationTime', N'', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'A8BE7873-7CE4-4CB2-D498-08DA3D8D5A26', N'2022-05-24 21:57:33.927', N'2022-05-24 21:57:33.927', N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'49', N'OpinIons', N'步骤审批意见', N'varchar(255)', N'String', N'OpinIons', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'E8E60481-FB7F-4F1D-D499-08DA3D8D5A26', N'2022-05-24 21:57:33.927', N'2022-05-24 21:57:33.927', N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'44', N'Sort', N'步骤顺序号', N'int', N'Int32', N'Sort', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'2A1C3F3D-4EFC-472B-D49A-08DA3D8D5A26', N'2022-05-24 21:57:33.927', N'2022-05-24 21:57:33.927', N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'47', N'SortMore', N'多次审批顺序号（可能是多次审批次数）', N'int', N'Int32', N'SortMore', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'CBD75568-2ECE-4F90-D49B-08DA3D8D5A26', N'2022-05-24 21:57:33.927', N'2022-05-24 21:57:33.927', N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'48', N'State', N'步骤状态（待审批、同意、不同意、回退升级审批）', N'int', N'Int32', N'State', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'E67FD0C6-A997-4956-D49C-08DA3D8D5A26', N'2022-05-24 21:57:33.927', N'2022-05-24 21:57:33.927', N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'50', N'UserId', N'步骤审批人Id', N'uniqueidentifier', N'Guid', N'UserId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'24DB7ED8-1A4F-4B25-D49D-08DA3D8D5A26', N'2022-05-24 21:57:33.927', N'2022-05-24 21:57:33.927', N'651BB982-1130-4E1C-9070-36B90DCF2324', N'0', N'0', N'1', N'51', N'UserName', N'步骤审批人名称', N'varchar(255)', N'String', N'UserName', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'E346CF76-EC76-4409-D49E-08DA3D8D5A26', N'2022-05-24 21:57:33.953', N'2022-05-24 21:57:33.953', N'7AD3B915-F0BD-443A-89CD-42D41DD6C554', N'1', N'0', N'0', N'53', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'AE55FABC-3944-4A36-D49F-08DA3D8D5A26', N'2022-05-24 21:57:33.953', N'2022-05-24 21:57:33.953', N'7AD3B915-F0BD-443A-89CD-42D41DD6C554', N'0', N'0', N'1', N'55', N'CreationTime', N'', N'datetime', N'DateTime', N'CreationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'B754AF63-F1DE-4000-D4A0-08DA3D8D5A26', N'2022-05-24 21:57:33.953', N'2022-05-24 21:57:33.953', N'7AD3B915-F0BD-443A-89CD-42D41DD6C554', N'0', N'0', N'1', N'56', N'FlowApprovalStepId', N'步骤Id', N'uniqueidentifier', N'Guid', N'FlowApprovalStepId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'495FE86E-5BD6-44D4-D4A1-08DA3D8D5A26', N'2022-05-24 21:57:33.953', N'2022-05-24 21:57:33.953', N'7AD3B915-F0BD-443A-89CD-42D41DD6C554', N'0', N'0', N'1', N'57', N'FlowNodeId', N'审批节点Id', N'uniqueidentifier', N'Guid', N'FlowNodeId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'D48C70E6-4549-41B6-D4A2-08DA3D8D5A26', N'2022-05-24 21:57:33.953', N'2022-05-24 21:57:33.953', N'7AD3B915-F0BD-443A-89CD-42D41DD6C554', N'0', N'0', N'1', N'58', N'FlowNodeName', N'审批节点名称', N'varchar(500)', N'String', N'FlowNodeName', N'500', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'0E864B91-B667-4F53-D4A3-08DA3D8D5A26', N'2022-05-24 21:57:33.953', N'2022-05-24 21:57:33.953', N'7AD3B915-F0BD-443A-89CD-42D41DD6C554', N'0', N'0', N'1', N'54', N'LastModificationTime', N'', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'92BC9094-160E-4338-D4A4-08DA3D8D5A26', N'2022-05-24 21:57:33.953', N'2022-05-24 21:57:33.953', N'7AD3B915-F0BD-443A-89CD-42D41DD6C554', N'0', N'0', N'1', N'59', N'UserId', N'审批人Id', N'uniqueidentifier', N'Guid', N'UserId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'0CFC881C-98D4-4A2C-D4A5-08DA3D8D5A26', N'2022-05-24 21:57:33.953', N'2022-05-24 21:57:33.953', N'7AD3B915-F0BD-443A-89CD-42D41DD6C554', N'0', N'0', N'1', N'60', N'UserName', N'审批人名称', N'varchar(500)', N'String', N'UserName', N'500', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'2819DFE7-F12B-483C-D4A6-08DA3D8D5A26', N'2022-05-24 21:57:33.973', N'2022-05-24 21:57:33.973', N'AE6D94D8-6A15-4348-B600-AA17E4B61718', N'1', N'0', N'0', N'61', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'0E19400D-1876-4FE3-D4A7-08DA3D8D5A26', N'2022-05-24 21:57:33.973', N'2022-05-24 21:57:33.973', N'AE6D94D8-6A15-4348-B600-AA17E4B61718', N'0', N'0', N'1', N'63', N'CreationTime', N'', N'datetime', N'DateTime', N'CreationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'5CA84ECF-5971-45BC-D4A8-08DA3D8D5A26', N'2022-05-24 21:57:33.973', N'2022-05-24 21:57:33.973', N'AE6D94D8-6A15-4348-B600-AA17E4B61718', N'0', N'0', N'1', N'65', N'FlowCode', N'', N'nvarchar(255)', N'String', N'FlowCode', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'9BC385E0-10EE-4299-D4A9-08DA3D8D5A26', N'2022-05-24 21:57:33.973', N'2022-05-24 21:57:33.973', N'AE6D94D8-6A15-4348-B600-AA17E4B61718', N'0', N'0', N'1', N'64', N'FlowId', N'', N'uniqueidentifier', N'Guid', N'FlowId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'D45AC420-E348-4D6B-D4AA-08DA3D8D5A26', N'2022-05-24 21:57:33.973', N'2022-05-24 21:57:33.973', N'AE6D94D8-6A15-4348-B600-AA17E4B61718', N'0', N'0', N'1', N'62', N'LastModificationTime', N'', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'0DF6B078-B248-4C83-D4AB-08DA3D8D5A26', N'2022-05-24 21:57:33.973', N'2022-05-24 21:57:33.973', N'AE6D94D8-6A15-4348-B600-AA17E4B61718', N'0', N'0', N'1', N'67', N'Name', N'', N'nvarchar(255)', N'String', N'Name', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'2321AAC8-0EED-4B87-D4AC-08DA3D8D5A26', N'2022-05-24 21:57:33.973', N'2022-05-24 21:57:33.973', N'AE6D94D8-6A15-4348-B600-AA17E4B61718', N'0', N'0', N'1', N'69', N'Remark', N'', N'nvarchar(255)', N'String', N'Remark', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'73D17476-E006-4530-D4AD-08DA3D8D5A26', N'2022-05-24 21:57:33.973', N'2022-05-24 21:57:33.973', N'AE6D94D8-6A15-4348-B600-AA17E4B61718', N'0', N'0', N'1', N'68', N'RoleId', N'', N'uniqueidentifier', N'Guid', N'RoleId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'E571FD26-B1A8-4648-D4AE-08DA3D8D5A26', N'2022-05-24 21:57:33.973', N'2022-05-24 21:57:33.973', N'AE6D94D8-6A15-4348-B600-AA17E4B61718', N'0', N'0', N'1', N'66', N'Sort', N'', N'int', N'Int32', N'Sort', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'C2F1A286-2B35-41D6-D4AF-08DA3D8D5A26', N'2022-05-24 21:57:33.997', N'2022-05-24 21:57:33.997', N'852F53FF-0D00-4C32-AA55-A9C11993751B', N'1', N'0', N'0', N'189', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'92C1FFFC-5A00-468C-D4B0-08DA3D8D5A26', N'2022-05-24 21:57:33.997', N'2022-05-24 21:57:33.997', N'852F53FF-0D00-4C32-AA55-A9C11993751B', N'0', N'0', N'1', N'191', N'CreationTime', N'', N'datetime', N'DateTime', N'CreationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'7B900BAF-65DF-4910-D4B1-08DA3D8D5A26', N'2022-05-24 21:57:33.997', N'2022-05-24 21:57:33.997', N'852F53FF-0D00-4C32-AA55-A9C11993751B', N'0', N'0', N'1', N'195', N'ForeignKeyTableFieldName', N'', N'varchar(50)', N'String', N'ForeignKeyTableFieldName', N'50', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'E7FACEE2-5132-4003-D4B2-08DA3D8D5A26', N'2022-05-24 21:57:33.997', N'2022-05-24 21:57:33.997', N'852F53FF-0D00-4C32-AA55-A9C11993751B', N'0', N'0', N'1', N'194', N'ForeignKeyTableId', N'', N'uniqueidentifier', N'Guid', N'ForeignKeyTableId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'2AE91C1D-D618-4267-D4B3-08DA3D8D5A26', N'2022-05-24 21:57:33.997', N'2022-05-24 21:57:33.997', N'852F53FF-0D00-4C32-AA55-A9C11993751B', N'0', N'0', N'1', N'190', N'LastModificationTime', N'', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'A2660342-556E-4AEF-D4B4-08DA3D8D5A26', N'2022-05-24 21:57:33.997', N'2022-05-24 21:57:33.997', N'852F53FF-0D00-4C32-AA55-A9C11993751B', N'0', N'0', N'1', N'193', N'Low_Code_Table_InfoId', N'', N'uniqueidentifier', N'Guid', N'Low_Code_Table_InfoId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'585E18EA-AB50-4216-D4B5-08DA3D8D5A26', N'2022-05-24 21:57:33.997', N'2022-05-24 21:57:33.997', N'852F53FF-0D00-4C32-AA55-A9C11993751B', N'0', N'0', N'1', N'192', N'Low_Code_TableId', N'', N'uniqueidentifier', N'Guid', N'Low_Code_TableId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'7C7400ED-EC08-4832-D4B6-08DA3D8D5A26', N'2022-05-24 21:57:34.027', N'2022-05-24 21:57:34.027', N'69EDD8A8-1D24-478C-A909-B82039EDCEC0', N'1', N'0', N'0', N'184', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'A29E0236-9C06-4A70-D4B7-08DA3D8D5A26', N'2022-05-24 21:57:34.027', N'2022-05-24 21:57:34.027', N'69EDD8A8-1D24-478C-A909-B82039EDCEC0', N'0', N'0', N'1', N'186', N'CreationTime', N'', N'datetime', N'DateTime', N'CreationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'8237D289-05CF-485B-D4B8-08DA3D8D5A26', N'2022-05-24 21:57:34.027', N'2022-05-24 21:57:34.027', N'69EDD8A8-1D24-478C-A909-B82039EDCEC0', N'0', N'0', N'1', N'185', N'LastModificationTime', N'', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'1A2A9E15-DC83-49E1-D4B9-08DA3D8D5A26', N'2022-05-24 21:57:34.027', N'2022-05-24 21:57:34.027', N'69EDD8A8-1D24-478C-A909-B82039EDCEC0', N'0', N'0', N'1', N'188', N'Low_Code_Table_InfoId', N'', N'uniqueidentifier', N'Guid', N'Low_Code_Table_InfoId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'7B4DF31F-36A3-477C-D4BA-08DA3D8D5A26', N'2022-05-24 21:57:34.027', N'2022-05-24 21:57:34.027', N'69EDD8A8-1D24-478C-A909-B82039EDCEC0', N'0', N'0', N'1', N'187', N'Low_Code_TableId', N'', N'uniqueidentifier', N'Guid', N'Low_Code_TableId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'B97D19D1-948A-489F-D4BB-08DA3D8D5A26', N'2022-05-24 21:57:34.047', N'2022-05-24 21:57:34.047', N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'1', N'0', N'0', N'15', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'8430C5A1-6C73-4733-D4BC-08DA3D8D5A26', N'2022-05-24 21:57:34.047', N'2022-05-24 21:57:34.047', N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'17', N'CreationTime', N'', N'datetime', N'DateTime', N'CreationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'D7EF7A4E-F4B9-4AC4-D4BD-08DA3D8D5A26', N'2022-05-24 21:57:34.047', N'2022-05-24 21:57:34.047', N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'21', N'DisplayName', N'', N'varchar(200)', N'String', N'DisplayName', N'200', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'5E4C83FD-7071-4997-D4BE-08DA3D8D5A26', N'2022-05-24 21:57:34.047', N'2022-05-24 21:57:34.047', N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'22', N'EntityName', N'', N'varchar(50)', N'String', N'EntityName', N'50', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'0F0C03E3-604F-489F-D4BF-08DA3D8D5A26', N'2022-05-24 21:57:34.047', N'2022-05-24 21:57:34.047', N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'16', N'LastModificationTime', N'', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'FA8B1456-88F3-4D4E-D4C0-08DA3D8D5A26', N'2022-05-24 21:57:34.047', N'2022-05-24 21:57:34.047', N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'23', N'Remark', N'', N'varchar(500)', N'String', N'Remark', N'500', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'441E03EC-ECB7-4172-D4C1-08DA3D8D5A26', N'2022-05-24 21:57:34.047', N'2022-05-24 21:57:34.047', N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'19', N'Schema', N'', N'varchar(50)', N'String', N'Schema', N'50', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'02FFAFB8-CF9B-441C-D4C2-08DA3D8D5A26', N'2022-05-24 21:57:34.047', N'2022-05-24 21:57:34.047', N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'18', N'TableName', N'', N'varchar(50)', N'String', N'TableName', N'50', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'3AB15F84-8722-4837-D4C3-08DA3D8D5A26', N'2022-05-24 21:57:34.047', N'2022-05-24 21:57:34.047', N'6BA9805C-916E-4D2C-99D0-216FCBC361CC', N'0', N'0', N'1', N'20', N'Type', N'', N'int', N'Int32', N'Type', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'9B1B319A-E9DC-406D-D4C4-08DA3D8D5A26', N'2022-05-24 21:57:34.070', N'2022-05-24 21:57:34.070', N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'1', N'0', N'0', N'196', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'11AFCF11-9B42-47CE-D4C5-08DA3D8D5A26', N'2022-05-24 21:57:34.070', N'2022-05-24 21:57:34.070', N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'204', N'ColumnName', N'', N'varchar(500)', N'String', N'ColumnName', N'500', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'1E40D97A-49EE-4727-D4C6-08DA3D8D5A26', N'2022-05-24 21:57:34.070', N'2022-05-24 21:57:34.070', N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'198', N'CreationTime', N'', N'datetime', N'DateTime', N'CreationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'E0E9D3C3-B713-419C-D4C7-08DA3D8D5A26', N'2022-05-24 21:57:34.070', N'2022-05-24 21:57:34.070', N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'208', N'CsField', N'', N'varchar(50)', N'String', N'CsField', N'50', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'EB846AC3-723E-4207-D4C8-08DA3D8D5A26', N'2022-05-24 21:57:34.070', N'2022-05-24 21:57:34.070', N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'207', N'CsType', N'', N'varchar(50)', N'String', N'CsType', N'50', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'48B12860-84DE-4F7B-D4C9-08DA3D8D5A26', N'2022-05-24 21:57:34.070', N'2022-05-24 21:57:34.070', N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'206', N'DatabaseColumnType', N'', N'varchar(50)', N'String', N'DatabaseColumnType', N'50', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'3B959124-21D2-45B9-D4CA-08DA3D8D5A26', N'2022-05-24 21:57:34.070', N'2022-05-24 21:57:34.070', N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'205', N'Describe', N'', N'varchar(50)', N'String', N'Describe', N'50', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'86B95BF0-4418-46BA-D4CB-08DA3D8D5A26', N'2022-05-24 21:57:34.070', N'2022-05-24 21:57:34.070', N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'201', N'IsIdentity', N'', N'bit', N'Boolean', N'IsIdentity', N'1', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'5FEA8348-AA6B-4577-D4CC-08DA3D8D5A26', N'2022-05-24 21:57:34.070', N'2022-05-24 21:57:34.070', N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'202', N'IsNullable', N'', N'bit', N'Boolean', N'IsNullable', N'1', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'1D3C8224-A3A5-4B88-D4CD-08DA3D8D5A26', N'2022-05-24 21:57:34.070', N'2022-05-24 21:57:34.070', N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'200', N'IsPrimary', N'', N'bit', N'Boolean', N'IsPrimary', N'1', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'CF99D60B-2392-493C-D4CE-08DA3D8D5A26', N'2022-05-24 21:57:34.070', N'2022-05-24 21:57:34.070', N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'197', N'LastModificationTime', N'', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'F221DA94-0A1D-4CE7-D4CF-08DA3D8D5A26', N'2022-05-24 21:57:34.070', N'2022-05-24 21:57:34.070', N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'199', N'Low_Code_TableId', N'', N'uniqueidentifier', N'Guid', N'Low_Code_TableId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'DE43269D-D43B-4A77-D4D0-08DA3D8D5A26', N'2022-05-24 21:57:34.070', N'2022-05-24 21:57:34.070', N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'209', N'MaxLength', N'', N'int', N'Int32', N'MaxLength', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'4AAA1E18-8C06-4806-D4D1-08DA3D8D5A26', N'2022-05-24 21:57:34.070', N'2022-05-24 21:57:34.070', N'79FBD4EC-9F4E-45DC-8065-70F2EB422CDF', N'0', N'0', N'1', N'203', N'Position', N'', N'int', N'Int32', N'Position', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'E75B8650-EE49-4F83-D4D2-08DA3D8D5A26', N'2022-06-08 21:20:04.053', N'2022-05-24 00:00:00.000', N'73C97832-4E7F-4758-86D2-94327971B5FD', N'1', N'0', N'0', N'70', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'B7FBB61F-94FC-4242-D4D3-08DA3D8D5A26', N'2022-06-08 21:20:04.053', N'2022-05-24 00:00:00.000', N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'75', N'Birthday', N'', N'datetime2', N'DateTime', N'Birthday', NULL, N'生日')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'5541E535-7CBE-43D2-D4D4-08DA3D8D5A26', N'2022-06-08 21:20:04.053', N'2022-05-24 00:00:00.000', N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'80', N'CreationTime', N'创建时间', N'datetime2', N'DateTime', N'CreationTime', NULL, N'创建时间')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'E4245F5F-BFFA-43F0-D4D5-08DA3D8D5A26', N'2022-06-08 21:20:04.053', N'2022-05-24 00:00:00.000', N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'78', N'FilePath', N'文件地址', N'nvarchar(255)', N'String', N'FilePath', NULL, N'文件地址')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'8326CA11-09F1-4C38-D4D6-08DA3D8D5A26', N'2022-06-08 21:20:04.053', N'2022-05-24 00:00:00.000', N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'77', N'Introduce', N'', N'nvarchar(255)', N'String', N'Introduce', NULL, N'简介')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'897A208C-2E13-46F1-D4D7-08DA3D8D5A26', N'2022-06-08 21:20:04.053', N'2022-05-24 00:00:00.000', N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'81', N'LastModificationTime', N'更新时间', N'datetime2', N'DateTime', N'LastModificationTime', NULL, N'更新时间')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'D1EB49CF-C053-4226-D4D8-08DA3D8D5A26', N'2022-06-08 21:20:04.053', N'2022-05-24 00:00:00.000', N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'72', N'Name', N'', N'nvarchar(255)', N'String', N'Name', NULL, N'会员名称')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'BF24A276-6ED0-49D4-D4D9-08DA3D8D5A26', N'2022-06-08 21:20:04.053', N'2022-05-24 00:00:00.000', N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'71', N'Number', N'', N'nvarchar(255)', N'String', N'Number', NULL, N'编号')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'669B87CE-C694-4C8C-D4DA-08DA3D8D5A26', N'2022-06-08 21:20:04.053', N'2022-05-24 00:00:00.000', N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'73', N'Phone', N'', N'nvarchar(255)', N'String', N'Phone', NULL, N'联系电话')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'F03AC01C-E0CF-4F13-D4DB-08DA3D8D5A26', N'2022-06-08 21:20:04.053', N'2022-05-24 00:00:00.000', N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'76', N'Photo', N'', N'nvarchar(255)', N'String', N'Photo', NULL, N'头像')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'72AC247C-D792-4FEE-D4DC-08DA3D8D5A26', N'2022-06-08 21:20:04.053', N'2022-05-24 00:00:00.000', N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'74', N'Sex', N'', N'nvarchar(255)', N'String', N'Sex', NULL, N'性别')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'837B058B-A88E-4107-D4DD-08DA3D8D5A26', N'2022-06-08 21:20:04.053', N'2022-05-24 00:00:00.000', N'73C97832-4E7F-4758-86D2-94327971B5FD', N'0', N'0', N'1', N'79', N'UserId', N'所属用户', N'uniqueidentifier', N'Guid', N'UserId', NULL, N'所属用户')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'BFEC557A-1223-49EC-D4DE-08DA3D8D5A26', N'2022-05-24 21:57:34.120', N'2022-05-24 21:57:34.120', N'C5883367-42AA-43B8-9577-4720A2253EFA', N'1', N'0', N'0', N'210', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'31F56D34-2216-45B0-D4DF-08DA3D8D5A26', N'2022-05-24 21:57:34.120', N'2022-05-24 21:57:34.120', N'C5883367-42AA-43B8-9577-4720A2253EFA', N'0', N'0', N'1', N'214', N'Author', N'', N'varchar(50)', N'String', N'Author', N'50', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'6FE5687C-BFAF-4E2F-D4E0-08DA3D8D5A26', N'2022-05-24 21:57:34.120', N'2022-05-24 21:57:34.120', N'C5883367-42AA-43B8-9577-4720A2253EFA', N'0', N'0', N'1', N'216', N'Content', N'', N'varchar(MAX)', N'String', N'Content', N'-1', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'BE86A4EE-E843-4C2A-D4E1-08DA3D8D5A26', N'2022-05-24 21:57:34.120', N'2022-05-24 21:57:34.120', N'C5883367-42AA-43B8-9577-4720A2253EFA', N'0', N'0', N'1', N'212', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'C03BA636-ABB2-43F7-D4E2-08DA3D8D5A26', N'2022-05-24 21:57:34.120', N'2022-05-24 21:57:34.120', N'C5883367-42AA-43B8-9577-4720A2253EFA', N'0', N'0', N'1', N'211', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'5F28BE90-E415-46DD-D4E3-08DA3D8D5A26', N'2022-05-24 21:57:34.120', N'2022-05-24 21:57:34.120', N'C5883367-42AA-43B8-9577-4720A2253EFA', N'0', N'0', N'1', N'215', N'Time', N'', N'datetime', N'DateTime', N'Time', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'804E418F-3206-4090-D4E4-08DA3D8D5A26', N'2022-05-24 21:57:34.120', N'2022-05-24 21:57:34.120', N'C5883367-42AA-43B8-9577-4720A2253EFA', N'0', N'0', N'1', N'213', N'Title', N'', N'varchar(50)', N'String', N'Title', N'50', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'97284D66-88B9-478F-D4E5-08DA3D8D5A26', N'2022-05-24 21:57:34.137', N'2022-05-24 21:57:34.137', N'E79DB53B-7162-4669-9B5E-F860501475AC', N'1', N'0', N'0', N'82', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'B6422CB6-498E-4FF5-D4E6-08DA3D8D5A26', N'2022-05-24 21:57:34.137', N'2022-05-24 21:57:34.137', N'E79DB53B-7162-4669-9B5E-F860501475AC', N'0', N'0', N'1', N'84', N'CreationTime', N'', N'datetime', N'DateTime', N'CreationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'9DE60DD7-A403-442D-D4E7-08DA3D8D5A26', N'2022-05-24 21:57:34.137', N'2022-05-24 21:57:34.137', N'E79DB53B-7162-4669-9B5E-F860501475AC', N'0', N'0', N'1', N'83', N'LastModificationTime', N'', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'0F908E1D-4A82-42C1-D4E8-08DA3D8D5A26', N'2022-05-24 21:57:34.137', N'2022-05-24 21:57:34.137', N'E79DB53B-7162-4669-9B5E-F860501475AC', N'0', N'0', N'1', N'86', N'PermissionType', N'数据权限类型', N'int', N'Int32', N'PermissionType', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'9C9F9672-3FA0-4C65-D4E9-08DA3D8D5A26', N'2022-05-24 21:57:34.137', N'2022-05-24 21:57:34.137', N'E79DB53B-7162-4669-9B5E-F860501475AC', N'0', N'0', N'1', N'85', N'RoleId', N'', N'uniqueidentifier', N'Guid', N'RoleId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'DF559C6B-6F60-467C-D4EA-08DA3D8D5A26', N'2022-05-24 21:57:34.153', N'2022-05-24 21:57:34.153', N'524E71B4-CBF7-4248-8B29-3F99B43F2EB2', N'1', N'0', N'0', N'87', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'2341DCB1-8056-4A7C-D4EB-08DA3D8D5A26', N'2022-05-24 21:57:34.153', N'2022-05-24 21:57:34.153', N'524E71B4-CBF7-4248-8B29-3F99B43F2EB2', N'0', N'0', N'1', N'89', N'CreationTime', N'', N'datetime', N'DateTime', N'CreationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'6304E602-84A1-4C57-D4EC-08DA3D8D5A26', N'2022-05-24 21:57:34.153', N'2022-05-24 21:57:34.153', N'524E71B4-CBF7-4248-8B29-3F99B43F2EB2', N'0', N'0', N'1', N'88', N'LastModificationTime', N'', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'DE898F57-ABE7-4D2C-D4ED-08DA3D8D5A26', N'2022-05-24 21:57:34.153', N'2022-05-24 21:57:34.153', N'524E71B4-CBF7-4248-8B29-3F99B43F2EB2', N'0', N'0', N'1', N'90', N'SysDataAuthorityId', N'', N'uniqueidentifier', N'Guid', N'SysDataAuthorityId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'325AF03C-CBB7-4DE6-D4EE-08DA3D8D5A26', N'2022-05-24 21:57:34.153', N'2022-05-24 21:57:34.153', N'524E71B4-CBF7-4248-8B29-3F99B43F2EB2', N'0', N'0', N'0', N'91', N'SysOrganizationId', N'', N'int', N'Int32', N'SysOrganizationId', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'BBAC9A7C-6E62-4FE6-D4EF-08DA3D8D5A26', N'2022-05-24 21:57:34.173', N'2022-05-24 21:57:34.173', N'AF37F705-7BA0-4883-B1BE-8A274EA4C026', N'0', N'0', N'1', N'96', N'Code', N'编码', N'varchar(255)', N'String', N'Code', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'2CA9AA7E-321E-47F0-D4F0-08DA3D8D5A26', N'2022-05-24 21:57:34.173', N'2022-05-24 21:57:34.173', N'AF37F705-7BA0-4883-B1BE-8A274EA4C026', N'0', N'0', N'1', N'94', N'CreationTime', N'创建时间', N'datetime', N'DateTime', N'CreationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'AB5C0B3D-8871-42FD-D4F1-08DA3D8D5A26', N'2022-05-24 21:57:34.173', N'2022-05-24 21:57:34.173', N'AF37F705-7BA0-4883-B1BE-8A274EA4C026', N'0', N'1', N'0', N'92', N'Id', N'id', N'int', N'Int32', N'Id', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'ABA55AD7-7153-4658-D4F2-08DA3D8D5A26', N'2022-05-24 21:57:34.173', N'2022-05-24 21:57:34.173', N'AF37F705-7BA0-4883-B1BE-8A274EA4C026', N'0', N'0', N'1', N'93', N'LastModificationTime', N'更新时间', N'datetime', N'DateTime', N'LastModificationTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'29B765BD-36F4-462F-D4F3-08DA3D8D5A26', N'2022-05-24 21:57:34.173', N'2022-05-24 21:57:34.173', N'AF37F705-7BA0-4883-B1BE-8A274EA4C026', N'0', N'0', N'1', N'98', N'Name', N'分组名/键', N'varchar(255)', N'String', N'Name', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'6E69CF9B-D9CD-4C31-D4F4-08DA3D8D5A26', N'2022-05-24 21:57:34.173', N'2022-05-24 21:57:34.173', N'AF37F705-7BA0-4883-B1BE-8A274EA4C026', N'0', N'0', N'1', N'99', N'ParentId', N'父级分组id', N'int', N'Int32', N'ParentId', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'84A87E33-8B66-4B9A-D4F5-08DA3D8D5A26', N'2022-05-24 21:57:34.173', N'2022-05-24 21:57:34.173', N'AF37F705-7BA0-4883-B1BE-8A274EA4C026', N'0', N'0', N'1', N'95', N'Sort', N'排序号', N'int', N'Int32', N'Sort', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'9A850F29-2DD2-4779-D4F6-08DA3D8D5A26', N'2022-05-24 21:57:34.173', N'2022-05-24 21:57:34.173', N'AF37F705-7BA0-4883-B1BE-8A274EA4C026', N'0', N'0', N'1', N'97', N'Value', N'值', N'varchar(255)', N'String', N'Value', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'E1316750-62A4-46AA-D4F7-08DA3D8D5A26', N'2022-05-24 21:57:34.193', N'2022-05-24 21:57:34.193', N'6FABC67A-8B48-49A6-8BA1-C8A32C499D36', N'1', N'0', N'0', N'100', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'743D6EAB-B4C8-4A15-D4F8-08DA3D8D5A26', N'2022-05-24 21:57:34.193', N'2022-05-24 21:57:34.193', N'6FABC67A-8B48-49A6-8BA1-C8A32C499D36', N'0', N'0', N'1', N'103', N'ByName', N'', N'nvarchar(255)', N'String', N'ByName', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'82EE25D2-4E01-4100-D4F9-08DA3D8D5A26', N'2022-05-24 21:57:34.193', N'2022-05-24 21:57:34.193', N'6FABC67A-8B48-49A6-8BA1-C8A32C499D36', N'0', N'0', N'1', N'106', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'A61101B5-8E66-4456-D4FA-08DA3D8D5A26', N'2022-05-24 21:57:34.193', N'2022-05-24 21:57:34.193', N'6FABC67A-8B48-49A6-8BA1-C8A32C499D36', N'0', N'0', N'1', N'105', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'AAA5FAE3-8C5B-4427-D4FB-08DA3D8D5A26', N'2022-05-24 21:57:34.193', N'2022-05-24 21:57:34.193', N'6FABC67A-8B48-49A6-8BA1-C8A32C499D36', N'0', N'0', N'1', N'102', N'Name', N'', N'nvarchar(255)', N'String', N'Name', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'F9FD0E13-4E5D-42B4-D4FC-08DA3D8D5A26', N'2022-05-24 21:57:34.193', N'2022-05-24 21:57:34.193', N'6FABC67A-8B48-49A6-8BA1-C8A32C499D36', N'0', N'0', N'1', N'101', N'Number', N'', N'int', N'Int32', N'Number', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'646614D9-D7F3-42C5-D4FD-08DA3D8D5A26', N'2022-05-24 21:57:34.193', N'2022-05-24 21:57:34.193', N'6FABC67A-8B48-49A6-8BA1-C8A32C499D36', N'0', N'0', N'1', N'104', N'Remark', N'', N'nvarchar(255)', N'String', N'Remark', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'498327EB-5676-4091-D4FE-08DA3D8D5A26', N'2022-05-24 21:58:07.503', N'2022-05-24 00:00:00.000', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'1', N'1', N'0', N'107', N'Id', N'', N'int', N'Int32', N'Id', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'3133985D-586C-4C4E-D4FF-08DA3D8D5A26', N'2022-05-24 21:57:34.220', N'2022-05-24 21:57:34.220', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'119', N'Close', N'', N'bit', N'Boolean', N'Close', N'1', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'78757B0D-D9EE-45EA-D500-08DA3D8D5A26', N'2022-05-24 21:58:07.503', N'2022-05-24 00:00:00.000', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'115', N'ComponentName', N'', N'nvarchar(255)', N'String', N'ComponentName', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'2006AC52-BB49-4E41-D501-08DA3D8D5A26', N'2022-05-24 21:58:07.503', N'2022-05-24 00:00:00.000', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'109', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'F5193134-B39D-4CA0-D502-08DA3D8D5A26', N'2022-05-24 21:58:07.503', N'2022-05-24 00:00:00.000', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'116', N'Icon', N'', N'nvarchar(255)', N'String', N'Icon', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'12E9E9AD-5631-4DC8-D503-08DA3D8D5A26', N'2022-05-24 21:57:34.220', N'2022-05-24 21:57:34.220', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'122', N'JumpUrl', N'', N'varchar(255)', N'String', N'JumpUrl', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'B1F89F8D-8E22-4C4A-D504-08DA3D8D5A26', N'2022-05-24 21:57:34.220', N'2022-05-24 21:57:34.220', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'120', N'KeepAlive', N'', N'bit', N'Boolean', N'KeepAlive', N'1', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'7211AEA6-EB91-41E5-D505-08DA3D8D5A26', N'2022-05-24 21:58:07.503', N'2022-05-24 00:00:00.000', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'108', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'B52A9E8C-DFFB-40B7-D506-08DA3D8D5A26', N'2022-05-24 21:58:07.503', N'2022-05-24 00:00:00.000', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'110', N'LevelCode', N'', N'varchar(50)', N'String', N'LevelCode', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'E74C1F4B-AF12-4EAA-D507-08DA3D8D5A26', N'2022-05-24 21:58:07.503', N'2022-05-24 00:00:00.000', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'112', N'Name', N'', N'nvarchar(255)', N'String', N'Name', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'235B67F8-62D2-480E-D508-08DA3D8D5A26', N'2022-05-24 21:58:07.503', N'2022-05-24 00:00:00.000', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'111', N'Number', N'编号', N'int', N'Int32', N'Number', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'F029B676-48AC-4BA3-D509-08DA3D8D5A26', N'2022-05-24 21:57:34.220', N'2022-05-24 21:57:34.220', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'117', N'ParentId', N'', N'int', N'Int32', N'ParentId', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'5AA598A9-6E52-4AE4-D50A-08DA3D8D5A26', N'2022-05-24 21:58:07.503', N'2022-05-24 00:00:00.000', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'114', N'Router', N'', N'nvarchar(255)', N'String', N'Router', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'1916E619-4818-4C63-D50B-08DA3D8D5A26', N'2022-05-24 21:57:34.220', N'2022-05-24 21:57:34.220', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'118', N'Show', N'', N'bit', N'Boolean', N'Show', N'1', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'D0FBF229-7204-4494-D50C-08DA3D8D5A26', N'2022-05-24 21:57:34.220', N'2022-05-24 21:57:34.220', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'121', N'State', N'', N'bit', N'Boolean', N'State', N'1', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'6C3BB548-AAFC-4F16-D50D-08DA3D8D5A26', N'2022-05-24 21:57:34.220', N'2022-05-24 21:57:34.220', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'123', N'Type', N'', N'int', N'Int32', N'Type', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'19FA02FE-FB8F-4631-D50E-08DA3D8D5A26', N'2022-05-24 21:58:07.503', N'2022-05-24 00:00:00.000', N'D2600250-6F32-4D7D-8395-96CC9FA36DB4', N'0', N'0', N'1', N'113', N'Url', N'', N'nvarchar(255)', N'String', N'Url', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'9C4158F4-B5B5-4928-D50F-08DA3D8D5A26', N'2022-05-24 21:57:34.250', N'2022-05-24 21:57:34.250', N'2AE9E532-7D9A-474B-B629-50A39945C44D', N'1', N'0', N'0', N'124', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'FBF2D2C1-454B-4898-D510-08DA3D8D5A26', N'2022-05-24 21:57:34.250', N'2022-05-24 21:57:34.250', N'2AE9E532-7D9A-474B-B629-50A39945C44D', N'0', N'0', N'1', N'126', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'6CFE3B57-006F-436B-D511-08DA3D8D5A26', N'2022-05-24 21:57:34.250', N'2022-05-24 21:57:34.250', N'2AE9E532-7D9A-474B-B629-50A39945C44D', N'0', N'0', N'1', N'129', N'FunctionCode', N'', N'varchar(100)', N'String', N'FunctionCode', N'100', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'A908815C-C0E6-4565-D512-08DA3D8D5A26', N'2022-05-24 21:57:34.250', N'2022-05-24 21:57:34.250', N'2AE9E532-7D9A-474B-B629-50A39945C44D', N'0', N'0', N'1', N'130', N'FunctionName', N'', N'varchar(100)', N'String', N'FunctionName', N'100', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'E4DD55F0-9697-43AE-D513-08DA3D8D5A26', N'2022-05-24 21:57:34.250', N'2022-05-24 21:57:34.250', N'2AE9E532-7D9A-474B-B629-50A39945C44D', N'0', N'0', N'1', N'125', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'29D08351-9091-4C91-D514-08DA3D8D5A26', N'2022-05-24 21:57:34.250', N'2022-05-24 21:57:34.250', N'2AE9E532-7D9A-474B-B629-50A39945C44D', N'0', N'0', N'1', N'128', N'MenuId', N'', N'int', N'Int32', N'MenuId', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'C7B2AD1D-ECB0-4497-D515-08DA3D8D5A26', N'2022-05-24 21:57:34.250', N'2022-05-24 21:57:34.250', N'2AE9E532-7D9A-474B-B629-50A39945C44D', N'0', N'0', N'1', N'127', N'Number', N'', N'int', N'Int32', N'Number', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'9A050102-6300-46EF-D516-08DA3D8D5A26', N'2022-05-24 21:57:34.250', N'2022-05-24 21:57:34.250', N'2AE9E532-7D9A-474B-B629-50A39945C44D', N'0', N'0', N'1', N'131', N'Remark', N'', N'varchar(100)', N'String', N'Remark', N'100', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'BA392537-C1C5-4ECC-D517-08DA3D8D5A26', N'2022-05-24 21:57:34.270', N'2022-05-24 21:57:34.270', N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'1', N'0', N'0', N'1', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'EE8CA902-4E27-40C5-D518-08DA3D8D5A26', N'2022-05-24 21:57:34.270', N'2022-05-24 21:57:34.270', N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'14', N'ActionDisplayName', N'', N'varchar(255)', N'String', N'ActionDisplayName', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'200FF922-513C-4B19-D519-08DA3D8D5A26', N'2022-05-24 21:57:34.270', N'2022-05-24 21:57:34.270', N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'4', N'Api', N'接口地址', N'varchar(500)', N'String', N'Api', N'500', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'063D44B8-6CE2-47A6-D51A-08DA3D8D5A26', N'2022-05-24 21:57:34.270', N'2022-05-24 21:57:34.270', N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'9', N'Browser', N'', N'varchar(255)', N'String', N'Browser', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'A62BB184-93B0-40E3-D51B-08DA3D8D5A26', N'2022-05-24 21:57:34.270', N'2022-05-24 21:57:34.270', N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'13', N'ControllerDisplayName', N'', N'varchar(255)', N'String', N'ControllerDisplayName', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'0AA2DAAB-50DF-4397-D51C-08DA3D8D5A26', N'2022-05-24 21:57:34.270', N'2022-05-24 21:57:34.270', N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'3', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'5F5C2997-DAA8-491C-D51D-08DA3D8D5A26', N'2022-05-24 21:57:34.270', N'2022-05-24 21:57:34.270', N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'6', N'Form', N'表单信息', N'varchar(MAX)', N'String', N'Form', N'-1', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'1D881E59-D88E-497F-D51E-08DA3D8D5A26', N'2022-05-24 21:57:34.270', N'2022-05-24 21:57:34.270', N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'7', N'FormBody', N'json表单信息', N'varchar(MAX)', N'String', N'FormBody', N'-1', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'CA605278-6972-48B4-D51F-08DA3D8D5A26', N'2022-05-24 21:57:34.270', N'2022-05-24 21:57:34.270', N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'5', N'Ip', N'ip地址', N'varchar(255)', N'String', N'Ip', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'A932F1CE-A55A-480B-D520-08DA3D8D5A26', N'2022-05-24 21:57:34.270', N'2022-05-24 21:57:34.270', N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'2', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'4736479F-6089-4141-D521-08DA3D8D5A26', N'2022-05-24 21:57:34.270', N'2022-05-24 21:57:34.270', N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'10', N'OS', N'', N'varchar(255)', N'String', N'OS', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'4467BF43-6E95-4798-D522-08DA3D8D5A26', N'2022-05-24 21:57:34.270', N'2022-05-24 21:57:34.270', N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'8', N'QueryString', N'地址栏信息', N'varchar(MAX)', N'String', N'QueryString', N'-1', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'0888B15F-3BD2-4881-D523-08DA3D8D5A26', N'2022-05-24 21:57:34.270', N'2022-05-24 21:57:34.270', N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'0', N'12', N'TakeUpTime', N'接口耗时（毫秒）', N'bigint', N'Int64', N'TakeUpTime', N'8', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'66718DE6-5C1A-4229-D524-08DA3D8D5A26', N'2022-05-24 21:57:34.270', N'2022-05-24 21:57:34.270', N'60CCEBA1-28BF-4D1D-B603-4EDF95D512B8', N'0', N'0', N'1', N'11', N'UserId', N'当前操作人id', N'uniqueidentifier', N'Guid', N'UserId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'D6008705-0D21-42AC-D525-08DA3D8D5A26', N'2022-06-09 21:20:26.477', N'2022-05-24 00:00:00.000', N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'1', N'1', N'0', N'132', N'Id', N'', N'int', N'Int32', N'Id', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'0B45E9BB-B9F1-4A2F-D526-08DA3D8D5A26', N'2022-06-09 21:20:26.477', N'2022-05-24 00:00:00.000', N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'0', N'0', N'1', N'142', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'CE802713-74F5-4F30-D527-08DA3D8D5A26', N'2022-06-09 21:20:26.477', N'2022-05-24 00:00:00.000', N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'0', N'0', N'1', N'138', N'Email', N'', N'nvarchar(255)', N'String', N'Email', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'19A7504C-F740-4B49-D528-08DA3D8D5A26', N'2022-06-09 21:20:26.477', N'2022-05-24 00:00:00.000', N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'0', N'0', N'1', N'141', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'CF2E3691-AB88-4420-D529-08DA3D8D5A26', N'2022-06-09 21:20:26.477', N'2022-05-24 00:00:00.000', N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'0', N'0', N'1', N'136', N'Leader', N'', N'nvarchar(255)', N'String', N'Leader', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'11F3D291-CF7A-4143-D52A-08DA3D8D5A26', N'2022-06-09 21:20:26.477', N'2022-05-24 00:00:00.000', N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'0', N'0', N'1', N'135', N'LevelCode', N'', N'varchar(50)', N'String', N'LevelCode', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'1121D642-49E8-4B25-D52B-08DA3D8D5A26', N'2022-06-09 21:20:26.477', N'2022-05-24 00:00:00.000', N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'0', N'0', N'1', N'133', N'Name', N'', N'nvarchar(255)', N'String', N'Name', NULL, N'组织名称')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'5AED3FEB-3D77-4E1E-D52C-08DA3D8D5A26', N'2022-06-09 21:20:26.477', N'2022-05-24 00:00:00.000', N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'0', N'0', N'1', N'134', N'OrderNumber', N'', N'int', N'Int32', N'OrderNumber', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'042A59E2-72C1-4C38-D52D-08DA3D8D5A26', N'2022-06-09 21:20:26.477', N'2022-05-24 00:00:00.000', N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'0', N'0', N'1', N'140', N'ParentId', N'', N'int', N'Int32', N'ParentId', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'EA63351C-C203-4D40-D52E-08DA3D8D5A26', N'2022-06-09 21:20:26.477', N'2022-05-24 00:00:00.000', N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'0', N'0', N'1', N'137', N'Phone', N'', N'nvarchar(255)', N'String', N'Phone', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'B9BFCA2E-F72B-4A3F-D52F-08DA3D8D5A26', N'2022-06-09 21:20:26.477', N'2022-05-24 00:00:00.000', N'D26D07CB-158A-4CB2-8B20-5DFD5181AF54', N'0', N'0', N'1', N'139', N'State', N'', N'int', N'Int32', N'State', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'6AA13B8F-1E3C-4750-D530-08DA3D8D5A26', N'2022-05-24 21:57:34.320', N'2022-05-24 21:57:34.320', N'0A8BDB18-758A-4798-9FFC-E7031DCBF262', N'1', N'0', N'0', N'143', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'B76500C1-91F8-4E44-D531-08DA3D8D5A26', N'2022-05-24 21:57:34.320', N'2022-05-24 21:57:34.320', N'0A8BDB18-758A-4798-9FFC-E7031DCBF262', N'0', N'0', N'1', N'145', N'Code', N'', N'nvarchar(255)', N'String', N'Code', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'134C9F62-ABD2-476E-D532-08DA3D8D5A26', N'2022-05-24 21:57:34.320', N'2022-05-24 21:57:34.320', N'0A8BDB18-758A-4798-9FFC-E7031DCBF262', N'0', N'0', N'1', N'150', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'5257AD4F-589D-40D0-D533-08DA3D8D5A26', N'2022-05-24 21:57:34.320', N'2022-05-24 21:57:34.320', N'0A8BDB18-758A-4798-9FFC-E7031DCBF262', N'0', N'0', N'1', N'149', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'1790B4D5-51B2-4DC0-D534-08DA3D8D5A26', N'2022-05-24 21:57:34.320', N'2022-05-24 21:57:34.320', N'0A8BDB18-758A-4798-9FFC-E7031DCBF262', N'0', N'0', N'1', N'146', N'Name', N'', N'nvarchar(255)', N'String', N'Name', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'2286C948-4F0D-4B66-D535-08DA3D8D5A26', N'2022-05-24 21:57:34.320', N'2022-05-24 21:57:34.320', N'0A8BDB18-758A-4798-9FFC-E7031DCBF262', N'0', N'0', N'1', N'144', N'Number', N'', N'int', N'Int32', N'Number', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'5F9A4A78-1BB9-4592-D536-08DA3D8D5A26', N'2022-05-24 21:57:34.320', N'2022-05-24 21:57:34.320', N'0A8BDB18-758A-4798-9FFC-E7031DCBF262', N'0', N'0', N'1', N'148', N'Remarks', N'', N'nvarchar(255)', N'String', N'Remarks', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'564A907B-1F47-4849-D537-08DA3D8D5A26', N'2022-05-24 21:57:34.320', N'2022-05-24 21:57:34.320', N'0A8BDB18-758A-4798-9FFC-E7031DCBF262', N'0', N'0', N'1', N'147', N'State', N'', N'int', N'Int32', N'State', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'69875823-326C-4E13-D538-08DA3D8D5A26', N'2022-05-24 21:57:34.340', N'2022-05-24 21:57:34.340', N'F3D7BBB3-C1FB-4D61-92A4-9BC101811335', N'1', N'0', N'0', N'151', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'42430604-7090-442D-D539-08DA3D8D5A26', N'2022-05-24 21:57:34.340', N'2022-05-24 21:57:34.340', N'F3D7BBB3-C1FB-4D61-92A4-9BC101811335', N'0', N'0', N'1', N'153', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'3F7E43C9-762F-48EA-D53A-08DA3D8D5A26', N'2022-05-24 21:57:34.340', N'2022-05-24 21:57:34.340', N'F3D7BBB3-C1FB-4D61-92A4-9BC101811335', N'0', N'0', N'1', N'157', N'DeleteLock', N'', N'bit', N'Boolean', N'DeleteLock', N'1', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'517CBFE0-275D-4F36-D53B-08DA3D8D5A26', N'2022-05-24 21:57:34.340', N'2022-05-24 21:57:34.340', N'F3D7BBB3-C1FB-4D61-92A4-9BC101811335', N'0', N'0', N'1', N'152', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'BE481209-565B-4099-D53C-08DA3D8D5A26', N'2022-05-24 21:57:34.340', N'2022-05-24 21:57:34.340', N'F3D7BBB3-C1FB-4D61-92A4-9BC101811335', N'0', N'0', N'1', N'155', N'Name', N'', N'nvarchar(255)', N'String', N'Name', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'DD367FD5-2030-43B2-D53D-08DA3D8D5A26', N'2022-05-24 21:57:34.340', N'2022-05-24 21:57:34.340', N'F3D7BBB3-C1FB-4D61-92A4-9BC101811335', N'0', N'0', N'1', N'154', N'Number', N'', N'int', N'Int32', N'Number', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'DBE000FC-4895-42F2-D53E-08DA3D8D5A26', N'2022-05-24 21:57:34.340', N'2022-05-24 21:57:34.340', N'F3D7BBB3-C1FB-4D61-92A4-9BC101811335', N'0', N'0', N'1', N'156', N'Remark', N'', N'nvarchar(255)', N'String', N'Remark', N'255', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'7B6DF0CD-C31B-4508-D53F-08DA3D8D5A26', N'2022-05-24 21:57:34.357', N'2022-05-24 21:57:34.357', N'8DA38D20-8A09-4E81-8DD8-ED6702AEE380', N'1', N'0', N'0', N'158', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'1213C179-E366-4E3C-D540-08DA3D8D5A26', N'2022-05-24 21:57:34.357', N'2022-05-24 21:57:34.357', N'8DA38D20-8A09-4E81-8DD8-ED6702AEE380', N'0', N'0', N'1', N'163', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'B24AC0E3-71AB-4D48-D541-08DA3D8D5A26', N'2022-05-24 21:57:34.357', N'2022-05-24 21:57:34.357', N'8DA38D20-8A09-4E81-8DD8-ED6702AEE380', N'0', N'0', N'1', N'162', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'6C934348-BE20-4C9E-D542-08DA3D8D5A26', N'2022-05-24 21:57:34.357', N'2022-05-24 21:57:34.357', N'8DA38D20-8A09-4E81-8DD8-ED6702AEE380', N'0', N'0', N'1', N'161', N'MenuFunctionId', N'', N'uniqueidentifier', N'Guid', N'MenuFunctionId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'D41BD8DB-1B3F-48FA-D543-08DA3D8D5A26', N'2022-05-24 21:57:34.357', N'2022-05-24 21:57:34.357', N'8DA38D20-8A09-4E81-8DD8-ED6702AEE380', N'0', N'0', N'1', N'160', N'MenuId', N'', N'int', N'Int32', N'MenuId', N'4', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'F24F0E45-209E-46B7-D544-08DA3D8D5A26', N'2022-05-24 21:57:34.357', N'2022-05-24 21:57:34.357', N'8DA38D20-8A09-4E81-8DD8-ED6702AEE380', N'0', N'0', N'1', N'159', N'RoleId', N'', N'uniqueidentifier', N'Guid', N'RoleId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'5BCF7406-75CC-4171-D545-08DA3D8D5A26', N'2022-06-09 21:20:04.707', N'2022-05-24 00:00:00.000', N'6323638B-A45F-4A76-886E-69A9E9BE0901', N'1', N'0', N'0', N'164', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', NULL, NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'46BAC66F-3CF0-46B3-D546-08DA3D8D5A26', N'2022-06-09 21:20:04.707', N'2022-05-24 00:00:00.000', N'6323638B-A45F-4A76-886E-69A9E9BE0901', N'0', N'0', N'1', N'166', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', NULL, N'创建时间')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'A6752BD9-F3D6-451F-D547-08DA3D8D5A26', N'2022-06-09 21:20:04.707', N'2022-05-24 00:00:00.000', N'6323638B-A45F-4A76-886E-69A9E9BE0901', N'0', N'0', N'1', N'172', N'DeleteLock', N'', N'bit', N'Boolean', N'DeleteLock', NULL, N'删除锁')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'287314B2-3141-4957-D548-08DA3D8D5A26', N'2022-06-09 21:20:04.707', N'2022-05-24 00:00:00.000', N'6323638B-A45F-4A76-886E-69A9E9BE0901', N'0', N'0', N'0', N'171', N'Email', N'', N'nvarchar(255)', N'String', N'Email', NULL, N'电子邮箱')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'E5418D61-916F-45FD-D549-08DA3D8D5A26', N'2022-06-09 21:20:04.707', N'2022-05-24 00:00:00.000', N'6323638B-A45F-4A76-886E-69A9E9BE0901', N'0', N'0', N'1', N'165', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', NULL, N'更新时间')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'7CBE8988-CBAC-4EA2-D54A-08DA3D8D5A26', N'2022-06-09 21:20:04.707', N'2022-05-24 00:00:00.000', N'6323638B-A45F-4A76-886E-69A9E9BE0901', N'0', N'0', N'1', N'168', N'LoginName', N'', N'nvarchar(255)', N'String', N'LoginName', NULL, N'登录名称')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'4B5BC027-5663-463A-D54B-08DA3D8D5A26', N'2022-06-09 21:20:04.707', N'2022-05-24 00:00:00.000', N'6323638B-A45F-4A76-886E-69A9E9BE0901', N'0', N'0', N'1', N'167', N'Name', N'', N'nvarchar(255)', N'String', N'Name', NULL, N'用户名称')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'5A9FA990-B6D6-445F-D54C-08DA3D8D5A26', N'2022-06-09 21:20:04.707', N'2022-05-24 00:00:00.000', N'6323638B-A45F-4A76-886E-69A9E9BE0901', N'0', N'0', N'1', N'173', N'OrganizationId', N'', N'int', N'Int32', N'OrganizationId', NULL, N'组织id')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'E36410B5-CB7C-4FC3-D54D-08DA3D8D5A26', N'2022-06-09 21:20:04.707', N'2022-05-24 00:00:00.000', N'6323638B-A45F-4A76-886E-69A9E9BE0901', N'0', N'0', N'1', N'169', N'Password', N'', N'nvarchar(255)', N'String', N'Password', NULL, N'密码')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'C82D5132-6CDA-463E-D54E-08DA3D8D5A26', N'2022-06-09 21:20:04.707', N'2022-05-24 00:00:00.000', N'6323638B-A45F-4A76-886E-69A9E9BE0901', N'0', N'0', N'1', N'170', N'Phone', N'', N'nvarchar(255)', N'String', N'Phone', NULL, N'联系电话')
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'A9766BBB-21BF-46DA-D54F-08DA3D8D5A26', N'2022-05-24 21:57:34.407', N'2022-05-24 21:57:34.407', N'69B24F04-0ED3-45FC-91D9-0DC929175A57', N'1', N'0', N'0', N'174', N'Id', N'', N'uniqueidentifier', N'Guid', N'Id', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'F731CCD3-9A9C-4DDA-D550-08DA3D8D5A26', N'2022-05-24 21:57:34.407', N'2022-05-24 21:57:34.407', N'69B24F04-0ED3-45FC-91D9-0DC929175A57', N'0', N'0', N'1', N'178', N'CreationTime', N'', N'datetime2', N'DateTime', N'CreationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'135E23DB-540B-4096-D551-08DA3D8D5A26', N'2022-05-24 21:57:34.407', N'2022-05-24 21:57:34.407', N'69B24F04-0ED3-45FC-91D9-0DC929175A57', N'0', N'0', N'1', N'177', N'LastModificationTime', N'', N'datetime2', N'DateTime', N'LastModificationTime', N'6', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'4C479D54-530F-4652-D552-08DA3D8D5A26', N'2022-05-24 21:57:34.407', N'2022-05-24 21:57:34.407', N'69B24F04-0ED3-45FC-91D9-0DC929175A57', N'0', N'0', N'1', N'176', N'PostId', N'', N'uniqueidentifier', N'Guid', N'PostId', N'16', NULL)
GO

INSERT INTO [dbo].[low_code_table_info] ([Id], [LastModificationTime], [CreationTime], [Low_Code_TableId], [IsPrimary], [IsIdentity], [IsNullable], [Position], [ColumnName], [Describe], [DatabaseColumnType], [CsType], [CsField], [MaxLength], [DisplayName]) VALUES (N'CB5F9ECF-9317-4B11-D553-08DA3D8D5A26', N'2022-05-24 21:57:34.407', N'2022-05-24 21:57:34.407', N'69B24F04-0ED3-45FC-91D9-0DC929175A57', N'0', N'0', N'1', N'175', N'UserId', N'', N'uniqueidentifier', N'Guid', N'UserId', N'16', NULL)
GO


-- ----------------------------
-- Table structure for member
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[member]') AND type IN ('U'))
	DROP TABLE [dbo].[member]
GO

CREATE TABLE [dbo].[member] (
  [Id] uniqueidentifier  NOT NULL,
  [Number] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Name] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Phone] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Sex] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Birthday] datetime2(0)  NULL,
  [Photo] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Introduce] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [FilePath] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [UserId] uniqueidentifier  NULL,
  [CreationTime] datetime2(0)  NULL,
  [LastModificationTime] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[member] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO [dbo].[member] ([Id], [Number], [Name], [Phone], [Sex], [Birthday], [Photo], [Introduce], [FilePath], [UserId], [CreationTime], [LastModificationTime]) VALUES (N'96A1AA3D-A61A-42D0-954A-C71753FB2065', N'123', N'123', N'123', N'女', N'2018-04-25 23:00:00', NULL, N'<p>123</p>', NULL, N'AC18F496-E93D-42F0-B59E-E321ACC85335', N'2020-10-24 00:07:42', N'2021-04-18 22:08:06')
GO

INSERT INTO [dbo].[member] ([Id], [Number], [Name], [Phone], [Sex], [Birthday], [Photo], [Introduce], [FilePath], [UserId], [CreationTime], [LastModificationTime]) VALUES (N'9A604AA2-9AE6-4A2F-8DDB-D9E0289EAD9E', N'1', N'测试会员', N'18510912123', N'男', N'2019-07-08 11:47:24', N'http://localhost:5600http://localhost:5600http://localhost:5600/upload/files/20210118/time_232747_old_name_hzy.png', N'<p>999888</p>', N'/upload/files/20210118/time_233310_old_name_hzy.png', N'AC18F496-E93D-42F0-B59E-E321ACC85335', N'2018-04-25 23:00:00', N'2022-05-08 16:46:21')
GO


-- ----------------------------
-- Table structure for sys_data_authority
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_data_authority]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_data_authority]
GO

CREATE TABLE [dbo].[sys_data_authority] (
  [Id] uniqueidentifier  NOT NULL,
  [LastModificationTime] datetime  NULL,
  [CreationTime] datetime DEFAULT (getdate()) NULL,
  [RoleId] uniqueidentifier  NULL,
  [PermissionType] int  NULL
)
GO

ALTER TABLE [dbo].[sys_data_authority] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'数据权限类型',
'SCHEMA', N'dbo',
'TABLE', N'sys_data_authority',
'COLUMN', N'PermissionType'
GO


-- ----------------------------
-- Records of sys_data_authority
-- ----------------------------
INSERT INTO [dbo].[sys_data_authority] ([Id], [LastModificationTime], [CreationTime], [RoleId], [PermissionType]) VALUES (N'D09BF250-C5B0-41CB-237D-08DA00442990', N'2022-07-06 21:53:17.610', N'2022-03-07 22:09:58.000', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'5')
GO

INSERT INTO [dbo].[sys_data_authority] ([Id], [LastModificationTime], [CreationTime], [RoleId], [PermissionType]) VALUES (N'0228A5B5-2202-4BA0-6E48-08DA205DA7B7', N'2022-04-17 18:33:04.440', N'2022-04-17 18:33:04.440', N'18FA4771-6F58-46A3-80D2-6F0F5E9972E3', N'2')
GO


-- ----------------------------
-- Table structure for sys_data_authority_custom
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_data_authority_custom]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_data_authority_custom]
GO

CREATE TABLE [dbo].[sys_data_authority_custom] (
  [Id] uniqueidentifier  NOT NULL,
  [LastModificationTime] datetime  NULL,
  [CreationTime] datetime DEFAULT (getdate()) NULL,
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
  [LastModificationTime] datetime  NULL,
  [CreationTime] datetime  NULL,
  [Sort] int  NULL,
  [Code] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Value] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Name] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [ParentId] int  NULL
)
GO

ALTER TABLE [dbo].[sys_dictionary] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'id',
'SCHEMA', N'dbo',
'TABLE', N'sys_dictionary',
'COLUMN', N'Id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新时间',
'SCHEMA', N'dbo',
'TABLE', N'sys_dictionary',
'COLUMN', N'LastModificationTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'sys_dictionary',
'COLUMN', N'CreationTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'排序号',
'SCHEMA', N'dbo',
'TABLE', N'sys_dictionary',
'COLUMN', N'Sort'
GO

EXEC sp_addextendedproperty
'MS_Description', N'编码',
'SCHEMA', N'dbo',
'TABLE', N'sys_dictionary',
'COLUMN', N'Code'
GO

EXEC sp_addextendedproperty
'MS_Description', N'值',
'SCHEMA', N'dbo',
'TABLE', N'sys_dictionary',
'COLUMN', N'Value'
GO

EXEC sp_addextendedproperty
'MS_Description', N'分组名/键',
'SCHEMA', N'dbo',
'TABLE', N'sys_dictionary',
'COLUMN', N'Name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'父级分组id',
'SCHEMA', N'dbo',
'TABLE', N'sys_dictionary',
'COLUMN', N'ParentId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'数据字典',
'SCHEMA', N'dbo',
'TABLE', N'sys_dictionary'
GO


-- ----------------------------
-- Records of sys_dictionary
-- ----------------------------
SET IDENTITY_INSERT [dbo].[sys_dictionary] ON
GO

INSERT INTO [dbo].[sys_dictionary] ([Id], [LastModificationTime], [CreationTime], [Sort], [Code], [Value], [Name], [ParentId]) VALUES (N'1', N'2021-07-25 22:39:34.870', N'2021-07-25 22:31:30.490', N'1', N'news_type', NULL, N'资讯类别', NULL)
GO

INSERT INTO [dbo].[sys_dictionary] ([Id], [LastModificationTime], [CreationTime], [Sort], [Code], [Value], [Name], [ParentId]) VALUES (N'2', N'2021-07-25 22:40:30.037', N'2021-07-25 22:38:49.153', N'1', N'news_type_nan', N'1', N'男', N'1')
GO

INSERT INTO [dbo].[sys_dictionary] ([Id], [LastModificationTime], [CreationTime], [Sort], [Code], [Value], [Name], [ParentId]) VALUES (N'3', N'2022-07-06 21:55:30.907', N'2021-07-25 22:40:47.000', N'2', N'news_type_nv', N'2', N'女', N'1')
GO

INSERT INTO [dbo].[sys_dictionary] ([Id], [LastModificationTime], [CreationTime], [Sort], [Code], [Value], [Name], [ParentId]) VALUES (N'4', N'2022-06-29 20:55:46.967', N'2022-06-29 20:55:46.967', N'0', N'3', N'3', N'未知', N'1')
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
  [Name] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [ByName] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Remark] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [LastModificationTime] datetime2(0)  NULL,
  [CreationTime] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[sys_function] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of sys_function
-- ----------------------------
INSERT INTO [dbo].[sys_function] ([Id], [Number], [Name], [ByName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'B6FD5425-504A-46A9-993B-2F8DC9158EB8', N'80', N'打印', N'Print', N'Print', N'2021-04-18 22:08:06', N'2022-06-16 17:28:00')
GO

INSERT INTO [dbo].[sys_function] ([Id], [Number], [Name], [ByName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'C9518758-B2E1-4F51-B517-5282E273889C', N'10', N'显示', N'Display', N'Display', N'2021-04-18 22:08:06', N'2016-06-20 13:40:52')
GO

INSERT INTO [dbo].[sys_function] ([Id], [Number], [Name], [ByName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'F27ECB0A-197D-47B1-B243-59A8C71302BF', N'60', N'检索', N'Search', N'Search', N'2021-04-18 22:08:06', N'2016-06-20 13:40:52')
GO

INSERT INTO [dbo].[sys_function] ([Id], [Number], [Name], [ByName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'383E7EE2-7690-46AC-9230-65155C84AA30', N'50', N'保存', N'Save', N'Save', N'2021-04-18 22:08:06', N'2016-06-20 13:40:52')
GO

INSERT INTO [dbo].[sys_function] ([Id], [Number], [Name], [ByName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'9C388461-2704-4C5E-A729-72C17E9018E1', N'40', N'删除', N'Delete', N'Delete', N'2021-04-18 22:08:06', N'2016-06-20 13:40:52')
GO

INSERT INTO [dbo].[sys_function] ([Id], [Number], [Name], [ByName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'BFFEFB1C-8988-4DDF-B4AC-81C2B30E80CD', N'20', N'添加', N'Insert', N'Insert', N'2021-04-18 22:08:06', N'2016-06-20 13:40:52')
GO

INSERT INTO [dbo].[sys_function] ([Id], [Number], [Name], [ByName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'2401F4D0-60B0-4E2E-903F-84C603373572', N'70', N'导出', N'Export', N'Export', N'2021-04-18 22:08:06', N'2016-06-20 13:40:52')
GO

INSERT INTO [dbo].[sys_function] ([Id], [Number], [Name], [ByName], [Remark], [LastModificationTime], [CreationTime]) VALUES (N'E7EF2A05-8317-41C3-B588-99519FE88BF9', N'30', N'修改', N'Update', N'Update', N'2021-04-18 22:08:06', N'2016-06-20 13:40:52')
GO


-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_menu]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_menu]
GO

CREATE TABLE [dbo].[sys_menu] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [LastModificationTime] datetime2(0)  NULL,
  [CreationTime] datetime2(0)  NULL,
  [LevelCode] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [Number] int  NULL,
  [Name] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Url] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Router] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [ComponentName] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Icon] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [ParentId] int  NULL,
  [Show] bit  NULL,
  [Close] bit  NULL,
  [KeepAlive] bit  NULL,
  [State] bit  NULL,
  [JumpUrl] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Type] int  NULL
)
GO

ALTER TABLE [dbo].[sys_menu] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of sys_menu
-- ----------------------------
SET IDENTITY_INSERT [dbo].[sys_menu] ON
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LevelCode], [Number], [Name], [Url], [Router], [ComponentName], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [JumpUrl], [Type]) VALUES (N'1', N'2022-03-04 12:25:39', N'2021-05-28 11:49:02', N'1', N'10', N'更多示例', NULL, NULL, NULL, N'MoreOutlined', NULL, N'1', N'1', N'1', N'1', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LevelCode], [Number], [Name], [Url], [Router], [ComponentName], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [JumpUrl], [Type]) VALUES (N'2', N'2022-03-18 12:06:20', N'2021-01-16 16:05:22', N'1.2', N'10', N'Antd Vue3.0组件', N'views/AppComponents.vue', N'/app/components', N'AppComponentsCom', N'LayoutOutlined', N'1', N'1', N'1', N'1', N'1', NULL, N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LevelCode], [Number], [Name], [Url], [Router], [ComponentName], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [JumpUrl], [Type]) VALUES (N'3', N'2022-03-04 12:26:14', N'2020-12-17 14:58:05', N'1.3', N'30', N'按钮', N'views/Button.vue', N'/button', N'ButtonCom', N'AppstoreOutlined', N'1', N'1', N'1', N'1', N'1', NULL, N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LevelCode], [Number], [Name], [Url], [Router], [ComponentName], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [JumpUrl], [Type]) VALUES (N'4', N'2022-03-04 12:26:21', N'2021-01-16 16:06:33', N'1.4', N'40', N'图表 AntV G2', NULL, NULL, NULL, N'PieChartOutlined', N'1', N'1', N'1', N'1', N'1', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LevelCode], [Number], [Name], [Url], [Router], [ComponentName], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [JumpUrl], [Type]) VALUES (N'5', N'2022-03-04 12:26:25', N'2021-01-16 16:07:24', N'1.4.5', N'10', N'基础图表', N'views/chart/Base.vue', N'/chart/base', N'ChartBaseCom', NULL, N'4', N'1', N'1', N'1', N'1', NULL, N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LevelCode], [Number], [Name], [Url], [Router], [ComponentName], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [JumpUrl], [Type]) VALUES (N'6', N'2022-03-04 12:26:28', N'2021-01-16 16:10:06', N'1.4.6', N'20', N'更多图表', N'views/chart/More.vue', N'/chart/more', N'ChartMoreCom', NULL, N'4', N'1', N'1', N'1', N'1', NULL, N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LevelCode], [Number], [Name], [Url], [Router], [ComponentName], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [JumpUrl], [Type]) VALUES (N'7', N'2022-03-04 12:26:34', N'2018-03-10 12:16:38', N'1.7', N'50', N'表格管理', NULL, NULL, NULL, N'TableOutlined', N'1', N'1', N'1', N'1', N'1', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LevelCode], [Number], [Name], [Url], [Router], [ComponentName], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [JumpUrl], [Type]) VALUES (N'8', N'2022-03-04 12:26:38', N'2020-12-17 14:49:12', N'1.7.8', N'100', N'基础列表', N'views/BaseList.vue', N'/base/list', N'BaseListCom', NULL, N'7', N'1', N'1', N'1', N'1', NULL, N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LevelCode], [Number], [Name], [Url], [Router], [ComponentName], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [JumpUrl], [Type]) VALUES (N'9', N'2022-03-04 12:26:41', N'2020-12-17 14:51:07', N'1.7.9', N'110', N'标准表格', N'views/list/Index.vue', N'/list', N'ListIndexCom', NULL, N'7', N'1', N'1', N'1', N'1', NULL, N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LevelCode], [Number], [Name], [Url], [Router], [ComponentName], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [JumpUrl], [Type]) VALUES (N'10', N'2022-03-04 12:26:46', N'2021-01-18 19:34:28', N'1.10', N'60', N'富文本编辑器', N'views/Editor.vue', N'/editor', N'EditorCom', N'PicRightOutlined', N'1', N'1', N'1', N'1', N'1', NULL, N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LevelCode], [Number], [Name], [Url], [Router], [ComponentName], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [JumpUrl], [Type]) VALUES (N'11', N'2022-03-04 12:26:49', N'2021-08-05 21:51:12', N'1.11', N'70', N'跳转外部地址', N'components/ExternalJump.vue', N'/external/jump/:path(.*)', N'ExternalJumpCom', N'RadarChartOutlined', N'1', N'1', N'1', N'1', N'1', N'https://antv.vision/zh', N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LevelCode], [Number], [Name], [Url], [Router], [ComponentName], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [JumpUrl], [Type]) VALUES (N'12', N'2022-03-04 12:25:43', N'2018-03-10 12:16:38', N'12', N'50', N'基础信息', NULL, NULL, NULL, N'GoldOutlined', NULL, N'1', N'1', N'1', N'1', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LevelCode], [Number], [Name], [Url], [Router], [ComponentName], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [JumpUrl], [Type]) VALUES (N'13', N'2022-03-04 12:26:55', N'2018-03-10 12:16:38', N'12.13', N'10', N'会员管理', N'views/base/member/Index.vue', N'/base/member', N'base_member', N'UsergroupAddOutlined', N'12', N'1', N'1', N'1', N'1', NULL, N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LevelCode], [Number], [Name], [Url], [Router], [ComponentName], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [JumpUrl], [Type]) VALUES (N'14', N'2022-03-04 12:25:46', N'2018-03-10 12:16:38', N'14', N'100', N'系统管理', NULL, NULL, NULL, N'DesktopOutlined', NULL, N'1', N'1', N'1', N'1', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LevelCode], [Number], [Name], [Url], [Router], [ComponentName], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [JumpUrl], [Type]) VALUES (N'15', N'2022-03-04 12:27:02', N'2018-03-10 12:16:38', N'14.15', N'100', N'账户管理', N'views/system/user/Index.vue', N'/system/user', N'system_user', N'UserOutlined', N'14', N'1', N'1', N'1', N'1', NULL, N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LevelCode], [Number], [Name], [Url], [Router], [ComponentName], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [JumpUrl], [Type]) VALUES (N'16', N'2022-04-22 22:24:03', N'2018-03-10 12:16:38', N'14.16', N'110', N'角色管理', N'views/system/role/Index.vue', N'/system/role', N'system_role', N'TeamOutlined', N'14', N'1', N'1', N'1', N'1', NULL, N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LevelCode], [Number], [Name], [Url], [Router], [ComponentName], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [JumpUrl], [Type]) VALUES (N'17', N'2022-03-04 12:27:11', N'2018-03-10 12:16:38', N'14.17', N'120', N'功能管理', N'views/system/function/Index.vue', N'/system/function', N'system_function', N'ControlOutlined', N'14', N'1', N'1', N'1', N'1', NULL, N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LevelCode], [Number], [Name], [Url], [Router], [ComponentName], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [JumpUrl], [Type]) VALUES (N'19', N'2022-03-04 12:27:19', N'2018-03-10 12:16:38', N'14.19', N'150', N'个人中心', N'views/system/personal_center/Index.vue', N'/system/personal/center', N'system_personal_center', N'FormOutlined', N'14', N'1', N'1', N'1', N'1', NULL, N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LevelCode], [Number], [Name], [Url], [Router], [ComponentName], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [JumpUrl], [Type]) VALUES (N'20', N'2022-03-04 12:27:23', N'2021-05-27 17:29:49', N'14.20', N'160', N'岗位管理', N'views/system/post/Index.vue', N'/system/post', N'system_post', N'IdcardOutlined', N'14', N'1', N'1', N'1', N'1', NULL, N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LevelCode], [Number], [Name], [Url], [Router], [ComponentName], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [JumpUrl], [Type]) VALUES (N'21', N'2022-03-04 12:27:27', N'2021-05-27 20:27:56', N'14.21', N'170', N'组织机构', N'views/system/organization/Index.vue', N'/system/organization', N'system_organization', N'ClusterOutlined', N'14', N'1', N'1', N'1', N'1', NULL, N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LevelCode], [Number], [Name], [Url], [Router], [ComponentName], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [JumpUrl], [Type]) VALUES (N'22', N'2022-03-04 12:27:41', N'2018-03-10 12:17:03', N'29.22', N'10', N'接口文档', N'views/development_tool/Swagger.vue', N'/development_tool/swagger', N'swagger', N'FileSearchOutlined', N'29', N'1', N'1', N'1', N'1', NULL, N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LevelCode], [Number], [Name], [Url], [Router], [ComponentName], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [JumpUrl], [Type]) VALUES (N'23', N'2022-03-04 12:27:31', N'2021-07-25 21:50:01', N'14.23', N'190', N'数据字典', N'views/system/dictionary/Index.vue', N'/system/dictionary', N'system_dictionary', N'FileDoneOutlined', N'14', N'1', N'1', N'1', N'1', NULL, N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LevelCode], [Number], [Name], [Url], [Router], [ComponentName], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [JumpUrl], [Type]) VALUES (N'24', N'2022-03-04 12:27:35', N'2021-08-05 21:24:54', N'14.24', N'200', N'操作日志', N'views/system/sys_operation_log/Index.vue', N'/system/sys_operation_log', N'sys_operation_log', N'ContainerOutlined', N'14', N'1', N'1', N'1', N'1', N'', N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LevelCode], [Number], [Name], [Url], [Router], [ComponentName], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [JumpUrl], [Type]) VALUES (N'25', N'2022-03-04 12:27:15', N'2018-03-10 12:16:38', N'14.25', N'130', N'菜单功能', N'views/system/menu/Index.vue', N'/system/menu', N'system_menu', N'MenuOutlined', N'14', N'1', N'1', N'1', N'1', NULL, N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LevelCode], [Number], [Name], [Url], [Router], [ComponentName], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [JumpUrl], [Type]) VALUES (N'28', N'2022-03-04 12:26:00', N'2021-12-29 17:13:26', N'1.28', N'1', N'Vxe-Table', N'views/VxeTable.vue', N'/vxe/table', N'VxeTableCom', N'BorderlessTableOutlined', N'1', N'1', N'1', N'1', N'1', NULL, N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LevelCode], [Number], [Name], [Url], [Router], [ComponentName], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [JumpUrl], [Type]) VALUES (N'29', N'2022-03-04 12:25:49', N'2022-01-12 14:17:21', N'29', N'200', N'开发工具', NULL, NULL, NULL, N'CodepenOutlined', NULL, N'1', N'1', N'1', N'1', NULL, N'1')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LevelCode], [Number], [Name], [Url], [Router], [ComponentName], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [JumpUrl], [Type]) VALUES (N'30', N'2022-03-04 12:27:44', N'2022-01-12 14:22:04', N'29.30', N'20', N'定时任务', N'views/development_tool/timed_task/Index.vue', N'/development_tool/timed_task', N'TimedTaskCom', N'FieldTimeOutlined', N'29', N'1', N'1', N'1', N'1', NULL, N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LevelCode], [Number], [Name], [Url], [Router], [ComponentName], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [JumpUrl], [Type]) VALUES (N'31', N'2022-05-24 22:05:57', N'2022-01-12 15:39:46', N'29.31', N'30', N'代码生成', N'views/development_tool/low_code/Index.vue', N'/development-tool/low-code', N'LowCode', N'CodeTwoTone', N'29', N'1', N'1', N'1', N'1', NULL, N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LevelCode], [Number], [Name], [Url], [Router], [ComponentName], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [JumpUrl], [Type]) VALUES (N'32', N'2022-03-18 12:06:38', N'2022-02-24 10:51:38', N'1.32', N'20', N'图标展示', N'views/Icons.vue', N'/icons', N'IconsVue', N'TagsTwoTone', N'1', N'1', N'1', N'1', N'1', NULL, N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LevelCode], [Number], [Name], [Url], [Router], [ComponentName], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [JumpUrl], [Type]) VALUES (N'33', N'2022-04-10 10:56:17', N'2022-04-10 10:55:41', N'29.33', N'40', N'EFCore监控台', N'views/development_tool/monitor_ef_core/Index.vue', N'/development_tool/monitor/efcore', N'monitor_ef_core', N'DashboardFilled', N'29', N'1', N'1', N'1', N'1', NULL, N'2')
GO

INSERT INTO [dbo].[sys_menu] ([Id], [LastModificationTime], [CreationTime], [LevelCode], [Number], [Name], [Url], [Router], [ComponentName], [Icon], [ParentId], [Show], [Close], [KeepAlive], [State], [JumpUrl], [Type]) VALUES (N'36', N'2022-04-17 17:49:13', N'2022-04-17 17:45:25', N'12.13.36', N'1', N'详情', N'views/base/member/components/Details.vue', N'/base/member/details/:id/:title', N'base_member_info_Details', NULL, N'13', N'0', N'1', N'1', N'1', NULL, N'2')
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
  [LastModificationTime] datetime2(0)  NULL,
  [CreationTime] datetime2(0)  NULL,
  [Number] int  NULL,
  [MenuId] int  NULL,
  [FunctionCode] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [FunctionName] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [Remark] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[sys_menu_function] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of sys_menu_function
-- ----------------------------
INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'33C80938-82C8-4299-0F12-08D9FDAD00AB', N'2022-03-04 15:17:09', N'2022-03-04 15:17:09', N'10', N'30', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'EF70B789-21EE-4850-0F1B-08D9FDAD00AB', N'2022-03-04 15:16:44', N'2022-03-04 15:16:44', N'10', N'22', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'A7CD04DB-BBE3-49B6-0F1E-08D9FDAD00AB', N'2022-03-18 12:06:20', N'2022-03-18 12:06:20', N'10', N'2', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'6C09C0C0-72FA-4842-0F1F-08D9FDAD00AB', N'2022-03-18 12:06:38', N'2022-03-18 12:06:38', N'10', N'32', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'F64CFE50-1EF1-457F-0F20-08D9FDAD00AB', N'2022-03-04 15:24:24', N'2022-03-04 15:24:24', N'10', N'3', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'A1DDD02F-8C21-4D79-0F21-08D9FDAD00AB', N'2022-03-04 15:24:30', N'2022-03-04 15:24:30', N'10', N'5', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'1CB6FBE1-4A6C-4AAD-0F22-08D9FDAD00AB', N'2022-03-04 15:24:34', N'2022-03-04 15:24:34', N'10', N'6', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'D2E6EA60-2CF6-478A-0F23-08D9FDAD00AB', N'2022-03-04 15:24:40', N'2022-03-04 15:24:40', N'10', N'8', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'B7533A90-DAE4-4263-0F24-08D9FDAD00AB', N'2022-03-04 15:24:43', N'2022-03-04 15:24:43', N'10', N'9', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'EC535908-8671-4928-0F25-08D9FDAD00AB', N'2022-03-04 15:24:47', N'2022-03-04 15:24:47', N'10', N'10', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'3BC0E68F-D03D-4E99-0F26-08D9FDAD00AB', N'2022-03-04 15:24:53', N'2022-03-04 15:24:53', N'10', N'11', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'EB958545-6449-40DB-0F27-08D9FDAD00AB', N'2022-03-04 15:25:07', N'2022-03-04 15:25:07', N'10', N'13', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'B5881044-AFB8-40B2-0F28-08D9FDAD00AB', N'2022-03-04 15:25:07', N'2022-03-04 15:25:07', N'20', N'13', N'Insert', N'添加', N'Insert')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'106FB69A-8BB5-4559-0F29-08D9FDAD00AB', N'2022-03-04 15:25:07', N'2022-03-04 15:25:07', N'30', N'13', N'Update', N'修改', N'Update')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'F4621FBE-6B40-4454-0F2A-08D9FDAD00AB', N'2022-03-04 15:25:07', N'2022-03-04 15:25:07', N'40', N'13', N'Delete', N'删除', N'Delete')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'523B53B5-8159-4A16-0F2B-08D9FDAD00AB', N'2022-03-04 15:25:07', N'2022-03-04 15:25:07', N'50', N'13', N'Save', N'保存', N'Save')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'A3754771-F6E9-4A23-0F2C-08D9FDAD00AB', N'2022-03-04 15:25:07', N'2022-03-04 15:25:07', N'60', N'13', N'Search', N'检索', N'Search')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'B96F977C-A36E-4E7F-0F2D-08D9FDAD00AB', N'2022-03-04 15:25:07', N'2022-03-04 15:25:07', N'70', N'13', N'Export', N'导出', N'Export')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'541D9045-47B2-4629-0F2E-08D9FDAD00AB', N'2022-03-04 15:25:07', N'2022-03-04 15:25:07', N'80', N'13', N'Print', N'打印', N'Print')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'13F3F74D-C6FC-4488-0F2F-08D9FDAD00AB', N'2022-03-04 15:25:14', N'2022-03-04 15:25:14', N'10', N'15', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'CCE82EB4-7FC5-4308-0F30-08D9FDAD00AB', N'2022-03-04 15:25:14', N'2022-03-04 15:25:14', N'20', N'15', N'Insert', N'添加', N'Insert')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'8564E4D8-D7F4-4F12-0F31-08D9FDAD00AB', N'2022-03-04 15:25:14', N'2022-03-04 15:25:14', N'30', N'15', N'Update', N'修改', N'Update')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'0AD6A459-1D9D-4512-0F32-08D9FDAD00AB', N'2022-03-04 15:25:14', N'2022-03-04 15:25:14', N'40', N'15', N'Delete', N'删除', N'Delete')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'37D3E492-62DA-47A4-0F33-08D9FDAD00AB', N'2022-03-04 15:25:14', N'2022-03-04 15:25:14', N'50', N'15', N'Save', N'保存', N'Save')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'BEB87004-5CFB-417A-0F34-08D9FDAD00AB', N'2022-03-04 15:25:14', N'2022-03-04 15:25:14', N'60', N'15', N'Search', N'检索', N'Search')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'A46E07D3-C722-4548-0F35-08D9FDAD00AB', N'2022-03-04 15:25:14', N'2022-03-04 15:25:14', N'70', N'15', N'Export', N'导出', N'Export')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'C8EDBB79-567E-461B-0F36-08D9FDAD00AB', N'2022-03-04 15:25:14', N'2022-03-04 15:25:14', N'80', N'15', N'Print', N'打印', N'Print')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'550F874B-E804-44A0-0F37-08D9FDAD00AB', N'2022-04-22 22:24:03', N'2022-04-22 22:24:03', N'10', N'16', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'C67A0ABE-DAEC-491B-0F38-08D9FDAD00AB', N'2022-04-22 22:24:03', N'2022-04-22 22:24:03', N'20', N'16', N'Insert', N'添加', N'Insert')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'823AC05D-65E4-4216-0F39-08D9FDAD00AB', N'2022-04-22 22:24:03', N'2022-04-22 22:24:03', N'30', N'16', N'Update', N'修改', N'Update')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'BD6AE6DA-1CA6-46C2-0F3A-08D9FDAD00AB', N'2022-04-22 22:24:03', N'2022-04-22 22:24:03', N'40', N'16', N'Delete', N'删除', N'Delete')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'14783A71-E265-4D6B-0F3B-08D9FDAD00AB', N'2022-04-22 22:24:03', N'2022-04-22 22:24:03', N'50', N'16', N'Save', N'保存', N'Save')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'2FEA8F87-2A13-4C95-0F3C-08D9FDAD00AB', N'2022-04-22 22:24:03', N'2022-04-22 22:24:03', N'60', N'16', N'Search', N'检索', N'Search')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'437FBF85-8704-4E87-0F3D-08D9FDAD00AB', N'2022-04-22 22:24:03', N'2022-04-22 22:24:03', N'70', N'16', N'Export', N'导出', N'Export')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'6B009415-EADF-4DAB-0F3E-08D9FDAD00AB', N'2022-04-22 22:24:03', N'2022-04-22 22:24:03', N'80', N'16', N'Print', N'打印', N'Print')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'53FDB4A0-CA6E-4568-0F3F-08D9FDAD00AB', N'2022-03-04 15:25:21', N'2022-03-04 15:25:21', N'10', N'17', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'86465238-C51C-45D5-0F40-08D9FDAD00AB', N'2022-03-04 15:25:21', N'2022-03-04 15:25:21', N'20', N'17', N'Insert', N'添加', N'Insert')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'86FF83FD-D34A-4290-0F41-08D9FDAD00AB', N'2022-03-04 15:25:21', N'2022-03-04 15:25:21', N'30', N'17', N'Update', N'修改', N'Update')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'7EA8F706-BFE5-42B2-0F42-08D9FDAD00AB', N'2022-03-04 15:25:21', N'2022-03-04 15:25:21', N'40', N'17', N'Delete', N'删除', N'Delete')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'DEE401B1-E20E-496E-0F43-08D9FDAD00AB', N'2022-03-04 15:25:21', N'2022-03-04 15:25:21', N'50', N'17', N'Save', N'保存', N'Save')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'0B27E69F-AF16-4481-0F44-08D9FDAD00AB', N'2022-03-04 15:25:21', N'2022-03-04 15:25:21', N'60', N'17', N'Search', N'检索', N'Search')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'A726455F-1C29-4BE0-0F45-08D9FDAD00AB', N'2022-03-04 15:25:21', N'2022-03-04 15:25:21', N'70', N'17', N'Export', N'导出', N'Export')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'0CAA6E7D-92B0-4814-0F46-08D9FDAD00AB', N'2022-03-04 15:25:21', N'2022-03-04 15:25:21', N'80', N'17', N'Print', N'打印', N'Print')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'DB3AB8BD-7709-41A2-0F47-08D9FDAD00AB', N'2022-03-04 15:25:28', N'2022-03-04 15:25:28', N'10', N'25', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'FE6465BF-E429-45BD-0F48-08D9FDAD00AB', N'2022-03-04 15:25:28', N'2022-03-04 15:25:28', N'20', N'25', N'Insert', N'添加', N'Insert')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'4A67FCDB-A7A9-4E3C-0F49-08D9FDAD00AB', N'2022-03-04 15:25:28', N'2022-03-04 15:25:28', N'30', N'25', N'Update', N'修改', N'Update')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'20AB5395-D57C-49DB-0F4A-08D9FDAD00AB', N'2022-03-04 15:25:28', N'2022-03-04 15:25:28', N'40', N'25', N'Delete', N'删除', N'Delete')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'41CB1942-573A-4D63-0F4B-08D9FDAD00AB', N'2022-03-04 15:25:28', N'2022-03-04 15:25:28', N'50', N'25', N'Save', N'保存', N'Save')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'7E0F6C84-D7F1-4243-0F4C-08D9FDAD00AB', N'2022-03-04 15:25:28', N'2022-03-04 15:25:28', N'60', N'25', N'Search', N'检索', N'Search')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'1E69DF5D-D1E9-4BC8-0F4D-08D9FDAD00AB', N'2022-03-04 15:25:28', N'2022-03-04 15:25:28', N'70', N'25', N'Export', N'导出', N'Export')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'4BBBE120-0CC6-4A08-0F4E-08D9FDAD00AB', N'2022-03-04 15:25:28', N'2022-03-04 15:25:28', N'80', N'25', N'Print', N'打印', N'Print')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'45E2CA86-4823-4FB9-0F57-08D9FDAD00AB', N'2022-03-04 15:25:36', N'2022-03-04 15:25:36', N'10', N'20', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'3E44C6F5-E090-40A1-0F58-08D9FDAD00AB', N'2022-03-04 15:25:36', N'2022-03-04 15:25:36', N'20', N'20', N'Insert', N'添加', N'Insert')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'22A675F6-EFDA-481D-0F59-08D9FDAD00AB', N'2022-03-04 15:25:36', N'2022-03-04 15:25:36', N'30', N'20', N'Update', N'修改', N'Update')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'69DA651E-787B-42E5-0F5A-08D9FDAD00AB', N'2022-03-04 15:25:36', N'2022-03-04 15:25:36', N'40', N'20', N'Delete', N'删除', N'Delete')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'616C4E4A-FB61-49CF-0F5B-08D9FDAD00AB', N'2022-03-04 15:25:36', N'2022-03-04 15:25:36', N'50', N'20', N'Save', N'保存', N'Save')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'5E4E87BD-C179-4B5B-0F5C-08D9FDAD00AB', N'2022-03-04 15:25:36', N'2022-03-04 15:25:36', N'60', N'20', N'Search', N'检索', N'Search')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'54743C86-AC73-4345-0F5D-08D9FDAD00AB', N'2022-03-04 15:25:36', N'2022-03-04 15:25:36', N'70', N'20', N'Export', N'导出', N'Export')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'2469188C-21DE-492A-0F5E-08D9FDAD00AB', N'2022-03-04 15:25:36', N'2022-03-04 15:25:36', N'80', N'20', N'Print', N'打印', N'Print')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'C6BA141B-99BA-4114-0F5F-08D9FDAD00AB', N'2022-03-04 15:25:40', N'2022-03-04 15:25:40', N'10', N'21', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'0A85E4FD-5A1C-47F6-0F60-08D9FDAD00AB', N'2022-03-04 15:25:40', N'2022-03-04 15:25:40', N'20', N'21', N'Insert', N'添加', N'Insert')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'F4C73AC0-C66D-4988-0F61-08D9FDAD00AB', N'2022-03-04 15:25:40', N'2022-03-04 15:25:40', N'30', N'21', N'Update', N'修改', N'Update')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'3CB3CBC7-9E45-4CC3-0F62-08D9FDAD00AB', N'2022-03-04 15:25:40', N'2022-03-04 15:25:40', N'40', N'21', N'Delete', N'删除', N'Delete')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'6B209D5A-B366-4A61-0F63-08D9FDAD00AB', N'2022-03-04 15:25:40', N'2022-03-04 15:25:40', N'50', N'21', N'Save', N'保存', N'Save')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'F36B9B06-2826-425F-0F64-08D9FDAD00AB', N'2022-03-04 15:25:40', N'2022-03-04 15:25:40', N'60', N'21', N'Search', N'检索', N'Search')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'A9503588-E6F7-420B-0F65-08D9FDAD00AB', N'2022-03-04 15:25:40', N'2022-03-04 15:25:40', N'70', N'21', N'Export', N'导出', N'Export')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'C9E5FFF0-6744-47D7-0F66-08D9FDAD00AB', N'2022-03-04 15:25:40', N'2022-03-04 15:25:40', N'80', N'21', N'Print', N'打印', N'Print')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'9426768E-B90D-41E1-0F67-08D9FDAD00AB', N'2022-03-04 15:25:50', N'2022-03-04 15:25:50', N'10', N'23', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'E991934A-0D30-416B-0F68-08D9FDAD00AB', N'2022-03-04 15:25:50', N'2022-03-04 15:25:50', N'20', N'23', N'Insert', N'添加', N'Insert')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'B98A365E-6FB4-4EFB-0F69-08D9FDAD00AB', N'2022-03-04 15:25:50', N'2022-03-04 15:25:50', N'30', N'23', N'Update', N'修改', N'Update')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'92B39A10-3927-4EE7-0F6A-08D9FDAD00AB', N'2022-03-04 15:25:50', N'2022-03-04 15:25:50', N'40', N'23', N'Delete', N'删除', N'Delete')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'A03D56D7-4B0D-47CC-0F6B-08D9FDAD00AB', N'2022-03-04 15:25:50', N'2022-03-04 15:25:50', N'50', N'23', N'Save', N'保存', N'Save')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'E2319118-42CC-41A2-0F6C-08D9FDAD00AB', N'2022-03-04 15:25:50', N'2022-03-04 15:25:50', N'60', N'23', N'Search', N'检索', N'Search')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'0984A2E1-3722-41D4-0F6D-08D9FDAD00AB', N'2022-03-04 15:25:50', N'2022-03-04 15:25:50', N'70', N'23', N'Export', N'导出', N'Export')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'1D831D57-6634-45D7-0F6E-08D9FDAD00AB', N'2022-03-04 15:25:50', N'2022-03-04 15:25:50', N'80', N'23', N'Print', N'打印', N'Print')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'C77C812A-1601-4311-0F70-08D9FDAD00AB', N'2022-03-04 15:26:00', N'2022-03-04 15:26:00', N'10', N'19', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'3F6D0AF7-5386-4D3A-0F71-08D9FDAD00AB', N'2022-03-04 15:40:52', N'2022-03-04 15:40:52', N'10', N'28', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'55750F56-EDC9-4771-E2D6-08D9FDEFA8F8', N'2022-03-04 23:00:02', N'2022-03-04 23:00:02', N'10', N'24', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'7694FBF5-E28D-424C-E2D7-08D9FDEFA8F8', N'2022-03-04 23:00:02', N'2022-03-04 23:00:02', N'40', N'24', N'Delete', N'删除', N'Delete')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'2186550D-246C-4552-E2D8-08D9FDEFA8F8', N'2022-03-04 23:00:02', N'2022-03-04 23:00:02', N'60', N'24', N'Search', N'检索', N'Search')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'687254AE-0D76-4788-A4E8-08DA1A9D9949', N'2022-04-10 10:56:17', N'2022-04-10 10:56:17', N'10', N'33', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'0073CCE2-FF42-496C-9FF6-08DA204FCECB', N'2022-04-17 20:40:12', N'2022-04-17 20:40:12', N'10', N'36', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'48F0A694-0539-4E69-A2E4-08DA3D8E6577', N'2022-05-24 22:05:57', N'2022-05-24 22:05:57', N'10', N'31', N'Display', N'显示', N'Display')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'4DBF096D-D3D3-4565-A2E5-08DA3D8E6577', N'2022-05-24 22:05:57', N'2022-05-24 22:05:57', N'40', N'31', N'Delete', N'删除', N'Delete')
GO

INSERT INTO [dbo].[sys_menu_function] ([Id], [LastModificationTime], [CreationTime], [Number], [MenuId], [FunctionCode], [FunctionName], [Remark]) VALUES (N'38B4704D-7C5D-4F89-A2E7-08DA3D8E6577', N'2022-05-24 22:05:57', N'2022-05-24 22:05:57', N'60', N'31', N'Search', N'检索', N'Search')
GO


-- ----------------------------
-- Table structure for sys_operation_log
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_operation_log]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_operation_log]
GO

CREATE TABLE [dbo].[sys_operation_log] (
  [Id] uniqueidentifier  NOT NULL ROWGUIDCOL,
  [LastModificationTime] datetime2(0)  NULL,
  [CreationTime] datetime2(0)  NULL,
  [Api] varchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [Ip] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Form] varchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [FormBody] varchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [QueryString] varchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Browser] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [OS] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [UserId] uniqueidentifier  NULL,
  [TakeUpTime] bigint  NOT NULL,
  [ControllerDisplayName] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [ActionDisplayName] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[sys_operation_log] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'接口地址',
'SCHEMA', N'dbo',
'TABLE', N'sys_operation_log',
'COLUMN', N'Api'
GO

EXEC sp_addextendedproperty
'MS_Description', N'ip地址',
'SCHEMA', N'dbo',
'TABLE', N'sys_operation_log',
'COLUMN', N'Ip'
GO

EXEC sp_addextendedproperty
'MS_Description', N'表单信息',
'SCHEMA', N'dbo',
'TABLE', N'sys_operation_log',
'COLUMN', N'Form'
GO

EXEC sp_addextendedproperty
'MS_Description', N'json表单信息',
'SCHEMA', N'dbo',
'TABLE', N'sys_operation_log',
'COLUMN', N'FormBody'
GO

EXEC sp_addextendedproperty
'MS_Description', N'地址栏信息',
'SCHEMA', N'dbo',
'TABLE', N'sys_operation_log',
'COLUMN', N'QueryString'
GO

EXEC sp_addextendedproperty
'MS_Description', N'当前操作人id',
'SCHEMA', N'dbo',
'TABLE', N'sys_operation_log',
'COLUMN', N'UserId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'接口耗时（毫秒）',
'SCHEMA', N'dbo',
'TABLE', N'sys_operation_log',
'COLUMN', N'TakeUpTime'
GO


-- ----------------------------
-- Records of sys_operation_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_organization
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_organization]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_organization]
GO

CREATE TABLE [dbo].[sys_organization] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [Name] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [OrderNumber] int  NULL,
  [LevelCode] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [Leader] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Phone] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Email] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [State] int  NULL,
  [ParentId] int  NULL,
  [LastModificationTime] datetime2(0)  NULL,
  [CreationTime] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[sys_organization] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of sys_organization
-- ----------------------------
SET IDENTITY_INSERT [dbo].[sys_organization] ON
GO

INSERT INTO [dbo].[sys_organization] ([Id], [Name], [OrderNumber], [LevelCode], [Leader], [Phone], [Email], [State], [ParentId], [LastModificationTime], [CreationTime]) VALUES (N'1', N'阿里巴巴集团', N'1', N'1', N'hzy', N'18410912184', N'18410912184@qq.com', N'1', NULL, N'2021-05-27 20:50:31', N'2021-05-27 20:50:31')
GO

INSERT INTO [dbo].[sys_organization] ([Id], [Name], [OrderNumber], [LevelCode], [Leader], [Phone], [Email], [State], [ParentId], [LastModificationTime], [CreationTime]) VALUES (N'2', N'北京分部', N'3', N'1.2', N'北京分部', N'132123', N'13131', N'1', N'1', N'2021-12-28 16:13:34', N'2021-05-27 22:33:44')
GO

INSERT INTO [dbo].[sys_organization] ([Id], [Name], [OrderNumber], [LevelCode], [Leader], [Phone], [Email], [State], [ParentId], [LastModificationTime], [CreationTime]) VALUES (N'3', N'市场部门', N'1', N'1.2.3', N'市场部门', N'234124234', N'234234@qq.com', N'1', N'2', N'2021-05-27 22:33:57', N'2021-05-27 22:33:57')
GO

INSERT INTO [dbo].[sys_organization] ([Id], [Name], [OrderNumber], [LevelCode], [Leader], [Phone], [Email], [State], [ParentId], [LastModificationTime], [CreationTime]) VALUES (N'4', N'财务部门', N'2', N'1.2.4', N'财务部门', N'435543535', N'123@qq.com', N'1', N'2', N'2021-05-27 22:34:11', N'2021-05-27 22:34:11')
GO

INSERT INTO [dbo].[sys_organization] ([Id], [Name], [OrderNumber], [LevelCode], [Leader], [Phone], [Email], [State], [ParentId], [LastModificationTime], [CreationTime]) VALUES (N'5', N'成都分部', N'2', N'1.5', N'成都分部', N'123123123', N'123@qq.com', N'1', N'1', N'2021-05-27 22:31:45', N'2021-05-27 21:01:50')
GO

INSERT INTO [dbo].[sys_organization] ([Id], [Name], [OrderNumber], [LevelCode], [Leader], [Phone], [Email], [State], [ParentId], [LastModificationTime], [CreationTime]) VALUES (N'7', N'研发部门', N'1', N'1.5.7', N'研发部门', N'1234323423', N'12312@qq.com', N'1', N'5', N'2021-05-27 22:32:29', N'2021-05-27 22:32:08')
GO

INSERT INTO [dbo].[sys_organization] ([Id], [Name], [OrderNumber], [LevelCode], [Leader], [Phone], [Email], [State], [ParentId], [LastModificationTime], [CreationTime]) VALUES (N'9', N'运维部门', N'4', N'1.5.9', N'运维部门', N'1232133452', N'12341@qq.com', N'1', N'5', N'2022-03-08 17:07:47', N'2021-05-27 22:33:25')
GO

INSERT INTO [dbo].[sys_organization] ([Id], [Name], [OrderNumber], [LevelCode], [Leader], [Phone], [Email], [State], [ParentId], [LastModificationTime], [CreationTime]) VALUES (N'10', N'测试部门', N'3', N'1.5.10', N'测试部门', N'12313', N'123123@qq.com', N'1', N'5', N'2021-05-27 22:32:59', N'2021-05-27 22:32:59')
GO

INSERT INTO [dbo].[sys_organization] ([Id], [Name], [OrderNumber], [LevelCode], [Leader], [Phone], [Email], [State], [ParentId], [LastModificationTime], [CreationTime]) VALUES (N'11', N'技术部门', N'2', N'1.5.11', N'技术部门', N'12345678911', N'12345678901@qq.com', N'1', N'5', N'2022-03-08 17:07:37', N'2022-03-08 17:00:20')
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
  [Code] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Name] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [State] int  NULL,
  [Remarks] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [LastModificationTime] datetime2(0)  NULL,
  [CreationTime] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[sys_post] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO [dbo].[sys_post] ([Id], [Number], [Code], [Name], [State], [Remarks], [LastModificationTime], [CreationTime]) VALUES (N'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622', N'5', N'dotnet_engineer', N'DotNet软件工程师', N'1', NULL, N'2022-03-08 10:13:18', N'2022-03-08 10:13:18')
GO

INSERT INTO [dbo].[sys_post] ([Id], [Number], [Code], [Name], [State], [Remarks], [LastModificationTime], [CreationTime]) VALUES (N'0716B4B0-9A06-43E9-8AE8-82C74875F83E', N'2', N'se', N'项目经理', N'1', NULL, N'2021-05-27 20:26:35', N'2021-05-27 20:26:35')
GO

INSERT INTO [dbo].[sys_post] ([Id], [Number], [Code], [Name], [State], [Remarks], [LastModificationTime], [CreationTime]) VALUES (N'96927C30-41D0-4CED-8E29-CBED35C90FB0', N'1', N'ceo', N'董事长', N'1', NULL, N'2021-05-27 20:26:22', N'2021-05-27 20:26:22')
GO

INSERT INTO [dbo].[sys_post] ([Id], [Number], [Code], [Name], [State], [Remarks], [LastModificationTime], [CreationTime]) VALUES (N'E46AF329-6D08-442C-9837-F22CFF954411', N'4', N'user', N'普通员工', N'1', NULL, N'2022-04-23 21:50:55', N'2021-05-27 20:26:52')
GO

INSERT INTO [dbo].[sys_post] ([Id], [Number], [Code], [Name], [State], [Remarks], [LastModificationTime], [CreationTime]) VALUES (N'F0C67537-8094-429A-B474-F54AC518609E', N'3', N'hr', N'人力资源', N'1', NULL, N'2021-05-27 20:26:44', N'2021-05-27 20:26:44')
GO


-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_role]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_role]
GO

CREATE TABLE [dbo].[sys_role] (
  [Id] uniqueidentifier  NOT NULL,
  [LastModificationTime] datetime2(0)  NULL,
  [CreationTime] datetime2(0)  NULL,
  [Number] int  NULL,
  [Name] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Remark] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [DeleteLock] bit  NULL
)
GO

ALTER TABLE [dbo].[sys_role] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO [dbo].[sys_role] ([Id], [LastModificationTime], [CreationTime], [Number], [Name], [Remark], [DeleteLock]) VALUES (N'18FA4771-6F58-46A3-80D2-6F0F5E9972E3', N'2021-01-10 11:25:12', N'2016-07-06 17:59:20', N'1', N'超级管理员', N'拥有所有权限', N'1')
GO

INSERT INTO [dbo].[sys_role] ([Id], [LastModificationTime], [CreationTime], [Number], [Name], [Remark], [DeleteLock]) VALUES (N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'2021-01-30 00:51:17', N'2016-07-06 17:59:20', N'2', N'普通用户', N'普通用户', N'1')
GO


-- ----------------------------
-- Table structure for sys_role_menu_function
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_role_menu_function]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_role_menu_function]
GO

CREATE TABLE [dbo].[sys_role_menu_function] (
  [Id] uniqueidentifier  NOT NULL,
  [RoleId] uniqueidentifier  NULL,
  [MenuId] int  NULL,
  [MenuFunctionId] uniqueidentifier  NULL,
  [LastModificationTime] datetime2(0)  NULL,
  [CreationTime] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[sys_role_menu_function] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of sys_role_menu_function
-- ----------------------------
INSERT INTO [dbo].[sys_role_menu_function] ([Id], [RoleId], [MenuId], [MenuFunctionId], [LastModificationTime], [CreationTime]) VALUES (N'31E97CAE-1A79-4066-0368-08DA5F56B13D', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'2', N'A7CD04DB-BBE3-49B6-0F1E-08D9FDAD00AB', N'2022-07-06 21:51:57', N'2022-07-06 21:51:57')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [RoleId], [MenuId], [MenuFunctionId], [LastModificationTime], [CreationTime]) VALUES (N'28D17DAA-B64E-4946-0369-08DA5F56B13D', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'3', N'F64CFE50-1EF1-457F-0F20-08D9FDAD00AB', N'2022-07-06 21:51:57', N'2022-07-06 21:51:57')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [RoleId], [MenuId], [MenuFunctionId], [LastModificationTime], [CreationTime]) VALUES (N'3D15457F-C009-44E4-036A-08DA5F56B13D', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'5', N'A1DDD02F-8C21-4D79-0F21-08D9FDAD00AB', N'2022-07-06 21:51:57', N'2022-07-06 21:51:57')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [RoleId], [MenuId], [MenuFunctionId], [LastModificationTime], [CreationTime]) VALUES (N'653FFA0A-9A3F-447A-036B-08DA5F56B13D', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'6', N'1CB6FBE1-4A6C-4AAD-0F22-08D9FDAD00AB', N'2022-07-06 21:51:57', N'2022-07-06 21:51:57')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [RoleId], [MenuId], [MenuFunctionId], [LastModificationTime], [CreationTime]) VALUES (N'6C20DD18-622A-4C81-036C-08DA5F56B13D', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'8', N'D2E6EA60-2CF6-478A-0F23-08D9FDAD00AB', N'2022-07-06 21:51:57', N'2022-07-06 21:51:57')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [RoleId], [MenuId], [MenuFunctionId], [LastModificationTime], [CreationTime]) VALUES (N'EF9CBB6D-70F0-4246-036D-08DA5F56B13D', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'9', N'B7533A90-DAE4-4263-0F24-08D9FDAD00AB', N'2022-07-06 21:51:57', N'2022-07-06 21:51:57')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [RoleId], [MenuId], [MenuFunctionId], [LastModificationTime], [CreationTime]) VALUES (N'CF58224E-9D8A-4DD7-036E-08DA5F56B13D', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'10', N'EC535908-8671-4928-0F25-08D9FDAD00AB', N'2022-07-06 21:51:57', N'2022-07-06 21:51:57')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [RoleId], [MenuId], [MenuFunctionId], [LastModificationTime], [CreationTime]) VALUES (N'CD8357E8-E0B8-4A44-036F-08DA5F56B13D', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'11', N'3BC0E68F-D03D-4E99-0F26-08D9FDAD00AB', N'2022-07-06 21:51:57', N'2022-07-06 21:51:57')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [RoleId], [MenuId], [MenuFunctionId], [LastModificationTime], [CreationTime]) VALUES (N'F90CD8A1-2FAE-40ED-0370-08DA5F56B13D', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'13', N'EB958545-6449-40DB-0F27-08D9FDAD00AB', N'2022-07-06 21:51:57', N'2022-07-06 21:51:57')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [RoleId], [MenuId], [MenuFunctionId], [LastModificationTime], [CreationTime]) VALUES (N'95E2AD9F-F876-4881-0371-08DA5F56B13D', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'13', N'B5881044-AFB8-40B2-0F28-08D9FDAD00AB', N'2022-07-06 21:51:57', N'2022-07-06 21:51:57')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [RoleId], [MenuId], [MenuFunctionId], [LastModificationTime], [CreationTime]) VALUES (N'3CE23BF9-F697-4D68-0372-08DA5F56B13D', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'13', N'106FB69A-8BB5-4559-0F29-08D9FDAD00AB', N'2022-07-06 21:51:57', N'2022-07-06 21:51:57')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [RoleId], [MenuId], [MenuFunctionId], [LastModificationTime], [CreationTime]) VALUES (N'9CDB59FA-4C72-4ADF-0373-08DA5F56B13D', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'13', N'F4621FBE-6B40-4454-0F2A-08D9FDAD00AB', N'2022-07-06 21:51:57', N'2022-07-06 21:51:57')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [RoleId], [MenuId], [MenuFunctionId], [LastModificationTime], [CreationTime]) VALUES (N'D11FB2B1-54D2-4151-0374-08DA5F56B13D', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'13', N'523B53B5-8159-4A16-0F2B-08D9FDAD00AB', N'2022-07-06 21:51:57', N'2022-07-06 21:51:57')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [RoleId], [MenuId], [MenuFunctionId], [LastModificationTime], [CreationTime]) VALUES (N'4DF2715F-2A1E-45C2-0375-08DA5F56B13D', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'13', N'A3754771-F6E9-4A23-0F2C-08D9FDAD00AB', N'2022-07-06 21:51:57', N'2022-07-06 21:51:57')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [RoleId], [MenuId], [MenuFunctionId], [LastModificationTime], [CreationTime]) VALUES (N'390F485A-5F50-475B-0376-08DA5F56B13D', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'13', N'B96F977C-A36E-4E7F-0F2D-08D9FDAD00AB', N'2022-07-06 21:51:57', N'2022-07-06 21:51:57')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [RoleId], [MenuId], [MenuFunctionId], [LastModificationTime], [CreationTime]) VALUES (N'A10FDD9A-93DF-47D6-0377-08DA5F56B13D', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'13', N'541D9045-47B2-4629-0F2E-08D9FDAD00AB', N'2022-07-06 21:51:57', N'2022-07-06 21:51:57')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [RoleId], [MenuId], [MenuFunctionId], [LastModificationTime], [CreationTime]) VALUES (N'B414E6E7-AB37-48AB-0378-08DA5F56B13D', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'15', N'13F3F74D-C6FC-4488-0F2F-08D9FDAD00AB', N'2022-07-06 21:51:57', N'2022-07-06 21:51:57')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [RoleId], [MenuId], [MenuFunctionId], [LastModificationTime], [CreationTime]) VALUES (N'509AD581-1589-41A3-0379-08DA5F56B13D', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'19', N'C77C812A-1601-4311-0F70-08D9FDAD00AB', N'2022-07-06 21:51:57', N'2022-07-06 21:51:57')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [RoleId], [MenuId], [MenuFunctionId], [LastModificationTime], [CreationTime]) VALUES (N'BC7AD808-E114-47AE-037A-08DA5F56B13D', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'28', N'3F6D0AF7-5386-4D3A-0F71-08D9FDAD00AB', N'2022-07-06 21:51:57', N'2022-07-06 21:51:57')
GO

INSERT INTO [dbo].[sys_role_menu_function] ([Id], [RoleId], [MenuId], [MenuFunctionId], [LastModificationTime], [CreationTime]) VALUES (N'AA9A9BA6-A5CF-4620-037B-08DA5F56B13D', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'32', N'6C09C0C0-72FA-4842-0F1F-08D9FDAD00AB', N'2022-07-06 21:51:57', N'2022-07-06 21:51:57')
GO


-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_user]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_user]
GO

CREATE TABLE [dbo].[sys_user] (
  [Id] uniqueidentifier  NOT NULL,
  [LastModificationTime] datetime2(0)  NULL,
  [CreationTime] datetime2(0)  NULL,
  [Name] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [LoginName] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Password] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Phone] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Email] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [DeleteLock] bit  NULL,
  [OrganizationId] int  NULL
)
GO

ALTER TABLE [dbo].[sys_user] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO [dbo].[sys_user] ([Id], [LastModificationTime], [CreationTime], [Name], [LoginName], [Password], [Phone], [Email], [DeleteLock], [OrganizationId]) VALUES (N'5722AF0F-2366-4FC9-62D5-08DA00E3D8A0', N'2022-03-08 17:13:02', N'2022-03-08 17:13:02', N'杜甫', N'杜甫', N'46F94C8DE14FB36680850768FF1B7F2A', N'12345678900', N'12345678900@qq.com', N'0', N'7')
GO

INSERT INTO [dbo].[sys_user] ([Id], [LastModificationTime], [CreationTime], [Name], [LoginName], [Password], [Phone], [Email], [DeleteLock], [OrganizationId]) VALUES (N'4FD6A740-0CF1-4975-62D6-08DA00E3D8A0', N'2022-03-08 17:14:13', N'2022-03-08 17:14:13', N'李商隐', N'李商隐', N'46F94C8DE14FB36680850768FF1B7F2A', N'12345678900', N'12345678900@qq.com', N'0', N'7')
GO

INSERT INTO [dbo].[sys_user] ([Id], [LastModificationTime], [CreationTime], [Name], [LoginName], [Password], [Phone], [Email], [DeleteLock], [OrganizationId]) VALUES (N'E225E163-31C9-4DA9-62D7-08DA00E3D8A0', N'2022-03-08 17:15:07', N'2022-03-08 17:15:07', N'苏轼', N'苏轼', N'46F94C8DE14FB36680850768FF1B7F2A', N'12345678900', N'12345678900@qq.com', N'0', N'7')
GO

INSERT INTO [dbo].[sys_user] ([Id], [LastModificationTime], [CreationTime], [Name], [LoginName], [Password], [Phone], [Email], [DeleteLock], [OrganizationId]) VALUES (N'3739F349-7995-4C63-62D8-08DA00E3D8A0', N'2022-03-08 17:17:58', N'2022-03-08 17:17:58', N'白居易', N'白居易', N'46F94C8DE14FB36680850768FF1B7F2A', N'12345678900', N'12345678900@qq.com', N'0', N'7')
GO

INSERT INTO [dbo].[sys_user] ([Id], [LastModificationTime], [CreationTime], [Name], [LoginName], [Password], [Phone], [Email], [DeleteLock], [OrganizationId]) VALUES (N'A3F9784C-5F00-4EC9-62D9-08DA00E3D8A0', N'2022-03-08 17:19:22', N'2022-03-08 17:19:22', N'陶渊明 ', N'陶渊明 ', N'46F94C8DE14FB36680850768FF1B7F2A', N'12345678900', N'12345678900@qq.com', N'0', N'7')
GO

INSERT INTO [dbo].[sys_user] ([Id], [LastModificationTime], [CreationTime], [Name], [LoginName], [Password], [Phone], [Email], [DeleteLock], [OrganizationId]) VALUES (N'A1B6DAFB-2B6A-4FF9-62DA-08DA00E3D8A0', N'2022-03-08 17:19:55', N'2022-03-08 17:19:55', N'屈原', N'屈原', N'46F94C8DE14FB36680850768FF1B7F2A', N'12345678900', N'12345678900@qq.com', N'0', N'7')
GO

INSERT INTO [dbo].[sys_user] ([Id], [LastModificationTime], [CreationTime], [Name], [LoginName], [Password], [Phone], [Email], [DeleteLock], [OrganizationId]) VALUES (N'CC186FE2-EE27-4292-62DB-08DA00E3D8A0', N'2022-03-08 17:20:20', N'2022-03-08 17:20:20', N'孟浩然', N'孟浩然', N'46F94C8DE14FB36680850768FF1B7F2A', N'12345678900', N'12345678900@qq.com', N'0', N'7')
GO

INSERT INTO [dbo].[sys_user] ([Id], [LastModificationTime], [CreationTime], [Name], [LoginName], [Password], [Phone], [Email], [DeleteLock], [OrganizationId]) VALUES (N'1550D6D4-0529-4FDD-62DC-08DA00E3D8A0', N'2022-03-08 17:30:56', N'2022-03-08 17:21:56', N'鲁迅', N'鲁迅', N'46F94C8DE14FB36680850768FF1B7F2A', N'12345678900', N'12345678900@qq.com', N'0', N'7')
GO

INSERT INTO [dbo].[sys_user] ([Id], [LastModificationTime], [CreationTime], [Name], [LoginName], [Password], [Phone], [Email], [DeleteLock], [OrganizationId]) VALUES (N'0198459E-2034-4533-B843-5D227AD20740', N'2022-03-08 17:27:36', N'2017-04-06 19:55:53', N'超级管理员', N'admin', N'E10ADC3949BA59ABBE56E057F20F883E', N'10000000000', N'1396510655@qq.com', N'1', N'7')
GO

INSERT INTO [dbo].[sys_user] ([Id], [LastModificationTime], [CreationTime], [Name], [LoginName], [Password], [Phone], [Email], [DeleteLock], [OrganizationId]) VALUES (N'AC18F496-E93D-42F0-B59E-E321ACC85335', N'2022-03-08 10:12:14', N'2017-04-06 19:55:53', N'李白', N'libai', N'E10ADC3949BA59ABBE56E057F20F883E', N'12345678900', N'12345678900@live.com', N'1', N'7')
GO


-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_user_post]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_user_post]
GO

CREATE TABLE [dbo].[sys_user_post] (
  [Id] uniqueidentifier  NOT NULL,
  [UserId] uniqueidentifier  NULL,
  [PostId] uniqueidentifier  NULL,
  [LastModificationTime] datetime2(0)  NULL,
  [CreationTime] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[sys_user_post] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO [dbo].[sys_user_post] ([Id], [UserId], [PostId], [LastModificationTime], [CreationTime]) VALUES (N'978FC672-D829-4DAD-ABC7-071810C5AD18', N'E225E163-31C9-4DA9-62D7-08DA00E3D8A0', N'E46AF329-6D08-442C-9837-F22CFF954411', N'2022-03-08 17:15:08', N'2022-03-08 17:15:08')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [UserId], [PostId], [LastModificationTime], [CreationTime]) VALUES (N'DA9B04C9-D1EF-4721-8A94-4558DFE2EB7D', N'A1B6DAFB-2B6A-4FF9-62DA-08DA00E3D8A0', N'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622', N'2022-06-21 19:59:02', N'2022-06-21 19:59:02')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [UserId], [PostId], [LastModificationTime], [CreationTime]) VALUES (N'575BF085-47BB-42F2-8B68-620CF460B164', N'0198459E-2034-4533-B843-5D227AD20740', N'96927C30-41D0-4CED-8E29-CBED35C90FB0', N'2022-03-08 17:29:22', N'2022-03-08 17:29:22')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [UserId], [PostId], [LastModificationTime], [CreationTime]) VALUES (N'AF1BEC7E-3309-4629-9606-72EEFA1826B3', N'CC186FE2-EE27-4292-62DB-08DA00E3D8A0', N'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622', N'2022-03-08 17:20:20', N'2022-03-08 17:20:20')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [UserId], [PostId], [LastModificationTime], [CreationTime]) VALUES (N'B669EC48-AA60-441A-B59D-7F9BE7B94155', N'1550D6D4-0529-4FDD-62DC-08DA00E3D8A0', N'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622', N'2022-07-06 21:49:13', N'2022-07-06 21:49:13')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [UserId], [PostId], [LastModificationTime], [CreationTime]) VALUES (N'D4E0AE0B-3573-4901-8FD7-9BB2C88EBE94', N'3739F349-7995-4C63-62D8-08DA00E3D8A0', N'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622', N'2022-03-08 17:17:58', N'2022-03-08 17:17:58')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [UserId], [PostId], [LastModificationTime], [CreationTime]) VALUES (N'B97331A7-E281-4027-AADE-9F068558826A', N'5722AF0F-2366-4FC9-62D5-08DA00E3D8A0', N'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622', N'2022-03-08 17:13:02', N'2022-03-08 17:13:02')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [UserId], [PostId], [LastModificationTime], [CreationTime]) VALUES (N'0C1A55BA-6BD3-4810-A494-A6B9B7374D4D', N'AC18F496-E93D-42F0-B59E-E321ACC85335', N'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622', N'2022-03-08 10:13:35', N'2022-03-08 10:13:35')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [UserId], [PostId], [LastModificationTime], [CreationTime]) VALUES (N'E64EF93C-2CE5-4B1D-A5D0-A9DE937C5A3F', N'E225E163-31C9-4DA9-62D7-08DA00E3D8A0', N'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622', N'2022-03-08 17:15:07', N'2022-03-08 17:15:07')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [UserId], [PostId], [LastModificationTime], [CreationTime]) VALUES (N'6F671077-C98D-4106-9736-BF2EDB6DB58D', N'4FD6A740-0CF1-4975-62D6-08DA00E3D8A0', N'E46AF329-6D08-442C-9837-F22CFF954411', N'2022-03-08 17:14:13', N'2022-03-08 17:14:13')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [UserId], [PostId], [LastModificationTime], [CreationTime]) VALUES (N'6C34F115-28DD-441A-81D5-F6598C97D44A', N'A3F9784C-5F00-4EC9-62D9-08DA00E3D8A0', N'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622', N'2022-03-08 17:19:22', N'2022-03-08 17:19:22')
GO

INSERT INTO [dbo].[sys_user_post] ([Id], [UserId], [PostId], [LastModificationTime], [CreationTime]) VALUES (N'B797FF16-D6F7-45DB-83EC-F910B2612926', N'4FD6A740-0CF1-4975-62D6-08DA00E3D8A0', N'F0BD38C2-F1DE-4BD9-E2DB-08DA00A93622', N'2022-03-08 17:14:13', N'2022-03-08 17:14:13')
GO


-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_user_role]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_user_role]
GO

CREATE TABLE [dbo].[sys_user_role] (
  [Id] uniqueidentifier  NOT NULL,
  [UserId] uniqueidentifier  NULL,
  [RoleId] uniqueidentifier  NULL,
  [LastModificationTime] datetime2(0)  NULL,
  [CreationTime] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[sys_user_role] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO [dbo].[sys_user_role] ([Id], [UserId], [RoleId], [LastModificationTime], [CreationTime]) VALUES (N'AD5014F2-92E8-4109-9CA4-013A92390F8B', N'CC186FE2-EE27-4292-62DB-08DA00E3D8A0', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'2022-03-08 17:20:20', N'2022-03-08 17:20:20')
GO

INSERT INTO [dbo].[sys_user_role] ([Id], [UserId], [RoleId], [LastModificationTime], [CreationTime]) VALUES (N'CE9F61AC-79D8-426F-9066-36962C017BF6', N'5722AF0F-2366-4FC9-62D5-08DA00E3D8A0', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'2022-03-08 17:13:02', N'2022-03-08 17:13:02')
GO

INSERT INTO [dbo].[sys_user_role] ([Id], [UserId], [RoleId], [LastModificationTime], [CreationTime]) VALUES (N'DBC656A6-4264-417D-97D8-577E1218FECA', N'A3F9784C-5F00-4EC9-62D9-08DA00E3D8A0', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'2022-03-08 17:19:22', N'2022-03-08 17:19:22')
GO

INSERT INTO [dbo].[sys_user_role] ([Id], [UserId], [RoleId], [LastModificationTime], [CreationTime]) VALUES (N'9B7BEE51-2FB4-4ABA-B680-6EEA512919EB', N'A1B6DAFB-2B6A-4FF9-62DA-08DA00E3D8A0', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'2022-06-21 19:59:02', N'2022-06-21 19:59:02')
GO

INSERT INTO [dbo].[sys_user_role] ([Id], [UserId], [RoleId], [LastModificationTime], [CreationTime]) VALUES (N'23D32064-6EB8-4EA9-9B2A-7E2F09F53E4D', N'1550D6D4-0529-4FDD-62DC-08DA00E3D8A0', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'2022-07-06 21:49:13', N'2022-07-06 21:49:13')
GO

INSERT INTO [dbo].[sys_user_role] ([Id], [UserId], [RoleId], [LastModificationTime], [CreationTime]) VALUES (N'1FE23F57-97C5-4670-9064-88D7D972CD28', N'E225E163-31C9-4DA9-62D7-08DA00E3D8A0', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'2022-03-08 17:15:07', N'2022-03-08 17:15:07')
GO

INSERT INTO [dbo].[sys_user_role] ([Id], [UserId], [RoleId], [LastModificationTime], [CreationTime]) VALUES (N'A9F8A23B-8C2F-43CC-97AF-8ED6F4C4D097', N'4FD6A740-0CF1-4975-62D6-08DA00E3D8A0', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'2022-03-08 17:14:13', N'2022-03-08 17:14:13')
GO

INSERT INTO [dbo].[sys_user_role] ([Id], [UserId], [RoleId], [LastModificationTime], [CreationTime]) VALUES (N'45B7D5AF-4D2C-465E-A4B6-99E52AF9AEE5', N'3739F349-7995-4C63-62D8-08DA00E3D8A0', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'2022-03-08 17:17:58', N'2022-03-08 17:17:58')
GO

INSERT INTO [dbo].[sys_user_role] ([Id], [UserId], [RoleId], [LastModificationTime], [CreationTime]) VALUES (N'1C9F81DF-C8A0-45BB-A272-C84BD3AF0C19', N'0198459E-2034-4533-B843-5D227AD20740', N'18FA4771-6F58-46A3-80D2-6F0F5E9972E3', N'2022-03-08 17:29:22', N'2022-03-08 17:29:22')
GO

INSERT INTO [dbo].[sys_user_role] ([Id], [UserId], [RoleId], [LastModificationTime], [CreationTime]) VALUES (N'FA1FDF14-3847-4194-894C-CD935A3DD9E6', N'AC18F496-E93D-42F0-B59E-E321ACC85335', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'2022-03-08 10:13:35', N'2022-03-08 10:13:35')
GO


-- ----------------------------
-- Primary Key structure for table flow
-- ----------------------------
ALTER TABLE [dbo].[flow] ADD CONSTRAINT [PK__flow__3214EC07BC64B717] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table flow_approval
-- ----------------------------
ALTER TABLE [dbo].[flow_approval] ADD CONSTRAINT [PK__FlowAppr__3214EC07D0DB8D96] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table flow_approval_step
-- ----------------------------
ALTER TABLE [dbo].[flow_approval_step] ADD CONSTRAINT [PK__FlowAppr__3214EC0754EDFF34] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table flow_approval_step_user
-- ----------------------------
ALTER TABLE [dbo].[flow_approval_step_user] ADD CONSTRAINT [PK_FlowApprovalStepUser] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table flow_node
-- ----------------------------
ALTER TABLE [dbo].[flow_node] ADD CONSTRAINT [PK__flownode__3214EC07319731E2] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table low_code_list
-- ----------------------------
ALTER TABLE [dbo].[low_code_list] ADD CONSTRAINT [PK_Low_Code_List] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table low_code_search
-- ----------------------------
ALTER TABLE [dbo].[low_code_search] ADD CONSTRAINT [PK_Low_Code_Search] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table low_code_table
-- ----------------------------
ALTER TABLE [dbo].[low_code_table] ADD CONSTRAINT [PK_Low_Code_Table] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table low_code_table_info
-- ----------------------------
ALTER TABLE [dbo].[low_code_table_info] ADD CONSTRAINT [PK_Low_Code_Table_Info] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table member
-- ----------------------------
ALTER TABLE [dbo].[member] ADD CONSTRAINT [Member_pkey] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table sys_data_authority
-- ----------------------------
ALTER TABLE [dbo].[sys_data_authority] ADD CONSTRAINT [PK_DataAuthority] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table sys_data_authority_custom
-- ----------------------------
ALTER TABLE [dbo].[sys_data_authority_custom] ADD CONSTRAINT [PK_SysDataAuthorityCustom] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for sys_dictionary
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[sys_dictionary]', RESEED, 1003)
GO


-- ----------------------------
-- Primary Key structure for table sys_dictionary
-- ----------------------------
ALTER TABLE [dbo].[sys_dictionary] ADD CONSTRAINT [PK__sys_dict__3214EC072CC7E6B1] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table sys_function
-- ----------------------------
ALTER TABLE [dbo].[sys_function] ADD CONSTRAINT [SysFunction_pkey] PRIMARY KEY CLUSTERED ([Id])
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
ALTER TABLE [dbo].[sys_menu] ADD CONSTRAINT [SysMenu_pkey] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table sys_menu_function
-- ----------------------------
ALTER TABLE [dbo].[sys_menu_function] ADD CONSTRAINT [SysMenuFunction_pkey] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table sys_operation_log
-- ----------------------------
ALTER TABLE [dbo].[sys_operation_log] ADD CONSTRAINT [PK__SysOpera__3214EC0743ACCFCD] PRIMARY KEY CLUSTERED ([Id])
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
ALTER TABLE [dbo].[sys_organization] ADD CONSTRAINT [SysOrganization_pkey] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table sys_post
-- ----------------------------
ALTER TABLE [dbo].[sys_post] ADD CONSTRAINT [SysPost_pkey] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table sys_role
-- ----------------------------
ALTER TABLE [dbo].[sys_role] ADD CONSTRAINT [SysRole_pkey] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table sys_role_menu_function
-- ----------------------------
ALTER TABLE [dbo].[sys_role_menu_function] ADD CONSTRAINT [SysRoleMenuFunction_pkey] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table sys_user
-- ----------------------------
ALTER TABLE [dbo].[sys_user] ADD CONSTRAINT [SysUser_pkey] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table sys_user_post
-- ----------------------------
ALTER TABLE [dbo].[sys_user_post] ADD CONSTRAINT [SysUserPost_pkey] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table sys_user_role
-- ----------------------------
ALTER TABLE [dbo].[sys_user_role] ADD CONSTRAINT [SysUserRole_pkey] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

