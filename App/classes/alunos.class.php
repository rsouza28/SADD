<?php
	ini_set('default_charset', 'UTF-8');
	require_once "classes/conexao.class.php";
  	$conecta = new Conexao();


	class Alunos{
		
		public $total_reg = 25;


		function getNome($matricula){
			$sql = "select nome from tb_alunos where matricula = {$matricula};";
			$result = mysql_query($sql);
			$row = mysql_fetch_array($result);


			return $row["nome"];


		}

		function getMatricula($matricula){
			$sql = "select matricula from tb_alunos where matricula = {$matricula};";
			$result = mysql_query($sql);
			$row = mysql_fetch_array($result);


			return $row["matricula"];


		}

		function getAlunos($pag){
			
			
			$reg = $this->total_reg;// total de registros exibidos por página

			if (is_null($pag)){
				$pag = 0;
				$inicio = 0;
			}
			else{
				$pag = $pag ;
				$inicio = ($reg * $pag) - $reg;
			}

			$sql = "select matricula, upper(nome) as nome, ano_ingresso, semestre_ingresso from tb_alunos limit {$inicio}, {$reg} ; ";
			$result = mysql_query($sql);

			
			while ($row = mysql_fetch_array($result)){
				$rows[] = $row;
			}
			return $rows;
		}
		
		function getTotalAlunos(){
			$sql = "select matricula, nome, ano_ingresso, semestre_ingresso from tb_alunos ";
			$result = mysql_query($sql);
			$row = mysql_num_rows($result);

			return $row;
		}

		function getTotalPaginas(){
			$sql = "select matricula, nome, ano_ingresso, semestre_ingresso from tb_alunos ";
			$result = mysql_query($sql);
			$row = mysql_num_rows($result);

			

			return ceil($row/$this->total_reg);
		}

		
	}

	$conecta->desconecta();
?>