<?php

	ob_start();

	$pagemaincontent = ob_get_contents();


	ob_end_clean();
	$titulo = 'Sistema de Avaliação de Disciplina e Docentes';

	include("master.php");
?>


<?php 
	$login = new Login();
	if($login->verificaAdmin($_SESSION["tipo"])){
    	}
	$code = $_REQUEST['cod'];
	$resp = new Respostas();



	switch ($code){
	case 1:
			$id = $_REQUEST['id'];
			echo "Ativa a resposta ".$id;
			$resp->ativa($id);
			break;
	case 2: 
			$id = $_REQUEST['id'];
			echo "Desativa a resposta ".$id;
			$resp->desativa($id);
			break;
	default:

			
			$resposta = $_POST["txtResposta"];
			$categoria = $_POST["selCategoria"];
			$valor = $_POST["selValor"];
			$resp->add($resposta, $valor, $categoria);
			echo "Inseriu nova resposta  ";
			echo $resposta." - ".$categoria;
			break;

		
	}
?>

