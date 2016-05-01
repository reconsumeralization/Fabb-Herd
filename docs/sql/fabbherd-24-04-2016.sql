# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.11)
# Database: fabbherd
# Generation Time: 2016-04-24 17:28:43 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table tbl_cattle
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_cattle`;

CREATE TABLE `tbl_cattle` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `dob` date NOT NULL,
  `category` varchar(15) NOT NULL,
  `height` varchar(10) NOT NULL,
  `description` text NOT NULL,
  `icon` varchar(60) NOT NULL,
  `sire` varchar(100) NOT NULL,
  `dam` varchar(100) NOT NULL,
  `video` varchar(250) NOT NULL,
  `link` varchar(200) NOT NULL,
  `section` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `tbl_cattle` WRITE;
/*!40000 ALTER TABLE `tbl_cattle` DISABLE KEYS */;

INSERT INTO `tbl_cattle` (`id`, `name`, `dob`, `category`, `height`, `description`, `icon`, `sire`, `dam`, `video`, `link`, `section`)
VALUES
	(1,'Moeskaer Alma','2013-03-05','Heifer','','<p>Has 2016 <strong>Square-D Tortuga calf at foot.</strong> Medium sized cow family, with strong fleshy build. Have Great hope for this cow within our herd for the future and will be One of the Polled Hereford Families we will be pushing Forward. A cow that maintains condition very well, has great milk and good breeder.<strong><br /></strong></p>','','Nbg 69t The Wonderer 36R ET 3W','Moeskaer Alma 1201','<iframe width=\"420\" height=\"315\" src=\"//www.youtube.com/embed/ARqOIqJ9kbo?rel=0&start=27&controls=0&showinfo=0\" frameborder=\"0\" allowfullscreen></iframe>','','females'),
	(2,'Moeskaer Donna','2013-04-25','Heifer','','DK069957 01424','','Square-D Diesel 957u','71404-00879','','http://www.square-dpolledherefords.com/herdsires.htm','females'),
	(3,'Moeskaer Flora','2013-05-24','Heifer','','<p>Flora is one of the Strongest and Largest Polled Hereford breeding Families we have. In the Top 1% for 200,400,600 day weight. Top 5% for milk, and again top 1% for Terminal Index and Self Replacing Index. She has a 2016 Bull Calf at foot, sired by our Galaxy Bull. </p>','','Star-Lake Dandy 614r','Moeskaer Flora 1301','','','females'),
	(4,'Moeskaer Kema','2013-06-03','Heifer','','<p>A strong<strong> Barefoot Mr You Tube calf at foot. </strong>Born Jan 2016. <strong><br /></strong></p>','','Moeskaer Salute','Moeskaer Kema 1132-ET','','','females'),
	(5,'Moeskaer Megan','2013-06-07','In Calf Heifer','','<p>In calf to <strong>Square-D Tortuga</strong></p>','','Moeskaer Packer 1354','Moeskaer Megan 1079 ET','','http://moeskaer.com/en/news/8-nyheder/174-square-d-tortuga-953t-ny-insemineringstyr','females'),
	(6,'Princess Family','2012-07-05','Cow','','<p>Princess family will always be a favorite. Great temperament, has a Galaxy Heifer Calf which has taken on all of her Features. This cow was flushed in 2015 with 3 egg being implanted directly into recipients. Again another breeder we will be pushing in the Fabb Herd Polled Herfords for the future.</p>','','Wilgor 55k Northeatern OL 2N','Mhpa Ms 24k Princess 1195N','','','females'),
	(7,'Moeskaer Eudora','2013-04-08','Heifer','','<p>In Calf to <strong>Square-D Tortuga</strong></p>','','Moeskaer Salute 994','Moeskaer Eudora 1253','','http://moeskaer.com/en/news/8-nyheder/174-square-d-tortuga-953t-ny-insemineringstyr','females'),
	(8,'Fabb 1 Popinjay','2013-03-22','In calf Heifer','','<p>Has one our most promising 2016 Bull Calves at foot sired by <strong>Square-D Tortuga. </strong>One of our first Polled Hereford Families, Strong breeder, good Milk.<strong><br /></strong></p>','','Blackwell 1 Hector','Hartshorne 1 Popinjay 19th','','','females'),
	(9,'Fabb 1 Snowdrop','2013-04-05','Herd sires','','<p>Has January 2016 Square-D Tortuga calf at foot<strong>. </strong>A Promising Polled Hereford Prospect for the future. Good strong Breeder with good milk. Has Been a Great Family for us on the Show Circuit. Her Half Sister Fabb 1 Mia, came first in class at the National Hereford Calf Show 2015.<strong><br /></strong></p>','','Blackwell 1 Hector','Hartshorne 1 Snowdrop 26th','','','females'),
	(10,'Fabb 1 Snowdrop 2nd','2013-06-20','Heifer','','<p>Sold to a new Polled Hereford breeder in 2016. Had Classic 1 Galaxy Heifer calf at foot.<strong><br /></strong></p>','','Blackwell 1 Hector','Hartshorne 1 Snowdrop 25th','','','females'),
	(11,'Moeskaer April','2014-03-25','Heifer','','<p>Breed champion at Nottingham County show 2015</p>\r\n<p>Junior champion at Rutland show 2015</p>\r\n<p>Female Champion at Suffolk show 2015</p>','','W11 Global Force','Moeskaer Fanny','','','females'),
	(12,'Moeskaer Fanny 1455','2014-03-11','','','','','Remitall Pilgrim 93P','Moeskaer Fanny 1162','','http://abri.une.edu.au/online/cgi-bin/i4.dll?1=3E372928&2=2420&3=56&5=2B3C2B3C3A&6=27595C262223222E20&9=5A505159','females'),
	(13,'Moeskaer Donna','2014-04-25','','','','','Square-d Tortuga 953T','ABG Moeskaer Donna 879','','http://moeskaer.com/da/component/content/article/171','females'),
	(14,'Moeskaer Pearl','2014-05-10','','','','','Square-d Tortuga 953T','Moeskaer Pearl 1256','','http://moeskaer.com/en/news/8-nyheder/174-square-d-tortuga-953t-ny-insemineringstyr','females'),
	(15,'Moeskaer Beauty','2015-05-08','','','','','Square-d Tortuga 953T','Moeskaer Beauty 1192','','','females'),
	(16,'Moeskaer Keepsake','2015-06-01','','','','','Remitall Pilgrim 93P','Moeskaer Keepsake 1158','','http://moeskaer.com/en/semen-sale/68','females'),
	(17,'Classic 1 Galaxy (P)','2011-01-01','','','<p>A large framed solid bull, with strong feet and dark colour.</p>','','Hawkesbury 1 Mustang (P)','Classic 1 Jodie (P) AI','','','herd-sires'),
	(19,'Square-D Tortuga 953T','2007-03-11','','','','','Wilgor 55K Notheastern OL 2N','Square-D Ameena 753Mu','','','ai-sires'),
	(20,'Wll Global Force 7X','2010-01-07','','','<p><span style=\"font-family: verdana, arial, helvetica; -webkit-text-size-adjust: auto;\">Global Force combines two of the most dominant bloodlines with WLB Global 72M 50S on the top side and FORC 29F Boomer 18L on the bottom side. Both lines are noted for their abilities to provide moderate birth weight with exceptional growth and muscle.</span></p>','','Wlb Global 72M 50S','Corp Creek Stacie 6S','','','ai-sires'),
	(21,'Axa Goldern-Oak Xceed 704X','2010-02-24','','','<ul>\r\n<li style=\"font-family: verdana, arial, helvetica; -webkit-text-size-adjust: auto;\">Xceed provides exceptional balance across the board from birth weight to growth, maternal and carcass.&nbsp;</li>\r\n<li style=\"font-family: verdana, arial, helvetica; -webkit-text-size-adjust: auto;\">His dam is a picture perfect female that continues to produce exceptional offspring at 9 years of age.&nbsp;</li>\r\n<li style=\"font-family: verdana, arial, helvetica; -webkit-text-size-adjust: auto;\">DLF, IEF and HYF</li>\r\n</ul>','','Shf Rib Eye M326 R117','Ncx Miss JR Nellie 528N','http://youtu.be/HTsgRjhpslA','','ai-sires'),
	(22,'Barefoot Mr You Tube 4Y','2011-11-28','','','<ul>\r\n<li>Extreme&nbsp;thickness with meat from end to end, huge hindquarter</li>\r\n</ul>\r\n<ul>\r\n<li>Structural soundness and deep bodied</li>\r\n</ul>\r\n<ul>\r\n<li>Long bodied with perfect feet and legs</li>\r\n</ul>\r\n<ul>\r\n<li>Low birthweight and should be suitable for heifers&nbsp;</li>\r\n</ul>\r\n<ul>\r\n<li>New and fresh pedigree with lots of milk</li>\r\n</ul>','','Ncx Winchester 745W','Ncx Miss Whiplash 3W','','','ai-sires'),
	(23,'Days Calibre G74','2011-05-19','','','<p>He is a bull who was a clear winner in the class. He has a big top and you have to appreciate his balance and eye appeal and when you see him on the move he has a lot of integrity and flexibility.</p>','','Allendale Waterhouse D1 (P)','Allendale Dawn C62 (P)','','','ai-sires'),
	(24,'Crossfire 1474','2016-02-13','','','<p style=\"text-align: left;\">&nbsp;This is an ET calf with a very special pedigree. I doubt there are any other Herefords in Europe with this pedigree. His dam has won many shows in Canada and is a phenomenal female. Sire of the bull is the american sire TDP Crossover.&nbsp;His weight at 12 months is close to 700 kg!! Growth, muscle, milk, easy calving and dark colour in this calf.</p>','','TDP CROSSOVER Z400','BBSF 303T CINDY 88Y','','','herd-sires'),
	(25,'Spring 2015 heifers','2016-03-01','','','<p>We have a small number of Spring Heifers for sale. Mostly by Classic 1 Galaxy. Please call for further details</p>','','Classic 1 Galaxy','Various','','','for-sale'),
	(26,'Blackwell 1 Hector (P)','2011-03-05','','','<p>A strong, well fleshed bull who has served our commercial cows well over the past 4 years</p>','','Weybrook 1 Blender 2nd (S)','Blackwell 1 Cypress (P)','','','for-sale'),
	(29,'Two Young Bulls Sired By Global Force 7x','2015-09-01','','','<p>Two Young September 15 Bulls sired by the Candian Polled Bull Global Force 7x. Both very dark in Colour, with Great Muscle.</p>','','Wll Global Force 7x','','','','for-sale'),
	(30,'Ripley Family','2016-04-01','','','','','Days Calibre G74','','','https://youtu.be/15qLcpoe0vE','females'),
	(31,'Moeskaer Pacman 1417','0013-04-15','','','<p>Moeskaer Pacman has great body depth and length with excellent Muscle. His weight as a yearling was 725kg! He Has a Great dark coat and is now proving to past on many of traites to his offspring. Im sure this will remain a firm favorite in Fabb Herd Polled Herefords for the Future.</p>','','Harvie Tailor Made 7W','Harvie Ms Perfection 30P','','','ai-sires');

/*!40000 ALTER TABLE `tbl_cattle` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tbl_cattle_photos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_cattle_photos`;

