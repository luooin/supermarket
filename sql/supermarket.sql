/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : supermarket

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 17/07/2024 18:10:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '配置文件' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES (1, 'picture1', 'http://localhost:8080/supermarket/upload/picture1.jpg');
INSERT INTO `config` VALUES (2, 'picture2', 'http://localhost:8080/supermarket/upload/picture2.jpg');
INSERT INTO `config` VALUES (3, 'picture3', 'http://localhost:8080/supermarket/upload/picture3.jpg');
INSERT INTO `config` VALUES (6, 'homepage', NULL);

-- ----------------------------
-- Table structure for gongyingshang
-- ----------------------------
DROP TABLE IF EXISTS `gongyingshang`;
CREATE TABLE `gongyingshang`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gongyingshangmingcheng` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '供应商名称',
  `gongyingshangleixing` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商类型',
  `fuzeren` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `lianxidianhua` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `youxiang` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `xiangxidizhi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '供应商' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gongyingshang
-- ----------------------------
INSERT INTO `gongyingshang` VALUES (21, '2024-03-10 09:20:31', '供应商名称1', '个体', '负责人1', '020-89819991', '773890001@qq.com', '详细地址1');
INSERT INTO `gongyingshang` VALUES (22, '2024-03-10 09:20:31', '供应商名称2', '个体', '负责人2', '020-89819992', '773890002@qq.com', '详细地址2');
INSERT INTO `gongyingshang` VALUES (23, '2024-03-10 09:20:31', '供应商名称3', '个体', '负责人3', '020-89819993', '773890003@qq.com', '详细地址3');
INSERT INTO `gongyingshang` VALUES (24, '2024-03-10 09:20:31', '供应商名称4', '个体', '负责人4', '020-89819994', '773890004@qq.com', '详细地址4');
INSERT INTO `gongyingshang` VALUES (25, '2024-03-10 09:20:31', '供应商名称5', '个体', '负责人5', '020-89819995', '773890005@qq.com', '详细地址5');
INSERT INTO `gongyingshang` VALUES (26, '2024-03-10 09:20:31', '供应商名称6', '个体', '负责人6', '020-89819996', '773890006@qq.com', '详细地址6');

-- ----------------------------
-- Table structure for jiaoliuhuifu
-- ----------------------------
DROP TABLE IF EXISTS `jiaoliuhuifu`;
CREATE TABLE `jiaoliuhuifu`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `biaoti` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `gonghao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `xingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `riqi` date NULL DEFAULT NULL COMMENT '日期',
  `jiaoliuhuifu` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '交流回复',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 107 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '交流回复' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jiaoliuhuifu
-- ----------------------------
INSERT INTO `jiaoliuhuifu` VALUES (101, '2024-03-10 09:20:31', '标题1', '工号1', '姓名1', '2024-03-10', '交流回复1');
INSERT INTO `jiaoliuhuifu` VALUES (102, '2024-03-10 09:20:31', '标题2', '工号2', '姓名2', '2024-03-10', '交流回复2');
INSERT INTO `jiaoliuhuifu` VALUES (103, '2024-03-10 09:20:31', '标题3', '工号3', '姓名3', '2024-03-10', '交流回复3');
INSERT INTO `jiaoliuhuifu` VALUES (104, '2024-03-10 09:20:31', '标题4', '工号4', '姓名4', '2024-03-10', '交流回复4');
INSERT INTO `jiaoliuhuifu` VALUES (105, '2024-03-10 09:20:31', '标题5', '工号5', '姓名5', '2024-03-10', '交流回复5');
INSERT INTO `jiaoliuhuifu` VALUES (106, '2024-03-10 09:20:31', '标题6', '工号6', '姓名6', '2024-03-10', '交流回复6');

-- ----------------------------
-- Table structure for jiaoliuxinxi
-- ----------------------------
DROP TABLE IF EXISTS `jiaoliuxinxi`;
CREATE TABLE `jiaoliuxinxi`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `biaoti` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `jiaoliuneirong` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '交流内容',
  `jiaoliuriqi` date NULL DEFAULT NULL COMMENT '交流日期',
  `gonghao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `xingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 97 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '交流信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jiaoliuxinxi
-- ----------------------------
INSERT INTO `jiaoliuxinxi` VALUES (91, '2024-03-10 09:20:31', '标题1', '交流内容1', '2024-03-10', '工号1', '姓名1');
INSERT INTO `jiaoliuxinxi` VALUES (92, '2024-03-10 09:20:31', '标题2', '交流内容2', '2024-03-10', '工号2', '姓名2');
INSERT INTO `jiaoliuxinxi` VALUES (93, '2024-03-10 09:20:31', '标题3', '交流内容3', '2024-03-10', '工号3', '姓名3');
INSERT INTO `jiaoliuxinxi` VALUES (94, '2024-03-10 09:20:31', '标题4', '交流内容4', '2024-03-10', '工号4', '姓名4');
INSERT INTO `jiaoliuxinxi` VALUES (95, '2024-03-10 09:20:31', '标题5', '交流内容5', '2024-03-10', '工号5', '姓名5');
INSERT INTO `jiaoliuxinxi` VALUES (96, '2024-03-10 09:20:31', '标题6', '交流内容6', '2024-03-10', '工号6', '姓名6');

