


CREATE TABLE `Competention` (
  `id` int(11) NOT NULL,
  `title` varchar(95) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `winner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_winner_id_idx` (`winner_id`),
  CONSTRAINT `fk_winner_id` FOREIGN KEY (`winner_id`) REFERENCES `Tourist` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



INSERT INTO `Competention` VALUES (1,'Champions of Kiev','2019-06-04 19:19:38',1),(2,'Iron Man','2019-06-04 19:19:38',3),(3,'WBO','2019-06-04 19:19:38',5),(4,'Empty','2019-06-04 19:19:38',1);


--
-- Table structure for table `Groups`
--

CREATE TABLE `Groups` (
  `id` int(11) NOT NULL,
  `trainer_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_trainer_id_idx` (`trainer_id`),
  KEY `fk_section_id_idx` (`section_id`),
  CONSTRAINT `fk_section_id` FOREIGN KEY (`section_id`) REFERENCES `Section` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_trainer_id` FOREIGN KEY (`trainer_id`) REFERENCES `Trainers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/

LOCK TABLES `Groups` WRITE;

INSERT INTO `Groups` VALUES (1,2,1),(2,2,1),(3,3,2),(4,4,3),(5,5,3);

UNLOCK TABLES;


DROP TABLE IF EXISTS `Heads`;

CREATE TABLE `Heads` (
  `id` int(11) NOT NULL,
  `fullname` varchar(45) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


LOCK TABLES `Heads` WRITE;

INSERT INTO `Heads` VALUES (1,'Michael Tishin',55,'1965-04-18 18:52:10',20000,'2012-06-02 18:52:10'),(2,'Dmytro Sych',49,'1971-01-04 18:52:10',18000,'2019-01-01 18:52:10'),(3,'Alex Tykhomirov',57,'1963-06-02 18:52:10',16000,'2017-04-04 18:52:10');

UNLOCK TABLES;


DROP TABLE IF EXISTS `Hikes`;

CREATE TABLE `Hikes` (
  `id` int(11) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `days` int(11) NOT NULL,
  `plan` text,
  `instructor_id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_instructor_id_idx` (`instructor_id`),
  KEY `fk_route_id_idx` (`route_id`),
  CONSTRAINT `fk_instructor_id` FOREIGN KEY (`instructor_id`) REFERENCES `Trainers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_route_id` FOREIGN KEY (`route_id`) REFERENCES `Routes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Hikes` WRITE;

INSERT INTO `Hikes` VALUES (1,'Сlimbing elbrus','mountain',3,'plan of hike',1,5),(2,'Horse ride through the city','equestrian',1,NULL,5,4),(3,'Horse ride for beginners','equestrian',1,NULL,4,6),(4,'Walk outdoors','hiking',2,'hike plan',3,2),(5,'Rafting down the Dnieper','water',3,NULL,2,7),(6,'Climbing Mount Elena','mountain',2,NULL,1,1),(7,'Horse Ride','equestrian',2,'test plan',4,3),(8,'Empty','empty',0,'NULL',1,1);

UNLOCK TABLES



DROP TABLE IF EXISTS `Routes`;

CREATE TABLE `Routes` (
  `id` int(11) NOT NULL,
  `description` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `Routes` WRITE;
INSERT INTO `Routes` VALUES (1,'{ \"city\":\"Kharkiv\", \"duration(h)\": 5, \"description\": \"simple text\" }'),(2,'{ \"city\":\"Kiev\", \"duration(h)\": 10, \"description\": \"simple text\" }'),(3,'{ \"city\":\"Poltava\", \"duration(h)\": 7, \"description\": \"simple text\" }'),(4,'{ \"city\":\"Odessa\", \"duration(h)\": 8, \"description\": \"simple text\" }'),(5,'{ \"city\":\"Lviv\", \"duration(h)\": 6, \"description\": \"simple text\" }'),(6,'{ \"city\":\"Dnepr\", \"duration(h)\": 4, \"description\": \"simple text\" }'),(7,'{ \"city\":\"Dnepr\", \"duration(h)\": 4, \"description\": \"swimming in the river Dnepr\" }');
UNLOCK TABLES;

--
-- Table structure for table `Section`
--

DROP TABLE IF EXISTS `Section`;

CREATE TABLE `Section` (
  `id` int(11) NOT NULL,
  `name_section` varchar(50) NOT NULL,
  `head_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_head_id_idx` (`head_id`),
  CONSTRAINT `fk_head_id` FOREIGN KEY (`head_id`) REFERENCES `Heads` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Section`
--

LOCK TABLES `Section` WRITE;

INSERT INTO `Section` VALUES (1,'swimming',1),(2,'tourism',2),(3,'Horseback Riding',3);
/
UNLOCK TABLES;


DROP TABLE IF EXISTS `Timetable`;

CREATE TABLE `Timetable` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `start_at` datetime NOT NULL,
  `end_at` datetime NOT NULL,
  `section_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `hikes_id` int(11) DEFAULT NULL,
  `competention_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_time_competention_id_idx` (`competention_id`),
  KEY `fk_time_hike_id_idx` (`hikes_id`),
  KEY `fk_time_group_id_idx` (`group_id`),
  KEY `fk_time_section_id_idx` (`section_id`),
  CONSTRAINT `fk_time_competention_id` FOREIGN KEY (`competention_id`) REFERENCES `Competention` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_time_group_id` FOREIGN KEY (`group_id`) REFERENCES `Groups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_time_hike_id` FOREIGN KEY (`hikes_id`) REFERENCES `Hikes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_time_section_id` FOREIGN KEY (`section_id`) REFERENCES `Section` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


LOCK TABLES `Timetable` WRITE;

INSERT INTO `Timetable` VALUES (1,'Training day','2019-06-06 18:59:26','2017-08-15 19:30:10',1,1,1,1),(2,'Training day','2019-06-06 19:00:14','2018-02-16 19:30:10',1,2,1,1),(3,'Hike day','2019-06-06 19:08:11','2018-02-16 19:30:10',2,5,7,4),(4,'Competention day','2019-06-06 19:08:11','2018-02-16 19:30:10',1,3,8,2),(5,'Competention day','2019-06-06 19:08:11','2018-02-16 19:30:10',2,4,8,1),(6,'Hike day','2019-06-06 19:08:11','2018-02-16 19:30:10',1,5,1,4),(7,'Hike day','2019-06-06 19:08:11','2018-02-16 19:30:10',2,1,2,4),(8,'Hike day','2019-06-06 19:08:11','2018-02-16 19:30:10',3,2,3,4),(9,'Training day','2019-06-06 19:08:11','2018-02-16 19:30:10',2,2,8,4),(10,'Training day','2019-06-06 19:10:42','2018-02-16 19:30:10',2,2,8,4),(11,'Competention day','2019-06-06 19:10:42','2018-02-16 19:30:10',1,2,4,3),(12,'Hike day','2019-06-06 19:10:42','2018-02-16 19:30:10',3,5,5,4),(13,'Hike day','2019-06-06 19:10:42','2018-02-16 19:30:10',1,3,6,4),(14,'Training day','2019-06-06 19:10:42','2018-02-16 19:30:10',3,4,8,4),(15,'Training day','2019-06-06 19:10:42','2018-02-16 19:30:10',3,4,8,4);

UNLOCK TABLES;

--
-- Table structure for table `Tourist`
--

DROP TABLE IF EXISTS `Tourist`;

CREATE TABLE `Tourist` (
  `id` int(11) NOT NULL,
  `fullname` varchar(45) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` varchar(45) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `sportsman` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Tourist`
--

LOCK TABLES `Tourist` WRITE;
INSERT INTO `Tourist` VALUES (1,'Dmytro Slashinin',25,'male','2019-06-04 18:41:32',1),(2,'Anastasia',20,'female','2019-06-04 19:14:11',0),(3,'Danil',30,'male','2019-06-04 19:14:11',0),(4,'Yurii',31,'male','2019-06-04 19:14:11',0),(5,'Hanna',25,'female','2019-06-04 19:14:11',1),(6,'Vladimir',27,'male','2019-06-04 19:14:11',1),(7,'Jack',20,'male','2019-06-04 19:14:11',0),(8,'Serhii',25,'male','2019-06-04 19:14:11',0),(9,'Genna',22,'male','2019-06-04 19:14:11',0),(10,'Ihor',25,'male','2019-06-04 19:14:11',0),(11,'Yana',19,'female','2019-06-04 19:14:12',0),(12,'Kate',21,'female','2019-06-04 19:14:12',0),(13,'Helen',35,'female','2019-06-04 19:14:12',1),(14,'Edwin',23,'male','2019-06-04 19:14:12',1),(15,'Mike',18,'male','2019-06-04 19:14:12',1);
UNLOCK TABLES;

--
-- Table structure for table `Trainers`
--

DROP TABLE IF EXISTS `Trainers`;

CREATE TABLE `Trainers` (
  `id` int(11) NOT NULL,
  `fullname` varchar(45) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` varchar(45) DEFAULT NULL,
  `specilization` varchar(45) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fullname_UNIQUE` (`fullname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Trainers`
--

LOCK TABLES `Trainers` WRITE;
INSERT INTO `Trainers` VALUES (1,'Konstiantin Grigorievich',45,'male','speleolog',7500),(2,'Peter Davidov',50,'male','swimming',10500),(3,'Anna Pastbina',37,'female','alpinism',5500),(4,'Yurii Nikolaiev',60,'male','ridding',15000),(5,'Mary Regetsy',40,'female','ridding',9000);
UNLOCK TABLES;

--
-- Table structure for table `participant_to_hikes`
--

DROP TABLE IF EXISTS `participant_to_hikes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participant_to_hikes` (
  `tourist_id` int(11) NOT NULL,
  `hikes_id` int(11) NOT NULL,
  PRIMARY KEY (`tourist_id`,`hikes_id`),
  KEY `fk_hikes_id_idx` (`hikes_id`),
  CONSTRAINT `fk_hikes_id` FOREIGN KEY (`hikes_id`) REFERENCES `Hikes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_participiant_id` FOREIGN KEY (`tourist_id`) REFERENCES `Tourist` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Dumping data for table `participant_to_hikes`
--

LOCK TABLES `participant_to_hikes` WRITE;
INSERT INTO `participant_to_hikes` VALUES (14,1),(1,2),(11,2),(13,2),(1,3),(3,3),(7,3),(8,3),(4,4),(9,4),(6,5),(7,5),(6,6),(8,6),(2,7),(3,7),(12,7),(15,7);
UNLOCK TABLES;

--
-- Table structure for table `participation_to_competention`
--

DROP TABLE IF EXISTS `participation_to_competention`;

CREATE TABLE `participation_to_competention` (
  `compentention_id` int(11) NOT NULL,
  `tourist_id` int(11) NOT NULL,
  PRIMARY KEY (`compentention_id`,`tourist_id`),
  KEY `fk_comp_sportsman_idx` (`tourist_id`),
  CONSTRAINT `fk_comp_sportsman` FOREIGN KEY (`tourist_id`) REFERENCES `Tourist` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_competeintion_id` FOREIGN KEY (`compentention_id`) REFERENCES `Competention` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `participation_to_competention`
--

LOCK TABLES `participation_to_competention` WRITE;
INSERT INTO `participation_to_competention` VALUES (1,1),(1,2),(3,2),(2,3),(3,3),(1,4),(3,5),(2,6),(2,7),(1,8),(2,8),(1,9),(1,12),(1,13),(2,14),(1,15);
/*!40000 ALTER TABLE `participation_to_competentio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tourist_to_group`
--

DROP TABLE IF EXISTS `tourist_to_group`;
;
CREATE TABLE `tourist_to_group` (
  `tourist_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`tourist_id`,`group_id`),
  KEY `fk_group_id_idx` (`group_id`),
  CONSTRAINT `fk_group_id` FOREIGN KEY (`group_id`) REFERENCES `Groups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tourist_id` FOREIGN KEY (`tourist_id`) REFERENCES `Tourist` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Dumping data for table `tourist_to_group`
--

LOCK TABLES `tourist_to_group` WRITE;

INSERT INTO `tourist_to_group` VALUES (1,1),(14,1),(2,2),(3,2),(4,2),(5,3),(6,3),(7,3),(8,4),(9,4),(10,4),(11,4),(12,5),(13,5),(15,5);

UNLOCK TABLES;
