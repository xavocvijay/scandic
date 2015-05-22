-- MySQL dump 10.14  Distrib 5.5.40-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: mariadb    Database: scandic
-- ------------------------------------------------------
-- Server version	5.5.40-MariaDB-1~trusty-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `about`
--

DROP TABLE IF EXISTS `about`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `about` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `year` int(11) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `about`
--

LOCK TABLES `about` WRITE;
/*!40000 ALTER TABLE `about` DISABLE KEYS */;
INSERT INTO `about` VALUES (3,2007,'Beginning of the wonderful journey in BI world - starting with 2 first customers'),(4,2008,'Working hard on establishing the reputation for quality in the Latvian market\r\n3 active BI customers'),(5,2009,'4 active BI customers\r\nMilestone of 5 BI projects in total (we do grow despite economic recession in LV)'),(6,2010,'9 active BI customers\r\nMilestone of 10 BI projects in total'),(7,2011,'First major real-time DWH/BI project goes live\r\n11 active BI customers\r\nMilestone of 15 BI implementations in total'),(8,2012,'Another real-time DWH/BI project goes live\r\n12 active BI customers\r\nMobile BI solutions is actively used by first customers'),(9,2013,'Eagerly helping Latvian companies prepare for migration from LVL to EUR\r\nFirst development projects in the Nordics\r\n13 active BI customers\r\nMilestone of 20+ BI projects in total\r\nData mining becomes actively used by first customers'),(10,2014,'18 active BI customers\r\nMilestone of 25+ BI projects in total');
/*!40000 ALTER TABLE `about` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actions`
--

DROP TABLE IF EXISTS `actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` text,
  `page_id` int(11) DEFAULT NULL,
  `url` text,
  `icon` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions`
--

LOCK TABLES `actions` WRITE;
/*!40000 ALTER TABLE `actions` DISABLE KEYS */;
INSERT INTO `actions` VALUES (1,'About Scandic Fusion',38,'','scandic'),(2,'Meet our team',26,'','team'),(3,'Contact us',6,'','paper-plane'),(4,'Made By Agile55.com',NULL,'http://agile55.com/',NULL),(7,'Join our team',28,'','user-network'),(8,'Industry solutions',2,'',NULL),(9,'Cross company solutions',3,'',NULL),(10,'BI implementation',16,'',NULL),(11,'Maintenance & support',17,'',''),(12,'Licensing advisory',19,'',''),(13,'DWH & BI audit',20,'',''),(14,'Data exploration',21,'','');
/*!40000 ALTER TABLE `actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atk4_hp_session`
--

DROP TABLE IF EXISTS `atk4_hp_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atk4_hp_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `access_code` varchar(255) NOT NULL,
  `created_dts` datetime NOT NULL,
  `valid_seconds` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atk4_hp_session`
--

LOCK TABLES `atk4_hp_session` WRITE;
/*!40000 ALTER TABLE `atk4_hp_session` DISABLE KEYS */;
INSERT INTO `atk4_hp_session` VALUES (1,'edit_frontend',1,'atk4_hp_55291320bbfab','2015-04-11 13:27:12',28800),(2,'edit_frontend',1,'atk4_hp_552913475ce35','2015-04-11 13:27:51',28800),(3,'edit_frontend',1,'atk4_hp_55291359f2529','2015-04-11 13:28:09',28800),(4,'edit_frontend',1,'atk4_hp_552913655983c','2015-04-11 13:28:21',28800);
/*!40000 ALTER TABLE `atk4_hp_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block`
--

DROP TABLE IF EXISTS `block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system_name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `content` text,
  `page_id` int(11) NOT NULL,
  `order` int(11) DEFAULT NULL,
  `language` int(11) NOT NULL,
  `created_dts` datetime NOT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block`
--

LOCK TABLES `block` WRITE;
/*!40000 ALTER TABLE `block` DISABLE KEYS */;
INSERT INTO `block` VALUES (1,'h1_spot','h1',NULL,1,NULL,0,'2015-04-11 13:26:31',0),(2,'markdown','markdown','**aoeuauaoeuaoeu**\r\naoeuaou\r\n',1,NULL,0,'2015-04-11 13:26:31',0),(3,'h1_spot','h1',NULL,2,NULL,0,'2015-04-11 15:41:30',0),(4,'markdown','markdown',NULL,2,NULL,0,'2015-04-11 15:41:30',0),(5,'h1_spot','h1',NULL,3,NULL,0,'2015-04-11 15:41:41',0),(6,'markdown','markdown',NULL,3,NULL,0,'2015-04-11 15:41:41',0);
/*!40000 ALTER TABLE `block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `box`
--

DROP TABLE IF EXISTS `box`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `box` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` text,
  `position` enum('left','right') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `box`
--

LOCK TABLES `box` WRITE;
/*!40000 ALTER TABLE `box` DISABLE KEYS */;
INSERT INTO `box` VALUES (1,23,'Policies and claims','- Gross written premium  \r\n- Unused premium reserve  \r\n- RBNS reserve  \r\n- Payout  \r\n- Drilldown to risk premiums and insurance type  \r\n- Calculated amounts (derived KPIs)  \r\n- Sales budget  ','left'),(2,23,'Claims management','- Activity monitoring  \r\n- Handling time  \r\n- Reserves and regresse  ','right'),(3,23,'Actuaries','- Solvency II  \r\n- Insured amounts with drilldown to risk & insurance type level  ','left'),(4,23,'Insurance clients','- Client segmentation (new, returning, lost)  \r\n- Unique clients identification  ','right'),(5,23,'Accumulated capital for life insurance','- Investment analysis \r\n- Accumulated capital history tracking  ','left'),(7,23,'Insurance debtors/creditors','- Policy payment tracking by payment schedule  \r\n- Outstanding amounts balances of intermediarie','right'),(8,23,'Reinsurance','- Profitability  \r\n- Risk profile  \r\n- Reinsurance contract  ','left'),(9,24,'Core elements','- Products  \r\n- Accounts  \r\n- Customers   \r\n- Transactions/payments  \r\n- Account balances  \r\n- Payment cards','left'),(10,23,'Insurance market analysis','- Policy counts and premium  \r\n- Claim counts and payout  ','right'),(11,23,'Relevant cross company solutions','- [Management accounting](http://scandicfusion.daisy.agile55.com/frontend/public/solutions/solution1)  \r\n- [ERP solution](http://scandicfusion.daisy.agile55.com/frontend/public/solutions/erp-analysis)  \r\n- [KPI engine ](http://scandicfusion.daisy.agile55.com/frontend/public/solutions/kpi-engine) \r\n- [...and more ](http://scandicfusion.daisy.agile55.com/frontend/public/solutions) ','right'),(12,24,'Customer portfolio','- Customer portfolio over time (new/active/lost)  \r\n- Customer segmentation analytics  \r\n- Gross profitability  ','right'),(13,30,'Customers','Facility workload\r\nCustomer satisfaction\r\nCare plans analysis\r\nQueues \r\nChurn rates','left'),(14,30,'Facilities equipment','Supply management\r\nInventory analytics\r\nEquipment usage analytics','right'),(15,30,'Healthcare function','Connecting costs to job functions\r\nConnecting costs to healthcare process components','left'),(16,30,'Staffing','Personnel workload (per doctor/nurse/support staff)','right'),(17,30,'Relevant cross-company solutions','Management accounting\r\nERP solution\r\nKPI engine\r\n...and more','right'),(18,34,'Services portfolio','New services\r\nExisting services\r\nInstallation/removal of services\r\nPlanned vs. actual service performance\r\nService availability\r\nProduct bundling\r\nBenefit analysis','left'),(19,34,'Client portfolio','Loyalty (NPS)\r\nCustomer segmentation analysis (private/corporate, new/existing, buying/not buying valuable service packages etc)\r\nMarketing campaign influence on clients','right'),(20,34,'Customer service','Notifications by clients\r\nResolution times\r\nResolution feedback','left'),(21,34,'Customer call center (near real-time)','Number of calls by reasons\r\nRepeating/new calls\r\nResponse time\r\nCustomer feedback','right'),(22,34,'Relevant cross-company solutions','Mng accounting\r\nERP solution\r\nKPI engine\r\nCF forecasting\r\n...and more','left'),(23,36,'Manufacturing processes','Harvesting\r\nForwarding\r\nFell analysis\r\nLog yard analysis\r\nQA \r\nHarvester fleet','left'),(24,36,'Transportation','Logistics optimization\r\nTimber trailer fleet\r\nConsigned inventory tracking','right'),(25,36,'Sales','Measurement processes\r\nTimber\r\nSeedlings and seeds\r\nChips','left'),(26,36,'Relevant cross-company solutions','ERP solution\r\nKPI engine\r\nCF forecasting\r\nInvestment projects\r\n...and more','right'),(27,35,'Application analysis','Conversion ratios\r\nRejection analysis\r\nSales channels\r\nCustomer portfolio analysis','left'),(28,35,'Loan analysis','Surplus analysis\r\nCustomer segmentation\r\nPayment discipline','right'),(29,35,'Collection process','Collection workflow analysis\r\nCollection effectiveness','left'),(30,35,'Relevant cross-company solutions','Management accounting\r\nERP solution\r\nKPI engine\r\n...and more','right'),(31,32,'Discrete manufacturing ','- Raw materials purchase  \r\n- Product composition and setup monitoring  \r\n- Components tracking across manufacturing processes  \r\n- Components location tracking (within a warehouse)  \r\n- Advanced supply chain planning  ','left'),(32,32,'Flow manufacturing','- Raw materials purchase  \r\n- Operating time management and downtime planning  \r\n- Process control variable reporting  ','right'),(33,32,'Support services','- HR (employee competence assessment, allocation of resources)  \r\n- Safety regulations compliance  \r\n- Operations and job completion monitoring  ','left'),(34,32,'Sales','- Products sales  \r\n- Projects (turnkey solution) sales  \r\n- Services (information) sales ','right'),(35,32,'Outbound & inbound logistics','- On-time delivery management  \r\n- Carrier performance tracking  \r\n- Completion times optimization  ','left'),(36,32,'Post-sale customer care','- Warranty contracts  \r\n- Spare parts supply  \r\n- Calibration and repair  \r\n- Product software  services  ','right'),(37,32,'R&D','- Quality assurance and testing  \r\n- Extension of product line  \r\n- Precision management  \r\n- Production optimization  ','left'),(38,32,'Relevant cross-company solutions','- [Management accounting](http://scandicfusion.daisy.agile55.com/frontend/public/solutions/solution1)\r\n- [ERP analysis solution  ](http://scandicfusion.daisy.agile55.com/frontend/public/solutions/erp-analysis)  \r\n- [KPI engine ](http://scandicfusion.daisy.agile55.com/frontend/public/solutions/kpi-engine)   \r\n- [CF forecasting ](http://scandicfusion.daisy.agile55.com/frontend/public/solutions/cf-forecasting)   \r\n- [...and more  ](http://scandicfusion.daisy.agile55.com/frontend/public/solutions)  ','right'),(39,24,'Sales performance','- Sales person/ department performance by product  \r\n- Promotion and motivation management  \r\n- Fees and commission  ','left'),(40,24,'Deposits and investments','- Deposit portfolio  \r\n- Investment portfolio ','right'),(41,24,'Loans','- Loan portfolio (secured, unsecured, restructured, bad debts)  \r\n- Income on loans\r\n- Project and trade financing  \r\n- Retail lending  ','left'),(42,24,'Other financial instruments and services','- Bonds\r\n- Forex  \r\n- Brokerage services  \r\n- Fiduciary operations  \r\n- Documentary operations  \r\n','right'),(43,24,'Relevant cross company solutions','- [Management accounting](http://scandicfusion.daisy.agile55.com/frontend/public/solutions/solution1)  \r\n- [Customer & product portfolio analysis](http://scandicfusion.daisy.agile55.com/frontend/public/solutions/customer-and-product-portfolio-analysis)  \r\n- [Marketing and sales performance analysis](http://scandicfusion.daisy.agile55.com/frontend/public/solutions/marketing-and-sales-performance-analysis)  \r\n- [...and more](http://scandicfusion.daisy.agile55.com/frontend/public/solutions)  ','right');
/*!40000 ALTER TABLE `box` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dictionary`
--

DROP TABLE IF EXISTS `dictionary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dictionary` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `descr` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dictionary`
--

LOCK TABLES `dictionary` WRITE;
/*!40000 ALTER TABLE `dictionary` DISABLE KEYS */;
INSERT INTO `dictionary` VALUES (5,'data mart','Business line-specific subset of a data warehouse');
/*!40000 ALTER TABLE `dictionary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content_left` text,
  `content_right` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (1,'Business Intelligence consultant','##### **DESCRIPTION**\r\n\r\nThe open position includes involvement in (and eventually management of) full-scale IT projects, working closely with developers and other colleagues on achieving results and delivering top notch solutions to our clients by having direct communication with them.    ','##### **REQUIREMENTS**\r\nBSc or MSc in Economics/Business/IT, ability to work effectively in a team, work experience (and/or strong interest and good learning skills) in IT and BI is an advantage.   \r\n'),(2,'Business Intelligence SQL developer','##### **DESCRIPTION**\r\n\r\nYou will be in charge of designing and deploying Business Intelligence solutions, including setting up and developing ETL. Depending on the stage of a project, you are also expected to be capable of maintaining and troubleshooting an existing BI solution, configuring BI servers and connections. The job involves close cooperation with your colleagues.   ','##### **REQUIREMENTS**\r\nHigher education in IT, work experience with relational databases (Sybase IQ, Oracle DB, Vertica, Teradata, Microsoft Server etc.) and ETL tools like SAP Data Services, Oracle Data Integrator, Pentaho Data Integrator is an advantage.    \r\n');
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_code` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `page` varchar(255) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `name_en` text,
  `name_lv` text,
  `name_ru` text,
  `ord` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,NULL,'services','main','Competences\r\n& Services','','',0),(2,NULL,'industry','main','Industry\r\nSolutions','','',1),(3,NULL,'solutions','main','Cross Company\r\nSolutions','','',2),(4,NULL,'technology','main','Technology\r\nStack','','',3),(6,NULL,'',NULL,'About Scandic\r\nFusion','','',4),(7,6,'about',NULL,'About Us','','',NULL),(8,6,'team',NULL,'Our Team','','',NULL),(9,6,'jobs',NULL,'Jobs','','',NULL),(10,6,'contact',NULL,'Contact Us','','',NULL);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash_url` varchar(255) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `template_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `intro` text,
  `content` text,
  `keywords` text,
  `is_public` tinyint(1) DEFAULT NULL,
  `address` text,
  `requisites` text,
  `order` int(11) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `settings` text,
  `action_title` text,
  `action1_id` int(11) DEFAULT NULL,
  `action2_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` VALUES (1,'index',NULL,1,'Intelligent Decisions for Business',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'{\"5530cefc44a29\":{\"action_1\":\"Industry solutions\",\"action_1_link\":\"2\",\"action_2\":\"Cross company solutions\",\"action_2_link\":\"3\",\"hiring_title\":\"Join our team\",\"hiring_subtitle\":\"We are in search for new talent.\",\"id\":\"5530cefc44a29\",\"action_3\":\"Competences & Services\",\"action_3_link\":\"4\",\"hiring_link\":\"28\"}}','',NULL,NULL),(2,'industry',NULL,3,'Industry Solutions',NULL,'Business Intelligence as a tool can serve all kinds of needs in virtually any of existing industries. The only limitations are availability of high-quality data and imagination of decision-makers and BI specialists. Scandic Fusion has an extensive experience in wide range of industries, and is ready to implement its know-how, find and build the best possible solutions for new projects.','',1,NULL,NULL,NULL,NULL,'{\"55522ac2b14c0\":{\"label_text\":\"Didn\'t find your\\r\\nindustry here?\",\"label_page_id\":\"3\",\"label_link\":\"http:\\/\\/scandicfusion.daisy.agile55.com\\/frontend\\/public\\/solutions\",\"id\":\"55522ac2b14c0\"}}','Cannot find your industry in the list? Check our cross company solutions',9,NULL),(3,'solutions',NULL,5,'Cross Company Solutions',NULL,'Even though each separate BI solution is tailored for specific business needs, there are types of solutions, which are needed for all or most companies, independently of what industry they operate in. Scandic Fusion offers a range of solutions that can significantly alleviate analysis of the company performance, and be useful for all levels of management.','',1,NULL,NULL,NULL,NULL,'{\"555474304eaaf\":{\"label_text\":\"Cannot find the solution\\r\\nyou are looking for?\",\"label_page_id\":\"6\",\"label_link\":\"\",\"id\":\"555474304eaaf\"}}','Any questions?',3,NULL),(4,'services',NULL,4,'Competences & Services','','Setting up a Business Intelligence solution is a complex process, which incorporates various steps and stages. Scandic Fusion provides full life-cycle of BI services: starting with pre-development consulting and finishing with maintenance of a BI system.','',1,NULL,NULL,NULL,NULL,NULL,'Out expertise',8,9),(5,'technology',NULL,6,'Technology Stack',NULL,'tech stack description','',1,NULL,NULL,NULL,NULL,NULL,'Check our industry experience',8,NULL),(6,'contact',NULL,2,'Contact Page',NULL,'Why clients choose us? Well, there are many reasons, among which you can name that Scandic Fusion delivers outstanding quality solutions, exceeds expectations, and brings value to your business in the most efficient and professional way. Additionally to that, one of our key principles is to make sure that what you see is exactly what you get: people who make a sales pitch are the very same ones who will be managing your project and are responsible for the outcomes.\r\n\r\n','',1,'Karlis Vitols\r\nCEO\r\n+371 26 434 888\r\nk.vitols@scandicfusion.com\r\nOffice: Berzaunes street, 9\r\n\r\nJob inquiries: darbs@scandicfusion.com','SIA Scandic Fusion\r\nRegistration number: LV40003908470\r\nBank: Swedbank\r\nIBAN: LV82HABA0551016224895\r\nSWIFT: HABALV22\r\n\r\nLegal address: \r\nCiekurkalna 2 skerslinija 4 k1-30\r\nRiga LV-1026, Latvia',NULL,NULL,NULL,'',2,7),(14,'services/pre-study-of-bi-needs',4,4,'Pre-study of BI Needs','Some customers prefer to start their BI implementation directly with a development project, whereas others opt for a pre-study phase that allows to formulate BI needs before actual development starts. ','There are multiple reasons for carrying out a pre-study project:\r\n\r\nWe have seen scenarios where companies recognize needs for BI and have certain requirements for it, but want to reconfirm the initiative before making any investments.\r\n\r\nAlternatively, we have met with companies who have made investments in data warehouse technologies years ago and would like to evaluate the potential conversion of such solutions into up-to-date BI initiatives due to outdated or underutilized technologies that don’t deliver the full range of possible business gains.\r\n\r\nWe can say from our experience that companies who have many source systems often possess quite complex reporting mechanisms. As those cannot be easily broken down into simple structures, the optimization mechanisms and BI architecture are naturally also more complicated and may require external input. \r\n\r\nBI pre-study projects help in addressing all these and many other issues.\r\nDuring the pre-study phase, business needs are converted into a specification of valid BI requirements through interviews and workshops. These workshops are aligned with business priorities, technical architecture; they include suggestions and implications towards processes, systems, software components that are required for BI initiative.\r\n','interviews with business representatives \r\ninterviews with IT-personnel \r\nrequirements specifications \r\ntechnical architecture \r\nproject plan (aligned with priorities)\r\nprototype/demo',1,NULL,NULL,NULL,'aim',NULL,'Check our industry experience',8,NULL),(16,'services/bi-implementation',4,4,'BI Implementation','BI development process typically takes our clients through several iterations, gradually shaping the solution in the form that they desire it to be. ','Business users are able to see and get their hands on tangible progress every 2 weeks, even if it is a custom built BI solution for very specific needs.\r\n\r\nBefore diving into pure custom-built solutions, it might be useful to consider taking a look and possibly reusing some of our existing know-how. We have extensive experience in a variety of [specific industries](http://scandicfusion.daisy.agile55.com/frontend/public/industry) as well as in [cross company solutions](http://scandicfusion.daisy.agile55.com/frontend/public/solutions). Reusing previous experience enables rapid deployment, shorter implementation timeframe, minimized risks and reduced costs. Our best practices and cross industry know-how is there to be transferred into fulfilment of business needs of any company that is considering BI deployment.\r\n\r\nOur clients have different backgrounds and different requirements, but there is at least one common thing they all value in Scandic Fusion: results are on-time, in budget and exceed initial expectations.\r\n','DB model\r\nETL load\r\nBI metadata\r\ntrainings\r\ndata validation\r\ninteractive dashboards',1,NULL,NULL,NULL,'chart',NULL,'Check our industry experience',8,NULL),(17,'services/maintenance-support',4,4,'Maintenance & Support','Maintenance services give the feeling of a \"safety cushion\".','The support services provided by Scandic Fusion cover a wide range of tasks starting from educating business users about performing trivial as well as advanced actions in BI software up to more complex technical tasks such as maintenance of constantly changing source systems or availability and compatibility of installations of the latest software versions for various BI components. These are only a few of the typical cases where our current and potential clients want attention from a preferred supplier of Business Intelligence.\r\n\r\nWhen delivery or maintenance processes have been previously handled by a different supplier, Scandic Fusion proposes a transition process which enables smooth know-how transfer with no negative impact on operations related to BI.\r\n\r\n','proactive maintenance\r\nreactive maintenance\r\nper-request or SLA based\r\nchange management\r\ntraining\r\ngovernance',1,NULL,NULL,NULL,'maintenance',NULL,'Check our industry experience',8,NULL),(19,'services/licensing-advisory',4,4,'Licensing Advisory','It is often that our customers ask for advice on the best possible licensing models for a BI initiative. To comply with the best practices of a sustainable BI solution, the licensing model needs to be both cost efficient and functional now as well as in the long run.','Since the possible options and costs depend a lot on the growth of data volumes and/or the growth of the user base, it is very important to align licensing with future vision and plans of the company, \r\n\r\nScandic Fusion has extensive experience in working with different software providers and the related software packages/bundles. By analyzing our clients’ business needs and requirements, we can provide objective advice on which software components are the best pick for the initial requirements, while also taking into account the options for potential future scalability. Additionally, to ease the selection process for our customers, we are able to provide quotes for preferred choice of software with transparent and understandable pricing information.\r\n','optimal licensing policy for DB + ETL + BI tools\r\ntransparent long-term pricing scheme\r\ncalculations with several scalability options\r\nlicense sales',1,NULL,NULL,NULL,'scale',NULL,'Check our industry experience',8,NULL),(20,'services/dwh-bi-audit',4,4,'DWH & BI Audit','From time to time we have noticed situations where DWH/BI solutions have been implemented in a company a while ago, however there are still internal concerns about the performance/security/usability/overall sanity of the solution.','Scandic Fusion possesses expertise in auditing existing DWH/BI implementations. As a result, we provide a competent opinion of both the strong areas of the current solution as well as the parts that might require improvements. In addition, we aim to understand the utilized capacity of the existing solution, its potential enhancements and whether the current implementation allows for fulfilment of additional business needs the company might have.\r\n\r\nOur experience has shown that carrying out a DWH/BI audit project might help to overcome many everyday obstacles with minimal investments. There is a clear and common understanding afterwards as to where technical intervention is required and where it is sufficient to only adjust internal processes of the company in order to make the DWH/BI solution more usable.\r\n','ETL performance review\r\nbusiness critical BI performance review\r\nBI security solutions review\r\nsoftware components review',1,NULL,NULL,NULL,'clipboard',NULL,'Check our industry experience',8,NULL),(21,'services/data-exploration',4,4,'Data Exploration','Test','Test','Test',1,NULL,NULL,NULL,'compass',NULL,'Check our industry experience',8,NULL),(23,'industry/insurance',2,3,'Insurance','Scandic Fusion has experience with implementing BI solutions for both non-life and life insurance companies and business units.','The data marts typically required by our customers enable product-specific insight of MTPL, CASCO, property, travel, accident, health and civil liability insurance types among others.\r\n\r\nThe commonly used analytical metrics include such insurance industry relevant measures as gross written premiums, earned/unearned premiums in time, submitted/processed/paid claim amounts, loss ratio, regulated-unpaid and other potential payments outstanding as well as various insurance specific financial reserves in time.\r\n\r\nTypically, our customers prefer to have their insurance analytics bundled together with several cross-company solutions, including, but not limited to: management accounting, customer and product portfolio analysis, master data management, data mining and financial analytics.\r\n\r\nInteractive dashboards, which often serve as an end product for the BI users can afterwards support the everyday business decisions for various functions such as sales, claims administration, product managers and risk underwriters, actuaries, business controllers, accountants, general management and others.','',1,NULL,NULL,0,'umbrella',NULL,'Get to know us',2,NULL),(24,'industry/banking',2,3,'Banking','A typical banking industry BI solution, developed by Scandic Fusion, fully covers the core banking elements such as incoming/outgoing transactions, account balances per various time periods, loans and deposits analysis, an outlook on the performance of financial instruments, payment cards profitability and others.','A BI development project for a customer from banking industry is typically bundled together with several cross company solutions – a few of the most common are management accounting analysis (including transfer pricing and overhead allocation), customer and product portfolio analysis (insights on new/active/lost customers), marketing and sales performance analysis (including trends on upgrading or downgrading from existing products).\r\n\r\nInteractive dashboards are intuitive, easy to understand and can be utilized by a wide range of employees, starting from business analysts up to the board members of the company. They are best used to present data and ensure support of information based decisions for various business functions, including those responsible for sales, payment cards, credit risk management, deposits and financial instruments as well as business controllers, accountants, general management and others.\r\n\r\nThe solution that we typically offer to our clients does not aim to fulfill only pure operational or statutory reporting (which, is, of course, also possible). Instead, it enables strategic decision making. Customers, who already have a DWH initiative in place, use our solution for adding extra analytical insights to their everyday decisions. In addition they are building interactive dashboards that can be presented both internally as well as outside of the company. This type of BI implementation scenario is what we strive for and where we believe the greatest value from our work is added.','',1,NULL,NULL,1,'bank',NULL,'Get to know us',2,NULL),(25,'industry/payment-cards',2,3,'Payment Cards',NULL,NULL,'',1,NULL,NULL,2,'cards',NULL,'Get to know us',2,NULL),(26,'team',NULL,7,'Our Team',NULL,'The brand name and reputation we have built in BI industry is an achievement of the outstanding team that works in Scandic Fusion. Our great work environment is made by  exceptionally great colleagues who are also fascinating and fun personalities. Meet them!','',NULL,NULL,NULL,NULL,NULL,'{\"552e4f8254b45\":{\"display_block\":true,\"width\":\"8\",\"title\":\"Join Our Team\",\"subtitle\":\"We are in search for new talent.\",\"page_id\":\"28\",\"id\":\"552e4f8254b45\"}}','',1,3),(27,'404',NULL,8,'404: Page Not Found',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,'jobs',NULL,9,'Career in Scandic Fusion',NULL,'At Scandic Fusion we are in constant search for talented and inspirational colleagues. Have a look at the open positions and get in contact with us if you feel that we could be a good match.','',NULL,NULL,NULL,NULL,NULL,NULL,'',1,2),(30,'industry/healthcare',2,3,'Healthcare','','Scandic Fusion successfully manages implementation projects of full-scale BI solutions for healthcare businesses. Typically, we build the analytical data models to keep track of customer turnover and profitability, facilities and staff workload, equipment usage and procurement as well as for evaluation of efficiency of various healthcare business processes (e.g. through calculated/derived internal KPIs).\r\n\r\nAdditionally to the core business analysis solutions, customers from healthcare industry usually also demand management and financial accounting analytics as well as cash flow forecasting and analysis platforms.  These solutions can be utilized by the management of the company as they supplement the operational data.\r\n\r\nAs an end result of the project the business representatives and company management receive an easy to use and intuitive toolset for analysis of both day-to-day and long-term performance of the enterprise. The basic and most widely used components consist of dashboards, which present and manage data in a manner that is convenient for data exploration and decision-making. Apart from pre-made reports and dashboards, we teach business representatives the necessary skills to promptly create customized reports for answering any business questions response to which can be supported by the data available. All of the things above empower making of competent strategic decisions and allow managers to get the most out of company’s data.','',1,NULL,NULL,3,'heartbeat',NULL,NULL,NULL,NULL),(31,'industry/energy',2,3,'Energy',NULL,NULL,'',1,NULL,NULL,4,'bulb',NULL,NULL,NULL,NULL),(32,'industry/manufacturing',2,3,'Manufacturing','Scandic Fusion has experience in providing BI solutions that are tailored for capital intensive manufacturing companies. The BI platform provides an opportunity to have an extensive summary overlook of the whole company performance for management purposes as well as the ability to look at the details and understand how the separate tasks and manufacturing components influence the company’s execution on more operational level.','The standard BI solution typically covers the core manufacturing processes (such as supply chain management, warehouse outlook and planning, manufacturing teams performance) as well as support services such as on-time delivery, post-sales services (incl. warranty) and research and development.\r\n\r\nIt is common practice of Scandic Fusion to additionally cover our clients’ management and financial reporting needs, such as sales and profitability of manufactured products (incl. bundles), performance of sales and marketing activities as well as the most common financial reporting requirements such as profit/loss or management KPI development and analysis.\r\n\r\nOne of the biggest cornerstones of a successful BI implementation in this industry is the ability to showcase the overall company performance by using interactive dashboards and easy-to-use reporting tools and not lose the possibilities to drill down into the most detailed everyday tasks and manufacturing components to understand the causalities behind the results. This has been a challenge that Scandic Fusion pays attention to and has tackled well so far.\r\n','',1,NULL,NULL,5,'factory',NULL,NULL,NULL,NULL),(33,'industry/wholesale',2,3,'Wholesale',NULL,NULL,'',1,NULL,NULL,6,'warehouse',NULL,NULL,NULL,NULL),(34,'industry/telecom',2,3,'Telecom','','Scandic Fusion is experienced in providing all-around BI solutions for companies operating in telecommunications industry. As the telecommunications market is often over-competitive and there is little to no cost for the customers to switch between service providers or network carriers, the companies operating in the field have to pay special attention to the factors that influence customer loyalty (NPS), service quality, satisfaction with troubleshooting as well as pricing and profitability of services.\r\n\r\nA typical approach to such a BI implementation also requires the ability to track the company’s financials as well as management KPIs in order to understand the impact on performance both from historical actions and predict the outcomes of future investment projects or marketing campaigns.\r\n\r\nIt is important to ensure a versatile solution that allows to “play around” with the data in an exploratory fashion as it helps in finding tendencies and patterns between e.g. various client and service segments and identifies their strong and weak sides from the company’s perspective. This is something Scandic Fusion provides with universal data marts that cover cross-company business areas and allow the data to be detailed down and summed up to the maximum extent possible. The end result therefore covers the analytical needs of both the executive board as well as the entry-level analysts throughout the company. \r\n','',1,NULL,NULL,7,'tower',NULL,NULL,NULL,NULL),(35,'industry/micro-crediting',2,3,'Micro crediting','','The BI implementation expertise offered by Scandic Fusion has been used by leading microcrediting companies in the Baltics. The core BI foundation usually offers a deeper understanding of overall performance, profitability and lifecycle of small credits, leasing and asset backed loans. Typically a well-designed BI solution includes performance indicators on such business areas as loan application handling, loan issuing, loan repayment rates, loan surplus and debt recovery amounts as well as customer attraction and support analysis.\r\n\r\nIn addition, there are several cross company solutions that are typically chosen by our customers as a bundle that supplements the core operational data. The most commonly picked components are management accounting analytics, customer and product portfolio lifecycle analysis, call center analysis and marketing and sales performance analysis (incl. analysis on performance of web-services from data that is accumulated e.g. via Google analytics).\r\n\r\nInteractive dashboards, as our proposed way of representing the business insights, are intuitive, easy to understand and can be utilized by a wide range of employees, starting from business analysts up to the board members of the company. The dashboards serve client managers reviewing the performance/surplus of their client accounts on a daily basis as well as senior management monitoring overall profitability and sustainability of the credit portfolio on a periodic basis.','',1,NULL,NULL,8,'banknotes',NULL,NULL,NULL,NULL),(36,'industry/forestry',2,3,'Forestry','','Scandic Fusion has the necessary expertise and skills to provide a comprehensive BI analytical platform in an industry as challenging as forestry. We have the experience of helping our customers in analyzing the full supply chain of a large scale forest management business.\r\n\r\nIn addition to a full-scale core business analysis and because of the complexity and dynamic nature of conditions affecting timber production, we have also helped our customers to achieve online analytics for manufacturing processes. Such an approach offers possibilities to look at real-time data for harvested and forwarded quantities by timber lengths, diameters, species and products as well as current information on fell statuses and log yard quantities.\r\n\r\nOther relevant BI implementation areas include harvester fleet analysis, which gives insights into harvester statuses and their calibration information. Transportation process analysis is used for optimization of logistics processes and timber truck fleet capacity analysis. Sales analytics for a company in forest management industry include data on timber measurement records in timber mills, timber seedling and seed and chips sales performance. \r\n\r\nAnother major part of a forestry related business covers subcontractor management. Taking this into account, our analytics platform provides the possibilities of contract follow-up and QA data analysis. \r\n\r\nThe BI foundation developed by us also helps to analyze forest development and infrastructure projects, starting from project planning phase, into execution and up to the final project delivery. This area of operations is especially important when looking at the business from long-term forest management perspective.\r\n\r\nTo complement the industry specific solution, our clients usually choose to bundle it together with cross-company solutions, the most relevant ones being ERP analysis, utilization of KPI engine, cash flow forecasting and analysis platform as well as tailor-made investment project solutions. \r\n','',1,NULL,NULL,9,'leaf',NULL,NULL,NULL,NULL),(37,'industry/aviation',2,3,'Aviation',NULL,NULL,'',1,NULL,NULL,10,'plane',NULL,NULL,NULL,NULL),(38,'about',NULL,10,'Our History',NULL,'about page','',NULL,NULL,NULL,NULL,NULL,NULL,'',2,3),(39,'solutions/solution1',3,5,'Management accounting','Scandic Fusion offers management accounting solution which presents Profit & Loss and Balance Sheet in much more interactive way than just a plain report in size of A4.','Interactive dashboards can be used centrally (top management) and decentrally (middle management, product owners). Each user can see as much as he/she is allowed to see because of easily configurable security. Information is presented nicely via tables and charts, allowing step by step navigation to details.\r\n\r\nSolution is used by companies, which constantly want to follow revenue/cost positions, benchmark those against forecasted/budgeted/year ago and drill down to details of accounting transaction (and its source document details).\r\n\r\nSolution enables PL and BS consolidation (if intercompany transactions exist), one or several reporting currencies (important if legal units are located in different currency zones), adds on top of any accounting system (actual amounts are calculated using general ledger) and budgeting solution.\r\n\r\nCost allocation component performs automatic split of overhead and indirect costs that prepares managerial insight of product/service/department net profitability.\r\n\r\nBudgeting component can be handy in cases when company does not have central budgeting/forecasting application.\r\n\r\nAnalytical facts provide options to pre-calculate measures, e.g., month ago, year ago, year-to-date, rolling-12, actual vs. budget, actual vs. forecast, actual/forecast vs. budget.\r\n','',1,NULL,NULL,NULL,'pie-chart',NULL,'Any questions?',3,NULL),(40,'solutions/kpi-engine',3,5,'KPI engine','Scandic Fusion offers KPI engine if your company needs metric-based visuals about company performance by various dimensions. This usually aligns if company implements balanced scorecard concept for measuring performance against company goals.','Data mart is based on a concept that all KPIs share similar dimensions (some might not be relevant).\r\n\r\nAnalytical facts provide measures for benchmarking actual vs. target or budgeted vs. month ago vs. year ago.\r\n\r\nMeasures are pre-calculated for data consistency when data is analyzed by various combinations of dimensions. This way, \"as of date\" and \"average\" measures show consistent values.\r\n\r\nIf a customer decides to start with KPI engine as the first BI project, it is important to account for data sources (typically, if KPIs cover most of what company does, then KPI calculations need all of the corresponding source systems that register those actions). ','',1,NULL,NULL,NULL,'dashboard',NULL,'Any questions?',3,NULL),(41,'solutions/customer-and-product-portfolio-analysis',3,5,'Customer and product portfolio analysis','Business needs much more advanced characteristics besides those of customers and products, in order to identify which customer segments and products are most profitable and which least profitable.','Scandic Fusion offers customer and product portfolio analysis solution.\r\n\r\nIn addition to static characteristics of customers and products, data mart gives advanced characteristics over time:\r\n- customers lifecycle attributes - new/active/lost/renewed   \r\n- how well customer is packed with product  \r\n- loyalty rating of customer  \r\n- payment discipline of customer  \r\n- profitability segmentation of customer  \r\n- sales transaction categorization as new or recurring  \r\n- sales transaction categorization from product profitability perspective as   upgrade/equal/downgrade\r\n\r\nInteractive dashboards allow:\r\n- to focus on new customers and estimate their potential  \r\n- to focus on existing customers and identify upselling and crosselling opportunitie  \r\n- to follow tendencies of leaving customers and initiate retention strategy where applicable  \r\n- to analyze active customers base and promote actions that improve profitability  ','',1,NULL,NULL,NULL,'briefcase',NULL,'Any questions?',3,NULL),(42,'solutions/erp-analysis',3,5,'ERP analysis','Scandic Fusion offers universal data mart for ERP system analysis which contains details of each module and at the same time - enables common dimensions for seamlessly integrated analysis.','Deployment can be used on top of any ERP software, including (but not limited to) these: SAP R3, Oracle EBS, Axapta, Navision, Scala and others.\r\n\r\nData marts include dimensions and facts from various ERP modules {to be clarified - maybe \"business functions\"} - purchasing, inventory, sales orders, manufacturing, HRMS, payables, receivables, fixed assets, projects, property management, subledger accounting (aka \"controlling\"), general ledger.\r\n\r\nAnalytical facts provide details which are not naturally stored in ERP systems in historic way. For example, debtor balance by period, order fulfillment by period, procurement lead times by period, project fulfillment by period and many others. \r\n\r\nOur experience shows that there is no single recipe for interactive dashboards that will fulfill any business need. Instead, we use rapid deployment approach by prototyping a solution for different user groups until it shows exactly what is needed without sacrificing visual look and feel.\r\n','',1,NULL,NULL,NULL,'flowchart',NULL,'Any questions?',3,NULL),(43,'solutions/billing-and-credit-control',3,5,'Billing and credit control','test','test','',1,NULL,NULL,NULL,'coins',NULL,'Any questions?',3,NULL),(44,'solutions/cf-forecasting',3,5,'CF forecasting',NULL,NULL,'',1,NULL,NULL,NULL,'areachart',NULL,'Any questions?',3,NULL),(45,'solutions/marketing-and-sales-performance-analysis',3,5,'Marketing and sales performance analysis',NULL,NULL,'',1,NULL,NULL,NULL,'strategy',NULL,'Any questions?',3,NULL),(46,'solutions/geographical-information-systems',3,5,'Geographical information systems',NULL,NULL,'',1,NULL,NULL,NULL,'map',NULL,'Any questions?',3,NULL),(47,'solutions/call-center-analysis',3,5,'Call center analysis',NULL,NULL,'',1,NULL,NULL,NULL,'phone',NULL,'Any questions?',3,NULL),(48,'solutions/master-data-management',3,5,'Master data management',NULL,NULL,'',1,NULL,NULL,NULL,'cubes',NULL,'Any questions?',3,NULL),(49,'solutions/budgeting',3,5,'Budgeting',NULL,NULL,'',1,NULL,NULL,NULL,'clock-coins',NULL,'Any questions?',3,NULL),(50,'solutions/user-security-maintenance-solution',3,5,'User security maintenance solution',NULL,NULL,'',1,NULL,NULL,NULL,'shield',NULL,'Any questions?',3,NULL),(51,'solutions/big-data',3,5,'Big data',NULL,NULL,'',1,NULL,NULL,NULL,'data',NULL,'Any questions?',3,NULL);
/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_translation`
--

DROP TABLE IF EXISTS `page_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `language` varchar(25) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_translation`
--

LOCK TABLES `page_translation` WRITE;
/*!40000 ALTER TABLE `page_translation` DISABLE KEYS */;
INSERT INTO `page_translation` VALUES (1,1,'en','index - en',NULL,NULL),(2,2,'en','industry - en',NULL,NULL),(3,3,'en','solutions - en',NULL,NULL),(4,6,'en',' - en',NULL,NULL);
/*!40000 ALTER TABLE `page_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phinxlog`
--

DROP TABLE IF EXISTS `phinxlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phinxlog` (
  `version` bigint(20) NOT NULL,
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phinxlog`
--

LOCK TABLES `phinxlog` WRITE;
/*!40000 ALTER TABLE `phinxlog` DISABLE KEYS */;
INSERT INTO `phinxlog` VALUES (0,'2015-04-11 12:22:30','2015-04-11 12:22:30'),(1,'2015-04-11 12:22:30','2015-04-11 12:22:30'),(20150210103808,'2015-04-11 12:22:30','2015-04-11 12:22:30');
/*!40000 ALTER TABLE `phinxlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search`
--

DROP TABLE IF EXISTS `search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `block_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search`
--

LOCK TABLES `search` WRITE;
/*!40000 ALTER TABLE `search` DISABLE KEYS */;
/*!40000 ALTER TABLE `search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ord` int(11) DEFAULT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  `name_lv` varchar(255) DEFAULT NULL,
  `name_ru` varchar(255) DEFAULT NULL,
  `position_en` varchar(255) DEFAULT NULL,
  `position_lv` varchar(255) DEFAULT NULL,
  `position_ru` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (4,0,'Karlis Vitols','','','CEO','','','karlis_vitols'),(5,1,'Martins Berzins','','','BI Consultant','','','martins_berzins'),(6,2,'Liga Kagaine','','','BI Consultant','','','liga_kagaine'),(7,6,'Davis Grundmanis','','','BI Consultant','','','davis_grundmanis'),(8,5,'Oskars Genavs','','','BI Developer','','','oskars_genavs'),(9,8,'Raivis Blaumanis','','','BI Consultant','','','raivis_blaumanis'),(10,18,'Alina Petrova','','','BI Consultant','','','alina_petrova'),(11,12,'Tatjana Korobeinikova','','','BI Consultant','','','tatjana_korobeinikova'),(12,4,'Daija Jansone','','','BI Consultant','','','daija_jansone'),(14,16,'Andris Ontuzans','','','BI Consultant','','','andris_ontuzans'),(15,11,'Darya Skakouskaya','','','BI Consultant','','','darya_skakouskaya'),(16,10,'Rimants Vinups-Sakars','','','BI Consultant','','','rimants_vinups-sakars'),(17,3,'Gatis Zimackis','','','BI Developer','','','gatis_zimackis'),(18,13,'Gatis Gereiss','','','BI Developer','','','gatis_gereiss'),(19,19,'Gatis Ozolins','','','BI Developer','','','team-nophoto'),(20,14,'Roberts Osipovs','','','BI Developer','','','roberts_osipovs'),(21,9,'Veronika Meinarte','','','BI Developer','','','veronika_meinarte'),(22,7,'Gints Vitins','','','BI Developer','','','gints_vitins'),(23,15,'Janis Selegovskis','','','BI Developer','','','janis_selegovskis'),(24,20,'Ilze Krauze','','','BI Consultant','','','team-nophoto');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technology`
--

DROP TABLE IF EXISTS `technology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `technology` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content` text,
  `bullets` text,
  `position` enum('left','right','middle') DEFAULT NULL,
  `class` varchar(255) DEFAULT NULL,
  `ord` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technology`
--

LOCK TABLES `technology` WRITE;
/*!40000 ALTER TABLE `technology` DISABLE KEYS */;
INSERT INTO `technology` VALUES (1,'Business Intelligence','BI component is responsible for various data visualization needs – interactive dashboards, data exploration, dynamic reporting (aka ad-hoc queries), control reporting, publishing. Scandic Fusion masters various BI tools.','SAP Business Objects\r\nOracle Business Intelligence\r\nTableau\r\nQlik View/Sense\r\nSAS Visual Analytics\r\nMicrostrategy','left','',NULL),(2,'Data mining and predictive analytics','Diam tortor tincidunt est, eget scelerisque elit diam quis tellus. Fusce vitae diam at massa consectetur auctor. Mauris iaculis molestie eros nec sagittis. Phasellus suscipit sagittis metus vitae fringilla.','Oracle Data Mining (ODM)\r\nSAP Infinite Insight (KXEN)\r\nSTATISTICA\r\nR\r\nWEKA','right','',NULL),(3,'Database','Database is responsible for storing BI data. Right pick of database technology has great impact on the SQL performance, i.e., user satisfaction of how quickly data is being retrieved from the database. Scandic Fusion works with variety of DB technologies.','SybaseIQ\r\nOracle db\r\nVertica\r\nPostgreSQL\r\nTeradata\r\nSQL Server','middle','step-2',NULL),(4,'Extraction, transformation and load','Extraction, transformation and load of data help transfer data from source system and compose into BI data layer as dimensions and facts. Scandic Fusion works with a variety of tools, starting with great open source solutions and finishing with leading commercial software.','Oracle Data Integrator\r\nSAP Data Services\r\nPentaho Data Integration\r\nInformatica','middle','step-3',NULL);
/*!40000 ALTER TABLE `technology` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template`
--

DROP TABLE IF EXISTS `template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sys_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template`
--

LOCK TABLES `template` WRITE;
/*!40000 ALTER TABLE `template` DISABLE KEYS */;
INSERT INTO `template` VALUES (1,'Index Page','index'),(2,'Simple Contact','contact'),(3,'Industry with Subpages','industry'),(4,'Services and Competences','services'),(5,'Solutions','solutions'),(6,'Technonlogy','technology'),(7,'Team','team'),(8,'404','p404'),(9,'Jobs','jobs'),(10,'About','about');
/*!40000 ALTER TABLE `template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonial`
--

DROP TABLE IF EXISTS `testimonial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testimonial` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonial`
--

LOCK TABLES `testimonial` WRITE;
/*!40000 ALTER TABLE `testimonial` DISABLE KEYS */;
INSERT INTO `testimonial` VALUES (1,'Olga Pleyer','CFO, BOSCH Baltics','logo-bosch.svg','Working with Scandic Fusion is a great professional experience: both in terms of quality of delivered service and in terms of communication between our companies. The industry Bosch in the Baltics works in is constantly evolving; therefore, we need flexibility and complex technical solutions from our suppliers. During one year of successful cooperation with Scandic Fusion we implemented core business analysis, cost allocation solution and budgeting solution. There are also several ongoing projects, and we are looking forward to continuing our successful partnership.'),(2,'test','test','test','test');
/*!40000 ALTER TABLE `testimonial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_dts` datetime NOT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','$2y$10$AAbyw9DRV/P6zBRhCh62b.Kbt8BdwQENpXofZW.bYmx7mXTMWTeqy',NULL,'0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-22  2:17:03
