<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <ul class="nav navbar-nav navbar-right">
    <?php if (isset($_SESSION["arq_count"]) and $_SESSION["arq_count"] == 2) { ?>
    <li class="dropdown">
      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="color:#eeeeee;"><span class='glyphicon glyphicon-tasks' aria-hidden='true'> </span> Dados <span class="caret"></span></a>
      <ul class="dropdown-menu">
      <li><a href="gerar.php?id=dados"><span class='glyphicon glyphicon-hdd' aria-hidden='true'> </span> Gerar Carga</a></li>
      <?php if (isset($_SESSION["avaliacao"]) and $_SESSION["avaliacao"] == true) { ?>
      <li><a href="gerar.php?id=avs"><span class='glyphicon glyphicon-hdd' aria-hidden='true'> </span> Criar avaliações</a></li>
      <?php } ?> 
      </ul>
    <?php } ?>
    </li>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="color:#eeeeee;"><span class='glyphicon glyphicon-user' aria-hidden='true'> </span> <?php echo $_SESSION["nome"];?><span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="homeadmin.php"> <span class='glyphicon glyphicon-home' aria-hidden='true'> </span> Home</a></li>  
          <li role="separator" class="divider"></li>
          
          <li><a href="administradores.php"> <span class='glyphicon glyphicon-user' aria-hidden='true'> </span> Administradores</a></li>
          <li><a href="alunos.php"><span class='glyphicon glyphicon-user' aria-hidden='true'> </span> Alunos</a></li>
          <li><a href="ofertas.php"><span class='glyphicon glyphicon-user' aria-hidden='true'> </span> Disciplinas e Docentes</a></li>
          <li><a href="perguntas.php"> <span class='glyphicon glyphicon-question-sign' aria-hidden='true'> </span> Perguntas</a></li>
          <li><a href="respostas.php"><span class='glyphicon glyphicon-exclamation-sign' aria-hidden='true'> </span> Respostas</a></li>
          <!-- <li><a href="#"><span class='glyphicon glyphicon-plus-sign' aria-hidden='true'> </span> Categorias</a></li> !-->
          <li><a href="tempo.php"><span class='glyphicon glyphicon-dashboard' aria-hidden='true'> </span> Período</a></li>
          <li><a href="avaliacoes.php"><span class='glyphicon glyphicon-duplicate' aria-hidden='true'> </span> Avaliações</a></li> 
          <li><a href="import.php"><span class='glyphicon glyphicon-open-file' aria-hidden='true'> </span> Importar Dados</a></li>
          <li><a href="relatorio.php"><span class='glyphicon glyphicon-stats' aria-hidden='true'> </span> Relatórios</a></li>
          <li role="separator" class="divider"></li>
          <li><a href="logout.php"><span class='glyphicon glyphicon-log-out' aria-hidden='true'> </span> Sair</a></li>
        </ul>
      </li>
    </ul>
</div>

