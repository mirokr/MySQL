CREATE DATABASE `college` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `college`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: college
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `college`
--

DROP TABLE IF EXISTS `college`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `college` (
  `registration_ID` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `phone_no` varchar(50) DEFAULT NULL,
  `dean_name` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `opening_time` varchar(50) DEFAULT NULL,
  `closing_time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`registration_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college`
--

LOCK TABLES `college` WRITE;
/*!40000 ALTER TABLE `college` DISABLE KEYS */;
INSERT INTO `college` VALUES (1,'Ailane College','+856 965 977 1257','Julio Dreus','65 Helena Center, Dublin, Ireland','MON-FRI 09:00','MON-FRI 17:00');
/*!40000 ALTER TABLE `college` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `course_ID` int(11) NOT NULL,
  `academic_level` varchar(20) DEFAULT NULL,
  `course_name` varchar(50) DEFAULT NULL,
  `delivery_mode` varchar(50) DEFAULT NULL,
  `semester_no` int(11) DEFAULT NULL,
  `semester_length` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `department_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`course_ID`),
  KEY `department_ID` (`department_ID`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`department_ID`) REFERENCES `department` (`department_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'PHD','IT Course','On Campus',5,12,'2021-10-08',1),(2,'7','Business','On Line',3,12,'2021-10-04',2),(3,'8','VKL','On Campus',8,12,'2021-10-14',1),(4,'9','SNL','On Line',5,12,'2021-09-29',2),(5,'PHD','PHD','On Line',6,12,'2021-05-24',1),(6,'6','SNL','On Campus',8,12,'2021-07-08',2),(106,'6','SNL','On Campus',8,12,'2021-07-08',2),(107,'6','SNL','On Campus',8,12,'2021-07-08',2),(108,'6','SNL','On Campus',8,12,'2021-07-08',2),(109,'6','SNL','On Campus',8,12,'2021-07-08',2);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `department_ID` int(11) NOT NULL,
  `name` varchar(19) DEFAULT NULL,
  `registration_ID` int(11) DEFAULT NULL,
  `lecturer_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`department_ID`),
  KEY `registration_ID` (`registration_ID`),
  KEY `lecturer_ID` (`lecturer_ID`),
  CONSTRAINT `department_ibfk_1` FOREIGN KEY (`registration_ID`) REFERENCES `college` (`registration_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `department_ibfk_2` FOREIGN KEY (`lecturer_ID`) REFERENCES `lecturer` (`staff_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'School Of Computing',1,31),(2,'School of Business',1,9),(3,'HR',1,14),(4,'Marketing',1,10),(5,'IT Support',1,9),(6,'Accounts',1,9),(7,'Security',1,11),(8,'Cloud Department',1,20),(9,'International',1,3),(10,'Remote Learning',1,21);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grade` (
  `grade_ID` int(11) NOT NULL,
  `grade` int(11) DEFAULT NULL,
  `student_ID` int(11) DEFAULT NULL,
  `module_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`grade_ID`),
  KEY `student_ID` (`student_ID`),
  KEY `module_ID` (`module_ID`),
  CONSTRAINT `grade_ibfk_1` FOREIGN KEY (`student_ID`) REFERENCES `student` (`student_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `grade_ibfk_2` FOREIGN KEY (`module_ID`) REFERENCES `module` (`module_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade`
--

LOCK TABLES `grade` WRITE;
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
INSERT INTO `grade` VALUES (1,82,1,1),(2,65,2,2),(3,55,3,3),(4,61,4,4),(5,43,5,5),(6,64,6,6),(7,74,7,7),(8,68,8,8),(9,24,9,9),(10,96,10,10),(11,83,11,11),(12,35,12,12),(13,21,13,13),(14,26,14,14),(15,5,15,15),(16,36,16,16),(17,15,17,1),(18,17,18,2),(19,58,19,3),(20,46,20,4),(21,82,21,5),(22,81,22,6),(23,63,23,7),(24,45,24,8),(25,23,25,9),(26,81,26,10),(27,44,27,11),(28,65,28,12),(29,9,29,13),(30,56,30,14),(31,60,31,15),(32,9,32,16),(33,24,33,1),(34,94,34,2),(35,59,35,3),(36,80,36,4),(37,9,37,5),(38,1,38,6),(39,47,39,7),(40,48,40,8),(41,7,41,9),(42,67,42,10),(43,50,43,11),(44,81,44,12),(45,34,45,13),(46,41,46,14),(47,41,47,15),(48,40,48,16),(49,49,49,1),(50,53,50,2);
/*!40000 ALTER TABLE `grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecturer`
--

DROP TABLE IF EXISTS `lecturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecturer` (
  `staff_ID` int(11) NOT NULL,
  `department_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`staff_ID`),
  KEY `department_ID` (`department_ID`),
  CONSTRAINT `lecturer_ibfk_1` FOREIGN KEY (`department_ID`) REFERENCES `department` (`department_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturer`
--

LOCK TABLES `lecturer` WRITE;
/*!40000 ALTER TABLE `lecturer` DISABLE KEYS */;
INSERT INTO `lecturer` VALUES (3,1),(10,1),(14,1),(21,1),(25,1),(9,2),(11,2),(20,2),(22,2),(31,2);
/*!40000 ALTER TABLE `lecturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module`
--

DROP TABLE IF EXISTS `module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `module` (
  `module_ID` int(11) NOT NULL,
  `name` varchar(2) DEFAULT NULL,
  `course_ID` int(11) DEFAULT NULL,
  `lecturer_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`module_ID`),
  KEY `lecturer_ID` (`lecturer_ID`),
  CONSTRAINT `module_ibfk_1` FOREIGN KEY (`lecturer_ID`) REFERENCES `lecturer` (`staff_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module`
--

LOCK TABLES `module` WRITE;
/*!40000 ALTER TABLE `module` DISABLE KEYS */;
INSERT INTO `module` VALUES (1,'M1',1,3),(2,'M2',2,9),(3,'M1',3,10),(4,'M2',4,11),(5,'M1',5,14),(6,'M2',6,20),(7,'M1',7,21),(8,'M2',8,22),(9,'M1',1,25),(10,'M2',2,31),(11,'M1',3,3),(12,'M2',4,9),(13,'M1',5,10),(14,'M2',6,11),(15,'M1',7,14),(16,'M2',8,20);
/*!40000 ALTER TABLE `module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_ID` int(11) NOT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `job_title` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `phone_no` varchar(50) DEFAULT NULL,
  `days_off_taken` int(11) DEFAULT NULL,
  `department_ID` int(11) DEFAULT NULL,
  `registration_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`staff_ID`),
  KEY `registration_ID` (`registration_ID`),
  KEY `department_ID` (`department_ID`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`registration_ID`) REFERENCES `college` (`registration_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `staff_ibfk_2` FOREIGN KEY (`department_ID`) REFERENCES `department` (`department_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Caryl','Whalley','Office','1998-09-24','0 Division Drive',32455,'2008-09-29','+51 866 739 9726',5,2,1),(2,'Charley','Westberg','HR','1987-07-14','343 Drewry Park',30861,'2011-10-16','+55 803 826 4941',17,4,1),(3,'Janene','Cluet','Lecturer','1968-08-21','9779 Forest Run Junction',37978,'2001-10-09','+86 951 346 3973',19,10,1),(4,'Karena','Gepp','Security','1971-03-16','9 Delaware Place',37321,'2015-12-20','+86 258 472 7018',10,9,1),(5,'Ave','Ascraft','Prcurement','1991-08-23','54503 Messerschmidt Junction',40694,'2011-09-28','+20 273 820 6440',11,8,1),(6,'Tracie','Rigler','Marketing','2001-01-24','9 Scott Alley',36472,'2020-01-21','+351 961 343 0683',14,7,1),(7,'Drusie','Warbeys','Manager','1993-02-23','4146 North Lane',31153,'2006-09-26','+63 231 567 8745',2,7,1),(8,'Ashley','Trusse','IT Support','1970-08-26','9878 Milwaukee Circle',31454,'2001-03-31','+81 491 192 5776',12,5,1),(9,'Helyn','Josham','Lecturer','1983-11-22','21991 Hallows Circle',33860,'1999-12-31','+420 667 601 4206',7,2,1),(10,'Maitilde','Rumin','Lecturer','1970-10-14','16 Butternut Point',31672,'2019-12-03','+63 427 224 1785',3,7,1),(11,'Winslow','Habbergham','Lecturer','1986-07-16','99380 Donald Place',38522,'2002-06-12','+53 969 622 2587',18,7,1),(12,'Lucina','Thorns','Office','1973-06-30','36 Nancy Hill',32453,'2013-06-07','+48 394 292 7181',14,5,1),(13,'Ferne','Shilliday','HR','1990-09-25','151 Crescent Oaks Street',38983,'2008-05-03','+94 507 829 9512',9,2,1),(14,'Reinaldos','Rakes','Lecturer','1986-01-24','31 1st Way',35076,'2008-05-20','+351 949 522 0784',12,5,1),(15,'Early','Frantsev','Security','1965-08-06','150 Talmadge Junction',30035,'2017-07-07','+33 813 244 7655',2,9,1),(16,'Letizia','Leverentz','Prcurement','1970-07-29','4152 Macpherson Terrace',30574,'2014-07-22','+62 200 503 2111',7,8,1),(17,'Regina','Gorsse','Marketing','1972-10-24','1 Karstens Lane',36723,'2003-02-24','+358 845 567 0363',19,7,1),(18,'Jewelle','Craw','Manager','1976-06-15','76 Rusk Hill',41103,'2013-02-23','+7 891 804 5040',19,1,1),(19,'Juliana','Greenall','IT Support','1967-10-02','95 Monica Crossing',34448,'2009-01-24','+63 822 233 3092',1,4,1),(20,'Katinka','Dunbobin','Lecturer','1977-02-27','0 Westerfield Hill',41403,'2015-01-15','+256 147 988 9533',5,9,1),(21,'Andrej','Ruste','Lecturer','1987-05-20','956 Hoffman Terrace',42978,'2003-08-12','+7 891 956 6113',1,3,1),(22,'Byran','Byne','Lecturer','1973-07-02','42 Chive Way',34600,'2012-06-05','+1 616 617 0928',13,4,1),(23,'Sileas','Kordovani','Office','1995-03-21','9 High Crossing Road',31867,'2007-12-24','+850 926 187 2350',3,10,1),(24,'Doralynne','Bowfin','HR','1972-11-08','85 Blaine Place',31892,'2003-07-19','+7 138 936 7228',18,5,1),(25,'Cherice','Featherby','Lecturer','1995-09-08','0252 Clemons Court',40391,'2014-05-08','+66 851 154 6614',8,2,1),(26,'Erhart','Matthessen','Security','1998-02-12','80 Park Meadow Crossing',35714,'2006-05-23','+351 553 992 8838',15,5,1),(27,'Quincy','Constable','Prcurement','1999-03-05','504 Lunder Plaza',33317,'2012-09-14','+33 731 482 4310',6,6,1),(28,'Rubin','Ellins','Marketing','1995-03-11','36 Stoughton Park',44928,'2008-05-26','+55 152 340 9688',6,7,1),(29,'Cordie','Stretton','Manager','1967-03-30','0 Brickson Park Avenue',30265,'2002-10-19','+63 197 568 9470',18,5,1),(30,'Kimball','Salsbury','IT Support','1977-02-03','60 Rusk Avenue',44170,'2007-11-26','+353 330 764 8208',9,8,1),(31,'Gilberte','Joannidi','Lecturer','1991-04-15','698 Southridge Place',34574,'2002-01-12','+420 871 835 1311',7,3,1),(32,'Elnar','Carnegie','Lecturer','1980-04-13','12 Drewry Alley',40568,'2003-04-09','+593 967 593 4535',15,9,1),(33,'Rosabel','Whittek','Lecturer','1970-07-30','43 Thierer Parkway',40918,'2004-12-06','+51 454 440 3654',6,9,1),(34,'Cass','Berford','Office','1991-12-30','549 Drewry Avenue',37555,'1999-01-31','+385 580 962 6891',19,10,1),(35,'Oswell','Compston','HR','1989-09-26','42951 Lukken Circle',32596,'2019-11-21','+55 813 373 7419',21,10,1),(36,'Rikki','Mallock','Lecturer','1986-11-27','776 Cottonwood Junction',31782,'2013-12-20','+63 851 234 2455',19,4,1),(37,'Hammad','Ugolotti','Security','1985-08-06','04 Arapahoe Park',39250,'2017-09-13','+62 651 264 8497',14,10,1),(38,'Fayette','Peirpoint','Prcurement','1990-01-03','953 Anniversary Drive',42433,'2016-07-22','+81 582 986 5130',21,9,1),(39,'Toby','Karleman','Marketing','1981-10-02','14296 Hudson Center',30958,'2011-05-03','+371 918 864 6842',12,3,1),(40,'Caron','Girodier','Manager','1980-05-05','038 Ridge Oak Trail',35565,'2007-04-10','+355 736 740 0016',12,3,1),(41,'Blondie','Jobbins','IT Support','1979-10-04','65016 Morrow Avenue',38146,'2018-04-20','+387 204 857 8719',13,4,1),(42,'Gaye','Joppich','Lecturer','1978-07-23','573 Stang Place',36152,'2000-09-25','+963 774 210 2038',21,9,1),(43,'Beverlie','Scanlan','Lecturer','1986-04-30','52412 Corscot Avenue',39835,'2002-08-17','+62 104 429 3478',16,5,1),(44,'Drugi','Blower','Lecturer','1979-01-25','85240 Morningstar Hill',42480,'2001-09-01','+62 138 610 9874',13,2,1),(45,'Kathryn','Hully','Office','1988-08-28','6700 Arapahoe Alley',32577,'2001-02-26','+389 979 869 3937',11,7,1),(46,'Shela','Gisbourn','HR','1997-07-06','8976 Myrtle Park',36348,'2009-01-27','+49 282 833 0855',7,1,1),(47,'Rog','Ellicock','Lecturer','1970-09-14','29320 Barnett Point',35207,'2018-06-14','+351 717 549 0249',18,7,1),(48,'Amalea','Hiom','Security','1972-05-13','2426 Northview Alley',30235,'2006-01-22','+30 564 750 2569',4,5,1),(49,'Maddie','Berlin','Prcurement','1990-08-02','023 Hazelcrest Trail',40985,'2019-08-09','+356 649 728 8747',15,10,1),(50,'Ancell','Laven','Marketing','1995-04-10','81 Corry Junction',33736,'2018-08-15','+7 202 646 6730',21,9,1);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `student_ID` int(11) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `phone_no` varchar(50) DEFAULT NULL,
  `student_year` int(11) DEFAULT NULL,
  `sstudent_YE_results` int(11) DEFAULT NULL,
  `course_ID` int(11) DEFAULT NULL,
  `registration_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`student_ID`),
  KEY `registration_ID` (`registration_ID`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`registration_ID`) REFERENCES `college` (`registration_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'active','90 Kedzie Way','Dennet','Dashkovich','937-542-2052',2,66,4,1),(2,'active','39334 Independence Way','Halsey','Farra','995-909-0679',2,53,2,1),(3,'active','01051 Kings Court','Elfrida','Sarchwell','680-420-1793',3,97,1,1),(4,'active','7 Village Way','Camilla','Decent','403-721-9891',3,44,5,1),(5,'active','9 Erie Way','Erwin','Jemmett','204-175-9787',1,60,6,1),(6,'active','9378 Reindahl Point','Renate','Oxberry','838-251-5524',4,53,1,1),(7,'active','7224 Victoria Trail','Dan','Cluley','303-135-1747',4,56,6,1),(8,'active','089 Lindbergh Center','Codie','Prendergrast','561-789-8494',2,83,6,1),(9,'active','7 Holmberg Lane','Kelby','Dellenbrok','368-362-1875',1,70,2,1),(10,'active','188 Lakewood Alley','Angeline','Salkeld','979-729-5378',2,54,2,1),(11,'active','885 Farragut Place','Florette','Langeley','791-203-9530',1,66,2,1),(12,'active','014 Valley Edge Alley','Dacy','Potes','415-846-4690',2,57,2,1),(13,'active','8361 Canary Alley','Rhonda','Haseldine','362-903-7436',4,99,2,1),(14,'active','63343 Northfield Drive','Caryl','Pollock','708-415-5168',4,72,2,1),(15,'active','746 Old Gate Drive','Hana','Feldbaum','203-126-0425',4,75,2,1),(16,'active','568 Katie Park','Cordula','Kay','355-843-1457',1,88,1,1),(17,'active','12 Browning Point','Kerby','Bullant','260-843-8247',2,60,6,1),(18,'active','42771 Grover Trail','Natala','Hinstridge','514-633-4503',1,44,1,1),(19,'active','281 Toban Point','Lotty','McCourt','798-691-9293',3,36,2,1),(20,'active','74 Northwestern Drive','Justen','McAneny','466-605-9397',4,82,2,1),(21,'active','628 Waubesa Plaza','Horacio','Sertin','582-273-9437',4,69,4,1),(22,'active','2 Emmet Parkway','Cornelius','Gantlett','556-726-0012',1,37,1,1),(23,'active','72259 Goodland Hill','Huntley','Mattholie','577-681-2151',3,49,2,1),(24,'active','69 Village Road','Bamby','Roma','500-767-7046',3,71,2,1),(25,'active','22689 Troy Hill','Ermentrude','Sheryn','760-161-0395',1,53,1,1),(26,'active','92 Charing Cross Avenue','Jessa','Hobson','399-297-6433',2,58,2,1),(27,'active','2 Kings Pass','Loydie','Dacres','471-205-7723',3,76,5,1),(28,'active','04 School Center','Gerianna','Gostling','118-798-4789',3,50,5,1),(29,'active','89 Basil Avenue','Ninetta','Mabbitt','909-928-3115',1,86,6,1),(30,'active','5 Ridgeway Pass','Ingrid','Espie','827-737-4144',3,60,1,1),(31,'active','0629 Ilene Junction','Chet','Knoles','814-781-7047',1,51,1,1),(32,'active','888 Morning Center','Elden','Collens','141-604-9268',4,67,2,1),(33,'active','3 Butternut Drive','Mendie','Pumphreys','939-970-7290',2,98,2,1),(34,'active','21 Dakota Avenue','Rodie','Duggen','517-964-5809',2,52,3,1),(35,'active','68472 Melby Lane','Joey','Reynish','292-497-8074',4,93,2,1),(36,'active','74 Welch Drive','Nealy','Jordon','825-221-8937',1,68,1,1),(37,'active','9 Hallows Avenue','Jayne','Sharvill','791-896-3198',1,35,2,1),(38,'active','498 Leroy Circle','Gilda','Lowre','894-477-2673',3,91,4,1),(39,'active','4934 Buena Vista Crossing','Emmye','Willgress','266-924-7266',1,48,5,1),(40,'active','45 Katie Way','Bjorn','Fleisch','982-476-9862',4,92,1,1),(41,'active','3367 Mayer Plaza','Kalil','Pencott','884-387-2413',3,71,2,1),(42,'active','13402 Acker Trail','Olia','MacKim','515-975-4188',4,69,2,1),(43,'active','42621 Shoshone Junction','Titus','Hallex','938-494-2891',1,92,4,1),(44,'active','13 Wayridge Parkway','Cheri','Gillease','265-606-9050',2,97,6,1),(45,'active','91 Eagle Crest Junction','Jodie','Noot','716-681-3673',2,86,3,1),(46,'active','4932 Clemons Drive','Orin','Mitchelson','122-509-7285',1,54,5,1),(47,'active','7 Westend Crossing','Jeniece','Wanell','812-938-9396',2,56,2,1),(48,'active','2 Ryan Place','Augie','Riglar','882-431-6099',3,57,2,1),(49,'active','6978 Westerfield Crossing','Aida','Levings','215-257-5155',2,51,4,1),(50,'active','68721 Anderson Center','Lea','Allaway','631-451-3371',1,88,1,1);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_fee`
--

DROP TABLE IF EXISTS `student_fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_fee` (
  `fee_ID` int(11) NOT NULL,
  `due_date` date DEFAULT NULL,
  `paid_date` date DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `course_ID` int(11) DEFAULT NULL,
  `student_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`fee_ID`),
  KEY `course_ID` (`course_ID`),
  KEY `student_ID` (`student_ID`),
  CONSTRAINT `student_fee_ibfk_1` FOREIGN KEY (`course_ID`) REFERENCES `course` (`course_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_fee_ibfk_2` FOREIGN KEY (`student_ID`) REFERENCES `student` (`student_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_fee`
--

LOCK TABLES `student_fee` WRITE;
/*!40000 ALTER TABLE `student_fee` DISABLE KEYS */;
INSERT INTO `student_fee` VALUES (1,'2019-09-06','2020-06-13',500,1,1),(2,'2020-05-02','2021-02-03',800,2,2),(3,'2019-09-26','2021-03-09',2000,3,3),(4,'2020-06-17','2020-07-22',500,4,4),(5,'2020-10-29',NULL,800,5,5),(6,'2020-04-25','2020-05-31',2000,6,6),(7,'2019-12-07','2020-07-13',500,2,7),(8,'2019-09-03','2020-04-23',800,2,8),(9,'2020-06-11','2020-03-23',2000,1,9),(10,'2020-08-12','2020-07-05',500,2,10),(11,'2020-09-16',NULL,800,3,11),(12,'2020-09-23','2020-10-20',2000,4,12),(13,'2020-03-07','2020-08-14',500,5,13),(14,'2020-10-17','2020-02-08',800,6,14),(15,'2019-11-01','2020-10-02',2000,2,15),(16,'2020-09-24','2020-02-19',500,2,16),(17,'2020-02-14','2020-04-12',800,1,17),(18,'2020-08-20','2020-07-16',2000,2,18),(19,'2019-09-30','2021-03-18',500,3,19),(20,'2019-10-20','2020-04-23',800,4,20),(21,'2019-09-17','2021-02-22',2000,5,21),(22,'2020-10-17','2021-01-21',500,6,22),(23,'2019-09-22','2020-04-19',800,2,23),(24,'2020-10-13','2020-12-10',2000,2,24),(25,'2020-09-06','2020-09-04',500,1,25),(26,'2020-03-15','2020-08-22',800,2,26),(27,'2020-03-05',NULL,2000,3,27),(28,'2019-10-19','2020-07-28',500,4,28),(29,'2020-09-06','2020-05-02',800,5,29),(30,'2019-12-14','2021-03-10',2000,6,30),(31,'2020-10-23','2020-05-03',500,2,31),(32,'2020-05-18','2020-05-24',800,2,32),(33,'2019-12-26','2020-11-01',2000,1,33),(34,'2019-09-21','2020-02-08',500,2,34),(35,'2020-03-19',NULL,800,3,35),(36,'2020-06-10','2021-01-20',2000,4,36),(37,'2020-06-30','2021-01-21',500,5,37),(38,'2020-01-30','2020-11-02',800,6,38),(39,'2020-04-21','2020-04-17',2000,2,39),(40,'2020-10-07','2020-10-18',500,2,40),(41,'2020-06-24','2020-06-04',800,1,41),(42,'2020-09-14','2021-01-13',2000,2,42),(43,'2020-01-22','2020-10-17',500,3,43),(44,'2020-02-29',NULL,800,4,44),(45,'2020-07-20','2020-10-12',2000,5,45),(46,'2020-01-13','2020-09-11',500,6,46),(47,'2020-07-21','2020-05-29',800,2,47),(48,'2020-07-25','2021-01-15',2000,2,48),(49,'2019-10-03','2020-07-09',500,1,49),(50,'2020-05-24','2020-08-17',800,2,50);
/*!40000 ALTER TABLE `student_fee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'college'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-02 20:24:17
