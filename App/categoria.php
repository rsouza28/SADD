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

	$tempo = new Tempo();

?>

<?php

if (isset($_GET["set"]))
	$set = $_GET["set"];

if (isset($_GET["sem"])){
	$sem = $_GET["sem"];
	$ano = $_GET["ano"];	
	

	$tempo->selecionaSemestre($sem, $ano);
}

?>

<div class="col-md-8 col-md-offset-2">
		<div class="table-responsible">
		<?php if($set == 'true'){ ?>
		<div class="alert alert-danger text-center" role="alert">ATENÇÃO: Você alterou o período letivo de avaliação.
		<?php } ?>

			  	</div>
			<div class="panel panel-primary">

			  <div class="panel-heading">
			  Categoria
			  </div>
			  
			  	
			  

			  <table class="table table-hover">
  				<thead>
  					<th>#</th>
  					<th>Categoria</th>
  					<th>Semestre</th>
  					<th>Status</th>
  				</thead>
  				<tbody>
					<?php $i = 1;
						foreach ($tempo->getPeriodos() as $valorTempo) { 
						
						?>

					<tr>
						<td><?php echo $i++ ;?></td>
						<td><?php echo $valorTempo["ano"] ;?></td>
						<td><?php echo $valorTempo["semestre"] ;?></td>
					
						<?php if($valorTempo["flag_corrente"] == 'Não'){?>
						<td><a href="?sem=<?php echo $valorTempo["semestre"];?>&ano=<?php echo $valorTempo["ano"] ;?>"><button class="btn btn-xs btn-danger" id="btnTornar" >Tornar corrente</button></a></td>
						<?php }
							else {?>
						<td><button class="btn btn-xs btn-success" id="btnTornar" >Corrente</button></td>
						<?php }?>
						

					</tr>
					<?php }?>
  					
  				</tbody>
			  </table>
	  	</div>
	</div>
</div>

