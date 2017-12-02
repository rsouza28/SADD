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
values (ltrim(rtrim(l)), ltrim(rtrim(n)), ltrim(rtrim(e)), ltrim(rtrim(md5(s)))); 
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-02  1:37:13
