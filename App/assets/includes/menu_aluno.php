<?php session_start("login");
  
  $turma = new Turmas();
  $matricula = $_SESSION["matricula"];
?>
<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <ul class="nav navbar-nav navbar-right">
      <li class="dropdown">

        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="color:#eeeeee;"><span class='glyphicon glyphicon-user' aria-hidden='true'> </span> <?php echo $_SESSION["nome"];?><span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="homealuno.php"> <span class='glyphicon glyphicon-home' aria-hidden='true'> </span> Home</a></li>
          <li role="separator" class="divider"></li>
          <?php if(!$turma->verificaAvaliacaoFinalizada($matricula)) {?>
          <li><a href="avaliar.php"> <span class='glyphicon glyphicon-comment' aria-hidden='true'> </span> Avaliar</a></li>
          <?php } ?>
          <li><a href="avaliado.php"><span class='glyphicon glyphicon-duplicate' aria-hidden='true'> </span> Avaliações</a></li>
          <!--<li><a href="#"><span class='glyphicon glyphicon-stats' aria-hidden='true'> </span> Relatórios</a></li>!-->
          <li role="separator" class="divider"></li>
          <li><a href="logout.php"><span class='glyphicon glyphicon-log-out' aria-hidden='true'> </span> Sair</a></li>
        </ul>
      </li>
    </ul>
</div>