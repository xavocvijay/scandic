-- MySQL dump 10.14  Distrib 5.5.40-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: mariadb    Database: scandic-prod
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
INSERT INTO `menu` VALUES (1,NULL,'services','main','Competences\r\n& Services','','',NULL),(2,NULL,'industry','main','Industry\r\nSolutions','','',NULL),(3,NULL,'solutions','main','Cross Company\r\nSolutions','','',NULL),(4,NULL,'technology','main','Technology\r\nStack','','',NULL),(6,NULL,'',NULL,'About Scandic\r\nFusion','','',NULL),(7,6,'about',NULL,'About Us','','',NULL),(8,6,'team',NULL,'Our Team','','',NULL),(9,6,'jobs',NULL,'Jobs','','',NULL),(10,6,'contact',NULL,'Contact Us','','',NULL);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` VALUES (1,'index',NULL,1,'Intelligent decisions for business',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'{\"5530cefc44a29\":{\"action_1\":\"Competences & Services\",\"action_1_link\":\"4\",\"action_2\":\"Contact us\",\"action_2_link\":\"6\",\"hiring_title\":\"Join our team\",\"hiring_subtitle\":\"We are in search for new talent.\",\"id\":\"5530cefc44a29\"}}'),(2,'industry',NULL,3,NULL,NULL,NULL,'',0,NULL,NULL,NULL,NULL,NULL),(3,'solutions',NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'services',NULL,4,'Competences & Services','','Setting up a Business Intelligence solution is a complex process, which incorporates various steps and stages. Scandic Fusion provides full life-cycle of BI services: starting with pre-development consulting and finishing with maintenance of a BI system.','',1,NULL,NULL,NULL,NULL,NULL),(5,'technology',NULL,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'contact',NULL,2,'Contact Page',NULL,'Why clients choose us? Well, there are many reasons, among which you can name that Scandic Fusion delivers outstanding quality solutions, exceeds expectations, and brings value to your business in the most efficient and professional way. Additionally to that, one of our key principles is to make sure that what you see is exactly what you get: people who make a sales pitch are the very same ones who will be managing your project and are responsible for the outcomes.\r\n\r\n','',1,'Karlis Vitols\r\nCEO\r\n+371 26 434 888\r\nk.vitols@scandicfusion.com\r\nOffice: Berzaunes street, 9\r\n\r\nJob inquiries: darbs@scandicfusion.com','SIA Scandic Fusion\r\nRegistration number: LV40003908470\r\nBank: Swedbank\r\nIBAN: LV82HABA0551016224895\r\nSWIFT: HABALV22\r\n\r\nLegal address: \r\nCiekurkalna 2 skerslinija 4 k1-30\r\nRiga LV-1026, Latvia',NULL,NULL,NULL),(14,'services/pre-study-of-bi-needs',4,4,'Pre-study of BI Needs','Some customers prefer to start their BI implementation directly with a development project, whereas others opt for a pre-study phase that allows to formulate BI needs before actual development starts. ','There are multiple reasons for carrying out a pre-study project:\r\n\r\nWe have seen scenarios where companies recognize needs for BI and have certain requirements for it, but want to reconfirm the initiative before making any investments.\r\n\r\nAlternatively, we have met with companies who have made investments in data warehouse technologies years ago and would like to evaluate the potential conversion of such solutions into up-to-date BI initiatives due to outdated or underutilized technologies that don’t deliver the full range of possible business gains.\r\n\r\nWe can say from our experience that companies who have many source systems often possess quite complex reporting mechanisms. As those cannot be easily broken down into simple structures, the optimization mechanisms and BI architecture are naturally also more complicated and may require external input. \r\n\r\nBI pre-study projects help in addressing all these and many other issues.\r\nDuring the pre-study phase, business needs are converted into a specification of valid BI requirements through interviews and workshops. These workshops are aligned with business priorities, technical architecture; they include suggestions and implications towards processes, systems, software components that are required for BI initiative.\r\n','interviews with business representatives \r\ninterviews with IT-personnel \r\nrequirements specifications \r\ntechnical architecture \r\nproject plan (aligned with priorities)\r\nprototype/demo',1,NULL,NULL,NULL,'aim',NULL),(16,'services/bi-implementation',4,4,'BI Implementation','BI development process typically takes our clients through several iterations, gradually shaping the solution in the form that they desire it to be. ','Business users are able to see and get their hands on tangible progress every 2 weeks, even if it is a custom built BI solution for very specific needs.\r\n\r\nBefore diving into pure custom-built solutions, it might be useful to consider taking a look and possibly reusing some of our existing know-how. We have extensive experience in a variety of specific industries {url} as well as in cross company solutions {url}. Reusing previous experience enables rapid deployment, shorter implementation timeframe, minimized risks and reduced costs. Our best practices and cross industry know-how is there to be transferred into fulfilment of business needs of any company that is considering BI deployment.\r\n\r\nOur clients have different backgrounds and different requirements, but there is at least one common thing they all value in Scandic Fusion: results are on-time, in budget and exceed initial expectations.\r\n','DB model\r\nETL load\r\nBI metadata\r\ntrainings\r\ndata validation\r\ninteractive dashboards',1,NULL,NULL,NULL,'chart',NULL),(17,'services/maintenance-support',4,4,'Maintenance & Support','Maintenance services give the feeling of a \"safety cushion\".','The support services provided by Scandic Fusion cover a wide range of tasks starting from educating business users about performing trivial as well as advanced actions in BI software up to more complex technical tasks such as maintenance of constantly changing source systems or availability and compatibility of installations of the latest software versions for various BI components. These are only a few of the typical cases where our current and potential clients want attention from a preferred supplier of Business Intelligence.\r\n\r\nWhen delivery or maintenance processes have been previously handled by a different supplier, Scandic Fusion proposes a transition process which enables smooth know-how transfer with no negative impact on operations related to BI.\r\n\r\n','proactive maintenance\r\nreactive maintenance\r\nper-request or SLA based\r\nchange management\r\ntraining\r\ngovernance',1,NULL,NULL,NULL,'maintenance',NULL),(19,'services/licensing-advisory',4,4,'Licensing Advisory','It is often that our customers ask for advice on the best possible licensing models for a BI initiative. To comply with the best practices of a sustainable BI solution, the licensing model needs to be both cost efficient and functional now as well as in the long run.','Since the possible options and costs depend a lot on the growth of data volumes and/or the growth of the user base, it is very important to align licensing with future vision and plans of the company, \r\n\r\nScandic Fusion has extensive experience in working with different software providers and the related software packages/bundles. By analyzing our clients’ business needs and requirements, we can provide objective advice on which software components are the best pick for the initial requirements, while also taking into account the options for potential future scalability. Additionally, to ease the selection process for our customers, we are able to provide quotes for preferred choice of software with transparent and understandable pricing information.\r\n','optimal licensing policy for DB + ETL + BI tools\r\ntransparent long-term pricing scheme\r\ncalculations with several scalability options\r\nlicense sales',1,NULL,NULL,NULL,'scale',NULL),(20,'services/dwh-bi-audit',4,4,'DWH & BI Audit','From time to time we have noticed situations where DWH/BI solutions have been implemented in a company a while ago, however there are still internal concerns about the performance/security/usability/overall sanity of the solution.','Scandic Fusion possesses expertise in auditing existing DWH/BI implementations. As a result, we provide a competent opinion of both the strong areas of the current solution as well as the parts that might require improvements. In addition, we aim to understand the utilized capacity of the existing solution, its potential enhancements and whether the current implementation allows for fulfilment of additional business needs the company might have.\r\n\r\nOur experience has shown that carrying out a DWH/BI audit project might help to overcome many everyday obstacles with minimal investments. There is a clear and common understanding afterwards as to where technical intervention is required and where it is sufficient to only adjust internal processes of the company in order to make the DWH/BI solution more usable.\r\n','ETL performance review\r\nbusiness critical BI performance review\r\nBI security solutions review\r\nsoftware components review',0,NULL,NULL,NULL,'clipboard',NULL),(21,'services/data-exploration',4,4,'Data Exploration','Test','Test','Test',0,NULL,NULL,NULL,'compass',NULL),(23,'industry/insurance',2,3,'insurance',NULL,NULL,'',0,NULL,NULL,NULL,'umbrella',NULL),(24,'industry/banking',2,3,'banking',NULL,NULL,'',0,NULL,NULL,NULL,'bank',NULL),(25,'industry/payment-cards',2,3,'Payment Cards',NULL,NULL,'',0,NULL,NULL,NULL,'cards',NULL),(26,'team',NULL,7,'Our Team',NULL,'The brand name and reputation we have built in BI industry is an achievement of the outstanding team that works in Scandic Fusion. Our great work environment is made by  exceptionally great colleagues who are also fascinating and fun personalities. Meet them!','',NULL,NULL,NULL,NULL,NULL,'{\"552e4f8254b45\":{\"display_block\":true,\"width\":\"6\",\"title\":\"Join Our Team\",\"subtitle\":\"\",\"page_id\":\"28\",\"id\":\"552e4f8254b45\"}}'),(27,'404',NULL,8,'404: Page Not Found',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL),(28,'jobs',NULL,9,'Career in Scandic Fusion',NULL,'At Scandic Fusion we are in constant search for talented and inspirational colleagues. Have a look at the open positions and get in contact with us if you feel that we could be a good match.','',NULL,NULL,NULL,NULL,NULL,NULL);
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
INSERT INTO `team` VALUES (4,0,'Karlis Vitols','','','CEO','','','karlis_vitols'),(5,1,'Martins Berzins','','','BI Consultant','','','martins_berzins'),(6,2,'Liga Kagaine','','','BI Consultant','','','liga_kagaine'),(7,6,'Davis Grundmanis','','','BI Consultant','','','davis_grundmanis'),(8,5,'Oskars Genavs','','','BI Developer','','','oskars_genavs'),(9,8,'Raivis Blaumanis','','','BI Consultant','','','raivis_blaumanis'),(10,18,'Alina Petrova','','','BI Consultant','','','alina_petrova'),(11,12,'Tatjana Korobeinikova','','','BI Consultant','','','tatjana_korobeinikova'),(12,4,'Daija Jansone','','','BI Consultant','','','daija_jansone'),(13,17,'Henrijs Jansons','','','BI Consultant','','','henrijs_jansons'),(14,16,'Andris Ontuzans','','','BI Consultant','','','andris_ontuzans'),(15,11,'Darya Skakouskaya','','','BI Consultant','','','darya_skakouskaya'),(16,10,'Rimants Vinups-Sakars','','','BI Consultant','','','rimants_vinups-sakars'),(17,3,'Gatis Zimackis','','','BI Developer','','','gatis_zimackis'),(18,13,'Gatis Gereiss','','','BI Developer','','','gatis_gereiss'),(19,19,'Gatis Ozolins','','','BI Developer','','','team-nophoto'),(20,14,'Roberts Osipovs','','','BI Developer','','','roberts_osipovs'),(21,9,'Veronika Meinarte','','','BI Developer','','','veronika_meinarte'),(22,7,'Gints Vitins','','','BI Developer','','','gints_vitins'),(23,15,'Janis Selegovskis','','','BI Developer','','','janis_selegovskis'),(24,20,'Ilze Krauze','','','BI Consultant','','','team-nophoto');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template`
--

LOCK TABLES `template` WRITE;
/*!40000 ALTER TABLE `template` DISABLE KEYS */;
INSERT INTO `template` VALUES (1,'Index Page','index'),(2,'Simple Contact','contact'),(3,'Industry with Subpages','industry'),(4,'Services and Competences','services'),(5,'Solutions','solutions'),(6,'Technonlogy','technology'),(7,'Team','team'),(8,'404','p404'),(9,'Jobs','jobs');
/*!40000 ALTER TABLE `template` ENABLE KEYS */;
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

-- Dump completed on 2015-04-19 15:00:41
