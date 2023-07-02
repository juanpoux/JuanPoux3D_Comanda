-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-07-2023 a las 01:06:40
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
(0, '4as55', 'k1HXV', 7, 8, 9, 9, 'Muy rico todo!');

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
(1, 2, 'POST - /login', 200, '2023-07-02 18:36:37', 'ok'),
(2, 2, 'POST - /mesas', 200, '2023-07-02 18:36:40', 'ok'),
(3, 2, 'POST - /pedidos', 200, '2023-07-02 18:36:44', 'ok'),
(4, 2, 'POST - /pedidos/cargarPedido/k1HXV', 200, '2023-07-02 18:36:54', 'ok'),
(5, 2, 'POST - /pedidos/cargarPedido/k1HXV', 200, '2023-07-02 18:40:05', 'ok'),
(6, 2, 'POST - /pedidos/cargarPedido/k1HXV', 200, '2023-07-02 18:41:00', 'ok'),
(7, 2, 'POST - /pedidos/cargarPedido/k1HXV', 200, '2023-07-02 18:42:37', 'ok'),
(8, 2, 'POST - /pedidos/cargarPedido/k1HXV', 200, '2023-07-02 18:43:40', 'ok'),
(9, 2, 'POST - /pedidos/cargarPedido/k1HXV', 200, '2023-07-02 18:44:36', 'ok'),
(10, 2, 'POST - /pedidos/cargarPedido/k1HXV', 200, '2023-07-02 18:44:49', 'ok'),
(11, 2, 'POST - /pedidos/cargarPedido/4as55', 200, '2023-07-02 18:44:59', 'ok'),
(12, 2, 'POST - /pedidos/cargarPedido/k1HXV', 200, '2023-07-02 18:45:17', 'ok'),
(13, 2, 'POST - /pedidos/cargarPedido/k1HXV', 200, '2023-07-02 18:46:14', 'ok'),
(14, 2, 'POST - /pedidos/cargarPedido/k1HXV', 200, '2023-07-02 18:46:30', 'ok'),
(15, 2, 'POST - /pedidos/cargarPedido/k1HXV', 200, '2023-07-02 18:47:01', 'ok'),
(16, 2, 'POST - /pedidos/cargarPedido/k1HXV', 200, '2023-07-02 18:47:08', 'ok'),
(17, 2, 'POST - /pedidos/cargarPedido/k1HXV', 200, '2023-07-02 18:47:46', 'ok'),
(18, 2, 'POST - /pedidos/cargarPedido/k1HXV', 200, '2023-07-02 18:47:51', 'ok'),
(19, 2, 'POST - /pedidos/subirFoto/k1HXV', 200, '2023-07-02 18:48:51', 'ok'),
(20, 3, 'POST - /login', 200, '2023-07-02 18:49:20', 'ok'),
(21, 5, 'POST - /login', 200, '2023-07-02 18:50:19', 'ok'),
(22, 5, 'PUT - /pedidos/cambiarEstadoProducto', 200, '2023-07-02 18:50:27', 'ok'),
(23, 5, 'PUT - /pedidos/cambiarEstadoProducto', 200, '2023-07-02 18:51:06', 'ok'),
(24, 5, 'PUT - /pedidos/cambiarEstadoProducto', 200, '2023-07-02 18:57:52', 'ok'),
(25, 5, 'PUT - /pedidos/cambiarEstadoProducto', 200, '2023-07-02 18:58:12', 'ok'),
(26, 5, 'PUT - /pedidos/cambiarEstadoProducto', 200, '2023-07-02 18:58:26', 'ok'),
(27, 5, 'PUT - /pedidos/cambiarEstadoProducto', 200, '2023-07-02 18:58:31', 'ok'),
(28, 5, 'PUT - /pedidos/cambiarEstadoProducto', 200, '2023-07-02 18:59:07', 'ok'),
(29, 3, 'POST - /login', 200, '2023-07-02 18:59:12', 'ok'),
(30, 3, 'GET - /pedidos/traerProductosPedidos/pendiente', 200, '2023-07-02 18:59:17', 'ok'),
(31, 3, 'PUT - /pedidos/cambiarEstadoProducto', 200, '2023-07-02 18:59:23', 'ok'),
(32, 3, 'GET - /pedidos/traerProductosPedidos/pendiente', 200, '2023-07-02 18:59:26', 'ok'),
(33, 3, 'GET - /clientes/mostrarDemora/k1HXV/4as55', 200, '2023-07-02 19:01:10', 'ok'),
(34, 3, 'GET - /pedidos/pedidosConDemora', 401, '2023-07-02 19:14:35', 'ok'),
(35, 1, 'POST - /login', 200, '2023-07-02 19:14:39', 'ok'),
(36, 1, 'POST - /login', 200, '2023-07-02 19:14:43', 'ok'),
(37, 1, 'GET - /pedidos/pedidosConDemora', 200, '2023-07-02 19:14:48', 'ok'),
(38, 1, 'GET - /clientes/mostrarDemora/k1HXV/4as55', 200, '2023-07-02 19:22:41', 'ok'),
(39, 1, 'GET - /pedidos/pedidosConDemora', 200, '2023-07-02 19:22:47', 'ok'),
(40, 3, 'POST - /login', 200, '2023-07-02 19:23:38', 'ok'),
(41, 3, 'GET - /pedidos/traerProductosPedidos/pendiente', 200, '2023-07-02 19:23:44', 'ok'),
(42, 3, 'POST - /login', 200, '2023-07-02 19:23:48', 'ok'),
(43, 3, 'GET - /pedidos/traerProductosPedidos/pendiente', 200, '2023-07-02 19:23:50', 'ok'),
(44, 5, 'POST - /login', 200, '2023-07-02 19:23:53', 'ok'),
(45, 5, 'GET - /pedidos/traerProductosPedidos/pendiente', 200, '2023-07-02 19:23:57', 'ok'),
(46, 5, 'GET - /pedidos/traerProductosPedidos/pendiente', 200, '2023-07-02 19:25:11', 'ok'),
(47, 5, 'GET - /pedidos/traerProductosPedidos/en%20preparacion', 200, '2023-07-02 19:26:19', 'ok'),
(48, 5, 'GET - /pedidos/traerProductosPedidos/en%20preparacion', 200, '2023-07-02 19:27:05', 'ok'),
(49, 5, 'GET - /pedidos/traerProductosPedidos/en%20preparacion', 200, '2023-07-02 19:27:19', 'ok'),
(50, 5, 'PUT - /pedidos/cambiarEstadoProducto', 200, '2023-07-02 19:27:35', 'ok'),
(51, 3, 'POST - /login', 200, '2023-07-02 19:27:42', 'ok'),
(52, 3, 'PUT - /pedidos/cambiarEstadoProducto', 200, '2023-07-02 19:27:46', 'ok'),
(53, 4, 'POST - /login', 200, '2023-07-02 19:28:54', 'ok'),
(54, 4, 'PUT - /pedidos/cambiarEstadoProducto', 200, '2023-07-02 19:29:04', 'ok'),
(55, 4, 'PUT - /pedidos/cambiarEstadoProducto', 200, '2023-07-02 19:29:20', 'ok'),
(56, 3, 'POST - /login', 200, '2023-07-02 19:29:56', 'ok'),
(57, 3, 'PUT - /pedidos/cambiarEstadoProducto', 200, '2023-07-02 19:30:01', 'ok'),
(58, 3, 'PUT - /pedidos/cambiarEstadoProducto', 200, '2023-07-02 19:30:07', 'ok'),
(59, 3, 'PUT - /pedidos/cambiarEstadoProducto', 200, '2023-07-02 19:30:11', 'ok'),
(60, 3, 'PUT - /pedidos/cambiarEstadoProducto', 200, '2023-07-02 19:30:15', 'ok'),
(61, 5, 'POST - /login', 200, '2023-07-02 19:30:42', 'ok'),
(62, 5, 'PUT - /pedidos/cambiarEstadoProducto', 200, '2023-07-02 19:30:49', 'ok'),
(63, 4, 'POST - /login', 200, '2023-07-02 19:30:54', 'ok'),
(64, 4, 'PUT - /pedidos/cambiarEstadoProducto', 200, '2023-07-02 19:31:13', 'ok'),
(65, 4, 'PUT - /pedidos/cambiarEstadoProducto', 200, '2023-07-02 19:31:28', 'ok'),
(66, 4, 'PUT - /pedidos/cambiarEstadoProducto', 200, '2023-07-02 19:31:43', 'ok'),
(67, 5, 'POST - /login', 200, '2023-07-02 19:31:47', 'ok'),
(68, 5, 'PUT - /pedidos/cambiarEstadoProducto', 200, '2023-07-02 19:31:50', 'ok'),
(69, 5, 'PUT - /pedidos/cambiarEstadoProducto', 200, '2023-07-02 19:31:55', 'ok'),
(70, 5, 'PUT - /pedidos/cambiarEstadoProducto', 200, '2023-07-02 19:31:59', 'ok'),
(71, 3, 'POST - /login', 200, '2023-07-02 19:32:03', 'ok'),
(72, 3, 'PUT - /pedidos/cambiarEstadoProducto', 200, '2023-07-02 19:32:05', 'ok'),
(73, 2, 'POST - /login', 200, '2023-07-02 19:32:46', 'ok'),
(74, 2, 'GET - /pedidos/traerPedidosListos', 200, '2023-07-02 19:32:50', 'ok'),
(75, 2, 'GET - /pedidos/traerPedidosListos', 200, '2023-07-02 19:33:10', 'ok'),
(76, 2, 'POST - /login', 200, '2023-07-02 19:33:20', 'ok'),
(77, 2, 'GET - /pedidos/traerPedidosListos', 200, '2023-07-02 19:33:22', 'ok'),
(78, 2, 'PUT - /pedidos/cambiarEstadoProducto', 200, '2023-07-02 19:47:03', 'ok'),
(79, 3, 'POST - /login', 200, '2023-07-02 19:47:56', 'ok'),
(80, 3, 'PUT - /pedidos/cambiarEstadoProducto', 200, '2023-07-02 19:47:59', 'ok'),
(81, 3, 'PUT - /pedidos/cambiarEstadoProducto', 200, '2023-07-02 19:48:07', 'ok'),
(82, 3, 'PUT - /pedidos/cambiarEstadoProducto', 200, '2023-07-02 19:48:18', 'ok'),
(83, 3, 'PUT - /pedidos/cambiarEstadoProducto', 200, '2023-07-02 19:48:32', 'ok'),
(84, 3, 'PUT - /pedidos/cambiarEstadoProducto', 200, '2023-07-02 19:51:20', 'ok'),
(85, 3, 'PUT - /pedidos/cambiarEstadoProducto', 200, '2023-07-02 19:51:23', 'ok'),
(86, 3, 'PUT - /pedidos/cambiarEstadoProducto', 200, '2023-07-02 19:52:44', 'ok'),
(87, 3, 'PUT - /pedidos/cambiarEstadoProducto', 200, '2023-07-02 19:52:47', 'ok'),
(88, 3, 'PUT - /pedidos/cambiarEstadoProducto', 200, '2023-07-02 19:53:09', 'ok'),
(89, 3, 'PUT - /pedidos/cambiarEstadoProducto', 200, '2023-07-02 19:53:12', 'ok'),
(90, 3, 'PUT - /pedidos/cambiarEstadoProducto', 200, '2023-07-02 19:54:38', 'ok'),
(91, 3, 'PUT - /pedidos/cambiarEstadoProducto', 200, '2023-07-02 19:54:52', 'ok'),
(92, 3, 'GET - /pedidos/traerPedidosListos', 401, '2023-07-02 19:55:21', 'ok'),
(93, 2, 'POST - /login', 200, '2023-07-02 19:55:24', 'ok'),
(94, 2, 'GET - /pedidos/traerPedidosListos', 200, '2023-07-02 19:55:26', 'ok'),
(95, 2, 'PUT - /pedidos/servirPedido', 401, '2023-07-02 19:55:45', 'ok'),
(96, 2, 'PUT - /pedidos/servirPedido', 401, '2023-07-02 19:57:09', 'ok'),
(97, 2, 'PUT - /pedidos/servirPedido', 401, '2023-07-02 19:57:50', 'ok'),
(98, 2, 'PUT - /pedidos/servirPedido', 200, '2023-07-02 19:58:27', 'ok'),
(99, 1, 'POST - /login', 200, '2023-07-02 19:59:03', 'ok'),
(100, 1, 'GET - /mesas/listarMesas', 200, '2023-07-02 19:59:06', 'ok'),
(101, 2, 'POST - /login', 200, '2023-07-02 19:59:16', 'ok'),
(102, 2, 'PUT - /mesas/cambiarEstado', 200, '2023-07-02 19:59:30', 'ok'),
(103, 1, 'POST - /login', 200, '2023-07-02 19:59:40', 'ok'),
(104, 1, 'PUT - /mesas/cerrarMesa', 200, '2023-07-02 19:59:48', 'ok'),
(105, 1, 'POST - /clientes/darOpinion', 200, '2023-07-02 20:00:12', 'ok'),
(106, 1, 'POST - /login', 200, '2023-07-02 20:00:17', 'ok'),
(107, 1, 'GET - /calificaciones/mejores', 200, '2023-07-02 20:00:20', 'ok'),
(108, 1, 'POST - /login', 200, '2023-07-02 20:00:26', 'ok'),
(109, 1, 'GET - /mesas/masUsada', 200, '2023-07-02 20:00:29', 'ok'),
(110, 1, 'PUT - /mesas/cerrarMesa', 200, '2023-07-02 20:00:57', 'ok'),
(111, 1, 'PUT - /mesas/cerrarMesa', 200, '2023-07-02 20:01:51', 'ok'),
(112, 1, 'PUT - /mesas/cerrarMesa', 200, '2023-07-02 20:02:15', 'ok'),
(113, 1, 'PUT - /mesas/cerrarMesa', 200, '2023-07-02 20:02:46', 'ok'),
(114, 1, 'GET - /usuarios/descargarCSV', 200, '2023-07-02 20:04:06', 'ok'),
(115, 1, 'POST - /cargaForzadaCSV/usuarios', 200, '2023-07-02 20:04:29', 'ok'),
(116, 1, 'POST - /cargaForzadaCSV/usuarios', 200, '2023-07-02 20:04:47', 'ok');

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
(1, 'cerrada', '4as55', '2023-07-02');

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
('k1HXV', 4, 1, '2023-07-02 18:58:12', '2023-07-02 19:08:12', 'entregado'),
('k1HXV', 5, 2, '2023-07-02 18:58:26', '2023-07-02 19:08:26', 'entregado'),
('k1HXV', 6, 1, '2023-07-02 19:31:13', '2023-07-02 19:41:13', 'entregado'),
('k1HXV', 2, 1, '2023-07-02 19:54:38', '2023-07-02 20:04:38', 'entregado');

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
(1, '4as55', 'k1HXV', 2, 'finalizado', '2023-07-02 18:36:44', '2023-07-02 20:02:15');

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
(6, 1100, 'bebida', 'Corona', 'cervecero');

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
(10, 'Juan Poux', 'juan', '$2y$10$dVbwMFmH1Ko3UX6v3CGkeOtcMVgh/k8opNPx2z3LJA8zeuNA6dFrC', 'socio', '2023-07-01 19:29:40', 'activo', NULL),
(11, 'Federico', 'fefe', '$2y$10$II.QMJ333/L.ZFCQlZyeaONHzhctsUKNAoJQIQD6B3OYwquBl/6Be', 'cocinero', '2023-07-02 20:04:47', 'activo', NULL);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT de la tabla `mesas`
--
ALTER TABLE `mesas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
