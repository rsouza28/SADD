<?php

	ob_start();

	$pagemaincontent = ob_get_contents();


	ob_end_clean();
	$titulo = 'Sistema de Avaliação de Disciplina e Docentes';

	include("master.php");
?>
<?php session_start("login"); 
	$dica_senha = "A senha é formada pelas três primeiras letras do seu nome, o caractere '#' e os 4 últimos números da sua matrícula.";
	$dica_matricula = "Número de matrícula";

	$login = new Login();
	if($login->redirecionaAluno()){
	}

	if (isset($_GET["login"])){
		$log = $_GET["login"];
	}


?>

<script>


/*$(document).ready(function(){
	
    
});*/

$(document).ready(function() {
	document.getElementById('txtMatricula').focus();
	$('[data-toggle="tooltip"]').tooltip();
	$("#btnEntrar").click(function (e) {
			//if($("input").length < ){
			var matricula = $("#txtMatricula").val().length;	
				if(matricula < 5)	{
					alert("Insira uma matricula válida.");
					return false;
				}
			
			var senha = $("#txtSenha").val().length;
				if(senha < 5)	{
					alert("Insira uma senha válida.");
					return false;
				}
	
    });
});


</script>

	<div class='container-fluid'>
		<div class="col-md-6 col-md-offset-3">
			<?php if($log == "false"){ ?>	    			
				<div class="alert alert-danger text-center" role="alert">
				  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
				  <span class="sr-only">Error:</span>
				  Login ou senha inválido!
				</div>
			<?php } ?>

			<div class="well well-lg">	
			<?php if($_SESSION["logado"] <> 1){ ?>
				<div class="text-center">
					<form class="form-inline" action="logar.php" method="post" name="form" id="form">
					<p class="text-center" style="font-size:18px;"> LOGIN </p>
					  <div class="form-group">
					    <label class="sr-only" for="txtMatricula">Matrícula</label>
					    <input type="text" class="form-control input-sm" id="txtMatricula" name="txtMatricula" placeholder="Matrícula">
					    <a href="#" data-toggle="tooltip" title="<?php echo $dica_matricula;?>">[?]</a>
					  </div>
					  <div class="form-group">
					    <label class="sr-only" for="txtSenha">Senha</label>
					    <input type="password" class="form-control input-sm" name="txtSenha" id="txtSenha" placeholder="Senha">

						<a href="#" data-toggle="tooltip" title="<?php echo $dica_senha;?>">[?]</a>

					  </div>
					  <button style="text-align:center;" type="submit" class="btn btn-primary btn-sm" id="btnEntrar" name="btnEntrar" onclick="teste();">Entrar</button>
					</form>
				</div>
			<?php } else { ?>
					<h3> Bem vindo ao SADD. </h3>
			<?php } ?>
			

			</div>

		</div>

  	</div>



<?php  /*session_start("login");
echo "sessão: ";
echo $_SESSION["logado"];
echo "<p>matricula: ";
echo $_SESSION["matricula"];
echo "<p>tipo ";
echo $_SESSION["tipo"];
*/



?>