<?php

$perg = $_POST['vet'];


echo "teste<br>";
print_r ($perg);

echo "<br>teste2<br>";

foreach ($perg as $p => $r){
      echo "update tb_avaliacao set resposta = '".$r."' where pergunta = '".$p."' and aluno = '20112210032' and disciplina = 'PCS'";
      echo "<p>";
} 
?>