CREATE TABLE `tbl_cattle_photos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cattle_id` int(10) NOT NULL,
  `url` varchar(60) NOT NULL,
  `alt` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `tbl_cattle_photos` WRITE;
/*!40000 ALTER TABLE `tbl_cattle_photos` DISABLE KEYS */;

INSERT INTO `tbl_cattle_photos` (`id`, `cattle_id`, `url`, `alt`)
VALUES
	(3,2,'/img/cattle/gallery/Donna 4.JPG',''),
	(4,2,'/img/cattle/gallery/donna 3.jpg',''),
	(5,7,'/img/cattle/gallery/Eudora.JPG',''),
	(10,5,'/img/cattle/gallery/m Megan.jpg',''),
	(31,13,'/img/cattle/gallery/1442407097-Donna.jpg',''),
	(35,16,'/img/cattle/gallery/1442407370-keepsake.jpg',''),
	(39,5,'/img/cattle/gallery/1442407631-Megan.jpg',''),
	(41,14,'/img/cattle/gallery/1442407721-PEARL.jpg',''),
	(115,12,'/img/cattle/gallery/1442407303-FANNY.jpg',''),
	(146,25,'/img/cattle/gallery/1456841988-IMG_4030.JPG',''),
	(147,25,'/img/cattle/gallery/1456841989-IMG_4032.JPG',''),
	(150,26,'/img/cattle/gallery/1456844439-IMG_4037.jpg',''),
	(151,26,'/img/cattle/gallery/1456844439-IMG_4049.jpg',''),
	(172,24,'/img/cattle/gallery/1459532742-Fabb Herd Crossfire (2).JPG',''),
	(173,24,'/img/cattle/gallery/1459532742-Fabb Herd Crossfire.JPG',''),
	(178,30,'/img/cattle/gallery/1459546965-Ripley Fabb Herd.JPG',''),
	(180,15,'/img/cattle/gallery/1459548047-Beauty Family.JPG',''),
	(181,21,'/img/cattle/gallery/1459548632-Fabb Herd AI Bull Exceed.jpg',''),
	(182,22,'/img/cattle/gallery/1459549077-Bare Mr You Tube 4Y.jpg',''),
	(183,23,'/img/cattle/gallery/1459549367-Days Calibre G74.jpg',''),
	(184,19,'/img/cattle/gallery/1459549623-Square-D Tortuga 953T.jpg',''),
	(185,20,'/img/cattle/gallery/1459550099-Wll Global Force 7X.jpg',''),
	(186,20,'/img/cattle/gallery/1459550106-Wll Global Force 7X (2).jpg',''),
	(187,17,'/img/cattle/gallery/1459550273-Galaxy Hereford Bull.jpg',''),
	(192,11,'/img/cattle/gallery/1459551515-April Family.JPG',''),
	(193,8,'/img/cattle/gallery/popinjay.JPG',''),
	(194,8,'/img/cattle/gallery/1442406447-5 PIC.jpg',''),
	(195,8,'/img/cattle/gallery/1456855980-IMG_0827.JPG',''),
	(196,10,'/img/cattle/gallery/Snowdrop 2nd.JPG',''),
	(197,10,'/img/cattle/gallery/1442406935-13 PIC.jpg',''),
	(200,9,'/img/cattle/gallery/snowdrop 2.jpg',''),
	(201,1,'/img/cattle/gallery/1459550695-Alma Family (2).JPG',''),
	(202,1,'/img/cattle/gallery/1459550701-Alma Family.JPG',''),
	(203,3,'/img/cattle/gallery/1442407414-FLORA.jpg',''),
	(204,3,'/img/cattle/gallery/1444135987-flora 2.jpg',''),
	(207,6,'/img/cattle/gallery/1459551118-Princess Family.JPG',''),
	(208,6,'/img/cattle/gallery/1459551124-Princess Family (2).jpg',''),
	(209,4,'/img/cattle/gallery/Kema.JPG',''),
	(213,31,'/img/cattle/gallery/1460748367-Pacman picture.jpg',''),
	(214,29,'/img/cattle/gallery/1459109322-Global Force.JPG',''),
	(215,29,'/img/cattle/gallery/1459109334-Global Force (2).JPG','');

