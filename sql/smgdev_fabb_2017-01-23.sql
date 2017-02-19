# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.52-cll)
# Database: smgdev_fabb
# Generation Time: 2017-01-23 23:03:47 +0000
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
	(6,'Princess Family','2012-07-05','Cow','','<p>Princess family will always be a favorite. Great temperament, has a Galaxy Heifer Calf which has taken on all of her Features. This cow was flushed in 2015 with 3 egg being implanted directly into recipients. Again another Strong breeder we will be pushing in the Fabb Herd Polled Herfords for the future.</p>','','Wilgor 55k Northeatern OL 2N','Mhpa Ms 24k Princess 1195N','','','females'),
	(7,'Moeskaer Eudora','2013-04-08','Heifer','','<p>In Calf to <strong>Square-D Tortuga</strong></p>','','Moeskaer Salute 994','Moeskaer Eudora 1253','','http://moeskaer.com/en/news/8-nyheder/174-square-d-tortuga-953t-ny-insemineringstyr','females'),
	(8,'Fabb 1 Popinjay','2013-03-22','In calf Heifer','','<p>Has one our most promising 2016 Bull Calves at foot sired by <strong>Square-D Tortuga. </strong>One of our first Polled Hereford Families, Strong breeder, good Milk.<strong><br /></strong></p>','','Blackwell 1 Hector','Hartshorne 1 Popinjay 19th','','','females'),
	(9,'Fabb 1 Snowdrop','2013-04-05','Herd sires','','<p>Has January 2016 Square-D Tortuga calf at foot<strong>. </strong>A Promising Polled Hereford Prospect for the future. Good strong Breeder with good milk. Has Been a Great Family for us on the Show Circuit. Her Half Sister Fabb 1 Mia, came first in class at the National Hereford Calf Show 2015.<strong><br /></strong></p>','','Blackwell 1 Hector','Hartshorne 1 Snowdrop 26th','','','females'),
	(10,'Fabb 1 Snowdrop 2nd','2013-06-20','Heifer','','<p>Sold to a new Polled Hereford breeder in 2016. Had Classic 1 Galaxy Heifer calf at foot.<strong><br /></strong></p>','','Blackwell 1 Hector','Hartshorne 1 Snowdrop 25th','','','females'),
	(11,'Moeskaer April','2014-03-25','Heifer','','<p>Breed champion at Nottingham County show 2015</p>\r\n<p>Junior champion at Rutland show 2015</p>\r\n<p>Female Champion at Suffolk show 2015</p>','','W11 Global Force','Moeskaer Fanny','','','females'),
	(12,'Moeskaer Fanny 1455','2014-03-11','','','','','Remitall Pilgrim 93P','Moeskaer Fanny 1162','','http://abri.une.edu.au/online/cgi-bin/i4.dll?1=3E372928&2=2420&3=56&5=2B3C2B3C3A&6=27595C262223222E20&9=5A505159','females'),
	(13,'Moeskaer Donna','2014-04-25','','','','','Square-d Tortuga 953T','ABG Moeskaer Donna 879','','http://moeskaer.com/da/component/content/article/171','females'),
	(14,'Moeskaer Pearl','2014-05-10','','','','','Square-d Tortuga 953T','Moeskaer Pearl 1256','','http://moeskaer.com/en/news/8-nyheder/174-square-d-tortuga-953t-ny-insemineringstyr','females'),
	(15,'Moeskaer Beauty','2015-05-08','','','','','Square-d Tortuga 953T','Moeskaer Beauty 1192','','','females'),
	(16,'Moeskaer Keepsake','2015-06-01','','','','','Remitall Pilgrim 93P','Moeskaer Keepsake 1158','','','females'),
	(17,'Classic 1 Galaxy (P)','2011-01-01','','','<p>A large framed solid bull, with strong feet and dark colour.</p>','','Hawkesbury 1 Mustang (P)','Classic 1 Jodie (P) AI','','','herd-sires'),
	(19,'Square-D Tortuga 953T','2007-03-11','','','','','Wilgor 55K Notheastern OL 2N','Square-D Ameena 753Mu','','','ai-sires'),
	(20,'Wll Global Force 7X','2010-01-07','','','<p><span style=\"font-family: verdana, arial, helvetica; -webkit-text-size-adjust: auto;\">Global Force combines two of the most dominant bloodlines with WLB Global 72M 50S on the top side and FORC 29F Boomer 18L on the bottom side. Both lines are noted for their abilities to provide moderate birth weight with exceptional growth and muscle.</span></p>','','Wlb Global 72M 50S','Corp Creek Stacie 6S','','','ai-sires'),
	(21,'Axa Goldern-Oak Xceed 704X','2010-02-24','','','<ul>\r\n<li style=\"font-family: verdana, arial, helvetica; -webkit-text-size-adjust: auto;\">Xceed provides exceptional balance across the board from birth weight to growth, maternal and carcass.&nbsp;</li>\r\n<li style=\"font-family: verdana, arial, helvetica; -webkit-text-size-adjust: auto;\">His dam is a picture perfect female that continues to produce exceptional offspring at 9 years of age.&nbsp;</li>\r\n<li style=\"font-family: verdana, arial, helvetica; -webkit-text-size-adjust: auto;\">DLF, IEF and HYF</li>\r\n</ul>','','Shf Rib Eye M326 R117','Ncx Miss JR Nellie 528N','http://youtu.be/HTsgRjhpslA','','ai-sires'),
	(22,'Barefoot Mr You Tube 4Y','2011-11-28','','','<ul>\r\n<li>Extreme&nbsp;thickness with meat from end to end, huge hindquarter</li>\r\n</ul>\r\n<ul>\r\n<li>Structural soundness and deep bodied</li>\r\n</ul>\r\n<ul>\r\n<li>Long bodied with perfect feet and legs</li>\r\n</ul>\r\n<ul>\r\n<li>Low birthweight and should be suitable for heifers&nbsp;</li>\r\n</ul>\r\n<ul>\r\n<li>New and fresh pedigree with lots of milk</li>\r\n</ul>','','Ncx Winchester 745W','Ncx Miss Whiplash 3W','','','ai-sires'),
	(23,'Days Calibre G74','2011-05-19','','','<p>He is a bull who was a clear winner in the class. He has a big top and you have to appreciate his balance and eye appeal and when you see him on the move he has a lot of integrity and flexibility.</p>','','Allendale Waterhouse D1 (P)','Allendale Dawn C62 (P)','','','ai-sires'),
	(24,'Crossfire 1474','2016-02-13','','','<p style=\"text-align: left;\">&nbsp;This is an ET calf with a very special pedigree. I doubt there are any other Herefords in Europe with this pedigree. His dam has won many shows in Canada and is a phenomenal female. Sire of the bull is the american sire TDP Crossover.&nbsp;His weight at 12 months is close to 700 kg!! Growth, muscle, milk, easy calving and dark colour in this calf.</p>','','TDP CROSSOVER Z400','BBSF 303T CINDY 88Y','','','herd-sires'),
	(30,'Ripley Family','2016-04-01','','','','','Days Calibre G74','','','https://youtu.be/15qLcpoe0vE','females'),
	(31,'Moeskaer Pacman 1417','0013-04-15','','','<p>Moeskaer Pacman has great body depth and length with excellent Muscle. His weight as a yearling was 725kg! He Has a Great dark coat and is now proving to past on many of traites to his offspring. Im sure this will remain a firm favorite in Fabb Herd Polled Herefords for the Future.</p>','','Harvie Tailor Made 7W','Harvie Ms Perfection 30P','','','ai-sires'),
	(33,'Moeskaer Tracy 1295','2010-04-04','','','','','CCR 57G Stamina ET 199S','Moeskaer Tracy 964','','','females'),
	(34,'Moeskaer Keepsake 1218','2008-04-04','','','','','HF 4L Beyond 36N','Golden-Oak 46B Keepsake 23k','','','females'),
	(35,'Dorepoll 1 Katie','2012-10-21','','','','','Dorepoll 1 60G Chinook','Dorepoll 1 531 Katie 556','','','females'),
	(36,'Fabb 1 Northern Star','2016-01-01','','','','','Square-D Tortuga 953T','Fabb 1 Snowdrop','','','for-sale'),
	(37,'Fabb 1 Nicholson','2016-01-03','','','<p>Promising easy fleshing Bull, fantastic rear, with good pedigree.</p>','','Square-D Tortuga 953T','Fabb 1 Popinjay','','','for-sale'),
	(39,'Moeskaer Pacman 1417','2016-11-06','','Frame scor','<p style=\"margin: 0.5em 0px; font-family: Arial, Helvetica, sans-serif; font-size: 14px; letter-spacing: normal; text-align: left;\"><strong><span style=\"font-size: large;\">Grand Champion Bull of Europe 2014/2015</span></strong></p>\r\n<p style=\"margin: 0.5em 0px; font-family: Arial, Helvetica, sans-serif; font-size: 14px; letter-spacing: normal; text-align: left;\"><strong><span style=\"font-size: large;\">Grand Champion Bull, The National Show 2014</span></strong></p>\r\n<p style=\"margin: 0.5em 0px; font-family: Arial, Helvetica, sans-serif; font-size: 14px; letter-spacing: normal; text-align: left;\"><strong><span style=\"font-size: large;\">Grand Champion Bull, Agromek 2014</span></strong></p>','','Harvie Tailor Made 7W ET','Harvie Miss Perfection 30P','','','herd-sires'),
	(40,'Fabb 1 Noak','2016-01-14','','','<p>Polled Hereford Bull for Sale. Excellent smaller framed bull, full of muscle. Superb pedigree with easy calving. A real Gentleman on a halter.</p>','','Bare Mr You Tube 4Y','Moeskaer Kema 1435','https://www.youtube.com/watch?v=xeHleGc-l6A','https://www.youtube.com/watch?v=xeHleGc-l6A','for-sale'),
	(41,'Moeskaer Crossfire 1474','0014-05-10','Semen for Sale','','<p>Moeskaer Crossfire 1474. &nbsp;Semen packages available. Limited doses. Low birth weights, strong growth.</p>','','TDP Crossover Z400','BBSF 303T Cindy 88Y','','','for-sale');

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
	(39,5,'/img/cattle/gallery/1442407631-Megan.jpg',''),
	(41,14,'/img/cattle/gallery/1442407721-PEARL.jpg',''),
	(115,12,'/img/cattle/gallery/1442407303-FANNY.jpg',''),
	(178,30,'/img/cattle/gallery/1459546965-Ripley Fabb Herd.JPG',''),
	(180,15,'/img/cattle/gallery/1459548047-Beauty Family.JPG',''),
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
	(209,4,'/img/cattle/gallery/Kema.JPG',''),
	(213,31,'/img/cattle/gallery/1460748367-Pacman picture.jpg',''),
	(225,21,'/img/cattle/gallery/1462041279-AXA Exceed.jpg',''),
	(228,22,'/img/cattle/gallery/1463514165-Mr You Tube 4Y.jpg',''),
	(234,6,'/img/cattle/gallery/1459551118-Princess Family.JPG',''),
	(235,6,'/img/cattle/gallery/1459551124-Princess Family (2).jpg',''),
	(237,34,'/img/cattle/gallery/1465592586-Keepsake 1218 2.jpg',''),
	(238,33,'/img/cattle/gallery/1465592352-Tracy 1295.jpg',''),
	(239,36,'/img/cattle/gallery/1465593353-Tortuga bull calf 93.jpg',''),
	(245,16,'/img/cattle/gallery/1465594853-Moeskaer Keepsake 1158.jpg',''),
	(246,35,'/img/cattle/gallery/1465595015-Dorepoll 1 Katie .jpg',''),
	(249,24,'/img/cattle/gallery/1478460096-crossfire2.jpg',''),
	(250,39,'/img/cattle/gallery/1478460520-pacman.jpg',''),
	(253,37,'/img/cattle/gallery/1478461045-Fabb 1 Nichoson.jpg',''),
	(261,41,'/img/cattle/gallery/1483833683-crossfire2.jpg',''),
	(268,40,'/img/cattle/gallery/1478461445-Fabb 1 Noak.jpg','');

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
	(4,'Dan Fabb','dan.fabb@drafabb.co.uk','07970901267','test','2016-03-04 14:12:50'),
	(5,'test','test','test','test','2016-04-25 23:04:21'),
	(6,'trevor foster','carolfoster62@gmail.com','07835970194','hello, I am looking for 40 incalf cows or breeding females with spring born calves at foot to start a small closed herd preferably from one holding. perhaps you can help or point me in the right direction to source some. thankyou, I look forward to hearing from you. yours, trevor foster.','2016-05-04 23:10:59'),
	(7,'Emily','mpmesezgtgs@gmail.com','Emily','Hello my name is Emily and I just wanted to drop you a quick note here instead of calling you. I discovered your The FABB Herd | Contact Us website and noticed you could have a lot more visitors. I have found that the key to running a popular website is making sure the visitors you are getting are interested in your subject matter. There is a company that you can get keyword targeted visitors from and they let you try their service for free for 7 days. I managed to get over 300 targeted visitors to day to my website. Visit them here: http://janluetzler.de/5ier','2016-05-05 19:50:02'),
	(8,'Andrew Packard - H Packard & Son','andrew.packard@btopenworld.com','07923513082','Lovely to speak to you today - looking forward to seeing you at the Suffolk show (we always go on Thursday) and meeting your cattle.','2016-05-10 11:45:38'),
	(9,'Brian Sinnett','brian@sinnett1.freeserve.co.uk','07774831561','I am looking for two or three pedigree poled Hereford heifers which will bull in July.  ','2016-05-24 18:55:36'),
	(10,'John watkins','Watkins 647@ btinternet .com','07885851149','Good afternoon I was inquire in if you have any of this years heifer calves still for sale ? .If so could you give me a rough guide of prices please .Regards John','2016-05-29 13:00:48'),
	(11,'Harriet Jackson','harrietsherd@hotmail.com','07515459383','Hi, I see you have some heifers for sale, and was wondering what sort of price you are looking for?\nI live in Hampshire and am starting up my own herd, I currently have 2 Herefords and a selection of other breeds. My parents run a suckler herd. we also show our cattle and I want to expand my herd.\nMany thanks ','2016-06-08 12:02:22'),
	(12,'Natalie','uacret@googlemail.com','Natalie','Hi my name is Natalie and I just wanted to send you a quick message here instead of calling you. I discovered your The FABB Herd | Contact Us website and noticed you could have a lot more visitors. I have found that the key to running a popular website is making sure the visitors you are getting are interested in your website topic. There is a company that you can get keyword targeted traffic from and they let you try the service for free for 7 days. I managed to get over 300 targeted visitors to day to my website. Check it out here: http://mariowelte.de/26zz','2016-06-08 21:06:13'),
	(13,'Gordon Parker','GNP.parker@gmail.com','07767 323273','Does your herd live out throughout the year,they would need to if I chose to form a herd for my farm in North Yorkshire.\nThanks.','2016-07-15 09:39:58'),
	(14,'Janessa','wwfnjiusr@derkras.com','Janessa','Hello my name is Janessa and I just wanted to send you a quick message here instead of calling you. I discovered your The FABB Herd | Contact Us page and noticed you could have a lot more hits. I have found that the key to running a successful website is making sure the visitors you are getting are interested in your subject matter. There is a company that you can get keyword targeted traffic from and they let you try the service for free for 7 days. I managed to get over 300 targeted visitors to day to my website. http://outin.space/1zyat','2016-08-02 21:02:05'),
	(15,'Andrew Williams','thestocks@btconnect.com','01691622646','I am interested in buying a young bull to put with my holstein heifers but must be IBR BVD, lepto & johnnes free  as i am a high health herd    ','2016-08-06 17:36:31'),
	(16,'Arthur De Val','arthurdeval@hotmail.com','01822 860321','Considering starting a small nucleus pedigree herd of Herefords or North Devons, prefer to buy privately if possible. Starting with 4 in calf heifers then to A.I., for budgeting purposes what is your typical price for Hereford in calf heifers.','2016-08-26 20:39:52'),
	(17,'Tony smith','tony.smith114@yahoo.com','07507780092','Hi looking for some info . I have 3 short legged Dexter cows . As a hobby . Was thinking to get a Hereford bull to run with them . Do you think it would work or would a Hereford be to heavy . Hope you can help .','2016-09-15 08:18:01'),
	(18,'Teresa','jvyzkaej@blaseiva.com','Teresa','Hello my name is Teresa and I just wanted to drop you a quick note here instead of calling you. I came to your The FABB Herd | Contact Us website and noticed you could have a lot more traffic. I have found that the key to running a popular website is making sure the visitors you are getting are interested in your subject matter. There is a company that you can get keyword targeted visitors from and they let you try the service for free for 7 days. I managed to get over 300 targeted visitors to day to my website. http://www.v-diagram.com/2sv1p','2016-09-15 17:15:45'),
	(19,'Loraine','mjgagiln@gratainmet.com','Loraine','Hi my name is Loraine and I just wanted to send you a quick message here instead of calling you. I came to your The FABB Herd | Contact Us page and noticed you could have a lot more visitors. I have found that the key to running a popular website is making sure the visitors you are getting are interested in your website topic. There is a company that you can get keyword targeted traffic from and they let you try the service for free for 7 days. I managed to get over 300 targeted visitors to day to my site. http://www.inflightvideo.tv/a/55     - Unsubscribe here: http://misdivi.de/e8','2016-10-10 08:47:32'),
	(20,'Dermot McCarthy','dermot1carty@gmail.com ','0353872707884','I am looking for an available embryo list and prices for same, thanks.','2016-10-18 19:59:18'),
	(21,'Alisa','wxfbsmdj@beagrinbol.com','Alisa','Hi my name is Alisa and I just wanted to send you a quick message here instead of calling you. I discovered your The FABB Herd | Contact Us page and noticed you could have a lot more hits. I have found that the key to running a successful website is making sure the visitors you are getting are interested in your subject matter. There is a company that you can get keyword targeted visitors from and they let you try the service for free for 7 days. I managed to get over 300 targeted visitors to day to my website. http://acortarurl.es/15     - Unsubscribe here: http://gd.is/y/eyzsv','2016-10-19 22:35:00'),
	(22,'Mark ','rockwoodster-angus@yahoo.co.uk','07486004374','Hi, got your txt re heifers, thanks very much, tried calling so thought to send you an email, perhaps you could email details, much appreciated, best regards, Mark.','2016-10-25 14:28:51'),
	(23,'Rebecca','gjwvavztay@renarcteal.com','Rebecca','Hello my name is Rebecca and I just wanted to send you a quick note here instead of calling you. I discovered your The FABB Herd | Contact Us page and noticed you could have a lot more visitors. I have found that the key to running a popular website is making sure the visitors you are getting are interested in your website topic. There is a company that you can get keyword targeted traffic from and they let you try their service for free for 7 days. I managed to get over 300 targeted visitors to day to my site. http://r.advantech.com/ng','2016-11-19 22:27:05'),
	(24,'Britney','wwhhppn@earthlink.net','Britney','Hi my name is Britney and I just wanted to drop you a quick note here instead of calling you. I came to your The FABB Herd | Contact Us website and noticed you could have a lot more visitors. I have found that the key to running a popular website is making sure the visitors you are getting are interested in your website topic. There is a company that you can get keyword targeted traffic from and they let you try the service for free for 7 days. I managed to get over 300 targeted visitors to day to my website. http://likes.avanimisra.com/4ox2','2016-11-29 14:19:30'),
	(25,'Jennifer','zlnnuwzd@gmail.com','Jennifer','I decided to leave a message here on your The FABB Herd | Contact Us page instead of calling you. Do you need more likes for your Facebook Fan Page? The more people that LIKE your website and fanpage on Facebook, the more credibility you will have with new visitors. It works the same for Twitter, Instagram and Youtube. When people visit your page and see that you have a lot of followers, they now want to follow you too. They too want to know what all the hype is and why all those people are following you. Get some free likes, followers, and views just for trying this service I found: http://8si.ru/2gerk','2016-12-03 08:27:19'),
	(26,'Livia Schacter','uppsyyennw@ymail.com','Livia Schacter','Do you need more traffic to your website or more product sales? Get 500 free keyword targeted visitors just for trying the 7 day free trial: http://iscripts.co/r','2016-12-07 17:47:22'),
	(27,'Evelyn Serrell','vymuudhbn@dotnog.com','Evelyn Serrell','This is a memo to the webmaster. I came to your The FABB Herd | Contact Us page by searching on Google but it was hard to find as you were not on the first page of search results. I know you could have more traffic to your site. I have found a site which offers to dramatically improve your rankings and traffic to your site: http://dtl.la/tmJ9x I managed to get close to 500 visitors/day using their services, you can also get many more targeted traffic from search engines than you have now. Their services brought significantly more traffic to my site. I hope this helps!','2016-12-12 18:42:15'),
	(28,'Evelyn Serrell','bxsiitcze@hxwbdsg.com','Evelyn Serrell','This is a comment to the webmaster. I came to your The FABB Herd | Contact Us page by searching on Google but it was difficult to find as you were not on the front page of search results. I know you could have more traffic to your site. I have found a site which offers to dramatically improve your website rankings and traffic to your website: http://webhop.se/1ix I managed to get close to 500 visitors/day using their service, you could also get a lot more targeted visitors from Google than you have now. Their service brought significantly more visitors to my website. I hope this helps!','2016-12-16 00:13:23'),
	(29,'dan','dan.fabb@drafabb.co.uk','07970901267','test','2016-12-19 22:56:58'),
	(30,'Evelyn Serrell','uosgtbqofsh@ofukmbafai.com','Evelyn Serrell','This is a message to the website creator. I discovered your The FABB Herd | Contact Us page by searching on Google but it was difficult to find as you were not on the first page of search results. I know you could have more traffic to your site. I have found a company which offers to dramatically improve your website rankings and traffic to your site: http://re2l.in/1fe I managed to get close to 500 visitors/day using their services, you could also get a lot more targeted visitors from Google than you have now. Their service brought significantly more visitors to my site. I hope this helps!','2016-12-20 01:48:24'),
	(31,'Evelyn Serrell','oirdrlre@edbnnoe.com','Evelyn Serrell','This is a memo to the website creator. I discovered your The FABB Herd | Contact Us page by searching on Google but it was difficult to find as you were not on the first page of search results. I know you could have more visitors to your website. I have found a site which offers to dramatically improve your rankings and traffic to your site: http://hud.sn/6sk5 I managed to get close to 500 visitors/day using their service, you can also get many more targeted traffic from Google than you have now. Their services brought significantly more visitors to my site. I hope this helps!','2016-12-23 10:21:50'),
	(32,'Barnypok','jfvynms4281rt@hotmail.com','60464537398','AFuf4w http://www.FyLitCl7Pf7ojQdDUOLQOuaxTXbj5iNG.com','2016-12-28 15:07:26'),
	(33,'Dan','Dan.fabb@drafabb.co.uk','07970901267','Test','2016-12-28 21:24:37'),
	(34,'Evelyn Serrell','kbacibct@tmbtlmvg.com','Evelyn Serrell','This is a message to the admin. I came to your The FABB Herd | Contact Us page by searching on Google but it was hard to find as you were not on the front page of search results. I know you could have more traffic to your site. I have found a company which offers to dramatically improve your rankings and traffic to your site: http://soiq.ch/pjj6 I managed to get close to 500 visitors/day using their services, you can also get a lot more targeted traffic from Google than you have now. Their services brought significantly more traffic to my website. I hope this helps!','2016-12-29 13:52:49'),
	(35,'Barnypok','jfvynms4281rt@hotmail.com','63917760210','4YA62e http://www.FyLitCl7Pf7ojQdDUOLQOuaxTXbj5iNG.com','2016-12-31 01:02:28'),
	(36,'Barnypok','jfvynms4281rt@hotmail.com','95242211775','wyAm9m http://www.FyLitCl7Pf7ojQdDUOLQOuaxTXbj5iNG.com','2016-12-31 10:57:56'),
	(37,'Barnypok','jfvynms4281rt@hotmail.com','89370879287','zQrVZc http://www.FyLitCl7Pf7ojQdDUOLQOuaxTXbj5iNG.com','2016-12-31 22:56:32'),
	(38,'Barnypok','jfvynms4281rt@hotmail.com','85234614496','gu8IXz http://www.FyLitCl7Pf7ojQdDUOLQOuaxTXbj5iNG.com','2017-01-01 04:21:41'),
	(39,'Barnypok','jfvynms4281rt@hotmail.com','66013294118','IcNJpa http://www.FyLitCl7Pf7ojQdDUOLQOuaxTXbj5iNG.com','2017-01-01 11:55:26'),
	(40,'Barnypok','jfvynms4281rt@hotmail.com','37674635851','urD4qs http://www.FyLitCl7Pf7ojQdDUOLQOuaxTXbj5iNG.com','2017-01-02 16:45:55'),
	(41,'Barnypok','jfvynms4281rt@hotmail.com','46116544311','cM5m0R http://www.FyLitCl7Pf7ojQdDUOLQOuaxTXbj5iNG.com','2017-01-04 14:58:06'),
	(42,'Barnypok','jfvynms4281rt@hotmail.com','47180125686','9FPWYD http://www.FyLitCl7Pf7ojQdDUOLQOuaxTXbj5iNG.com','2017-01-05 08:40:10'),
	(43,'Barnypok','jfvynms4281rt@hotmail.com','79424564496','ru1a9W http://www.FyLitCl7Pf7ojQdDUOLQOuaxTXbj5iNG.com','2017-01-07 20:18:03'),
	(44,'Mr M Aves','m.aves@outlook.com','07979470566','Hello,\n\nI am looking for a bull this month, to put to a commercial herd, have you got anything that is suitable for heifers? \n\nAlso what sort of price range do you have?\n\nLook forward to hearing from you. \n\nThanks Michael  ','2017-01-08 19:26:51'),
	(45,'D S & W Shores Taylor','w.shorestaylor@btinternet.com','07774225714','Do you have any steers for sale between 9 months & 12 months?\n','2017-01-10 14:51:51'),
	(46,'Natalie Murray','tonmhmvqqjw@ishwydwy.com','Natalie Murray','Hello my name is Natalie Murray and I just wanted to send you a quick note here instead of calling you. I discovered your The FABB Herd | Contact Us website and noticed you could have a lot more hits. I have found that the key to running a popular website is making sure the visitors you are getting are interested in your subject matter. There is a company that you can get keyword targeted traffic from and they let you try their service for free for 7 days. I managed to get over 300 targeted visitors to day to my site. http://s.t0m-s.be/5q\r\nNatalie Murray http://dimano.ru/33j','2017-01-12 00:16:20'),
	(47,'Julian Cooper','juliancooper.mkt@gmail.com','844-287-6371','Do you wish you could increase your online leads? We have helped a lot of businesses thrive in this market and we can help you! Simply hit reply and Iâ€™ll share with you the cost and the benefits.','2017-01-13 04:42:49'),
	(48,'Julian Cooper','juliancooper.mkt@gmail.com','844-287-6371','Do you wish you could increase your online leads? We have helped a lot of businesses thrive in this market and we can help you! Simply hit reply and Iâ€™ll share with you the cost and the benefits.','2017-01-13 04:42:53'),
	(49,'Jacomina Warner','jacominawarner.mkt@gmail.com','844-287-6371','Do you wish you could increase your online leads? We have helped a lot of businesses thrive in this market and we can help you! Simply hit reply and Iâ€™ll share with you the cost and the benefits.','2017-01-16 08:58:21'),
	(50,'Jacomina Warner','jacominawarner.mkt@gmail.com','844-287-6371','Do you wish you could increase your online leads? We have helped a lot of businesses thrive in this market and we can help you! Simply hit reply and Iâ€™ll share with you the cost and the benefits.','2017-01-16 08:58:24'),
	(51,'h elliott','cowshill@btconnect.com','01388537600','how much will semen from wll global force 7x cost','2017-01-20 20:11:13'),
	(52,'Chris','Chrisikin01@aol.com','07768918228','Please can you give me price for 10 straws of pacman','2017-01-22 19:49:56');

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
	(8,'2016-03-26','Global Force 7X Young Bulls','Two Global Force 7x sired Young Bulls, For Sale from the Fabb Herd Pedigree Polled Herefords','<p>Fabb Herd has two Young Bull from the Candian Sire Global Force 7x. Global Force 7x is an Extremely Dark coloured Bull with really Good muscle. We are really excited by his offspring. The Fabb herd first Global Force sired Calf was a young Heifer we imported from Demark. We had great sucess showing this animal the following year, and decided it would be a Good choice of Hereford Bull to use in our Herd.</p>'),
	(11,'2016-04-26','Polled Hereford Bulls','Fabb Herd has Polled Hereford Bulls and Polled Hereford Heifers for sale. Genetics have been imported from Demark, Canada and North America.','<p><a href=\"../../../cattle/for-sale\">Polled Hereford Bulls</a>&nbsp;and Heifers available from the<a href=\"../../../\"> Fabb Herd</a>. We Have a Small number Pedigree Polled Hereford Bull and Heifers for sale. Two of the younger Bulls are out of the sire <a href=\"../../../cattle/ai-sires#Wll-Global-Force-7X\">WLL Global Force</a>, these both have great muscle, excellent growth and a Dark coat. Please feel free to&nbsp;<a href=\"../../../contact\">contact us</a> if you require any further information.</p>'),
	(12,'2016-05-03','Polled Hereford Heifers','Hereford Heifers from the Fabb Herd Polled Herefords','<p><a href=\"http://fabbherd.com/cattle/for-sale#Spring-2015-heifers\">Hereford Heifers For Sale</a></p>\r\n<p>Fabb 1 Mia First in class in the National&nbsp;<a href=\"../../../\">Hereford Calf</a> show 2015.</p>\r\n<p>Fabb 1 Miss Annie Rose second in class at the National Hereford Calf show 2015.</p>\r\n<p>Fabb 1 Nancy, a strong medium framed calf sired by <a href=\"http://fabbherd.com/cattle/ai-sires#Wll-Global-Force-7X\">Global Force 7X.</a></p>\r\n<p>Fabb 1 Princess Elsa, Strong Medium framed calf with nice dark coat, and great muscle.</p>');

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
	(87,8,'/img/news/1459018572-Global Force (2).JPG'),
	(91,11,'/img/news/1461702394-Fabb Herd Logo.jpg'),
	(92,12,'/img/news/1462308929-Fabb Herd Polled Herefords.jpg'),
	(93,12,'/img/news/1462308948-Polled Herefords.jpg');

