/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : 127.0.0.1:3306
Source Database       : scandic

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-06-06 14:19:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `about`
-- ----------------------------
DROP TABLE IF EXISTS `about`;
CREATE TABLE `about` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `year` int(11) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of about
-- ----------------------------
INSERT INTO `about` VALUES ('3', '2007', 'Beginning of the wonderful journey in BI world - starting with 2 first customers');
INSERT INTO `about` VALUES ('4', '2008', 'Working hard on establishing the reputation for quality in the Latvian market\r\n3 active BI customers');
INSERT INTO `about` VALUES ('5', '2009', '4 active BI customers\r\nMilestone of 5 BI projects in total (we do grow despite economic recession in LV)');
INSERT INTO `about` VALUES ('6', '2010', '9 active BI customers\r\nMilestone of 10 BI projects in total');
INSERT INTO `about` VALUES ('7', '2011', 'First major real-time DWH/BI project goes live\r\n11 active BI customers\r\nMilestone of 15 BI implementations in total');
INSERT INTO `about` VALUES ('8', '2012', 'Another real-time DWH/BI project goes live\r\n12 active BI customers\r\nMobile BI solutions is actively used by first customers');
INSERT INTO `about` VALUES ('9', '2013', 'Eagerly helping Latvian companies prepare for migration from LVL to EUR\r\nFirst development projects in the Nordics\r\n13 active BI customers\r\nMilestone of 20+ BI projects in total\r\nData mining becomes actively used by first customers');
INSERT INTO `about` VALUES ('10', '2014', '18 active BI customers\r\nMilestone of 25+ BI projects in total');
INSERT INTO `about` VALUES ('11', '2015', '20 active BI customers\r\nInternational projects share reached over 30%');
INSERT INTO `about` VALUES ('12', '2016', 'Another large scale real-time project goes live\r\nQuantrix becomes highly demanded tool for modelling and forecasting\r\nScandic Fusion effort is focused mostly around Insurance, Banking, Manufacturing and Energy sectors');

-- ----------------------------
-- Table structure for `about_content_images`
-- ----------------------------
DROP TABLE IF EXISTS `about_content_images`;
CREATE TABLE `about_content_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of about_content_images
-- ----------------------------
INSERT INTO `about_content_images` VALUES ('1', '1', '14');
INSERT INTO `about_content_images` VALUES ('2', '1', '17');
INSERT INTO `about_content_images` VALUES ('3', '1', '20');

-- ----------------------------
-- Table structure for `about_contents`
-- ----------------------------
DROP TABLE IF EXISTS `about_contents`;
CREATE TABLE `about_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of about_contents
-- ----------------------------
INSERT INTO `about_contents` VALUES ('1', 'Working with Scandic Fusion is a great professional experience: both in terms of quality of delivered service and in terms of communication between our companies');
INSERT INTO `about_contents` VALUES ('2', 'The brand name and reputation we have built in BI industry is an achievement of the outstanding team that works in Scandic Fusion');

-- ----------------------------
-- Table structure for `actions`
-- ----------------------------
DROP TABLE IF EXISTS `actions`;
CREATE TABLE `actions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` text,
  `page_id` int(11) DEFAULT NULL,
  `url` text,
  `icon` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of actions
-- ----------------------------
INSERT INTO `actions` VALUES ('1', 'About Scandic Fusion', '38', '', 'scandic');
INSERT INTO `actions` VALUES ('2', 'Meet our team', '26', '', 'team');
INSERT INTO `actions` VALUES ('3', 'Contact us', '6', '', 'paper-plane');
INSERT INTO `actions` VALUES ('4', 'Made By Agile55.com', null, 'http://agile55.com/', null);
INSERT INTO `actions` VALUES ('7', 'Join our team', '28', '', 'user-network');
INSERT INTO `actions` VALUES ('8', 'Industry solutions', '2', '', null);
INSERT INTO `actions` VALUES ('9', 'Cross company solutions', '3', '', null);
INSERT INTO `actions` VALUES ('10', 'BI implementation', '16', '', null);
INSERT INTO `actions` VALUES ('11', 'Maintenance & support', '17', '', '');
INSERT INTO `actions` VALUES ('12', 'Licensing advisory', '19', '', '');
INSERT INTO `actions` VALUES ('13', 'DWH & BI audit', '20', '', '');
INSERT INTO `actions` VALUES ('14', 'Data exploration', '21', '', '');

-- ----------------------------
-- Table structure for `atk4_hp_session`
-- ----------------------------
DROP TABLE IF EXISTS `atk4_hp_session`;
CREATE TABLE `atk4_hp_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `access_code` varchar(255) NOT NULL,
  `created_dts` datetime NOT NULL,
  `valid_seconds` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of atk4_hp_session
-- ----------------------------
INSERT INTO `atk4_hp_session` VALUES ('1', 'edit_frontend', '1', 'atk4_hp_55291320bbfab', '2015-04-11 13:27:12', '28800');
INSERT INTO `atk4_hp_session` VALUES ('2', 'edit_frontend', '1', 'atk4_hp_552913475ce35', '2015-04-11 13:27:51', '28800');
INSERT INTO `atk4_hp_session` VALUES ('3', 'edit_frontend', '1', 'atk4_hp_55291359f2529', '2015-04-11 13:28:09', '28800');
INSERT INTO `atk4_hp_session` VALUES ('4', 'edit_frontend', '1', 'atk4_hp_552913655983c', '2015-04-11 13:28:21', '28800');

-- ----------------------------
-- Table structure for `block`
-- ----------------------------
DROP TABLE IF EXISTS `block`;
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

-- ----------------------------
-- Records of block
-- ----------------------------
INSERT INTO `block` VALUES ('1', 'h1_spot', 'h1', null, '1', null, '0', '2015-04-11 13:26:31', '0');
INSERT INTO `block` VALUES ('2', 'markdown', 'markdown', '**aoeuauaoeuaoeu**\r\naoeuaou\r\n', '1', null, '0', '2015-04-11 13:26:31', '0');
INSERT INTO `block` VALUES ('3', 'h1_spot', 'h1', null, '2', null, '0', '2015-04-11 15:41:30', '0');
INSERT INTO `block` VALUES ('4', 'markdown', 'markdown', null, '2', null, '0', '2015-04-11 15:41:30', '0');
INSERT INTO `block` VALUES ('5', 'h1_spot', 'h1', null, '3', null, '0', '2015-04-11 15:41:41', '0');
INSERT INTO `block` VALUES ('6', 'markdown', 'markdown', null, '3', null, '0', '2015-04-11 15:41:41', '0');

-- ----------------------------
-- Table structure for `box`
-- ----------------------------
DROP TABLE IF EXISTS `box`;
CREATE TABLE `box` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` text,
  `position` enum('left','right') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of box
