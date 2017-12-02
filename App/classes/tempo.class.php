<?php
	ini_set('default_charset', 'UTF-8');
	require_once "classes/conexao.class.php";
  	$conecta = new Conexao();

	class Tempo{

		function add($sem, $ano){

			$proc = mysql_query($query = "CALL sp_insert_tempo($sem, $ano, $flag);");


		}

		function selecionaSemestre($sem, $ano){

			$proc = mysql_query($query = "CALL sp_seleciona_semestre($sem, $ano);");
			header("location:tempo.php?set=true");
			//echo "PORRA";
		}

		public function verificaTempo(){

			$proc = mysql_query($query = "CALL sp_cria_periodos();");
			if ($proc)
				return true;
			else
				return false;

		}

		function getPeriodos(){
			$sql = "select ano, semestre, flag_corrente from tb_tempo order by flag_corrente desc, ano, semestre ;";
			$result = mysql_query($sql);

			while($row = mysql_fetch_array($result)){
				$rows[] = $row;
			}

			return $rows;

		}

		function getTempos(){
			$sql = "select ano, semestre, flag_corrente from tb_tempo where exists (select 1 from tb_oferta where tb_oferta.ano = tb_tempo.ano and tb_oferta.semestre = tb_tempo.semestre) order by ano, semestre ;";
			$result = mysql_query($sql);

			while($row = mysql_fetch_array($result)){
				$rows[] = $row;
			}

			return $rows;
		}

		function getPeriodoCorrente(){
			$sql = "select  CONCAT(convert(semestre, char(1)), 'ºsem / ' , convert(ano, char(4))) corrente from tb_tempo where flag_corrente = 'SIM';";
			$result = mysql_query($sql);
			$row = mysql_fetch_array($result);

			return $row["corrente"];

		}

		function getTemposAvaliacoes(){
			$sql = "select ano, semestre, flag_corrente from tb_tempo where exists (select distinct ano, semestre from tb_avaliacao av where av.ano = tb_tempo.ano and av.semestre = tb_tempo.semestre) order by ano, semestre;";
			$result = mysql_query($sql);

			while($row = mysql_fetch_array($result)){
				$rows[] = $row;
			}

			return $rows;
		}

		
	}

	$conecta->desconecta();
?>