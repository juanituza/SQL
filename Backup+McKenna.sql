CREATE DATABASE  IF NOT EXISTS `gimnasio_mckenna` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gimnasio_mckenna`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: gimnasio_mckenna
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actividades`
--

DROP TABLE IF EXISTS `actividades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actividades` (
  `idactividad` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `horario` time DEFAULT NULL,
  `dia` varchar(50) DEFAULT NULL,
  `fk_idsucursal` int NOT NULL,
  PRIMARY KEY (`idactividad`) USING BTREE,
  KEY `fk_idsucursal` (`fk_idsucursal`),
  CONSTRAINT `actividades_ibfk_1` FOREIGN KEY (`fk_idsucursal`) REFERENCES `sucursales` (`idsucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `actividades_sucursal`
--

DROP TABLE IF EXISTS `actividades_sucursal`;
/*!50001 DROP VIEW IF EXISTS `actividades_sucursal`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `actividades_sucursal` AS SELECT 
 1 AS `idsucursal`,
 1 AS `nombre_sucursal`,
 1 AS `nombre_actividad`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `idempleado` int DEFAULT NULL,
  `nombre` text,
  `apellido` text,
  `dni` int DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `correo` text,
  `telefono` text,
  `sueldo` int DEFAULT NULL,
  `fk_idsucursal` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `empleados_vista`
--

DROP TABLE IF EXISTS `empleados_vista`;
/*!50001 DROP VIEW IF EXISTS `empleados_vista`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `empleados_vista` AS SELECT 
 1 AS `idempleado`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `edad`,
 1 AS `correo`,
 1 AS `telefono`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `entrenadores`
--

DROP TABLE IF EXISTS `entrenadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrenadores` (
  `identrenador` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `dni` varchar(50) DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `sueldo` float DEFAULT NULL,
  `fk_idactividad` int NOT NULL,
  PRIMARY KEY (`identrenador`) USING BTREE,
  KEY `fk_idactividad` (`fk_idactividad`),
  CONSTRAINT `entrenadores_ibfk_1` FOREIGN KEY (`fk_idactividad`) REFERENCES `actividades` (`idactividad`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `entrenadores_vista`
--

DROP TABLE IF EXISTS `entrenadores_vista`;
/*!50001 DROP VIEW IF EXISTS `entrenadores_vista`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `entrenadores_vista` AS SELECT 
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `edad`,
 1 AS `actividad`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `log_empleados`
--

DROP TABLE IF EXISTS `log_empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_empleados` (
  `TS_actualiza` timestamp NULL DEFAULT NULL,
  `Esquema` varchar(50) DEFAULT NULL,
  `Tabla` varchar(50) DEFAULT NULL,
  `Operacion` char(6) DEFAULT NULL,
  `registros` int DEFAULT NULL,
  `user` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_socios`
--

DROP TABLE IF EXISTS `log_socios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_socios` (
  `TS_actualiza` timestamp NULL DEFAULT NULL,
  `Esquema` varchar(50) DEFAULT NULL,
  `Tabla` varchar(50) DEFAULT NULL,
  `Operacion` char(6) DEFAULT NULL,
  `registros` int DEFAULT NULL,
  `user` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `socios`
--

DROP TABLE IF EXISTS `socios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socios` (
  `idsocio` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `dni` varchar(50) DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `fk_idactividad` int NOT NULL,
  PRIMARY KEY (`idsocio`) USING BTREE,
  KEY `fk_idactividad` (`fk_idactividad`),
  CONSTRAINT `socios_ibfk_1` FOREIGN KEY (`fk_idactividad`) REFERENCES `actividades` (`idactividad`)
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `socios_actividad`
--

DROP TABLE IF EXISTS `socios_actividad`;
/*!50001 DROP VIEW IF EXISTS `socios_actividad`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `socios_actividad` AS SELECT 
 1 AS `nombre_socio`,
 1 AS `apellido_socio`,
 1 AS `actividad`,
 1 AS `horario`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `socios_historicos`
--

DROP TABLE IF EXISTS `socios_historicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socios_historicos` (
  `idsocio` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `dni` varchar(50) DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `fk_idactividad` int NOT NULL,
  PRIMARY KEY (`idsocio`) USING BTREE,
  KEY `fk_idactividad` (`fk_idactividad`),
  CONSTRAINT `socios_historicos_ibfk_1` FOREIGN KEY (`fk_idactividad`) REFERENCES `actividades` (`idactividad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sucursales`
--

DROP TABLE IF EXISTS `sucursales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursales` (
  `idsucursal` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `horario_de_apertura` time DEFAULT NULL,
  `horario_de_cierre` time DEFAULT NULL,
  PRIMARY KEY (`idsucursal`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `sucursales_entrenadores`
--

DROP TABLE IF EXISTS `sucursales_entrenadores`;
/*!50001 DROP VIEW IF EXISTS `sucursales_entrenadores`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `sucursales_entrenadores` AS SELECT 
 1 AS `nombre_sucursal`,
 1 AS `apellido_entrenador`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `actividades_sucursal`
--

/*!50001 DROP VIEW IF EXISTS `actividades_sucursal`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `actividades_sucursal` AS select `sucu`.`idsucursal` AS `idsucursal`,`sucu`.`nombre` AS `nombre_sucursal`,`act`.`nombre` AS `nombre_actividad` from (`sucursales` `sucu` join `actividades` `act` on((`sucu`.`idsucursal` = `act`.`fk_idsucursal`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `empleados_vista`
--

/*!50001 DROP VIEW IF EXISTS `empleados_vista`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `empleados_vista` AS select `emp`.`idempleado` AS `idempleado`,`emp`.`nombre` AS `nombre`,`emp`.`apellido` AS `apellido`,`emp`.`edad` AS `edad`,`emp`.`correo` AS `correo`,`emp`.`telefono` AS `telefono` from `empleados` `emp` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `entrenadores_vista`
--

/*!50001 DROP VIEW IF EXISTS `entrenadores_vista`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `entrenadores_vista` AS select `ent`.`nombre` AS `nombre`,`ent`.`apellido` AS `apellido`,`ent`.`edad` AS `edad`,`act`.`nombre` AS `actividad` from (`entrenadores` `ent` join `actividades` `act` on((`ent`.`fk_idactividad` = `act`.`idactividad`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `socios_actividad`
--

/*!50001 DROP VIEW IF EXISTS `socios_actividad`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `socios_actividad` AS select `s`.`nombre` AS `nombre_socio`,`s`.`apellido` AS `apellido_socio`,`act`.`nombre` AS `actividad`,`act`.`horario` AS `horario` from (`socios` `s` join `actividades` `act` on((`s`.`fk_idactividad` = `act`.`idactividad`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sucursales_entrenadores`
--

/*!50001 DROP VIEW IF EXISTS `sucursales_entrenadores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sucursales_entrenadores` AS select `sucu`.`nombre` AS `nombre_sucursal`,`ent`.`apellido` AS `apellido_entrenador` from (`sucursales` `sucu` left join `entrenadores` `ent` on((`sucu`.`idsucursal` = `ent`.`fk_idactividad`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-24 22:38:19