/*!40000 ALTER TABLE `tbl_cattle_photos` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tbl_contact
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_contact`;

CREATE TABLE `tbl_contact` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(120) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `message` text NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `tbl_contact` WRITE;
/*!40000 ALTER TABLE `tbl_contact` DISABLE KEYS */;

INSERT INTO `tbl_contact` (`id`, `name`, `email`, `phone`, `message`, `date`)
VALUES
	(1,'Test message Please ignore','richard.wilson@smgdesign.org','07818517852','Sending a test...','2016-03-04 13:59:33'),
	(2,'Test message Please ignore','richard.wilson@smgdesign.org','07818517852','Sending a test...','2016-03-04 14:01:41'),
	(3,'Test message Please ignore','richard.wilson@smgdesign.org','07818517852','Sending a test...','2016-03-04 14:05:10'),
	(4,'Dan Fabb','dan.fabb@drafabb.co.uk','07970901267','test','2016-03-04 14:12:50');

/*!40000 ALTER TABLE `tbl_contact` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tbl_news
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_news`;

CREATE TABLE `tbl_news` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `title` varchar(30) NOT NULL,
  `description` varchar(150) NOT NULL,
  `story` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `tbl_news` WRITE;
/*!40000 ALTER TABLE `tbl_news` DISABLE KEYS */;

