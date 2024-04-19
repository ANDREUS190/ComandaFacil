-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-04-2024 a las 19:26:57
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
-- Base de datos: `comandafacil`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aperitivos`
--

CREATE TABLE `aperitivos` (
  `ID_Aperitivo` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Descripción` varchar(255) DEFAULT NULL,
  `Precio` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `aperitivos`
--

INSERT INTO `aperitivos` (`ID_Aperitivo`, `Nombre`, `Descripción`, `Precio`) VALUES
(1, 'Nombre del aperitivo 1', 'Descripción del aperitivo 1', 4.00),
(2, 'Nombre del aperitivo 2', 'Descripción del aperitivo 2', 5.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bebidas`
--

CREATE TABLE `bebidas` (
  `ID_Bebida` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Descripción` varchar(255) DEFAULT NULL,
  `Precio` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `bebidas`
--

INSERT INTO `bebidas` (`ID_Bebida`, `Nombre`, `Descripción`, `Precio`) VALUES
(1, 'Nombre de la bebida 1', 'Descripción de la bebida 1', 5.00),
(2, 'Nombre de la bebida 2', 'Descripción de la bebida 2', 7.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bocadillos`
--

CREATE TABLE `bocadillos` (
  `ID_Bocadillo` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Descripción` varchar(255) DEFAULT NULL,
  `Precio` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `bocadillos`
--

INSERT INTO `bocadillos` (`ID_Bocadillo`, `Nombre`, `Descripción`, `Precio`) VALUES
(1, 'Nombre del bocadillo 1', 'Descripción del bocadillo 1', 7.00),
(2, 'Nombre del bocadillo 2', 'Descripción del bocadillo 2', 9.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `ID_Cliente` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Apellido` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cocineros`
--

CREATE TABLE `cocineros` (
  `ID_Cocinero` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Apellido` varchar(50) DEFAULT NULL,
  `Usuario` varchar(50) DEFAULT NULL,
  `Contraseña` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `cocineros`
--

INSERT INTO `cocineros` (`ID_Cocinero`, `Nombre`, `Apellido`, `Usuario`, `Contraseña`) VALUES
(1, 'Sergio', 'Andreu', 'andreu', 'password');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comidas`
--

CREATE TABLE `comidas` (
  `ID_Comida` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Descripción` varchar(255) DEFAULT NULL,
  `Precio` decimal(5,2) DEFAULT NULL,
  `Imagen_URL` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `comidas`
--

INSERT INTO `comidas` (`ID_Comida`, `Nombre`, `Descripción`, `Precio`, `Imagen_URL`) VALUES
(1, 'Paella Valenciana', 'Arroz con pollo, conejo y verduras', 15.50, 'img/Comidas/paellaValenciana.png'),
(2, 'Tortilla Española', 'Tortilla de patatas y cebolla', 7.00, 'img/Comidas/paellaValenciana.png'),
(3, 'Gazpacho', 'Sopa fría de tomate y verduras', 6.00, 'img/Comidas/paellaValenciana.png'),
(4, 'Pulpo a la Gallega', 'Pulpo cocido con pimentón y aceite de oliva', 16.00, 'img/Comidas/paellaValenciana.png'),
(5, 'Churros con Chocolate', 'Dulce frito servido con chocolate caliente', 5.00, 'img/Comidas/paellaValenciana.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedidos`
--

CREATE TABLE `detalle_pedidos` (
  `ID_Detalle` int(11) NOT NULL,
  `ID_Pedido` int(11) DEFAULT NULL,
  `ID_Bebida` int(11) DEFAULT NULL,
  `ID_Comida` int(11) DEFAULT NULL,
  `ID_Postre` int(11) DEFAULT NULL,
  `ID_Aperitivo` int(11) DEFAULT NULL,
  `ID_Bocadillo` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidodetalle`
--

CREATE TABLE `pedidodetalle` (
  `ID_Detalle` int(11) NOT NULL,
  `ID_Pedido` int(11) DEFAULT NULL,
  `nombre_plato` varchar(50) DEFAULT NULL,
  `precio_plato` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `pedidodetalle`
--

INSERT INTO `pedidodetalle` (`ID_Detalle`, `ID_Pedido`, `nombre_plato`, `precio_plato`) VALUES
(1, NULL, 'Gazpacho', 0.00),
(2, NULL, 'Tortilla Española', 0.00),
(3, NULL, 'Paella Valenciana', 0.00),
(4, NULL, 'Churros con Chocolate', 0.00),
(5, NULL, 'Tortilla Española', 0.00),
(6, NULL, 'Gazpacho', 0.00),
(7, NULL, 'Nombre del aperitivo 1', 0.00),
(8, NULL, 'Nombre de la bebida 2', 0.00),
(9, NULL, 'Paella Valenciana', 0.00),
(10, NULL, 'Gazpacho', 0.00),
(11, NULL, 'Nombre del bocadillo 1', 0.00),
(12, NULL, 'Nombre del bocadillo 2', 0.00),
(13, NULL, 'Nombre del aperitivo 2', 0.00),
(14, NULL, 'Nombre del bocadillo 2', 0.00),
(15, NULL, 'Nombre del bocadillo 1', 0.00),
(16, NULL, 'Churros con Chocolate', 0.00),
(17, NULL, 'Nombre del bocadillo 1', 0.00),
(18, NULL, 'Paella Valenciana', 0.00),
(19, NULL, 'Tortilla Española', 0.00),
(20, NULL, 'Paella Valenciana', 0.00),
(21, NULL, 'Gazpacho', 0.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `ID_Pedido` int(11) NOT NULL,
  `ID_Cliente` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Total` decimal(5,2) DEFAULT NULL,
  `Pagado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `postres`
--

CREATE TABLE `postres` (
  `ID_Postre` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Descripción` varchar(255) DEFAULT NULL,
  `Precio` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `postres`
--

INSERT INTO `postres` (`ID_Postre`, `Nombre`, `Descripción`, `Precio`) VALUES
(1, 'Nombre del postre 1', 'Descripción del postre 1', 6.00),
(2, 'Nombre del postre 2', 'Descripción del postre 2', 8.00);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aperitivos`
--
ALTER TABLE `aperitivos`
  ADD PRIMARY KEY (`ID_Aperitivo`);

--
-- Indices de la tabla `bebidas`
--
ALTER TABLE `bebidas`
  ADD PRIMARY KEY (`ID_Bebida`);

--
-- Indices de la tabla `bocadillos`
--
ALTER TABLE `bocadillos`
  ADD PRIMARY KEY (`ID_Bocadillo`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ID_Cliente`);

--
-- Indices de la tabla `cocineros`
--
ALTER TABLE `cocineros`
  ADD PRIMARY KEY (`ID_Cocinero`);

--
-- Indices de la tabla `comidas`
--
ALTER TABLE `comidas`
  ADD PRIMARY KEY (`ID_Comida`);

--
-- Indices de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD PRIMARY KEY (`ID_Detalle`),
  ADD KEY `ID_Pedido` (`ID_Pedido`),
  ADD KEY `ID_Bebida` (`ID_Bebida`),
  ADD KEY `ID_Comida` (`ID_Comida`),
  ADD KEY `ID_Postre` (`ID_Postre`),
  ADD KEY `ID_Aperitivo` (`ID_Aperitivo`),
  ADD KEY `ID_Bocadillo` (`ID_Bocadillo`);

--
-- Indices de la tabla `pedidodetalle`
--
ALTER TABLE `pedidodetalle`
  ADD PRIMARY KEY (`ID_Detalle`),
  ADD KEY `ID_Pedido` (`ID_Pedido`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`ID_Pedido`),
  ADD KEY `ID_Cliente` (`ID_Cliente`);

--
-- Indices de la tabla `postres`
--
ALTER TABLE `postres`
  ADD PRIMARY KEY (`ID_Postre`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aperitivos`
--
ALTER TABLE `aperitivos`
  MODIFY `ID_Aperitivo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `bebidas`
--
ALTER TABLE `bebidas`
  MODIFY `ID_Bebida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `bocadillos`
--
ALTER TABLE `bocadillos`
  MODIFY `ID_Bocadillo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `ID_Cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cocineros`
--
ALTER TABLE `cocineros`
  MODIFY `ID_Cocinero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `comidas`
--
ALTER TABLE `comidas`
  MODIFY `ID_Comida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  MODIFY `ID_Detalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidodetalle`
--
ALTER TABLE `pedidodetalle`
  MODIFY `ID_Detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `ID_Pedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `postres`
--
ALTER TABLE `postres`
  MODIFY `ID_Postre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD CONSTRAINT `detalle_pedidos_ibfk_1` FOREIGN KEY (`ID_Pedido`) REFERENCES `pedidos` (`ID_Pedido`),
  ADD CONSTRAINT `detalle_pedidos_ibfk_2` FOREIGN KEY (`ID_Bebida`) REFERENCES `bebidas` (`ID_Bebida`),
  ADD CONSTRAINT `detalle_pedidos_ibfk_3` FOREIGN KEY (`ID_Comida`) REFERENCES `comidas` (`ID_Comida`),
  ADD CONSTRAINT `detalle_pedidos_ibfk_4` FOREIGN KEY (`ID_Postre`) REFERENCES `postres` (`ID_Postre`),
  ADD CONSTRAINT `detalle_pedidos_ibfk_5` FOREIGN KEY (`ID_Aperitivo`) REFERENCES `aperitivos` (`ID_Aperitivo`),
  ADD CONSTRAINT `detalle_pedidos_ibfk_6` FOREIGN KEY (`ID_Bocadillo`) REFERENCES `bocadillos` (`ID_Bocadillo`);

--
-- Filtros para la tabla `pedidodetalle`
--
ALTER TABLE `pedidodetalle`
  ADD CONSTRAINT `pedidodetalle_ibfk_1` FOREIGN KEY (`ID_Pedido`) REFERENCES `pedidos` (`ID_Pedido`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `clientes` (`ID_Cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;