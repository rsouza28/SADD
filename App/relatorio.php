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

	$av = new Avaliacao();
	$tempo = new Tempo();
	


?>

<?php

if (isset($_GET["set"]))
	$set = $_GET["set"];



?>
<script>
	$(document).ready(function() {
        $("#relqtd_expandir").click(function(){
        	$("#relqtd").show();
        	$("#relqtd_expandir").hide();
        	$("#relqtd_ocultar").show();


        });

        $("#relqtd_ocultar").click(function(){
        	$("#relqtd").hide();
        	$("#relqtd_expandir").show();
        	$("#relqtd_ocultar").hide();

        });
    });
    </script>

<div class="col-md-8 col-md-offset-2">
	<div class="text-center">
		<h3>Relatórios</h3>
		<select onChange="window.location.href=this.value">
		<option>-- Selecione um período --</option>
		<?php foreach ($tempo->getTemposAvaliacoes() as $valorTempo) { ?>				
			<option value="?ano=<?php echo $valorTempo["ano"] ;?>&sem=<?php echo $valorTempo["semestre"] ;?>"> <?php echo $valorTempo["semestre"] ;?>º sem/<?php echo $valorTempo["ano"] ;?></a></option>
		<?php } ?>
		</select>
	</div>
	<?php
	if (isset($_GET["sem"])){
		$sem = $_GET["sem"];
		$ano = $_GET["ano"];	
		$file = 'files/relatorio_'.$ano.'_'.$sem.'.csv';
		unlink($file);
		$file = 'files/relatorio_comentarios_'.$ano.'_'.$sem.'.csv';
		unlink($file);
		$av->geraRelatorioCsv($ano, $sem);
		$av->geraComentariosCsv($ano, $sem);
	?>
	<?php if (isset($_GET["ano"])){ ?>
	<p>
	<h3 class="text-center"> <?php echo $sem;?>º semestre/<?php echo $ano;?></h3>
	<p>
	<?php } ?>
	<p>

	
	<div class="panel panel-primary">

			  <div class="panel-heading">
			  	Avaliacoes Realizadas por Oferta 
			  	<a style="color:orange; font-size:12px;" id="relqtd_expandir" href="#">(expandir)</a> 
			  	
			  	<a style="color:orange; font-size:12px; display:none;" id="relqtd_ocultar" href="#">(ocultar)</a>
			  </div>
			  
			  <div id="relqtd" style="display:none;">
				  <table  class="table table-hover" >
	  				<thead>
	  					<th>#</th>
	  					<th>Disciplina</th>
	  					<th>Docente</th>
	  					<th>Total Alunos</th>
	  					<th>Avaliacoes Realizadas</th>
	  				</thead>
	  				<tbody > 
						<?php $i = 1;
						foreach ($av->relatorioQtdAvaliacoes($ano, $sem) as $valorAv) { 
							
							?>

						<tr>
							<td><?php echo $i++ ;?></td>
							<td><?php echo $valorAv["disciplina"] ;?></td>
							<td><?php echo $valorAv["nome"] ;?></td>
							<td><?php echo $valorAv["qtd_alunos"] ;?></td>
							<td><?php echo $valorAv["qtd_alunos_avaliaram"] ;?></td>
						</tr>
						<?php }?>
	  					
	  				</tbody>
				  </table>
				</div>
	  	
	</div>
	<div class="panel panel-primary">
		<div class="panel-heading">
		  	Relatório completo de avaliações
		  	<a style="color:orange; font-size:12px;"  href="files/relatorio_<?php echo $ano;?>_<?php echo $sem;?>.csv">(Clique aqui para gerar o relatorio)</a> 

			  	
		 </div>
	</div>
	<div class="panel panel-primary">
		<div class="panel-heading">
		  	Relatório completo com comentarios e sugestoes
		  	<a style="color:orange; font-size:12px;"  href="files/relatorio_comentarios_<?php echo $ano;?>_<?php echo $sem;?>.csv">(Clique aqui para gerar o relatorio)</a> 

			  	
		 </div>
	</div>
	<?php } ?>
			  
</div>

