/*Data for the table `block` */

insert  into `block`(`id`,`system_name`,`type`,`content`,`page_id`,`order`,`language`,`created_dts`,`is_deleted`) values (1,'paragraph_mega_spot','paragraph_mega','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eget justo eget nisl mattis posuere eu ut neque. Aenean congue mollis est, ac viverra mauris bibendum et.',1,NULL,0,'2015-03-27 12:01:25',0);
insert  into `block`(`id`,`system_name`,`type`,`content`,`page_id`,`order`,`language`,`created_dts`,`is_deleted`) values (2,'paragraph_mega_spot','paragraph_mega','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eget justo eget nisl mattis posuere eu ut neque. Aenean congue mollis est, ac viverra mauris bibendum et.',3,NULL,0,'2015-03-27 12:03:39',0);

/*Data for the table `page` */

insert  into `page`(`id`,`name`,`type`,`hash_url`,`order`,`created_dts`,`is_deleted`,`page_id`) values (1,'services','competencies','services',NULL,'2015-03-27 12:01:21',0,NULL);
insert  into `page`(`id`,`name`,`type`,`hash_url`,`order`,`created_dts`,`is_deleted`,`page_id`) values (2,'about',NULL,'',NULL,'2015-03-27 12:02:59',0,NULL);
insert  into `page`(`id`,`name`,`type`,`hash_url`,`order`,`created_dts`,`is_deleted`,`page_id`) values (3,'team','team','team',NULL,'2015-03-27 12:03:37',0,2);

/*Data for the table `page_translation` */

insert  into `page_translation`(`id`,`page_id`,`language`,`meta_title`,`meta_keywords`,`meta_description`) values (1,1,'en','Competences and Services',NULL,NULL);
insert  into `page_translation`(`id`,`page_id`,`language`,`meta_title`,`meta_keywords`,`meta_description`) values (2,2,'en','About Scandic Fusion',NULL,NULL);
insert  into `page_translation`(`id`,`page_id`,`language`,`meta_title`,`meta_keywords`,`meta_description`) values (3,3,'en','team - en',NULL,NULL);
