/*
SQLyog Ultimate v11.25 (64 bit)
MySQL - 5.5.53-0ubuntu0.14.04.1-log : Database - frame
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `fm_ad` */

DROP TABLE IF EXISTS `fm_ad`;

CREATE TABLE `fm_ad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `classid` int(11) DEFAULT NULL COMMENT '所属类别',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `url` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `caption` text COMMENT '概要',
  `pic` int(11) DEFAULT NULL COMMENT '文件ID',
  `order_num` int(11) DEFAULT '99999' COMMENT '排序',
  `hits` int(11) DEFAULT '0' COMMENT '阅读次数',
  `is_recommend` tinyint(1) DEFAULT '0' COMMENT '是否推荐',
  `is_pass` tinyint(1) DEFAULT '1' COMMENT '是否显示',
  `adddate` timestamp NULL DEFAULT NULL COMMENT '添加日期',
  `last_update` timestamp NULL DEFAULT NULL COMMENT '最后一次修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='广告';

/*Data for the table `fm_ad` */

insert  into `fm_ad`(`id`,`classid`,`title`,`url`,`caption`,`pic`,`order_num`,`hits`,`is_recommend`,`is_pass`,`adddate`,`last_update`) values (1,1,'消防器材','http://www.sina.com.cn','',12,99999,0,0,1,'0000-00-00 00:00:00','2016-10-11 14:02:58');

/*Table structure for table `fm_article_category` */

DROP TABLE IF EXISTS `fm_article_category`;

CREATE TABLE `fm_article_category` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `name` varchar(100) NOT NULL COMMENT '菜单名称',
  `pid` int(20) NOT NULL COMMENT '父类ID',
  `icon` varchar(100) DEFAULT NULL COMMENT 'icon图标',
  `pic` int(11) DEFAULT NULL COMMENT '栏目图片ID',
  `caption` text COMMENT '栏目概要',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'SEO-页面关键词',
  `description` text COMMENT 'SEO-页面描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='文章分类';

/*Data for the table `fm_article_category` */

insert  into `fm_article_category`(`id`,`name`,`pid`,`icon`,`pic`,`caption`,`keywords`,`description`) values (2,'本地新闻',0,'',0,'','',''),(16,'技术文章',0,'',0,'','','');

/*Table structure for table `fm_case` */

DROP TABLE IF EXISTS `fm_case`;

CREATE TABLE `fm_case` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `classid` int(11) DEFAULT NULL COMMENT '所属类别',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `caption` text COMMENT '概要',
  `content` text COMMENT '内容',
  `pic` int(11) DEFAULT NULL COMMENT '文件ID',
  `pic_list` varchar(255) DEFAULT NULL COMMENT '文件ID，多个用“,”分隔 ,顺序与id顺序一致',
  `author` varchar(255) DEFAULT NULL COMMENT '作者',
  `order_num` int(11) DEFAULT '99999' COMMENT '排序',
  `hits` int(11) DEFAULT '0' COMMENT '阅读次数',
  `is_recommend` tinyint(1) DEFAULT '0' COMMENT '是否推荐',
  `is_pass` tinyint(1) DEFAULT '1' COMMENT '是否显示',
  `adddate` timestamp NULL DEFAULT NULL COMMENT '添加日期',
  `last_update` timestamp NULL DEFAULT NULL COMMENT '最后一次修改日期',
  `keywords` text COMMENT 'SEO-页面关键词',
  `description` text COMMENT 'SEO-页面描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='案件系统';

/*Data for the table `fm_case` */

insert  into `fm_case`(`id`,`classid`,`title`,`caption`,`content`,`pic`,`pic_list`,`author`,`order_num`,`hits`,`is_recommend`,`is_pass`,`adddate`,`last_update`,`keywords`,`description`) values (1,1,'添没测试信息','','<p>10月9日，中国上海，16/17NBA中国赛上海站，休斯顿火箭123-117击败新奥尔良鹈鹕。</p><p><a class=\"heart-vote\" title=\"顶\" style=\"outline: none; color: rgb(102, 102, 102); display: block; width: 90px; height: 85px; line-height: 30px; text-align: center; font-family: &quot;Microsoft Yahei&quot;, 微软雅黑; font-size: 14px; cursor: pointer; overflow: hidden;\"></a></p><p><br/></p>',13,'','',99999,0,0,0,'2016-10-10 11:15:46','2016-10-11 14:09:23','','');

/*Table structure for table `fm_case_category` */

DROP TABLE IF EXISTS `fm_case_category`;

CREATE TABLE `fm_case_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '菜单名称',
  `pid` int(20) NOT NULL COMMENT '父类ID',
  `icon` varchar(100) DEFAULT NULL COMMENT 'icon图标',
  `pic` int(11) DEFAULT NULL COMMENT '栏目图片ID',
  `caption` text COMMENT '栏目概要',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'SEO-页面关键词',
  `description` text COMMENT 'SEO-页面描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='案件分类';

