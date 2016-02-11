# ************************************************************
# Sequel Pro SQL dump
# Version 4499
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.47-cll)
# Database: smgdev_fabb
# Generation Time: 2016-01-29 22:54:30 +0000
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `tbl_cattle` WRITE;
/*!40000 ALTER TABLE `tbl_cattle` DISABLE KEYS */;

INSERT INTO `tbl_cattle` (`id`, `name`, `dob`, `category`, `height`, `description`, `icon`, `sire`, `dam`, `video`, `link`)
VALUES
	(1,'Moeskaer Alma','2013-03-05','Heifer','','<p>In Calf to <strong>Square-D Tortuga</strong></p>','','Nbg 69t The Wonderer 36R ET 3W','Moeskaer Alma 1201','<iframe width=\"420\" height=\"315\" src=\"//www.youtube.com/embed/ARqOIqJ9kbo?rel=0&start=27&controls=0&showinfo=0\" frameborder=\"0\" allowfullscreen></iframe>',''),
	(2,'Moeskaer Donna','2013-04-25','Heifer','','DK069957 01424','','Square-D Diesel 957u','71404-00879','','http://www.square-dpolledherefords.com/herdsires.htm'),
	(3,'Moeskaer Flora','2013-05-24','Heifer','','<p>In Calf to <strong>Classic 1 Galaxy</strong></p>','','Star-Lake Dandy 614r','Moeskaer Flora 1301','',''),
	(4,'Moeskaer Kema','2013-06-03','Heifer','','<p>In Calf to <strong>Barefoot Mr You Tube</strong></p>','','Moeskaer Salute','Moeskaer Kema 1132-ET','','http://moeskaer.com/en/component/content/article/165'),
	(5,'Moeskaer Megan','2013-06-07','In Calf Heifer','','<p>In calf to <strong>Square-D Tortuga</strong></p>','','Moeskaer Packer 1354','Moeskaer Megan 1079 ET','','http://moeskaer.com/en/news/8-nyheder/174-square-d-tortuga-953t-ny-insemineringstyr'),
	(6,'Moeskaer Princess','2012-07-05','Cow','','','','Wilgor 55k Northeatern OL 2N','Mhpa Ms 24k Princess 1195N','',''),
	(7,'Moeskaer Eudora','2013-04-08','Heifer','','<p>In Calf to <strong>Square-D Tortuga</strong></p>','','Moeskaer Salute 994','Moeskaer Eudora 1253','','http://moeskaer.com/en/news/8-nyheder/174-square-d-tortuga-953t-ny-insemineringstyr'),
	(8,'Fabb 1 Popinjay','2013-03-22','In calf Heifer','','<p>In Calf to <strong>Square-D Tortuga</strong></p>','','Blackwell 1 Hector','Hartshorne 1 Popinjay 19th','','http://moeskaer.com/en/news/8-nyheder/174-square-d-tortuga-953t-ny-insemineringstyr'),
	(9,'Fabb 1 Snowdrop','2013-04-05','','','<p>In Calf to <strong>Barefoot Mr You Tube</strong></p>','','Blackwell 1 Hector','Hartshorne 1 Snowdrop 26th','','http://moeskaer.com/en/component/content/article/165'),
	(10,'Fabb 1 Snowdrop 2nd','2013-06-20','Heifer','','<p>In Calf to <strong>Classic 1 Galaxy</strong></p>','','Blackwell 1 Hector','Hartshorne 1 Snowdrop 25th','',''),
	(11,'Moeskaer April','2014-03-25','Heifer','','','','W11 Global Force','Moeskaer Fanny','','http://moeskaer.com/en/component/content/article/137'),
	(12,'Moeskaer Fanny','2014-03-11','','','','','Remitall Pilgrim 93P','Moeskaer Fanny 1162','','http://moeskaer.com/en/semen-sale/68'),
	(13,'Moeskaer Donna','2014-04-25','','','','','Square-d Tortuga 953T','ABG Moeskaer Donna 879','','http://moeskaer.com/da/component/content/article/171'),
	(14,'Moeskaer Pearl','2014-05-10','','','','','Square-d Tortuga 953T','Moeskaer Pearl 1256','','http://moeskaer.com/en/news/8-nyheder/174-square-d-tortuga-953t-ny-insemineringstyr'),
	(15,'Moeskaer Beauty','2015-05-08','','','','','Square-d Tortuga 953T','Moeskaer Beauty 1192','',''),
	(16,'Moeskaer Keepsake','2015-06-01','','','','','Remitall Pilgrim 93P','Moeskaer Keepsake 1158','','http://moeskaer.com/en/semen-sale/68');

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
	(1,9,'/img/cattle/gallery/snowdrop 2.jpg',''),
	(2,1,'/img/cattle/gallery/Alma.JPG','Alma'),
	(3,2,'/img/cattle/gallery/Donna 4.JPG',''),
	(4,2,'/img/cattle/gallery/donna 3.jpg',''),
	(5,7,'/img/cattle/gallery/Eudora.JPG',''),
	(6,3,'/img/cattle/gallery/Flora.JPG',''),
	(7,4,'/img/cattle/gallery/Kema.JPG',''),
	(8,6,'/img/cattle/gallery/Princess.JPG',''),
	(9,10,'/img/cattle/gallery/Snowdrop 2nd.JPG',''),
	(10,5,'/img/cattle/gallery/m Megan.jpg',''),
	(11,8,'/img/cattle/gallery/popinjay.JPG',''),
	(22,8,'/img/cattle/gallery/1442406447-5 PIC.jpg',''),
	(27,10,'/img/cattle/gallery/1442406935-13 PIC.jpg',''),
	(29,11,'/img/cattle/gallery/1442406986-April newark.jpg',''),
	(31,13,'/img/cattle/gallery/1442407097-Donna.jpg',''),
	(33,12,'/img/cattle/gallery/1442407303-FANNY.jpg',''),
	(35,16,'/img/cattle/gallery/1442407370-keepsake.jpg',''),
	(37,3,'/img/cattle/gallery/1442407414-FLORA.jpg',''),
	(39,5,'/img/cattle/gallery/1442407631-Megan.jpg',''),
	(41,14,'/img/cattle/gallery/1442407721-PEARL.jpg',''),
	(42,6,'/img/cattle/gallery/1442407824-princess.jpg',''),
	(65,15,'/img/cattle/gallery/1443787174-beauty.jpg',''),
	(66,3,'/img/cattle/gallery/Flora.JPG',''),
	(67,3,'/img/cattle/gallery/1444135987-flora 2.jpg','');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `tbl_contact` WRITE;