-- ----------------------------
INSERT INTO `box` VALUES ('1', '23', 'Policies and claims', '- Gross written premium  \r\n- Unused premium reserve  \r\n- RBNS reserve  \r\n- Payout  \r\n- Drilldown to risk premiums and insurance type  \r\n- Calculated amounts (derived KPIs)  \r\n- Sales budget  ', 'left');
INSERT INTO `box` VALUES ('2', '23', 'Claims management', '- Activity monitoring  \r\n- Handling time  \r\n- Reserves and regresse  ', 'right');
INSERT INTO `box` VALUES ('3', '23', 'Actuaries', '- Solvency II  \r\n- Insured amounts with drilldown to risk & insurance type level  ', 'left');
INSERT INTO `box` VALUES ('4', '23', 'Insurance clients', '- Client segmentation (new, returning, lost)  \r\n- Unique clients identification  ', 'right');
INSERT INTO `box` VALUES ('5', '23', 'Accumulated capital for life insurance', '- Investment analysis \r\n- Accumulated capital history tracking  ', 'left');
INSERT INTO `box` VALUES ('7', '23', 'Insurance debtors/creditors', '- Policy payment tracking by payment schedule  \r\n- Outstanding amounts balances of intermediarie', 'right');
INSERT INTO `box` VALUES ('8', '23', 'Reinsurance', '- Profitability  \r\n- Risk profile  \r\n- Reinsurance contract  ', 'left');
INSERT INTO `box` VALUES ('9', '24', 'Core elements', '- Products  \r\n- Accounts  \r\n- Customers   \r\n- Transactions\r\n- Payments\r\n- Account balances', 'left');
INSERT INTO `box` VALUES ('10', '23', 'Insurance market analysis', '- Policy counts and premium  \r\n- Claim counts and payout  ', 'right');
INSERT INTO `box` VALUES ('11', '23', 'Relevant cross company solutions', '- [Management accounting](https://scandicfusion.com/solutions/solution1)  \r\n- [ERP solution](https://scandicfusion.com/solutions/erp-analysis)  \r\n- [KPI engine ](https://scandicfusion.com/solutions/kpi-engine) \r\n- [...and more ](https://scandicfusion.com/solutions) ', 'right');
INSERT INTO `box` VALUES ('12', '24', 'Customer portfolio', '- Customer portfolio over time (new/active/lost)  \r\n- Customer segmentation analytics  \r\n- Profitability  ', 'right');
INSERT INTO `box` VALUES ('18', '34', 'Services portfolio', '- New services\r\n- Existing services  \r\n- Installation/removal of services  \r\n- Planned vs. actual service performance  \r\n- Service availability  \r\n- Product bundling  \r\n- Benefit analysis  ', 'left');
INSERT INTO `box` VALUES ('19', '34', 'Client portfolio', '- Loyalty (NPS)  \r\n- Customer segmentation analysis (private/corporate, new/existing, buying/not buying valuable service packages etc.)  \r\n- Marketing campaign influence on clients', 'right');
INSERT INTO `box` VALUES ('20', '34', 'Customer service', '- Notifications by clients  \r\n- Resolution times  \r\n- Resolution feedback  ', 'left');
INSERT INTO `box` VALUES ('21', '34', 'Customer call center (near real-time)', '- Number of calls by reasons  \r\n- Repeating/new calls  \r\n- Response time  \r\n- Customer feedback  ', 'right');
INSERT INTO `box` VALUES ('22', '34', 'Relevant cross-company solutions', '- [Management accounting](https://scandicfusion.com/solutions/solution1)  \r\n- [ERP solution](https://scandicfusion.com/solutions/erp-analysis)  \r\n- [KPI engine ](https://scandicfusion.com/solutions/kpi-engine) \r\n- [...and more ](https://scandicfusion.com/solutions) ', 'left');
INSERT INTO `box` VALUES ('23', '36', 'Manufacturing processes', '- Harvesting  \r\n- Forwarding  \r\n- Fell analysis  \r\n- Log yard analysis  \r\n- QA   \r\n- Harvester fleet  ', 'left');
INSERT INTO `box` VALUES ('24', '36', 'Transportation', '- Logistics optimization  \r\n- Timber trailer fleet  \r\n- Consigned inventory tracking  ', 'right');
INSERT INTO `box` VALUES ('25', '36', 'Sales', '- Measurement processes  \r\n- Timber  \r\n- Seedlings and seeds  \r\n- Chips  ', 'left');
INSERT INTO `box` VALUES ('26', '36', 'Relevant cross-company solutions', '- [ERP solution](https://scandicfusion.com/solutions/erp-analysis)  \r\n- [KPI engine](https://scandicfusion.com/solutions/kpi-engine)  \r\n- [...and more](https://scandicfusion.com/solutions)  ', 'right');
INSERT INTO `box` VALUES ('27', '35', 'Application analysis', '- Conversion ratio  \r\n- Rejection analysis  \r\n- Sales channels  \r\n- Customer portfolio analysis  ', 'left');
INSERT INTO `box` VALUES ('28', '35', 'Loan analysis', '- Surplus analysis  \r\n- Customer segmentation  \r\n- Payment discipline  ', 'right');
INSERT INTO `box` VALUES ('29', '35', 'Collection process', '- Collection workflow analysis  \r\n- Collection effectiveness  ', 'left');
INSERT INTO `box` VALUES ('30', '35', 'Relevant cross-company solutions', '- [Management accounting](https://scandicfusion.com/solutions/solution1)  \r\n- [ERP solution](https://scandicfusion.com/solutions/erp-analysis)  \r\n- [KPI engine ](https://scandicfusion.com/solutions/kpi-engine) \r\n- [...and more ](https://scandicfusion.com/solutions) ', 'right');
INSERT INTO `box` VALUES ('31', '32', 'Discrete manufacturing ', '- Raw materials purchase  \r\n- Product composition and setup monitoring  \r\n- Components tracking across manufacturing processes  \r\n- Components location tracking (within a warehouse)  \r\n- Advanced supply chain planning  ', 'left');
INSERT INTO `box` VALUES ('32', '32', 'Flow manufacturing', '- Raw materials purchase  \r\n- Operating time management and downtime planning  \r\n- Process control variable reporting  ', 'right');
INSERT INTO `box` VALUES ('33', '32', 'Support services', '- HR (employee competence assessment, allocation of resources)  \r\n- Safety regulations compliance  \r\n- Operations and job completion monitoring  ', 'left');
INSERT INTO `box` VALUES ('34', '32', 'Sales', '- Products sales  \r\n- Projects (turnkey solution) sales  \r\n- Services (information) sales ', 'right');
INSERT INTO `box` VALUES ('35', '32', 'Outbound & inbound logistics', '- On-time delivery management  \r\n- Carrier performance tracking  \r\n- Completion times optimization  ', 'left');
INSERT INTO `box` VALUES ('36', '32', 'Post-sale customer care', '- Warranty contracts  \r\n- Spare parts supply  \r\n- Calibration and repair  \r\n- Product software  services  ', 'right');
INSERT INTO `box` VALUES ('37', '32', 'R&D', '- Quality assurance and testing  \r\n- Extension of product line  \r\n- Precision management  \r\n- Production optimization  ', 'left');
INSERT INTO `box` VALUES ('38', '32', 'Relevant cross-company solutions', '- [Management accounting](https://scandicfusion.com/solutions/solution1)  \r\n- [ERP solution](https://scandicfusion.com/solutions/erp-analysis)  \r\n- [KPI engine ](https://scandicfusion.com/solutions/kpi-engine) \r\n- [...and more ](https://scandicfusion.com/solutions) ', 'right');
INSERT INTO `box` VALUES ('39', '24', 'Sales performance', '- Sales person/ department performance by product  \r\n- Promotion and motivation management  \r\n- Income from fees, commissions and interest', 'left');
INSERT INTO `box` VALUES ('43', '24', 'Relevant cross company solutions', '- [Management accounting](https://scandicfusion.com/solutions/solution1)  \r\n- [Customer & product portfolio analysis](https://scandicfusion.com/solutions/customer-and-product-portfolio-analysis)\r\n- [KPI engine](https://scandicfusion.com/solutions/kpi-engine)\r\n- [ERP analysis](https://scandicfusion.com/solutions/erp-analysis)\r\n- [...and more](https://scandicfusion.com/solutions)', 'left');
INSERT INTO `box` VALUES ('44', '24', 'Product specific analysis', '- Deposit portfolio  \r\n- Loan protfolio  \r\n- Investment portfolio  \r\n- Payment cards  \r\n- Cash operations  \r\n- Profitability', 'right');
INSERT INTO `box` VALUES ('45', '33', 'Sales analytics', '- Sales order completion  \r\n- Sales margins \r\n- Discount performance analysis  \r\n- Shipping  \r\n- Returns  ', 'left');
INSERT INTO `box` VALUES ('46', '33', 'Service analytics', '- Service activities  \r\n- Workload analysis  \r\n- Service statistics  ', 'right');
INSERT INTO `box` VALUES ('47', '33', 'Warehouse management', '- Inventory transactions  \r\n- Stock balances and value  \r\n- Stock devaluation  \r\n- BOM analytics  ', 'left');
INSERT INTO `box` VALUES ('48', '33', 'Purchasing management', '- Requisition analysis  \r\n- Purchase order completion  \r\n- Receiving  \r\n- Returns  ', 'right');
INSERT INTO `box` VALUES ('49', '33', 'Outbound & inbound logistics', '- On-time delivery management  \r\n- Carrier performance tracking  \r\n- Completion times optimization  ', 'left');
INSERT INTO `box` VALUES ('50', '33', 'Invoice management', '- Purchase invoices  \r\n- Creditor analytics  \r\n- Sales invoices  \r\n- Debtor analytics   ', 'right');
INSERT INTO `box` VALUES ('51', '33', 'Relevant cross company solutions', '- [Management accounting](https://scandicfusion.com/solutions/solution1)  \r\n- [ERP solution](https://scandicfusion.com/solutions/erp-analysis)  \r\n- [KPI engine](https://scandicfusion.com/solutions/kpi-engine)  \r\n- [...and more](https://scandicfusion.com/solutions)  ', 'left');

