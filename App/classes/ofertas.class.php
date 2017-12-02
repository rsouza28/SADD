<?php
	ini_set('default_charset', 'UTF-8');
	require_once "classes/conexao.class.php";
  	$conecta = new Conexao();

	class Ofertas{
		public $total_reg = 15;

		function getDisciplina($oferta){
			$sql = "select codigo, disciplina, matricula, nome from vw_oferta where codigo = '{$oferta}';";
			$result = mysql_query($sql);
			$row = mysql_fetch_array($result);


			return $row["disciplina"];
		}

		function getDocente($oferta){
			$sql = "select codigo, disciplina, matricula, nome from vw_oferta where codigo = '{$oferta}';";
			$result = mysql_query($sql);
			$row = mysql_fetch_array($result);


			return $row["nome"];
		}

		function getTempo($oferta){
			$sql = "select semestre, ano from vw_oferta where codigo = '{$oferta}';";
			$result = mysql_query($sql);
			$row = mysql_fetch_array($result);


			return $row["semestre"]."º semestre/".$row["ano"];
		}

		function getOfertas($sem, $ano, $pag){
			$reg = $this->total_reg;
			$inicio = ($reg * $pag) - $reg;

			$sql = "select matricula, upper(nome) as nome, codigo, upper(disciplina) as disciplina from vw_oferta_historico 
					where ano = {$ano} and semestre = {$sem} order by nome limit {$inicio}, {$reg} ;";

			$result = mysql_query($sql);
			while ($row = mysql_fetch_array($result)){
				$rows[] = $row;
			}

			return $rows;
		}

		function getTotalPaginas($ano, $sem){
			$sql = "select codigo from vw_oferta_historico where ano = {$ano} and semestre = {$sem} ;";
			$result = mysql_query($sql);
			$row = mysql_num_rows($result);

			

			return ceil($row/$this->total_reg);
		}


		
		
	}

	$conecta->desconecta();
?>