INSERT INTO `tbl_news` (`id`, `date`, `title`, `description`, `story`)
VALUES
	(1,'2015-05-09','Nottingham County Show','Show results','<p><strong>Nottingham County Show</strong></p>\r\n<ul>\r\n<li><span style=\"font-family: Calibri; font-size: medium;\">Breed Champion - Moeskaer April 1459</span></li>\r\n<li>\r\n<div style=\"margin: 0cm 0cm 10pt;\"><span style=\"font-family: Calibri; font-size: medium;\">Reserve Breed Champion - Classic 1 Galaxy </span></div>\r\n</li>\r\n<li>\r\n<div style=\"margin: 0cm 0cm 10pt;\"><span style=\"font-family: Calibri; font-size: medium;\">Second in Heifer class &ndash; Moeskaer Fanny 1455</span></div>\r\n</li>\r\n</ul>\r\n<ul>\r\n<li>\r\n<div style=\"margin: 0cm 0cm 10pt;\"><span style=\"font-family: Calibri; font-size: medium;\">Third in Heifer class &ndash; Moeskaer Pearl 1472</span></div>\r\n</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<div style=\"margin: 0cm 0cm 10pt;\">&nbsp;</div>\r\n<p>&nbsp;</p>'),
	(2,'2015-05-16','Hadleigh Show','Show Results','<p><strong><span style=\"font-family: Calibri; font-size: medium;\">Hadleigh Show</span></strong></p>\r\n<ul>\r\n<li><span style=\"font-family: Calibri; font-size: medium;\"><span style=\"font-family: Calibri; font-size: medium;\">Third in Heifer class</span> Moeskaer April 1459</span></li>\r\n<li>\r\n<div style=\"margin: 0cm 0cm 10pt;\"><span style=\"font-family: Calibri; font-size: medium;\"><span style=\"font-family: Calibri; font-size: medium;\">Forth&nbsp;in Heifer class</span> Moeskaer Fanny 1455</span></div>\r\n</li>\r\n</ul>\r\n<p>&nbsp;</p>'),
	(3,'2015-05-23','Hertfordshire Show','Show results','<p><strong><span style=\"font-family: Calibri; font-size: medium;\"><span style=\"font-family: Calibri; font-size: medium;\"><span style=\"font-family: Calibri; font-size: medium;\">Hertfordshire Show</span></span></span></strong></p>\r\n<ul>\r\n<li><span style=\"font-family: Calibri; font-size: medium;\"><span style=\"font-family: Calibri; font-size: medium;\">Third in Heifer class</span> Moeskaer April 1459</span></li>\r\n</ul>\r\n<p>&nbsp;</p>'),
	(4,'2015-05-27','Suffolk Show','Show Results','<p><strong><span style=\"font-family: Calibri; font-size: medium;\">Suffolk Show</span></strong></p>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<li><span style=\"font-family: Calibri; font-size: medium;\">Champion Female - Moeskaer April 1459</span></li>\r\n<li>\r\n<div style=\"margin: 0cm 0cm 10pt;\"><span style=\"font-family: Calibri; font-size: medium;\">Reserve Female Champion - Moeskaer Fanny 1455</span></div>\r\n</li>\r\n</ul>\r\n<p>&nbsp;</p>'),
	(5,'2015-05-31','Rutland County Show','Show Results','<p><strong><span style=\"font-family: Calibri; font-size: medium;\"><span style=\"font-family: Calibri; font-size: medium;\"><span style=\"font-family: Calibri; font-size: medium;\">Rutland Show</span></span></span></strong></p>\r\n<ul>\r\n<li>\r\n<div style=\"margin: 0cm 0cm 10pt;\"><span style=\"font-family: Calibri; font-size: medium;\">Breed Champion - Classic 1 Galaxy </span></div>\r\n</li>\r\n<li>\r\n<div style=\"margin: 0cm 0cm 10pt;\"><span style=\"font-family: Calibri; font-size: medium;\">Female and Junior Champion - Moeskaer April 1459</span></div>\r\n</li>\r\n</ul>'),
	(6,'2015-09-16','Global Force','Global Force','<p><span style=\"font-family: Calibri; font-size: medium;\"><a title=\"Global Force\" href=\"http://moeskaer.com/en/component/content/article/137\">Global Force</a> was one of our preferred Hereford bulls to be put on the Fabb herds Breed plan. With his Dark Ruby Red colouring and well-muscled frame, we felt this bull would work well with our herd.</span></p>\r\n<p><span style=\"font-family: Calibri; font-size: medium;\">While our Hereford cows were in calf to this canadian bull, we decided to buy one of Global forces offspring, Moeskaer April 1459 from Denmark. Once she had settled after the ferry ride we soon put her to work with halter training. Luckily for us, she is well natured so did not take us long!</span></p>\r\n<p><span style=\"font-family: Calibri; font-size: medium;\">April started the show season by winning Breed Champion, female champion and junior champion at various shows! The results we really wanted after putting our cattle in calf to her sire! </span></p>\r\n<p><span style=\"font-family: Calibri; font-size: medium;\">Our Global Force calves arrived with no assistance, full of life and eager to suckle. Our Calving weights averaged 45kg in our herd. Just what we want from a calf! </span></p>\r\n<p>&nbsp;</p>'),
	(7,'2016-03-04','Polled Herefords','Herefords record the largest increase in BCMS figures for the second successive year!','<p><a href=\"http://www.herefordcattle.org/latest-news/herefords-record-the-largest-increase-in-bcms-figures-for-the-second-successive-year/\" target=\"_blank\">http://www.herefordcattle.org/latest-news/herefords-record-the-largest-increase-in-bcms-figures-for-the-second-successive-year/</a></p>'),
	(8,'2016-03-26','Global Force 7X Young Bulls','Two Global Force 7x sired Young Bulls, For Sale from the Fabb Herd Pedigree Polled Herefords','<p>Fabb Herd has two Young Bull from the Candian Sire Global Force 7x. Global Force 7x is an Extremely Dark coloured Bull with really Good muscle. We are really excited by his offspring. The Fabb herd first Global Force sired Calf was a young Heifer we imported from Demark. We had great sucess showing this animal the following year, and decided it would be a Good choice of Hereford Bull to use in our Herd.</p>');

