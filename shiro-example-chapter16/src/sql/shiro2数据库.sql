/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : shiro2

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 21/05/2020 00:41:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_organization
-- ----------------------------
DROP TABLE IF EXISTS `sys_organization`;
CREATE TABLE `sys_organization`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL,
  `parent_ids` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `available` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_organization_parent_id`(`parent_id`) USING BTREE,
  INDEX `idx_sys_organization_parent_ids`(`parent_ids`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_organization
-- ----------------------------
INSERT INTO `sys_organization` VALUES (1, '总公司', 0, '0/', 1);
INSERT INTO `sys_organization` VALUES (2, '分公司1', 1, '0/1/', 1);
INSERT INTO `sys_organization` VALUES (3, '分公司2', 1, '0/1/', 1);
INSERT INTO `sys_organization` VALUES (4, '分公司11', 2, '0/1/2/', 1);

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL,
  `parent_ids` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `permission` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `available` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_resource_parent_id`(`parent_id`) USING BTREE,
  INDEX `idx_sys_resource_parent_ids`(`parent_ids`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
INSERT INTO `sys_resource` VALUES (1, '资源', 'menu', '', 0, '0/', '', 1);
INSERT INTO `sys_resource` VALUES (11, '组织机构管理', 'menu', '/organization', 1, '0/1/', 'organization:*', 1);
INSERT INTO `sys_resource` VALUES (12, '组织机构新增', 'button', '', 11, '0/1/11/', 'organization:create', 1);
INSERT INTO `sys_resource` VALUES (13, '组织机构修改', 'button', '', 11, '0/1/11/', 'organization:update', 1);
INSERT INTO `sys_resource` VALUES (14, '组织机构删除', 'button', '', 11, '0/1/11/', 'organization:delete', 1);
INSERT INTO `sys_resource` VALUES (15, '组织机构查看', 'button', '', 11, '0/1/11/', 'organization:view', 1);
INSERT INTO `sys_resource` VALUES (21, '用户管理', 'menu', '/user', 1, '0/1/', 'user:*', 1);
INSERT INTO `sys_resource` VALUES (22, '用户新增', 'button', '', 21, '0/1/21/', 'user:create', 1);
INSERT INTO `sys_resource` VALUES (23, '用户修改', 'button', '', 21, '0/1/21/', 'user:update', 1);
INSERT INTO `sys_resource` VALUES (24, '用户删除', 'button', '', 21, '0/1/21/', 'user:delete', 1);
INSERT INTO `sys_resource` VALUES (25, '用户查看', 'button', '', 21, '0/1/21/', 'user:view', 1);
INSERT INTO `sys_resource` VALUES (31, '资源管理', 'menu', '/resource', 1, '0/1/', 'resource:*', 1);
INSERT INTO `sys_resource` VALUES (32, '资源新增', 'button', '', 31, '0/1/31/', 'resource:create', 1);
INSERT INTO `sys_resource` VALUES (33, '资源修改', 'button', '', 31, '0/1/31/', 'resource:update', 1);
INSERT INTO `sys_resource` VALUES (34, '资源删除', 'button', '', 31, '0/1/31/', 'resource:delete', 1);
INSERT INTO `sys_resource` VALUES (35, '资源查看', 'button', '', 31, '0/1/31/', 'resource:view', 1);
INSERT INTO `sys_resource` VALUES (41, '角色管理', 'menu', '/role', 1, '0/1/', 'role:*', 1);
INSERT INTO `sys_resource` VALUES (42, '角色新增', 'button', '', 41, '0/1/41/', 'role:create', 1);
INSERT INTO `sys_resource` VALUES (43, '角色修改', 'button', '', 41, '0/1/41/', 'role:update', 1);
INSERT INTO `sys_resource` VALUES (44, '角色删除', 'button', '', 41, '0/1/41/', 'role:delete', 1);
INSERT INTO `sys_resource` VALUES (45, '角色查看', 'button', '', 41, '0/1/41/', 'role:view', 1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `resource_ids` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `available` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_role_resource_ids`(`resource_ids`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'admin', '超级管理员', '11,21,31,41', 1);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `organization_id` bigint(20) NULL DEFAULT NULL,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `salt` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role_ids` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `locked` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_sys_user_username`(`username`) USING BTREE,
  INDEX `idx_sys_user_organization_id`(`organization_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 1, 'admin', 'd3c59d25033dbf980d29554025c23a75', '8d78869f470951332959580424d4bf4f', '1', 0);

SET FOREIGN_KEY_CHECKS = 1;
