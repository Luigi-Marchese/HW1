-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 28, 2022 alle 16:17
-- Versione del server: 10.4.21-MariaDB
-- Versione PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hw1`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `carrello`
--

CREATE TABLE `carrello` (
  `nome_utente` varchar(20) NOT NULL,
  `id_moto` int(11) NOT NULL,
  `quantita` int(11) NOT NULL,
  `id_carrello` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `catalogo`
--

CREATE TABLE `catalogo` (
  `id` int(11) NOT NULL,
  `marca` varchar(20) NOT NULL,
  `modello` varchar(25) NOT NULL,
  `prezzo` float NOT NULL,
  `url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `catalogo`
--

INSERT INTO `catalogo` (`id`, `marca`, `modello`, `prezzo`, `url`) VALUES
(1, 'benelli', 'trk 502', 10000, 'https://storage.edidomus.it/dueruote/nuovo/850/lat1624953822956.jpg'),
(2, 'benelli', 'leoncino 500', 11500, 'https://storage.edidomus.it/dueruote/nuovo/850/LAT1619168095823.jpg'),
(3, 'benelli', 'tornado naked t 125', 14000, 'https://storage.edidomus.it/dueruote/nuovo/850/post3411624466833018.jpg'),
(4, 'benelli', 'bn 125', 9000, 'https://storage.edidomus.it/dueruote/nuovo/850/lat1624461518579.jpg'),
(5, 'benelli', 'trk 502 x', 9800, 'https://storage.edidomus.it/dueruote/nuovo/850/lat1624955082315.jpg'),
(6, 'benelli', 'leoncino 500 trail', 11000, 'https://storage.edidomus.it/dueruote/nuovo/850/LAT11619169550151.jpg'),
(7, 'kawasaki', 'kx 450 f', 11000, 'https://img2.stcrm.it/images/26182594/HOR_STD/1000x/kawasaki-kx450-2022-01.jpg'),
(8, 'kawasaki', 'ninja 1000 sx', 9800, 'https://img3.stcrm.it/images/25592952/HOR_STD/1000x/kawasaki-ninja-1000-sx-2022-01.jpg'),
(9, 'kawasaki ', 'ninja h2 1000 sx', 98100, 'https://img1.stcrm.it/images/26438456/HOR_STD/1000x/kawasaki-ninja-h2-1000-sx-se-2022-07.jpg'),
(10, 'kawasaki', 'w 800', 8900, 'https://img3.stcrm.it/images/25479312/HOR_STD/1000x/kawasaki-w-800-2022-01.jpg'),
(11, 'kawasaki', 'z 125', 7540, 'https://img3.stcrm.it/images/24106228/HOR_STD/1000x/kawasaki-z-125-performance-2019-05.jpg'),
(12, 'kawasaki', 'versys-x 300 adventure my', 15000, 'https://storage.kawasaki.eu/public/kawasaki.eu/en-EU/model/Versys-X-300-GY1-Adventure-front.jpg'),
(13, 'bmw', 'ce 04', 16000, 'https://img1.stcrm.it/images/23558629/HOR_STD/1000x/bmw-ce-04-2021-01.jpg'),
(14, 'bmw', 'f 900 r', 12000, 'https://img3.stcrm.it/images/25247545/HOR_STD/1000x/bmw-f-900-r-2022-02.jpg'),
(15, 'bmw', 'f 750 gs', 14500, 'https://img2.stcrm.it/images/25247494/HOR_STD/1000x/bmw-f-750-gs-2022-01.jpg'),
(16, 'bmw', 'g 310 r', 13000, 'https://img3.stcrm.it/images/25228492/HOR_STD/1000x/bmw-g-310-r-2022-05.jpg'),
(17, 'bmw', 'k 1600 gtl', 11000, 'https://img1.stcrm.it/images/26208596/HOR_STD/1000x/bmw-k-1600-gtl-2022-01.jpg'),
(18, 'bmw', 'k 1600 b', 13500, 'https://img2.stcrm.it/images/26208737/HOR_STD/1000x/bmw-k-1600-grand-america-2022-01.jpg');

-- --------------------------------------------------------

--
-- Struttura della tabella `cliente`
--

