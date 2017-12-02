<?php
require_once("classes/tempo.class.php");
class Login {

	//Variaves
	private $txtMatricula;
	private $txtSenha;
	private $nomeTabela;
	private $senha;
	public $matricula;

	function entrar($mat, $senha){
		$sql = "select count(1) as logar from vw_usuarios where matricula = '{$mat}' and senha = '{$senha}';";
		$result = mysql_query($sql);
		$row = mysql_fetch_array($result);
		//echo $sql;
		//echo $row["logar"];
		
		if($row["logar"]==1){
			$sql2 = "select nome_exibicao, matricula, tipo from vw_usuarios where matricula = '{$mat}' and senha = '{$senha}';";
			$result2 = mysql_query($sql2);
			$row2 = mysql_fetch_array($result2);

			session_start("login");
			$_SESSION["nome"] = $row2["nome_exibicao"];
			$_SESSION["matricula"] = $row2["matricula"];
			$_SESSION["tipo"] = $row2["tipo"];
			$_SESSION["logado"] = 1;
			

			if ($_SESSION["tipo"] == "Aluno"){
				header("location:homealuno.php");
			}
			else {
				header("location:index.php");	
			}
			
		}
		else{
			header("location:index.php?login=false");
		}

	}

	

	function verifica(){

		session_start("login");

		if (isset($_SESSION["matricula"]) and isset($_SESSION["logado"])){
			global $MatriculaGlobal;
			return true;
		}

		else{		
			
				header("Location: index.php");
			return false;
			exit;
		}
	}

	function redirecionaAluno(){
		if (isset($_SESSION["tipo"]) and $_SESSION["tipo"] == "Aluno"){
				header("location:homealuno.php");
			}
			
	}

	function tipoUsuario(){
		$type = "Nada";
		//session_start("login");
		if (isset($_SESSION["tipo"])){
				switch ($_SESSION["tipo"]){
				case "Aluno": $type = "Aluno" ; break;
				case "Admin": $type = "Admin"; break;
				case "Docente": $type = "Docente" ; break;
			} 
			
		}
		return $type;	

	}



	function logout(){
		$_SESSION["arq_count"] = 0;
		session_start("login");

		session_destroy();
		header("location:index.php");

	}

	function verificaAluno($tipo){
		session_start("login");
		if (!(isset($_SESSION["tipo"]) and $_SESSION["tipo"] == "Aluno")){
				header("location:index.php");
			}
	}

	function verificaAdmin($tipo){
		session_start("login");
		if (!(isset($_SESSION["tipo"]) and $_SESSION["tipo"] == "Admin")){
				header("location:index.php");
			}

		$tempo = new Tempo();
		$tempo->verificaTempo();
	}




}
?>