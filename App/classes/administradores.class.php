<?php
	ini_set('default_charset', 'UTF-8');
	require_once "classes/conexao.class.php";
  	$conecta = new Conexao();

	class Administradores{


		function getAdmins(){
			
			
			//$reg = $this->total_reg;// total de registros exibidos por página

			$sql = "select login, nome, email from tb_administradores;";
			$result = mysql_query($sql);

			
			while ($row = mysql_fetch_array($result)){
				$rows[] = $row;
			}
			return $rows;
		}

		function delAdmin($login){
			$sql = "CALL sp_delete_admin('{$login}');";
			$result = mysql_query($sql);

			header("location:administradores.php");
		}

		function addAdmin($login, $nome, $email, $senha){
			$sql = "CALL SP_INSERT_ADMIN('{$login}','{$nome}','{$email}','{$senha}');";
			$result = mysql_query($sql);
			header("location:administradores.php");

		}

		
		
	}

	$conecta->desconecta();
?>