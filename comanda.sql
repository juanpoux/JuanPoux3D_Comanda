-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-07-2023 a las 17:47:27
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

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
-- Estructura de tabla para la tabla `calificaciones`
--

CREATE TABLE `calificaciones` (
  `id` int(11) NOT NULL,
  `codigoMesa` varchar(5) NOT NULL,
  `codigoPedido` varchar(5) NOT NULL,
  `notaMesa` int(11) NOT NULL,
  `notaRestaurante` int(11) NOT NULL,
  `notaCocinero` int(11) NOT NULL,
  `notaMozo` int(11) NOT NULL,
  `comentario` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `calificaciones`
--

INSERT INTO `calificaciones` (`id`, `codigoMesa`, `codigoPedido`, `notaMesa`, `notaRestaurante`, `notaCocinero`, `notaMozo`, `comentario`) VALUES
(0, '5rew5', '44rr4', 7, 8, 9, 9, 'Muy rico todo!');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `accion` varchar(250) NOT NULL,
  `status` int(11) NOT NULL,
  `fecha_accion` datetime NOT NULL,
  `info` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `log`
--

INSERT INTO `log` (`id`, `id_usuario`, `accion`, `status`, `fecha_accion`, `info`) VALUES
(1, -1, 'GET - /usuarios', 401, '2023-07-02 11:12:34', 'ok'),
(2, 2, 'POST - /login', 200, '2023-07-02 11:12:40', 'ok'),
(3, 2, 'GET - /usuarios', 200, '2023-07-02 11:12:43', 'ok'),
(4, 2, 'GET - /descargas/descargarLogo', 200, '2023-07-02 11:13:26', 'ok'),
(5, 2, 'POST - /clientes/darOpinion', 200, '2023-07-02 11:46:50', 'ok'),
(6, 2, 'POST - /clientes/darOpinion', 200, '2023-07-02 11:47:54', 'ok'),
(7, 2, 'POST - /clientes/darOpinion', 401, '2023-07-02 11:48:38', 'ok'),
(8, 2, 'POST - /clientes/darOpinion', 401, '2023-07-02 11:49:41', 'ok'),
(9, 2, 'POST - /clientes/darOpinion', 401, '2023-07-02 11:50:03', 'ok'),
(10, 2, 'POST - /clientes/darOpinion', 401, '2023-07-02 11:52:12', 'ok'),
(11, 2, 'POST - /clientes/darOpinion', 200, '2023-07-02 11:53:01', 'ok'),
(12, 2, 'POST - /clientes/darOpinion', 401, '2023-07-02 11:57:32', 'ok'),
(13, 2, 'POST - /clientes/darOpinion', 401, '2023-07-02 11:58:04', 'ok'),
(14, 2, 'POST - /clientes/darOpinion', 200, '2023-07-02 11:58:21', 'ok'),
(15, 2, 'POST - /clientes/darOpinion', 401, '2023-07-02 12:07:20', 'ok'),
(16, 2, 'POST - /clientes/darOpinion', 200, '2023-07-02 12:07:40', 'ok'),
(17, -1, 'POST - /login', 401, '2023-07-02 12:10:22', 'Contraseña incorrecta - Usuario ingresado: carlitox'),
(18, 2, 'PUT - /usuarios', 401, '2023-07-02 12:10:57', 'ok'),
(19, 10, 'POST - /login', 200, '2023-07-02 12:11:02', 'ok'),
(20, 10, 'PUT - /usuarios', 200, '2023-07-02 12:11:04', 'ok'),
(21, 1, 'POST - /login', 200, '2023-07-02 12:11:08', 'ok'),
(22, 1, 'POST - /clientes/darOpinion', 200, '2023-07-02 12:11:11', 'ok'),
(23, 1, 'GET - /calificaciones/mejores', 200, '2023-07-02 12:12:12', 'ok'),
(24, 1, 'GET - /calificaciones/mejores', 200, '2023-07-02 12:12:26', 'ok'),
(25, 1, 'GET - /calificaciones/mejores', 200, '2023-07-02 12:12:58', 'ok'),
(26, 1, 'GET - /calificaciones/mejores', 200, '2023-07-02 12:13:23', 'ok'),
(27, 1, 'GET - /calificaciones/mejores', 200, '2023-07-02 12:13:33', 'ok'),
(28, 1, 'GET - /calificaciones/mejores', 401, '2023-07-02 12:28:39', 'ok'),
(29, 1, 'GET - /calificaciones/mejores', 200, '2023-07-02 12:29:17', 'ok'),
(30, 1, 'GET - /calificaciones/mejores', 200, '2023-07-02 12:31:25', 'ok'),
(31, 1, 'GET - /calificaciones/mejores', 200, '2023-07-02 12:31:28', 'ok'),
(32, 1, 'GET - /mesas/masUsada', 200, '2023-07-02 12:35:11', 'ok');

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
(1, 'cerrada', '5rew5', '2023-06-25');

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
(1, '5rew5', '44rr4', 2, 'finalizado', '2023-06-25 21:35:51', '2023-06-29 20:53:30'),
(2, '5rew5', '44eee', 2, 'finalizado', '2023-06-26 00:05:59', '2023-06-29 20:56:49'),
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
  `fechaInicio` datetime DEFAULT NULL,
  `estado` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fechaBaja` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `usuario`, `clave`, `rol`, `fechaInicio`, `estado`, `fechaBaja`) VALUES
(1, 'Carlos', 'carlitox', '$2y$10$7MnI4m1SuCxEtyvd91vEb.lQAHOvIYX5CTQ0esTvbT/y4a.7qzNcq', 'socio', '2023-06-25 15:58:42', 'activo', NULL),
(2, 'Juan', 'juanchopo', '$2y$10$564AOvjpNjR3tUP3JLRinO8VKrSbe7v98j0vXPFW2fzBAUparh1PO', 'mozo', '2023-06-25 15:58:42', 'activo', NULL),
(3, 'Camila', 'camila', '$2y$10$gNkxLdblmWzhH0124qAqOe0TcEDSfQiI56Ygwsv2tVkbHSoMiOqEG', 'bartender', '2023-06-25 15:58:42', 'activo', NULL),
(4, 'Pedro', 'pedritox', '$2y$10$f6m2V.A9AME0Jw3vJeH8cev1NUBJUrBe8/kr58psnblahsx7jv9oq', 'cervecero', '2023-06-25 15:58:42', 'activo', NULL),
(5, 'Francisco', 'pancho', '$2y$10$geNAObttETOhYUAY.5E8Du3jE9g1qbvJB.PYQFHbY7gKRFTIVNUQa', 'cocinero', '2023-06-25 15:58:42', 'activo', NULL),
(9, 'Federico', 'fefe', '$2y$10$8j1P8wnjpk089xvW8a.w9uJmXlK2Vk/83bGNhprA8OURvWNhOEBcO', 'cocinero', '2023-06-26 11:11:09', 'activo', NULL),
(10, 'Juan Poux', 'juan', '$2y$10$dVbwMFmH1Ko3UX6v3CGkeOtcMVgh/k8opNPx2z3LJA8zeuNA6dFrC', 'socio', '2023-07-01 19:29:40', 'activo', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT de la tabla `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