-- ----------------------------
-- Table structure for `client_logos`
-- ----------------------------
DROP TABLE IF EXISTS `client_logos`;
CREATE TABLE `client_logos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `client_logo_id` int(11) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of client_logos
-- ----------------------------
INSERT INTO `client_logos` VALUES ('2', 'Girts Vikmanis', '34', 'Head of Data Warehouse and System Integration Department');
INSERT INTO `client_logos` VALUES ('3', 'Girts Vikmanis', '35', 'Head of Data Warehouse and System Integration Department');
INSERT INTO `client_logos` VALUES ('4', 'Girts Vikmanis', '36', 'Head of Data Warehouse and System Integration Department');
INSERT INTO `client_logos` VALUES ('5', 'Girts Vikmanis', '37', 'Head of Data Warehouse and System Integration Department');
INSERT INTO `client_logos` VALUES ('6', 'Girts Vikmanis', '38', 'Head of Data Warehouse and System Integration Department');
INSERT INTO `client_logos` VALUES ('12', 'Girts Vikmanis', '44', ' Head of Data Warehouse and System Integration Department ');

-- ----------------------------
-- Table structure for `dictionary`
-- ----------------------------
DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE `dictionary` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `descr` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dictionary
-- ----------------------------
INSERT INTO `dictionary` VALUES ('5', 'data mart', 'Business line-specific subset of a data warehouse');
INSERT INTO `dictionary` VALUES ('6', 'Data mart', 'Business line-specific subset of a data warehouse');

-- ----------------------------
-- Table structure for `filestore_file`
-- ----------------------------
DROP TABLE IF EXISTS `filestore_file`;
CREATE TABLE `filestore_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `filestore_type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'File type',
  `filestore_volume_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Volume',
  `original_filename` varchar(255) NOT NULL DEFAULT '' COMMENT 'Original Name',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT 'Internal Name',
  `filesize` int(11) NOT NULL DEFAULT '0' COMMENT 'File size',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Deleted file',
  PRIMARY KEY (`id`),
  KEY `fk_filestore_file_filestore_type1_idx` (`filestore_type_id`),
  KEY `fk_filestore_file_filestore_volume1_idx` (`filestore_volume_id`),
  CONSTRAINT `fk_filestore_file_filestore_type1` FOREIGN KEY (`filestore_type_id`) REFERENCES `filestore_type` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_filestore_file_filestore_volume1` FOREIGN KEY (`filestore_volume_id`) REFERENCES `filestore_volume` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of filestore_file
-- ----------------------------
INSERT INTO `filestore_file` VALUES ('13', '2', '1', 'thumb_team-4.jpg', '0/20170523105649_1_thumb-team-4.jpg', '4372', '0');
INSERT INTO `filestore_file` VALUES ('14', '2', '1', 'team-4.jpg', '0/20170523105649_0_team-4.jpg', '47273', '0');
INSERT INTO `filestore_file` VALUES ('15', '2', '1', 'team-4.jpg', '0/20170523105649_0_team-4.jpg', '47273', '0');
INSERT INTO `filestore_file` VALUES ('16', '2', '1', 'thumb_team-3.jpg', '0/20170523105656_1_thumb-team-3.jpg', '5820', '0');
INSERT INTO `filestore_file` VALUES ('17', '2', '1', 'team-3.jpg', '0/20170523105656_0_team-3.jpg', '67839', '0');
INSERT INTO `filestore_file` VALUES ('18', '2', '1', 'team-3.jpg', '0/20170523105656_0_team-3.jpg', '67839', '0');
INSERT INTO `filestore_file` VALUES ('19', '2', '1', 'thumb_team-2.jpg', '0/20170523105704_1_thumb-team-2.jpg', '4468', '0');
INSERT INTO `filestore_file` VALUES ('20', '2', '1', 'team-2.jpg', '0/20170523105704_0_team-2.jpg', '49618', '0');
INSERT INTO `filestore_file` VALUES ('21', '2', '1', 'team-2.jpg', '0/20170523105704_0_team-2.jpg', '49618', '0');
INSERT INTO `filestore_file` VALUES ('24', '2', '1', 'team-4.jpg', '0/20170524072305_0_team-4.jpg', '47273', '0');
INSERT INTO `filestore_file` VALUES ('27', '2', '1', 'portfolio-1.jpg', '0/20170524073800_0_portfolio-1.jpg', '12577', '0');
INSERT INTO `filestore_file` VALUES ('28', '2', '1', 'thumb_portfolio-4.jpg', '0/20170524074138_1_thumb-portfolio-4.jpg', '3004', '0');
INSERT INTO `filestore_file` VALUES ('29', '2', '1', 'portfolio-4.jpg', '0/20170524074138_0_portfolio-4.jpg', '50666', '0');
INSERT INTO `filestore_file` VALUES ('30', '2', '1', 'portfolio-4.jpg', '0/20170524074138_0_portfolio-4.jpg', '50666', '0');
INSERT INTO `filestore_file` VALUES ('31', '2', '1', 'thumb_portfolio-1.jpg', '0/20170524075641_1_thumb-portfolio-1.jpg', '2862', '0');
INSERT INTO `filestore_file` VALUES ('32', '2', '1', 'portfolio-1.jpg', '0/20170524075641_0_portfolio-1.jpg', '12577', '0');
INSERT INTO `filestore_file` VALUES ('33', '2', '1', 'portfolio-1.jpg', '0/20170524075641_0_portfolio-1.jpg', '12577', '0');
INSERT INTO `filestore_file` VALUES ('34', '1', '1', 'latvenergo.png', '0/20170525101243_0_latvenergo.png', '38112', '0');
INSERT INTO `filestore_file` VALUES ('35', '1', '1', 'latvenergo.png', '0/20170525101253_0_latvenergo.png', '38112', '0');
INSERT INTO `filestore_file` VALUES ('36', '1', '1', 'latvenergo.png', '0/20170525101331_0_latvenergo.png', '38112', '0');
INSERT INTO `filestore_file` VALUES ('37', '1', '1', 'latvenergo.png', '0/20170525101341_0_latvenergo.png', '38112', '0');
INSERT INTO `filestore_file` VALUES ('38', '1', '1', 'latvenergo.png', '0/20170525101354_0_latvenergo.png', '38112', '0');
INSERT INTO `filestore_file` VALUES ('39', '1', '1', 'latvenergo.png', '0/20170525101403_0_latvenergo.png', '38112', '0');
INSERT INTO `filestore_file` VALUES ('40', '1', '1', 'latvenergo.png', '0/20170525101416_0_latvenergo.png', '38112', '0');
INSERT INTO `filestore_file` VALUES ('41', '1', '1', 'latvenergo.png', '0/20170525101431_0_latvenergo.png', '38112', '0');
INSERT INTO `filestore_file` VALUES ('42', '1', '1', 'latvenergo.png', '0/20170525101440_0_latvenergo.png', '38112', '0');
INSERT INTO `filestore_file` VALUES ('43', '1', '1', 'latvenergo.png', '0/20170525101452_0_latvenergo.png', '38112', '0');
INSERT INTO `filestore_file` VALUES ('44', '1', '1', 'latvenergo.png', '0/20170525112934_0_latvenergo.png', '38112', '0');

-- ----------------------------
-- Table structure for `filestore_image`
-- ----------------------------
DROP TABLE IF EXISTS `filestore_image`;
CREATE TABLE `filestore_image` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `original_file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Original File',
  `thumb_file_id` int(10) unsigned DEFAULT NULL COMMENT 'Thumbnail file',
  PRIMARY KEY (`id`),
  KEY `fk_filestore_image_filestore_file1_idx` (`original_file_id`),
  KEY `fk_filestore_image_filestore_file2_idx` (`thumb_file_id`),
  CONSTRAINT `fk_filestore_image_filestore_file1` FOREIGN KEY (`original_file_id`) REFERENCES `filestore_file` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_filestore_image_filestore_file2` FOREIGN KEY (`thumb_file_id`) REFERENCES `filestore_file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of filestore_image
-- ----------------------------
INSERT INTO `filestore_image` VALUES ('1', '14', '13');
INSERT INTO `filestore_image` VALUES ('2', '15', '13');
INSERT INTO `filestore_image` VALUES ('3', '17', '16');
INSERT INTO `filestore_image` VALUES ('4', '18', '16');
INSERT INTO `filestore_image` VALUES ('5', '20', '19');
INSERT INTO `filestore_image` VALUES ('6', '21', '19');
INSERT INTO `filestore_image` VALUES ('8', '24', null);
INSERT INTO `filestore_image` VALUES ('10', '27', null);
INSERT INTO `filestore_image` VALUES ('11', '29', '28');
INSERT INTO `filestore_image` VALUES ('12', '30', '28');
INSERT INTO `filestore_image` VALUES ('13', '32', '31');
INSERT INTO `filestore_image` VALUES ('14', '33', '31');

-- ----------------------------
-- Table structure for `filestore_type`
-- ----------------------------
DROP TABLE IF EXISTS `filestore_type`;
CREATE TABLE `filestore_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT 'Name',
  `mime_type` varchar(64) NOT NULL DEFAULT '' COMMENT 'MIME type',
  `extension` varchar(5) NOT NULL DEFAULT '' COMMENT 'Filename extension',
  `allow` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of filestore_type
-- ----------------------------
INSERT INTO `filestore_type` VALUES ('1', 'png', 'image/png', 'png', '1');
INSERT INTO `filestore_type` VALUES ('2', 'jpeg', 'image/jpeg', 'jpg', '1');
INSERT INTO `filestore_type` VALUES ('3', 'gif', 'image/gif', 'gif', '1');
INSERT INTO `filestore_type` VALUES ('4', 'pdf', 'application/pdf', 'pdf', '1');
INSERT INTO `filestore_type` VALUES ('5', 'doc', 'application/doc', 'doc', '0');
INSERT INTO `filestore_type` VALUES ('6', 'xls', 'application/xls', 'xls', '0');

-- ----------------------------
-- Table structure for `filestore_volume`
-- ----------------------------
DROP TABLE IF EXISTS `filestore_volume`;
CREATE TABLE `filestore_volume` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT 'Volume name',
  `dirname` varchar(128) NOT NULL DEFAULT '' COMMENT 'Folder name',
  `total_space` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Total space (not implemented)',
  `used_space` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Used space (not implemented)',
  `stored_files_cnt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Approximate count of stored files',
  `enabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Volume enabled?',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of filestore_volume
-- ----------------------------
INSERT INTO `filestore_volume` VALUES ('1', 'upload', 'upload', '1000000000', '0', '37', '1');

-- ----------------------------
-- Table structure for `jobs`
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content_left` text,
  `content_right` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jobs
-- ----------------------------
INSERT INTO `jobs` VALUES ('1', 'Business Intelligence consultant', '##### **DESCRIPTION**\r\n\r\nThe open position includes involvement in (and eventually management of) full-scale IT projects, working closely with developers and other colleagues on achieving results and delivering top notch solutions to our clients by having direct communication with them.    ', '##### **REQUIREMENTS**\r\nBSc or MSc in Economics/Business/IT, ability to work effectively in a team, work experience (and/or strong interest and good learning skills) in IT and BI is an advantage.   \r\n');
INSERT INTO `jobs` VALUES ('2', 'Business Intelligence SQL developer', '##### **DESCRIPTION**\r\n\r\nYou will be in charge of designing and deploying Business Intelligence solutions, including setting up and developing ETL. Depending on the stage of a project, you are also expected to be capable of maintaining and troubleshooting an existing BI solution, configuring BI servers and connections. The job involves close cooperation with your colleagues.   ', '##### **REQUIREMENTS**\r\nHigher education in IT, work experience with relational databases (Sybase IQ, Oracle DB, Vertica, Teradata, Microsoft Server etc.) and ETL tools like SAP Data Services, Oracle Data Integrator, Pentaho Data Integrator is an advantage.    \r\n');

