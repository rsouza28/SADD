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

	$alunos = new Alunos();

	$ordem = $_REQUEST["order"];
	$pag = $_GET["pag"];
?>



	<div class='container-fluid'>
		<div class="col-md-6 col-md-offset-3">
		
			<div class="table-responsive">	
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Matricula </th>
							<th> Nome </th>
							<th> Ano Ingresso</th>
						</tr>
					</thead>
					<tbody>
						<?php
					foreach($alunos->getAlunos($pag, $ordem) as $valorAluno){ ?>
						<tr>
							<td><?php echo $valorAluno["matricula"] ?></td>
							<td><?php echo $valorAluno["nome"] ?></td>
							<td><?php echo $valorAluno["ano_ingresso"] ?></td>
						</tr>
					<?php } ?>
					

				

					</tbody>
				</table>			
			</div>
			<div class="text-center">
			<?php $numPaginas = $alunos->getTotalPaginas(); ?>
			<!-- paginação -->
					<nav>
					  <ul class="pagination">
					    <?php if($pag >1 ){ ?>
					    <li>
					      <a href="?pag=<?php echo $pag-1;?>"aria-label="Previous">  
					      	<span aria-hidden="true">&laquo; </span> </a>
					     </li>
					    <?php } ?>


					    <?php for($i = 1; $i < $numPaginas + 1; $i++) { 
					    		if ($pag == $i)
					    			$active ="active";
					    		else
					    			$active = "";
					    	?>

					    	<li class="<?php echo $active;?>"><a href="?pag=<?php echo $i;?>"><?php echo $i;?></a></li>
					    <?php }?>

					    <?php if($pag < $numPaginas ){ ?>
					    <li>
					    	<a href="?pag=<?php echo $pag+1;?>" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span></a>
					    </li>
					    <?php } ?>

					  </ul>
					</nav>
			</div>
		</div>

  	</div>



