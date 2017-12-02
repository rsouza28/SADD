<?php
	ini_set('default_charset', 'UTF-8');
	require_once "classes/conexao.class.php";
  	$conecta = new Conexao();

	class Perguntas{

		function add($pergunta, $cat, $flag = 'N'){


			$proc = mysql_query($query = "CALL sp_insert_pergunta('$pergunta','$flag',$cat);")or die(mysql_error());
			header('Location:perguntas.php');
			echo $query."<p>";
			
		}

		function ativa($id){

			$proc = mysql_query($query = "CALL sp_flag_ativo('tb_perguntas', 'S', $id);");
			header('Location:perguntas.php');
			echo $query."<p>";

		}

		function desativa($id){
			$proc = mysql_query($query = "CALL sp_flag_ativo('tb_perguntas', 'N', $id);");
			header('Location:perguntas.php');
			echo $query."<p>";
		}

		function teste(){
			$result = mysql_query("select nome as re from tb_alunos where matricula = '20112210032'");
			$row = mysql_fetch_array($result);

			echo "ola-> ".$row["re"]."<p>";
			
		}

		function getPerguntas(){
			$query = "select id, pergunta, categoria, flag_ativo from vw_perguntas";
			$result = mysql_query($query);


			while ($row = mysql_fetch_array($result)){
				$rows[] = $row;
			}
			

			return $rows;
		}

		function totalPerguntas(){
			$query = "select count(1) as total from tb_perguntas";
			$result = mysql_query($query);
			$row = mysql_fetch_array($result);

			return $row["total"];
		}

		function totalAtivas($cat){
			$query = "select count(1) as total from tb_perguntas where flag_ativo = 'S' and id_categoria = {$cat}";
			$result = mysql_query($query);
			$row = mysql_fetch_array($result);

			return $row["total"];
		}

		function totalDesativas($cat){
			$query = "select count(1) as total from tb_perguntas where flag_ativo = 'N'  and id_categoria = {$cat}";
			$result = mysql_query($query);
			$row = mysql_fetch_array($result);

			return $row["total"];
		}

		function getPerguntasCategoria($cat){
			$query = "select id, pergunta from tb_perguntas where flag_ativo = 'S' and id_categoria = {$cat} ";
			$result = mysql_query($query);

			while($row = mysql_fetch_array($result)){
				$rows[] = $row;
			}

			return $rows;
		}

		function getTodasPerguntasCategoria($cat){
			$query = "select id, pergunta, flag_ativo from tb_perguntas where id_categoria = {$cat}";
			$result = mysql_query($query);

			while($row = mysql_fetch_array($result)){
				$rows[] = $row;
			}

			return $rows;
		}



	}

	$conecta->desconecta();
?>