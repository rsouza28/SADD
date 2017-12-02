<?php

	ob_start();

	$pagemaincontent = ob_get_contents();


	ob_end_clean();
	$titulo = 'Sistema de Avaliação de Disciplinas e Docentes';

	include("master.php");
?>
<div class="container-fluid">
	<?php
		$login = new Login();
    		if($login->verifica()){
    	}
		echo "<h4>avaliação recebida</h4>";


		
		$confirmacao = $_REQUEST["av"];

		if ($confirmacao == "true"){
			$avaliacoes = $_POST["vetAv"];
			$comentario = $_POST["txtComent"];
			$sugestao = $_POST["txtSug"];
			$matricula = $_REQUEST["mat"];
			$disciplina = $_REQUEST["cod"];
			$av = new Avaliacao();
			$com = new Comentarios();

			foreach ($avaliacoes as $id => $resp){
				$av->gravaAvaliacao($id, $resp);
      			//echo "update tb_avaliacao set id_resposta = '".$resp."' where id = '".$id."';";
      			//echo "<p>";
			} 
			
			//echo $comentario;
			//echo $sugestao;
			$com->insereComentarios($comentario, $sugestao, $matricula, $disciplina);
			$av->flagAvaliadoSim($matricula, $disciplina);
			

		}

	?>
</div>