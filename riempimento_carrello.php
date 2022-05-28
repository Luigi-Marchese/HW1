<?php 
    $connessione=mysqli_connect("localhost", "root", "", "hw1") or die("Error: ".mysqli_connect_error());
    $query="SELECT * FROM carrello JOIN catalogo ON carrello.id_moto=catalogo.id JOIN cliente on carrello.nome_utente=cliente.nome_utente";
    $risultato=mysqli_query($connessione, $query)or die("Error: ".mysqli_error($connessione));
    $moto_carrello=array();
    if (mysqli_num_rows($risultato) > 0){
       while($row=mysqli_fetch_assoc($risultato)){
            $moto_carrello[]=$row;
     }
    }
    echo json_encode($moto_carrello);
    mysqli_close($connessione);
    exit;
?> 
