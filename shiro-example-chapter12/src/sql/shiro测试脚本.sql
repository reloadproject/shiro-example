/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : shiro

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 20/05/2020 00:07:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for roles_permissions
-- ----------------------------
DROP TABLE IF EXISTS `roles_permissions`;
CREATE TABLE `roles_permissions`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `permission` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_roles_permissions`(`role_name`, `permission`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles_permissions
-- ----------------------------
INSERT INTO `roles_permissions` VALUES (1, 'role1', '+user1+10');
INSERT INTO `roles_permissions` VALUES (3, 'role1', '+user2+10');
INSERT INTO `roles_permissions` VALUES (2, 'role1', 'user1:*');
INSERT INTO `roles_permissions` VALUES (4, 'role1', 'user2:*');

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions`  (
  `id` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES ('29a57e6f-705a-4728-806e-e527421dc1cb', 'rO0ABXNyACpvcmcuYXBhY2hlLnNoaXJvLnNlc3Npb24ubWd0Lk9ubGluZVNlc3Npb26dHKG41YxibgMAA0wABnN0YXR1c3QAOUxvcmcvYXBhY2hlL3NoaXJvL3Nlc3Npb24vbWd0L09ubGluZVNlc3Npb24kT25saW5lU3RhdHVzO0wACnN5c3RlbUhvc3R0ABJMamF2YS9sYW5nL1N0cmluZztMAAl1c2VyQWdlbnRxAH4AAnhyACpvcmcuYXBhY2hlLnNoaXJvLnNlc3Npb24ubWd0LlNpbXBsZVNlc3Npb26dHKG41YxibgMAAHhwdwIAW3QAJDI5YTU3ZTZmLTcwNWEtNDcyOC04MDZlLWU1Mjc0MjFkYzFjYnNyAA5qYXZhLnV0aWwuRGF0ZWhqgQFLWXQZAwAAeHB3CAAAAXIm9+mheHEAfgAHdxMAAAAAABt3QAAJMTI3LjAuMC4xeH5yADdvcmcuYXBhY2hlLnNoaXJvLnNlc3Npb24ubWd0Lk9ubGluZVNlc3Npb24kT25saW5lU3RhdHVzAAAAAAAAAAASAAB4cgAOamF2YS5sYW5nLkVudW0AAAAAAAAAABIAAHhwdAAHb25fbGluZXQADjEyNy4wLjAuMTo4MDgwdAAZSW50ZWxsaUogSURFQS8xOTMuNTY2Mi41M3cCAwBxAH4ADXEAfgAKeA==');
INSERT INTO `sessions` VALUES ('2a58343b-14a2-4bf8-a591-e4d448a1795b', 'rO0ABXNyACpvcmcuYXBhY2hlLnNoaXJvLnNlc3Npb24ubWd0Lk9ubGluZVNlc3Npb26dHKG41YxibgMAA0wABnN0YXR1c3QAOUxvcmcvYXBhY2hlL3NoaXJvL3Nlc3Npb24vbWd0L09ubGluZVNlc3Npb24kT25saW5lU3RhdHVzO0wACnN5c3RlbUhvc3R0ABJMamF2YS9sYW5nL1N0cmluZztMAAl1c2VyQWdlbnRxAH4AAnhyACpvcmcuYXBhY2hlLnNoaXJvLnNlc3Npb24ubWd0LlNpbXBsZVNlc3Npb26dHKG41YxibgMAAHhwdwIAW3QAJDJhNTgzNDNiLTE0YTItNGJmOC1hNTkxLWU0ZDQ0OGExNzk1YnNyAA5qYXZhLnV0aWwuRGF0ZWhqgQFLWXQZAwAAeHB3CAAAAXInA7iCeHEAfgAHdxMAAAAAABt3QAAJMTI3LjAuMC4xeH5yADdvcmcuYXBhY2hlLnNoaXJvLnNlc3Npb24ubWd0Lk9ubGluZVNlc3Npb24kT25saW5lU3RhdHVzAAAAAAAAAAASAAB4cgAOamF2YS5sYW5nLkVudW0AAAAAAAAAABIAAHhwdAAHb25fbGluZXQADjEyNy4wLjAuMTo4MDgwdAAZSW50ZWxsaUogSURFQS8xOTMuNTY2Mi41M3cCAwBxAH4ADXEAfgAKeA==');
INSERT INTO `sessions` VALUES ('3966ba13-e631-491c-90f3-28c9ed83fd6d', 'rO0ABXNyACpvcmcuYXBhY2hlLnNoaXJvLnNlc3Npb24ubWd0Lk9ubGluZVNlc3Npb26dHKG41YxibgMAA0wABnN0YXR1c3QAOUxvcmcvYXBhY2hlL3NoaXJvL3Nlc3Npb24vbWd0L09ubGluZVNlc3Npb24kT25saW5lU3RhdHVzO0wACnN5c3RlbUhvc3R0ABJMamF2YS9sYW5nL1N0cmluZztMAAl1c2VyQWdlbnRxAH4AAnhyACpvcmcuYXBhY2hlLnNoaXJvLnNlc3Npb24ubWd0LlNpbXBsZVNlc3Npb26dHKG41YxibgMAAHhwdwIAW3QAJDM5NjZiYTEzLWU2MzEtNDkxYy05MGYzLTI4YzllZDgzZmQ2ZHNyAA5qYXZhLnV0aWwuRGF0ZWhqgQFLWXQZAwAAeHB3CAAAAXInAT5HeHEAfgAHdxMAAAAAABt3QAAJMTI3LjAuMC4xeH5yADdvcmcuYXBhY2hlLnNoaXJvLnNlc3Npb24ubWd0Lk9ubGluZVNlc3Npb24kT25saW5lU3RhdHVzAAAAAAAAAAASAAB4cgAOamF2YS5sYW5nLkVudW0AAAAAAAAAABIAAHhwdAAHb25fbGluZXQADjEyNy4wLjAuMTo4MDgwdAAZSW50ZWxsaUogSURFQS8xOTMuNTY2Mi41M3cCAwBxAH4ADXEAfgAKeA==');
INSERT INTO `sessions` VALUES ('5d652e94-9122-4b04-b8d0-29efbb83c448', 'rO0ABXNyACpvcmcuYXBhY2hlLnNoaXJvLnNlc3Npb24ubWd0Lk9ubGluZVNlc3Npb26dHKG41YxibgMAA0wABnN0YXR1c3QAOUxvcmcvYXBhY2hlL3NoaXJvL3Nlc3Npb24vbWd0L09ubGluZVNlc3Npb24kT25saW5lU3RhdHVzO0wACnN5c3RlbUhvc3R0ABJMamF2YS9sYW5nL1N0cmluZztMAAl1c2VyQWdlbnRxAH4AAnhyACpvcmcuYXBhY2hlLnNoaXJvLnNlc3Npb24ubWd0LlNpbXBsZVNlc3Npb26dHKG41YxibgMAAHhwdwIA23QAJDVkNjUyZTk0LTkxMjItNGIwNC1iOGQwLTI5ZWZiYjgzYzQ0OHNyAA5qYXZhLnV0aWwuRGF0ZWhqgQFLWXQZAwAAeHB3CAAAAXInCG6peHNxAH4ABncIAAABcicIjZt4dxkAAAAAABt3QAAPMDowOjA6MDowOjA6MDoxc3IAEWphdmEudXRpbC5IYXNoTWFwBQfawcMWYNEDAAJGAApsb2FkRmFjdG9ySQAJdGhyZXNob2xkeHA/QAAAAAAADHcIAAAAEAAAAAN0AFBvcmcuYXBhY2hlLnNoaXJvLnN1YmplY3Quc3VwcG9ydC5EZWZhdWx0U3ViamVjdENvbnRleHRfQVVUSEVOVElDQVRFRF9TRVNTSU9OX0tFWXNyABFqYXZhLmxhbmcuQm9vbGVhbs0gcoDVnPruAgABWgAFdmFsdWV4cAF0AE1vcmcuYXBhY2hlLnNoaXJvLnN1YmplY3Quc3VwcG9ydC5EZWZhdWx0U3ViamVjdENvbnRleHRfUFJJTkNJUEFMU19TRVNTSU9OX0tFWXNyADJvcmcuYXBhY2hlLnNoaXJvLnN1YmplY3QuU2ltcGxlUHJpbmNpcGFsQ29sbGVjdGlvbqh/WCXGowhKAwABTAAPcmVhbG1QcmluY2lwYWxzdAAPTGphdmEvdXRpbC9NYXA7eHBzcgAXamF2YS51dGlsLkxpbmtlZEhhc2hNYXA0wE5cEGzA+wIAAVoAC2FjY2Vzc09yZGVyeHEAfgAJP0AAAAAAAAx3CAAAABAAAAABdAAIaW5pUmVhbG1zcgAXamF2YS51dGlsLkxpbmtlZEhhc2hTZXTYbNdald0qHgIAAHhyABFqYXZhLnV0aWwuSGFzaFNldLpEhZWWuLc0AwAAeHB3DAAAABA/QAAAAAAAAXQABXpoYW5neHgAdwEBcQB+ABN4dAADa2V5c3IAEWphdmEubGFuZy5JbnRlZ2VyEuKgpPeBhzgCAAFJAAV2YWx1ZXhyABBqYXZhLmxhbmcuTnVtYmVyhqyVHQuU4IsCAAB4cAAAAHt4eH5yADdvcmcuYXBhY2hlLnNoaXJvLnNlc3Npb24ubWd0Lk9ubGluZVNlc3Npb24kT25saW5lU3RhdHVzAAAAAAAAAAASAAB4cgAOamF2YS5sYW5nLkVudW0AAAAAAAAAABIAAHhwdAAHb25fbGluZXQAFDA6MDowOjA6MDowOjA6MTo4MDgwdABzTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzgxLjAuNDA0NC4xMzggU2FmYXJpLzUzNy4zNncCAwBxAH4AInEAfgAfeA==');
INSERT INTO `sessions` VALUES ('8bf24329-47d2-453c-973a-30a3e2341c9e', 'rO0ABXNyACpvcmcuYXBhY2hlLnNoaXJvLnNlc3Npb24ubWd0Lk9ubGluZVNlc3Npb26dHKG41YxibgMAA0wABnN0YXR1c3QAOUxvcmcvYXBhY2hlL3NoaXJvL3Nlc3Npb24vbWd0L09ubGluZVNlc3Npb24kT25saW5lU3RhdHVzO0wACnN5c3RlbUhvc3R0ABJMamF2YS9sYW5nL1N0cmluZztMAAl1c2VyQWdlbnRxAH4AAnhyACpvcmcuYXBhY2hlLnNoaXJvLnNlc3Npb24ubWd0LlNpbXBsZVNlc3Npb26dHKG41YxibgMAAHhwdwIAW3QAJDhiZjI0MzI5LTQ3ZDItNDUzYy05NzNhLTMwYTNlMjM0MWM5ZXNyAA5qYXZhLnV0aWwuRGF0ZWhqgQFLWXQZAwAAeHB3CAAAAXInCAUheHEAfgAHdxMAAAAAABt3QAAJMTI3LjAuMC4xeH5yADdvcmcuYXBhY2hlLnNoaXJvLnNlc3Npb24ubWd0Lk9ubGluZVNlc3Npb24kT25saW5lU3RhdHVzAAAAAAAAAAASAAB4cgAOamF2YS5sYW5nLkVudW0AAAAAAAAAABIAAHhwdAAHb25fbGluZXQADjEyNy4wLjAuMTo4MDgwdAAZSW50ZWxsaUogSURFQS8xOTMuNTY2Mi41M3cCAwBxAH4ADXEAfgAKeA==');
INSERT INTO `sessions` VALUES ('97311220-8751-449f-98e4-5dbaa2097962', 'rO0ABXNyACpvcmcuYXBhY2hlLnNoaXJvLnNlc3Npb24ubWd0Lk9ubGluZVNlc3Npb26dHKG41YxibgMAA0wABnN0YXR1c3QAOUxvcmcvYXBhY2hlL3NoaXJvL3Nlc3Npb24vbWd0L09ubGluZVNlc3Npb24kT25saW5lU3RhdHVzO0wACnN5c3RlbUhvc3R0ABJMamF2YS9sYW5nL1N0cmluZztMAAl1c2VyQWdlbnRxAH4AAnhyACpvcmcuYXBhY2hlLnNoaXJvLnNlc3Npb24ubWd0LlNpbXBsZVNlc3Npb26dHKG41YxibgMAAHhwdwIAW3QAJDk3MzExMjIwLTg3NTEtNDQ5Zi05OGU0LTVkYmFhMjA5Nzk2MnNyAA5qYXZhLnV0aWwuRGF0ZWhqgQFLWXQZAwAAeHB3CAAAAXIm+mz2eHEAfgAHdxMAAAAAABt3QAAJMTI3LjAuMC4xeH5yADdvcmcuYXBhY2hlLnNoaXJvLnNlc3Npb24ubWd0Lk9ubGluZVNlc3Npb24kT25saW5lU3RhdHVzAAAAAAAAAAASAAB4cgAOamF2YS5sYW5nLkVudW0AAAAAAAAAABIAAHhwdAAHb25fbGluZXQADjEyNy4wLjAuMTo4MDgwdAAZSW50ZWxsaUogSURFQS8xOTMuNTY2Mi41M3cCAwBxAH4ADXEAfgAKeA==');
INSERT INTO `sessions` VALUES ('e79cc742-1241-45e9-bfbc-4f02250edc89', 'rO0ABXNyACpvcmcuYXBhY2hlLnNoaXJvLnNlc3Npb24ubWd0Lk9ubGluZVNlc3Npb26dHKG41YxibgMAA0wABnN0YXR1c3QAOUxvcmcvYXBhY2hlL3NoaXJvL3Nlc3Npb24vbWd0L09ubGluZVNlc3Npb24kT25saW5lU3RhdHVzO0wACnN5c3RlbUhvc3R0ABJMamF2YS9sYW5nL1N0cmluZztMAAl1c2VyQWdlbnRxAH4AAnhyACpvcmcuYXBhY2hlLnNoaXJvLnNlc3Npb24ubWd0LlNpbXBsZVNlc3Npb26dHKG41YxibgMAAHhwdwIAW3QAJGU3OWNjNzQyLTEyNDEtNDVlOS1iZmJjLTRmMDIyNTBlZGM4OXNyAA5qYXZhLnV0aWwuRGF0ZWhqgQFLWXQZAwAAeHB3CAAAAXInAm6GeHEAfgAHdxMAAAAAABt3QAAJMTI3LjAuMC4xeH5yADdvcmcuYXBhY2hlLnNoaXJvLnNlc3Npb24ubWd0Lk9ubGluZVNlc3Npb24kT25saW5lU3RhdHVzAAAAAAAAAAASAAB4cgAOamF2YS5sYW5nLkVudW0AAAAAAAAAABIAAHhwdAAHb25fbGluZXQADjEyNy4wLjAuMTo4MDgwdAAZSW50ZWxsaUogSURFQS8xOTMuNTY2Mi41M3cCAwBxAH4ADXEAfgAKeA==');

-- ----------------------------
-- Table structure for sys_permissions
-- ----------------------------
DROP TABLE IF EXISTS `sys_permissions`;
CREATE TABLE `sys_permissions`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `permission` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `available` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_sys_permissions_permission`(`permission`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_permissions
-- ----------------------------
INSERT INTO `sys_permissions` VALUES (50, 'user:create', '用户模块新增', 1);
INSERT INTO `sys_permissions` VALUES (51, 'user:update', '用户模块修改', 1);
INSERT INTO `sys_permissions` VALUES (52, 'menu:create', '菜单模块新增', 1);

-- ----------------------------
-- Table structure for sys_roles
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles`;
CREATE TABLE `sys_roles`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `available` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_sys_roles_role`(`role`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_roles
-- ----------------------------
INSERT INTO `sys_roles` VALUES (33, 'admin', '管理员', 1);
INSERT INTO `sys_roles` VALUES (34, 'user', '用户管理员', 1);

-- ----------------------------
-- Table structure for sys_roles_permissions
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles_permissions`;
CREATE TABLE `sys_roles_permissions`  (
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_roles_permissions
-- ----------------------------
INSERT INTO `sys_roles_permissions` VALUES (33, 50);
INSERT INTO `sys_roles_permissions` VALUES (33, 51);
INSERT INTO `sys_roles_permissions` VALUES (33, 52);
INSERT INTO `sys_roles_permissions` VALUES (34, 50);
INSERT INTO `sys_roles_permissions` VALUES (34, 51);

-- ----------------------------
-- Table structure for sys_users
-- ----------------------------
DROP TABLE IF EXISTS `sys_users`;
CREATE TABLE `sys_users`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `salt` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `locked` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_sys_users_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_users
-- ----------------------------
INSERT INTO `sys_users` VALUES (65, 'zhang', 'bd4c1d941ad49ea1b138b3622fc681be', '18eeb0c7c120c71e3898371f1b837d84', 0);
INSERT INTO `sys_users` VALUES (66, 'li', '6525b103c0f0f1444b07c0eb33c1c8e6', '2dfce8657f293c0b439536be3ca9455f', 0);
INSERT INTO `sys_users` VALUES (67, 'wu', 'e74721cde0dbf9d3ca5faf0b738e2900', '3a8e3bdd97090a6f6f11e2508ea2a5a8', 0);
INSERT INTO `sys_users` VALUES (68, 'wang', '86feecdc6d6e8c9ebfcf630769583715', 'd6f8bcc068c0002207378de4df6392d5', 1);

-- ----------------------------
-- Table structure for sys_users_roles
-- ----------------------------
DROP TABLE IF EXISTS `sys_users_roles`;
CREATE TABLE `sys_users_roles`  (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_users_roles
-- ----------------------------
INSERT INTO `sys_users_roles` VALUES (65, 33);

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_roles`(`username`, `role_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_roles
-- ----------------------------
INSERT INTO `user_roles` VALUES (1, 'zhang', 'role1');
INSERT INTO `user_roles` VALUES (2, 'zhang', 'role2');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password_salt` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_users_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'zhang', '123', NULL);
INSERT INTO `users` VALUES (2, 'wu', '$shiro1$SHA-512$1$$PJkJr+wlNU1VHa4hWQuybjjVPyFzuNPcPu5MBH56scHri4UQPjvnumE7MbtcnDYhTcnxSkL9ei/bhIVrylxEwg==', NULL);
INSERT INTO `users` VALUES (3, 'liu', 'a9a114054aa6758184314fbb959fbda4', '24520ee264eab73ec09451d0e9ea6aac');

SET FOREIGN_KEY_CHECKS = 1;
