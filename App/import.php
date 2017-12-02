<?php

    ob_start();

    $pagemaincontent = ob_get_contents();


    ob_end_clean();
    $titulo = 'Sistema de Avaliação de Disciplina e Docentes';

    include("master.php");

    $login = new Login();
    if($login->verificaAdmin($_SESSION["tipo"])){
        }

    $tempo = new Tempo();
    
?>

<div class='container-fluid'>
    <div class="col-md-6 col-md-offset-3">
    <div class="alert alert-danger text-center" role="alert">ATENÇÃO: O período corrente é <b><?php echo $tempo->getPeriodoCorrente();?></b>. Clique  <a href="tempo.php">aqui</a> para alterar.</div>
    <?php 
      if (isset($_SESSION["arq_count"]) and $_SESSION["arq_count"] == 2) { ?>
           <div class="alert alert-warning text-center" role="alert">
                 A carga de dados já pode ser gerada. Certifique-se de que está no período letivo correto.
                 Acesse em "Dados >> Gerar Carga".
            </div>
          <?php } ?>

    	<div class="panel panel-primary">
		  	<div class="panel-heading">Importar alunos</div>
			   <div class="panel-body">
			   <?php require_once("import_alunos.php") ;?>
			   </div>
			</div>
		<div class="panel panel-primary">
		  	<div class="panel-heading">Importar disciplinas e docentes</div>
			   <div class="panel-body">
			   <?php require_once("import_disciplinas.php") ;?>
			   </div>
			</div>

      <center><a href="import.php">Clique aqui após carregar os dois arquivos</a></center>

	</div>
</div>


