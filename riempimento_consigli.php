<?php 
    $connessione=mysqli_connect("localhost", "root", "", "hw1") or die("Error: ".mysqli_connect_error());
    $query="SELECT * FROM contenuto";
    $risultato=mysqli_query($connessione, $query)or die("Error: ".mysqli_error($connessione));
    $contenuto_array=array();
    if (mysqli_num_rows($risultato) > 0){
       while($row=mysqli_fetch_assoc($risultato)){
            $contenuto_array[]=$row;
        }
    }
    echo json_encode($contenuto_array);
    mysqli_free_result($risultato);
    mysqli_close($connessione);
    exit;
?> 
