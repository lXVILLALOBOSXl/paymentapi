-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-11-2021 a las 19:43:43
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `validador`
--

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `caducidad`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `caducidad` (
`numeroDeTarjeta` varchar(16)
,`numeroDeCuenta` int(11)
,`isActive` int(1)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `nombres` varchar(20) NOT NULL,
  `apellidoPaterno` varchar(20) NOT NULL,
  `apellidoMaterno` varchar(20) DEFAULT NULL,
  `telefono` varchar(10) NOT NULL,
  `correo` varchar(20) NOT NULL,
  `direccion` int(11) NOT NULL,
  `usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `nombres`, `apellidoPaterno`, `apellidoMaterno`, `telefono`, `correo`, `direccion`, `usuario`) VALUES
(1, 'Luis Adrian', 'Villalobos', 'Rivera', '3382739012', 'luis@correo.com', 1, 1),
(2, 'Diego Ernesto', 'Bahena', 'Lopez', '3392841029', 'diego@correo.com', 2, 2),
(3, 'Jorge ', 'Perez', 'Hernandez', '3399887766', 'jorge@correo.com', 3, 3),
(4, 'Juan', 'Enriquez', 'Martin', '1827364982', 'juan@correo.com', 4, 4),
(5, 'Diego Fernando', 'Cortes', 'Meza', '2938176354', 'diegoc@correo.com', 5, 5),
(6, 'Tiberio', 'Velasco', 'Lozano', '2839182746', 'tibe@correo.com', 6, 6),
(7, 'Ana', 'Prian', 'Sanchez', '1287392018', 'ana@correo.com', 7, 7),
(8, 'Pedro', 'Enriquez', NULL, '1928374628', 'pedro@correo.com', 8, 8),
(9, 'Karen', 'Hernandez', NULL, '1928472648', 'karen@correo.com', 9, 9),
(10, 'Jaime Alberto', 'Garcia', 'Mayorga', '2839271827', 'jaime@correo.com', 10, 10),
(11, 'Omar', 'Perez', NULL, '1827490293', 'omar@correo.com', 11, 11),
(12, 'Kevin', 'Alvarez', NULL, '2893018876', 'kevin@correo.com', 12, 12),
(13, 'Jesus', 'Brambila', NULL, '1829384765', 'jesus@correo.com', 13, 13),
(14, 'Rogelio', 'Chavez', NULL, '1235738219', 'rogelio@correo.com', 14, 14),
(15, 'Layla', 'Montes', 'Flores', '1298374652', 'layla@correo.com', 15, 15),
(16, 'Estela', 'Sanchez', NULL, '2839182746', 'estela@correo.com', 16, 16),
(17, 'Asis', 'Mahuca', NULL, '1928261789', 'asis@correo.com', 17, 17),
(18, 'Jorge ', 'Perez', 'Hernandez', '3399887766', 'jorge@correo.com', 3, 3),
(19, 'Juan', 'Enriquez', 'Martin', '1827364982', 'juan@correo.com', 4, 4),
(20, 'Diego Fernando', 'Cortes', 'Meza', '2938176354', 'diegoc@correo.com', 5, 5),
(21, 'Tiberio', 'Velasco', 'Lozano', '2839182746', 'tibe@correo.com', 6, 6),
(22, 'Ana', 'Prian', 'Sanchez', '1287392018', 'ana@correo.com', 7, 7),
(23, 'Pedro', 'Enriquez', NULL, '1928374628', 'pedro@correo.com', 8, 8),
(24, 'Karen', 'Hernandez', NULL, '1928472649', 'karen@correo.com', 9, 9),
(25, 'Jaime Alberto', 'Garcia', 'Mayorga', '2839271827', 'jaime@correo.com', 10, 10),
(26, 'Omar', 'Perez', NULL, '1827490293', 'omar@correo.com', 11, 11),
(27, 'Kevin', 'Alvarez', NULL, '2893018876', 'kevin@correo.com', 12, 12),
(28, 'Jesus', 'Brambila', NULL, '1829384765', 'jesus@correo.com', 13, 13),
(29, 'Rogelio', 'Chavez', NULL, '1235738219', 'rogelio@correo.com', 14, 14),
(30, 'Layla', 'Montes', 'Flores', '1298374658', 'layla@correo.com', 15, 15),
(31, 'Estela', 'Sanchez', NULL, '2839182746', 'estela@correo.com', 16, 16),
(32, 'Asis', 'Mahuca', NULL, '1928261789', 'asis@correo.com', 17, 17);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta`
--

CREATE TABLE `cuenta` (
  `numeroDeCuenta` int(11) NOT NULL,
  `numeroDeTarjeta` varchar(16) NOT NULL,
  `fechaDeVencimiento` date NOT NULL,
  `cvv` varchar(3) NOT NULL,
  `saldo` decimal(10,2) NOT NULL,
  `cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cuenta`
--

INSERT INTO `cuenta` (`numeroDeCuenta`, `numeroDeTarjeta`, `fechaDeVencimiento`, `cvv`, `saldo`, `cliente`) VALUES
(1, '1234567812678394', '2025-10-01', '439', '1980.00', 1),
(2, '1234567828370192', '2026-08-01', '392', '16020.00', 2),
(3, '1234567818277649', '2023-10-01', '265', '2342.00', 3),
(4, '1234567809874635', '2026-01-01', '267', '432343.00', 4),
(5, '1234567848372638', '2024-04-01', '268', '2413232.00', 5),
(6, '1234567838290394', '2024-04-01', '269', '544345.00', 6),
(7, '1234567819283740', '2022-12-01', '270', '4322342.00', 7),
(8, '1234567819285736', '2025-10-01', '271', '4323.00', 8),
(9, '1234567820192847', '2023-10-01', '272', '2342.00', 9),
(10, '1234567819284728', '2023-10-01', '273', '9584.00', 10),
(11, '1234567830821829', '2026-10-01', '274', '34.00', 11),
(12, '1234567839206849', '2021-10-01', '275', '34384.00', 12),
(13, '1234567858003388', '2024-10-01', '276', '238.00', 13),
(14, '1234567899990000', '2023-12-01', '277', '3723.00', 14),
(15, '1234567858390055', '2023-10-01', '278', '377289.00', 15),
(16, '1234567817283762', '2025-06-01', '279', '23839.00', 16),
(17, '1234567827831827', '2024-08-01', '280', '2718.00', 17);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `idDireccion` int(11) NOT NULL,
  `calle` varchar(20) NOT NULL,
  `numeroExterior` varchar(5) NOT NULL,
  `numeroInterior` varchar(5) DEFAULT NULL,
  `codigoPostal` varchar(5) NOT NULL,
  `colonia` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`idDireccion`, `calle`, `numeroExterior`, `numeroInterior`, `codigoPostal`, `colonia`) VALUES
(1, 'Corraleros', '170', '612', '45130', 'Villas de Torremolinos'),
(2, 'Nueva Escocia', '2021', NULL, '44900', 'Colomos'),
(3, 'corraleros', '612', NULL, '45130', 'los naranjos'),
(4, 'pedro loza', '2134', '12', '45132', 'el zapote'),
(5, 'tulipan rojo', '563', NULL, '45210', 'cañadas'),
(6, 'miguel hidalgo', '234', NULL, '44900', 'rio blanco'),
(7, 'patos', '1278', NULL, '45098', 'el centinela'),
(8, 'josefa ortiz', '127', NULL, '44293', 'constitucion'),
(9, 'risco', '3289', '123', '45182', 'san lorenzo'),
(10, 'paseo grande', '123', NULL, '4130', 'lomas de zapopan'),
(11, 'paseo bravo', '162', NULL, '45130', 'lomas de zapopan'),
(12, 'montilla', '1827', NULL, '44567', 'loma blanca'),
(13, 'pluton', '129', NULL, '44200', 'planetas'),
(14, 'saturno', '189', NULL, '44200', 'planetas'),
(15, 'rojo', '12', NULL, '44300', 'colores'),
(16, 'amarillo', '72', NULL, '44300', 'colores'),
(17, '16 de septiembre', '124', NULL, '45283', 'independencia'),
(18, 'corraleros', '612', NULL, '45130', 'los naranjos'),
(19, 'pedro loza', '2134', '12', '45132', 'el zapote'),
(20, 'tulipan rojo', '563', NULL, '45210', 'cañadas'),
(21, 'miguel hidalgo', '234', NULL, '44900', 'rio blanco'),
(22, 'patos', '1278', NULL, '45098', 'el centinela'),
(23, 'josefa ortiz', '127', NULL, '44293', 'constitucion'),
(24, 'risco', '3289', '123', '45182', 'san lorenzo'),
(25, 'paseo grande', '123', NULL, '4130', 'lomas de zapopan'),
(26, 'paseo bravo', '162', NULL, '45130', 'lomas de zapopan'),
(27, 'montilla', '1827', NULL, '44567', 'loma blanca'),
(28, 'pluton', '129', NULL, '44200', 'planetas'),
(29, 'saturno', '189', NULL, '44200', 'planetas'),
(30, 'rojo', '12', NULL, '44300', 'colores'),
(31, 'amarillo', '72', NULL, '44300', 'colores'),
(32, '16 de septiembre', '124', NULL, '45283', 'independencia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

CREATE TABLE `movimientos` (
  `numeroDeMovimiento` int(11) NOT NULL,
  `concepto` varchar(45) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `tipo` int(11) NOT NULL,
  `cuentaAcredor` int(11) NOT NULL,
  `cuentaDeudor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `movimientos`
--

INSERT INTO `movimientos` (`numeroDeMovimiento`, `concepto`, `monto`, `tipo`, `cuentaAcredor`, `cuentaDeudor`) VALUES
(1, 'Electronics', '2000.00', 1, 2, 1),
(2, 'Electronics', '2000.00', 1, 2, 1),
(3, 'Electronics', '2000.00', 1, 2, 1),
(4, 'Electronics', '2000.00', 1, 1, 2),
(5, 'Electronics', '2000.00', 1, 1, 2),
(6, 'Electronics', '2000.00', 1, 2, 1),
(7, 'Electronics', '2000.00', 1, 2, 1),
(8, 'Electronics', '2000.00', 1, 1, 2),
(9, 'Electronics', '2000.00', 1, 2, 1),
(10, 'Electronics', '2.00', 1, 2, 1),
(11, 'Electronics', '2.00', 1, 1, 2),
(12, 'Electronics', '20.00', 1, 2, 1),
(13, 'Electronics', '20.00', 1, 1, 2),
(14, 'Electronics', '20.00', 1, 2, 1),
(15, 'Electronics', '20.00', 1, 1, 2),
(16, 'Electronics', '20.00', 1, 2, 1),
(17, 'Electronics', '20.00', 1, 2, 1),
(18, 'Electronics', '20.00', 1, 1, 2),
(19, 'Electronics', '20.00', 1, 2, 1),
(20, 'Electronics', '20.00', 1, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodemovimiento`
--

CREATE TABLE `tipodemovimiento` (
  `idtipoDeMovimiento` int(11) NOT NULL,
  `movimiento` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipodemovimiento`
--

INSERT INTO `tipodemovimiento` (`idtipoDeMovimiento`, `movimiento`) VALUES
(1, 'Egreso'),
(2, 'Ingreso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `contrasena` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `usuario`, `contrasena`) VALUES
(1, 'luis', '12345'),
(2, 'electronics', '54321'),
(3, 'jorge182', 'jorge182'),
(4, 'juan101', 'juan101'),
(5, 'diego192', 'diego192'),
(6, 'tibe546', 'tibe546'),
(7, 'ana178', 'ana178'),
(8, 'pedro971', 'pedro971'),
(9, 'karen12', 'karen12'),
(10, 'jaime837', 'jaime837'),
(11, 'omar192', 'omar192'),
(12, 'kevin87', 'kevin87'),
(13, 'chuy12', 'chuy12'),
(14, 'rogelio24', 'rogelio24'),
(15, 'layla123', 'layla123'),
(16, 'estela24', 'estela24'),
(17, 'asis21', 'asis21'),
(18, 'jorge182', 'jorge182'),
(19, 'juan101', 'juan101'),
(20, 'diego192', 'diego192'),
(21, 'tibe546', 'tibe546'),
(22, 'ana178', 'ana178'),
(23, 'pedro971', 'pedro971'),
(24, 'karen12', 'karen12'),
(25, 'jaime837', 'jaime837'),
(26, 'omar192', 'omar192'),
(27, 'kevin87', 'kevin87'),
(28, 'chuy12', 'chuy12'),
(29, 'rogelio24', 'rogelio24'),
(30, 'layla123', 'layla123'),
(31, 'estela24', 'estela24'),
(32, 'asis21', 'asis21');

-- --------------------------------------------------------

--
-- Estructura para la vista `caducidad`
--
DROP TABLE IF EXISTS `caducidad`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `caducidad`  AS SELECT `cuenta`.`numeroDeTarjeta` AS `numeroDeTarjeta`, `cuenta`.`numeroDeCuenta` AS `numeroDeCuenta`, CASE WHEN `cuenta`.`fechaDeVencimiento` < current_timestamp() THEN 0 ELSE 1 END AS `isActive` FROM `cuenta` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD KEY `usuarioCliente_idx` (`usuario`),
  ADD KEY `direccionCliente_idx` (`direccion`);

--
-- Indices de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD PRIMARY KEY (`numeroDeCuenta`),
  ADD KEY `cuentaCliente_idx` (`cliente`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`idDireccion`);

--
-- Indices de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD PRIMARY KEY (`numeroDeMovimiento`),
  ADD KEY `movimientosCuentaDeudor_idx` (`cuentaDeudor`),
  ADD KEY `movimientosCuentaAcredor_idx` (`cuentaAcredor`),
  ADD KEY `movimientosTipo_idx` (`tipo`);

--
-- Indices de la tabla `tipodemovimiento`
--
ALTER TABLE `tipodemovimiento`
  ADD PRIMARY KEY (`idtipoDeMovimiento`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  MODIFY `numeroDeCuenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `idDireccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `numeroDeMovimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `tipodemovimiento`
--
ALTER TABLE `tipodemovimiento`
  MODIFY `idtipoDeMovimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `direccionCliente` FOREIGN KEY (`direccion`) REFERENCES `direccion` (`idDireccion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `usuarioCliente` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD CONSTRAINT `cuentaCliente` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD CONSTRAINT `movimientosCuentaAcredor` FOREIGN KEY (`cuentaAcredor`) REFERENCES `cuenta` (`numeroDeCuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `movimientosCuentaDeudor` FOREIGN KEY (`cuentaDeudor`) REFERENCES `cuenta` (`numeroDeCuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `movimientosTipo` FOREIGN KEY (`tipo`) REFERENCES `tipodemovimiento` (`idtipoDeMovimiento`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
