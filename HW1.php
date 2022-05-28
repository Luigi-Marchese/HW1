<?php
    session_start();
    if(isset($_SESSION["nomeUtente"])){
        $errore=true;
    }
?>
    <!DOCTYPE html> 
    <head>
        <title>mhw3</title>
        <link rel="stylesheet" href="HW1.css"/>
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
        <script src="HW1.js" defer="true"></script>
    </head>
    <body>
        <header>
            <h1>Concessionario moto</h1>
            <nav>
                <div id="Navigazione">
                    <a href="HW1.php">Home</a>
                    <?php
                        if(isset($errore)){
                            echo "<a href='carrello.php' id='carrello'>Carrello</a>";
                            echo "<a href='catalogo.php'>Catalogo</a>";
                            echo "<a href='logout.php'>Esci</a> ";
                        }
                    ?>
                </div>
                <div id="menu">
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
            </nav>
        </header>
        <section id="contenitore_logo">
            <div id="elencoBrand"></div>
        </section>
        <section id="contenitore_suggerimenti">   
            <div id="AcquistiSuggeriti"></div>
        </section>
        <h3>Vieni a trovarci:</h3>
        <div id="map"></div>
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