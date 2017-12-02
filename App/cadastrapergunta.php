<?php

	ob_start();

	$pagemaincontent = ob_get_contents();


	ob_end_clean();
	$titulo = 'Sistema de Avaliação de Disciplina e Docentes';

	include("master.php");
?>
<script type="text/javascript">
	 $(document).ready(function() {
        $("#btn_cadastrar").click(function(){
        	
        	if($("#txtPergunta").val().length < 30) {
        		alert("A pergunta deve ter pelo menos 30 caracteres");
            	return false;
        	}
        	if($("#selcategoria").val() == null) {
        		alert("Selecione uma categoria");
            	return false;
        	}

        });

    });
	
	
</script>
<?php 
	$login = new Login();
	if($login->verificaAdmin($_SESSION["tipo"])){
    	}
	$perg = new Perguntas();
	$cat = new Categoria();
?>
	<div class='container-fluid'>
		<div class="col-md-4 col-md-offset-4">
			<form action="salvapergunta.php" method="post" name="form" id="form">
			  <div class="form-group">
			    <label for="txtPergunta">Pergunta </label>
			    <textarea class="form-control" rows="5" id="txtPergunta" name="txtPergunta"> </textarea>
			  </div>

			  <div class="form-group">
			  	  <label for="selCategoria">Categoria</label>
				  <select multiple size="3" class="form-control" name="selCategoria" id="selcategoria">
				  		<?php foreach($cat->getCategorias() as $valor){ ?>
				  		<option value="<?php echo $valor["id"];?>"> <?php echo $valor["categoria"];?></option>
				  		<?php } ?>
				  </select>
			  	</div>

			  	<div class="form-group">
			  	<input type="submit" value="Cadastrar" id="btn_cadastrar" class="btn btn-primary btn-sm btn-block">
			  	</div>
		    </form>
		</div>
	</div>

	
	
			  		