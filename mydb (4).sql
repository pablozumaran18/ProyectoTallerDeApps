-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-07-2022 a las 19:38:15
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mydb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arriendo`
--

CREATE TABLE `arriendo` (
  `id Arriendo` int(11) NOT NULL,
  `cliente_idcliente` int(11) NOT NULL,
  `maquina_id` int(11) NOT NULL,
  `maquina_Estados Maquina_idEstado` int(11) NOT NULL,
  `maquina_Tipo maquinas_idTipoM` int(11) NOT NULL,
  `maquina_Modelo_idModelo` int(11) NOT NULL,
  `operador_id operador` int(11) NOT NULL,
  `operador_maquina_id` int(11) NOT NULL,
  `operador_maquina_Estados Maquina_idEstado` int(11) NOT NULL,
  `operador_maquina_Tipo maquinas_idTipoM` int(11) NOT NULL,
  `operador_maquina_Modelo_idModelo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL,
  `nom Cliente` varchar(45) NOT NULL,
  `apellido Cliente` varchar(45) NOT NULL,
  `corr Cliente` varchar(45) NOT NULL,
  `rut Cliente` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idcliente`, `nom Cliente`, `apellido Cliente`, `corr Cliente`, `rut Cliente`) VALUES
(1, 'Juan', 'Soldado', 'juanito@gmail.com', '21.345.678-9'),
(2, 'Fernando', 'Fenix', 'Fenixlimitada@gmail.com', '12.345.567-8');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados maquina`
--

CREATE TABLE `estados maquina` (
  `idEstado` int(11) NOT NULL,
  `descripcion estado` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estados maquina`
--

INSERT INTO `estados maquina` (`idEstado`, `descripcion estado`) VALUES
(1, 'Disponible'),
(2, 'Ocupada'),
(3, 'En mantencion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maquina`
--

CREATE TABLE `maquina` (
  `id` int(11) NOT NULL,
  `codigo` int(11) NOT NULL,
  `Id_Estado` int(11) NOT NULL,
  `id_Op` text NOT NULL,
  `id_TipoM` int(11) NOT NULL,
  `Estados Maquina` varchar(11) NOT NULL,
  `Tipo maquinas` varchar(11) NOT NULL,
  `Modelo` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `maquina`
--

INSERT INTO `maquina` (`id`, `codigo`, `Id_Estado`, `id_Op`, `id_TipoM`, `Estados Maquina`, `Tipo maquinas`, `Modelo`) VALUES
(2, 133, 2, 'Pedro Gomez', 2, 'ocuapada', 'Grua Movil', 'LTM1500'),
(3, 144, 1, 'Jorge Maximus', 2, 'disponible', 'Grua Movil', 'KL1'),
(4, 155, 2, 'Mauricio Ginebra', 4, 'ocuapada', 'Grua horqui', 'wb146'),
(5, 166, 1, 'Diego Stark', 3, 'Disponible', 'Camion Mine', 'HD605'),
(6, 177, 3, 'Pedro Aguirre', 3, 'En mantenci', 'Camion Mine', 'T282C');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `idMarca` int(11) NOT NULL,
  `nombre marca` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`idMarca`, `nombre marca`) VALUES
(1, 'Caterpillar'),
(2, 'Komatsu'),
(3, 'Liebherr');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo`
--

CREATE TABLE `modelo` (
  `idModelo` int(11) NOT NULL,
  `nombre modelo` varchar(45) NOT NULL,
  `Marca_idMarca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `modelo`
--

INSERT INTO `modelo` (`idModelo`, `nombre modelo`, `Marca_idMarca`) VALUES
(1, '416e', 1),
(2, 'wb146', 2),
(3, 'HD605', 2),
(4, 'Grua movil LTM1500', 3),
(5, 'CAMIÓN MINERO T282C', 3),
(6, 'KL1', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operador`
--

CREATE TABLE `operador` (
  `id operador` int(11) NOT NULL,
  `mombre Op` varchar(45) NOT NULL,
  `maquina_id` int(11) NOT NULL,
  `maquina_Estados Maquina_idEstado` int(11) NOT NULL,
  `maquina_Tipo maquinas_idTipoM` int(11) NOT NULL,
  `maquina_Modelo_idModelo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `operador`
--

INSERT INTO `operador` (`id operador`, `mombre Op`, `maquina_id`, `maquina_Estados Maquina_idEstado`, `maquina_Tipo maquinas_idTipoM`, `maquina_Modelo_idModelo`) VALUES
(1, 'Jorge Maximus', 2, 1, 2, 6),
(2, 'Juan Gomez', 1, 1, 1, 1),
(3, 'Pedro Gomez', 3, 1, 2, 4),
(4, 'Pedro Aguirre', 4, 3, 3, 5),
(5, 'Mauricio Ginebra', 5, 2, 4, 2),
(6, 'Diego Stark', 6, 1, 3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo maquinas`
--

CREATE TABLE `tipo maquinas` (
  `idTipoM` int(11) NOT NULL,
  `Tipo maquina` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo maquinas`
--

INSERT INTO `tipo maquinas` (`idTipoM`, `Tipo maquina`) VALUES
(1, 'Retroexcavadora'),
(2, 'GruaMovil'),
(3, 'Camion minero'),
(4, 'Grua horquilla');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `arriendo`
--
ALTER TABLE `arriendo`
  ADD PRIMARY KEY (`id Arriendo`,`maquina_id`,`maquina_Estados Maquina_idEstado`,`maquina_Tipo maquinas_idTipoM`,`maquina_Modelo_idModelo`,`operador_id operador`,`operador_maquina_id`,`operador_maquina_Estados Maquina_idEstado`,`operador_maquina_Tipo maquinas_idTipoM`,`operador_maquina_Modelo_idModelo`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idcliente`);

--
-- Indices de la tabla `estados maquina`
--
ALTER TABLE `estados maquina`
  ADD PRIMARY KEY (`idEstado`);

--
-- Indices de la tabla `maquina`
--
ALTER TABLE `maquina`
  ADD PRIMARY KEY (`id`,`Estados Maquina`,`Tipo maquinas`,`Modelo`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD KEY `idMarca` (`idMarca`) USING BTREE;

--
-- Indices de la tabla `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`idModelo`,`Marca_idMarca`);

--
-- Indices de la tabla `operador`
--
ALTER TABLE `operador`
  ADD PRIMARY KEY (`id operador`,`maquina_id`,`maquina_Estados Maquina_idEstado`,`maquina_Tipo maquinas_idTipoM`,`maquina_Modelo_idModelo`);

--
-- Indices de la tabla `tipo maquinas`
--
ALTER TABLE `tipo maquinas`
  ADD PRIMARY KEY (`idTipoM`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `arriendo`
--
ALTER TABLE `arriendo`
  MODIFY `id Arriendo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estados maquina`
--
ALTER TABLE `estados maquina`
  MODIFY `idEstado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `maquina`
--
ALTER TABLE `maquina`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `idMarca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `modelo`
--
ALTER TABLE `modelo`
  MODIFY `idModelo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `operador`
--
ALTER TABLE `operador`
  MODIFY `id operador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tipo maquinas`
--
ALTER TABLE `tipo maquinas`
  MODIFY `idTipoM` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
