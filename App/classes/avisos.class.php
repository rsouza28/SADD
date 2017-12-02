<?php
ini_set('default_charset', 'UTF-8');
	require_once "classes/conexao.class.php";
  	$conecta = new Conexao();

  	class Avisos{
  		public $msg;
  		function aviso($int){
        $cod = $_REQUEST["cod"];

  			switch($int){
  				case 1: $msg = "Selecione uma disciplina para avaliar.";
  						break;
          case 2: $msg = "Você ainda não avaliou esta disciplina. Clique <a href='avaliar.php?cod={$cod}''>aqui</a> para avaliar";
              break;
          case 3: $msg = "Você não está matriculado nesta disciplina.";
              break;
          case 4: $msg = "Você ainda não realizou nenhuma avaliação.";
              break;
          case 5: $msg = "Selecione uma disciplina.";
              break;
          case 6: $msg = "Você já avaliou esta disciplina. Clique <a href='avaliado.php?cod={$cod}''>aqui</a> para ver sua avaliação.";
              break;
  			}

  			return $msg;

  		}

  		function teste(){
  			echo "aviso ok";
  		}
  	}
 ?>