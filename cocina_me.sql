-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-08-2023 a las 14:57:53
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cocina.me`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingrediente`
--

CREATE TABLE `ingrediente` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Cantidad` float DEFAULT NULL,
  `UnidadDeMedida` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receta`
--

CREATE TABLE `receta` (
  `ID` int(11) NOT NULL,
  `Titulo` varchar(100) DEFAULT NULL,
  `Descripcion` text DEFAULT NULL,
  `TiempoDePreparacion` int(11) DEFAULT NULL,
  `Dificultad` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetacategoria`
--

CREATE TABLE `recetacategoria` (
  `RecetaID` int(11) NOT NULL,
  `CategoriaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetaingrediente`
--

CREATE TABLE `recetaingrediente` (
  `RecetaID` int(11) NOT NULL,
  `IngredienteID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `video`
--

CREATE TABLE `video` (
  `ID` int(11) NOT NULL,
  `RecetaID` int(11) DEFAULT NULL,
  `Titulo` varchar(100) DEFAULT NULL,
  `URLVideo` varchar(200) DEFAULT NULL,
  `Duracion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `ingrediente`
--
ALTER TABLE `ingrediente`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `receta`
--
ALTER TABLE `receta`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `recetacategoria`
--
ALTER TABLE `recetacategoria`
  ADD PRIMARY KEY (`RecetaID`,`CategoriaID`),
  ADD KEY `CategoriaID` (`CategoriaID`);

--
-- Indices de la tabla `recetaingrediente`
--
ALTER TABLE `recetaingrediente`
  ADD PRIMARY KEY (`RecetaID`,`IngredienteID`),
  ADD KEY `IngredienteID` (`IngredienteID`);

--
-- Indices de la tabla `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `RecetaID` (`RecetaID`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `recetacategoria`
--
ALTER TABLE `recetacategoria`
  ADD CONSTRAINT `recetacategoria_ibfk_1` FOREIGN KEY (`RecetaID`) REFERENCES `receta` (`ID`),
  ADD CONSTRAINT `recetacategoria_ibfk_2` FOREIGN KEY (`CategoriaID`) REFERENCES `categoria` (`ID`);

--
-- Filtros para la tabla `recetaingrediente`
--
ALTER TABLE `recetaingrediente`
  ADD CONSTRAINT `recetaingrediente_ibfk_1` FOREIGN KEY (`RecetaID`) REFERENCES `receta` (`ID`),
  ADD CONSTRAINT `recetaingrediente_ibfk_2` FOREIGN KEY (`IngredienteID`) REFERENCES `ingrediente` (`ID`);

--
-- Filtros para la tabla `video`
--
ALTER TABLE `video`
  ADD CONSTRAINT `video_ibfk_1` FOREIGN KEY (`RecetaID`) REFERENCES `receta` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
