
/*
Navicat MySQL Data Transfer
springboot之前的版本,缺少很多最终版的字段
Source Server         : smallPC
Source Server Version : 50725
Source Host           : 192.168.2.14:3306
Source Database       : o2o

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-03-16 22:44:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_area
-- ----------------------------
DROP TABLE IF EXISTS `tb_area`;
CREATE TABLE `tb_area` (
`area_id`  int(2) NOT NULL AUTO_INCREMENT ,
`area_name`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`priority`  int(2) NOT NULL DEFAULT 0 ,
`create_time`  datetime NULL DEFAULT NULL ,
`last_edit_time`  datetime NULL DEFAULT NULL ,
PRIMARY KEY (`area_id`),
UNIQUE INDEX `UK_AREA` (`area_name`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='区域\r\n'
AUTO_INCREMENT=7

;

-- ----------------------------
-- Records of tb_area
-- ----------------------------
BEGIN;
INSERT INTO `tb_area` VALUES ('3', '东苑', '12', '2017-06-04 19:12:58', '2017-06-04 19:12:58'), ('4', '南苑', '10', '2017-06-04 19:13:09', '2017-06-04 19:13:09'), ('5', '西苑', '9', '2017-06-04 19:13:18', '2017-06-04 19:13:18'), ('6', '北苑', '7', '2017-06-04 19:13:29', '2017-06-04 19:13:29');
COMMIT;

-- ----------------------------
-- Table structure for tb_head_line
-- ----------------------------
DROP TABLE IF EXISTS `tb_head_line`;
CREATE TABLE `tb_head_line` (
`line_id`  int(100) NOT NULL AUTO_INCREMENT ,
`line_name`  varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`line_link`  varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`line_img`  varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`priority`  int(2) NULL DEFAULT NULL ,
`enable_status`  int(2) NOT NULL DEFAULT 0 ,
`create_time`  datetime NULL DEFAULT NULL ,
`last_edit_time`  datetime NULL DEFAULT NULL ,
PRIMARY KEY (`line_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='头条'
AUTO_INCREMENT=16

;

-- ----------------------------
-- Records of tb_head_line
-- ----------------------------
BEGIN;
INSERT INTO `tb_head_line` VALUES ('1', '1', 'www.hao123.com', '/o2o/123', '1', '1', '2019-02-15 17:05:54', '2019-02-15 17:06:34'), ('11', '1', '1', '/upload/images/item/headtitle/2017061320315746624.jpg', '1', '1', '2017-06-13 20:31:57', '2017-06-13 20:31:57'), ('12', '2', '2', '/upload/images/item/headtitle/2017061320371786788.jpg', '2', '1', '2017-06-13 20:37:17', '2017-06-13 20:37:17'), ('14', '3', '3', '/upload/images/item/headtitle/2017061320393452772.jpg', '3', '1', '2017-06-13 20:39:34', '2017-06-13 20:39:34'), ('15', '4', '4', '/upload/images/item/headtitle/2017061320400198256.jpg', '4', '1', '2017-06-13 20:40:01', '2017-06-13 20:40:01');
COMMIT;

-- ----------------------------
-- Table structure for tb_local_auth
-- ----------------------------
DROP TABLE IF EXISTS `tb_local_auth`;
CREATE TABLE `tb_local_auth` (
`local_auth_id`  int(10) NOT NULL AUTO_INCREMENT ,
`user_id`  int(10) NOT NULL ,
`username`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`password`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`create_time`  datetime NULL DEFAULT NULL ,
`last_edit_time`  datetime NULL DEFAULT NULL ,
PRIMARY KEY (`local_auth_id`),
FOREIGN KEY (`user_id`) REFERENCES `tb_person_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
UNIQUE INDEX `uk_local_profile` (`username`) USING BTREE ,
INDEX `fk_localauth_profile` (`user_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='本地账号'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of tb_local_auth
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tb_person_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_person_info`;
CREATE TABLE `tb_person_info` (
`user_id`  int(10) NOT NULL AUTO_INCREMENT ,
`name`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`profile_img`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`email`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`gender`  varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`enable_status`  int(2) NOT NULL DEFAULT 0 COMMENT '0:禁止使用本商城,1:允许使用本商城' ,
`user_type`  int(2) NOT NULL DEFAULT 1 COMMENT '1:顾客,2:店家,3:超级管理员' ,
`create_time`  datetime NULL DEFAULT NULL ,
`last_edit_time`  datetime NULL DEFAULT NULL ,
PRIMARY KEY (`user_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='账户信息'
AUTO_INCREMENT=12

;

-- ----------------------------
-- Records of tb_person_info
-- ----------------------------
BEGIN;
INSERT INTO `tb_person_info` VALUES ('1', '测试', 'test', 'test', '1', '1', '2', null, null), ('8', '李翔', 'http://wx.qlogo.cn/mmopen/XZumId0qMA815ApfWI2zibDnRMahic6SU0wHib2HgGJj5narL2ymRaI4Kn2Tx2Q8UfkicibvjVicu3De6fDYRMfo0uGW0SGicibxVnJ9/0', 'test', '1', '1', '2', '2017-06-04 19:01:09', '2017-06-04 19:01:09'), ('9', '龙州一条街客服', 'http://wx.qlogo.cn/mmopen/icF4iau8Sj7b0FiakC6ibBoTPmkvLpIX9YhWkNyEIGYfzYyqBiag2M3q2rnxSlXAh95UDHdWgywvEW5bN5FBzFPFazxBzqHTRqNwn/0', 'test', '1', '1', '2', '2017-06-04 21:20:43', '2017-06-04 21:20:43'), ('10', 'king', 'http://wx.qlogo.cn/mmopen/XZumId0qMA815ApfWI2zibDLckaAaV6QgcBJP0saJSDTuicZBd35HzPXUebLPSlexCIPJsLs3w6lG0xmwn3EZNicj04dJh4We7C/0', 'test', '1', '1', '2', '2017-06-07 01:36:16', '2017-06-07 01:36:16'), ('11', '音策', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKCWfIBicEwS3U0legxxQd5XFpZibBXVPyz0wphvvtaXqiblzQF2GqE28c7j8FGpuYqBCg1QRJThEzuw/0', 'test', '1', '1', '2', '2017-09-18 23:39:38', '2017-09-18 23:39:38');
COMMIT;

-- ----------------------------
-- Table structure for tb_product
-- ----------------------------
DROP TABLE IF EXISTS `tb_product`;
CREATE TABLE `tb_product` (
`product_id`  int(100) NOT NULL AUTO_INCREMENT ,
`product_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`product_desc`  varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`img_addr`  varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' ,
`normal_price`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`promotion_price`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`priority`  int(2) NOT NULL DEFAULT 0 ,
`create_time`  datetime NULL DEFAULT NULL ,
`last_edit_time`  datetime NULL DEFAULT NULL ,
`enable_status`  int(2) NOT NULL DEFAULT 0 ,
`product_category_id`  int(11) NULL DEFAULT NULL ,
`shop_id`  int(20) NOT NULL DEFAULT 0 ,
PRIMARY KEY (`product_id`),
FOREIGN KEY (`product_category_id`) REFERENCES `tb_product_category` (`product_category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`shop_id`) REFERENCES `tb_shop` (`shop_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `fk_product_procate` (`product_category_id`) USING BTREE ,
INDEX `fk_product_shop` (`shop_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商品'
AUTO_INCREMENT=16

;

-- ----------------------------
-- Records of tb_product
-- ----------------------------
BEGIN;
INSERT INTO `tb_product` VALUES ('4', '美式咖啡', '一丝醇香，流连忘返', '/upload/images/item/shop/15/2017060523302118864.jpg', '12', '11', '12', '2017-06-05 23:30:21', '2017-06-05 23:49:34', '1', null, '15'), ('5', '转让八成新XX牌小车', '诚心转让八成新XX牌小车，有意者请连续8866666', '/upload/images/item/shop/15/2017060523485289817.jpg', '100000', '60000', '100', '2017-06-05 23:48:52', '2017-06-05 23:48:52', '1', '9', '15'), ('6', '转让电瓶车一辆', '转让电瓶车一辆，可当面看车，电话：1111222', '/upload/images/item/shop/15/2017060608490188656.jpg', '3000', '1200', '99', '2017-06-06 08:49:01', '2017-06-06 08:50:57', '1', '9', '15'), ('7', '转让半新旧男装摩托车一辆', '转让半新旧男装摩托车一辆，当面验车，电话：3333666', '1/2019013002155035699.jpg', '8000', '3000', '98', '2019-01-28 02:18:20', '2019-02-12 15:22:08', '1', '9', '15'), ('8', '大量二手书籍转让', '大量二手书籍转让，电话详谈，或上门看书。联系电话：5556666   地址：东苑XX楼', '/upload/images/item/shop/16/2017060608574074561.jpg', '0', '0', '100', '2017-06-06 08:57:40', '2017-06-06 08:57:40', '1', '10', '16'), ('9', '<十万个为什么>', '出手一本《十万个为什么》，8成新，想要的可以联系：9998886', '/upload/images/item/shop/16/2017060609025850665.png', '25', '10', '98', '2017-06-06 09:02:58', '2017-06-06 09:02:58', '1', '10', '16'), ('10', '珍珠奶茶', '珍珠奶茶，弹性十足，香甜美味。', '/upload/images/item/shop/20/2017060620114126875.jpg', '10', '8', '100', '2017-06-06 20:11:41', '2017-06-06 20:11:41', '1', '11', '20'), ('11', '红豆奶茶', '红豆和奶茶的完美结合，夏天不错的选择。', '/upload/images/item/shop/20/2017060620363014331.jpg', '10', '8', '99', '2017-06-06 20:36:30', '2017-06-06 20:36:30', '1', '11', '20'), ('12', '绿豆冰', '清热解毒。', '/upload/images/item/shop/20/2017060620384620536.jpg', '8', '7', '98', '2017-06-06 20:38:46', '2017-06-06 20:38:46', '1', '11', '20'), ('13', '芒果冰沙', '新鲜芒果制作。', '/upload/images/item/shop/20/2017060620472125629.jpg', '15', '13', '95', '2017-06-06 20:47:21', '2017-06-06 20:47:21', '1', '11', '20'), ('14', '鲜榨芒果汁', '新鲜芒果新鲜榨，香甜可口，解暑降温。', '/upload/images/item/shop/20/2017060620492297296.jpg', '8', '8', '93', '2017-06-06 20:49:22', '2017-06-06 20:49:22', '1', '11', '20'), ('15', '鲜榨西瓜汁', '每一杯都是鲜榨的，现榨现卖。', '/upload/images/item/shop/20/2017060621052824735.jpg', '8', '8', '90', '2017-06-06 21:05:28', '2017-06-06 21:05:28', '1', '11', '20');
COMMIT;

-- ----------------------------
-- Table structure for tb_product_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_product_category`;
CREATE TABLE `tb_product_category` (
`product_category_id`  int(11) NOT NULL AUTO_INCREMENT ,
`product_category_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`priority`  int(2) NULL DEFAULT 0 ,
`create_time`  datetime NULL DEFAULT NULL ,
`shop_id`  int(20) NOT NULL DEFAULT 0 ,
PRIMARY KEY (`product_category_id`),
FOREIGN KEY (`shop_id`) REFERENCES `tb_shop` (`shop_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `fk_procate_shop` (`shop_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商品种类'
AUTO_INCREMENT=16

;

-- ----------------------------
-- Records of tb_product_category
-- ----------------------------
BEGIN;
INSERT INTO `tb_product_category` VALUES ('3', '测试分类3', '1', null, '1'), ('4', '商品类别1', '1', '2019-01-15 11:42:27', '1'), ('5', '商品类别2', '2', '2019-01-15 11:42:27', '1'), ('9', '二手车', '100', null, '15'), ('10', '二手书籍', '100', null, '16'), ('11', '奶茶', '100', null, '20'), ('12', '咖啡', '50', null, '20'), ('13', '甜品', '30', null, '20'), ('14', '小吃', '20', null, '20'), ('15', '茗茶', '10', null, '20');
COMMIT;

-- ----------------------------
-- Table structure for tb_product_img
-- ----------------------------
DROP TABLE IF EXISTS `tb_product_img`;
CREATE TABLE `tb_product_img` (
`product_img_id`  int(20) NOT NULL AUTO_INCREMENT ,
`img_addr`  varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`img_desc`  varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`priority`  int(2) NULL DEFAULT 0 ,
`create_time`  datetime NULL DEFAULT NULL ,
`product_id`  int(20) NULL DEFAULT NULL ,
PRIMARY KEY (`product_img_id`),
FOREIGN KEY (`product_id`) REFERENCES `tb_product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `fk_proimg_product` (`product_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='商品图片'
AUTO_INCREMENT=23

;

-- ----------------------------
-- Records of tb_product_img
-- ----------------------------
BEGIN;
INSERT INTO `tb_product_img` VALUES ('20', '1\\2019021215224081538.jpg', null, null, '2019-02-12 15:22:41', '7'), ('21', '1\\2019021215224095690.jpg', null, null, '2019-02-12 15:22:41', '7'), ('22', '1\\2019021215224063283.jpg', null, null, '2019-02-12 15:22:41', '7');
COMMIT;

-- ----------------------------
-- Table structure for tb_shop
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop`;
CREATE TABLE `tb_shop` (
`shop_id`  int(10) NOT NULL AUTO_INCREMENT ,
`owner_id`  int(10) NOT NULL COMMENT '店铺创建人' ,
`area_id`  int(5) NULL DEFAULT NULL ,
`shop_category_id`  int(11) NULL DEFAULT NULL ,
`shop_name`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`shop_desc`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`shop_addr`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`phone`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`shop_img`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`priority`  int(3) NULL DEFAULT 0 ,
`create_time`  datetime NULL DEFAULT NULL ,
`last_edit_time`  datetime NULL DEFAULT NULL ,
`enable_status`  int(2) NOT NULL DEFAULT 0 ,
`advice`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`shop_id`),
FOREIGN KEY (`area_id`) REFERENCES `tb_area` (`area_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`owner_id`) REFERENCES `tb_person_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`shop_category_id`) REFERENCES `tb_shop_category` (`shop_category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `fk_shop_area` (`area_id`) USING BTREE ,
INDEX `fk_shop_profile` (`owner_id`) USING BTREE ,
INDEX `fk_shop_shopcate` (`shop_category_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='店铺信息'
AUTO_INCREMENT=29

;

-- ----------------------------
-- Records of tb_shop
-- ----------------------------
BEGIN;
INSERT INTO `tb_shop` VALUES ('1', '1', '3', '1', '测试的店铺3', 'testDesc', 'testAddr', 'testPhone', 'testImg', '1', '2019-01-10 15:02:22', null, '1', '审核中'), ('2', '1', '3', '1', '测试的店铺2', 'testDesc', 'testAddr', 'testPhone', 'testImg', '1', '2019-01-06 12:58:42', null, '1', '审核中'), ('15', '8', '3', '14', '二手车辆', '二手汽车、摩托车、电车等交通工具交易信息。', '面向全市', '0000000', '/upload/images/item/shop/15/2017060522042982266.png', '100', '2017-06-05 22:04:29', '2017-08-25 10:50:16', '1', null), ('16', '8', '3', '15', '旧书籍交易', '旧书籍交易信息', '旧书籍交易板块', '0000000', '/upload/images/item/shop/16/2017060608534289617.png', '99', '2017-06-06 08:53:42', '2017-06-06 08:54:40', '1', null), ('17', '8', '3', '17', '靓仔靓妹美容护理中心', '二十年手艺，专业护理秀发受损头发。美容美发首选。', '东苑北面二号门', '4445556', '/upload/images/item/shop/17/2017060609084595067.jpg', '0', '2017-06-06 09:08:45', '2017-06-06 09:45:32', '1', null), ('18', '8', '3', '18', '一剪没理发中心', '专业洗剪吹，又好又便宜。', '东苑北面3号门面', '9998887', '/upload/images/item/shop/18/2017060609110899956.jpg', '0', '2017-06-06 09:11:08', '2017-06-06 09:45:38', '1', null), ('19', '8', '4', '20', '吃得饱大排档', '吃得好又吃得饱，朋友聚会好地方。可预约。', '南苑东面10号门面', '1234567', '/upload/images/item/shop/19/2017060609140699548.jpg', '0', '2017-06-06 09:14:06', '2017-06-06 09:45:43', '1', null), ('20', '8', '4', '22', '香喷喷奶茶店', '鲜榨果汁、奶茶等饮品。', '南苑东面5号门面', '77788444', '/upload/images/item/shop/20/2017060609163395401.jpg', '30', '2017-06-06 09:16:33', '2017-06-07 16:24:07', '1', '\"\"'), ('21', '8', '5', '25', '海陆空量贩KTV', '订包厢电话：8889997。节假日请预约。', '西苑1号门面', '8889997', '/upload/images/item/shop/21/2017060609194286080.jpg', '0', '2017-06-06 09:19:42', '2017-06-06 09:45:59', '1', null), ('22', '8', '5', '24', '幽城室逃生娱乐城', '考验你的智商，和小伙伴们一起来挑战吧。', '西苑3号楼第二层', '6666333', '/upload/images/item/shop/22/2017060609223853062.jpg', '0', '2017-06-06 09:22:38', '2017-06-06 09:46:04', '1', null), ('23', '8', '6', '29', '威水程序设计培训教育', '保教抱会，前途无量。', '北苑2栋5楼', '66633111', '/upload/images/item/shop/23/2017060609275777519.png', '0', '2017-06-06 09:27:57', '2017-06-06 09:46:09', '1', null), ('24', '8', '6', '30', '武林风舞蹈培训', '专业培训舞蹈，声乐。', '北苑9懂10楼', '5555555', '/upload/images/item/shop/24/2017060609354459045.png', '0', '2017-06-06 09:35:44', '2017-06-06 09:46:13', '1', null), ('25', '8', '6', '14', '易行交通工具租赁服务中心', '本店租赁各种汽车，摩托车等。详情请拨打电话咨询。电话：2222222', '1栋3号4号门面', '2222222', '/upload/images/item/shop/25/2017060609381150709.png', '40', '2017-06-06 09:38:11', '2017-06-06 19:58:32', '1', null), ('26', '8', '6', '31', '有声有色', '出租各种演出道具，乐器，服装等。', '北苑15号门面', '7777777', '/upload/images/item/shop/26/2017060609431259039.png', '41', '2017-06-06 09:43:12', '2017-06-06 19:58:45', '1', null), ('27', '8', '3', '22', '冰冻夏天奶茶店', '本店出售各种冷饮，奶茶，冰花，鲜榨果汁。', '东苑7懂2号门面', '8889999', '/upload/images/item/shop/27/2017060715512185473.jpg', '10', '2017-06-07 15:51:21', '2017-06-07 16:22:28', '1', '\"\"'), ('28', '9', '3', '14', 'test', 'dfafaf', 'sdafafafa', '3424242', '/upload/images/item/shop/28/2017082500103690946.png', '0', '2017-08-25 00:10:36', '2017-08-25 00:10:36', '0', null);
COMMIT;

-- ----------------------------
-- Table structure for tb_shop_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop_category`;
CREATE TABLE `tb_shop_category` (
`shop_category_id`  int(22) NOT NULL AUTO_INCREMENT ,
`shop_category_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`shop_category_desc`  varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' ,
`shop_category_img`  varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`priority`  int(2) NOT NULL DEFAULT 0 ,
`create_time`  datetime NULL DEFAULT NULL ,
`last_edit_time`  datetime NULL DEFAULT NULL ,
`parent_id`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`shop_category_id`),
FOREIGN KEY (`parent_id`) REFERENCES `tb_shop_category` (`shop_category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `fk_shop_category_self` (`parent_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='店铺种类'
AUTO_INCREMENT=33

;

-- ----------------------------
-- Records of tb_shop_category
-- ----------------------------
BEGIN;
INSERT INTO `tb_shop_category` VALUES ('1', '咖啡奶茶', '咖啡奶茶', 'test', '1', null, null, null), ('2', '星巴克', '星巴克', 'test', '2', null, null, '1'), ('10', '二手市场', '二手商品交易', '/upload/images/item/shopcategory/2017061223272255687.png', '100', '2017-06-04 20:10:58', '2017-06-12 23:27:22', null), ('11', '美容美发', '美容美发', '/upload/images/item/shopcategory/2017061223273314635.png', '99', '2017-06-04 20:12:57', '2017-06-12 23:27:33', null), ('12', '美食饮品', '美食饮品', '/upload/images/item/shopcategory/2017061223274213433.png', '98', '2017-06-04 20:15:21', '2017-06-12 23:27:42', null), ('13', '休闲娱乐', '休闲娱乐', '/upload/images/item/shopcategory/2017061223275121460.png', '97', '2017-06-04 20:19:29', '2017-06-12 23:27:51', null), ('14', '旧车', '旧车', '/upload/images/item/shopcategory/2017060420315183203.png', '80', '2017-06-04 20:31:51', '2017-06-04 20:31:51', '10'), ('15', '二手书籍', '二手书籍', '/upload/images/item/shopcategory/2017060420322333745.png', '79', '2017-06-04 20:32:23', '2017-06-04 20:32:23', '10'), ('17', '护理', '护理', '/upload/images/item/shopcategory/2017060420372391702.png', '76', '2017-06-04 20:37:23', '2017-06-04 20:37:23', '11'), ('18', '理发', '理发', '/upload/images/item/shopcategory/2017060420374775350.png', '74', '2017-06-04 20:37:47', '2017-06-04 20:37:47', '11'), ('20', '大排档', '大排档', '/upload/images/item/shopcategory/2017060420460491494.png', '59', '2017-06-04 20:46:04', '2017-06-04 20:46:04', '12'), ('22', '奶茶店', '奶茶店', '/upload/images/item/shopcategory/2017060420464594520.png', '58', '2017-06-04 20:46:45', '2017-06-04 20:46:45', '12'), ('24', '密室逃生', '密室逃生', '/upload/images/item/shopcategory/2017060420500783376.png', '56', '2017-06-04 20:50:07', '2017-06-04 21:45:53', '13'), ('25', 'KTV', 'KTV', '/upload/images/item/shopcategory/2017060420505834244.png', '57', '2017-06-04 20:50:58', '2017-06-04 20:51:14', '13'), ('27', '培训教育', '培训教育', '/upload/images/item/shopcategory/2017061223280082147.png', '96', '2017-06-04 21:51:36', '2017-06-12 23:28:00', null), ('28', '租赁市场', '租赁市场', '/upload/images/item/shopcategory/2017061223281361578.png', '95', '2017-06-04 21:53:52', '2017-06-12 23:28:13', null), ('29', '程序设计', '程序设计', '/upload/images/item/shopcategory/2017060421593496807.png', '50', '2017-06-04 21:59:34', '2017-06-04 21:59:34', '27'), ('30', '声乐舞蹈', '声乐舞蹈', '/upload/images/item/shopcategory/2017060421595843693.png', '49', '2017-06-04 21:59:58', '2017-06-04 21:59:58', '27'), ('31', '演出道具', '演出道具', '/upload/images/item/shopcategory/2017060422114076152.png', '45', '2017-06-04 22:11:40', '2017-06-04 22:11:40', '28'), ('32', '交通工具', '交通工具', '/upload/images/item/shopcategory/2017060422121144586.png', '44', '2017-06-04 22:12:11', '2017-06-04 22:12:11', '28');
COMMIT;

-- ----------------------------
-- Table structure for tb_wechat_auth
-- ----------------------------
DROP TABLE IF EXISTS `tb_wechat_auth`;
CREATE TABLE `tb_wechat_auth` (
`wechat_auth_id`  int(10) NOT NULL AUTO_INCREMENT ,
`user_id`  int(10) NOT NULL ,
`open_id`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`create_time`  datetime NULL DEFAULT NULL ,
PRIMARY KEY (`wechat_auth_id`),
FOREIGN KEY (`user_id`) REFERENCES `tb_person_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
UNIQUE INDEX `open_id` (`open_id`) USING BTREE ,
INDEX `fk_wechatauth_profile` (`user_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='微信账号'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of tb_wechat_auth
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Auto increment value for tb_area
-- ----------------------------
ALTER TABLE `tb_area` AUTO_INCREMENT=7;

-- ----------------------------
-- Auto increment value for tb_head_line
-- ----------------------------
ALTER TABLE `tb_head_line` AUTO_INCREMENT=16;

-- ----------------------------
-- Auto increment value for tb_local_auth
-- ----------------------------
ALTER TABLE `tb_local_auth` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for tb_person_info
-- ----------------------------
ALTER TABLE `tb_person_info` AUTO_INCREMENT=12;

-- ----------------------------
-- Auto increment value for tb_product
-- ----------------------------
ALTER TABLE `tb_product` AUTO_INCREMENT=16;

-- ----------------------------
-- Auto increment value for tb_product_category
-- ----------------------------
ALTER TABLE `tb_product_category` AUTO_INCREMENT=16;

-- ----------------------------
-- Auto increment value for tb_product_img
-- ----------------------------
ALTER TABLE `tb_product_img` AUTO_INCREMENT=23;

-- ----------------------------
-- Auto increment value for tb_shop
-- ----------------------------
ALTER TABLE `tb_shop` AUTO_INCREMENT=29;

-- ----------------------------
-- Auto increment value for tb_shop_category
-- ----------------------------
ALTER TABLE `tb_shop_category` AUTO_INCREMENT=33;

-- ----------------------------
-- Auto increment value for tb_wechat_auth
-- ----------------------------
ALTER TABLE `tb_wechat_auth` AUTO_INCREMENT=1;
