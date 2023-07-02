-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-06-2023 a las 23:41:58
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `comanda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesas`
--

CREATE TABLE `mesas` (
  `id` int(11) NOT NULL,
  `estado` varchar(100) NOT NULL,
  `codigo` varchar(5) NOT NULL,
  `fechaCreacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mesas`
--

INSERT INTO `mesas` (`id`, `estado`, `codigo`, `fechaCreacion`) VALUES
(1, 'con cliente comiendo', '5rew5', '2023-06-25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidoproducto`
--

CREATE TABLE `pedidoproducto` (
  `codigoPedido` varchar(5) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `inicio` datetime DEFAULT NULL,
  `final` datetime DEFAULT NULL,
  `estado` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidoproducto`
--

INSERT INTO `pedidoproducto` (`codigoPedido`, `idProducto`, `cantidad`, `inicio`, `final`, `estado`) VALUES
('44eee', 4, 1, '2023-06-26 13:35:44', '2023-06-26 13:45:44', 'entregado'),
('44eee', 5, 2, '2023-06-26 13:36:18', '2023-06-26 13:46:18', 'entregado'),
('44eee', 6, 1, '2023-06-26 13:36:21', '2023-06-26 13:46:21', 'entregado'),
('44eee', 2, 1, '2023-06-26 13:36:08', '2023-06-26 13:46:08', 'entregado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `codigoMesa` varchar(5) NOT NULL,
  `codigo` varchar(5) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `estado` varchar(250) NOT NULL,
  `inicio` datetime NOT NULL,
  `final` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `codigoMesa`, `codigo`, `idUsuario`, `estado`, `inicio`, `final`) VALUES
(1, '5rew5', '44rr4', 2, 'En preparacion', '2023-06-25 21:35:51', NULL),
(2, '5rew5', '44eee', 2, 'entregado', '2023-06-26 00:05:59', NULL),
(3, 'qwe22', 'Tz6lT', 2, 'En preparacion', '2023-06-26 12:38:42', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `precio` float NOT NULL,
  `tipo` varchar(150) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `rol` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `precio`, `tipo`, `nombre`, `rol`) VALUES
(1, 2000, 'comida', 'Pizza', 'cocinero'),
(2, 1500, 'bebida', 'Daikiri', 'bartender'),
(3, 1000, 'bebida', 'IPA', 'cervecero'),
(4, 2900, 'comida', 'Milanesa a caballo', 'cocinero'),
(5, 2100, 'comida', 'Hamburguesa de garbanzo', 'cocinero'),
(6, 1100, 'bebida', 'Corona', 'bebida');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `usuario` varchar(250) NOT NULL,
  `clave` varchar(250) NOT NULL,
  `rol` varchar(30) NOT NULL,
  `fechaInicio` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `usuario`, `clave`, `rol`, `fechaInicio`) VALUES
(1, 'Carlos', 'carlitox', '$2y$10$6KBzwg92Y0GYgTXvVedUHeRbNMDjMYwNZvf1kG5fUCzqmY/OWa.k6', 'socio', '2023-06-25 15:58:42'),
(2, 'Juan', 'juanchopo', '$2y$10$564AOvjpNjR3tUP3JLRinO8VKrSbe7v98j0vXPFW2fzBAUparh1PO', 'mozo', '2023-06-25 15:58:42'),
(3, 'Camila', 'camila', '$2y$10$gNkxLdblmWzhH0124qAqOe0TcEDSfQiI56Ygwsv2tVkbHSoMiOqEG', 'bartender', '2023-06-25 15:58:42'),
(4, 'Pedro', 'pedritox', '$2y$10$f6m2V.A9AME0Jw3vJeH8cev1NUBJUrBe8/kr58psnblahsx7jv9oq', 'cervecero', '2023-06-25 15:58:42'),
(5, 'Francisco', 'pancho', '$2y$10$geNAObttETOhYUAY.5E8Du3jE9g1qbvJB.PYQFHbY7gKRFTIVNUQa', 'cocinero', '2023-06-25 15:58:42'),
(9, 'Federico', 'fefe', '$2y$10$8j1P8wnjpk089xvW8a.w9uJmXlK2Vk/83bGNhprA8OURvWNhOEBcO', 'cocinero', '2023-06-26 11:11:09');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `mesas`
--
ALTER TABLE `mesas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `mesas`
--
ALTER TABLE `mesas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