-- ----------------------------
-- Table structure for qingjiaxinxi
-- ----------------------------
DROP TABLE IF EXISTS `qingjiaxinxi`;
CREATE TABLE `qingjiaxinxi`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `biaoti` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `qingjiariqi` date NOT NULL COMMENT '请假日期',
  `qingjiatianshu` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '请假天数',
  `jieshuriqi` date NOT NULL COMMENT '结束日期',
  `qingjianeirong` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '请假内容',
  `gonghao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `xingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `sfsh` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '否' COMMENT '是否审核',
  `shhf` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '审核回复',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 87 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '请假信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qingjiaxinxi
-- ----------------------------
INSERT INTO `qingjiaxinxi` VALUES (81, '2024-03-10 09:20:31', '标题1', '2024-03-10', '请假天数1', '2024-03-10', '请假内容1', '工号1', '姓名1', '是', '');
INSERT INTO `qingjiaxinxi` VALUES (82, '2024-03-10 09:20:31', '标题2', '2024-03-10', '请假天数2', '2024-03-10', '请假内容2', '工号2', '姓名2', '是', '');
INSERT INTO `qingjiaxinxi` VALUES (83, '2024-03-10 09:20:31', '标题3', '2024-03-10', '请假天数3', '2024-03-10', '请假内容3', '工号3', '姓名3', '是', '');
INSERT INTO `qingjiaxinxi` VALUES (84, '2024-03-10 09:20:31', '标题4', '2024-03-10', '请假天数4', '2024-03-10', '请假内容4', '工号4', '姓名4', '是', '');
INSERT INTO `qingjiaxinxi` VALUES (85, '2024-03-10 09:20:31', '标题5', '2024-03-10', '请假天数5', '2024-03-10', '请假内容5', '工号5', '姓名5', '是', '');
INSERT INTO `qingjiaxinxi` VALUES (86, '2024-03-10 09:20:31', '标题6', '2024-03-10', '请假天数6', '2024-03-10', '请假内容6', '工号6', '姓名6', '是', '');

-- ----------------------------
-- Table structure for shangbandaka
-- ----------------------------
DROP TABLE IF EXISTS `shangbandaka`;
CREATE TABLE `shangbandaka`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gonghao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `xingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `dakashijian` datetime(0) NULL DEFAULT NULL COMMENT '打卡时间',
  `dakaneirong` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '打卡内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '上班打卡' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of shangbandaka
-- ----------------------------
INSERT INTO `shangbandaka` VALUES (71, '2024-03-10 09:20:31', '工号1', '姓名1', '2024-03-10 17:20:31', '打卡内容1');
INSERT INTO `shangbandaka` VALUES (72, '2024-03-10 09:20:31', '工号2', '姓名2', '2024-03-10 17:20:31', '打卡内容2');
INSERT INTO `shangbandaka` VALUES (73, '2024-03-10 09:20:31', '工号3', '姓名3', '2024-03-10 17:20:31', '打卡内容3');
INSERT INTO `shangbandaka` VALUES (74, '2024-03-10 09:20:31', '工号4', '姓名4', '2024-03-10 17:20:31', '打卡内容4');
INSERT INTO `shangbandaka` VALUES (75, '2024-03-10 09:20:31', '工号5', '姓名5', '2024-03-10 17:20:31', '打卡内容5');
INSERT INTO `shangbandaka` VALUES (76, '2024-03-10 09:20:31', '工号6', '姓名6', '2024-03-10 17:20:31', '打卡内容6');
INSERT INTO `shangbandaka` VALUES (1721210826174, '2024-07-17 18:07:05', 'user', '姓名1', NULL, '');

-- ----------------------------
-- Table structure for shangpinjinhuo
-- ----------------------------
DROP TABLE IF EXISTS `shangpinjinhuo`;
CREATE TABLE `shangpinjinhuo`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `shangpinmingcheng` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `shangpinleixing` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品类型',
  `jinhuojiage` int(0) NOT NULL COMMENT '进货价格',
  `shuliang` int(0) NOT NULL COMMENT '数量',
  `zongjiage` int(0) NULL DEFAULT NULL COMMENT '总价格',
  `jinhuoriqi` date NULL DEFAULT NULL COMMENT '进货日期',
  `jinhuogongsi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '进货公司',
  `beizhu` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `gonghao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `xingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品进货' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of shangpinjinhuo
