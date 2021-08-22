-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-08-2021 a las 05:15:18
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `andercode_diplomas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `td_curso_usuario`
--

CREATE TABLE `td_curso_usuario` (
  `curd_id` int(11) NOT NULL,
  `cur_id` int(11) NOT NULL,
  `usu_id` int(11) NOT NULL,
  `fech_crea` datetime NOT NULL,
  `est` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `td_curso_usuario`
--

INSERT INTO `td_curso_usuario` (`curd_id`, `cur_id`, `usu_id`, `fech_crea`, `est`) VALUES
(1, 1, 1, '2021-05-03 20:33:39', 1),
(2, 1, 2, '2021-05-03 20:33:39', 1),
(3, 2, 3, '2021-05-03 20:33:39', 1),
(4, 2, 1, '2021-05-03 20:33:39', 1),
(5, 3, 1, '2021-05-03 20:33:39', 1),
(6, 3, 5, '2021-05-03 20:33:39', 1),
(7, 3, 9, '2021-08-21 19:17:09', 0),
(8, 3, 2, '2021-08-21 19:18:04', 1),
(9, 3, 3, '2021-08-21 19:18:04', 1),
(10, 2, 4, '2021-08-21 19:20:21', 0),
(11, 2, 9, '2021-08-21 19:20:21', 0),
(12, 2, 10, '2021-08-21 19:20:21', 0),
(13, 1, 9, '2021-08-21 19:21:02', 0),
(14, 1, 10, '2021-08-21 19:21:02', 0),
(15, 1, 9, '2021-08-21 19:22:33', 0),
(16, 1, 10, '2021-08-21 19:22:33', 0),
(17, 3, 12, '2021-08-21 19:22:54', 0),
(18, 3, 12, '2021-08-21 19:23:01', 1),
(19, 19, 1, '2021-08-21 22:07:03', 1),
(20, 19, 2, '2021-08-21 22:07:03', 1),
(21, 19, 3, '2021-08-21 22:07:03', 1),
(22, 19, 4, '2021-08-21 22:07:03', 1),
(23, 19, 9, '2021-08-21 22:07:03', 1),
(24, 19, 10, '2021-08-21 22:07:03', 1),
(25, 1, 3, '2021-08-21 22:07:28', 1),
(26, 3, 11, '2021-08-21 22:07:39', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tm_categoria`
--

