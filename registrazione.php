<?php 
    $errore1=false;
    if(!empty($_POST["nomeUtente"]) && !empty($_POST["email"]) && !empty($_POST["password"]) && !empty($_POST["cellulare"])&& !empty($_POST["c_password"])){
        if (strlen($_POST["password"]) < 8) {
            $errore1=true;
        }
        
        if (!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
            $errore1=true;
        }
        if (strlen($_POST["cellulare"]) != 10) {
            $errore1=true;
        }
        if (strcmp($_POST["password"], $_POST["c_password"]) != 0) {
            $errore1=true;
        }
        if($errore1===false){
            $connessione=mysqli_connect("localhost", "root", "", "hw1") or die("Error: ".mysqli_connect_error());
            $query1="SELECT * FROM cliente  WHERE Nome_utente= '".$_POST['nomeUtente']."' OR Email = '".$_POST['email']."'OR Cellulare='".$_POST['cellulare']."'";
            $risultato1=mysqli_query($connessione, $query1)or die("Error: ".mysqli_error($connessione));
            $num_rows=mysqli_num_rows($risultato1);
            if(!($num_rows>0)){
                $nUtente=mysqli_real_escape_string($connessione, $_POST["nomeUtente"]);
                $email=mysqli_real_escape_string($connessione, $_POST["email"]);
                $cell=mysqli_real_escape_string($connessione, $_POST["cellulare"]);
                $pass=mysqli_real_escape_string($connessione, $_POST["password"]);
                $pwd=sha1($pass);
                $query2="INSERT INTO cliente(Nome_utente, Email,Cellulare ,Pass ) VALUES (\"$nUtente\", \"$email\", \"$cell\", \"$pwd\")";           
                $risultato2=mysqli_query($connessione, $query2)or die("Error: ".mysqli_error($connessione));
                mysqli_free_result($risultato1);
                mysqli_free_result($risultato2);
                mysqli_close($connessione);
                header("Location: login.php");
                exit;
            }
            else{
                echo "ace";
                exit;
            }   
        }else{
            echo "cnv";
            exit;
        }
    }
?> 
