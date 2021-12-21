/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 8.0.20 : Database - shop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`shop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `shop`;

/*Table structure for table `car` */

DROP TABLE IF EXISTS `car`;

CREATE TABLE `car` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `num` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `total` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

/*Data for the table `car` */

insert  into `car`(`id`,`item_id`,`user_id`,`num`,`price`,`total`) values 
(17,35,9,1,22.50,'22.5'),
(18,35,9,1,22.50,'22.5'),
(19,36,9,1,60.00,'60.0'),
(20,36,9,1,60.00,'60.0'),
(21,36,9,1,60.00,'60.0'),
(61,36,3,1,60.00,'60.0'),
(62,27,3,1,49.41,'49.41'),
(63,28,3,1,59.86,'59.86'),
(64,32,3,2,89.10,'89.1');

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `addTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

insert  into `comment`(`id`,`user_id`,`item_id`,`content`,`addTime`) values 
(7,3,35,'真的很不错','2018-03-20 19:23:03'),
(8,3,28,'真好吃','2018-03-20 19:32:31');

/*Table structure for table `item` */

DROP TABLE IF EXISTS `item`;

CREATE TABLE `item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `scNum` int DEFAULT NULL COMMENT '收藏数',
  `gmNum` int DEFAULT NULL COMMENT '购买数',
  `url1` varchar(255) DEFAULT NULL,
  `url2` varchar(255) DEFAULT NULL,
  `url3` varchar(255) DEFAULT NULL,
  `url4` varchar(255) DEFAULT NULL,
  `url5` varchar(255) DEFAULT NULL,
  `ms` text,
  `pam1` varchar(255) DEFAULT NULL COMMENT '参数1',
  `pam2` varchar(255) DEFAULT NULL COMMENT '参数2',
  `pam3` varchar(255) DEFAULT NULL COMMENT '参数3',
  `val3` varchar(255) DEFAULT NULL COMMENT '值3',
  `val2` varchar(255) DEFAULT NULL COMMENT '值2',
  `val1` varchar(255) DEFAULT NULL COMMENT '值1',
  `type` int DEFAULT NULL,
  `zk` int DEFAULT NULL COMMENT '折扣',
  `category_id_one` int DEFAULT NULL COMMENT '类别id',
  `category_id_two` int DEFAULT NULL COMMENT '类别2级',
  `isDelete` int DEFAULT NULL COMMENT '0否 1是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

/*Data for the table `item` */

insert  into `item`(`id`,`name`,`price`,`scNum`,`gmNum`,`url1`,`url2`,`url3`,`url4`,`url5`,`ms`,`pam1`,`pam2`,`pam3`,`val3`,`val2`,`val1`,`type`,`zk`,`category_id_one`,`category_id_two`,`isDelete`) values 
(27,'山西运城新鲜水果苹果红富士','54.9',2,4,'\\test1_war_exploded\\resource\\ueditor\\upload\\9f0296902c2111e865b6dc2da7582a7aTB19p5HeKuSBuNjSsziXXbq8pXa_!!0-item_pic.jpg_430x430q90.jpg','\\test1_war_exploded\\resource\\ueditor\\upload\\9f030bc02c2111e865b6dc2da7582a7aTB19p5HeKuSBuNjSsziXXbq8pXa_!!0-item_pic.jpg_430x430q90.jpg','\\test1_war_exploded\\resource\\ueditor\\upload\\9f05cae02c2111e865b6dc2da7582a7aTB2GaJWaYArBKNjSZFLXXc_dVXa_!!3320501499.jpg_430x430q90.jpg','\\test1_war_exploded\\resource\\ueditor\\upload\\9f0667202c2111e865b6dc2da7582a7aTB2faFrcFGWBuNjy0FbXXb4sXXa_!!3320501499.jpg_430x430q90.jpg','\\test1_war_exploded\\resource\\ueditor\\upload\\9f06dc502c2111e865b6dc2da7582a7aTB2GaJWaYArBKNjSZFLXXc_dVXa_!!3320501499.jpg_430x430q90.jpg','<p><img src=\"/test1_war_exploded/resource/ueditor/upload/3ca705602c1e11e865b6dc2da7582a7a1.jpg\" title=\"\" alt=\"1.jpg\"/></p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,75,76,0),
(28,'黄河古道安徽砀山红富士 丑苹果 不打蜡，无农药','66.5',1,8,'\\test1_war_exploded\\resource\\ueditor\\upload\\ba329bc02c1e11e865b6dc2da7582a7a811f5031-87ab-4a55-bfd2-3e29a5eb0ad7.jpg','\\test1_war_exploded\\resource\\ueditor\\upload\\ba3310f02c1e11e865b6dc2da7582a7a6431e0f4-1f60-465b-906e-25ea52bd076b.jpg','\\test1_war_exploded\\resource\\ueditor\\upload\\ba3386202c1e11e865b6dc2da7582a7ae13bedb5-c6c1-47f2-8588-5735397f0dea (1).jpg','\\test1_war_exploded\\resource\\ueditor\\upload\\ba33d4402c1e11e865b6dc2da7582a7ae13bedb5-c6c1-47f2-8588-5735397f0dea.jpg','\\test1_war_exploded\\resource\\ueditor\\upload\\ba3449702c1e11e865b6dc2da7582a7ae37c45cf-fcea-4cb1-8b4e-c7ead141c76d.jpg','<p><img src=\"/test1_war_exploded/resource/ueditor/a730e2c02c1e11e865b6dc2da7582a7a1.jpg\" title=\"\" alt=\"1.jpg\"/></p><p><img src=\"/test1_war_exploded/resource/ueditor/a93984002c1e11e865b6dc2da7582a7a2.png\" title=\"\" alt=\"2.png\"/></p><p><br/></p><p><img src=\"/test1_war_exploded/resource/ueditor/upload/ab62cca02c1e11e865b6dc2da7582a7a3.jpg\" title=\"\" alt=\"3.jpg\"/></p><p><img src=\"/test1_war_exploded/resource/ueditor/upload/ad2368602c1e11e865b6dc2da7582a7a4.png\" title=\"\" alt=\"4.png\"/></p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,75,76,0),
(29,'2017山东新鲜红富士苹果','49.9',0,0,'\\test1_war_exploded\\resource\\ueditor\\upload\\2cb2e5102c1f11e865b6dc2da7582a7a5f5bfef1-1183-4c8a-80f5-23a8251422eb.jpg','\\test1_war_exploded\\resource\\ueditor\\upload\\2cb333302c1f11e865b6dc2da7582a7a49e3c13e-5e8c-4c4a-8382-0721d61ae630.jpg','\\test1_war_exploded\\resource\\ueditor\\upload\\2cb3a8602c1f11e865b6dc2da7582a7adbbbca07-7c2d-4ecb-a1e3-097620517400.jpg','\\test1_war_exploded\\resource\\ueditor\\upload\\2cb41d902c1f11e865b6dc2da7582a7ae798f106-7f85-43f8-82d0-7a1918bd5876.jpg','\\test1_war_exploded\\resource\\ueditor\\upload\\2cb46bb02c1f11e865b6dc2da7582a7adbbbca07-7c2d-4ecb-a1e3-097620517400.jpg','<p><img src=\"/test1_war_exploded/resource/ueditor/29418c102c1f11e865b6dc2da7582a7a1.jpg\" title=\"\" alt=\"1.jpg\"/></p><p><img src=\"/test1_war_exploded/resource/ueditor/upload/2bb683b02c1f11e865b6dc2da7582a7a2.jpg\" title=\"\" alt=\"2.jpg\"/></p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,75,76,0),
(30,'陕西新鲜石榴现摘时令水果贵妃大石榴农家特产薄皮酸石榴','85',1,3,'\\test1_war_exploded\\resource\\ueditor\\upload\\d9a752b02c1f11e865b6dc2da7582a7aTB1pC88XOCYBuNkSnaVXXcMsVXa_!!0-item_pic.jpg_430x430q90.jpg','\\test1_war_exploded\\resource\\ueditor\\upload\\d9a7eef02c1f11e865b6dc2da7582a7aTB2dP17arGYBuNjy0FoXXciBFXa_!!2455418594.jpg_430x430q90.jpg','\\test1_war_exploded\\resource\\ueditor\\upload\\d9a864202c1f11e865b6dc2da7582a7aTB2TmdedPgy_uJjSZLeXXaPlFXa_!!2455418594.jpg_430x430q90.jpg','\\test1_war_exploded\\resource\\ueditor\\upload\\d9a8b2402c1f11e865b6dc2da7582a7aTB2dP17arGYBuNjy0FoXXciBFXa_!!2455418594.jpg_430x430q90.jpg','\\test1_war_exploded\\resource\\ueditor\\upload\\d9aad5202c1f11e865b6dc2da7582a7aTB2TmdedPgy_uJjSZLeXXaPlFXa_!!2455418594.jpg_430x430q90.jpg','<p><img src=\"/test1_war_exploded/resource/ueditor/upload/d89212202c1f11e865b6dc2da7582a7aTB2TmdedPgy_uJjSZLeXXaPlFXa_!!2455418594.jpg_430x430q90.jpg\" title=\"\"/></p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,71,72,0),
(31,'【现货】蒙自甜石榴云南特产薄皮 新鲜水果9个装 单果4.5两左右','36',1,0,'\\test1_war_exploded\\resource\\ueditor\\upload\\23dc83f02c2011e865b6dc2da7582a7aTB2A3FzXRLzQeBjSZFoXXc5gFXa_!!2455185564.jpg_430x430q90.jpg','\\test1_war_exploded\\resource\\ueditor\\upload\\23dcf9202c2011e865b6dc2da7582a7aTB2iwNJX8PzQeBjSZPiXXb0TpXa_!!2455185564.jpg_430x430q90.jpg','\\test1_war_exploded\\resource\\ueditor\\upload\\23dd95602c2011e865b6dc2da7582a7aTB2MpRlaqnyQeBjSsplXXaLWVXa_!!2455185564.jpg_430x430q90.jpg','\\test1_war_exploded\\resource\\ueditor\\upload\\23de0a902c2011e865b6dc2da7582a7aTB11gurg63z9KJjy0FmXXXiwXXa_!!0-item_pic.jpg_430x430q90.jpg','\\test1_war_exploded\\resource\\ueditor\\upload\\23de7fc02c2011e865b6dc2da7582a7aTB2MpRlaqnyQeBjSsplXXaLWVXa_!!2455185564.jpg_430x430q90.jpg','<p>品牌名称：<span class=\"J_EbrandLogo\" style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51);\">绿养道</span></p><p class=\"attr-list-hd tm-clear\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 5px 20px; line-height: 22px; color: rgb(153, 153, 153); font-family: tahoma, arial, 微软雅黑, sans-serif; font-size: 12px; font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; widows: 1; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; font-weight: 700; float: left;\">产品参数：</span></p><ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p>厂名：绿养道农产品产销合作社</p></li><li><p>厂址：云南蒙自攀枝村花石榴园</p></li><li><p>厂家联系方式：13521676858</p></li><li><p>保质期：60 天</p></li><li><p>净含量:&nbsp;1900g</p></li><li><p>包装方式:&nbsp;包装</p></li><li><p>品牌:&nbsp;绿养道</p></li><li><p>售卖方式:&nbsp;单品</p></li><li><p>生鲜储存温度:&nbsp;8-15℃</p></li><li><p>热卖时间:&nbsp;1月&nbsp;2月&nbsp;8月&nbsp;9月&nbsp;10月&nbsp;11月&nbsp;12月</p></li><li><p>产地:&nbsp;中国大陆</p></li><li><p>省份:&nbsp;云南省</p></li><li><p>城市:&nbsp;红河哈尼族彝族自治州</p></li><li><p>特产品类:&nbsp;蒙自石榴</p></li><li><p>净含量:&nbsp;2.5kg(含）-5kg(不含)</p></li><li><p>价格:&nbsp;51-100元</p></li></ul><p><br/></p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,71,72,0),
(32,'现货突尼斯软籽石榴2个超大果软子甜酸石榴新鲜水果非蒙自石榴','99',0,10,'\\test1_war_exploded\\resource\\ueditor\\upload\\92cc7a902c2011e865b6dc2da7582a7aTB1a7xUdUR1BeNjy0FmXXb0wVXa_!!0-item_pic.jpg_430x430q90.jpg','\\test1_war_exploded\\resource\\ueditor\\upload\\92ccefc02c2011e865b6dc2da7582a7aTB2GV6ld7fb_uJjSsD4XXaqiFXa_!!3206065077.jpg_430x430q90.jpg','\\test1_war_exploded\\resource\\ueditor\\upload\\92cd8c002c2011e865b6dc2da7582a7aTB2J81_nf2H8KJjy0FcXXaDlFXa_!!3206065077.jpg_430x430q90.jpg','\\test1_war_exploded\\resource\\ueditor\\upload\\92ce01302c2011e865b6dc2da7582a7aTB2oM1InmYH8KJjSspdXXcRgVXa_!!3206065077.jpg_430x430q90.jpg','\\test1_war_exploded\\resource\\ueditor\\upload\\92ce76602c2011e865b6dc2da7582a7aTB29bjrngLD8KJjSszeXXaGRpXa_!!3206065077.jpg_430x430q90.jpg','<p><img src=\"/test1_war_exploded/resource/ueditor/upload/8bbe4bc02c2011e865b6dc2da7582a7a1.jpg\" title=\"\" alt=\"1.jpg\"/><img src=\"/test1_war_exploded/resource/ueditor/upload/8d8947c02c2011e865b6dc2da7582a7a2.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/test1_war_exploded/resource/ueditor/upload/8fd310b02c2011e865b6dc2da7582a7a77.jpg\" title=\"\" alt=\"77.jpg\"/></p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,71,72,0),
(33,'荥阳突尼斯陈氏河阴软籽石榴软子新鲜水果非会理蒙自临潼甜新鲜','80',1,0,'\\test1_war_exploded\\resource\\ueditor\\upload\\dcb3b2e02c2011e865b6dc2da7582a7aTB2VP8VmjuhSKJjSspaXXXFgFXa_!!3363047546.jpg_430x430q90.jpg','\\test1_war_exploded\\resource\\ueditor\\upload\\dcb6e7302c2011e865b6dc2da7582a7aTB2VP8VmjuhSKJjSspaXXXFgFXa_!!3363047546.jpg_430x430q90.jpg','\\test1_war_exploded\\resource\\ueditor\\upload\\dcb75c602c2011e865b6dc2da7582a7aTB2VP8VmjuhSKJjSspaXXXFgFXa_!!3363047546.jpg_430x430q90.jpg','\\test1_war_exploded\\resource\\ueditor\\upload\\dcb7d1902c2011e865b6dc2da7582a7aTB2VP8VmjuhSKJjSspaXXXFgFXa_!!3363047546.jpg_430x430q90.jpg','\\test1_war_exploded\\resource\\ueditor\\upload\\dcb86dd02c2011e865b6dc2da7582a7aTB2VP8VmjuhSKJjSspaXXXFgFXa_!!3363047546.jpg_430x430q90.jpg','<p><img src=\"/test1_war_exploded/resource/ueditor/upload/dbbc33802c2011e865b6dc2da7582a7aTB2VP8VmjuhSKJjSspaXXXFgFXa_!!3363047546.jpg_430x430q90.jpg\" title=\"\" alt=\"TB2VP8VmjuhSKJjSspaXXXFgFXa_!!3363047546.jpg_430x430q90.jpg\"/></p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,71,72,0),
(34,'正宗陕西红心石榴水果新鲜','85',0,4,'\\test1_war_exploded\\resource\\ueditor\\upload\\012eb0202c2111e865b6dc2da7582a7aTB23TvclwoQMeJjy1XaXXcSsFXa_!!3296167834.jpg_430x430q90.jpg','\\test1_war_exploded\\resource\\ueditor\\upload\\012f25502c2111e865b6dc2da7582a7aTB2VP8VmjuhSKJjSspaXXXFgFXa_!!3363047546.jpg_430x430q90.jpg','\\test1_war_exploded\\resource\\ueditor\\upload\\012fc1902c2111e865b6dc2da7582a7aTB23TvclwoQMeJjy1XaXXcSsFXa_!!3296167834.jpg_430x430q90.jpg','\\test1_war_exploded\\resource\\ueditor\\upload\\013036c02c2111e865b6dc2da7582a7aTB2VP8VmjuhSKJjSspaXXXFgFXa_!!3363047546.jpg_430x430q90.jpg','\\test1_war_exploded\\resource\\ueditor\\upload\\0130abf02c2111e865b6dc2da7582a7aTB23TvclwoQMeJjy1XaXXcSsFXa_!!3296167834.jpg_430x430q90.jpg','<p><img src=\"/test1_war_exploded/resource/ueditor/upload/004f73b02c2111e865b6dc2da7582a7aTB23TvclwoQMeJjy1XaXXcSsFXa_!!3296167834.jpg_430x430q90.jpg\" title=\"\" alt=\"TB23TvclwoQMeJjy1XaXXcSsFXa_!!3296167834.jpg_430x430q90.jpg\"/></p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,71,72,0),
(35,'新鲜油桃5斤 新鲜孕妇水果非水蜜桃黄桃毛桃子樱桃当季时令鲜果','25',9,8,'\\test1_war_exploded\\resource\\ueditor\\upload\\4152abc02c2111e865b6dc2da7582a7aTB1sRNzXSMmBKNjSZTEXXasKpXa_!!0-item_pic.jpg_430x430q90.jpg','\\test1_war_exploded\\resource\\ueditor\\upload\\41536f102c2111e865b6dc2da7582a7aTB2d_RhaKuSBuNjy1XcXXcYjFXa_!!2102024380.jpg_430x430q90.jpg','\\test1_war_exploded\\resource\\ueditor\\upload\\41540b502c2111e865b6dc2da7582a7aTB1sRNzXSMmBKNjSZTEXXasKpXa_!!0-item_pic.jpg_430x430q90.jpg','\\test1_war_exploded\\resource\\ueditor\\upload\\415459702c2111e865b6dc2da7582a7aTB2d_RhaKuSBuNjy1XcXXcYjFXa_!!2102024380.jpg_430x430q90.jpg','\\test1_war_exploded\\resource\\ueditor\\upload\\4154cea02c2111e865b6dc2da7582a7aTB1sRNzXSMmBKNjSZTEXXasKpXa_!!0-item_pic.jpg_430x430q90.jpg','<p><img src=\"/test1_war_exploded/resource/ueditor/upload/407173802c2111e865b6dc2da7582a7aTB2d_RhaKuSBuNjy1XcXXcYjFXa_!!2102024380.jpg_430x430q90.jpg\" title=\"\" alt=\"TB2d_RhaKuSBuNjy1XcXXcYjFXa_!!2102024380.jpg_430x430q90.jpg\"/></p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,73,74,0),
(36,'现摘3斤 桃子水蜜桃 新鲜水果包邮脆桃硬桃现货新摘桃子非油桃黄','120',3,3,'\\test1_war_exploded\\resource\\ueditor\\upload\\88b583202c2111e865b6dc2da7582a7aTB2faFrcFGWBuNjy0FbXXb4sXXa_!!3320501499.jpg_430x430q90.jpg','\\test1_war_exploded\\resource\\ueditor\\upload\\88b5f8502c2111e865b6dc2da7582a7aTB2GaJWaYArBKNjSZFLXXc_dVXa_!!3320501499.jpg_430x430q90.jpg','\\test1_war_exploded\\resource\\ueditor\\upload\\88b66d802c2111e865b6dc2da7582a7aTB19p5HeKuSBuNjSsziXXbq8pXa_!!0-item_pic.jpg_430x430q90.jpg','\\test1_war_exploded\\resource\\ueditor\\upload\\88b6e2b02c2111e865b6dc2da7582a7aTB2GaJWaYArBKNjSZFLXXc_dVXa_!!3320501499.jpg_430x430q90.jpg','\\test1_war_exploded\\resource\\ueditor\\upload\\88b77ef02c2111e865b6dc2da7582a7aTB19p5HeKuSBuNjSsziXXbq8pXa_!!0-item_pic.jpg_430x430q90.jpg','<p><img src=\"/test1_war_exploded/resource/ueditor/upload/87d387902c2111e865b6dc2da7582a7aTB2GaJWaYArBKNjSZFLXXc_dVXa_!!3320501499.jpg_430x430q90.jpg\" title=\"\" alt=\"TB2GaJWaYArBKNjSZFLXXc_dVXa_!!3320501499.jpg_430x430q90.jpg\"/></p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,73,74,0),
(37,'小香蕉','6',0,0,'\\test1_war_exploded\\resource\\ueditor\\upload\\d6ee8db07c2e11ebf9e7a302843e35a913.jpg','\\test1_war_exploded\\resource\\ueditor\\upload\\d6ef29f07c2e11ebf9e7a302843e35a9','\\test1_war_exploded\\resource\\ueditor\\upload\\d6ef29f17c2e11ebf9e7a302843e35a9','\\test1_war_exploded\\resource\\ueditor\\upload\\d6ef51007c2e11ebf9e7a302843e35a9','\\test1_war_exploded\\resource\\ueditor\\upload\\d6f19af07c2e11ebf9e7a302843e35a9','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,83,94,1),
(38,'大香蕉','92',0,0,'\\test1_war_exploded\\resource\\ueditor\\upload\\a7d5c8807bfd11eb4eec5dd183e7c61a','\\test1_war_exploded\\resource\\ueditor\\upload\\a7d5ef907bfd11eb4eec5dd183e7c61a','\\test1_war_exploded\\resource\\ueditor\\upload\\a7d5ef917bfd11eb4eec5dd183e7c61a','\\test1_war_exploded\\resource\\ueditor\\upload\\a7d616a07bfd11eb4eec5dd183e7c61a','\\test1_war_exploded\\resource\\ueditor\\upload\\a7d616a17bfd11eb4eec5dd183e7c61a','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,83,94,1);

/*Table structure for table `item_category` */

DROP TABLE IF EXISTS `item_category`;

CREATE TABLE `item_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `pid` int DEFAULT NULL,
  `isDelete` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;

