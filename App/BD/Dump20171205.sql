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
-- Table structure for table `tb_administradores`
--

DROP TABLE IF EXISTS `tb_administradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_administradores` (
  `LOGIN` varchar(12) NOT NULL,
  `NOME` varchar(80) NOT NULL,
  `EMAIL` varchar(80) DEFAULT NULL,
  `SENHA` varchar(200) NOT NULL,
  PRIMARY KEY (`LOGIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_administradores`
--

LOCK TABLES `tb_administradores` WRITE;
/*!40000 ALTER TABLE `tb_administradores` DISABLE KEYS */;
INSERT INTO `tb_administradores` VALUES ('admin','Administrador','','admin'),('admin2','Administrador 2','amdin@admin.com','admin2'),('douglas','Douglas Brito','douglas.brito@uniriotec.br','unirio');
/*!40000 ALTER TABLE `tb_administradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_alunos`
--

DROP TABLE IF EXISTS `tb_alunos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_alunos` (
  `MATRICULA` varchar(20) NOT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `NOME` varchar(80) NOT NULL,
  `SEMESTRE_INGRESSO` int(11) NOT NULL,
  `CPF` char(11) DEFAULT NULL,
  `ANO_INGRESSO` int(11) NOT NULL,
  `senha` varchar(20) NOT NULL DEFAULT 'senha',
  PRIMARY KEY (`MATRICULA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_alunos`
--

LOCK TABLES `tb_alunos` WRITE;
/*!40000 ALTER TABLE `tb_alunos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_alunos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_avaliacao`
--

DROP TABLE IF EXISTS `tb_avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_avaliacao` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_PERGUNTA` int(11) NOT NULL,
  `ID_RESPOSTA` int(11) DEFAULT NULL,
  `SEMESTRE` int(11) NOT NULL,
  `ANO` int(11) NOT NULL,
  `CODIGO` varchar(10) NOT NULL,
  `MATRICULA` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `tb_avaliacao_idx` (`ID_PERGUNTA`,`SEMESTRE`,`ANO`,`CODIGO`,`MATRICULA`),
  KEY `fk_av_perg` (`ID_PERGUNTA`) USING BTREE,
  KEY `fk_av_resp` (`ID_RESPOSTA`) USING BTREE,
  KEY `tb_matricula_tb_avaliacao_fk` (`ANO`,`SEMESTRE`,`CODIGO`,`MATRICULA`),
  CONSTRAINT `tb_matricula_tb_avaliacao_fk` FOREIGN KEY (`ANO`, `SEMESTRE`, `CODIGO`, `MATRICULA`) REFERENCES `tb_turma` (`ANO`, `SEMESTRE`, `CODIGO`, `MATRICULA`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tb_perg_tb_av_fk` FOREIGN KEY (`ID_PERGUNTA`) REFERENCES `tb_perguntas` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tb_resp_tb_av_fk` FOREIGN KEY (`ID_RESPOSTA`) REFERENCES `tb_respostas` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_avaliacao`
--

LOCK TABLES `tb_avaliacao` WRITE;
/*!40000 ALTER TABLE `tb_avaliacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_categoria`
--

DROP TABLE IF EXISTS `tb_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_categoria` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CATEGORIA` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_categoria`
--

LOCK TABLES `tb_categoria` WRITE;
/*!40000 ALTER TABLE `tb_categoria` DISABLE KEYS */;
INSERT INTO `tb_categoria` VALUES (1,'Disciplina'),(2,'Docente'),(3,'Auto-Avaliação');
/*!40000 ALTER TABLE `tb_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_comentarios`
--

DROP TABLE IF EXISTS `tb_comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_comentarios` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `COMENTARIO` varchar(1024) DEFAULT NULL,
  `SUGESTOES` varchar(1024) DEFAULT NULL,
  `ANO` int(11) NOT NULL,
  `SEMESTRE` int(11) NOT NULL,
  `CODIGO` varchar(10) NOT NULL,
  `MATRICULA` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `tb_comentarios_idx` (`ANO`,`SEMESTRE`,`CODIGO`,`MATRICULA`),
  CONSTRAINT `tb_matricula_tb_comentarios_fk` FOREIGN KEY (`ANO`, `SEMESTRE`, `CODIGO`, `MATRICULA`) REFERENCES `tb_turma` (`ANO`, `SEMESTRE`, `CODIGO`, `MATRICULA`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_comentarios`
--

LOCK TABLES `tb_comentarios` WRITE;
/*!40000 ALTER TABLE `tb_comentarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_disciplinas`
--

DROP TABLE IF EXISTS `tb_disciplinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_disciplinas` (
  `CODIGO` varchar(10) NOT NULL,
  `DISCIPLINA` varchar(100) NOT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_disciplinas`
--

LOCK TABLES `tb_disciplinas` WRITE;
/*!40000 ALTER TABLE `tb_disciplinas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_disciplinas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_docentes`
--

DROP TABLE IF EXISTS `tb_docentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_docentes` (
  `MATRICULA` varchar(20) NOT NULL,
  `NOME` varchar(80) NOT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `SENHA` varchar(12) NOT NULL,
  `FLAG_ATIVO` char(3) NOT NULL DEFAULT 'SIM',
  PRIMARY KEY (`MATRICULA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_docentes`
--

LOCK TABLES `tb_docentes` WRITE;
/*!40000 ALTER TABLE `tb_docentes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_docentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_import_alunos_matriculados`
--

DROP TABLE IF EXISTS `tb_import_alunos_matriculados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_import_alunos_matriculados` (
  `matricula` varchar(20) DEFAULT NULL,
  `nome` varchar(80) DEFAULT NULL,
  `cod_disciplina` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_import_alunos_matriculados`
--

LOCK TABLES `tb_import_alunos_matriculados` WRITE;
/*!40000 ALTER TABLE `tb_import_alunos_matriculados` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_import_alunos_matriculados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_import_docentes_disciplinas`
--

DROP TABLE IF EXISTS `tb_import_docentes_disciplinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_import_docentes_disciplinas` (
  `cod_disciplina` varchar(20) DEFAULT NULL,
  `nome_disciplina` varchar(100) DEFAULT NULL,
  `matricula_docente` varchar(20) DEFAULT NULL,
  `nome_docente` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_import_docentes_disciplinas`
--

LOCK TABLES `tb_import_docentes_disciplinas` WRITE;
/*!40000 ALTER TABLE `tb_import_docentes_disciplinas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_import_docentes_disciplinas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_oferta`
--

DROP TABLE IF EXISTS `tb_oferta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_oferta` (
  `ANO` int(11) NOT NULL,
  `CODIGO` varchar(10) NOT NULL,
  `MATRICULA` varchar(20) NOT NULL,
  `SEMESTRE` int(11) NOT NULL,
  PRIMARY KEY (`ANO`,`CODIGO`,`MATRICULA`,`SEMESTRE`),
  KEY `tb_tempo_tb_oferta_fk` (`ANO`,`SEMESTRE`),
  KEY `tb_disciplinas_tb_oferta_fk` (`CODIGO`),
  KEY `tb_docentes_tb_oferta_fk` (`MATRICULA`),
  CONSTRAINT `tb_disciplinas_tb_oferta_fk` FOREIGN KEY (`CODIGO`) REFERENCES `tb_disciplinas` (`CODIGO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tb_docentes_tb_oferta_fk` FOREIGN KEY (`MATRICULA`) REFERENCES `tb_docentes` (`MATRICULA`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tb_tempo_tb_oferta_fk` FOREIGN KEY (`ANO`, `SEMESTRE`) REFERENCES `tb_tempo` (`ano`, `semestre`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_oferta`
--

LOCK TABLES `tb_oferta` WRITE;
/*!40000 ALTER TABLE `tb_oferta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_oferta` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `tb_tempo`
--

DROP TABLE IF EXISTS `tb_tempo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_tempo` (
  `ano` int(11) NOT NULL,
  `semestre` int(11) NOT NULL,
  `flag_corrente` varchar(3) NOT NULL DEFAULT 'Não',
  PRIMARY KEY (`ano`,`semestre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tempo`
--

LOCK TABLES `tb_tempo` WRITE;
/*!40000 ALTER TABLE `tb_tempo` DISABLE KEYS */;
INSERT INTO `tb_tempo` VALUES (2015,2,'Sim'),(2016,1,'Não'),(2016,2,'Não'),(2017,1,'Não'),(2017,2,'Não'),(2018,1,'Não'),(2018,2,'Não');
/*!40000 ALTER TABLE `tb_tempo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_teste_alunos`
--

DROP TABLE IF EXISTS `tb_teste_alunos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_teste_alunos` (
  `MATRICULA` varchar(20) CHARACTER SET utf8 NOT NULL,
  `EMAIL` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `NOME` varchar(80) CHARACTER SET utf8 NOT NULL,
  `SEMESTRE_INGRESSO` int(11) NOT NULL,
  `CPF` char(11) CHARACTER SET utf8 DEFAULT NULL,
  `ANO_INGRESSO` int(11) NOT NULL,
  `senha` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT 'senha'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_teste_alunos`
--

LOCK TABLES `tb_teste_alunos` WRITE;
/*!40000 ALTER TABLE `tb_teste_alunos` DISABLE KEYS */;
INSERT INTO `tb_teste_alunos` VALUES ('20152210036',NULL,'ANDERSON TAVARES QUEIROZ AFONSO',2,NULL,2015,'and#0036'),('20152210013',NULL,'ANGELLUS PEREIRA PAIXAO',2,NULL,2015,'ang#0013'),('20152210009',NULL,'ANIZIO DUTRA VIANA JUNIOR',2,NULL,2015,'ani#0009'),('20152210017',NULL,'ARTHUR FERNANDES BARREIRA GUIMARAES',2,NULL,2015,'art#0017'),('20152210002',NULL,'CIRO CASTRO MALHANO',2,NULL,2015,'cir#0002'),('20152210033',NULL,'CRISTANGENE FERREIRA LIMA',2,NULL,2015,'cri#0033'),('20132210011',NULL,'Deonir Fernando Ticon Maia de Oliveira',2,NULL,2013,'deo#0011'),('20152210007',NULL,'DIEGO BARCANTE PIRES',2,NULL,2015,'die#0007'),('20142210025',NULL,'ERICK DESLANDES MAGNO OLIVEIRA',2,NULL,2014,'eri#0025'),('20152210034',NULL,'FABIO DE MORAES PORTELA',2,NULL,2015,'fab#0034'),('20142210001',NULL,'GABRIEL DIAS ABDO CENTEIO',2,NULL,2014,'gab#0001'),('20152210006',NULL,'GUSTAVO NOWAK SILVA',2,NULL,2015,'gus#0006'),('20152210024',NULL,'HELIO GARCIA BATISTA',2,NULL,2015,'hel#0024'),('20152210021',NULL,'HUGO DUARTE BOCAYUVA TAVARES',2,NULL,2015,'hug#0021'),('20152210015',NULL,'JOAO GABRIEL PASSOS COSENDEY BROUCK',2,NULL,2015,'joa#0015'),('20152210004',NULL,'JULIO CESAR PEREIRA ANDRADE JUNIOR',2,NULL,2015,'jul#0004'),('20152210001',NULL,'LEONARDO BARROZO ABRANTES VIANA',2,NULL,2015,'leo#0001'),('20151210026',NULL,'LEONARDO INOCENCIO VELOSO',1,NULL,2015,'leo#0026'),('20152210022',NULL,'LEONARDO MELO LEMOS',2,NULL,2015,'leo#0022'),('20152210020',NULL,'LETICIA SILVERIO MOREIRA',2,NULL,2015,'let#0020'),('20152210005',NULL,'LINCOLN FONTES DE ALMEIDA',2,NULL,2015,'lin#0005'),('20152210023',NULL,'LUCAS DE SOUZA RIBEIRO',2,NULL,2015,'luc#0023'),('20152210011',NULL,'LUCAS PINHEIRO DE ARAUJO',2,NULL,2015,'luc#0011'),('20152210028',NULL,'MAGNO NASCIMENTO DE AZEVEDO CRUZ',2,NULL,2015,'mag#0028'),('20142210010',NULL,'MAISON BRUNO ALVES DA COSTA',2,NULL,2014,'mai#0010'),('20151210021',NULL,'MARCIO DE OLIVEIRA GOTTARDO',1,NULL,2015,'mar#0021'),('20152210003',NULL,'MARCO AURELIO TOMAZ JUNIOR',2,NULL,2015,'mar#0003'),('20152210010',NULL,'MARCOS HENRIQUE BASTOS DE SA SILVA',2,NULL,2015,'mar#0010'),('20152210027',NULL,'MARIA LUIZA LOPES E SILVA',2,NULL,2015,'mar#0027'),('20152210019',NULL,'MARIANA CARDOSO PINHEIRO',2,NULL,2015,'mar#0019'),('20152210014',NULL,'MATEUS DOS SANTOS DORNELES',2,NULL,2015,'mat#0014'),('20152210035',NULL,'MATHEUS DE CASTRO LANDRINI',2,NULL,2015,'mat#0035'),('20152210025',NULL,'PAULO GABRIEL ALVES FONTANA',2,NULL,2015,'pau#0025'),('20152210018',NULL,'PILLAR BENEDETTI VASCONCELLOS LUZ',2,NULL,2015,'pil#0018'),('20152210026',NULL,'RAFAEL MARTINS SOARES',2,NULL,2015,'raf#0026'),('20152210016',NULL,'RAFAEL PEIXOTO ALONSO MACHADO',2,NULL,2015,'raf#0016'),('20152210029',NULL,'THIAGO DOS SANTOS PINHEIRO',2,NULL,2015,'thi#0029'),('20152210032',NULL,'VINICIUS CONDINA DE ABREU E LIMA',2,NULL,2015,'vin#0032'),('20152210031',NULL,'VINICIUS MARQUES ZAMITH',2,NULL,2015,'vin#0031'),('20131210801',NULL,'Anderson Andrade de Sá',1,NULL,2013,'and#0801'),('20101210003',NULL,'Armando José Lázaro Ferreira Santos',1,NULL,2010,'arm#0003'),('20102210701',NULL,'CARLA SANTOS FRANCO',2,NULL,2010,'car#0701'),('20151210002',NULL,'CARLOS AUGUSTO SANTOS MACIEL',1,NULL,2015,'car#0002'),('20121210018',NULL,'Daniel Bédoucha',1,NULL,2012,'dan#0018'),('20142210020',NULL,'HIAGO DE OLIVEIRA CARVALHO',2,NULL,2014,'hia#0020'),('20141210018',NULL,'JOUBERT NASCIMENTO FERNANDES',1,NULL,2014,'jou#0018'),('20131210027',NULL,'Quezia Magalhães da Silveira',1,NULL,2013,'que#0027'),('20151210001',NULL,'RAFAEL SALAZAR STAVALE',1,NULL,2015,'raf#0001'),('20151210017',NULL,'RICARDO DOS SANTOS BRAMBILA',1,NULL,2015,'ric#0017'),('20101210024',NULL,'Rodrigo Phídias da Silva',1,NULL,2010,'rod#0024'),('20151210022',NULL,'SABRINA LAPA DA COSTA E SILVA',1,NULL,2015,'sab#0022'),('20151210024',NULL,'THAIS DE SOUZA SIMÕES',1,NULL,2015,'tha#0024'),('20132210031',NULL,'Victor Hugo da Silva Brandão',2,NULL,2013,'vic#0031'),('20122210032',NULL,'Vinicius Rosendo Tavares',2,NULL,2012,'vin#0032'),('20151210018',NULL,'ANA BEATRIZ VALENTINA VIEIRA NOVO',1,NULL,2015,'ana#0018'),('20151210012',NULL,'ARY AKIM PEIXOTO DOS SANTOS',1,NULL,2015,'ary#0012'),('20142210008',NULL,'BRUNO BARBOSA FRANCO',2,NULL,2014,'bru#0008'),('20151210013',NULL,'CASSIO HENRIQUE CABRAL CIDRINI',1,NULL,2015,'cas#0013'),('20131210008',NULL,'Ian Andrade Obraczka',1,NULL,2013,'ian#0008'),('20132210012',NULL,'JORDANA GISAH CAMPOS MELLO',2,NULL,2013,'jor#0012'),('20151210019',NULL,'LUIZ CARLOS DEGOU JUNIOR',1,NULL,2015,'lui#0019'),('20111210027',NULL,'Mapril Barbosa da Fonseca Junior',1,NULL,2011,'map#0027'),('20132210035',NULL,'Sergio Ricardo Amaral Gomes',2,NULL,2013,'ser#0035'),('20151210006',NULL,'VICTOR CORREA FERNANDES',1,NULL,2015,'vic#0006'),('20132210027',NULL,'YGOR ALEXANDER BESSA LACERDA',2,NULL,2013,'ygo#0027'),('20132210029',NULL,'Alexandre Patriota de Lima',2,NULL,2013,'ale#0029'),('20141210028',NULL,'ANDRESSA ALVES GUERRA',1,NULL,2014,'and#0028'),('20122210019',NULL,'Carlos Bruno Pereira dos Reis',2,NULL,2012,'car#0019'),('20112210005',NULL,'Cezar Barcellos Aguirres',2,NULL,2011,'cez#0005'),('20132210030',NULL,'Daniel Quintana de Andrade',2,NULL,2013,'dan#0030'),('20131210013',NULL,'Davi Anjos de Faria',1,NULL,2013,'dav#0013'),('20151210003',NULL,'DANIEL VILLACA DE OLIVEIRA SILVA',1,NULL,2015,'dan#0003'),('20122210027',NULL,'Fernando Cavalcanti Ferreira',2,NULL,2012,'fer#0027'),('20141210030',NULL,'FERNANDO CARDOSO DURIER DA SILVA',1,NULL,2014,'fer#0030'),('20132210025',NULL,'Géssica Maria Fontenele Torquato',2,NULL,2013,'gés#0025'),('20122210010',NULL,'Julia Cortazio Viana',2,NULL,2012,'jul#0010'),('20141210015',NULL,'JULIO GONCALVES CAMPOS',1,NULL,2014,'jul#0015'),('20132210026',NULL,'Lucas dos Santos Nascimento',2,NULL,2013,'luc#0026'),('20132210009',NULL,'Lucas dos Santos Salgado',2,NULL,2013,'luc#0009'),('20112210023',NULL,'Lucas Sobrinho de Sá Maciel',2,NULL,2011,'luc#0023'),('20132210022',NULL,'Marco Antônio Magalhães dos Santos Filho',2,NULL,2013,'mar#0022'),('20131210019',NULL,'Paula Dias de Figueiredo',1,NULL,2013,'pau#0019'),('20132210034',NULL,'Rafael Lima da Silva Ribeiro',2,NULL,2013,'raf#0034'),('20112210028',NULL,'Raquel Godoy Thiele de Almeida',2,NULL,2011,'raq#0028'),('20132210008',NULL,'Rebecca da Cruz Fernandes Pantoja',2,NULL,2013,'reb#0008'),('20151210010',NULL,'RENARD SEBASTIAN PESSOA FERREIRA',1,NULL,2015,'ren#0010'),('20142210004',NULL,'RICARDO AUGUSTO BLEI SANT ANNA DAS NEVES',2,NULL,2014,'ric#0004'),('20132210016',NULL,'Rodrigo Marques da Silva',2,NULL,2013,'rod#0016'),('20142210017',NULL,'RODRIGO DOS SANTOS OLIVEIRA',2,NULL,2014,'rod#0017'),('20142210026',NULL,'RODRIGO RIBEIRO SILVA',2,NULL,2014,'rod#0026'),('20151210007',NULL,'ROMULO LUIZ MENDONCA DE BRITO',1,NULL,2015,'rom#0007'),('20142210024',NULL,'THIAGO ALBUQUERQUE DE LIMA',2,NULL,2014,'thi#0024'),('20122210015',NULL,'Victor Moreira Lourenço',2,NULL,2012,'vic#0015'),('20132210033',NULL,'Yuri Logatto Pamplona',2,NULL,2013,'yur#0033'),('20122210025',NULL,'Airton de Oliveira dos Reis Junior',2,NULL,2012,'air#0025'),('20141210004',NULL,'ALEX MONTEIRO VITORINO',1,NULL,2014,'ale#0004'),('20132210017',NULL,'Arthur de Oliveira Lopes',2,NULL,2013,'art#0017'),('20142210023',NULL,'BERNARDO CIRNE SEVERO',2,NULL,2014,'ber#0023'),('20141210009',NULL,'BIANCA RODRIGUES TEIXEIRA',1,NULL,2014,'bia#0009'),('20112210008',NULL,'Claudio Ribeiro Dietrich Júnior',2,NULL,2011,'cla#0008'),('20131210010',NULL,'Daniela Rocha Silva',1,NULL,2013,'dan#0010'),('20141210031',NULL,'DANIEL PADRENOSSO GOUY',1,NULL,2014,'dan#0031'),('20132210007',NULL,'Débora França de Oliveira',2,NULL,2013,'déb#0007'),('20111210012',NULL,'Diogo Ferreira de Freitas',1,NULL,2011,'dio#0012'),('20131210005',NULL,'HUGO JOSE DOS SANTOS PEREIRA BERTOCHE',1,NULL,2013,'hug#0005'),('20122210017',NULL,'Jessica Araújo Leite',2,NULL,2012,'jes#0017'),('20141210021',NULL,'LEONARDO FELIPE MENEZES DOS SANTOS',1,NULL,2014,'leo#0021'),('20141210001',NULL,'LUCAS DE ALMEIDA LINS',1,NULL,2014,'luc#0001'),('20141210020',NULL,'MARCEL AREAS DE ALMEIDA FILHO',1,NULL,2014,'mar#0020'),('20141210012',NULL,'PAMELLA SANTOS ALFAIA',1,NULL,2014,'pam#0012'),('20131210030',NULL,'Pedro Arthur Rangel Linhares Lima',1,NULL,2013,'ped#0030'),('20142210003',NULL,'RENATA EMANUELLE VASCONCELLOS ANHON',2,NULL,2014,'ren#0003'),('20141210011',NULL,'TITO VIEIRA DE REZENDE NETO',1,NULL,2014,'tit#0011'),('20131210037',NULL,'Victor Garcia Farias',1,NULL,2013,'vic#0037'),('20142210032',NULL,'VICTOR AGUIAR SOUZA SPRINGER',2,NULL,2014,'vic#0032'),('20122210011',NULL,'Carolina Yorio Heinze Tozzi',2,NULL,2012,'car#0011'),('20131210035',NULL,'Gian Biolchini Abi Saber',1,NULL,2013,'gia#0035'),('20122210008',NULL,'Igor dos Santos de Castro',2,NULL,2012,'igo#0008'),('20111210025',NULL,'Luiz Carlos Queiroz Cunha Filho',1,NULL,2011,'lui#0025'),('20121210005',NULL,'Michel Augusto Queiroz Morais',1,NULL,2012,'mic#0005'),('20131210006',NULL,'Thais Mester Barbosa',1,NULL,2013,'tha#0006'),('20092210138',NULL,'Thiago Pacheco de Assis',2,NULL,2009,'thi#0138'),('20122210026',NULL,'Vitor Crivano Mattos',2,NULL,2012,'vit#0026'),('20121210012',NULL,'Arthur Henrique Machado Dutra',1,NULL,2012,'art#0012'),('20132210032',NULL,'Bruno Sales Domingos da Silva',2,NULL,2013,'bru#0032'),('20121210019',NULL,'Caroline Loppi Guimarães',1,NULL,2012,'car#0019'),('20112210009',NULL,'Daiane de Oliveira Correa',2,NULL,2011,'dai#0009'),('20111210013',NULL,'Elton Figueiredo de Souza Soares',1,NULL,2011,'elt#0013'),('20121210014',NULL,'Gabriel Diniz Tormin',1,NULL,2012,'gab#0014'),('20131210033',NULL,'Igor Balteiro Pereira de Campos',1,NULL,2013,'igo#0033'),('20102210702',NULL,'Jefferson Andrade Ferrão',2,NULL,2010,'jef#0702'),('20101210015',NULL,'Lucas Loureiro Swinerd',1,NULL,2010,'luc#0015'),('20122210021',NULL,'Lucianna Santos Araruna Dedis',2,NULL,2012,'luc#0021'),('20122210003',NULL,'Luiz Paulo Carvalho da Silva',2,NULL,2012,'lui#0003'),('20091210020',NULL,'Uriel dos Santos Pereira Bertoche',1,NULL,2009,'uri#0020'),('20091210038',NULL,'Victor Doria Cardoso da Rocha',1,NULL,2009,'vic#0038'),('20142210014',NULL,'ALAN PEREIRA DE SA',2,NULL,2014,'ala#0014'),('20151210023',NULL,'ALLAN DOS SANTOS MAGALHAES DE SOUSA',1,NULL,2015,'all#0023'),('20142210011',NULL,'ANDRE DE FREITAS NAIFF',2,NULL,2014,'and#0011'),('20132210024',NULL,'Carlos Humberto Castello Branco Gonçalves Filho',2,NULL,2013,'car#0024'),('20142210031',NULL,'LUO HAIBO',2,NULL,2014,'luo#0031'),('20141210023',NULL,'PEDRO HENRIQUE SALVIANO FERREIRA',1,NULL,2014,'ped#0023'),('20142210009',NULL,'RODRIGO FARIAS CAETANO',2,NULL,2014,'rod#0009'),('20151210027',NULL,'WALTER FELIX SODRE TORRES',1,NULL,2015,'wal#0027'),('20152210012',NULL,'ALAN LONES DOS SANTOS',2,NULL,2015,'ala#0012'),('20152210008',NULL,'GABRIEL CABRAL REIS',2,NULL,2015,'gab#0008'),('20152210030',NULL,'PATRICIA DE SOUZA DOS SANTOS',2,NULL,2015,'pat#0030'),('20132220856',NULL,'Wesley de Andrade',2,NULL,2013,'wes#0856'),('20151210029',NULL,'ANTONIO ANDRE LIMA MOREIRA',1,NULL,2015,'ant#0029'),('20112210014',NULL,'Filippi Ferreira Rosa Marques',2,NULL,2011,'fil#0014'),('20151210015',NULL,'MATHEUS FERNANDES DE SOUZA',1,NULL,2015,'mat#0015'),('20142210012',NULL,'BRUNO FERREIRA BRUM',2,NULL,2014,'bru#0012'),('20131210026',NULL,'Danielle Taborda de Almeida Correa',1,NULL,2013,'dan#0026'),('20112210015',NULL,'Flávio da Silva Duarte',2,NULL,2011,'flá#0015'),('20132210019',NULL,'Gabriella da Silva de Souza',2,NULL,2013,'gab#0019'),('20112210016',NULL,'Greice do Nascimento Felipe',2,NULL,2011,'gre#0016'),('20141210008',NULL,'HUGO MOURAO DA SILVA',1,NULL,2014,'hug#0008'),('20132210850',NULL,'Juliana Gonçalves dos Santos',2,NULL,2013,'jul#0850'),('20101210901',NULL,'Livanio Fernando da Silva',1,NULL,2010,'liv#0901'),('20121210022',NULL,'Lucas Alves Moreira de Souza',1,NULL,2012,'luc#0022'),('20102210033',NULL,'Thiago da Silva Brito',2,NULL,2010,'thi#0033'),('20142210002',NULL,'THAIS DE SOUZA DELUCA FERREIRA',2,NULL,2014,'tha#0002'),('20142210006',NULL,'TIAGO RIBEIRO DA SILVA MELO',2,NULL,2014,'tia#0006'),('20141210005',NULL,'FILIPE ESTEVES GONCALVES',1,NULL,2014,'fil#0005'),('20141210019',NULL,'LUAN CHRISTIAN DE FREITAS BORGES',1,NULL,2014,'lua#0019'),('20141210029',NULL,'MARINA SARTORI FILGUEIRAS',1,NULL,2014,'mar#0029'),('20151210028',NULL,'ERICK JOE ARAUJO',1,NULL,2015,'eri#0028'),('20112210032',NULL,'Rodrigo Henrique de Souza Amaral',2,NULL,2011,'rod#0032'),('20131210023',NULL,'Gabriel Morais Teixeira',1,NULL,2013,'gab#0023'),('20141210022',NULL,'GABRIEL MACIEL BORBA',1,NULL,2014,'gab#0022'),('20142210030',NULL,'IGOR AUGUSTO PASSOS',2,NULL,2014,'igo#0030'),('20142210029',NULL,'JONATHAM PETZOLD DE SOUZA DOS SANTOS',2,NULL,2014,'jon#0029'),('20151210004',NULL,'Ricardo Goulart Rocha',1,NULL,2015,'ric#0004'),('20111210035',NULL,'Ricardo Guimarães Conte',1,NULL,2011,'ric#0035'),('20141210010',NULL,'FLAVIO MATEUS RIBEIRO FREITAS',1,NULL,2014,'fla#0010'),('20132210013',NULL,'Getulio Pereira de Vasconcellos Filho',2,NULL,2013,'get#0013'),('20131210029',NULL,'Matheus Miranda Ferreira da Costa',1,NULL,2013,'mat#0029'),('20122210004',NULL,'Luis Filipe Oliveira da Silva',2,NULL,2012,'lui#0004'),('20102210011',NULL,'Enrique de Amorim Frade',2,NULL,2010,'enr#0011'),('20111210023',NULL,'Livia Costa Pereira',1,NULL,2011,'liv#0023'),('20111210024',NULL,'Lucas Ciarlini Guilhon',1,NULL,2011,'luc#0024'),('20111210026',NULL,'Maria Das Graças Menezes Leal',1,NULL,2011,'mar#0026'),('20122210009',NULL,'Matheus Augusto de Oliveira',2,NULL,2012,'mat#0009'),('20122210024',NULL,'Natália Dias da Costa',2,NULL,2012,'nat#0024'),('20132210036',NULL,'Adriano Cabral Linhares Mourthé',2,NULL,2013,'adr#0036'),('20122210022',NULL,'Lívia Santos Rodrigues',2,NULL,2012,'lív#0022'),('20112210001',NULL,'Alain Pereira da Silva dos Santos',2,NULL,2011,'ala#0001'),('20122210001',NULL,'Augusto Ladeira Guimarães',2,NULL,2012,'aug#0001'),('20141210017',NULL,'BRUNO BUCK BRIGAGAO',1,NULL,2014,'bru#0017'),('20132210028',NULL,'Daniel da Cruz Corrêa',2,NULL,2013,'dan#0028'),('20102210025',NULL,'Rafael da Silva Oliveira',2,NULL,2010,'raf#0025'),('20101210027',NULL,'Thiago Lima da Fonseca',1,NULL,2010,'thi#0027'),('20091210515',NULL,'Tiê Silva Cervantes',1,NULL,2009,'tiê#0515'),('20112210035',NULL,'Vinícius Nicolau da Silva',2,NULL,2011,'vin#0035'),('20122210029',NULL,'Alexsander Nolasco da Silveira',2,NULL,2012,'ale#0029'),('20102210001',NULL,'Aline Sales da Silva Guedes',2,NULL,2010,'ali#0001'),('20111210006',NULL,'Bianca de Paiva Orsi',1,NULL,2011,'bia#0006'),('20121210004',NULL,'Cesar Luis Barbosa da Silva',1,NULL,2012,'ces#0004'),('20112210013',NULL,'Felipe Guedes Quintanilha',2,NULL,2011,'fel#0013'),('20122210030',NULL,'Felipe Peixoto da Silva',2,NULL,2012,'fel#0030'),('20082210093',NULL,'Julio Cesar Banharo Guimarães',2,NULL,2008,'jul#0093'),('20111210020',NULL,'Laura Calanca Góes',1,NULL,2011,'lau#0020'),('20102210031',NULL,'Thadeu Santos Silva Gonçalves',2,NULL,2010,'tha#0031'),('20122210028',NULL,'Thiago Marçal Passos',2,NULL,2012,'thi#0028'),('20131210025',NULL,'Amanda Cristina Rodrigues Ferreira',1,NULL,2013,'ama#0025'),('20122210020',NULL,'Erick Nascimento de Oliveira',2,NULL,2012,'eri#0020'),('20121210027',NULL,'Felipe Carvalho dos Reis',1,NULL,2012,'fel#0027'),('20131210007',NULL,'Luis Felipe Bentin Sobral',1,NULL,2013,'lui#0007'),('20121210016',NULL,'Marcelo de Castro Endson',1,NULL,2012,'mar#0016'),('20121210034',NULL,'Bernardo Roedel Coimbra de Gouvêa',1,NULL,2012,'ber#0034'),('20121210035',NULL,'Gabriel Pereira Ramos',1,NULL,2012,'gab#0035'),('20132210021',NULL,'Lucas Carvalho de Vasconcellos',2,NULL,2013,'luc#0021'),('20102210005',NULL,'Augusto Taboransky Almada',2,NULL,2010,'aug#0005'),('20111210042',NULL,'Vitor de Lima Albuquerque Alves',1,NULL,2011,'vit#0042'),('20121210021',NULL,'Karina Martins Martinez',1,NULL,2012,'kar#0021'),('20121210010',NULL,'William Luiz Neves Brum',1,NULL,2012,'wil#0010'),('20101210019',NULL,'Alice da Fonseca Monteiro',1,NULL,2010,'ali#0019'),('20121210030',NULL,'Antonio França da Guia',1,NULL,2012,'ant#0030'),('20101210006',NULL,'Carlos Alberto de Melo Velez Filho',1,NULL,2010,'car#0006'),('20072210097',NULL,'Carlos Alberto Valete',2,NULL,2007,'car#0097'),('20102210006',NULL,'Cecilia de Almeida Soares',2,NULL,2010,'cec#0006'),('20082210513',NULL,'Daniel Martiniano Ferreira',2,NULL,2008,'dan#0513'),('20052210500',NULL,'Daniel Ruiz Teixeira',2,NULL,2005,'dan#0500'),('20101210009',NULL,'Davi Correa da Silva Alves',1,NULL,2010,'dav#0009'),('20102210008',NULL,'Davi de Araujo dos Santos',2,NULL,2010,'dav#0008'),('20091210043',NULL,'Diogo Ferreira da Silva',1,NULL,2009,'dio#0043'),('20102210010',NULL,'Eduardo Moreira Leite',2,NULL,2010,'edu#0010'),('20102210016',NULL,'Gabriel Ramalho de Albuquerque',2,NULL,2010,'gab#0016'),('20061210046',NULL,'João Marcello Calil Vaz Menezes Santana de Lima',1,NULL,2006,'joã#0046'),('20081210048',NULL,'Luiz Carlos Medeiros da Silva  Filho',1,NULL,2008,'lui#0048'),('20102210023',NULL,'Pedro Jardim da Silva',2,NULL,2010,'ped#0023'),('20102210024',NULL,'Pedro Lamy Zaluar',2,NULL,2010,'ped#0024'),('20092210071',NULL,'Raphael dos Santos Pinto',2,NULL,2009,'rap#0071'),('20102210028',NULL,'Rodrigo Ramos de Souza',2,NULL,2010,'rod#0028'),('20101210026',NULL,'Thales Veras da Costa Lima',1,NULL,2010,'tha#0026'),('20111210038',NULL,'Thiago Rodrigues Alves da Silva',1,NULL,2011,'thi#0038'),('20092210130',NULL,'Victor Magalhães Silva de Souza',2,NULL,2009,'vic#0130'),('20112210037',NULL,'Wilian Pereira da Silva Santos',2,NULL,2011,'wil#0037'),('20111210011',NULL,'Danielle Gilaberte de Almeida',1,NULL,2011,'dan#0011'),('20121210006',NULL,'Alan da Silva Sant´Anna',1,NULL,2012,'ala#0006'),('20071210023',NULL,'Matheus Charif Penchel',1,NULL,2007,'mat#0023'),('20111210037',NULL,'Sandro Moura da Silveira',1,NULL,2011,'san#0037'),('20072210123',NULL,'DIOGO MAGALHÃES MARTINS',2,NULL,2007,'dio#0123'),('20101220022',NULL,'Pedro Henrique Leite Alves',1,NULL,2010,'ped#0022'),('20112210019',NULL,'Leonardo dos Santos Silva',2,NULL,2011,'leo#0019');
/*!40000 ALTER TABLE `tb_teste_alunos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_turma`
--

DROP TABLE IF EXISTS `tb_turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_turma` (
  `ANO` int(11) NOT NULL,
  `SEMESTRE` int(11) NOT NULL,
  `CODIGO` varchar(10) NOT NULL,
  `MATRICULA` varchar(20) NOT NULL,
  `FLAG_AVALIADO` varchar(3) NOT NULL DEFAULT 'NÃO',
  PRIMARY KEY (`ANO`,`SEMESTRE`,`CODIGO`,`MATRICULA`),
  KEY `tb_alunos_tb_matricula_fk` (`MATRICULA`),
  KEY `tb_oferta_tb_matricula_fk` (`ANO`,`CODIGO`,`MATRICULA`,`SEMESTRE`),
  CONSTRAINT `tb_alunos_tb_matricula_fk` FOREIGN KEY (`MATRICULA`) REFERENCES `tb_alunos` (`MATRICULA`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tb_oferta_tb_matricula_fk` FOREIGN KEY (`ANO`, `CODIGO`, `MATRICULA`, `SEMESTRE`) REFERENCES `tb_oferta` (`ANO`, `CODIGO`, `MATRICULA`, `SEMESTRE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_turma`
--

LOCK TABLES `tb_turma` WRITE;
/*!40000 ALTER TABLE `tb_turma` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_turma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vw_avaliacao`
--

DROP TABLE IF EXISTS `vw_avaliacao`;
/*!50001 DROP VIEW IF EXISTS `vw_avaliacao`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_avaliacao` (
  `id` tinyint NOT NULL,
  `id_categoria` tinyint NOT NULL,
  `categoria` tinyint NOT NULL,
  `id_pergunta` tinyint NOT NULL,
  `pergunta` tinyint NOT NULL,
  `id_resposta` tinyint NOT NULL,
  `resposta` tinyint NOT NULL,
  `codigo` tinyint NOT NULL,
  `disciplina` tinyint NOT NULL,
  `matricula` tinyint NOT NULL,
  `nome` tinyint NOT NULL,
  `semestre` tinyint NOT NULL,
  `ano` tinyint NOT NULL,
  `flag_corrente` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_avaliacao_historico`
--

DROP TABLE IF EXISTS `vw_avaliacao_historico`;
/*!50001 DROP VIEW IF EXISTS `vw_avaliacao_historico`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_avaliacao_historico` (
  `id` tinyint NOT NULL,
  `id_categoria` tinyint NOT NULL,
  `categoria` tinyint NOT NULL,
  `id_pergunta` tinyint NOT NULL,
  `pergunta` tinyint NOT NULL,
  `id_resposta` tinyint NOT NULL,
  `resposta` tinyint NOT NULL,
  `codigo` tinyint NOT NULL,
  `disciplina` tinyint NOT NULL,
  `matricula` tinyint NOT NULL,
  `nome` tinyint NOT NULL,
  `matricula_docente` tinyint NOT NULL,
  `docente` tinyint NOT NULL,
  `semestre` tinyint NOT NULL,
  `ano` tinyint NOT NULL,
  `flag_corrente` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_avaliacoes_admin`
--

DROP TABLE IF EXISTS `vw_avaliacoes_admin`;
/*!50001 DROP VIEW IF EXISTS `vw_avaliacoes_admin`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_avaliacoes_admin` (
  `CATEGORIA` tinyint NOT NULL,
  `PERGUNTA` tinyint NOT NULL,
  `ANO` tinyint NOT NULL,
  `SEMESTRE` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_comentarios`
--

DROP TABLE IF EXISTS `vw_comentarios`;
/*!50001 DROP VIEW IF EXISTS `vw_comentarios`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_comentarios` (
  `comentario` tinyint NOT NULL,
  `sugestoes` tinyint NOT NULL,
  `matricula` tinyint NOT NULL,
  `codigo` tinyint NOT NULL,
  `semestre` tinyint NOT NULL,
  `ano` tinyint NOT NULL,
  `flag_corrente` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_import_alunos`
--

DROP TABLE IF EXISTS `vw_import_alunos`;
/*!50001 DROP VIEW IF EXISTS `vw_import_alunos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_import_alunos` (
  `matricula` tinyint NOT NULL,
  `nome` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_import_disciplinas`
--

DROP TABLE IF EXISTS `vw_import_disciplinas`;
/*!50001 DROP VIEW IF EXISTS `vw_import_disciplinas`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_import_disciplinas` (
  `cod_disciplina` tinyint NOT NULL,
  `nome_disciplina` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_import_docentes`
--

DROP TABLE IF EXISTS `vw_import_docentes`;
/*!50001 DROP VIEW IF EXISTS `vw_import_docentes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_import_docentes` (
  `matricula_docente` tinyint NOT NULL,
  `nome_docente` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_import_ofertas`
--

DROP TABLE IF EXISTS `vw_import_ofertas`;
/*!50001 DROP VIEW IF EXISTS `vw_import_ofertas`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_import_ofertas` (
  `codigo` tinyint NOT NULL,
  `matricula` tinyint NOT NULL,
  `semestre` tinyint NOT NULL,
  `ano` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_import_turma`
--

DROP TABLE IF EXISTS `vw_import_turma`;
/*!50001 DROP VIEW IF EXISTS `vw_import_turma`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_import_turma` (
  `ano` tinyint NOT NULL,
  `semestre` tinyint NOT NULL,
  `codigo` tinyint NOT NULL,
  `matricula` tinyint NOT NULL,
  `flag_avaliado` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_oferta`
--

DROP TABLE IF EXISTS `vw_oferta`;
/*!50001 DROP VIEW IF EXISTS `vw_oferta`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_oferta` (
  `matricula` tinyint NOT NULL,
  `nome` tinyint NOT NULL,
  `codigo` tinyint NOT NULL,
  `disciplina` tinyint NOT NULL,
  `semestre` tinyint NOT NULL,
  `ano` tinyint NOT NULL,
  `flag_corrente` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_oferta_historico`
--

DROP TABLE IF EXISTS `vw_oferta_historico`;
/*!50001 DROP VIEW IF EXISTS `vw_oferta_historico`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_oferta_historico` (
  `matricula` tinyint NOT NULL,
  `nome` tinyint NOT NULL,
  `codigo` tinyint NOT NULL,
  `disciplina` tinyint NOT NULL,
  `semestre` tinyint NOT NULL,
  `ano` tinyint NOT NULL,
  `flag_corrente` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_perguntas`
--

DROP TABLE IF EXISTS `vw_perguntas`;
/*!50001 DROP VIEW IF EXISTS `vw_perguntas`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_perguntas` (
  `id` tinyint NOT NULL,
  `pergunta` tinyint NOT NULL,
  `id_categoria` tinyint NOT NULL,
  `categoria` tinyint NOT NULL,
  `flag_ativo` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_relatorio_avaliacao`
--

DROP TABLE IF EXISTS `vw_relatorio_avaliacao`;
/*!50001 DROP VIEW IF EXISTS `vw_relatorio_avaliacao`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_relatorio_avaliacao` (
  `codigo` tinyint NOT NULL,
  `disciplina` tinyint NOT NULL,
  `matricula` tinyint NOT NULL,
  `docente` tinyint NOT NULL,
  `categoria` tinyint NOT NULL,
  `pergunta` tinyint NOT NULL,
  `resposta` tinyint NOT NULL,
  `semestre` tinyint NOT NULL,
  `ano` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_relatorio_comentarios`
--

DROP TABLE IF EXISTS `vw_relatorio_comentarios`;
/*!50001 DROP VIEW IF EXISTS `vw_relatorio_comentarios`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_relatorio_comentarios` (
  `comentario` tinyint NOT NULL,
  `sugestoes` tinyint NOT NULL,
  `ano` tinyint NOT NULL,
  `semestre` tinyint NOT NULL,
  `codigo` tinyint NOT NULL,
  `disciplina` tinyint NOT NULL,
  `nome` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_relatorio_quantitativo`
--

DROP TABLE IF EXISTS `vw_relatorio_quantitativo`;
/*!50001 DROP VIEW IF EXISTS `vw_relatorio_quantitativo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_relatorio_quantitativo` (
  `codigo` tinyint NOT NULL,
  `disciplina` tinyint NOT NULL,
  `matricula` tinyint NOT NULL,
  `nome` tinyint NOT NULL,
  `ano` tinyint NOT NULL,
  `semestre` tinyint NOT NULL,
  `qtd_alunos` tinyint NOT NULL,
  `qtd_alunos_avaliaram` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_turma`
--

DROP TABLE IF EXISTS `vw_turma`;
/*!50001 DROP VIEW IF EXISTS `vw_turma`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_turma` (
  `matricula` tinyint NOT NULL,
  `aluno` tinyint NOT NULL,
  `codigo` tinyint NOT NULL,
  `disciplina` tinyint NOT NULL,
  `matricula_docente` tinyint NOT NULL,
  `docente` tinyint NOT NULL,
  `flag` tinyint NOT NULL,
  `semestre` tinyint NOT NULL,
  `ano` tinyint NOT NULL,
  `corrente` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_turma_historico`
--

DROP TABLE IF EXISTS `vw_turma_historico`;
/*!50001 DROP VIEW IF EXISTS `vw_turma_historico`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_turma_historico` (
  `matricula` tinyint NOT NULL,
  `aluno` tinyint NOT NULL,
  `codigo` tinyint NOT NULL,
  `disciplina` tinyint NOT NULL,
  `matricula_docente` tinyint NOT NULL,
  `docente` tinyint NOT NULL,
  `flag` tinyint NOT NULL,
  `semestre` tinyint NOT NULL,
  `ano` tinyint NOT NULL,
  `corrente` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_usuarios`
--

DROP TABLE IF EXISTS `vw_usuarios`;
/*!50001 DROP VIEW IF EXISTS `vw_usuarios`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_usuarios` (
  `nome_exibicao` tinyint NOT NULL,
  `matricula` tinyint NOT NULL,
  `senha` tinyint NOT NULL,
  `tipo` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'hmg_sadd'
--
/*!50003 DROP FUNCTION IF EXISTS `semestre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `semestre`(v_data datetime) RETURNS int(11)
begin
declare sem int;

select case when month(v_data) <= 6 then 1 when month(v_data) > 6 then 2 end into sem ;
	
return sem;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_avaliacao_feita` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_avaliacao_feita`(in mat_aluno varchar(12), in cod_disc varchar(15))
begin
set @mat = mat_aluno;
set	@disc = cod_disc;

	update tb_turma t
	join tb_tempo s
	on t.ano = s.ano
	and t.semestre = s.semestre
	set flag_avaliado = 'SIM' 
	where matricula = @mat 
	and codigo = @disc
	and s.flag_corrente = 'Sim';
	
	

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_avalia_automaticamente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_avalia_automaticamente`()
begin

update tb_turma set flag_avaliado = 'SIM';

update tb_avaliacao a
join tb_perguntas b
on a.id_pergunta = b.id
join tb_categoria c
on c.id = b.id_categoria
set a.id_resposta = floor(1+rand()*5)
where c.id = 1;

update tb_avaliacao a
join tb_perguntas b
on a.id_pergunta = b.id
join tb_categoria c
on c.id = b.id_categoria
set a.id_resposta = floor(6+rand()*5)
where c.id = 2;

update tb_avaliacao a
join tb_perguntas b
on a.id_pergunta = b.id
join tb_categoria c
on c.id = b.id_categoria
set a.id_resposta = floor(11+rand()*5)
where c.id = 3;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_carrega_alunos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_carrega_alunos`()
begin

 DECLARE done INT DEFAULT 0;

 DECLARE mat char(11);
 DECLARE nom varchar(80);


 DECLARE curs CURSOR FOR (
	SELECT nome, matricula FROM vw_import_alunos
	);

 DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

 OPEN curs;

 REPEAT

 	FETCH curs INTO nom, mat;
		  IF NOT done THEN
			call sp_insert_aluno(mat, nom);
			
		
		  END IF;
   UNTIL done END REPEAT;

 CLOSE curs;

 end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_carrega_comentarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_carrega_comentarios`()
begin

 DECLARE done INT DEFAULT 0;

 DECLARE mat char(11);
 DECLARE cod varchar(80);
 DECLARE anno int;
 DECLARE sem int;



 DECLARE curs CURSOR FOR (
	SELECT codigo, matricula, semestre, ano FROM vw_import_turma
	);

 DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

 OPEN curs;

 REPEAT
	set foreign_key_checks = 0;
 	FETCH curs INTO cod, mat, sem, anno;
		  IF NOT done THEN
			call sp_gera_comentarios(cod, mat, anno, sem);
			
		
		  END IF;
   UNTIL done END REPEAT;

 CLOSE curs;

 end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_carrega_dados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_carrega_dados`()
begin
	call sp_carrega_alunos();
	call sp_carrega_disciplinas();
	call sp_carrega_docentes();
	call sp_carrega_ofertas();
	call sp_carrega_turmas();
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_carrega_disciplinas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_carrega_disciplinas`()
begin

 DECLARE done INT DEFAULT 0;

 DECLARE cod char(11);
 DECLARE disc varchar(80);


 DECLARE curs CURSOR FOR (
	SELECT nome_disciplina, cod_disciplina FROM vw_import_disciplinas
	);

 DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

 OPEN curs;

 REPEAT

 	FETCH curs INTO disc, cod;
		  IF NOT done THEN
			call sp_insert_disciplina(cod, disc);
			
		
		  END IF;
   UNTIL done END REPEAT;

 CLOSE curs;

 end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_carrega_docentes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_carrega_docentes`()
begin

 DECLARE done INT DEFAULT 0;

 DECLARE mat char(11);
 DECLARE nom varchar(80);


 DECLARE curs CURSOR FOR (
	SELECT nome_docente, matricula_docente FROM vw_import_docentes
	);

 DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

 OPEN curs;

 REPEAT

 	FETCH curs INTO nom, mat;
		  IF NOT done THEN
			call sp_insert_docente(mat, nom);
			
		
		  END IF;
   UNTIL done END REPEAT;

 CLOSE curs;

 end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_carrega_ofertas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_carrega_ofertas`()
begin

 DECLARE done INT DEFAULT 0;

 DECLARE mat char(11);
 DECLARE cod varchar(80);
 DECLARE anno int;
 DECLARE sem int;


 DECLARE curs CURSOR FOR (
	SELECT codigo, matricula, semestre, ano FROM vw_import_ofertas
	);

 DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

 OPEN curs;

 REPEAT

 	FETCH curs INTO cod, mat, sem, anno;
		  IF NOT done THEN
			call sp_insert_ofertas(cod, mat, anno, sem);
			
		
		  END IF;
   UNTIL done END REPEAT;

 CLOSE curs;

 end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_carrega_turmas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_carrega_turmas`()
begin

 DECLARE done INT DEFAULT 0;

 DECLARE mat char(11);
 DECLARE cod varchar(80);
 DECLARE anno int;
 DECLARE sem int;
 DECLARE flag varchar(3);


 DECLARE curs CURSOR FOR (
	SELECT codigo, matricula, semestre, ano, flag_avaliado FROM vw_import_turma
	);

 DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

 OPEN curs;

 REPEAT
	set foreign_key_checks = 0;
 	FETCH curs INTO cod, mat, sem, anno, flag;
		  IF NOT done THEN
			call sp_insert_turma(cod, mat, anno, sem);
			
		
		  END IF;
   UNTIL done END REPEAT;

 CLOSE curs;

 end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_cria_periodos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cria_periodos`()
begin

insert into tb_tempo(ano, semestre, flag_corrente)
SELECT year(DATE_ADD(CURDATE(), INTERVAL 180 DAY)), semestre(DATE_ADD(CURDATE(), INTERVAL 180 DAY)), 'Não' from dual
where not exists (select 1 from tb_tempo where ano = year(DATE_ADD(CURDATE(), INTERVAL 180 DAY)) and semestre = semestre(DATE_ADD(CURDATE(), INTERVAL 180 DAY)));

insert into tb_tempo(ano, semestre, flag_corrente)
SELECT year(DATE_ADD(CURDATE(), INTERVAL 360 DAY)), semestre(DATE_ADD(CURDATE(), INTERVAL 360 DAY)), 'Não' from dual
where not exists (select 1 from tb_tempo where ano = year(DATE_ADD(CURDATE(), INTERVAL 360 DAY)) and semestre = semestre(DATE_ADD(CURDATE(), INTERVAL 360 DAY)));
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_admin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_admin`(in l varchar(20))
begin
delete from tb_administradores where login = l;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_exporta_arquivo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_exporta_arquivo`(in ano int, in sem int)
begin
set @ano = ano;
set @semestre = sem;

set @v_query = concat("select 'codigo', 'disciplina', 'docente', 'matricula', 'categoria', 'pergunta', 'resposta'
UNION ALL
select codigo, disciplina, docente, matricula, categoria, pergunta, ifnull(resposta,'Nao avaliou') into outfile '/var/www/html/sadd_dev/files/relatorio","_",@ano,"_",@semestre,".csv'
character set latin1
fields terminated by ';' optionally enclosed by '\"'
lines terminated by '\n'
from vw_relatorio_avaliacao
where ano = ",@ano," and semestre = ",@semestre,";");


prepare s1 from @v_query;

execute s1;
drop prepare s1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_exporta_comentarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_exporta_comentarios`(in ano int, in sem int)
begin
set @ano = ano;
set @semestre = sem;

set @v_query = concat("select 'codigo', 'disciplina', 'docente', 'comentario', 'sugestoes'
UNION ALL
select codigo, disciplina, nome, ifnull(comentario,'Sem comentarios'), ifnull(sugestoes, 'Sem sugestoes')  into outfile '/var/www/html/sadd_dev/files/relatorio_comentarios","_",@ano,"_",@semestre,".csv'
character set latin1
fields terminated by ';' optionally enclosed by '\"'
lines terminated by '\n'
from vw_relatorio_comentarios
where ano = ",@ano," and semestre = ",@semestre,";");


prepare s1 from @v_query;

execute s1;
drop prepare s1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_flag_ativo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_flag_ativo`(in tabela varchar(40), in flag char(1), in cod int)
begin
set @tabela = tabela;
set @flag = flag;
set @cod = cod;
set @str := concat('Update ', concat(@tabela), ' set flag_ativo = ', concat("'",@flag,"'"), ' where id = ', concat(@cod));
-- select @str;
prepare _q from @str;
execute _q;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_gera_avaliacao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_gera_avaliacao`()
begin


select case when count(1) = 0 then 'True' else 'False' end into @total from tb_avaliacao av where exists (select 1 from tb_tempo per where av.ano = per.ano and av.semestre = per.semestre and flag_corrente = 'Sim');

insert into tb_avaliacao(id_pergunta, id_resposta, semestre, ano, codigo, matricula)
select p.id
	, null as id_resposta
	, s.semestre
	, s.ano
	, t.codigo
	, t.matricula
from tb_turma t 
join tb_tempo s
on t.semestre = s.semestre
and t.ano = s.ano
cross join tb_perguntas p
where s.flag_corrente = 'Sim'
and p.flag_ativo = 'S'
and @total = 'True';

call sp_carrega_comentarios();

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_gera_comentarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_gera_comentarios`(in cod varchar(20), in mat varchar(20), in anno int, in sem int )
begin
set @mat = mat;
set @cod = cod;
set @ano = anno;
set @sem = sem;

	insert into tb_comentarios(codigo, matricula, ano, semestre) 
	select @cod, @mat, @ano, @sem
	from dual
	where not exists (select 1 from tb_comentarios c where c.matricula = @mat and c.codigo = @cod and c.ano = @ano and c.semestre = @sem);

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get`(in tabela varchar(40), in campo varchar(40), in id int, out res varchar(1024))
begin

set @tabela = tabela;
set @campo = campo;
set @id = id;
set @retorno = res;

 set @str := concat('select ', concat(@campo),' from ', concat(@tabela), ' where id = ', @id);
-- concat('update ',concat(@tabela),' set flag_ativo = ',concat("'",@flag,"'"), ' where id = ',id);
	
  prepare _q from @str;
  execute _q using @retorno;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_pergunta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_pergunta`(in perg int, out retorno varchar(1024))
begin 
set @perg = perg;
set @retorno = retorno;
	select pergunta into retorno from tb_perguntas where id = @perg;


end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_import_alunos_matriculados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_import_alunos_matriculados`(in mat varchar(20), in nom varchar(80), in cod varchar(20))
begin
set @mat = mat;
set @nom = nom;
set @cod = cod;
	insert into tb_import_alunos_matriculados values(@mat, @nom, @cod);

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_import_docentes_disciplinas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_import_docentes_disciplinas`(in cod varchar(20), in disc varchar(100), in mat varchar(20), in nom varchar(100))
begin
set @mat = mat;
set @nom = nom;
set @cod = cod;
set @disc = disc;
	insert into tb_import_docentes_disciplinas values(@cod, @disc, @mat, @nom);

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_admin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_admin`(in l varchar(20), in n varchar(80), in e varchar(80), in s varchar(200))
begin
set foreign_key_checks = 0;
insert into tb_administradores(login, nome, email, senha) 
values (ltrim(rtrim(l)), ltrim(rtrim(n)), ltrim(rtrim(e)), ltrim(rtrim(s))); 
set foreign_key_checks = 1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_aluno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_aluno`(in mat varchar(20), in nom varchar(80))
begin
set @mat = mat;
set @nom = nom;

insert into tb_alunos(matricula, nome, ano_ingresso, semestre_ingresso, senha) 
select @mat, @nom, left(@mat, 4), right(left(@mat,5),1), concat(lower(left(@nom, 3)), '#', right(@mat, 4))
from dual
where not exists (select 1 from tb_alunos a where a.matricula = @mat);

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_aluno_teste` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_aluno_teste`(in mat varchar(20), in nom varchar(80))
begin
set @mat = mat;
set @nom = nom;

insert into tb_teste_alunos(matricula, nome, ano_ingresso, semestre_ingresso, senha) 
select @mat, @nom, left(@mat, 4), right(left(@mat,5),1), concat(lower(left(@nom, 3)), '#', right(@mat, 4))
from dual
where not exists (select 1 from tb_teste_alunos a where a.matricula = @mat);

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_categoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_categoria`(in cat varchar(20))
begin

	insert into tb_categoria(categoria) values (cat);

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_comentarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_comentarios`(in com varchar(1024), in sug varchar(1024), in mat varchar(20), in cod varchar(20))
begin
set @comentarios = com;
set @sugestoes = sug;
set @matr = mat;
set @codi = cod;

	update tb_comentarios 
	join tb_tempo
	on  concat(tb_tempo.ano, tb_tempo.semestre) = concat(tb_comentarios.ano, tb_comentarios.semestre)
	set comentario = @comentarios, sugestoes = @sugestoes 
	where matricula = @matr and codigo = @codi and flag_corrente = 'Sim';

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_disciplina` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_disciplina`(in cod varchar(20), in disc varchar(80))
begin
set @cod = cod;
set @disc = disc;

insert into tb_disciplinas(codigo, disciplina) 
select @cod, @disc
from dual
where not exists (select 1 from tb_disciplinas a where a.codigo = @cod);

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_docente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_docente`(in mat varchar(20), in nom varchar(80))
begin
set @mat = mat;
set @nom = nom;

insert into tb_docentes(matricula, nome, senha, flag_ativo) 
select @mat, @nom, concat(lower(left(@nom, 3)), '#', right(@mat, 4)), 'Sim'
from dual
where not exists (select 1 from tb_docentes a where a.matricula = @mat);

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_ofertas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_ofertas`(in cod varchar(20), in mat varchar(20), in anno int, in sem int )
begin
set @mat = mat;
set @cod = cod;
set @ano = anno;
set @sem = sem;

	insert into tb_oferta(codigo, matricula, ano, semestre) 
	select @cod, @mat, @ano, @sem
	from dual
	where not exists (select 1 from tb_oferta o where o.matricula = @mat and o.codigo = @cod and o.ano = @ano and o.semestre = @sem);

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_pergunta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_pergunta`(in p varchar(1024), in f char(1), in c int)
begin
set foreign_key_checks = 0;
insert into tb_perguntas(pergunta, flag_ativo, id_categoria) values (ltrim(rtrim(p)), f, c);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_resposta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_resposta`(in p varchar(1024), in f char(1), in v int, in c int)
begin
set foreign_key_checks = 0;
insert into tb_respostas(resposta, flag_ativo, valor, id_categoria) values (p, f, v, c);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_tempo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_tempo`(in sem int, in yar int, out val int)
BEGIN
SET @nao = "Não";
SET @val = 1;

	select count(1) into @val from tb_tempo where semestre = sem and ano = yar;

	if @val = 0 then
		 insert into tb_tempo(ano, semestre, flag_corrente) values (yar, sem, @nao);
	end if;
	-- 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_turma` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_turma`(in cod varchar(20), in mat varchar(20), in anno int, in sem int )
begin
set @mat = mat;
set @cod = cod;
set @ano = anno;
set @sem = sem;

	insert into tb_turma(codigo, matricula, ano, semestre, flag_avaliado) 
	select @cod, @mat, @ano, @sem, 'NÃO'
	from dual
	where not exists (select 1 from tb_turma t where t.matricula = @mat and t.codigo = @cod and t.ano = @ano and t.semestre = @sem);

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_responde_avaliacao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_responde_avaliacao`(in id_av int, in id_resp int)
begin
	set @av = id_av;
	set @resp = id_resp;
	
	update tb_avaliacao set id_resposta = @resp where id = @av;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_restaura_avaliacoes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_restaura_avaliacoes`()
begin
	set sql_safe_updates = 0;
	set foreign_key_checks = 0;
	
	update tb_avaliacao
	set ID_RESPOSTA = null;

	update tb_turma
	set flag_avaliado = 'NÃO';

	set sql_safe_updates = 1;
	set foreign_key_checks = 1;
	
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_seleciona_semestre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_seleciona_semestre`(in sem int, in yar int)
begin
set @nao = 'Não';
set @sim = 'Sim';

-- Antes de setar qualquer semestre como corrente, setar todos como não correntes.
	update tb_tempo set flag_corrente = @nao;
-- Agora setar o semestre como corrente passado como parâmetro 
	update tb_tempo set flag_corrente = @sim where semestre = sem and ano = yar;
 end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_trunca_tabelas_carregadas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_trunca_tabelas_carregadas`()
begin
	set foreign_key_checks = 0;
	truncate table tb_import_alunos_matriculados;
	truncate table tb_import_docentes_disciplinas;
	truncate table tb_avaliacao;
	truncate table tb_comentarios;
	truncate table tb_turma;
	truncate table tb_oferta;
	truncate table tb_disciplinas;
	truncate table tb_docentes;
	truncate table tb_alunos;
	set foreign_key_checks = 1;
	
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_avaliacao`
--

/*!50001 DROP TABLE IF EXISTS `vw_avaliacao`*/;
/*!50001 DROP VIEW IF EXISTS `vw_avaliacao`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_avaliacao` AS select `a`.`ID` AS `id`,`c`.`ID` AS `id_categoria`,`c`.`CATEGORIA` AS `categoria`,`a`.`ID_PERGUNTA` AS `id_pergunta`,`p`.`PERGUNTA` AS `pergunta`,`a`.`ID_RESPOSTA` AS `id_resposta`,`r`.`RESPOSTA` AS `resposta`,`a`.`CODIGO` AS `codigo`,`d`.`DISCIPLINA` AS `disciplina`,`a`.`MATRICULA` AS `matricula`,`al`.`NOME` AS `nome`,`a`.`SEMESTRE` AS `semestre`,`a`.`ANO` AS `ano`,`s`.`flag_corrente` AS `flag_corrente` from ((((((`tb_avaliacao` `a` join `tb_perguntas` `p` on((`a`.`ID_PERGUNTA` = `p`.`ID`))) join `tb_categoria` `c` on((`c`.`ID` = `p`.`ID_CATEGORIA`))) left join `tb_respostas` `r` on((`a`.`ID_RESPOSTA` = `r`.`ID`))) join `tb_disciplinas` `d` on((`a`.`CODIGO` = `d`.`CODIGO`))) join `tb_alunos` `al` on((`a`.`MATRICULA` = `al`.`MATRICULA`))) join `tb_tempo` `s` on(((`a`.`ANO` = `s`.`ano`) and (`a`.`SEMESTRE` = `s`.`semestre`)))) where (`s`.`flag_corrente` = 'Sim') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_avaliacao_historico`
--

/*!50001 DROP TABLE IF EXISTS `vw_avaliacao_historico`*/;
/*!50001 DROP VIEW IF EXISTS `vw_avaliacao_historico`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_avaliacao_historico` AS select `a`.`ID` AS `id`,`c`.`ID` AS `id_categoria`,`c`.`CATEGORIA` AS `categoria`,`a`.`ID_PERGUNTA` AS `id_pergunta`,`p`.`PERGUNTA` AS `pergunta`,`a`.`ID_RESPOSTA` AS `id_resposta`,`r`.`RESPOSTA` AS `resposta`,`a`.`CODIGO` AS `codigo`,`d`.`DISCIPLINA` AS `disciplina`,`a`.`MATRICULA` AS `matricula`,`al`.`NOME` AS `nome`,`o`.`MATRICULA` AS `matricula_docente`,`pd`.`NOME` AS `docente`,`a`.`SEMESTRE` AS `semestre`,`a`.`ANO` AS `ano`,`s`.`flag_corrente` AS `flag_corrente` from ((((((((`tb_avaliacao` `a` join `tb_perguntas` `p` on((`a`.`ID_PERGUNTA` = `p`.`ID`))) join `tb_categoria` `c` on((`c`.`ID` = `p`.`ID_CATEGORIA`))) join `tb_oferta` `o` on(((`o`.`CODIGO` = `a`.`CODIGO`) and (`o`.`SEMESTRE` = `a`.`SEMESTRE`) and (`o`.`ANO` = `a`.`ANO`)))) join `tb_docentes` `pd` on((`o`.`MATRICULA` = `pd`.`MATRICULA`))) left join `tb_respostas` `r` on((`a`.`ID_RESPOSTA` = `r`.`ID`))) join `tb_disciplinas` `d` on((`a`.`CODIGO` = `d`.`CODIGO`))) join `tb_alunos` `al` on((`a`.`MATRICULA` = `al`.`MATRICULA`))) join `tb_tempo` `s` on(((`a`.`ANO` = `s`.`ano`) and (`a`.`SEMESTRE` = `s`.`semestre`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_avaliacoes_admin`
--

/*!50001 DROP TABLE IF EXISTS `vw_avaliacoes_admin`*/;
/*!50001 DROP VIEW IF EXISTS `vw_avaliacoes_admin`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_avaliacoes_admin` AS select distinct `cat`.`CATEGORIA` AS `CATEGORIA`,`p`.`PERGUNTA` AS `PERGUNTA`,`av`.`ANO` AS `ANO`,`av`.`SEMESTRE` AS `SEMESTRE` from ((`tb_avaliacao` `av` join `tb_perguntas` `p` on((`p`.`ID` = `av`.`ID_PERGUNTA`))) join `tb_categoria` `cat` on((`cat`.`ID` = `p`.`ID_CATEGORIA`))) order by `av`.`ANO`,`av`.`SEMESTRE`,`p`.`ID_CATEGORIA`,`av`.`ID_PERGUNTA` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_comentarios`
--

/*!50001 DROP TABLE IF EXISTS `vw_comentarios`*/;
/*!50001 DROP VIEW IF EXISTS `vw_comentarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_comentarios` AS select `c`.`COMENTARIO` AS `comentario`,`c`.`SUGESTOES` AS `sugestoes`,`c`.`MATRICULA` AS `matricula`,`c`.`CODIGO` AS `codigo`,`s`.`semestre` AS `semestre`,`s`.`ano` AS `ano`,`s`.`flag_corrente` AS `flag_corrente` from (`tb_comentarios` `c` join `tb_tempo` `s` on(((`c`.`ANO` = `s`.`ano`) and (`c`.`SEMESTRE` = `s`.`semestre`)))) where (`s`.`flag_corrente` = 'SIM') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_import_alunos`
--

/*!50001 DROP TABLE IF EXISTS `vw_import_alunos`*/;
/*!50001 DROP VIEW IF EXISTS `vw_import_alunos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_import_alunos` AS select distinct `tb_import_alunos_matriculados`.`matricula` AS `matricula`,`tb_import_alunos_matriculados`.`nome` AS `nome` from `tb_import_alunos_matriculados` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_import_disciplinas`
--

/*!50001 DROP TABLE IF EXISTS `vw_import_disciplinas`*/;
/*!50001 DROP VIEW IF EXISTS `vw_import_disciplinas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_import_disciplinas` AS select distinct `tb_import_docentes_disciplinas`.`cod_disciplina` AS `cod_disciplina`,`tb_import_docentes_disciplinas`.`nome_disciplina` AS `nome_disciplina` from `tb_import_docentes_disciplinas` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_import_docentes`
--

/*!50001 DROP TABLE IF EXISTS `vw_import_docentes`*/;
/*!50001 DROP VIEW IF EXISTS `vw_import_docentes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_import_docentes` AS select distinct `tb_import_docentes_disciplinas`.`matricula_docente` AS `matricula_docente`,`tb_import_docentes_disciplinas`.`nome_docente` AS `nome_docente` from `tb_import_docentes_disciplinas` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_import_ofertas`
--

/*!50001 DROP TABLE IF EXISTS `vw_import_ofertas`*/;
/*!50001 DROP VIEW IF EXISTS `vw_import_ofertas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_import_ofertas` AS select distinct `tb_import_docentes_disciplinas`.`cod_disciplina` AS `codigo`,`tb_import_docentes_disciplinas`.`matricula_docente` AS `matricula`,`tb_tempo`.`semestre` AS `semestre`,`tb_tempo`.`ano` AS `ano` from (`tb_import_docentes_disciplinas` join `tb_tempo`) where (`tb_tempo`.`flag_corrente` = 'Sim') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_import_turma`
--

/*!50001 DROP TABLE IF EXISTS `vw_import_turma`*/;
/*!50001 DROP VIEW IF EXISTS `vw_import_turma`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_import_turma` AS select distinct `tb_tempo`.`ano` AS `ano`,`tb_tempo`.`semestre` AS `semestre`,`tb_import_alunos_matriculados`.`cod_disciplina` AS `codigo`,`tb_import_alunos_matriculados`.`matricula` AS `matricula`,'NÃO' AS `flag_avaliado` from (`tb_import_alunos_matriculados` join `tb_tempo`) where (`tb_tempo`.`flag_corrente` = 'Sim') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_oferta`
--

/*!50001 DROP TABLE IF EXISTS `vw_oferta`*/;
/*!50001 DROP VIEW IF EXISTS `vw_oferta`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_oferta` AS select `o`.`MATRICULA` AS `matricula`,`p`.`NOME` AS `nome`,`o`.`CODIGO` AS `codigo`,`d`.`DISCIPLINA` AS `disciplina`,`o`.`SEMESTRE` AS `semestre`,`o`.`ANO` AS `ano`,`s`.`flag_corrente` AS `flag_corrente` from (((`tb_oferta` `o` join `tb_disciplinas` `d` on((`d`.`CODIGO` = `o`.`CODIGO`))) join `tb_docentes` `p` on((`o`.`MATRICULA` = `p`.`MATRICULA`))) join `tb_tempo` `s` on(((`o`.`ANO` = `s`.`ano`) and (`o`.`SEMESTRE` = `s`.`semestre`)))) where (`s`.`flag_corrente` = 'Sim') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_oferta_historico`
--

/*!50001 DROP TABLE IF EXISTS `vw_oferta_historico`*/;
/*!50001 DROP VIEW IF EXISTS `vw_oferta_historico`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_oferta_historico` AS select `o`.`MATRICULA` AS `matricula`,`p`.`NOME` AS `nome`,`o`.`CODIGO` AS `codigo`,`d`.`DISCIPLINA` AS `disciplina`,`o`.`SEMESTRE` AS `semestre`,`o`.`ANO` AS `ano`,`s`.`flag_corrente` AS `flag_corrente` from (((`tb_oferta` `o` join `tb_disciplinas` `d` on((`d`.`CODIGO` = `o`.`CODIGO`))) join `tb_docentes` `p` on((`o`.`MATRICULA` = `p`.`MATRICULA`))) join `tb_tempo` `s` on(((`o`.`ANO` = `s`.`ano`) and (`o`.`SEMESTRE` = `s`.`semestre`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_perguntas`
--

/*!50001 DROP TABLE IF EXISTS `vw_perguntas`*/;
/*!50001 DROP VIEW IF EXISTS `vw_perguntas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_perguntas` AS select `a`.`ID` AS `id`,`a`.`PERGUNTA` AS `pergunta`,`b`.`ID` AS `id_categoria`,`b`.`CATEGORIA` AS `categoria`,(case when (`a`.`FLAG_ATIVO` = 'S') then 'Sim' when (`a`.`FLAG_ATIVO` = 'N') then 'Não' end) AS `flag_ativo` from (`tb_perguntas` `a` join `tb_categoria` `b` on((`a`.`ID_CATEGORIA` = `b`.`ID`))) order by `b`.`ID`,`a`.`FLAG_ATIVO` desc,`a`.`ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_relatorio_avaliacao`
--

/*!50001 DROP TABLE IF EXISTS `vw_relatorio_avaliacao`*/;
/*!50001 DROP VIEW IF EXISTS `vw_relatorio_avaliacao`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_relatorio_avaliacao` AS select `ofe`.`CODIGO` AS `codigo`,`dis`.`DISCIPLINA` AS `disciplina`,`ofe`.`MATRICULA` AS `matricula`,`doc`.`NOME` AS `docente`,`cat`.`CATEGORIA` AS `categoria`,`per`.`PERGUNTA` AS `pergunta`,`resp`.`RESPOSTA` AS `resposta`,`av`.`SEMESTRE` AS `semestre`,`av`.`ANO` AS `ano` from ((((((`tb_avaliacao` `av` left join `tb_perguntas` `per` on((`per`.`ID` = `av`.`ID_PERGUNTA`))) left join `tb_respostas` `resp` on((`resp`.`ID` = `av`.`ID_RESPOSTA`))) left join `tb_oferta` `ofe` on(((`ofe`.`CODIGO` = `av`.`CODIGO`) and (`ofe`.`ANO` = `av`.`ANO`) and (`ofe`.`SEMESTRE` = `av`.`SEMESTRE`)))) left join `tb_disciplinas` `dis` on((`ofe`.`CODIGO` = `dis`.`CODIGO`))) left join `tb_docentes` `doc` on((`ofe`.`MATRICULA` = `doc`.`MATRICULA`))) left join `tb_categoria` `cat` on((`cat`.`ID` = `per`.`ID_CATEGORIA`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_relatorio_comentarios`
--

/*!50001 DROP TABLE IF EXISTS `vw_relatorio_comentarios`*/;
/*!50001 DROP VIEW IF EXISTS `vw_relatorio_comentarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_relatorio_comentarios` AS select `com`.`COMENTARIO` AS `comentario`,`com`.`SUGESTOES` AS `sugestoes`,`com`.`ANO` AS `ano`,`com`.`SEMESTRE` AS `semestre`,`com`.`CODIGO` AS `codigo`,`disc`.`DISCIPLINA` AS `disciplina`,`doc`.`NOME` AS `nome` from (((`tb_comentarios` `com` join `tb_oferta` `of` on(((`com`.`CODIGO` = `of`.`CODIGO`) and (`com`.`SEMESTRE` = `of`.`SEMESTRE`) and (`com`.`ANO` = `of`.`ANO`)))) join `tb_docentes` `doc` on((`doc`.`MATRICULA` = `of`.`MATRICULA`))) join `tb_disciplinas` `disc` on((`disc`.`CODIGO` = `of`.`CODIGO`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_relatorio_quantitativo`
--

/*!50001 DROP TABLE IF EXISTS `vw_relatorio_quantitativo`*/;
/*!50001 DROP VIEW IF EXISTS `vw_relatorio_quantitativo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_relatorio_quantitativo` AS select `t`.`CODIGO` AS `codigo`,`d`.`DISCIPLINA` AS `disciplina`,`p`.`MATRICULA` AS `matricula`,`p`.`NOME` AS `nome`,`t`.`ANO` AS `ano`,`t`.`SEMESTRE` AS `semestre`,count(`t`.`MATRICULA`) AS `qtd_alunos`,(select count(`t2`.`MATRICULA`) from `tb_turma` `t2` where ((`t2`.`CODIGO` = `t`.`CODIGO`) and (`t2`.`ANO` = `t`.`ANO`) and (`t2`.`SEMESTRE` = `t`.`SEMESTRE`) and (`t2`.`FLAG_AVALIADO` = 'SIM'))) AS `qtd_alunos_avaliaram` from (((`tb_turma` `t` join `tb_oferta` `o` on(((`t`.`CODIGO` = `o`.`CODIGO`) and (`t`.`ANO` = `o`.`ANO`) and (`t`.`SEMESTRE` = `o`.`SEMESTRE`)))) join `tb_disciplinas` `d` on((`o`.`CODIGO` = `d`.`CODIGO`))) join `tb_docentes` `p` on((`o`.`MATRICULA` = `p`.`MATRICULA`))) group by `t`.`CODIGO`,`d`.`DISCIPLINA`,`p`.`MATRICULA`,`p`.`NOME`,`t`.`ANO`,`t`.`SEMESTRE` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_turma`
--

/*!50001 DROP TABLE IF EXISTS `vw_turma`*/;
/*!50001 DROP VIEW IF EXISTS `vw_turma`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_turma` AS select `t`.`MATRICULA` AS `matricula`,`a`.`NOME` AS `aluno`,`t`.`CODIGO` AS `codigo`,`d`.`DISCIPLINA` AS `disciplina`,`o`.`MATRICULA` AS `matricula_docente`,`p`.`NOME` AS `docente`,`t`.`FLAG_AVALIADO` AS `flag`,`s`.`semestre` AS `semestre`,`s`.`ano` AS `ano`,`s`.`flag_corrente` AS `corrente` from (((((`tb_turma` `t` join `tb_alunos` `a` on((`a`.`MATRICULA` = `t`.`MATRICULA`))) join `tb_disciplinas` `d` on((`t`.`CODIGO` = `d`.`CODIGO`))) join `tb_oferta` `o` on(((`o`.`CODIGO` = `t`.`CODIGO`) and (`o`.`ANO` = `t`.`ANO`) and (`o`.`SEMESTRE` = `t`.`SEMESTRE`)))) join `tb_docentes` `p` on((`o`.`MATRICULA` = `p`.`MATRICULA`))) join `tb_tempo` `s` on(((`t`.`ANO` = `s`.`ano`) and (`t`.`SEMESTRE` = `s`.`semestre`)))) where (`s`.`flag_corrente` = 'SIM') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_turma_historico`
--

/*!50001 DROP TABLE IF EXISTS `vw_turma_historico`*/;
/*!50001 DROP VIEW IF EXISTS `vw_turma_historico`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_turma_historico` AS select `t`.`MATRICULA` AS `matricula`,`a`.`NOME` AS `aluno`,`t`.`CODIGO` AS `codigo`,`d`.`DISCIPLINA` AS `disciplina`,`o`.`MATRICULA` AS `matricula_docente`,`p`.`NOME` AS `docente`,`t`.`FLAG_AVALIADO` AS `flag`,`s`.`semestre` AS `semestre`,`s`.`ano` AS `ano`,`s`.`flag_corrente` AS `corrente` from (((((`tb_turma` `t` join `tb_alunos` `a` on((`a`.`MATRICULA` = `t`.`MATRICULA`))) join `tb_disciplinas` `d` on((`t`.`CODIGO` = `d`.`CODIGO`))) join `tb_oferta` `o` on(((`o`.`CODIGO` = `t`.`CODIGO`) and (`o`.`ANO` = `t`.`ANO`) and (`o`.`SEMESTRE` = `t`.`SEMESTRE`)))) join `tb_docentes` `p` on((`o`.`MATRICULA` = `p`.`MATRICULA`))) join `tb_tempo` `s` on(((`t`.`ANO` = `s`.`ano`) and (`t`.`SEMESTRE` = `s`.`semestre`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_usuarios`
--

/*!50001 DROP TABLE IF EXISTS `vw_usuarios`*/;
/*!50001 DROP VIEW IF EXISTS `vw_usuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_usuarios` AS select concat(left(ucase(`tb_alunos`.`NOME`),1),substring_index(substr(lcase(`tb_alunos`.`NOME`),2,50),' ',1)) AS `nome_exibicao`,`tb_alunos`.`MATRICULA` AS `matricula`,`tb_alunos`.`senha` AS `senha`,'Aluno' AS `tipo` from `tb_alunos` union select concat(left(ucase(`tb_administradores`.`NOME`),1),substring_index(substr(lcase(`tb_administradores`.`NOME`),2,50),' ',1)) AS `Name_exp_5`,`tb_administradores`.`LOGIN` AS `login`,`tb_administradores`.`SENHA` AS `senha`,'Admin' AS `Admin` from `tb_administradores` union select concat(left(ucase(`tb_docentes`.`NOME`),1),substring_index(substr(lcase(`tb_docentes`.`NOME`),2,50),' ',1)) AS `Name_exp_9`,`tb_docentes`.`MATRICULA` AS `matricula`,`tb_docentes`.`SENHA` AS `senha`,'Docente' AS `Docente` from `tb_docentes` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-05 22:39:24