-- ----------------------------
-- Table structure for `language`
-- ----------------------------
DROP TABLE IF EXISTS `language`;
CREATE TABLE `language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_code` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of language
-- ----------------------------

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', null, 'services', 'main', 'Competences\r\n& Services', '', '', '0');
INSERT INTO `menu` VALUES ('2', null, 'industry', 'main', 'Industry\r\nSolutions', '', '', '2');
INSERT INTO `menu` VALUES ('3', null, 'solutions', 'main', 'Cross Company\r\nSolutions', '', '', '3');
INSERT INTO `menu` VALUES ('4', null, 'technology', 'main', 'Technology\r\nStack', '', '', '4');
INSERT INTO `menu` VALUES ('6', null, '', null, 'About Scandic\r\nFusion', '', '', '5');
INSERT INTO `menu` VALUES ('7', '6', 'about', null, 'About Us', '', '', '1');
INSERT INTO `menu` VALUES ('8', '6', 'team', null, 'Our Team', '', '', '2');
INSERT INTO `menu` VALUES ('9', '6', 'jobs', null, 'Jobs', '', '', '3');
INSERT INTO `menu` VALUES ('10', '6', 'contact', null, 'Contact Us', '', '', '0');
INSERT INTO `menu` VALUES ('12', null, 'client', null, 'Our Clients', '', '', '1');

