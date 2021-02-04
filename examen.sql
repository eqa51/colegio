-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 04-02-2021 a las 14:44:24
-- Versión del servidor: 8.0.22
-- Versión de PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `examen`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`127.0.0.1` PROCEDURE `insertarEstudianteMovimientos` (IN `nom_persona` VARCHAR(50), IN `ape_pate_pers` VARCHAR(50), IN `ape_mate_pers` VARCHAR(50), IN `foto` VARCHAR(50), IN `gradoNidGrado` INT, IN `fecha_naci` DATE)  BEGIN
DECLARE l_account_id INT DEFAULT 0;
START TRANSACTION;
insert into persona(
nom_persona,
ape_pate_pers,
ape_mate_pers,
foto,
nid_grado,
fecha_naci
) values(nom_persona,
ape_pate_pers,
ape_mate_pers,
foto,
gradoNidGrado,
fecha_naci);


SET l_account_id = LAST_INSERT_ID();

IF l_account_id > 0 THEN
	INSERT INTO movimiento(tipo_movimiento, monto, estado,fecha_pago,id_persona)
        VALUES("matrícula",200,"POR PAGAR",current_date(),l_account_id),
			  ("pensiones MARZO ",200,"POR PAGAR",current_date(),l_account_id),
			  ("pensiones ABRIL",200,"POR PAGAR",current_date(),l_account_id),
			  ("pensiones MAYO",200,"POR PAGAR",current_date(),l_account_id),
              ("pensiones JUNIO",200,"POR PAGAR",current_date(),l_account_id),
			  ("pensiones JULIO",200,"POR PAGAR",current_date(),l_account_id),
              ("pensiones AGOSTO",200,"POR PAGAR",current_date(),l_account_id),
			  ("pensiones SETIEMBRE",200,"POR PAGAR",current_date(),l_account_id),
              ("pensiones OCTUBRE",200,"POR PAGAR",current_date(),l_account_id),
              ("pensiones NOVIEMBRE",200,"POR PAGAR",current_date(),l_account_id),
              ("pensiones DICIEMBRE",200,"POR PAGAR",current_date(),l_account_id);
             
        COMMIT;
     ELSE
	ROLLBACK;
    END IF;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cronograma`
--

CREATE TABLE `cronograma` (
  `id_cronograma` int NOT NULL,
  `year` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_cronograma`
--

CREATE TABLE `detalle_cronograma` (
  `id_detalle_cronograma` int NOT NULL,
  `desc_pension` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `monto` decimal(10,0) DEFAULT NULL,
  `fecha_venci` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_cronograma` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grado`
--

CREATE TABLE `grado` (
  `nid_grado` int NOT NULL,
  `desc_grado` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nivel` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `grado`
--

INSERT INTO `grado` (`nid_grado`, `desc_grado`, `nivel`) VALUES
(1, 'Primero', 'PRI'),
(2, 'Segundo', 'PRI'),
(3, 'Primero', 'SEC'),
(4, 'Tercero', 'SEC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento`
--

CREATE TABLE `movimiento` (
  `id_movimiento` int NOT NULL,
  `tipo_movimiento` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `monto` decimal(10,0) DEFAULT NULL,
  `estado` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_pago` date DEFAULT NULL,
  `id_persona` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `movimiento`
--

INSERT INTO `movimiento` (`id_movimiento`, `tipo_movimiento`, `monto`, `estado`, `fecha_pago`, `id_persona`) VALUES
(56, 'matrícula', '200', 'POR PAGAR', '2021-02-04', 7),
(57, 'pensiones MARZO ', '200', 'POR PAGAR', '2021-02-04', 7),
(58, 'pensiones ABRIL', '200', 'POR PAGAR', '2021-02-04', 7),
(59, 'pensiones MAYO', '200', 'POR PAGAR', '2021-02-04', 7),
(60, 'pensiones JUNIO', '200', 'POR PAGAR', '2021-02-04', 7),
(61, 'pensiones JULIO', '200', 'POR PAGAR', '2021-02-04', 7),
(62, 'pensiones AGOSTO', '200', 'POR PAGAR', '2021-02-04', 7),
(63, 'pensiones SETIEMBRE', '200', 'POR PAGAR', '2021-02-04', 7),
(64, 'pensiones OCTUBRE', '200', 'POR PAGAR', '2021-02-04', 7),
(65, 'pensiones NOVIEMBRE', '200', 'POR PAGAR', '2021-02-04', 7),
(66, 'pensiones DICIEMBRE', '200', 'POR PAGAR', '2021-02-04', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `nid_persona` int NOT NULL,
  `nom_persona` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ape_pate_pers` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `foto` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_naci` date DEFAULT NULL,
  `ape_mate_pers` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nid_grado` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`nid_persona`, `nom_persona`, `ape_pate_pers`, `foto`, `fecha_naci`, `ape_mate_pers`, `nid_grado`) VALUES
(1, 'edir', 'quispe', '159403ne96kkkqiizhi.jpg', '2021-02-02', 'andrade', 2),
(7, 'EDIR YLBERT', 'QUISPE ', '159403necfgkkqm4g5w.jpg', '2012-05-08', 'ANDRADE', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cronograma`
--
ALTER TABLE `cronograma`
  ADD PRIMARY KEY (`id_cronograma`);

--
-- Indices de la tabla `detalle_cronograma`
--
ALTER TABLE `detalle_cronograma`
  ADD PRIMARY KEY (`id_detalle_cronograma`),
  ADD KEY `fk_detalle_cronograma_cronograma1_idx` (`id_cronograma`);

--
-- Indices de la tabla `grado`
--
ALTER TABLE `grado`
  ADD PRIMARY KEY (`nid_grado`);

--
-- Indices de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD PRIMARY KEY (`id_movimiento`),
  ADD KEY `fk_movimiento_persona1_idx` (`id_persona`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`nid_persona`),
  ADD KEY `fk_table2_grado_idx` (`nid_grado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `detalle_cronograma`
--
ALTER TABLE `detalle_cronograma`
  MODIFY `id_detalle_cronograma` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `grado`
--
ALTER TABLE `grado`
  MODIFY `nid_grado` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  MODIFY `id_movimiento` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `nid_persona` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
