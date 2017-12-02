<?php if (is_null($pagemaincontent)) exit("403 Access Forbidden"); 

  require_once "assets/includes/import.php";


  $conecta = new Conexao();
  session_start("login");
  $login = new Login();
?>

<!doctype html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $titulo ;?></title>
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/css/custom.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/functions.js"></script>
  


  </head>
  <body>
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-12">
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="background-color:#597eaa;">
          <div class="navbar-header">
                  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                  <span class="sr-only">Toggle navigation</span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.php" style="color:#eeeeee;">SADD - BSI</a>
              </div>
          <?php 
            if($login->tipoUsuario() == "Aluno"){
               include_once("assets/includes/menu_aluno.php"); 
            } 
            else if($login->tipoUsuario() == "Admin"){
             include_once("assets/includes/menu_admin.php"); 
           }   
           else if($login->tipoUsuario() == "Docente"){
             include_once("assets/includes/menu_docente.php"); 
           }   
           else {

           }

          ?>
          
        </nav>
        <p>

        <div class="container-fluid">
            
          <?php echo $pagemaincontent ;?>

          
        </div>
      </div>
    </div>
  </div>

</body>
</html>


 
 
 