/*!40000 ALTER TABLE `tbl_contact` DISABLE KEYS */;

INSERT INTO `tbl_contact` (`id`, `name`, `email`, `phone`, `message`)
VALUES
	(1,'Richard Wilson','richard.wilson@smgdesign.org','01480392604','This is a test'),
	(2,'Richard Wilson','richard.wilson@smgdesign.org','01480392604','Another test'),
	(3,'Richard Wilson','richard.wilson@smgdesign.org','01480392604','Test'),
	(4,'','','','');

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
	(7,'2015-09-23','Straw For Sale','Top quality Straw For Sale','<p><span style=\"font-family: Calibri; font-size: medium;\">The Fabb herd is a sister company to DRA Fabb Contractors and RF Straw Services. The companies work hand in hand baling, carting, storing and delivering straw. </span></p>\r\n<p><span style=\"font-family: Calibri; font-size: medium;\">These Wheat and Barley Hesston bales are either stored inside or on well drained land, sheeted to ensure there is little or no waste!</span></p>\r\n<p><span style=\"font-family: Calibri; font-size: medium;\">RF Straw Services provides a friendly team that specialise in straw haulage. The four Lorries that transport the straw nationwide can carry up to 36 Heston bales per load.</span></p>\r\n<p><span style=\"font-family: Calibri; font-size: medium;\">For more information please contact Dan Fabb on 07970 901267, <span style=\"font-family: Calibri; font-size: medium;\"><a title=\"Straw for Sale\" href=\"http://www.drafabb.co.uk/\">http://www.drafabb.co.uk/</a>&nbsp;or danfabb@drafabb.co.uk</span></span></p>\r\n<p><span style=\"font-family: Times New Roman; font-size: medium;\"> <br /></span></p>'),
	(8,'2015-09-23','Tractor Hire','Tractor and Labour Hire','<p><span style=\"text-align: left; color: #666666; line-height: 17px; font-family: Georgia, serif; font-size: 12px;\">DRA Fabb Contractors Ltd&nbsp;is increasingly being asked to assist in large scale landscaping </span><span style=\"text-align: left; color: #666666; line-height: 17px; font-family: Georgia, serif; font-size: 12px;\">operations. This has enabled us to invest in some new machinery, to help us assist these companies. We are able to offer a ripping/subsoiling service to enable pans in the soil structure to be removed. This can be follow with Cultivations and Power Harrowing. This can then be prepared for seeding or planting areas. Alternatively we can just send a&nbsp;tractor and driver</span><span style=\"text-align: left; color: #666666; line-height: 17px; font-family: Georgia, serif; font-size: 12px;\">&nbsp;to assist with your own</span><span style=\"text-align: left; color: #666666; line-height: 17px; font-family: Georgia, serif; font-size: 12px;\"> implement</span><span style=\"text-align: left; color: #666666; line-height: 17px; font-family: Georgia, serif; font-size: 12px;\">s</span><span style=\"text-align: left; color: #666666; line-height: 17px; font-family: Georgia, serif; font-size: 12px;\"> and operation. We also offer loader hire to assis with other landscaping and building operation. </span></p>\r\n<p><span style=\"text-align: left; color: #666666; line-height: 17px; font-family: Georgia, serif; font-size: 12px;\">A</span><span style=\"text-align: left; color: #666666; line-height: 17px; font-family: Georgia, serif; font-size: 12px;\">ll our machines come with competent operators with all relevant qualification. We are happy to help with hires for just a few hours or longer term if needed. If you think we can help in anyway please contac Dan on 07970 901267, <span style=\"font-family: Calibri; font-size: medium;\"><a title=\"Straw for Sale\" href=\"http://www.drafabb.co.uk/\">http://www.drafabb.co.uk/</a><span style=\"color: #000000;\">&nbsp;</span></span>or dan.fabb@drafabb.co.uk.</span></p>');

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
	(74,7,'/img/news/1443006287-harvest.jpg'),
	(75,7,'/img/news/1443006317-straw 3.jpg'),
	(76,7,'/img/news/1443006337-straw.jpg'),
	(77,7,'/img/news/1443006362-lorries.jpg'),
	(78,8,'/img/news/1443007166-tractor hire.jpg'),
	(79,6,'/img/news/1442406211-GlobalForce.jpg'),
	(80,6,'/img/news/1442406292-GF CALF.jpg'),
	(81,6,'/img/news/1442406342-April newark.jpg');

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
	(1,'Home','home','<div id=\"large-logo\"><img src=\"../../../img/full-logo.png\" alt=\"The Fabb Herd\" width=\"100%\" /></div>\r\n<h3>Hereford Cattle work well with our lifestyle...<br />Calm temperament, low inputs and hours of fun!</h3>\r\n<h3>Top class genetics from around the world.&nbsp;</h3>','/img/headings/1436052552-home-bg.jpg'),
	(2,'About','about','<div class=\"left-col\">\r\n<p>The Fabb Herd&nbsp;was started&nbsp;by partners Daniel Fabb and Helen Parr. Daniel&nbsp;manages DRA Fabb Contractors Ltd and RF Straw Services, a sister company that specialises in transporting Straw. Helen, a dairy farmers daughter, milked cows for eight years then worked for agricultural based companies such as Mole Valley Farmers before leaving to focus on family life.</p>\r\n<p>The Fabb Herd consists of around 30 cows. Wanting to progress the herd with different blood lines, we have imported 13 Heifers from Denmark over the past 2 years</p>\r\n<p>Sires used within our herd include the The Wonderer, Square-D Diesel,Remital Pilgrim, Classic 1 Galaxy, W11 Global Force to mention a few.</p>\r\n<p>Cow families include Moeskaer Pearl from the Canadian Family Square D Pearl 37M. Moeskaer Donna 1424, Moeskaer Megan 1437 whos sister was dam to the Swedish National champion Bull. Hartshorne Families and the Fabb Families</p>\r\n<p>Our intentions are to serve the Majority of the herd Via AI, enabling us to use top genetics from around the world to further improve the herd.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n</div>\r\n<div class=\"right-col\"><img src=\"../../../img/about-img.jpg\" alt=\"\" width=\"100%\" /></div>','/img/headings/1436052581-about-bg.jpg'),
	(3,'News','news','<p>{_news_}</p>','/img/headings/1436052680-BG-2.jpg'),
	(4,'Cattle','cattle','<h3>The future of the Fabb herd</h3>\r\n<p>{_cattle_}</p>','/img/headings/1436052666-cattle-bg.jpg'),
	(5,'Shows','shows','<p>{_shows_}</p>','/img/headings/1436052707-BG-1.jpg'),
	(6,'Contact','contact','<center>Wilsons Orchard,<br />Fenside Road,<br />Warboys,<br />Cambs<br />PE28 2TY</center><form id=\"contact-form\" action=\"/contact.php\" method=\"post\">\r\n<h3>Please fill in the form below to send us a message and we will reply to you as soon as possible where appropriate.</h3>\r\n<input name=\"name\" type=\"text\" placeholder=\"Name\" data-required=\"true\" /><br /> <input name=\"email\" type=\"text\" placeholder=\"Email address\" data-required=\"true\" /><br /> <input name=\"phone\" type=\"text\" placeholder=\"Phone number\" data-required=\"false\" /><br /> <textarea name=\"message\" placeholder=\"Message\" data-required=\"true\">Message</textarea><br /> <input name=\"submitted\" type=\"hidden\" value=\"TRUE\" /> <input name=\"send\" type=\"submit\" value=\"Send Message\" /></form>','/img/headings/1442409213-view.jpg');

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
	(1,'Newark and Notts County Show','2015-05-09','<p><strong>Fabb Herd - Results</strong></p>\r\n<p>Breed Champion - Moeskaer April 1459</p>\r\n<p>Reserve Breed Champion - Classic 1 Galaxy</p>\r\n<p>Second in Heifer class &ndash; Moeskaer Fanny 1455</p>\r\n<p>Third in Heifer class &ndash; Moeskaer Pearl 1472</p>\r\n<p>&nbsp;</p>'),
	(4,'Suffolk Show','2015-05-27','<p><strong>Fabb Herd - Results</strong></p>\r\n<p>Reserve Breed Champion- Moeskaer April 1459</p>\r\n<p>Female Champion- Moeskaer April 1459</p>\r\n<p>Reserve female Champion- Moeskaer Fanny 1455</p>\r\n<p><a href=\"http://suffolkshow.co.uk/\">Suffolk Show</a></p>\r\n<p>&nbsp;</p>'),
	(5,'Rutland Show','2015-05-31','<p>Show Results</p>\r\n<p>Breed Champion- Classic 1 Galaxy</p>\r\n<p>Junior Champion- Moeskaer April 1459</p>\r\n<p>Female Champion- Moeskaer April 1459</p>\r\n<p>&nbsp;</p>'),
	(12,'Three Counties Show','2015-06-12','<p>Show Results</p>\r\n<p>Fourth in Class- Moeskaer April 1459</p>\r\n<p>Third in Class- Moeskaer Donna 1463</p>\r\n<p>Forth in Class- Moeskaer Pearl 1472</p>\r\n<p><a href=\"http://www.threecounties.co.uk/threecounties/\">Royal Three Counties Show</a></p>'),
	(13,'Ashby Show','2015-07-12','');

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