/*Data for the table `item_category` */

insert  into `item_category`(`id`,`name`,`pid`,`isDelete`) values 
(50,' 礼帽',44,1),
(69,'梨子',NULL,0),
(70,'湾里酥梨',69,0),
(71,'石榴',NULL,0),
(72,'肖山御石榴',71,0),
(73,'桃子',NULL,0),
(74,'史德镇御桃',73,0),
(75,'苹果',NULL,0),
(76,'日本红富士',75,0),
(77,'秦冠',75,0),
(78,'嘎拉',75,1),
(79,'黄元帅',75,0),
(80,'菠菜',NULL,0),
(81,'xx',75,0),
(83,'香蕉',NULL,0),
(94,'外国香蕉',83,0),
(95,NULL,NULL,1);

/*Table structure for table `item_order` */

DROP TABLE IF EXISTS `item_order`;

CREATE TABLE `item_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `addTime` datetime DEFAULT NULL,
  `total` varchar(255) DEFAULT NULL,
  `isDelete` int DEFAULT NULL,
  `status` int DEFAULT NULL COMMENT '0.新建代发货1.已取消 2已已发货3.到收货4已评价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

/*Data for the table `item_order` */

insert  into `item_order`(`id`,`item_id`,`user_id`,`code`,`addTime`,`total`,`isDelete`,`status`) values 
(27,NULL,3,'2018032017080001','2018-03-20 17:08:56','54.9',0,0),
(28,NULL,3,'2018032017380001','2018-03-20 17:38:52','653.59',0,3),
(29,NULL,3,'2018032017390001','2018-03-20 17:39:28','976.5',0,3),
(30,NULL,3,'2018032019220001','2018-03-20 19:22:25','364.5',0,3),
(31,NULL,3,'2018032019310001','2018-03-20 19:31:23','359.15999999999997',0,1),
(32,NULL,3,'2018032019310002','2018-03-20 19:31:50','59.86',0,3);

/*Table structure for table `manage` */

DROP TABLE IF EXISTS `manage`;

CREATE TABLE `manage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `realName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `manage` */

insert  into `manage`(`id`,`userName`,`password`,`realName`) values 
(1,'admin','123456','管理员');

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `message` */

insert  into `message`(`id`,`name`,`phone`,`content`) values 
(5,'周易','183',NULL),
(6,'都发的地方','的发放',NULL),
(7,'周易','的撒法发',NULL);

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content` text,
  `addTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `news` */

insert  into `news`(`id`,`name`,`content`,`addTime`) values 
(3,'测试公告','<p><img src=\"/ueditor/8fcd79b049e011e8f60304f21e6bcd90d613e0adcb8ef424fed66f6deea08d99.jpg\" title=\"\" alt=\"d613e0adcb8ef424fed66f6deea08d99.jpg\"/></p>','2018-04-27 14:02:28'),
(4,'测试公告2','<p><img src=\"/ueditor/a83fde2049e011e8f298b03797777b7bd613e0adcb8ef424fed66f6deea08d99.jpg\" title=\"\" alt=\"d613e0adcb8ef424fed66f6deea08d99.jpg\"/></p>','2018-04-27 14:03:09'),
(5,'测试公告3','<p style=\"margin: 10px auto; padding: 0px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Verdana, Arial, sans-serif; font-size: 14px; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 23.8px; white-space: normal; widows: 1; background-color: rgb(255, 255, 255);\">原来是我们自使用类似于Ant来获取类的时候是不能象UserLibaray来使用的,因为我们建立的是一个web app,而web app使用的是自定义的ClassLoader,而非JVM中的存在的三种ClassLoader(如上面所说),因此它无法识别出我们写在xml文件中的第三方类库的class文件,而只有我们写在src目录下的java文件才能使用,因此,我们必须要把第三方的类库放入到lib目录下,web app 才会识别我们定义在xml中的类了 &nbsp;.</p><p style=\"margin: 10px auto; padding: 0px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Verdana, Arial, sans-serif; font-size: 14px; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 23.8px; white-space: normal; widows: 1; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp; 通这个错误,也让我对classloader的认识也进了一步.虽然以前看过周志明的深入JVM一书中关于类加载器分派体系的介绍,但是不太理解,这样一来,自己也多了一些体会.</p><p><br/></p>','2018-04-27 14:03:32'),
(6,'习近平总书记湖北之行第三天','<p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(255, 255, 255);\">新华网北京4月26日电 在24至25日沿长江考察调研后，26日下午，习近平总书记在武汉主持召开了深入推动长江经济带发展座谈会，为长江经济带发展进一步指引方向，作出部署。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(255, 255, 255);\">　　26日上午，习近平前往武汉市的科技企业和居民社区调研，聚焦自主创新、棚户区改造和社区党组织建设。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(255, 255, 255);\">　　这是习近平总书记第二次召开长江经济发展专题座谈会，特意安排在了位于长江中游的湖北。上一次座谈会是2016年1月，在位于长江上游的重庆召开的。“共抓大保护、不搞大开发”的重大战略思想，就是在那次座谈会上提出的。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(255, 255, 255);\">　　在今天的座谈会上，习近平总书记明确提出了推动长江经济带发展需要正确把握的5个关系：</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(255, 255, 255);\">　　◆整体推进和重点突破的关系；</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(255, 255, 255);\">　　◆生态环境保护和经济发展的关系；</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(255, 255, 255);\">　　◆总体谋划和久久为功的关系；</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(255, 255, 255);\">　　◆破除旧动能和培育新动能的关系；</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(255, 255, 255);\">　　◆自身发展和协同发展的关系。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(255, 255, 255);\">　　习近平强调，加强改革创新、战略统筹、规划引导，以长江经济带发展推动经济高质量发展。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(255, 255, 255);\">　　自主创新，是习近平在武汉调研的一个重点课题。</p><p><br/></p>','2018-04-27 14:25:46'),
(7,'大家快来用我的网站啊！',NULL,'2021-03-09 11:33:31');

/*Table structure for table `order_detail` */

DROP TABLE IF EXISTS `order_detail`;

CREATE TABLE `order_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_id` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `status` int DEFAULT NULL COMMENT '0.未退货 1已退货',
  `num` int DEFAULT NULL,
  `total` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

/*Data for the table `order_detail` */

insert  into `order_detail`(`id`,`item_id`,`order_id`,`status`,`num`,`total`) values 
(54,27,27,0,1,'1'),
(55,32,28,0,5,'25'),
(56,27,28,0,3,'9'),
(57,28,28,0,1,'1'),
(58,35,29,0,2,'4'),
(59,34,29,0,4,'16'),
(60,32,29,0,3,'9'),
(61,36,29,0,3,'9'),
(62,32,29,0,2,'4'),
(63,35,30,0,6,'36'),
(64,30,30,0,3,'9'),
(65,28,31,0,4,'16'),
(66,28,31,0,2,'4'),
(67,28,32,0,1,'1');

/*Table structure for table `sc` */

DROP TABLE IF EXISTS `sc`;

CREATE TABLE `sc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

/*Data for the table `sc` */

insert  into `sc`(`id`,`item_id`,`user_id`) values 
(19,27,9),
(20,35,9),
(21,35,9),
(22,35,9),
(23,36,9),
(24,30,9),
(25,35,9),
(26,35,9),
(27,35,9),
(28,35,9),
(29,35,9),
(30,36,9),
(39,36,3),
(40,36,3);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) DEFAULT NULL,
  `passWord` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `realName` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`userName`,`passWord`,`phone`,`realName`,`sex`,`address`,`email`) values 
(1,'1','2','3','4','1','3','22'),
(2,'dd','dd','dd',NULL,NULL,NULL,NULL),
(3,'zs','111111','18379995336','周易','男','江西财经大学（麦庐园）','2643983350@qq.com'),
(6,'huang1','123456','18888888',NULL,NULL,NULL,NULL),
(7,'huang1','123456','18888888',NULL,NULL,NULL,NULL),
(8,'1111112','11','11',NULL,NULL,NULL,'111@qq.com'),
(9,'joy','123456','18379995336','周易','女','none','2643983350@qq.com'),
(10,'erfda','asfsaf','fdaf',NULL,NULL,NULL,'adsfa');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
