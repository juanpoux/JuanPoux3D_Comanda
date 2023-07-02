-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-07-2023 a las 15:41:16
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
(1, -1, 'GET - /mesas/listarMesas', 200, '2023-07-01 18:06:15', 'ok'),
(2, -1, 'GET - /mesas/listarMesas', 200, '2023-07-01 18:08:06', 'ok'),
(3, -1, 'GET - /mesas/listarMesas', 200, '2023-07-01 18:08:13', 'ok'),
(4, -1, 'GET - /mesas/listarMesas', 200, '2023-07-01 18:09:34', 'ok'),
(5, -1, 'GET - /mesas/listarMesas', 200, '2023-07-01 18:10:18', 'ok'),
(6, -1, 'GET - /mesas/listarMesas', 200, '2023-07-01 18:10:37', 'ok'),
(7, -1, 'GET - /mesas/listarMesas', 401, '2023-07-01 18:12:54', 'ok'),
(8, -1, 'GET - /mesas/listarMesas', 200, '2023-07-01 18:13:36', 'ok'),
(9, -1, 'GET - /mesas/listarMesas', 401, '2023-07-01 18:19:55', 'ok'),
(10, -1, 'POST - /login', 200, '2023-07-01 18:26:49', 'ok'),
(11, -1, 'Login', 401, '2023-07-01 18:27:23', '\"Contrase\\u00f1a incorrecta\" - carlitox'),
(12, -1, 'POST - /login', 200, '2023-07-01 18:27:23', 'ok'),
(13, -1, 'POST - /login', 401, '2023-07-01 18:32:26', '\"Contrase\\u00f1a incorrecta\" - carlitox'),
(14, -1, 'POST - /login', 401, '2023-07-01 18:32:30', '\"Contrase\\u00f1a incorrecta\" - carlitox'),
(15, -1, 'POST - /login', 401, '2023-07-01 18:32:30', '\"Contrase\\u00f1a incorrecta\" - carlitox'),
(16, -1, 'POST - /login', 401, '2023-07-01 18:32:31', '\"Contrase\\u00f1a incorrecta\" - carlitox'),
(17, -1, 'POST - /login', 401, '2023-07-01 18:33:21', '\"Contrase\\u00f1a incorrecta\" - juanchopo'),
(18, 2, 'POST - /login', 200, '2023-07-01 18:34:14', '{\"OK\":\"Usuario de rol \'mozo\' inici\\u00f3 sesi\\u00f3n con \\u00e9xito\"} - juanchopo'),
(19, 2, 'POST - /login', 200, '2023-07-01 18:37:17', 'ok'),
(20, -1, 'POST - /login', 401, '2023-07-01 18:37:22', '\"Contrase\\u00f1a incorrecta\" - juanchopo'),
(21, -1, 'POST - /login', 401, '2023-07-01 18:38:34', '\"Contrase\\u00f1a incorrecta\" - juanchopo'),
(22, -1, 'POST - /login', 401, '2023-07-01 18:40:43', 'Contraseña incorrecta - juanchopo'),
(23, 2, 'POST - /login', 200, '2023-07-01 18:40:49', 'ok - juanchopo'),
(24, 2, 'POST - /login', 200, '2023-07-01 18:41:19', 'ok'),
(25, -1, 'POST - /login', 401, '2023-07-01 18:41:40', 'Contraseña incorrecta - Usuario ingresado: juanchopo'),
(26, 2, 'GET - /usuarios', 200, '2023-07-01 18:51:03', 'ok'),
(27, 2, 'GET - /usuarios', 200, '2023-07-01 18:51:13', 'ok'),
(28, 2, 'GET - /usuarios', 200, '2023-07-01 18:51:32', 'ok'),
(29, 2, 'GET - /usuarios', 200, '2023-07-01 18:51:43', 'ok'),
(30, 2, 'GET - /usuarios/activos', 200, '2023-07-01 18:54:47', 'ok'),
(31, 2, 'GET - /usuarios/activos', 200, '2023-07-01 18:55:29', 'ok'),
(32, 2, 'GET - /usuarios/activos', 200, '2023-07-01 18:55:40', 'ok'),
(33, 2, 'PUT - /usuarios', 200, '2023-07-01 19:14:14', 'ok'),
(34, 2, 'PUT - /usuarios', 200, '2023-07-01 19:14:21', 'ok'),
(35, 2, 'GET - /usuarios', 200, '2023-07-01 19:14:55', 'ok'),
(36, 2, 'GET - /usuarios', 200, '2023-07-01 19:15:32', 'ok'),
(37, 2, 'PUT - /usuarios', 200, '2023-07-01 19:17:35', 'ok'),
(38, 2, 'PUT - /usuarios', 200, '2023-07-01 19:18:45', 'ok'),
(39, 2, 'PUT - /usuarios', 200, '2023-07-01 19:19:54', 'ok'),
(40, 2, 'PUT - /usuarios', 200, '2023-07-01 19:20:36', 'ok'),
(41, 2, 'DELETE - /usuarios', 200, '2023-07-01 19:23:19', 'ok'),
(42, 2, 'DELETE - /usuarios', 200, '2023-07-01 19:23:57', 'ok'),
(43, 2, 'DELETE - /usuarios', 200, '2023-07-01 19:24:15', 'ok'),
(44, 2, 'DELETE - /usuarios', 200, '2023-07-01 19:24:35', 'ok'),
(45, 2, 'DELETE - /usuarios', 200, '2023-07-01 19:24:46', 'ok'),
(46, 2, 'DELETE - /usuarios/9', 200, '2023-07-01 19:25:21', 'ok'),
(47, 2, 'DELETE - /usuarios/9', 200, '2023-07-01 19:25:49', 'ok'),
(48, 2, 'DELETE - /usuarios/9', 401, '2023-07-01 19:27:34', 'ok'),
(49, -1, 'POST - /login', 401, '2023-07-01 19:27:40', 'Contraseña incorrecta - Usuario ingresado: carlitox'),
(50, -1, 'POST - /login', 401, '2023-07-01 19:27:47', 'Contraseña incorrecta - Usuario ingresado: carlitox'),
(51, -1, 'POST - /login', 401, '2023-07-01 19:27:57', 'Contraseña incorrecta - Usuario ingresado: carlitox'),
(52, 2, 'POST - /login', 200, '2023-07-01 19:27:59', 'ok'),
(53, -1, 'POST - /login', 401, '2023-07-01 19:28:14', 'Contraseña incorrecta - Usuario ingresado: carlitox'),
(54, 1, 'POST - /login', 200, '2023-07-01 19:28:36', 'ok'),
(55, 1, 'POST - /usuarios', 200, '2023-07-01 19:29:40', 'ok'),
(56, 10, 'POST - /login', 200, '2023-07-01 19:30:04', 'ok'),
(57, -1, 'POST - /login', 401, '2023-07-01 19:30:07', 'Contraseña incorrecta - Usuario ingresado: carlitox'),
(58, 10, 'PUT - /usuarios', 200, '2023-07-01 19:32:26', 'ok'),
(59, 10, 'PUT - /usuarios', 200, '2023-07-01 19:32:31', 'ok'),
(60, 10, 'PUT - /usuarios', 200, '2023-07-01 19:33:01', 'ok'),
(61, 10, 'PUT - /usuarios', 200, '2023-07-01 19:33:45', 'ok'),
(62, 10, 'PUT - /usuarios', 200, '2023-07-01 19:34:53', 'ok'),
(63, 10, 'PUT - /usuarios', 200, '2023-07-01 19:35:04', 'ok'),
(64, -1, 'POST - /login', 401, '2023-07-01 19:35:13', 'Contraseña incorrecta - Usuario ingresado: carlitox'),
(65, -1, 'POST - /login', 401, '2023-07-01 19:35:55', 'Contraseña incorrecta - Usuario ingresado: carlitox'),
(66, -1, 'POST - /login', 401, '2023-07-01 19:36:01', 'Contraseña incorrecta - Usuario ingresado: carlitox'),
(67, 10, 'PUT - /usuarios', 200, '2023-07-01 19:36:31', 'ok'),
(68, 1, 'POST - /login', 200, '2023-07-01 19:36:36', 'ok'),
(69, 1, 'PUT - /usuarios', 200, '2023-07-01 19:36:51', 'ok'),
(70, 1, 'GET - /descargas/descargarLogo', 200, '2023-07-01 20:04:20', 'ok'),
(71, 1, 'GET - /descargas/descargarLogo', 200, '2023-07-01 20:12:36', 'ok'),
(72, 1, 'GET - /descargas/descargarLogo', 200, '2023-07-01 20:15:06', 'ok'),
(73, 1, 'GET - /descargas/descargarLogo', 200, '2023-07-01 20:16:22', 'ok'),
(74, 1, 'GET - /descargas/descargarLogo', 200, '2023-07-01 20:17:41', 'ok'),
(75, 1, 'GET - /descargas/descargarLogo', 200, '2023-07-01 20:19:19', 'ok'),
(76, 1, 'GET - /descargas/descargarLogo', 200, '2023-07-01 20:20:30', 'ok'),
(77, 1, 'GET - /descargas/descargarLogo', 200, '2023-07-01 20:21:47', 'ok'),
(78, 1, 'GET - /descargas/descargarLogo', 401, '2023-07-01 20:22:54', 'ok'),
(79, 1, 'GET - /descargas/descargarLogo', 401, '2023-07-01 20:23:23', 'ok'),
(80, 1, 'GET - /descargas/descargarLogo', 401, '2023-07-01 20:24:06', 'ok'),
(81, 1, 'GET - /descargas/descargarLogo', 200, '2023-07-01 20:25:08', 'ok'),
(82, 1, 'GET - /descargas/descargarLogo', 200, '2023-07-01 20:25:36', 'ok'),
(83, 1, 'GET - /descargas/descargarLogo', 200, '2023-07-01 20:25:56', 'ok');

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
(1, 'Carlos', 'carlitox', '$2y$10$GayMCMXKcedUkMEBgnqTL.6F4Ex8PR.jTKxQb9Rz4mrcDC/dSJNQC', 'socio', '2023-06-25 15:58:42', 'activo', NULL),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

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