/*!40000 ALTER TABLE `tbl_news_photos` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tbl_pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_pages`;

CREATE TABLE `tbl_pages` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `page_title` varchar(180) DEFAULT NULL,
  `url` varchar(20) NOT NULL,
  `description` text,
  `html` text NOT NULL,
  `header` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `tbl_pages` WRITE;
/*!40000 ALTER TABLE `tbl_pages` DISABLE KEYS */;

INSERT INTO `tbl_pages` (`id`, `title`, `page_title`, `url`, `description`, `html`, `header`)
VALUES
	(1,'Home','Pedigree Polled Hereford Cattle For Sale UK | Hereford Cows and Bulls Breeders|The FABB Herd','home','We Offer Pedigree Polled Herefords Cattle, a herd built using Top Animals and Genetics from around the world. Pedigree Polled Bulls, Cows and Heifers for sale in UK, from Elite High Health Status Herd.','<p><img src=\"../../../img/red%20tractor%20logo.jpg\" alt=\"\" width=\"10%\" align=\"left\" /><img src=\"../../../img/high%20health.png\" alt=\"\" width=\"12%\" align=\"right\" /></p>\r\n<div id=\"large-logo\"><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../../img/logo%20clear.png\" alt=\"\" width=\"70%\" /></div>\r\n<h3>Pedigree Polled Hereford cattle, a Herd built using Top Hereford Bulls and Hereford Genetics from around the World. Our focus is on producing a milky and muscular Polled Hereford herd, with great maternal instinct, low birth weights and strong growth. Genetics are selected for there ability to product quality beef from grass based diets.</h3>\r\n<h3>Pedigree Polled Bulls and Pedigree Polled Heifers from Elite High Health Status Herd.&nbsp;Always a good selection of Pedigree Hereford cattle for sale, including Hereford Bulls with elite outcross genetics. &nbsp;</h3>','/img/headings/1436052552-home-bg.jpg'),
	(2,'About','About Us | Suppliers of Hereford Bulls and Females | Fabb herd Pedigree Herefords','about','We are Pedigree Polled Hereford Breeders consisting of around 60 polled Hereford Cows, built up from mainly imported Polled Herefords and Hereford Genetics','<p style=\"text-align: center;\"><strong>The Fabb Herd Pedigree Herefords, was started&nbsp;by partners Daniel Fabb and Helen Parr. Based in Cambridgeshire a TB4 area and Elite Herd Health Status with SAC. Free from BVD, IBR, Johne\'s Disease(level 1) and Leptospirosis.<br /></strong></p>\r\n<p style=\"text-align: center;\"><strong>The Herd consists of around 60 Polled Hereford cows. Wanting to progress with different blood lines, we have imported 20 Hereford Heifers and 2 Hereford Bulls from Denmark over the past 3 years. We use 12 different Hereford AI sires.&nbsp;</strong><strong>These Have been carefully selected to suit the Hereford Female.</strong></p>\r\n<p style=\"text-align: center;\"><strong>&nbsp;Hereford Sires used within our Herd include the The Wonderer, Square-D Diesel, Remital Pilgrim, Classic 1 Galaxy, Wll Global Force 7X, Mr Youtube, Haroldson Title shot, Moeskaer Keyman, Moeskaer Keno, Moeskaer Pacman, Day Calibre, Moeskaer Crossfire and Square-D Tortuga.</strong></p>\r\n<p style=\"text-align: center;\"><strong>Polled Hereford cow families include Moeskaer Pearl from the Canadian Family Square D Pearl 37M. <a href=\"../../../cattle/females#Moeskaer-Donna\">Moeskaer Donna 1424</a>, Moeskaer Megan 1437 whos sister was dam to the Swedish National champion Bull, Moeskaer Tracy 1295, <a href=\"../../../cattle/females#Moeskaer-Fanny-1455\">Moeskaer Fanny 1455</a>, <a href=\"../../../cattle/females#Moeskaer-Keepsake-1218\">Moeskaer Keepsake 1218</a>,<a href=\"../../../cattle/females#Moeskaer-Keepsake\"> Moeskaer Keepsake 1448</a>, <a href=\"../../../cattle/females#Princess-Family\">Moeskaer Princess 1395</a>, <a href=\"../../../cattle/females#Moeskaer-Alma\">Moeskaer Alma 1423</a>, <a href=\"../../../cattle/females#Moeskaer-Flora\">Moeskaer Flora 1432 </a>top 1% for 200/400/600 days weight,&nbsp;<a href=\"../../../cattle/females#Moeskaer-Beauty\">Moeskaer Beauty 1470</a></strong><strong>. Hartshorne Families and the Fabb Families</strong></p>\r\n<p style=\"text-align: center;\"><strong>We serve the Majority of the herd Via AI. We are also running an intensive embryo program.&nbsp; Enabling us to use top Hereford genetics from around the world to further improve the herd.</strong></p>\r\n<p style=\"text-align: center;\"><strong>We always have Polled Hereford Bulls and Polled Hereford Females for sale, we welcome visitors at any time.</strong></p>\r\n<p style=\"text-align: center;\"><strong> Please <a href=\"../../../contact\">Contact us</a>&nbsp;with any questions.</strong></p>','/img/headings/1436052581-about-bg.jpg'),
	(3,'News','Hereford Heifers and Bulls | Polled Hereford Cattle News | Fabb herd','news','Keep up to date with our latest news and stories about the Polled Hereford Cattle, including Heifers, bulls and Cows from the Fabb Herd. Hereford breeders based in Cambridgeshire.','<p>The Latest Polled Hereford News</p>\r\n<p>{_news_}</p>','/img/headings/1463517516-Hereford Calves.jpg'),
	(4,'Herd Sires','Hereford Sires UK | Fabb Herd Pedigree Herefords','cattle/herd-sires','Poll Hereford Bulls are selected to improve a Particular traits in the Herd. See details of our Polled Hereford Sires currently in use on our Cambridgeshire Farm.','<p><strong>The Poll Hereford Bulls are selected to improve particular traits in our Herd. Our main priorities are Milk, Muscle and Calving ease. Our Current Herd sires are Moeskaer Pacman and Moeskaer Crossfire. Both these Bulls to us, represent the direction the Hereford Breed should be heading. We Have offspring from both these Hereford Bulls available in 2017.</strong></p>\r\n<p>{_cattle_}</p>','/img/headings/1478462330-crossfire2.jpg'),
	(5,'AI Sires','Hereford AI Sires, Bulls | Top Quality Polled Hereford Genetics | Fabb Herd','cattle/ai-sires','We offer Hereford Ai Sires, Bulls For Sale UK. We use top Hereford Genetics from around the world, talk to us about you requirements.','<p><strong>Top Quality Polled Hereford Genetics from around the World. Selecting Hereford Bulls to bring beneficial traits to our Herd. Exciting outcross Hereford Genetics to suit our wide variation of Polled Hereford Females. We have used 12 Ai Sires during the past 2 years. These have been selected to try and improve traits, in the Hereford Heifer or Hereford Cow they are being used on. The use of Ai Sires enables us to use Hereford Bulls which are suitable matched to the female being served. It would be impossible to do this using Hereford bulls alone, and allows us to bring in outcross genetics to the herd with ease.&nbsp;</strong></p>\r\n<p>{_cattle_}</p>','/img/headings/1436052666-cattle-bg.jpg'),
	(6,'Females','Hereford Heifers | Polled Hereford Cows, Females and Calves | FABB Herd','cattle/females','Take a look at the Fabb Herd Females. Weâ€™ve around 60 Polled Hereford Cows, in the herd at present on our Cambridgeshire farm.','<p><strong>Polled Hereford Female Families, selected for there fertility, paternal instinct and milk. We have Dams from some of the top Polled Hereford Females in Canada, Denmark and the UK. We have imported over 20 Hereford Heifers and Hereford Cows over the past 3 years. Along with a large amount of embroys. This has given us a wide varity of unique Hereford Females not often seen in uk herds. Sires are carefully selected to best suit the Hereford heifer or Hereford Cow. We have Hereford Calves from a wide range of gentics, herd repalcements are selected from these. We always have Top quality Hereford Females for sale.&nbsp;</strong></p>\r\n<p>{_cattle_}</p>','/img/headings/1463595844-1461622814-Fabb Herd Polled Herefords.jpg'),
	(7,'For Sale','Polled Hereford Bulls For Sale | Fabb Herd Pedigree Herefords','cattle/for-sale','Polled Hereford Bulls, Polled Hereford Females and Polled Hereford Genetics are always available for sale. We are Happy to flush any Hereford Females to selected Sires.','<p><strong>Polled Hereford Bulls, Polled Hereford Females and Polled Hereford Genetics are always available, we are Happy to flush any Hereford Females to Selected Sire. We always have a good selection of Polled Hereford Bulls for sale from a wide range of genetics. This gives our customers a good variety of outcross Bulls. We are happy to arrange fertiltity testing for any of the Polled Hereford Bulls we have for sale. We have semen Available from a selction of Polled Hereford Bulls.</strong></p>\r\n<p style=\"text-align: center;\"><strong><span style=\"text-decoration: underline;\">CLICK ON PICTURES BELOW FOR FURTHER DETAILS.</span></strong></p>\r\n<p>{_cattle_}</p>','/img/headings/1436052707-BG-1.jpg'),
	(8,'Blog','Blog | Fabb Herd Pedigree Herefords','blog','Know about the latest goings on, news and information on Hereford Cattle and Hereford Genetics. Polled Herefords from the Fabb Herd Polled Herefords.','<p>Polled Hereford News and Information, from the Fabb Herd Polled Herefords. Keep up to date with all the latest goings on in the Hereford Cattle World!</p>\r\n<p>&nbsp;</p>\r\n<p>{_posts_}</p>','/img/headings/1463517310-Polled Hereford Cattle.JPG'),
	(9,'Contact','The FABB Herd | Contact Us','contact','Wilsons Orchard Farm, Fenside Rd, Warboys, CAMBS, PE28 2TY. Our farm is located in Cambridgeshire. Contact us to know more about our Pedigree Hereford Cattle.','<center><strong>Fabb Herd Polled Herefords</strong></center><center><strong>Wilsons Orchard Farm,</strong><br /><strong>Fenside Road,</strong><br /><strong>Warboys,</strong><br /><strong>Cambs</strong><br /><strong>PE28 2TY</strong></center><center><strong>Tel 01487 822224</strong></center><center><strong>Mobile 07584 035080</strong></center><center><strong>helen@fabbherd.com</strong></center><form id=\"contact-form\" action=\"/contact.php\" method=\"post\">\r\n<h3>Please fill in the form below to send us a message and we will reply to you as soon as possible where appropriate.</h3>\r\n<input name=\"name\" type=\"text\" placeholder=\"Name\" data-required=\"true\" /><br /> <input name=\"email\" type=\"text\" placeholder=\"Email address\" data-required=\"true\" /><br /> <input name=\"phone\" type=\"text\" placeholder=\"Phone number\" data-required=\"false\" /><br /> <textarea name=\"message\" placeholder=\"Message\" data-required=\"true\"></textarea><br /> <input name=\"submitted\" type=\"hidden\" value=\"TRUE\" /> <input name=\"send\" type=\"submit\" value=\"Send Message\" /></form>','/img/headings/1442409213-view.jpg');

