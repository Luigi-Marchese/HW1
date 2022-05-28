<?php
    session_start();
    if(!isset($_SESSION['nomeUtente'])){
        header("Location: login.php");
        exit;
    }
?>

<!DOCTYPE html>
    <head>
    <script src="catalogo.js" defer="true"></script>
    <link rel="stylesheet" href="catalogo.css?ts=<?=time()?>&quot"/>
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
    </head>
    <header>
        <h1>Benvenuto <?php echo $_SESSION["nomeUtente"];?></h1>
        <h3>nella sezione catalogo</h3>
        <nav>
            <div id="Navigazione">
                <a href="HW1.php">Home</a>
                <a href="carrello.php" id="carrello">Carrello</a>
                <a href="catalogo.php">Catalogo</a>
                <a href="logout.php">Esci</a>                    
            </div>
        </nav>    
    </header>
    <body>
        <h1>Cerca il tuo mezzo</h1>
        <div id="ricerca">
            <form method="POST" name="form_cerca">
                <p>
                    <label><input type="text" name="barra_ricerca"  id="barra_ricerca"></label>
                    <label><input type="submit" id="cerca" value="cerca"></label>
                </p>
            </form>
            <p><label><input type="button" id="mostra" value="mostra tutto"></label></p>
        </div>
        <section id="benelli" class="griglia"></section>
        <section id="kawasaki" class="griglia"></section>
        <section id="bmw" class="griglia"></section>
        <footer id=info>
            <div id="info">
                <a href="www">Chi siamo</a>
                <a href="www">Contatti</a>
                <a href="www">Lavora con noi</a>
            </div>
            <address>Luigi Marchese 1000026805</address>
        </footer>
    </body>
</html>