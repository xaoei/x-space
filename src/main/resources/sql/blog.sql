/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-02-05 18:16:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for x_article
-- ----------------------------
DROP TABLE IF EXISTS `x_article`;
CREATE TABLE `x_article` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `sort_id` int(4) NOT NULL COMMENT '顺序',
  `title` varchar(255) NOT NULL DEFAULT 'unnamed' COMMENT '文章标题',
  `content` text NOT NULL COMMENT '内容,限制10000字',
  `feeling` varchar(255) DEFAULT NULL COMMENT '感言',
  `author` int(10) NOT NULL COMMENT '作者编号',
  `type` int(10) NOT NULL DEFAULT '0' COMMENT '文章分类',
  `tags` varchar(255) DEFAULT NULL COMMENT '文章标签',
  `announce` int(1) NOT NULL DEFAULT '0' COMMENT '是否发布',
  `update_count` int(5) NOT NULL DEFAULT '0' COMMENT '更新次数',
  `hot` int(1) NOT NULL DEFAULT '0' COMMENT '是否热门,0否1是',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del` int(1) NOT NULL DEFAULT '0' COMMENT '删除标识,0正常1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x_article
-- ----------------------------

-- ----------------------------
-- Table structure for x_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `x_article_tag`;
CREATE TABLE `x_article_tag` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `sort_id` int(4) NOT NULL COMMENT '顺序',
  `tag_name` varchar(255) NOT NULL COMMENT '标签名',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del` int(1) NOT NULL DEFAULT '0' COMMENT '删除标识,0正常1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x_article_tag
-- ----------------------------
INSERT INTO `x_article_tag` VALUES ('0000000001', '0', '未分类', '2018-02-05 17:13:25', null, '0');

-- ----------------------------
-- Table structure for x_article_type
-- ----------------------------
DROP TABLE IF EXISTS `x_article_type`;
CREATE TABLE `x_article_type` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `sort_id` int(4) NOT NULL COMMENT '顺序',
  `type_name` varchar(255) NOT NULL COMMENT '分类名',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del` int(1) NOT NULL DEFAULT '0' COMMENT '删除标识,0正常1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x_article_type
-- ----------------------------
INSERT INTO `x_article_type` VALUES ('0000000001', '0', '未分类', '2018-02-05 17:13:25', null, '0');

-- ----------------------------
-- Table structure for x_blog_image
-- ----------------------------
DROP TABLE IF EXISTS `x_blog_image`;
CREATE TABLE `x_blog_image` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `sort_id` int(4) NOT NULL COMMENT '顺序',
  `path` varchar(255) DEFAULT NULL COMMENT '对象存储图片路径',
  `src` varchar(255) NOT NULL COMMENT '图片源地址',
  `img_desc` varchar(255) DEFAULT NULL COMMENT '图片描述',
  `link` varchar(255) NOT NULL COMMENT '图片所在页面链接',
  `hot` int(1) NOT NULL DEFAULT '0' COMMENT '热门标识,0否1是',
  `sync` int(1) NOT NULL DEFAULT '0' COMMENT '同步标识,0未同步1已同步',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del` int(1) NOT NULL DEFAULT '0' COMMENT '删除标识,0正常1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x_blog_image
-- ----------------------------
INSERT INTO `x_blog_image` VALUES ('0000000001', '1', null, 'img/tm-img-100x100-1.jpg', null, 'http://www.leiho.me', '1', '0', '2018-01-31 15:35:32', '2018-01-31 17:25:30', '0');
INSERT INTO `x_blog_image` VALUES ('0000000002', '2', null, 'img/tm-img-100x100-2.jpg', null, 'http://www.leiho.me', '1', '0', '2018-01-31 15:35:58', '2018-01-31 17:25:30', '0');
INSERT INTO `x_blog_image` VALUES ('0000000003', '3', null, 'img/tm-img-100x100-3.jpg', null, 'http://www.leiho.me', '1', '0', '2018-01-31 15:36:05', '2018-01-31 17:25:30', '0');
INSERT INTO `x_blog_image` VALUES ('0000000004', '4', null, 'img/tm-img-100x100-4.jpg', null, 'http://www.leiho.me', '1', '0', '2018-01-31 15:36:11', '2018-01-31 17:25:30', '0');
INSERT INTO `x_blog_image` VALUES ('0000000005', '5', null, 'img/tm-img-100x100-5.jpg', null, 'http://www.leiho.me', '1', '0', '2018-01-31 15:36:30', '2018-01-31 17:25:30', '0');
INSERT INTO `x_blog_image` VALUES ('0000000006', '6', null, 'img/tm-img-100x100-6.jpg', null, 'http://www.leiho.me', '1', '0', '2018-01-31 15:38:04', '2018-01-31 17:25:28', '0');

