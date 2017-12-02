<?php
  

	ob_start();

	$pagemaincontent = ob_get_contents();


	ob_end_clean();
	$titulo = 'Sistema de Avaliação de Disciplina e Docentes';

	include("master.php");
?>
<?php 
      
    $login = new Login();
  if($login->verificaAluno($_SESSION["tipo"])){
      }

    $turma = new Turmas();
    $aluno = new Alunos(); 
    //$matricula = '20091210515' ;
    //$matricula = '20112210032' ;
    $matricula = $_SESSION["matricula"];
    $confirmacao = $_REQUEST['av'];
?>

	<div class="container-fluid">
    <div class="col-md-6 col-md-offset-3">
    <div class="well"> <h4 class="text-center"><?php echo $aluno->getMatricula($matricula)." - ".$aluno->getNome($matricula);?> </h4></div>
 
   <?php if($confirmacao == 'ok'){ ?>
      <div class="alert alert-success" role="alert" ><p class="text-center">Avaliação realizada com sucesso</p></div>
    <?php } ?>

      <div class="table-responsive">
        <table class="table table-striped table-bordered">
          <thead>
            <tr>
              <th> Codigo </th>
              <th> Disciplina </th>
              <th> Docente </th>
              <th> Semestre/Ano </th>
              <th> Ação </th>
            </tr>
          </thead>
          <tbody>
            

              <?php 
              foreach($turma->getTurmas($matricula) as $value){ ?>
    
            <tr>
              <td> <?php echo $value["codigo"] ;?> </td>
              <td> <?php echo $value["disciplina"] ;?></td>
              <td> <?php echo $value["docente"] ;?> </td>
              <td> <?php echo $value["semestre"]."/".$value["ano"] ;?> </td>
              <td> 
                <?php if($value["flag"]=='NÃO') { ?>
                  <a href="avaliar.php?cod=<?php echo $value["codigo"];?>"><button class="btn btn-info btn-xs">Avaliar</button></a> 
                <?php } else { ?>
                  <a href="avaliado.php?cod=<?php echo $value["codigo"];?>"><button class="btn btn-success btn-xs">Avaliado</button></a> 
                <?php } ?>

              </td>
            </tr>

            <?php }
            ?>

          </tbody>
        </table>
      </div>

    </div>
  </div>

<?php /* session_start("login");
echo "sessão: ";
echo $_SESSION["logado"];
echo "<p>matricula: ";
echo $_SESSION["matricula"];
echo "<p>tipo ";
echo $_SESSION["tipo"];
echo "<p>nome ";
echo $_SESSION["nome"];*/



?>