/*Data for the table `fm_case_category` */

insert  into `fm_case_category`(`id`,`name`,`pid`,`icon`,`pic`,`caption`,`keywords`,`description`) values (1,'发光字',0,'',0,'','',''),(2,'水晶字',0,'',0,'','',''),(3,'木拖盘',0,'',0,'','','');

/*Table structure for table `fm_download` */

DROP TABLE IF EXISTS `fm_download`;

CREATE TABLE `fm_download` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `classid` int(11) DEFAULT NULL COMMENT '所属类别',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `caption` text COMMENT '概要',
  `content` text COMMENT '内容',
  `file` int(11) DEFAULT NULL COMMENT '文件ID',
  `author` varchar(255) DEFAULT NULL COMMENT '作者',
  `order_num` int(11) DEFAULT '99999' COMMENT '排序',
  `hits` int(11) DEFAULT '0' COMMENT '阅读次数',
  `is_recommend` tinyint(1) DEFAULT '0' COMMENT '是否推荐',
  `is_pass` tinyint(1) DEFAULT '1' COMMENT '是否显示',
  `adddate` timestamp NULL DEFAULT NULL COMMENT '添加日期',
  `last_update` timestamp NULL DEFAULT NULL COMMENT '最后一次修改日期',
  `keywords` text COMMENT 'SEO-页面关键词',
  `description` text COMMENT 'SEO-页面描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='下载';

/*Data for the table `fm_download` */

insert  into `fm_download`(`id`,`classid`,`title`,`caption`,`content`,`file`,`author`,`order_num`,`hits`,`is_recommend`,`is_pass`,`adddate`,`last_update`,`keywords`,`description`) values (1,1,'关于IT的解释','','',68,'',99999,0,0,1,'0000-00-00 00:00:00','2016-10-14 11:39:50','','');

/*Table structure for table `fm_download_category` */

DROP TABLE IF EXISTS `fm_download_category`;

CREATE TABLE `fm_download_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '菜单名称',
  `pid` int(20) NOT NULL COMMENT '父类ID',
  `icon` varchar(100) DEFAULT NULL COMMENT 'icon图标',
  `pic` int(11) DEFAULT NULL COMMENT '栏目图片ID',
  `caption` text COMMENT '栏目概要',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'SEO-页面关键词',
  `description` text COMMENT 'SEO-页面描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='下载分类';

/*Data for the table `fm_download_category` */

insert  into `fm_download_category`(`id`,`name`,`pid`,`icon`,`pic`,`caption`,`keywords`,`description`) values (1,'操作手册',0,'',0,'','','');

/*Table structure for table `fm_link` */

DROP TABLE IF EXISTS `fm_link`;

CREATE TABLE `fm_link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `classid` int(11) DEFAULT NULL COMMENT '所属类别',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `caption` text COMMENT '概要',
  `url` varchar(255) DEFAULT NULL COMMENT '连接地址',
  `pic` int(11) DEFAULT NULL COMMENT '文件ID',
  `order_num` int(11) DEFAULT '99999' COMMENT '排序',
  `hits` int(11) DEFAULT '0' COMMENT '阅读次数',
  `is_recommend` tinyint(1) DEFAULT '0' COMMENT '是否推荐',
  `is_pass` tinyint(1) DEFAULT '1' COMMENT '是否显示',
  `adddate` timestamp NULL DEFAULT NULL COMMENT '添加日期',
  `last_update` timestamp NULL DEFAULT NULL COMMENT '最后一次修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='友情链接';

