<?php

    /*ob_start();

    $pagemaincontent = ob_get_contents();


    ob_end_clean();
    $titulo = 'Sistema de Avaliação de Disciplina e Docentes';

    include("master.php");

    $login = new Login();
    if($login->verificaAdmin($_SESSION["tipo"])){
        }*/
    
?>

<script>
    $(document).ready(function() {
        $("#submit_disc").click(function(){
            
            if (!$("#exampleInputFileDisc").val().match(/csv$/)){
                alert("Selecione um arquivo CSV");
                return false;
            }
        });

    });

</script>



<div class='container-fluid'>
    <div class="col-md-6 col-md-offset-3">
  
<?php
//$deleterecords = "TRUNCATE TABLE nome-da-tabela"; //Esvaziar a tabela
//mysql_query($deleterecords);
  
//Transferir o arquivo
if (isset($_POST['submit_disc'])) {
  
    if (is_uploaded_file($_FILES['filename']['tmp_name'])) {
       // echo "<h1>" . "File ". $_FILES['filename']['name'] ." transferido com sucesso ." . "</h1>";
        //echo "<h2>Exibindo o conteúdo:</h2>";

        //readfile($_FILES['filename']['tmp_name']);
    }
  
    //Importar o arquivo transferido para o banco de dados
    $handle = fopen($_FILES['filename']['tmp_name'], "r");
    echo "<p>";
    $n_linha = 0;
    $sql_truncate = "truncate table tb_import_docentes_disciplinas;";
    $result_truncate = mysql_query($sql_truncate);
    while (($data = fgetcsv($handle, 1000, ";")) !== FALSE) {

        $import= "insert into (matricula, nome) values ('$data[0]','$data[1]','$data[19]','$data[20]')";

        if($n_linha > 1){
            //echo $import."<br>";
           $sql = "CALL sp_import_docentes_disciplinas('$data[0]','$data[1]', '$data[19]','$data[20]')";
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
    $_SESSION["arq_disc"] = true;
    fclose($handle);

  
//Visualizar formulário de transferência
} else { 

    if (isset($_SESSION["arq_disc"]) and $_SESSION["arq_disc"] == true){ ?>

    <div class="alert alert-success alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong>Sucesso!</strong> Este arquivo já foi importado.
    </div>
    
    <?php } else { ?>

                <h4> Carregar Disciplinas </h4>
                Selecione um arquivo .CSV <br>
              
                <form enctype='multipart/form-data' action='import.php' method='post'>
                        <div class='form-group'>
                      
                        
                        <div class="form-group">
                            <label for="exampleInputFile">Carregar Arquivo</label>
                            <input size='50' type='file' name='filename' id="exampleInputFileDisc">
                            <p class="help-block">Carregue o relatório "disciplinas-professores.csv".</p>
                          </div>
                      
                        <button  name='submit_disc'  id='submit_disc'>Upload</button>
                    </div>
                </form>
              
<?php 
             }   
    }
  
?>
  
    </div>
</div>
