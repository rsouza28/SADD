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

	$perg = new Perguntas();
	$resp = new Respostas();
	$cat = new Categoria();
?>
	<div class='container-fluid'>
		
		
		
	<div class="col-md-8 col-md-offset-2">
	<div class="alert alert-danger text-center" role="alert">
					  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
					  <span class="sr-only">Error:</span>Para inserir uma nova resposta clique <a href="cadastraresposta.php">aqui.</a>
		</div>
	
		<div class="table-responsible">
		<?php foreach($cat->getCategorias() as $valorCat){ ?>
			<div class="panel panel-primary">
			  <div class="panel-heading"><?php echo $valorCat["categoria"]; ?> (
			  	<span class="glyphicon glyphicon-ok-sign green" aria-hidden="true"></span> <?php echo $resp->totalAtivas($valorCat["id"]); ?>
			  	<span class="glyphicon glyphicon-remove-sign red" aria-hidden="true"></span> <?php echo $resp->totalDesativas($valorCat["id"]); ?>
			  	)
			  </div>
			  <div class="panel-body">
			    <!-- LISTA AS PERGUNTAS-->
			    <div class="table-responsive">
			    	<table class="table table-striped">
			    	<thead>
			    		<th>#</th>
			    		<th>Respostas</th>
			    		<th>Status</th>
			    		<th>Ação</th>
			    	</thead>
			    	<tbody>
			    	<?php 
			    		$i = 0;
						foreach($resp->getTodasRespostasCategoria($valorCat["id"]) as $valor) { 
							$i++; ?>

						<tr>
						<td><?php echo $i; ?></td>
						<td ><?php echo $valor["resposta"]; ?></td>
						<td>
							<?php if ($valor["flag_ativo"] == "S"){ ?>
									<button type="button" class="btn btn-info btn-xs">Ativa</button>
							<?php } else { ?>
									<button type="button" class="btn btn-danger btn-xs">Inativa</button>
								<?php }?>
						<td>
							<?php if ($valor["flag_ativo"] == "S"){ ?>
								<a href="salvaresposta.php?cod=2&id=<?php echo $valor['id'];?>">
									<button type="button" class="btn btn-default btn-xs">Desativar</button>
								</a>
							<?php } else { ?>
								<a href="salvaresposta.php?cod=1&id=<?php echo $valor['id'];?>">
									<button type="button" class="btn btn-default btn-xs">Ativar</button>
								</a>
								<?php }?>

						</td>
						</tr>	
						
					<?php }?>

					</tbody>	
					</table>
				</div>	
				</div>
			</div>

				<?php }  ?>