-- ----------------------------
-- Table structure for `page`
-- ----------------------------
DROP TABLE IF EXISTS `page`;
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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of page
-- ----------------------------
INSERT INTO `page` VALUES ('1', 'index', null, '1', 'Intelligent Decisions for Business', null, null, '', null, null, null, null, null, '{\"5530cefc44a29\":{\"action_1\":\"Competences & Services\",\"action_1_link\":\"4\",\"action_2\":\"Industry solutions\",\"action_2_link\":\"2\",\"hiring_title\":\"\",\"hiring_subtitle\":\"\",\"id\":\"5530cefc44a29\",\"action_3\":\"Cross company solutions\",\"action_3_link\":\"3\",\"hiring_link\":\"\"}}', '', null, null);
INSERT INTO `page` VALUES ('2', 'industry', null, '3', 'Industry Solutions', null, 'Business Intelligence as a tool can serve all kinds of needs in virtually any of existing industries. The only limitations are availability of high-quality data and imagination of decision-makers and BI specialists. Scandic Fusion has an extensive experience in wide range of industries, and is ready to implement its know-how, find and build the best possible solutions for new projects.', '', '1', null, null, null, null, '{\"55522ac2b14c0\":{\"label_text\":\"Didn\'t find your\\r\\nindustry here?\",\"label_page_id\":\"3\",\"label_link\":\"https:\\/\\/scandicfusion.com\\/solutions\",\"id\":\"55522ac2b14c0\"}}', 'Cannot find your industry in the list? Check our cross company solutions', '9', null);
INSERT INTO `page` VALUES ('3', 'solutions', null, '5', 'Cross Company Solutions', null, 'Even though each separate BI solution is tailored for specific business needs, there are types of solutions, which are needed for all or most companies, independently of what industry they operate in. Scandic Fusion offers a range of solutions that can significantly alleviate analysis of the company performance, and be useful for all levels of management.', '', '1', null, null, null, null, '{\"555474304eaaf\":{\"label_text\":\"Cannot find the solution\\r\\nyou are looking for?\",\"label_page_id\":\"6\",\"label_link\":\"https:\\/\\/scandicfusion.com\\/contact\",\"id\":\"555474304eaaf\"}}', 'Any questions?', '3', null);
INSERT INTO `page` VALUES ('4', 'services', null, '4', 'Competences & Services', '', 'Setting up a Business Intelligence solution is a complex process, which incorporates various steps and stages. Scandic Fusion specializes in delivering full range of Business Intelligence services: pre-study of BI needs, BI implementation, rapid deployment of productized data marts, maintenance and support, advisory, license sales, implementing forecasting toolkit as part of BI, performing advanced data discovery using mining and predictive tools.', '', '1', null, null, null, null, null, 'Our expertise', '8', '9');
INSERT INTO `page` VALUES ('5', 'technology', null, '6', 'Technology Stack', null, 'Business Intelligence architecture requires several types of software components. Scandic Fusion works with world leading technologies, which are used and trusted by many businesses. ', '', '1', null, null, null, null, null, 'Check our industry experience', '8', null);
INSERT INTO `page` VALUES ('6', 'contact', null, '2', 'Contact Page', null, 'Why clients choose us? Well, there are many reasons, among which you can name that Scandic Fusion delivers outstanding quality solutions, exceeds expectations, and brings value to your business in the most efficient and professional way. Additionally to that, one of our key principles is to make sure that what you see is exactly what you get: people who make a sales pitch are the same ones who will be managing your project and are responsible for the outcomes.\r\n\r\n', '', '1', 'Karlis Vitols\r\nCEO\r\nk.vitols@scandicfusion.com\r\noffice: Riga, Berzaunes street, 9\r\n\r\nJob inquiries:\r\ndarbs@scandicfusion.com\r\n\r\nOther inquiries (office administrator):\r\noffice@scandicfusion.com\r\n+371 22108870', 'SIA Scandic Fusion\r\nRegistration number: LV40003908470\r\nBank: Swedbank\r\nIBAN: LV82HABA0551016224895\r\nSWIFT: HABALV22\r\n\r\nLegal address: \r\nCiekurkalna 2 skerslinija 4 k1-30\r\nRiga, LV-1026, Latvia', null, null, null, '', '2', '7');
INSERT INTO `page` VALUES ('14', 'services/pre-study-of-bi-needs', '4', '4', 'Pre-study of BI Needs', 'Some customers prefer to start their BI implementation directly with a development project, whereas others opt for a pre-study phase that allows to formulate BI needs before actual development starts. ', 'There are multiple reasons for carrying out a pre-study project:\r\n\r\nWe have seen scenarios where companies recognize needs for BI and have certain requirements for it, but want to reconfirm the initiative before making any investments.\r\n\r\nAlternatively, we have met with companies who have made investments in data warehouse technologies years ago and would like to evaluate the potential conversion of such solutions into up-to-date BI initiatives due to outdated or underutilized technologies that don’t deliver the full range of possible business gains.\r\n\r\nWe can say from our experience that companies who have many source systems often possess quite complex reporting mechanisms. As those cannot be easily broken down into simple structures, the optimization mechanisms and BI architecture are naturally also more complicated and may require external input. \r\n\r\nBI pre-study projects help in addressing all these and many other issues.\r\nDuring the pre-study phase, business needs are converted into a specification of valid BI requirements through interviews and workshops. These workshops are aligned with business priorities, technical architecture; they include suggestions and implications towards processes, systems, software components that are required for BI initiative.\r\n', 'interviews with business representatives \r\ninterviews with IT-personnel \r\nrequirements specifications \r\ntechnical architecture \r\nproject plan (aligned with priorities)\r\nprototype/demo', '1', null, null, null, 'aim', null, 'Check our industry experience', '8', null);
INSERT INTO `page` VALUES ('16', 'services/bi-implementation', '4', '4', 'BI Implementation', 'BI development process typically takes our clients through several iterations, gradually shaping the solution in the form that they desire it to be. ', 'Business users are able to see and get their hands on tangible progress every 2 weeks, even if it is a custom built BI solution for very specific needs.\r\n\r\nBefore diving into pure custom-built solutions, it might be useful to consider taking a look and possibly reusing some of our existing know-how. We have extensive experience in a variety of [specific industries](https://scandicfusion.com/industry) as well as in [cross company solutions](https://scandicfusion.com/solutions). Reusing previous experience enables rapid deployment, shorter implementation timeframe, minimized risks and reduced costs. Our best practices and cross industry know-how is there to be transferred into fulfilment of business needs of any company that is considering BI deployment.\r\n\r\nOur clients have different backgrounds and different requirements, but there is at least one common thing they all value in Scandic Fusion: results are on-time, in budget and exceed initial expectations.\r\n', 'DB model\r\nETL load\r\nBI metadata\r\ntrainings\r\ndata validation\r\ninteractive dashboards', '1', null, null, null, 'chart', null, 'Check our industry experience', '8', null);
INSERT INTO `page` VALUES ('17', 'services/maintenance-support', '4', '4', 'Maintenance & Support', 'Maintenance services give the feeling of a \"safety cushion\".', 'The support services provided by Scandic Fusion cover a wide range of tasks starting from educating business users about performing trivial as well as advanced actions in BI software up to more complex technical tasks such as maintenance of constantly changing source systems or availability and compatibility of installations of the latest software versions for various BI components. These are only a few of the typical cases where our current and potential clients want attention from a preferred supplier of Business Intelligence.\r\n\r\nWhen delivery or maintenance processes have been previously handled by a different supplier, Scandic Fusion proposes a transition process which enables smooth know-how transfer with no negative impact on operations related to BI.\r\n\r\n', 'proactive maintenance\r\nreactive maintenance\r\nper-request or SLA based\r\nchange management\r\ntraining\r\ngovernance', '1', null, null, null, 'maintenance', null, 'Check our industry experience', '8', null);
INSERT INTO `page` VALUES ('19', 'services/licensing-advisory', '4', '4', 'Licensing Advisory', 'It is often that our customers ask for advice on the best possible licensing models for a BI initiative. To comply with the best practices of a sustainable BI solution, the licensing model needs to be both cost efficient and functional now as well as in the long run.', 'Since the possible options and costs depend a lot on the growth of data volumes and/or the growth of the user base, it is very important to align licensing with future vision and plans of the company, \r\n\r\nScandic Fusion has extensive experience in working with different software providers and the related software packages/bundles. By analyzing our clients’ business needs and requirements, we can provide objective advice on which software components are the best pick for the initial requirements, while also taking into account the options for potential future scalability. Additionally, to ease the selection process for our customers, we are able to provide quotes for preferred choice of software with transparent and understandable pricing information.\r\n', 'optimal licensing policy for DB + ETL + BI tools\r\ntransparent long-term pricing scheme\r\ncalculations with several scalability options\r\nlicense sales', '0', null, null, null, 'scale', null, 'Check our industry experience', '8', null);
INSERT INTO `page` VALUES ('20', 'services/dwh-bi-audit', '4', '4', 'DWH & BI Audit', 'From time to time we have noticed situations where DWH/BI solutions have been implemented in a company a while ago, however there are still internal concerns about the performance/security/usability/overall sanity of the solution.', 'Scandic Fusion possesses expertise in auditing existing DWH/BI implementations. As a result, we provide a competent opinion of both the strong areas of the current solution as well as the parts that might require improvements. In addition, we aim to understand the utilized capacity of the existing solution, its potential enhancements and whether the current implementation allows for fulfilment of additional business needs the company might have.\r\n\r\nOur experience has shown that carrying out a DWH/BI audit project might help to overcome many everyday obstacles with minimal investments. There is a clear and common understanding afterwards as to where technical intervention is required and where it is sufficient to only adjust internal processes of the company in order to make the DWH/BI solution more usable.\r\n', 'ETL performance review\r\nbusiness critical BI performance review\r\nBI security solutions review\r\nsoftware components review', '1', null, null, null, 'clipboard', null, 'Check our industry experience', '8', null);
INSERT INTO `page` VALUES ('21', 'services/data-exploration', '4', '4', 'Data Exploration', 'Test', 'Test', 'Test', '0', null, null, null, 'compass', null, 'Check our industry experience', '8', null);
INSERT INTO `page` VALUES ('23', 'industry/insurance', '2', '3', 'Insurance', 'Scandic Fusion has experience with implementing BI solutions for both non-life and life insurance companies and business units.', 'The data marts typically required by our customers enable product-specific insight of MTPL, CASCO, property, travel, accident, health and civil liability insurance types among others.\r\n\r\nThe commonly used analytical metrics include such insurance industry relevant measures as gross written premiums, earned/unearned premiums in time, submitted/processed/paid claim amounts, loss ratio, regulated-unpaid and other potential payments outstanding as well as various insurance specific financial reserves in time.\r\n\r\nTypically, our customers prefer to have their insurance analytics bundled together with several cross-company solutions, including, but not limited to: management accounting, customer and product portfolio analysis, master data management, data mining and financial analytics.\r\n\r\nInteractive dashboards, which often serve as an end product for the BI users can afterwards support the everyday business decisions for various functions such as sales, claims administration, product managers and risk underwriters, actuaries, business controllers, accountants, general management and others.', '', '1', null, null, '0', 'umbrella', null, 'Any questions?', '3', null);
INSERT INTO `page` VALUES ('24', 'industry/banking', '2', '3', 'Banking', 'A typical banking industry BI solution, developed by Scandic Fusion, fully covers the core banking elements such as incoming/outgoing transactions, account balances per various time periods, loans and deposits analysis, an outlook on the performance of financial instruments, payment cards profitability and others.', 'A BI development project for a customer from banking industry is typically bundled together with several cross company solutions – a few of the most common are management accounting analysis (including transfer pricing and overhead allocation), customer and product portfolio analysis (insights on new/active/lost customers), marketing and sales performance analysis (including trends on upgrading or downgrading from existing products).\r\n\r\nInteractive dashboards are intuitive, easy to understand and can be utilized by a wide range of employees, starting from business analysts up to the board members of the company. They are best used to present data and ensure support of information based decisions for various business functions, including those responsible for sales, payment cards, credit risk management, deposits and financial instruments as well as business controllers, accountants, general management and others.\r\n\r\nThe solution that we typically offer to our clients does not aim to fulfill only pure operational or statutory reporting (which, is, of course, also possible). Instead, it enables strategic decision making. Customers, who already have a DWH initiative in place, use our solution for adding extra analytical insights to their everyday decisions. In addition they are building interactive dashboards that can be presented both internally as well as outside of the company. This type of BI implementation scenario is what we strive for and where we believe the greatest value from our work is added.\r\n', '', '1', null, null, '1', 'bank', null, 'Any questions?', '3', null);
INSERT INTO `page` VALUES ('25', 'industry/payment-cards', '2', '3', 'Payment Cards', 'Scandic Fusion has experience in developing BI solutions for companies that are operating with credit, debit and loyalty cards on everyday basis.', 'Such BI incentive fulfills strategic decision making interests for payment card divisions in banks (issuing/acquiring/both), payment card processing centers and major merchants. The BI implementation proposed by Scandic Fusion covers both the issuing perspective (focusing on performance of payment cards from the perspective of the emitter) and acquiring perspective (focusing on performance of payment cards from the perspective of the acquiring networks such as ATM, POS, eCommerce).\r\n\r\nThe data marts that are most commonly required by our customers provide full information of core business elements – payment authorizations, transactions, balances, card limits, exception items, frauds. In a typical scenario we provide additional dimensionality that enables splitting core business elements by the most relevant categories such as customers, card types and individual cards, merchants, card terminals, authorization/transaction details.\r\n\r\nA BI development project of such scope is usually bundled with several cross company solutions for additional business and strategic insights. Those include, but are not limited to, management accounting (with emphasis on card product profitability), customer and product portfolio analysis (customer tendencies in time by different customer segments), marketing and sales performance analysis (marketing campaign impact, payment card upgrade/downgrade tendencies in different periods of time).\r\n\r\nInteractive dashboards as our proposed way of representing the business insights on payment card performance can be utilized by all the involved parties – banks, processing centers, merchants etc. The dashboards that are intuitive and easy to understand are helpful in ensuring support of information based decisions for various business functions of the involved entities, including those responsible for sales, marketing, product portfolio, credit risk management, support functions and general management.\r\n', '', '1', null, null, '2', 'cards', null, 'Any questions?', '3', null);
INSERT INTO `page` VALUES ('26', 'team', null, '7', 'Our Team', null, 'The brand name and reputation we have built in BI industry is an achievement of the outstanding team that works in Scandic Fusion. Our great work environment is made by  exceptionally great colleagues who are also fascinating and fun personalities. Meet them!', '', null, null, null, null, null, '{\"552e4f8254b45\":{\"display_block\":true,\"width\":\"8\",\"title\":\"Join Our Team\",\"subtitle\":\"We are in search for new talent.\",\"page_id\":\"28\",\"id\":\"552e4f8254b45\"}}', '', '1', '3');
INSERT INTO `page` VALUES ('27', '404', null, '8', '404: Page Not Found', null, null, '', null, null, null, null, null, null, null, null, null);
INSERT INTO `page` VALUES ('28', 'jobs', null, '9', 'Career in Scandic Fusion', null, 'At Scandic Fusion we are in constant search for talented and inspirational colleagues. Have a look at the open positions and get in contact with us if you feel that we could be a good match.', '', null, null, null, null, null, null, '', '1', '2');
INSERT INTO `page` VALUES ('30', 'industry/healthcare', '2', '3', 'Healthcare', 'Scandic Fusion successfully manages implementation projects of full-scale BI solutions for healthcare businesses. ', 'Typically, we build the analytical data models to keep track of customer turnover and profitability, facilities and staff workload, equipment usage and procurement as well as for evaluation of efficiency of various healthcare business processes (e.g. through calculated/derived internal KPIs).\r\n\r\nAdditionally to the core business analysis solutions, customers from healthcare industry usually also demand management and financial accounting analytics as well as cash flow forecasting and analysis platforms.  These solutions can be utilized by the management of the company as they supplement the operational data.\r\n\r\nAs an end result of the project the business representatives and company management receive an easy to use and intuitive toolset for analysis of both day-to-day and long-term performance of the enterprise. The basic and most widely used components consist of dashboards, which present and manage data in a manner that is convenient for data exploration and decision-making. Apart from pre-made reports and dashboards, we teach business representatives the necessary skills to promptly create customized reports for answering any business questions response to which can be supported by the data available. All of the things above empower making of competent strategic decisions and allow managers to get the most out of company’s data.   \r\n', '', '0', null, null, '3', 'heartbeat', null, 'Any questions?', '3', null);
INSERT INTO `page` VALUES ('31', 'industry/energy', '2', '3', 'Energy', null, null, '', '0', null, null, '4', 'bulb', null, null, null, null);
INSERT INTO `page` VALUES ('32', 'industry/manufacturing', '2', '3', 'Manufacturing', 'Scandic Fusion has experience in providing BI solutions that are tailored for capital intensive manufacturing companies. The BI platform provides an opportunity to have an extensive summary overlook of the whole company performance for management purposes as well as the ability to look at the details and understand how the separate tasks and manufacturing components influence the company’s execution on more operational level.', 'The standard BI solution typically covers the core manufacturing processes (such as supply chain management, warehouse outlook and planning, manufacturing teams performance) as well as support services such as on-time delivery, post-sales services (incl. warranty) and research and development.\r\n\r\nIt is common practice of Scandic Fusion to additionally cover our clients’ management and financial reporting needs, such as sales and profitability of manufactured products (incl. bundles), performance of sales and marketing activities as well as the most common financial reporting requirements such as profit/loss or management KPI development and analysis.\r\n\r\nOne of the biggest cornerstones of a successful BI implementation in this industry is the ability to showcase the overall company performance by using interactive dashboards and easy-to-use reporting tools and not lose the possibilities to drill down into the most detailed everyday tasks and manufacturing components to understand the causalities behind the results. This has been a challenge that Scandic Fusion pays attention to and has tackled well so far.\r\n', '', '1', null, null, '5', 'factory', null, 'Any questions?', '3', null);
INSERT INTO `page` VALUES ('33', 'industry/wholesale', '2', '3', 'Wholesale', null, null, '', '1', null, null, '6', 'warehouse', null, 'Any questions?', '3', null);
INSERT INTO `page` VALUES ('34', 'industry/telecom', '2', '3', 'Telecom', 'Scandic Fusion is experienced in providing all-around BI solutions for companies operating in telecommunications industry.', 'As the telecommunications market is often over-competitive and there is little to no cost for the customers to switch between service providers or network carriers, the companies operating in the field have to pay special attention to the factors that influence customer loyalty (NPS), service quality, satisfaction with troubleshooting as well as pricing and profitability of services.\r\n\r\nA typical approach to such a BI implementation also requires the ability to track the company’s financials as well as management KPIs in order to understand the impact on performance both from historical actions and predict the outcomes of future investment projects or marketing campaigns.\r\n\r\nIt is important to ensure a versatile solution that allows to “play around” with the data in an exploratory fashion as it helps in finding tendencies and patterns between e.g. various client and service segments and identifies their strong and weak sides from the company’s perspective. This is something Scandic Fusion provides with universal data marts that cover cross-company business areas and allow the data to be detailed down and summed up to the maximum extent possible. The end result therefore covers the analytical needs of both the executive board as well as the entry-level analysts throughout the company. \r\n', '', '1', null, null, '7', 'tower', null, 'Any questions?', '3', null);
INSERT INTO `page` VALUES ('35', 'industry/micro-crediting', '2', '3', 'Micro crediting', 'The BI implementation expertise offered by Scandic Fusion has been used by leading microcrediting companies in the Baltics.', 'The core BI foundation usually offers a deeper understanding of overall performance, profitability and lifecycle of small credits, leasing and asset backed loans. Typically a well-designed BI solution includes performance indicators on such business areas as loan application handling, loan issuing, loan repayment rates, loan surplus and debt recovery amounts as well as customer attraction and support analysis.\r\n\r\nIn addition, there are several cross company solutions that are typically chosen by our customers as a bundle that supplements the core operational data. The most commonly picked components are management accounting analytics, customer and product portfolio lifecycle analysis, call center analysis and marketing and sales performance analysis (incl. analysis on performance of web-services from data that is accumulated e.g. via Google analytics).\r\n\r\nInteractive dashboards, as our proposed way of representing the business insights, are intuitive, easy to understand and can be utilized by a wide range of employees, starting from business analysts up to the board members of the company. The dashboards serve client managers reviewing the performance/surplus of their client accounts on a daily basis as well as senior management monitoring overall profitability and sustainability of the credit portfolio on a periodic basis.', '', '1', null, null, '8', 'banknotes', null, 'Any questions?', '3', null);
INSERT INTO `page` VALUES ('36', 'industry/forestry', '2', '3', 'Forestry', 'Scandic Fusion has the necessary expertise and skills to provide a comprehensive BI analytical platform in an industry as challenging as forestry. ', 'We have the experience of helping our customers in analyzing the full supply chain of a large scale forest management business.\r\n\r\nIn addition to a full-scale core business analysis and because of the complexity and dynamic nature of conditions affecting timber production, we have also helped our customers to achieve online analytics for manufacturing processes. Such an approach offers possibilities to look at real-time data for harvested and forwarded quantities by timber lengths, diameters, species and products as well as current information on fell statuses and log yard quantities.\r\n\r\nOther relevant BI implementation areas include harvester fleet analysis, which gives insights into harvester statuses and their calibration information. Transportation process analysis is used for optimization of logistics processes and timber truck fleet capacity analysis. Sales analytics for a company in forest management industry include data on timber measurement records in timber mills, timber seedling and seed and chips sales performance. \r\n\r\nAnother major part of a forestry related business covers subcontractor management. Taking this into account, our analytics platform provides the possibilities of contract follow-up and QA data analysis. \r\n\r\nThe BI foundation developed by us also helps to analyze forest development and infrastructure projects, starting from project planning phase, into execution and up to the final project delivery. This area of operations is especially important when looking at the business from long-term forest management perspective.\r\n\r\nTo complement the industry specific solution, our clients usually choose to bundle it together with cross-company solutions, the most relevant ones being ERP analysis, utilization of KPI engine, cash flow forecasting and analysis platform as well as tailor-made investment project solutions.\r\n', '', '1', null, null, '9', 'leaf', null, 'Any questions?', '3', null);
INSERT INTO `page` VALUES ('37', 'industry/aviation', '2', '3', 'Aviation', null, null, '', '0', null, null, '10', 'plane', null, null, null, null);
INSERT INTO `page` VALUES ('38', 'about', null, '10', 'Our History', null, 'Scandic Fusion specializes on delivering full range of Business Intelligence (BI) services: pre-study of BI needs, BI implementation, rapid deployment of productized data marts, maintenance and support, advisory and license sales, implementing forecasting toolkit as part of BI, performing advanced data discovery using mining and predictive tools.', '', null, null, null, null, null, null, '', '2', '3');
INSERT INTO `page` VALUES ('39', 'solutions/solution1', '3', '5', 'Management accounting', 'Scandic Fusion offers management accounting solution which presents Profit & Loss and Balance Sheet in much more interactive way than just a plain report in size of A4.', 'Interactive dashboards can be used centrally (top management) and decentrally (middle management, product owners). Each user can see as much as he/she is allowed to see because of easily configurable security. Information is presented nicely via tables and charts, allowing step by step navigation to details.\r\n\r\nSolution is used by companies, which constantly want to follow revenue/cost positions, benchmark those against forecasted/budgeted/year ago and drill down to details of accounting transaction (and its source document details).\r\n\r\nSolution enables PL and BS consolidation (if intercompany transactions exist), one or several reporting currencies (important if legal units are located in different currency zones), adds on top of any accounting system (actual amounts are calculated using general ledger) and budgeting solution.\r\n\r\nCost allocation component performs automatic split of overhead and indirect costs that prepares managerial insight of product/service/department net profitability.\r\n\r\nBudgeting component can be handy in cases when company does not have central budgeting/forecasting application.\r\n\r\nAnalytical facts provide options to pre-calculate measures, e.g., month ago, year ago, year-to-date, rolling-12, actual vs. budget, actual vs. forecast, actual/forecast vs. budget.\r\n', '', '1', null, null, null, 'pie-chart', null, 'Any questions?', '3', null);
INSERT INTO `page` VALUES ('40', 'solutions/kpi-engine', '3', '5', 'KPI engine', 'Scandic Fusion offers KPI engine if your company needs metric-based visuals about company performance by various dimensions. This usually aligns if company implements balanced scorecard concept for measuring performance against company goals.', 'Data mart is based on a concept that all KPIs share similar dimensions (some might not be relevant).\r\n\r\nAnalytical facts provide measures for benchmarking actual vs. target or budgeted vs. month ago vs. year ago.\r\n\r\nMeasures are pre-calculated for data consistency when data is analyzed by various combinations of dimensions. This way, \"as of date\" and \"average\" measures show consistent values.\r\n\r\nIf a customer decides to start with KPI engine as the first BI project, it is important to account for data sources (typically, if KPIs cover most of what company does, then KPI calculations need all of the corresponding source systems that register those actions). ', '', '1', null, null, null, 'dashboard', null, 'Any questions?', '3', null);
INSERT INTO `page` VALUES ('41', 'solutions/customer-and-product-portfolio-analysis', '3', '5', 'Customer and product portfolio analysis', 'Business needs much more advanced characteristics besides those of customers and products, in order to identify which customer segments and products are most profitable and which are least profitable.', 'Scandic Fusion offers customer and product portfolio analysis solution.\r\n\r\nIn addition to static characteristics of customers and products, data mart gives advanced characteristics over time:\r\n- customers lifecycle attributes - new/active/lost/renewed   \r\n- how well customer is packed with product  \r\n- loyalty rating of customer  \r\n- payment discipline of customer  \r\n- profitability segmentation of customer  \r\n- sales transaction categorization as new or recurring  \r\n- sales transaction categorization from product profitability perspective as   upgrade/equal/downgrade\r\n\r\nInteractive dashboards allow:\r\n- to focus on new customers and estimate their potential  \r\n- to focus on existing customers and identify upselling and crosselling opportunitie  \r\n- to follow tendencies of leaving customers and initiate retention strategy where applicable  \r\n- to analyze active customers base and promote actions that improve profitability  ', '', '1', null, null, null, 'briefcase', null, 'Any questions?', '3', null);
INSERT INTO `page` VALUES ('42', 'solutions/erp-analysis', '3', '5', 'ERP analysis', 'Scandic Fusion offers universal data mart for ERP system analysis which contains details of each module and at the same time - enables common dimensions for seamlessly integrated analysis.', 'Deployment can be used on top of any ERP software, including (but not limited to) these: SAP R3, Oracle EBS, Axapta, Navision, Scala and others.\r\n\r\nData marts include dimensions and facts from various ERP modules: purchasing, inventory, sales orders, manufacturing, HRMS, payables, receivables, fixed assets, projects, property management, subledger accounting (aka \"controlling\"), general ledger.\r\n\r\nAnalytical facts provide details which are not naturally stored in ERP systems in historic way. For example, debtor balance by period, order fulfillment by period, procurement lead times by period, project fulfillment by period and many others. \r\n\r\nOur experience shows that there is no single recipe for interactive dashboards that will fulfill any business need. Instead, we use rapid deployment approach by prototyping a solution for different user groups until it shows exactly what is needed without sacrificing visual look and feel.\r\n', '', '1', null, null, null, 'flowchart', null, 'Any questions?', '3', null);
INSERT INTO `page` VALUES ('43', 'solutions/billing-and-credit-control', '3', '5', 'Billing and credit control', 'test', 'test', '', '0', null, null, null, 'coins', null, 'Any questions?', '3', null);
INSERT INTO `page` VALUES ('44', 'solutions/cf-forecasting', '3', '5', 'CF forecasting', null, null, '', '0', null, null, null, 'areachart', null, 'Any questions?', '3', null);
INSERT INTO `page` VALUES ('45', 'solutions/marketing-and-sales-performance-analysis', '3', '5', 'Marketing and sales performance analysis', null, null, '', '0', null, null, null, 'strategy', null, 'Any questions?', '3', null);
INSERT INTO `page` VALUES ('46', 'solutions/geographical-information-systems', '3', '5', 'Geographical information systems', null, null, '', '0', null, null, null, 'map', null, 'Any questions?', '3', null);
INSERT INTO `page` VALUES ('47', 'solutions/call-center-analysis', '3', '5', 'Call center analysis', null, null, '', '0', null, null, null, 'phone', null, 'Any questions?', '3', null);
INSERT INTO `page` VALUES ('48', 'solutions/master-data-management', '3', '5', 'Master data management', 'Having company’s key data stored in multiple systems typically is a cumbersome task. Having your customer, supplier and product records match between the systems is even harder. ', 'While many times the integration and single source of truth is created by the help of master data management systems, Scandic Fusion helps to do this also within the data warehouse. The additional benefit of this approach is that the power and algorithms of the data warehouse can be utilized to clean up large volumes of data quickly and feed them back to the source systems.', '', '1', null, null, null, 'cubes', null, 'Any questions?', '3', null);
INSERT INTO `page` VALUES ('49', 'solutions/budgeting', '3', '5', 'Budgeting & planning', 'Different companies have different budgeting needs. Some do just generic key PL position budgeting, some go through a thorough multi-phase top-down and bottom-up process across different business dimensions, with cost and revenue driver collection and cost allocation. ', 'One way or another, off-the-shelf software in these cases is typically an expensive investment. Scandic Fusion offers to create tailor made budgeting software, based on modern technologies and integrated into the business intelligence solution. This allows flexible budgeting process, having the actual data as a seed for the process, and also thorough analysis of the actual results versus different versions of budgets and forecasts. The same algorithms for overhead allocations used in the budgeting process can then be automatically applied also to the actual figures. ', '', '1', null, null, null, 'clock-coins', null, 'Any questions?', '3', null);
INSERT INTO `page` VALUES ('50', 'solutions/user-security-maintenance-solution', '3', '5', 'User security maintenance solution', null, null, '', '0', null, null, null, 'shield', null, 'Any questions?', '3', null);
INSERT INTO `page` VALUES ('51', 'solutions/big-data', '3', '5', 'Big data', null, null, '', '0', null, null, null, 'data', null, 'Any questions?', '3', null);
INSERT INTO `page` VALUES ('52', 'What Our Clients Say?', null, '2', 'What Our Clients Say?', null, 'What Our Clients Say?', '', null, '', '', null, null, null, null, null, null);
INSERT INTO `page` VALUES ('53', 'client_say', null, '2', 'What Our Clients Say?', null, 'What Our Clients Say?', '', '1', '', '', null, null, null, 'A', '2', '2');
INSERT INTO `page` VALUES ('54', 'xavoc', null, '10', 'Xavoc Technocrats', null, 'Even though each separate BI solution is tailored for specific business needs, there are types of solutions, which are needed for all or most companies, independently of what industry they operate in. Scandic Fusion offers a range of solutions that can significantly alleviate analysis of the company performance, and be useful for all levels of management.', '', '1', null, null, null, null, null, '', '7', '8');
INSERT INTO `page` VALUES ('61', 'client', null, '11', 'What Our Clients Say', null, 'Scandic Fusion specializes on delivering full range of Business Intelligence (BI) services: pre-study of BI needs, BI implementation, rapid deployment of productized data marts, maintenance and support, advisory and license sales, implementing forecasting toolkit as part of BI, performing advanced data discovery using mining and predictive tools.', '', '1', null, null, null, null, '{\"5923e1780c12b\":{\"display_block\":false,\"width\":\"\",\"title\":\"\",\"subtitle\":\"\",\"page_id\":\"\",\"id\":\"5923e1780c12b\"}}', '', '2', '3');

