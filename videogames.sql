-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-08-2021 a las 02:01:33
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `videogames`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `findById` (IN `v_IdGames` INT)  BEGIN
    -- SQLINES LICENSE FOR EVALUATION USE ONLY
    SELECT * FROM videogames WHERE id = v_IdGames;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create` (IN `v_name` VARCHAR(4000), IN `v_img_game` LONGBLOB, IN `v_date_premier` INT, IN `v_category_idCategory` INT)  BEGIN
 DECLARE v_idGames INT(11)  DEFAULT  0;
 DECLARE v_estado INT(11)  DEFAULT  1;
 
 
    -- SQLINES LICENSE FOR EVALUATION USE ONLY
    SELECT  MAX(idGames) INTO v_idGames FROM games;
    IF v_idGames IS NULL THEN SET v_idGames = 0; END IF;
    SET v_idGames = v_idGames + 1;

    INSERT INTO games (idGames, img_game, date_premier, category_idCategory, status)
    VALUES (v_idGames, v_img_game, v_date_premier, v_category_idCategory, v_status);
   
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete2` (IN `v_idGames` INT)  BEGIN
    UPDATE games
    SET status = 0
    WHERE v_idGames = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_findGames` ()  BEGIN
	SELECT * FROM games G
	INNER JOIN category C on C.idCategory = G.Category_idCategory;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update` (IN `v_idGames` INT, IN `v_name` VARCHAR(4000), IN `v_img_game` LONGBLOB, IN `v_date_premier` INT, IN `v_category_idCategory` INT, IN `v_status` INT)  BEGIN
    UPDATE games
    SET   idGames = v_idGames, name = v_name, img_game = v_img_game, 
          date_premier = v_date_premier, category_idCategory = v_category_idCategory, status = v_status
    WHERE v_idGames = id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `category` (
  `idCategory` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `games`
--

CREATE TABLE `games` (
  `idGames` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `img_game` longblob NOT NULL,
  `date_premiere` date NOT NULL,
  `Category_idCategory` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`idCategory`);

--
-- Indices de la tabla `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`idGames`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `idCategory` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `games`
--
ALTER TABLE `games`
  MODIFY `idGames` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