/*Data for the table `fm_link` */

insert  into `fm_link`(`id`,`classid`,`title`,`caption`,`url`,`pic`,`order_num`,`hits`,`is_recommend`,`is_pass`,`adddate`,`last_update`) values (1,1,'百度','','http://www.baidu.com/',NULL,99999,0,0,1,'2016-10-10 10:03:43','2016-10-10 10:03:43'),(2,2,'信用中国','','http://www.sina.com.cn',11,99999,0,0,1,'2016-10-10 10:09:13','2016-10-10 10:09:13'),(3,1,'新浪','','http://www.sina.com.cn',NULL,99999,0,0,0,'2016-10-14 11:54:37','2016-10-14 11:54:42');

/*Table structure for table `fm_menu` */

DROP TABLE IF EXISTS `fm_menu`;

CREATE TABLE `fm_menu` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `name` varchar(100) NOT NULL COMMENT '菜单名称',
  `pid` int(20) NOT NULL COMMENT '父ID',
  `url` varchar(200) DEFAULT NULL COMMENT '连接地址',
  `icon` varchar(100) DEFAULT NULL COMMENT 'icon图标',
  `sorting` int(10) DEFAULT NULL COMMENT '排序',
  `isvalid` int(1) DEFAULT NULL COMMENT '是否有效，1--有效，0--无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='管理菜单';

/*Data for the table `fm_menu` */

insert  into `fm_menu`(`id`,`name`,`pid`,`url`,`icon`,`sorting`,`isvalid`) values (1,'文章系统',0,'','fa fa-share-alt-square',99999,1),(3,'栏目管理',1,'admin/article_category/index','',99999,1),(5,'文章管理',1,'admin/article/index','',99999,1),(17,'数据报表',0,'','fa fa-bar-chart',99999,1),(18,'登录报表',17,'admin/chart/user_login','',99999,1),(19,'单页系统',0,'','fa fa-file',99999,1),(20,'信息管理',19,'admin/page/index/classid/1','',99999,1),(22,'公司简介',0,'','fa fa-puzzle-piece',99999,1),(23,'信息管理',22,'admin/page/index/classid/2','',99999,1),(24,'友情链接',0,'','fa fa-link',99999,1),(25,'文字链接',24,'admin/link/index/classid/1','',99999,1),(26,'图片链接',24,'admin/link/index/classid/2','',99999,1),(27,'广告系统',0,'','fa fa-buysellads',99999,1),(28,'首页幻灯广告',27,'admin/ad/index/classid/1','',99999,1),(29,'内页Banner',27,'admin/ad/index/classid/2','',99999,1),(30,'新闻中心',0,'','fa fa-newspaper-o',99999,1),(31,'栏目管理',30,'admin/news_category/index','',99999,1),(32,'信息管理',30,'admin/news/index','',99999,1),(33,'成功案例',0,'','fa fa-briefcase',99999,1),(34,'栏目管理',33,'admin/case_category/index','',99999,1),(35,'信息管理',33,'admin/case/index','',99999,1),(36,'产品中心',0,'','fa fa-diamond',99999,1),(37,'栏目管理',36,'admin/product_category/index','',99999,1),(38,'信息管理',36,'admin/product/index','',99999,1),(39,'下载中心',0,'','fa fa-download',99999,1),(40,'栏目管理',39,'admin/download_category/index','',99999,1),(41,'信息管理',39,'admin/download/index','',99999,1),(42,'视频展示',0,'','glyphicon glyphicon-facetime-video',99999,1),(43,'栏目管理',42,'admin/video_category/index','',99999,1),(44,'信息管理',42,'admin/video/index','',99999,1),(45,'投票系统',0,'','fa fa-star-half-o',99999,1),(46,'投票选项',45,'admin/vote/index','',99999,1),(47,'单页直显',19,'admin/page/single/id/1','');