-- ----------------------------
-- Table structure for `page_translation`
-- ----------------------------
DROP TABLE IF EXISTS `page_translation`;
CREATE TABLE `page_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `language` varchar(25) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of page_translation
-- ----------------------------
INSERT INTO `page_translation` VALUES ('1', '1', 'en', 'index - en', null, null);
INSERT INTO `page_translation` VALUES ('2', '2', 'en', 'industry - en', null, null);
INSERT INTO `page_translation` VALUES ('3', '3', 'en', 'solutions - en', null, null);
INSERT INTO `page_translation` VALUES ('4', '6', 'en', ' - en', null, null);

-- ----------------------------
-- Table structure for `phinxlog`
-- ----------------------------
DROP TABLE IF EXISTS `phinxlog`;
CREATE TABLE `phinxlog` (
  `version` bigint(20) NOT NULL,
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of phinxlog
-- ----------------------------
INSERT INTO `phinxlog` VALUES ('0', '2015-04-11 17:52:30', '2015-04-11 17:52:30');
INSERT INTO `phinxlog` VALUES ('1', '2015-04-11 17:52:30', '2015-04-11 17:52:30');
INSERT INTO `phinxlog` VALUES ('20150210103808', '2015-04-11 17:52:30', '2015-04-11 17:52:30');

-- ----------------------------
-- Table structure for `search`
-- ----------------------------
DROP TABLE IF EXISTS `search`;
CREATE TABLE `search` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `block_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of search
-- ----------------------------

