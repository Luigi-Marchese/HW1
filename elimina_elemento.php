<?php
    session_start();
    if(!isset($_SESSION['nomeUtente'])){
        header("Location: login.php");
        exit;
    }
    if(isset($_GET["id"])){
        $connessione=mysqli_connect("localhost", "root", "", "hw1") or die("Error: ".mysqli_connect_error()); 
        $query="SELECT quantita FROM  carrello WHERE nome_utente='".$_SESSION['nomeUtente']."'AND id_moto='".$_GET['id']."'";
        $risultato=mysqli_query($connessione, $query)or die("Error: ".mysqli_error($connessione));
        if(mysqli_num_rows($risultato)>0){
            $row=mysqli_fetch_assoc($risultato);
            if($row['quantita']>1){
                $query="UPDATE carrello SET quantita=quantita-1 WHERE nome_utente='".$_SESSION['nomeUtente']."'AND id_moto='".$_GET['id']."'";
                $risultato=mysqli_query($connessione, $query)or die("Error: ".mysqli_error($connessione));
            }
            else if($row['quantita']=1){
                $query="DELETE FROM carrello where nome_utente='".$_SESSION['nomeUtente']."'AND id_moto='".$_GET['id']."'";
                $risultato=mysqli_query($connessione, $query)or die("Error: ".mysqli_error($connessione));
            }
        }
        mysqli_free_result($risultato);
        mysqli_close($connessione);
    }
?> 
