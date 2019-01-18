-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-03-2017 a las 16:12:05
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
) ENGINE=InnoDB  DEFAULT CHARSET=ascii AUTO_INCREMENT=172 ;

--
-- Volcado de datos para la tabla `tbclient`
--

INSERT INTO `tbclient` (`id`, `dni`, `name`, `firstname`, `secondname`, `phone`, `dateregistration`, `datepayment`, `image`) VALUES
(1, 115130454, 'luigui', 'sojo', 'castro', '88002303', '2017-02-20', '2017-03-20', '115864F.tmp.png'),
(2, 206400240, 'karol', 'sojo', 'fallas', '89509127', '2017-02-20', '2017-03-21', '206571D.tmp.png'),
(3, 301800003, 'lorena', 'solano', 'salguero', '88281017', '2017-02-24', '2017-03-24', '3016630.tmp.png'),
(4, 301900644, 'ELIZABETH', 'CASTILLO', 'ARAYA', '88326556', '2017-02-24', '2017-03-24', '301330B.tmp.png'),
(5, 302280925, 'Orieta', 'ArAya', 'vargas', '89900755', '2017-02-20', '2017-03-20', '302BAF6.tmp.png'),
(6, 302320486, 'ELENA', 'BRENES', 'ESPINOZA', '89473950', '2017-03-08', '2017-03-23', '302C497.tmp.png'),
(7, 302440904, 'TERESA', 'CAMACHO', 'CHACON', '88067826', '2017-02-26', '2017-03-26', '302BAE.tmp.png'),
(8, 302780218, 'sonia', 'luna', 'jimenez', '86351561', '2017-02-24', '2017-03-10', '3028997.tmp.png'),
(9, 302990434, 'MANUEL', 'SANCHEZ', 'COTO', '88961143', '2017-02-21', '2017-03-21', '30232A1.tmp.png'),
(10, 303190887, 'IVANNIA', 'LOAIZA', 'FUENTES', '86726894', '2017-02-22', '2017-03-22', '3034E48.tmp.png'),
(11, 303270488, 'leticia', 'castillo', 'fernandez', '87051744', '2017-02-24', '2017-03-26', '3031628.tmp.png'),
(12, 303690046, 'MAURICIO', 'PICADO', 'SANDINO', '88412613', '2017-02-22', '2017-03-22', '3034EDD.tmp.png'),
(13, 303720642, 'Michael', 'Sanchez', 'Gonzales', '88691631', '2017-02-21', '2017-03-21', '3035EB8.tmp.png'),
(14, 303730271, 'MARIA', 'RIVERA', 'ZAMORA', '87309750', '2017-02-22', '2017-03-22', '30339FA.tmp.png'),
(15, 303810459, 'LADY', 'LOPEZ', 'ARAYA', '87791352', '2017-02-22', '2017-03-22', '303B9AE.tmp.png'),
(16, 303990273, 'ESTEBAN', 'VARGAS ', 'OVARES', '60101205', '2017-02-22', '2017-03-08', '303D8B6.tmp.png'),
(17, 304150077, 'STEFANY', 'RAMOS', 'LOAIZA', '88262188', '2017-02-21', '2017-03-07', '30474C7.tmp.png'),
(18, 304150407, 'JONATHAN', 'RODRIGUEZ', 'ARTAVIA', '70164788', '2017-02-24', '2017-03-24', '304E583.tmp.png'),
(19, 304250608, 'ADRIAN', 'JIMENEZ', 'CARBALLO', '87441993', '2017-02-23', '2017-03-23', '3044636.tmp.png'),
(20, 304360014, 'STEFANIE', 'RAMIREZ', 'BRENES', '89121212', '2017-02-21', '2017-03-21', '3049954.tmp.png'),
(21, 304580984, 'ANDREA', 'DIAZ', 'GUTIERREZ', '89461820', '2017-03-08', '2017-03-23', '3042D.tmp.png'),
(22, 304630045, 'MARIEL', 'GOMEZ', 'CALDERON', '89794412', '2017-02-23', '2017-03-23', '3042B12.tmp.png'),
(23, 304740616, 'MILENA', 'CAMACHO', 'ALVAREZ', '83736134', '2017-02-23', '2017-03-09', '304DAA5.tmp.png'),
(24, 304960064, 'adriana', 'mora', 'aguilar', '83022129', '2017-02-21', '2017-03-21', '3049A2F.tmp.png'),
(25, 304980359, 'ARTURO', 'ROMERO', 'ZAMORA', '87444057', '2017-02-23', '2017-03-23', '304307D.tmp.png'),
(26, 305000862, 'manuel', 'romero', 'diaz', '84833647', '2017-02-21', '2017-03-21', '3055331.tmp.png'),
(27, 305260128, 'randall', 'mora', 'sanchez', '88164262', '2017-02-21', '2017-03-21', '30592A9.tmp.png'),
(28, 305290801, 'SARAY', 'JIMENEZ', 'JIMENEZ', '88866001', '2017-02-23', '2017-03-09', '305A422.tmp.png'),
(29, 305370645, 'Carolina', 'Jimenez', 'Solano', '', '2017-02-21', '2017-04-21', '305C058.tmp.png'),
(30, 701980168, 'pablo', 'cordero', 'chacon', '60133805', '2017-02-21', '2017-03-21', '701847.tmp.png'),
(31, 303450047, 'Fabian', 'Solano', 'Ovares', '71114596', '2017-02-24', '2017-03-24', '3038080.tmp.png'),
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
(42, 303610477, 'ANDREA', 'TORRES', 'NAVARRO', '84244975', '2017-02-27', '2017-03-13', '3039E5B.tmp.png'),
(43, 304720541, 'ELIAS', 'ABARCA', 'HERNANDEZ', '87347525', '2017-02-27', '2017-03-13', '304DC42.tmp.png'),
(44, 115320473, 'REBECA', 'SABORIO', 'RIVAS', '83138806', '2017-02-27', '2017-03-27', '1152C46.tmp.png'),
(45, 206410079, 'RUBEN', 'RAMOS', 'ULATE', '83876631', '2017-02-27', '2017-03-14', '206C320.tmp.png'),
(46, 114680772, 'YESSICA', 'KURR', 'MENDIOLA', '88012636', '2017-02-27', '2017-03-14', '114D9BD.tmp.png'),
(47, 304350546, 'KAROL', 'CASTILLO', 'CARVAJAL', '70583168', '2017-02-27', '2017-03-14', '304A668.tmp.png'),
(48, 304630861, 'Daniel', 'Vargas', 'Guerrero', '89750225', '2017-02-27', '2017-03-27', '304A9A0.tmp.png'),
(49, 304630442, 'Styvent', 'Mu??oz', 'Sanabria', '89238904', '2017-02-28', '2017-03-15', '3043020.tmp.png'),
(50, 302160269, 'Juan', 'CHINCHILLA', 'CASTRO', '85004603', '2017-02-28', '2017-03-28', 'image.jpg'),
(51, 302950334, 'Marisol', 'Bogantes', 'Rodriguez', '83764957', '2017-02-28', '2017-03-29', '302E15F.tmp.png'),
(52, 303640609, 'Hellen', 'Castro', 'w', '88258187', '2017-02-28', '2017-03-29', '3032021.tmp.png'),
(53, 304820517, 'Mariana', 'Mesen', 'Madriz', '87338636', '2017-02-27', '2017-03-28', '30469A1.tmp.png'),
(54, 305070599, 'MELANY', 'RAMIREZ', 'QUIROS', '83912105', '2017-02-28', '2017-03-14', '305CD92.tmp.png'),
(55, 303650930, 'WALTER', 'SOLANO', 'ALVARADO', '85178776', '2017-02-28', '2017-03-28', '303F746.tmp.png'),
(56, 303890354, 'ADRIAN', 'GOMEZ', 'CORDERO', '83256548', '2017-02-28', '2017-03-28', '303F7C6.tmp.png'),
(57, 304120235, 'PAMELA', 'BADILLA', 'MORA', '88383560', '2017-02-28', '2017-03-28', '3047E00.tmp.png'),
(58, 111780969, 'MONICA', 'PASOS', 'MARTINEZ', '88869261', '2017-02-28', '2017-03-28', '1114357.tmp.png'),
(59, 304380318, 'Manuel', 'Brenes', 'Avenda??o', '88804224', '2017-02-28', '2017-03-28', '3046871.tmp.png'),
(60, 303060494, 'MARIELA', 'TORTOS', 'GONZALEZ', '89267273', '2017-03-01', '2017-04-01', '303EC1A.tmp.png'),
(61, 303930423, 'ALLAN', 'AGUILAR', 'NU??EZ', '83184863', '2017-03-01', '2017-04-01', '30393A3.tmp.png'),
(62, 304140168, 'CATALINA', 'GARCIA', 'OBANDO', '89653342', '2017-02-28', '2017-03-29', '304F0B1.tmp.png'),
(63, 304830804, 'Yoselin', 'Castillo', 'Carvajal', '83354736', '2017-03-01', '2017-03-15', '304CCC4.tmp.png'),
(64, 302710421, 'LEDA', 'GUERRERO', 'VARGAS', '87312424', '2017-03-01', '2017-04-01', '302EB84.tmp.png'),
(65, 109390171, 'GREIVIN ', 'FERNANDEZ', 'CASTILLO', '83670474', '2017-03-01', '2017-03-16', '109CF83.tmp.png'),
(66, 303550789, 'GEIZEL', 'AGUILAR', 'SANABRIA', '87041021', '2017-03-01', '2017-03-15', '303A8E5.tmp.png'),
(67, 304160969, 'Ingrid', 'Dittel', 'Masis', '89720128', '2017-03-01', '2017-03-15', '304E3D9.tmp.png'),
(68, 303950124, 'JESSICA ', 'RUIZ', 'RODA', '84440002', '2017-03-01', '2017-04-01', '30398D3.tmp.png'),
(69, 303920336, 'MICHAEL', 'MONTENEGRO', 'SOJO', '83140583', '2017-03-01', '2017-04-01', '303A31C.tmp.png'),
(70, 303760015, 'MAURICIO', 'MARTINEZ', 'LEIVA', '87089209', '2017-03-01', '2017-04-01', '3032D0F.tmp.png'),
(71, 304260344, 'Tatiana', 'Mata', 'VonMarshall', '71104320', '2017-03-01', '2017-04-01', 'image.jpg'),
(72, 303940747, 'Yessenia', 'Cerdas', 'Garita', '63824719', '2017-03-01', '2017-03-15', '303461C.tmp.png'),
(73, 305440801, 'Yeibel', 'Mattis', 'Cerdas', '63229575', '2017-03-01', '2017-03-15', '3053F8D.tmp.png'),
(74, 303530943, 'YAHAIRA', 'BRENES', 'OROZCO', '84886081', '2017-03-02', '2017-04-02', '303E8FC.tmp.png'),
(75, 111770790, 'Evelyn', 'Mora', 'Piedra', '89307510', '2017-03-02', '2017-04-03', '111FACF.tmp.png'),
(76, 105530153, 'MARITZA', 'POLEZ', 'HERNANDEZ', '88646762', '2017-03-02', '2017-03-16', '105EDDE.tmp.png'),
(78, 304870845, 'Ronald', 'Barboza', 'Arias', '72610364', '2017-03-02', '2017-04-03', '3043D50.tmp.png'),
(79, 304380335, 'Leonardo', 'Brenes', 'GONZALEZ', '83510083', '2017-03-02', '2017-04-03', '304918B.tmp.png'),
(80, 304050182, 'Martin', 'ARAYA', 'SANABRIA', '89439784', '2017-03-02', '2017-03-16', '304C49F.tmp.png'),
(81, 305140458, 'Leiner ', 'ramirez ', 'ULLOA', '62836447', '2017-03-01', '2017-04-01', '3057515.tmp.png'),
(82, 305100191, 'ANDRES ', 'CARMONA', 'ZAMORA', '89544189', '2017-03-01', '2017-04-01', '305814E.tmp.png'),
(83, 303380453, 'SHIRLEY', 'JIMENEZ', 'ULLOA', '83383850', '2017-03-02', '2017-04-02', '3037EF8.tmp.png'),
(84, 304370352, 'ESTEBAN', 'BONILLA', 'REDONDO', '84972913', '2017-03-02', '2017-04-02', '304AEDE.tmp.png'),
(85, 111840859, 'ESTEBAN', 'CANIZALES', 'ROJAS', '88863600', '2017-03-02', '2017-03-16', '1114694.tmp.png'),
(86, 305200644, 'TADEANA', 'CALVO', 'SANCHEZ', '72318587', '2017-03-02', '2017-04-02', '3058A27.tmp.png'),
(87, 305150590, 'SOFIA', 'MEZA', 'ZU??IGA', '87238924', '2017-03-02', '2017-04-02', '3058647.tmp.png'),
(88, 304600608, 'MARIELA', 'VEGA', 'PEREIRA', '88521879', '2017-03-02', '2017-04-02', '304C449.tmp.png'),
(89, 303840217, 'JOHANA', 'ARCE', 'GOMEZ', '87104157', '2017-03-03', '2017-04-03', '303303E.tmp.png'),
(90, 303290419, 'ANGELA', 'BRENES', 'CORDERO', '88301974', '2017-03-03', '2017-04-03', '303DCD7.tmp.png'),
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
(105, 304530952, 'CESAR', 'ROJAS', 'MOLINA', '62694583', '2017-03-03', '2017-03-16', '3044F41.tmp.png'),
(106, 304350403, 'PAOLA', 'ANGULO', 'CAMACHO', '62227948', '2017-03-03', '2017-03-16', '304CC7D.tmp.png'),
(107, 108860186, 'ANA', 'JIMENEZ', 'SOLANO', '86528232', '2017-03-03', '2017-04-03', '108170E.tmp.png'),
(108, 304340274, 'MIGUEL', 'MATA', 'MARSCHALL', '86299432', '2017-03-04', '2017-04-04', '30496B.tmp.png'),
(109, 304540941, 'Ariana', 'Ramirez', 'Aguilar', '72076453', '2017-03-05', '2017-04-05', '304445B.tmp.png'),
(110, 105630749, 'jose', 'chacon ', 'mora ', '83178802', '2017-03-06', '2017-04-06', '1051257.tmp.png'),
(111, 304220653, 'DANNY', 'LUNA', 'HERNANDEZ', '72746997', '2017-03-06', '2017-04-06', '304758B.tmp.png'),
(112, 302920725, 'MARTA', 'SOLANO', 'BRENES', '89820804', '2017-03-06', '2017-03-21', '302E800.tmp.png'),
(113, 303380452, 'YORLENY', 'COTO', 'VEGA', '88124870', '2017-03-06', '2017-04-06', 'image.jpg'),
(114, 303610672, 'Dalia', 'Aguilar', 'Aguilar', '89300574', '2017-03-06', '2017-04-06', 'image.jpg'),
(115, 304510896, 'Juan Carlos', 'Castro', 'Castro', '61259696', '2017-03-06', '2017-04-06', 'image.jpg'),
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
(132, 304250904, 'CORINA', 'VALVERDE', 'CEDE??O', '88669478', '2017-03-07', '2017-03-22', '304ECE5.tmp.png'),
(133, 304600126, 'DORIAN', 'VALVERDE', 'CEDE??O', '86431819', '2017-03-07', '2017-03-22', '304F450.tmp.png'),
(134, 601280599, 'Leonor', 'Aguero', 'Parajeles', '25567849', '2017-03-07', '2017-04-07', 'image.jpg'),
(135, 302680560, 'ANA', 'loaiza', 'madriz', '70760412', '2017-03-07', '2017-04-07', '302DD0B.tmp.png'),
(136, 135969486, 'Evelyn', 'Quintana', 'Espinoza', '84228658', '2017-03-07', '2017-04-07', '1359A4F.tmp.png'),
(137, 304930134, 'Maria Fernanda', 'AGUILAR', 'Artavia', '88656591', '2017-03-08', '2017-04-08', 'image.jpg'),
(138, 114680773, 'JESSENIA', 'KURR', 'MENDIOLA', '89628899', '2017-03-07', '2017-03-21', '1149A15.tmp.png'),
(139, 304250909, 'LISSETE', 'GONZALEZ', 'FONSECA', '83473260', '2017-03-07', '2017-04-07', '304DDDD.tmp.png'),
(140, 304460418, 'Jose Luis', 'Quiroz', 'Sanchez', '87585520', '2017-03-07', '2017-04-07', '304A37D.tmp.png'),
(141, 108430132, 'FRANCISCO', 'HERNANDEZ', 'ALPIZAR', '83331364', '2017-03-07', '2017-04-07', '1086B47.tmp.png'),
(142, 114500317, 'DANIELA', 'LOAIZA', 'GOMEZ', '84077989', '2017-03-07', '2017-04-07', '1144662.tmp.png'),
(143, 305350930, 'RASHEL', 'ALVARADO', 'ULLOA', '84495012', '2017-03-07', '2017-03-22', '305361.tmp.png'),
(144, 302840853, 'ANA', 'MORA', 'CALVO', '83486947', '2017-03-09', '2017-04-09', '302F191.tmp.png'),
(145, 304170068, 'Gabriela ', 'Carazo', 'Ellis', '84364429', '2017-03-06', '2017-04-06', '30442CF.tmp.png'),
(146, 304060776, 'jennifer', 'SAMUELS', 'SANDOVAL', '87923418', '2017-03-08', '2017-03-23', '3046B5E.tmp.png'),
(147, 560451661, 'Miriam', 'Oswalds', 'julca', '25570690', '2017-03-08', '2017-04-08', '5602363.tmp.png'),
(148, 116540250, 'Jason', 'Correa', 'Arias', '86415174', '2017-02-27', '2017-03-27', '116DE16.tmp.png'),
(149, 109640788, 'Rebeca', 'Arias', 'Amador', '88060494', '2017-02-27', '2017-03-27', '10990E3.tmp.png'),
(150, 701420418, 'Rosalia', 'Avenda??o', 'Bonilla', '71057381', '2017-03-08', '2017-04-08', '701972.tmp.png'),
(151, 302620962, 'JUAN Bosco', 'PEREIRA', 'GARITA', '83741367', '2017-03-08', '2017-04-08', '302F6D5.tmp.png'),
(152, 303290422, 'ADRIANA', 'SERRANO', 'RODRIGUEZ', '88262739', '2017-03-08', '2017-04-08', '303EA6B.tmp.png'),
(153, 118120367, 'DANIEL', 'BARRANTES', 'QUIROS', '85945224', '2017-03-08', '2017-03-22', '118A880.tmp.png'),
(154, 304390700, 'ISABEL', 'RAMIREZ', 'SANCHEZ', '72044561', '2017-03-08', '2017-04-08', '304697A.tmp.png'),
(155, 304400014, 'DANIELA', 'CAMPOS', 'MATA', '72053569', '2017-03-08', '2017-03-22', '304A21A.tmp.png'),
(156, 304660459, 'Susan ', 'Solano', 'Cordoba', '84561869', '2017-03-08', '2017-04-08', '3041F9E.tmp.png'),
(157, 304430229, 'Dayana', 'SANABRIA', 'MADRIZ', '85365650', '2017-03-08', '2017-04-08', '3047350.tmp.png'),
(158, 303190090, 'JACKELINE', 'RODA', 'UMA??A', '88398977', '2017-03-08', '2017-04-08', '3034127.tmp.png'),
(159, 304060735, 'ALEJANDRA', 'GUERRERO', 'JIMENEZ', '72066132', '2017-03-08', '2017-04-08', '304820D.tmp.png'),
(160, 110450170, 'ADRIANA', 'RAMIREZ', 'GONZALES', '88244213', '2017-03-08', '2017-04-08', '110DE8C.tmp.png'),
(161, 303080776, 'GEIZEL', 'solano', 'ROJAS', '86952863', '2017-03-07', '2017-04-07', '30370BC.tmp.png'),
(162, 111030242, 'SONIA', 'CAMACHO ', 'DELGADO', '83205402', '2017-03-09', '2017-04-10', '111E17E.tmp.png'),
(163, 303480400, 'Xinia', 'Jimenez', 'Solano', '88202868', '2017-03-09', '2017-04-09', '3036731.tmp.png'),
(164, 302710132, 'YAMI', 'CORTEZ ', 'VALVERDE', '88306227', '2017-03-09', '2017-03-23', '302AC68.tmp.png'),
(165, 304250288, 'Mariana', 'Melegatti', 'Murillo', '87198968', '2017-03-08', '2017-04-08', '304F817.tmp.png'),
(166, 701910695, 'KATHERINE', 'MOYA', 'SOLORZANO', '83749783', '2017-03-10', '2017-04-10', '701E412.tmp.png'),
(167, 303500339, 'Jackelin', 'Guillen', 'Calderon', '87433954', '2017-03-10', '2017-04-10', '3036F5B.tmp.png'),
(168, 303340529, 'RAYMOND', 'MC CARTHY', 'RAMIREZ', '', '2017-03-11', '2017-04-11', '30363CF.tmp.png'),
(169, 101246039, 'LAURA', 'QUESADA', 'FONSECA', '71081233', '2017-03-11', '2017-04-11', '101795C.tmp.png'),
(170, 304400102, 'MARYLIZ', 'ELLIS', 'ESTRADA', '86343088', '2017-03-11', '2017-04-11', '304F4FF.tmp.png'),
(171, 305000805, 'ALISE', 'ROJAS', 'ARCE', '89625693', '2017-03-11', '2017-03-25', '305E2AA.tmp.png');

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
