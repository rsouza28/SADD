<?php
	ini_set('default_charset', 'UTF-8');
	require_once "classes/conexao.class.php";
  	$conecta = new Conexao();

	class Respostas{

		function add($resposta, $valor, $cat,  $flag = 'N'){


			$proc = mysql_query($query = "CALL sp_insert_resposta('$resposta','$flag', $valor, $cat);")or die(mysql_error());
			header('Location:respostas.php');
			echo $query."<p>";
			
		}

		function ativa($id){

			$proc = mysql_query($query = "CALL sp_flag_ativo('tb_respostas', 'S', $id);");
			header('Location:respostas.php');
			echo $query."<p>";

		}

		function desativa($id){
			$proc = mysql_query($query = "CALL sp_flag_ativo('tb_respostas', 'N', $id);");
			header('Location:respostas.php');
			echo $query."<p>";
		}

		function getRespostas($cat){
			$query = "select id, resposta from tb_respostas where flag_ativo = 'S' and id_categoria = {$cat}";
			$result = mysql_query($query);

			while($row = mysql_fetch_array($result)){
				$rows[] = $row;
			}

			return $rows;

		}

		function getTodasRespostasCategoria($cat){
			$query = "select id, resposta, flag_ativo, valor from tb_respostas where id_categoria = {$cat}";
			$result = mysql_query($query);

			while($row = mysql_fetch_array($result)){
				$rows[] = $row;
			}

			return $rows;

		}

		function totalAtivas($cat){
			$query = "select count(1) as total from tb_respostas where flag_ativo = 'S' and id_categoria = {$cat}";
			$result = mysql_query($query);
			$row = mysql_fetch_array($result);

			return $row["total"];
		}

		function totalDesativas($cat){
			$query = "select count(1) as total from tb_respostas where flag_ativo = 'N'  and id_categoria = {$cat}";
			$result = mysql_query($query);
			$row = mysql_fetch_array($result);

			return $row["total"];
		}


		

		






	}

	$conecta->desconecta();
?>