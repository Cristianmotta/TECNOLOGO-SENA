-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-02-2026 a las 03:40:04
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

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
  `referencia` varchar(20) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `codigo_clase` int(11) DEFAULT NULL
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
  `nombre` char(1) DEFAULT NULL,
  `ubicacion` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caso`
--

CREATE TABLE `caso` (
  `cadigo_caso` int(11) NOT NULL,
  `tipo_caso` char(1) DEFAULT NULL,
  `descripcion` char(1) DEFAULT NULL,
  `codigo_juzgado` int(11) DEFAULT NULL,
  `numero_documento_policia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `codigo_categoria` int(11) NOT NULL,
  `descripcion` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase_arma`
--

CREATE TABLE `clase_arma` (
  `codigo_clase` int(11) NOT NULL,
  `descripción` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clase_arma`
--

INSERT INTO `clase_arma` (`codigo_clase`, `descripción`) VALUES
(1, 'Corta'),
(2, 'Larga'),
(3, 'No letal'),
(4, 'Automática'),
(5, 'Especial');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `delincuente`
--

CREATE TABLE `delincuente` (
  `numero_idetificacion` int(11) NOT NULL,
  `nombre` char(1) DEFAULT NULL,
  `apellido` char(1) DEFAULT NULL,
  `telefono` int(10) DEFAULT NULL,
  `codigo_caso` int(11) DEFAULT NULL,
  `codigo_calabozo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juzgado`
--

CREATE TABLE `juzgado` (
  `codigo_juzgado` int(11) NOT NULL,
  `nombre_juez` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `policia`
--

CREATE TABLE `policia` (
  `numero_documento` int(11) NOT NULL,
  `nombre` char(1) DEFAULT NULL,
  `apellido` char(1) DEFAULT NULL,
  `codigo_categoria` int(11) DEFAULT NULL,
  `funcion` char(1) DEFAULT NULL,
  `codigo_arma` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `arma`
--
ALTER TABLE `arma`
  ADD PRIMARY KEY (`codigo_arma`);

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
  ADD KEY `fk_delincuente_caso` (`codigo_caso`),
  ADD KEY `fk_delincuente_calabozo` (`codigo_calabozo`);

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
  ADD KEY `fk_arma_policia` (`codigo_arma`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `arma`
--
ALTER TABLE `arma`
  ADD CONSTRAINT `fk_arma_clase` FOREIGN KEY (`codigo_arma`) REFERENCES `clase_arma` (`codigo_clase`);

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
  ADD CONSTRAINT `fk_delincuente_calabozo` FOREIGN KEY (`codigo_calabozo`) REFERENCES `calabozo` (`codigo_calabozo`),
  ADD CONSTRAINT `fk_delincuente_caso` FOREIGN KEY (`codigo_caso`) REFERENCES `caso` (`cadigo_caso`);

--
-- Filtros para la tabla `policia`
--
ALTER TABLE `policia`
  ADD CONSTRAINT `fk_arma_policia` FOREIGN KEY (`codigo_arma`) REFERENCES `arma` (`codigo_arma`),
  ADD CONSTRAINT `fk_categoria_policia` FOREIGN KEY (`codigo_categoria`) REFERENCES `categoria` (`codigo_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
