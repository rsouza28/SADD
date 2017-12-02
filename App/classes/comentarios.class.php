<?php
	ini_set('default_charset', 'UTF-8');
	require_once "classes/conexao.class.php";
  	$conecta = new Conexao();

	class Comentarios{

		function insereComentarios($com, $sug, $mat, $cod){
			$proc = "call sp_insert_comentarios('{$com}', '{$sug}', '{$mat}', '{$cod}');";
			$result = mysql_query($proc)or die(mysql_error());		

		}

		function getComentario($mat, $cod){
			$sql = "select comentario from vw_comentarios where matricula = '{$mat}' and codigo = '{$cod}';";
			$result = mysql_query($sql);
			$row = mysql_fetch_array($result);

			return $row["comentario"];
		}

		function getSugestao($mat, $cod){
			$sql = "select sugestoes from vw_comentarios where matricula = '{$mat}' and codigo = '{$cod}';";
			$result = mysql_query($sql);
			$row = mysql_fetch_array($result);

			return $row["sugestoes"];
		}


	}

	$conecta->desconecta();
?>