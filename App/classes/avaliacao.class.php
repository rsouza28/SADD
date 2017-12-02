<?php
	ini_set('default_charset', 'UTF-8');
	require_once "classes/conexao.class.php";
  	$conecta = new Conexao();

  	
	class Avaliacao{		
		

		function listAvaliacao($matricula, $cod, $cat){

			$sql = "select id, id_categoria, categoria, id_pergunta, pergunta, 
					id_resposta, resposta, codigo, matricula from vw_avaliacao 
					where matricula ='{$matricula}' and codigo = '{$cod}' and id_categoria = {$cat};";

			$result = mysql_query($sql);

			while ($row = mysql_fetch_array($result)){
				$rows[] = $row;
			}

			return $rows;
			//return $sql;

		}

		function listAvaliacaoControle($ano, $sem, $cat){
			$sql = "select pergunta, categoria from vw_avaliacoes_admin where ano = {$ano} and semestre = {$sem} and categoria = '{$cat}';";
			$result = mysql_query($sql);

			while ($row = mysql_fetch_array($result)){
				$rows[] = $row;
			}

			return $rows;

		}

		function gravaAvaliacao($id, $resp){
			$proc = "CALL sp_responde_avaliacao({$id}, {$resp});";
			$result = mysql_query($proc);


		}

		function flagAvaliadoSim($mat, $cod){
			$proc = "CALL sp_avaliacao_feita('{$mat}', '{$cod}');";
			$result = mysql_query($proc);
			header('Location:homealuno.php?av=ok');

		}

		function gerarCarga(){
			$proc = "CALL sp_carrega_dados()";
			$result = mysql_query($proc);

			if($result){
				session_start("login");
				$_SESSION["avaliacao"] = true;
				header("location: carga.php?id=dados");
			}

		}

		function gerarAvaliacoes(){

			$proc = "CALL sp_gera_avaliacao()";
			$result = mysql_query($proc);

			if($result){
				
				session_start("login");
				$_SESSION["avaliacao"] = false;
				$_SESSION["arq_count"] = 0;
				$_SESSION["arq_alunos"] = false;
				$_SESSION["arq_disc"] = false;
			}


		}

		function relatorioQtdAvaliacoes($ano, $sem){
			$sql = "select disciplina, nome, qtd_alunos, qtd_alunos_avaliaram from vw_relatorio_quantitativo where ano = {$ano} and semestre = {$sem};";
			$result = mysql_query($sql);

			while ($row = mysql_fetch_array($result)){
				$rows[] = $row;
			}

			return $rows;
		}

		function geraRelatorioCsv($ano, $sem){
			$proc = "CALL sp_exporta_arquivo({$ano}, {$sem});";
			$result = mysql_query($proc);

			while(!$result){
				$false = false;
			}

			return true;

		}

		function geraComentariosCsv($ano, $sem){
			$proc = "CALL sp_exporta_comentarios({$ano}, {$sem});";
			$result = mysql_query($proc);

			while(!$result){
				$false = false;
			}

			return true;

		}
		
	}

	$conecta->desconecta();
?>