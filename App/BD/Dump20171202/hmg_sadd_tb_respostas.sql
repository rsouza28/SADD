CREATE DATABASE  IF NOT EXISTS `hmg_sadd` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `hmg_sadd`;
-- MySQL dump 10.13  Distrib 5.5.46, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: hmg_sadd
-- ------------------------------------------------------
-- Server version	5.5.46-0ubuntu0.14.04.2

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
-- Table structure for table `tb_respostas`
--

DROP TABLE IF EXISTS `tb_respostas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_respostas` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RESPOSTA` varchar(250) NOT NULL,
  `FLAG_ATIVO` char(1) NOT NULL,
  `VALOR` int(11) NOT NULL,
  `ID_CATEGORIA` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_resp_cat` (`ID_CATEGORIA`) USING BTREE,
  CONSTRAINT `tb_cat_tb_resp_fk` FOREIGN KEY (`ID_CATEGORIA`) REFERENCES `tb_categoria` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_respostas`
--

LOCK TABLES `tb_respostas` WRITE;
/*!40000 ALTER TABLE `tb_respostas` DISABLE KEYS */;
INSERT INTO `tb_respostas` VALUES (1,'Sempre','S',5,1),(2,'Bastante','S',4,1),(3,'Ás vezes','S',3,1),(4,'Pouco','S',2,1),(5,'Nunca','S',1,1),(6,'Sim','S',5,2),(7,'Ás vezes','S',4,2),(8,'Não sei','S',3,2),(9,'Raramente','S',2,2),(10,'Não','S',1,2),(11,'Sim','S',5,3),(12,'Ás vezes','S',4,3),(13,'Não sei','S',3,3),(14,'Raramente','S',2,3),(15,'Não','S',1,3);
/*!40000 ALTER TABLE `tb_respostas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-02  1:37:13
