<form method='post' action='resultado.php' name='form' id='form'>

	<?php for ($i = 0; $i < 3; $i++){ ?>
		<p>Pergunta numero <?php echo $i; ?>?
		<input type='radio' name='vet[<?php echo "pergunta".$i; ?>]' value='<?php echo "resposta 1"; ?>'> Resposta<?php echo 1; ?>
		<input type='radio' name='vet[<?php echo "pergunta".$i; ?>]' value='<?php echo "resposta 2"; ?>'> Resposta <?php echo 2; ?>
		<input type='radio' name='vet[<?php echo "pergunta".$i; ?>]' value='<?php echo "resposta 3"; ?>'> Resposta <?php echo 3; ?>
		<input type='radio' name='vet[<?php echo "pergunta".$i; ?>]' value='<?php echo "resposta 4"; ?>'> Resposta <?php echo 4; ?>
	<?php } ?>
<p><input type='submit' value='enviar'>
</form>




