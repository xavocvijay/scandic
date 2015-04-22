# ************************************************************
# Sequel Pro SQL dump
# Version 4378
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 10.0.15-MariaDB)
# Database: scandic
# Generation Time: 2015-04-22 02:49:36 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table about
# ------------------------------------------------------------

DROP TABLE IF EXISTS `about`;

CREATE TABLE `about` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `year` int(11) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `about` WRITE;
/*!40000 ALTER TABLE `about` DISABLE KEYS */;

INSERT INTO `about` (`id`, `year`, `content`)
VALUES
	(1,2010,'aoeu'),
	(2,2011,'foobar\r\nfinished bleh\r\noh yea!');

/*!40000 ALTER TABLE `about` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table box
# ------------------------------------------------------------

DROP TABLE IF EXISTS `box`;

CREATE TABLE `box` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` text,
  `position` enum('left','right') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `box` WRITE;
/*!40000 ALTER TABLE `box` DISABLE KEYS */;

INSERT INTO `box` (`id`, `page_id`, `name`, `content`, `position`)
VALUES
	(1,23,'Policies Claims','Gross written premiums\r\nUnused premium reserves\r\nRBNS reserves\r\nPayouts\r\nDetaliziation to risk premiumsand insurance type\r\nCalculated amounts (derived KPIs)\r\nSales budgets','left'),
	(2,23,'Accumulated Capital for Life Insurance','Investment analysis\r\nAccumalated capital history tracking\r\nRBNS reserves\r\nPayouts\r\nDetaliziation to risk premiumsand insurance type\r\nCalculated amounts (derived KPIs)\r\nSales budgets','right'),
	(3,23,'Actuaries','Solvency II\r\nInsured amounts detalization on risk & insurance type levels','left'),
	(4,23,'Insurance Capitals','Client segmentation\r\nUnique clients indetification','right'),
	(5,23,'Reinsurance','Profitability\r\nRisk profiles\r\nReinsurance contracts','left'),
	(6,23,'Claims Management','Activity monitoring\r\nHandling times\r\nReserves and regresses','right'),
	(7,23,'Insurance Debtors or Creditors','Policy payment tracking by schedule\r\nIntermediary outstanding','left'),
	(8,23,'Insurance Market Analysis','Policy counts and premiums\r\nClaim counts and payouts','right');

/*!40000 ALTER TABLE `box` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table technology
# ------------------------------------------------------------

DROP TABLE IF EXISTS `technology`;

CREATE TABLE `technology` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content` text,
  `bullets` text,
  `position` enum('left','right','middle') DEFAULT NULL,
  `class` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `technology` WRITE;
/*!40000 ALTER TABLE `technology` DISABLE KEYS */;

INSERT INTO `technology` (`id`, `name`, `content`, `bullets`, `position`, `class`)
VALUES
	(1,'Business intelligence','At the very core of a BI solution there is a database. A lot of whether the BI solution is fast and responsive depends on the chosen underlying database. Scandic fusion works with variety of db technologies.\r\n','SybaseIQ\r\nPostgreSQL\r\nOracle db\r\nTeradata\r\nVertica\r\nSQL Server','left',NULL),
	(2,'Data mining and predictive analytics','Diam tortor tincidunt est, eget scelerisque elit diam quis tellus. Fusce vitae diam at massa consectetur auctor. Mauris iaculis molestie eros nec sagittis. Phasellus suscipit sagittis metus vitae fringilla.\r\n','Oracle Data Mining\r\nR\r\nSAP Infinite Insight\r\nWEKA\r\nSTATISTICA','right',''),
	(3,'Database','Business Intelligence software has a number of players in the market, which provide both enterprise-level and task-specific solutions.\r\n','SAP Business Objects\r\nQlik View\r\nOracle Business Intelligence\r\nSAS Visual Analytics\r\nTableau\r\nMicrostrategy','middle','step-2'),
	(4,'Extraction, transformation and load','Extraction, transformation and load of data help transfer data from source system and compose it in the database. Scandic Fusion works with a variety of tools, starting with great open source solutions and finishing with leading commercial software.\r\n','Pentaho data integration\r\nSAP data services\r\nOracle data integration\r\nInformatica','middle','step-3');

/*!40000 ALTER TABLE `technology` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table testimonial
# ------------------------------------------------------------

DROP TABLE IF EXISTS `testimonial`;

CREATE TABLE `testimonial` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `testimonial` WRITE;
/*!40000 ALTER TABLE `testimonial` DISABLE KEYS */;

INSERT INTO `testimonial` (`id`, `name`, `position`, `logo`, `content`)
VALUES
	(1,'Olga Pleyer','CEO, BOSCH Baltics','logo-bosch.svg','“Working with Scandic Fusion is a great professional experience: both in terms of quality of delivered service and in terms of communication between our companies. The industry Bosch in the Baltics works in is constantly evolving; therefore, we need flexibility and complex technical solutions from our suppliers. During one year of successful cooperation with Scandic Fusion we implemented core business analysis, cost allocation solution and budgeting solution. There are also several ongoing projects, and we are looking forward to continuing our successful partnership.”'),
	(2,'test','test','test','test');

/*!40000 ALTER TABLE `testimonial` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
