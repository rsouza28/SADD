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

	$av = new Avaliacao();
	$tempo = new Tempo();
	$cat = new Categoria();
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
					<h3>Avaliações</h3>
					<select onChange="window.location.href=this.value">
					<option>-- Selecione um período --</option>
					<?php foreach ($tempo->getTempos() as $valorTempo) { ?>				
						<option value="?ano=<?php echo $valorTempo["ano"] ;?>&sem=<?php echo $valorTempo["semestre"] ;?>"> <?php echo $valorTempo["semestre"] ;?>º sem/<?php echo $valorTempo["ano"] ;?></a></option>
					<?php } ?>
					</select>
				</div>
				<?php if (isset($_GET["ano"])){ ?>
				<p>
				<h3 class="text-center"> <?php echo $sem;?>º semestre/<?php echo $ano;?></h3>
				<p>
				<!-- LISTAR AS CATEGORIAS DE AVALIAÇÃO-->
		    	<?php foreach ($cat->getCategorias() as $valorCat) { ?>
					<div class="panel panel-primary">
					  <div class="panel-heading"><?php echo $valorCat["categoria"]; ?></div>
					  <div class="panel-body">
					    <!-- LISTA AS PERGUNTAS-->
					    <div class="table-responsive">
					    	<table class="table table-striped">
						    	<thead>
						    		<tr>
							    		<th>Pergunta</th>
						    		</tr>
					    		</thead>
				    			<tbody>
						    	<?php foreach($av->listAvaliacaoControle($ano, $sem, $valorCat["categoria"]) as $valorAv){ ?>
						    	<tr>
						    		<td><?php echo $valorAv["pergunta"];?></td>
						    		
						    	</tr>
						    	<?php } ?>
				    			

						    	</tbody>
					    	</table>
				    	</div>
					  </div>
					</div>
					<?php } ?>
				
				<?php } ?>
			</div>
		
		</div>

  	</div>