/*Table structure for table `fm_news` */

DROP TABLE IF EXISTS `fm_news`;

CREATE TABLE `fm_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `classid` int(11) DEFAULT NULL COMMENT '所属类别',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `caption` text COMMENT '概要',
  `content` text COMMENT '内容',
  `pic` int(11) DEFAULT NULL COMMENT '文件ID',
  `pic_list` varchar(255) DEFAULT NULL COMMENT '文件ID，多个用“,”分隔 ,顺序与id顺序一致',
  `author` varchar(255) DEFAULT NULL COMMENT '作者',
  `order_num` int(11) DEFAULT '99999' COMMENT '排序',
  `hits` int(11) DEFAULT '0' COMMENT '阅读次数',
  `is_recommend` tinyint(1) DEFAULT '0' COMMENT '是否推荐',
  `is_pass` tinyint(1) DEFAULT '1' COMMENT '是否显示',
  `adddate` timestamp NULL DEFAULT NULL COMMENT '添加日期',
  `last_update` timestamp NULL DEFAULT NULL COMMENT '最后一次修改日期',
  `keywords` text COMMENT 'SEO-页面关键词',
  `description` text COMMENT 'SEO-页面描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='新闻系统';

/*Data for the table `fm_news` */

insert  into `fm_news`(`id`,`classid`,`title`,`caption`,`content`,`pic`,`pic_list`,`author`,`order_num`,`hits`,`is_recommend`,`is_pass`,`adddate`,`last_update`,`keywords`,`description`) values (1,3,'美大选第二场辩论 希拉里特朗普或互揭“黑料”','','<p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: &quot;Microsoft YaHei&quot;, u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53; white-space: normal;\">中新网10月10日电 据外媒报道，当地时间9日晚，美国共和党总统候选人特朗普和民主党总统候选人将展开第二场电视辩论。外界预料，希拉里和特朗普将就对方邮件门、性丑闻等“黑料”展开痛击。</p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: &quot;Microsoft YaHei&quot;, u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53; white-space: normal;\">　　此前，特朗普被媒体曝出多年前出言侮辱女性的录音，如今丑闻继续发酵，党内已有至少36名大佬要他退选。特朗普8日公开道歉后誓言绝不弃选，还扬言要在9日的第二场电视辩论上，爆出更多有关克林顿夫妇的性丑闻。</p><p><br/></p>',NULL,'','',99999,0,0,1,'2016-10-10 10:58:41','2016-10-10 10:58:41','',''),(2,2,'铁道部末任部长盛光祖退休 曾给高铁降速','','<p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: &quot;Microsoft YaHei&quot;, u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53; white-space: normal;\">10月9日下午，中国铁路总公司在机关总部召开全路电话工作会议，决定任命交通运输部副部长、国家铁路局局长陆东福接任中国铁路总公司总经理，原中国铁路总公司总经理盛光祖退休。</p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: &quot;Microsoft YaHei&quot;, u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53; white-space: normal;\">　　观海解局记者了解到，今年已经67岁的盛光祖，在2011年2月开始任铁道部部长、党组书记。2013年3月，开始任中国铁路总公司总经理、党组书记。盛光祖在铁路系统工作多年，都做过哪些事儿？</p><p><br/></p>',NULL,'','',99999,0,0,1,'2016-10-10 10:59:52','2016-10-10 10:59:52','','');

/*Table structure for table `fm_news_category` */

DROP TABLE IF EXISTS `fm_news_category`;

CREATE TABLE `fm_news_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '菜单名称',
  `pid` int(20) NOT NULL COMMENT '父类ID',
  `icon` varchar(100) DEFAULT NULL COMMENT 'icon图标',
  `pic` int(11) DEFAULT NULL COMMENT '栏目图片ID',
  `caption` text COMMENT '栏目概要',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'SEO-页面关键词',
  `description` text COMMENT 'SEO-页面描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='新闻分类';