/*!40000 ALTER TABLE `tbl_news` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tbl_news_photos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_news_photos`;

CREATE TABLE `tbl_news_photos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `news_id` int(10) NOT NULL,
  `url` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `tbl_news_photos` WRITE;
/*!40000 ALTER TABLE `tbl_news_photos` DISABLE KEYS */;

INSERT INTO `tbl_news_photos` (`id`, `news_id`, `url`)
VALUES
	(53,1,'/img/news/1430301538-Kasper.jpg'),
	(55,5,''),
	(56,4,''),
	(57,3,''),
	(58,2,''),
	(79,6,'/img/news/1442406211-GlobalForce.jpg'),
	(80,6,'/img/news/1442406292-GF CALF.jpg'),
	(81,6,'/img/news/1442406342-April newark.jpg'),
	(84,7,''),
	(85,7,'/img/news/1457093032-2016 Chart JPEG.jpg'),
	(86,8,'/img/news/1459018563-Global Force.JPG'),
	(87,8,'/img/news/1459018572-Global Force (2).JPG');

/*!40000 ALTER TABLE `tbl_news_photos` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tbl_pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_pages`;

CREATE TABLE `tbl_pages` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `url` varchar(20) NOT NULL,
  `html` text NOT NULL,
  `header` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `tbl_pages` WRITE;
/*!40000 ALTER TABLE `tbl_pages` DISABLE KEYS */;

