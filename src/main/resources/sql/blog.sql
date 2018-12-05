/*
 Navicat Premium Data Transfer

 Source Server         : www_xaoei_top
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : 106.15.93.130:3306
 Source Schema         : www_xaoei_top

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 05/12/2018 12:45:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for x_article
-- ----------------------------
DROP TABLE IF EXISTS `x_article`;
CREATE TABLE `x_article`  (
                            `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
                            `sort_id` int(4) NULL DEFAULT NULL COMMENT '顺序',
                            `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'unnamed' COMMENT '文章标题',
                            `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容,限制10000字',
                            `feeling` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '感言',
                            `author` int(10) NOT NULL COMMENT '作者编号',
                            `type` int(10) NOT NULL DEFAULT 0 COMMENT '文章分类',
                            `tags` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章标签',
                            `announce` int(1) NOT NULL DEFAULT 0 COMMENT '是否发布',
                            `update_count` int(5) NOT NULL DEFAULT 0 COMMENT '更新次数',
                            `hot` int(1) NOT NULL DEFAULT 0 COMMENT '是否热门,0否1是',
                            `announce_time` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
                            `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                            `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
                            `del` int(1) NOT NULL DEFAULT 0 COMMENT '删除标识,0正常1删除',
                            `发布时间` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容,限制10000字',
                            PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x_article
-- ----------------------------
INSERT INTO `x_article` VALUES (0000000001, NULL, '第一篇文章', '<p>Hello World</p>', '雀跃', 1, 1, '1', 1, 2, 1, NULL, '2018-02-07 10:55:22', '2018-12-05 12:42:40', 0, NULL);

-- ----------------------------
-- Table structure for x_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `x_article_tag`;
CREATE TABLE `x_article_tag`  (
                                `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
                                `sort_id` int(4) NULL DEFAULT NULL COMMENT '顺序',
                                `tag_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签名',
                                `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
                                `del` int(1) NOT NULL DEFAULT 0 COMMENT '删除标识,0正常1删除',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x_article_tag
-- ----------------------------
INSERT INTO `x_article_tag` VALUES (0000000001, NULL, 'java', '2018-02-05 17:13:25', '2018-02-06 15:51:13', 0);
INSERT INTO `x_article_tag` VALUES (0000000002, NULL, 'spring', '2018-02-06 15:51:12', NULL, 0);
INSERT INTO `x_article_tag` VALUES (0000000003, NULL, 'mybatis', '2018-02-06 15:51:22', NULL, 0);

-- ----------------------------
-- Table structure for x_article_type
-- ----------------------------
DROP TABLE IF EXISTS `x_article_type`;
CREATE TABLE `x_article_type`  (
                                 `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
                                 `sort_id` int(4) NOT NULL COMMENT '顺序',
                                 `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名',
                                 `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                 `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
                                 `del` int(1) NOT NULL DEFAULT 0 COMMENT '删除标识,0正常1删除',
                                 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x_article_type
-- ----------------------------
INSERT INTO `x_article_type` VALUES (0000000001, 1, '<i class=\"fa fa-pencil\" aria-hidden=\"true\"></i> 文章', '2018-02-06 14:53:29', '2018-02-06 15:44:26', 0);
INSERT INTO `x_article_type` VALUES (0000000002, 2, '<i class=\"fa fa-book\" aria-hidden=\"true\"></i> 教程', '2018-02-06 14:53:33', '2018-02-06 15:44:37', 0);
INSERT INTO `x_article_type` VALUES (0000000003, 3, '<i class=\"fa fa-leaf\" aria-hidden=\"true\"></i> 随笔', '2018-02-06 14:53:44', '2018-02-06 15:44:44', 0);
INSERT INTO `x_article_type` VALUES (0000000004, 4, '<i class=\"fa fa-retweet\" aria-hidden=\"true\"></i> 转载', '2018-02-06 14:53:49', '2018-02-06 15:44:52', 0);
INSERT INTO `x_article_type` VALUES (0000000005, 5, '<i class=\"fa fa-calendar\" aria-hidden=\"true\"></i> 日志', '2018-02-06 14:54:28', '2018-02-06 15:46:58', 0);
INSERT INTO `x_article_type` VALUES (0000000006, 6, '<i class=\"fa fa-paint-brush\" aria-hidden=\"true\"></i> 其它', '2018-02-06 14:54:00', '2018-02-06 15:46:46', 0);

-- ----------------------------
-- Table structure for x_comment
-- ----------------------------
DROP TABLE IF EXISTS `x_comment`;
CREATE TABLE `x_comment`  (
                            `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
                            `sort_id` int(4) NOT NULL COMMENT '顺序',
                            `comment` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论',
                            `user_id` int(10) NULL DEFAULT NULL COMMENT '评论人',
                            `article_id` int(10) NULL DEFAULT NULL COMMENT '原文',
                            `hot` int(1) NULL DEFAULT 0 COMMENT '是否热门,0否1是',
                            `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                            `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
                            `del` int(1) NOT NULL DEFAULT 0 COMMENT '删除标识,0正常1删除',
                            PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x_comment
-- ----------------------------
INSERT INTO `x_comment` VALUES (0000000001, 1, '开局一张图，故事全靠编', NULL, NULL, 1, '2018-01-31 15:12:42', '2018-01-31 15:16:33', 0);
INSERT INTO `x_comment` VALUES (0000000002, 2, '签完合同，美军立刻吓得屁滚尿流、抱头鼠窜、落荒而逃', NULL, NULL, 1, '2018-01-31 15:13:00', '2018-01-31 15:16:40', 0);
INSERT INTO `x_comment` VALUES (0000000003, 3, '站在独行的铁链桥上，有一种前不了退不了的感觉，我总觉得自己是在逞能，是在给自己找罪受。在那一刻，我在想，做这些到底为了什么？有人说如果水上有筏估计她就会放弃，我想我也会！不论是那铁链桥还是那所谓的“激情360”，有那么一瞬间我也想过放弃，但是既然是自己选择的路哪怕咬牙也要坚持到最后！最终我坚持下来了，结束的那一刻心里的满足是无法用言语去形容的！这正如人生路上一样，踏上征程的路，就不要想着有反悔的余地。每个人都在想着改变，也都明白道理，改变对于自己或对一个公司都是有帮助的；如果用数字来计的话，估计人群中80%的人都会希望自己的生活有所改变，但是真正去行动的人，估计10%都不到。大多都是因为最开始的那一步，很难，怕自己坚持不了。其实一但踏出了这步，接下来的路，反而更好走。因为我们知道，无论是对是错，都得走下去，没有了后退的权利，后退的话，也许付出比前进还要多。这正和我过铁链桥一样，那一刻，我的心里没有其他任何想法，我知道只有选择前进，不能后退，自己选择的路，哪怕再难，我也要坚持！', NULL, NULL, 1, '2018-01-31 15:15:58', '2018-01-31 15:16:57', 0);

-- ----------------------------
-- Table structure for x_friend_link
-- ----------------------------
DROP TABLE IF EXISTS `x_friend_link`;
CREATE TABLE `x_friend_link`  (
                                `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
                                `sort_id` int(4) NOT NULL COMMENT '顺序',
                                `link_href` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '友链链接',
                                `link_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '友链说明',
                                `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
                                `del` int(1) NOT NULL DEFAULT 0 COMMENT '删除标识,0正常1删除',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x_friend_link
-- ----------------------------
INSERT INTO `x_friend_link` VALUES (0000000001, 1, 'http://mail.xaoei.top', '[工具]玄奥邮局', '2018-01-26 19:05:45', '2018-12-05 12:41:03', 0);
INSERT INTO `x_friend_link` VALUES (0000000002, 2, 'https://cloud.xaoei.top', '[私人]玄奥仓库', '2018-01-26 19:06:04', '2018-12-05 12:41:03', 0);
INSERT INTO `x_friend_link` VALUES (0000000003, 3, 'http://www.leiho.me', '这是什么东西', '2018-01-26 19:06:14', '2018-12-05 12:41:03', 0);
INSERT INTO `x_friend_link` VALUES (0000000004, 4, 'http://www.leiho.me', '还行啊', '2018-01-26 19:06:19', '2018-12-05 12:41:03', 0);
INSERT INTO `x_friend_link` VALUES (0000000005, 5, 'http://www.leiho.me', '点进来看看', '2018-01-26 19:06:25', '2018-12-05 12:41:03', 0);
INSERT INTO `x_friend_link` VALUES (0000000006, 6, 'http://www.leiho.me', '不要错过', '2018-01-26 19:06:32', '2018-12-05 12:41:03', 0);

-- ----------------------------
-- Table structure for x_head_item
-- ----------------------------
DROP TABLE IF EXISTS `x_head_item`;
CREATE TABLE `x_head_item`  (
                              `id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
                              `sort_id` int(4) NOT NULL COMMENT '顺序',
                              `item_href` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签链接',
                              `item_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签值',
                              `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                              `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
                              `del` int(1) NOT NULL DEFAULT 0 COMMENT '删除标识,0正常1删除',
                              PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x_head_item
-- ----------------------------
INSERT INTO `x_head_item` VALUES (00000001, 1, 'index', '主页', '2018-01-26 14:08:09', '2018-01-26 14:08:09', 0);
INSERT INTO `x_head_item` VALUES (00000002, 2, 'article', '文章', '2018-01-26 14:08:17', '2018-01-26 15:15:50', 0);
INSERT INTO `x_head_item` VALUES (00000003, 3, 'media', '影像', '2018-01-26 14:09:49', '2018-01-26 15:16:06', 0);
INSERT INTO `x_head_item` VALUES (00000004, 4, 'write', '发布', '2018-01-26 14:09:50', '2018-01-26 15:16:21', 0);
INSERT INTO `x_head_item` VALUES (00000005, 5, 'user', '用户', '2018-01-26 14:10:19', '2018-12-04 18:54:52', 0);
INSERT INTO `x_head_item` VALUES (00000006, 6, 'manage', '管理', '2018-12-04 18:54:48', NULL, 0);

-- ----------------------------
-- Table structure for x_index_setting
-- ----------------------------
DROP TABLE IF EXISTS `x_index_setting`;
CREATE TABLE `x_index_setting`  (
                                  `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
                                  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型',
                                  `article_id` int(11) NULL DEFAULT NULL COMMENT '文章编号',
                                  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
                                  `head_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片',
                                  `feeling` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '感言',
                                  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部分内容',
                                  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
                                  `del` int(1) NOT NULL DEFAULT 0 COMMENT '删除标识,0正常1删除',
                                  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x_index_setting
-- ----------------------------
INSERT INTO `x_index_setting` VALUES (0000000001, 'hot', 1, '第一篇文章', 'https://blog-1252251484.cos.ap-shanghai.myqcloud.com/image/total/2018-12-05-1fab19afedd048f084038e8b4660e8fe.jpg', '不错', '不错', '2018-12-04 19:19:26', '2018-12-05 12:38:09', 0);
INSERT INTO `x_index_setting` VALUES (0000000002, 'hot', 1, '第一篇文章', 'http://www.hellotw.com/zt/20180214/W020180214390886667473.jpg', '不错', '不错', '2018-12-04 19:19:26', '2018-12-05 12:38:09', 0);
INSERT INTO `x_index_setting` VALUES (0000000003, 'hot', 1, '第一篇文章', 'http://www.hellotw.com/zt/20180214/W020180214390886667473.jpg', '不错', '不错', '2018-12-04 19:19:26', '2018-12-05 12:38:09', 0);
INSERT INTO `x_index_setting` VALUES (0000000004, 'hot', 1, '第一篇文章', 'http://www.hellotw.com/zt/20180214/W020180214390886667473.jpg', '不错', '不错', '2018-12-04 19:19:26', '2018-12-05 12:38:09', 0);
INSERT INTO `x_index_setting` VALUES (0000000005, 'awesome', 1, '第一篇文章', 'http://n.sinaimg.cn/sinacn18/130/w600h330/20181027/8f08-hnaivxp4368925.jpg', '不错', '不错', '2018-12-04 19:19:26', '2018-12-04 19:51:21', 0);

-- ----------------------------
-- Table structure for x_ip_record
-- ----------------------------
DROP TABLE IF EXISTS `x_ip_record`;
CREATE TABLE `x_ip_record`  (
                              `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
                              `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
                              `user_id` int(10) NULL DEFAULT NULL COMMENT '用户编号',
                              `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
                              `is_login` int(1) NULL DEFAULT 0 COMMENT '是否登录',
                              `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                              `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
                              `del` int(1) NOT NULL DEFAULT 0 COMMENT '删除标识,0正常1删除',
                              PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x_ip_record
-- ----------------------------
INSERT INTO `x_ip_record` VALUES (0000000001, '0:0:0:0:0:0:0:1', NULL, NULL, 0, '2018-12-04 18:38:20', '2018-12-05 12:30:31', 0);
INSERT INTO `x_ip_record` VALUES (0000000002, '0:0:0:0:0:0:0:1', 1, 'admin', 1, '2018-12-04 18:39:19', '2018-12-05 12:44:44', 0);

-- ----------------------------
-- Table structure for x_permission
-- ----------------------------
DROP TABLE IF EXISTS `x_permission`;
CREATE TABLE `x_permission`  (
                               `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
                               `sort_id` int(4) NULL DEFAULT NULL COMMENT '顺序',
                               `permission` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                               `permission_desc` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                               `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'superadmin' COMMENT '角色',
                               `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                               `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
                               `del` int(1) NOT NULL DEFAULT 0 COMMENT '删除标识,0正常1删除',
                               PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x_permission
-- ----------------------------
INSERT INTO `x_permission` VALUES (0000000001, 1, '/manage', '管理页面', '[superadmin]', '2018-12-04 18:44:33', '2018-12-04 19:09:33', 0);
INSERT INTO `x_permission` VALUES (0000000002, 2, '/write', '写作页面', '[superadmin]', '2018-12-04 18:44:48', '2018-12-04 19:09:36', 0);
INSERT INTO `x_permission` VALUES (0000000003, 3, '/manage/self', '个人管理', '[superadmin]', '2018-12-04 19:07:10', '2018-12-04 19:09:48', 0);
INSERT INTO `x_permission` VALUES (0000000004, 4, '/manage/link', '外链管理', '[superadmin]', '2018-12-04 18:42:41', '2018-12-04 19:09:09', 0);
INSERT INTO `x_permission` VALUES (0000000005, 5, '/manage/indx', '首页管理', '[superadmin]', '2018-12-04 18:42:29', '2018-12-04 19:09:41', 0);
INSERT INTO `x_permission` VALUES (0000000006, 6, '/manage/info', '站点信息管理', '[superadmin]', '2018-12-04 18:42:16', '2018-12-04 19:09:42', 0);
INSERT INTO `x_permission` VALUES (0000000007, 7, '/manage/user', '用户管理', '[superadmin]', '2018-12-04 18:41:59', '2018-12-04 19:09:43', 0);

-- ----------------------------
-- Table structure for x_role
-- ----------------------------
DROP TABLE IF EXISTS `x_role`;
CREATE TABLE `x_role`  (
                         `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
                         `sort_id` int(4) NULL DEFAULT NULL COMMENT '顺序',
                         `role` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色',
                         `role_desc` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
                         `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                         `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
                         `del` int(1) NOT NULL DEFAULT 0 COMMENT '删除标识,0正常1删除',
                         PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x_role
-- ----------------------------
INSERT INTO `x_role` VALUES (0000000001, 1, 'superadmin', '超级管理员', '2018-02-12 14:16:17', NULL, 0);
INSERT INTO `x_role` VALUES (0000000002, 2, 'admin', '管理员', '2018-02-12 14:16:29', NULL, 0);
INSERT INTO `x_role` VALUES (0000000003, 3, 'author', '作者', '2018-02-12 14:16:43', NULL, 0);
INSERT INTO `x_role` VALUES (0000000004, 4, 'reader', '读者', '2018-02-12 14:16:53', NULL, 0);

-- ----------------------------
-- Table structure for x_site_info
-- ----------------------------
DROP TABLE IF EXISTS `x_site_info`;
CREATE TABLE `x_site_info`  (
                              `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
                              `sort_id` int(4) NOT NULL COMMENT '顺序',
                              `item_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签名',
                              `item_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签值',
                              `item_desc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签简介',
                              `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                              `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
                              `del` int(1) NOT NULL DEFAULT 0 COMMENT '删除标识,0正常1删除',
                              PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x_site_info
-- ----------------------------
INSERT INTO `x_site_info` VALUES (0000000001, 1, 'sitename', 'xaoei', '网站名称', '2018-01-26 16:48:58', '2018-12-05 12:39:20', 0);
INSERT INTO `x_site_info` VALUES (0000000002, 2, 'title', '玄奥世界', '网站标题', '2018-01-26 16:49:26', '2018-12-05 12:39:20', 0);
INSERT INTO `x_site_info` VALUES (0000000003, 3, 'subtitle', '也许你只是一株稚嫩的幼苗，然而只要坚忍不拔，终会成为参天大树。', '网站介绍', '2018-01-26 16:50:04', NULL, 0);
INSERT INTO `x_site_info` VALUES (0000000004, 4, 'motto', '这是座右铭的位置，请务必保证字数，不要太多，也不要太少，要适中，刚刚好最好。', '站长公告板', '2018-01-26 17:08:29', NULL, 0);
INSERT INTO `x_site_info` VALUES (0000000005, 5, 'authorize', '转载本站标注原创内容均需获得本人授权，如有版权纠纷请联系本人。', '版权相关', '2018-01-26 17:08:51', '2018-01-26 17:09:49', 0);
INSERT INTO `x_site_info` VALUES (0000000006, 6, 'site_master_name', '萧大侠/lester', '站长名称', '2018-01-26 17:09:33', NULL, 0);
INSERT INTO `x_site_info` VALUES (0000000007, 7, 'copyright_text', 'Copyright 2018 leiho site.', '网站版权声明', '2018-01-31 14:33:32', NULL, 0);
INSERT INTO `x_site_info` VALUES (0000000008, 8, 'copyright_link', 'http://www.xaoei.top', '网站版权链接', '2018-01-31 14:34:54', '2018-12-05 12:39:20', 0);
INSERT INTO `x_site_info` VALUES (0000000009, 9, 'copyright_title', '玄奥世界', '网站版权标题', '2018-01-31 14:35:27', '2018-12-05 12:39:20', 0);
INSERT INTO `x_site_info` VALUES (0000000010, 10, 'contact_text', 'Build By', '站长联系文本', '2018-01-31 14:40:41', '2018-01-31 14:41:10', 0);
INSERT INTO `x_site_info` VALUES (0000000011, 11, 'contact_link', 'https://weibo.com/u/5205019995', '站长联系链接', '2018-01-31 14:37:43', '2018-01-31 14:41:14', 0);
INSERT INTO `x_site_info` VALUES (0000000012, 12, 'contact_title', '@独宿孤雨', '站长联系标题', '2018-01-31 14:38:12', '2018-01-31 14:41:18', 0);
INSERT INTO `x_site_info` VALUES (0000000013, 13, 'picture_area_context', '时光在无声无息的冲刷着人们的记忆，像一把锋利的刀锋把你的记忆切成零散碎片。', '图片区签名', '2018-01-31 15:19:21', NULL, 0);

-- ----------------------------
-- Table structure for x_user_account
-- ----------------------------
DROP TABLE IF EXISTS `x_user_account`;
CREATE TABLE `x_user_account`  (
                                 `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
                                 `account` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱或手机号码',
                                 `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
                                 `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
                                 `role` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'reader' COMMENT '角色',
                                 `gender` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'unknown' COMMENT '性别',
                                 `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                 `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
                                 `del` int(1) NOT NULL DEFAULT 0 COMMENT '删除标识,0正常1删除',
                                 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x_user_account
-- ----------------------------
INSERT INTO `x_user_account` VALUES (0000000001, 'admin', 'admin', '1000:7560794ef5bf6fb6ea28d13511e716a9e149b6fd03485af0:22881fc707c82ae450fcdfa48fc397ce757f140a47d9362d', 'superadmin', 'unknown', '2018-01-26 16:04:31', '2018-10-19 16:44:19', 0);
INSERT INTO `x_user_account` VALUES (0000000002, '1104300304@qq.com', '1104300304@qq.com', '1000:7560794ef5bf6fb6ea28d13511e716a9e149b6fd03485af0:22881fc707c82ae450fcdfa48fc397ce757f140a47d9362d', 'reader', 'unknown', '2018-02-11 17:49:44', '2018-10-19 16:44:21', 0);
INSERT INTO `x_user_account` VALUES (0000000003, '970244559@qq.com', '本人就是萧大俠', '1000:7560794ef5bf6fb6ea28d13511e716a9e149b6fd03485af0:22881fc707c82ae450fcdfa48fc397ce757f140a47d9362d', 'reader', 'unknown', '2018-02-12 10:23:21', '2018-10-19 16:44:23', 0);
INSERT INTO `x_user_account` VALUES (0000000004, 'xiaol@tenzont.com', '三墩刘德华', '1000:7560794ef5bf6fb6ea28d13511e716a9e149b6fd03485af0:22881fc707c82ae450fcdfa48fc397ce757f140a47d9362d', 'reader', 'unknown', '2018-10-19 16:44:07', NULL, 0);

-- ----------------------------
-- Table structure for x_user_image
-- ----------------------------
DROP TABLE IF EXISTS `x_user_image`;
CREATE TABLE `x_user_image`  (
                               `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
                               `sort_id` int(4) NULL DEFAULT NULL COMMENT '顺序',
                               `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对象存储图片路径',
                               `small_src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '小图源地址',
                               `total_src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完整图片源地址',
                               `user_id` int(10) NULL DEFAULT NULL COMMENT '唯一标识',
                               `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
                               `img_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片描述',
                               `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片所在页面链接',
                               `hot` int(1) NULL DEFAULT 0 COMMENT '热门标识,0否1是',
                               `sync` int(1) NULL DEFAULT 0 COMMENT '同步标识,0未同步1已同步',
                               `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                               `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
                               `del` int(1) NOT NULL DEFAULT 0 COMMENT '删除标识,0正常1删除',
                               PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x_user_image
-- ----------------------------
INSERT INTO `x_user_image` VALUES (0000000002, NULL, NULL, 'https://blog-1252251484.cos.ap-shanghai.myqcloud.com/image/small/2018-12-05-de98749e0bf54b6684fe23aa25adc23f.jpg', 'https://blog-1252251484.cos.ap-shanghai.myqcloud.com/image/total/2018-12-05-de98749e0bf54b6684fe23aa25adc23f.jpg', 1, 'admin', NULL, NULL, 0, 0, '2018-12-05 12:14:36', NULL, 0);
INSERT INTO `x_user_image` VALUES (0000000003, NULL, NULL, 'https://blog-1252251484.cos.ap-shanghai.myqcloud.com/image/small/2018-12-05-bba1a0db1a534d9e835e26fe3b6f0626.jpg', 'https://blog-1252251484.cos.ap-shanghai.myqcloud.com/image/total/2018-12-05-bba1a0db1a534d9e835e26fe3b6f0626.jpg', 1, 'admin', NULL, NULL, 0, 0, '2018-12-05 12:15:20', NULL, 0);
INSERT INTO `x_user_image` VALUES (0000000004, NULL, NULL, 'https://blog-1252251484.cos.ap-shanghai.myqcloud.com/image/small/2018-12-05-1bf0e280a2ea4ca1b0844007db97911c.jpg', 'https://blog-1252251484.cos.ap-shanghai.myqcloud.com/image/total/2018-12-05-1bf0e280a2ea4ca1b0844007db97911c.jpg', 1, 'admin', NULL, NULL, 0, 0, '2018-12-05 12:19:05', NULL, 0);
INSERT INTO `x_user_image` VALUES (0000000005, NULL, NULL, 'https://blog-1252251484.cos.ap-shanghai.myqcloud.com/image/small/2018-12-05-3fbb77d6f017400ea168585e61743893.jpg', 'https://blog-1252251484.cos.ap-shanghai.myqcloud.com/image/total/2018-12-05-3fbb77d6f017400ea168585e61743893.jpg', 1, 'admin', NULL, NULL, 0, 0, '2018-12-05 12:20:46', NULL, 0);
INSERT INTO `x_user_image` VALUES (0000000006, NULL, NULL, 'https://blog-1252251484.cos.ap-shanghai.myqcloud.com/image/small/2018-12-05-80225fce26c949dab0e4a6f6949e1322.jpg', 'https://blog-1252251484.cos.ap-shanghai.myqcloud.com/image/total/2018-12-05-80225fce26c949dab0e4a6f6949e1322.jpg', 1, 'admin', NULL, NULL, 0, 0, '2018-12-05 12:21:34', NULL, 0);
INSERT INTO `x_user_image` VALUES (0000000007, NULL, NULL, 'https://blog-1252251484.cos.ap-shanghai.myqcloud.com/image/small/2018-12-05-7611113c04ed474381ab771dc9b800af.jpg', 'https://blog-1252251484.cos.ap-shanghai.myqcloud.com/image/total/2018-12-05-7611113c04ed474381ab771dc9b800af.jpg', 1, 'admin', NULL, NULL, 0, 0, '2018-12-05 12:22:43', NULL, 0);
INSERT INTO `x_user_image` VALUES (0000000008, NULL, NULL, 'https://blog-1252251484.cos.ap-shanghai.myqcloud.com/image/small/2018-12-05-993a0fbdc2264545ae6c6a0c8ae4e4c2.jpg', 'https://blog-1252251484.cos.ap-shanghai.myqcloud.com/image/total/2018-12-05-993a0fbdc2264545ae6c6a0c8ae4e4c2.jpg', 1, 'admin', NULL, NULL, 0, 0, '2018-12-05 12:22:57', NULL, 0);
INSERT INTO `x_user_image` VALUES (0000000009, NULL, NULL, 'https://blog-1252251484.cos.ap-shanghai.myqcloud.com/image/small/2018-12-05-8e43151c37a842f5a4424e316beea3f3.jpg', 'https://blog-1252251484.cos.ap-shanghai.myqcloud.com/image/total/2018-12-05-8e43151c37a842f5a4424e316beea3f3.jpg', 1, 'admin', NULL, NULL, 0, 0, '2018-12-05 12:23:32', NULL, 0);
INSERT INTO `x_user_image` VALUES (0000000010, NULL, NULL, 'https://blog-1252251484.cos.ap-shanghai.myqcloud.com/image/small/2018-12-05-7983a0a41315405c9c1c55f6c5706275.jpg', 'https://blog-1252251484.cos.ap-shanghai.myqcloud.com/image/total/2018-12-05-7983a0a41315405c9c1c55f6c5706275.jpg', 1, 'admin', NULL, NULL, 0, 0, '2018-12-05 12:24:41', NULL, 0);
INSERT INTO `x_user_image` VALUES (0000000011, NULL, NULL, 'https://blog-1252251484.cos.ap-shanghai.myqcloud.com/image/small/2018-12-05-784001193cc449cd9f92a2c7e900ad4c.jpg', 'https://blog-1252251484.cos.ap-shanghai.myqcloud.com/image/total/2018-12-05-784001193cc449cd9f92a2c7e900ad4c.jpg', 1, 'admin', NULL, NULL, 0, 0, '2018-12-05 12:30:52', NULL, 0);
INSERT INTO `x_user_image` VALUES (0000000012, NULL, NULL, 'https://blog-1252251484.cos.ap-shanghai.myqcloud.com/image/small/2018-12-05-1fab19afedd048f084038e8b4660e8fe.jpg', 'https://blog-1252251484.cos.ap-shanghai.myqcloud.com/image/total/2018-12-05-1fab19afedd048f084038e8b4660e8fe.jpg', 1, 'admin', NULL, NULL, 0, 0, '2018-12-05 12:38:05', NULL, 0);

SET FOREIGN_KEY_CHECKS = 1;
