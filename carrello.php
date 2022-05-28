<?php
    session_start();
    if(!isset($_SESSION['nomeUtente'])){
        header("Location: login.php");
        exit;
    }
    if(isset($_GET["id"])){
        $connessione=mysqli_connect("localhost", "root", "", "hw1") or die("Error: ".mysqli_connect_error()); 
        $query1="SELECT * FROM  carrello WHERE nome_utente='".$_SESSION['nomeUtente']."'AND id_moto='".$_GET['id']."'";
        $risultato1=mysqli_query($connessione, $query1)or die("Error: ".mysqli_error($connessione));
        if(mysqli_num_rows($risultato1)>0){
            $query2="UPDATE carrello SET quantita=quantita+1 WHERE nome_utente='".$_SESSION['nomeUtente']."'AND id_moto='".$_GET['id']."'";
            $risultato2=mysqli_query($connessione, $query2)or die("Error: ".mysqli_error($connessione));
        }else{
            $query3="INSERT INTO carrello(nome_utente, id_moto, quantita) VALUES('".$_SESSION['nomeUtente']."','".$_GET['id']."','1')";
            $risultato3=mysqli_query($connessione, $query3)or die("Error: ".mysqli_error($connessione));
        }
        mysqli_close($connessione);
    }
      
                
?>
    <!DOCTYPE html> 
    <head>
        <title>hw1</title>
        <script src="carrello.js" defer="true"></script>
        <link rel="stylesheet" href="carrello.css"/>
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
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.8.0/dist/leaflet.css" integrity="sha512-hoalWLoI8r4UszCkZ5kL8vayOGVae1oxXe/2A4AO6J9+580uKHDO3JdHb7NzwwzK5xr/Fs0W40kiNHxM9vyTtQ==" crossorigin="" />
        <script src="https://unpkg.com/leaflet@1.8.0/dist/leaflet.js" integrity="sha512-BB3hKbKWOc9Ez/TAwyWxNXeoV9c1v6FIeYiBieIWkpLjauysF18NzgR1MBNBXf8/KABdlkX68nAhlwcDFLGPCQ==" crossorigin="" defer="true"></script>
        
    </head>
    <body>
        <header>
            <h1>Il tuo carrello</h1>
            <nav>
                <div id="Navigazione">
                    <a href="HW1.php">Home</a>
                    <a href="carrello.php" id="carrello">Carrello</a>
                    <a href="catalogo.php">Catalogo</a>
                    <a href="logout.php">Esci</a>
                </div>
                <div id="menu">
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
            </nav>
        </header>
        <section id="contenitore" class="griglia"></section>        
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
