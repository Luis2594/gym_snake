-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-02-2017 a las 02:19:07
-- Versión del servidor: 5.5.27
-- Versión de PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `gymsnake`
--
CREATE DATABASE gymsnake;
USE gymsnake;

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteclient`(IN `id_` INT)
    NO SQL
DELETE FROM tbclient WHERE id = id_$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertclient`(IN `dni_` INT, 
IN `name_` VARCHAR(50), 
IN `firstname_` VARCHAR(50), 
IN `secondname_` VARCHAR(50), 
IN `phone_` VARCHAR(8), 
IN `dateregistration_` DATE, 
IN `datepayment_` DATE, 
IN `image_` VARCHAR(50))
    NO SQL
INSERT INTO tbclient 
(dni, name, firstname, secondname, phone, dateregistration, datepayment, image) 
VALUES 
(dni_,name_,firstname_, secondname_, phone_, dateregistration_, datepayment_, image_)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertiuser`(IN `dni_` INT, IN `name_` VARCHAR(50), IN `firstname_` VARCHAR(50), IN `secondname_` VARCHAR(50), IN `nameuser_` VARCHAR(50), IN `pass_` VARCHAR(50))
    NO SQL
INSERT INTO `tbuser` (`dni`, `name`, `firtsname`, `secondname`, `nameuser`, `pass`) VALUES (dni_, name_, firstname_, secondname_, nameuser_, pass_)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `showclientdefaulters`()
    NO SQL
IF EXISTS (SELECT count(*) FROM tbclient WHERE (DATEDIFF(datepayment, NOW())) <= 0)
THEN
  SELECT * FROM tbclient WHERE (DATEDIFF(datepayment,NOW())) <= 0;
END IF$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `showclientdni`(IN `dni_` INT)
    NO SQL
SELECT * FROM tbclient WHERE dni = dni_$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getclientid`(IN `id_` INT)
    NO SQL
SELECT * FROM tbclient WHERE id = id_$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateclient`(IN `id_` INT,IN `dni_` INT, IN `name_` VARCHAR(50), IN `firstname_` VARCHAR(50), IN `secondname_` VARCHAR(50), IN `phone_` VARCHAR(8), IN `dateregistration_` DATE, IN `datepayment_` DATE, IN `image_` VARCHAR(50))
    NO SQL
UPDATE tbclient SET
dni = dni_,
name = name_,
firstname = firstname_,
secondname = secondname_,
phone = phone_,
dateregistration = dateregistration_,
datepayment = datepayment_,
image = image_
WHERE
id = id_$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbclient`
--