CREATE TABLE `cliente` (
  `Nome_utente` varchar(20) NOT NULL,
  `email` varchar(25) NOT NULL,
  `cellulare` int(10) NOT NULL,
  `pass` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Trigger `cliente`
--
DELIMITER $$
CREATE TRIGGER `controllo1` BEFORE INSERT ON `cliente` FOR EACH ROW BEGIN
IF(NEW.Nome_utente= ' '  OR NEW.cellulare= ' ' OR NEW.email= ' ' OR NEW.pass= ' ')
then
SIGNAL SQLSTATE '45000' set message_text = 'azione non concessa';
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `controllo2` BEFORE INSERT ON `cliente` FOR EACH ROW BEGIN
IF EXISTS(SELECT * FROM cliente WHERE cliente.Nome_utente=NEW.nome_utente OR cliente.email=NEW.email OR cliente.cellulare=NEW.cellulare)
then
SIGNAL SQLSTATE '45000' set message_text = 'Account esistente';
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struttura della tabella `contenuto`
--

CREATE TABLE `contenuto` (
  `id` int(11) NOT NULL,
  `titolo` varchar(25) NOT NULL,
  `url` text NOT NULL,
  `descrizione` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `contenuto`
--

INSERT INTO `contenuto` (`id`, `titolo`, `url`, `descrizione`) VALUES
(1, 'BENELLI LEONCINO 250', 'https://img1.stcrm.it/images/24459699/HOR_STD/1000x/benelli-leoncino-250-2019-01.png', 'Leoncino 250 è una due ruote compatta ed autentica, dove il classico si fa contemporaneo in una monocilindrica dal carattere grintoso e dalle linee innovative, tipiche della gamma Leoncino. Cuore pulsante di questa due ruote è un monocilindrico quattro tempi, raffreddato a liquido da 250cc, condiviso con gli altri modelli da un quarto di litro della gamma Benelli e aggiornato alla normativa Euro5. Potenza e coppia massima sono rispettivamente di 25,8 CV (19 kW) a 9250 giri/min e di 21 Nm (2,1 kgm) a 8000 giri/min. Leoncino 250 è espressione di stile: il telaio, un traliccio in tubi d’acciaio, si integra perfettamente con il design del serbatoio, così come il codino, estremamente compatto. Il gruppo ottico interamente a led. Come il resto della gamma, anche Leoncino 250 è caratterizzato dal Leone stilizzato che svetta orgoglioso sul parafango anteriore. L’impianto frenante è composto all’avantreno da un disco singolo flottante di 280 millimetri di diametro, mentre al retrotreno da un disco di 240 mm di diametro, garantendo il massimo della sicurezza su strada. Leoncino 250 è disponibile nelle colorazioni bianca e antracite a 3.790€ f.c.'),
(2, 'KAWASAKI Z 300', 'https://img1.stcrm.it/images/309463/1200x/15er300b-44sgrydrf2cg-c.jpg', 'La Z300 è una bicilindrica, equipaggiata con lo stesso propulsore da 296cc 4T raffreddato a liquido che spinge la già apprezzata piccola sportiva Ninja 300 (per cui vengono dichiarati 39 CV a 11.000 giri/min e 27 Nm di coppia a 10.000 giri/min), e la sua presenza è ben più imponente rispetto alla leggera e snella monocilindrica, con linee che fanno di tutto per rimarcare l’appartenenza alla gloriosa Serie Z. La sua stazza, in realtà, potrebbe indurre l’osservatore profano o disattento a confonderla con un modello di maggiore cubatura, un elemento che sicuramente ha il suo peso in quello che può essere l’appeal di questa moto soprattutto nei confronti dei giovani piloti con patente A2 alla caccia di una moto pratica e sportiva. La ciclistica si basa su un telaio a diamante in tubi d’acciaio ad alta resistenza, derivato da quello della Ninja 300, cui si abbinano una forcella telescopica non rovesciata Showa da 37 mm, il monoammortizzatore posteriore Uni-Trak garantisce una guida fluida ed un’ottima manovrabilità a qualunque velocità e su ogni condizione di asfalto. L’ABS di serie coordina l’impianto frenante con disco singolo a margherita ad entrambe le estremità (290 mm davanti, 220 mm dietro) che adorna i cerchi da 17″. Fino ad ora, aspetto a parte, tutto combacia con la carta d’identità della Ninja 300, mentre il prezzo è di 5.190 euro IVA inclusa (ma senza immatricolazione e messa in strada), contro i 5.590 euro necessari per accaparrarsi la Ninja 300 e i 4.690 euro richiesti per la Z250sl con ABS. Due le colorazioni disponibili, ‘nero‘ e ‘nero/verde‘.'),
(3, 'BMW F900R', 'https://img3.stcrm.it/images/25247545/1200x/bmw-f-900-r-2022-02.jpg', 'BMW da un netto taglio con il passato e si rivoluziona. Con l’arrivo della F 900 XR, la BMW F 900 R è passata quasi in sordina tra il grande pubblico. Ma dicerto non è una moto a cui piace rimanere in disparte.\r\n\r\n                        Con il precedente modello non ha più nulla a che vedere. La F 800 R è stata una delle moto che ha puntato tutto il suo valore sul piacere di guida e sul puro divertimento su strada. Ed ora la F 900 R si fa largo spazio nel segmento delle roadster, con prestazioni, dotazioni e finiture di tutto rispetto.\r\n                        \r\n                        Più muscolosa, con tanta tecnologia a disposizione, linee nette e decise e soprattutto un nuovo motore. Con la sorella F 900 XR condivide gran parte della piattaforma tecnica. Un unico gruppo motore e telaio, per due moto dall’aspetto diverso ma molto simili tra di loro, con alcune sostanziali differenze dal punto di vista delle quote ciclistiche e dei pesi.'),
(4, 'BENELLI BN 302 S', 'https://img1.stcrm.it/images/18615760/HOR_STD/1000x/benelli-bn-302-s-2019-02.jpg', 'La BN302 si inserisce nel segmento di quelle che un tempo erano le medie, la cui cilindrata è cresciuta da 250 a 300 cc. Si tratta di un modello tutto da scoprire, con un\'estetica che colpisce e con dimensioni da grande, sottolineate da un serbatoio con una capacità di 16 litri, adagiato su un telaio a traliccio realizzato con tubi di grande sezione. Si tratta di una naked su cui sono montate parti di buona qualità, come confermano le sospensioni regolabili in estensione, con il solo monoammortizzatore che consente di intervenire sul precarico della molla. L\'aspetto di moto di cilindrata superiore a quella reale è amplificato dalla scelta di utilizzare pneumatici con misure tipiche delle 600 stradali, unica della categoria a montare un vistoso posteriore da 160. Appartiene alla categoria delle moto più economiche, ma l\'equipaggiamento è di ottimo livello, come conferma la presenza di indicatori di direzione a led e della leva del freno anteriore regolabile.');

-- --------------------------------------------------------

--
-- Struttura della tabella `logo`
--

CREATE TABLE `logo` (
  `nome` varchar(20) NOT NULL,
  `url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `logo`
--

INSERT INTO `logo` (`nome`, `url`) VALUES
('benelli', 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/     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 \r\n'),
('honda', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAABcVBMVEX////jAADmAADpAADhAADdAADrAADaAAD//f/9///XAADuAAD8/PzUAADRAADyAAD5//v1///y////+v/1/P/MAAD+4Nj6+/j/+f/5//75+///+/z0//v6+P/7/vj49/bGAAD69OrcZmX46+b0ycD/+PX3//f/6+Xt//vrurPgABDQLST70dPaFBju+//bQELs/vbyta/q2dOzNTr54+HklY/keGvlnpfSSEjfJS/wzsfhfXfYZl32+eT45tfptqLakIHZOTrlsrPqpafXWVTVfHXUUkrhno3xxsLhkY7PYU/WR0PqiofZOTTtz8zs6OnFNTPlfYPrdnbebXPnipL9zM3WRDvqwrLmRU/hVlPkNzThWWnSc4PKFhTkZ1zylZDjGynUVEb328jpin3XkIb6s7TLW07Tc2XsY3S7W2HtWljaUULKLSr/09vOXmDhsajsRUnEfXzi4NjtMzytAAD3pKnkyrn1q5v6kJP82+TypbPH5NXcAAAUOElEQVR4nO1cC1fbWJJG0r2S9bD1tGU9LCHLEljGAbN2DDZxD68ODI/EEEKgx8DQQ/dsDx16ejabyfz6rSvSO7N79szunJ0+Nn3ulzixLeGjctWt+r66JebmKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCj+2QgCUZz2Nfy8KHieN+1r+Hkhio427Wv4eaDMKYoC9iWriTvta/kZUKg5qWmGQTpq1v+laynTvp5/PoJa1UxX3KXeu0yqR7VfoIWJtehXG88nSOVwLzV/cRYqiqNV+msCL8scv76kB78ECxUC0XFExXFNLRgM2xLPICywwsYLZ+UXY6EdOpblRqMv3klIVlmGYWRZ6KTWLyPTEAtDR7Gj219tCjzHIsyxDOL5tdhyn3ymEUXRFhVP8Rwt3qpnHCvxHIBhWYGXtnVTefKZhsSnpzh+MugtlzACyxiGJTYixO/Evu09aQvz9ae4NX0lbg7XSfYEA3MTeRlxcuvcFZW5J81LYfGFop8mld5aWVYRQgyXRyjYiZniZiN94oxN1Hyn4D5LGrvriGUgQOXcNo5nOJ6T0U7Fd02QTk9WPSmKWa3p9kLvyxImpYHn8wzDcwgjnpVaL19obliY9lX+f6CIuhPv7bYwr0J85uuPBStZWeU5Znl/IdAhhp9gknnMLSH5a486VxPMQ94kxY8Acgz8Qe1fb3cVx/NswLSv9x+GDck/8KqB5caDw4MiJBYEC4+VWcTwMpthhLKLfiNOV1KwLiAS8cnBdhxYfelCp94C+xiOuI3lMEbwHNLN8mFjlGqOXqu6puI8RQs9W7OtoLJ/VIblx2GUhyU4kYdSWNr89osFzTDcqucYfnT8qhrOPT0L5zQtOTudFFlVZqD4IYQxKQ88U5zf6HRDjQSno6dRY3/5ddcMn4oPYUWlQDztQHP80f6yhBnCrSF9wgPCk1OZ8k6/4viBneo1S4sau8tlDo898akYCHXB1jTNcfWocbJeRgwkF5aTeQylXVYZVF67Pq6CbrJq1WoSN3eP4ADLTAZO4alYKBbE0KmKSnd7R8ozJ3lAZLKkRmSQWxZ80Q9NJYiixnBTEjgV/MqcBObTKPeiUyi4rm7BxbdKMg8ORIRX8whBiSgenTQXQkM0ny2mUbdzckm4N5yUIbS+ZCiz3ygteAoIP1vUte7WxgSzPHEdJBjILpzKCTf1hzjRdNdd8ZPj7dMjIV+fIHwRxxffVL0Zb+crhL6A7HMtIzmD2g71HOziHqmZrEqTnf6PiVurWaaTVDr1dYxV9bE0Qo2U8fsFxZv1IM17S/BIOvU24mVMiCdkEHARi8vLbyqpW60Zi4vp6OVGW85dx8o5g+NlRnhd8WeakoqFAkTmXKFgpJXrlkA4J9R2IGigGxgev/3zWZx6VXdxMdm7vsiAzSAQvqT1xBF1gTjh/sw1oS7OcJQGgWdWxTQ+G05KiCeEGmH4K/MCvhyev0gNw/fTaHX/XVbCRPZCYBLZC0WSZeEL+XKQ6obvzOo6dIBNAuuy/O71RZlRZVC1pOvCqqrMtYadBa3guWIS7x1eSGAd1AziXkLe4DlP1mLrMLYc05hRD8K6833Hq4kg/NZlkLQMuXRwEs+WjuofKjYUDj+Nz3+13GaIw8B4JrePNGd4RsDttcOK5tc0szCDBoqFORHkgGnpIPwuMoaYB5II7IOVdnPQqyTWomHZleZwLWN5mZR84l0W6gf4mFTBo51eo6u7ljujlZB0VEzXEpPG8BKSJ7l+MFKQeL500NuLfcPSw25zdxM4GUcya96yAGEogZtVPH9wvdWN4CQnAW04gw6cyzu7YpqOHuoTFdYWaXwyQDt5YXMI5on6or3QHB+Ba/OYhPxCIhOBxuAZ6e3w420UGoY+t7DX/+o30cxVirwvEdq+oQwOWxCZYBwnC4iFLDKpN2Nx0aqFo85Vq0gotQAxSRprj50ZBkHpH8Tw5ThWWHn56yPEtUa1GfOhKBZcx9M0JepslCUGSZmskjBUmclVZwSVwYlGHzcyiZVJJ5RYD6QGkiyHS5PvrhuR4hiGFy9tbxwJLLgUP8xck9vzXOuZlR7vL2PgW6TRKcAT4eb9dsXWHTte6u/ckHKRxyUh3VjASCitX4w7Xd/QC0YwuHt+UIaaAT/J49PY8MNp2/RfofgrwUJnuF5kZA7IJ6RPjs3WrgeB72pRpf++RZyGMCfLhLdBxeOY9tvx1nEIRbOWVJrjtfUi4km5hG9Gfv1JNKxZsRAWiw38TEwq/d8KKM/9iLio+PZwL7TEIB70NjIidcF9YDYpCiwW2pvD7aUkhapZ7e69qcO6hYiFJYugbrBcu+l7YW1WLNTCJPQXo+awRYQtgwl5RqXL3U6c+lq1sX/QloCnMALKKRm4UChunvYHUejoTtBt9nbWQQeypNPNymA+Fji5dG07ZM5k2qZ9RuRYZrf/TYZUGS4UaDOW1uudTwWj2m0ermWkIEApICkVFCESjnauz2LLMgwl3ut/eZ9hzIESJJ6H4GUIL2DnryNnljSTrS/0N3PdI0CVk6RyffuTp/sLe/vL8wKftwtliFuIT2H+3X5zIQBCZ0eDfn25TfYoZFiSedknqhFOU9F907a8WfEflAhxcfVCYojsgbqNs3df30JliCHlCMCyESRVVMSwvKT2wddfjBIRqkYy2D65nydsm/iMOJYkUNAUMqmTra9HK0pVmxULC4riDJaLMvnyZSys/a4RiFp36/QeSyDSMVuEpMlhfLM2vKtEtqNDOrobL7dZRMyBjJRvUUD6gSeyzJATryuBRvYzZsVCr7oYf6NiyIA83hzvVUX7U/MUsr6qkg0WWFtYbb9+3l9KIKtoUffuzQUoRZSvuHwbm2Fy3gbEFbXXvxp3zqoOUNpZWoNaVd+GCgGX/Hq7aybdu29bxD25HoIlxbGtl0txoOtBtNrsXUykvEwCSyWNROaRsMms1F7e2f14HIcgiDVb8ZRZImugk04ZgeOl36+a3U59MyOOy7U6C4bKqLyv64bV3bveucyKZP8FM2TpETmVczfp5qDe6wy6ieYUREcz4+MuGDlLFhbsZI00zurd9G6tBBdOemS5nFd5JN1v9FdfNHr1oxLGAmLIA5G6x8syL5SBr/X2BrGdaLphGHY8uHtTf/evq44zU7JetOO34I2ssTgAoo24vFcI6wqVJvV+Y9TojC+BafJqvjOfNxE5Riq1lzcOO404tEVdd4AMdQed4Xc3ZVjO62crs5NkchS06A9w3dne4oMgSHkvEDJi+92bRuW4OV7OSLUgKpCkFND5GE826x8blVhxIPWAr+LRYHu41ioXGdJglIW+P2tTF0FVG2JGYnZeLXzJqKDamdK7w2alu7X7ZbGISaLMFySZjCndXx1uNciKI7DCZHTe+/agLWDSHCZ0lVGF4Up1phwIsF2/UQJWUn6+0K1D9A073982r3fKAuRLmQQmVPW8WcEfdRYS5xksOMd1u0tbvfqlQEp9zmQIV0NIZTYSw9SnbdJ/g2c5wX4ZXIC/+RRvbX1/tv/+BgMDBWdiqAPMY3cbM3iyrxmh7qeVs7vDi03g4sDi4IhMuEK++cTIpdMXerVamLH9XsUxHbsOskFGR7dGd6cM3JSIQ5Iv+Xx/hUft5dM3HciZ3cb2+OIorydEB+c9DgwyhHSjQHC0el3TCaFozJaFBLV4A7EYS8tnXuM1LDpVZjJS8lGp1No5fWh046jS6I/BcxgEMOnOQLlUoWDwvMyS0zlcxJfDQSLapIs1bXP+B9QWF+pFHmVc+8Gp7AiEiIHjji7G20sLcVxpvjk9OBLACAY0FM6XHcm3zGNsCpI0eft+eNcNPdGyZyxCf4JeNaO6lMmC3O4nlXfl+aOr/sNtZBMauvF2viwRHgNOA92IZGIh2byGr0EoTn446T00KguJ5huu6XleYTbnD6uupXw6nVezjMGHUbeyEAXx0tb4YoIxZkkF4fK+fh6hMll9THHzon64PViN0kATdZfAs4NAdJRZ4tx/BbmnxYmHRbmUyfO7kf/9eG09gzIn84+qNtcQnz2HOVh9l+cR2LaiBUHwN/xlNo37TzhWvF+Wi0W5+OtutAvaF9g4yZewJIGO5vMIREVATchay4crRs01q8qTGlcTlZq5XwSpzqODQdTLgFtDoeA58ofkFUnKLr97vtu7awxGo8rxXrziG9aMMdC/DzF0w6RfYnlcYjbP0u2JlJd6BrdvNtfq4w8gkAgG5x/GX61trk8uGoErhooz7ev+v4MMUTpBp80iWWXu76Lmfbm1Uz/snN+uLiwsgMbo79Yv/nQjIDL7BHkVTQ4XDKtQnfZ1/yNQCqYeNm9UnHF4/mU6uo1eRJVBc/vw9GJzHuKXeZRPXD5jQrq+a83EcJ7MxBqBowSp0bnnCJ9BQ7P6x4NWKyMMjuzvfm4XcuznriHZMC0OYy2cuQ20vwtFMZ2zZUEmbf2NqNECAv44O8M/Vg3uryCncPioYxpuYM5Mb/R/RcENF/3KDxLGvFo8uF1dLv80vvY4w5Y/Zx+tJbfCsCweVgq6NvP55qfhyIISmjXL+vEdoWQc2ry9XWM4/FjzfzLzr0+Y3E58f5ckmlX4zLj/dlWSj1U+vzldOq54ngKE0lMcWxHhP6v7LSMjVpUm25UNKe+b5qMYeXeUyyfVQWwx+WtOYIr1s9By87l28kGeotm5XYWCR5iq93hkuiaGju87ZHzGtsmEjxVG4/rzjauN+m9WR8PndcDGZ8C7V1fw+tuN/D/AVxtX9T/+GKTaI3xgcp+ZTujoz8g0qq77mjLd6T3FrdaIrtN1x4enz55VDctNktCOw5oYJEFiB4nnhcCskyRxFc+skaNhEtieYlfTMIxDpfAZjlhzdd+2SYCaig7vkNExW/OmWjiVF5XP6NorowF5MhotdZ9V3SCofLF/+v502N+LvdCoheQQPG4rseuG3fzMSnflVf7mT58Rp6lGAjNdXVqq5CevBqFjTtNA8fl8uSyVyqXi2qdX76VyuSQUy9J71087FyVMdlxYNH8/vF15tjUR5oUSYqTS2ii1fzdfLOGS0LrdEeal+XIJPqEslEp/OhmsGKInNv+tWJwvF+Ht+Q8rNWuqFo4lQc4l0tvo1W8Rm0+RoK/MeFgSeFlqb14KDIuK91uFszIZHsoLxW7y7M9Y5nhGmlTWcFEFbcxgHoMSQULrLvQVpVkEasurPBxYi9xpduAU8Xj/ORG5f7juJPbD9XdktPmq95AOydBIdjKIRttHjKyy96s/9g9veJWROSRnd4vHH+oILff60UPvgmdk/qrX+/j1MpYZdb2R6vbqm5dvVb6dIZWXelO9O0+Zs4JzhHn0dSC6hqMfQpWXPq4Eg3lOkEvDwFk0guaENNd2rZVomWv/ISPDDJsVX39AUj0NjDQ9ZJAsddKVNOjusBInDBPDtp593+LaH98D9eHX49r0WAEZg7KaGeakemMwOG/+e50EYd8t7EOt51vHi15BUYIhjzj+qOLGy+jyfIfs+uJ6bN1hpm7brq2N4TDe1h3L0o/XoVKuL7iaF50y7E40aDNFFf0qEedEZ0rkDq7faUpkPxdLCEk4n3796HvvWcyzF2ENaIDi9Ml4xmRgRUe4XTlr81gWSn1tG/F1W3PtYAxUVujrtmuZ6RWwgey4punNCY/e7Q9bZPj0vuK6wdQ2vguB3gS2zXNSEUOIkZvQ8Ecj2eFgSV28Iha6eh9jhlm/daIjlC25PYHlBXVSaQpCXcstJCPPfT1xdTN9jji2fVzzk694hkdFgeEhBcm7iatN7XcqEAuLwL/e/bnX71+//A5ImvDRLOySkd/1T34oimE6hKtkWxUr/kFuD0T7Si3KjLTzEaIULFSCscpypb5j1wwnPpJY5ibWna0SK7XbGaQaCA9+fRBY09u0CebOMZKLY9EA3mIcShwvfFgM9kqqwJaGtma5dmOiQnoZhmn0A9O+1d3KPQ/MFV9m6MTxHV8/BMcLfUP0xeiEkQR0+sIfHXHF3mi1u7p6dsTiTHq+oodVUZxO6+rHs14GwXnVPK5Zx3snIAmF8dZxUIclybcPP9nh1hG5/ed+EO6dbcrtD0svVrZLPOJViefrjhZ+Ojslyvhkr3n+sV6SWbm1tHp2WFTbnTPfcLqjK0LSJx/OVu0psVPx63JJJU0n9ss4/qZIbvZhSRkY1SVWVoXLg7dtrLL4dSdsTtocxu32uZuclB7HvOqKluzAccQyGZm2JbeRTDrR6zasTPamVbGT3SzLNaUkLQdT2uAXTxDIQIEpoYPuqw0uv61CgDKwEnXeToogFYGpZJvj7qLfKWGcZUypWV2sHEDoYYhHW0ve4yIZpBXym/SE9sZ5EK8LSABj5ytGOC5KRIChTHgdBFOy8Hir03loNjt3zcjeu7trdjqduw97nmcW4kZvfPL70+F+M9b1sBA37+7gYOeT+Sxd3e7Aj3T2fCva+8uHzk+4a95GvhOcP75qJpr3/V/yn2l2tprTUlCKZTpkPl/UDdt0DD1XUiCgfEch6q5arbqgguw0CFyTnCYWAgdUFrwAYZS6VUNfNIjEJz8nFqpuarhutWDnn1gzU0M0jIIoutXq9H63SRqsBKBVlaobBoGXwFNQfloAkt8DlWh7nrPog5S1lTRNfaJzrUCxfH/RT7XAd6qabYcBHCJH4B2tYJthsOLbWup7VROqSVWBY4axMs3fwEPGtAqBJkImEDUiW51Cvs8CnsnvCMmVLNl6KZjwb2HOFh3x8b7JgpbfmUjOIK8L5Gfgg+ANE97QHHhHhH/ICdMzj4KCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgmI6+A81z3vZSiqVHgAAAABJRU5ErkJggg=='),
('kawasaki', 'https://www.carmo.nl/images/010_kawasaki.png');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `carrello`
--
ALTER TABLE `carrello`
  ADD PRIMARY KEY (`id_carrello`);

--
-- Indici per le tabelle `catalogo`
--
ALTER TABLE `catalogo`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Nome_utente`);

--
-- Indici per le tabelle `contenuto`
--
ALTER TABLE `contenuto`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `logo`
--
ALTER TABLE `logo`
  ADD PRIMARY KEY (`nome`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `carrello`
--
ALTER TABLE `carrello`
  MODIFY `id_carrello` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT per la tabella `catalogo`
--
ALTER TABLE `catalogo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
