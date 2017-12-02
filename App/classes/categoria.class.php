<?php
	ini_set('default_charset', 'UTF-8');
	require_once "classes/conexao.class.php";
  	$conecta = new Conexao();

	class Categoria{

		function add($cat){


			$proc = mysql_query($query = "CALL sp_insert_categoria('$cat');") or die(mysql_error());
			
		}

		function getCategorias(){
			$sql = "select id, categoria from tb_categoria;";
			$result = mysql_query($sql);

			while($row = mysql_fetch_array($result)){
				$rows[] = $row;
			}

			return $rows;
		}

		function teste(){
			echo "teste categoria";
		}
	}

	$conecta->desconecta();
?>