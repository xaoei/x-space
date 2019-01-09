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

 Date: 07/01/2019 11:05:03
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
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x_article
-- ----------------------------
INSERT INTO `x_article` VALUES (0000000001, NULL, '玄奥大世界开站了', '<h2 style=\"text-align: center;\"><b>本站于公元2018年12月5日发布</b></h2><h2 style=\"text-align: center;\"><b>期待本次能运行的久一点<img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/2c/moren_yunbei_org.png\" alt=\"[允悲]\" data-w-e=\"1\"></b></h2><p><img src=\"https://blog-1252251484.cos.ap-shanghai.myqcloud.com/image/total/2018-12-05-bc7e6a9b73514fbab4a24ec9cc6b1269.jpg\" style=\"max-width:100%;\"><br></p><p><br></p>', '想想还有点小激动呢......', 1, 3, '45', 1, 7, 0, '2018-12-05 10:12:46', '2018-02-07 10:55:22', '2018-12-05 17:13:09', 0, NULL);
INSERT INTO `x_article` VALUES (0000000006, NULL, 'ELK环境的搭建', '<h3><b style=\"background-color: rgb(194, 79, 74);\"><font color=\"#eeece0\"><br></font></b></h3><h3 style=\"text-align: center;\"><b style=\"background-color: rgb(194, 79, 74);\"><font color=\"#eeece0\">搭建ElasticSearh(6.3)@CentOS7</font></b></h3><div style=\"text-align: center;\"><img src=\"https://blog-1252251484.cos.ap-shanghai.myqcloud.com/image/total/2018-12-05-bc4d80bba8e14bbbb4b0166c74927198.jpg\" style=\"max-width:100%;\"><b style=\"background-color: rgb(194, 79, 74);\"><font color=\"#eeece0\"><br></font></b></div><div><div yne-bulb-block=\"paragraph\"><font color=\"#000000\">下载tar.gz版本</font></div><div yne-bulb-block=\"paragraph\"><font color=\"#000000\">国内下载慢,最好不要使用wget,用某个下载工具下好再上传到服务器</font></div><div yne-bulb-block=\"paragraph\"><font color=\"#000000\">在服务器上使用tar -xzvf xxxx/.tar.gz解压</font></div><div yne-bulb-block=\"paragraph\"><font color=\"#000000\">解压完成进入config目录修改elasticsearch.yml</font></div><div yne-bulb-block=\"paragraph\"><font color=\"#000000\">添加:</font></div></div><blockquote>&nbsp; &nbsp; path.data: /data/elk/data 			#存储路径<br>&nbsp; &nbsp; path.logs: /data/elk/logs			#日志路径<br>&nbsp; &nbsp; network.bind_host: elk			#http绑定IP<br>&nbsp; &nbsp; http.port: 9200					#http端口<br>&nbsp; &nbsp; transport.host: elk				#传输绑定ip<br>&nbsp; &nbsp; transport.tcp.port: 9300			#传输端口</blockquote><div yne-bulb-block=\"paragraph\"><font color=\"#000000\">注:elk是在hosts里配置的域名,通过配置此项可以很方便的修改需要指向的ip(配置后只能通过该ip进行访问,如配置127.0.0.1后只能通过http://127.0.0.1:9200访问,单机的话可以通过nginx反向代理进行处理),在虚拟机内只需要配置0.0.0.0就没有此限制.</font></div><div yne-bulb-block=\"paragraph\"><font color=\"#000000\">配置完成后进入bin目录执行elasticsearch程序,如果启动无误的话就是要screen放入后台运行.</font></div><div yne-bulb-block=\"paragraph\"><font color=\"#000000\">启动可能会出现报错,通过百度搜索相应报错修改相应的文件即可简单解决.</font></div><div yne-bulb-block=\"paragraph\"><font color=\"#000000\">启动完成后可通过curl <a href=\"http://host\">http://host</a>:port 出现状态,出现json字符串基本就启动成功了.</font></div><div yne-bulb-block=\"paragraph\"><font color=\"#000000\"><br></font></div><div yne-bulb-block=\"paragraph\"><font color=\"#000000\">如果要是要ik分词插件则需要先在<a href=\"https://github.com/medcl/elasticsearch-analysis-ik\">https://github.com/medcl/elasticsearch-analysis-ik</a>上查询是否有对应版本的分词器,如果确定有分词的需求,那就要按分词器的版本来决定elasticsearch的版本,分词器和ES一定要是对应的版本.</font></div><div yne-bulb-block=\"paragraph\"><font color=\"#000000\">在plugins文件夹下新建ik目录.将下好的分词器加压到ik目录下,启动elasticsearch即可.</font></div><div yne-bulb-block=\"paragraph\"><font color=\"#000000\">(分词器可能是zip的压缩包,使用unzip xxxx.zip即可,注意要讲压缩包移动到ik文件夹下才能解压)</font></div><h3 style=\"text-align: center;\"><b style=\"\"><font color=\"#eeece0\" style=\"background-color: rgb(194, 79, 74);\">搭建Kibana(6.3)@CentOS7</font></b></h3><div style=\"text-align: center;\"><img src=\"https://blog-1252251484.cos.ap-shanghai.myqcloud.com/image/total/2018-12-05-2a3c20db05fe487ea4b4039d30983a50.jpg\" style=\"max-width:100%;\"><b style=\"\"><font color=\"#eeece0\" style=\"background-color: rgb(194, 79, 74);\"><br></font></b></div><div><div yne-bulb-block=\"paragraph\"><font color=\"#000000\">kibana也是下载tar.gz版本,上传解压修改config下的kibana.yml</font></div><div yne-bulb-block=\"paragraph\"><font color=\"#000000\">添加:</font></div><blockquote>&nbsp;&nbsp;&nbsp;&nbsp;server.port: 5601				#访问端口<br>&nbsp;&nbsp;&nbsp;&nbsp;server.host: elk 				#站点地址<br>&nbsp;&nbsp;&nbsp;&nbsp;elasticsearch.url: http://elk:9200 	#指向elasticsearch服务的ip地址<br>&nbsp;&nbsp;&nbsp;&nbsp;kibana.index: \".kibana\"</blockquote><div yne-bulb-block=\"paragraph\"><font color=\"#000000\">kibana如果有重要数据,可以通过nginx用账号密码限制kibana的访问(前提是有域名,参考\"nginx配置域名账号密码登陆(权限认证)\"文章)</font></div><div yne-bulb-block=\"paragraph\"><font color=\"#000000\">在bin下启动kibana即可</font></div></div><h3 style=\"text-align: center;\"><b><font color=\"#eeece0\" style=\"background-color: rgb(194, 79, 74);\">搭建Logstash(6.3)@CentOS7</font></b></h3><div style=\"text-align: center;\"><img src=\"https://blog-1252251484.cos.ap-shanghai.myqcloud.com/image/total/2018-12-05-52f33fbb2ebe43d99fccb17dce65a9f8.jpg\" style=\"max-width:100%;\"><b><font color=\"#eeece0\" style=\"background-color: rgb(194, 79, 74);\"><br></font></b></div><div><div yne-bulb-block=\"paragraph\"><font color=\"#000000\">Logstash老套路,但是config不需要修改.</font></div><div yne-bulb-block=\"paragraph\"><font color=\"#000000\">以下是一个案例,项目想将日志输出至logstash使用elasticsearch存储,kibana查看</font></div><div yne-bulb-block=\"paragraph\"><font color=\"#000000\">先在logstash目录下新建myconf文件夹,在文件夹内新建LogbackToES.conf,在conf内添加:<span style=\"background-color: rgb(241, 241, 241); font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: inherit;\">Logstash老套路,但是config不需要修改.</span></font></div><pre><code>input {\n    tcp {\n        ##host:port就是上面appender中的 destination，这里其实把logstash作为服务，开启9601端口接收logback发出的消息\n        host =&gt; \"elk\"\n        port =&gt; 9601\n        #模式选择为server\n        mode =&gt; \"server\"\n        tags =&gt; [\"tags\"]\n        ##格式json\n        codec =&gt; json_lines\n    }\n\n}</code></pre><pre><code>output {\n        elasticsearch {\n                #ES地址\n                hosts =&gt; \"elk:9200\"\n                #指定索引名字，不适用默认的，用来区分各个项目\n                index =&gt; \"%{[appname]}-%{+YYYY.MM.dd}\"\n        }\n        stdout { codec =&gt; rubydebug}\n}</code></pre><div yne-bulb-block=\"paragraph\"><font color=\"#000000\">启动bin目录下的logstash:</font></div><blockquote>./logstash -f ../myconf/LogbackToES.conf</blockquote><div yne-bulb-block=\"paragraph\"><font color=\"#000000\">然后在项目中配置logback即可</font></div></div><div><b><font color=\"#eeece0\" style=\"background-color: rgb(194, 79, 74);\"><br></font></b></div><div><b><font color=\"#eeece0\" style=\"background-color: rgb(194, 79, 74);\"><br></font></b></div><p><br></p>', '网页编辑器有点难用,看样子要考虑换一个了', 3, 2, '42', 1, 5, 1, '2018-12-05 16:18:39', '2018-12-05 16:18:37', '2018-12-05 17:13:19', 0, NULL);
INSERT INTO `x_article` VALUES (0000000007, NULL, 'linux下的进程守护supervisor', '<div yne-bulb-block=\"paragraph\">(Python的安装过程略...)</div><h3 style=\"text-align: center;\"><span style=\"background-color: rgb(194, 79, 74);\"><font color=\"#eeece0\">安装supervisor<img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/fc/moren_bbjdnew_org.png\" alt=\"[并不简单]\" data-w-e=\"1\" style=\"font-size: 18px;\"></font></span></h3><div yne-bulb-block=\"paragraph\"><b style=\"background-color: rgb(238, 236, 224);\">------------------------------------------------------------------------------</b></div><div yne-bulb-block=\"paragraph\">#安装Python包管理工具（easy_install）</div><div yne-bulb-block=\"paragraph\">执行:</div><pre><code>wget --no-check-certificate https://bootstrap.pypa.io/ez_setup.py -O - | sudo python</code></pre><div yne-bulb-block=\"paragraph\">#安装supervisor</div><div yne-bulb-block=\"paragraph\">执行:</div><div yne-bulb-block=\"paragraph\"><pre><code>easy_install supervisor</code></pre></div><div yne-bulb-block=\"paragraph\"><span style=\"background-color: rgb(238, 236, 224);\">-----------------------------------</span><span style=\"background-color: rgb(194, 79, 74);\"><font color=\"#eeece0\">二选一</font></span><span style=\"background-color: rgb(238, 236, 224);\">-----------------------------------</span></div><div yne-bulb-block=\"paragraph\">#安装pip</div><div yne-bulb-block=\"paragraph\">执行:</div><div yne-bulb-block=\"paragraph\"><pre><code>curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py\npython get-pip.py</code></pre></div><div yne-bulb-block=\"paragraph\">#安装supervisor</div><div yne-bulb-block=\"paragraph\">执行:</div><div yne-bulb-block=\"paragraph\"><pre><code>pip install supervisor</code></pre></div><div yne-bulb-block=\"paragraph\"><span style=\"background-color: rgb(238, 236, 224);\">------------------------------------------------------------------------------</span></div><div yne-bulb-block=\"paragraph\"><div yne-bulb-block=\"paragraph\">安装完成后有以下程序:</div><blockquote>supervisortd	supervisor的守护进程服务（用于接收进程管理命令）<br>supervisorctl	客户端（用于和守护进程通信，发送管理进程的指令）<br>echo_supervisord_conf	生成初始配置文件程序</blockquote></div><div yne-bulb-block=\"paragraph\"><div yne-bulb-block=\"paragraph\"><h3 style=\"text-align: center;\"><font color=\"#eeece0\" style=\"background-color: rgb(194, 79, 74);\">配置supervisor<img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/fc/moren_bbjdnew_org.png\" alt=\"[并不简单]\" data-w-e=\"1\"></font></h3></div><div yne-bulb-block=\"paragraph\">#配置文件</div><div yne-bulb-block=\"paragraph\">supervisor配置,在etc新建supervisor文件夹,在文件夹下执行:</div><div yne-bulb-block=\"paragraph\"><pre><code>echo_supervisord_conf &gt; supervisor.conf</code></pre></div><div yne-bulb-block=\"paragraph\">子配置文件(被管理的进程配置),在supervisor文件夹下新建conf文件夹,在文件夹内新建配置文件文件xxx.ini</div></div><div yne-bulb-block=\"paragraph\">#supervisor配置(配置中的日志文件需提前新建):</div><pre><code>[unix_http_server]\nfile=/tmp/supervisor.sock   ; the path to the socket file\n\n[inet_http_server]         ; inet (TCP) server disabled by default\nport=192.168.54.233:9001        ; 需要填写对外的ip\nusername=lester              ; default is no username (open server)\npassword=123456               ; default is no password (open server)\n\n[supervisord]\nlogfile=/data/logs/supervisord.log ; main log file; default $CWD/supervisord.log\nlogfile_maxbytes=50MB        ; max main logfile bytes b4 rotation; default 50MB\nlogfile_backups=10           ; # of main logfile backups; 0 means none, default 10\nloglevel=info                ; log level; default info; others: debug,warn,trace\npidfile=/tmp/supervisord.pid ; supervisord pidfile; default supervisord.pid\nnodaemon=false               ; start in foreground if true; default false\nminfds=1024                  ; min. avail startup file descriptors; default 1024\nminprocs=200                 ; min. avail process descriptors;default 200\n\n[rpcinterface:supervisor]\nsupervisor.rpcinterface_factory = supervisor.rpcinterface:make_main_rpcinterface\n\n[supervisorctl]\nserverurl=unix:///tmp/supervisor.sock ; use a unix:// URL  for a unix socket\n\n[include]\nfiles = /etc/supervisor/conf/*.ini</code></pre><div yne-bulb-block=\"paragraph\">#子配置(日志文件亦需提前新建):</div><pre><code>[program:xxx]\ncommand=此处填执行命令\nautostart=true\nstartsecs=10\nstartretries=3\nautorestart=true\nstopasgroup=false\nkillasgroup=false\nuser=root\nredirect_stderr=true\nstdout_logfile=/data/logs/eureka.log\nstdout_logfile_maxbytes=1MB\nstdout_logfile_backups=10</code></pre><h3 style=\"text-align: center;\"><font color=\"#eeece0\" style=\"background-color: rgb(194, 79, 74);\">使用supervisor<img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/fc/moren_bbjdnew_org.png\" alt=\"[并不简单]\" data-w-e=\"1\"></font></h3><div yne-bulb-block=\"paragraph\">#启动supervisor:</div><div yne-bulb-block=\"paragraph\">执行:</div><div yne-bulb-block=\"paragraph\"><pre><code>supervisord -c /etc/supervisor.conf</code></pre><div yne-bulb-block=\"paragraph\">#管理</div><div yne-bulb-block=\"paragraph\">执行</div><div yne-bulb-block=\"paragraph\"><code>supervisorctl</code></div><div yne-bulb-block=\"paragraph\">使用help进行具体命令的查看</div><blockquote>reload:重新读取主配置文件<br>reread:检查子配置文件是否正确<br>update:读取子配置文件</blockquote><div yne-bulb-block=\"paragraph\"><br></div><div yne-bulb-block=\"paragraph\">#网页管理</div><div yne-bulb-block=\"paragraph\">&nbsp;&nbsp;&nbsp;&nbsp;在浏览器打开主配置inet_http_server的ip和端口即可</div><div yne-bulb-block=\"paragraph\"><br></div><div yne-bulb-block=\"paragraph\">#开机启动可配置,暂时没有这个需求,故不进行记录</div><div yne-bulb-block=\"paragraph\"><br></div><div yne-bulb-block=\"paragraph\"><br></div><div yne-bulb-block=\"paragraph\">#配合脚本使用:</div><div yne-bulb-block=\"paragraph\">不使用supervisorctl shell界面，而在bash终端运行：</div><blockquote>$ supervisorctl status&nbsp;<br>$ supervisorctl stop xxxxxx&nbsp;<br>$ supervisorctl start xxxxxx<br>$ supervisorctl restart xxxxxx&nbsp;<br>$ supervisorctl reread<br>$ supervisorctl update</blockquote></div><p><br></p>', '使用supervisorctl最好也加上-c 主动指定配置文件,可以避免出错!', 3, 2, '43,44', 1, 4, 0, '2018-12-05 17:04:40', '2018-12-05 17:04:40', '2018-12-05 17:13:18', 0, NULL);
INSERT INTO `x_article` VALUES (0000000008, NULL, 'Snap、Flatpak 这种通吃所有发行版的打包方式真的有用吗？', '<p style=\"text-align: center;\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/0b/wabi_org.gif\" alt=\"[挖鼻]\" data-w-e=\"1\">=========================================&nbsp;&nbsp;<img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/af/kl_org.gif\" alt=\"[可怜]\" data-w-e=\"1\"><br></p><div><p style=\"text-align: center;\">原文:<a href=\"http://www.iwillfolo.com/ubuntus-snap-red-hats-flatpack-and-is-one-fits-all-linux-packages-useful/\" target=\"_blank\" style=\"background-color: rgb(255, 255, 255);\">可能打不开了</a></p><p style=\"text-align: center;\">引用地址:<a href=\"https://linux.cn/article-7783-1.html\" target=\"_blank\" style=\"background-color: rgb(255, 255, 255);\">点此查看,排版优美</a></p><p style=\"text-align: center;\">作者：Liron&nbsp;译者：<a href=\"https://github.com/Chao-zhi\" rel=\"external nofollow\" target=\"_blank\">Chao-zhi</a>&nbsp;校对：<a href=\"https://github.com/wxy\" rel=\"external nofollow\" target=\"_blank\">wxy</a></p><p style=\"text-align: center;\">本文由&nbsp;<a href=\"https://github.com/LCTT/TranslateProject\" rel=\"external nofollow\" target=\"_blank\">LCTT</a>&nbsp;原创翻译，<a href=\"https://linux.cn/article-7783-1.html\">Linux中国</a>&nbsp;荣誉推出</p><p style=\"text-align: center;\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/58/mb_org.gif\" alt=\"[太开心]\" data-w-e=\"1\">=========================================<img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/d9/landeln_org.gif\" alt=\"[白眼]\" data-w-e=\"1\"></p></div><h3><strong><font color=\"#000000\" style=\"background-color: rgb(238, 236, 224);\">对新一代的打包格式开始渗透到 Linux 生态系统中的深入观察</font></strong></h3><p>&nbsp;&nbsp;&nbsp;&nbsp;最近我们听到越来越多的有关于 Ubuntu 的 Snap 包和由 Red Hat 员工 Alexander Larsson 创造的 Flatpak （曾经叫做 xdg-app）的消息。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;这两种下一代打包方法在本质上拥有相同的目标和特点：即不依赖于第三方系统功能库的独立包装。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;这种 Linux 新技术方向似乎自然会让人脑海中浮现这样的问题：独立包的优点/缺点是什么？这是否让我们拥有更好的 Linux 系统？其背后的动机是什么？</p><p>&nbsp;&nbsp;&nbsp;&nbsp;为了回答这些问题，让我们先深入了解一下 Snap 和 Flatpak。</p><blockquote><h3 id=\"toc_1\">动机</h3></blockquote><p>根据&nbsp;<a href=\"http://flatpak.org/press/2016-06-21-flatpak-released.html\" rel=\"external nofollow\" target=\"_blank\">Flatpak</a>&nbsp;和&nbsp;<a href=\"https://insights.ubuntu.com/2016/06/14/universal-snap-packages-launch-on-multiple-linux-distros\" rel=\"external nofollow\" target=\"_blank\">Snap</a>&nbsp;的声明，背后的主要动机是使同一版本的应用程序能够运行在多个 Linux 发行版。&nbsp;&nbsp;<br></p><pre><code>“从一开始它的主要目标是允许相同的应用程序运行在各种 Linux 发行版和操作系统上。”\n                                                                                    —— Flatpak</code></pre><pre><code>“‘snap’ 通用 Linux 包格式，使简单的二进制包能够完美的、安全的运行在任何 Linux 桌面、服务器、云和设备上。”\n                                                                                    —— Snap</code></pre><p>说得更具体一点，站在 Snap 和 Flatpak （以下称之为 S&amp;F）背后的人认为，Linux 平台存在碎片化的问题。</p><p>这个问题导致了开发者们需要做许多不必要的工作来使他的软件能够运行在各种不同的发行版上，这影响了整个平台的前进。</p><p>所以，作为 Linux 发行版（Ubuntu 和 Red Hat）的领导者，他们希望消除这个障碍，推动平台发展。</p><p>但是，是否是更多的个人收益刺激了 S&amp;F 的开发？</p><blockquote>个人收益？</blockquote><p>&nbsp;&nbsp;&nbsp;&nbsp;虽然没有任何官方声明，但是试想一下，如果能够创造这种可能会被大多数发行版（即便不是全部）所采用的打包方式，那么这个项目的领导者将可能成为一个能够决定 Linux 大船航向的重要人物。&nbsp;</p><blockquote>优势</blockquote><p>&nbsp;这种独立包的好处多多，并且取决于不同的因素。<br></p><p>这些因素基本上可以归为两类：</p><p>&nbsp; &nbsp; 1.<span style=\"color: inherit; font-family: inherit; font-size: 1.4rem;\">用户角度</span></p><p>&nbsp; &nbsp;&nbsp;<strong>+</strong>&nbsp;从 Liunx 用户的观点来看：Snap 和 Flatpak 带来了将任何软件包（软件或应用）安装在用户使用的任何发行版上的可能性。<span style=\"color: inherit; font-family: inherit; font-size: 1.4rem;\"><br></span></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;例如你在使用一个不是很流行的发行版，由于开发工作的缺乏，它的软件仓库只有很稀少的包。现在，通过 S&amp;F 你就可以显著的增加包的数量，这是一个多么美好的事情。</p><p>&nbsp; &nbsp;&nbsp;<strong>+</strong>&nbsp;同样，对于使用流行的发行版的用户，即使该发行版的软件仓库上有很多的包，他也可以在不改变它现有的功能库的同时安装一个新的包。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;比方说, 一个 Debian 的用户想要安装一个 “测试分支” 的包，但是他又不想将他的整个系统变成测试版（来让该包运行在更新的功能库上）。现在，他就可以简单的想安装哪个版本就安装哪个版本，而不需要考虑库的问题。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;对于持后者观点的人，可能基本上都是使用源文件编译他们的包的人，然而，除非你使用类似 Gentoo 这样基于源代码的发行版，否则大多数用户将从头编译视为是一个恶心到吐的事情。</p><p>&nbsp; &nbsp;&nbsp;<strong>+</strong>&nbsp;高级用户，或者称之为 “拥有安全意识的用户” 可能会觉得更容易接受这种类型的包，只要它们来自可靠来源，这种包倾向于提供另一层隔离，因为它们通常是与系统包想隔离的。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;* 不论是 Snap 还是 Flatpak 都在不断努力增强它们的安全性，通常他们都使用 “沙盒化” 来隔离，以防止它们可能携带病毒感染整个系统，就像微软 Windows 系统中的 .exe 程序一样。（关于微软和 S&amp;F 后面还会谈到）</p><p>&nbsp; &nbsp; 2.<span style=\"color: inherit; font-family: inherit; font-size: 1.4rem;\">开发者角度</span></p><p>&nbsp;&nbsp;&nbsp;&nbsp;与普通用户相比，对于开发者来说，开发 S&amp;F 包的优点可能更加清楚。这一点已经在上一节有所提示。</p><p>尽管如此，这些优点有：</p><p>&nbsp; &nbsp;&nbsp;<strong>+</strong>&nbsp;S&amp;F 通过统一开发的过程，将多发行版的开发变得简单了起来。对于需要将他的应用运行在多个发行版的开发者来说，这大大的减少了他们的工作量。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;因此，开发者能够更容易的使他的应用运行在更多的发行版上。</p><p>&nbsp; &nbsp;&nbsp;<strong>+</strong>&nbsp;S&amp;F 允许开发者私自发布他的包，不需要依靠发行版维护者在每一个/每一次发行版中发布他的包。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;通过上述方法，开发者可以不依赖发行版而直接获取到用户安装和卸载其软件的统计数据。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;同样是通过上述方法，开发者可以更好的直接与用户互动，而不需要通过中间媒介，比如发行版这种中间媒介。</p><blockquote>缺点</blockquote><p>&nbsp; &nbsp;&nbsp;<strong>–</strong>&nbsp;膨胀。就是这么简单。Flatpak 和 Snap 并不是凭空变出来它的依赖关系。相反，它是通过将依赖关系预构建在其中来代替使用系统中的依赖关系。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;就像谚语说的：“山不来就我，我就去就山”。</p><p>&nbsp; &nbsp;&nbsp;<strong>–</strong>&nbsp;之前提到安全意识强的用户会喜欢 S&amp;F 提供的额外的一层隔离，只要该应用来自一个受信任的来源。但是从另外一个角度看，对这方面了解较少的用户，可能会从一个不靠谱的地方弄来一个包含恶意软件的包从而导致危害。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上面提到的观点可以说是有很有意义的，虽说今天的流行方法，像 PPA、overlay 等也可能是来自不受信任的来源。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;但是，S&amp;F 包更加增加这个风险，因为恶意软件开发者只需要开发一个版本就可以感染各种发行版。相反，如果没有 S&amp;F，恶意软件的开发者就需要创建不同的版本以适应不同的发行版。</p><blockquote>原来微软一直是正确的吗？</blockquote><p>&nbsp;&nbsp;&nbsp;&nbsp;考虑到上面提到的，很显然，在大多数情况下，使用 S&amp;F 包的优点超过缺点。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;至少对于二进制发行版的用户，或者重点不是轻量级的发行版的用户来说是这样的。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;这促使我问出这个问题，可能微软一直是正确的吗？如果是的，那么当 S&amp;F 变成 Linux 的标准后，你还会一如既往的使用 Linux 或者类 Unix 系统吗？</p><p>&nbsp;&nbsp;&nbsp;&nbsp;很显然，时间会是这个问题的最好答案。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;不过，我认为，即使不完全正确，但是微软有些地方也是值得赞扬的，并且以我的观点来看，所有这些方式在 Linux 上都立马能用也确实是一个亮点。</p><p><br></p>', '先记下来,学习学习!', 3, 4, '43', 1, 3, 0, '2018-12-05 17:30:25', '2018-12-05 17:30:25', '2018-12-05 17:34:19', 0, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x_article_tag
-- ----------------------------
INSERT INTO `x_article_tag` VALUES (0000000001, NULL, 'java', '2018-02-05 17:13:25', '2018-02-06 15:51:13', 0);
INSERT INTO `x_article_tag` VALUES (0000000002, NULL, 'spring', '2018-02-06 15:51:12', NULL, 0);
INSERT INTO `x_article_tag` VALUES (0000000003, NULL, 'mybatis', '2018-02-06 15:51:22', NULL, 0);
INSERT INTO `x_article_tag` VALUES (0000000042, NULL, 'elastic-search', '2018-12-05 16:10:08', NULL, 0);
INSERT INTO `x_article_tag` VALUES (0000000043, NULL, 'linux', '2018-12-05 16:54:54', NULL, 0);
INSERT INTO `x_article_tag` VALUES (0000000044, NULL, 'supervisor', '2018-12-05 16:55:02', NULL, 0);
INSERT INTO `x_article_tag` VALUES (0000000045, NULL, 'admin', '2018-12-05 17:11:11', NULL, 0);

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
INSERT INTO `x_head_item` VALUES (00000002, 2, 'article', '作品', '2018-01-26 14:08:17', '2018-12-05 15:57:44', 0);
INSERT INTO `x_head_item` VALUES (00000003, 3, 'media', '映象', '2018-01-26 14:09:49', '2018-12-05 15:57:22', 0);
INSERT INTO `x_head_item` VALUES (00000004, 4, 'write', '创作', '2018-01-26 14:09:50', '2018-12-05 15:57:49', 0);
INSERT INTO `x_head_item` VALUES (00000005, 5, 'user', '登陆', '2018-01-26 14:10:19', '2018-12-05 16:34:22', 0);
INSERT INTO `x_head_item` VALUES (00000006, 6, 'manage', '管理', '2018-12-04 18:54:48', '2018-12-05 15:54:52', 0);

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
INSERT INTO `x_index_setting` VALUES (0000000001, 'hot', 6, 'ELK环境的搭建', 'https://blog-1252251484.cos.ap-shanghai.myqcloud.com/image/total/2018-12-05-8d1d8c66690446079696681f30251fbd.jpg', '不错', '稀烂的页面排版(也许)不影响知识的分享!', '2018-12-04 19:19:26', '2018-12-05 16:46:29', 0);
INSERT INTO `x_index_setting` VALUES (0000000002, 'hot', 1, '第一篇文章', 'http://www.hellotw.com/zt/20180214/W020180214390886667473.jpg', '不错', '不错', '2018-12-04 19:19:26', '2018-12-05 16:46:29', 0);
INSERT INTO `x_index_setting` VALUES (0000000003, 'hot', 1, '第一篇文章', 'http://www.hellotw.com/zt/20180214/W020180214390886667473.jpg', '不错', '不错', '2018-12-04 19:19:26', '2018-12-05 16:46:29', 0);
INSERT INTO `x_index_setting` VALUES (0000000004, 'hot', 1, '第一篇文章', 'http://www.hellotw.com/zt/20180214/W020180214390886667473.jpg', '不错', '不错', '2018-12-04 19:19:26', '2018-12-05 16:46:29', 0);
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
) ENGINE = InnoDB AUTO_INCREMENT = 298 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x_ip_record
-- ----------------------------
INSERT INTO `x_ip_record` VALUES (0000000001, '0:0:0:0:0:0:0:1', NULL, NULL, 0, '2018-12-04 18:38:20', '2018-12-05 16:07:36', 0);
INSERT INTO `x_ip_record` VALUES (0000000002, '0:0:0:0:0:0:0:1', 1, 'admin', 1, '2018-12-04 18:39:19', '2018-12-05 16:07:34', 0);
INSERT INTO `x_ip_record` VALUES (0000000003, '60.176.200.66', NULL, NULL, 0, '2018-12-05 15:45:10', '2018-12-05 17:50:24', 0);
INSERT INTO `x_ip_record` VALUES (0000000004, '60.176.200.66', 1, 'admin', 1, '2018-12-05 15:45:32', '2018-12-05 16:06:55', 0);
INSERT INTO `x_ip_record` VALUES (0000000005, '60.176.200.66', 2, '1104300304@qq.com', 1, '2018-12-05 15:51:49', '2018-12-05 16:42:38', 0);
INSERT INTO `x_ip_record` VALUES (0000000006, '60.176.200.66', 3, '本人就是萧大俠', 1, '2018-12-05 16:07:52', '2018-12-05 16:32:51', 0);
INSERT INTO `x_ip_record` VALUES (0000000007, '60.176.200.66', 3, '萧大俠', 1, '2018-12-05 16:33:03', '2018-12-05 17:35:17', 0);
INSERT INTO `x_ip_record` VALUES (0000000008, '60.176.200.66', 2, '管理员', 1, '2018-12-05 16:43:14', '2018-12-05 16:47:15', 0);
INSERT INTO `x_ip_record` VALUES (0000000009, '180.163.220.68', NULL, NULL, 0, '2018-12-05 16:46:12', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000010, '42.236.10.75', NULL, NULL, 0, '2018-12-05 16:49:59', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000011, '60.176.200.66', 1, '站长', 1, '2018-12-05 17:06:58', '2018-12-05 17:50:40', 0);
INSERT INTO `x_ip_record` VALUES (0000000012, '180.163.220.5', NULL, NULL, 0, '2018-12-05 17:23:38', '2018-12-11 18:33:02', 0);
INSERT INTO `x_ip_record` VALUES (0000000013, '113.10.244.130', NULL, NULL, 0, '2018-12-05 18:47:28', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000014, '180.163.220.4', NULL, NULL, 0, '2018-12-05 18:49:17', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000015, '60.191.38.77', NULL, NULL, 0, '2018-12-05 21:14:22', '2018-12-21 19:44:44', 0);
INSERT INTO `x_ip_record` VALUES (0000000016, '103.63.213.38', NULL, NULL, 0, '2018-12-06 00:49:14', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000017, '106.14.215.243', NULL, NULL, 0, '2018-12-06 11:40:21', '2018-12-19 03:44:39', 0);
INSERT INTO `x_ip_record` VALUES (0000000018, '157.55.39.29', NULL, NULL, 0, '2018-12-06 13:06:27', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000019, '157.55.39.125', NULL, NULL, 0, '2018-12-06 13:06:47', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000020, '1.31.160.75', NULL, NULL, 0, '2018-12-06 13:12:11', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000021, '60.191.38.78', NULL, NULL, 0, '2018-12-06 13:13:28', '2019-01-03 04:30:19', 0);
INSERT INTO `x_ip_record` VALUES (0000000022, '172.104.239.90', NULL, NULL, 0, '2018-12-06 18:18:54', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000023, '107.155.49.130', NULL, NULL, 0, '2018-12-06 22:02:36', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000024, '157.128.195.226', NULL, NULL, 0, '2018-12-07 00:16:28', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000025, '60.191.52.254', NULL, NULL, 0, '2018-12-07 00:44:52', '2019-01-06 09:32:24', 0);
INSERT INTO `x_ip_record` VALUES (0000000026, '202.108.211.56', NULL, NULL, 0, '2018-12-07 09:14:10', '2019-01-04 13:25:28', 0);
INSERT INTO `x_ip_record` VALUES (0000000027, '178.128.30.249', NULL, NULL, 0, '2018-12-07 09:19:38', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000028, '205.205.150.16', NULL, NULL, 0, '2018-12-07 10:26:54', '2019-01-01 21:24:10', 0);
INSERT INTO `x_ip_record` VALUES (0000000029, '39.107.127.149', NULL, NULL, 0, '2018-12-07 11:05:19', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000030, '198.108.66.176', NULL, NULL, 0, '2018-12-07 12:49:45', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000031, '52.53.201.78', NULL, NULL, 0, '2018-12-07 12:57:29', '2019-01-06 00:02:01', 0);
INSERT INTO `x_ip_record` VALUES (0000000032, '94.102.49.193', NULL, NULL, 0, '2018-12-07 19:08:26', '2019-01-02 18:46:58', 0);
INSERT INTO `x_ip_record` VALUES (0000000033, '47.101.50.252', NULL, NULL, 0, '2018-12-08 00:31:48', '2018-12-28 07:37:51', 0);
INSERT INTO `x_ip_record` VALUES (0000000034, '202.173.11.248', NULL, NULL, 0, '2018-12-08 00:38:38', '2019-01-04 21:27:34', 0);
INSERT INTO `x_ip_record` VALUES (0000000035, '60.170.122.185', NULL, NULL, 0, '2018-12-08 09:50:12', '2019-01-06 22:55:38', 0);
INSERT INTO `x_ip_record` VALUES (0000000036, '106.15.201.111', NULL, NULL, 0, '2018-12-08 10:39:35', '2018-12-15 07:44:21', 0);
INSERT INTO `x_ip_record` VALUES (0000000037, '222.179.89.46', NULL, NULL, 0, '2018-12-08 16:22:54', '2018-12-15 11:48:44', 0);
INSERT INTO `x_ip_record` VALUES (0000000038, '114.80.96.157', NULL, NULL, 0, '2018-12-08 19:33:44', '2018-12-31 15:42:36', 0);
INSERT INTO `x_ip_record` VALUES (0000000039, '196.52.43.75', NULL, NULL, 0, '2018-12-08 21:35:07', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000040, '60.10.27.168', NULL, NULL, 0, '2018-12-09 01:19:38', '2018-12-15 00:59:26', 0);
INSERT INTO `x_ip_record` VALUES (0000000041, '39.155.241.18', NULL, NULL, 0, '2018-12-09 01:37:04', '2018-12-15 00:59:31', 0);
INSERT INTO `x_ip_record` VALUES (0000000042, '103.6.222.5', NULL, NULL, 0, '2018-12-09 08:11:22', '2018-12-19 18:43:16', 0);
INSERT INTO `x_ip_record` VALUES (0000000043, '116.62.215.53', NULL, NULL, 0, '2018-12-09 11:56:30', '2018-12-26 12:42:44', 0);
INSERT INTO `x_ip_record` VALUES (0000000044, '47.92.101.198', NULL, NULL, 0, '2018-12-09 12:06:37', '2018-12-11 13:55:00', 0);
INSERT INTO `x_ip_record` VALUES (0000000045, '182.140.129.39', NULL, NULL, 0, '2018-12-10 04:44:28', '2018-12-10 06:04:48', 0);
INSERT INTO `x_ip_record` VALUES (0000000046, '122.228.19.80', NULL, NULL, 0, '2018-12-10 06:48:16', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000047, '42.236.91.172', NULL, NULL, 0, '2018-12-10 08:00:21', '2018-12-23 02:51:40', 0);
INSERT INTO `x_ip_record` VALUES (0000000048, '64.246.165.180', NULL, NULL, 0, '2018-12-10 11:00:05', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000049, '39.107.86.51', NULL, NULL, 0, '2018-12-10 11:32:17', '2018-12-23 23:27:19', 0);
INSERT INTO `x_ip_record` VALUES (0000000050, '111.179.38.150', NULL, NULL, 0, '2018-12-10 14:08:00', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000051, '101.227.67.184', NULL, NULL, 0, '2018-12-10 15:33:48', '2018-12-13 20:15:05', 0);
INSERT INTO `x_ip_record` VALUES (0000000052, '66.240.205.34', NULL, NULL, 0, '2018-12-10 16:41:33', '2018-12-31 14:24:40', 0);
INSERT INTO `x_ip_record` VALUES (0000000053, '102.34.33.147', NULL, NULL, 0, '2018-12-10 16:53:33', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000054, '178.128.123.151', NULL, NULL, 0, '2018-12-10 19:45:58', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000055, '101.132.97.6', NULL, NULL, 0, '2018-12-11 03:44:49', '2018-12-31 17:25:30', 0);
INSERT INTO `x_ip_record` VALUES (0000000056, '139.162.3.217', NULL, NULL, 0, '2018-12-11 04:48:25', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000057, '58.222.39.230', NULL, NULL, 0, '2018-12-11 06:28:41', '2018-12-11 06:55:09', 0);
INSERT INTO `x_ip_record` VALUES (0000000058, '61.163.38.120', NULL, NULL, 0, '2018-12-11 06:55:09', '2018-12-12 13:10:47', 0);
INSERT INTO `x_ip_record` VALUES (0000000059, '102.165.48.141', NULL, NULL, 0, '2018-12-11 09:48:06', '2018-12-18 17:27:50', 0);
INSERT INTO `x_ip_record` VALUES (0000000060, '115.206.125.239', NULL, NULL, 0, '2018-12-11 10:29:52', '2018-12-11 17:26:41', 0);
INSERT INTO `x_ip_record` VALUES (0000000061, '115.206.125.239', 1, '站长', 1, '2018-12-11 10:29:58', '2018-12-11 10:29:59', 0);
INSERT INTO `x_ip_record` VALUES (0000000062, '47.100.57.133', NULL, NULL, 0, '2018-12-11 11:50:21', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000063, '104.192.74.18', NULL, NULL, 0, '2018-12-11 15:20:17', '2018-12-11 15:20:43', 0);
INSERT INTO `x_ip_record` VALUES (0000000064, '58.248.201.76', NULL, NULL, 0, '2018-12-11 15:40:15', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000065, '93.170.114.251', NULL, NULL, 0, '2018-12-12 05:36:57', '2018-12-29 16:07:52', 0);
INSERT INTO `x_ip_record` VALUES (0000000066, '47.98.60.52', NULL, NULL, 0, '2018-12-12 10:26:03', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000067, '125.39.100.183', NULL, NULL, 0, '2018-12-12 13:10:44', '2018-12-12 13:31:06', 0);
INSERT INTO `x_ip_record` VALUES (0000000068, '61.129.8.179', NULL, NULL, 0, '2018-12-12 14:50:27', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000069, '195.22.22.26', NULL, NULL, 0, '2018-12-12 15:37:56', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000070, '195.22.22.25', NULL, NULL, 0, '2018-12-12 15:38:21', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000071, '195.22.22.20', NULL, NULL, 0, '2018-12-12 15:38:33', '2018-12-19 09:30:44', 0);
INSERT INTO `x_ip_record` VALUES (0000000072, '157.55.39.47', NULL, NULL, 0, '2018-12-12 23:24:32', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000073, '207.46.13.25', NULL, NULL, 0, '2018-12-12 23:50:16', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000074, '104.248.155.243', NULL, NULL, 0, '2018-12-13 01:24:56', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000075, '106.14.114.244', NULL, NULL, 0, '2018-12-13 03:52:33', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000076, '39.107.116.226', NULL, NULL, 0, '2018-12-13 13:04:51', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000077, '113.214.26.134', NULL, NULL, 0, '2018-12-13 16:26:52', '2018-12-28 20:55:05', 0);
INSERT INTO `x_ip_record` VALUES (0000000078, '61.178.85.139', NULL, NULL, 0, '2018-12-13 19:44:54', '2018-12-13 20:15:02', 0);
INSERT INTO `x_ip_record` VALUES (0000000079, '47.92.135.145', NULL, NULL, 0, '2018-12-13 23:09:32', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000080, '119.125.189.231', NULL, NULL, 0, '2018-12-14 06:50:01', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000081, '88.6.181.34', NULL, NULL, 0, '2018-12-14 06:50:01', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000082, '52.15.183.236', NULL, NULL, 0, '2018-12-14 09:47:09', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000083, '47.97.220.124', NULL, NULL, 0, '2018-12-14 10:57:52', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000084, '39.104.203.143', NULL, NULL, 0, '2018-12-14 12:24:55', '2018-12-16 16:36:16', 0);
INSERT INTO `x_ip_record` VALUES (0000000085, '111.163.123.1', NULL, NULL, 0, '2018-12-14 15:10:37', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000086, '203.208.60.7', NULL, NULL, 0, '2018-12-14 16:27:04', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000087, '203.208.60.90', NULL, NULL, 0, '2018-12-14 16:27:06', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000088, '203.208.60.58', NULL, NULL, 0, '2018-12-14 16:42:13', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000089, '203.208.60.35', NULL, NULL, 0, '2018-12-14 16:43:22', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000090, '203.208.60.104', NULL, NULL, 0, '2018-12-14 16:44:28', '2018-12-17 01:18:50', 0);
INSERT INTO `x_ip_record` VALUES (0000000091, '203.208.60.112', NULL, NULL, 0, '2018-12-14 16:45:01', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000092, '203.208.60.65', NULL, NULL, 0, '2018-12-14 16:45:35', '2018-12-17 01:21:07', 0);
INSERT INTO `x_ip_record` VALUES (0000000093, '203.208.60.45', NULL, NULL, 0, '2018-12-14 16:55:13', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000094, '203.208.60.115', NULL, NULL, 0, '2018-12-14 16:56:38', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000095, '203.208.60.42', NULL, NULL, 0, '2018-12-14 17:00:06', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000096, '194.147.32.109', NULL, NULL, 0, '2018-12-14 22:35:49', '2018-12-19 16:18:55', 0);
INSERT INTO `x_ip_record` VALUES (0000000097, '39.104.158.245', NULL, NULL, 0, '2018-12-15 01:56:29', '2018-12-15 15:15:09', 0);
INSERT INTO `x_ip_record` VALUES (0000000098, '106.15.186.63', NULL, NULL, 0, '2018-12-15 05:00:57', '2018-12-30 09:25:43', 0);
INSERT INTO `x_ip_record` VALUES (0000000099, '128.1.84.138', NULL, NULL, 0, '2018-12-15 05:21:46', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000100, '198.108.66.224', NULL, NULL, 0, '2018-12-15 06:15:58', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000101, '47.92.101.29', NULL, NULL, 0, '2018-12-15 06:46:34', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000102, '101.132.107.246', NULL, NULL, 0, '2018-12-15 07:05:56', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000103, '106.14.115.254', NULL, NULL, 0, '2018-12-15 07:51:36', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000104, '101.132.177.14', NULL, NULL, 0, '2018-12-15 09:35:22', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000105, '101.132.69.5', NULL, NULL, 0, '2018-12-15 10:30:15', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000106, '106.14.217.247', NULL, NULL, 0, '2018-12-15 11:10:26', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000107, '61.161.197.162', NULL, NULL, 0, '2018-12-15 11:48:34', '2019-01-02 04:47:16', 0);
INSERT INTO `x_ip_record` VALUES (0000000108, '203.208.60.110', NULL, NULL, 0, '2018-12-15 13:08:20', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000109, '203.208.60.94', NULL, NULL, 0, '2018-12-15 13:08:59', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000110, '47.92.75.171', NULL, NULL, 0, '2018-12-15 13:58:56', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000111, '117.25.157.98', NULL, NULL, 0, '2018-12-16 01:31:39', '2018-12-30 04:38:24', 0);
INSERT INTO `x_ip_record` VALUES (0000000112, '157.55.39.34', NULL, NULL, 0, '2018-12-16 02:29:13', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000113, '40.77.167.48', NULL, NULL, 0, '2018-12-16 02:54:10', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000114, '39.104.231.102', NULL, NULL, 0, '2018-12-16 04:08:06', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000115, '101.132.102.45', NULL, NULL, 0, '2018-12-16 06:32:20', '2019-01-04 03:50:24', 0);
INSERT INTO `x_ip_record` VALUES (0000000116, '120.79.206.221', NULL, NULL, 0, '2018-12-16 07:47:27', '2018-12-20 05:38:15', 0);
INSERT INTO `x_ip_record` VALUES (0000000117, '47.92.95.89', NULL, NULL, 0, '2018-12-16 09:57:52', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000118, '3.16.136.218', NULL, NULL, 0, '2018-12-16 13:07:10', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000119, '47.92.137.155', NULL, NULL, 0, '2018-12-16 13:15:44', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000120, '203.208.60.31', NULL, NULL, 0, '2018-12-17 01:17:18', '2018-12-17 01:19:31', 0);
INSERT INTO `x_ip_record` VALUES (0000000121, '203.208.60.71', NULL, NULL, 0, '2018-12-17 01:17:29', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000122, '203.208.60.80', NULL, NULL, 0, '2018-12-17 01:17:45', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000123, '203.208.60.28', NULL, NULL, 0, '2018-12-17 01:18:12', '2018-12-17 01:21:47', 0);
INSERT INTO `x_ip_record` VALUES (0000000124, '203.208.60.57', NULL, NULL, 0, '2018-12-17 01:18:13', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000125, '203.208.60.37', NULL, NULL, 0, '2018-12-17 01:18:50', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000126, '203.208.60.122', NULL, NULL, 0, '2018-12-17 01:19:03', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000127, '203.208.60.17', NULL, NULL, 0, '2018-12-17 01:19:45', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000128, '203.208.60.117', NULL, NULL, 0, '2018-12-17 01:19:46', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000129, '203.208.60.38', NULL, NULL, 0, '2018-12-17 01:19:57', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000130, '203.208.60.22', NULL, NULL, 0, '2018-12-17 01:20:11', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000131, '203.208.60.1', NULL, NULL, 0, '2018-12-17 01:20:25', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000132, '203.208.60.48', NULL, NULL, 0, '2018-12-17 01:20:38', '2018-12-18 13:08:29', 0);
INSERT INTO `x_ip_record` VALUES (0000000133, '203.208.60.2', NULL, NULL, 0, '2018-12-17 01:20:39', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000134, '203.208.60.32', NULL, NULL, 0, '2018-12-17 01:20:52', '2018-12-17 01:30:07', 0);
INSERT INTO `x_ip_record` VALUES (0000000135, '203.208.60.113', NULL, NULL, 0, '2018-12-17 01:21:21', '2019-01-01 20:56:49', 0);
INSERT INTO `x_ip_record` VALUES (0000000136, '203.208.60.124', NULL, NULL, 0, '2018-12-17 01:21:50', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000137, '47.98.97.81', NULL, NULL, 0, '2018-12-17 03:39:56', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000138, '108.90.125.132', NULL, NULL, 0, '2018-12-17 07:12:53', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000139, '62.221.164.2', NULL, NULL, 0, '2018-12-17 07:12:53', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000140, '47.92.31.65', NULL, NULL, 0, '2018-12-17 16:15:24', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000141, '13.94.189.75', NULL, NULL, 0, '2018-12-17 17:33:41', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000142, '171.13.14.36', NULL, NULL, 0, '2018-12-17 19:17:47', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000143, '171.13.14.39', NULL, NULL, 0, '2018-12-17 19:17:47', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000144, '139.224.15.159', NULL, NULL, 0, '2018-12-18 04:21:55', '2019-01-06 16:21:41', 0);
INSERT INTO `x_ip_record` VALUES (0000000145, '45.114.172.26', NULL, NULL, 0, '2018-12-18 05:33:13', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000146, '173.212.225.214', NULL, NULL, 0, '2018-12-18 05:36:06', '2019-01-03 19:10:37', 0);
INSERT INTO `x_ip_record` VALUES (0000000147, '47.203.211.160', NULL, NULL, 0, '2018-12-18 06:57:55', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000148, '124.90.48.162', NULL, NULL, 0, '2018-12-18 07:19:14', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000149, '110.53.241.55', NULL, NULL, 0, '2018-12-18 07:19:14', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000150, '110.53.241.245', NULL, NULL, 0, '2018-12-18 07:19:15', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000151, '110.177.82.232', NULL, NULL, 0, '2018-12-18 07:19:15', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000152, '124.90.51.192', NULL, NULL, 0, '2018-12-18 07:19:17', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000153, '182.200.6.202', NULL, NULL, 0, '2018-12-18 07:19:18', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000154, '113.206.176.227', NULL, NULL, 0, '2018-12-18 07:19:18', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000155, '110.177.76.168', NULL, NULL, 0, '2018-12-18 07:19:19', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000156, '219.142.0.226', NULL, NULL, 0, '2018-12-18 09:50:33', '2018-12-18 09:50:35', 0);
INSERT INTO `x_ip_record` VALUES (0000000157, '148.251.109.177', NULL, NULL, 0, '2018-12-18 12:08:01', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000158, '203.208.60.69', NULL, NULL, 0, '2018-12-18 13:08:30', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000159, '101.132.188.111', NULL, NULL, 0, '2018-12-18 15:55:56', '2018-12-21 05:57:01', 0);
INSERT INTO `x_ip_record` VALUES (0000000160, '39.98.56.218', NULL, NULL, 0, '2018-12-19 02:27:28', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000161, '222.244.170.3', NULL, NULL, 0, '2018-12-19 18:43:14', '2018-12-19 20:00:19', 0);
INSERT INTO `x_ip_record` VALUES (0000000162, '139.180.220.30', NULL, NULL, 0, '2018-12-20 00:28:44', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000163, '139.224.11.233', NULL, NULL, 0, '2018-12-20 03:18:03', '2018-12-28 14:24:08', 0);
INSERT INTO `x_ip_record` VALUES (0000000164, '107.155.49.134', NULL, NULL, 0, '2018-12-20 05:02:11', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000165, '47.92.103.177', NULL, NULL, 0, '2018-12-20 09:14:15', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000166, '203.208.60.4', NULL, NULL, 0, '2018-12-20 09:36:26', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000167, '203.208.60.18', NULL, NULL, 0, '2018-12-20 09:36:26', '2019-01-02 03:57:55', 0);
INSERT INTO `x_ip_record` VALUES (0000000168, '120.36.122.213', NULL, NULL, 0, '2018-12-20 15:15:53', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000169, '116.252.174.91', NULL, NULL, 0, '2018-12-21 05:13:34', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000170, '106.14.168.238', NULL, NULL, 0, '2018-12-21 11:22:03', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000171, '185.234.217.8', NULL, NULL, 0, '2018-12-21 11:53:16', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000172, '203.208.60.91', NULL, NULL, 0, '2018-12-21 13:08:32', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000173, '203.208.60.5', NULL, NULL, 0, '2018-12-21 13:08:33', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000174, '115.231.222.95', NULL, NULL, 0, '2018-12-21 23:46:09', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000175, '106.14.189.11', NULL, NULL, 0, '2018-12-22 00:15:29', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000176, '198.108.66.208', NULL, NULL, 0, '2018-12-22 00:27:19', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000177, '104.237.130.165', NULL, NULL, 0, '2018-12-22 01:21:40', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000178, '157.55.39.230', NULL, NULL, 0, '2018-12-22 04:10:35', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000179, '47.92.100.7', NULL, NULL, 0, '2018-12-22 10:15:47', '2018-12-23 23:26:58', 0);
INSERT INTO `x_ip_record` VALUES (0000000180, '116.203.43.255', NULL, NULL, 0, '2018-12-23 02:38:04', '2018-12-23 02:38:15', 0);
INSERT INTO `x_ip_record` VALUES (0000000181, '47.92.102.179', NULL, NULL, 0, '2018-12-23 03:47:11', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000182, '142.93.211.235', NULL, NULL, 0, '2018-12-23 05:52:05', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000183, '71.6.199.23', NULL, NULL, 0, '2018-12-23 09:20:13', '2018-12-23 09:20:16', 0);
INSERT INTO `x_ip_record` VALUES (0000000184, '137.74.30.53', NULL, NULL, 0, '2018-12-23 16:17:46', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000185, '198.20.99.130', NULL, NULL, 0, '2018-12-23 18:15:35', '2018-12-23 18:15:40', 0);
INSERT INTO `x_ip_record` VALUES (0000000186, '139.59.63.107', NULL, NULL, 0, '2018-12-24 07:50:16', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000187, '120.52.152.4', NULL, NULL, 0, '2018-12-24 12:08:46', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000188, '203.208.60.8', NULL, NULL, 0, '2018-12-24 13:08:40', '2018-12-24 13:08:43', 0);
INSERT INTO `x_ip_record` VALUES (0000000189, '39.98.176.39', NULL, NULL, 0, '2018-12-24 13:36:17', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000190, '47.100.51.203', NULL, NULL, 0, '2018-12-24 14:47:19', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000191, '47.92.99.247', NULL, NULL, 0, '2018-12-24 15:25:58', '2018-12-30 18:54:03', 0);
INSERT INTO `x_ip_record` VALUES (0000000192, '5.8.54.27', NULL, NULL, 0, '2018-12-25 06:25:56', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000193, '101.132.177.30', NULL, NULL, 0, '2018-12-25 07:12:11', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000194, '104.45.11.240', NULL, NULL, 0, '2018-12-25 08:14:08', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000195, '172.104.143.98', NULL, NULL, 0, '2018-12-25 11:16:19', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000196, '47.100.38.232', NULL, NULL, 0, '2018-12-25 20:13:10', '2019-01-07 06:26:59', 0);
INSERT INTO `x_ip_record` VALUES (0000000197, '39.107.126.72', NULL, NULL, 0, '2018-12-26 04:50:09', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000198, '83.45.201.172', NULL, NULL, 0, '2018-12-26 07:27:08', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000199, '35.180.120.14', NULL, NULL, 0, '2018-12-26 11:59:36', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000200, '47.92.138.160', NULL, NULL, 0, '2018-12-26 20:52:39', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000201, '223.223.126.243', NULL, NULL, 0, '2018-12-27 07:10:22', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000202, '203.208.60.111', NULL, NULL, 0, '2018-12-27 13:08:46', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000203, '203.208.60.19', NULL, NULL, 0, '2018-12-27 13:08:48', '2018-12-30 13:08:52', 0);
INSERT INTO `x_ip_record` VALUES (0000000204, '5.188.10.176', NULL, NULL, 0, '2018-12-27 16:17:46', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000205, '39.104.67.220', NULL, NULL, 0, '2018-12-27 16:45:54', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000206, '101.132.193.68', NULL, NULL, 0, '2018-12-27 22:36:40', '2019-01-02 11:31:48', 0);
INSERT INTO `x_ip_record` VALUES (0000000207, '70.162.121.119', NULL, NULL, 0, '2018-12-28 08:00:09', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000208, '165.169.139.60', NULL, NULL, 0, '2018-12-28 08:01:22', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000209, '39.104.79.249', NULL, NULL, 0, '2018-12-28 09:37:12', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000210, '153.232.118.187', NULL, NULL, 0, '2018-12-28 12:03:08', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000211, '101.132.144.145', NULL, NULL, 0, '2018-12-28 18:02:20', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000212, '220.189.232.42', NULL, NULL, 0, '2018-12-28 20:55:02', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000213, '198.108.66.16', NULL, NULL, 0, '2018-12-28 23:16:33', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000214, '82.35.138.87', NULL, NULL, 0, '2018-12-28 23:54:43', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000215, '80.218.176.191', NULL, NULL, 0, '2018-12-29 05:32:05', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000216, '185.24.123.73', NULL, NULL, 0, '2018-12-29 06:13:03', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000217, '84.227.161.35', NULL, NULL, 0, '2018-12-29 08:49:37', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000218, '47.97.215.92', NULL, NULL, 0, '2018-12-29 09:50:21', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000219, '101.227.139.194', NULL, NULL, 0, '2018-12-29 20:25:58', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000220, '47.92.90.246', NULL, NULL, 0, '2018-12-30 04:40:24', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000221, '203.208.60.14', NULL, NULL, 0, '2018-12-30 13:08:50', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000222, '101.89.29.94', NULL, NULL, 0, '2018-12-30 13:36:46', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000223, '203.208.60.16', NULL, NULL, 0, '2018-12-31 01:52:00', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000224, '51.15.98.220', NULL, NULL, 0, '2018-12-31 10:49:29', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000225, '216.145.5.42', NULL, NULL, 0, '2018-12-31 11:23:41', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000226, '101.132.98.159', NULL, NULL, 0, '2018-12-31 19:39:08', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000227, '203.208.60.73', NULL, NULL, 0, '2018-12-31 22:17:07', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000228, '203.208.60.33', NULL, NULL, 0, '2018-12-31 22:17:09', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000229, '122.228.19.79', NULL, NULL, 0, '2018-12-31 22:41:40', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000230, '47.92.38.53', NULL, NULL, 0, '2019-01-01 11:56:06', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000231, '101.132.131.7', NULL, NULL, 0, '2019-01-01 14:37:04', '2019-01-02 18:43:52', 0);
INSERT INTO `x_ip_record` VALUES (0000000232, '39.107.121.196', NULL, NULL, 0, '2019-01-01 17:36:26', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000233, '115.222.167.73', NULL, NULL, 0, '2019-01-01 18:31:58', '2019-01-01 18:36:25', 0);
INSERT INTO `x_ip_record` VALUES (0000000234, '203.208.60.108', NULL, NULL, 0, '2019-01-01 18:55:48', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000235, '47.96.12.13', NULL, NULL, 0, '2019-01-01 20:44:57', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000236, '203.208.60.123', NULL, NULL, 0, '2019-01-01 21:46:49', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000237, '203.208.60.100', NULL, NULL, 0, '2019-01-02 03:57:57', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000238, '45.33.13.96', NULL, NULL, 0, '2019-01-02 04:15:04', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000239, '203.208.60.74', NULL, NULL, 0, '2019-01-02 04:38:12', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000240, '203.208.60.103', NULL, NULL, 0, '2019-01-02 11:02:21', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000241, '47.100.100.21', NULL, NULL, 0, '2019-01-02 20:58:22', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000242, '185.53.88.50', NULL, NULL, 0, '2019-01-03 03:13:37', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000243, '68.183.63.39', NULL, NULL, 0, '2019-01-03 07:21:32', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000244, '47.92.132.229', NULL, NULL, 0, '2019-01-03 12:23:15', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000245, '223.166.75.130', NULL, NULL, 0, '2019-01-03 15:59:44', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000246, '106.2.125.215', NULL, NULL, 0, '2019-01-03 17:05:27', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000247, '47.110.70.6', NULL, NULL, 0, '2019-01-04 02:36:29', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000248, '88.80.188.43', NULL, NULL, 0, '2019-01-04 06:03:34', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000249, '36.32.3.229', NULL, NULL, 0, '2019-01-04 10:35:19', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000250, '110.167.95.217', NULL, NULL, 0, '2019-01-04 10:35:21', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000251, '123.191.154.5', NULL, NULL, 0, '2019-01-04 10:35:23', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000252, '106.45.1.100', NULL, NULL, 0, '2019-01-04 10:35:24', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000253, '125.84.181.124', NULL, NULL, 0, '2019-01-04 10:35:27', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000254, '106.47.43.79', NULL, NULL, 0, '2019-01-04 10:35:28', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000255, '125.76.60.27', NULL, NULL, 0, '2019-01-04 10:35:29', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000256, '36.32.3.148', NULL, NULL, 0, '2019-01-04 10:35:30', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000257, '47.100.104.184', NULL, NULL, 0, '2019-01-04 12:26:39', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000258, '104.248.8.156', NULL, NULL, 0, '2019-01-04 20:41:22', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000259, '101.132.106.40', NULL, NULL, 0, '2019-01-04 20:46:56', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000260, '203.208.60.126', NULL, NULL, 0, '2019-01-04 21:50:17', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000261, '203.208.60.72', NULL, NULL, 0, '2019-01-04 21:50:18', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000262, '54.238.253.83', NULL, NULL, 0, '2019-01-05 01:59:12', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000263, '101.132.100.6', NULL, NULL, 0, '2019-01-05 03:56:05', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000264, '198.108.66.64', NULL, NULL, 0, '2019-01-05 05:06:32', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000265, '80.82.77.139', NULL, NULL, 0, '2019-01-05 06:36:30', '2019-01-05 06:36:33', 0);
INSERT INTO `x_ip_record` VALUES (0000000266, '123.163.114.130', NULL, NULL, 0, '2019-01-05 11:41:27', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000267, '222.82.48.112', NULL, NULL, 0, '2019-01-05 11:41:30', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000268, '61.52.67.134', NULL, NULL, 0, '2019-01-05 11:41:31', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000269, '112.230.40.146', NULL, NULL, 0, '2019-01-05 11:41:32', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000270, '113.200.72.203', NULL, NULL, 0, '2019-01-05 11:41:35', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000271, '106.45.1.55', NULL, NULL, 0, '2019-01-05 11:41:35', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000272, '125.84.183.237', NULL, NULL, 0, '2019-01-05 11:41:36', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000273, '125.84.181.199', NULL, NULL, 0, '2019-01-05 11:41:36', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000274, '47.97.167.161', NULL, NULL, 0, '2019-01-05 16:16:51', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000275, '47.92.98.215', NULL, NULL, 0, '2019-01-06 03:57:36', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000276, '221.231.138.5', NULL, NULL, 0, '2019-01-06 05:01:35', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000277, '125.76.60.15', NULL, NULL, 0, '2019-01-06 18:26:33', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000278, '1.31.160.99', NULL, NULL, 0, '2019-01-06 18:26:34', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000279, '182.138.215.80', NULL, NULL, 0, '2019-01-06 18:26:35', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000280, '175.184.165.31', NULL, NULL, 0, '2019-01-06 18:26:38', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000281, '125.76.60.161', NULL, NULL, 0, '2019-01-06 18:26:41', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000282, '221.232.22.54', NULL, NULL, 0, '2019-01-06 18:26:42', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000283, '171.34.218.188', NULL, NULL, 0, '2019-01-06 18:26:43', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000284, '175.42.2.103', NULL, NULL, 0, '2019-01-06 18:26:43', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000285, '115.198.85.36', NULL, NULL, 0, '2019-01-06 19:07:45', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000286, '13.231.76.83', NULL, NULL, 0, '2019-01-06 21:23:17', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000287, '123.191.140.208', NULL, NULL, 0, '2019-01-06 22:44:33', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000288, '222.82.55.182', NULL, NULL, 0, '2019-01-06 22:44:34', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000289, '125.84.176.234', NULL, NULL, 0, '2019-01-06 22:44:36', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000290, '58.248.203.62', NULL, NULL, 0, '2019-01-06 22:44:38', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000291, '116.252.0.23', NULL, NULL, 0, '2019-01-06 22:44:39', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000292, '223.166.74.253', NULL, NULL, 0, '2019-01-06 22:44:39', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000293, '221.13.12.50', NULL, NULL, 0, '2019-01-06 22:44:42', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000294, '139.99.99.124', NULL, NULL, 0, '2019-01-07 06:05:40', NULL, 0);
INSERT INTO `x_ip_record` VALUES (0000000295, '125.118.66.33', NULL, NULL, 0, '2019-01-07 09:14:40', '2019-01-07 09:55:55', 0);
INSERT INTO `x_ip_record` VALUES (0000000296, '125.118.66.33', 1, '站长', 1, '2019-01-07 09:15:13', '2019-01-07 09:22:15', 0);
INSERT INTO `x_ip_record` VALUES (0000000297, '115.192.76.184', NULL, NULL, 0, '2019-01-07 11:03:35', NULL, 0);

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
INSERT INTO `x_permission` VALUES (0000000001, 1, '/manage', '管理页面', '[superadmin][admin][author][reader]', '2018-12-04 18:44:33', '2018-12-05 15:49:42', 0);
INSERT INTO `x_permission` VALUES (0000000002, 2, '/write', '写作页面', '[superadmin][author]', '2018-12-04 18:44:48', '2018-12-05 15:48:09', 0);
INSERT INTO `x_permission` VALUES (0000000003, 3, '/manage/self', '个人管理', '[superadmin][admin][author][reader]', '2018-12-04 19:07:10', '2018-12-05 15:49:58', 0);
INSERT INTO `x_permission` VALUES (0000000004, 4, '/manage/link', '外链管理', '[superadmin][admin]', '2018-12-04 18:42:41', '2018-12-05 15:49:17', 0);
INSERT INTO `x_permission` VALUES (0000000005, 5, '/manage/indx', '首页管理', '[superadmin][admin]', '2018-12-04 18:42:29', '2018-12-05 15:49:13', 0);
INSERT INTO `x_permission` VALUES (0000000006, 6, '/manage/info', '站点信息管理', '[superadmin]', '2018-12-04 18:42:16', '2018-12-04 19:09:42', 0);
INSERT INTO `x_permission` VALUES (0000000007, 7, '/manage/user', '用户管理', '[superadmin][admin]', '2018-12-04 18:41:59', '2018-12-05 15:49:09', 0);

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
INSERT INTO `x_user_account` VALUES (0000000001, 'admin', '站长', '1000:7560794ef5bf6fb6ea28d13511e716a9e149b6fd03485af0:22881fc707c82ae450fcdfa48fc397ce757f140a47d9362d', 'superadmin', 'unknown', '2018-01-26 16:04:31', '2018-12-05 16:43:08', 0);
INSERT INTO `x_user_account` VALUES (0000000002, '1104300304@qq.com', '管理员', '1000:7560794ef5bf6fb6ea28d13511e716a9e149b6fd03485af0:22881fc707c82ae450fcdfa48fc397ce757f140a47d9362d', 'admin', 'unknown', '2018-02-11 17:49:44', '2018-12-05 16:42:57', 0);
INSERT INTO `x_user_account` VALUES (0000000003, '970244559@qq.com', '萧大俠', '1000:7560794ef5bf6fb6ea28d13511e716a9e149b6fd03485af0:22881fc707c82ae450fcdfa48fc397ce757f140a47d9362d', 'author', 'unknown', '2018-02-12 10:23:21', '2018-12-05 16:33:00', 0);
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
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x_user_image
-- ----------------------------
INSERT INTO `x_user_image` VALUES (0000000013, NULL, NULL, 'https://blog-1252251484.cos.ap-shanghai.myqcloud.com/image/small/2018-12-05-bc4d80bba8e14bbbb4b0166c74927198.jpg', 'https://blog-1252251484.cos.ap-shanghai.myqcloud.com/image/total/2018-12-05-bc4d80bba8e14bbbb4b0166c74927198.jpg', 3, '萧大俠', NULL, NULL, 0, 0, '2018-12-05 16:27:48', '2018-12-05 16:34:55', 0);
INSERT INTO `x_user_image` VALUES (0000000014, NULL, NULL, 'https://blog-1252251484.cos.ap-shanghai.myqcloud.com/image/small/2018-12-05-2a3c20db05fe487ea4b4039d30983a50.jpg', 'https://blog-1252251484.cos.ap-shanghai.myqcloud.com/image/total/2018-12-05-2a3c20db05fe487ea4b4039d30983a50.jpg', 3, '萧大俠', NULL, NULL, 0, 0, '2018-12-05 16:27:59', '2018-12-05 16:34:57', 0);
INSERT INTO `x_user_image` VALUES (0000000015, NULL, NULL, 'https://blog-1252251484.cos.ap-shanghai.myqcloud.com/image/small/2018-12-05-52f33fbb2ebe43d99fccb17dce65a9f8.jpg', 'https://blog-1252251484.cos.ap-shanghai.myqcloud.com/image/total/2018-12-05-52f33fbb2ebe43d99fccb17dce65a9f8.jpg', 3, '萧大俠', NULL, NULL, 0, 0, '2018-12-05 16:28:05', '2018-12-05 16:34:59', 0);
INSERT INTO `x_user_image` VALUES (0000000018, NULL, NULL, 'https://blog-1252251484.cos.ap-shanghai.myqcloud.com/image/small/2018-12-05-8d1d8c66690446079696681f30251fbd.jpg', 'https://blog-1252251484.cos.ap-shanghai.myqcloud.com/image/total/2018-12-05-8d1d8c66690446079696681f30251fbd.jpg', 2, '管理员', NULL, NULL, 0, 0, '2018-12-05 16:46:26', NULL, 0);
INSERT INTO `x_user_image` VALUES (0000000019, NULL, NULL, 'https://blog-1252251484.cos.ap-shanghai.myqcloud.com/image/small/2018-12-05-bc7e6a9b73514fbab4a24ec9cc6b1269.jpg', 'https://blog-1252251484.cos.ap-shanghai.myqcloud.com/image/total/2018-12-05-bc7e6a9b73514fbab4a24ec9cc6b1269.jpg', 1, '站长', NULL, NULL, 0, 0, '2018-12-05 17:10:03', NULL, 0);
INSERT INTO `x_user_image` VALUES (0000000020, NULL, NULL, 'https://blog-1252251484.cos.ap-shanghai.myqcloud.com/image/small/2018-12-05-f896ac13960b4fe5b0190ef7bc7cbbb3.jpg', 'https://blog-1252251484.cos.ap-shanghai.myqcloud.com/image/total/2018-12-05-f896ac13960b4fe5b0190ef7bc7cbbb3.jpg', 1, '站长', NULL, NULL, 0, 0, '2018-12-05 17:48:29', '2018-12-05 17:50:30', 1);
INSERT INTO `x_user_image` VALUES (0000000021, NULL, NULL, 'https://blog-1252251484.cos.ap-shanghai.myqcloud.com/image/small/2018-12-05-2b9ec4a5e6484d26b73722ffc5220fd0.jpg', 'https://blog-1252251484.cos.ap-shanghai.myqcloud.com/image/total/2018-12-05-2b9ec4a5e6484d26b73722ffc5220fd0.jpg', 1, '站长', NULL, NULL, 0, 0, '2018-12-05 17:50:10', NULL, 0);

SET FOREIGN_KEY_CHECKS = 1;