/*!40000 ALTER TABLE `tbl_pages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tbl_posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_posts`;

CREATE TABLE `tbl_posts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(250) DEFAULT NULL,
  `page_title` varchar(250) DEFAULT NULL,
  `url` varchar(80) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `description` text,
  `html` text,
  `date_added` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `tbl_posts` WRITE;
/*!40000 ALTER TABLE `tbl_posts` DISABLE KEYS */;

INSERT INTO `tbl_posts` (`id`, `title`, `page_title`, `url`, `date`, `description`, `html`, `date_added`)
VALUES
	(1,'Polled Herefords','Polled Hereford bulls','polled-hereford-bull','2016-05-09','Polled hereford Bull sold to local cambridgeshire commercial suckler herd.','<p style=\"text-align: center;\"><span style=\"text-decoration: underline;\"><strong>Fabb Herd Polled Herefords Blackwell 1 Hector</strong></span></p>\r\n<p style=\"text-align: center;\"><img src=\"../../../img/Fabb%20Herd%20Polled%20Hereford%20Hector.JPG\" alt=\"Polled Hereford Bull\" width=\"688\" height=\"516\" /></p>\r\n<p>&nbsp;</p>\r\n<p style=\"text-align: center;\">Hector&nbsp;<a href=\"../../../\">Polled Hereford Bull</a> has been one of our stock bulls, serving our commercials for the last 4 years. We are really pleased that now his time has come to move on he isnt going far!&nbsp; Being&nbsp; one of our foundation bulls at the&nbsp;<a href=\"../../../\">Fabb Herd</a> it will still be extremely sad to see him leave. </p>','2016-05-09 23:48:33'),
	(2,'Fabb 1 Mad Hatter reserve breed champion','Kathy Fenn takes Reserve Breed Champion at Notts Show','Reserve-breed-Champion-Notts','2016-05-17','Young Hereford Heifer Purchased from the Fabb Herd Polled Herefords takes Reserve Breed Champion at Nottinghamshire County Show. Excellent result for Kathy Fenn at her first show.','<p>The&nbsp;<a href=\"../../../\">Fabb herd</a> is delighted with the result of Nottinghamshire County Show. Fabb 1 Mad Hatter was Placed as Reserve Breed Champion with her new owner Kathy Fenn.</p>\r\n<p><img src=\"../../../img/kathy%20Notts%20Show.jpg\" alt=\"Reserve Breed Champion\" width=\"363\" height=\"519\" /></p>\r\n<p>Fabb 1 Mad Hatter and Fabb 1 Miss Sunshine, where purchased from the<a href=\"../../../\"> Fabb Herd Polled Herefords</a> back in March. Kathy, Ann and Dave Fenn where looking for good quality <a href=\"../../../cattle/females\">Hereford Heifers</a>, to start there own Pedigree&nbsp;<a href=\"../../../cattle/females\">Polled Hereford</a> Herd. We wish Kathy and Jupiter Herefords all the best for the Future.</p>','2016-05-17 20:33:02'),
	(3,'Polled Hereford -Fabb Herd 2015 Shows','Fabb Herd Polled Hereford, Breeders and Genetics for Canada, Denmark and Uk','shows-15','2016-05-28','The highlights of our 2015 Show season. Pedigree Polled Hereford Bulls and Heifers always available. Outcross Genetics sourced from Europe and Canada. Our ethos is Muscle and Milk, strong growth rates with small birth weights. We Have around 60 cows of which a large percentage a served by AI. This enables us to keep a diverse, and wide range of Young Hereford Heifers, and Hereford Bulls available for sale.','<p style=\"text-align: center;\"><img src=\"../../../img/Shows%202015.png\" alt=\"\" width=\"912\" height=\"1293\" /></p>','2016-06-05 21:41:24'),
	(4,'Hereford Bull Suffolk Show Success','Hereford Bull Suffolk Show','herefordsuffolk','2016-06-07','Hereford Bull from Fabb Herd, Male Champion Hereford at Suffolk Show 2016.','<p style=\"text-align: center;\"><span style=\"text-decoration: underline;\"><strong><a href=\"../../../cattle/for-sale#Fabb-1-Macbeth\">Fabb 1 Macbeth</a>&nbsp;takes Male Champion Hereford at <a href=\"http://suffolkshow.co.uk\">Suffolk show</a>&nbsp;2016.&nbsp;</strong></span></p>\r\n<p style=\"text-align: center;\">Fabb 1 Macbeth, Polled Hereford Bull at 13 months of age. His weight at 12 months was 670kg.</p>\r\n<p><img src=\"../../../img/DAN_8148.jpg\" alt=\"\" width=\"100%\" /></p>\r\n<p style=\"text-align: center;\">The Fabb Herd has a selection of&nbsp;<a href=\"../../../cattle/for-sale\">Polled Hereford Bulls for sale</a>&nbsp;including Fabb 1 Macbeth.</p>\r\n<p style=\"text-align: center;\">Bulls also available for Canadian sire Wll Global Force 7X</p>\r\n<p style=\"text-align: center;\">Please <a href=\"../../../contact\">Contact us</a>&nbsp;for an further information.</p>','2016-06-15 19:50:24'),
	(5,'National Hereford Calf Show','Hereford Calf Show Agri Expo','Hereford Calf Show','2016-10-30','Fabb Herd Polled Herefords achieve great Result at National Hereford Calf Show at Agri Expo 2016','<p><img src=\"../../../img/Fabb%201%20Noah.jpg\" alt=\"\" width=\"1026\" height=\"683\" /></p>\r\n<p style=\"text-align: center;\"><span style=\"text-decoration: underline;\"><strong>Fabb 1 Noah.</strong></span></p>\r\n<p style=\"text-align: center;\"><strong><span style=\"text-decoration: underline;\">Reserve Male Champion National Hereford Calf Show 2016</span></strong></p>','2016-10-30 21:35:28'),
	(6,'Moeskaer Crossfire','Polled Hereford Bull returns to Fabb Herd Polled Herefords.','Moeskaer Crossfire Fabb Herd','2017-01-05','Semen collection from Moeskaer Crossfire goes well for Fabb Herd Polled Herefords.','<p style=\"text-align: left;\">After a busy time on Stud at Uk Sires, we are delighted to have Moeskaer Crossfire back home at Fabb Herd Polled Herefords. We managed to collect around 2500 straws of EU qualifiying Polled Hereford Semen. This will be used in AI and Flushing on our Polled Hereford Herd. A limited quanity will be sold to other Polled Hereford Breeders from around the world. Moeskaer Crossfire offers Power, Muscle and low bith weights. This along with impressive 200 and 400 day weights. With his first Polled Hereford Calves being born at an average of 33kg. We are really excited to see more of his offspring in the Future. Please contact <a href=\"mailto:Helen@fabbherd.com\">Helen@fabbherd.com</a>&nbsp;if you require any addtional information.</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;<img src=\"../../../img/headings/1478462330-crossfire2.jpg\" alt=\"\" width=\"804\" height=\"536\" /> &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p>','2017-01-05 20:16:41');

/*!40000 ALTER TABLE `tbl_posts` ENABLE KEYS */;
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
	(1,'admin','4f676f6371aeb213d74abe0bfbad5b1c','Fabb User','2014-12-14 11:20:45'),
	(2,'adminseo','E19D2815EC33F04814EA19CA39081F79','Admin SEO','2016-10-17 14:21:15');

/*!40000 ALTER TABLE `tbl_users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
