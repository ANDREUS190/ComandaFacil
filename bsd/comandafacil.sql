-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-04-2024 a las 15:20:49
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
  `id_aperitivo` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` decimal(5,2) DEFAULT NULL,
  `imagen_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `aperitivos`
--

INSERT INTO `aperitivos` (`id_aperitivo`, `nombre`, `descripcion`, `precio`, `imagen_url`) VALUES
(1, 'Aceitunas', 'Aceitunas marinadas, un aperitivo muy común en toda España.', 1.50, 'img/aperitivos/aceitunas.png'),
(2, 'Almendras', 'Almendras tostadas, un aperitivo popular en bares y restaurantes.', 3.50, 'img/aperitivos/almendras.png'),
(3, 'Boquerones en Vinagre', 'Anchoas marinadas en vinagre, un aperitivo típico en Andalucía.', 4.00, 'img/aperitivos/boquerones.png'),
(4, 'Patatas Bravas', 'Patatas fritas con salsa picante, un aperitivo clásico en Madrid.', 5.00, 'img/aperitivos/bravas.png'),
(6, 'Jamón Ibérico', 'Fino jamón curado, un aperitivo de lujo en toda España.', 15.00, 'img/aperitivos/jamonIberico.png'),
(7, 'Queso Manchego', 'Queso de oveja curado, un aperitivo popular en La Mancha.', 6.00, 'img/aperitivos/quesoManchego.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bebidas`
--

CREATE TABLE `bebidas` (
  `id_bebida` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` decimal(5,2) DEFAULT NULL,
  `imagen_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `bebidas`
--

INSERT INTO `bebidas` (`id_bebida`, `nombre`, `descripcion`, `precio`, `imagen_url`) VALUES
(1, 'Coca-Cola', 'Una bebida refrescante muy popular en todo el mundo.', 2.00, 'img/bebidas/cocaCola.png'),
(2, 'Fanta Naranja', 'Un refresco de naranja muy popular.', 2.00, 'img/bebidas/fantaNaranja.png'),
(3, 'Sprite', 'Un refresco de limón y lima.', 2.00, 'img/bebidas/sprite.png'),
(4, 'Pepsi', 'Un refresco de cola, similar a la Coca-Cola.', 2.00, 'img/bebidas/pepsi.png'),
(7, 'Fanta Limon', 'Un refresco de limon muy popular.', 2.50, 'img/bebidas/fantaLimon.png'),
(8, 'Aquarius', 'Una bebida deportiva popular.', 2.50, 'img/bebidas/aquarius.png'),
(9, 'Nestea', 'Un refresco de té helado.', 2.50, 'img/bebidas/nestea.png'),
(11, 'Red Bull', 'Una bebida energética muy popular.', 3.00, 'img/bebidas/redBull.png'),
(12, 'Monster Energy', 'Otra bebida energética popular.', 3.00, 'img/bebidas/monster.png'),
(13, 'Gatorade', 'Una bebida deportiva popular.', 3.00, 'img/bebidas/gatorade.png'),
(14, 'Powerade', 'Otra bebida deportiva popular.', 3.00, 'img/bebidas/powerade.png'),
(15, 'Cerveza', 'Cerveza tipica', 3.00, 'img/bebidas/cerveza.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bocadillos`
--

CREATE TABLE `bocadillos` (
  `id_bocadillo` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` decimal(5,2) DEFAULT NULL,
  `imagen_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `bocadillos`
--

INSERT INTO `bocadillos` (`id_bocadillo`, `nombre`, `descripcion`, `precio`, `imagen_url`) VALUES
(1, 'Bocadillo de Calamares', 'Un bocadillo muy popular en Madrid, hecho con anillas de calamar rebozadas en harina y huevo.', 6.00, 'img/bocadillos/bocadillo.png'),
(2, 'Bocadillo de Jamón Ibérico', 'Un clásico español, hecho con el famoso jamón ibérico.', 7.50, 'img/bocadillos/bocadillo.png'),
(4, 'Bocadillo de Tortilla Española', 'Un favorito en todo el país, hecho con tortilla de patatas.', 5.50, 'img/bocadillos/bocadillo.png'),
(5, 'Bocadillo de Pulpo a la Gallega', 'Un bocadillo gallego hecho con pulpo.', 8.00, 'img/bocadillos/bocadillo.png'),
(7, 'Pepito de Ternera', 'Un bocadillo caliente y delicioso a base de un fino filete de ternera a la plancha.', 7.00, 'img/bocadillos/bocadillo.png'),
(8, 'Bocadillo de Chorizo', 'Un bocadillo simple pero delicioso, hecho con chorizo.', 5.00, 'img/bocadillos/bocadillo.png'),
(9, 'Bocadillo de Lomo con Queso', 'Un bocadillo sabroso hecho con lomo de cerdo y queso.', 6.50, 'img/bocadillos/bocadillo.png');

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
  `id_cocinero` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Apellido` varchar(50) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `cocineros`
--

INSERT INTO `cocineros` (`id_cocinero`, `Nombre`, `Apellido`, `username`, `password`) VALUES
(2, 'Sergio', 'Andreu', 'andreu', 'password');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comidas`
--

CREATE TABLE `comidas` (
  `id_comida` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` decimal(5,2) DEFAULT NULL,
  `imagen_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `comidas`
--

INSERT INTO `comidas` (`id_comida`, `nombre`, `descripcion`, `precio`, `imagen_url`) VALUES
(1, 'Paella', 'Un plato de arroz muy popular en la Comunidad Valenciana.', 15.00, 'img/comidas/paella.png'),
(2, 'Tortilla Española', 'Una tortilla de patatas, es un plato tradicional en toda España.', 10.00, 'img/comidas/tortillaEspanola.png'),
(3, 'Gazpacho', 'Una sopa fría muy refrescante, típica de Andalucía.', 8.00, 'img/comidas/gazpacho.png'),
(4, 'Fabada Asturiana', 'Un guiso de alubias blancas, chorizo y morcilla.', 12.00, 'img/comidas/fabadaAsturiana.png'),
(5, 'Pulpo a la Gallega', 'Pulpo cocido y aderezado con pimentón, típico de Galicia.', 16.00, 'img/comidas/pulpoGallega.png'),
(6, 'Cochinillo Asado', 'Lechón asado al horno, típico de Segovia.', 20.00, 'img/comidas/cochinilloAsado.png'),
(8, 'Pisto Manchego', 'Guiso de verduras, típico de La Mancha.', 10.00, 'img/comidas/pistoManchego.png'),
(9, 'Fideuá', 'Un plato de fideos con mariscos, típico de la Comunidad Valenciana.', 14.00, 'img/comidas/fideua.png'),
(10, 'Escudella i Carn dOlla', 'Un guiso de carne y verduras, típico de Cataluña.', 13.00, 'img/comidas/escudella.png'),
(12, 'Migas', 'Un plato de pan rallado con carne, típico de Extremadura.', 10.00, 'img/comidas/migas.png'),
(13, 'Bacalao a la Vizcaína', 'Bacalao en salsa de pimientos rojos, típico del País Vasco.', 18.00, 'img/comidas/bacalaoVizcaina.png'),
(14, 'Cordero al Chilindrón', 'Cordero en salsa de tomate y pimientos, típico de Aragón.', 20.00, 'img/comidas/corderoChilindron.png'),
(15, 'Rabo de Toro', 'Estofado de cola de toro, típico de Andalucía.', 17.00, 'img/comidas/raboToro.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedidos`
--

CREATE TABLE `detalle_pedidos` (
  `id_detalle` int(11) NOT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `id_bebida` int(11) DEFAULT NULL,
  `id_comida` int(11) DEFAULT NULL,
  `id_postre` int(11) DEFAULT NULL,
  `id_aperitivo` int(11) DEFAULT NULL,
  `id_bocadillo` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `numero_mesa` int(11) DEFAULT NULL,
  `carrito` text DEFAULT NULL,
  `codigo_Pago` varchar(255) DEFAULT NULL,
  `precio_total` decimal(10,2) DEFAULT NULL,
  `pagado` tinyint(1) NOT NULL DEFAULT 0,
  `Finalizado` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `correo`, `nombre`, `numero_mesa`, `carrito`, `codigo_Pago`, `precio_total`, `pagado`, `Finalizado`) VALUES
(33, 'iuhiu', '87876', 87678, '[{\"nombre\":\"Flan\",\"precio\":4.5}]', '819', 4.50, 1, 1),
(34, '786786', 'y78y78', 877, '[{\"nombre\":\"Fanta Naranja\",\"precio\":2}]', '111', 2.00, 1, 1),
(35, 'uihyuihui', '87687', 676, '[{\"nombre\":\"Flan\",\"precio\":4.5}]', '357', 4.50, 1, 1),
(37, 'uyguyg', 'uguygu765', 765765, '[{\"nombre\":\"Flan\",\"precio\":4.5}]', '701', 4.50, 1, 1),
(38, 'iuhiuh', 'hiuhiuh', 876786, '[{\"nombre\":\"Boquerones en Vinagre\",\"precio\":4}]', '398', 4.00, 1, 1),
(39, 'ftyf', '5', 56, '[{\"nombre\":\"Coca-Cola\",\"precio\":2}]', '623', 2.00, 1, 1),
(40, 'uyguyg', '7656775t', 765765, '[{\"nombre\":\"Brownie\",\"precio\":5.5}]', '574', 5.50, 1, 1),
(41, 'iuhiu', 'hui', 876, '[{\"nombre\":\"Sprite\",\"precio\":2}]', '753', 2.00, 1, 1),
(42, 'ffty', 'tyftyf', 565, '[{\"nombre\":\"Flan\",\"precio\":4.5}]', '855', 4.50, 1, 1),
(43, 'uyggyu', 'uyggyu76', 67576576, '[{\"nombre\":\"Boquerones en Vinagre\",\"precio\":4}]', '148', 4.00, 1, 1),
(44, 'hiuh', '876', 786, '[{\"nombre\":\"Flan\",\"precio\":4.5}]', '744', 4.50, 1, 1),
(45, 'gyuguygyu', 'g76t76576', 7667567, '[{\"nombre\":\"Bocadillo de Tortilla Espau00f1ola\",\"precio\":5.5},{\"nombre\":\"Bocadillo de Tortilla Espau00f1ola\",\"precio\":5.5},{\"nombre\":\"Bocadillo de Jamu00f3n Ibu00e9rico\",\"precio\":7.5},{\"nombre\":\"Bocadillo de Jamu00f3n Ibu00e9rico\",\"precio\":7.5},{\"nombre\":\"Bocadillo de Jamu00f3n Ibu00e9rico\",\"precio\":7.5}]', '642', 33.50, 1, 1),
(46, 'uihiuh', 'iuhiuh', 87687, '[{\"nombre\":\"Boquerones en Vinagre\",\"precio\":4}]', '124', 4.00, 1, 1),
(47, 'iuhiuh', '87687', 876876, '[{\"nombre\":\"Fanta Naranja\",\"precio\":2},{\"nombre\":\"Sprite\",\"precio\":2}]', '379', 4.00, 1, 1),
(48, 'yugyug', '76576', 76576, '[{\"nombre\":\"Tortilla Espau00f1ola\",\"precio\":10},{\"nombre\":\"Gazpacho\",\"precio\":8}]', '436', 18.00, 1, 1),
(49, 'ytfftyf', 'yt765765', 76576576, '[{\"nombre\":\"Almendras\",\"precio\":3.5}]', '349', 3.50, 1, 1),
(50, '876', '876', 876, '[{\"nombre\":\"Tortilla Espau00f1ola\",\"precio\":10}]', '346', 10.00, 1, 1),
(51, '987987', '98798', 798798, '[{\"nombre\":\"Tortilla Espau00f1ola\",\"precio\":10},{\"nombre\":\"Gazpacho\",\"precio\":8}]', '784', 18.00, 1, 1),
(52, 'hui', '987', 987, '[{\"nombre\":\"Flan\",\"precio\":4.5},{\"nombre\":\"Brownie\",\"precio\":5.5}]', '606', 10.00, 1, 1),
(53, 'guyuyg', 'guyg', 7685, '[{\"nombre\":\"Bocadillo de Tortilla Espau00f1ola\",\"precio\":5.5}]', '258', 5.50, 1, 1),
(54, 'uyguy', '786576', 76576, '[{\"nombre\":\"Flan\",\"precio\":4.5},{\"nombre\":\"Brownie\",\"precio\":5.5}]', '719', 10.00, 1, 1),
(55, 'huihi', 'uh87687', 687687, '[{\"nombre\":\"Brownie\",\"precio\":5.5}]', '376', 5.50, 1, 1),
(56, 'guyg', 'uyguyguy', 768576, '[{\"nombre\":\"Boquerones en Vinagre\",\"precio\":4}]', '447', 4.00, 1, 1),
(57, 'jiioj', '9876987', 98798, '[{\"nombre\":\"Brownie\",\"precio\":5.5}]', '735', 5.50, 1, 1),
(58, 'u89u', '89u89u89', 9, '[{\"nombre\":\"Boquerones en Vinagre\",\"precio\":4},{\"nombre\":\"Boquerones en Vinagre\",\"precio\":4}]', '661', 8.00, 1, 1),
(59, 'hui', 'iuhui987', 7987987, '[{\"nombre\":\"Flan\",\"precio\":4.5}]', '798', 4.50, 1, 1),
(60, 'ugy', 'uyguyg', 786, '[{\"nombre\":\"Bocadillo de Tortilla Espau00f1ola\",\"precio\":5.5}]', '772', 5.50, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `postres`
--

CREATE TABLE `postres` (
  `id_postre` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` decimal(5,2) DEFAULT NULL,
  `imagen_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `postres`
--

INSERT INTO `postres` (`id_postre`, `nombre`, `descripcion`, `precio`, `imagen_url`) VALUES
(1, 'Tarta de Queso', 'Una tarta suave y cremosa hecha con queso crema y huevos, generalmente se sirve con una cobertura de mermelada de frutas[^1^][5][5].', 6.00, 'img/postres/tartaQueso.png'),
(2, 'Brownie', 'Un postre de chocolate denso y rico, a menudo servido con helado[^1^][5][5].', 5.50, 'img/postres/brownie.png'),
(3, 'Flan', 'Un dulce hecho con huevos, leche y caramelo[^2^][4][4].', 4.50, 'img/postres/flan.png'),
(6, 'Churros', 'Un postre tradicional en toda España, normalmente se sirven con chocolate caliente o café con leche[^4^][1][1].', 4.00, 'img/postres/churros.png'),
(8, 'Torrijas de leche', 'Uno de los postres más tradicionales en España, hecho con pan de días anteriores[^4^][1][1].', 6.50, 'img/postres/torrijas.png');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aperitivos`
--
ALTER TABLE `aperitivos`
  ADD PRIMARY KEY (`id_aperitivo`);

--
-- Indices de la tabla `bebidas`
--
ALTER TABLE `bebidas`
  ADD PRIMARY KEY (`id_bebida`);

--
-- Indices de la tabla `bocadillos`
--
ALTER TABLE `bocadillos`
  ADD PRIMARY KEY (`id_bocadillo`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ID_Cliente`);

--
-- Indices de la tabla `cocineros`
--
ALTER TABLE `cocineros`
  ADD PRIMARY KEY (`id_cocinero`);

--
-- Indices de la tabla `comidas`
--
ALTER TABLE `comidas`
  ADD PRIMARY KEY (`id_comida`);

--
-- Indices de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `ID_Pedido` (`id_pedido`),
  ADD KEY `ID_Bebida` (`id_bebida`),
  ADD KEY `ID_Comida` (`id_comida`),
  ADD KEY `ID_Postre` (`id_postre`),
  ADD KEY `ID_Aperitivo` (`id_aperitivo`),
  ADD KEY `ID_Bocadillo` (`id_bocadillo`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`);

--
-- Indices de la tabla `postres`
--
ALTER TABLE `postres`
  ADD PRIMARY KEY (`id_postre`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aperitivos`
--
ALTER TABLE `aperitivos`
  MODIFY `id_aperitivo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `bebidas`
--
ALTER TABLE `bebidas`
  MODIFY `id_bebida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `ID_Cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cocineros`
--
ALTER TABLE `cocineros`
  MODIFY `id_cocinero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `comidas`
--
ALTER TABLE `comidas`
  MODIFY `id_comida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD CONSTRAINT `FK_DetallePedido_Aperitivo` FOREIGN KEY (`id_aperitivo`) REFERENCES `aperitivos` (`id_aperitivo`),
  ADD CONSTRAINT `FK_DetallePedido_Bebida` FOREIGN KEY (`id_bebida`) REFERENCES `bebidas` (`id_bebida`),
  ADD CONSTRAINT `FK_DetallePedido_Bocadillo` FOREIGN KEY (`id_bocadillo`) REFERENCES `bocadillos` (`id_bocadillo`),
  ADD CONSTRAINT `FK_DetallePedido_Comida` FOREIGN KEY (`id_comida`) REFERENCES `comidas` (`id_comida`),
  ADD CONSTRAINT `FK_DetallePedido_Pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`),
  ADD CONSTRAINT `FK_DetallePedido_Postre` FOREIGN KEY (`id_postre`) REFERENCES `postres` (`id_postre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
