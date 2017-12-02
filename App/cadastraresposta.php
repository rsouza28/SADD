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
    	
	$resp = new Respostas();
	$cat = new Categoria();
?>
<script type="text/javascript">
	 $(document).ready(function() {
        $("#btn_cadastrar").click(function(){
        	
        	if($("#txtResposta").val().length < 2) {
        		alert("A resposta deve ser preenchida corretamente");
            	return false;
        	}
        	if($("#selvalor").val() == null) {
        		alert("Selecione um valor");
            	return false;
        	}

        	if($("#selcategoria").val() == null) {
        		alert("Selecione uma categoria");
            	return false;
        	}

        });

    });
	
	
</script>

	<div class='container-fluid'>
		<div class="col-md-4 col-md-offset-4">
			<form action="salvaresposta.php" method="post" name="form" id="form">
			  <div class="form-group">
			  <label for="txtResposta">Resposta / Valor</label>
				  <div class="form-inline">
				    
				    <textarea class="form-control" rows="4" id="txtResposta" name="txtResposta"> </textarea>
				    <select multiple size="5" class="form-control" name="selValor" id="selvalor" >
				    <?php $i=1;
				    	for($i; $i <= 5; $i++){ ?>
				    		<option value="<?php echo $i;?>"><?php echo $i;?></option>
			    		<?php } ?>
			    	</select>
			    </div>
			    </select>
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

	
	
			  		