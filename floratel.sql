-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 13-12-2024 a las 03:13:02
-- Versión del servidor: 9.1.0
-- Versión de PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `floratel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedidos`
--

DROP TABLE IF EXISTS `detalle_pedidos`;
CREATE TABLE IF NOT EXISTS `detalle_pedidos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pedido_id` int DEFAULT NULL,
  `producto_id` int DEFAULT NULL,
  `cantidad` int NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pedido_id` (`pedido_id`),
  KEY `producto_id` (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE IF NOT EXISTS `pedidos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `telefono` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `direccion` text COLLATE utf8mb4_general_ci NOT NULL,
  `productos` text COLLATE utf8mb4_general_ci NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `fecha_pedido` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_general_ci,
  `categoria` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `precio`, `imagen`, `descripcion`, `categoria`, `estado`) VALUES
(1, 'Rosa', 90.00, 'imagenes/rosas.jpg', 'Detalles sobre las rosas', 'principal', 1),
(2, 'Lirio', 65.00, 'imagenes/lirios.png', 'Detalles sobre los lirios', 'principal', 1),
(3, 'Orquídea', 75.00, 'imagenes/orquideas.jpg', 'Detalles sobre las orquídeas', 'principal', 1),
(4, 'Tulipán', 105.00, 'imagenes/tulipanes.jpg', 'Detalles sobre los tulipanes', 'principal', 1),
(5, 'Arreglo 1', 60.00, 'imagenes/amor_amistad_1.webp', NULL, 'amor_amistad', 1),
(6, 'Arreglo 2', 90.00, 'imagenes/amor_amistad_2.webp', NULL, 'amor_amistad', 1),
(7, 'Arreglo 3', 110.00, 'imagenes/amor_amistad_3.webp', NULL, 'amor_amistad', 1),
(10, 'Arreglo 4', 105.00, 'imagenes/amor_amistad_4.webp', NULL, 'amor_amistad', 1),
(11, 'Arreglo 1', 60.00, 'imagenes/madre_1.webp', NULL, 'para_mama', 1),
(12, 'Arreglo 2', 80.00, 'imagenes/madre_2.webp', NULL, 'para_mama', 1),
(13, 'Arreglo 3', 120.00, 'imagenes/madre_3.webp', NULL, 'para_mama', 1),
(14, 'Arreglo 4', 105.00, 'imagenes/amor_amistad_4.webp', NULL, 'para_mama', 1),
(15, 'Arreglo 1', 120.00, 'imagenes/nacimiento_1.webp', NULL, 'nacimiento', 1),
(16, 'Arreglo 2', 95.00, 'imagenes/nacimiento_2.webp', NULL, 'nacimiento', 1),
(17, 'Arreglo 3', 100.00, 'imagenes/nacimiento_3.webp', NULL, 'nacimiento', 1),
(18, 'Arreglo 4', 75.00, 'imagenes/nacimiento_4.webp', NULL, 'nacimiento', 1),
(19, 'Arreglo 1', 120.00, 'imagenes/para_el_1.webp', NULL, 'para_el', 1),
(20, 'Arreglo 2', 90.00, 'imagenes/para_el_2.webp', NULL, 'para_el', 1),
(21, 'Arreglo 3', 150.00, 'imagenes/para_el_3.webp', NULL, 'para_el', 1),
(22, 'Arreglo 4', 145.00, 'imagenes/para_el_4.webp', NULL, 'para_el', 1),
(23, 'Ramo de margaritas', 95.00, 'imagenes/matrimonio_1.jpg', NULL, 'matrimonio', 1),
(24, 'Centro de mesa', 145.00, 'imagenes/matrimonio_2.jpg', NULL, 'matrimonio', 1),
(25, 'Ramo 1', 125.00, 'imagenes/matrimonio_3.jpg', NULL, 'matrimonio', 1),
(26, 'Ramo 2', 120.00, 'imagenes/matrimonio_4.jpg', NULL, 'matrimonio', 1),
(27, 'Ramo de girasol', 30.00, 'imagenes/girazoles_1.jpg', NULL, 'cumpleaños', 1),
(28, 'Ramos de rosas blancas', 45.00, 'imagenes/graduacion_3.webp', NULL, 'cumpleaños', 1),
(29, 'Areglo de rosas', 90.00, 'imagenes/madre_3.webp', NULL, 'cumpleaños', 1),
(30, 'Caja de rosas', 65.00, 'imagenes/amor_amistad_4.webp', NULL, 'cumpleaños', 1),
(31, 'Caja con 12 rosas', 45.00, 'imagenes/ramo_12.jpg', NULL, 'cumpleaños', 1),
(32, 'Modelo Alistong', 85.00, 'imagenes/tulipanesc.jpg', NULL, 'cumpleaños', 1),
(33, 'Modelo Norka', 95.00, 'imagenes/modelomorkac.jpg', NULL, 'cumpleaños', 1),
(34, 'Florero 12 tulipanes', 65.00, 'imagenes/caja_12T.jpg', NULL, 'cumpleaños', 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD CONSTRAINT `detalle_pedidos_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`),
  ADD CONSTRAINT `detalle_pedidos_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
