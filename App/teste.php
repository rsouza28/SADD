<?php
ini_set('default_charset', 'UTF-8');
	//require_once "classes/conexao.class.php";
	require_once "classes/perguntas.class.php";
	require_once "classes/respostas.class.php";
echo "teste 1";

	//$conecta = new Conexao();

	


echo "<p> teste 2 <p>";

$perg = new Perguntas();
$perg->teste();
// $perg->add('teste','s',1);

//$perg->add('A disciplina contribui para o conhecimento de valores humanos e ética profissional.', 'S', 1);
//$perg->add('A disciplina contribui para o aprendizado de conhecimentos específicos para a atuação profissional.', 'S', 1);
//$perg->add('A disciplina contribui para o acesso ao conhecimento científico atualizado (artigos, novas técnicas ou ferramentas, etc).', 'S', 1);
//$perg->desativa(1);
//$perg->desativa(2);
//$perg->ativa(1);

$resp = new Respostas();
//$resp->add('Sempre', 'S', 5, 1);
//$resp->add('Bastante', 'S', 4, 1);
//$resp->add('Ás vezes', 'S', 3, 1);
//$resp->add('Pouco', 'S', 5, 1);
//$resp->add('Nunca', 'S', 5, 1);
//$resp->ativa(1);
//$resp->ativa(2);








?>

