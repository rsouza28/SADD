<?php

	ob_start();

	$pagemaincontent = ob_get_contents();


	ob_end_clean();
	$titulo = 'Sistema de Avaliação de Disciplinas e Docentes';

	include("master.php");
?>
	<?php 

		$login = new Login();
    		if($login->verificaAluno($_SESSION["tipo"])){
    	}
    	
		$turma = new Turmas();
		$av = new Avaliacao();
		$disc = new Disciplinas();
		$of = new Ofertas();
		$cat = new Categoria();
		$av = new Avaliacao();
		$resp = new Respostas();
		$aluno = new Alunos();
		$aviso = new Avisos();
		$com = new Comentarios();
		$cod = $_REQUEST["cod"];

		if (!isset($_REQUEST["cod"]))
			{ $cod = '000'; 
			}

		//$matricula = '20112210032';
		//$matricula = '20091210515';
		$matricula = $_SESSION["matricula"];
		$envia = "&mat={$matricula}&cod={$cod}";

	?>


	<div class="container-fluid">
		<div class="col-md-8 col-md-offset-2">
			<div class="well"> <h4 class="text-center"><?php echo $aluno->getMatricula($matricula)." - ".$aluno->getNome($matricula);?> </h4></div>
			<div class="panel panel-default">
			<form method="post" action="recebeavaliacao.php?av=true<?php echo $envia;?>" name="myform" id="myform">
				<div class='panel-body'>
					<!-- CRIAR AS ABAS COM AS DISCIPLINAS QUE O ALUNO CURSA-->
					<ul class="nav nav-tabs">
					<?php foreach($turma->getTurmasAvaliadas($matricula) as $valorTurma) { 
							if ($valorTurma["codigo"] == $cod){
								$active = "active";
							}
							else {
								$active = "";
							}
					?>


				      <li class="<?php echo $active ;?>">  <a href="avaliado.php?cod=<?php echo $valorTurma['codigo'];?>"><?php echo $valorTurma["codigo"]; ?></a> </li>
				    <?php } ?>
			    	</ul>

		    		<p>
		    		<div class="container-fluid">
   				

		    			<!-- VALIDA AVALIAÇÃO -->
		    			<?php $num = $turma->verificacaoAvaliado($matricula, $cod); ?>

		    			

						<!-- SE FOR A PÁGINA INICIAL DOS AVALIADOS, NENHUMA QUERYSTRING FOI SETADA, ENTÃO
						NÃO IRÁ EXIBIR O O BOX COM NOME DA DISCIPLINA -->
						<?php if ($cod != '000') { ?>

			    			<!-- BOX COM NOME DA DISCIPLINA E DO SEU DOCENTE-->
			    			<?php if ($turma->verificaAvaliacoes($matricula) ){ ?>
			    				<div class="well">
			    				<h4 class="text-center"> <?php echo $of->getDisciplina($cod)." - ".$of->getDocente($cod); ?></h4>
			    				<h5 class="text-center"> <?php echo $of->getTempo($cod) ;?></h5>
			    			</div>
		    				<?php } 
		    			} 
		    			?>
		    			<!-- BOX COM MENSAGEM DE ERRO CASO ALGUÉM TENTE VISUALIZAR UMA DISCIPLINA ALTERANDO O CÓDIGO DELA NA URL -->
		    			<?php if($num != 0){ ?>
		    			<div class="alert alert-danger text-center" role="alert">
							  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
							  <span class="sr-only">Error:</span>
							  <?php echo  $aviso->aviso($num);?>
							</div>
						<?php } ?>


		    				
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
									    		<th>Resposta</th>

									    		
								    		</tr>
							    		</thead>
						    			<tbody>
						    			
								    	<?php foreach($av->listAvaliacao($matricula, $cod, $valorCat["id"]) as $valorAv){ ?>
								    	<tr>
								    		<td><?php echo $valorAv["pergunta"];?></td>
								    		<td><?php echo $valorAv["resposta"];?></td>
								    		
									    	
								    	</tr>
								    	<?php } ?>
								    	</tbody>
							    	</table>
						    	</div>
							  </div>
	    					</div>
		    				<?php } ?>
				    		

	    					<!-- COMENTARIOS E SUGESTOES DOS ALUNOS -->
							<div class="panel panel-info">
							  <div class="panel-heading">Comentários</div>
							  <div class="panel-body">
							    <textarea class="form-control" name="txtComent" id="txtComent" readonly=""><?php echo $com->getComentario($matricula, $cod);?></textarea>
							  </div>
							</div>

							<div class="panel panel-info">
							  <div class="panel-heading">Críticas e Sugestões</div>
							  <div class="panel-body">
							    <textarea class="form-control" id="txtSug" name="txtSug" readonly=""><?php echo $com->getSugestao($matricula, $cod);?></textarea>
							  </div>
							</div>

						</div>
					</div>
					<div class="panel-footer" style="text-align:center;">
					</div>
				</form>
	  		</div>
		</div>	    
	</div>





 