INSERT INTO `tbl_pages` (`id`, `title`, `url`, `html`, `header`)
VALUES
	(1,'Home','home','<p><img src=\"../../../img/red%20tractor%20logo.jpg\" alt=\"\" width=\"10%\" align=\"left\" /><img src=\"../../../img/high%20health.png\" alt=\"\" width=\"12%\" align=\"right\" /></p>\r\n<div id=\"large-logo\"><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../../img/logo%20clear.png\" alt=\"\" width=\"70%\" /></div>\r\n<h3>Pedigree Polled Herefords, a Herd built using imported Animals and Genetics from around the World. Our focus is on producing a milky and muscular herd, with low birth weights and great growth. Pedigree Polled Bulls and Pedigree Polled Heifers always available.</h3>\r\n<h3>&nbsp;</h3>','/img/headings/1436052552-home-bg.jpg'),
	(2,'About','about','<div class=\"left-col\">\r\n<p><span style=\"background-color: #ffffff; color: #000000;\">The Fabb Herd Pedigree Herefords, was started&nbsp;by partners Daniel Fabb and Helen Parr. Based in Cambridgeshire a TB4 area.<br /></span></p>\r\n<p><span style=\"background-color: #ffffff; color: #000000;\">The Herd consists of around 60 Polled Hereford cows. Wanting to progress with different blood lines, we have imported 20 Hereford Heifers and a Hereford Bull from Denmark over the past 3 years.</span></p>\r\n<p><span style=\"background-color: #ffffff; color: #000000;\">&nbsp;Hereford Sires used within our Herd include the The Wonderer, Square-D Diesel, Remital Pilgrim, Classic 1 Galaxy, W11 Global Force, Youtube, and Tortuga to mention a few.</span></p>\r\n<p><span style=\"background-color: #ffffff; color: #000000;\">Polled Hereford cow families include Moeskaer Pearl from the Canadian Family Square D Pearl 37M. Moeskaer Donna 1424, Moeskaer Megan 1437 whos sister was dam to the Swedish National champion Bull. Hartshorne Families and the Fabb Families</span></p>\r\n<p><span style=\"background-color: #ffffff; color: #000000;\">Our intentions are to serve the Majority of the herd Via AI. We are also running an intensive embryo program.&nbsp; Enabling us to use top Hereford genetics from around the world to further improve the herd.&nbsp;</span></p>\r\n<p><span style=\"color: #000000;\">&nbsp;</span></p>\r\n<p><span style=\"color: #000000;\">&nbsp;</span></p>\r\n</div>\r\n<div class=\"right-col\"><img src=\"../../../img/about-img.jpg\" alt=\"\" width=\"100%\" /></div>','/img/headings/1436052581-about-bg.jpg'),
	(3,'News','news','<p>The Latest Polled Hereford News</p>\r\n<p>{_news_}</p>','/img/headings/1436052680-BG-2.jpg'),
	(4,'Herd Sires','cattle/herd-sires','<p><strong>The Fabb Herd Sires are selected to improve &nbsp;particular traits in the Herd. This enables us to match a Bull to a particular Hereford Polled Female. Our main priorities are Milk, Muscle and Calving ease.</strong></p>\r\n<p>{_cattle_}</p>','/img/headings/1436052666-cattle-bg.jpg'),
	(5,'AI Sires','cattle/ai-sires','<p><strong>Top Quality Polled Hereford Genetics from around the World. Selecting Hereford Bulls to bring beneficial traits to our Herd. Exciting outcross Hereford Genetics to suit our wide variation of Polled Hereford Females.</strong></p>\r\n<p>{_cattle_}</p>','/img/headings/1436052666-cattle-bg.jpg'),
	(6,'Females','cattle/females','<p><strong>Polled Hereford Female Families, selected for there fertility, paternal instinct and milk. We have Dams from some of the top Polled Hereford Females in Canada, North America and Uk.&nbsp;</strong></p>\r\n<p>{_cattle_}</p>','/img/headings/1436052666-cattle-bg.jpg'),
	(7,'For Sale','cattle/for-sale','<p><strong>Polled Hereford Bulls, Polled Hereford Females and Polled Hereford Genetics are always available, we are Happy to flush any Hereford Females to Selected Sire.&nbsp;<br /></strong></p>\r\n<p>{_cattle_}</p>','/img/headings/1436052707-BG-1.jpg'),
	(8,'Contact','contact','<center><strong>Fabb Herd Polled Herefords</strong></center><center><strong>Wilsons Orchard Farm,</strong><br /><strong>Fenside Road,</strong><br /><strong>Warboys,</strong><br /><strong>Cambs</strong><br /><strong>PE28 2TY</strong></center><center><strong>Tel 01487 822224</strong></center><center><strong>Mobile 07584 035080</strong></center><form id=\"contact-form\" action=\"/contact.php\" method=\"post\">\r\n<h3>Please fill in the form below to send us a message and we will reply to you as soon as possible where appropriate.</h3>\r\n<input name=\"name\" type=\"text\" placeholder=\"Name\" data-required=\"true\" /><br /> <input name=\"email\" type=\"text\" placeholder=\"Email address\" data-required=\"true\" /><br /> <input name=\"phone\" type=\"text\" placeholder=\"Phone number\" data-required=\"false\" /><br /> <textarea name=\"message\" placeholder=\"Message\" data-required=\"true\">Message</textarea><br /> <input name=\"submitted\" type=\"hidden\" value=\"TRUE\" /> <input name=\"send\" type=\"submit\" value=\"Send Message\" /></form>','/img/headings/1442409213-view.jpg');

