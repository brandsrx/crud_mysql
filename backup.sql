-- MySQL dump 10.13  Distrib 9.1.0, for Win64 (x86_64)
--
-- Host: localhost    Database: consecionario
-- ------------------------------------------------------
-- Server version	9.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aseguradora`
--

DROP TABLE IF EXISTS `aseguradora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aseguradora` (
  `idAseguradora` int NOT NULL,
  `nombreAseguradora` varchar(300) NOT NULL,
  `contactoAseguradora` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`idAseguradora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aseguradora`
--

LOCK TABLES `aseguradora` WRITE;
/*!40000 ALTER TABLE `aseguradora` DISABLE KEYS */;
INSERT INTO `aseguradora` VALUES (1,'Allianz','allianz@contacto.com'),(2,'Mapfre','mapfre@contacto.com'),(3,'AXA','axa@contacto.com'),(4,'Liberty Seguros','liberty@contacto.com'),(5,'Zurich','zurich@contacto.com');
/*!40000 ALTER TABLE `aseguradora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int NOT NULL,
  `idPersona` int NOT NULL,
  `fecha_registro` date NOT NULL,
  PRIMARY KEY (`idCliente`),
  KEY `idPersona` (`idPersona`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (118,1088,'2021-09-15'),(120,1023,'2021-04-15'),(126,1203,'2023-01-25'),(131,1039,'2022-06-01'),(135,1056,'2020-11-20'),(139,1145,'2021-08-17'),(142,1129,'2019-07-10'),(147,1112,'2020-02-05'),(150,1004,'2022-03-30'),(155,1075,'2023-07-14');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `idEmpleado` int NOT NULL,
  `idPersona` int NOT NULL,
  `email` varchar(300) DEFAULT NULL,
  `ci` varchar(50) DEFAULT NULL,
  `comisionES` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`idEmpleado`),
  KEY `idPersona` (`idPersona`),
  CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (205,1056,'andrea.empresa@example.com','87654321','10%'),(210,1023,'luis.empresa@example.com','12345678','5%'),(211,1203,'ana.empresa@example.com','44556677','7%'),(212,1004,'maria.empresa@example.com','22334455','8%'),(213,1039,'oscar.empresa@example.com','77889900','6%'),(214,1145,'jorge.empresa@example.com','55667788','9%'),(215,1075,'carla.empresa@example.com','88990011','4%'),(218,1112,'raquel.empresa@example.com','66778899','11%'),(219,1088,'diego.empresa@example.com','33445566','12%'),(220,1129,'carlos.empresa@example.com','11223344','15%');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_vehiculo`
--

DROP TABLE IF EXISTS `estado_vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_vehiculo` (
  `idEstadoVehiculo` int NOT NULL,
  `nombre_estado` varchar(300) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  PRIMARY KEY (`idEstadoVehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_vehiculo`
--

LOCK TABLES `estado_vehiculo` WRITE;
/*!40000 ALTER TABLE `estado_vehiculo` DISABLE KEYS */;
INSERT INTO `estado_vehiculo` VALUES (1,'Disponible','Vehículo disponible para reserva o venta 3'),(2,'En Mantenimiento','Vehículo en revisión o reparación'),(3,'Alquilado','Vehículo actualmente alquilado'),(4,'Vendido','Vehículo vendido, no disponible'),(5,'Reservado','Vehículo reservado por un cliente'),(6,'En Traslado','Vehículo en transporte hacia una ubicación'),(7,'Pendiente de Inspección','Requiere inspección antes de alquiler o venta'),(8,'En Exhibición','Vehículo en exposición para venta'),(9,'Retirado de Inventario','Vehículo no disponible para operaciones'),(10,'En Reparación','Vehículo siendo reparado por daño');
/*!40000 ALTER TABLE `estado_vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fidelizacion`
--

DROP TABLE IF EXISTS `fidelizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fidelizacion` (
  `idFidelizacion` int NOT NULL,
  `idCliente` int NOT NULL,
  `puntos` int NOT NULL,
  `nivel` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`idFidelizacion`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `fidelizacion_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fidelizacion`
--

LOCK TABLES `fidelizacion` WRITE;
/*!40000 ALTER TABLE `fidelizacion` DISABLE KEYS */;
INSERT INTO `fidelizacion` VALUES (501,120,150,'Bronce'),(502,135,250,'Plata'),(503,142,350,'Oro'),(504,150,100,'Bronce'),(505,118,200,'Plata'),(506,126,400,'Oro'),(507,139,180,'Bronce'),(508,147,280,'Plata'),(509,131,320,'Oro'),(510,155,220,'Plata');
/*!40000 ALTER TABLE `fidelizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantenimiento`
--

DROP TABLE IF EXISTS `mantenimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantenimiento` (
  `idMantenimiento` int NOT NULL,
  `idVehiculo` int NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `estado` varchar(300) DEFAULT NULL,
  `fechaMantenimiento` date NOT NULL,
  PRIMARY KEY (`idMantenimiento`),
  KEY `idVehiculo` (`idVehiculo`),
  CONSTRAINT `mantenimiento_ibfk_1` FOREIGN KEY (`idVehiculo`) REFERENCES `vehiculo` (`idVehiculo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantenimiento`
--

LOCK TABLES `mantenimiento` WRITE;
/*!40000 ALTER TABLE `mantenimiento` DISABLE KEYS */;
INSERT INTO `mantenimiento` VALUES (1,1,'Cambio de aceite y filtros','Completado','2024-10-10'),(2,2,'Reparación del sistema de frenos','Pendiente','2024-10-12'),(3,3,'Mantenimiento de transmisión','En progreso','2024-10-14'),(4,4,'Alineación de ruedas','Completado','2024-10-15'),(5,5,'Revisión general','En espera','2024-10-16'),(6,6,'Reparación de suspensión','En progreso','2024-10-17'),(7,7,'Cambio de bujías','Completado','2024-10-18'),(8,8,'Revisión del sistema de escape','Pendiente','2024-10-19'),(9,9,'Inspección de carrocería','En espera','2024-10-20');
/*!40000 ALTER TABLE `mantenimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantenimiento_repuestos`
--

DROP TABLE IF EXISTS `mantenimiento_repuestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantenimiento_repuestos` (
  `id` int NOT NULL,
  `idMantenimiento` int NOT NULL,
  `idRepuestos` int NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idMantenimiento` (`idMantenimiento`),
  KEY `idRepuestos` (`idRepuestos`),
  CONSTRAINT `mantenimiento_repuestos_ibfk_1` FOREIGN KEY (`idMantenimiento`) REFERENCES `mantenimiento` (`idMantenimiento`) ON DELETE CASCADE,
  CONSTRAINT `mantenimiento_repuestos_ibfk_2` FOREIGN KEY (`idRepuestos`) REFERENCES `repuestos` (`idRepuestos`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantenimiento_repuestos`
--

LOCK TABLES `mantenimiento_repuestos` WRITE;
/*!40000 ALTER TABLE `mantenimiento_repuestos` DISABLE KEYS */;
INSERT INTO `mantenimiento_repuestos` VALUES (1,1,1,1),(2,2,2,1),(3,3,3,4),(4,4,4,3),(5,5,5,2),(6,6,6,1),(7,7,7,1),(8,8,8,1),(9,9,9,4);
/*!40000 ALTER TABLE `mantenimiento_repuestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca` (
  `idMarca` int NOT NULL,
  `nombreMarca` varchar(300) NOT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `paisMarca` varchar(300) NOT NULL,
  PRIMARY KEY (`idMarca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'Toyota','Marca japonesa de vehículos confiable y popular','Japón'),(2,'Ford','Pionera en la industria automotriz','Estados Unidos'),(3,'BMW','Fabricante alemán de autos de lujo','Alemania'),(4,'Chevrolet','Marca estadounidense de autos y camionetas','Estados Unidos'),(5,'Hyundai','Marca de vehículos coreana','Corea del Sur'),(6,'Honda','Marca japonesa con una gran variedad de vehículos','Japón'),(7,'Kia','Fabricante surcoreano de vehículos','Corea del Sur'),(8,'Audi','Marca alemana de autos de lujo','Alemania'),(9,'Nissan','Marca japonesa conocida por sus modelos económicos','Japón'),(10,'Volkswagen','Fabricante alemán de vehículos confiable','Alemania');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `idPersona` int NOT NULL,
  `nombre` varchar(300) NOT NULL,
  `paterno` varchar(300) NOT NULL,
  `materno` varchar(300) DEFAULT NULL,
  `direccion` varchar(300) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `email` varchar(300) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  PRIMARY KEY (`idPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1004,'Maria','Perez','Sanchez','Calle Flores, Oruro','78901234','maria.perez@example.com','1985-12-01'),(1023,'Luis','Martinez','Soto','Calle 5, La Paz','71234567','luis.martinez@example.com','1990-05-12'),(1039,'Oscar','Rivero','Perez','Av. San Martin, La Paz','76789012','oscar.rivero@example.com','1991-08-22'),(1056,'Andrea','Lopez','Rios','Calle 12, Cochabamba','71234890','andrea.lopez@example.com','1988-07-22'),(1075,'Carla','Mendoza','Alvarez','Calle Bolivar, Beni','77123456','carla.mendoza@example.com','1986-11-30'),(1088,'Diego','Salazar','Garcia','Av. Sucre, Potosi','71230678','diego.salazar@example.com','1995-03-14'),(1112,'Raquel','Paredes','Gutierrez','Calle 10, Santa Cruz','75432109','raquel.paredes@example.com','1989-02-17'),(1129,'Carlos','Gomez','Torrez','Av. Blanco, Sucre','72345678','carlos.gomez@example.com','1992-10-03'),(1145,'Jorge','Vargas','Mendoza','Av. Blanco Galindo, Cochabamba','71239876','jorge.vargas@example.com','1993-04-27'),(1203,'Ana','Fernandez','Romero','Calle Colon, Tarija','78905432','ana.fernandez@example.com','1987-06-09');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realiza`
--

DROP TABLE IF EXISTS `realiza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `realiza` (
  `idCliente` int NOT NULL,
  `idVehiculo` int NOT NULL,
  `idTransaccion` int NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`idCliente`,`idVehiculo`,`idTransaccion`),
  KEY `idVehiculo` (`idVehiculo`),
  KEY `idTransaccion` (`idTransaccion`),
  CONSTRAINT `realiza_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE CASCADE,
  CONSTRAINT `realiza_ibfk_2` FOREIGN KEY (`idVehiculo`) REFERENCES `vehiculo` (`idVehiculo`) ON DELETE CASCADE,
  CONSTRAINT `realiza_ibfk_3` FOREIGN KEY (`idTransaccion`) REFERENCES `transaccion` (`idTransaccion`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realiza`
--

LOCK TABLES `realiza` WRITE;
/*!40000 ALTER TABLE `realiza` DISABLE KEYS */;
/*!40000 ALTER TABLE `realiza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repuestos`
--

DROP TABLE IF EXISTS `repuestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repuestos` (
  `idRepuestos` int NOT NULL,
  `nombre` varchar(300) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idRepuestos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repuestos`
--

LOCK TABLES `repuestos` WRITE;
/*!40000 ALTER TABLE `repuestos` DISABLE KEYS */;
INSERT INTO `repuestos` VALUES (1,'Filtro de aire','Filtro de aire para motor'),(2,'Pastillas de freno','Pastillas de freno delanteras y traseras'),(3,'Bujías','Bujías para motor de 4 cilindros'),(4,'Aceite sintético','Aceite de motor 5W-30'),(5,'Filtro de aceite','Filtro de aceite para motor'),(6,'Amortiguador','Amortiguador delantero'),(7,'Correa de distribución','Correa para el sistema de distribución'),(8,'Batería','Batería para sistema de encendido'),(9,'Neumático','Neumático radial 195/65 R15'),(10,'Espejo lateral','Espejo lateral derecho');
/*!40000 ALTER TABLE `repuestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserva` (
  `idReserva` int NOT NULL,
  `idCliente` int NOT NULL,
  `idEmpleado` int NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  `contrato` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`idReserva`),
  KEY `idCliente` (`idCliente`),
  KEY `idEmpleado` (`idEmpleado`),
  CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE CASCADE,
  CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` VALUES (401,120,210,'2024-05-15','2024-06-15','R-001'),(402,135,205,'2023-12-01','2023-12-20','R-002'),(403,142,220,'2023-07-10','2023-07-25','R-003'),(404,150,212,'2024-02-10','2024-02-28','R-004'),(405,118,219,'2024-01-15','2024-01-30','R-005'),(406,126,211,'2023-09-05','2023-09-15','R-006'),(407,139,214,'2024-03-01','2024-03-20','R-007'),(408,147,218,'2023-05-15','2023-05-25','R-008'),(409,131,213,'2023-06-10','2023-06-20','R-009'),(410,155,215,'2024-08-05','2024-08-20','R-010');
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seguimiento_vehiculo`
--

DROP TABLE IF EXISTS `seguimiento_vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguimiento_vehiculo` (
  `id` int NOT NULL,
  `idVehiculo` int NOT NULL,
  `ubicacionActual` varchar(300) DEFAULT NULL,
  `ultimaFechaActualizacion` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idVehiculo` (`idVehiculo`),
  CONSTRAINT `seguimiento_vehiculo_ibfk_1` FOREIGN KEY (`idVehiculo`) REFERENCES `vehiculo` (`idVehiculo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguimiento_vehiculo`
--

LOCK TABLES `seguimiento_vehiculo` WRITE;
/*!40000 ALTER TABLE `seguimiento_vehiculo` DISABLE KEYS */;
INSERT INTO `seguimiento_vehiculo` VALUES (1,1,'Sede Principal','2024-10-15'),(2,2,'Sucursal Norte','2024-10-14'),(3,3,'Sucursal Oeste','2024-10-13'),(4,4,'Sucursal Sur','2024-10-12'),(5,5,'Sede Principal','2024-10-11'),(6,6,'Sucursal Este','2024-10-10'),(7,7,'Sucursal Norte','2024-10-09'),(8,8,'Sucursal Oeste','2024-10-08'),(9,9,'Sede Principal','2024-10-07');
/*!40000 ALTER TABLE `seguimiento_vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seguro`
--

DROP TABLE IF EXISTS `seguro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguro` (
  `idSeguro` int NOT NULL,
  `idVehiculo` int NOT NULL,
  `idAseguradora` int NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  `tipoSeguro` varchar(300) DEFAULT NULL,
  `costo` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idSeguro`),
  KEY `idVehiculo` (`idVehiculo`),
  KEY `idAseguradora` (`idAseguradora`),
  CONSTRAINT `seguro_ibfk_1` FOREIGN KEY (`idVehiculo`) REFERENCES `vehiculo` (`idVehiculo`) ON DELETE CASCADE,
  CONSTRAINT `seguro_ibfk_2` FOREIGN KEY (`idAseguradora`) REFERENCES `aseguradora` (`idAseguradora`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguro`
--

LOCK TABLES `seguro` WRITE;
/*!40000 ALTER TABLE `seguro` DISABLE KEYS */;
INSERT INTO `seguro` VALUES (1,1,1,'2024-01-01','2025-01-01','Cobertura Completa',1500.00),(2,2,2,'2024-02-15','2025-02-15','Responsabilidad Civil',1200.00),(3,3,3,'2024-03-10','2025-03-10','Cobertura Total',1800.00),(4,4,4,'2024-04-05','2025-04-05','Cobertura Completa',1700.00),(5,5,5,'2024-05-20','2025-05-20','Riesgo de Daños',1300.00),(6,6,1,'2024-06-15','2025-06-15','Cobertura Completa',1400.00),(7,7,2,'2024-07-01','2025-07-01','Responsabilidad Civil',1150.00),(8,8,3,'2024-08-10','2025-08-10','Cobertura Completa',1650.00),(9,9,4,'2024-09-12','2025-09-12','Cobertura Completa',1550.00);
/*!40000 ALTER TABLE `seguro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_cambio`
--

DROP TABLE IF EXISTS `tipo_cambio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_cambio` (
  `idTipoCambio` int NOT NULL,
  `fechaTipoCambio` date NOT NULL,
  `valorDolar` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idTipoCambio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_cambio`
--

LOCK TABLES `tipo_cambio` WRITE;
/*!40000 ALTER TABLE `tipo_cambio` DISABLE KEYS */;
INSERT INTO `tipo_cambio` VALUES (1,'2024-10-10',6.91),(2,'2024-10-11',6.89),(3,'2024-10-12',6.92),(4,'2024-10-13',6.90),(5,'2024-10-14',6.93),(6,'2024-10-15',6.94),(7,'2024-10-16',6.95),(8,'2024-10-17',6.90),(9,'2024-10-18',6.89),(10,'2024-10-19',6.88);
/*!40000 ALTER TABLE `tipo_cambio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaccion`
--

DROP TABLE IF EXISTS `transaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaccion` (
  `idTransaccion` int NOT NULL,
  `idCliente` int NOT NULL,
  `tipoTransaccion` varchar(300) NOT NULL,
  `fechaTransaccion` date NOT NULL,
  `costo` decimal(10,2) NOT NULL,
  `idTipoCambio` int NOT NULL,
  PRIMARY KEY (`idTransaccion`),
  KEY `idCliente` (`idCliente`),
  KEY `idTipoCambio` (`idTipoCambio`),
  CONSTRAINT `transaccion_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE CASCADE,
  CONSTRAINT `transaccion_ibfk_2` FOREIGN KEY (`idTipoCambio`) REFERENCES `tipo_cambio` (`idTipoCambio`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaccion`
--

LOCK TABLES `transaccion` WRITE;
/*!40000 ALTER TABLE `transaccion` DISABLE KEYS */;
INSERT INTO `transaccion` VALUES (1,120,'Compra','2024-10-10',550.09,1),(2,135,'Compra','2024-10-12',15000.00,2),(3,142,'Alquiler','2024-10-14',650.00,3),(4,150,'Venta','2024-10-15',18000.00,4),(5,118,'Compra','2024-10-16',500.00,5),(6,126,'Compra','2024-10-17',720.00,6),(7,139,'Venta','2024-10-18',21000.00,7),(8,147,'Alquiler','2024-10-19',450.00,8),(9,131,'Compra','2024-10-20',13000.00,9),(10,155,'Alquiler','2024-10-21',400.00,10);
/*!40000 ALTER TABLE `transaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idUsuario` int NOT NULL,
  `idEmpleado` int NOT NULL,
  `nombreUsuario` varchar(300) NOT NULL,
  `contrasena` varchar(300) NOT NULL,
  `rolUsuario` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `idEmpleado` (`idEmpleado`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (301,210,'luis_m','pass123','Admin'),(302,205,'andrea_l','pass456','User'),(303,220,'carlos_g','pass789','Supervisor'),(304,212,'maria_p','pass321','Admin'),(305,219,'diego_s','pass654','User'),(306,211,'ana_f','pass987','Supervisor'),(307,214,'jorge_v','pass234','User'),(308,218,'raquel_p','pass765','Admin'),(309,213,'oscar_r','pass876','User'),(310,215,'carla_m','pass098','Supervisor');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculo`
--

DROP TABLE IF EXISTS `vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiculo` (
  `idVehiculo` int NOT NULL,
  `anio` int NOT NULL,
  `modelo` varchar(300) NOT NULL,
  `precioDiario` decimal(10,2) NOT NULL,
  `precioDolar` decimal(10,2) NOT NULL,
  `caracteristicas` varchar(200) DEFAULT NULL,
  `idEstadoVehiculo` int NOT NULL,
  `idMarca` int NOT NULL,
  PRIMARY KEY (`idVehiculo`),
  KEY `idEstadoVehiculo` (`idEstadoVehiculo`),
  KEY `idMarca` (`idMarca`),
  CONSTRAINT `vehiculo_ibfk_1` FOREIGN KEY (`idEstadoVehiculo`) REFERENCES `estado_vehiculo` (`idEstadoVehiculo`) ON DELETE CASCADE,
  CONSTRAINT `vehiculo_ibfk_2` FOREIGN KEY (`idMarca`) REFERENCES `marca` (`idMarca`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculo`
--

LOCK TABLES `vehiculo` WRITE;
/*!40000 ALTER TABLE `vehiculo` DISABLE KEYS */;
INSERT INTO `vehiculo` VALUES (1,2020,'Corolla',55.00,15000.00,'Compacto, eficiente en combustible',1,1),(2,2019,'Focus',50.00,14000.00,'Compacto, motor turbo',3,2),(3,2025,'X5',120.00,60000.00,'SUV de lujo, gran capacidad',8,3),(4,2018,'Cruze',45.00,13000.00,'Sedán, económico y espacioso',1,4),(5,2021,'Elantra',53.00,15500.00,'Compacto, tecnología avanzada',1,5),(6,2019,'Civic',55.00,14500.00,'Compacto deportivo',2,6),(7,2020,'Sportage',70.00,18000.00,'SUV, gran espacio',1,7),(8,2021,'A4',115.00,55000.00,'Sedán de lujo',3,8),(9,2017,'Sentra',42.00,12000.00,'Compacto asequible',4,9);
/*!40000 ALTER TABLE `vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_clientes`
--

DROP TABLE IF EXISTS `vista_clientes`;
/*!50001 DROP VIEW IF EXISTS `vista_clientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_clientes` AS SELECT 
 1 AS `idCliente`,
 1 AS `Nombre_completo`,
 1 AS `direccion`,
 1 AS `telefono`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_clientes_con_edad`
--

DROP TABLE IF EXISTS `vista_clientes_con_edad`;
/*!50001 DROP VIEW IF EXISTS `vista_clientes_con_edad`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_clientes_con_edad` AS SELECT 
 1 AS `idCliente`,
 1 AS `nombre_completo`,
 1 AS `direccion`,
 1 AS `telefono`,
 1 AS `edad`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_clientes`
--

/*!50001 DROP VIEW IF EXISTS `vista_clientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_clientes` AS select `c`.`idCliente` AS `idCliente`,concat(`p`.`nombre`,' ',`p`.`paterno`,' ',`p`.`materno`) AS `Nombre_completo`,`p`.`direccion` AS `direccion`,`p`.`telefono` AS `telefono` from (`cliente` `c` join `persona` `p` on((`c`.`idPersona` = `p`.`idPersona`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_clientes_con_edad`
--

/*!50001 DROP VIEW IF EXISTS `vista_clientes_con_edad`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_clientes_con_edad` AS select `c`.`idCliente` AS `idCliente`,concat(`p`.`nombre`,' ',`p`.`paterno`,' ',`p`.`materno`) AS `nombre_completo`,`p`.`direccion` AS `direccion`,`p`.`telefono` AS `telefono`,timestampdiff(YEAR,`p`.`fecha_nacimiento`,curdate()) AS `edad` from (`cliente` `c` join `persona` `p` on((`c`.`idPersona` = `p`.`idPersona`))) */;
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

-- Dump completed on 2024-12-05 18:34:05
