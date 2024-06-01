/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:3306
 Source Schema         : ruoyi-2024

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 27/01/2024 10:03:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for f_error_log
-- ----------------------------
DROP TABLE IF EXISTS `f_error_log`;
CREATE TABLE `f_error_log`  (
  `id` bigint NOT NULL COMMENT 'id',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户端类型',
  `error_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '错误类型',
  `uid` bigint NULL DEFAULT NULL COMMENT '用户id',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路径',
  `method` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '方法',
  `args` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '参数',
  `error` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '错误信息',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '逻辑删除',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '错误日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of f_error_log
-- ----------------------------
INSERT INTO `f_error_log` VALUES (1722097606196846594, '0', '业务异常', 1, 'admin', '/system/role/changeStatus', 'PUT', '{\"roleId\":1,\"status\":\"1\"}', '不允许操作超级管理员角色', NULL, NULL, '2023-11-08 11:43:59', NULL, '2023-11-08 11:43:59', '0', NULL);
INSERT INTO `f_error_log` VALUES (1722097619496984578, '0', '业务异常', 1, 'admin', '/system/role/changeStatus', 'PUT', '{\"roleId\":2,\"status\":\"1\"}', '角色已分配，不能禁用!', NULL, NULL, '2023-11-08 11:44:02', NULL, '2023-11-08 11:44:02', '0', NULL);
INSERT INTO `f_error_log` VALUES (1728702461627674625, '0', '发生未知异常', 1, 'admin', '/system/dict/data/type/sys_normal_disabled', 'GET', '', 'org.springframework.cglib.core.CodeGenerationException: java.lang.reflect.InaccessibleObjectException-->Unable to make protected final java.lang.Class java.lang.ClassLoader.defineClass(java.lang.String,byte[],int,int,java.security.ProtectionDomain) throws java.lang.ClassFormatError accessible: module java.base does not \"opens java.lang\" to unnamed module @574b560f', NULL, NULL, '2023-11-26 17:09:19', NULL, '2023-11-26 17:09:19', '0', NULL);
INSERT INTO `f_error_log` VALUES (1728702461627674626, '0', '发生未知异常', 1, 'admin', '/system/dict/data/type/sys_user_sex', 'GET', '', 'org.springframework.cglib.core.CodeGenerationException: java.lang.reflect.InaccessibleObjectException-->Unable to make protected final java.lang.Class java.lang.ClassLoader.defineClass(java.lang.String,byte[],int,int,java.security.ProtectionDomain) throws java.lang.ClassFormatError accessible: module java.base does not \"opens java.lang\" to unnamed module @574b560f', NULL, NULL, '2023-11-26 17:09:19', NULL, '2023-11-26 17:09:19', '0', NULL);

-- ----------------------------
-- Table structure for f_temp
-- ----------------------------
DROP TABLE IF EXISTS `f_temp`;
CREATE TABLE `f_temp`  (
  `id` bigint NOT NULL COMMENT 'id',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '逻辑删除',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '模板sql文件' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of f_temp
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL COMMENT '编号',
  `data_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据源名称',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1689181228817301506, 'master', 'f_ad', '广告', NULL, NULL, 'Ad', 'crud', 'org.dromara.service', 'service', 'ad', '广告', 'ruoyi', '0', '/', NULL, 1, 103, '2023-08-08 21:05:55', 1, '2023-08-08 21:05:55', NULL);
INSERT INTO `gen_table` VALUES (1689181228943130626, 'master', 'f_user', '用户表', NULL, NULL, 'User', 'crud', 'org.dromara.service', 'service', 'user', '用户', 'ruoyi', '0', '/', '{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":null}', 1, 103, '2023-08-06 17:38:59', 1, '2023-08-23 12:38:12', NULL);
INSERT INTO `gen_table` VALUES (1689181229010239496, 'master', 'sys_client', '系统授权表', NULL, NULL, 'SysClient', 'crud', 'org.dromara.service', 'service', 'client', '系统授权', 'ruoyi', '0', '/', NULL, 1, 103, '2023-08-08 11:59:24', 1, '2023-08-08 11:59:24', NULL);
INSERT INTO `gen_table` VALUES (1689181229010239512, 'master', 'sys_dict_data', '字典数据表', NULL, NULL, 'SysDictData', 'crud', 'org.dromara.service', 'service', 'dictData', '字典数据', 'ruoyi', '0', '/', NULL, 1, 103, '2023-08-08 11:59:42', 1, '2023-08-08 11:59:42', NULL);
INSERT INTO `gen_table` VALUES (1689181229077348367, 'master', 'sys_menu', '菜单权限表', NULL, NULL, 'SysMenu', 'crud', 'org.dromara.service', 'service', 'menu', '菜单权限', 'ruoyi', '0', '/', NULL, 1, 103, '2023-08-08 12:01:27', 1, '2023-08-08 12:01:27', NULL);
INSERT INTO `gen_table` VALUES (1689181229144457218, 'master', 'sys_oper_log', '操作日志记录', NULL, NULL, 'SysOperLog', 'crud', 'org.dromara.service', 'service', 'operLog', '操作日志记录', 'ruoyi', '0', '/', NULL, 1, 103, '2023-08-08 12:02:22', 1, '2023-08-08 12:02:22', NULL);
INSERT INTO `gen_table` VALUES (1689181229144457236, 'master', 'sys_oss', 'OSS对象存储表', NULL, NULL, 'SysOss', 'crud', 'org.dromara.service', 'service', 'oss', 'OSS对象存储', 'ruoyi', '0', '/', NULL, 1, 103, '2023-08-08 10:19:55', 1, '2023-08-08 10:19:55', NULL);
INSERT INTO `gen_table` VALUES (1689181229207371777, 'master', 'sys_post', '岗位信息表', NULL, NULL, 'SysPost', 'crud', 'org.dromara.service', 'service', 'post', '岗位信息', 'ruoyi', '0', '/', NULL, 1, 103, '2023-08-08 12:03:03', 1, '2023-08-08 12:03:03', NULL);
INSERT INTO `gen_table` VALUES (1689181229207371789, 'master', 'sys_role', '角色信息表', NULL, NULL, 'SysRole', 'crud', 'org.dromara.service', 'service', 'role', '角色信息', 'ruoyi', '0', '/', NULL, 1, 103, '2023-08-08 12:03:32', 1, '2023-08-08 12:03:32', NULL);
INSERT INTO `gen_table` VALUES (1689181229207371805, 'master', 'sys_social', '社会化关系表', NULL, NULL, 'SysSocial', 'crud', 'org.dromara.service', 'service', 'social', '社会化关系', 'ruoyi', '0', '/', NULL, 1, 103, '2023-08-08 12:03:55', 1, '2023-08-08 12:03:55', NULL);
INSERT INTO `gen_table` VALUES (1689181248442449921, 'master', 'f_error_log', '错误日志', NULL, NULL, 'ErrorLog', 'crud', 'org.dromara.service', 'service', 'errorLog', '错误日志', 'ruoyi', '0', '/', NULL, 1, 103, '2023-08-06 01:46:55', 1, '2023-08-06 01:46:55', NULL);
INSERT INTO `gen_table` VALUES (1689181248442449939, 'master', 'f_goods', '商品表', NULL, NULL, 'Goods', 'crud', 'org.dromara.service', 'service', 'goods', '商品', 'ruoyi', '0', '/', NULL, 1, 103, '2023-08-06 01:47:50', 1, '2023-08-06 01:47:50', NULL);
INSERT INTO `gen_table` VALUES (1689181248509558808, 'master', 'f_menus', '店铺菜单', NULL, NULL, 'Menus', 'crud', 'org.dromara.service', 'service', 'menus', '店铺菜单', 'ruoyi', '0', '/', NULL, 1, 103, '2023-08-06 01:48:35', 1, '2023-08-06 01:48:35', NULL);
INSERT INTO `gen_table` VALUES (1689181248572473346, 'master', 'f_model', '消息订阅', NULL, NULL, 'Model', 'crud', 'org.dromara.service', 'service', 'model', '消息订阅', 'ruoyi', '0', '/', NULL, 1, 103, '2023-08-06 01:49:19', 1, '2023-08-06 01:49:19', NULL);
INSERT INTO `gen_table` VALUES (1689181248572473371, 'master', 'f_msg', '消息配置', NULL, NULL, 'Msg', 'crud', 'org.dromara.service', 'service', 'msg', '消息配置', 'ruoyi', '0', '/', NULL, 1, 103, '2023-08-06 01:50:25', 1, '2023-08-06 01:50:25', NULL);
INSERT INTO `gen_table` VALUES (1689181248639582224, 'master', 'f_olist', '订单表', NULL, NULL, 'Olist', 'crud', 'org.dromara.service', 'service', 'olist', '订单', 'ruoyi', '0', '/', NULL, 1, 103, '2023-08-06 01:51:17', 1, '2023-08-06 01:51:17', NULL);
INSERT INTO `gen_table` VALUES (1689181248706691077, 'master', 'f_shop', '店铺信息', NULL, NULL, 'Shop', 'crud', 'org.dromara.service', 'service', 'shop', '店铺信息', 'ruoyi', '0', '/', '{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":null}', 1, 103, '2023-08-06 01:52:48', 1, '2023-08-23 13:41:22', NULL);
INSERT INTO `gen_table` VALUES (1689181248773799938, 'master', 'f_smsg', '系统通知', NULL, NULL, 'Smsg', 'crud', 'org.dromara.service', 'service', 'smsg', '系统通知', 'ruoyi', '0', '/', NULL, 1, 103, '2023-08-06 01:53:20', 1, '2023-08-06 01:53:20', NULL);
INSERT INTO `gen_table` VALUES (1689181248773799960, 'master', 'f_spec', '商品规格', NULL, NULL, 'Spec', 'crud', 'org.dromara.service', 'service', 'spec', '商品规格', 'ruoyi', '0', '/', NULL, 1, 103, '2023-08-06 01:54:01', 1, '2023-08-06 01:54:01', NULL);
INSERT INTO `gen_table` VALUES (1689181248840908804, 'master', 'f_temp', '模板sql文件', NULL, NULL, 'Temp', 'crud', 'org.dromara.service', 'service', 'temp', '模板sql文件', 'ruoyi', '0', '/', NULL, 1, 103, '2023-08-06 01:54:51', 1, '2023-08-06 01:54:51', NULL);
INSERT INTO `gen_table` VALUES (1689181262325596161, 'master', 'f_address', '地址管理', NULL, NULL, 'Address', 'crud', 'org.dromara.service', 'service', 'address', '地址管理', 'ruoyi', '0', '/', NULL, 1, 103, '2023-08-06 01:43:54', 1, '2023-08-06 01:43:54', NULL);
INSERT INTO `gen_table` VALUES (1689181262325596179, 'master', 'f_config', '身份标识', NULL, NULL, 'Config', 'crud', 'org.dromara.service', 'service', 'config', '身份标识', 'ruoyi', '0', '/', NULL, 1, 103, '2023-08-06 01:45:14', 1, '2023-08-06 01:45:14', NULL);
INSERT INTO `gen_table` VALUES (1689181262409482242, 'master', 'f_dwz', '短网址', NULL, NULL, 'Dwz', 'crud', 'org.dromara.service', 'service', 'dwz', '短网址', 'ruoyi', '0', '/', NULL, 1, 103, '2023-08-06 01:46:13', 1, '2023-08-06 01:46:13', NULL);
INSERT INTO `gen_table` VALUES (1689181262409482256, 'master', 'sys_config', '参数配置表', NULL, NULL, 'SysConfig', 'crud', 'org.dromara.service', 'service', 'config', '参数配置', 'ruoyi', '0', '/', NULL, 1, 103, '2023-08-06 01:34:02', 1, '2023-08-06 01:34:02', NULL);
INSERT INTO `gen_table` VALUES (1689181262459813900, 'master', 'sys_dept', '部门表', NULL, NULL, 'SysDept', 'crud', 'org.dromara.service', 'service', 'dept', '部门', 'ruoyi', '0', '/', NULL, 1, 103, '2023-08-06 01:22:01', 1, '2023-08-06 01:22:01', NULL);
INSERT INTO `gen_table` VALUES (1689181262459813916, 'master', 'sys_dict_type', '字典类型表', NULL, NULL, 'SysDictType', 'crud', 'org.dromara.service', 'service', 'dictType', '字典类型', 'ruoyi', '0', '/', NULL, 1, 103, '2023-08-06 01:32:11', 1, '2023-08-06 01:32:11', NULL);
INSERT INTO `gen_table` VALUES (1689181262526922762, 'master', 'sys_logininfor', '系统访问记录', NULL, NULL, 'SysLogininfor', 'crud', 'org.dromara.service', 'service', 'logininfor', '系统访问记录', 'ruoyi', '0', '/', NULL, 1, 103, '2023-08-01 16:25:24', 1, '2023-08-01 16:25:24', NULL);
INSERT INTO `gen_table` VALUES (1689181262526922772, 'master', 'sys_notice', '通知公告表', NULL, NULL, 'SysNotice', 'crud', 'org.dromara.service', 'service', 'notice', '通知公告', 'ruoyi', '0', '/', NULL, 1, 103, '2023-08-06 01:35:25', 1, '2023-08-06 01:35:25', NULL);
INSERT INTO `gen_table` VALUES (1689181262526922784, 'master', 'sys_oss_config', '对象存储配置表', NULL, NULL, 'SysOssConfig', 'crud', 'org.dromara.service', 'service', 'ossConfig', '对象存储配置', 'ruoyi', '0', '/', NULL, 1, 103, '2023-08-06 01:41:46', 1, '2023-08-06 01:41:46', NULL);
INSERT INTO `gen_table` VALUES (1689181262594031637, 'master', 'sys_user', '用户信息表', NULL, NULL, 'SysUser', 'crud', 'org.dromara.service', 'service', 'user', '用户信息', 'ruoyi', '0', '/', NULL, 1, 103, '2023-08-06 01:19:36', 1, '2023-08-06 01:19:36', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1689181228880216065, 1689181228817301506, 'id', 'id', 'bigint', 'Long', 'id', '1', '0', '1', NULL, '1', '1', '1', 'EQ', 'input', '', 1, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181228880216066, 1689181228817301506, 'pcode', '归属编号', 'varchar(30)', 'String', 'pcode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181228880216067, 1689181228817301506, 'classify', '分类', 'varchar(30)', 'String', 'classify', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181228880216068, 1689181228817301506, 'type', '类型', 'varchar(2)', 'String', 'type', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181228880216069, 1689181228817301506, 'img', '图片', 'text', 'String', 'img', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'imageUpload', '', 5, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181228880216070, 1689181228817301506, 'width', '宽度', 'bigint', 'Long', 'width', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181228880216071, 1689181228817301506, 'height', '高度', 'bigint', 'Long', 'height', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181228880216072, 1689181228817301506, 'gzh_url', '公众号链接', 'varchar(255)', 'String', 'gzhUrl', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181228880216073, 1689181228817301506, 'content', '内容', 'text', 'String', 'content', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 9, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181228880216074, 1689181228817301506, 'appid', 'appid', 'varchar(30)', 'String', 'appid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181228880216075, 1689181228817301506, 'name', '名称', 'varchar(30)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181228880216076, 1689181228817301506, 'title', '标题', 'varchar(30)', 'String', 'title', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181228880216077, 1689181228817301506, 'intro', '描述', 'varchar(255)', 'String', 'intro', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181228880216078, 1689181228817301506, 'path', '小程序路径', 'varchar(255)', 'String', 'path', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181228880216079, 1689181228817301506, 'param', '参数', 'varchar(255)', 'String', 'param', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 15, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181228880216080, 1689181228817301506, 'position', '顺序', 'bigint', 'Long', 'position', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 16, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181228880216081, 1689181228817301506, 'is_display', '是否显示', 'char(1)', 'String', 'isDisplay', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'usr_logic', 17, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181228880216082, 1689181228817301506, 'create_by', '创建人', 'bigint', 'Long', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 18, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181228880216083, 1689181228817301506, 'create_dept', '创建部门', 'bigint', 'Long', 'createDept', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 19, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181228880216084, 1689181228817301506, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, '1', '1', 'BETWEEN', 'datetime', '', 20, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181228880216085, 1689181228817301506, 'update_by', '修改人', 'bigint', 'Long', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 21, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181228880216086, 1689181228817301506, 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'datetime', '', 22, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181228880216087, 1689181228817301506, 'del_flag', '逻辑删除', 'char(1)', 'String', 'delFlag', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 23, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181228880216088, 1689181228817301506, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 24, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181228943130627, 1689181228943130626, 'id', 'id', 'bigint', 'Long', 'id', '1', '0', '1', NULL, '1', '1', '1', 'EQ', 'input', '', 1, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-23 12:38:12');
INSERT INTO `gen_table_column` VALUES (1689181228943130628, 1689181228943130626, 'pid', '父id', 'bigint', 'Long', 'pid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-23 12:38:12');
INSERT INTO `gen_table_column` VALUES (1689181228943130629, 1689181228943130626, 'appid', 'appid', 'varchar(30)', 'String', 'appid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-23 12:38:12');
INSERT INTO `gen_table_column` VALUES (1689181228943130630, 1689181228943130626, 'unionid', 'unionid', 'varchar(128)', 'String', 'unionid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-23 12:38:12');
INSERT INTO `gen_table_column` VALUES (1689181228943130631, 1689181228943130626, 'openid', 'openid', 'varchar(128)', 'String', 'openid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-23 12:38:12');
INSERT INTO `gen_table_column` VALUES (1689181228943130632, 1689181228943130626, 'tel', '电话', 'varchar(20)', 'String', 'tel', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-23 12:38:12');
INSERT INTO `gen_table_column` VALUES (1689181228943130633, 1689181228943130626, 'utype', 'app类型', 'varchar(2)', 'String', 'utype', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-23 12:38:12');
INSERT INTO `gen_table_column` VALUES (1689181228943130634, 1689181228943130626, 'identity', '身份', 'varchar(2)', 'String', 'identity', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-23 12:38:12');
INSERT INTO `gen_table_column` VALUES (1689181228943130635, 1689181228943130626, 'name', '姓名', 'varchar(20)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-23 12:38:12');
INSERT INTO `gen_table_column` VALUES (1689181228943130636, 1689181228943130626, 'credits', '积分', 'bigint', 'Long', 'credits', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-23 12:38:12');
INSERT INTO `gen_table_column` VALUES (1689181228943130637, 1689181228943130626, 'balance', '余额', 'decimal(10,2)', 'BigDecimal', 'balance', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-23 12:38:12');
INSERT INTO `gen_table_column` VALUES (1689181228943130638, 1689181228943130626, 'skm', '收款码', 'varchar(255)', 'String', 'skm', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'imageUpload', '', 12, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-23 12:38:12');
INSERT INTO `gen_table_column` VALUES (1689181228943130639, 1689181228943130626, 'is_apply_js', '申请结算', 'char(1)', 'String', 'isApplyJs', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'usr_logic', 13, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-23 12:38:12');
INSERT INTO `gen_table_column` VALUES (1689181228943130640, 1689181228943130626, 'ratio', '比例', 'decimal(3,2)', 'BigDecimal', 'ratio', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-23 12:38:12');
INSERT INTO `gen_table_column` VALUES (1689181228943130641, 1689181228943130626, 'level', '等级', 'char(2)', 'String', 'level', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 15, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-23 12:38:12');
INSERT INTO `gen_table_column` VALUES (1689181228943130642, 1689181228943130626, 'is_vip', '是否会员', 'char(1)', 'String', 'isVip', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'usr_logic', 16, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-23 12:38:12');
INSERT INTO `gen_table_column` VALUES (1689181228943130643, 1689181228943130626, 'expired_time', '过期时间', 'datetime', 'Date', 'expiredTime', '0', '0', NULL, '1', '1', '1', '1', 'BETWEEN', 'datetime', '', 17, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-23 12:38:12');
INSERT INTO `gen_table_column` VALUES (1689181229010239489, 1689181228943130626, 'create_by', '创建人', 'bigint', 'Long', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 18, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-23 12:38:12');
INSERT INTO `gen_table_column` VALUES (1689181229010239490, 1689181228943130626, 'create_dept', '创建部门', 'bigint', 'Long', 'createDept', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 19, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-23 12:38:12');
INSERT INTO `gen_table_column` VALUES (1689181229010239491, 1689181228943130626, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, '1', '1', 'BETWEEN', 'datetime', '', 20, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-23 12:38:12');
INSERT INTO `gen_table_column` VALUES (1689181229010239492, 1689181228943130626, 'update_by', '更新人', 'bigint', 'Long', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 21, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-23 12:38:12');
INSERT INTO `gen_table_column` VALUES (1689181229010239493, 1689181228943130626, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'datetime', '', 22, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-23 12:38:12');
INSERT INTO `gen_table_column` VALUES (1689181229010239494, 1689181228943130626, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 23, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-23 12:38:12');
INSERT INTO `gen_table_column` VALUES (1689181229010239495, 1689181228943130626, 'del_flag', '删除标记', 'char(1)', 'String', 'delFlag', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 24, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-23 12:38:12');
INSERT INTO `gen_table_column` VALUES (1689181229010239497, 1689181229010239496, 'id', 'id', 'bigint', 'Long', 'id', '1', '0', '1', NULL, '1', '1', '1', 'EQ', 'input', '', 1, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229010239498, 1689181229010239496, 'client_id', '客户端id', 'varchar(64)', 'String', 'clientId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229010239499, 1689181229010239496, 'client_key', '客户端key', 'varchar(32)', 'String', 'clientKey', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229010239500, 1689181229010239496, 'client_secret', '客户端秘钥', 'varchar(255)', 'String', 'clientSecret', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229010239501, 1689181229010239496, 'grant_type', '授权类型', 'varchar(255)', 'String', 'grantType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229010239502, 1689181229010239496, 'device_type', '设备类型', 'varchar(32)', 'String', 'deviceType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229010239503, 1689181229010239496, 'active_timeout', 'token活跃超时时间', 'int', 'Long', 'activeTimeout', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229010239504, 1689181229010239496, 'timeout', 'token固定超时', 'int', 'Long', 'timeout', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229010239505, 1689181229010239496, 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229010239506, 1689181229010239496, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 10, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229010239507, 1689181229010239496, 'create_dept', '创建部门', 'bigint', 'Long', 'createDept', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 11, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229010239508, 1689181229010239496, 'create_by', '创建者', 'bigint', 'Long', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 12, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229010239509, 1689181229010239496, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, '1', '1', 'BETWEEN', 'datetime', '', 13, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229010239510, 1689181229010239496, 'update_by', '更新者', 'bigint', 'Long', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 14, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229010239511, 1689181229010239496, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'datetime', '', 15, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229010239513, 1689181229010239512, 'dict_code', '字典编码', 'bigint', 'Long', 'dictCode', '1', '0', '1', NULL, '1', '1', '1', 'EQ', 'input', '', 1, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229010239514, 1689181229010239512, 'dict_sort', '字典排序', 'int', 'Long', 'dictSort', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229077348354, 1689181229010239512, 'dict_label', '字典标签', 'varchar(100)', 'String', 'dictLabel', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229077348355, 1689181229010239512, 'dict_value', '字典键值', 'varchar(100)', 'String', 'dictValue', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229077348356, 1689181229010239512, 'dict_type', '字典类型', 'varchar(100)', 'String', 'dictType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229077348357, 1689181229010239512, 'css_class', '样式属性（其他样式扩展）', 'varchar(100)', 'String', 'cssClass', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229077348358, 1689181229010239512, 'list_class', '表格回显样式', 'varchar(100)', 'String', 'listClass', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229077348359, 1689181229010239512, 'is_default', '是否默认（Y是 N否）', 'char(1)', 'String', 'isDefault', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'usr_logic', 8, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229077348360, 1689181229010239512, 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229077348361, 1689181229010239512, 'create_by', '创建者', 'bigint', 'Long', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 10, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229077348362, 1689181229010239512, 'create_dept', '创建部门', 'bigint', 'Long', 'createDept', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 11, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229077348363, 1689181229010239512, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, '1', '1', 'BETWEEN', 'datetime', '', 12, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229077348364, 1689181229010239512, 'update_by', '更新者', 'bigint', 'Long', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 13, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229077348365, 1689181229010239512, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'datetime', '', 14, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229077348366, 1689181229010239512, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 15, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229077348368, 1689181229077348367, 'menu_id', '菜单ID', 'bigint', 'Long', 'menuId', '1', '0', '1', NULL, '1', '1', '1', 'EQ', 'input', '', 1, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229077348369, 1689181229077348367, 'menu_name', '菜单名称', 'varchar(50)', 'String', 'menuName', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229077348370, 1689181229077348367, 'parent_id', '父菜单ID', 'bigint', 'Long', 'parentId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229077348371, 1689181229077348367, 'order_num', '显示顺序', 'int', 'Long', 'orderNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229077348372, 1689181229077348367, 'path', '路由地址', 'varchar(200)', 'String', 'path', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229077348373, 1689181229077348367, 'component', '组件路径', 'varchar(255)', 'String', 'component', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229077348374, 1689181229077348367, 'query_param', '路由参数', 'varchar(255)', 'String', 'queryParam', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229077348375, 1689181229077348367, 'is_frame', '是否为外链（0是 1否）', 'tinyint(1)', 'Integer', 'isFrame', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'usr_logic', 8, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229077348376, 1689181229077348367, 'is_cache', '是否缓存（0缓存 1不缓存）', 'tinyint(1)', 'Integer', 'isCache', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'usr_logic', 9, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229077348377, 1689181229077348367, 'menu_type', '菜单类型（M目录 C菜单 F按钮）', 'char(1)', 'String', 'menuType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229077348378, 1689181229077348367, 'visible', '菜单状态（0显示 1隐藏）', 'char(1)', 'String', 'visible', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229077348379, 1689181229077348367, 'status', '菜单状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229077348380, 1689181229077348367, 'perms', '权限标识', 'varchar(100)', 'String', 'perms', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229077348381, 1689181229077348367, 'icon', '菜单图标', 'varchar(100)', 'String', 'icon', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229077348382, 1689181229077348367, 'create_by', '创建者', 'bigint', 'Long', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 15, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229077348383, 1689181229077348367, 'create_dept', '创建部门', 'bigint', 'Long', 'createDept', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 16, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229077348384, 1689181229077348367, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, '1', '1', 'BETWEEN', 'datetime', '', 17, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229077348385, 1689181229077348367, 'update_by', '更新者', 'bigint', 'Long', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 18, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229077348386, 1689181229077348367, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'datetime', '', 19, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229077348387, 1689181229077348367, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 20, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229144457219, 1689181229144457218, 'oper_id', '日志主键', 'bigint', 'Long', 'operId', '1', '0', '1', NULL, '1', '1', '1', 'EQ', 'input', '', 1, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229144457220, 1689181229144457218, 'title', '模块标题', 'varchar(50)', 'String', 'title', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229144457221, 1689181229144457218, 'business_type', '业务类型（0其它 1新增 2修改 3删除）', 'int', 'Long', 'businessType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229144457222, 1689181229144457218, 'method', '方法名称', 'varchar(100)', 'String', 'method', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229144457223, 1689181229144457218, 'request_method', '请求方式', 'varchar(10)', 'String', 'requestMethod', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229144457224, 1689181229144457218, 'operator_type', '操作类别（0其它 1后台用户 2手机端用户）', 'int', 'Long', 'operatorType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229144457225, 1689181229144457218, 'oper_name', '操作人员', 'varchar(50)', 'String', 'operName', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229144457226, 1689181229144457218, 'dept_name', '部门名称', 'varchar(50)', 'String', 'deptName', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229144457227, 1689181229144457218, 'oper_url', '请求URL', 'varchar(255)', 'String', 'operUrl', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229144457228, 1689181229144457218, 'oper_ip', '主机地址', 'varchar(128)', 'String', 'operIp', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229144457229, 1689181229144457218, 'oper_location', '操作地点', 'varchar(255)', 'String', 'operLocation', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229144457230, 1689181229144457218, 'oper_param', '请求参数', 'text', 'String', 'operParam', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 12, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229144457231, 1689181229144457218, 'json_result', '返回参数', 'text', 'String', 'jsonResult', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 13, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229144457232, 1689181229144457218, 'status', '操作状态（0正常 1异常）', 'int', 'Long', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229144457233, 1689181229144457218, 'error_msg', '错误消息', 'varchar(2000)', 'String', 'errorMsg', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 15, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229144457234, 1689181229144457218, 'oper_time', '操作时间', 'datetime', 'Date', 'operTime', '0', '0', NULL, '1', '1', '1', '1', 'BETWEEN', 'datetime', '', 16, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229144457235, 1689181229144457218, 'cost_time', '消耗时间', 'bigint', 'Long', 'costTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 17, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229144457237, 1689181229144457236, 'oss_id', '对象存储主键', 'bigint', 'Long', 'ossId', '1', '0', '1', NULL, '1', '1', '1', 'EQ', 'input', '', 1, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229144457238, 1689181229144457236, 'file_name', '文件名', 'varchar(255)', 'String', 'fileName', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229144457239, 1689181229144457236, 'original_name', '原名', 'varchar(255)', 'String', 'originalName', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229144457240, 1689181229144457236, 'file_suffix', '文件后缀名', 'varchar(10)', 'String', 'fileSuffix', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229144457241, 1689181229144457236, 'url', 'URL地址', 'varchar(500)', 'String', 'url', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229144457242, 1689181229144457236, 'status', '状态', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229144457243, 1689181229144457236, 'create_dept', '创建部门', 'bigint', 'Long', 'createDept', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 7, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229144457244, 1689181229144457236, 'create_by', '上传人', 'bigint', 'Long', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 8, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229144457245, 1689181229144457236, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, '1', '1', 'BETWEEN', 'datetime', '', 9, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229144457246, 1689181229144457236, 'update_by', '更新人', 'bigint', 'Long', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 10, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229144457247, 1689181229144457236, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'datetime', '', 11, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229144457248, 1689181229144457236, 'service', '服务商', 'varchar(20)', 'String', 'service', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 12, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229207371778, 1689181229207371777, 'post_id', '岗位ID', 'bigint', 'Long', 'postId', '1', '0', '1', NULL, '1', '1', '1', 'EQ', 'input', '', 1, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229207371779, 1689181229207371777, 'post_code', '岗位编码', 'varchar(64)', 'String', 'postCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229207371780, 1689181229207371777, 'post_name', '岗位名称', 'varchar(50)', 'String', 'postName', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229207371781, 1689181229207371777, 'post_sort', '显示顺序', 'int', 'Long', 'postSort', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229207371782, 1689181229207371777, 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229207371783, 1689181229207371777, 'create_by', '创建者', 'bigint', 'Long', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 6, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229207371784, 1689181229207371777, 'create_dept', '创建部门', 'bigint', 'Long', 'createDept', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 7, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229207371785, 1689181229207371777, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, '1', '1', 'BETWEEN', 'datetime', '', 8, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229207371786, 1689181229207371777, 'update_by', '更新者', 'bigint', 'Long', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 9, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229207371787, 1689181229207371777, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'datetime', '', 10, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229207371788, 1689181229207371777, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 11, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229207371790, 1689181229207371789, 'role_id', '角色ID', 'bigint', 'Long', 'roleId', '1', '0', '1', NULL, '1', '1', '1', 'EQ', 'input', '', 1, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229207371791, 1689181229207371789, 'role_name', '角色名称', 'varchar(30)', 'String', 'roleName', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229207371792, 1689181229207371789, 'role_key', '角色权限字符串', 'varchar(100)', 'String', 'roleKey', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229207371793, 1689181229207371789, 'role_sort', '显示顺序', 'int', 'Long', 'roleSort', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229207371794, 1689181229207371789, 'data_scope', '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）', 'char(1)', 'String', 'dataScope', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229207371795, 1689181229207371789, 'menu_check_strictly', '菜单树选择项是否关联显示', 'tinyint(1)', 'Integer', 'menuCheckStrictly', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'usr_logic', 6, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229207371796, 1689181229207371789, 'dept_check_strictly', '部门树选择项是否关联显示', 'tinyint(1)', 'Integer', 'deptCheckStrictly', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'usr_logic', 7, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229207371797, 1689181229207371789, 'status', '角色状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229207371798, 1689181229207371789, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 9, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229207371799, 1689181229207371789, 'create_by', '创建者', 'bigint', 'Long', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 10, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229207371800, 1689181229207371789, 'create_dept', '创建部门', 'bigint', 'Long', 'createDept', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 11, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229207371801, 1689181229207371789, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, '1', '1', 'BETWEEN', 'datetime', '', 12, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229207371802, 1689181229207371789, 'update_by', '更新者', 'bigint', 'Long', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 13, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229207371803, 1689181229207371789, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'datetime', '', 14, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229207371804, 1689181229207371789, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 15, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229274480641, 1689181229207371805, 'id', '主键', 'bigint', 'Long', 'id', '1', '0', '1', NULL, '1', '1', '1', 'EQ', 'input', '', 1, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229274480642, 1689181229207371805, 'user_id', '用户ID', 'bigint', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229274480643, 1689181229207371805, 'tenant_id', '租户id', 'varchar(20)', 'String', 'tenantId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229274480644, 1689181229207371805, 'auth_id', '平台+平台唯一id', 'varchar(255)', 'String', 'authId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229274480645, 1689181229207371805, 'source', '用户来源', 'varchar(255)', 'String', 'source', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229274480646, 1689181229207371805, 'open_id', '平台编号唯一id', 'varchar(255)', 'String', 'openId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229274480647, 1689181229207371805, 'username', '登录账号', 'varchar(50)', 'String', 'username', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229274480648, 1689181229207371805, 'nickname', '用户昵称', 'varchar(50)', 'String', 'nickname', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229274480649, 1689181229207371805, 'email', '用户邮箱', 'varchar(255)', 'String', 'email', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229274480650, 1689181229207371805, 'avatar', '头像地址', 'varchar(500)', 'String', 'avatar', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'imageUpload', '', 10, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229274480651, 1689181229207371805, 'access_token', '用户的授权令牌', 'varchar(255)', 'String', 'accessToken', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 11, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229274480652, 1689181229207371805, 'expire_in', '用户的授权令牌的有效期，部分平台可能没有', 'int', 'Long', 'expireIn', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229274480653, 1689181229207371805, 'refresh_token', '刷新令牌，部分平台可能没有', 'varchar(255)', 'String', 'refreshToken', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229274480654, 1689181229207371805, 'access_code', '平台的授权信息，部分平台可能没有', 'varchar(255)', 'String', 'accessCode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229274480655, 1689181229207371805, 'union_id', '用户的 unionid', 'varchar(255)', 'String', 'unionId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 15, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229274480656, 1689181229207371805, 'scope', '授予的权限，部分平台可能没有', 'varchar(255)', 'String', 'scope', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 16, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229274480657, 1689181229207371805, 'token_type', '个别平台的授权信息，部分平台可能没有', 'varchar(255)', 'String', 'tokenType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 17, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229274480658, 1689181229207371805, 'id_token', 'id token，部分平台可能没有', 'varchar(255)', 'String', 'idToken', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 18, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229274480659, 1689181229207371805, 'mac_algorithm', '小米平台用户的附带属性，部分平台可能没有', 'varchar(255)', 'String', 'macAlgorithm', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 19, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229274480660, 1689181229207371805, 'mac_key', '小米平台用户的附带属性，部分平台可能没有', 'varchar(255)', 'String', 'macKey', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 20, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229274480661, 1689181229207371805, 'code', '用户的授权code，部分平台可能没有', 'varchar(255)', 'String', 'code', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 21, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229274480662, 1689181229207371805, 'oauth_token', 'Twitter平台用户的附带属性，部分平台可能没有', 'varchar(255)', 'String', 'oauthToken', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 22, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229274480663, 1689181229207371805, 'oauth_token_secret', 'Twitter平台用户的附带属性，部分平台可能没有', 'varchar(255)', 'String', 'oauthTokenSecret', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 23, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229274480664, 1689181229207371805, 'create_dept', '创建部门', 'bigint', 'Long', 'createDept', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 24, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229274480665, 1689181229207371805, 'create_by', '创建者', 'bigint', 'Long', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 25, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229274480666, 1689181229207371805, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, '1', '1', 'BETWEEN', 'datetime', '', 26, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229274480667, 1689181229207371805, 'update_by', '更新者', 'bigint', 'Long', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 27, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229274480668, 1689181229207371805, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'datetime', '', 28, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181229274480669, 1689181229207371805, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 29, 1, 103, '2023-08-09 15:46:03', 1, '2023-08-09 15:46:03');
INSERT INTO `gen_table_column` VALUES (1689181248442449922, 1689181248442449921, 'id', 'id', 'bigint', 'Long', 'id', '1', '0', '1', NULL, '1', '1', '1', 'EQ', 'input', '', 1, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248442449923, 1689181248442449921, 'type', '客户端类型', 'char(1)', 'String', 'type', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248442449924, 1689181248442449921, 'error_type', '错误类型', 'varchar(30)', 'String', 'errorType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248442449925, 1689181248442449921, 'uid', '用户id', 'bigint', 'Long', 'uid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248442449926, 1689181248442449921, 'nickname', '昵称', 'varchar(255)', 'String', 'nickname', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248442449927, 1689181248442449921, 'avatar', '头像', 'varchar(255)', 'String', 'avatar', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'imageUpload', '', 6, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248442449928, 1689181248442449921, 'url', '路径', 'varchar(255)', 'String', 'url', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248442449929, 1689181248442449921, 'method', '方法', 'varchar(30)', 'String', 'method', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248442449930, 1689181248442449921, 'args', '参数', 'text', 'String', 'args', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 9, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248442449931, 1689181248442449921, 'error', '错误信息', 'text', 'String', 'error', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 10, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248442449932, 1689181248442449921, 'create_by', '创建人', 'bigint', 'Long', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 11, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248442449933, 1689181248442449921, 'create_dept', '创建部门', 'bigint', 'Long', 'createDept', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 12, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248442449934, 1689181248442449921, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, '1', '1', 'BETWEEN', 'datetime', '', 13, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248442449935, 1689181248442449921, 'update_by', '修改人', 'bigint', 'Long', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 14, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248442449936, 1689181248442449921, 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'datetime', '', 15, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248442449937, 1689181248442449921, 'del_flag', '逻辑删除', 'char(1)', 'String', 'delFlag', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 16, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248442449938, 1689181248442449921, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 17, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248442449940, 1689181248442449939, 'id', '商品id', 'bigint', 'Long', 'id', '1', '0', '1', NULL, '1', '1', '1', 'EQ', 'input', '', 1, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:00:44');
INSERT INTO `gen_table_column` VALUES (1689181248442449941, 1689181248442449939, 'pcode', '归属编号', 'varchar(100)', 'String', 'pcode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:00:44');
INSERT INTO `gen_table_column` VALUES (1689181248442449942, 1689181248442449939, 'code', '编号', 'varchar(30)', 'String', 'code', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:00:44');
INSERT INTO `gen_table_column` VALUES (1689181248442449943, 1689181248442449939, 'classify', '分类', 'varchar(20)', 'String', 'classify', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:00:44');
INSERT INTO `gen_table_column` VALUES (1689181248442449944, 1689181248442449939, 'goods_name', '名称', 'varchar(100)', 'String', 'goodsName', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:00:44');
INSERT INTO `gen_table_column` VALUES (1689181248442449945, 1689181248442449939, 'main_img', '主图', 'varchar(255)', 'String', 'mainImg', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'imageUpload', '', 6, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:00:44');
INSERT INTO `gen_table_column` VALUES (1689181248442449946, 1689181248442449939, 'shop_id', '店铺id', 'bigint', 'Long', 'shopId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:00:44');
INSERT INTO `gen_table_column` VALUES (1689181248442449947, 1689181248442449939, 'mid', '菜单id', 'bigint', 'Long', 'mid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:00:44');
INSERT INTO `gen_table_column` VALUES (1689181248442449948, 1689181248442449939, 'fu_img', '副图', 'text', 'String', 'fuImg', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'imageUpload', '', 9, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:00:44');
INSERT INTO `gen_table_column` VALUES (1689181248442449949, 1689181248442449939, 'property', '属性', 'varchar(100)', 'String', 'property', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:00:44');
INSERT INTO `gen_table_column` VALUES (1689181248442449950, 1689181248442449939, 'ga', '规格A', 'varchar(20)', 'String', 'ga', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:00:44');
INSERT INTO `gen_table_column` VALUES (1689181248442449951, 1689181248442449939, 'gb', '规格B', 'varchar(20)', 'String', 'gb', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:00:44');
INSERT INTO `gen_table_column` VALUES (1689181248442449952, 1689181248442449939, 'gad', '默规A', 'varchar(30)', 'String', 'gad', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:00:44');
INSERT INTO `gen_table_column` VALUES (1689181248442449953, 1689181248442449939, 'gbd', '默规B', 'varchar(30)', 'String', 'gbd', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:00:44');
INSERT INTO `gen_table_column` VALUES (1689181248442449954, 1689181248442449939, 'tags', '标签', 'varchar(100)', 'String', 'tags', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 15, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:00:44');
INSERT INTO `gen_table_column` VALUES (1689181248442449955, 1689181248442449939, 'description', '描述', 'blob', 'String', 'description', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 16, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:00:44');
INSERT INTO `gen_table_column` VALUES (1689181248442449956, 1689181248442449939, 'origin_price', '原价', 'decimal(10,2)', 'BigDecimal', 'originPrice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 17, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:00:44');
INSERT INTO `gen_table_column` VALUES (1689181248442449957, 1689181248442449939, 'discount', '打折', 'decimal(10,2)', 'BigDecimal', 'discount', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 18, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:00:44');
INSERT INTO `gen_table_column` VALUES (1689181248442449958, 1689181248442449939, 'price', '价格', 'decimal(10,2)', 'BigDecimal', 'price', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 19, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:00:44');
INSERT INTO `gen_table_column` VALUES (1689181248509558786, 1689181248442449939, 'total', '总量', 'bigint', 'Long', 'total', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 20, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:00:44');
INSERT INTO `gen_table_column` VALUES (1689181248509558787, 1689181248442449939, 'is_day_limit', '是否日限制', 'char(1)', 'String', 'isDayLimit', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'usr_logic', 21, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:00:44');
INSERT INTO `gen_table_column` VALUES (1689181248509558788, 1689181248442449939, 'day_limit_num', '日限制量', 'bigint', 'Long', 'dayLimitNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 22, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:00:44');
INSERT INTO `gen_table_column` VALUES (1689181248509558789, 1689181248442449939, 'is_display', '是否展示', 'char(1)', 'String', 'isDisplay', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'usr_logic', 23, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:00:44');
INSERT INTO `gen_table_column` VALUES (1689181248509558790, 1689181248442449939, 'is_putaway', '是否下架', 'char(1)', 'String', 'isPutaway', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'usr_logic', 24, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:00:44');
INSERT INTO `gen_table_column` VALUES (1689181248509558791, 1689181248442449939, 'position', '顺序', 'bigint', 'Long', 'position', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 25, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:00:44');
INSERT INTO `gen_table_column` VALUES (1689181248509558792, 1689181248442449939, 'score', '评分', 'decimal(2,1)', 'BigDecimal', 'score', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 26, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:00:44');
INSERT INTO `gen_table_column` VALUES (1689181248509558793, 1689181248442449939, 'comment_num', '评价数', 'bigint', 'Long', 'commentNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 27, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:00:44');
INSERT INTO `gen_table_column` VALUES (1689181248509558794, 1689181248442449939, 'zan', '好评数', 'bigint', 'Long', 'zan', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 28, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:00:44');
INSERT INTO `gen_table_column` VALUES (1689181248509558795, 1689181248442449939, 'month_sale', '月销', 'bigint', 'Long', 'monthSale', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 29, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:00:44');
INSERT INTO `gen_table_column` VALUES (1689181248509558796, 1689181248442449939, 'total_sale', '总销', 'bigint', 'Long', 'totalSale', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 30, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:00:44');
INSERT INTO `gen_table_column` VALUES (1689181248509558797, 1689181248442449939, 'weight', '权重', 'bigint', 'Long', 'weight', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 31, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:00:44');
INSERT INTO `gen_table_column` VALUES (1689181248509558798, 1689181248442449939, 'is_check', '审核状态', 'char(1)', 'String', 'isCheck', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'usr_logic', 32, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:00:44');
INSERT INTO `gen_table_column` VALUES (1689181248509558799, 1689181248442449939, 'reject_item', '驳回项', 'varchar(100)', 'String', 'rejectItem', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 33, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:00:44');
INSERT INTO `gen_table_column` VALUES (1689181248509558800, 1689181248442449939, 'reject_reason', '驳回原因', 'varchar(255)', 'String', 'rejectReason', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 34, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:00:44');
INSERT INTO `gen_table_column` VALUES (1689181248509558801, 1689181248442449939, 'del_flag', '逻辑删除', 'char(1)', 'String', 'delFlag', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 35, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:00:44');
INSERT INTO `gen_table_column` VALUES (1689181248509558802, 1689181248442449939, 'create_by', '创建人', 'bigint', 'Long', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 36, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:00:44');
INSERT INTO `gen_table_column` VALUES (1689181248509558803, 1689181248442449939, 'create_dept', '创建部门', 'bigint', 'Long', 'createDept', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 37, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:00:44');
INSERT INTO `gen_table_column` VALUES (1689181248509558804, 1689181248442449939, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, '1', '1', 'BETWEEN', 'datetime', '', 38, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:00:44');
INSERT INTO `gen_table_column` VALUES (1689181248509558805, 1689181248442449939, 'update_by', '修改人', 'bigint', 'Long', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 39, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:00:44');
INSERT INTO `gen_table_column` VALUES (1689181248509558806, 1689181248442449939, 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'datetime', '', 40, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:00:44');
INSERT INTO `gen_table_column` VALUES (1689181248509558807, 1689181248442449939, 'remark', '备注', 'varchar(200)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 41, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:00:44');
INSERT INTO `gen_table_column` VALUES (1689181248509558809, 1689181248509558808, 'id', '主键id', 'bigint', 'Long', 'id', '1', '0', '1', NULL, '1', '1', '1', 'EQ', 'input', '', 1, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248509558810, 1689181248509558808, 'pcode', '归属编号', 'varchar(30)', 'String', 'pcode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248509558811, 1689181248509558808, 'shop_id', '店铺id', 'bigint', 'Long', 'shopId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248509558812, 1689181248509558808, 'name', '名称', 'varchar(20)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248509558813, 1689181248509558808, 'position', '顺序', 'bigint', 'Long', 'position', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248509558814, 1689181248509558808, 'create_by', '创建人', 'bigint', 'Long', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 6, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248509558815, 1689181248509558808, 'create_dept', '创建部门', 'bigint', 'Long', 'createDept', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 7, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248509558816, 1689181248509558808, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, '1', '1', 'BETWEEN', 'datetime', '', 8, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248509558817, 1689181248509558808, 'update_by', '修改人', 'bigint', 'Long', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 9, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248509558818, 1689181248509558808, 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'datetime', '', 10, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248509558819, 1689181248509558808, 'del_flag', '逻辑删除', 'char(1)', 'String', 'delFlag', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 11, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248509558820, 1689181248509558808, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248572473347, 1689181248572473346, 'id', 'id', 'bigint', 'Long', 'id', '1', '0', '1', NULL, '1', '1', '1', 'EQ', 'input', '', 1, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248572473348, 1689181248572473346, 'appid', 'appid', 'varchar(100)', 'String', 'appid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248572473349, 1689181248572473346, 'type', '通知类型', 'varchar(100)', 'String', 'type', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248572473350, 1689181248572473346, 'model_id', '模板ID', 'varchar(100)', 'String', 'modelId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248572473351, 1689181248572473346, 'option_one_title', '选择一标题', 'varchar(50)', 'String', 'optionOneTitle', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248572473352, 1689181248572473346, 'option_one_key', '选项一键', 'varchar(50)', 'String', 'optionOneKey', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248572473353, 1689181248572473346, 'option_one_value', '选项一值', 'varchar(255)', 'String', 'optionOneValue', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248572473354, 1689181248572473346, 'option_second_title', '选择二标题', 'varchar(50)', 'String', 'optionSecondTitle', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248572473355, 1689181248572473346, 'option_second_key', '选项二键', 'varchar(50)', 'String', 'optionSecondKey', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248572473356, 1689181248572473346, 'option_second_value', '选项二值', 'varchar(255)', 'String', 'optionSecondValue', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248572473357, 1689181248572473346, 'option_third_title', '选择三标题', 'varchar(50)', 'String', 'optionThirdTitle', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248572473358, 1689181248572473346, 'option_third_key', '选项三键', 'varchar(50)', 'String', 'optionThirdKey', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248572473359, 1689181248572473346, 'option_third_value', '选项三值', 'varchar(255)', 'String', 'optionThirdValue', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248572473360, 1689181248572473346, 'option_forth_title', '选择四标题', 'varchar(50)', 'String', 'optionForthTitle', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248572473361, 1689181248572473346, 'option_forth_key', '选项四键', 'varchar(50)', 'String', 'optionForthKey', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 15, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248572473362, 1689181248572473346, 'option_forth_value', '选项四值', 'varchar(255)', 'String', 'optionForthValue', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 16, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248572473363, 1689181248572473346, 'jump', '跳转页面', 'varchar(255)', 'String', 'jump', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 17, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248572473364, 1689181248572473346, 'del_flag', '逻辑删除', 'char(1)', 'String', 'delFlag', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 18, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248572473365, 1689181248572473346, 'create_by', '创建人', 'bigint', 'Long', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 19, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248572473366, 1689181248572473346, 'create_dept', '创建部门', 'bigint', 'Long', 'createDept', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 20, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248572473367, 1689181248572473346, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, '1', '1', 'BETWEEN', 'datetime', '', 21, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248572473368, 1689181248572473346, 'update_by', '修改人', 'bigint', 'Long', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 22, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248572473369, 1689181248572473346, 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'datetime', '', 23, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248572473370, 1689181248572473346, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 24, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248572473372, 1689181248572473371, 'id', '主键id', 'bigint', 'Long', 'id', '1', '0', '1', NULL, '1', '1', '1', 'EQ', 'input', '', 1, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248572473373, 1689181248572473371, 'pcode', '归属编号', 'varchar(30)', 'String', 'pcode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248639582210, 1689181248572473371, 'type', '类型', 'varchar(50)', 'String', 'type', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248639582211, 1689181248572473371, 'title', '标题', 'varchar(255)', 'String', 'title', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248639582212, 1689181248572473371, 'content', '内容', 'text', 'String', 'content', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248639582213, 1689181248572473371, 'detail', '详情', 'varchar(255)', 'String', 'detail', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248639582214, 1689181248572473371, 'img', '图片', 'varchar(255)', 'String', 'img', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'imageUpload', '', 7, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248639582215, 1689181248572473371, 'position', '顺序', 'bigint', 'Long', 'position', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248639582216, 1689181248572473371, 'is_display', '是否可见', 'char(1)', 'String', 'isDisplay', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'usr_logic', 9, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248639582217, 1689181248572473371, 'create_by', '创建人', 'bigint', 'Long', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 10, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248639582218, 1689181248572473371, 'create_dept', '创建部门', 'bigint', 'Long', 'createDept', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 11, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248639582219, 1689181248572473371, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, '1', '1', 'BETWEEN', 'datetime', '', 12, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248639582220, 1689181248572473371, 'update_by', '修改人', 'bigint', 'Long', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 13, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248639582221, 1689181248572473371, 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'datetime', '', 14, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248639582222, 1689181248572473371, 'del_flag', '逻辑删除', 'char(1)', 'String', 'delFlag', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 15, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248639582223, 1689181248572473371, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 16, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248639582225, 1689181248639582224, 'id', '订单id', 'bigint', 'Long', 'id', '1', '0', '1', NULL, '1', '1', '1', 'EQ', 'input', '', 1, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248639582226, 1689181248639582224, 'pcode', '归属编号', 'varchar(30)', 'String', 'pcode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248639582227, 1689181248639582224, 'uid', '用户id', 'bigint', 'Long', 'uid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248639582228, 1689181248639582224, 'order_no', '订单编号', 'char(19)', 'String', 'orderNo', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248639582229, 1689181248639582224, 'type', '订单类型', 'varchar(20)', 'String', 'type', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248639582230, 1689181248639582224, 'description', '订单描述', 'text', 'String', 'description', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 6, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248639582231, 1689181248639582224, 'shop_id', '店铺id', 'bigint', 'Long', 'shopId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248639582232, 1689181248639582224, 'goods_id', '商品id', 'bigint', 'Long', 'goodsId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248639582233, 1689181248639582224, 'goods_name', '商品名称', 'varchar(100)', 'String', 'goodsName', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248639582234, 1689181248639582224, 'goods_img', '商品主图', 'varchar(255)', 'String', 'goodsImg', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'imageUpload', '', 10, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248639582235, 1689181248639582224, 'gad', '规格A', 'varchar(30)', 'String', 'gad', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248639582236, 1689181248639582224, 'gbd', '规格B', 'varchar(30)', 'String', 'gbd', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248639582237, 1689181248639582224, 'goods_price', '商品价格', 'decimal(20,2)', 'BigDecimal', 'goodsPrice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248639582238, 1689181248639582224, 'goods_num', '购买数量', 'bigint', 'Long', 'goodsNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248639582239, 1689181248639582224, 'order_money', '订单金额', 'decimal(20,2)', 'BigDecimal', 'orderMoney', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 15, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248639582240, 1689181248639582224, 'order_time', '订单时间', 'datetime', 'Date', 'orderTime', '0', '0', NULL, '1', '1', '1', '1', 'BETWEEN', 'datetime', '', 16, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248639582241, 1689181248639582224, 'pay_money', '实付金额', 'decimal(20,2)', 'BigDecimal', 'payMoney', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 17, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248639582242, 1689181248639582224, 'pay_time', '支付时间', 'datetime', 'Date', 'payTime', '0', '0', NULL, '1', '1', '1', '1', 'BETWEEN', 'datetime', '', 18, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248639582243, 1689181248639582224, 'transaction_id', '交易流水号', 'varchar(30)', 'String', 'transactionId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 19, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248639582244, 1689181248639582224, 'is_cancel', '是否取消', 'char(1)', 'String', 'isCancel', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'usr_logic', 20, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248639582245, 1689181248639582224, 'is_del', '是否删除', 'char(1)', 'String', 'isDel', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'usr_logic', 21, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248639582246, 1689181248639582224, 'is_pay', '是否支付', 'char(1)', 'String', 'isPay', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'usr_logic', 22, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248639582247, 1689181248639582224, 'is_deliver', '是否发货', 'char(1)', 'String', 'isDeliver', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'usr_logic', 23, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248639582248, 1689181248639582224, 'deliver_time', '发货时间', 'datetime', 'Date', 'deliverTime', '0', '0', NULL, '1', '1', '1', '1', 'BETWEEN', 'datetime', '', 24, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248639582249, 1689181248639582224, 'is_receive', '是否收货', 'char(1)', 'String', 'isReceive', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'usr_logic', 25, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248639582250, 1689181248639582224, 'is_comment', '是否评论', 'char(1)', 'String', 'isComment', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'usr_logic', 26, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248639582251, 1689181248639582224, 'receive_time', '收货时间', 'datetime', 'Date', 'receiveTime', '0', '0', NULL, '1', '1', '1', '1', 'BETWEEN', 'datetime', '', 27, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248639582252, 1689181248639582224, 'name', '收货人昵称', 'varchar(20)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 28, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248639582253, 1689181248639582224, 'tel', '收货人电话', 'varchar(20)', 'String', 'tel', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 29, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248639582254, 1689181248639582224, 'area', '收货人所在地', 'varchar(100)', 'String', 'area', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 30, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248639582255, 1689181248639582224, 'address', '收货人地址', 'varchar(255)', 'String', 'address', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 31, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248639582256, 1689181248639582224, 'buy_remark', '购买备注', 'varchar(255)', 'String', 'buyRemark', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 32, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248639582257, 1689181248639582224, 'remark', '备注', 'varchar(200)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 33, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248639582258, 1689181248639582224, 'is_sh', '是否售后', 'char(1)', 'String', 'isSh', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'usr_logic', 34, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248639582259, 1689181248639582224, 'sh_time', '售后发起时间', 'datetime', 'Date', 'shTime', '0', '0', NULL, '1', '1', '1', '1', 'BETWEEN', 'datetime', '', 35, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248639582260, 1689181248639582224, 'sh_reason', '售后原因', 'varchar(255)', 'String', 'shReason', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 36, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248639582261, 1689181248639582224, 'is_sh_deal', '售后是否解决', 'char(1)', 'String', 'isShDeal', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'usr_logic', 37, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248639582262, 1689181248639582224, 'sh_deal_time', '售后解决时间', 'datetime', 'Date', 'shDealTime', '0', '0', NULL, '1', '1', '1', '1', 'BETWEEN', 'datetime', '', 38, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248639582263, 1689181248639582224, 'deal_remark', '解决备注', 'varchar(255)', 'String', 'dealRemark', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 39, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248639582264, 1689181248639582224, 'is_js', '是否结算', 'char(1)', 'String', 'isJs', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'usr_logic', 40, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248639582265, 1689181248639582224, 'js_time', '结算时间', 'datetime', 'Date', 'jsTime', '0', '0', NULL, '1', '1', '1', '1', 'BETWEEN', 'datetime', '', 41, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248639582266, 1689181248639582224, 'create_by', '创建人', 'bigint', 'Long', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 42, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248639582267, 1689181248639582224, 'create_dept', '创建部门', 'bigint', 'Long', 'createDept', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 43, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248639582268, 1689181248639582224, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, '1', '1', 'BETWEEN', 'datetime', '', 44, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248706691074, 1689181248639582224, 'update_by', '修改人', 'bigint', 'Long', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 45, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248706691075, 1689181248639582224, 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'datetime', '', 46, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248706691076, 1689181248639582224, 'del_flag', '逻辑删除', 'char(1)', 'String', 'delFlag', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 47, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 12:34:04');
INSERT INTO `gen_table_column` VALUES (1689181248706691078, 1689181248706691077, 'id', 'id', 'bigint', 'Long', 'id', '1', '0', '1', NULL, '1', '1', '1', 'EQ', 'input', '', 1, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:41:22');
INSERT INTO `gen_table_column` VALUES (1689181248706691079, 1689181248706691077, 'uid', '用户id', 'bigint', 'Long', 'uid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:41:22');
INSERT INTO `gen_table_column` VALUES (1689181248706691080, 1689181248706691077, 'pcode', '归属编号', 'varchar(30)', 'String', 'pcode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:41:22');
INSERT INTO `gen_table_column` VALUES (1689181248706691081, 1689181248706691077, 'enter_type', '入驻类型', 'varchar(10)', 'String', 'enterType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:41:22');
INSERT INTO `gen_table_column` VALUES (1689181248706691082, 1689181248706691077, 'shop_name', '店铺名称', 'varchar(30)', 'String', 'shopName', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:41:22');
INSERT INTO `gen_table_column` VALUES (1689181248706691083, 1689181248706691077, 'shop_logo', '店铺logo', 'varchar(255)', 'String', 'shopLogo', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'imageUpload', '', 6, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:41:22');
INSERT INTO `gen_table_column` VALUES (1689181248706691084, 1689181248706691077, 'shop_bg', '店铺背景图', 'varchar(255)', 'String', 'shopBg', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'imageUpload', '', 7, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:41:22');
INSERT INTO `gen_table_column` VALUES (1689181248706691085, 1689181248706691077, 'imgs', '店铺环境图', 'text', 'String', 'imgs', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'imageUpload', '', 8, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:41:22');
INSERT INTO `gen_table_column` VALUES (1689181248706691086, 1689181248706691077, 'label', '店铺标签', 'varchar(50)', 'String', 'label', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:41:22');
INSERT INTO `gen_table_column` VALUES (1689181248706691087, 1689181248706691077, 'address', '地址', 'varchar(255)', 'String', 'address', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:41:22');
INSERT INTO `gen_table_column` VALUES (1689181248706691088, 1689181248706691077, 'tel', '电话', 'varchar(20)', 'String', 'tel', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:41:22');
INSERT INTO `gen_table_column` VALUES (1689181248706691089, 1689181248706691077, 'longitude', '经度', 'decimal(10,6)', 'BigDecimal', 'longitude', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:41:22');
INSERT INTO `gen_table_column` VALUES (1689181248706691090, 1689181248706691077, 'latitude', '纬度', 'decimal(10,6)', 'BigDecimal', 'latitude', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:41:22');
INSERT INTO `gen_table_column` VALUES (1689181248706691091, 1689181248706691077, 'send_fee', '配送费', 'decimal(10,2)', 'BigDecimal', 'sendFee', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:41:22');
INSERT INTO `gen_table_column` VALUES (1689181248706691092, 1689181248706691077, 'send_time', '配送时间', 'varchar(100)', 'String', 'sendTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 15, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:41:22');
INSERT INTO `gen_table_column` VALUES (1689181248706691093, 1689181248706691077, 'intro', '店铺简介', 'varchar(500)', 'String', 'intro', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 16, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:41:22');
INSERT INTO `gen_table_column` VALUES (1689181248706691094, 1689181248706691077, 'notice', '公告', 'varchar(200)', 'String', 'notice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 17, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:41:22');
INSERT INTO `gen_table_column` VALUES (1689181248706691095, 1689181248706691077, 'kfs', '客服id', 'varchar(255)', 'String', 'kfs', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 18, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:41:22');
INSERT INTO `gen_table_column` VALUES (1689181248706691096, 1689181248706691077, 'score', '评分', 'decimal(2,1)', 'BigDecimal', 'score', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 19, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:41:22');
INSERT INTO `gen_table_column` VALUES (1689181248706691097, 1689181248706691077, 'comment_num', '评价数', 'bigint', 'Long', 'commentNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 20, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:41:22');
INSERT INTO `gen_table_column` VALUES (1689181248706691098, 1689181248706691077, 'month_sale', '月售', 'bigint', 'Long', 'monthSale', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 21, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:41:22');
INSERT INTO `gen_table_column` VALUES (1689181248706691099, 1689181248706691077, 'total_sale', '总销', 'bigint', 'Long', 'totalSale', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 22, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:41:22');
INSERT INTO `gen_table_column` VALUES (1689181248706691100, 1689181248706691077, 'weight', '权重', 'bigint', 'Long', 'weight', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 23, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:41:22');
INSERT INTO `gen_table_column` VALUES (1689181248706691101, 1689181248706691077, 'ratio', '抽成比例', 'decimal(10,2)', 'BigDecimal', 'ratio', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 24, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:41:22');
INSERT INTO `gen_table_column` VALUES (1689181248706691102, 1689181248706691077, 'is_apply_js', '是否申请结算', 'char(1)', 'String', 'isApplyJs', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'usr_logic', 25, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:41:22');
INSERT INTO `gen_table_column` VALUES (1689181248706691103, 1689181248706691077, 'is_putaway', '是否下架', 'char(1)', 'String', 'isPutaway', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'usr_logic', 26, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:41:22');
INSERT INTO `gen_table_column` VALUES (1689181248706691104, 1689181248706691077, 'putaway_reason', '下架原因', 'varchar(500)', 'String', 'putawayReason', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 27, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:41:22');
INSERT INTO `gen_table_column` VALUES (1689181248706691105, 1689181248706691077, 'putaway_uid', '下架处理用户id', 'bigint', 'Long', 'putawayUid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 28, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:41:22');
INSERT INTO `gen_table_column` VALUES (1689181248706691106, 1689181248706691077, 'putaway_time', '下架时间', 'datetime', 'Date', 'putawayTime', '0', '0', NULL, '1', '1', '1', '1', 'BETWEEN', 'datetime', '', 29, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:41:22');
INSERT INTO `gen_table_column` VALUES (1689181248706691107, 1689181248706691077, 'create_by', '创建人', 'bigint', 'Long', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 30, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:41:22');
INSERT INTO `gen_table_column` VALUES (1689181248706691108, 1689181248706691077, 'create_dept', '创建部门', 'bigint', 'Long', 'createDept', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 31, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:41:22');
INSERT INTO `gen_table_column` VALUES (1689181248706691109, 1689181248706691077, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, '1', '1', 'BETWEEN', 'datetime', '', 32, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:41:22');
INSERT INTO `gen_table_column` VALUES (1689181248706691110, 1689181248706691077, 'update_by', '修改人', 'bigint', 'Long', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 33, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:41:22');
INSERT INTO `gen_table_column` VALUES (1689181248706691111, 1689181248706691077, 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'datetime', '', 34, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:41:22');
INSERT INTO `gen_table_column` VALUES (1689181248706691112, 1689181248706691077, 'del_flag', '逻辑删除', 'char(1)', 'String', 'delFlag', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 35, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:41:22');
INSERT INTO `gen_table_column` VALUES (1689181248706691113, 1689181248706691077, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 36, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:41:22');
INSERT INTO `gen_table_column` VALUES (1689181248773799939, 1689181248773799938, 'id', '主键id', 'bigint', 'Long', 'id', '1', '0', '1', NULL, '1', '1', '1', 'EQ', 'input', '', 1, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:11:57');
INSERT INTO `gen_table_column` VALUES (1689181248773799940, 1689181248773799938, 'pcode', '归属编号', 'varchar(30)', 'String', 'pcode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:11:57');
INSERT INTO `gen_table_column` VALUES (1689181248773799941, 1689181248773799938, 'pid', '父id', 'bigint', 'Long', 'pid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:11:57');
INSERT INTO `gen_table_column` VALUES (1689181248773799942, 1689181248773799938, 'send_uid', '发送人', 'bigint', 'Long', 'sendUid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:11:57');
INSERT INTO `gen_table_column` VALUES (1689181248773799943, 1689181248773799938, 'uid', '接收人', 'bigint', 'Long', 'uid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:11:57');
INSERT INTO `gen_table_column` VALUES (1689181248773799944, 1689181248773799938, 'type', '类型', 'varchar(50)', 'String', 'type', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:11:57');
INSERT INTO `gen_table_column` VALUES (1689181248773799945, 1689181248773799938, 'title', '标题', 'varchar(100)', 'String', 'title', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:11:57');
INSERT INTO `gen_table_column` VALUES (1689181248773799946, 1689181248773799938, 'position', '顺序', 'bigint', 'Long', 'position', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:11:57');
INSERT INTO `gen_table_column` VALUES (1689181248773799947, 1689181248773799938, 'content', '消息', 'text', 'String', 'content', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 9, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:11:57');
INSERT INTO `gen_table_column` VALUES (1689181248773799948, 1689181248773799938, 'is_display', '是否可见', 'char(1)', 'String', 'isDisplay', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'usr_logic', 10, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:11:57');
INSERT INTO `gen_table_column` VALUES (1689181248773799949, 1689181248773799938, 'img', '图片', 'varchar(255)', 'String', 'img', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'imageUpload', '', 11, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:11:57');
INSERT INTO `gen_table_column` VALUES (1689181248773799950, 1689181248773799938, 'tip', '提示', 'varchar(30)', 'String', 'tip', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:11:57');
INSERT INTO `gen_table_column` VALUES (1689181248773799951, 1689181248773799938, 'path', '跳转路径', 'varchar(500)', 'String', 'path', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 13, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:11:57');
INSERT INTO `gen_table_column` VALUES (1689181248773799952, 1689181248773799938, 'isread', '是否已读', 'char(1)', 'String', 'isread', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'usr_logic', 14, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:11:57');
INSERT INTO `gen_table_column` VALUES (1689181248773799953, 1689181248773799938, 'create_by', '创建人', 'bigint', 'Long', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 15, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:11:57');
INSERT INTO `gen_table_column` VALUES (1689181248773799954, 1689181248773799938, 'create_dept', '创建部门', 'bigint', 'Long', 'createDept', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 16, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:11:57');
INSERT INTO `gen_table_column` VALUES (1689181248773799955, 1689181248773799938, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, '1', '1', 'BETWEEN', 'datetime', '', 17, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:11:57');
INSERT INTO `gen_table_column` VALUES (1689181248773799956, 1689181248773799938, 'update_by', '修改人', 'bigint', 'Long', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 18, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:11:57');
INSERT INTO `gen_table_column` VALUES (1689181248773799957, 1689181248773799938, 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'datetime', '', 19, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:11:57');
INSERT INTO `gen_table_column` VALUES (1689181248773799958, 1689181248773799938, 'del_flag', '逻辑删除', 'char(1)', 'String', 'delFlag', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 20, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:11:57');
INSERT INTO `gen_table_column` VALUES (1689181248773799959, 1689181248773799938, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 21, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-23 13:11:57');
INSERT INTO `gen_table_column` VALUES (1689181248773799961, 1689181248773799960, 'id', '主键id', 'bigint', 'Long', 'id', '1', '0', '1', NULL, '1', '1', '1', 'EQ', 'input', '', 1, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248773799962, 1689181248773799960, 'goods_id', '商品id', 'bigint', 'Long', 'goodsId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248773799963, 1689181248773799960, 'gad', '规A', 'varchar(30)', 'String', 'gad', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248773799964, 1689181248773799960, 'gbd', '规B', 'varchar(30)', 'String', 'gbd', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248773799965, 1689181248773799960, 'price', '价格', 'decimal(20,2)', 'BigDecimal', 'price', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248773799966, 1689181248773799960, 'is_default', '是否默认', 'char(1)', 'String', 'isDefault', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'usr_logic', 6, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248773799967, 1689181248773799960, 'is_expired', '是否过期', 'char(1)', 'String', 'isExpired', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'usr_logic', 7, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248773799968, 1689181248773799960, 'create_dept', '创建部门', 'bigint', 'Long', 'createDept', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 8, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248773799969, 1689181248773799960, 'create_by', '创建人', 'bigint', 'Long', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 9, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248773799970, 1689181248773799960, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, '1', '1', 'BETWEEN', 'datetime', '', 10, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248773799971, 1689181248773799960, 'update_by', '修改人', 'bigint', 'Long', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 11, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248773799972, 1689181248773799960, 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'datetime', '', 12, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248840908802, 1689181248773799960, 'del_flag', '逻辑删除', 'char(1)', 'String', 'delFlag', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 13, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248840908803, 1689181248773799960, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248840908805, 1689181248840908804, 'id', 'id', 'bigint', 'Long', 'id', '1', '0', '1', NULL, '1', '1', '1', 'EQ', 'input', '', 1, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248840908806, 1689181248840908804, 'create_dept', '创建部门', 'bigint', 'Long', 'createDept', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 2, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248840908807, 1689181248840908804, 'create_by', '创建人', 'bigint', 'Long', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 3, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248840908808, 1689181248840908804, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, '1', '1', 'BETWEEN', 'datetime', '', 4, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248840908809, 1689181248840908804, 'update_by', '修改人', 'bigint', 'Long', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 5, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248840908810, 1689181248840908804, 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'datetime', '', 6, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248840908811, 1689181248840908804, 'del_flag', '逻辑删除', 'char(1)', 'String', 'delFlag', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 7, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181248840908812, 1689181248840908804, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 1, 103, '2023-08-09 15:46:08', 1, '2023-08-09 15:46:08');
INSERT INTO `gen_table_column` VALUES (1689181262325596162, 1689181262325596161, 'id', 'id', 'bigint', 'Long', 'id', '1', '0', '1', NULL, '1', '1', '1', 'EQ', 'input', '', 1, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262325596163, 1689181262325596161, 'uid', '用户id', 'bigint', 'Long', 'uid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262325596164, 1689181262325596161, 'name', '收货人', 'varchar(30)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262325596165, 1689181262325596161, 'tel', '手机', 'varchar(20)', 'String', 'tel', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262325596166, 1689181262325596161, 'area', '所在地', 'varchar(100)', 'String', 'area', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262325596167, 1689181262325596161, 'address', '详细地址', 'varchar(255)', 'String', 'address', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262325596168, 1689181262325596161, 'label', '标签', 'varchar(20)', 'String', 'label', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262325596169, 1689181262325596161, 'longitude', '经度', 'decimal(20,6)', 'BigDecimal', 'longitude', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262325596170, 1689181262325596161, 'latitude', '纬度', 'decimal(20,6)', 'BigDecimal', 'latitude', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262325596171, 1689181262325596161, 'is_default', '是否默认', 'char(1)', 'String', 'isDefault', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'usr_logic', 10, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262325596172, 1689181262325596161, 'create_dept', '创建部门', 'bigint', 'Long', 'createDept', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 11, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262325596173, 1689181262325596161, 'create_by', '创建人', 'bigint', 'Long', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 12, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262325596174, 1689181262325596161, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, '1', '1', 'BETWEEN', 'datetime', '', 13, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262325596175, 1689181262325596161, 'update_by', '修改人', 'bigint', 'Long', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 14, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262325596176, 1689181262325596161, 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'datetime', '', 15, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262325596177, 1689181262325596161, 'del_flag', '逻辑删除', 'char(1)', 'String', 'delFlag', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 16, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262325596178, 1689181262325596161, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 17, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262325596180, 1689181262325596179, 'id', 'id', 'bigint', 'Long', 'id', '1', '0', '1', NULL, '1', '1', '1', 'EQ', 'input', '', 1, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262325596181, 1689181262325596179, 'wid', '微信id', 'bigint', 'Long', 'wid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262325596182, 1689181262325596179, 'type', '类型', 'varchar(10)', 'String', 'type', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262325596183, 1689181262325596179, 'name', '名称', 'varchar(20)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262325596184, 1689181262325596179, 'appid', '身份标识', 'varchar(100)', 'String', 'appid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262325596185, 1689181262325596179, 'secret', '身份秘钥', 'varchar(100)', 'String', 'secret', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262325596186, 1689181262325596179, 'avatar', '头像', 'varchar(255)', 'String', 'avatar', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'imageUpload', '', 7, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262325596187, 1689181262325596179, 'token', '配置token', 'varchar(100)', 'String', 'token', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262325596188, 1689181262325596179, 'aeskey', 'aeskey', 'varchar(100)', 'String', 'aeskey', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262325596189, 1689181262325596179, 'is_pay', '是否支付', 'char(1)', 'String', 'isPay', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'usr_logic', 10, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262325596190, 1689181262325596179, 'partner', '商户号', 'varchar(50)', 'String', 'partner', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262325596191, 1689181262325596179, 'partner_key', '支付秘钥', 'varchar(100)', 'String', 'partnerKey', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262325596192, 1689181262325596179, 'isused', '是否使用', 'char(1)', 'String', 'isused', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'usr_logic', 13, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262325596193, 1689181262325596179, 'redirect_url', '回调地址', 'varchar(255)', 'String', 'redirectUrl', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262325596194, 1689181262325596179, 'apivkey', 'apiv3key', 'varchar(40)', 'String', 'apivkey', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 15, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262325596195, 1689181262325596179, 'lkey_path', '本地keypath', 'varchar(255)', 'String', 'lkeyPath', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 16, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262325596196, 1689181262325596179, 'key_path', 'keypath', 'varchar(255)', 'String', 'keyPath', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 17, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262325596197, 1689181262325596179, 'lprivate_key_path', '本地PrivateKeyPath', 'varchar(255)', 'String', 'lprivateKeyPath', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 18, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262325596198, 1689181262325596179, 'private_key_path', 'PrivateKeyPath', 'varchar(255)', 'String', 'privateKeyPath', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 19, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262325596199, 1689181262325596179, 'lprivate_cert_path', '本地PrivateCertPath', 'varchar(255)', 'String', 'lprivateCertPath', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 20, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262325596200, 1689181262325596179, 'private_cert_path', 'PrivateCertPath', 'varchar(255)', 'String', 'privateCertPath', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 21, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262392705025, 1689181262325596179, 'cert_serial_no', 'CertSerialNo', 'varchar(255)', 'String', 'certSerialNo', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 22, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262392705026, 1689181262325596179, 'del_flag', '逻辑删除', 'char(1)', 'String', 'delFlag', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 23, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262392705027, 1689181262325596179, 'create_dept', '创建部门', 'bigint', 'Long', 'createDept', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 24, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262392705028, 1689181262325596179, 'create_by', '创建人', 'bigint', 'Long', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 25, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262392705029, 1689181262325596179, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, '1', '1', 'BETWEEN', 'datetime', '', 26, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262392705030, 1689181262325596179, 'update_by', '修改人', 'bigint', 'Long', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 27, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262392705031, 1689181262325596179, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'datetime', '', 28, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262392705032, 1689181262325596179, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 29, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262409482243, 1689181262409482242, 'id', 'id', 'bigint', 'Long', 'id', '1', '0', '1', NULL, '1', '1', '1', 'EQ', 'input', '', 1, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262409482244, 1689181262409482242, 'uid', '用户id', 'bigint', 'Long', 'uid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262409482245, 1689181262409482242, 'type', '类型', 'varchar(30)', 'String', 'type', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262409482246, 1689181262409482242, 'appid', 'appid', 'varchar(30)', 'String', 'appid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262409482247, 1689181262409482242, 'url', '链接', 'text', 'String', 'url', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262409482248, 1689181262409482242, 'views', '访问数', 'bigint', 'Long', 'views', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262409482249, 1689181262409482242, 'create_by', '创建人', 'bigint', 'Long', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 7, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262409482250, 1689181262409482242, 'create_dept', '创建部门', 'bigint', 'Long', 'createDept', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 8, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262409482251, 1689181262409482242, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, '1', '1', 'BETWEEN', 'datetime', '', 9, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262409482252, 1689181262409482242, 'update_by', '修改人', 'bigint', 'Long', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 10, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262409482253, 1689181262409482242, 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'datetime', '', 11, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262409482254, 1689181262409482242, 'del_flag', '逻辑删除', 'char(1)', 'String', 'delFlag', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 12, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262409482255, 1689181262409482242, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262459813889, 1689181262409482256, 'config_id', '参数主键', 'bigint', 'Long', 'configId', '1', '0', '1', NULL, '1', '1', '1', 'EQ', 'input', '', 1, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262459813890, 1689181262409482256, 'config_name', '参数名称', 'varchar(100)', 'String', 'configName', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262459813891, 1689181262409482256, 'config_key', '参数键名', 'varchar(100)', 'String', 'configKey', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262459813892, 1689181262409482256, 'config_value', '参数键值', 'varchar(500)', 'String', 'configValue', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 4, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262459813893, 1689181262409482256, 'config_type', '系统内置（Y是 N否）', 'char(1)', 'String', 'configType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262459813894, 1689181262409482256, 'create_by', '创建者', 'bigint', 'Long', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 6, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262459813895, 1689181262409482256, 'create_dept', '创建部门', 'bigint', 'Long', 'createDept', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 7, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262459813896, 1689181262409482256, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, '1', '1', 'BETWEEN', 'datetime', '', 8, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262459813897, 1689181262409482256, 'update_by', '更新者', 'bigint', 'Long', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 9, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262459813898, 1689181262409482256, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'datetime', '', 10, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262459813899, 1689181262409482256, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 11, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262459813901, 1689181262459813900, 'dept_id', '部门id', 'bigint', 'Long', 'deptId', '1', '0', '1', NULL, '1', '1', '1', 'EQ', 'input', '', 1, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262459813902, 1689181262459813900, 'parent_id', '父部门id', 'bigint', 'Long', 'parentId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262459813903, 1689181262459813900, 'ancestors', '祖级列表', 'varchar(500)', 'String', 'ancestors', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 3, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262459813904, 1689181262459813900, 'dept_name', '部门名称', 'varchar(30)', 'String', 'deptName', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262459813905, 1689181262459813900, 'order_num', '显示顺序', 'int', 'Long', 'orderNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262459813906, 1689181262459813900, 'leader', '负责人', 'varchar(20)', 'String', 'leader', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262459813907, 1689181262459813900, 'phone', '联系电话', 'varchar(11)', 'String', 'phone', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262459813908, 1689181262459813900, 'email', '邮箱', 'varchar(50)', 'String', 'email', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262459813909, 1689181262459813900, 'status', '部门状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262459813910, 1689181262459813900, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 10, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262459813911, 1689181262459813900, 'create_by', '创建者', 'bigint', 'Long', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 11, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262459813912, 1689181262459813900, 'create_dept', '创建部门', 'bigint', 'Long', 'createDept', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 12, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262459813913, 1689181262459813900, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, '1', '1', 'BETWEEN', 'datetime', '', 13, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262459813914, 1689181262459813900, 'update_by', '更新者', 'bigint', 'Long', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 14, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262459813915, 1689181262459813900, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'datetime', '', 15, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262459813917, 1689181262459813916, 'dict_id', '字典主键', 'bigint', 'Long', 'dictId', '1', '0', '1', NULL, '1', '1', '1', 'EQ', 'input', '', 1, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262459813918, 1689181262459813916, 'dict_name', '字典名称', 'varchar(100)', 'String', 'dictName', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262526922754, 1689181262459813916, 'dict_type', '字典类型', 'varchar(100)', 'String', 'dictType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262526922755, 1689181262459813916, 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262526922756, 1689181262459813916, 'create_by', '创建者', 'bigint', 'Long', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 5, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262526922757, 1689181262459813916, 'create_dept', '创建部门', 'bigint', 'Long', 'createDept', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 6, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262526922758, 1689181262459813916, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, '1', '1', 'BETWEEN', 'datetime', '', 7, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262526922759, 1689181262459813916, 'update_by', '更新者', 'bigint', 'Long', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 8, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262526922760, 1689181262459813916, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'datetime', '', 9, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262526922761, 1689181262459813916, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 10, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262526922763, 1689181262526922762, 'info_id', '访问ID', 'bigint', 'Long', 'infoId', '1', '0', '1', NULL, '1', '1', '1', 'EQ', 'input', '', 1, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262526922764, 1689181262526922762, 'username', '用户账号', 'varchar(50)', 'String', 'username', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262526922765, 1689181262526922762, 'ipaddr', '登录IP地址', 'varchar(128)', 'String', 'ipaddr', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262526922766, 1689181262526922762, 'login_location', '登录地点', 'varchar(255)', 'String', 'loginLocation', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262526922767, 1689181262526922762, 'browser', '浏览器类型', 'varchar(50)', 'String', 'browser', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262526922768, 1689181262526922762, 'os', '操作系统', 'varchar(50)', 'String', 'os', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262526922769, 1689181262526922762, 'status', '登录状态（0成功 1失败）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262526922770, 1689181262526922762, 'msg', '提示消息', 'varchar(255)', 'String', 'msg', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262526922771, 1689181262526922762, 'login_time', '访问时间', 'datetime', 'Date', 'loginTime', '0', '0', NULL, '1', '1', '1', '1', 'BETWEEN', 'datetime', '', 9, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262526922773, 1689181262526922772, 'notice_id', '公告ID', 'bigint', 'Long', 'noticeId', '1', '0', '1', NULL, '1', '1', '1', 'EQ', 'input', '', 1, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262526922774, 1689181262526922772, 'notice_title', '公告标题', 'varchar(50)', 'String', 'noticeTitle', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262526922775, 1689181262526922772, 'notice_type', '公告类型（1通知 2公告）', 'char(1)', 'String', 'noticeType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262526922776, 1689181262526922772, 'notice_content', '公告内容', 'longblob', 'String', 'noticeContent', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'editor', '', 4, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262526922777, 1689181262526922772, 'status', '公告状态（0正常 1关闭）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262526922778, 1689181262526922772, 'create_by', '创建者', 'bigint', 'Long', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 6, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262526922779, 1689181262526922772, 'create_dept', '创建部门', 'bigint', 'Long', 'createDept', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 7, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262526922780, 1689181262526922772, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, '1', '1', 'BETWEEN', 'datetime', '', 8, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262526922781, 1689181262526922772, 'update_by', '更新者', 'bigint', 'Long', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 9, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262526922782, 1689181262526922772, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'datetime', '', 10, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262526922783, 1689181262526922772, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262594031618, 1689181262526922784, 'oss_config_id', '主建', 'bigint', 'Long', 'ossConfigId', '1', '0', '1', NULL, '1', '1', '1', 'EQ', 'input', '', 1, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262594031619, 1689181262526922784, 'config_key', '配置key', 'varchar(30)', 'String', 'configKey', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262594031620, 1689181262526922784, 'access_key', 'accessKey', 'varchar(255)', 'String', 'accessKey', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262594031621, 1689181262526922784, 'secret_key', '秘钥', 'varchar(255)', 'String', 'secretKey', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262594031622, 1689181262526922784, 'bucket_name', '桶名称', 'varchar(255)', 'String', 'bucketName', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262594031623, 1689181262526922784, 'prefix', '前缀', 'varchar(255)', 'String', 'prefix', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262594031624, 1689181262526922784, 'endpoint', '访问站点', 'varchar(255)', 'String', 'endpoint', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262594031625, 1689181262526922784, 'domain', '自定义域名', 'varchar(255)', 'String', 'domain', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262594031626, 1689181262526922784, 'is_https', '是否https（Y=是,N=否）', 'char(1)', 'String', 'isHttps', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'usr_logic', 9, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262594031627, 1689181262526922784, 'region', '域', 'varchar(255)', 'String', 'region', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262594031628, 1689181262526922784, 'access_policy', '桶权限类型(0=private 1=public 2=custom)', 'char(1)', 'String', 'accessPolicy', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262594031629, 1689181262526922784, 'status', '状态（0=正常,1=停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262594031630, 1689181262526922784, 'ext1', '扩展字段', 'varchar(255)', 'String', 'ext1', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262594031631, 1689181262526922784, 'create_by', '创建者', 'bigint', 'Long', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 14, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262594031632, 1689181262526922784, 'create_dept', '创建部门', 'bigint', 'Long', 'createDept', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 15, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262594031633, 1689181262526922784, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, '1', '1', 'BETWEEN', 'datetime', '', 16, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262594031634, 1689181262526922784, 'update_by', '更新者', 'bigint', 'Long', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 17, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262594031635, 1689181262526922784, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'datetime', '', 18, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262594031636, 1689181262526922784, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 19, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262594031638, 1689181262594031637, 'user_id', '用户ID', 'bigint', 'Long', 'userId', '1', '0', '1', NULL, '1', '1', '1', 'EQ', 'input', '', 1, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262594031639, 1689181262594031637, 'dept_id', '部门ID', 'bigint', 'Long', 'deptId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262594031640, 1689181262594031637, 'username', '用户账号', 'varchar(50)', 'String', 'username', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262594031641, 1689181262594031637, 'nickname', '用户昵称', 'varchar(100)', 'String', 'nickname', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262594031642, 1689181262594031637, 'user_type', '用户类型（sys_user系统用户）', 'varchar(10)', 'String', 'userType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262594031643, 1689181262594031637, 'email', '用户邮箱', 'varchar(50)', 'String', 'email', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262594031644, 1689181262594031637, 'phonenumber', '手机号码', 'varchar(11)', 'String', 'phonenumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262594031645, 1689181262594031637, 'sex', '用户性别（0男 1女 2未知）', 'char(1)', 'String', 'sex', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262594031646, 1689181262594031637, 'avatar', '头像地址', 'varchar(300)', 'String', 'avatar', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'imageUpload', '', 9, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262594031647, 1689181262594031637, 'password', '密码', 'varchar(100)', 'String', 'password', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262594031648, 1689181262594031637, 'status', '帐号状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262594031649, 1689181262594031637, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 12, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262594031650, 1689181262594031637, 'login_ip', '最后登录IP', 'varchar(128)', 'String', 'loginIp', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262594031651, 1689181262594031637, 'login_date', '最后登录时间', 'datetime', 'Date', 'loginDate', '0', '0', NULL, '1', '1', '1', '1', 'BETWEEN', 'datetime', '', 14, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262594031652, 1689181262594031637, 'create_by', '创建者', 'bigint', 'Long', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 15, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262594031653, 1689181262594031637, 'create_dept', '创建部门', 'bigint', 'Long', 'createDept', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 16, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262594031654, 1689181262594031637, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, '1', '1', 'BETWEEN', 'datetime', '', 17, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262594031655, 1689181262594031637, 'update_by', '更新者', 'bigint', 'Long', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 18, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262594031656, 1689181262594031637, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'datetime', '', 19, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');
INSERT INTO `gen_table_column` VALUES (1689181262594031657, 1689181262594031637, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 20, 1, 103, '2023-08-09 15:46:11', 1, '2023-08-09 15:46:11');

-- ----------------------------
-- Table structure for sys_client
-- ----------------------------
DROP TABLE IF EXISTS `sys_client`;
CREATE TABLE `sys_client`  (
  `id` bigint NOT NULL COMMENT 'id',
  `client_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户端id',
  `client_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户端key',
  `client_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户端秘钥',
  `grant_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '授权类型',
  `device_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备类型',
  `active_timeout` int NULL DEFAULT 1800 COMMENT 'token活跃超时时间',
  `timeout` int NULL DEFAULT 604800 COMMENT 'token固定超时',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统授权表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_client
-- ----------------------------
INSERT INTO `sys_client` VALUES (1, 'e5cd7e4891bf95d1d19206ce24a7b32e', 'pc', 'pc123', 'password,social', 'pc', 36000, 604800, '0', '0', 103, 1, '2023-07-20 11:10:48', 1, '2023-08-08 15:34:12');
INSERT INTO `sys_client` VALUES (2, '428a8310cd442757ae699df5d894f051', 'app', 'app123', 'password,sms,social,xcx,mp,app', 'app', 86400, 604800, '0', '0', 103, 1, '2023-07-20 11:10:48', 1, '2023-08-08 15:33:45');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` bigint NOT NULL COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaOnOff', 'true', 'Y', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 1, NULL, '2022-07-02 10:25:47', 1, '2023-05-08 11:35:19', '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (11, 'OSS预览列表资源开关', 'sys.oss.previewListResource', 'true', 'Y', 1, NULL, '2022-07-02 10:25:47', 1, '2023-04-18 12:14:05', 'true:开启, false:关闭');
INSERT INTO `sys_config` VALUES (12, '账号自助-app用户开启登录', 'sys.account.appUserCanLogin', 'false', 'Y', 1, NULL, '2022-12-05 19:50:44', 1, '2022-12-07 22:11:01', 'true:开启，false:关闭');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, NULL, '15888888888', 'ry@qq.com', '0', '0', 1, NULL, '2022-07-02 10:25:47', 1, NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, NULL, '15888888888', 'ry@qq.com', '0', '0', 1, NULL, '2022-07-02 10:25:47', 1, NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, NULL, '15888888888', 'ry@qq.com', '0', '0', 1, NULL, '2022-07-02 10:25:47', 1, NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, NULL, '15888888888', 'ry@qq.com', '0', '0', 1, NULL, '2022-07-02 10:25:47', 1, '2023-08-09 15:04:22');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, NULL, '15888888888', 'ry@qq.com', '0', '0', 1, NULL, '2022-07-02 10:25:47', 1, '2023-08-09 15:04:23');
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, NULL, '15888888888', 'ry@qq.com', '0', '0', 1, NULL, '2022-07-02 10:25:47', 1, '2022-10-30 01:45:17');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, NULL, '15888888888', 'ry@qq.com', '0', '0', 1, NULL, '2022-07-02 10:25:47', 1, NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, NULL, '15888888888', 'ry@qq.com', '0', '0', 1, NULL, '2022-07-02 10:25:47', 1, NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, NULL, '15888888888', 'ry@qq.com', '0', '0', 1, NULL, '2022-07-02 10:25:47', 1, '2023-08-09 15:04:25');
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, NULL, '15888888888', 'ry@qq.com', '0', '0', 1, NULL, '2022-07-02 10:25:47', 1, '2023-08-09 15:00:40');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 0, '女', '0', 'sys_user_sex', '', 'danger', 'Y', '0', 1, NULL, '2022-07-02 10:25:47', 1, '2022-07-02 17:53:25', '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 1, '男', '1', 'sys_user_sex', '', 'success', 'N', '0', 1, NULL, '2022-07-02 10:25:47', 1, '2022-07-02 17:53:35', '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 2, '未知', '2', 'sys_user_sex', '', 'info', 'N', '0', 1, NULL, '2022-07-02 10:25:47', 1, '2022-07-02 17:53:42', '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 1, NULL, '2022-07-02 10:25:47', 1, '2023-08-09 15:15:22', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disabled', '', 'primary', 'Y', '0', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disabled', '', 'danger', 'N', '0', 1, NULL, '2022-07-02 10:25:47', 1, '2023-08-09 15:15:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (29, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 1, NULL, '2022-08-31 20:02:33', 1, NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (30, 10, '密码认证', 'password', 'sys_grant_type', '', 'primary', 'N', '0', 103, 1, '2023-08-07 00:45:25', 1, '2023-08-08 11:20:13', '密码认证');
INSERT INTO `sys_dict_data` VALUES (31, 20, '短信认证', 'sms', 'sys_grant_type', '', 'primary', 'N', '0', 103, 1, '2023-08-07 00:45:25', 1, '2023-08-08 11:20:34', '短信认证');
INSERT INTO `sys_dict_data` VALUES (32, 30, '邮件认证', 'email', 'sys_grant_type', '', 'primary', 'N', '0', 103, 1, '2023-08-07 00:45:25', 1, '2023-08-08 11:20:40', '邮件认证');
INSERT INTO `sys_dict_data` VALUES (33, 40, '小程序认证', 'xcx', 'sys_grant_type', '', 'success', 'N', '0', 103, 1, '2023-08-07 00:45:25', 1, '2023-08-08 11:20:48', '小程序认证');
INSERT INTO `sys_dict_data` VALUES (34, 100, '三方登录认证', 'social', 'sys_grant_type', '', 'danger', 'N', '0', 103, 1, '2023-08-07 00:45:25', 1, '2023-08-08 11:21:11', '三方登录认证');
INSERT INTO `sys_dict_data` VALUES (35, 0, 'PC端', 'pc', 'sys_device_type', '', 'default', 'N', '0', 103, 1, '2023-08-07 00:45:25', NULL, NULL, 'PC端');
INSERT INTO `sys_dict_data` VALUES (36, 0, 'APP端', 'app', 'sys_device_type', '', 'default', 'N', '0', 103, 1, '2023-08-07 00:45:25', NULL, NULL, 'APP端');
INSERT INTO `sys_dict_data` VALUES (1543171373919129602, 0, '否', '0', 'usr_logic', NULL, 'info', 'N', '0', 1, NULL, '2022-07-02 17:55:01', 1, '2022-11-22 00:03:03', NULL);
INSERT INTO `sys_dict_data` VALUES (1543171407691665410, 1, '是', '1', 'usr_logic', NULL, 'success', 'N', '0', 1, NULL, '2022-07-02 17:55:09', 1, '2022-07-02 17:55:09', NULL);
INSERT INTO `sys_dict_data` VALUES (1543171675015630849, 0, '目录', 'M', 'sys_menu_type', NULL, 'success', 'N', '0', 1, NULL, '2022-07-02 17:56:13', 1, '2022-07-02 17:56:13', NULL);
INSERT INTO `sys_dict_data` VALUES (1543171727746420738, 0, '菜单', 'C', 'sys_menu_type', NULL, 'danger', 'N', '0', 1, NULL, '2022-07-02 17:56:25', 1, '2022-07-02 17:56:25', NULL);
INSERT INTO `sys_dict_data` VALUES (1543171767751692290, 0, '按钮', 'F', 'sys_menu_type', NULL, 'info', 'N', '0', 1, NULL, '2022-07-02 17:56:35', 1, '2022-07-02 17:56:35', NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 1, NULL, '2022-07-02 10:25:47', 1, '2023-08-01 13:38:44', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disabled', '0', 1, NULL, '2022-07-02 10:25:47', 1, '2023-11-08 11:43:10', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, '授权类型', 'sys_grant_type', '0', 103, 1, '2023-08-07 00:44:24', NULL, NULL, '认证授权类型');
INSERT INTO `sys_dict_type` VALUES (12, '设备类型', 'sys_device_type', '0', 103, 1, '2023-08-07 00:44:24', 1, '2023-08-09 15:08:27', '客户端设备类型');
INSERT INTO `sys_dict_type` VALUES (1543171218050404353, '逻辑是否', 'usr_logic', '0', 1, NULL, '2022-07-02 17:54:24', 1, '2022-08-03 17:43:05', '逻辑是否');
INSERT INTO `sys_dict_type` VALUES (1543171580853506050, '菜单类型', 'sys_menu_type', '0', 1, NULL, '2022-07-02 17:55:50', 1, '2022-07-02 17:55:50', '菜单类型');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL COMMENT '访问ID',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query_param` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` tinyint(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` tinyint(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 80, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 1, NULL, '2022-07-02 10:25:47', 1, '2023-11-08 11:44:38', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 90, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 1, NULL, '2022-07-02 10:25:47', 1, '2023-11-08 11:53:18', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 100, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 1, NULL, '2022-07-02 10:25:47', 1, '2022-07-03 13:45:01', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 1, NULL, '2022-07-02 10:25:47', 1, '2023-08-09 14:54:36', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 10, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 1, NULL, '2022-07-02 10:25:47', 1, '2022-07-06 23:47:24', '在线用户菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 30, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 1, NULL, '2022-07-02 10:25:47', 1, '2022-07-06 23:47:38', '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '应用监控', 2, 5, 'Admin', 'monitor/admin/index', '', 1, 0, 'C', '0', '0', 'monitor:admin:list', 'dashboard', 103, 1, '2023-08-06 17:31:41', NULL, NULL, 'Admin监控菜单');
INSERT INTO `sys_menu` VALUES (118, '文件管理', 1, 10, 'oss', 'system/oss/index', '', 1, 0, 'C', '0', '0', 'system:oss:list', 'upload', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '文件管理菜单');
INSERT INTO `sys_menu` VALUES (120, '任务中心', 2, 1, 'XxlJob', 'monitor/xxljob/index', '', 1, 0, 'C', '0', '0', 'monitor:xxljob:list', 'job', 1, NULL, '2022-07-02 10:25:47', 1, '2022-07-06 23:47:20', 'Xxl-Job控制台菜单');
INSERT INTO `sys_menu` VALUES (123, '授权管理', 1, 11, 'client', 'system/client/index', '', 1, 0, 'C', '0', '0', 'system:client:list', 'international', 103, 1, '2023-08-07 12:38:33', 1, '2023-08-08 11:14:47', '客户端管理菜单');
INSERT INTO `sys_menu` VALUES (124, '系统授权查询', 123, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:client:query', '#', 1, 103, '2024-01-18 11:50:29', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (125, '系统授权新增', 123, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:client:add', '#', 1, 103, '2024-01-18 11:50:29', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (126, '系统授权修改', 123, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:client:edit', '#', 1, 103, '2024-01-18 11:50:29', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (127, '系统授权删除', 123, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:client:remove', '#', 1, 103, '2024-01-18 11:50:29', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (128, '系统授权导出', 123, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:client:export', '#', 1, 103, '2024-01-18 11:50:29', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (129, '系统授权导入', 123, 6, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:client:import', '#', 1, 103, '2024-01-18 11:50:29', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1600, '文件查询', 118, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:query', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1601, '文件上传', 118, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:upload', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1602, '文件下载', 118, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:download', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1603, '文件删除', 118, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:remove', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1604, '配置添加', 118, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:add', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1605, '配置编辑', 118, 6, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:edit', '#', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1544493674782642176, '错误日志', 2, 100, 'errorLog', 'system/errorLog/index', NULL, 1, 0, 'C', '0', '0', 'system:errorLog:list', 'log', 1, NULL, '2022-07-06 09:32:17', 1, '2023-08-06 17:40:14', '错误日志菜单');
INSERT INTO `sys_menu` VALUES (1544493674782642177, '错误日志查询', 1544493674782642176, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:errorLog:query', '#', 1, NULL, '2022-07-06 09:32:17', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1544493674782642178, '错误日志新增', 1544493674782642176, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:errorLog:add', '#', 1, NULL, '2022-07-06 09:32:17', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1544493674782642179, '错误日志修改', 1544493674782642176, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:errorLog:edit', '#', 1, NULL, '2022-07-06 09:32:17', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1544493674782642180, '错误日志删除', 1544493674782642176, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:errorLog:remove', '#', 1, NULL, '2022-07-06 09:32:17', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1544493674782642181, '错误日志导出', 1544493674782642176, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:errorLog:export', '#', 1, NULL, '2022-07-06 09:32:17', 1, NULL, '');
INSERT INTO `sys_menu` VALUES (1544493674782642182, '错误日志导入', 1544493674782642176, 6, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:errorLog:import', '#', 1, NULL, '2022-07-06 09:32:17', 1, NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` bigint NOT NULL COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 新版本发布啦', '2', 0x3C703E3C696D67207372633D22687474703A2F2F7A68756177617368692E6F73732D636E2D6265696A696E672E616C6979756E63732E636F6D2F756E69617070323032322F323032322F30372F30332F35376161373632643163333234623230393661336461633863643938346364362E706E67223EE696B0E78988E69CACE58685E5AEB93C2F703E, '0', 1, NULL, '2022-07-02 10:25:48', 1, '2022-07-03 22:43:48', '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 1, NULL, '2022-07-02 10:25:48', 1, '2023-08-09 15:10:59', '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求参数',
  `json_result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT NULL COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1728703129868410881, '操作日志', 9, 'org.dromara.system.monitor.controller.SysOperlogController.clean()', 'DELETE', 1, 'admin', '', '/monitor/operlog/clean', '0:0:0:0:0:0:0:1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-11-26 17:11:59', 3);
INSERT INTO `sys_oper_log` VALUES (1728703195832229889, 'OSS对象存储', 3, 'org.dromara.system.oss.controller.SysOssController.remove()', 'DELETE', 1, 'admin', '', '/resource/oss/1689237872922169345,1689237717921665025,1689236661254852609,1689099498215243777,1688904383735627777,1688900657109118978,1688898970516566017', '0:0:0:0:0:0:0:1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-11-26 17:12:14', 31);
INSERT INTO `sys_oper_log` VALUES (1728703226907828226, 'OSS对象存储', 3, 'org.dromara.system.oss.controller.SysOssController.remove()', 'DELETE', 1, 'admin', '', '/resource/oss/1694259220278988801,1694258173833682946,1694224553937022978,1694194750227861505,1689248028812644353,1689243641470095362,1689243340214210561,1689242251158982657,1689241865056522241,1689241764435169282', '0:0:0:0:0:0:0:1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-11-26 17:12:22', 1852);

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`  (
  `oss_id` bigint NOT NULL COMMENT '对象存储主键',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `original_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '原名',
  `file_suffix` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件后缀名',
  `url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'URL地址',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '上传人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `service` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'minio' COMMENT '服务商',
  PRIMARY KEY (`oss_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'OSS对象存储表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for sys_oss_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss_config`;
CREATE TABLE `sys_oss_config`  (
  `oss_config_id` bigint NOT NULL COMMENT '主建',
  `config_key` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '配置key',
  `access_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'accessKey',
  `secret_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '秘钥',
  `bucket_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '桶名称',
  `prefix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '前缀',
  `endpoint` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '访问站点',
  `domain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '自定义域名',
  `is_https` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否https（Y=是,N=否）',
  `region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '域',
  `access_policy` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '桶权限类型(0=private 1=public 2=custom)',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '状态（0=正常,1=停用）',
  `ext1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '扩展字段',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`oss_config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '对象存储配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oss_config
-- ----------------------------
INSERT INTO `sys_oss_config` VALUES (1, 'minio', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'zhuawashi', 'ruoyi2024', '127.0.0.1:9000', '', 'N', '', '1', '1', '', 1, NULL, '2022-07-02 10:25:48', 1, '2023-08-09 15:24:47', '');
INSERT INTO `sys_oss_config` VALUES (2, 'qiniu', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'zhuawashi', 'ruoyi2024', 's3-cn-north-1.qiniucs.com', 'qn.ssza.top', 'N', '', '1', '1', '', 1, NULL, '2022-07-02 10:25:48', 1, '2022-07-06 11:25:30', '');
INSERT INTO `sys_oss_config` VALUES (3, 'aliyun', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'zhuawashi', 'ruoyi2024', 'oss-cn-beijing.aliyuncs.com', '', 'N', '', '1', '1', '', 1, NULL, '2022-07-02 10:25:48', 1, '2023-01-06 19:31:15', '');
INSERT INTO `sys_oss_config` VALUES (4, 'qcloud', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'zhuawashi', 'ruoyi2024', 'cos.ap-guangzhou.myqcloud.com', '', 'Y', 'ap-guangzhou', '1', '0', '', 1, NULL, '2022-07-02 10:25:48', 1, '2023-08-23 10:11:22', '');
INSERT INTO `sys_oss_config` VALUES (1648161501639790593, 'private', 'XXXXXX', 'XXXXXX', 'zhua', 'ruoyi2024', '127.0.0.1:9000', '', 'N', '', '0', '1', '', 1, NULL, '2023-04-18 11:08:18', 1, '2023-08-09 15:24:36', NULL);
INSERT INTO `sys_oss_config` VALUES (1648163021722669057, 'local', 'local', 'local', 'local', 'ruoyi2024', '127.0.0.1', '', 'N', '', '1', '1', '', 1, NULL, '2023-04-18 11:14:20', 1, '2023-08-09 19:26:09', '支持配置自定义域名和是否https，自定义域名不要加前缀，自定义域名如果做了反向代理，需要带上反向代理路径');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 1, NULL, '2022-07-02 10:25:47', 1, '2023-08-09 15:06:26', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 1, NULL, '2022-07-02 10:25:47', 1, NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, 'app普通用户', 'app_user', 2, '2', 1, 1, '0', '0', 1, NULL, '2022-07-02 10:25:47', 1, '2023-02-17 00:17:46', 'app普通用户');
INSERT INTO `sys_role` VALUES (3, 'app管理员', 'app_admin', 3, '1', 1, 1, '0', '0', 1, NULL, '2022-12-07 18:03:14', 1, '2023-01-14 16:49:36', NULL);
INSERT INTO `sys_role` VALUES (4, '普通用户', 'common_user', 4, '1', 1, 1, '0', '0', 1, NULL, '2023-01-14 17:37:31', 1, '2023-08-09 15:18:13', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1543471166792937473);
INSERT INTO `sys_role_menu` VALUES (2, 1543608639929974784);
INSERT INTO `sys_role_menu` VALUES (2, 1543608639929974785);
INSERT INTO `sys_role_menu` VALUES (2, 1600479967378296834);
INSERT INTO `sys_role_menu` VALUES (2, 1600480198065016834);
INSERT INTO `sys_role_menu` VALUES (2, 1600480315685883906);
INSERT INTO `sys_role_menu` VALUES (3, 1543471166792937473);
INSERT INTO `sys_role_menu` VALUES (3, 1543608639929974784);
INSERT INTO `sys_role_menu` VALUES (3, 1543608639929974785);
INSERT INTO `sys_role_menu` VALUES (3, 1543608639929974786);
INSERT INTO `sys_role_menu` VALUES (3, 1543608639929974787);
INSERT INTO `sys_role_menu` VALUES (3, 1543608639929974788);
INSERT INTO `sys_role_menu` VALUES (3, 1543608639929974789);
INSERT INTO `sys_role_menu` VALUES (3, 1543608639929974790);
INSERT INTO `sys_role_menu` VALUES (3, 1544517734379843584);
INSERT INTO `sys_role_menu` VALUES (3, 1544517734379843585);
INSERT INTO `sys_role_menu` VALUES (3, 1544517734379843586);
INSERT INTO `sys_role_menu` VALUES (3, 1544517734379843587);
INSERT INTO `sys_role_menu` VALUES (3, 1544517734379843588);
INSERT INTO `sys_role_menu` VALUES (3, 1544517734379843589);
INSERT INTO `sys_role_menu` VALUES (3, 1544517734379843590);
INSERT INTO `sys_role_menu` VALUES (3, 1544854864008318976);
INSERT INTO `sys_role_menu` VALUES (3, 1544854864008318977);
INSERT INTO `sys_role_menu` VALUES (3, 1544854864008318978);
INSERT INTO `sys_role_menu` VALUES (3, 1544854864008318979);
INSERT INTO `sys_role_menu` VALUES (3, 1544854864008318980);
INSERT INTO `sys_role_menu` VALUES (3, 1544854864008318981);
INSERT INTO `sys_role_menu` VALUES (3, 1544854864008318982);
INSERT INTO `sys_role_menu` VALUES (4, 1);
INSERT INTO `sys_role_menu` VALUES (4, 100);
INSERT INTO `sys_role_menu` VALUES (4, 101);
INSERT INTO `sys_role_menu` VALUES (4, 102);
INSERT INTO `sys_role_menu` VALUES (4, 103);
INSERT INTO `sys_role_menu` VALUES (4, 104);
INSERT INTO `sys_role_menu` VALUES (4, 105);
INSERT INTO `sys_role_menu` VALUES (4, 106);
INSERT INTO `sys_role_menu` VALUES (4, 107);
INSERT INTO `sys_role_menu` VALUES (4, 108);
INSERT INTO `sys_role_menu` VALUES (4, 118);
INSERT INTO `sys_role_menu` VALUES (4, 123);
INSERT INTO `sys_role_menu` VALUES (4, 500);
INSERT INTO `sys_role_menu` VALUES (4, 501);
INSERT INTO `sys_role_menu` VALUES (4, 1001);
INSERT INTO `sys_role_menu` VALUES (4, 1005);
INSERT INTO `sys_role_menu` VALUES (4, 1008);
INSERT INTO `sys_role_menu` VALUES (4, 1012);
INSERT INTO `sys_role_menu` VALUES (4, 1013);
INSERT INTO `sys_role_menu` VALUES (4, 1016);
INSERT INTO `sys_role_menu` VALUES (4, 1017);
INSERT INTO `sys_role_menu` VALUES (4, 1020);
INSERT INTO `sys_role_menu` VALUES (4, 1021);
INSERT INTO `sys_role_menu` VALUES (4, 1024);
INSERT INTO `sys_role_menu` VALUES (4, 1025);
INSERT INTO `sys_role_menu` VALUES (4, 1026);
INSERT INTO `sys_role_menu` VALUES (4, 1030);
INSERT INTO `sys_role_menu` VALUES (4, 1031);
INSERT INTO `sys_role_menu` VALUES (4, 1034);
INSERT INTO `sys_role_menu` VALUES (4, 1035);
INSERT INTO `sys_role_menu` VALUES (4, 1036);
INSERT INTO `sys_role_menu` VALUES (4, 1039);
INSERT INTO `sys_role_menu` VALUES (4, 1040);
INSERT INTO `sys_role_menu` VALUES (4, 1041);
INSERT INTO `sys_role_menu` VALUES (4, 1042);
INSERT INTO `sys_role_menu` VALUES (4, 1043);
INSERT INTO `sys_role_menu` VALUES (4, 1044);
INSERT INTO `sys_role_menu` VALUES (4, 1045);
INSERT INTO `sys_role_menu` VALUES (4, 1600);
INSERT INTO `sys_role_menu` VALUES (4, 1601);
INSERT INTO `sys_role_menu` VALUES (4, 1602);
INSERT INTO `sys_role_menu` VALUES (4, 1603);
INSERT INTO `sys_role_menu` VALUES (4, 1604);
INSERT INTO `sys_role_menu` VALUES (6, 1543471166792937473);
INSERT INTO `sys_role_menu` VALUES (6, 1543608639929974784);
INSERT INTO `sys_role_menu` VALUES (6, 1543608639929974785);
INSERT INTO `sys_role_menu` VALUES (6, 1543608639929974786);
INSERT INTO `sys_role_menu` VALUES (6, 1543608639929974787);
INSERT INTO `sys_role_menu` VALUES (6, 1543608639929974788);
INSERT INTO `sys_role_menu` VALUES (6, 1543608639929974789);
INSERT INTO `sys_role_menu` VALUES (6, 1543608639929974790);
INSERT INTO `sys_role_menu` VALUES (6, 1544517734379843584);
INSERT INTO `sys_role_menu` VALUES (6, 1544517734379843585);
INSERT INTO `sys_role_menu` VALUES (6, 1544517734379843586);
INSERT INTO `sys_role_menu` VALUES (6, 1544517734379843587);
INSERT INTO `sys_role_menu` VALUES (6, 1544517734379843588);
INSERT INTO `sys_role_menu` VALUES (6, 1544517734379843589);
INSERT INTO `sys_role_menu` VALUES (6, 1544517734379843590);
INSERT INTO `sys_role_menu` VALUES (6, 1544854864008318976);
INSERT INTO `sys_role_menu` VALUES (6, 1544854864008318977);
INSERT INTO `sys_role_menu` VALUES (6, 1544854864008318978);
INSERT INTO `sys_role_menu` VALUES (6, 1544854864008318979);
INSERT INTO `sys_role_menu` VALUES (6, 1544854864008318980);
INSERT INTO `sys_role_menu` VALUES (6, 1544854864008318981);
INSERT INTO `sys_role_menu` VALUES (6, 1544854864008318982);
INSERT INTO `sys_role_menu` VALUES (1600430723619540994, 1600479967378296834);
INSERT INTO `sys_role_menu` VALUES (1600430723619540994, 1600480198065016834);
INSERT INTO `sys_role_menu` VALUES (1600430723619540994, 1600480315685883906);
INSERT INTO `sys_role_menu` VALUES (1600430723619540994, 1600480712622231554);
INSERT INTO `sys_role_menu` VALUES (1600430723619540994, 1600480879786217473);

-- ----------------------------
-- Table structure for sys_social
-- ----------------------------
DROP TABLE IF EXISTS `sys_social`;
CREATE TABLE `sys_social`  (
  `id` bigint NOT NULL COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  `auth_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '平台+平台唯一id',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户来源',
  `open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '平台编号唯一id',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录账号',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户昵称',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `avatar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `access_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户的授权令牌',
  `expire_in` int NULL DEFAULT NULL COMMENT '用户的授权令牌的有效期，部分平台可能没有',
  `refresh_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '刷新令牌，部分平台可能没有',
  `access_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '平台的授权信息，部分平台可能没有',
  `union_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户的 unionid',
  `scope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '授予的权限，部分平台可能没有',
  `token_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个别平台的授权信息，部分平台可能没有',
  `id_token` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'id token，部分平台可能没有',
  `mac_algorithm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '小米平台用户的附带属性，部分平台可能没有',
  `mac_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '小米平台用户的附带属性，部分平台可能没有',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户的授权code，部分平台可能没有',
  `oauth_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Twitter平台用户的附带属性，部分平台可能没有',
  `oauth_token_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Twitter平台用户的附带属性，部分平台可能没有',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '社会化关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_social
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nickname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `user_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'sys_user' COMMENT '用户类型（sys_user系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '2' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` bigint NULL DEFAULT NULL COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '抓蛙师', 'sys_user', '770492966@qq.com', '15888888888', '1', NULL, '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '0:0:0:0:0:0:0:1', '2023-11-26 17:09:16', 1, NULL, '2022-07-02 10:25:47', 1, '2023-11-26 17:09:16', '管理员');
INSERT INTO `sys_user` VALUES (1689141056432041986, 104, 'test', 'test', 'sys_user', '', '', '2', NULL, '$2a$10$Uy4XrBgpPdFOHocZnyeZf.S/T7YNMVyudTbiwB6.1DSXMDoYnCTZO', '0', '0', '0:0:0:0:0:0:0:1', '2023-08-09 15:18:19', 1, 103, '2023-08-09 13:06:25', 1689141056432041986, '2023-08-09 15:18:19', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (1688408866219950081, 2);
INSERT INTO `sys_user_role` VALUES (1689141056432041986, 4);
INSERT INTO `sys_user_role` VALUES (1694258169505161218, 2);
INSERT INTO `sys_user_role` VALUES (1694259216168570881, 2);

-- ----------------------------
-- Table structure for xxl_job_group
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_group`;
CREATE TABLE `xxl_job_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行器AppName',
  `title` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行器名称',
  `address_type` tinyint NOT NULL DEFAULT 0 COMMENT '执行器地址类型：0=自动注册、1=手动录入',
  `address_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '执行器地址列表，多地址逗号分隔',
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xxl_job_group
-- ----------------------------
INSERT INTO `xxl_job_group` VALUES (1, 'xxl-job-executor', '示例执行器', 0, 'http://192.168.1.5:9101/', '2022-10-30 01:48:10');

-- ----------------------------
-- Table structure for xxl_job_info
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_info`;
CREATE TABLE `xxl_job_info`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_group` int NOT NULL COMMENT '执行器主键ID',
  `job_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `add_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `author` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作者',
  `alarm_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报警邮件',
  `schedule_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'NONE' COMMENT '调度类型',
  `schedule_conf` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '调度配置，值含义取决于调度类型',
  `misfire_strategy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DO_NOTHING' COMMENT '调度过期策略',
  `executor_route_strategy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行器路由策略',
  `executor_handler` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行器任务参数',
  `executor_block_strategy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '阻塞处理策略',
  `executor_timeout` int NOT NULL DEFAULT 0 COMMENT '任务执行超时时间，单位秒',
  `executor_fail_retry_count` int NOT NULL DEFAULT 0 COMMENT '失败重试次数',
  `glue_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'GLUE备注',
  `glue_updatetime` datetime NULL DEFAULT NULL COMMENT 'GLUE更新时间',
  `child_jobid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子任务ID，多个逗号分隔',
  `trigger_status` tinyint NOT NULL DEFAULT 0 COMMENT '调度状态：0-停止，1-运行',
  `trigger_last_time` bigint NOT NULL DEFAULT 0 COMMENT '上次调度时间',
  `trigger_next_time` bigint NOT NULL DEFAULT 0 COMMENT '下次调度时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xxl_job_info
-- ----------------------------
INSERT INTO `xxl_job_info` VALUES (1, 1, '测试任务1', '2018-11-03 22:21:31', '2018-11-03 22:21:31', 'XXL', '', 'CRON', '0 0 0 * * ? *', 'DO_NOTHING', 'FIRST', 'demoJobHandler', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2018-11-03 22:21:31', '', 0, 0, 0);
INSERT INTO `xxl_job_info` VALUES (2, 1, '测试调用service模块', '2022-07-17 15:26:55', '2022-07-17 15:26:55', 'ye', '', 'CRON', '0 0 0 * * ?', 'DO_NOTHING', 'FIRST', 'testTask', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2022-07-17 15:26:55', '', 0, 0, 0);

-- ----------------------------
-- Table structure for xxl_job_lock
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_lock`;
CREATE TABLE `xxl_job_lock`  (
  `lock_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '锁名称',
  PRIMARY KEY (`lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xxl_job_lock
-- ----------------------------
INSERT INTO `xxl_job_lock` VALUES ('schedule_lock');

-- ----------------------------
-- Table structure for xxl_job_log
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_log`;
CREATE TABLE `xxl_job_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `job_group` int NOT NULL COMMENT '执行器主键ID',
  `job_id` int NOT NULL COMMENT '任务，主键ID',
  `executor_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行器地址，本次执行的地址',
  `executor_handler` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行器任务参数',
  `executor_sharding_param` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行器任务分片参数，格式如 1/2',
  `executor_fail_retry_count` int NOT NULL DEFAULT 0 COMMENT '失败重试次数',
  `trigger_time` datetime NULL DEFAULT NULL COMMENT '调度-时间',
  `trigger_code` int NOT NULL COMMENT '调度-结果',
  `trigger_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '调度-日志',
  `handle_time` datetime NULL DEFAULT NULL COMMENT '执行-时间',
  `handle_code` int NOT NULL COMMENT '执行-状态',
  `handle_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '执行-日志',
  `alarm_status` tinyint NOT NULL DEFAULT 0 COMMENT '告警状态：0-默认、1-无需告警、2-告警成功、3-告警失败',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `I_trigger_time`(`trigger_time`) USING BTREE,
  INDEX `I_handle_code`(`handle_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xxl_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_log_report
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_log_report`;
CREATE TABLE `xxl_job_log_report`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `trigger_day` datetime NULL DEFAULT NULL COMMENT '调度-时间',
  `running_count` int NOT NULL DEFAULT 0 COMMENT '运行中-日志数量',
  `suc_count` int NOT NULL DEFAULT 0 COMMENT '执行成功-日志数量',
  `fail_count` int NOT NULL DEFAULT 0 COMMENT '执行失败-日志数量',
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `i_trigger_day`(`trigger_day`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xxl_job_log_report
-- ----------------------------
INSERT INTO `xxl_job_log_report` VALUES (1, '2022-07-02 00:00:00', 0, 1, 9, NULL);
INSERT INTO `xxl_job_log_report` VALUES (2, '2022-07-01 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (3, '2022-06-30 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (4, '2022-07-04 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (5, '2022-07-03 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (6, '2022-07-05 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (7, '2022-07-06 00:00:00', 0, 1, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (8, '2022-07-07 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (9, '2022-07-13 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (10, '2022-07-12 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (11, '2022-07-11 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (12, '2022-07-15 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (13, '2022-07-14 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (14, '2022-07-17 00:00:00', 0, 9, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (15, '2022-07-16 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (16, '2022-10-30 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (17, '2022-10-29 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (18, '2022-10-28 00:00:00', 0, 0, 0, NULL);

-- ----------------------------
-- Table structure for xxl_job_logglue
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_logglue`;
CREATE TABLE `xxl_job_logglue`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_id` int NOT NULL COMMENT '任务，主键ID',
  `glue_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'GLUE备注',
  `add_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xxl_job_logglue
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_registry
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_registry`;
CREATE TABLE `xxl_job_registry`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `registry_group` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `registry_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `registry_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `i_g_k_v`(`registry_group`, `registry_key`, `registry_value`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xxl_job_registry
-- ----------------------------
INSERT INTO `xxl_job_registry` VALUES (49, 'EXECUTOR', 'xxl-job-executor', 'http://192.168.1.5:9101/', '2022-10-30 01:48:27');

-- ----------------------------
-- Table structure for xxl_job_user
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_user`;
CREATE TABLE `xxl_job_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账号',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `role` tinyint NOT NULL COMMENT '角色：0-普通用户、1-管理员',
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限：执行器ID列表，多个逗号分割',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `i_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xxl_job_user
-- ----------------------------
INSERT INTO `xxl_job_user` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL);

SET FOREIGN_KEY_CHECKS = 1;