/*Data for the table `fm_news_category` */

insert  into `fm_news_category`(`id`,`name`,`pid`,`icon`,`pic`,`caption`,`keywords`,`description`) values (1,'公司新闻',0,'',0,'','',''),(2,'行业新闻',0,'',0,'','',''),(3,'活动公告',1,'',0,'','','');

/*Table structure for table `fm_page` */

DROP TABLE IF EXISTS `fm_page`;

CREATE TABLE `fm_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `classid` int(11) DEFAULT NULL COMMENT '所属类别',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `caption` text COMMENT '概要',
  `content` text COMMENT '内容',
  `pic` int(11) DEFAULT NULL COMMENT '文件ID',
  `pic_list` varchar(255) DEFAULT NULL COMMENT '文件ID，多个用“,”分隔 ,顺序与id顺序一致',
  `author` varchar(255) DEFAULT NULL COMMENT '作者',
  `order_num` int(11) DEFAULT '99999' COMMENT '排序',
  `hits` int(11) DEFAULT '0' COMMENT '阅读次数',
  `is_recommend` tinyint(1) DEFAULT '0' COMMENT '是否推荐',
  `is_pass` tinyint(1) DEFAULT '1' COMMENT '是否显示',
  `adddate` timestamp NULL DEFAULT NULL COMMENT '添加日期',
  `last_update` timestamp NULL DEFAULT NULL COMMENT '最后一次修改日期',
  `keywords` text COMMENT 'SEO-页面关键词',
  `description` text COMMENT 'SEO-页面描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='单页系统';

/*Data for the table `fm_page` */

insert  into `fm_page`(`id`,`classid`,`title`,`caption`,`content`,`pic`,`pic_list`,`author`,`order_num`,`hits`,`is_recommend`,`is_pass`,`adddate`,`last_update`,`keywords`,`description`) values (1,1,'啦啦咬掉','','<p>公司简介公司22简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介</p><p><br/></p><p>公司简介公司简介</p>',NULL,'','',99999,0,0,0,'0000-00-00 00:00:00','2016-10-11 14:02:25','',''),(2,2,'联系我们','','<p>联系我们联系我们联系我们联系我们联系我们联系我们</p>',NULL,'','',99999,0,0,1,'2016-10-09 20:48:36','2016-10-09 20:48:36','',''),(3,2,'企业文化','','<p>企业文化企业文化企业文化企业文化</p><p>企业文化企业文化</p>',NULL,'','',99999,0,0,1,'2016-10-09 20:49:02','2016-10-09 20:49:02','',''),(4,2,'发展历程','','<p>发展历程发展历程发展历程发展历程发展历程发展历程</p><p>发展历程发展历程</p>',NULL,'','',99999,0,0,1,'2016-10-09 20:52:16','2016-10-09 20:52:16','','');

/*Table structure for table `fm_product` */

DROP TABLE IF EXISTS `fm_product`;

CREATE TABLE `fm_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `classid` int(11) DEFAULT NULL COMMENT '所属类别',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `caption` text COMMENT '概要',
  `content` text COMMENT '内容',
  `pic` int(11) DEFAULT NULL COMMENT '文件ID',
  `pic_list` varchar(255) DEFAULT NULL COMMENT '文件ID，多个用“,”分隔 ,顺序与id顺序一致',
  `author` varchar(255) DEFAULT NULL COMMENT '作者',
  `order_num` int(11) DEFAULT '99999' COMMENT '排序',
  `hits` int(11) DEFAULT '0' COMMENT '阅读次数',
  `is_recommend` tinyint(1) DEFAULT '0' COMMENT '是否推荐',
  `is_pass` tinyint(1) DEFAULT '1' COMMENT '是否显示',
  `adddate` timestamp NULL DEFAULT NULL COMMENT '添加日期',
  `last_update` timestamp NULL DEFAULT NULL COMMENT '最后一次修改日期',
  `keywords` text COMMENT 'SEO-页面关键词',
  `description` text COMMENT 'SEO-页面描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='产品系统';

