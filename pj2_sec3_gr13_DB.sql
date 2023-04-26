-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `BoardingPass`
--

DROP TABLE IF EXISTS `BoardingPass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BoardingPass` (
  `PName` varchar(50) NOT NULL,
  `PassportID` int NOT NULL,
  `TicketID` varchar(13) NOT NULL,
  `SeatID` varchar(3) NOT NULL,
  `Airline` varchar(20) NOT NULL,
  `TakeOffDate` date NOT NULL,
  `FFrom` varchar(30) NOT NULL,
  `Gate` varchar(5) NOT NULL,
  `PaymentID` int NOT NULL,
  PRIMARY KEY (`PName`,`PassportID`,`TicketID`,`SeatID`,`PaymentID`),
  CONSTRAINT `FK_allTK` FOREIGN KEY (`PName`, `PassportID`, `TicketID`, `SeatID`, `PaymentID`) REFERENCES `Ticket` (`PName`, `PassportID`, `TicketID`, `SeatID`, `PaymentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BoardingPass`
--

LOCK TABLES `BoardingPass` WRITE;
/*!40000 ALTER TABLE `BoardingPass` DISABLE KEYS */;
INSERT INTO `BoardingPass` VALUES ('Blair Willows',75997006,'5967071210306','45K','JAL','2022-10-18','New york','102',311582006),('Delancy Devin',75997007,'5967071210307','45J','JAL','2022-10-18','New york','102',311582007),('Inosuke Hashibira',75997003,'5967071210303','35C','JAL','2022-11-30','Tokyo','18',311582003),('Kanao Tsuyuri',75997005,'5967071210305','37C','JAL','2022-11-30','Tokyo','18',311582005),('Louis Partridge',75997010,'5967071210310','11B','JAL','2022-11-13','London','9',311582010),('Nezuko Kamado',75997009,'5967071210309','36C','JAL','2022-11-30','Tokyo','18',311582009),('Nicha Yontararak',75997008,'5967071210308','50A','JAL','2022-08-12','Bangkok','22',311582008),('Tanjiro Kamado',75997001,'5967071210301','33C','JAL','2022-11-30','Tokyo','18',311582001),('Yeh Shu Hua',75997004,'5967071210304','50B','JAL','2022-08-12','Bangkok','22',311582004),('Zenitsu Agatsuma',75997002,'5967071210302','34C','JAL','2022-11-30','Tokyo','18',311582002);
/*!40000 ALTER TABLE `BoardingPass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cash`
--

DROP TABLE IF EXISTS `Cash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cash` (
  `PaymentID` int NOT NULL,
  `Changes` int DEFAULT NULL,
  PRIMARY KEY (`PaymentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cash`
--

LOCK TABLES `Cash` WRITE;
/*!40000 ALTER TABLE `Cash` DISABLE KEYS */;
INSERT INTO `Cash` VALUES (311582001,0),(311582002,0),(311582003,0),(311582004,45),(311582005,0),(311582006,0),(311582007,0),(311582008,45),(311582009,0),(311582010,45);
/*!40000 ALTER TABLE `Cash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Credit_card`
--

DROP TABLE IF EXISTS `Credit_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Credit_card` (
  `PaymentID` int NOT NULL,
  `CType` varchar(10) DEFAULT NULL,
  `HolderName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`PaymentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Credit_card`
--

LOCK TABLES `Credit_card` WRITE;
/*!40000 ALTER TABLE `Credit_card` DISABLE KEYS */;
INSERT INTO `Credit_card` VALUES (311582001,'JCB','JALCARD'),(311582002,'JCB','JALCARD'),(311582003,'JCB','JALCARD'),(311582004,'',''),(311582005,'JCB','JALCARD'),(311582006,'VISA','Chase Freedom Unlimited'),(311582007,'VISA','Chase Freedom Unlimited'),(311582008,'',''),(311582009,'JCB','JALCARD'),(311582010,'','');
/*!40000 ALTER TABLE `Credit_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Membership`
--

DROP TABLE IF EXISTS `Membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Membership` (
  `PName` varchar(50) NOT NULL,
  `PID` int NOT NULL,
  `MBID` int NOT NULL,
  `MStartDate` date NOT NULL,
  `MEndDate` date NOT NULL,
  PRIMARY KEY (`PName`,`PID`,`MBID`),
  CONSTRAINT `FK_PNPI` FOREIGN KEY (`PName`, `PID`) REFERENCES `Passenger` (`PName`, `PassportID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Membership`
--

LOCK TABLES `Membership` WRITE;
/*!40000 ALTER TABLE `Membership` DISABLE KEYS */;
INSERT INTO `Membership` VALUES ('Blair Willows',75997006,880597006,'2022-09-09','2025-09-08'),('Blair Willows',75997006,880597044,'2025-09-09','2028-09-08'),('Blair Willows',75997006,880597071,'2028-09-09','2031-09-08'),('Delancy Devin',75997007,880597007,'2022-09-09','2025-09-08'),('Delancy Devin',75997007,880597049,'2025-09-09','2028-09-08'),('Delancy Devin',75997007,880597052,'2028-09-09','2031-09-08'),('Inosuke Hashibira',75997003,880597003,'2022-11-10','2025-11-09'),('Inosuke Hashibira',75997003,880597074,'2025-11-10','2028-11-09'),('Inosuke Hashibira',75997003,880597077,'2028-11-10','2031-11-09'),('Kanao Tsuyuri',75997005,880597005,'2022-11-10','2025-11-09'),('Kanao Tsuyuri',75997005,880597051,'2025-11-10','2028-11-09'),('Kanao Tsuyuri',75997005,880597076,'2028-11-10','2031-11-09'),('Louis Partridge',75997010,880597010,'2022-10-25','2025-10-24'),('Louis Partridge',75997010,880597057,'2025-10-25','2028-10-24'),('Louis Partridge',75997010,880597085,'2024-10-25','2031-10-24'),('Nezuko Kamado',75997009,880597009,'2022-11-10','2025-11-09'),('Nezuko Kamado',75997009,880597045,'2025-11-10','2028-11-09'),('Nezuko Kamado',75997009,880597079,'2028-11-10','2031-11-09'),('Nicha Yontararak',75997008,880597008,'2022-11-10','2025-11-09'),('Nicha Yontararak',75997008,880597048,'2025-11-10','2028-11-09'),('Nicha Yontararak',75997008,880597083,'2028-11-10','2031-11-09'),('Tanjiro Kamado',75997001,880597001,'2022-11-10','2025-11-09'),('Tanjiro Kamado',75997001,880597042,'2025-11-10','2028-11-09'),('Tanjiro Kamado',75997001,880597066,'2028-11-10','2031-11-09'),('Yeh Shu Hua',75997004,880597004,'2022-08-01','2025-07-31'),('Yeh Shu Hua',75997004,880597041,'2025-08-01','2028-07-31'),('Yeh Shu Hua',75997004,880597069,'2028-08-01','2031-07-31'),('Zenitsu Agatsuma',75997002,880597002,'2022-11-10','2025-11-09'),('Zenitsu Agatsuma',75997002,880597047,'2028-11-10','2031-11-09'),('Zenitsu Agatsuma',75997002,880597053,'2025-11-10','2028-11-09');
/*!40000 ALTER TABLE `Membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Passenger`
--

DROP TABLE IF EXISTS `Passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Passenger` (
  `PName` varchar(50) NOT NULL,
  `PassportID` int NOT NULL,
  `PEmail` varchar(50) NOT NULL,
  `PPhone` varchar(15) NOT NULL,
  `PNational` varchar(30) NOT NULL,
  PRIMARY KEY (`PName`,`PassportID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Passenger`
--

LOCK TABLES `Passenger` WRITE;
/*!40000 ALTER TABLE `Passenger` DISABLE KEYS */;
INSERT INTO `Passenger` VALUES ('Blair Willows',75997006,'btchblair@icloud.com','(425)807-6650','U.S.A'),('Delancy Devin',75997007,'Delandc@verizon.net','(425)762-0556','U.S.A'),('Inosuke Hashibira',75997003,'InoChan@outlook.com','(03)9707-2445','japanese'),('Kanao Tsuyuri',75997005,'knokun555@hotmail.com','(03)1700-0068','japanese'),('Louis Partridge',75997010,'luvluv_enola@verizon.net','(42)5810-5940','U.S.A'),('Nezuko Kamado',75997009,'BBnezuko@yahoo.com','(03)3118-7215','japanese'),('Nicha Yontararak',75997008,'minnuay@live.com','(08)9999-9999','Thai'),('Tanjiro Kamado',75997001,'Tjkamado@gmail.com','(03)9468-8632','japanese'),('Yeh Shu Hua',75997004,'sunshif4@sbcglobal.net','(09)5539-8460','Taiwanese'),('Zenitsu Agatsuma',75997002,'ZenitZAZA@me.com','(03)4695-2134','japanese');
/*!40000 ALTER TABLE `Passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment`
--

DROP TABLE IF EXISTS `Payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Payment` (
  `PaymentID` int NOT NULL,
  `Amount` int NOT NULL,
  `PaymentDate` date NOT NULL,
  PRIMARY KEY (`PaymentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment`
--

LOCK TABLES `Payment` WRITE;
/*!40000 ALTER TABLE `Payment` DISABLE KEYS */;
INSERT INTO `Payment` VALUES (311582001,15799,'2022-11-10'),(311582002,15799,'2022-11-10'),(311582003,15799,'2022-11-10'),(311582004,40500,'2022-08-14'),(311582005,15799,'2022-11-10'),(311582006,30899,'2022-09-09'),(311582007,30899,'2022-09-10'),(311582008,40500,'2022-08-14'),(311582009,15799,'2022-11-10'),(311582010,40500,'2022-10-30');
/*!40000 ALTER TABLE `Payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Seat`
--

DROP TABLE IF EXISTS `Seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Seat` (
  `SeatID` varchar(3) NOT NULL,
  `SeatType` varchar(30) NOT NULL,
  `Class` varchar(25) NOT NULL,
  PRIMARY KEY (`SeatID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Seat`
--

LOCK TABLES `Seat` WRITE;
/*!40000 ALTER TABLE `Seat` DISABLE KEYS */;
INSERT INTO `Seat` VALUES ('11B','JAL SUITE','First Class'),('33C','JAL Economy Class Seat','Economy Class'),('34C','JAL Economy Class Seat','Economy Class'),('35C','JAL Economy Class Seat','Economy Class'),('36C','JAL Economy Class Seat','Economy Class'),('37C','JAL SKY WIDER','Economy Class'),('45J','JAL SKY PREMIUM','Premium Economy Class'),('45K','JAL SKY PREMIUM','Premium Economy Class'),('50A','JAL SKYLUXE SEAT','Business Class'),('50B','JAL SKYLUXE SEAT','Business Class');
/*!40000 ALTER TABLE `Seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SignUpFor`
--

DROP TABLE IF EXISTS `SignUpFor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SignUpFor` (
  `PName` varchar(50) NOT NULL,
  `PassportID` int NOT NULL,
  `MBID` int NOT NULL,
  `MDate` date NOT NULL,
  PRIMARY KEY (`PName`,`PassportID`,`MBID`),
  CONSTRAINT `FK_MB` FOREIGN KEY (`PName`, `PassportID`, `MBID`) REFERENCES `Membership` (`PName`, `PID`, `MBID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SignUpFor`
--

LOCK TABLES `SignUpFor` WRITE;
/*!40000 ALTER TABLE `SignUpFor` DISABLE KEYS */;
INSERT INTO `SignUpFor` VALUES ('Blair Willows',75997006,880597006,'2022-09-09'),('Blair Willows',75997006,880597044,'2025-09-09'),('Blair Willows',75997006,880597071,'2028-09-09'),('Delancy Devin',75997007,880597007,'2022-09-09'),('Delancy Devin',75997007,880597049,'2025-09-09'),('Delancy Devin',75997007,880597052,'2028-09-09'),('Inosuke Hashibira',75997003,880597003,'2022-11-10'),('Inosuke Hashibira',75997003,880597074,'2025-11-10'),('Inosuke Hashibira',75997003,880597077,'2028-11-10'),('Kanao Tsuyuri',75997005,880597005,'2022-11-10'),('Kanao Tsuyuri',75997005,880597051,'2025-11-10'),('Kanao Tsuyuri',75997005,880597076,'2028-11-10'),('Louis Partridge',75997010,880597010,'2022-10-25'),('Louis Partridge',75997010,880597057,'2025-10-25'),('Louis Partridge',75997010,880597085,'2028-10-25'),('Nezuko Kamado',75997009,880597009,'2022-11-10'),('Nezuko Kamado',75997009,880597045,'2025-11-10'),('Nezuko Kamado',75997009,880597079,'2028-11-10'),('Nicha Yontararak',75997008,880597008,'2022-11-10'),('Nicha Yontararak',75997008,880597048,'2025-11-10'),('Nicha Yontararak',75997008,880597083,'2028-11-10'),('Tanjiro Kamado',75997001,880597001,'2022-11-10'),('Tanjiro Kamado',75997001,880597042,'2025-11-10'),('Tanjiro Kamado',75997001,880597066,'2028-11-10'),('Yeh Shu Hua',75997004,880597004,'2022-08-01'),('Yeh Shu Hua',75997004,880597041,'2025-08-01'),('Yeh Shu Hua',75997004,880597069,'2028-08-01'),('Zenitsu Agatsuma',75997002,880597002,'2022-11-10'),('Zenitsu Agatsuma',75997002,880597047,'2028-11-10'),('Zenitsu Agatsuma',75997002,880597053,'2025-11-10');
/*!40000 ALTER TABLE `SignUpFor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ticket`
--

DROP TABLE IF EXISTS `Ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ticket` (
  `PName` varchar(50) NOT NULL,
  `PassportID` int NOT NULL,
  `TicketID` varchar(13) NOT NULL,
  `SeatID` varchar(3) NOT NULL,
  `Class` varchar(25) NOT NULL,
  `TakeOffDate` date NOT NULL,
  `Destination` varchar(50) NOT NULL,
  `PaymentID` int NOT NULL,
  PRIMARY KEY (`PName`,`PassportID`,`TicketID`,`SeatID`,`PaymentID`),
  KEY `FK_Seat` (`SeatID`),
  KEY `FK_Paym` (`PaymentID`),
  CONSTRAINT `FK_Paym` FOREIGN KEY (`PaymentID`) REFERENCES `Payment` (`PaymentID`),
  CONSTRAINT `FK_PNamePID` FOREIGN KEY (`PName`, `PassportID`) REFERENCES `Passenger` (`PName`, `PassportID`),
  CONSTRAINT `FK_Seat` FOREIGN KEY (`SeatID`) REFERENCES `Seat` (`SeatID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ticket`
--

LOCK TABLES `Ticket` WRITE;
/*!40000 ALTER TABLE `Ticket` DISABLE KEYS */;
INSERT INTO `Ticket` VALUES ('Blair Willows',75997006,'5967071210306','45K','Premium Economy Class','2022-10-18','Tokyo',311582006),('Delancy Devin',75997007,'5967071210307','45J','Premium Economy Class','2022-10-18','Tokyo',311582007),('Inosuke Hashibira',75997003,'5967071210303','35C','Economy Class','2022-11-30','Osaka',311582003),('Kanao Tsuyuri',75997005,'5967071210305','37C','Economy Class','2022-11-30','Osaka',311582005),('Louis Partridge',75997010,'5967071210310','11B','First Class','2022-11-13','Nagoya',311582010),('Nezuko Kamado',75997009,'5967071210309','36C','Economy Class','2022-11-30','Osaka',311582009),('Nicha Yontararak',75997008,'5967071210308','50A','Business Class','2022-08-12','Tokyo',311582008),('Tanjiro Kamado',75997001,'5967071210301','33C','Economy Class','2022-11-30','Osaka',311582001),('Yeh Shu Hua',75997004,'5967071210304','50B','Business Class','2022-08-12','Tokyo',311582004),('Zenitsu Agatsuma',75997002,'5967071210302','34C','Economy Class','2022-11-30','Osaka',311582002);
/*!40000 ALTER TABLE `Ticket` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-30 23:06:11
