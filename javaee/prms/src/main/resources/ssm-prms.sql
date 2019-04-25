/*
 Navicat Premium Data Transfer

 Source Server         : Mysql
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : ssm-prms

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 25/04/2019 23:11:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phoneNum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('E61D65F673D54F68B0861025C69773DB', '张三', '小三', '18888888888', 'zs@163.com');

-- ----------------------------
-- Table structure for order_traveller
-- ----------------------------
DROP TABLE IF EXISTS `order_traveller`;
CREATE TABLE `order_traveller`  (
  `orderId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `travellerId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`orderId`, `travellerId`) USING BTREE,
  INDEX `travellerId`(`travellerId`) USING BTREE,
  CONSTRAINT `order_traveller_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_traveller_ibfk_2` FOREIGN KEY (`travellerId`) REFERENCES `traveller` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_traveller
-- ----------------------------
INSERT INTO `order_traveller` VALUES ('0E7231DC797C486290E8713CA3C6ECCC', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
INSERT INTO `order_traveller` VALUES ('2FF351C4AC744E2092DCF08CFD314420', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
INSERT INTO `order_traveller` VALUES ('5DC6A48DD4E94592AE904930EA866AFA', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
INSERT INTO `order_traveller` VALUES ('A0657832D93E4B10AE88A2D4B70B1A28', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
INSERT INTO `order_traveller` VALUES ('3081770BC3984EF092D9E99760FDABDE', 'EE7A71FB6945483FBF91543DBE851960');
INSERT INTO `order_traveller` VALUES ('55F9AF582D5A4DB28FB4EC3199385762', 'EE7A71FB6945483FBF91543DBE851960');
INSERT INTO `order_traveller` VALUES ('96CC8BD43C734CC2ACBFF09501B4DD5D', 'EE7A71FB6945483FBF91543DBE851960');
INSERT INTO `order_traveller` VALUES ('CA005CF1BE3C4EF68F88ABC7DF30E976', 'EE7A71FB6945483FBF91543DBE851960');
INSERT INTO `order_traveller` VALUES ('E4DD4C45EED84870ABA83574A801083E', 'EE7A71FB6945483FBF91543DBE851960');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '无意义, 主键 UUID',
  `orderNum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号, 不为空,唯一',
  `orderTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
  `peopleCount` int(11) NULL DEFAULT 0 COMMENT '出行人数',
  `orderDesc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单描述(其它信息)',
  `payType` int(11) NULL DEFAULT NULL COMMENT '支付方式(0 支付宝, 1 微信, 2 其它)',
  `orderStatus` int(11) NOT NULL DEFAULT 0 COMMENT '订单状态(0 未支付, 1已支付)',
  `productId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品id 外键',
  `memberId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员(联系人) id 外键',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `orderNum`(`orderNum`) USING BTREE,
  INDEX `productId`(`productId`) USING BTREE,
  INDEX `memberId`(`memberId`) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`memberId`) REFERENCES `member` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('0E7231DC797C486290E8713CA3C6ECCC', '12345', '2018-02-03 12:00:00', 2, '没什么', 0, 1, '676C5BD1D35E429A8C2E114939C5685A', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('2FF351C4AC744E2092DCF08CFD314420', '67890', '2018-02-03 12:00:00', 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('3081770BC3984EF092D9E99760FDABDE', '55555', '2018-02-03 12:00:00', 2, '没什么', 0, 1, '9F71F01CB448476DAFB309AA6DF9497F', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('55F9AF582D5A4DB28FB4EC3199385762', '33333', '2018-02-03 12:00:00', 2, '没什么', 0, 1, '9F71F01CB448476DAFB309AA6DF9497F', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('5DC6A48DD4E94592AE904930EA866AFA', '54321', '2018-02-03 12:00:00', 2, '没什么', 0, 1, '676C5BD1D35E429A8C2E114939C5685A', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('96CC8BD43C734CC2ACBFF09501B4DD5D', '22222', '2018-02-03 12:00:00', 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('A0657832D93E4B10AE88A2D4B70B1A28', '98765', '2018-02-03 12:00:00', 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('CA005CF1BE3C4EF68F88ABC7DF30E976', '44444', '2018-02-03 12:00:00', 2, '没什么', 0, 1, '9F71F01CB448476DAFB309AA6DF9497F', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('E4DD4C45EED84870ABA83574A801083E', '11111', '2018-02-03 12:00:00', 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT 'id',
  `permissionName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源名',
  `url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源连接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('9f62f412f7a1405f881e8edab6bbdc4e', 'role findAll', '/role/findAll');
INSERT INTO `permission` VALUES ('d4548794671211e9a73800ff298f8311', 'user findAll', '/user/findAll.do');
INSERT INTO `permission` VALUES ('eebdbb1d671211e9a73800ff298f8311', 'product findAll', '/product/findAll.do');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '无意义, 主键 UUID',
  `productNum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品编号, 不为空,唯一',
  `productName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品名称(路线名称)',
  `cityName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '出发城市',
  `departureTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '出发时间',
  `productPrice` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '产品价格',
  `productDesc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品描述',
  `productStatus` int(11) NOT NULL DEFAULT 0 COMMENT '产品状态(0 关闭, 1 开启)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `productNum`(`productNum`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('12B7ABF2A4C544568B0A7C69F36BF8B7', 'aqqje-002', '上海五日游', '上海', '2018-04-25 14:30:00', 1800.00, '魔都我来了', 0);
INSERT INTO `product` VALUES ('676C5BD1D35E429A8C2E114939C5685A', 'aqqje-001', '北京三日游', '北京', '2018-10-10 10:10:00', 1200.00, '不错的旅行', 1);
INSERT INTO `product` VALUES ('912741514abe4c5e9dfb798799c5e29d', 'aqqje-05', '山东一日游', '上海', '2019-04-17 10:50:00', 1000.00, '山东一日游', 1);
INSERT INTO `product` VALUES ('9F71F01CB448476DAFB309AA6DF9497F', 'aqqje-003', '北京三日游', '北京', '2018-10-10 10:10:00', 1200.00, '不错的旅行', 1);
INSERT INTO `product` VALUES ('aaa294dcec314e12825d61c49f8eae1c', 'aqqje-005', '山东一日游', '上海', '2019-04-10 10:50:00', 1000.00, '山东一日游', 1);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT 'id',
  `roleName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名',
  `roleDesc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('16442fc366ed11e9a73800ff298f8311', 'USER', '用户');
INSERT INTO `role` VALUES ('3a6d861d66ed11e9a73800ff298f8311', 'ADMIN', '管理员');
INSERT INTO `role` VALUES ('ac67699b3c1240e0b75accada337b23d', 'PEOPLE', '人群');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `permissionId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源id',
  `roleId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色id',
  PRIMARY KEY (`permissionId`, `roleId`) USING BTREE,
  INDEX `roleId`(`roleId`) USING BTREE,
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('d4548794671211e9a73800ff298f8311', '16442fc366ed11e9a73800ff298f8311');
INSERT INTO `role_permission` VALUES ('d4548794671211e9a73800ff298f8311', '3a6d861d66ed11e9a73800ff298f8311');
INSERT INTO `role_permission` VALUES ('eebdbb1d671211e9a73800ff298f8311', '3a6d861d66ed11e9a73800ff298f8311');
INSERT INTO `role_permission` VALUES ('9f62f412f7a1405f881e8edab6bbdc4e', 'ac67699b3c1240e0b75accada337b23d');

-- ----------------------------
-- Table structure for syslog
-- ----------------------------
DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT 'id',
  `visitTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '访问时间',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '访问用户',
  `ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '访问IP',
  `url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '访问链接',
  `executionTime` int(11) NULL DEFAULT NULL COMMENT '访问时长',
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方法',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of syslog
-- ----------------------------
INSERT INTO `syslog` VALUES ('10690c43cfdc49e28ccec491612bce7d', '2019-04-25 23:04:28', 'aqqje', '0:0:0:0:0:0:0:1', '/product/findAll.do', 10, '[类名]cn.prms.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('10aeb18f79724dbc917b30be1d795874', '2019-04-25 22:54:12', 'aqqje', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 15, '[类名]cn.prms.controller.SysLogController[方法名]findAll');
INSERT INTO `syslog` VALUES ('1ff88ada2f994aa98b059d880a2b0702', '2019-04-25 22:58:24', 'aqqje', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 71, '[类名]cn.prms.controller.SysLogController[方法名]findAll');
INSERT INTO `syslog` VALUES ('20665e0101f34c969342d53529844ced', '2019-04-25 23:04:12', 'aqqje', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 0, '[类名]cn.prms.controller.OrdersController[方法名]findAll');
INSERT INTO `syslog` VALUES ('217232e88934457ba321cc7e4bce65e4', '2019-04-25 23:03:54', 'aqqje', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 17, '[类名]cn.prms.controller.SysLogController[方法名]findAll');
INSERT INTO `syslog` VALUES ('2292bc011d0f434491068a8beb7ff618', '2019-04-25 23:03:24', 'aqqje', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 83, '[类名]cn.prms.controller.SysLogController[方法名]findAll');
INSERT INTO `syslog` VALUES ('43cbe263afe649359c0ce2c367cf0d15', '2019-04-25 22:58:33', 'aqqje', '0:0:0:0:0:0:0:1', '/user/findAll.do', 241, '[类名]cn.prms.controller.UserController[方法名]findAll');
INSERT INTO `syslog` VALUES ('6594d2ecae07465a9b5bc1c163768719', '2019-04-25 22:58:28', 'aqqje', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 10, '[类名]cn.prms.controller.SysLogController[方法名]findAll');
INSERT INTO `syslog` VALUES ('69074c214cda44e390cad7bf22d63d3a', '2019-04-25 23:03:47', 'aqqje', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 25, '[类名]cn.prms.controller.SysLogController[方法名]findAll');
INSERT INTO `syslog` VALUES ('6cacef579273494ea27d68331cd934eb', '2019-04-25 23:04:02', 'aqqje', '0:0:0:0:0:0:0:1', '/product/findAll.do', 116, '[类名]cn.prms.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('77596ca2968e43bf8fba1f14d978c03c', '2019-04-25 22:54:28', 'aqqje', '0:0:0:0:0:0:0:1', '/user/findAll.do', 79, '[类名]cn.prms.controller.UserController[方法名]findAll');
INSERT INTO `syslog` VALUES ('7a5105efbda444e8ab2a3b1e043db85d', '2019-04-25 23:04:10', 'aqqje', '0:0:0:0:0:0:0:1', '/product/findAll.do', 14, '[类名]cn.prms.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('7d75d80287224c5a98f4f8acf185376b', '2019-04-25 22:58:36', 'aqqje', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 27, '[类名]cn.prms.controller.SysLogController[方法名]findAll');
INSERT INTO `syslog` VALUES ('86493dcfb13449ee83ac10a9a1f68df8', '2019-04-25 23:04:31', 'aqqje', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 0, '[类名]cn.prms.controller.OrdersController[方法名]findAll');
INSERT INTO `syslog` VALUES ('9d6a2f50fb7948e7aa1f09fda7e12338', '2019-04-25 22:53:31', 'aqqje', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 686, '[类名]cn.prms.controller.SysLogController[方法名]findAll');
INSERT INTO `syslog` VALUES ('af9bd9dc293245eab7b50efae449805e', '2019-04-25 22:54:32', 'aqqje', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 9, '[类名]cn.prms.controller.SysLogController[方法名]findAll');
INSERT INTO `syslog` VALUES ('bc7f3fc94f15428493e7081466b282ef', '2019-04-25 23:04:06', 'aqqje', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 1, '[类名]cn.prms.controller.OrdersController[方法名]findAll');
INSERT INTO `syslog` VALUES ('cca06d2be7be43558928a774933047ed', '2019-04-25 23:03:56', 'aqqje', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 11, '[类名]cn.prms.controller.SysLogController[方法名]findAll');
INSERT INTO `syslog` VALUES ('fe9cc3196ad744d58c415f7f844a667e', '2019-04-25 23:03:50', 'aqqje', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 11, '[类名]cn.prms.controller.SysLogController[方法名]findAll');

-- ----------------------------
-- Table structure for traveller
-- ----------------------------
DROP TABLE IF EXISTS `traveller`;
CREATE TABLE `traveller`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phoneNum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `credentialsType` int(11) NULL DEFAULT NULL,
  `credentialsNum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `travellerType` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of traveller
-- ----------------------------
INSERT INTO `traveller` VALUES ('3FE27DF2A4E44A6DBC5D0FE4651D3D3E', '张龙', '男', '13333333333', 0, '123456789009876543', 0);
INSERT INTO `traveller` VALUES ('EE7A71FB6945483FBF91543DBE851960', '张小龙', '男', '15555555555', 0, '987654321123456789', 1);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phoneNum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('2f6032c366ece9a73800ff298f8311', '1042136232@qq.com', 'aqqje', '$2a$10$PSZkY1LC1i8UQyCnffbFougP/H6ra2OM73ryZogWTu7ZkZFcKKnyW', '13745588461', 1);
INSERT INTO `users` VALUES ('6fd533275ad84a68a47853968359d886', '1840804741@qq.com', 'zhangshan', '$2a$10$Qp9FWPIaEIZ93rMuCGU4fO5e3JpGTS41y1QxPR3I61HRieILarpAG', '13548542654', 1);
INSERT INTO `users` VALUES ('d4113ce73d674592bb80599430fdb0bc', '102136232@gmail.com', 'lisi', '$2a$10$8Lylr4cmkPHCKGVQX.LWmeAm7D2Gp0uSN3Y2CqOpk2IccaCrmlGrG', '13548542654', 1);
INSERT INTO `users` VALUES ('d547ad7b66ec11e9a73800ff298f8311', '1042136231@qq.com', 'yjgm', '$2a$10$2fvXpoeoSGmpJPnvpc1T/u7.kUEvq6ho/6XuohDxk/Thnra/T01kC', '13745588461', 1);

-- ----------------------------
-- Table structure for users_role
-- ----------------------------
DROP TABLE IF EXISTS `users_role`;
CREATE TABLE `users_role`  (
  `userId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `roleId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`userId`, `roleId`) USING BTREE,
  INDEX `roleId`(`roleId`) USING BTREE,
  CONSTRAINT `users_role_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_role_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_role
-- ----------------------------
INSERT INTO `users_role` VALUES ('2f6032c366ece9a73800ff298f8311', '16442fc366ed11e9a73800ff298f8311');
INSERT INTO `users_role` VALUES ('6fd533275ad84a68a47853968359d886', '16442fc366ed11e9a73800ff298f8311');
INSERT INTO `users_role` VALUES ('d547ad7b66ec11e9a73800ff298f8311', '16442fc366ed11e9a73800ff298f8311');
INSERT INTO `users_role` VALUES ('2f6032c366ece9a73800ff298f8311', '3a6d861d66ed11e9a73800ff298f8311');
INSERT INTO `users_role` VALUES ('6fd533275ad84a68a47853968359d886', 'ac67699b3c1240e0b75accada337b23d');

SET FOREIGN_KEY_CHECKS = 1;