-- ----------------------------
-- Table structure for x_comment
-- ----------------------------
DROP TABLE IF EXISTS `x_comment`;
CREATE TABLE `x_comment` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `sort_id` int(4) NOT NULL COMMENT '顺序',
  `comment` varchar(1024) NOT NULL COMMENT '评论',
  `source_link` varchar(255) NOT NULL COMMENT '原文',
  `hot` int(1) DEFAULT '0' COMMENT '是否热门,0否1是',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del` int(1) NOT NULL DEFAULT '0' COMMENT '删除标识,0正常1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x_comment
-- ----------------------------
INSERT INTO `x_comment` VALUES ('0000000001', '1', '开局一张图，故事全靠编', 'http://www.leiho.me', '1', '2018-01-31 15:12:42', '2018-01-31 15:16:33', '0');
INSERT INTO `x_comment` VALUES ('0000000002', '2', '签完合同，美军立刻吓得屁滚尿流、抱头鼠窜、落荒而逃', 'http://www.leiho.me', '1', '2018-01-31 15:13:00', '2018-01-31 15:16:40', '0');
INSERT INTO `x_comment` VALUES ('0000000003', '3', '站在独行的铁链桥上，有一种前不了退不了的感觉，我总觉得自己是在逞能，是在给自己找罪受。在那一刻，我在想，做这些到底为了什么？有人说如果水上有筏估计她就会放弃，我想我也会！不论是那铁链桥还是那所谓的“激情360”，有那么一瞬间我也想过放弃，但是既然是自己选择的路哪怕咬牙也要坚持到最后！最终我坚持下来了，结束的那一刻心里的满足是无法用言语去形容的！这正如人生路上一样，踏上征程的路，就不要想着有反悔的余地。每个人都在想着改变，也都明白道理，改变对于自己或对一个公司都是有帮助的；如果用数字来计的话，估计人群中80%的人都会希望自己的生活有所改变，但是真正去行动的人，估计10%都不到。大多都是因为最开始的那一步，很难，怕自己坚持不了。其实一但踏出了这步，接下来的路，反而更好走。因为我们知道，无论是对是错，都得走下去，没有了后退的权利，后退的话，也许付出比前进还要多。这正和我过铁链桥一样，那一刻，我的心里没有其他任何想法，我知道只有选择前进，不能后退，自己选择的路，哪怕再难，我也要坚持！', 'http://www.leiho.me', '1', '2018-01-31 15:15:58', '2018-01-31 15:16:57', '0');

-- ----------------------------
-- Table structure for x_friend_link
-- ----------------------------
DROP TABLE IF EXISTS `x_friend_link`;
CREATE TABLE `x_friend_link` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `sort_id` int(4) NOT NULL COMMENT '顺序',
  `link_href` varchar(255) NOT NULL COMMENT '友链链接',
  `link_value` varchar(255) NOT NULL COMMENT '友链说明',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del` int(1) NOT NULL DEFAULT '0' COMMENT '删除标识,0正常1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x_friend_link
-- ----------------------------
INSERT INTO `x_friend_link` VALUES ('0000000001', '1', 'http://www.leiho.me', '这个网站不错', '2018-01-26 19:05:45', '2018-01-26 19:06:58', '0');
INSERT INTO `x_friend_link` VALUES ('0000000002', '2', 'http://www.leiho.me', '一个很好的博客', '2018-01-26 19:06:04', '2018-01-26 19:07:02', '0');
INSERT INTO `x_friend_link` VALUES ('0000000003', '3', 'http://www.leiho.me', '这是什么东西', '2018-01-26 19:06:14', '2018-01-26 19:07:06', '0');
INSERT INTO `x_friend_link` VALUES ('0000000004', '4', 'http://www.leiho.me', '还行啊', '2018-01-26 19:06:19', '2018-01-26 19:07:11', '0');
INSERT INTO `x_friend_link` VALUES ('0000000005', '5', 'http://www.leiho.me', '点进来看看', '2018-01-26 19:06:25', '2018-01-26 19:07:15', '0');
INSERT INTO `x_friend_link` VALUES ('0000000006', '6', 'http://www.leiho.me', '不要错过', '2018-01-26 19:06:32', '2018-01-26 19:07:15', '0');

