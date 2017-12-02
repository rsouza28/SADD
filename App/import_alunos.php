<?php

    /*ob_start();

    $pagemaincontent = ob_get_contents();


    ob_end_clean();
    $titulo = 'Sistema de Avaliação de Disciplina e Docentes';

    include("master.php");

    $login = new Login();
    if($login->verificaAdmin($_SESSION["tipo"])){
        }
    **/
?>


<div class='container-fluid'>
    <div class="col-md-6 col-md-offset-3">

<script>
    $(document).ready(function() {
        $("#submit_alunos").click(function(){
            if (!$("#exampleInputFileAluno").val().match(/csv$/)){
                alert("Selecione um arquivo CSV");
                return false; 
            }

        });

    });

</script>

  
<?php
  
//Transferir o arquivo
if (isset($_POST['submit_alunos'])) {
  
    if (is_uploaded_file($_FILES['filename']['tmp_name'])) {
        //echo "<h1>" . "File ". $_FILES['filename']['name'] ." transferido com sucesso ." . "</h1>";
        //echo "<h2>Exibindo o conteúdo:</h2>";

        //readfile($_FILES['filename']['tmp_name']);
    }
  
    //Importar o arquivo transferido para o banco de dados
    $handle = fopen($_FILES['filename']['tmp_name'], "r");
    echo "<p>";
    $n_linha = 0;
    $sql_truncate = "truncate table tb_import_alunos_matriculados;";
    $result_truncate = mysql_query($sql_truncate);
    while (($data = fgetcsv($handle, 1000, ",")) !== FALSE) {

        //$import= "insert into (matricula, nome) values ('$data[2]','$data[3]','$data[7]')";

        if($n_linha > 1){
            //echo $import."<br>";
           $sql = "CALL sp_import_alunos_matriculados('$data[2]','$data[3]', '$data[7]')";
           $result = mysql_query($sql);
            //echo $sql."<p>";
        }

        $n_linha++;
    
        //mysql_query($import) or die(mysql_error());
    }
    ?>  



     <div class="alert alert-success alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong>Sucesso!</strong> <?php echo $n_linha-2;?> registros importados com sucesso.
    </div>   

    <?php

    $_SESSION["arq_count"] = $_SESSION["arq_count"] + 1;
    $_SESSION["arq_alunos"] = true;
    fclose($handle);
  
   
  
//Visualizar formulário de transferência
} else { 

    if (isset($_SESSION["arq_alunos"]) and $_SESSION["arq_alunos"] == true){ ?>

    <div class="alert alert-success alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong>Sucesso!</strong> Este arquivo já foi importado.
    </div>        
    
    <?php } else { ?>
            <h4> Carregar Alunos </h4>
            Selecione um arquivo .CSV <br>
          
            <form enctype='multipart/form-data' action='import.php' method='post'>
                    <div class='form-group'>
                  
                    
                    <div class="form-group">
                        <label for="exampleInputFile">Carregar Arquivo</label>
                        <input size='50' type='file' name='filename' id="exampleInputFileAluno">
                        <p class="help-block">Carregue o relatório "alunos-matriculados.csv".</p>
                      </div>
                  
                    <input type='submit'  name = 'submit_alunos' id='submit_alunos' value='Upload'>
                </div>
            </form>
<?php 
        }
    }
  
?>
  
    </div>
</div>