/*!40000 ALTER TABLE `tbl_pages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tbl_shows
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_shows`;

CREATE TABLE `tbl_shows` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `tbl_shows` WRITE;
/*!40000 ALTER TABLE `tbl_shows` DISABLE KEYS */;

INSERT INTO `tbl_shows` (`id`, `title`, `date`, `description`)
VALUES
	(4,'Suffolk Show','0016-06-01','<p><a href=\"http://suffolkshow.co.uk/\">Suffolk Show</a></p>\r\n<p>&nbsp;</p>'),
	(5,'Rutland Show','0016-06-05','<p>&nbsp;</p>\r\n<p>&nbsp;</p>'),
	(12,'Three Counties Show','2016-06-17','<p><a href=\"http://www.threecounties.co.uk/threecounties/\">Royal Three Counties Show</a></p>'),
	(13,'Ashby Show','2016-07-10','');

/*!40000 ALTER TABLE `tbl_shows` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tbl_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_users`;

CREATE TABLE `tbl_users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(32) NOT NULL,
  `name` varchar(50) NOT NULL,
  `last_action` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `tbl_users` WRITE;
/*!40000 ALTER TABLE `tbl_users` DISABLE KEYS */;

INSERT INTO `tbl_users` (`id`, `username`, `password`, `name`, `last_action`)
VALUES
	(1,'admin','4f676f6371aeb213d74abe0bfbad5b1c','Fabb User','2014-12-14 11:20:45');

/*!40000 ALTER TABLE `tbl_users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
