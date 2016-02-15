# ************************************************************
# Sequel Pro SQL dump
# Version 4500
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.5.42)
# Database: fabbherd
# Generation Time: 2016-02-13 13:54:22 +0000
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
	(1,'Moeskaer Alma','2013-03-05','Heifer','','<p>In Calf to <strong>Square-D Tortuga</strong></p>','','Nbg 69t The Wonderer 36R ET 3W','Moeskaer Alma 1201','<iframe width=\"420\" height=\"315\" src=\"//www.youtube.com/embed/ARqOIqJ9kbo?rel=0&start=27&controls=0&showinfo=0\" frameborder=\"0\" allowfullscreen></iframe>','','herd-sires'),
	(2,'Moeskaer Donna','2013-04-25','Heifer','','DK069957 01424','','Square-D Diesel 957u','71404-00879','','http://www.square-dpolledherefords.com/herdsires.htm','herd-sires'),
	(3,'Moeskaer Flora','2013-05-24','Heifer','','<p>In Calf to <strong>Classic 1 Galaxy</strong></p>','','Star-Lake Dandy 614r','Moeskaer Flora 1301','','','herd-sires'),
	(4,'Moeskaer Kema','2013-06-03','Heifer','','<p>In Calf to <strong>Barefoot Mr You Tube</strong></p>','','Moeskaer Salute','Moeskaer Kema 1132-ET','','http://moeskaer.com/en/component/content/article/165','herd-sires'),
	(5,'Moeskaer Megan','2013-06-07','In Calf Heifer','','<p>In calf to <strong>Square-D Tortuga</strong></p>','','Moeskaer Packer 1354','Moeskaer Megan 1079 ET','','http://moeskaer.com/en/news/8-nyheder/174-square-d-tortuga-953t-ny-insemineringstyr','herd-sires'),
	(6,'Moeskaer Princess','2012-07-05','Cow','','','','Wilgor 55k Northeatern OL 2N','Mhpa Ms 24k Princess 1195N','','','ai-sires'),
	(7,'Moeskaer Eudora','2013-04-08','Heifer','','<p>In Calf to <strong>Square-D Tortuga</strong></p>','','Moeskaer Salute 994','Moeskaer Eudora 1253','','http://moeskaer.com/en/news/8-nyheder/174-square-d-tortuga-953t-ny-insemineringstyr','ai-sires'),
	(8,'Fabb 1 Popinjay','2013-03-22','In calf Heifer','','<p>In Calf to <strong>Square-D Tortuga</strong></p>','','Blackwell 1 Hector','Hartshorne 1 Popinjay 19th','','http://moeskaer.com/en/news/8-nyheder/174-square-d-tortuga-953t-ny-insemineringstyr','ai-sires'),
	(9,'Fabb 1 Snowdrop','2013-04-05','Herd sires','','<p>In Calf to <strong>Barefoot Mr You Tube</strong></p>','','Blackwell 1 Hector','Hartshorne 1 Snowdrop 26th','','http://moeskaer.com/en/component/content/article/165','ai-sires'),
	(10,'Fabb 1 Snowdrop 2nd','2013-06-20','Heifer','','<p>In Calf to <strong>Classic 1 Galaxy</strong></p>','','Blackwell 1 Hector','Hartshorne 1 Snowdrop 25th','','','ai-sires'),
	(11,'Moeskaer April','2014-03-25','Heifer','','','','W11 Global Force','Moeskaer Fanny','','http://moeskaer.com/en/component/content/article/137','females'),
	(12,'Moeskaer Fanny','2014-03-11','','','','','Remitall Pilgrim 93P','Moeskaer Fanny 1162','','http://moeskaer.com/en/semen-sale/68','females'),
	(13,'Moeskaer Donna','2014-04-25','','','','','Square-d Tortuga 953T','ABG Moeskaer Donna 879','','http://moeskaer.com/da/component/content/article/171','females'),
	(14,'Moeskaer Pearl','2014-05-10','','','','','Square-d Tortuga 953T','Moeskaer Pearl 1256','','http://moeskaer.com/en/news/8-nyheder/174-square-d-tortuga-953t-ny-insemineringstyr','females'),
	(15,'Moeskaer Beauty','2015-05-08','','','','','Square-d Tortuga 953T','Moeskaer Beauty 1192','','','females'),
	(16,'Moeskaer Keepsake','2015-06-01','','','','','Remitall Pilgrim 93P','Moeskaer Keepsake 1158','','http://moeskaer.com/en/semen-sale/68','females');

/*!40000 ALTER TABLE `tbl_cattle` ENABLE KEYS */;
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
	(4,'Herd sires','cattle/herd-sires','<h3>The future of the Fabb herd</h3>\r\n<p>{_cattle_}</p>','/img/headings/1436052666-cattle-bg.jpg'),
	(5,'Ai Sires','cattle/ai-sires','<p>{_cattle_}</p>','/img/headings/1436052666-cattle-bg.jpg'),
	(6,'Females','cattle/females','<p>{_cattle_}</p>','/img/headings/1436052666-cattle-bg.jpg'),
	(7,'Shows','shows','<p>{_shows_}</p>','/img/headings/1436052707-BG-1.jpg'),
	(8,'Contact','contact','<center>Wilsons Orchard,<br />Fenside Road,<br />Warboys,<br />Cambs<br />PE28 2TY</center><form id=\"contact-form\" action=\"/contact.php\" method=\"post\">\r\n<h3>Please fill in the form below to send us a message and we will reply to you as soon as possible where appropriate.</h3>\r\n<input name=\"name\" type=\"text\" placeholder=\"Name\" data-required=\"true\" /><br /> <input name=\"email\" type=\"text\" placeholder=\"Email address\" data-required=\"true\" /><br /> <input name=\"phone\" type=\"text\" placeholder=\"Phone number\" data-required=\"false\" /><br /> <textarea name=\"message\" placeholder=\"Message\" data-required=\"true\">Message</textarea><br /> <input name=\"submitted\" type=\"hidden\" value=\"TRUE\" /> <input name=\"send\" type=\"submit\" value=\"Send Message\" /></form>','/img/headings/1442409213-view.jpg');

/*!40000 ALTER TABLE `tbl_pages` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
