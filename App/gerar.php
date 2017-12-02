<?php

    ob_start();

    $pagemaincontent = ob_get_contents();


    ob_end_clean();
    $titulo = 'Sistema de Avaliação de Disciplina e Docentes';

    include("master.php");

    $login = new Login();
    if($login->verificaAdmin($_SESSION["tipo"])){
        }
    
    $av = new Avaliacao();

    $id = $_GET["id"];
?>
<div class='container-fluid'>
    <div class="col-md-6 col-md-offset-3">
    <?php 
    	if ($id == "dados"){
    		$av->gerarCarga();
    	?>
    	<div class="alert alert-warning text-center" role="alert">
                 Carga de dados gerada com sucesso. A avaliação já está disponível para ser criada.
                 <p>
                 <a href="gerar.php?id=avs">Clique aqui para gerar a avaliação.</a>
            </div>

    	<?php
    	}

    	if ($id == "avs"){
    		$av->gerarAvaliacoes();  ?>

            <div class="alert alert-warning text-center" role="alert">
                 Avaliações criadas com sucesso. Todas já estão disponíveis.
                 
            </div>
    	<?php } ?>

    </div>
</div>