SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Records of del_x_blog_image
-- ----------------------------
INSERT INTO `del_x_blog_image` VALUES (0000000001, 1, NULL, 'img/tm-img-100x100-1.jpg', NULL, 'http://www.leiho.me', 1, 0, '2018-01-31 15:35:32', '2018-01-31 17:25:30', 0);
INSERT INTO `del_x_blog_image` VALUES (0000000002, 2, NULL, 'img/tm-img-100x100-2.jpg', NULL, 'http://www.leiho.me', 1, 0, '2018-01-31 15:35:58', '2018-01-31 17:25:30', 0);
INSERT INTO `del_x_blog_image` VALUES (0000000003, 3, NULL, 'img/tm-img-100x100-3.jpg', NULL, 'http://www.leiho.me', 1, 0, '2018-01-31 15:36:05', '2018-01-31 17:25:30', 0);
INSERT INTO `del_x_blog_image` VALUES (0000000004, 4, NULL, 'img/tm-img-100x100-4.jpg', NULL, 'http://www.leiho.me', 1, 0, '2018-01-31 15:36:11', '2018-01-31 17:25:30', 0);
INSERT INTO `del_x_blog_image` VALUES (0000000005, 5, NULL, 'img/tm-img-100x100-5.jpg', NULL, 'http://www.leiho.me', 1, 0, '2018-01-31 15:36:30', '2018-01-31 17:25:30', 0);
INSERT INTO `del_x_blog_image` VALUES (0000000006, 6, NULL, 'img/tm-img-100x100-6.jpg', NULL, 'http://www.leiho.me', 1, 0, '2018-01-31 15:38:04', '2018-01-31 17:25:28', 0);

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
INSERT INTO `x_article` VALUES (0000000001, NULL, '第一篇文章', '<p>付款了就是离开房间卡圣诞节福利时间的房价飞洒地方受到了福建阿双方距离圣诞节福利的看法s</p>', '还阔以', 1, 2, '2,3,4,5', 1, 7, 0, NULL, '2018-02-07 10:55:22', '2018-02-07 10:57:29', 0, NULL);
INSERT INTO `x_article` VALUES (0000000002, NULL, '测试', '<p style=\"text-align: center;\"><embed height=\"415\" width=\"544\" quality=\"high\" allowfullscreen=\"true\" type=\"application/x-shockwave-flash\" src=\"//static.hdslb.com/miniloader.swf\" flashvars=\"aid=19250761&amp;p=1\"></p><p><img src=\"https://gss1.bdstatic.com/9vo3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike92%2C5%2C5%2C92%2C30/sign=c4931b2f2334349b600b66d7a8837eab/94cad1c8a786c9179e80a80cc23d70cf3bc75700.jpg\" style=\"max-width:100%;\"><br></p>', '哈哈哈哈哈哈哈哈哈哈哈哈', 1, 6, '5,6,12,28,29', 1, 3, 0, NULL, '2018-02-07 14:59:41', '2018-02-07 15:01:53', 0, NULL);
INSERT INTO `x_article` VALUES (0000000003, NULL, '本地图片上传测试', '<p><img src=\"image/54d78641cf7d45b8a118f91e2d4cc516.png\" style=\"max-width:100%;\"><br></p><p>哈哈哈哈哈哈哈哈哈哈哈哈或或hhhhhhhhhh<img src=\"http://localhost:8888/image/54d78641cf7d45b8a118f91e2d4cc516.png\" style=\"max-width: 100%;\"></p>', '还行', 1, 4, '3,20,24,30,41', 1, 4, 0, NULL, '2018-02-07 17:30:03', '2018-02-07 17:30:54', 0, NULL);
INSERT INTO `x_article` VALUES (0000000004, NULL, '图片上传至服务器', '<h1>测试上传图片到服务器成功<img src=\"image/1bce443c584949af88e4fe4e64020e32.png\" style=\"max-width: 100%;\"></h1><p><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[舔屏]\" data-w-e=\"1\"><br></p><p><br></p><p><br></p>', '哈哈', 1, 3, '3,19,31', 1, 2, 0, NULL, '2018-02-08 10:25:05', '2018-02-08 10:25:07', 0, NULL);
INSERT INTO `x_article` VALUES (0000000005, NULL, '代码测试', '<pre><code>package me.leiho.blog.vos;\n\nimport me.leiho.blog.entities.StringEntity;\n\nimport java.util.List;\n\n/**\n * @Author: 萧大侠\n * @Description:\n * @Date: Create in 9:55 2018/2/7\n * @Contact: yesxiaolei@outlook.com\n */\npublic class PicUpResult extends StringEntity{\n    private Integer errno;\n    private List&lt;String&gt; data;\n\n    public PicUpResult(){}\n\n    public PicUpResult(Integer errno){\n        this.errno = errno;\n    }\n\n    public PicUpResult(Integer errno,List&lt;String&gt; data){\n        this.errno = errno;\n        this.data = data;\n    }\n\n    public Integer getErrno() {\n        return errno;\n    }\n\n    public void setErrno(Integer errno) {\n        this.errno = errno;\n    }\n\n    public List&lt;String&gt; getData() {\n        return data;\n    }\n\n    public void setData(List&lt;String&gt; data) {\n        this.data = data;\n    }\n}</code></pre><p><br></p>', '代码测试', 1, 3, '3', 1, 2, 0, NULL, '2018-02-08 11:19:10', '2018-02-08 11:19:12', 0, NULL);

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
INSERT INTO `x_article_tag` VALUES (0000000004, NULL, '荒野之息', '2018-02-06 15:51:32', NULL, 0);
INSERT INTO `x_article_tag` VALUES (0000000005, NULL, '软件', '2018-02-06 15:51:48', NULL, 0);
INSERT INTO `x_article_tag` VALUES (0000000006, NULL, 'windows', '2018-02-06 15:51:58', NULL, 0);
INSERT INTO `x_article_tag` VALUES (0000000007, NULL, 'linux', '2018-02-06 15:52:05', NULL, 0);
INSERT INTO `x_article_tag` VALUES (0000000008, NULL, 'hello', '2018-02-07 11:21:09', NULL, 0);
INSERT INTO `x_article_tag` VALUES (0000000009, NULL, '1', '2018-02-07 11:22:31', NULL, 0);
INSERT INTO `x_article_tag` VALUES (0000000010, NULL, '2', '2018-02-07 11:28:35', NULL, 0);
INSERT INTO `x_article_tag` VALUES (0000000011, NULL, '3', '2018-02-07 11:28:35', NULL, 0);
INSERT INTO `x_article_tag` VALUES (0000000012, NULL, '测试', '2018-02-07 13:46:21', '2018-02-07 13:47:36', 0);
INSERT INTO `x_article_tag` VALUES (0000000013, NULL, 'wrong', '2018-02-07 13:47:56', '2018-02-07 13:48:21', 0);
INSERT INTO `x_article_tag` VALUES (0000000014, NULL, 'error', '2018-02-07 13:49:18', '2018-02-07 13:51:49', 0);
INSERT INTO `x_article_tag` VALUES (0000000015, NULL, 'hhh', '2018-02-07 13:52:03', '2018-02-07 13:54:40', 0);
INSERT INTO `x_article_tag` VALUES (0000000016, NULL, '大发顺丰三分', '2018-02-07 13:52:42', '2018-02-07 13:54:50', 0);
INSERT INTO `x_article_tag` VALUES (0000000017, NULL, '方法', '2018-02-07 13:55:00', '2018-02-07 13:57:31', 0);
INSERT INTO `x_article_tag` VALUES (0000000018, NULL, '搜索', '2018-02-07 13:57:23', '2018-02-07 13:57:33', 0);
INSERT INTO `x_article_tag` VALUES (0000000019, NULL, '嗯嗯', '2018-02-07 13:57:55', NULL, 0);
INSERT INTO `x_article_tag` VALUES (0000000020, NULL, '哈哈哈', '2018-02-07 14:04:56', NULL, 0);
INSERT INTO `x_article_tag` VALUES (0000000021, NULL, '订单', '2018-02-07 14:06:16', NULL, 0);
INSERT INTO `x_article_tag` VALUES (0000000022, NULL, '大饭店', '2018-02-07 14:07:37', NULL, 0);
INSERT INTO `x_article_tag` VALUES (0000000023, NULL, '问问', '2018-02-07 14:11:26', NULL, 0);
INSERT INTO `x_article_tag` VALUES (0000000024, NULL, '如同仁堂', '2018-02-07 14:14:09', NULL, 0);
INSERT INTO `x_article_tag` VALUES (0000000025, NULL, 'id', '2018-02-07 14:17:02', NULL, 0);
INSERT INTO `x_article_tag` VALUES (0000000026, NULL, '让人', '2018-02-07 14:42:24', NULL, 0);
INSERT INTO `x_article_tag` VALUES (0000000027, NULL, '天天', '2018-02-07 14:42:26', NULL, 0);
INSERT INTO `x_article_tag` VALUES (0000000028, NULL, '影音', '2018-02-07 14:42:29', NULL, 0);
INSERT INTO `x_article_tag` VALUES (0000000029, NULL, '哈哈哈哈哈哈哈哈哈哈哈哈', '2018-02-07 14:43:31', NULL, 0);
INSERT INTO `x_article_tag` VALUES (0000000030, NULL, '嗯嗯嗯', '2018-02-07 14:52:28', NULL, 0);
INSERT INTO `x_article_tag` VALUES (0000000031, NULL, '日日日', '2018-02-07 14:52:33', NULL, 0);
INSERT INTO `x_article_tag` VALUES (0000000032, NULL, '啊啊啊啊', '2018-02-07 14:52:36', NULL, 0);
INSERT INTO `x_article_tag` VALUES (0000000033, NULL, 'helloworld', '2018-02-07 14:54:05', NULL, 0);
INSERT INTO `x_article_tag` VALUES (0000000034, NULL, '啊啊啊', '2018-02-07 14:54:51', NULL, 0);
INSERT INTO `x_article_tag` VALUES (0000000035, NULL, 'wtf', '2018-02-07 14:55:22', NULL, 0);
INSERT INTO `x_article_tag` VALUES (0000000036, NULL, '\\', '2018-02-07 15:44:44', NULL, 0);
INSERT INTO `x_article_tag` VALUES (0000000037, NULL, '>', '2018-02-07 15:45:09', NULL, 0);
INSERT INTO `x_article_tag` VALUES (0000000038, NULL, '!!', '2018-02-07 16:02:34', NULL, 0);
INSERT INTO `x_article_tag` VALUES (0000000039, NULL, '发的顺丰', '2018-02-07 17:28:36', NULL, 0);
INSERT INTO `x_article_tag` VALUES (0000000040, NULL, '发的顺丰发的顺丰', '2018-02-07 17:28:39', NULL, 0);
INSERT INTO `x_article_tag` VALUES (0000000041, NULL, '都是噶速度高速啊', '2018-02-07 17:28:41', NULL, 0);

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
INSERT INTO `x_friend_link` VALUES (0000000001, 1, 'http://www.leiho.me', '这个网站不错', '2018-01-26 19:05:45', '2018-01-26 19:06:58', 0);
INSERT INTO `x_friend_link` VALUES (0000000002, 2, 'http://www.leiho.me', '一个很好的博客', '2018-01-26 19:06:04', '2018-01-26 19:07:02', 0);
INSERT INTO `x_friend_link` VALUES (0000000003, 3, 'http://www.leiho.me', '这是什么东西', '2018-01-26 19:06:14', '2018-01-26 19:07:06', 0);
INSERT INTO `x_friend_link` VALUES (0000000004, 4, 'http://www.leiho.me', '还行啊', '2018-01-26 19:06:19', '2018-01-26 19:07:11', 0);
INSERT INTO `x_friend_link` VALUES (0000000005, 5, 'http://www.leiho.me', '点进来看看', '2018-01-26 19:06:25', '2018-01-26 19:07:15', 0);
INSERT INTO `x_friend_link` VALUES (0000000006, 6, 'http://www.leiho.me', '不要错过', '2018-01-26 19:06:32', '2018-01-26 19:07:15', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x_head_item
-- ----------------------------
INSERT INTO `x_head_item` VALUES (00000001, 1, 'index', '主页', '2018-01-26 14:08:09', '2018-01-26 14:08:09', 0);
INSERT INTO `x_head_item` VALUES (00000002, 2, 'article', '文章', '2018-01-26 14:08:17', '2018-01-26 15:15:50', 0);
INSERT INTO `x_head_item` VALUES (00000003, 3, 'media', '影像', '2018-01-26 14:09:49', '2018-01-26 15:16:06', 0);
INSERT INTO `x_head_item` VALUES (00000004, 4, 'write', '发布', '2018-01-26 14:09:50', '2018-01-26 15:16:21', 0);
INSERT INTO `x_head_item` VALUES (00000005, 5, 'manage', '用户', '2018-01-26 14:10:19', '2018-02-02 17:58:36', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `x_site_info` VALUES (0000000001, 1, 'sitename', 'x-space', '网站名称', '2018-01-26 16:48:58', NULL, 0);
INSERT INTO `x_site_info` VALUES (0000000002, 2, 'title', '雷吼', '网站标题', '2018-01-26 16:49:26', '2018-01-26 16:50:29', 0);
INSERT INTO `x_site_info` VALUES (0000000003, 3, 'subtitle', '也许你只是一株稚嫩的幼苗，然而只要坚忍不拔，终会成为参天大树。', '网站介绍', '2018-01-26 16:50:04', NULL, 0);
INSERT INTO `x_site_info` VALUES (0000000004, 4, 'motto', '这是座右铭的位置，请务必保证字数，不要太多，也不要太少，要适中，刚刚好最好。', '站长公告板', '2018-01-26 17:08:29', NULL, 0);
INSERT INTO `x_site_info` VALUES (0000000005, 5, 'authorize', '转载本站标注原创内容均需获得本人授权，如有版权纠纷请联系本人。', '版权相关', '2018-01-26 17:08:51', '2018-01-26 17:09:49', 0);
INSERT INTO `x_site_info` VALUES (0000000006, 6, 'site_master_name', '萧大侠/lester', '站长名称', '2018-01-26 17:09:33', NULL, 0);
INSERT INTO `x_site_info` VALUES (0000000007, 7, 'copyright_text', 'Copyright 2018 leiho site.', '网站版权声明', '2018-01-31 14:33:32', NULL, 0);
INSERT INTO `x_site_info` VALUES (0000000008, 8, 'copyright_link', 'http://www.leiho.me/', '网站版权链接', '2018-01-31 14:34:54', '2018-01-31 14:39:39', 0);
INSERT INTO `x_site_info` VALUES (0000000009, 9, 'copyright_title', '雷吼小站', '网站版权标题', '2018-01-31 14:35:27', '2018-01-31 14:39:25', 0);
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