-- ----------------------------
-- Table structure for `settings`
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of settings
-- ----------------------------

-- ----------------------------
-- Table structure for `team`
-- ----------------------------
DROP TABLE IF EXISTS `team`;
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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of team
-- ----------------------------
INSERT INTO `team` VALUES ('4', '0', 'Karlis Vitols', '', '', 'CEO', '', '', 'karlis_vitols');
INSERT INTO `team` VALUES ('5', '1', 'Martins Berzins', '', '', 'BI Consultant', '', '', 'martins_berzins');
INSERT INTO `team` VALUES ('6', '2', 'Liga Kagaine', '', '', 'BI Consultant', '', '', 'liga_kagaine');
INSERT INTO `team` VALUES ('8', '5', 'Oskars Genavs', '', '', 'BI Developer', '', '', 'oskars_genavs');
INSERT INTO `team` VALUES ('9', '8', 'Raivis Blaumanis', '', '', 'BI Consultant', '', '', 'raivis_blaumanis');
INSERT INTO `team` VALUES ('10', '15', 'Alina Petrova', '', '', 'BI Consultant', '', '', 'alina_petrova');
INSERT INTO `team` VALUES ('11', '12', 'Tatjana Korobeinikova', '', '', 'BI Consultant', '', '', 'tatjana_korobeinikova');
INSERT INTO `team` VALUES ('12', '4', 'Daija Jansone', '', '', 'BI Consultant', '', '', 'daija_jansone');
INSERT INTO `team` VALUES ('15', '11', 'Darya Skakouskaya', '', '', 'BI Consultant', '', '', 'darya_skakouskaya');
INSERT INTO `team` VALUES ('16', '10', 'Rimants Vinups-Sakars', '', '', 'BI Consultant', '', '', 'rimants_vinups-sakars');
INSERT INTO `team` VALUES ('17', '3', 'Gatis Zimackis', '', '', 'BI Developer', '', '', 'gatis_zimackis');
INSERT INTO `team` VALUES ('19', '27', 'Gatis Ozolins', '', '', 'BI Developer', '', '', 'team-nophoto');
INSERT INTO `team` VALUES ('21', '9', 'Veronika Meinarte', '', '', 'BI Developer', '', '', 'veronika_meinarte');
INSERT INTO `team` VALUES ('22', '7', 'Gints Vitins', '', '', 'BI Developer', '', '', 'gints_vitins');
INSERT INTO `team` VALUES ('23', '13', 'Janis Selegovskis', '', '', 'BI Developer', '', '', 'janis_selegovskis');
INSERT INTO `team` VALUES ('26', '16', 'Gita Kolerte', '', '', 'Project Coordinator', '', '', 'gita_kolerte');
INSERT INTO `team` VALUES ('27', '17', 'Muntis Rudzitis', '', '', 'BI Developer', '', '', 'muntis_rudzitis');
INSERT INTO `team` VALUES ('28', '18', 'Martins Didrihsons', '', '', 'BI Developer', '', '', 'martins_didrihsons');
INSERT INTO `team` VALUES ('29', '19', 'Ruta Andersone', '', '', 'BI Consultant', '', '', 'ruta_andersone');
INSERT INTO `team` VALUES ('30', '30', 'Ilze Krauze', '', '', 'BI Consultant', '', '', 'team-nophoto');
INSERT INTO `team` VALUES ('32', '21', 'Sandis Dzerve', '', '', 'BI Developer', '', '', 'sandis_dzerve');
INSERT INTO `team` VALUES ('33', '22', 'Klavs Cirulis', '', '', 'BI Consultant', '', '', 'klavs_cirulis');
INSERT INTO `team` VALUES ('34', '23', 'Zane Magone', '', '', 'BI Consultant', '', '', 'zane_magone');
INSERT INTO `team` VALUES ('35', '24', 'Agnese Zeimula', '', '', 'BI Consultant', '', '', 'agnese_zeimula');
INSERT INTO `team` VALUES ('36', '25', 'Roberts Veics', '', '', 'BI Consultant', '', '', 'roberts_veics');
INSERT INTO `team` VALUES ('37', '26', 'Dagmara Kokorevica', '', '', 'BI Consultant', '', '', 'dagmara_kokorevica');

