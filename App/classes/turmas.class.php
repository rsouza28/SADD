<?php
	ini_set('default_charset', 'UTF-8');
	require_once "classes/conexao.class.php";
	require_once "classes/avisos.class.php";
  	$conecta = new Conexao();

	class Turmas{

		function getTurmas($matricula){
			$sql = "select matricula, aluno, codigo, disciplina, matricula_docente, docente,
					flag, semestre, ano, corrente from vw_turma where matricula = {$matricula};";

			$result = mysql_query($sql);
			while ($row = mysql_fetch_array($result)){
				$rows[] = $row;
			}

			return $rows;


		}

		function getTurmasAno($ano){
			$sql = "select matricula, aluno, codigo, disciplina, matricula_docente, docente,
					flag, semestre, ano, corrente from vw_turma_historico where matricula = {$matricula};";

			$result = mysql_query($sql);
			while ($row = mysql_fetch_array($result)){
				$rows[] = $row;
			}

			return $rows;
		}

		function getTurmasAvaliadas($matricula){
			$sql = "select matricula, aluno, codigo, disciplina, matricula_docente, docente,
					flag, semestre, ano, corrente from vw_turma where matricula = {$matricula}
					and flag='SIM';";


			$result = mysql_query($sql);
			while ($row = mysql_fetch_array($result)){
				$rows[] = $row;
			}

			return $rows;


		}

		function getTurmasNaoAvaliadas($matricula){
			$sql = "select matricula, aluno, codigo, disciplina, matricula_docente, docente,
					flag, semestre, ano, corrente from vw_turma where matricula = {$matricula}
					and flag='NÃO';";

			$result = mysql_query($sql);
			while ($row = mysql_fetch_array($result)){
				$rows[] = $row;
			}

			return $rows;


		}

		function verificaInscricao($mat, $cod){
			$sql = "select count(1) as total from vw_turma where matricula = '{$mat}' and codigo = '{$cod}';";
			$result = mysql_query($sql);
			$row =mysql_fetch_array($result);

			

			if ($row["total"] == 1)
				return true;
			else
				return false;
			
			
		}

		function verificaAvaliacoes($mat){
			$sql = "select count(1) as total from vw_turma where matricula = '{$mat}' and flag = 'SIM';";
			$result = mysql_query($sql);
			$row =mysql_fetch_array($result);

			if($row["total"] > 0)
				return true;
			else
				return false;

			
		}
		
		function verificaAvaliacao($mat, $cod){
			$sql = "select count(1) as total from vw_turma where matricula = '{$mat}' and codigo = '{$cod}' and flag = 'SIM';";
			$result = mysql_query($sql);
			$row =mysql_fetch_array($result);

			if($row["total"] == 1)
				return true;
			else
				return false;

		}

		function verificacaoAvaliado($mat, $cod){
			$aviso = new Avisos();
			if ($cod == '000'){
				if ($this->verificaAvaliacoes($mat))
				{
					return 5;
				}
				else {
					return 4;
				}
			}
			

			if ($this->verificaAvaliacoes($mat)){
				//echo "Realizou alguma avaliação<p>";
				if($this->verificaInscricao($mat, $cod)){
					//echo "Está inscrito nessa disciplina<p>";
					if ($this->verificaAvaliacao($mat, $cod))
						return 0;
						//echo "Já avaliou esta disciplina";
					else
						return 2;		
						//echo "aviso->".$aviso->aviso(2);
				}
				else{
					return 3;
					//echo "aviso->".$aviso->aviso(3);
				}
			}
			else{
				return 4;
				//echo "aviso->".$aviso->aviso(4);
			}


		}


		function verificaAvaliacaoFinalizada($mat){
			$sql = "select count(1) as total from vw_turma where matricula = {$mat} and flag = 'SIM';";
			$result = mysql_query($sql);
			$row = mysql_fetch_array($result);

			$sql2 = "select count(1) as total from vw_turma where matricula = {$mat};";
			$result2 = mysql_query($sql2);
			$row2 = mysql_fetch_array($result2);

			if($row["total"] == $row2["total"])
				return true;

			return false;

		}	
		
		
	}


	$conecta->desconecta();
?>