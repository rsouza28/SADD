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

	$login = $_POST['txtlogin'];
	$nome = $_POST['txtnome'];
	$mail = $_POST['txtemail'];
	$pass = $_POST['txtpass'];
	$admin = new Administradores();

	$admin->addAdmin($login, $nome, $mail, $pass);

	/*switch ($code){
	case 1:
			$id = $_REQUEST['id'];
			echo "Ativa a pergunta a pergunta ".$id;
			$perg->ativa($id);
			break;
	case 2: 
			$id = $_REQUEST['id'];
			echo "Desativa a pergunta ".$id;
			$perg->desativa($id);
			break;
	default:

			
			$pergunta = $_POST["txtPergunta"];
			$categoria = $_POST["selCategoria"];
			$perg->add($pergunta, $categoria);
			echo "Inseriu nova pergunta";
			echo $pergunta." - ".$categoria;
			break; 

		
	}*/
?>

