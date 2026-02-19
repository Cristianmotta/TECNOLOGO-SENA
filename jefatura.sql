-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 19-02-2026 a las 14:33:08
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `jefatura`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arma`
--

CREATE TABLE `arma` (
  `codigo_arma` int(11) NOT NULL,
  `referencia` varchar(50) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `codigo_clase` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `arma`
--

INSERT INTO `arma` (`codigo_arma`, `referencia`, `descripcion`, `codigo_clase`) VALUES
(1, 'Glock 19', 'Pistola semiautomática', 1),
(2, 'Remington 870', 'Escopeta táctica', 2),
(3, 'Taser X26', 'Dispositivo eléctrico', 3),
(4, 'M4A1', 'Rifle automático', 4),
(5, 'MP5', 'Subfusil', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calabozo`
--

CREATE TABLE `calabozo` (
  `codigo_calabozo` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `ubicacion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `calabozo`
--

INSERT INTO `calabozo` (`codigo_calabozo`, `nombre`, `ubicacion`) VALUES
(1, 'Celda A', 'Bloque Norte'),
(2, 'Celda B', 'Bloque Sur'),
(3, 'Celda C', 'Bloque Este'),
(4, 'Celda D', 'Bloque Oeste'),
(5, 'Celda E', 'Bloque Central');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caso`
--

CREATE TABLE `caso` (
  `cadigo_caso` int(11) NOT NULL,
  `tipo_caso` varchar(20) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `codigo_juzgado` int(11) DEFAULT NULL,
  `numero_documento_policia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `caso`
--

INSERT INTO `caso` (`cadigo_caso`, `tipo_caso`, `descripcion`, `codigo_juzgado`, `numero_documento_policia`) VALUES
(1, 'Robo', 'Robo simple', 1, 2001),
(2, 'Hurto', 'Hurto vehiculo', 2, 2002),
(3, 'Fraude', 'Fraude bancario', 3, 2003),
(4, 'Asalto', 'Asalto armado', 4, 2004),
(5, 'Homicidio', 'Investigacion', 5, 2005);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `codigo_categoria` int(11) NOT NULL,
  `descripcion` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`codigo_categoria`, `descripcion`) VALUES
(1, 'Patrullero'),
(2, 'Subintendente'),
(3, 'Intendente'),
(4, 'Comisario'),
(5, 'Capitán');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase_arma`
--

CREATE TABLE `clase_arma` (
  `codigo_clase` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clase_arma`
--

INSERT INTO `clase_arma` (`codigo_clase`, `descripcion`) VALUES
(1, 'Corta'),
(2, 'Larga'),
(3, 'No Letal'),
(4, 'Automatica'),
(5, 'Especial');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `delincuente`
--

CREATE TABLE `delincuente` (
  `numero_idetificacion` int(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `apellido` varchar(20) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `codigo_caso` int(11) DEFAULT NULL,
  `codigo_calabozo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `delincuente`
--

INSERT INTO `delincuente` (`numero_idetificacion`, `nombre`, `apellido`, `telefono`, `codigo_caso`, `codigo_calabozo`) VALUES
(9001, 'Pedro', 'Lopez', '3001234567', 1, 1),
(9002, 'Andres', 'Torres', '3019876543', 2, 2),
(9003, 'Juan', 'Castro', '3024567890', 3, 3),
(9004, 'Ricardo', 'Mendez', '3036547891', 4, 4),
(9005, 'Diego', 'Morales', '3047891234', 5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juzgado`
--

CREATE TABLE `juzgado` (
  `codigo_juzgado` int(11) NOT NULL,
  `nombre_juez` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `juzgado`
--

INSERT INTO `juzgado` (`codigo_juzgado`, `nombre_juez`) VALUES
(1, 'Juez Gomez'),
(2, 'Juez Herrera'),
(3, 'Juez Martinez'),
(4, 'Juez Pardo'),
(5, 'Juez Salazar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `policia`
--

CREATE TABLE `policia` (
  `numero_documento` int(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `apellido` varchar(20) DEFAULT NULL,
  `codigo_categoria` int(11) DEFAULT NULL,
  `funcion` varchar(100) DEFAULT NULL,
  `codigo_arma` int(11) DEFAULT NULL,
  `superior` int(11) DEFAULT NULL,
  `codigo_caso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `policia`
--

INSERT INTO `policia` (`numero_documento`, `nombre`, `apellido`, `codigo_categoria`, `funcion`, `codigo_arma`, `superior`, `codigo_caso`) VALUES
(2001, 'Daniel', 'Rojas', 1, 'Patrullero', 1, NULL, 1),
(2002, 'Sofia', 'Castro', 2, 'Investigador', 2, NULL, 2),
(2003, 'Miguel', 'Herrera', 3, 'Oficial', 3, NULL, 3),
(2004, 'Valentina', 'Mendoza', 4, 'Subteniente', 4, NULL, 4),
(2005, 'Camilo', 'Vargas', 5, 'Capitan', 5, NULL, 5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `arma`
--
ALTER TABLE `arma`
  ADD PRIMARY KEY (`codigo_arma`),
  ADD KEY `fk_arma_clase` (`codigo_clase`);

--
-- Indices de la tabla `calabozo`
--
ALTER TABLE `calabozo`
  ADD PRIMARY KEY (`codigo_calabozo`);

--
-- Indices de la tabla `caso`
--
ALTER TABLE `caso`
  ADD PRIMARY KEY (`cadigo_caso`),
  ADD KEY `fk_documento_policia` (`numero_documento_policia`),
  ADD KEY `fk_juzgado_caso` (`codigo_juzgado`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`codigo_categoria`);

--
-- Indices de la tabla `clase_arma`
--
ALTER TABLE `clase_arma`
  ADD PRIMARY KEY (`codigo_clase`);

--
-- Indices de la tabla `delincuente`
--
ALTER TABLE `delincuente`
  ADD PRIMARY KEY (`numero_idetificacion`),
  ADD KEY `fk_delincuente_calabozo` (`codigo_calabozo`),
  ADD KEY `fk_delincuente_a_caso` (`codigo_caso`);

--
-- Indices de la tabla `juzgado`
--
ALTER TABLE `juzgado`
  ADD PRIMARY KEY (`codigo_juzgado`);

--
-- Indices de la tabla `policia`
--
ALTER TABLE `policia`
  ADD PRIMARY KEY (`numero_documento`),
  ADD KEY `fk_categoria_policia` (`codigo_categoria`),
  ADD KEY `fk_arma_policia` (`codigo_arma`),
  ADD KEY `fk_policia_superior` (`superior`),
  ADD KEY `fk_policia_caso` (`codigo_caso`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `arma`
--
ALTER TABLE `arma`
  ADD CONSTRAINT `fk_arma_clase` FOREIGN KEY (`codigo_clase`) REFERENCES `clase_arma` (`codigo_clase`);

--
-- Filtros para la tabla `caso`
--
ALTER TABLE `caso`
  ADD CONSTRAINT `fk_documento_policia` FOREIGN KEY (`numero_documento_policia`) REFERENCES `policia` (`numero_documento`),
  ADD CONSTRAINT `fk_juzgado_caso` FOREIGN KEY (`codigo_juzgado`) REFERENCES `juzgado` (`codigo_juzgado`);

--
-- Filtros para la tabla `delincuente`
--
ALTER TABLE `delincuente`
  ADD CONSTRAINT `fk_delincuente_a_caso` FOREIGN KEY (`codigo_caso`) REFERENCES `caso` (`cadigo_caso`),
  ADD CONSTRAINT `fk_delincuente_calabozo` FOREIGN KEY (`codigo_calabozo`) REFERENCES `calabozo` (`codigo_calabozo`),
  ADD CONSTRAINT `fk_delincuente_caso` FOREIGN KEY (`codigo_caso`) REFERENCES `caso` (`cadigo_caso`);

--
-- Filtros para la tabla `policia`
--
ALTER TABLE `policia`
  ADD CONSTRAINT `fk_arma_policia` FOREIGN KEY (`codigo_arma`) REFERENCES `arma` (`codigo_arma`),
  ADD CONSTRAINT `fk_categoria_policia` FOREIGN KEY (`codigo_categoria`) REFERENCES `categoria` (`codigo_categoria`),
  ADD CONSTRAINT `fk_policia_caso` FOREIGN KEY (`codigo_caso`) REFERENCES `caso` (`cadigo_caso`),
  ADD CONSTRAINT `fk_policia_superior` FOREIGN KEY (`superior`) REFERENCES `policia` (`numero_documento`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
