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



		$cod = $_REQUEST["cod"];
		//$matricula = '20112210032';
		//$matricula = '20091210515';
		$matricula = $_SESSION["matricula"];
		$envia = "&mat={$matricula}&cod={$cod}";

	?>
	<script>

$(document).ready(function() {
	$("#btnEnviar").click(function (e) {
		groups = {};
		var all_input = document.querySelectorAll('input[type="radio"]');
		for (var i = 0; i < all_input.length; ++i) {
		  if (!(all_input[i].name in groups)) {
		    groups[all_input[i].name] = 0;
		  } else {
		    groups[all_input[i].name] += 1;
		  }


		}
		var totais = Object.keys(groups).length;
		console.log(totais);

		var checadas;

		checadas = $('input:radio:checked').length;
		

		if (checadas != totais){
			alert("É preciso responder a todas as perguntas.");
			return false;
		}
		else {
			var r = confirm("Deseja enviar a avaliação assim mesmo?");
			if (r == false){
				return false;
			}
			else {
				return true;	
			}
		}
		
    });
    $("#btnNaoAvaliar").click(function (e){
    	var r = confirm("Deseja enviar a avaliação assim mesmo?");
			if (r == false){
				return false;
			}
			else {
				return true;	
			}
    });
});
</script>


	<div class="container-fluid">
		<div class="col-md-8 col-md-offset-2">
			<div class="well"> <h4 class="text-center"><?php echo $aluno->getMatricula($matricula)." - ".$aluno->getNome($matricula);?> </h4></div>
			<div class="panel panel-default">
			<form method="post" action="recebeavaliacao.php?av=true<?php echo $envia;?>" name="myform" id="myform">
				<div class='panel-body'>
					<!-- CRIAR AS ABAS COM AS DISCIPLINAS QUE O ALUNO CURSA-->
					<ul class="nav nav-tabs">
					<?php foreach($turma->getTurmasNaoAvaliadas($matricula) as $valorTurma) { 
							if ($valorTurma["codigo"] == $cod){
								$active = "active";
							}
							else {
								$active = "";
							}
					?>


				      <li class="<?php echo $active ;?>">  <a href="avaliar.php?cod=<?php echo $valorTurma['codigo'];?>"><?php echo $valorTurma["codigo"]; ?></a> </li>
				    <?php } ?>
			    	</ul>

		    		<p>
		    		<div class="container-fluid">
	    				

		    			

		    			<!-- CASO ALGUÉM TENTE AVALIAR UMA DISCIPLINA ALTERANDO O CÓDIGO DELA NA URL -->
		    			<?php if (!$turma->verificaInscricao($matricula, $cod)){ ?>
		    			
		    			<div class="alert alert-danger text-center" role="alert">
							  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
							  <span class="sr-only">Error:</span>
							  <?php echo $aviso->aviso(1);
							  ?>
							</div>
		    			<?php } else { ?>
		    			<!-- DAR NOME A DISCIPLINA E AO SEU DOCENTE-->
		    				<div class="well">
		    				<h4 class="text-center"> <?php echo $of->getDisciplina($cod)." - ".$of->getDocente($cod); ?></h4>
		    				<h5 class="text-center"> <?php echo $of->getTempo($cod) ;?></h5>
		    			</div>
		    			<?php } ?>

	    				<!-- IMPEDIR QUE O ALUNO QUE JA AVALIOU, TENTAR REAVALIAR NOVAMENTE ALTERANDO O VALOR DA QUERYSTRING -->
	    				<!-- SE ELE TENTAR, RECEBE UMA MENSAGEM DE ERRO-->
		    			<?php if($turma->verificaAvaliacao($matricula, $cod)){ ?>
		    					<div class="alert alert-danger text-center" role="alert">
							  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
							  <span class="sr-only">Error:</span>
							  <?php echo $aviso->aviso(6);
							  ?>
							</div>
		    			<?php } else { ?>	
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
									    		<!-- lista os labels das respostas -->
									    		<?php foreach($resp->getRespostas($valorCat["id"]) as $valorResp){ ?>
									    			<th style="font-size:11px; font-weight:normal;"><?php echo $valorResp["resposta"] ; ?></th>
									    		<?php } ?>

									    		
								    		</tr>
							    		</thead>
						    			<tbody>
								    	<?php foreach($av->listAvaliacao($matricula, $cod, $valorCat["id"]) as $valorAv){ ?>
								    	<tr>
								    		<td><?php echo $valorAv["pergunta"];?></td>
								    		<!-- lista os radio button das respostas -->
								    	
									    		<?php foreach($resp->getRespostas($valorCat["id"]) as $valorResp){ ?>
									    			<th style="font-size:11px; font-weight:normal;">
									    				<input type="radio" name="vetAv[<?php echo $valorAv['id'];?>]" id="vetAv[<?php echo $valorAv['id'];?>]" value="<?php echo $valorResp["id"];?>">
									    			</th>
									    		<?php } ?>
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
							    <textarea class="form-control" name="txtComent" id="txtComent"></textarea>
							  </div>
							</div>

							<div class="panel panel-info">
							  <div class="panel-heading">Críticas e Sugestões</div>
							  <div class="panel-body">
							    <textarea class="form-control" id="txtSug" name="txtSug"></textarea>
							  </div>
							</div>

						</div>
					</div>
					<div class="panel-footer" style="text-align:center;">
					<?php if ($turma->verificaInscricao($matricula, $cod)){ ?>
					<input type="submit" class="btn btn-primary btn-sm"  id="btnEnviar" value="Enviar">
					<input type="submit" class="btn btn-danger btn-sm" id="btnNaoAvaliar" value="Não Avaliar">
					<?php } ?>
					</div>
					<?php } ?>
				</form>
	  		</div>
		</div>	    
	</div>




	
