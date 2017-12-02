<?php

	ob_start();

	$pagemaincontent = ob_get_contents();


	ob_end_clean();
	$titulo = 'Sistema de Avaliação de Disciplina e Docentes';

	include("master.php");
?>

<?php 
	$usuario = $_POST['txtMatricula'];
	$senha = $_POST['txtSenha'];
	$login = new Login();
?>
	<div class='container-fluid'>
		<div class="col-md-6 col-md-offset-3">
		<?php $login->entrar($usuario, $senha); 
		?>

		</div>
	</div>