-- ----------------------------
INSERT INTO `shangpinjinhuo` VALUES (51, '2024-03-10 09:20:31', '商品名称1', '商品类型1', 1, 1, 1, '2024-03-10', '进货公司1', '备注1', '工号1', '姓名1');
INSERT INTO `shangpinjinhuo` VALUES (52, '2024-03-10 09:20:31', '商品名称2', '商品类型2', 2, 2, 2, '2024-03-10', '进货公司2', '备注2', '工号2', '姓名2');
INSERT INTO `shangpinjinhuo` VALUES (53, '2024-03-10 09:20:31', '商品名称3', '商品类型3', 3, 3, 3, '2024-03-10', '进货公司3', '备注3', '工号3', '姓名3');
INSERT INTO `shangpinjinhuo` VALUES (54, '2024-03-10 09:20:31', '商品名称4', '商品类型4', 4, 4, 4, '2024-03-10', '进货公司4', '备注4', '工号4', '姓名4');
INSERT INTO `shangpinjinhuo` VALUES (55, '2024-03-10 09:20:31', '商品名称5', '商品类型5', 5, 5, 5, '2024-03-10', '进货公司5', '备注5', '工号5', '姓名5');
INSERT INTO `shangpinjinhuo` VALUES (56, '2024-03-10 09:20:31', '商品名称6', '商品类型6', 6, 6, 6, '2024-03-10', '进货公司6', '备注6', '工号6', '姓名6');

-- ----------------------------
-- Table structure for shangpinkucun
-- ----------------------------
DROP TABLE IF EXISTS `shangpinkucun`;
CREATE TABLE `shangpinkucun`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `shangpinmingcheng` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `shangpinleixing` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品类型',
  `tupian` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `jiage` int(0) NOT NULL COMMENT '价格',
  `shuliang` int(0) NOT NULL COMMENT '数量',
  `faburiqi` date NULL DEFAULT NULL COMMENT '发布日期',
  `shangpinxiangqing` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品详情',
  `userid` bigint(0) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品库存' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of shangpinkucun
-- ----------------------------
INSERT INTO `shangpinkucun` VALUES (31, '2024-03-10 09:20:31', '商品名称1', '商品类型1', 'http://localhost:8080/supermarket/upload/shangpinkucun_tupian1.jpg', 1, 1, '2024-03-10', '商品详情1', 1);
INSERT INTO `shangpinkucun` VALUES (32, '2024-03-10 09:20:31', '商品名称2', '商品类型2', 'http://localhost:8080/supermarket/upload/shangpinkucun_tupian2.jpg', 2, 2, '2024-03-10', '商品详情2', 2);
INSERT INTO `shangpinkucun` VALUES (33, '2024-03-10 09:20:31', '商品名称3', '商品类型3', 'http://localhost:8080/supermarket/upload/shangpinkucun_tupian3.jpg', 3, 3, '2024-03-10', '商品详情3', 3);
INSERT INTO `shangpinkucun` VALUES (34, '2024-03-10 09:20:31', '商品名称4', '商品类型4', 'http://localhost:8080/supermarket/upload/shangpinkucun_tupian4.jpg', 4, 4, '2024-03-10', '商品详情4', 4);
INSERT INTO `shangpinkucun` VALUES (35, '2024-03-10 09:20:31', '商品名称5', '商品类型5', 'http://localhost:8080/supermarket/upload/shangpinkucun_tupian5.jpg', 5, 5, '2024-03-10', '商品详情5', 5);
INSERT INTO `shangpinkucun` VALUES (36, '2024-03-10 09:20:31', '商品名称6', '商品类型6', 'http://localhost:8080/supermarket/upload/shangpinkucun_tupian6.jpg', 6, 6, '2024-03-10', '商品详情6', 6);

-- ----------------------------
-- Table structure for shangpinleixing
-- ----------------------------
DROP TABLE IF EXISTS `shangpinleixing`;
CREATE TABLE `shangpinleixing`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `shangpinleixing` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品类型' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of shangpinleixing
-- ----------------------------
INSERT INTO `shangpinleixing` VALUES (41, '2024-03-10 09:20:31', '商品类型1');
INSERT INTO `shangpinleixing` VALUES (42, '2024-03-10 09:20:31', '商品类型2');
INSERT INTO `shangpinleixing` VALUES (43, '2024-03-10 09:20:31', '商品类型3');
INSERT INTO `shangpinleixing` VALUES (44, '2024-03-10 09:20:31', '商品类型4');
INSERT INTO `shangpinleixing` VALUES (45, '2024-03-10 09:20:31', '商品类型5');
INSERT INTO `shangpinleixing` VALUES (46, '2024-03-10 09:20:31', '商品类型6');