/*Data for the table `fm_product` */

insert  into `fm_product`(`id`,`classid`,`title`,`caption`,`content`,`pic`,`pic_list`,`author`,`order_num`,`hits`,`is_recommend`,`is_pass`,`adddate`,`last_update`,`keywords`,`description`) values (1,1,'产品测试数据添加','','<p>产品测试数据添加产品测试数据添加产品测试数据添加产品测试数据添加产品测试数据添加</p>',14,'15,16,17','',99999,0,0,1,'0000-00-00 00:00:00','2016-10-10 11:26:34','','');

/*Table structure for table `fm_product_category` */

DROP TABLE IF EXISTS `fm_product_category`;

CREATE TABLE `fm_product_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '菜单名称',
  `pid` int(20) NOT NULL COMMENT '父类ID',
  `icon` varchar(100) DEFAULT NULL COMMENT 'icon图标',
  `pic` int(11) DEFAULT NULL COMMENT '栏目图片ID',
  `caption` text COMMENT '栏目概要',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'SEO-页面关键词',
  `description` text COMMENT 'SEO-页面描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='产品分类';

/*Data for the table `fm_product_category` */

insert  into `fm_product_category`(`id`,`name`,`pid`,`icon`,`pic`,`caption`,`keywords`,`description`) values (1,'无粉木材',0,'',0,'','',''),(2,'钢化玻璃',0,'',0,'','','');

/*Table structure for table `fm_upload` */

DROP TABLE IF EXISTS `fm_upload`;

CREATE TABLE `fm_upload` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `caption` varchar(255) DEFAULT NULL COMMENT '标题描述',
  `size` int(11) DEFAULT NULL COMMENT '大小，单位byte',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `type` varchar(255) DEFAULT NULL COMMENT '文件类型',
  `adddate` timestamp NULL DEFAULT NULL COMMENT '添加日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COMMENT='文件上传';

/*Data for the table `fm_upload` */

insert  into `fm_upload`(`id`,`caption`,`size`,`url`,`type`,`adddate`) values (1,'Penguins.jpg',777835,'upload/image/2016-09-28/57eb54d8f13f1.jpg','image/jpeg','2016-09-28 13:27:52'),(4,'QQ图片20160829093157.jpg',363261,'upload/image/2016-10-09/57f9e1abde2ce.jpg','image/jpeg','2016-10-09 14:20:27'),(6,'域名证书.jpg',134405,'upload/image/2016-10-09/57f9eacac1dcf.jpg','image/jpeg','2016-10-09 14:59:22'),(7,'QQ图片20160922182735.jpg',190589,'upload/image/2016-10-09/57f9ead067b55.jpg','image/jpeg','2016-10-09 14:59:28'),(9,'QQ图片20160829093157.jpg',363261,'upload/image/2016-10-09/57f9eb89621fa.jpg','image/jpeg','2016-10-09 15:02:33'),(10,'creditchina.gif',4160,'upload/image/2016-10-10/57faf7edce59a.gif','image/gif','2016-10-10 10:07:41'),(11,'creditchina.gif',4160,'upload/image/2016-10-10/57faf8486dbac.gif','image/gif','2016-10-10 10:09:12'),(12,'2.jpg',129348,'upload/image/2016-10-10/57fafd5fb2b15.jpg','image/jpeg','2016-10-10 10:30:55'),(13,'786_1953437_112706.jpg',190201,'upload/image/2016-10-10/57fb07d8720ff.jpg','image/jpeg','2016-10-10 11:15:36'),(14,'786_1953437_112706.jpg',181603,'upload/image/2016-10-10/57fb0a3b2e3fa.jpg','image/jpeg','2016-10-10 11:25:47'),(15,'786_1953437_112706.jpg',181603,'upload/image/2016-10-10/57fb0a4e13a9c.jpg','image/jpeg','2016-10-10 11:26:05'),(16,'786_1953430_924910.jpg',192142,'upload/image/2016-10-10/57fb0a4e1aa8a.jpg','image/jpeg','2016-10-10 11:26:05'),(17,'786_1953406_419480.jpg',167439,'upload/image/2016-10-10/57fb0a4e2733c.jpg','image/jpeg','2016-10-10 11:26:05'),(52,'微博视频.mp4',2310129,'upload/file/2016-10-10/57fb54b6d9fe6.mp4','video/mp4','2016-10-10 16:43:34'),(53,'微博视频.mp4',2310129,'upload/video/2016-10-10/57fb5a3b3cd5c.mp4','video/mp4','2016-10-10 17:07:07'),(54,'Koala.jpg',780831,'upload/image/2016-10-10/57fb5cd7d16a0.jpg','image/jpeg','2016-10-10 17:18:15'),(55,'pp.jpg',4245,'upload/image/2016-10-10/57fb5daf7764d.jpg','image/jpeg','2016-10-10 17:21:51'),(56,'logo.jpg',6290,'upload/image/2016-10-10/57fb5dd0b5ee5.jpg','image/jpeg','2016-10-10 17:22:24'),(57,'menuline.jpg',323,'upload/image/2016-10-10/57fb5dd0ca82a.jpg','image/jpeg','2016-10-10 17:22:24'),(58,'logo.jpg',6290,'upload/image/2016-10-10/57fb5defd0ef4.jpg','image/jpeg','2016-10-10 17:22:55'),(59,'pp.jpg',4245,'upload/image/2016-10-10/57fb5df004189.jpg','image/jpeg','2016-10-10 17:22:55'),(60,'微博视频.mp4',2310129,'upload/video/2016-10-10/57fb5e00d52dd.mp4','video/mp4','2016-10-10 17:23:12'),(61,'公流程及材料.docx',363373,'upload/file/2016-10-10/57fb5e0f02f2e.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document','2016-10-10 17:23:26'),(62,'目标设定及考核表-20160929.xlsx',52030,'upload/file/2016-10-10/57fb5e0f2fe42.xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','2016-10-10 17:23:26'),(63,'user1.png',7593,'upload/image/2016-10-10/57fb635a2b3ad.png','image/png','2016-10-10 17:46:01'),(64,'ueditor涂鸦',6328,'upload/scrawl/2016-10-11/57fc43d453aa1.jpg','image/jpeg','2016-10-11 09:43:38'),(65,'ueditor涂鸦',3909,'upload/scrawl/2016-10-11/57fc44627364f.jpg','image/jpeg','2016-10-11 09:46:06'),(66,'ueditor涂鸦',6473,'upload/scrawl/2016-10-11/57fc4671a5a8d.png','image/png','2016-10-11 09:54:57'),(67,'ueditor涂鸦',150631,'upload/scrawl/2016-10-11/57fc4b018c19a.png','image/png','2016-10-11 10:14:25'),(68,'关于IT的解释.doc',16384,'upload/file/2016-10-14/5800538115b72.doc','application/msword','2016-10-14 11:39:45');

/*Table structure for table `fm_user` */

DROP TABLE IF EXISTS `fm_user`;

CREATE TABLE `fm_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `is_root` tinyint(1) DEFAULT '0' COMMENT '是否是超级管理员，1-是  0-否',
  `rule` text COMMENT '权限列表',
  `mail` varchar(100) DEFAULT NULL COMMENT '邮箱地址',
  `name` varchar(100) DEFAULT NULL COMMENT '姓名',
  `sex` enum('0','1') DEFAULT NULL COMMENT '性别，1-男 0-女',
  `phone` varchar(50) DEFAULT NULL COMMENT '电话号码',
  `caption` text COMMENT '介绍',
  `status` tinyint(1) DEFAULT '1' COMMENT '用户状态，1-正常 0-禁止',
  `hits` int(11) DEFAULT '0' COMMENT '登录次数',
  `adddate` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `last_logindate` timestamp NULL DEFAULT NULL COMMENT '最后登录时间',
  `pic` int(11) DEFAULT NULL COMMENT '头像id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='用户';