-- ----------------------------
-- Table structure for x_head_item
-- ----------------------------
DROP TABLE IF EXISTS `x_head_item`;
CREATE TABLE `x_head_item` (
  `id` int(8) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `sort_id` int(4) NOT NULL COMMENT '顺序',
  `item_href` varchar(255) NOT NULL COMMENT '标签链接',
  `item_value` varchar(255) NOT NULL COMMENT '标签值',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del` int(1) NOT NULL DEFAULT '0' COMMENT '删除标识,0正常1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x_head_item
-- ----------------------------
INSERT INTO `x_head_item` VALUES ('00000001', '1', 'index', '主页', '2018-01-26 14:08:09', '2018-01-26 14:08:09', '0');
INSERT INTO `x_head_item` VALUES ('00000002', '2', 'article', '文章', '2018-01-26 14:08:17', '2018-01-26 15:15:50', '0');
INSERT INTO `x_head_item` VALUES ('00000003', '3', 'media', '影像', '2018-01-26 14:09:49', '2018-01-26 15:16:06', '0');
INSERT INTO `x_head_item` VALUES ('00000004', '4', 'write', '发布', '2018-01-26 14:09:50', '2018-01-26 15:16:21', '0');
INSERT INTO `x_head_item` VALUES ('00000005', '5', 'manage', '用户', '2018-01-26 14:10:19', '2018-02-02 17:58:36', '0');

-- ----------------------------
-- Table structure for x_site_info
-- ----------------------------
DROP TABLE IF EXISTS `x_site_info`;
CREATE TABLE `x_site_info` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `sort_id` int(4) NOT NULL COMMENT '顺序',
  `item_name` varchar(32) NOT NULL COMMENT '标签名',
  `item_value` varchar(255) NOT NULL COMMENT '标签值',
  `item_desc` varchar(32) NOT NULL COMMENT '标签简介',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del` int(1) NOT NULL DEFAULT '0' COMMENT '删除标识,0正常1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x_site_info
-- ----------------------------
INSERT INTO `x_site_info` VALUES ('0000000001', '1', 'sitename', 'x-space', '网站名称', '2018-01-26 16:48:58', null, '0');
INSERT INTO `x_site_info` VALUES ('0000000002', '2', 'title', '雷吼', '网站标题', '2018-01-26 16:49:26', '2018-01-26 16:50:29', '0');
INSERT INTO `x_site_info` VALUES ('0000000003', '3', 'subtitle', '也许你只是一株稚嫩的幼苗，然而只要坚忍不拔，终会成为参天大树。', '网站介绍', '2018-01-26 16:50:04', null, '0');
INSERT INTO `x_site_info` VALUES ('0000000004', '4', 'motto', '这是座右铭的位置，请务必保证字数，不要太多，也不要太少，要适中，刚刚好最好。', '站长公告板', '2018-01-26 17:08:29', null, '0');
INSERT INTO `x_site_info` VALUES ('0000000005', '5', 'authorize', '转载本站标注原创内容均需获得本人授权，如有版权纠纷请联系本人。', '版权相关', '2018-01-26 17:08:51', '2018-01-26 17:09:49', '0');
INSERT INTO `x_site_info` VALUES ('0000000006', '6', 'site_master_name', '萧大侠/lester', '站长名称', '2018-01-26 17:09:33', null, '0');
INSERT INTO `x_site_info` VALUES ('0000000007', '7', 'copyright_text', 'Copyright 2018 leiho site.', '网站版权声明', '2018-01-31 14:33:32', null, '0');
INSERT INTO `x_site_info` VALUES ('0000000008', '8', 'copyright_link', 'http://www.leiho.me/', '网站版权链接', '2018-01-31 14:34:54', '2018-01-31 14:39:39', '0');
INSERT INTO `x_site_info` VALUES ('0000000009', '9', 'copyright_title', '雷吼小站', '网站版权标题', '2018-01-31 14:35:27', '2018-01-31 14:39:25', '0');
INSERT INTO `x_site_info` VALUES ('0000000010', '10', 'contact_text', 'Build By', '站长联系文本', '2018-01-31 14:40:41', '2018-01-31 14:41:10', '0');
INSERT INTO `x_site_info` VALUES ('0000000011', '11', 'contact_link', 'https://weibo.com/u/5205019995', '站长联系链接', '2018-01-31 14:37:43', '2018-01-31 14:41:14', '0');
INSERT INTO `x_site_info` VALUES ('0000000012', '12', 'contact_title', '@独宿孤雨', '站长联系标题', '2018-01-31 14:38:12', '2018-01-31 14:41:18', '0');
INSERT INTO `x_site_info` VALUES ('0000000013', '13', 'picture_area_context', '时光在无声无息的冲刷着人们的记忆，像一把锋利的刀锋把你的记忆切成零散碎片。', '图片区签名', '2018-01-31 15:19:21', null, '0');

-- ----------------------------
-- Table structure for x_user_account
-- ----------------------------
DROP TABLE IF EXISTS `x_user_account`;
CREATE TABLE `x_user_account` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `account` varchar(64) NOT NULL COMMENT '邮箱或手机号码',
  `username` varchar(32) DEFAULT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `role` varchar(16) NOT NULL DEFAULT 'reader' COMMENT '角色',
  `gender` varchar(8) NOT NULL DEFAULT 'unknown' COMMENT '性别',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del` int(1) NOT NULL DEFAULT '0' COMMENT '删除标识,0正常1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x_user_account
-- ----------------------------
INSERT INTO `x_user_account` VALUES ('0000000001', 'admin@admin.com', 'admin', 'admin', 'superadmin', 'unknown', '2018-01-26 16:04:31', '2018-01-26 16:22:32', '0');
