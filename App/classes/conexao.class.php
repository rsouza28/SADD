<?php
error_reporting(E_ERROR);

class Conexao{



	private $_host = 'localhost';
	private $_user = 'root';
	private $_database = 'hmg_sadd';
	private $_pass = 'root';
	public $_con;

	/*private $_host = 'sadd-hmg.cpxeirauhjut.us-west-2.rds.amazonaws.com';
	private $_user = 'root';
	private $_database = 'hmg_sadd';
	private $_pass = 'saddroot';
	public $_con;*/

	function __construct(){
		$this->conecta();
	}

	function conecta(){
		header('Content-Type: text/html; charset=utf-8');

		$_con = mysql_connect($this->_host, $this->_user, $this->_pass) or die("Can't connect to server. " . mysql_error());
		$_con = mysql_select_db($this->_database) or die("Can't connect to database. " . mysql_error());
		
		mysql_query("SET NAMES 'utf8'");
		mysql_query('SET character_set_connection=utf8');
		mysql_query('SET character_set_client=utf8');
		mysql_query('SET character_set_results=utf8');


		return $_con;
		
	}

	function desconecta(){

		return mysql_close($this->_con);
	}
	
	

}

?>