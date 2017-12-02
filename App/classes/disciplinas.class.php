<?php
	ini_set('default_charset', 'UTF-8');
	require_once "classes/conexao.class.php";
  	$conecta = new Conexao();

	class Disciplinas{

		function teste(){
			echo "disciplina ok";
		}

		
	}

	$conecta->desconecta();
?>