-- ----------------------------
-- Table structure for `technology`
-- ----------------------------
DROP TABLE IF EXISTS `technology`;
CREATE TABLE `technology` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content` text,
  `bullets` text,
  `position` enum('left','right','center') DEFAULT NULL,
  `class` varchar(255) DEFAULT NULL,
  `connection` varchar(255) DEFAULT NULL,
  `ord` int(11) DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL,
  `image_position` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of technology
-- ----------------------------
INSERT INTO `technology` VALUES ('1', 'Business Intelligence', 'BI component is responsible for various data visualization needs – interactive dashboards, data exploration, dynamic reporting (aka ad-hoc queries), control reporting, publishing. Scandic Fusion masters various BI tools.', 'SAP Business Objects\r\nOracle Business Intelligence\r\nTableau\r\nQlik View/Sense\r\nSAS Visual Analytics\r\nMicrostrategy', 'left', 'step-1', 'bottom', '0', null, null);
INSERT INTO `technology` VALUES ('2', 'Data mining and predictive analytics', 'Data mining and predictive analytics software helps find patterns and systematic relationships among different aspects of business operations.  ', '	Oracle Advanced Analytics (aka ODM)\r\nSAP Infinite Insight (KXEN)\r\nR', 'right', 'step-1', 'bottom', '1', '29', 'right');
INSERT INTO `technology` VALUES ('3', 'Database', 'Database is responsible for storing BI data. Right pick of database technology has great impact on the SQL performance, i.e., user satisfaction of how quickly data is being retrieved from the database. Scandic Fusion works with variety of DB technologies.', 'SybaseIQ\r\nOracle db\r\nVertica\r\nPostgreSQL\r\nTeradata\r\nSQL Server', 'center', 'step-2', 'topbottom', '2', null, null);
INSERT INTO `technology` VALUES ('4', 'Extraction, transformation and load', 'Extraction, transformation and load of data help transfer data from source system and compose into BI data layer as dimensions and facts. Scandic Fusion works with a variety of tools, starting with great open source solutions and finishing with leading commercial software.', 'Oracle Data Integrator\r\nSAP Data Services\r\nPentaho Data Integration\r\nInformatica', 'left', 'step-1', 'topbottom', '4', null, null);
INSERT INTO `technology` VALUES ('5', 'Business Intelligence test', 'Extraction, transformation and load of data help transfer data from source system and compose into BI data layer as dimensions and facts. Scandic Fusion works with a variety of tools, starting with great open source solutions and finishing with leading commercial software.', '', 'right', 'step-1', 'topbottom', '5', null, null);
INSERT INTO `technology` VALUES ('7', 'Business Intelligence test 2', 'Extraction, transformation and load of data help transfer data from source system and compose into BI data layer as dimensions and facts. Scandic Fusion works with a variety of tools, starting with great open source solutions and finishing with leading commercial software.', '', 'center', 'step-2', 'topbottom', '0', null, null);
INSERT INTO `technology` VALUES ('8', 'Extraction, transformation and load test 1', 'Extraction, transformation and load of data help transfer data from source system and compose into BI data layer as dimensions and facts. Scandic Fusion works with a variety of tools, starting with great open source solutions and finishing with leading commercial software.', '', 'center', 'step-2', 'topbottom', '0', null, null);
INSERT INTO `technology` VALUES ('9', 'Extraction, transformation and load test 2', 'Extraction, transformation and load', '', 'left', 'step-1', 'topbottom', '0', null, null);
INSERT INTO `technology` VALUES ('10', 'Extraction, transformation and load test 3', 'Extraction, transformation and loadExtraction, transformation and loadExtraction, transformation and loadExtraction, transformation and loadExtraction, transformation and loadExtraction, transformation and loadExtraction, transformation and loadExtraction, transformation and loadExtraction, transformation and loadExtraction, transformation and loadExtraction, transformation and loadExtraction, transformation and load', '', 'right', 'step-1', 'topbottom', '0', null, null);
INSERT INTO `technology` VALUES ('11', 'Extraction, transformation and load test 4', 'Extraction, transformation and loadExtraction, transformation and loadExtraction, transformation and loadExtraction, transformation and loadExtraction, transformation and loadExtraction, transformation and loadExtraction, transformation and loadExtraction, transformation and loadExtraction, transformation and loadExtraction, transformation and loadExtraction, transformation and loadExtraction, transformation and loadExtraction, transformation and loadExtraction, transformation and loadExtraction, transformation and load', '', 'center', 'step-2', 'top', '0', null, null);

-- ----------------------------
-- Table structure for `template`
-- ----------------------------
DROP TABLE IF EXISTS `template`;
CREATE TABLE `template` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sys_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of template
-- ----------------------------
INSERT INTO `template` VALUES ('1', 'Index Page', 'index');
INSERT INTO `template` VALUES ('2', 'Simple Contact', 'contact');
INSERT INTO `template` VALUES ('3', 'Industry with Subpages', 'industry');
INSERT INTO `template` VALUES ('4', 'Services and Competences', 'services');
INSERT INTO `template` VALUES ('5', 'Solutions', 'solutions');
INSERT INTO `template` VALUES ('6', 'Technonlogy', 'technology');
INSERT INTO `template` VALUES ('7', 'Team', 'team');
INSERT INTO `template` VALUES ('8', '404', 'p404');
INSERT INTO `template` VALUES ('9', 'Jobs', 'jobs');
INSERT INTO `template` VALUES ('10', 'About', 'about');
INSERT INTO `template` VALUES ('11', 'Client', 'client');

-- ----------------------------
-- Table structure for `testimonial`
-- ----------------------------
DROP TABLE IF EXISTS `testimonial`;
CREATE TABLE `testimonial` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `content` text,
  `expired_on` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of testimonial
-- ----------------------------
INSERT INTO `testimonial` VALUES ('1', 'Olga Pleyer', 'CFO, BOSCH Baltics', 'bosch.png', 'Working with Scandic Fusion is a great professional experience: both in terms of quality of delivered service and in terms of communication between our companies. Bosch in the Baltics is constantly evolving; therefore, we need flexibility and complex technical solutions from our suppliers. During initial year of cooperation with Scandic Fusion we implemented core business analysis, cost allocation solution and budgeting solution. Ever since, BI has been extended with new data sources, additional interactive dashboards, extra metrics and growing user expertise. We are looking forward to continuing our successful partnership.', '2017-05-24');
INSERT INTO `testimonial` VALUES ('2', 'Girts Vikmanis', 'Head of Data Warehouse and System Integration Department', 'latvenergo.png', 'Scandic Fusion is trustworthy partner of business intelligence implementation and support services since 2010. Over this time frame Scandic Fusion has helped to build many analytical solutions, including, ERP, management accounting, profitability, actual over budgeted benchmarking, cash-flow and treasury, billing and sales, and other analysis. One of the most challenging solutions has been setting up near real-time data warehousing, enabling BI users with operative decision making. Scandic Fusion has been dedicated towards results and customer satisfaction, which makes it easy for us to recommend using Scandic Fusion services for others.', '2017-05-26');
INSERT INTO `testimonial` VALUES ('3', 'Ilone Marie Rønbeck', 'Solution Architect, Petroleum Geo-Services (PGS)', 'pgs.png', 'To effectively analyse business processes, PGS decided to start business intelligence initiative with central data warehouse solution. Scandic Fusion was chosen to deploy financial data marts within a very short time frame tailored for PGS and system specific configuration. Solution has become very popular among business users, who favour interactive way of browsing information. Due to the successful results of implementation, the cooperation continues in form of new projects to add more data sources and regular maintenance to deliver changes.', null);
INSERT INTO `testimonial` VALUES ('4', 'Geir Edmund Larsen', 'DWH/BI project supervisor, Gjensidige Forsikring ASA', 'gjensidige.png', 'As a result of expansion in the Baltics, Gjensidige had a challenge to unite multiple source systems into a single data warehouse platform. Scandic Fusion managed to complete the entire project within one calendar year, rapidly deploying industry-specific data marts, extending them to have more than 700 product attributes, introducing master data management for data cleansing and advanced transformations to derive ultimate insight into the business activities. We favour the high quality of Scandic Fusion team and seek further partnership.', null);
INSERT INTO `testimonial` VALUES ('5', 'Joel Friman', 'Manager, Business Analytics, Vaisala Oy', 'vaisala.png', 'Vaisala selected Scandic Fusion as a strategic partner to implement Business Intelligence for financials, supply chain, manufacturing, project/order/service delivery. The cooperation has been very successful: the unified data warehouse was implemented and is widely used in the company.\r\nThe cooperation continues in form of regular maintenance support & development as well as additional projects. Scandic Fusion has successfully delivered end-to-end services: starting from understanding the business processes and needs and finishing with covering these needs in BI environment with underlying technical solution. The team members are very professional and easy to work with and we can warmly recommend Scandic Fusion for similar assignments!', null);

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_dts` datetime NOT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2', 'sf_admin', '$2y$10$vR8byqgGDsM4MghWZxnPCubu/88dMxi/cXkS.9RVnWgdH0/13ucwS', '', '2015-05-01 00:00:00', '0');
