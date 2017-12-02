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

	$oferta = new Ofertas();
	$tempo = new Tempo();

	if (isset($_GET["ano"])){
		$ano = $_GET["ano"];
		$sem = $_GET["sem"];	
		$pag = $_REQUEST["pag"];

		//echo $ano." - ".$sem." - ".$pag;
	}
	


?>



	<div class='container-fluid'>
		<div class="col-md-6 col-md-offset-3">
		
			<div class="table-responsive">	
				<div class="text-center">
				<h3>Disciplinas e Docentes</h3>
					<select onChange="window.location.href=this.value">
					<option>-- Selecione um período --</option>
					<?php foreach ($tempo->getTempos() as $valorTempo) { ?>				
						<option value="?ano=<?php echo $valorTempo["ano"] ;?>&sem=<?php echo $valorTempo["semestre"] ;?>&pag=1"> <?php echo $valorTempo["semestre"] ;?>º sem/<?php echo $valorTempo["ano"] ;?></a></option>
					<?php } ?>
					</select>
				</div>
				<?php if (isset($_GET["ano"])){ ?>
				<p>
				<h3 class="text-center"> <?php echo $sem;?>º semestre/<?php echo $ano;?></h3>
				<p>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Codigo </th>
							<th> Disciplina </th>
							<th> Docente</th>
							<th> Matricula</th>
						</tr>
					</thead>
					<tbody>

					<?php $i = 1;
						foreach ($oferta->getOfertas($sem, $ano, $pag) as $valorOfe) { 
							if (($i % 2) == 0)
								 $color = "";
							else
								 $color = "warning";


					?>
						<tr class="<?php echo $color ;?>">
							<td><?php echo $valorOfe["codigo"];?></td>
							<td><?php echo $valorOfe["disciplina"];?></td>
							<td><?php echo $valorOfe["nome"];?></td>
							<td><?php echo $valorOfe["matricula"];?></td>
						</tr> 
					
					<?php $i++;
					} ?>

					</tbody>
				</table>
				<div class="text-center">
				<?php $numPaginas = $oferta->getTotalPaginas($ano, $sem); ?>
				<!-- paginação -->
						<nav>
						  <ul class="pagination">
						    <?php if($pag >1 ){ ?>
						    <li>
						      <a href="?ano=<?php echo $ano;?>&sem=<?php echo $sem;?>&pag=<?php echo $pag-1;?>"aria-label="Previous">  
						      	<span aria-hidden="true">&laquo; </span> </a>
						     </li>
						    <?php } ?>


						    <?php for($i = 1; $i < $numPaginas + 1; $i++) { 
						    		if ($pag == $i)
						    			$active ="active";
						    		else
						    			$active = "";
						    	?>

						    	<li class="<?php echo $active;?>"><a href="?ano=<?php echo $ano;?>&sem=<?php echo $sem;?>&pag=<?php echo $i;?>"><?php echo $i;?></a></li>
						    <?php }?>

						    <?php if($pag < $numPaginas ){ ?>
						    <li>
						    	<a href="?ano=<?php echo $ano;?>&sem=<?php echo $sem;?>&pag=<?php echo $pag+1;?>" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span></a>
						    </li>
						    <?php } ?>

						  </ul>
						</nav>
				</div>
				<?php } ?>
			</div>
		
		</div>

  	</div>



