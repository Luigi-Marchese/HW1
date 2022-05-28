<?php
    $connessione = mysqli_connect("localhost", "root", "", "hw1");
    $query="SELECT * FROM cliente  WHERE Nome_utente= '".$_POST['nomeUtente']."'  OR Email = '".$_POST['email']."' OR Cellulare='".$_POST['cellulare']."'";
    $risultato=mysqli_query($connessione, $query)or die("Error: ".mysqli_error($connessione));
        if(mysqli_num_rows($risultato)>0){
            echo"nonDisponibile";
        }else{
            echo "ok";
        }
    mysqli_free_result($risultato);
    mysqli_close($connessione); 
?>