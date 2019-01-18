-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-03-2017 a las 17:11:30
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

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteclient`(IN `id_` INT)
    NO SQL
DELETE FROM tbclient WHERE id = id_$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getclientid`(IN `id_` INT)
    NO SQL
SELECT * FROM tbclient WHERE id = id_$$

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
) ENGINE=InnoDB  DEFAULT CHARSET=ascii AUTO_INCREMENT=284 ;

--
-- Volcado de datos para la tabla `tbclient`
--

INSERT INTO `tbclient` (`id`, `dni`, `name`, `firstname`, `secondname`, `phone`, `dateregistration`, `datepayment`, `image`) VALUES
(1, 115130454, 'luigui', 'sojo', 'castro', '88002303', '2017-02-20', '2017-03-20', '115864F.tmp.png'),
(2, 206400240, 'karol', 'sojo', 'fallas', '89509127', '2017-02-20', '2017-04-05', '206571D.tmp.png'),
(3, 301800003, 'lorena', 'solano', 'salguero', '88281017', '2017-02-24', '2017-03-24', '3016630.tmp.png'),
(4, 301900644, 'ELIZABETH', 'CASTILLO', 'ARAYA', '88326556', '2017-02-24', '2017-03-24', '301330B.tmp.png'),
(5, 302280925, 'Orieta', 'ArAya', 'vargas', '89900755', '2017-02-20', '2017-04-20', '302BAF6.tmp.png'),
(6, 302320486, 'ELENA', 'BRENES', 'ESPINOZA', '89473950', '2017-03-08', '2017-03-23', '302C497.tmp.png'),
(7, 302440904, 'TERESA', 'CAMACHO', 'CHACON', '88067826', '2017-02-26', '2017-04-26', '302BAE.tmp.png'),
(8, 302780218, 'sonia', 'luna', 'jimenez', '86351561', '2017-03-13', '2017-03-27', '3028997.tmp.png'),
(9, 302990434, 'MANUEL', 'SANCHEZ', 'COTO', '88961143', '2017-02-21', '2017-03-21', '30232A1.tmp.png'),
(10, 303190887, 'IVANNIA', 'LOAIZA', 'FUENTES', '86726894', '2017-02-22', '2017-04-22', '3034E48.tmp.png'),
(11, 303270488, 'leticia', 'castillo', 'fernandez', '87051744', '2017-02-24', '2017-03-26', '3031628.tmp.png'),
(12, 303690046, 'MAURICIO', 'PICADO', 'SANDINO', '88412613', '2017-02-22', '2017-03-22', '3034EDD.tmp.png'),
(13, 303720642, 'Michael', 'Sanchez', 'Gonzales', '88691631', '2017-02-21', '2017-03-21', '3035EB8.tmp.png'),
(14, 303730271, 'MARIA', 'RIVERA', 'ZAMORA', '87309750', '2017-02-22', '2017-03-22', '30339FA.tmp.png'),
(15, 303810459, 'LADY', 'LOPEZ', 'ARAYA', '87791352', '2017-02-22', '2017-03-22', '303B9AE.tmp.png'),
(16, 303990273, 'ESTEBAN', 'VARGAS ', 'OVARES', '60101205', '2017-03-13', '2017-03-23', '303D8B6.tmp.png'),
(17, 304150077, 'STEFANY', 'RAMOS', 'LOAIZA', '88262188', '2017-02-21', '2017-03-27', '30474C7.tmp.png'),
(18, 304150407, 'JONATHAN', 'RODRIGUEZ', 'ARTAVIA', '70164788', '2017-02-24', '2017-03-24', '304E583.tmp.png'),
(19, 304250608, 'Adrian', 'Jimenez', 'Carballo', '87441993', '2017-02-23', '2017-03-23', '3044636.tmp.png'),
(20, 304360014, 'STEFANIE', 'RAMIREZ', 'BRENES', '89121212', '2017-02-21', '2017-04-21', '3049954.tmp.png'),
(21, 304580984, 'Andrea', 'Diaz', 'Gutierrez', '89461820', '2017-03-08', '2017-03-23', '3042D.tmp.png'),
(22, 304630045, 'MARIEL', 'GOMEZ', 'CALDERON', '89794412', '2017-02-23', '2017-03-23', '3042B12.tmp.png'),
(23, 304740616, 'MILENA', 'CAMACHO', 'ALVAREZ', '83736134', '2017-02-23', '2017-03-30', '304DAA5.tmp.png'),
(24, 304960064, 'Adriana', 'Mora', 'Aguilar', '83022129', '2017-02-21', '2017-04-07', '3049A2F.tmp.png'),
(25, 304980359, 'Arturo', 'Romero', 'Zamora', '87444057', '2017-02-23', '2017-03-23', '304307D.tmp.png'),
(26, 305000862, 'manuel', 'romero', 'diaz', '84833647', '2017-02-21', '2017-03-21', '3055331.tmp.png'),
(27, 305260128, 'randall', 'mora', 'sanchez', '88164262', '2017-02-21', '2017-04-21', '30592A9.tmp.png'),
(28, 305290801, 'Saray', 'Jimenez', 'Jimenez', '88866001', '2017-02-23', '2017-03-09', '305A422.tmp.png'),
(29, 305370645, 'Carolina', 'Jimenez', 'Solano', '', '2017-02-21', '2017-04-21', '305C058.tmp.png'),
(30, 701980168, 'pablo', 'cordero', 'chacon', '60133805', '2017-02-21', '2017-03-21', '701847.tmp.png'),
(31, 303450047, 'Fabian', 'Solano', 'Ovares', '71114596', '2017-02-24', '2017-04-24', '3038080.tmp.png'),
(32, 603570445, 'Rosita', 'Ramirez', 'Miranda', '85205252', '2017-02-24', '2017-03-24', '6039871.tmp.png'),
(33, 304970471, 'IVANNIA', 'BRENES', 'CAMACHO', '84349027', '2017-02-27', '2017-03-27', '304F097.tmp.png'),
(34, 304250372, 'HUGO', 'MORA', 'CHAVES', '82840204', '2017-02-27', '2017-03-27', 'image.jpg'),
(35, 304860249, 'STEVEN', 'RAMIREZ', 'SARMIENTO', '25562781', '2017-02-27', '2017-03-27', '30469A7.tmp.png'),
(36, 107970480, 'YORLENY', 'TENCIO', 'ZAMORA', '60634501', '2017-02-26', '2017-03-26', '10721EE.tmp.png'),
(37, 305090155, 'Teddy', 'Avenda??o', 'Araya', '83142906', '2017-02-27', '2017-03-27', '30598F2.tmp.png'),
(38, 305160517, 'DYLAN', 'CHAVARRIA ', 'DIAZ', '83167250', '2017-02-27', '2017-03-27', '305CA97.tmp.png'),
(39, 304530519, 'LUIS ALEJANDRO', 'MARTINEZ', 'SERRANO', '83979348', '2017-02-27', '2017-03-27', '3045EA1.tmp.png'),
(40, 305280977, 'WALTER', 'SANCHEZ', 'BRENES', '83165260', '2017-02-27', '2017-03-27', '30541C8.tmp.png'),
(41, 305210259, 'DENILSON', 'RODRIGUEZ', 'SANCHEZ', '89196419', '2017-02-27', '2017-03-27', '30521C1.tmp.png'),
(42, 303610477, 'Andrea', 'Torres', 'Navarro', '84244975', '2017-03-14', '2017-03-29', '3039E5B.tmp.png'),
(43, 304720541, 'Elias', 'Abarca', 'Hernandez', '87347525', '2017-03-20', '2017-04-05', '304DC42.tmp.png'),
(44, 115320473, 'REBECA', 'SABORIO', 'RIVAS', '83138806', '2017-02-27', '2017-03-27', '1152C46.tmp.png'),
(45, 206410079, 'RUBEN', 'RAMOS', 'ULATE', '83876631', '2017-02-27', '2017-03-29', '206C320.tmp.png'),
(46, 114680772, 'YESSICA', 'KURR', 'MENDIOLA', '88012636', '2017-02-27', '2017-03-29', '114D9BD.tmp.png'),
(47, 304350546, 'KAROL', 'CASTILLO', 'CARVAJAL', '70583168', '2017-02-27', '2017-03-30', '304A668.tmp.png'),
(48, 304630861, 'Daniel', 'Vargas', 'Guerrero', '89750225', '2017-02-27', '2017-03-27', '304A9A0.tmp.png'),
(49, 304630442, 'Styvent', 'Munoz', 'Sanabria', '89238904', '2017-03-21', '2017-04-05', '3043020.tmp.png'),
(50, 302160269, 'Juan', 'CHINCHILLA', 'CASTRO', '85004603', '2017-02-28', '2017-03-28', 'image.jpg'),
(51, 302950334, 'Marisol', 'Bogantes', 'Rodriguez', '83764957', '2017-02-28', '2017-03-29', '302E15F.tmp.png'),
(52, 303640609, 'Hellen', 'Castro', 'w', '88258187', '2017-02-28', '2017-03-29', '3032021.tmp.png'),
(53, 304820517, 'Mariana', 'Mesen', 'Madriz', '87338636', '2017-02-27', '2017-04-20', '30469A1.tmp.png'),
(54, 305070599, 'Melany', 'Ramirez', 'Quiros', '83912105', '2017-02-28', '2017-03-14', '305CD92.tmp.png'),
(55, 303650930, 'WALTER', 'SOLANO', 'ALVARADO', '85178776', '2017-02-28', '2017-03-28', '303F746.tmp.png'),
(56, 303890354, 'Adrian', 'Gomez', 'Cordero', '83256548', '2017-02-28', '2017-03-28', '303F7C6.tmp.png'),
(57, 304120235, 'PAMELA', 'BADILLA', 'MORA', '88383560', '2017-02-28', '2017-03-28', '3047E00.tmp.png'),
(58, 111780969, 'MONICA', 'PASOS', 'MARTINEZ', '88869261', '2017-02-28', '2017-03-28', '1114357.tmp.png'),
(59, 304380318, 'Manuel', 'Brenes', 'Avenda??o', '88804224', '2017-02-28', '2017-03-28', '3046871.tmp.png'),
(60, 303060494, 'MARIELA', 'TORTOS', 'GONZALEZ', '89267273', '2017-03-01', '2017-04-01', '303EC1A.tmp.png'),
(61, 303930423, 'Allan ', 'Aguilar', 'Nunez', '83184863', '2017-03-01', '2017-04-01', '30393A3.tmp.png'),
(62, 304140168, 'CATALINA', 'GARCIA', 'OBANDO', '89653342', '2017-02-28', '2017-03-29', '304F0B1.tmp.png'),
(63, 304830804, 'Yoselin', 'Castillo', 'Carvajal', '83354736', '2017-03-01', '2017-03-15', '304CCC4.tmp.png'),
(64, 302710421, 'LEDA', 'GUERRERO', 'VARGAS', '87312424', '2017-03-01', '2017-04-01', '302EB84.tmp.png'),
(65, 109390171, 'Greivin', 'Fernandez', 'Castillo', '83670474', '2017-03-01', '2017-03-16', '109CF83.tmp.png'),
(66, 303550789, 'Geizel', 'Aguilar', 'Sanabria', '87041021', '2017-03-01', '2017-04-01', '303A8E5.tmp.png'),
(67, 304160969, 'Ingrid', 'Dittel', 'Masis', '89720128', '2017-03-15', '2017-03-30', '304E3D9.tmp.png'),
(68, 303950124, 'JESSICA ', 'RUIZ', 'RODA', '84440002', '2017-03-01', '2017-04-01', '30398D3.tmp.png'),
(69, 303920336, 'MICHAEL', 'MONTENEGRO', 'SOJO', '83140583', '2017-03-01', '2017-04-01', '303A31C.tmp.png'),
(70, 303760015, 'MAURICIO', 'MARTINEZ', 'LEIVA', '87089209', '2017-03-01', '2017-04-01', '3032D0F.tmp.png'),
(71, 304260344, 'Tatiana', 'Mata', 'VonMarshall', '71104320', '2017-03-01', '2017-04-01', 'image.jpg'),
(72, 303940747, 'Yessenia', 'Cerdas', 'Garita', '63824719', '2017-03-01', '2017-03-31', '303461C.tmp.png'),
(73, 305440801, 'Yeibel', 'Mattis', 'Cerdas', '63229575', '2017-03-01', '2017-03-15', '3053F8D.tmp.png'),
(74, 303530943, 'YAHAIRA', 'BRENES', 'OROZCO', '84886081', '2017-03-02', '2017-04-02', '303E8FC.tmp.png'),
(75, 111770790, 'Evelyn', 'Mora', 'Piedra', '89307510', '2017-03-02', '2017-04-03', '111FACF.tmp.png'),
(76, 105530153, 'MARITZA', 'POLEZ', 'HERNANDEZ', '88646762', '2017-03-02', '2017-04-17', '105EDDE.tmp.png'),
(78, 304870845, 'Ronald', 'Barboza', 'Arias', '72610364', '2017-03-02', '2017-04-03', '3043D50.tmp.png'),
(79, 304380335, 'Leonardo', 'Brenes', 'GONZALEZ', '83510083', '2017-03-02', '2017-04-03', '304918B.tmp.png'),
(80, 304050182, 'Martin', 'ARAYA', 'SANABRIA', '89439784', '2017-03-16', '2017-04-16', '304C49F.tmp.png'),
(81, 305140458, 'Leiner ', 'ramirez ', 'ULLOA', '62836447', '2017-03-01', '2017-04-01', '3057515.tmp.png'),
(82, 305100191, 'Andres', 'Carmona', 'Zamora', '89544189', '2017-03-01', '2017-04-01', '305814E.tmp.png'),
(83, 303380453, 'SHIRLEY', 'JIMENEZ', 'ULLOA', '83383850', '2017-03-02', '2017-04-02', '3037EF8.tmp.png'),
(84, 304370352, 'ESTEBAN', 'BONILLA', 'REDONDO', '84972913', '2017-03-02', '2017-04-02', '304AEDE.tmp.png'),
(85, 111840859, 'Esteban', 'Canizales', 'Rojas', '88863600', '2017-03-02', '2017-04-07', '1114694.tmp.png'),
(86, 305200644, 'TADEANA', 'CALVO', 'SANCHEZ', '72318587', '2017-03-02', '2017-04-02', '3058A27.tmp.png'),
(87, 305150590, 'SOFIA', 'MEZA', 'ZU??IGA', '87238924', '2017-03-02', '2017-04-02', '3058647.tmp.png'),
(88, 304600608, 'MARIELA', 'VEGA', 'PEREIRA', '88521879', '2017-03-02', '2017-04-02', '304C449.tmp.png'),
(89, 303840217, 'JOHANA', 'ARCE', 'GOMEZ', '87104157', '2017-03-03', '2017-04-03', '303303E.tmp.png'),
(90, 303290419, 'Angela', 'Brenes', 'Cordero', '88301974', '2017-03-03', '2017-04-03', '303DCD7.tmp.png'),
(91, 304230288, 'VINICIO', 'ARAYA', 'JIMENEZ', '72946537', '2017-03-03', '2017-04-03', '304C974.tmp.png'),
(92, 301870616, 'Manuel', 'Ramirez', 'Cerdas', '86720704', '2017-03-03', '2017-04-03', '30168F3.tmp.png'),
(93, 108190767, 'karen', 'valladares', 'jacamo', '83947817', '2017-03-03', '2017-04-03', '108C7CC.tmp.png'),
(94, 302840296, 'SONIA', 'BADILLA', 'CALDERON', '88176940', '2017-03-03', '2017-04-03', '30226FD.tmp.png'),
(95, 304200943, 'REBECA', 'Cespedes', 'Jimenez', '83118626', '2017-03-03', '2017-04-03', '3041877.tmp.png'),
(96, 303580842, 'Eudalia', 'Oviedo', 'Avila', '84998553', '2017-03-03', '2017-04-03', '303811F.tmp.png'),
(97, 304910633, 'Jose', 'Moya', 'Marin', '85669296', '2017-03-03', '2017-04-03', '3045F6C.tmp.png'),
(98, 305000967, 'Felipe', 'BRENES', 'Avenda??o', '87529522', '2017-02-28', '2017-03-28', '305A293.tmp.png'),
(99, 304890201, 'Daniel', 'Brenes', 'Avenda??o', '86471689', '2017-02-28', '2017-03-28', '304A63A.tmp.png'),
(100, 303210831, 'Maykel', 'CONTRERAS', 'SANDOVAL', '89880810', '2017-03-03', '2017-04-03', '30355E3.tmp.png'),
(101, 104280466, 'JENNIFER', 'COLINDRES', 'AMADOR', '83523045', '2017-03-03', '2017-04-03', '104BE43.tmp.png'),
(102, 101783584, 'NATALIA', 'MIRANDA', 'ARAYA', '86683939', '2017-03-03', '2017-04-03', '10111A7.tmp.png'),
(103, 303560370, 'WENDY', 'SALAZAR', 'ROJAS', '88580058', '2017-03-03', '2017-04-10', '30328CB.tmp.png'),
(104, 303530392, 'CRISTIAN', 'ARIAS', 'SANCHEZ', '88440033', '2017-03-03', '2017-04-03', '3033D6C.tmp.png'),
(106, 304350403, 'Paola', 'Angulo', 'Camacho', '62227948', '2017-03-03', '2017-04-16', '304CC7D.tmp.png'),
(107, 108860186, 'Ana', 'Jimenez', 'Solano', '86528232', '2017-03-03', '2017-04-03', '108170E.tmp.png'),
(108, 304340274, 'MIGUEL', 'MATA', 'MARSCHALL', '86299432', '2017-03-04', '2017-04-04', '30496B.tmp.png'),
(109, 304540941, 'Ariana', 'Ramirez', 'Aguilar', '72076453', '2017-03-05', '2017-04-05', '304445B.tmp.png'),
(110, 105630749, 'jose', 'chacon ', 'mora ', '83178802', '2017-03-06', '2017-04-06', '1051257.tmp.png'),
(111, 304220653, 'DANNY', 'LUNA', 'HERNANDEZ', '72746997', '2017-03-06', '2017-04-06', '304758B.tmp.png'),
(112, 302920725, 'MARTA', 'SOLANO', 'BRENES', '89820804', '2017-03-06', '2017-04-04', '302E800.tmp.png'),
(113, 303380452, 'YORLENY', 'COTO', 'VEGA', '88124870', '2017-03-06', '2017-04-06', 'image.jpg'),
(114, 303610672, 'Dalia', 'Aguilar', 'Aguilar', '89300574', '2017-03-06', '2017-04-06', '303DC9B.tmp.png'),
(115, 304510896, 'Juan Carlos', 'Castro', 'Castro', '61259696', '2017-03-06', '2017-04-06', '304101E.tmp.png'),
(116, 303580832, 'Alejandro', 'Masis', 'Loaiza', '83131294', '2017-03-06', '2017-04-06', '303A34F.tmp.png'),
(117, 206280860, 'PABLO', 'RAMIREZ', 'GOMEZ', '71056065', '2017-03-06', '2017-03-21', '2067DC9.tmp.png'),
(118, 304410956, 'JUAN JOSE', 'BARBOZA ', 'NUNEZ', '86657204', '2017-03-06', '2017-04-06', '30495FD.tmp.png'),
(119, 304160455, 'DANIELA', 'ROJAS', 'SOLANO', '89826180', '2017-03-06', '2017-04-06', '3041E6D.tmp.png'),
(120, 302590635, 'CLARA', 'QUESADA', 'QUESADA', '84843534', '2017-03-06', '2017-04-06', '302E1F8.tmp.png'),
(121, 303770818, 'NATALI', 'CHAVARRIA', 'CORRALES', '88376662', '2017-03-06', '2017-04-06', '3039A16.tmp.png'),
(122, 303490683, 'MIGUEL', 'CHAVARRIA ', 'MATA', '86823607', '2017-03-06', '2017-04-06', '303A058.tmp.png'),
(123, 101226730, 'KAREN', 'SOLANO', 'CHAVEZ', '83467049', '2017-03-06', '2017-04-06', '10195C7.tmp.png'),
(124, 303820569, 'SELENIA', 'CAMACHO ', 'AGUILAR', '88545505', '2017-03-06', '2017-04-06', '303E1A9.tmp.png'),
(125, 304300811, 'JOSE FRANCISCO', 'RAMIREZ', 'BONILLA', '87050612', '2017-03-06', '2017-04-06', '304A592.tmp.png'),
(126, 304030330, 'GLORIANA', 'ALFARO', 'GONZALEZ', '89720132', '2017-03-06', '2017-04-06', '304D437.tmp.png'),
(127, 303980248, 'ROCIO', 'VARGAS', 'DIAZ', '88977161', '2017-03-06', '2017-04-06', '3035403.tmp.png'),
(128, 303970128, 'CAROLINA', 'GONZALEZ', 'BONILLA', '88843134', '2017-03-06', '2017-04-06', '3034D2.tmp.png'),
(129, 303870301, 'HELLEN', 'CAMBRONERO', 'BARRIOS', '86265600', '2017-03-06', '2017-04-06', '3039354.tmp.png'),
(130, 304480697, 'MICHAEL', 'ADAMS', 'MOYA', '86219846', '2017-03-06', '2017-04-06', 'image.jpg'),
(131, 303770863, 'TANIA ', 'BRIZUELA', 'CAMACHO', '83124717', '2017-03-07', '2017-04-07', '3036294.tmp.png'),
(132, 304250904, 'CORINA', 'VALVERDE', 'CEDE??O', '88669478', '2017-03-07', '2017-04-07', '304ECE5.tmp.png'),
(133, 304600126, 'DORIAN', 'VALVERDE', 'CEDE??O', '86431819', '2017-03-07', '2017-04-07', '304F450.tmp.png'),
(134, 601280599, 'Leonor', 'Aguero', 'Parajeles', '25567849', '2017-03-07', '2017-04-07', 'image.jpg'),
(135, 302680560, 'Ana', 'Loaiza', 'Madriz', '70760412', '2017-03-07', '2017-04-07', '302DD0B.tmp.png'),
(136, 135969486, 'Evelyn', 'Quintana', 'Espinoza', '84228658', '2017-03-07', '2017-04-07', '1359A4F.tmp.png'),
(137, 304930134, 'Maria Fernanda', 'AGUILAR', 'Artavia', '88656591', '2017-03-08', '2017-04-08', 'image.jpg'),
(138, 114680773, 'JESSENIA', 'KURR', 'MENDIOLA', '89628899', '2017-03-07', '2017-03-21', '1149A15.tmp.png'),
(139, 304250909, 'LISSETE', 'GONZALEZ', 'FONSECA', '83473260', '2017-03-07', '2017-04-07', '304DDDD.tmp.png'),
(140, 304460418, 'Jose Luis', 'Quiroz', 'Sanchez', '87585520', '2017-03-07', '2017-04-07', '304A37D.tmp.png'),
(141, 108430132, 'FRANCISCO', 'HERNANDEZ', 'ALPIZAR', '83331364', '2017-03-07', '2017-04-07', '1086B47.tmp.png'),
(142, 114500317, 'DANIELA', 'LOAIZA', 'GOMEZ', '84077989', '2017-03-07', '2017-04-07', '1144662.tmp.png'),
(143, 305350930, 'RASHEL', 'ALVARADO', 'ULLOA', '84495012', '2017-03-07', '2017-03-22', '305361.tmp.png'),
(144, 302840853, 'Ana', 'Mora', 'Calvo', '83486947', '2017-03-09', '2017-04-09', '302F191.tmp.png'),
(145, 304170068, 'Gabriela ', 'Carazo', 'Ellis', '84364429', '2017-03-06', '2017-04-06', '30442CF.tmp.png'),
(146, 304060776, 'jennifer', 'SAMUELS', 'SANDOVAL', '87923418', '2017-03-08', '2017-03-23', '3046B5E.tmp.png'),
(147, 560451661, 'Miriam', 'Oswalds', 'julca', '25570690', '2017-03-08', '2017-04-08', '5602363.tmp.png'),
(148, 116540250, 'Jason', 'Correa', 'Arias', '86415174', '2017-02-27', '2017-04-20', '116DE16.tmp.png'),
(149, 109640788, 'Rebeca', 'Arias', 'Amador', '88060494', '2017-02-27', '2017-04-20', '10990E3.tmp.png'),
(150, 701420418, 'Rosalia', 'Avenda??o', 'Bonilla', '71057381', '2017-03-08', '2017-04-08', '701972.tmp.png'),
(151, 302620962, 'JUAN Bosco', 'PEREIRA', 'GARITA', '83741367', '2017-03-08', '2017-04-08', '302F6D5.tmp.png'),
(152, 303290422, 'Adriana', 'Serrano', 'Rodriguez', '88262739', '2017-03-08', '2017-04-08', '303EA6B.tmp.png'),
(153, 118120367, 'DANIEL', 'BARRANTES', 'QUIROS', '85945224', '2017-03-08', '2017-03-22', '118A880.tmp.png'),
(154, 304390700, 'ISABEL', 'RAMIREZ', 'SANCHEZ', '72044561', '2017-03-08', '2017-04-08', '304697A.tmp.png'),
(155, 304400014, 'DANIELA', 'CAMPOS', 'MATA', '72053569', '2017-03-08', '2017-03-22', '304A21A.tmp.png'),
(156, 304660459, 'Susan ', 'Solano', 'Cordoba', '84561869', '2017-03-08', '2017-04-08', '3041F9E.tmp.png'),
(157, 304430229, 'Dayana', 'SANABRIA', 'MADRIZ', '85365650', '2017-03-08', '2017-04-08', '3047350.tmp.png'),
(158, 303190090, 'JACKELINE', 'RODA', 'UMA??A', '88398977', '2017-03-08', '2017-04-08', '3034127.tmp.png'),
(159, 304060735, 'Alejandra', 'Guerrero', 'Jimenez', '72066132', '2017-03-08', '2017-04-08', '304820D.tmp.png'),
(160, 110450170, 'Adriana', 'Ramirez', 'Gonzales', '88244213', '2017-03-08', '2017-04-08', '110DE8C.tmp.png'),
(161, 303080776, 'GEIZEL', 'solano', 'ROJAS', '86952863', '2017-03-07', '2017-04-07', '30370BC.tmp.png'),
(162, 111030242, 'SONIA', 'CAMACHO ', 'DELGADO', '83205402', '2017-03-09', '2017-04-10', '111E17E.tmp.png'),
(163, 303480400, 'Xinia', 'Jimenez', 'Solano', '88202868', '2017-03-09', '2017-04-09', '3036731.tmp.png'),
(164, 302710132, 'YAMI', 'CORTEZ ', 'VALVERDE', '88306227', '2017-03-09', '2017-04-07', '302AC68.tmp.png'),
(165, 304250288, 'Mariana', 'Melegatti', 'Murillo', '87198968', '2017-03-08', '2017-04-08', '304F817.tmp.png'),
(166, 701910695, 'KATHERINE', 'MOYA', 'SOLORZANO', '83749783', '2017-03-10', '2017-04-10', '701E412.tmp.png'),
(167, 303500339, 'Jackelin', 'Guillen', 'Calderon', '87433954', '2017-03-10', '2017-04-10', '3036F5B.tmp.png'),
(168, 303340529, 'RAYMOND', 'MC CARTHY', 'RAMIREZ', '', '2017-03-11', '2017-04-11', '30363CF.tmp.png'),
(169, 101246039, 'LAURA', 'QUESADA', 'FONSECA', '71081233', '2017-03-11', '2017-04-11', '101795C.tmp.png'),
(170, 304400102, 'MARYLIZ', 'ELLIS', 'ESTRADA', '86343088', '2017-03-11', '2017-04-11', '304F4FF.tmp.png'),
(171, 305000805, 'Alise', 'Rojas', 'Arce', '89625693', '2017-03-11', '2017-03-25', '305E2AA.tmp.png'),
(172, 303630139, 'ingrid', 'mora', 'aguilar', '83092098', '2017-03-13', '2017-04-13', '303D5A.tmp.png'),
(173, 800560036, 'Graciela', 'Jimenez', 'Lerma', '83278267', '2017-03-13', '2017-04-13', '800EA4A.tmp.png'),
(174, 304460513, 'Daniella', 'Mendez', 'Rojas', '87587338', '2017-03-13', '2017-03-28', '304AD84.tmp.png'),
(175, 302260411, 'Cecilia', 'Arguedas', 'Solano', '83290919', '2017-03-13', '2017-04-13', '3025691.tmp.png'),
(176, 115970294, 'CRISTA', 'PACHECO', 'CABALZETA', '87072681', '2017-03-13', '2017-04-13', '11578D9.tmp.png'),
(177, 812064870, 'SANTIAGO', 'BETANCURT', 'MEJIA', '70583168', '2017-03-13', '2017-03-27', '812CC7.tmp.png'),
(178, 701560922, 'JUAN LUIS', 'ARIAS', 'SALAZAR', '83017551', '2017-03-13', '2017-04-13', '701539E.tmp.png'),
(179, 302530503, 'VIRIA', 'CARVAJAL', 'ROJAS', '25567384', '2017-03-10', '2017-04-10', '3027D45.tmp.png'),
(180, 305000993, 'RAQUEL', 'ALTSMIRANO', 'ZAMORA', '89488902', '2017-03-13', '2017-03-27', '30555BB.tmp.png'),
(181, 304300175, 'Alvaro', 'Zamora', 'Solis', '89387532', '2017-03-13', '2017-04-13', 'image.jpg'),
(182, 303680105, 'MANUEL', 'MOLINA', 'CHAVES', '83851437', '2017-03-13', '2017-03-27', '3031218.tmp.png'),
(183, 304130077, 'Alexandra', 'Chavez', 'Zamora', '83283905', '2017-03-13', '2017-04-13', '3047E1F.tmp.png'),
(184, 303990255, 'MARIA ELENA', 'CORRALES', 'HERNANDEZ', '86735333', '2017-03-13', '2017-03-27', '3039711.tmp.png'),
(185, 303860137, 'SHIRLEY', 'MORA', 'MEJIA', '72654921', '2017-03-13', '2017-03-27', '303E7F8.tmp.png'),
(186, 303930694, 'JUAN CARLOS', 'QUIROS', 'VAZQUEZ', '60221663', '2017-03-13', '2017-04-13', '30329F7.tmp.png'),
(187, 304050077, 'VIVIANA', 'FONSECA', 'MENDEZ', '83356169', '2017-03-14', '2017-04-14', '304F682.tmp.png'),
(188, 303200886, 'Yessica', 'Solano', 'Loaiza', '83961352', '2017-03-14', '2017-04-14', '3031F92.tmp.png'),
(189, 304830585, 'Alexa', 'Calderon', 'Porras', '25565386', '2017-03-14', '2017-04-14', '3049189.tmp.png'),
(190, 303800967, 'LAURA', 'SEAS', 'VALVERDE', '85746197', '2017-03-14', '2017-03-29', '30393E3.tmp.png'),
(191, 303580359, 'YORLENY', 'RAMIREZ', 'ROJAS', '84532947', '2017-03-14', '2017-04-14', '303F339.tmp.png'),
(192, 304390050, 'YOSELIN', 'CASCANTE', 'MORA', '84575833', '2017-03-14', '2017-04-14', '304EA90.tmp.png'),
(193, 305430250, 'KLISMAN', 'OROZCO', 'CHAVEZ', '87252935', '2017-03-14', '2017-03-28', '3052EEA.tmp.png'),
(194, 304170023, 'Heiner', 'Solano', 'Garro ', '86797545', '2017-03-14', '2017-03-28', '304B9FE.tmp.png'),
(195, 302960842, 'SILVIA', 'PICADO', 'VEGA', '86731006', '2017-03-14', '2017-04-14', '302589D.tmp.png'),
(196, 304580941, 'MARIA JOSE', 'VALERIN', 'JIMENEZ', '84112013', '2017-03-14', '2017-04-14', '304FA6B.tmp.png'),
(197, 304720376, 'PABLO', 'Quesada', 'Rivera', '87781732', '2017-03-14', '2017-04-14', '3041855.tmp.png'),
(198, 303090524, 'karla', 'MATA', 'GONZALEZ', '85179692', '2017-03-15', '2017-04-15', '3033B2F.tmp.png'),
(199, 302980175, 'ERICKA', 'VON MARSHALL', 'JIMENEZ', '83576462', '2017-03-15', '2017-03-31', '302E78F.tmp.png'),
(200, 106300690, 'Carolina', 'Leon', 'Quesada', '84085950', '2017-03-15', '2017-03-30', '106E1FD.tmp.png'),
(201, 303680023, 'Ana Yancy', 'Sanchez', 'Fallas', '89235154', '2017-03-15', '2017-04-15', '303A205.tmp.png'),
(202, 302610414, 'Blanca', 'Monge', 'Duran', '89970820', '2017-03-15', '2017-04-15', 'image.jpg'),
(203, 304780322, 'Maria Fernanda', 'Bonilla', 'Quiros', '86027723', '2017-03-15', '2017-04-15', '304F8CD.tmp.png'),
(204, 117390657, 'Carlos', 'Hernandez', 'Mendiola', '89948029', '2017-03-15', '2017-03-31', '117CE32.tmp.png'),
(205, 305030551, 'Andre', 'Alfaro', 'Salmeron', '72972198', '2017-03-15', '2017-04-15', '305ADA2.tmp.png'),
(206, 304840906, 'Carolina', 'Hernandez', 'Campos', '89469440', '2017-03-15', '2017-04-15', '304C223.tmp.png'),
(207, 303960400, 'PAULA', 'SOLIS', 'PALMA', '88976082', '2017-03-15', '2017-04-15', '3035B8D.tmp.png'),
(208, 302710622, 'GREIVIN ', 'CORREA', 'ALFARO', '88954383', '2017-03-15', '2017-04-15', '30294D0.tmp.png'),
(209, 302640522, 'LUZ', 'OROZCO', 'BRENES', '87270280', '2017-03-15', '2017-04-15', 'image.jpg'),
(210, 303760365, 'Aldo', 'Ugalde', 'Castro', '87222896', '2017-03-15', '2017-04-15', '30363AB.tmp.png'),
(211, 303820828, 'KATIA', 'SANCHEZ', 'CHAVARRIA', '89974930', '2017-03-15', '2017-04-15', '3037AE5.tmp.png'),
(212, 305420500, 'ESTEFANI', 'UGALDE', 'SANCHEZ', '89974930', '2017-03-15', '2017-04-15', 'image.jpg'),
(213, 345540133, 'Susana', 'Walters', 'Bogantes', '89892930', '2017-03-15', '2017-03-31', '345D538.tmp.png'),
(214, 304200991, 'Tatiana', 'Campos', 'Monge', '83091190', '2017-03-15', '2017-04-15', '304662.tmp.png'),
(215, 304320318, 'Richard', 'Molina', 'Rivera', '88727727', '2017-03-15', '2017-04-15', '3044A04.tmp.png'),
(216, 302800716, 'Marlen', 'Mora', 'Diaz', '83113114', '2017-03-15', '2017-04-15', '3025FB2.tmp.png'),
(217, 303410914, 'Alejandro', 'Arguedas', 'Mejia', '87963434', '2017-03-15', '2017-04-15', '3037383.tmp.png'),
(218, 303710225, 'HELLEN', 'ALVARADO', 'ZAMORA', '62870257', '2017-03-15', '2017-04-15', '3036874.tmp.png'),
(219, 303340285, 'Adrian', 'Abarca', 'Solano', '86267585', '2017-03-16', '2017-04-16', '30356D8.tmp.png'),
(220, 303340695, 'Elida', 'Smith', 'Cruz', '87538466', '2017-03-16', '2017-04-17', '3039449.tmp.png'),
(221, 304350908, 'Diego', 'Brenes', 'Porras', '89968604', '2017-03-16', '2017-04-17', '3047F65.tmp.png'),
(222, 604570177, 'Jose', 'Blandon', 'Mendoza', '50038165', '2017-03-16', '2017-04-01', '604D953.tmp.png'),
(223, 105310379, 'Fernando', 'Jimenez', 'Martinez', '83185050', '2017-03-16', '2017-04-17', '105D0D7.tmp.png'),
(224, 304790851, 'MAURICIO', 'ARIAS', 'ABARCA', '72698164', '2017-03-16', '2017-04-16', '30494B7.tmp.png'),
(225, 801120244, 'JORGE', 'SUAREZ', 'GORDILLO', '70183994', '2017-03-02', '2017-04-02', '801E57E.tmp.png'),
(226, 303540386, 'LUIS', 'MOLINA', 'CARPIO', '83881632', '2017-03-16', '2017-04-16', '3035FB6.tmp.png'),
(227, 108590845, 'LUIS CARLOS ', 'SAENZ', 'MURILLO', '72927351', '2017-03-16', '2017-04-16', '108EAA9.tmp.png'),
(228, 402230295, 'ESTHER', 'MOLINA', 'CASTRO', '89568731', '2017-03-16', '2017-04-16', '4027AB6.tmp.png'),
(229, 101970069, 'JENNIFER', 'TORRES', 'RODRIGUEZ', '89733509', '2017-03-16', '2017-04-16', '1017F8D.tmp.png'),
(230, 304020627, 'MAURICIO', 'GONZALEZ', 'WASHINGTON', '83204182', '2017-03-16', '2017-04-16', '304850E.tmp.png'),
(231, 305130419, 'VALERIA', 'SANDOVAL', 'CESPEDES', '87587358', '2017-03-02', '2017-04-02', '305A462.tmp.png'),
(232, 109950888, 'ERICK', 'CHAVERRI', 'ALPIZAR', '83513030', '2017-03-16', '2017-04-16', '109F992.tmp.png'),
(233, 303820367, 'Andres', 'Angulo', 'Jackson', '84191464', '2017-03-16', '2017-04-16', '303644B.tmp.png'),
(234, 304330641, 'Anibal', 'Maroto', 'Zuniga', '61809852', '2017-03-17', '2017-04-17', '304FEE1.tmp.png'),
(235, 207580347, 'Michelle', 'MC CARTHY', 'Pemberton', '84412119', '2017-03-17', '2017-04-17', '207DBE.tmp.png'),
(236, 304510397, 'Martin', 'Martinez', 'Alban', '83034244', '2017-03-17', '2017-04-17', '30474.tmp.png'),
(237, 303160174, 'Ana', 'Loaiza', 'Romero', '86208984', '2017-03-17', '2017-04-17', '303561C.tmp.png'),
(238, 302380633, 'Terasa', 'Washington', 'Oguera', '84005197', '2017-03-17', '2017-04-17', '302F933.tmp.png'),
(239, 304520442, 'Rodolfo', 'Salazar', 'Rojas', '83151274', '2017-03-17', '2017-04-05', '3048274.tmp.png'),
(240, 113970834, 'Nigel', 'Gould', 'Camacho', '61260889', '2017-03-17', '2017-04-17', '113E4C8.tmp.png'),
(241, 304900550, 'GUSTAVO', 'NAJERA', 'NAJERA', '61074493', '2017-03-17', '2017-04-17', '30454B3.tmp.png'),
(242, 305170471, 'DANIEL', 'ARIAS', 'ELIZONDO', '87799003', '2017-03-17', '2017-04-17', '305A3FA.tmp.png'),
(243, 303810400, 'KATTIA', 'MARIN', 'SANABRIA', '84086135', '2017-03-17', '2017-04-17', '303D697.tmp.png'),
(244, 302090157, 'Angelica', 'Coto', 'Alvarez', '83084141', '2017-03-20', '2017-04-20', '302584D.tmp.png'),
(245, 304610005, 'ESTEFANIA', 'SABORIO', 'DURAN', '84078480', '2017-03-17', '2017-04-17', '30450C0.tmp.png'),
(246, 303140621, 'MANUEL', 'QUIROS', 'SALAS', '88286221', '2017-03-17', '2017-04-17', '303C228.tmp.png'),
(247, 304990799, 'MAKEYLIN', 'RODRIGUEZ', 'NU??EZ', '84836973', '2017-03-18', '2017-04-03', '304ADC0.tmp.png'),
(248, 302610644, 'MARIO', 'GONZALEZ', 'CASTILLO', '85038164', '2017-03-18', '2017-04-18', '302D220.tmp.png'),
(249, 303420971, 'Felipe', 'CARAZO', 'COTO', '83997676', '2017-03-15', '2017-04-15', '3035EDF.tmp.png'),
(250, 305260242, 'MEYLIN', 'Castillo', 'KOOPER', '84772362', '2017-03-18', '2017-04-03', '3052AD8.tmp.png'),
(251, 303650444, 'STEVEN', 'GONZALEZ', 'RODA', '88465958', '2017-03-20', '2017-04-20', '303157C.tmp.png'),
(252, 305210750, 'Sergio', 'Coto', 'Acu??a', '85928632', '2017-03-20', '2017-04-20', '305B91B.tmp.png'),
(253, 304930537, 'Pablo', 'Rojas', 'Martinez', '88027101', '2017-03-20', '2017-04-20', '304EAB.tmp.png'),
(254, 303060437, 'JENNY', 'TORRES', 'SOLANO', '71091932', '2017-03-20', '2017-04-03', '303EB64.tmp.png'),
(255, 304370713, 'SUSANA', 'CHACON', 'VAZQUEZ', '85143634', '2017-03-20', '2017-04-05', '304E9CF.tmp.png'),
(256, 304580638, 'LUIS DEYLER', 'SALAS', 'CALDERON', '89636014', '2017-03-20', '2017-04-20', '30476B2.tmp.png'),
(257, 304180107, 'CRISTIAN', 'HERNANDEZ', 'SANCHEZ', '88870805', '2017-03-20', '2017-04-20', '3045D64.tmp.png'),
(258, 303770870, 'MASSIEL', 'ZAMORA ', 'LOPEZ', '83421943', '2017-03-20', '2017-04-20', '3034999.tmp.png'),
(259, 303830512, 'Ricardo', 'Gamboa', 'Najera', '88406816', '2017-03-20', '2017-04-20', '3032028.tmp.png'),
(260, 303810792, 'ANDRES', 'duran', 'MORA', '88285930', '2017-03-20', '2017-05-01', '3039E5A.tmp.png'),
(261, 304190802, 'Daniela', 'Mora', 'Gamboa', '88975270', '2017-03-20', '2017-04-20', '3048AAB.tmp.png'),
(262, 304290709, 'Susan', 'Henry', 'Romero', '88550105', '2017-03-20', '2017-04-20', '3045CF.tmp.png'),
(263, 303800361, 'Mauren', 'Hernandez', 'Arroyo', '88271071', '2017-03-20', '2017-04-06', '303D464.tmp.png'),
(264, 304100077, 'Lucia', 'Sanchez', 'Mendez', '88951186', '2017-03-20', '2017-04-20', '304D5DC.tmp.png'),
(265, 303500464, 'FANNY', 'Diaz', 'VARGAS', '86166673', '2017-03-20', '2017-04-20', '3031A33.tmp.png'),
(266, 304040930, 'Sofia', 'Jimenez', 'Rojas', '84344477', '2017-03-20', '2017-04-20', 'image.jpg'),
(267, 304910208, 'NAZARETH', 'MENDEZ', 'UGALDE', '86739884', '2017-03-21', '2017-04-21', '304DD99.tmp.png'),
(268, 304170158, 'VANESSA', 'CALDERON', 'HERNANDEZ', '86499424', '2017-03-21', '2017-04-05', '3046C1F.tmp.png'),
(269, 304780555, 'Manrique', 'Gonzalez', 'Mora', '84995930', '2017-03-06', '2017-04-06', '304F3D5.tmp.png'),
(270, 303560039, 'VIVIANA', 'LEON', 'AGUILAR', '89446816', '2017-03-21', '2017-04-04', '303BFAA.tmp.png'),
(271, 305100482, 'DEIVERSON', 'GONZALEZ', 'LEON', '83575903', '2017-03-21', '2017-04-04', '305AB7E.tmp.png'),
(272, 701450157, 'Viviana', 'Rojas', 'Arteaga', '87209812', '2017-03-21', '2017-04-21', '7019861.tmp.png'),
(273, 604270756, 'Carla', 'Murillo', 'Esquivel', '87912926', '2017-03-22', '2017-04-22', '604FE48.tmp.png'),
(274, 305020565, 'Ronny', 'Calvo', 'Monge', '70591060', '2017-03-22', '2017-04-07', '305D7C1.tmp.png'),
(275, 116270952, 'Jose Alejandro', 'Brenes', 'Portuguez', '72925498', '2017-03-22', '2017-04-07', '116A20E.tmp.png'),
(276, 109200463, 'Freddy', 'CAMPOS', 'VEGA', '63880630', '2017-03-23', '2017-04-07', '1091815.tmp.png'),
(277, 303530655, 'Freddy', 'Chu', 'Leung', '88298834', '2017-03-23', '2017-04-23', '303275E.tmp.png'),
(278, 304370158, 'Andrea', 'Solano', 'Retana', '83905879', '2017-03-23', '2017-04-23', '304628B.tmp.png'),
(279, 304140522, 'WENDY', 'MATA', 'ARAYA', '83302149', '2017-03-23', '2017-04-23', '3043B5B.tmp.png'),
(280, 304710542, 'JOSELIN', 'VELAZQUEZ', 'LORIA', '86627085', '2017-03-23', '2017-04-07', '3044B0C.tmp.png'),
(281, 305380504, 'kendall', 'duran', 'CORDERO', '84325246', '2017-03-24', '2017-04-24', '3056100.tmp.png'),
(282, 305030309, 'JOSE', 'PANIAGUA', 'CARVAJAL', '70363638', '2017-03-25', '2017-04-10', '305F192.tmp.png'),
(283, 117600796, 'LUIS', 'QUIROS', 'CHAVEZ', '62514125', '2017-03-25', '2017-04-25', '1177C9A.tmp.png');

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
) ENGINE=InnoDB  DEFAULT CHARSET=ascii AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `tbuser`
--

INSERT INTO `tbuser` (`id`, `dni`, `name`, `firtsname`, `secondname`, `nameuser`, `pass`) VALUES
(1, 304790528, 'Luis', 'Castillo', 'Calderon', 'root', '1234'),
(2, 304160985, 'Hector', 'Jimenez', 'Monge', 'gym', 'snake'),
(3, 304200005, 'Randall', 'Barboza', 'Hernandez', 'coach', 'coach'),
(4, 304820967, 'Carlos', 'Caves', 'Solis', 'futbol', 'futbol06');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
