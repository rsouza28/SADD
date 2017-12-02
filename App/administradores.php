<?php

	ob_start();

	$pagemaincontent = ob_get_contents();


	ob_end_clean();
	$titulo = 'Sistema de Avaliação de Disciplina e Docentes';

	include("master.php");
?>
<?php session_start("login"); 
	$login = new Login();
	if($login->verificaAdmin($_SESSION["tipo"])){
    	}

	$admin = new Administradores();

	if (isset($_GET["del"])){
	$login = $_GET["del"];
	

	$admin->delAdmin($login);
}

?>

	<div class='container-fluid'>
		
		<div class="col-md-8 col-md-offset-2">
		<div class="alert alert-danger text-center" role="alert">
					  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
					  <span class="sr-only">Error:</span>Para cadastrar um novo administrador clique <a href="cadastraadmin.php">aqui.</a>
		</div>
		<div class="col-md-6 col-md-offset-3">

		
			<div class="table-responsive">	
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Login/Matricula </th>
							<th>Nome </th>
							<th>Email</th>
							<th>Ação</th>
						</tr>
					</thead>
					<tbody>
						<?php
					foreach($admin->getAdmins() as $valorAdmin){ ?>
						<tr>
							<td><?php echo $valorAdmin["login"] ?></td>
							<td><?php echo $valorAdmin["nome"] ?></td>
							<td><?php echo $valorAdmin["email"] ?></td>
							<td><?php if($valorAdmin["login"] != "admin"){ ?>
							<a href="?del=<?php echo $valorAdmin["login"];?>"><button class="btn btn-xs btn-danger" id="btnTornar" >Remover</button></a>
							<?php } ?>
							</td>
						</tr>
					<?php } ?>
					

				

					</tbody>
				</table>			
			</div>
			
		</div>

  	</div>