/*Data for the table `fm_user` */

insert  into `fm_user`(`id`,`username`,`password`,`is_root`,`rule`,`mail`,`name`,`sex`,`phone`,`caption`,`status`,`hits`,`adddate`,`last_logindate`,`pic`) values (2,'superadmin','31d78dc3604d75429d5684e5b6f1f442',1,NULL,'490702087@qq.com','度月飞天','1','15151510866','初始用户',1,58,'2016-09-21 12:04:59','2017-02-27 15:14:13',63),(3,'admin','21232f297a57a5a743894a0e4a801fc3',0,'1,3,5','46548@qq.com','庆哥','1','15151510866','新加测试用户',1,1,'2016-09-23 14:08:48','2016-09-23 17:35:01',0);

/*Table structure for table `fm_video` */

DROP TABLE IF EXISTS `fm_video`;

CREATE TABLE `fm_video` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `classid` int(11) DEFAULT NULL COMMENT '所属类别',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `caption` text COMMENT '概要',
  `content` text COMMENT '内容',
  `video` int(11) DEFAULT NULL COMMENT '文件ID',
  `author` varchar(255) DEFAULT NULL COMMENT '作者',
  `order_num` int(11) DEFAULT '99999' COMMENT '排序',
  `hits` int(11) DEFAULT '0' COMMENT '阅读次数',
  `is_recommend` tinyint(1) DEFAULT '0' COMMENT '是否推荐',
  `is_pass` tinyint(1) DEFAULT '1' COMMENT '是否显示',
  `adddate` timestamp NULL DEFAULT NULL COMMENT '添加日期',
  `last_update` timestamp NULL DEFAULT NULL COMMENT '最后一次修改日期',
  `keywords` text COMMENT 'SEO-页面关键词',
  `description` text COMMENT 'SEO-页面描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='视频系统';