CREATE TABLE `tm_categoria` (
  `cat_id` int(11) NOT NULL,
  `cat_nom` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fech_crea` datetime DEFAULT NULL,
  `est` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tm_categoria`
--

INSERT INTO `tm_categoria` (`cat_id`, `cat_nom`, `fech_crea`, `est`) VALUES
(1, 'PROGRAMACIÓN', '2021-04-26 20:27:52', 1),
(2, 'MARKETING', '2021-04-26 20:27:52', 1),
(3, 'NEGOCIOS', '2021-04-26 20:27:52', 1),
(4, 'EDUCACION', '2021-04-26 20:27:52', 1),
(5, 'test categoria', '2021-08-17 20:46:37', 0),
(6, '22222', '2021-08-17 20:47:07', 0),
(7, '4444', '2021-08-17 20:53:12', 0),
(8, '5555', '2021-08-17 20:53:22', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tm_curso`
--

CREATE TABLE `tm_curso` (
  `cur_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `cur_nom` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `cur_descrip` varchar(1000) COLLATE utf8_spanish_ci NOT NULL,
  `cur_fechini` date DEFAULT NULL,
  `cur_fechfin` date DEFAULT NULL,
  `inst_id` int(11) NOT NULL,
  `cur_img` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fech_crea` datetime DEFAULT NULL,
  `est` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tm_curso`
--

INSERT INTO `tm_curso` (`cur_id`, `cat_id`, `cur_nom`, `cur_descrip`, `cur_fechini`, `cur_fechfin`, `inst_id`, `cur_img`, `fech_crea`, `est`) VALUES
(1, 1, 'CURSO DE HTML5', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2021-04-01', '2021-04-30', 1, '../../public/1.png', '2021-04-26 20:32:32', 1),
(2, 2, 'INTRODUCCION DE LOS NEGOCIOS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2021-04-01', '2021-04-30', 2, '../../public/2.png', '2021-04-26 20:32:32', 1),
(3, 2, 'PHP', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2021-04-01', '2021-04-30', 2, '../../public/3.png', '2021-04-26 20:32:32', 1),
(19, 1, 'LARAVEL y MYSQL', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2021-04-01', '2021-04-30', 1, '../../public/4.png', '2021-04-26 20:32:32', 1),
(20, 2, 'CURSO3', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2021-04-01', '2021-04-30', 2, '1.png', '2021-04-26 20:32:32', 1),
(21, 2, 'CURSO4', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2021-04-01', '2021-04-30', 2, '1.png', '2021-04-26 20:32:32', 1),
(22, 2, 'CURSO5', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2021-04-01', '2021-04-30', 2, '1.png', '2021-04-26 20:32:32', 1),
(23, 2, 'CURSO6', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2021-04-01', '2021-04-30', 2, '1.png', '2021-04-26 20:32:32', 1),
(24, 2, 'CURSO7', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2021-04-01', '2021-04-30', 2, '1.png', '2021-04-26 20:32:32', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tm_instructor`
--

CREATE TABLE `tm_instructor` (
  `inst_id` int(11) NOT NULL,
  `inst_nom` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `inst_apep` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `inst_apem` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `inst_correo` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `inst_sex` varchar(1) COLLATE utf8_spanish_ci NOT NULL,
  `inst_telf` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `fech_crea` datetime DEFAULT NULL,
  `est` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tm_instructor`
--

INSERT INTO `tm_instructor` (`inst_id`, `inst_nom`, `inst_apep`, `inst_apem`, `inst_correo`, `inst_sex`, `inst_telf`, `fech_crea`, `est`) VALUES
(1, 'RICARDO', 'PALMA', 'PALMA', 'RPALMA@TEST.COM.PE', 'M', '5555555', '2021-04-26 20:24:06', 1),
(2, 'CESAR', 'VALLEJO', 'MEDRANO', 'CVALLEJO@MEDRANO.COM.PE', 'M', '5555555', '2021-04-26 20:24:06', 1),
(3, 'asda', 'asd', 'asd', 'test@test.com', 'M', '111111', '2021-08-17 21:27:40', 0),
(4, 'ddd', 'dd', 'ddd', 'test@test.com', 'M', '111111', '2021-08-17 21:31:26', 0),
(5, 'www', 'www', 'www', 'test@test.com', 'F', '111111', '2021-08-17 21:31:32', 0),
(6, 'aaaa', 'aaa', 'aaaa', 'aaaa@www.com', 'F', '123123123123', '2021-08-17 21:32:55', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tm_usuario`
--

CREATE TABLE `tm_usuario` (
  `usu_id` int(11) NOT NULL,
  `usu_nom` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `usu_apep` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `usu_apem` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `usu_correo` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `usu_pass` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `usu_sex` varchar(1) COLLATE utf8_spanish_ci NOT NULL,
  `usu_telf` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `rol_id` int(11) NOT NULL,
  `fech_crea` datetime DEFAULT NULL,
  `est` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tm_usuario`
--

INSERT INTO `tm_usuario` (`usu_id`, `usu_nom`, `usu_apep`, `usu_apem`, `usu_correo`, `usu_pass`, `usu_sex`, `usu_telf`, `rol_id`, `fech_crea`, `est`) VALUES
(1, 'ANDERSON', 'BASTIDAS', 'VICENTE', 'DAVIS_ANDERSON_87@HOTMAIL.COM', '123456', 'M', '989898989', 1, '2021-04-26 20:14:08', 1),
(2, 'DAVIS', 'CASTILLO', 'FUJIMORI', 'FUJICASTI@HOTMAIL.COM', '123456', 'M', '989898989', 1, '2021-04-26 20:14:08', 1),
(3, 'BULMA', 'VEGETA', 'SAYAYIN', 'GOKU@GMAIL.COM', '123456', 'F', '989898989', 1, '2021-04-26 20:14:08', 1),
(4, 'ADMIN', 'SISTEMA', 'SIS', 'ADMIN@ADMIN.COM', '123456', 'M', '989898989', 2, '2021-04-26 20:14:08', 1),
(9, 'USU2', 'USU2', 'USU2', 'ADMIN@ADMIN.COM', '123456', 'M', '989898989', 1, '2021-04-26 20:14:08', 1),
(10, 'USU3', 'USU3', 'USU3', 'ADMIN@ADMIN.COM', '123456', 'M', '989898989', 1, '2021-04-26 20:14:08', 1),
(11, 'USU4', 'USU4', 'USU4', 'ADMIN@ADMIN.COM', '123456', 'M', '989898989', 1, '2021-04-26 20:14:08', 1),
(12, 'USU5', 'USU5', 'USU5', 'ADMIN@ADMIN.COM', '123456', 'M', '989898989', 1, '2021-04-26 20:14:08', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `td_curso_usuario`
--
ALTER TABLE `td_curso_usuario`
  ADD PRIMARY KEY (`curd_id`);

--
-- Indices de la tabla `tm_categoria`
--
ALTER TABLE `tm_categoria`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indices de la tabla `tm_curso`
--
ALTER TABLE `tm_curso`
  ADD PRIMARY KEY (`cur_id`);

--
-- Indices de la tabla `tm_instructor`
--
ALTER TABLE `tm_instructor`
  ADD PRIMARY KEY (`inst_id`);

--
-- Indices de la tabla `tm_usuario`
--
ALTER TABLE `tm_usuario`
  ADD PRIMARY KEY (`usu_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `td_curso_usuario`
--
ALTER TABLE `td_curso_usuario`
  MODIFY `curd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `tm_categoria`
--
ALTER TABLE `tm_categoria`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tm_curso`
--
ALTER TABLE `tm_curso`
  MODIFY `cur_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `tm_instructor`
--
ALTER TABLE `tm_instructor`
  MODIFY `inst_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tm_usuario`
--
ALTER TABLE `tm_usuario`
  MODIFY `usu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
