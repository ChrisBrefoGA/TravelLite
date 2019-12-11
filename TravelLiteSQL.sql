CREATE DATABASE  IF NOT EXISTS `TravelLite` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `TravelLite`;
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

DROP TABLE IF EXISTS `Admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Admin` (
  `userid` varchar(20) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `admin_id` (`admin_id`),
  CONSTRAINT `Admin_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `Aircraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Aircraft` (
  `aircraft_id` int(11) NOT NULL,
  `Max_seats` int(11) DEFAULT '100',
  PRIMARY KEY (`aircraft_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Airlines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Airlines` (
  `airline_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`airline_id`),
  KEY `Name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Airport` (
  `airport_id` int(11) NOT NULL,
  `abbreviation` varchar(5) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`airport_id`),
  UNIQUE KEY `abbreviation` (`abbreviation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer` (
  `userid` varchar(20) NOT NULL,
  `account_num` int(11) DEFAULT NULL,
  `revenue` float DEFAULT NULL,
  PRIMARY KEY (`userid`),
  CONSTRAINT `Customer_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Customer_rep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer_rep` (
  `userid` varchar(20) NOT NULL,
  `customer_rep_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `customer_rep_id` (`customer_rep_id`),
  CONSTRAINT `user` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Flight` (
  `flight_number` int(11) DEFAULT 0,
  `type` varchar(20) DEFAULT "",
  `depart_date` date DEFAULT NULL,
  `arrival_date` date DEFAULT NULL,
  `depart_time` time DEFAULT NULL,
  `arrive_time` time DEFAULT NULL,
  `fare_first` float DEFAULT 0,
  `fare_economy` float DEFAULT 0,
  `fare_business` float DEFAULT 0,
  `available_seats` int(11) DEFAULT 0,
  `is_full` boolean DEFAULT false,
  `num_stops` int(11) DEFAULT '0',
  `price` float DEFAULT 0,
  `booking_fee` float DEFAULT 0,
  `departure_airport` varchar(5) DEFAULT "",
  `arrival_airport` varchar(5) DEFAULT "",
  `aircraft_id` int(11) DEFAULT 0,
  `airline` varchar(20) DEFAULT "",
  PRIMARY KEY (`flight_number`),
  KEY `D_A_idx` (`departure_airport`),
  KEY `A_A_idx` (`arrival_airport`),
  KEY `A_id_idx` (`aircraft_id`),
  KEY `AL_id_idx` (`airline`),
  CONSTRAINT `A_A` FOREIGN KEY (`arrival_airport`) REFERENCES `Airport` (`abbreviation`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `A_id` FOREIGN KEY (`aircraft_id`) REFERENCES `Aircraft` (`aircraft_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `D_A` FOREIGN KEY (`departure_airport`) REFERENCES `Airport` (`abbreviation`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `AL_id` FOREIGN KEY (`airline`) REFERENCES `Airlines` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*DROP TABLE IF EXISTS `Owns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*/*!40101 SET character_set_client = utf8 */;
/*CREATE TABLE `Owns` (
  `airline` int(11) NOT NULL,
  `aircraft_` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`flight`,`username`),
  KEY `WU_idx` (`username`),
  CONSTRAINT `WF` FOREIGN KEY (`flight`) REFERENCES `Flight` (`flight_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `WU` FOREIGN KEY (`username`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ticket` (
  `ticket_number` int,
  `round_trip` bool,
  `booking_fee` float,
  `issue_date` date,
  `price` float,
  `notEconomy` boolean,
  `user_name` varchar(20) references users on delete cascade,
  `flight#` int references Flight on delete cascade,
  `seat#` int references Seat,
  primary key(`ticket_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userid` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(20) NOT NULL DEFAULT '',
  `First_name` varchar(20) NOT NULL default '',
  `Last_name` varchar(20) NOT NULL default '',
  `account_id` int,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `Waitinglist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Waitinglist` (
  `flight` int(11) NOT NULL,
  `username` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`flight`,`username`),
  KEY `WU_idx` (`username`),
  CONSTRAINT `WF` FOREIGN KEY (`flight`) REFERENCES `Flight` (`flight_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `WU` FOREIGN KEY (`username`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

