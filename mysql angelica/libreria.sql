-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-03-2026 a las 03:29:50
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
-- Base de datos: `libreria`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_libro` (`Nomlibro` VARCHAR(30))   SELECT
l.lib_titulo AS 'Titulo', 
a.auto_apellido AS 'Autor' 
FROM tbl_libro l 
INNER JOIN tbl_autor a ON 
l.lib_numeroPaginas = a.auto_codigo 
WHERE 
l.lib_titulo = Nomlibro$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_libro` (`d1_libro` BIGINT(20))   DELETE FROM tbl_libro WHERE lib_isbn = d1_libro$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_listaAutores` ()   SELECT auto_codigo, auto_apellido
FROM tbl_autor
ORDER BY auto_apellido DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_tbl_socio` ()   SELECT 
		soc_nombre, 
		pres_fechaPrestamo
	FROM tbl_socio
LEFT JOIN tbl_prestamo
ON soc_numero=pres_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_tipoAutor` (`variable` VARCHAR(20))   SELECT auto_apellido as 'Autor', tipoAutor
FROM tbl_autor
INNER JOIN tbl_tipoautores
ON auto_codigo = copiaAutor
WHERE tipoAutor=variable$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_libro` (`c1_isbn` BIGINT(20), `c2_titulo` VARCHAR(255), `c3_genero` VARCHAR(20), `c4_paginas` INT(11), `c5dispares` TINYINT(4))   INSERT INTO
tbl_libro(lib_isbn, lib_titulo, lib_genero, lib_numeroPaginas ,lib_diasPrestamo)
VALUES (c1_isbn, c2_titulo, c3_genero, c4_paginas, c5dispares)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_socio` (`s1_numero` INT(11), `s2_nombre` VARCHAR(45), `s3_apellido` VARCHAR(45), `s4_direccion` VARCHAR(255), `s5_telefono` VARCHAR(10))   INSERT INTO
tbl_socio
(soc_numero,soc_nombre,soc_apellido,soc_direccion,soc_telefono)
VALUES (s1_numero , s2_nombre, s3_apellido , 
s4_direccion , s5_telefono)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_libros` ()   SELECT 
	pres_id, 
    soc_nombre
FROM tbl_prestamo
INNER JOIN tbl_socio
ON soc_numero = soc_CopiaNumero$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_soc` (`up1_numero` INT(11), `up2_telefono` VARCHAR(10), `up3_direccion` VARCHAR(252))   UPDATE tbl_socio SET soc_telefono = up2_telefono,  soc_direccion = up3_direccion WHERE soc_numero = up1_numero$$

--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `dias_prestamo` (`p_idlibro` BIGINT) RETURNS INT(11) DETERMINISTIC BEGIN
	DECLARE dias INT;
    
    SELECT DATEDIFF(CURDATE(), pres_fechaPrestamo)
    INTO dias
    FROM tbl_prestamo
    WHERE soc_copiaNumero = p_idlibro
    LIMIT 1;
    
    RETURN dias;
 END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `total_socios` () RETURNS INT(11) DETERMINISTIC BEGIN 
	DECLARE cantidad INT;
    
    SELECT COUNT(*)
    INTO cantidad
    FROM tbl_socio;
    RETURN cantidad;
    
    END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoria_autor`
--