/*Data for the table `fm_video` */

insert  into `fm_video`(`id`,`classid`,`title`,`caption`,`content`,`video`,`author`,`order_num`,`hits`,`is_recommend`,`is_pass`,`adddate`,`last_update`,`keywords`,`description`) values (1,1,'美美哒','','',52,'',99999,0,0,1,'2016-10-10 16:45:15','2016-10-10 16:45:15','','');

/*Table structure for table `fm_video_category` */

DROP TABLE IF EXISTS `fm_video_category`;

CREATE TABLE `fm_video_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '菜单名称',
  `pid` int(20) NOT NULL COMMENT '父类ID',
  `icon` varchar(100) DEFAULT NULL COMMENT 'icon图标',
  `pic` int(11) DEFAULT NULL COMMENT '栏目图片ID',
  `caption` text COMMENT '栏目概要',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'SEO-页面关键词',
  `description` text COMMENT 'SEO-页面描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='视频分类';

/*Data for the table `fm_video_category` */

insert  into `fm_video_category`(`id`,`name`,`pid`,`icon`,`pic`,`caption`,`keywords`,`description`) values (1,'操作视频',0,'',0,'','',''),(2,'企业形象',0,'',0,'','','');

/*Table structure for table `fm_vote` */

DROP TABLE IF EXISTS `fm_vote`;

CREATE TABLE `fm_vote` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `votes` int(10) DEFAULT '0' COMMENT '票数',
  `order_num` int(11) DEFAULT '99999' COMMENT '排序',
  `is_pass` tinyint(1) DEFAULT '1' COMMENT '是否显示',
  `adddate` timestamp NULL DEFAULT NULL COMMENT '添加日期',
  `last_update` timestamp NULL DEFAULT NULL COMMENT '最后一次修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COMMENT='投票系统';

/*Data for the table `fm_vote` */

insert  into `fm_vote`(`id`,`title`,`votes`,`order_num`,`is_pass`,`adddate`,`last_update`) values (59,'百度',6,99999,1,'0000-00-00 00:00:00','2017-02-27 17:05:39'),(60,'谷歌',23,99999,1,'2017-02-27 16:16:49','2017-02-27 16:16:49'),(61,'360搜索',5,99999,1,'2017-02-27 16:18:11','2017-02-27 16:18:11');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