CREATE TABLE IF NOT EXISTS `tbclient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dni` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `secondname` varchar(50) NOT NULL,
  `phone` varchar(8) NOT NULL,
  `dateregistration` date NOT NULL,
  `datepayment` date NOT NULL,
  `image` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbuser`
--

CREATE TABLE IF NOT EXISTS `tbuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dni` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `firtsname` varchar(50) NOT NULL,
  `secondname` varchar(50) NOT NULL,
  `nameuser` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

--
-- Volcado de datos para la tabla `tbuser`
--

INSERT INTO `tbuser` (`dni`, `name`, `firtsname`, `secondname`, `nameuser`, `pass`) VALUES
(304790528, 'Luis', 'Castillo', 'Calderon', 'root', '1234'),
(304160985, 'Hector', 'Jimenez', 'Monge', 'gym', 'snake'),
(304200005, 'Randall', 'Barboza', 'Hernandez', 'coach', 'coach'),
(304820967, 'Carlos', 'Caves', 'Solis', 'futbol', 'futbol06');

INSERT INTO `tbclient` (`dni`, `name`, `firstname`, `secondname`, `phone`, `dateregistration`, `datepayment`, `image`) VALUES
(115130454, 'luigui', 'sojo', 'castro', '88002303', '2017-02-20', '2017-03-20', '115864F.tmp.png'),
(206400240, 'karol', 'sojo', 'fallas', '89509127', '2017-02-20', '2017-03-06', '206571D.tmp.png'),
(301800003, 'lorena', 'solano', 'salguero', '88281017', '2017-02-24', '2017-03-24', '3016630.tmp.png'),
(301900644, 'ELIZABETH', 'CASTILLO', 'ARAYA', '88326556', '2017-02-24', '2017-03-24', '301330B.tmp.png'),
(302280925, 'Orieta', 'ArAya', 'vargas', '89900755', '2017-02-20', '2017-03-20', '302BAF6.tmp.png'),
(302320486, 'ELENA', 'BRENES', 'ESPINOZA', '89473950', '2017-02-21', '2017-03-07', '302C497.tmp.png'),
(302440904, 'TERESA', 'CAMACHO', 'CHACON', '88067826', '2017-02-26', '2017-03-26', '302BAE.tmp.png'),
(302780218, 'sonia', 'luna', 'jimenez', '86351561', '2017-02-24', '2017-03-10', '3028997.tmp.png'),
(302990434, 'MANUEL', 'SANCHEZ', 'COTO', '88961143', '2017-02-21', '2017-03-21', '30232A1.tmp.png'),
(303190887, 'IVANNIA', 'LOAIZA', 'FUENTES', '86726894', '2017-02-22', '2017-03-22', '3034E48.tmp.png'),
(303270488, 'leticia', 'castillo', 'fernandez', '87051744', '2017-02-24', '2017-03-10', '3031628.tmp.png'),
(303690046, 'MAURICIO', 'PICADO', 'SANDINO', '88412613', '2017-02-22', '2017-03-22', '3034EDD.tmp.png'),
(303720642, 'Michael', 'Sanchez', 'Gonzales', '88691631', '2017-02-21', '2017-03-21', '3035EB8.tmp.png'),
(303730271, 'MARIA', 'RIVERA', 'ZAMORA', '87309750', '2017-02-22', '2017-03-22', '30339FA.tmp.png'),
(303810459, 'LADY', 'LOPEZ', 'ARAYA', '87791352', '2017-02-22', '2017-03-22', '303B9AE.tmp.png'),
(303990273, 'ESTEBAN', 'VARGAS ', 'OVARES', '60101205', '2017-02-22', '2017-03-08', '303D8B6.tmp.png'),
(304150077, 'STEFANY', 'RAMOS', 'LOAIZA', '88262188', '2017-02-21', '2017-03-07', '30474C7.tmp.png'),
(304150407, 'JONATHAN', 'RODRIGUEZ', 'ARTAVIA', '70164788', '2017-02-24', '2017-03-24', '304E583.tmp.png'),
(304250608, 'ADRIAN', 'JIMENEZ', 'CARBALLO', '87441993', '2017-02-23', '2017-03-23', '3044636.tmp.png'),
(304360014, 'STEFANIE', 'RAMIREZ', 'BRENES', '89121212', '2017-02-21', '2017-03-21', '3049954.tmp.png'),
(304580984, 'ANDREA', 'DIAZ', 'GUTIERREZ', '89461820', '2017-02-21', '2017-03-07', '3042D.tmp.png'),
(304630045, 'MARIEL', 'GOMEZ', 'CALDERON', '89794412', '2017-02-23', '2017-03-23', '3042B12.tmp.png'),
(304740616, 'MILENA', 'CAMACHO', 'ALVAREZ', '83736134', '2017-02-23', '2017-03-09', '304DAA5.tmp.png'),
(304960064, 'adriana', 'mora', 'aguilar', '83022129', '2017-02-21', '2017-03-21', '3049A2F.tmp.png'),
(304980359, 'ARTURO', 'ROMERO', 'ZAMORA', '87444057', '2017-02-23', '2017-03-23', '304307D.tmp.png'),
(305000862, 'manuel', 'romero', 'diaz', '84833647', '2017-02-21', '2017-03-21', '3055331.tmp.png'),
(305260128, 'randall', 'mora', 'sanchez', '88164262', '2017-02-21', '2017-03-21', '30592A9.tmp.png'),
(305290801, 'SARAY', 'JIMENEZ', 'JIMENEZ', '88866001', '2017-02-23', '2017-03-09', '305A422.tmp.png'),
(305370645, 'Carolina', 'Jimenez', 'Solano', '', '2017-02-21', '2017-04-21', '305C058.tmp.png'),
(701980168, 'pablo', 'cordero', 'chacon', '60133805', '2017-02-21', '2017-03-21', '701847.tmp.png');