CREATE TABLE `auditoria_autor` (
  `aud_id` int(11) NOT NULL,
  `old_auto_codigo` int(11) DEFAULT NULL,
  `old_auto_apellido` varchar(45) DEFAULT NULL,
  `old_auto_nacimiento` date DEFAULT NULL,
  `old_auto_muerte` date DEFAULT NULL,
  `new_auto_codigo` int(11) DEFAULT NULL,
  `new_auto_apellido` varchar(45) DEFAULT NULL,
  `new_auto_nacimiento` date DEFAULT NULL,
  `new_auto_muerte` date DEFAULT NULL,
  `accion` varchar(10) DEFAULT NULL,
  `fecha_cambio` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auditoria_autor`
--

INSERT INTO `auditoria_autor` (`aud_id`, `old_auto_codigo`, `old_auto_apellido`, `old_auto_nacimiento`, `old_auto_muerte`, `new_auto_codigo`, `new_auto_apellido`, `new_auto_nacimiento`, `new_auto_muerte`, `accion`, `fecha_cambio`) VALUES
(1, 98, 'Smith', '1974-12-21', '2018-07-21', 98, 'Gomez', '0000-00-00', '0000-00-00', 'UPDATE', '2026-03-09 19:07:20'),
(2, 98, 'Gomez', '0000-00-00', '0000-00-00', 98, 'Gomez', '0000-00-00', '0000-00-00', 'UPDATE', '2026-03-09 19:08:58'),
(3, 98, 'Gomez', '0000-00-00', '0000-00-00', 98, 'Gomez', '0000-00-00', '0000-00-00', 'UPDATE', '2026-03-09 19:10:05'),
(4, 98, 'Gomez', '0000-00-00', '0000-00-00', 98, 'Gomez', '0000-00-00', '0000-00-00', 'UPDATE', '2026-03-09 19:10:27'),
(5, 98, 'Gomez', '0000-00-00', '0000-00-00', 98, 'Gomez', '0000-00-00', '0000-00-00', 'UPDATE', '2026-03-09 19:10:45'),
(7, 98, 'Gomez', '0000-00-00', '0000-00-00', 98, 'Gomez', '0000-00-00', '0000-00-00', 'UPDATE', '2026-03-09 19:11:13'),
(8, 98, 'Gomez', '0000-00-00', '0000-00-00', 98, 'Gomez', '0000-00-00', '0000-00-00', 'UPDATE', '2026-03-09 19:12:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `audi_libros`
--

CREATE TABLE `audi_libros` (
  `id_audi` int(11) NOT NULL,
  `lib_isbn_audi` bigint(20) DEFAULT NULL,
  `lib_titulo_anterior` varchar(255) DEFAULT NULL,
  `lib_genero_anterior` varchar(20) DEFAULT NULL,
  `lib_numeroPaginas_anterior` int(11) DEFAULT NULL,
  `lib_diasPrestamo_anterior` tinyint(4) DEFAULT NULL,
  `lib_titulo_nuevo` varchar(255) DEFAULT NULL,
  `lib_genero_nuevo` varchar(20) DEFAULT NULL,
  `lib_numeroPaginas_nuevo` int(11) DEFAULT NULL,
  `lib_diasPrestamo_nuevo` tinyint(4) DEFAULT NULL,
  `audi_fechaModificacion` datetime DEFAULT NULL,
  `audi_usuario` varchar(45) DEFAULT NULL,
  `audi_accion` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `audi_libros`
--

INSERT INTO `audi_libros` (`id_audi`, `lib_isbn_audi`, `lib_titulo_anterior`, `lib_genero_anterior`, `lib_numeroPaginas_anterior`, `lib_diasPrestamo_anterior`, `lib_titulo_nuevo`, `lib_genero_nuevo`, `lib_numeroPaginas_nuevo`, `lib_diasPrestamo_nuevo`, `audi_fechaModificacion`, `audi_usuario`, `audi_accion`) VALUES
(1, 1234567890, 'El Sueño de los Susurros', 'novela', 275, 7, 'Locos de Locura', 'Comedia', 15, 7, '2026-03-05 10:24:34', 'root@localhost', 'Actulizacion de libr'),
(2, NULL, NULL, NULL, NULL, NULL, 'Miedo a la altura', 'Terror', 32, 15, '2026-03-05 10:38:16', 'root@localhost', 'Insertaste un nuevo '),
(3, 1223212, 'Miedo a la altura', 'Terror', 32, 15, 'Miedo a la altura', 'Terror', 32, 15, '2026-03-05 10:47:35', 'root@localhost', 'Actulizacion de libr'),
(4, 1234567890, 'Locos de Locura', 'Comedia', 15, 7, 'Miedo a la altura', 'Terror', 15, 7, '2026-03-05 10:47:35', 'root@localhost', 'Actulizacion de libr'),
(5, 1357924680, 'El Jardín de las Mariposas Perdidas', 'novela', 536, 7, 'Miedo a la altura', 'Terror', 536, 7, '2026-03-05 10:47:35', 'root@localhost', 'Actulizacion de libr'),
(6, 2468135790, 'La Melodía de la Oscuridad', 'romance', 189, 7, 'Miedo a la altura', 'Terror', 189, 7, '2026-03-05 10:47:35', 'root@localhost', 'Actulizacion de libr'),
(7, 2718281828, 'El Bosque de los Suspiros', 'novela', 387, 2, 'Miedo a la altura', 'Terror', 387, 2, '2026-03-05 10:47:35', 'root@localhost', 'Actulizacion de libr'),
(8, 3141592653, 'El Secreto de las Estrellas Olvidadas', 'Misterio', 203, 7, 'Miedo a la altura', 'Terror', 203, 7, '2026-03-05 10:47:35', 'root@localhost', 'Actulizacion de libr'),
(9, 5555555555, 'La Última Llave del Destino', 'cuento', 503, 7, 'Miedo a la altura', 'Terror', 503, 7, '2026-03-05 10:47:35', 'root@localhost', 'Actulizacion de libr'),
(10, 7777777777, 'El Misterio de la Luna Plateada', 'Misterio', 422, 7, 'Miedo a la altura', 'Terror', 422, 7, '2026-03-05 10:47:35', 'root@localhost', 'Actulizacion de libr'),
(11, 8642097531, 'El Reloj de Arena Infinito', 'novela', 321, 7, 'Miedo a la altura', 'Terror', 321, 7, '2026-03-05 10:47:35', 'root@localhost', 'Actulizacion de libr'),
(12, 8888888888, 'La Ciudad de los Susurros', 'Misterio', 274, 1, 'Miedo a la altura', 'Terror', 274, 1, '2026-03-05 10:47:35', 'root@localhost', 'Actulizacion de libr'),
(13, 9517530862, 'Las Crónicas del Eco Silencioso', 'fantasía', 448, 7, 'Miedo a la altura', 'Terror', 448, 7, '2026-03-05 10:47:35', 'root@localhost', 'Actulizacion de libr'),
(14, 9876543210, 'El Laberinto de los Recuerdos', 'cuento', 412, 7, 'Miedo a la altura', 'Terror', 412, 7, '2026-03-05 10:47:35', 'root@localhost', 'Actulizacion de libr'),
(15, 9999999999, 'El Enigma de los Espejos Rotos', 'romance', 156, 7, 'Miedo a la altura', 'Terror', 156, 7, '2026-03-05 10:47:35', 'root@localhost', 'Actulizacion de libr'),
(16, 1223212, 'Miedo a la altura', 'Terror', 32, 15, 'Miedo a la altura', 'Terror', 32, 15, '2026-03-05 10:47:53', 'root@localhost', 'Actulizacion de libr'),
(17, 1234567890, 'Miedo a la altura', 'Terror', 15, 7, 'Miedo a la altura', 'Terror', 15, 7, '2026-03-05 10:47:53', 'root@localhost', 'Actulizacion de libr'),
(18, 1357924680, 'Miedo a la altura', 'Terror', 536, 7, 'Miedo a la altura', 'Terror', 536, 7, '2026-03-05 10:47:53', 'root@localhost', 'Actulizacion de libr'),
(19, 2468135790, 'Miedo a la altura', 'Terror', 189, 7, 'Miedo a la altura', 'Terror', 189, 7, '2026-03-05 10:47:53', 'root@localhost', 'Actulizacion de libr'),
(20, 2718281828, 'Miedo a la altura', 'Terror', 387, 2, 'Miedo a la altura', 'Terror', 387, 2, '2026-03-05 10:47:53', 'root@localhost', 'Actulizacion de libr'),
(21, 3141592653, 'Miedo a la altura', 'Terror', 203, 7, 'Miedo a la altura', 'Terror', 203, 7, '2026-03-05 10:47:53', 'root@localhost', 'Actulizacion de libr'),
(22, 5555555555, 'Miedo a la altura', 'Terror', 503, 7, 'Miedo a la altura', 'Terror', 503, 7, '2026-03-05 10:47:53', 'root@localhost', 'Actulizacion de libr'),
(23, 7777777777, 'Miedo a la altura', 'Terror', 422, 7, 'Miedo a la altura', 'Terror', 422, 7, '2026-03-05 10:47:53', 'root@localhost', 'Actulizacion de libr'),
(24, 8642097531, 'Miedo a la altura', 'Terror', 321, 7, 'Miedo a la altura', 'Terror', 321, 7, '2026-03-05 10:47:53', 'root@localhost', 'Actulizacion de libr'),
(25, 8888888888, 'Miedo a la altura', 'Terror', 274, 1, 'Miedo a la altura', 'Terror', 274, 1, '2026-03-05 10:47:53', 'root@localhost', 'Actulizacion de libr'),
(26, 9517530862, 'Miedo a la altura', 'Terror', 448, 7, 'Miedo a la altura', 'Terror', 448, 7, '2026-03-05 10:47:53', 'root@localhost', 'Actulizacion de libr'),
(27, 9876543210, 'Miedo a la altura', 'Terror', 412, 7, 'Miedo a la altura', 'Terror', 412, 7, '2026-03-05 10:47:53', 'root@localhost', 'Actulizacion de libr'),
(28, 9999999999, 'Miedo a la altura', 'Terror', 156, 7, 'Miedo a la altura', 'Terror', 156, 7, '2026-03-05 10:47:53', 'root@localhost', 'Actulizacion de libr');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `audi_socio`
--

CREATE TABLE `audi_socio` (
  `id_audi` int(10) NOT NULL,
  `socNumero_audi` int(11) DEFAULT NULL,
  `socNombre_anterior` varchar(45) DEFAULT NULL,
  `socApellido_anterior` varchar(45) DEFAULT NULL,
  `socDireccion_anterior` varchar(255) DEFAULT NULL,
  `socTelefono_anterior` varchar(10) DEFAULT NULL,
  `socNombre_nuevo` varchar(45) DEFAULT NULL,
  `socApellido_nuevo` varchar(45) DEFAULT NULL,
  `socDireccion_nuevo` varchar(255) DEFAULT NULL,
  `socTelefono_nuevo` varchar(10) DEFAULT NULL,
  `audi_fechaModificacion` datetime DEFAULT NULL,
  `audi_usuario` varchar(10) DEFAULT NULL,
  `audi_accion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `audi_socio`
--

INSERT INTO `audi_socio` (`id_audi`, `socNumero_audi`, `socNombre_anterior`, `socApellido_anterior`, `socDireccion_anterior`, `socTelefono_anterior`, `socNombre_nuevo`, `socApellido_nuevo`, `socDireccion_nuevo`, `socTelefono_nuevo`, `audi_fechaModificacion`, `audi_usuario`, `audi_accion`) VALUES
(1, 2234234, 'Juan', 'Perez', 'Calle 10 #20-30', '3001234567', 'Juan Carlos', 'Perez', 'Calle 15 #25-40', '3119876543', '2026-03-05 09:44:03', 'admin', 'UPDATE'),
(2, 123456, 'Luisa', 'garzon', 'kr 2 d n44 sur', '3110002301', 'Luisa', 'garzon', 'kr 2 d n44 sur', '3110002301', '2026-03-05 09:57:22', 'root@local', 'Actualización'),
(3, 123456, 'Luisa', 'garzon', 'kr 2 d n44 sur', '3110002301', 'Luisa', 'garzon', 'Calle 72 #\r\n2', '2928088', '2026-03-05 09:57:43', 'root@local', 'Actualización');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_autor`
--

CREATE TABLE `tbl_autor` (
  `auto_codigo` int(11) NOT NULL,
  `auto_apellido` varchar(45) NOT NULL,
  `auto_nacimento` date NOT NULL,
  `auto_muerte` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_autor`
--

INSERT INTO `tbl_autor` (`auto_codigo`, `auto_apellido`, `auto_nacimento`, `auto_muerte`) VALUES
(98, 'Gomez', '0000-00-00', '0000-00-00'),
(123, 'Taylor', '1980-04-15', '0000-00-00'),
(234, 'Medina', '1977-06-21', '2005-09-12'),
(345, 'Wilson', '1975-08-29', '0000-00-00'),
(432, 'Miller', '1981-10-26', '0000-00-00'),
(456, 'García', '1978-09-27', '2021-12-09'),
(567, 'Davis', '1983-03-04', '2010-03-28'),
(678, 'Silva', '1986-02-02', '0000-00-00'),
(765, 'López', '1976-07-08', '0000-00-00'),
(789, 'Rodríguez', '1985-12-10', '0000-00-00'),
(890, 'Brown', '1982-11-17', '0000-00-00'),
(901, 'Soto', '1979-05-13', '2015-11-05');

--
-- Disparadores `tbl_autor`
--
DELIMITER $$
CREATE TRIGGER `autor_after_actualizacion` BEFORE UPDATE ON `tbl_autor` FOR EACH ROW INSERT INTO auditoria_autor(
	old_auto_codigo,
	old_auto_apellido,
	old_auto_nacimiento,
	old_auto_muerte,
	new_auto_codigo,
	new_auto_apellido,
	new_auto_nacimiento,
	new_auto_muerte,
	accion,
	fecha_cambio
)
VALUES(
	OLD.auto_codigo,
	OLD.auto_apellido,
	OLD.auto_nacimento,
	OLD.auto_muerte,
	NEW.auto_codigo,
	NEW.auto_apellido,
	NEW.auto_nacimento,
	NEW.auto_muerte,
	'UPDATE',
	NOW()
)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `autor_after_eliminar` BEFORE DELETE ON `tbl_autor` FOR EACH ROW INSERT INTO auditoria_autor(
	old_auto_codigo,
	old_auto_apellido,
	old_auto_nacimiento,
	old_auto_muerte,
	accion,
	fecha_cambio
)
VALUES(
	OLD.auto_codigo,
	OLD.auto_apellido,
	OLD.auto_nacimento,
	OLD.auto_muerte,
	'DELETE',
	NOW()
)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_libro`
--

CREATE TABLE `tbl_libro` (
  `lib_isbn` bigint(20) NOT NULL,
  `lib_titulo` varchar(255) NOT NULL,
  `lib_genero` varchar(20) NOT NULL,
  `lib_numeroPaginas` int(11) NOT NULL,
  `lib_diasPrestamo` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_libro`
--

INSERT INTO `tbl_libro` (`lib_isbn`, `lib_titulo`, `lib_genero`, `lib_numeroPaginas`, `lib_diasPrestamo`) VALUES
(1223212, 'Miedo a la altura', 'Terror', 32, 15),
(1234567890, 'Miedo a la altura', 'Terror', 15, 7),
(1357924680, 'Miedo a la altura', 'Terror', 536, 7),
(2468135790, 'Miedo a la altura', 'Terror', 189, 7),
(2718281828, 'Miedo a la altura', 'Terror', 387, 2),
(3141592653, 'Miedo a la altura', 'Terror', 203, 7),
(5555555555, 'Miedo a la altura', 'Terror', 503, 7),
(7777777777, 'Miedo a la altura', 'Terror', 422, 7),
(8642097531, 'Miedo a la altura', 'Terror', 321, 7),
(8888888888, 'Miedo a la altura', 'Terror', 274, 1),
(9517530862, 'Miedo a la altura', 'Terror', 448, 7),
(9876543210, 'Miedo a la altura', 'Terror', 412, 7),
(9999999999, 'Miedo a la altura', 'Terror', 156, 7);

--
-- Disparadores `tbl_libro`
--
DELIMITER $$
CREATE TRIGGER `Insertar_after_libro` AFTER INSERT ON `tbl_libro` FOR EACH ROW INSERT INTO audi_libros(
    lib_titulo_nuevo,
    lib_genero_nuevo,
    lib_numeroPaginas_nuevo,
    lib_diasPrestamo_nuevo,
    audi_fechaModificacion,
    audi_usuario,
    audi_accion
)
VALUES(
    NEW.lib_titulo,
    NEW.lib_genero,
    NEW.lib_numeroPaginas,
    NEW.lib_diasPrestamo,
    NOW(),
    USER(),
    'Insertaste un nuevo libro'
)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `libro_after_uptade` AFTER UPDATE ON `tbl_libro` FOR EACH ROW INSERT INTO audi_libros(
    lib_isbn_audi,
    lib_titulo_anterior,
    lib_genero_anterior,
    lib_numeroPaginas_anterior,
    lib_diasPrestamo_anterior,
    lib_titulo_nuevo,
    lib_genero_nuevo,
    lib_numeroPaginas_nuevo,
    lib_diasPrestamo_nuevo,
    audi_fechaModificacion,
    audi_usuario,
    audi_accion
	)
    VALUES(
    old.lib_isbn,
    old.lib_titulo,
    old.lib_genero,
    old.lib_numeroPaginas,
    old.lib_diasPrestamo,
    NEW.lib_titulo,
    NEW.lib_genero,
    NEW.lib_numeroPaginas,
    NEW.lib_diasPrestamo,
    NOW(),
    USER(),
    'Actulizacion de libro exitosa'
)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `libros_after_delete` AFTER DELETE ON `tbl_libro` FOR EACH ROW INSERT INTO audi_libros(
    lib_isbn_audi,
    lib_titulo_anterior,
    lib_genero_anterior,
    lib_numeroPaginas_anterior,
    lib_diasPrestamo_anterior,
    audi_fechaModificacion,
    audi_usuario,
    audi_accion
)
VALUES(
    OLD.lib_isbn,
    OLD.lib_titulo,
    OLD.lib_genero,
    OLD.lib_numeroPaginas,
    OLD.lib_diasPrestamo,
	NOW(),
	USER(),
	'Su libro ha sido eliminado'
)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_prestamo`
--

CREATE TABLE `tbl_prestamo` (
  `pres_id` varchar(20) NOT NULL,
  `pres_fechaPrestamo` date NOT NULL,
  `pres_fechaDevolucion` date NOT NULL,
  `soc_copiaNumero` int(11) NOT NULL,
  `lib_copiaISBN` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_prestamo`
--

INSERT INTO `tbl_prestamo` (`pres_id`, `pres_fechaPrestamo`, `pres_fechaDevolucion`, `soc_copiaNumero`, `lib_copiaISBN`) VALUES
('pres1', '2023-01-15', '2023-01-20', 1, 1234567890),
('pres2', '2023-02-03', '2023-02-04', 2, 9999999999),
('pres3', '2023-04-09', '2023-04-11', 6, 2718281828),
('pres4', '2023-06-14', '2023-06-15', 9, 8888888888),
('pres5', '2023-07-02', '2023-07-09', 10, 5555555555),
('pres6', '2023-08-19', '2023-08-26', 12, 5555555555),
('pres7', '2023-10-24', '2023-10-27', 3, 1357924680),
('pres8', '2023-11-11', '2023-11-12', 4, 9999999999),
('pres9', '2023-12-29', '2023-12-30', 8, 5555555555);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_socio`
--

CREATE TABLE `tbl_socio` (
  `soc_numero` int(11) NOT NULL,
  `soc_nombre` varchar(45) NOT NULL,
  `soc_apellido` varchar(45) NOT NULL,
  `soc_direccion` varchar(255) NOT NULL,
  `soc_telefono` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_socio`
--

INSERT INTO `tbl_socio` (`soc_numero`, `soc_nombre`, `soc_apellido`, `soc_direccion`, `soc_telefono`) VALUES
(1, 'Ana', 'Ruiz', 'Calle Primavera 123, Ciudad Jardín, Barcelona', '9123456780'),
(2, 'Andrés Felipe', 'Galindo Luna', 'Avenida del Sol 456, Pueblo Nuevo, Madrid', '2123456789'),
(3, 'Juan', 'González', 'Calle Principal 789, Villa Flores, Valencia', '2012345678'),
(4, 'María', 'Rodríguez', 'Carrera del Río 321, El Pueblo, Sevilla', '3012345678'),
(5, 'Pedro', 'Martínez', 'Calle del Bosque 654, Los Pinos, Málaga', '1234567812'),
(6, 'Ana', 'López', 'Avenida Central 987, Villa Hermosa, Bilbao', '6123456781'),
(7, 'Carlos', 'Sánchez', 'Calle de la Luna 234, El Prado, Alicante', '1123456781'),
(8, 'Laura', 'Ramírez', 'Carrera del Mar 567, Playa Azul, Palma de Mallorca', '1312345678'),
(9, 'Luis', 'Hernández', 'Avenida de la Montaña 890, Monte Verde, Granada', '6101234567'),
(10, 'Andrea', 'García', 'Calle del Sol 432, La Colina, Zaragoza', '1112345678'),
(11, 'Alejandro', 'Torres', 'Carrera del Oeste 765, Ciudad Nueva, Murcia', '4951234567'),
(12, 'Sofia', 'Morales', 'Avenida del Mar 098, Costa Brava, Gijón', '5512345678');

--
-- Disparadores `tbl_socio`
--
DELIMITER $$
CREATE TRIGGER `socios_after_delete` AFTER DELETE ON `tbl_socio` FOR EACH ROW INSERT INTO audi_socio(
socNumero_audi,
socNombre_anterior,
socApellido_anterior,
socDireccion_anterior,
socTelefono_anterior,
audi_fechaModificacion,
audi_usuario,
audi_accion)
VALUES(
old.soc_numero,
old.soc_nombre,
old.soc_apellido,
old.soc_direccion,
old.soc_telefono,
NOW(),
CURRENT_USER(),
'Registro eliminado')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `socios_before_update` BEFORE UPDATE ON `tbl_socio` FOR EACH ROW INSERT INTO audi_socio(
socNumero_audi,
socNombre_anterior,
socApellido_anterior,
socDireccion_anterior,
socTelefono_anterior,
socNombre_nuevo,
socApellido_nuevo,
socDireccion_nuevo,
socTelefono_nuevo,
audi_fechaModificacion,
audi_usuario,
audi_accion)
VALUES(
new.soc_numero,
old.soc_nombre,
old.soc_apellido,
old.soc_direccion,
old.soc_telefono,
new.soc_nombre,
new.soc_apellido,
new.soc_direccion,
new.soc_telefono,
NOW(),
CURRENT_USER(),
'Actualización')
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipoautores`
--

CREATE TABLE `tbl_tipoautores` (
  `copiaISBN` bigint(20) NOT NULL,
  `copiaAutor` int(11) NOT NULL,
  `tipoAutor` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_tipoautores`
--

INSERT INTO `tbl_tipoautores` (`copiaISBN`, `copiaAutor`, `tipoAutor`) VALUES
(1234567890, 123, 'Autor'),
(1234567890, 456, 'Coautor'),
(1234567890, 890, 'Autor'),
(1357924680, 123, 'Traductor'),
(2468135790, 234, 'Autor'),
(2718281828, 789, 'Traductor'),
(3141592653, 901, 'Autor'),
(5555555555, 678, 'Autor'),
(7777777777, 765, 'Autor'),
(8642097531, 345, 'Autor'),
(8888888888, 234, 'Autor'),
(8888888888, 345, 'Coautor'),
(9517530862, 432, 'Autor'),
(9876543210, 567, 'Autor'),
(9999999999, 98, 'Autor');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_reporte_libros_autores`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_reporte_libros_autores` (
`lib_titulo` varchar(255)
,`auto_apellido` varchar(45)
,`auto_nacimento` date
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_reporte_prestamos_socios`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_reporte_prestamos_socios` (
`pres_id` varchar(20)
,`soc_numero` int(11)
,`pres_fechaPrestamo` date
,`pres_fechaDevolucion` date
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_reporte_libros_autores`
--
DROP TABLE IF EXISTS `vista_reporte_libros_autores`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_reporte_libros_autores`  AS SELECT `tbl_libro`.`lib_titulo` AS `lib_titulo`, `tbl_autor`.`auto_apellido` AS `auto_apellido`, `tbl_autor`.`auto_nacimento` AS `auto_nacimento` FROM (`tbl_libro` join `tbl_autor` on(`tbl_libro`.`lib_isbn` = `tbl_autor`.`auto_codigo`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_reporte_prestamos_socios`
--
DROP TABLE IF EXISTS `vista_reporte_prestamos_socios`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_reporte_prestamos_socios`  AS SELECT `tbl_prestamo`.`pres_id` AS `pres_id`, `tbl_socio`.`soc_numero` AS `soc_numero`, `tbl_prestamo`.`pres_fechaPrestamo` AS `pres_fechaPrestamo`, `tbl_prestamo`.`pres_fechaDevolucion` AS `pres_fechaDevolucion` FROM (`tbl_prestamo` join `tbl_socio` on(`tbl_prestamo`.`soc_copiaNumero` = `tbl_socio`.`soc_numero`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auditoria_autor`
--
ALTER TABLE `auditoria_autor`
  ADD PRIMARY KEY (`aud_id`);

--
-- Indices de la tabla `audi_libros`
--
ALTER TABLE `audi_libros`
  ADD PRIMARY KEY (`id_audi`);

--
-- Indices de la tabla `audi_socio`
--
ALTER TABLE `audi_socio`
  ADD PRIMARY KEY (`id_audi`);

--
-- Indices de la tabla `tbl_autor`
--
ALTER TABLE `tbl_autor`
  ADD PRIMARY KEY (`auto_codigo`);

--
-- Indices de la tabla `tbl_libro`
--
ALTER TABLE `tbl_libro`
  ADD PRIMARY KEY (`lib_isbn`),
  ADD KEY `index_tabla_libro` (`lib_titulo`);

--
-- Indices de la tabla `tbl_prestamo`
--
ALTER TABLE `tbl_prestamo`
  ADD PRIMARY KEY (`pres_id`),
  ADD KEY `soc_copiaNumero` (`soc_copiaNumero`),
  ADD KEY `fk_prestamo_libro` (`lib_copiaISBN`);

--
-- Indices de la tabla `tbl_socio`
--
ALTER TABLE `tbl_socio`
  ADD PRIMARY KEY (`soc_numero`);

--
-- Indices de la tabla `tbl_tipoautores`
--
ALTER TABLE `tbl_tipoautores`
  ADD PRIMARY KEY (`copiaISBN`,`copiaAutor`),
  ADD KEY `copiaAutor` (`copiaAutor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auditoria_autor`
--
ALTER TABLE `auditoria_autor`
  MODIFY `aud_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `audi_libros`
--
ALTER TABLE `audi_libros`
  MODIFY `id_audi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `audi_socio`
--
ALTER TABLE `audi_socio`
  MODIFY `id_audi` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_prestamo`
--
ALTER TABLE `tbl_prestamo`
  ADD CONSTRAINT `fk_prestamo_libro` FOREIGN KEY (`lib_copiaISBN`) REFERENCES `tbl_libro` (`lib_isbn`),
  ADD CONSTRAINT `tbl_prestamo_ibfk_1` FOREIGN KEY (`soc_copiaNumero`) REFERENCES `tbl_socio` (`soc_numero`);

--
-- Filtros para la tabla `tbl_tipoautores`
--
ALTER TABLE `tbl_tipoautores`
  ADD CONSTRAINT `tbl_tipoautores_ibfk_1` FOREIGN KEY (`copiaAutor`) REFERENCES `tbl_autor` (`auto_codigo`),
  ADD CONSTRAINT `tbl_tipoautores_ibfk_2` FOREIGN KEY (`copiaISBN`) REFERENCES `tbl_libro` (`lib_isbn`);

DELIMITER $$
--
-- Eventos
--
CREATE DEFINER=`root`@`localhost` EVENT `eliminar_prestamo` ON SCHEDULE EVERY 1 DAY STARTS '2026-07-29 09:00:00' ENDS '2026-09-20 19:00:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN

DELETE FROM tbl_prestamo
WHERE pres_fechaPrestamo < DATE_SUB(NOW(), INTERVAL 30 DAY);
END$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
