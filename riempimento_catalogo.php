<?php 
    $connessione=mysqli_connect("localhost", "root", "", "hw1") or die("Error: ".mysqli_connect_error());
    $query="SELECT * FROM catalogo";
    $risultato=mysqli_query($connessione, $query)or die("Error: ".mysqli_error($connessione));
    $moto_array=array();
    if (mysqli_num_rows($risultato) > 0){
       while($row=mysqli_fetch_assoc($risultato)){
            $moto_array[]=$row;
        }
    }
    echo json_encode($moto_array);
    mysqli_free_result($risultato);
    mysqli_close($connessione);
    exit;
?> 