-- ----------------------------
-- Table structure for shangpinxiaoshou
-- ----------------------------
DROP TABLE IF EXISTS `shangpinxiaoshou`;
CREATE TABLE `shangpinxiaoshou`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `shangpinmingcheng` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `shangpinleixing` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品类型',
  `jiage` int(0) NULL DEFAULT NULL COMMENT '价格',
  `shuliang` int(0) NOT NULL COMMENT '数量',
  `zongjiage` int(0) NULL DEFAULT NULL COMMENT '总价格',
  `xiaoshouduixiang` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '销售对象',
  `xiaoshouriqi` date NULL DEFAULT NULL COMMENT '销售日期',
  `gonghao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `xingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品销售' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of shangpinxiaoshou
-- ----------------------------
INSERT INTO `shangpinxiaoshou` VALUES (61, '2024-03-10 09:20:31', '商品名称1', '商品类型1', 1, 1, 1, '销售对象1', '2024-03-10', '工号1', '姓名1');
INSERT INTO `shangpinxiaoshou` VALUES (62, '2024-03-10 09:20:31', '商品名称2', '商品类型2', 2, 2, 2, '销售对象2', '2024-03-10', '工号2', '姓名2');
INSERT INTO `shangpinxiaoshou` VALUES (63, '2024-03-10 09:20:31', '商品名称3', '商品类型3', 3, 3, 3, '销售对象3', '2024-03-10', '工号3', '姓名3');
INSERT INTO `shangpinxiaoshou` VALUES (64, '2024-03-10 09:20:31', '商品名称4', '商品类型4', 4, 4, 4, '销售对象4', '2024-03-10', '工号4', '姓名4');
INSERT INTO `shangpinxiaoshou` VALUES (65, '2024-03-10 09:20:31', '商品名称5', '商品类型5', 5, 5, 5, '销售对象5', '2024-03-10', '工号5', '姓名5');
INSERT INTO `shangpinxiaoshou` VALUES (66, '2024-03-10 09:20:31', '商品名称6', '商品类型6', 6, 6, 6, '销售对象6', '2024-03-10', '工号6', '姓名6');

-- ----------------------------
-- Table structure for token
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(0) NOT NULL COMMENT '用户id',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `tablename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名',
  `role` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色',
  `token` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '新增时间',
  `expiratedtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'token表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of token
-- ----------------------------
INSERT INTO `token` VALUES (1, 1, 'abo', 'users', '管理员', 'n96zk2wcaorm1xv14jg288wjkilu3ua0', '2024-03-10 09:21:26', '2024-07-17 18:53:21');
INSERT INTO `token` VALUES (2, 11, 'user', 'yuangong', '员工', '8vn2d7t6iub0phokbsf8hc2yg37id2vv', '2024-07-17 18:06:46', '2024-07-17 19:06:46');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `role` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', '123456', '管理员', '2024-03-10 09:20:31');

-- ----------------------------
-- Table structure for yuangong
-- ----------------------------
DROP TABLE IF EXISTS `yuangong`;
CREATE TABLE `yuangong`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gonghao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工号',
  `mima` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `xingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `xingbie` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `touxiang` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `bumen` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门',
  `zhiwei` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位',
  `dianhua` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `gonghao`(`gonghao`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '员工' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of yuangong
-- ----------------------------
INSERT INTO `yuangong` VALUES (11, '2024-03-10 09:20:31', 'user', '123456', '姓名1', '男', 'http://localhost:8080/supermarket/upload/yuangong_touxiang1.jpg', '部门1', '职位1', '13823888881');
INSERT INTO `yuangong` VALUES (12, '2024-03-10 09:20:31', '员工2', '123456', '姓名2', '男', 'http://localhost:8080/supermarket/upload/yuangong_touxiang2.jpg', '部门2', '职位2', '13823888882');
INSERT INTO `yuangong` VALUES (13, '2024-03-10 09:20:31', '员工3', '123456', '姓名3', '男', 'http://localhost:8080/supermarket/upload/yuangong_touxiang3.jpg', '部门3', '职位3', '13823888883');
INSERT INTO `yuangong` VALUES (14, '2024-03-10 09:20:31', '员工4', '123456', '姓名4', '男', 'http://localhost:8080/supermarket/upload/yuangong_touxiang4.jpg', '部门4', '职位4', '13823888884');
INSERT INTO `yuangong` VALUES (15, '2024-03-10 09:20:31', '员工5', '123456', '姓名5', '男', 'http://localhost:8080/supermarket/upload/yuangong_touxiang5.jpg', '部门5', '职位5', '13823888885');
INSERT INTO `yuangong` VALUES (16, '2024-03-10 09:20:31', '员工6', '123456', '姓名6', '男', 'http://localhost:8080/supermarket/upload/yuangong_touxiang6.jpg', '部门6', '职位6', '13823888886');

SET FOREIGN_KEY_CHECKS = 1;
