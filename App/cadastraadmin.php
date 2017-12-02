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
	$admin = new Administradores();
?>
<script>
function validarSenha(form){ 
	senha = document.form.txtpass.value;
	senhaRepetida = document.form.txtpassconf.value;
	login = document.form.txtlogin.value;
	nome = document.form.txtnome.value;
	email = document.form.txtemail.value;

	if ((login.length < 5) || (nome.length < 5) || (email.length < 8)){
		alert("Preencha os campos adequadamente!")
		return false;
	}

	if ((senha.length < 5) || (senhaRepetida.length < 5)){
		alert("Insira uma senha válida!")
		document.form.senha.focus();	
		return false;
	}

	if (senha != senhaRepetida){
		alert("As senhas não conferem! Insira novamente");
		document.form.repetir_senha.focus();	
		return false;
	}



	document.getElementById('form').submit();

}
</script>

	<div class='container-fluid'>
		<div class="col-md-4 col-md-offset-4">
			<form action="salvaadmin.php" method="post" name="form" id="form">
			  <div class="form-group">
			    <label for="txtlogin">Login</label>
			    <input type='text' name='txtlogin' class='form-control' id='txtlogin'>
			  </div>
			  <div class="form-group">
			    <label for="txtnome">Nome</label>
			    <input type='text' name='txtnome' class='form-control' id='txtnome'>
			  </div>
			  <div class="form-group">
			    <label for="txtemail">Email</label>
			    <input type='text' name='txtemail' class='form-control' id='txtemail'>
			  </div>
			  <div class="form-group">
			    <label for="txtpass">Senha</label>
			    <input type='password' name='txtpass' class='form-control' id='txtpass'>
			  </div>
			  <div class="form-group">
			    <label for="txtpassconf">Confirme a Senha</label>
			    <input type='password' name='txtpassconf' class='form-control' id='txtpassconf'>
			  </div>
			  	<div class="form-group">
			  	<input type="button" onclick="validarSenha(form);" value="Cadastrar" class="btn btn-primary btn-sm btn-block">
			  	</div>
		    </form>
		</div>
	</div>

	
	
			  		