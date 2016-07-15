/*
Navicat MySQL Data Transfer

Source Server         : llsydn
Source Server Version : 50087
Source Host           : localhost:3306
Source Database       : lyw_parttime

Target Server Type    : MYSQL
Target Server Version : 50087
File Encoding         : 65001

Date: 2016-06-28 23:36:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY  (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('asdasd', 'asdasd');
INSERT INTO `admin` VALUES ('llsydn', '428527');

-- ----------------------------
-- Table structure for business
-- ----------------------------
DROP TABLE IF EXISTS `business`;
CREATE TABLE `business` (
  `id` int(11) NOT NULL auto_increment,
  `password` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `phone` char(11) NOT NULL,
  `email` varchar(20) NOT NULL,
  `level` int(11) NOT NULL COMMENT '信用',
  `pic` varchar(40) NOT NULL COMMENT '头像',
  `address` varchar(40) NOT NULL,
  `description` varchar(500) default NULL COMMENT '描述',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business
-- ----------------------------
INSERT INTO `business` VALUES ('1', '110', '超人商店', '110', '110@qq.com', '0', '', '', '');
INSERT INTO `business` VALUES ('2', '1q2w', '一拳', '13543844601', '921977939@qq.com', '1', '2.jpg', '南区', '');
INSERT INTO `business` VALUES ('3', '123', '无限', '223', '9145', '0', '', '广东', '');
INSERT INTO `business` VALUES ('4', '1q2w3e', '才2345', '15361363220', '1102y@qq.com', '1', '', '南区街道', '我是一个兵，然而你是什么鬼？');
INSERT INTO `business` VALUES ('5', 'asdasd', '想的x', '13255555556', 'asd@qq.com', '1', '', '南区街道', '');
INSERT INTO `business` VALUES ('8', '1q2w3e', '阿萨德', '15361363226', '1234@qq.com', '0', '', '南区街道', '');
INSERT INTO `business` VALUES ('9', '1q2w3e4r', '大神', '13250490621', 'saf@263.com', '0', '', '南区街道', null);
INSERT INTO `business` VALUES ('10', '428527', '中山名师教育中心', '13543844606', '1091391667@qq.com', '1', '', '南区街道', '一家教育机构');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` varchar(40) NOT NULL,
  `message_id` int(11) NOT NULL,
  `content` char(250) NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '07e81992-073f-44ca-99b7-954ca5fa1962', '36', 'asd(=・ω・=)', '2016-05-26 00:52:14');
INSERT INTO `comment` VALUES ('2', '07e81992-073f-44ca-99b7-954ca5fa1962', '36', '(〜￣△￣)〜1', '2016-05-26 00:52:21');
INSERT INTO `comment` VALUES ('3', '07e81992-073f-44ca-99b7-954ca5fa1962', '36', '(=・ω・=)', '2016-05-26 00:52:40');
INSERT INTO `comment` VALUES ('4', '07e81992-073f-44ca-99b7-954ca5fa1962', '36', '(〜￣△￣)〜1', '2016-05-26 00:53:20');
INSERT INTO `comment` VALUES ('5', '07e81992-073f-44ca-99b7-954ca5fa1962', '34', '(〜￣△￣)〜1', '2016-05-05 18:50:15');
INSERT INTO `comment` VALUES ('6', '07e81992-073f-44ca-99b7-954ca5fa1962', '44', '（#-_-)┯━┯', '2016-05-26 20:19:05');
INSERT INTO `comment` VALUES ('7', '07e81992-073f-44ca-99b7-954ca5fa1962', '44', '（#-_-)┯━┯', '2016-05-26 20:19:22');
INSERT INTO `comment` VALUES ('8', '07e81992-073f-44ca-99b7-954ca5fa1962', '44', 'asd(ﾟДﾟ≡ﾟдﾟ)!?', '2016-05-26 20:46:41');
INSERT INTO `comment` VALUES ('9', '07e81992-073f-44ca-99b7-954ca5fa1962', '44', '(泣)(^・ω・^)', '2016-05-26 22:09:07');
INSERT INTO `comment` VALUES ('10', '07e81992-073f-44ca-99b7-954ca5fa1962', '44', 'ヽ(`Д´)ﾉ', '2016-05-26 22:09:19');
INSERT INTO `comment` VALUES ('11', '07e81992-073f-44ca-99b7-954ca5fa1962', '44', '(〜￣△￣)〜', '2016-05-26 22:09:27');
INSERT INTO `comment` VALUES ('12', '07e81992-073f-44ca-99b7-954ca5fa1962', '44', '(´_ゝ｀)', '2016-05-26 22:10:06');
INSERT INTO `comment` VALUES ('13', '07e81992-073f-44ca-99b7-954ca5fa1962', '44', '(〜￣△￣)〜', '2016-05-26 22:13:54');
INSERT INTO `comment` VALUES ('14', '07e81992-073f-44ca-99b7-954ca5fa1962', '44', '(=・ω・=)', '2016-05-26 22:19:14');
INSERT INTO `comment` VALUES ('15', '07e81992-073f-44ca-99b7-954ca5fa1962', '44', 'Σ(ﾟдﾟ;)', '2016-05-26 22:19:21');
INSERT INTO `comment` VALUES ('16', '07e81992-073f-44ca-99b7-954ca5fa1962', '44', '(>_>)', '2016-05-26 22:19:24');
INSERT INTO `comment` VALUES ('17', '07e81992-073f-44ca-99b7-954ca5fa1962', '34', '（￣へ￣）', '2016-05-26 22:19:56');
INSERT INTO `comment` VALUES ('18', '07e81992-073f-44ca-99b7-954ca5fa1962', '34', 'ヽ(`Д´)ﾉ', '2016-05-26 22:19:59');
INSERT INTO `comment` VALUES ('19', '07e81992-073f-44ca-99b7-954ca5fa1962', '44', '(ﾟДﾟ≡ﾟдﾟ)!?', '2016-05-26 23:33:38');
INSERT INTO `comment` VALUES ('20', '07e81992-073f-44ca-99b7-954ca5fa1962', '32', '（￣へ￣）', '2016-05-26 23:36:31');
INSERT INTO `comment` VALUES ('21', '07e81992-073f-44ca-99b7-954ca5fa1962', '93', '(ﾟДﾟ≡ﾟдﾟ)!?', '2016-05-27 00:06:07');
INSERT INTO `comment` VALUES ('22', '5dcd0eed-148d-4029-9350-1c2b1440d545', '187', '真个兼职真的是不错的', '2016-06-04 18:43:54');
INSERT INTO `comment` VALUES ('23', '06915c0b-62e6-41b7-a81e-67be8a303a42', '194', '这个兼职，真的是不错的', '2016-06-05 16:00:13');
INSERT INTO `comment` VALUES ('24', '06915c0b-62e6-41b7-a81e-67be8a303a42', '190', '爱打瞌睡的骄傲是扩大', '2016-06-05 17:24:23');
INSERT INTO `comment` VALUES ('25', '985b1c05-bbcb-49c7-b6bd-31bf6364bf5c', '194', '不好的，这个兼职，很坑爹呀', '2016-06-05 17:37:07');
INSERT INTO `comment` VALUES ('26', '99f7b21c-8b0c-45b5-aed9-8efda8797629', '194', 'asdaa', '2016-06-05 19:03:00');
INSERT INTO `comment` VALUES ('27', '99f7b21c-8b0c-45b5-aed9-8efda8797629', '34', 'asdasdsa', '2016-06-05 19:54:54');
INSERT INTO `comment` VALUES ('28', '99f7b21c-8b0c-45b5-aed9-8efda8797629', '34', '好好的呀。。。。', '2016-06-05 19:55:26');
INSERT INTO `comment` VALUES ('29', '99f7b21c-8b0c-45b5-aed9-8efda8797629', '34', '是的撒大大说的', '2016-06-05 19:56:03');
INSERT INTO `comment` VALUES ('30', '99f7b21c-8b0c-45b5-aed9-8efda8797629', '194', '(⌒▽⌒)', '2016-06-11 15:13:16');
INSERT INTO `comment` VALUES ('31', '99f7b21c-8b0c-45b5-aed9-8efda8797629', '194', '(〜￣△￣)〜', '2016-06-15 17:52:36');
INSERT INTO `comment` VALUES ('32', '14b5a056-c31e-4ddb-85c9-ec2e16f6ce97', '187', 'dasddasdasdas', '2016-06-28 21:35:59');
INSERT INTO `comment` VALUES ('33', '99f7b21c-8b0c-45b5-aed9-8efda8797629', '190', 'adasdasdasdas', '2016-06-28 21:39:04');

-- ----------------------------
-- Table structure for commodity
-- ----------------------------
DROP TABLE IF EXISTS `commodity`;
CREATE TABLE `commodity` (
  `commodity_id` int(11) NOT NULL auto_increment,
  `commodity_name` char(20) NOT NULL,
  PRIMARY KEY  (`commodity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of commodity
-- ----------------------------
INSERT INTO `commodity` VALUES ('1', '传单派发');
INSERT INTO `commodity` VALUES ('2', '钟点工');
INSERT INTO `commodity` VALUES ('3', '服务员');
INSERT INTO `commodity` VALUES ('4', '生活配送');
INSERT INTO `commodity` VALUES ('5', '护工');
INSERT INTO `commodity` VALUES ('6', '问卷调查');
INSERT INTO `commodity` VALUES ('7', '家教');
INSERT INTO `commodity` VALUES ('8', '技工');
INSERT INTO `commodity` VALUES ('9', '志愿者');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL auto_increment,
  `title` char(24) NOT NULL,
  `content` char(250) NOT NULL,
  `date_time` datetime NOT NULL,
  `commodity_id` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_commodity` USING BTREE (`commodity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('32', 'dvK2LznZIq', 'PJ0E4gVFr2F5gTwNgLRRz8LhVB7EHnF1XyKT6DJy', '2016-04-09 23:47:02', '1', '1');
INSERT INTO `message` VALUES ('33', 'ovbcjOXcWY', 'TlUlOVZZSdhAZYLJcDr8bm5cz4t2CP80t9duCshQ', '2016-04-09 23:12:34', '1', '1');
INSERT INTO `message` VALUES ('34', 'zUFtcobDth', 'RfyPiRhEd0dTGyyZ7uUWNZoS1luhKKmoHbCp1Kv9', '2016-04-10 01:42:23', '1', '1');
INSERT INTO `message` VALUES ('35', 'NzjHoH8sI4', '3QX4lmzB9NlaFFbJVkGihlImwm33VhwBhsiUxL2J', '2016-04-09 23:37:09', '1', '1');
INSERT INTO `message` VALUES ('36', 'BHvgDd2pKl', 'joRWYUuvX4jdWVFpQPryjLGXB033ZD27k8w1nHbF', '2016-04-10 00:15:13', '1', '1');
INSERT INTO `message` VALUES ('37', 'Rm1TfqcxY5', 'mmxuDyKT4u3G5fOaewJVjAPgGtadphYTn3Xtl9yb', '2016-04-10 01:36:25', '1', '1');
INSERT INTO `message` VALUES ('38', 'zxPoi9IZAQ', 'iO1wn8nmt884OGQZhhnR2s1AFqZvpnu84KoBC9K7', '2016-04-09 23:04:54', '1', '1');
INSERT INTO `message` VALUES ('39', 'wPrygttMiY', 'RbaaackRb94JgZ1YFdVO85PL8gKMw4FUrj4eN6Yp', '2016-04-10 01:16:54', '1', '1');
INSERT INTO `message` VALUES ('40', 'lLAuw1mzDg', 'itnjgb0hghurxgwGHh9LbtFLDIvgEgc5EP4EWyPj', '2016-04-10 01:08:50', '1', '1');
INSERT INTO `message` VALUES ('41', 'pbxWZWyPkZ', 'OX9K9jYNSOgJH7nmwlZKDMNvX9GORGInzxQrxcen', '2016-04-10 01:30:19', '1', '1');
INSERT INTO `message` VALUES ('42', 'OSM772F4bx', '1iirajVvCnViARph14bvRDr772Ii9J3Ta1pOGQ1p', '2016-04-10 00:52:28', '1', '1');
INSERT INTO `message` VALUES ('43', 'FIsWd7JauN', 'meUJJiaL8gJIdM3PMiWGr0yz2kmE1ZHnF1Vo3WoW', '2016-04-09 23:36:51', '1', '1');
INSERT INTO `message` VALUES ('44', 'Xtj11Q1pOH', 'TdemVo3VkHls74QRBho1IoFYGnG8tNqxiGoKms1A', '2016-04-10 00:29:28', '1', '1');
INSERT INTO `message` VALUES ('45', 'viQ96SVQiM', 'QIVixCnOMk9Bq9l5eLVbX5rLmltdrpAwHMByOdwL', '2016-04-10 01:44:15', '1', '1');
INSERT INTO `message` VALUES ('46', '2JqKjaK50C', 'WGqT3pJfTA4tYghrcuGMH0NLj6owhHrXkDZSiGlw', '2016-04-09 23:39:57', '1', '1');
INSERT INTO `message` VALUES ('47', 'jbQuNj0WzO', 'duDzM1DXKERbcgyOhO4KmqT2jkvqqJauOpsTXWEj', '2016-04-09 23:49:27', '1', '1');
INSERT INTO `message` VALUES ('48', 'bl48k36dDm', 'IklCQgAXUwGGg3mt5U5zsnoDShAZ0TkMMmigfhxG', '2016-04-10 00:26:29', '1', '1');
INSERT INTO `message` VALUES ('49', '5j7uV05hYS', 'iGlwruV06kaJZzLU7I550AO6U6ELI7j26gO7Zsai', '2016-04-10 00:47:47', '1', '1');
INSERT INTO `message` VALUES ('50', 'TWRiMRMal4', 'auK9jWEe4sWbUQm6fM1CP95OFIsYkyDnOMiXKIcF', '2016-04-10 00:16:09', '1', '1');
INSERT INTO `message` VALUES ('51', 'RiMRK3ONnk', 'jteBbUSuDAQlYGmCO5NzhxFBQfxL61F6mjmG9AjF', '2016-04-09 23:01:22', '1', '1');
INSERT INTO `message` VALUES ('52', 'Ol7pu5OFGi', 'fb3ysrEPZjsbl22R2qSVPeuAjC00Scb94LpBEf7H', '2016-04-10 01:25:55', '1', '1');
INSERT INTO `message` VALUES ('53', 'IpLpCFlAJJ', 'i8BrhUwIQW04auLeFtfDggnVmS9XaMgQeuzgqang', '2016-04-10 01:31:10', '1', '1');
INSERT INTO `message` VALUES ('54', 'aAgqbvNiWC', 'aOpsV2iaNiZSftqzo7fJJjcWVCbRDp1F8w3xm2Vn', '2016-04-10 01:22:21', '1', '1');
INSERT INTO `message` VALUES ('55', 'yILw92AEmF', '6j8zgvwX2cIPQx0f3pH5aqu1s3LsSQqsPCsiTsqB', '2016-04-10 00:09:17', '1', '1');
INSERT INTO `message` VALUES ('56', 'SyWVB5sTWP', 'ckUmWsl9zgqappCIyrpyn3ZBWHviNV7BwEvqsPAl', '2016-04-10 00:41:56', '1', '1');
INSERT INTO `message` VALUES ('57', 'Auzca3BIzA', '2fZ0XBYWzTyZ4gYRgxL1HeVLRULU9QCoWo0E6owd', '2016-04-09 23:39:09', '1', '1');
INSERT INTO `message` VALUES ('58', 'bz6FTgwFzI', 'HaAiwAd9X9IXtmeWP95QNgO81zDhnPTOduFIpLou', '2016-04-09 22:56:30', '1', '1');
INSERT INTO `message` VALUES ('59', 'adobAeekMK', 'fRoeQjTp9meVKNCwCnQX6v0mCPabdqhZWzSwNfHz', '2016-04-10 00:13:29', '1', '1');
INSERT INTO `message` VALUES ('60', '6AttLdDnQV', 'UCd1ltahHwn9rAuuQAehvvTN9afB6wbbdmYD5mpP', '2016-04-10 00:34:45', '1', '1');
INSERT INTO `message` VALUES ('61', 'VjGg7FQ2t6', 'Web5G2XwAedgsleVLSXXMSSCiral23YxAaVZZQ6Q', '2016-04-10 00:31:56', '1', '1');
INSERT INTO `message` VALUES ('62', 'NMi0XDaIXu', 'ojgd8TSz4t1tahKKj9DASrqFR92xtyden3WnS8SP', '2016-04-09 23:35:01', '1', '1');
INSERT INTO `message` VALUES ('63', 'ePjTn2Wp4V', 'ixBishRkSemYCZUttNopG3551HibUN74NEIqQMdB', '2016-04-09 22:58:06', '1', '1');
INSERT INTO `message` VALUES ('64', 'URrqH0MKgS', 'pi6rMnnzCd5BC5sRMbm9tMhUA06lhd3t2DRgB2fV', '2016-04-10 00:41:35', '1', '1');
INSERT INTO `message` VALUES ('65', 'NBrgQfyRsx', 'celVreIJmpNzmUkHpNzjHpLtUWN2F1WusDFjlD0W', '2016-04-10 00:03:14', '1', '1');
INSERT INTO `message` VALUES ('66', 'HIid0g8GSc', 'dhAYVwHJrRQqtXaMgPbfwIS3whDcVQiLOAkIrV8K', '2016-04-09 23:02:06', '1', '1');
INSERT INTO `message` VALUES ('67', 'y1jip1GdQr', 'tUXVB2dNcrqGZIrV7EKBDdZ9DyGBPberpweqi4fU', '2016-04-10 00:19:25', '1', '1');
INSERT INTO `message` VALUES ('68', 'faZe5wdkSc', 'eo8l8uTRrtRJVhsiYLNuV037hSm1UizN72Ih6v2y', '2016-04-09 23:48:11', '1', '1');
INSERT INTO `message` VALUES ('69', 'sLk9ED3bCn', 'QW19wZcUM1BN0s9biMPFGh9K9nfVIEVxKXq3QVTA', '2016-04-10 01:35:48', '1', '1');
INSERT INTO `message` VALUES ('70', 'loNDC033ZC', 'XKIcHIkkvplks9fB5v5JgVIF0Sdgvzc5H454Ub4A', '2016-04-10 00:11:24', '1', '1');
INSERT INTO `message` VALUES ('71', 'Z22XuonwjO', '1s6WhnT9X9J2R3t4LsRIS5CHrXircvJ1LAvBjBUC', '2016-04-09 22:58:53', '1', '1');
INSERT INTO `message` VALUES ('72', 'SHF8vW18sI', '2ViBWIDShDcSFvoh4nt6V8Mk7sMlf09zgsiYO0qW', '2016-04-09 23:16:51', '1', '1');
INSERT INTO `message` VALUES ('73', 'o1IlqXnONp', 'tXfd9ZinQVWKMuUYWC7zmVp4YupmrZr4RVUB9Nk5', '2016-04-09 23:26:11', '1', '1');
INSERT INTO `message` VALUES ('74', 'dUJNDAUDiq', '4U9TPjWAWNZpT4wgB3h5rLke1g6wa5Lnu995RQtH', '2016-04-10 01:13:01', '1', '1');
INSERT INTO `message` VALUES ('75', 'lPUTyZ6mkp', 'T7H1PX8BtonxodKT5ztsH1NLgUA2g2h5tV2g4oCK', '2016-04-10 00:35:52', '1', '1');
INSERT INTO `message` VALUES ('76', 'bAd90mDVyQ', 'qozuy9V3h7Bsnid3sWbY6tTSxTGzGxuDBTxPmcHN', '2016-04-10 00:27:53', '1', '1');
INSERT INTO `message` VALUES ('77', 'PZhjwwTIJm', 'r0vneQnazc8SQrv3BFpRUOadsrFTiC18sI0MGUjI', '2016-04-09 23:58:10', '1', '1');
INSERT INTO `message` VALUES ('78', 'clWxGDXIzy', 'SA9PvSKT7JasEHoG6k9AmTddgvzc6Kj9EE6sMpwe', '2016-04-09 23:39:49', '1', '1');
INSERT INTO `message` VALUES ('79', 'bz6FR90rYr', '89ewJYvrxemVp8eEmGaDxClF9Cuqu1uevHNI2Ufn', '2016-04-10 01:19:34', '1', '1');
INSERT INTO `message` VALUES ('80', 'vwWXO4H7ka', 'DzM0zDir9gICMTY27i0Vvx3t3FZQ6Oydfp7fKODB', '2016-04-10 01:20:20', '1', '1');
INSERT INTO `message` VALUES ('81', 'Q80r1G8vVW', 'LSXWIyvIT8QGHjhkBTwL5XmLDFkr5WglLENTTDlD', '2016-04-10 01:31:13', '1', '1');
INSERT INTO `message` VALUES ('82', 'Xrbrx90pS0', 'f3knGbHLBwCq65Yq3PQx0e0bL61F5i28qykQ3ysv', '2016-04-10 01:23:01', '2', '1');
INSERT INTO `message` VALUES ('83', 'dY4eQjUsop', 'KjcUM1DTqhYSkQ2wm31MGXxEvoh6uZlzFq1DZSfs', '2016-04-09 23:41:14', '2', '1');
INSERT INTO `message` VALUES ('84', 'v93FZP2ubh', 'GpRVRph2cHLyiHt3G6i12XyINDFe1g6ygxIOLfLW', '2016-04-09 23:14:56', '2', '1');
INSERT INTO `message` VALUES ('85', 'kHmvkXFiit', 'iVxNbl1UmR7Nw0mAJIcHJqJgVGwm46bruW4oytvZ', '2016-04-09 23:19:06', '2', '1');
INSERT INTO `message` VALUES ('86', 'isgN2AIEXE', 'e3oDRdkQ5H8nloMBvz8NsHYATwK4UaZf8NorODyK', '2016-04-10 01:03:06', '2', '1');
INSERT INTO `message` VALUES ('87', 'X0YJzwJWjA', 'PfzWRhHudrpAvEwxY6sMmhc0g8K9ng19vW3h3g2f', '2016-04-10 01:20:12', '2', '1');
INSERT INTO `message` VALUES ('88', 'Tsou4LqEQ7', 'SUIG8sJ7dCec7Ozgsk4fTwOk4by2mzzZ5h00Q5I8', '2016-04-09 23:33:17', '2', '1');
INSERT INTO `message` VALUES ('89', 'icY5kgbVVI', 'DTpby3tZpWgnTdekPW6xb91wofTzY258jXIyrqBA', '2016-04-10 01:22:14', '2', '1');
INSERT INTO `message` VALUES ('90', 'WEhgizLYq3', 'PQy6GVp8gKNzlOSOgJIeRtzjFe2ie8Npv92DQbet', '2016-04-09 23:58:51', '2', '1');
INSERT INTO `message` VALUES ('91', 'X7w7RMcsw7', 'TTCfehyKVc3yssJ9nh6yfsorQMbqqFWxHIjilGf2', '2016-04-09 23:16:00', '2', '1');
INSERT INTO `message` VALUES ('92', '5tV3je4v80', 'tdvHOOrDHpOHR2s0ujUsnmwkXFf7HXyHIh8EGls9', '2016-04-09 23:02:30', '2', '1');
INSERT INTO `message` VALUES ('93', 'n8psU2h7zm', 'WtniaPuNmf1aEBQjO0s3MAqarw6PDAPfzZ12UjFf', '2016-04-10 01:36:44', '2', '1');
INSERT INTO `message` VALUES ('94', 'nACbTL0BMV', '7GUlOTQneRtAo1LBzSvJ1Hjkwrw7TWPdpeKT6FQ5', '2016-04-10 00:42:48', '2', '1');
INSERT INTO `message` VALUES ('95', 'lgaQBhq7bo', 'gZ0Rb7V4tWaOrzp9nicXZXC6uZhivqu0qVbZf7HY', '2016-04-10 00:16:10', '2', '1');
INSERT INTO `message` VALUES ('96', 'XNXd5BB2fW', 'MWbX5oypfRm454YtjXGnE0ThxJU9UVKLrMqCEf8K', '2016-04-09 23:05:45', '2', '1');
INSERT INTO `message` VALUES ('97', 'EtdvIVizOb', 'iLNvZhhp1Lzo7eEpUaW2bFE28pqNw4ETiGnDVyQn', '2016-04-09 23:04:23', '2', '1');
INSERT INTO `message` VALUES ('98', 'KWlIpKlkqZ', 'voje3nCLMuXbPtHVo1LDFiiul6kbK1JrROk39nib', '2016-04-10 00:58:48', '2', '1');
INSERT INTO `message` VALUES ('99', 'xX3ePjUrj5', 'mnDRgyOgHADhlHkmGcL4RX3fVIEXDcTIIg1azfkK', '2016-04-10 00:11:53', '2', '1');
INSERT INTO `message` VALUES ('100', 'wIPPvRGCVA', '2eTCghshQevFE4eOcocHJmt72G9w0jpUb1oIfXUt', '2016-04-09 23:50:38', '2', '1');
INSERT INTO `message` VALUES ('101', 'LgTuBmSaZl', 'xvNfJKmpMw9ZlBMZqYq5XpXseCeb3yrnqOEE7uYc', '2016-04-10 01:08:00', '2', '1');
INSERT INTO `message` VALUES ('102', 'KRUN5U6CEg', 'bZf6BzTCc0gaTM3NCyL1G8uTRrsNqCC7zmTdelUm', '2016-04-10 01:10:09', '2', '1');
INSERT INTO `message` VALUES ('103', 'hyM2IkjpYt', 'iVyRtDAPhLMtRIOLfM0uiTmYEbMcuIViARn8opI9', '2016-04-09 23:51:53', '2', '1');
INSERT INTO `message` VALUES ('104', 'KappDMQK0C', 'XLOAjGkqYteA3oDNYggoYyGAJIdL1E4dHF7orU3l', '2016-04-09 23:49:18', '2', '1');
INSERT INTO `message` VALUES ('105', '4PMfMWe8RL', '2MAqdCkDZTlUkLH0LDLLmluduEBVGqWfizPexNeC', '2016-04-09 23:14:56', '2', '1');
INSERT INTO `message` VALUES ('106', 'iwxWZWAVIF', 'ZMMqCDcXYP4Kkf5xgwFAN5RSGAIEWDbPqtYe8Lj5', '2016-04-09 23:32:48', '2', '1');
INSERT INTO `message` VALUES ('107', 'oHaBkGeZ6n', 'oIcIQUQl1UiBYVyOduCtomvewIS5DKETjJxm2YzK', '2016-04-10 01:01:06', '2', '1');
INSERT INTO `message` VALUES ('108', 'TM1BO4Jljo', 'S4wgB5rMou83H9wZcUM2F5gTuBoZD11WrfLU7I1M', '2016-04-10 00:37:25', '2', '1');
INSERT INTO `message` VALUES ('109', '6dA8J69iQ9', '7YlF7sLhVGqYoUefmUhxGCTstPAgp40DYRa8ZmHh', '2016-04-10 01:50:13', '2', '1');
INSERT INTO `message` VALUES ('110', 'EGhe9W2dM7', '75Vc5EP0pT4t3EXEcVSsv0lxszkJwgzVJKnt6VaT', '2016-04-10 00:49:45', '2', '1');
INSERT INTO `message` VALUES ('111', '8999985QOl', '8uUUEnKrOAjFcSEpYseDjwvPqw8Xe6FQ3CLPFIqM', '2016-04-09 23:49:06', '2', '1');
INSERT INTO `message` VALUES ('112', 'NtPw0he9SO', 'gHxsuTTA7FMNtNqykPYe3rRQvPrzo40FbK2LzqeJ', '2016-04-10 00:50:23', '2', '1');
INSERT INTO `message` VALUES ('113', 'DBZYKCKG32', 'R2qQNgPa996V9PvSKWjxCjyFwruW6w93DP7WbW16', '2016-04-09 23:24:03', '2', '1');
INSERT INTO `message` VALUES ('114', '6ovdoby2nB', 'IBICMTZ5kdVPdrnpLqFVsj4fTxQuIYyGDUwIQW2a', '2016-04-10 00:05:59', '2', '1');
INSERT INTO `message` VALUES ('115', '6I7fMXisdy', 'XWIBIzyUKQNk39psTUHCQchFlwtCxEvog2bHKv8X', '2016-04-09 23:16:29', '2', '1');
INSERT INTO `message` VALUES ('116', 'kD12YARm6h', 'UzVLV9QAeekORJWmPUUEnLxgwGHicZ9CurBvzb3y', '2016-04-09 23:51:02', '2', '1');
INSERT INTO `message` VALUES ('117', 'vW2eUDjwwT', 'GDWEf9RHKu1wm341ImtbiNV6yjJzvEyFwrv3yuDv', '2016-04-09 23:49:44', '2', '1');
INSERT INTO `message` VALUES ('118', 'DEcRxY7sOv', 'YaLbqpDKJdL0yDjxAbZcTHDXIytvYaJ3Uc6Nw1qS', '2016-04-10 01:14:07', '2', '1');
INSERT INTO `message` VALUES ('119', 'Spi3gZZNRK', 'ZyEq2Lw8Xfda0pPLaneTA4sV6Bvz9SM9eA1fXWDc', '2016-04-10 01:15:44', '2', '1');
INSERT INTO `message` VALUES ('120', 'VGqYq1GbJW', 'lJsWbWZYKCJDO1vjRcesoqMsOy8RM62HdQogZYKH', '2016-04-10 01:39:34', '2', '1');
INSERT INTO `message` VALUES ('121', '665WjyHHdP', 'iTo7gO6T1g7CC18tKdCivtHUjFcTEteA2id2nCNX', '2016-04-09 23:05:17', '2', '1');
INSERT INTO `message` VALUES ('122', '3u6SWSrot1', 'vl33ZBQjRcftsI43Ub1pNDD5oztuRHJpG4564S0h', '2016-04-09 23:03:00', '2', '1');
INSERT INTO `message` VALUES ('123', '0gaSHKtW8H', 'UhxHHg4qI9rCC4jdXZVvzc6NvZgbY9FIsXhkD5jc', '2016-04-10 01:00:06', '2', '1');
INSERT INTO `message` VALUES ('124', 'wRBho0E7uV', 'YUwIR0f4sWaRBhtk6noIcJQUQm47eFr4QRDoWkE6', '2016-04-09 23:46:40', '2', '1');
INSERT INTO `message` VALUES ('125', 'JatJ53QVVF', 'r0zEnMByL2IibSFxz2mwodILykNSMaiP7XgjzLWf', '2016-04-09 23:19:28', '2', '1');
INSERT INTO `message` VALUES ('126', 'xFxxXXNW9K', '7eBaREwuL8gLRPqtUYZTkMMorTZ5lhd4yn6cvOla', '2016-04-10 00:24:44', '2', '1');
INSERT INTO `message` VALUES ('127', 'AQgFmE232P', 'QBkE5moJh4nvdqkbL9jVvBkInCNV8GThvAc7RJYs', '2016-04-09 23:09:45', '2', '1');
INSERT INTO `message` VALUES ('128', 'EoPNlcM9iO', '1wocIOIZFcRvPsDEaK2PPx2oJjbRz8Mlf1eUIHay', '2016-04-10 01:51:34', '2', '1');
INSERT INTO `message` VALUES ('129', 'RJT9V18uTN', 'agGr2E22Xtl9w3wiKG1Vp52Ku4Iazb4DLNw2ubfy', '2016-04-10 01:04:05', '2', '1');
INSERT INTO `message` VALUES ('130', 'xUN7Zr4S0h', 'cZe09CuonvhIxrnqPK3Ub3xoavRExxUO84NDBVIA', '2016-04-10 00:22:22', '2', '1');
INSERT INTO `message` VALUES ('131', 'inS6I6eEqZ', 'yBeaYe6CEgaVWKMtRL4S1igiwz8MkbIVjC01UlPV', '2016-04-10 01:22:12', '2', '1');
INSERT INTO `message` VALUES ('132', 'BGt9bjSepb', 'vNmg1cL1Ijgeb6Nx8SQpns2F20LGXzPhMSRy1f3m', '2016-04-09 23:48:30', '3', '2');
INSERT INTO `message` VALUES ('133', '2HcIQTL1CT', 'pgTwMcszhzQnbBkGhaQy4yn30HhcX4g020LEMPBp', '2016-04-10 01:35:40', '3', '2');
INSERT INTO `message` VALUES ('134', 'R1lwogZ0Tg', 'tqxeqiZVttJ8jZSfpcz7Kcz8LfPfzVLT2jhjBTuD', '2016-04-10 00:07:41', '3', '2');
INSERT INTO `message` VALUES ('135', 'IKpETjKCHu', 'dpgUB8GSb5JhZ0R8U1eVKPLal6lcPoiaMdBd5BDb', '2016-04-10 00:58:45', '3', '2');
INSERT INTO `message` VALUES ('136', 'wUQlZNOx4B', 'C6wa6RPqtU06kcSz6BzUDhnR0kpWiwz5zspxiGly', '2016-04-10 00:05:29', '3', '2');
INSERT INTO `message` VALUES ('137', 'VQhJCJG32R', '2s2EWEf9Pw0hghreFs9cqkcTIKpEQ7W9MgRkTiFj', '2016-04-09 23:41:48', '3', '2');
INSERT INTO `message` VALUES ('138', 'XoXp0F8uV1', '9w1mzCfegqbtHUhutI1MFPZhiseDiq775Vd8RL61', '2016-04-10 00:21:01', '3', '2');
INSERT INTO `message` VALUES ('139', 'XJBDgd8TRs', 'AnYzKS1ie9RGGcNcrrLj8zjFe1eXTuy9W7Ap6ane', '2016-04-10 01:05:42', '3', '2');
INSERT INTO `message` VALUES ('140', 'xSCgmPTOex', 'RxWWJH6fKSY4i7v1s3IgZ1XyJPNlbHLBAWMT0aEA', '2016-04-10 01:02:56', '3', '2');
INSERT INTO `message` VALUES ('141', 'ocExy1haPt', 'LcxXYSiGmCO4Ji9HS9V3loNCzPhLMrKfQjSjKFUm', '2016-04-10 01:19:56', '3', '2');
INSERT INTO `message` VALUES ('142', 'yHHdQpmnHa', 'BlJtZnKrPFE6qCIvfzXSm30Hie9QFDYP2zzY258j', '2016-04-10 01:17:05', '3', '2');
INSERT INTO `message` VALUES ('143', 'Ef7H0JwfvD', 'vtHUgsiYP4JfVHywL5ZxA9QAhreDnMEIvbetw3wi', '2016-04-10 00:44:39', '3', '2');
INSERT INTO `message` VALUES ('144', 'LnsXhnUddh', 'yOez07sKcBeehwCnTa0nJkilGbJWkHkpT5ByNduF', '2016-04-10 00:37:44', '3', '2');
INSERT INTO `message` VALUES ('145', 'sV6zmYC16i', '0XC4lktcpkdVPcm1S9XbUOcoeOcph021QX6v2wn6', '2016-04-09 23:08:32', '3', '2');
INSERT INTO `message` VALUES ('146', 'HDVxL3OMgQ', 'iLNuTPk1WslbIQURqmmBLRSCjzJPK65ZvplnEXHr', '2016-04-10 01:19:15', '3', '2');
INSERT INTO `message` VALUES ('147', 'jvrzkMKdJO', 'IZE8w3wkUp9maDxz5xkP0oMzkNRKZxAaSKXmNI4Z', '2016-04-10 00:19:28', '3', '2');
INSERT INTO `message` VALUES ('148', 'ZShAXRfux3', 'vcjNV4qLmlwncHKu1tahGrYoUb3ytx8SNcqpAxOg', '2016-04-10 00:41:24', '3', '2');
INSERT INTO `message` VALUES ('149', 'LrMmltcpgW', 'KMv2ucm4550BQfwJUefn0Ju6QNfGyxTGxwRxX01T', '2016-04-09 23:18:58', '3', '2');
INSERT INTO `message` VALUES ('150', 'AUCd4xlWuu', 'PwW149mdOhMTXXLMsOvW049nh7Aqcz7J8k5hXO1u', '2016-04-09 23:07:43', '3', '2');
INSERT INTO `message` VALUES ('151', 'wJYul8sJ8k', '3asGPZhhnUddhC3eSxRy3sWbWXQa95QOnfZ0VqdD', '2016-04-09 23:35:38', '3', '2');
INSERT INTO `message` VALUES ('152', 'PSHJpFVux2', 'qPJ1JqMvZikzKRUN4OGPYaMgMWfflNNqBzUDhnUc', '2016-04-10 01:47:49', '3', '2');
INSERT INTO `message` VALUES ('153', 'PECXMROl7o', 'qOAnWo2NKbvNj10PYe4u4IePjUri11Vp8fFs5Vc3', '2016-04-09 23:58:09', '3', '2');
INSERT INTO `message` VALUES ('154', 'drmiinS6Jc', 'DpZxz5AwEwwRAaW3jcSFyA7GSa2xphZWzRqoyqkd', '2016-04-10 01:12:54', '3', '2');
INSERT INTO `message` VALUES ('155', 'N4NBvvTN71', 'DUxKYtjXJzxM9ezXXKH5dBfgrgN3G7noG48k4dJP', '2016-04-10 00:49:22', '3', '2');
INSERT INTO `message` VALUES ('156', 'j10NPAixEt', 'fGwn9rDGjpXlJu4H9tKbvPqxen42OOrDHrVaRDtg', '2016-04-10 00:43:28', '3', '2');
INSERT INTO `message` VALUES ('157', 'QLaneRsygt', 'ptYgfhxGCRkRba6QNhO6Wc2rWc1nF20NNrEKDOYg', '2016-04-09 23:07:13', '3', '2');
INSERT INTO `message` VALUES ('158', 'b5I9qxhC6s', 'RK0E38nloKsRMal22TdfrhVB7zo41IoEUpcz5zsp', '2016-04-10 00:00:36', '3', '2');
INSERT INTO `message` VALUES ('159', 'dkP1uagCaQ', 'wX29tMk8w3vfAYZP4EWyN9coeOezWSqh032S8QHL', '2016-04-10 00:07:02', '3', '2');
INSERT INTO `message` VALUES ('160', 'lUkNOvUTA3', 'nzxOk230Gg6AsmfZ22YBTwMajUrleXUxMakZNOzf', '2016-04-09 23:32:43', '3', '2');
INSERT INTO `message` VALUES ('161', 'VlPV038ng5', 'qKh18pwcfttPw0jmIlpRWUCaQAd8RL5YrakWC6v2', '2016-04-10 00:06:59', '3', '2');
INSERT INTO `message` VALUES ('162', 'uAkIrV6zo5', '7bpllwrrLk9CwAc6Jby5ByRtDyJRVSsw4AB7zmUi', '2016-04-10 00:22:06', '3', '2');
INSERT INTO `message` VALUES ('163', '8AlOQEAN3K', 'pEQ8ZmHfXVzWRgDcTLXkD1340GeXWEikBTuAhxEv', '2016-04-09 23:44:02', '3', '2');
INSERT INTO `message` VALUES ('164', 'sOzehAUB8K', '9l5gUzXWGpOIWp4Xr9gKMvZjq1GaFGf1dRuIWq79', '2016-04-09 23:17:59', '3', '2');
INSERT INTO `message` VALUES ('165', 'MTZ6ljlCTt', 'wZhghurxftsGVp40D0ZLH43WnTc8TVN3IfVICP95', '2016-04-10 00:51:24', '3', '2');
INSERT INTO `message` VALUES ('166', 'BtlcNfEnLv', '4FYHrVbX3eSvJXtiVzUGyz1cNdxRA8Mj5lkqZtgK', '2016-04-10 00:52:29', '3', '2');
INSERT INTO `message` VALUES ('167', 'CwBhrbtDBW', 'KLpAwIPTLZxvNhRjNTTDlGdPoh4kjq2JnxodJS2n', '2016-04-10 00:17:09', '3', '2');
INSERT INTO `message` VALUES ('168', 'MSSChoXq78', 'bkVtsGSa5KlihnTa0lyBcZcSBfhwy5DHu84OGNNs', '2016-04-10 00:36:33', '3', '2');
INSERT INTO `message` VALUES ('169', '40IlqU8KeI', 'JlpQNk4eM3KrNvX6sSNfEmGdPm9x6GXyM4QRCnQW', '2016-04-10 01:32:51', '3', '2');
INSERT INTO `message` VALUES ('170', 'azb1qSWUB8', 'I0Ju5MuXbRAc5DOXbSFzIF0Uo2R0hhlJsW9Nmh7A', '2016-04-09 23:44:45', '3', '2');
INSERT INTO `message` VALUES ('171', 'fLWgmOQEwx', 'XYRcfxJUc4EQ7TWRm2VlNOvX4lkr4S0f2h8FLEQ5', '2016-04-10 00:45:30', '3', '2');
INSERT INTO `message` VALUES ('172', 'pAzUFtewM8', 'eA4tW9LeGzFqYq3RX5mqQOoloLtUYXKFWyN9bhKK', '2016-04-09 23:23:19', '3', '2');
INSERT INTO `message` VALUES ('173', 'aJ0Hie5zsp', 'vaa83F0R9YjtgIEWC7yfqcz4xiGnHdNboePjUsnn', '2016-04-10 00:12:15', '3', '2');
INSERT INTO `message` VALUES ('174', 'DgfhvwY7v2', 't84NCyKS2nEUsmkmG9yb5I9sGScb92AGvhIDO0s6', '2016-04-10 01:20:06', '3', '2');
INSERT INTO `message` VALUES ('175', 'mJrPGJv94L', 'qH43Tb3yrmmyvK4WjARn9rAutMlbK0E4fRogWNXf', '2016-04-09 23:04:21', '3', '2');
INSERT INTO `message` VALUES ('176', '8UZ4bBglMI', '6dy1g5wa6QMcuGOSJUb3yqkbMctDBXO3DTn2Tc8X', '2016-04-09 23:02:08', '3', '2');
INSERT INTO `message` VALUES ('177', 'X17nlqVd8R', 'M76YpXoYwy0eWTtyc9ZmGcJWjCZXEcSEujVvBlMH', '2016-04-10 01:22:41', '3', '2');
INSERT INTO `message` VALUES ('178', 'D5nt5OGNOu', 'RGGaGImvgEkvncIPPx0hd4zsrFP0nKozuCq7csx8', '2016-04-10 01:15:50', '3', '2');
INSERT INTO `message` VALUES ('179', '7ApasCwEun', 'gZ0VslaEBRocFBO6T1ifaUVKLsNuRHLzp9ppDMSR', '2016-04-10 00:01:29', '3', '2');
INSERT INTO `message` VALUES ('180', 'SFyA7FOUXT', 'qj8x90pPMeHE0SdgyPkXDbOlaCq7al0Sba6QK4Uc', '2016-04-10 01:48:26', '3', '2');
INSERT INTO `message` VALUES ('181', 'PEzJPMdBd8', 'QEyDpVivtGR4AB4oBDf9RFE27iZSfri12ZGf3oCM', '2016-04-10 01:07:31', '3', '2');
INSERT INTO `message` VALUES ('183', 'aaaaaa', 'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb', '2016-06-02 16:50:00', '3', '4');
INSERT INTO `message` VALUES ('184', '我是超人啊啊', '这里有很多超人啊，哈哈哈，真的是十分神奇的事情啊', '2016-06-02 16:50:00', '1', '4');
INSERT INTO `message` VALUES ('185', '我是超人啊啊', '这里有很多超人啊，哈哈哈，真的是十分神奇的事情啊', '2016-06-02 16:50:00', '2', '4');
INSERT INTO `message` VALUES ('186', '我是超人啊啊', '这里有很多超人啊，哈哈哈，真的是十分神奇的事情啊', '2016-06-02 16:52:00', '2', '4');
INSERT INTO `message` VALUES ('187', '超级无敌打架', '打架兼职非常爽的一个兼职，欢迎带劲啊啊司机打开手机放假了客户', '2016-06-02 22:28:00', '1', '4');
INSERT INTO `message` VALUES ('190', '超级无敌打架4', '打架兼职非常爽的一个兼职，欢迎带劲啊啊司机打开手机放假了客户3', '2016-06-02 22:28:00', '1', '4');
INSERT INTO `message` VALUES ('192', '阿斯打发撒地方', '啊三大所发生的过度开采看得见佛扩网i恶臭三大利空黄金', '2016-06-02 22:34:00', '3', '4');
INSERT INTO `message` VALUES ('193', '阿斯打发撒地方3', '啊三大所发生的过度开采看得见佛扩网i恶臭三大利空黄金3', '2016-06-02 22:34:00', '3', '4');
INSERT INTO `message` VALUES ('194', '阿斯打发撒地方4', '啊三大所发生的过度开采看得见佛扩网i恶臭三大利空黄金4', '2016-06-02 22:44:00', '1', '4');
INSERT INTO `message` VALUES ('196', 'aaaaaa', 'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb', '2016-06-02 16:50:00', '3', '4');
INSERT INTO `message` VALUES ('197', 'aaaaaa', 'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb', '2016-06-02 16:50:00', '3', '4');
INSERT INTO `message` VALUES ('198', 'aaaaaa', 'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb', '2016-06-03 13:16:00', '3', '4');

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` varchar(40) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `content` char(250) NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply
-- ----------------------------
INSERT INTO `reply` VALUES ('1', '07e81992-073f-44ca-99b7-954ca5fa1962', '7', '@asdasd :', '2016-05-26 20:46:55');
INSERT INTO `reply` VALUES ('2', '07e81992-073f-44ca-99b7-954ca5fa1962', '7', '(●￣(ｴ)￣●)', '2016-05-26 20:47:32');
INSERT INTO `reply` VALUES ('3', '07e81992-073f-44ca-99b7-954ca5fa1962', '7', '@asdasd :@asdasd :', '2016-05-26 21:06:43');
INSERT INTO `reply` VALUES ('4', '07e81992-073f-44ca-99b7-954ca5fa1962', '7', '@asdasd :(〜￣△￣)〜', '2016-05-26 22:07:28');
INSERT INTO `reply` VALUES ('5', '07e81992-073f-44ca-99b7-954ca5fa1962', '7', '（#-_-)┯━┯', '2016-05-26 22:07:38');
INSERT INTO `reply` VALUES ('6', '07e81992-073f-44ca-99b7-954ca5fa1962', '7', '(〜￣△￣)〜', '2016-05-26 22:07:42');
INSERT INTO `reply` VALUES ('7', '07e81992-073f-44ca-99b7-954ca5fa1962', '7', '@asdasd :(;¬_¬)', '2016-05-26 22:09:52');
INSERT INTO `reply` VALUES ('8', '07e81992-073f-44ca-99b7-954ca5fa1962', '18', '@asdasd :→_→', '2016-05-26 22:20:05');
INSERT INTO `reply` VALUES ('9', '07e81992-073f-44ca-99b7-954ca5fa1962', '18', '@asdasd :(ﾟДﾟ≡ﾟдﾟ)!?', '2016-05-26 22:20:15');
INSERT INTO `reply` VALUES ('10', '07e81992-073f-44ca-99b7-954ca5fa1962', '17', '@asdasd :(´_ゝ｀)', '2016-05-26 22:20:25');
INSERT INTO `reply` VALUES ('11', '07e81992-073f-44ca-99b7-954ca5fa1962', '18', '@asdasd :(=・ω・=)', '2016-05-26 22:23:15');
INSERT INTO `reply` VALUES ('12', '07e81992-073f-44ca-99b7-954ca5fa1962', '18', '@asdasd :Σ(￣□￣||)', '2016-05-26 22:23:25');
INSERT INTO `reply` VALUES ('13', '07e81992-073f-44ca-99b7-954ca5fa1962', '7', '@asdasd :(｡･ω･｡)', '2016-05-26 22:28:07');
INSERT INTO `reply` VALUES ('14', '07e81992-073f-44ca-99b7-954ca5fa1962', '7', '@asdasd :(〜￣△￣)〜', '2016-05-26 22:28:33');
INSERT INTO `reply` VALUES ('15', '07e81992-073f-44ca-99b7-954ca5fa1962', '7', '@asdasd :啊╮(￣▽￣)╭', '2016-05-26 22:43:06');
INSERT INTO `reply` VALUES ('16', '07e81992-073f-44ca-99b7-954ca5fa1962', '7', '@asdasd :Σ(ﾟдﾟ;)', '2016-05-26 22:45:51');
INSERT INTO `reply` VALUES ('17', '07e81992-073f-44ca-99b7-954ca5fa1962', '7', '@asdasd :(ﾟДﾟ≡ﾟдﾟ)!?', '2016-05-26 22:47:21');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` varchar(40) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `email` varchar(40) default NULL,
  `iphone` varchar(20) NOT NULL,
  `imageurl` varchar(100) default NULL,
  `resumecount` int(11) unsigned zerofill default '00000000000',
  PRIMARY KEY  (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表，保存用户的相关信息';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('000-000', 'asd', 'asd', 'asd@123.com', '15361363220', null, '00000000001');
INSERT INTO `user` VALUES ('07e81992-073f-44ca-99b7-954ca5fa1962', 'asdasd', 'asdasd', 'das@263.com', '15361363220', 'null', '00000000006');
INSERT INTO `user` VALUES ('14b5a056-c31e-4ddb-85c9-ec2e16f6ce97', 'llsydn', '428527', '1091391667@qq.com', '13543844606', null, '00000000000');
INSERT INTO `user` VALUES ('31ecb1a1-d782-4196-acc5-980a2423fa52', '黎霖深', '428527', '1091391667@qq.com', '13543844606', null, '00000000000');
INSERT INTO `user` VALUES ('33b8b194-45a7-4767-b543-4aeec14d770e', '黎霖深1231', '13123123', '123213123@qq.com', '13534844606', null, '00000000000');
INSERT INTO `user` VALUES ('44b7b7cb-57fa-42c0-b38d-6df2d072ebe4', 'weituotian_012', '1q2w3e4r', '1q@263.com', '15361363220', null, '00000000000');
INSERT INTO `user` VALUES ('4ea591dd-99bf-4048-a0c8-34883d01de04', '黎霖深111', '1111111', '1111111@qq.com', '13543844606', null, '00000000000');
INSERT INTO `user` VALUES ('505f06df-6742-46cf-8d72-2c29a60097f4', 'dasdasf', 'asweasd', 'asdfasd@sina.com.cn', '15361363220', null, '00000000000');
INSERT INTO `user` VALUES ('565d36b5-3a57-4aa2-b35e-5d1494995298', 'dzxc', 'dddsasd', 'asdas@263.com', '15361363220', null, '00000000000');
INSERT INTO `user` VALUES ('56959726-a1fb-43dd-a57e-4dea152779b8', 'asssdddd', '1q12231', 'asd@163.com', '15361363220', null, '00000000000');
INSERT INTO `user` VALUES ('5e3f1b42-03d2-4ab7-9e0d-707a7084f488', 'dddasadgvsdf', '1q2234', 'asd@sina.com.cn', '15361363220', null, '00000000000');
INSERT INTO `user` VALUES ('6aaa81bc-1c1c-4177-a637-d3c73bb4729b', 'dasddaf', '123asdasd', 'asfsderfwe@263.com', '15361363220', null, '00000000000');
INSERT INTO `user` VALUES ('835dea38-3e3e-4399-9341-b3e50f04b7b3', 'admin1', '123123213', '123@qq.com', '13543844606', null, '00000000000');
INSERT INTO `user` VALUES ('985b1c05-bbcb-49c7-b6bd-31bf6364bf5c', 'weituotian_01', '1q2w3e4r', '1q@qq.com', '15361363220', '/upload/985b1c05-bbcb-49c7-b6bd-31bf6364bf5c/985b1c05-bbcb-49c7-b6bd-31bf6364bf5c.jpg', '00000000003');
INSERT INTO `user` VALUES ('99f7b21c-8b0c-45b5-aed9-8efda8797629', 'weituotian', '1q2w3e4r', '1091391667@qq.com', '13543844606', '/upload/99f7b21c-8b0c-45b5-aed9-8efda8797629/99f7b21c-8b0c-45b5-aed9-8efda8797629.jpg', '00000000005');
INSERT INTO `user` VALUES ('c30f0542-e41d-4d6e-8faa-b1fa1c010ff3', 'dssaas', 'dasdasdasd', 'sad@263.com', '15361363220', null, '00000000000');
INSERT INTO `user` VALUES ('c478b9fc-282b-40f0-bc30-daaf6a4c1bb9', 'adminadmin', 'adminadmin', '1091391667@qq.com', '13543844606', 'null', '00000000002');

-- ----------------------------
-- Table structure for user_business
-- ----------------------------
DROP TABLE IF EXISTS `user_business`;
CREATE TABLE `user_business` (
  `user_id` varchar(40) NOT NULL default '',
  `business_id` int(11) NOT NULL default '0',
  `coltime` datetime NOT NULL,
  PRIMARY KEY  (`user_id`,`business_id`),
  KEY `fk1_bussinessid` (`business_id`),
  CONSTRAINT `fk1_bussinessid` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`),
  CONSTRAINT `fk1_userid` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_business
-- ----------------------------
INSERT INTO `user_business` VALUES ('07e81992-073f-44ca-99b7-954ca5fa1962', '4', '2016-06-14 15:31:29');
INSERT INTO `user_business` VALUES ('99f7b21c-8b0c-45b5-aed9-8efda8797629', '1', '2016-06-12 01:27:40');
INSERT INTO `user_business` VALUES ('99f7b21c-8b0c-45b5-aed9-8efda8797629', '2', '2016-06-12 01:26:58');
INSERT INTO `user_business` VALUES ('99f7b21c-8b0c-45b5-aed9-8efda8797629', '4', '2016-06-11 17:35:17');

-- ----------------------------
-- Table structure for user_message
-- ----------------------------
DROP TABLE IF EXISTS `user_message`;
CREATE TABLE `user_message` (
  `user_id` varchar(40) NOT NULL default '',
  `message_id` int(11) NOT NULL default '0',
  `apply_time` datetime NOT NULL,
  PRIMARY KEY  (`user_id`,`message_id`),
  KEY `fk_messageid` (`message_id`),
  CONSTRAINT `fk_messageid` FOREIGN KEY (`message_id`) REFERENCES `message` (`id`),
  CONSTRAINT `fk_userid` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_message
-- ----------------------------
INSERT INTO `user_message` VALUES ('07e81992-073f-44ca-99b7-954ca5fa1962', '198', '2016-06-14 15:31:35');
INSERT INTO `user_message` VALUES ('4ea591dd-99bf-4048-a0c8-34883d01de04', '194', '2016-06-11 16:57:31');
INSERT INTO `user_message` VALUES ('99f7b21c-8b0c-45b5-aed9-8efda8797629', '34', '2016-06-10 18:05:39');
INSERT INTO `user_message` VALUES ('99f7b21c-8b0c-45b5-aed9-8efda8797629', '81', '2016-06-10 18:05:43');
INSERT INTO `user_message` VALUES ('99f7b21c-8b0c-45b5-aed9-8efda8797629', '89', '2016-06-12 01:27:35');
INSERT INTO `user_message` VALUES ('99f7b21c-8b0c-45b5-aed9-8efda8797629', '128', '2016-06-10 17:06:11');
INSERT INTO `user_message` VALUES ('99f7b21c-8b0c-45b5-aed9-8efda8797629', '131', '2016-06-10 19:19:17');
INSERT INTO `user_message` VALUES ('99f7b21c-8b0c-45b5-aed9-8efda8797629', '133', '2016-06-10 18:45:03');
INSERT INTO `user_message` VALUES ('99f7b21c-8b0c-45b5-aed9-8efda8797629', '152', '2016-06-10 19:19:06');
INSERT INTO `user_message` VALUES ('99f7b21c-8b0c-45b5-aed9-8efda8797629', '180', '2016-06-10 18:44:55');
INSERT INTO `user_message` VALUES ('99f7b21c-8b0c-45b5-aed9-8efda8797629', '183', '2016-06-12 01:26:34');
INSERT INTO `user_message` VALUES ('99f7b21c-8b0c-45b5-aed9-8efda8797629', '184', '2016-06-11 17:39:35');
INSERT INTO `user_message` VALUES ('99f7b21c-8b0c-45b5-aed9-8efda8797629', '190', '2016-06-28 21:39:08');
INSERT INTO `user_message` VALUES ('99f7b21c-8b0c-45b5-aed9-8efda8797629', '194', '2016-06-11 16:43:27');

-- ----------------------------
-- Table structure for user_resume
-- ----------------------------
DROP TABLE IF EXISTS `user_resume`;
CREATE TABLE `user_resume` (
  `resume_id` varchar(40) NOT NULL,
  `title` varchar(40) NOT NULL,
  `name` varchar(10) default NULL,
  `sex` varchar(6) default NULL,
  `age` varchar(4) default NULL,
  `email` varchar(20) default NULL,
  `salary` varchar(20) default NULL,
  `experience` varchar(400) default NULL,
  `introduction` varchar(400) NOT NULL,
  `user_id` varchar(40) default NULL,
  `create_time` date NOT NULL,
  `percent` int(11) default '5',
  PRIMARY KEY  (`resume_id`),
  KEY `user_id_FK` (`user_id`),
  CONSTRAINT `user_id_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_resume
-- ----------------------------
INSERT INTO `user_resume` VALUES ('04b1cfba-6fe7-4d19-87f7-a9df30dc3135', 'adas', 'asdas', 'male', '12', '123213123@qq.com', '1232', '123asdd', 'dsadas', '07e81992-073f-44ca-99b7-954ca5fa1962', '2016-05-20', '10');
INSERT INTO `user_resume` VALUES ('19b46e80-f3bf-4d7b-a310-80cb56623cae', 'asdasd', 'asdasd', 'female', '12', '123213123@qq.com', '312', 'sqdasdasd', 'dasdasdasd', '07e81992-073f-44ca-99b7-954ca5fa1962', '2016-05-20', '10');
INSERT INTO `user_resume` VALUES ('4058b437-570d-4388-b849-af70adfbbe9b', 'qweqwe', 'qweqwe', 'male', '12', '112312@qq.com', '1212', '123', 'qweqweqwesajhyuitertwetertwert', '99f7b21c-8b0c-45b5-aed9-8efda8797629', '2016-06-10', '10');
INSERT INTO `user_resume` VALUES ('4b5cab78-e8e0-4ffb-9718-400783062ccc', '求职2年经验', '黎霖深', 'male', '21', '1091391667@qq.com', '250', 'adas', '1111111111111111111111111111', '99f7b21c-8b0c-45b5-aed9-8efda8797629', '2016-06-10', '10');
INSERT INTO `user_resume` VALUES ('68709b90-7e1d-47b9-a7f9-27f0c943ca9d', 'asdasd', 'asdas', 'male', '12', '123213123@qq.com', '1232', 'qweqwe', 'asdasdasd', '07e81992-073f-44ca-99b7-954ca5fa1962', '2016-05-20', '10');
INSERT INTO `user_resume` VALUES ('7fd13ffe-a804-4c0b-8365-66c407ea26eb', '化学家教', 'llslls', 'female', '21', '1091391667@qq.com', '123', '', '阿萨德撒大师大师大师大师大师的', '99f7b21c-8b0c-45b5-aed9-8efda8797629', '2016-06-10', '9');
INSERT INTO `user_resume` VALUES ('82c32e16-54c1-44b1-a629-f49f64e83404', 'adas', 'asdas', 'male', '21', '123213123@qq.com', '1232', '12asd', 'asds', '07e81992-073f-44ca-99b7-954ca5fa1962', '2016-05-20', '10');
INSERT INTO `user_resume` VALUES ('8e800188-5ea0-4e17-89c4-ac16e55adff7', 'asdsd', '12321321', 'female', '12', '123213123@qq.com', '1232', 'asdasd', 'dasdsadas', 'c478b9fc-282b-40f0-bc30-daaf6a4c1bb9', '2016-05-20', '10');
INSERT INTO `user_resume` VALUES ('934a24f6-3b0c-472f-b08c-0838356a9d7b', '家教一年经验', 'llsyan', 'male', '21', '1091391667@qq.com', '123', 'asdasdsad', 'asdhuasdhjasdbnajksxnalsdasd', '99f7b21c-8b0c-45b5-aed9-8efda8797629', '2016-06-10', '10');
INSERT INTO `user_resume` VALUES ('a6c6856c-0b20-411f-b0c3-b6f563d83e3c', 'asdasda', 'aaa', 'female', '13', '1091391667@qq.com', '123', '1asdasdasdas', 'asdasdasdasdasdasdasdasdasdasdas', '99f7b21c-8b0c-45b5-aed9-8efda8797629', '2016-06-10', '10');
INSERT INTO `user_resume` VALUES ('b05b289d-0228-429d-980e-80ddfc1ed585', 'aaaa', '123', 'male', '12', '109136@qq.com', '12', 'asd', '1asdasdasjdlkasdasldjkasl', '985b1c05-bbcb-49c7-b6bd-31bf6364bf5c', '2016-06-10', '10');
INSERT INTO `user_resume` VALUES ('ca8a41b7-e53c-4d31-abe6-84fa3f1bbe57', 'sfsdfdsf', 'fsdfsdf', 'male', '24', '234wer@qq.com', '234', 'werfsdf', 'sdfsdfsdf', '07e81992-073f-44ca-99b7-954ca5fa1962', '2016-05-20', '10');
INSERT INTO `user_resume` VALUES ('e208048f-b319-4ba3-91f9-a553a3acd2cd', 'asdasd', 'asdas', 'female', '21', '123213123@qq.com', '1232', '123ads', 'das', '07e81992-073f-44ca-99b7-954ca5fa1962', '2016-05-20', '10');
INSERT INTO `user_resume` VALUES ('ef947cfd-18a3-4ef8-98b4-7027f18fb0ff', 'dasjhdklas', '123', 'male', '21', '109136@qq.com', '1221', 'adas', '1asdasdasjdlkasdasldjkaslfsdf', '985b1c05-bbcb-49c7-b6bd-31bf6364bf5c', '2016-06-10', '10');
INSERT INTO `user_resume` VALUES ('f1b2164f-6640-4048-8b2a-e9adf877f91b', 'asd11', 'llslls', 'male', '21', '1091391667@qq.com', '123', 'adsd', 'wqeqweqweqwdasdasdqwegfhfhjgjghj', '985b1c05-bbcb-49c7-b6bd-31bf6364bf5c', '2016-06-10', '10');

-- ----------------------------
-- Procedure structure for pro_insert_message
-- ----------------------------
DROP PROCEDURE IF EXISTS `pro_insert_message`;
DELIMITER ;;
CREATE DEFINER=`root`@`127.0.0.1` PROCEDURE `pro_insert_message`(cout INT)
BEGIN  
    DECLARE j INT DEFAULT 0;
    WHILE j < cout DO
	INSERT INTO message (id, title, content, date_time, commodity_id, business_id) VALUES (NULL, rand_string(10), rand_string(40), rand_datetime(), '3', '2');
        SET j = j + 1;
    END WHILE;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for rand_datetime
-- ----------------------------
DROP FUNCTION IF EXISTS `rand_datetime`;
DELIMITER ;;
CREATE DEFINER=`root`@`127.0.0.1` FUNCTION `rand_datetime`() RETURNS datetime
BEGIN
	#Routine body goes here...
	RETURN DATE_ADD('2016-04-09 22:55:34', INTERVAL FLOOR(1 + (RAND() * 10800))SECOND);
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for rand_string
-- ----------------------------
DROP FUNCTION IF EXISTS `rand_string`;
DELIMITER ;;
CREATE DEFINER=`root`@`127.0.0.1` FUNCTION `rand_string`(n INT) RETURNS varchar(255) CHARSET utf8
BEGIN
                DECLARE chars_str varchar(100) DEFAULT 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
                DECLARE return_str varchar(255) DEFAULT '';
                DECLARE i INT DEFAULT 0;
                WHILE i < n DO
                                SET return_str = concat(return_str,substring(chars_str , FLOOR(1 + RAND()*62 ),1));
                                SET i = i +1;
                END WHILE;
                RETURN return_str;
END
;;
DELIMITER ;
