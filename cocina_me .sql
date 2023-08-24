-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-08-2023 a las 14:57:55
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
-- Estructura de tabla para la tabla `categoría`
--

CREATE TABLE `categoría` (
  `CategoríaID` int(11) NOT NULL,
  `NombreCategoría` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingrediente`
--

CREATE TABLE `ingrediente` (
  `IngredienteID` int(11) NOT NULL,
  `NombreIngrediente` varchar(255) NOT NULL,
  `Cantidad` float DEFAULT NULL,
  `UnidadMedida` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receta`
--

CREATE TABLE `receta` (
  `RecetaID` int(11) NOT NULL,
  `VideoID` int(11) DEFAULT NULL,
  `NombreReceta` varchar(255) NOT NULL,
  `Descripción` text DEFAULT NULL,
  `NivelDificultad` varchar(50) DEFAULT NULL,
  `TiempoPreparación` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetacategoría`
--

CREATE TABLE `recetacategoría` (
  `RecetaID` int(11) NOT NULL,
  `CategoríaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetaingrediente`
--

CREATE TABLE `recetaingrediente` (
  `RecetaID` int(11) NOT NULL,
  `IngredienteID` int(11) NOT NULL,
  `Cantidad` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `UsuarioID` int(11) NOT NULL,
  `NombreUsuario` varchar(255) NOT NULL,
  `Contraseña` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariofavoritos`
--

CREATE TABLE `usuariofavoritos` (
  `UsuarioID` int(11) NOT NULL,
  `RecetaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `video`
--

CREATE TABLE `video` (
  `VideoID` int(11) NOT NULL,
  `UsuarioID` int(11) DEFAULT NULL,
  `Título` varchar(255) NOT NULL,
  `Descripción` text DEFAULT NULL,
  `URLVideo` varchar(255) DEFAULT NULL,
  `FechaSubida` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoría`
--
ALTER TABLE `categoría`
  ADD PRIMARY KEY (`CategoríaID`);

--
-- Indices de la tabla `ingrediente`
--
ALTER TABLE `ingrediente`
  ADD PRIMARY KEY (`IngredienteID`);

--
-- Indices de la tabla `receta`
--
ALTER TABLE `receta`
  ADD PRIMARY KEY (`RecetaID`),
  ADD KEY `VideoID` (`VideoID`);

--
-- Indices de la tabla `recetacategoría`
--
ALTER TABLE `recetacategoría`
  ADD PRIMARY KEY (`RecetaID`,`CategoríaID`),
  ADD KEY `CategoríaID` (`CategoríaID`);

--
-- Indices de la tabla `recetaingrediente`
--
ALTER TABLE `recetaingrediente`
  ADD PRIMARY KEY (`RecetaID`,`IngredienteID`),
  ADD KEY `IngredienteID` (`IngredienteID`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`UsuarioID`);

--
-- Indices de la tabla `usuariofavoritos`
--
ALTER TABLE `usuariofavoritos`
  ADD PRIMARY KEY (`UsuarioID`,`RecetaID`),
  ADD KEY `RecetaID` (`RecetaID`);

--
-- Indices de la tabla `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`VideoID`),
  ADD KEY `UsuarioID` (`UsuarioID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoría`
--
ALTER TABLE `categoría`
  MODIFY `CategoríaID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ingrediente`
--
ALTER TABLE `ingrediente`
  MODIFY `IngredienteID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `receta`
--
ALTER TABLE `receta`
  MODIFY `RecetaID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `UsuarioID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `video`
--
ALTER TABLE `video`
  MODIFY `VideoID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `receta`
--
ALTER TABLE `receta`
  ADD CONSTRAINT `receta_ibfk_1` FOREIGN KEY (`VideoID`) REFERENCES `video` (`VideoID`);

--
-- Filtros para la tabla `recetacategoría`
--
ALTER TABLE `recetacategoría`
  ADD CONSTRAINT `recetacategoría_ibfk_1` FOREIGN KEY (`RecetaID`) REFERENCES `receta` (`RecetaID`),
  ADD CONSTRAINT `recetacategoría_ibfk_2` FOREIGN KEY (`CategoríaID`) REFERENCES `categoría` (`CategoríaID`);

--
-- Filtros para la tabla `recetaingrediente`
--
ALTER TABLE `recetaingrediente`
  ADD CONSTRAINT `recetaingrediente_ibfk_1` FOREIGN KEY (`RecetaID`) REFERENCES `receta` (`RecetaID`),
  ADD CONSTRAINT `recetaingrediente_ibfk_2` FOREIGN KEY (`IngredienteID`) REFERENCES `ingrediente` (`IngredienteID`);

--
-- Filtros para la tabla `usuariofavoritos`
--
ALTER TABLE `usuariofavoritos`
  ADD CONSTRAINT `usuariofavoritos_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `usuario` (`UsuarioID`),
  ADD CONSTRAINT `usuariofavoritos_ibfk_2` FOREIGN KEY (`RecetaID`) REFERENCES `receta` (`RecetaID`);

--
-- Filtros para la tabla `video`
--
ALTER TABLE `video`
  ADD CONSTRAINT `video_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `usuario` (`UsuarioID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
