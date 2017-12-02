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
-- Table structure for table `tb_perguntas`
--

DROP TABLE IF EXISTS `tb_perguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_perguntas` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PERGUNTA` varchar(1024) NOT NULL,
  `FLAG_ATIVO` char(1) NOT NULL,
  `ID_CATEGORIA` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_perg_cat` (`ID_CATEGORIA`) USING BTREE,
  CONSTRAINT `tb_cat_tb_perg_fk` FOREIGN KEY (`ID_CATEGORIA`) REFERENCES `tb_categoria` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_perguntas`
--

LOCK TABLES `tb_perguntas` WRITE;
/*!40000 ALTER TABLE `tb_perguntas` DISABLE KEYS */;
INSERT INTO `tb_perguntas` VALUES (1,'A disciplina contribui para o conhecimento de valores humanos e ética profissional.','S',1),(2,'A disciplina contribui para o aprendizado de conhecimentos específicos para a atuação profissional.','S',1),(3,'A disciplina contribui para o acesso ao conhecimento científico atualizado (artigos, novas técnicas ou ferramentas, etc).','S',1),(4,'A disciplina está articula com os programas especiais de ensino (pet, monitoria etc).','S',1),(5,'A disciplina está articulada com projetos ou atividades de extensão.','S',1),(6,'A disciplina está articulada com projetos ou atividades de pesquisa.','S',1),(7,'Laboratórios necessários para o ensino desta  disciplina são disponibilizados de forma satisfatória.','S',1),(8,'Equipamentos necessários para o ensino desta  disciplina são disponibilizados de forma satisfatória.','S',1),(9,'Acervo de bicicleta necessário para o ensino desta  disciplina é disponibilizado de forma satisfatória.','S',1),(10,'Salas de aulas necessárias para o ensino desta  disciplina são disponibilizadas de forma satisfatória.','S',1),(11,'Material didático necessário para o ensino desta disciplina é disponibilizado de forma satisfatória.','S',1),(12,'Utiliza um ambiente virtual para disponibilização de material, interação e colaboração (ex: moodle, site pessoal, dropbox, …).','S',2),(13,'É flexível e aberto a sugestões e críticas por parte dos alunos e colegas docentes, no que diz respeito à didática no ensino e metodologia utilizada.','S',2),(14,'Demonstra domínio do conteúdo da disciplina.','S',2),(15,'Exige na avaliação conteúdos que correspondem aos que foram trabalhados em sala de aula.','S',2),(16,'Utiliza técnicas de ensino que facilitam a aprendizagem. 	','S',2),(17,'Desenvolve as atividades seguindo uma sequência lógica.','S',2),(18,'Propicia a participação dos alunos em sala de aula','S',2),(19,'Cumpre o horário das aulas. 	','S',2),(20,'Está disponível para atender o aluno além do horário de aula, bem como comunica os horários em que está disponível para atendê-los. 	','S',2),(21,'Utiliza nas avaliações critérios estabelecidos e divulgados de forma clara para os alunos. 	','S',2),(22,'Demonstra claramente a importância da disciplina na formação acadêmica e profissional do aluno.','S',2),(23,'Me sinto à vontade para participar das aulas, fazendo perguntas ou elaborando respostas. 	','S',3),(24,'Me sinto preparado para acompanhar os conteúdos da disciplina. 	\r\n	','S',3),(25,'Cumpro as atividades solicitadas na disciplina.','S',3),(26,'Me dedico aos estudos da disciplina além do horário da aula.','S',3),(27,'Assisto às aulas do início ao fim.','S',3),(28,'Procuro o professor, fora do horário da aula, para tirar dúvidas sobre o conteúdo da disciplina.','S',3),(29,'Tenho obtido nota igual ou superior a sete nas avaliações desta disciplina.','S',3),(30,'Estou satisfeito com o que aprendi na disciplina.','S',3),(31,'Se realizo estágio, consigo conciliá-lo com o curso sem prejuízo para ambos.','S',3),(32,'Tenho participado de outras atividades acadêmicas, além das disciplinas do Curso','S',3),(33,'Estudo o conteúdo programático utilizando bibliografia sugerida pelo professor.','S',3);
/*!40000 ALTER TABLE `tb_perguntas` ENABLE KEYS */;
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
