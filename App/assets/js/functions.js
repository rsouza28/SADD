<script>
//GAMBIARRA PARA VALIDAÇÃO DOS CAMPOS DE VALIDAÇÃO
// Se alterar o numero de respostas, é preciso alterar o número CINCO também!
// Se colocarem 3 respostas pra uma categoria e 5 pra outra, FUDEU! Senta e chora.
$(document).ready(function() {
	$("#btnEnviar").click(function (e) {

		var checadas;
		var totais;
		checadas = $('input:radio:checked').length;
		totais = $('input:radio').length/5;
		

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
    
});
</script>