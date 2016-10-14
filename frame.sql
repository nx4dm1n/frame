/*
SQLyog Ultimate v11.25 (64 bit)
MySQL - 5.5.50-0ubuntu0.14.04.1 : Database - frame
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

/*Table structure for table `fm_article` */

DROP TABLE IF EXISTS `fm_article`;

CREATE TABLE `fm_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='文章系统';

/*Data for the table `fm_article` */

insert  into `fm_article`(`id`,`classid`,`title`,`caption`,`content`,`pic`,`pic_list`,`author`,`order_num`,`hits`,`is_recommend`,`is_pass`,`adddate`,`last_update`,`keywords`,`description`) values (1,2,'北京将压缩市属高校京外招生 支持高校向津冀疏解','','<p style=\"margin: 0px 3px 15px; padding: 0px; list-style: none; font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 30px;\">市教委相关负责人介绍，北京力争在“十三五”期间实现学前三年毛入园率巩固在95%，义务教育毛入学率不低于100%，高中阶段教育毛入学率超过99%，高等教育毛入学率超过60%，新增劳动力平均受教育年限超过15年，主要劳动年龄人口受过高等教育的比例超过48%，从业人员继续教育年参与率达到80%。</p><p style=\"margin: 0px 3px 15px; padding: 0px; list-style: none; font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 30px;\">同时，让基本公共教育服务更加公平，“公共教育资源配置更加均衡，区域、校际差距进一步缩小”，该负责人说，会保证受教育权利依法平等享有。</p><p style=\"margin: 0px 3px 15px; padding: 0px; list-style: none; font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 30px;\">而按照确保公平和就近入学原则，逐步科学划定每所义务教育学校片区范围，到2020年，所有公办学校实现就近入学，并逐步实施12年免费基础教育。同时家庭经济困难群体资助全覆盖制度更加完善，残疾儿童接受义务教育的需求全面满足。来京务工人员随迁子女接受义务教育的保障机制也会更加健全，据了解“五证”仍将为入学审核的必备条件。</p><p style=\"margin: 0px 3px 15px; padding: 0px; list-style: none; font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 30px;\">在学科改革方面，该负责人说，将采取更加灵活多样的人才培养模式，全面深化基础教育课程改革，同时还会让职业教育与普通教育相互渗透，高等学校实现分类发展。</p><p><br/></p>',NULL,'','',99999,11,0,1,'0000-00-00 00:00:00','2016-09-28 17:02:18','',''),(2,2,'四川18岁黑客盗卖徐玉玉电话信息 系电脑天才','','<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; line-height: 30px; font-family: SimSun; color: rgb(43, 43, 43); white-space: normal; overflow: visible !important;\">今年8月19日，一个诈骗电话骗走了山东临沂准大学生徐玉玉全部学费9900元，也带走了这个18岁女孩的年轻生命。随后，在公安部统一指挥下，涉案的8名犯罪嫌疑人悉数归案。</p><p style=\"margin: 23px auto 0px; padding: 0px; list-style: none; line-height: 30px; font-family: SimSun; color: rgb(43, 43, 43); white-space: normal; overflow: visible !important;\">　　成都商报记者采访了解到，此次精准诈骗案中至关重要的“个人信息泄露”环节，竟然出自一个同样只有18岁的四川宜宾少年杜天禹之手。目前，网名叫“法师”的黑客杜天禹已被警方在成都抓获，案件还在进一步侦办之中。</p><p style=\"margin: 23px auto 0px; padding: 0px; list-style: none; line-height: 30px; font-family: SimSun; color: rgb(43, 43, 43); white-space: normal; overflow: visible !important;\">　　26日，杜天禹的母亲告诉成都商报记者，她已赶到山东临沂，但至今没有见到杜天禹。杜母说，儿子一直对电脑着迷，读到初二就辍学，后来到电脑学校培训，17岁到北京中关村应聘参加工作。对于儿子的成长，杜母承认，家里几乎没有对他进行法律方面的教育。</p><p><br/></p>',NULL,'','',100004,0,0,1,'0000-00-00 00:00:00','2016-09-29 16:14:03','',''),(3,2,'北京7日无理由退货征民意:拆封商品也可退货','','<p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">中新网北京9月28日电（记者 李金磊）网购一族注意了！国家工商总局27日对外公布《网络购买商品七日无理由退货实施办法（征求意见稿）》，向社会公开征求意见。根据征求意见稿，七类商品不适用或不宜适用无理由退货，拆封、调试不影响商品完好，退货时应当将赠品一并退回，退货运费由消费者承担……诸多细则关系着消费者和商家的利益，如果你有意见，可在10月11日前提出。</p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>哪些商品不适用无理由退货？</strong></p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>——明确七类范围 避免商家扩大解释</strong></p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">《消费者权益保护法》规定了四类商品不适用无理由退货，包括：<strong>消费者定作的商品；鲜活易腐的商品；在线下载或者消费者拆封的音像制品、计算机软件等数字化商品；交付的报纸、期刊。</strong>同时规定其他根据商品性质并经消费者在购买时确认不宜退货的商品，不适用无理由退货。</p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">中新网（微信公众号：cns2012）记者注意到，实践中，经营者和消费者关于哪些“其他”商品能够适用无理由退货存在不同理解，一些经营者甚至对不适用无理由退货的商品类型进行扩大解释，一定程度上架空了无理由退货制度，往往导致消费争议发生。</p><p><br/></p>',NULL,'','',99988,4,0,1,'0000-00-00 00:00:00','2016-10-09 15:33:05','',''),(4,2,'北京：将加大中小套型普通商品住房用地供应','','<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; line-height: 30px; font-family: SimSun; color: rgb(43, 43, 43); white-space: normal; overflow: visible !important;\">网讯 记者29日从北京市规划和国土资源管理委员会获悉，下一步，北京市土地交易市场将继续加大自住型商品住房以及中小套型普通商品住房用地的供应，在增加刚需商品住宅有效供应的同时，兼顾满足改善性住宅需求。</p><p style=\"margin: 23px auto 0px; padding: 0px; list-style: none; line-height: 30px; font-family: SimSun; color: rgb(43, 43, 43); white-space: normal; overflow: visible !important;\">　　9月29日，北京市土地交易市场发布了5宗住宅用地的出让公告，共涉及土地面积约34.9公顷，规划建筑规模约71.1万平方米。</p><p style=\"margin: 23px auto 0px; padding: 0px; list-style: none; line-height: 30px; font-family: SimSun; color: rgb(43, 43, 43); white-space: normal; overflow: visible !important;\">　　位于海淀区西北旺镇永丰产业基地（新）内的地块有4宗，共涉及土地面积约29.7公顷，规划建筑规模约57</p><p><br/></p>',NULL,'','',99999,0,0,1,'0000-00-00 00:00:00','2016-09-29 17:53:14','',''),(8,16,'中国游客入境济州岛时常受阻 衣衫不整也成原因','','<p><span style=\"font-family: 宋体, sans-serif; text-indent: 32px; background-color: rgb(255, 255, 255);\">有媒体报道，“十一”黄金周期间发生了上百名中国游客在济州岛入境遭拒，并滞留机场事件。记者8日从中国驻济州总领事馆获悉，拒绝入境的情况有多种原因，领馆一直在与当地出入境管理部门进行沟通。</span></p>',6,'7,9','',99999,0,1,1,'0000-00-00 00:00:00','2016-10-09 15:02:35','',''),(9,2,'北京将压缩市属高校京外招生 支持高校向津冀疏解','','<p style=\"margin: 0px 3px 15px; padding: 0px; list-style: none; font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 30px;\">市教委相关负责人介绍，北京力争在“十三五”期间实现学前三年毛入园率巩固在95%，义务教育毛入学率不低于100%，高中阶段教育毛入学率超过99%，高等教育毛入学率超过60%，新增劳动力平均受教育年限超过15年，主要劳动年龄人口受过高等教育的比例超过48%，从业人员继续教育年参与率达到80%。</p><p style=\"margin: 0px 3px 15px; padding: 0px; list-style: none; font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 30px;\">同时，让基本公共教育服务更加公平，“公共教育资源配置更加均衡，区域、校际差距进一步缩小”，该负责人说，会保证受教育权利依法平等享有。</p><p style=\"margin: 0px 3px 15px; padding: 0px; list-style: none; font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 30px;\">而按照确保公平和就近入学原则，逐步科学划定每所义务教育学校片区范围，到2020年，所有公办学校实现就近入学，并逐步实施12年免费基础教育。同时家庭经济困难群体资助全覆盖制度更加完善，残疾儿童接受义务教育的需求全面满足。来京务工人员随迁子女接受义务教育的保障机制也会更加健全，据了解“五证”仍将为入学审核的必备条件。</p><p style=\"margin: 0px 3px 15px; padding: 0px; list-style: none; font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 30px;\">在学科改革方面，该负责人说，将采取更加灵活多样的人才培养模式，全面深化基础教育课程改革，同时还会让职业教育与普通教育相互渗透，高等学校实现分类发展。</p><p><br/></p>',NULL,'','',99999,11,0,1,'0000-00-00 00:00:00','2016-09-28 17:02:18','',''),(17,2,'北京将压缩市属高校京外招生 支持高校向津冀疏解','','<p style=\"margin: 0px 3px 15px; padding: 0px; list-style: none; font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 30px;\">市教委相关负责人介绍，北京力争在“十三五”期间实现学前三年毛入园率巩固在95%，义务教育毛入学率不低于100%，高中阶段教育毛入学率超过99%，高等教育毛入学率超过60%，新增劳动力平均受教育年限超过15年，主要劳动年龄人口受过高等教育的比例超过48%，从业人员继续教育年参与率达到80%。</p><p style=\"margin: 0px 3px 15px; padding: 0px; list-style: none; font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 30px;\">同时，让基本公共教育服务更加公平，“公共教育资源配置更加均衡，区域、校际差距进一步缩小”，该负责人说，会保证受教育权利依法平等享有。</p><p style=\"margin: 0px 3px 15px; padding: 0px; list-style: none; font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 30px;\">而按照确保公平和就近入学原则，逐步科学划定每所义务教育学校片区范围，到2020年，所有公办学校实现就近入学，并逐步实施12年免费基础教育。同时家庭经济困难群体资助全覆盖制度更加完善，残疾儿童接受义务教育的需求全面满足。来京务工人员随迁子女接受义务教育的保障机制也会更加健全，据了解“五证”仍将为入学审核的必备条件。</p><p style=\"margin: 0px 3px 15px; padding: 0px; list-style: none; font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 30px;\">在学科改革方面，该负责人说，将采取更加灵活多样的人才培养模式，全面深化基础教育课程改革，同时还会让职业教育与普通教育相互渗透，高等学校实现分类发展。</p><p><br/></p>',NULL,NULL,NULL,99999,0,0,1,NULL,NULL,NULL,NULL),(18,2,'四川18岁黑客盗卖徐玉玉电话信息 系电脑天才','','<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; line-height: 30px; font-family: SimSun; color: rgb(43, 43, 43); white-space: normal; overflow: visible !important;\">今年8月19日，一个诈骗电话骗走了山东临沂准大学生徐玉玉全部学费9900元，也带走了这个18岁女孩的年轻生命。随后，在公安部统一指挥下，涉案的8名犯罪嫌疑人悉数归案。</p><p style=\"margin: 23px auto 0px; padding: 0px; list-style: none; line-height: 30px; font-family: SimSun; color: rgb(43, 43, 43); white-space: normal; overflow: visible !important;\">　　成都商报记者采访了解到，此次精准诈骗案中至关重要的“个人信息泄露”环节，竟然出自一个同样只有18岁的四川宜宾少年杜天禹之手。目前，网名叫“法师”的黑客杜天禹已被警方在成都抓获，案件还在进一步侦办之中。</p><p style=\"margin: 23px auto 0px; padding: 0px; list-style: none; line-height: 30px; font-family: SimSun; color: rgb(43, 43, 43); white-space: normal; overflow: visible !important;\">　　26日，杜天禹的母亲告诉成都商报记者，她已赶到山东临沂，但至今没有见到杜天禹。杜母说，儿子一直对电脑着迷，读到初二就辍学，后来到电脑学校培训，17岁到北京中关村应聘参加工作。对于儿子的成长，杜母承认，家里几乎没有对他进行法律方面的教育。</p><p><br/></p>',NULL,NULL,NULL,99999,0,0,0,NULL,'2016-10-11 13:51:03',NULL,NULL),(19,2,'北京7日无理由退货征民意:拆封商品也可退货','','<p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">中新网北京9月28日电（记者 李金磊）网购一族注意了！国家工商总局27日对外公布《网络购买商品七日无理由退货实施办法（征求意见稿）》，向社会公开征求意见。根据征求意见稿，七类商品不适用或不宜适用无理由退货，拆封、调试不影响商品完好，退货时应当将赠品一并退回，退货运费由消费者承担……诸多细则关系着消费者和商家的利益，如果你有意见，可在10月11日前提出。</p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>哪些商品不适用无理由退货？</strong></p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>——明确七类范围 避免商家扩大解释</strong></p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">《消费者权益保护法》规定了四类商品不适用无理由退货，包括：<strong>消费者定作的商品；鲜活易腐的商品；在线下载或者消费者拆封的音像制品、计算机软件等数字化商品；交付的报纸、期刊。</strong>同时规定其他根据商品性质并经消费者在购买时确认不宜退货的商品，不适用无理由退货。</p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">中新网（微信公众号：cns2012）记者注意到，实践中，经营者和消费者关于哪些“其他”商品能够适用无理由退货存在不同理解，一些经营者甚至对不适用无理由退货的商品类型进行扩大解释，一定程度上架空了无理由退货制度，往往导致消费争议发生。</p><p><br/></p>',NULL,NULL,NULL,99999,0,0,1,NULL,'2016-10-11 13:51:12',NULL,NULL),(20,2,'北京：将加大中小套型普通商品住房用地供应','','<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; line-height: 30px; font-family: SimSun; color: rgb(43, 43, 43); white-space: normal; overflow: visible !important;\">网讯 记者29日从北京市规划和国土资源管理委员会获悉，下一步，北京市土地交易市场将继续加大自住型商品住房以及中小套型普通商品住房用地的供应，在增加刚需商品住宅有效供应的同时，兼顾满足改善性住宅需求。</p><p style=\"margin: 23px auto 0px; padding: 0px; list-style: none; line-height: 30px; font-family: SimSun; color: rgb(43, 43, 43); white-space: normal; overflow: visible !important;\">　　9月29日，北京市土地交易市场发布了5宗住宅用地的出让公告，共涉及土地面积约34.9公顷，规划建筑规模约71.1万平方米。</p><p style=\"margin: 23px auto 0px; padding: 0px; list-style: none; line-height: 30px; font-family: SimSun; color: rgb(43, 43, 43); white-space: normal; overflow: visible !important;\">　　位于海淀区西北旺镇永丰产业基地（新）内的地块有4宗，共涉及土地面积约29.7公顷，规划建筑规模约57</p><p><br/></p>',NULL,NULL,NULL,99999,0,0,1,NULL,'2016-10-11 13:51:12',NULL,NULL),(24,2,'北京将压缩市属高校京外招生 支持高校向津冀疏解','','<p style=\"margin: 0px 3px 15px; padding: 0px; list-style: none; font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 30px;\">市教委相关负责人介绍，北京力争在“十三五”期间实现学前三年毛入园率巩固在95%，义务教育毛入学率不低于100%，高中阶段教育毛入学率超过99%，高等教育毛入学率超过60%，新增劳动力平均受教育年限超过15年，主要劳动年龄人口受过高等教育的比例超过48%，从业人员继续教育年参与率达到80%。</p><p style=\"margin: 0px 3px 15px; padding: 0px; list-style: none; font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 30px;\">同时，让基本公共教育服务更加公平，“公共教育资源配置更加均衡，区域、校际差距进一步缩小”，该负责人说，会保证受教育权利依法平等享有。</p><p style=\"margin: 0px 3px 15px; padding: 0px; list-style: none; font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 30px;\">而按照确保公平和就近入学原则，逐步科学划定每所义务教育学校片区范围，到2020年，所有公办学校实现就近入学，并逐步实施12年免费基础教育。同时家庭经济困难群体资助全覆盖制度更加完善，残疾儿童接受义务教育的需求全面满足。来京务工人员随迁子女接受义务教育的保障机制也会更加健全，据了解“五证”仍将为入学审核的必备条件。</p><p style=\"margin: 0px 3px 15px; padding: 0px; list-style: none; font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 30px;\">在学科改革方面，该负责人说，将采取更加灵活多样的人才培养模式，全面深化基础教育课程改革，同时还会让职业教育与普通教育相互渗透，高等学校实现分类发展。</p><p><br/></p>',NULL,NULL,NULL,99999,0,0,1,NULL,'2016-10-11 13:51:12',NULL,NULL),(25,2,'四川18岁黑客盗卖徐玉玉电话信息 系电脑天才','','<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; line-height: 30px; font-family: SimSun; color: rgb(43, 43, 43); white-space: normal; overflow: visible !important;\">今年8月19日，一个诈骗电话骗走了山东临沂准大学生徐玉玉全部学费9900元，也带走了这个18岁女孩的年轻生命。随后，在公安部统一指挥下，涉案的8名犯罪嫌疑人悉数归案。</p><p style=\"margin: 23px auto 0px; padding: 0px; list-style: none; line-height: 30px; font-family: SimSun; color: rgb(43, 43, 43); white-space: normal; overflow: visible !important;\">　　成都商报记者采访了解到，此次精准诈骗案中至关重要的“个人信息泄露”环节，竟然出自一个同样只有18岁的四川宜宾少年杜天禹之手。目前，网名叫“法师”的黑客杜天禹已被警方在成都抓获，案件还在进一步侦办之中。</p><p style=\"margin: 23px auto 0px; padding: 0px; list-style: none; line-height: 30px; font-family: SimSun; color: rgb(43, 43, 43); white-space: normal; overflow: visible !important;\">　　26日，杜天禹的母亲告诉成都商报记者，她已赶到山东临沂，但至今没有见到杜天禹。杜母说，儿子一直对电脑着迷，读到初二就辍学，后来到电脑学校培训，17岁到北京中关村应聘参加工作。对于儿子的成长，杜母承认，家里几乎没有对他进行法律方面的教育。</p><p><br/></p>',NULL,NULL,NULL,99999,0,0,1,NULL,'2016-10-11 13:51:12',NULL,NULL),(26,2,'北京7日无理由退货征民意:拆封商品也可退货','','<p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">中新网北京9月28日电（记者 李金磊）网购一族注意了！国家工商总局27日对外公布《网络购买商品七日无理由退货实施办法（征求意见稿）》，向社会公开征求意见。根据征求意见稿，七类商品不适用或不宜适用无理由退货，拆封、调试不影响商品完好，退货时应当将赠品一并退回，退货运费由消费者承担……诸多细则关系着消费者和商家的利益，如果你有意见，可在10月11日前提出。</p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>哪些商品不适用无理由退货？</strong></p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>——明确七类范围 避免商家扩大解释</strong></p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">《消费者权益保护法》规定了四类商品不适用无理由退货，包括：<strong>消费者定作的商品；鲜活易腐的商品；在线下载或者消费者拆封的音像制品、计算机软件等数字化商品；交付的报纸、期刊。</strong>同时规定其他根据商品性质并经消费者在购买时确认不宜退货的商品，不适用无理由退货。</p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">中新网（微信公众号：cns2012）记者注意到，实践中，经营者和消费者关于哪些“其他”商品能够适用无理由退货存在不同理解，一些经营者甚至对不适用无理由退货的商品类型进行扩大解释，一定程度上架空了无理由退货制度，往往导致消费争议发生。</p><p><br/></p>',NULL,NULL,NULL,99999,0,0,1,NULL,'2016-10-11 13:51:12',NULL,NULL),(27,2,'北京：将加大中小套型普通商品住房用地供应','','<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; line-height: 30px; font-family: SimSun; color: rgb(43, 43, 43); white-space: normal; overflow: visible !important;\">网讯 记者29日从北京市规划和国土资源管理委员会获悉，下一步，北京市土地交易市场将继续加大自住型商品住房以及中小套型普通商品住房用地的供应，在增加刚需商品住宅有效供应的同时，兼顾满足改善性住宅需求。</p><p style=\"margin: 23px auto 0px; padding: 0px; list-style: none; line-height: 30px; font-family: SimSun; color: rgb(43, 43, 43); white-space: normal; overflow: visible !important;\">　　9月29日，北京市土地交易市场发布了5宗住宅用地的出让公告，共涉及土地面积约34.9公顷，规划建筑规模约71.1万平方米。</p><p style=\"margin: 23px auto 0px; padding: 0px; list-style: none; line-height: 30px; font-family: SimSun; color: rgb(43, 43, 43); white-space: normal; overflow: visible !important;\">　　位于海淀区西北旺镇永丰产业基地（新）内的地块有4宗，共涉及土地面积约29.7公顷，规划建筑规模约57</p><p><br/></p>',NULL,NULL,NULL,99999,0,0,1,NULL,'2016-10-11 13:51:12',NULL,NULL),(31,2,'北京将压缩市属高校京外招生 支持高校向津冀疏解','','<p style=\"margin: 0px 3px 15px; padding: 0px; list-style: none; font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 30px;\">市教委相关负责人介绍，北京力争在“十三五”期间实现学前三年毛入园率巩固在95%，义务教育毛入学率不低于100%，高中阶段教育毛入学率超过99%，高等教育毛入学率超过60%，新增劳动力平均受教育年限超过15年，主要劳动年龄人口受过高等教育的比例超过48%，从业人员继续教育年参与率达到80%。</p><p style=\"margin: 0px 3px 15px; padding: 0px; list-style: none; font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 30px;\">同时，让基本公共教育服务更加公平，“公共教育资源配置更加均衡，区域、校际差距进一步缩小”，该负责人说，会保证受教育权利依法平等享有。</p><p style=\"margin: 0px 3px 15px; padding: 0px; list-style: none; font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 30px;\">而按照确保公平和就近入学原则，逐步科学划定每所义务教育学校片区范围，到2020年，所有公办学校实现就近入学，并逐步实施12年免费基础教育。同时家庭经济困难群体资助全覆盖制度更加完善，残疾儿童接受义务教育的需求全面满足。来京务工人员随迁子女接受义务教育的保障机制也会更加健全，据了解“五证”仍将为入学审核的必备条件。</p><p style=\"margin: 0px 3px 15px; padding: 0px; list-style: none; font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 30px;\">在学科改革方面，该负责人说，将采取更加灵活多样的人才培养模式，全面深化基础教育课程改革，同时还会让职业教育与普通教育相互渗透，高等学校实现分类发展。</p><p><br/></p>',NULL,NULL,NULL,99999,0,0,1,NULL,'2016-10-11 13:51:12',NULL,NULL),(32,2,'四川18岁黑客盗卖徐玉玉电话信息 系电脑天才','','<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; line-height: 30px; font-family: SimSun; color: rgb(43, 43, 43); white-space: normal; overflow: visible !important;\">今年8月19日，一个诈骗电话骗走了山东临沂准大学生徐玉玉全部学费9900元，也带走了这个18岁女孩的年轻生命。随后，在公安部统一指挥下，涉案的8名犯罪嫌疑人悉数归案。</p><p style=\"margin: 23px auto 0px; padding: 0px; list-style: none; line-height: 30px; font-family: SimSun; color: rgb(43, 43, 43); white-space: normal; overflow: visible !important;\">　　成都商报记者采访了解到，此次精准诈骗案中至关重要的“个人信息泄露”环节，竟然出自一个同样只有18岁的四川宜宾少年杜天禹之手。目前，网名叫“法师”的黑客杜天禹已被警方在成都抓获，案件还在进一步侦办之中。</p><p style=\"margin: 23px auto 0px; padding: 0px; list-style: none; line-height: 30px; font-family: SimSun; color: rgb(43, 43, 43); white-space: normal; overflow: visible !important;\">　　26日，杜天禹的母亲告诉成都商报记者，她已赶到山东临沂，但至今没有见到杜天禹。杜母说，儿子一直对电脑着迷，读到初二就辍学，后来到电脑学校培训，17岁到北京中关村应聘参加工作。对于儿子的成长，杜母承认，家里几乎没有对他进行法律方面的教育。</p><p><br/></p>',NULL,NULL,NULL,99999,0,0,1,NULL,'2016-10-11 13:51:12',NULL,NULL),(33,2,'北京7日无理由退货征民意:拆封商品也可退货','','<p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">中新网北京9月28日电（记者 李金磊）网购一族注意了！国家工商总局27日对外公布《网络购买商品七日无理由退货实施办法（征求意见稿）》，向社会公开征求意见。根据征求意见稿，七类商品不适用或不宜适用无理由退货，拆封、调试不影响商品完好，退货时应当将赠品一并退回，退货运费由消费者承担……诸多细则关系着消费者和商家的利益，如果你有意见，可在10月11日前提出。</p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>哪些商品不适用无理由退货？</strong></p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>——明确七类范围 避免商家扩大解释</strong></p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">《消费者权益保护法》规定了四类商品不适用无理由退货，包括：<strong>消费者定作的商品；鲜活易腐的商品；在线下载或者消费者拆封的音像制品、计算机软件等数字化商品；交付的报纸、期刊。</strong>同时规定其他根据商品性质并经消费者在购买时确认不宜退货的商品，不适用无理由退货。</p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">中新网（微信公众号：cns2012）记者注意到，实践中，经营者和消费者关于哪些“其他”商品能够适用无理由退货存在不同理解，一些经营者甚至对不适用无理由退货的商品类型进行扩大解释，一定程度上架空了无理由退货制度，往往导致消费争议发生。</p><p><br/></p>',NULL,NULL,NULL,99999,0,0,1,NULL,'2016-10-11 13:51:12',NULL,NULL),(34,2,'北京：将加大中小套型普通商品住房用地供应','','<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; line-height: 30px; font-family: SimSun; color: rgb(43, 43, 43); white-space: normal; overflow: visible !important;\">网讯 记者29日从北京市规划和国土资源管理委员会获悉，下一步，北京市土地交易市场将继续加大自住型商品住房以及中小套型普通商品住房用地的供应，在增加刚需商品住宅有效供应的同时，兼顾满足改善性住宅需求。</p><p style=\"margin: 23px auto 0px; padding: 0px; list-style: none; line-height: 30px; font-family: SimSun; color: rgb(43, 43, 43); white-space: normal; overflow: visible !important;\">　　9月29日，北京市土地交易市场发布了5宗住宅用地的出让公告，共涉及土地面积约34.9公顷，规划建筑规模约71.1万平方米。</p><p style=\"margin: 23px auto 0px; padding: 0px; list-style: none; line-height: 30px; font-family: SimSun; color: rgb(43, 43, 43); white-space: normal; overflow: visible !important;\">　　位于海淀区西北旺镇永丰产业基地（新）内的地块有4宗，共涉及土地面积约29.7公顷，规划建筑规模约57</p><p><br/></p>',NULL,NULL,NULL,99999,0,0,1,NULL,'2016-10-11 13:51:12',NULL,NULL),(38,2,'北京将压缩市属高校京外招生 支持高校向津冀疏解','','<p style=\"margin: 0px 3px 15px; padding: 0px; list-style: none; font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 30px;\">市教委相关负责人介绍，北京力争在“十三五”期间实现学前三年毛入园率巩固在95%，义务教育毛入学率不低于100%，高中阶段教育毛入学率超过99%，高等教育毛入学率超过60%，新增劳动力平均受教育年限超过15年，主要劳动年龄人口受过高等教育的比例超过48%，从业人员继续教育年参与率达到80%。</p><p style=\"margin: 0px 3px 15px; padding: 0px; list-style: none; font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 30px;\">同时，让基本公共教育服务更加公平，“公共教育资源配置更加均衡，区域、校际差距进一步缩小”，该负责人说，会保证受教育权利依法平等享有。</p><p style=\"margin: 0px 3px 15px; padding: 0px; list-style: none; font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 30px;\">而按照确保公平和就近入学原则，逐步科学划定每所义务教育学校片区范围，到2020年，所有公办学校实现就近入学，并逐步实施12年免费基础教育。同时家庭经济困难群体资助全覆盖制度更加完善，残疾儿童接受义务教育的需求全面满足。来京务工人员随迁子女接受义务教育的保障机制也会更加健全，据了解“五证”仍将为入学审核的必备条件。</p><p style=\"margin: 0px 3px 15px; padding: 0px; list-style: none; font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 30px;\">在学科改革方面，该负责人说，将采取更加灵活多样的人才培养模式，全面深化基础教育课程改革，同时还会让职业教育与普通教育相互渗透，高等学校实现分类发展。</p><p><br/></p>',NULL,NULL,NULL,99999,0,0,1,NULL,'2016-10-11 13:51:12',NULL,NULL),(39,2,'四川18岁黑客盗卖徐玉玉电话信息 系电脑天才','','<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; line-height: 30px; font-family: SimSun; color: rgb(43, 43, 43); white-space: normal; overflow: visible !important;\">今年8月19日，一个诈骗电话骗走了山东临沂准大学生徐玉玉全部学费9900元，也带走了这个18岁女孩的年轻生命。随后，在公安部统一指挥下，涉案的8名犯罪嫌疑人悉数归案。</p><p style=\"margin: 23px auto 0px; padding: 0px; list-style: none; line-height: 30px; font-family: SimSun; color: rgb(43, 43, 43); white-space: normal; overflow: visible !important;\">　　成都商报记者采访了解到，此次精准诈骗案中至关重要的“个人信息泄露”环节，竟然出自一个同样只有18岁的四川宜宾少年杜天禹之手。目前，网名叫“法师”的黑客杜天禹已被警方在成都抓获，案件还在进一步侦办之中。</p><p style=\"margin: 23px auto 0px; padding: 0px; list-style: none; line-height: 30px; font-family: SimSun; color: rgb(43, 43, 43); white-space: normal; overflow: visible !important;\">　　26日，杜天禹的母亲告诉成都商报记者，她已赶到山东临沂，但至今没有见到杜天禹。杜母说，儿子一直对电脑着迷，读到初二就辍学，后来到电脑学校培训，17岁到北京中关村应聘参加工作。对于儿子的成长，杜母承认，家里几乎没有对他进行法律方面的教育。</p><p><br/></p>',NULL,NULL,NULL,99999,0,0,1,NULL,'2016-10-11 13:51:12',NULL,NULL),(40,2,'北京7日无理由退货征民意:拆封商品也可退货','','<p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">中新网北京9月28日电（记者 李金磊）网购一族注意了！国家工商总局27日对外公布《网络购买商品七日无理由退货实施办法（征求意见稿）》，向社会公开征求意见。根据征求意见稿，七类商品不适用或不宜适用无理由退货，拆封、调试不影响商品完好，退货时应当将赠品一并退回，退货运费由消费者承担……诸多细则关系着消费者和商家的利益，如果你有意见，可在10月11日前提出。</p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>哪些商品不适用无理由退货？</strong></p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>——明确七类范围 避免商家扩大解释</strong></p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">《消费者权益保护法》规定了四类商品不适用无理由退货，包括：<strong>消费者定作的商品；鲜活易腐的商品；在线下载或者消费者拆封的音像制品、计算机软件等数字化商品；交付的报纸、期刊。</strong>同时规定其他根据商品性质并经消费者在购买时确认不宜退货的商品，不适用无理由退货。</p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">中新网（微信公众号：cns2012）记者注意到，实践中，经营者和消费者关于哪些“其他”商品能够适用无理由退货存在不同理解，一些经营者甚至对不适用无理由退货的商品类型进行扩大解释，一定程度上架空了无理由退货制度，往往导致消费争议发生。</p><p><br/></p>',NULL,NULL,NULL,99999,0,0,1,NULL,'2016-10-11 13:51:12',NULL,NULL),(41,2,'北京：将加大中小套型普通商品住房用地供应','','<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; line-height: 30px; font-family: SimSun; color: rgb(43, 43, 43); white-space: normal; overflow: visible !important;\">网讯 记者29日从北京市规划和国土资源管理委员会获悉，下一步，北京市土地交易市场将继续加大自住型商品住房以及中小套型普通商品住房用地的供应，在增加刚需商品住宅有效供应的同时，兼顾满足改善性住宅需求。</p><p style=\"margin: 23px auto 0px; padding: 0px; list-style: none; line-height: 30px; font-family: SimSun; color: rgb(43, 43, 43); white-space: normal; overflow: visible !important;\">　　9月29日，北京市土地交易市场发布了5宗住宅用地的出让公告，共涉及土地面积约34.9公顷，规划建筑规模约71.1万平方米。</p><p style=\"margin: 23px auto 0px; padding: 0px; list-style: none; line-height: 30px; font-family: SimSun; color: rgb(43, 43, 43); white-space: normal; overflow: visible !important;\">　　位于海淀区西北旺镇永丰产业基地（新）内的地块有4宗，共涉及土地面积约29.7公顷，规划建筑规模约57</p><p><br/></p>',NULL,NULL,NULL,99999,0,0,1,NULL,'2016-10-11 13:51:12',NULL,NULL),(45,2,'北京将压缩市属高校京外招生 支持高校向津冀疏解','','<p style=\"margin: 0px 3px 15px; padding: 0px; list-style: none; font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 30px;\">市教委相关负责人介绍，北京力争在“十三五”期间实现学前三年毛入园率巩固在95%，义务教育毛入学率不低于100%，高中阶段教育毛入学率超过99%，高等教育毛入学率超过60%，新增劳动力平均受教育年限超过15年，主要劳动年龄人口受过高等教育的比例超过48%，从业人员继续教育年参与率达到80%。</p><p style=\"margin: 0px 3px 15px; padding: 0px; list-style: none; font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 30px;\">同时，让基本公共教育服务更加公平，“公共教育资源配置更加均衡，区域、校际差距进一步缩小”，该负责人说，会保证受教育权利依法平等享有。</p><p style=\"margin: 0px 3px 15px; padding: 0px; list-style: none; font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 30px;\">而按照确保公平和就近入学原则，逐步科学划定每所义务教育学校片区范围，到2020年，所有公办学校实现就近入学，并逐步实施12年免费基础教育。同时家庭经济困难群体资助全覆盖制度更加完善，残疾儿童接受义务教育的需求全面满足。来京务工人员随迁子女接受义务教育的保障机制也会更加健全，据了解“五证”仍将为入学审核的必备条件。</p><p style=\"margin: 0px 3px 15px; padding: 0px; list-style: none; font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 30px;\">在学科改革方面，该负责人说，将采取更加灵活多样的人才培养模式，全面深化基础教育课程改革，同时还会让职业教育与普通教育相互渗透，高等学校实现分类发展。</p><p><br/></p>',NULL,NULL,NULL,99999,0,0,1,NULL,'2016-10-11 13:51:12',NULL,NULL),(46,2,'四川18岁黑客盗卖徐玉玉电话信息 系电脑天才','','<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; line-height: 30px; font-family: SimSun; color: rgb(43, 43, 43); white-space: normal; overflow: visible !important;\">今年8月19日，一个诈骗电话骗走了山东临沂准大学生徐玉玉全部学费9900元，也带走了这个18岁女孩的年轻生命。随后，在公安部统一指挥下，涉案的8名犯罪嫌疑人悉数归案。</p><p style=\"margin: 23px auto 0px; padding: 0px; list-style: none; line-height: 30px; font-family: SimSun; color: rgb(43, 43, 43); white-space: normal; overflow: visible !important;\">　　成都商报记者采访了解到，此次精准诈骗案中至关重要的“个人信息泄露”环节，竟然出自一个同样只有18岁的四川宜宾少年杜天禹之手。目前，网名叫“法师”的黑客杜天禹已被警方在成都抓获，案件还在进一步侦办之中。</p><p style=\"margin: 23px auto 0px; padding: 0px; list-style: none; line-height: 30px; font-family: SimSun; color: rgb(43, 43, 43); white-space: normal; overflow: visible !important;\">　　26日，杜天禹的母亲告诉成都商报记者，她已赶到山东临沂，但至今没有见到杜天禹。杜母说，儿子一直对电脑着迷，读到初二就辍学，后来到电脑学校培训，17岁到北京中关村应聘参加工作。对于儿子的成长，杜母承认，家里几乎没有对他进行法律方面的教育。</p><p><br/></p>',NULL,NULL,NULL,99999,0,0,1,NULL,'2016-10-11 13:51:12',NULL,NULL),(47,2,'北京7日无理由退货征民意:拆封商品也可退货','','<p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">中新网北京9月28日电（记者 李金磊）网购一族注意了！国家工商总局27日对外公布《网络购买商品七日无理由退货实施办法（征求意见稿）》，向社会公开征求意见。根据征求意见稿，七类商品不适用或不宜适用无理由退货，拆封、调试不影响商品完好，退货时应当将赠品一并退回，退货运费由消费者承担……诸多细则关系着消费者和商家的利益，如果你有意见，可在10月11日前提出。</p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>哪些商品不适用无理由退货？</strong></p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>——明确七类范围 避免商家扩大解释</strong></p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">《消费者权益保护法》规定了四类商品不适用无理由退货，包括：<strong>消费者定作的商品；鲜活易腐的商品；在线下载或者消费者拆封的音像制品、计算机软件等数字化商品；交付的报纸、期刊。</strong>同时规定其他根据商品性质并经消费者在购买时确认不宜退货的商品，不适用无理由退货。</p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">中新网（微信公众号：cns2012）记者注意到，实践中，经营者和消费者关于哪些“其他”商品能够适用无理由退货存在不同理解，一些经营者甚至对不适用无理由退货的商品类型进行扩大解释，一定程度上架空了无理由退货制度，往往导致消费争议发生。</p><p><br/></p>',NULL,NULL,NULL,99999,0,0,1,NULL,'2016-10-11 13:51:12',NULL,NULL),(48,2,'北京：将加大中小套型普通商品住房用地供应','','<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; line-height: 30px; font-family: SimSun; color: rgb(43, 43, 43); white-space: normal; overflow: visible !important;\">网讯 记者29日从北京市规划和国土资源管理委员会获悉，下一步，北京市土地交易市场将继续加大自住型商品住房以及中小套型普通商品住房用地的供应，在增加刚需商品住宅有效供应的同时，兼顾满足改善性住宅需求。</p><p style=\"margin: 23px auto 0px; padding: 0px; list-style: none; line-height: 30px; font-family: SimSun; color: rgb(43, 43, 43); white-space: normal; overflow: visible !important;\">　　9月29日，北京市土地交易市场发布了5宗住宅用地的出让公告，共涉及土地面积约34.9公顷，规划建筑规模约71.1万平方米。</p><p style=\"margin: 23px auto 0px; padding: 0px; list-style: none; line-height: 30px; font-family: SimSun; color: rgb(43, 43, 43); white-space: normal; overflow: visible !important;\">　　位于海淀区西北旺镇永丰产业基地（新）内的地块有4宗，共涉及土地面积约29.7公顷，规划建筑规模约57</p><p><br/></p>',NULL,NULL,NULL,99999,0,1,1,NULL,'2016-10-11 13:51:12',NULL,NULL),(52,2,'北京将压缩市属高校京外招生 支持高校向津冀疏解','','<p style=\"margin: 0px 3px 15px; padding: 0px; list-style: none; font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 30px;\">市教委相关负责人介绍，北京力争在“十三五”期间实现学前三年毛入园率巩固在95%，义务教育毛入学率不低于100%，高中阶段教育毛入学率超过99%，高等教育毛入学率超过60%，新增劳动力平均受教育年限超过15年，主要劳动年龄人口受过高等教育的比例超过48%，从业人员继续教育年参与率达到80%。</p><p style=\"margin: 0px 3px 15px; padding: 0px; list-style: none; font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 30px;\">同时，让基本公共教育服务更加公平，“公共教育资源配置更加均衡，区域、校际差距进一步缩小”，该负责人说，会保证受教育权利依法平等享有。</p><p style=\"margin: 0px 3px 15px; padding: 0px; list-style: none; font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 30px;\">而按照确保公平和就近入学原则，逐步科学划定每所义务教育学校片区范围，到2020年，所有公办学校实现就近入学，并逐步实施12年免费基础教育。同时家庭经济困难群体资助全覆盖制度更加完善，残疾儿童接受义务教育的需求全面满足。来京务工人员随迁子女接受义务教育的保障机制也会更加健全，据了解“五证”仍将为入学审核的必备条件。</p><p style=\"margin: 0px 3px 15px; padding: 0px; list-style: none; font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 30px;\">在学科改革方面，该负责人说，将采取更加灵活多样的人才培养模式，全面深化基础教育课程改革，同时还会让职业教育与普通教育相互渗透，高等学校实现分类发展。</p><p><br/></p>',NULL,NULL,NULL,99999,0,1,1,NULL,'2016-10-11 13:51:12',NULL,NULL),(55,2,'北京：将加大中小套型普通商品住房用地供应','','<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; list-style: none; line-height: 30px; font-family: SimSun; color: rgb(43, 43, 43); white-space: normal; overflow: visible !important;\">网讯 记者29日从北京市规划和国土资源管理委员会获悉，下一步，北京市土地交易市场将继续加大自住型商品住房以及中小套型普通商品住房用地的供应，在增加刚需商品住宅有效供应的同时，兼顾满足改善性住宅需求。</p><p style=\"margin: 23px auto 0px; padding: 0px; list-style: none; line-height: 30px; font-family: SimSun; color: rgb(43, 43, 43); white-space: normal; overflow: visible !important;\">　　9月29日，北京市土地交易市场发布了5宗住宅用地的出让公告，共涉及土地面积约34.9公顷，规划建筑规模约71.1万平方米。</p><p style=\"margin: 23px auto 0px; padding: 0px; list-style: none; line-height: 30px; font-family: SimSun; color: rgb(43, 43, 43); white-space: normal; overflow: visible !important;\">　　位于海淀区西北旺镇永丰产业基地（新）内的地块有4宗，共涉及土地面积约29.7公顷，规划建筑规模约57</p><p><br/></p>',NULL,NULL,NULL,99999,0,1,1,NULL,'2016-10-11 13:51:12',NULL,NULL);

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='管理菜单';

/*Data for the table `fm_menu` */

insert  into `fm_menu`(`id`,`name`,`pid`,`url`,`icon`) values (1,'文章系统',0,'','fa fa-share-alt-square'),(3,'栏目管理',1,'admin/article_category/index',''),(5,'文章管理',1,'admin/article/index',''),(17,'数据报表',0,'','fa fa-bar-chart'),(18,'登录报表',17,'admin/chart/user_login',''),(19,'单页系统',0,'','fa fa-file'),(20,'信息管理',19,'admin/page/index/classid/1',''),(22,'公司简介',0,'','fa fa-puzzle-piece'),(23,'信息管理',22,'admin/page/index/classid/2',''),(24,'友情链接',0,'','fa fa-link'),(25,'文字链接',24,'admin/link/index/classid/1',''),(26,'图片链接',24,'admin/link/index/classid/2',''),(27,'广告系统',0,'','fa fa-buysellads'),(28,'首页幻灯广告',27,'admin/ad/index/classid/1',''),(29,'内页Banner',27,'admin/ad/index/classid/2',''),(30,'新闻中心',0,'','fa fa-newspaper-o'),(31,'栏目管理',30,'admin/news_category/index',''),(32,'信息管理',30,'admin/news/index',''),(33,'成功案例',0,'','fa fa-briefcase'),(34,'栏目管理',33,'admin/case_category/index',''),(35,'信息管理',33,'admin/case/index',''),(36,'产品中心',0,'','fa fa-diamond'),(37,'栏目管理',36,'admin/product_category/index',''),(38,'信息管理',36,'admin/product/index',''),(39,'下载中心',0,'','fa fa-download'),(40,'栏目管理',39,'admin/download_category/index',''),(41,'信息管理',39,'admin/download/index',''),(42,'视频展示',0,'','glyphicon glyphicon-facetime-video'),(43,'栏目管理',42,'admin/video_category/index',''),(44,'信息管理',42,'admin/video/index','');

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

insert  into `fm_user`(`id`,`username`,`password`,`is_root`,`rule`,`mail`,`name`,`sex`,`phone`,`caption`,`status`,`hits`,`adddate`,`last_logindate`,`pic`) values (2,'admin','21232f297a57a5a743894a0e4a801fc3',1,NULL,'490702087@qq.com','度月飞天','1','15151510866','初始用户',1,57,'2016-09-21 12:04:59','2016-10-14 11:53:22',63),(3,'qing','834af260d56e6b7b01199548065ac7da',0,'1,3,5','46548@qq.com','庆哥','1','15151510866','新加测试用户',1,1,'2016-09-23 14:08:48','2016-09-23 17:35:01',0),(10,'zhao','77e6789426d131e4d862ecac4c7d0c5d',0,NULL,'','','1','','',1,0,'2016-10-09 14:20:29',NULL,0),(11,'zhao','77e6789426d131e4d862ecac4c7d0c5d',0,NULL,'','','1','','',1,0,'2016-10-09 14:20:51',NULL,4);

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

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
