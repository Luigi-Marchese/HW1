<?php
    session_start();
    if(isset($_SESSION["nomeUtente"])){
        header("Location: catalogo.php");
        exit;
    }
    if(!empty($_POST["nomeUtente"]) && !empty($_POST["password"]))
    {
        $connessione=mysqli_connect("localhost", "root", "", "hw1") or die("Error: ".mysqli_connect_error());
        $usr=mysqli_real_escape_string($connessione,$_POST['nomeUtente']);
        $psw=mysqli_real_escape_string($connessione,$_POST['password']);
        $psw=sha1($psw);
        $query="SELECT * FROM cliente  WHERE Nome_utente= '".$usr."' AND pass = '".$psw."'";
        $risultato=mysqli_query($connessione, $query)or die("Error: ".mysqli_error($connessione));
        if(mysqli_num_rows($risultato)>0){
            $_SESSION["nomeUtente"]=$_POST["nomeUtente"];
            header("Location: catalogo.php");
            exit;
        }else{
            $errore=true;
        }
    }
?>



<!DOCTYPE html>
    <head>
    <link rel="stylesheet" href="HW1_login.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bree+Serif&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@100&display=swap" rel="stylesheet">        
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Medula+One&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inconsolata:wght@300&display=swap" rel="stylesheet">
    <script src="login.js" defer="true"></script>
    </head>
    <header>
            <h1>Accedi</h1>
            <nav>
                <div id="Navigazione">
                    <a href="HW1.php">Home</a>
                </div>
    </header>
    <body>
    <?php
        if(isset($errore)){
            echo "<p class='avvertimento'>";
            echo "Credenziali non valide.";
            echo "</p>";
        }
    ?>
    <div id="contenitore_login">
            <form method="post">
                <h3>Accedi per visionare il catalogo</h>
                <p>
                    <label>Nome utente<input type="text" name="nomeUtente"></label>
                </p>
                <p>
                    <label>Password <input type="password" name="password"></label>
                </p>
                <input type="submit">
            </form>
        </div>
            <a id="link_reg" href="registrazione.html">Non sei ancora iscritto? Registrati</a>   
        </div> 
        <footer>
            <div id="info">
                <a href="www">Chi siamo</a>
                <a href="www">Contatti</a>
                <a href="www">Lavora con noi</a>
            </div>
            <address>Luigi Marchese 1000026805</address>
        </footer>
    </body>
</html>