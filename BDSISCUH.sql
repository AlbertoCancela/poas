-- MySQL dump 10.13  Distrib 8.0.41, for Linux (x86_64)
--
-- Host: localhost    Database: BDSISCUH
-- ------------------------------------------------------
-- Server version	8.0.41-0ubuntu0.24.04.1

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
-- Table structure for table `POAS_CONCEPTOACTIVIDAD`
--

DROP TABLE IF EXISTS `POAS_CONCEPTOACTIVIDAD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POAS_CONCEPTOACTIVIDAD` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `FOLIO` int NOT NULL,
  `TIPO_CUENTA` int NOT NULL,
  `FECHA_EJECUCION` varchar(255) NOT NULL,
  `CONCEPTO` text NOT NULL,
  `UNIDAD` int NOT NULL,
  `CANTIDAD` int NOT NULL,
  `COSTO_UNITARIO` int NOT NULL,
  `IMPORTE_TOTAL` int NOT NULL,
  `OBSERVACIONES` text,
  PRIMARY KEY (`ID`),
  KEY `TIPO_CUENTA` (`TIPO_CUENTA`),
  KEY `FOLIO` (`FOLIO`),
  KEY `UNIDAD` (`UNIDAD`),
  CONSTRAINT `POAS_CONCEPTOACTIVIDAD_ibfk_1` FOREIGN KEY (`TIPO_CUENTA`) REFERENCES `POAS_CUENTAS` (`ID`),
  CONSTRAINT `POAS_CONCEPTOACTIVIDAD_ibfk_2` FOREIGN KEY (`FOLIO`) REFERENCES `POAS_POAS` (`FOLIO`),
  CONSTRAINT `POAS_CONCEPTOACTIVIDAD_ibfk_3` FOREIGN KEY (`UNIDAD`) REFERENCES `POAS_UNIDADES` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POAS_CONCEPTOACTIVIDAD`
--

LOCK TABLES `POAS_CONCEPTOACTIVIDAD` WRITE;
/*!40000 ALTER TABLE `POAS_CONCEPTOACTIVIDAD` DISABLE KEYS */;
INSERT INTO `POAS_CONCEPTOACTIVIDAD` VALUES (1,1,4,'2025-02-14','Arreglo floral',3,2,400,800,'Niunapapitodoenolden'),(2,1,2,'2025-02-14','Alimentos del equipo de verificación (7 días por 6 personas)',1,12,3500,42000,'eldiaaaabloo'),(3,2,2,'2025-03-05','YOYO',3,11100,0,5217,''),(4,2,2,'2025-03-05','HEY HEY',3,11100,0,5217,''),(6,20,3,'2025-04-02','holoooooo',2,12,124,1488,NULL),(7,20,2,'2025-04-02','adioooooo',2,12,124,1488,NULL);
/*!40000 ALTER TABLE `POAS_CONCEPTOACTIVIDAD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POAS_CUENTAS`
--

DROP TABLE IF EXISTS `POAS_CUENTAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POAS_CUENTAS` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `DESCRIPCION` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POAS_CUENTAS`
--

LOCK TABLES `POAS_CUENTAS` WRITE;
/*!40000 ALTER TABLE `POAS_CUENTAS` DISABLE KEYS */;
INSERT INTO `POAS_CUENTAS` VALUES (1,'CUENTA_1','descripcion'),(2,'CUENTA_2','descripcion'),(3,'CUENTA_3','descripcion'),(4,'CUENTA_4','descripcion');
/*!40000 ALTER TABLE `POAS_CUENTAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POAS_DEPARTAMENTOS`
--

DROP TABLE IF EXISTS `POAS_DEPARTAMENTOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POAS_DEPARTAMENTOS` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(255) NOT NULL,
  `ID_DIRECCION` int NOT NULL,
  `CLAVE` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_DIRECCION` (`ID_DIRECCION`),
  CONSTRAINT `POAS_DEPARTAMENTOS_ibfk_1` FOREIGN KEY (`ID_DIRECCION`) REFERENCES `POAS_DIRECCIONES` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POAS_DEPARTAMENTOS`
--

LOCK TABLES `POAS_DEPARTAMENTOS` WRITE;
/*!40000 ALTER TABLE `POAS_DEPARTAMENTOS` DISABLE KEYS */;
INSERT INTO `POAS_DEPARTAMENTOS` VALUES (1,'DIRECCION DE GESTION CALIDAD',1,'RE3'),(2,'TALENTO HUMANO',1,'RE4'),(3,'DIRECCION DE FINANZAS',2,'CG1'),(4,'DIRECCION DE CONTABILIDAD',2,'CG2'),(5,'JEFATURA DE ADQUISICIONES DE BIENES Y SERVICIOS',2,'CG3'),(6,'FACULTAD DE CIENCIAS DE LA SALUD',4,'VA1'),(7,'DIRECCION DE SERVICIOS ESCOLARES',3,'VO4');
/*!40000 ALTER TABLE `POAS_DEPARTAMENTOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POAS_DIRECCIONES`
--

DROP TABLE IF EXISTS `POAS_DIRECCIONES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POAS_DIRECCIONES` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(255) NOT NULL,
  `CLAVE` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POAS_DIRECCIONES`
--

LOCK TABLES `POAS_DIRECCIONES` WRITE;
/*!40000 ALTER TABLE `POAS_DIRECCIONES` DISABLE KEYS */;
INSERT INTO `POAS_DIRECCIONES` VALUES (1,'RECTORIA','RE'),(2,'CONTRALORIA GENERAL','CG'),(3,'VICERRECTORIA OPERATIVA','VO'),(4,'VICERRECTORIA ACADEMICA','VA');
/*!40000 ALTER TABLE `POAS_DIRECCIONES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POAS_EJERECTOR`
--

DROP TABLE IF EXISTS `POAS_EJERECTOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POAS_EJERECTOR` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `DESCRIPCION` varchar(2000) DEFAULT NULL,
  `CLAVE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POAS_EJERECTOR`
--

LOCK TABLES `POAS_EJERECTOR` WRITE;
/*!40000 ALTER TABLE `POAS_EJERECTOR` DISABLE KEYS */;
INSERT INTO `POAS_EJERECTOR` VALUES (1,'EDUCACION CON ENFOQUE INTEGRAL','PARA RESPONDER A LAS NECESIDADES DE LA SOCIEDAD Y EL MEDIO AMBIENTE','I'),(2,'INVESTIGACION E INNOVACION','PARA CONTRIBUIR EN LA FORMACION INTEGRAL DE PERSONAS, GENERANDO EFECTOS POSITIVOS A LA DEMANDA SOCIAL Y DEL MEDIO AMBIENTE','II'),(3,'FORMACION INTEGRAL DE PERSONAS','PARA EL DESARROLLO DE SUS DIMENSIONES COGNITIVAS Y PSICOSOCIALES MEJORANDO ASÍ LAS CONDICIONES DE SU ENTORNO.','III'),(4,'INCREMENTO DEL CONOCIMIENTO ACADEMICO DE LA PLANTA DOCENTE','PARA MEJORAR SU DESEMPEÑO Y ASÍ CONTRIBUIR AL LOGRO DE LOS PROPÓSITOS FORMATIVOS.','IV'),(5,'VINCULACION INSTITUCIONAL Y EXTENSION SOCIAL','CON PERTENENCIA Y VISIÓN','V'),(6,'GESTION ADMINISTRATIVA INSTITUCIONAL','PARA LOGRAR EL USO ÓPTIMO DE LOS RECURSOS HUMANOS, MATERIALES, FINANCIEROS Y TECNOLÓGICOS, BRINDANDO ASÍ UN SERVICIO MÁS EFICIENTE A LA COMUNIDAD UNIVERSITARIA.','VI'),(7,'EDUCACION INTEGRAL PARA LA VIDA','PARA PERMITIR A LOS INTEGRANTES DE LA COMUNIDAD HIPÓCRATES HACER FRENTE A LOS RETOS PERSONALES.','VII');
/*!40000 ALTER TABLE `POAS_EJERECTOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POAS_LINEASACCION`
--

DROP TABLE IF EXISTS `POAS_LINEASACCION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POAS_LINEASACCION` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `DESCRIPCION` varchar(2000) DEFAULT NULL,
  `CLAVE` varchar(255) DEFAULT NULL,
  `ID_EJE_RECTOR` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_EJE_RECTOR` (`ID_EJE_RECTOR`),
  CONSTRAINT `POAS_LINEASACCION_ibfk_1` FOREIGN KEY (`ID_EJE_RECTOR`) REFERENCES `POAS_EJERECTOR` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POAS_LINEASACCION`
--

LOCK TABLES `POAS_LINEASACCION` WRITE;
/*!40000 ALTER TABLE `POAS_LINEASACCION` DISABLE KEYS */;
INSERT INTO `POAS_LINEASACCION` VALUES (1,'LINEA DE ACCION 1','Revisión, mejoramiento y creación de procesos administrativos, para su sistematización e implementación institucional, con la finalidad de brindar servicios óptimos a la comunidad universitaria.','VI-LA1',6),(2,'LINEA DE ACCION 2','Programa de inversión, renovación y mantenimiento del activo fijo.','VI-LA2',6),(3,'LINEA DE ACCION 3','Desarrollo del personal administrativo.','VI-LA3',6);
/*!40000 ALTER TABLE `POAS_LINEASACCION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POAS_NIVELES`
--

DROP TABLE IF EXISTS `POAS_NIVELES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POAS_NIVELES` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NIVEL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POAS_NIVELES`
--

LOCK TABLES `POAS_NIVELES` WRITE;
/*!40000 ALTER TABLE `POAS_NIVELES` DISABLE KEYS */;
INSERT INTO `POAS_NIVELES` VALUES (1,'ADMINISTRADOR'),(2,'CREADOR DE POAS'),(3,'SUPERVISOR'),(4,'USUARIO');
/*!40000 ALTER TABLE `POAS_NIVELES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POAS_POAS`
--

DROP TABLE IF EXISTS `POAS_POAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POAS_POAS` (
  `FOLIO` int NOT NULL AUTO_INCREMENT,
  `FECHA_ELABORACION` date NOT NULL,
  `EJERCICIO_FISCAL` varchar(255) NOT NULL,
  `DESCRIPCION` text NOT NULL,
  `FECHA_INICIO` date NOT NULL,
  `FECHA_TERMINO` date NOT NULL,
  `ID_AREA` int NOT NULL,
  `TIPO_GASTO` varchar(255) NOT NULL,
  `ID_PDI_PROYECTOMETA` int DEFAULT NULL,
  `OBSERVACIONES` text,
  `AUTOR` int NOT NULL,
  `NOTA` text,
  PRIMARY KEY (`FOLIO`),
  KEY `ID_PDI_PROYECTOMETA` (`ID_PDI_PROYECTOMETA`),
  KEY `ID_AREA` (`ID_AREA`),
  CONSTRAINT `POAS_POAS_ibfk_1` FOREIGN KEY (`ID_PDI_PROYECTOMETA`) REFERENCES `POAS_PROYECTOMETA` (`ID`),
  CONSTRAINT `POAS_POAS_ibfk_2` FOREIGN KEY (`ID_AREA`) REFERENCES `POAS_SECCIONES` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POAS_POAS`
--

LOCK TABLES `POAS_POAS` WRITE;
/*!40000 ALTER TABLE `POAS_POAS` DISABLE KEYS */;
INSERT INTO `POAS_POAS` VALUES (1,'2025-02-14','2026','Optimización de recursos administrativos institucionales','2026-02-14','2026-02-14',1,'ESTRATEGICO',4,'Proyecto centrado en fortalecer la gestión interna.',1,''),(2,'2025-03-12','2026','Implementación de mejoras tecnológicas y académicas','2025-03-04','2025-03-28',1,'ESTRATEGICO',3,'Aumentar el rendimiento de servicios y plataformas.',1,''),(3,'2025-03-12','2026','Fortalecimiento de procesos administrativos clave','2025-03-04','2025-03-28',1,'ESTRATEGICO',3,'Optimizar tiempos y costos en tareas recurrentes.',1,''),(4,'2025-03-12','2026','Renovación de infraestructura institucional esencial','2025-03-04','2025-03-28',1,'ESTRATEGICO',3,'Modernización física y tecnológica en áreas clave.',1,''),(5,'2025-03-12','2026','Capacitación continua y desarrollo profesional','2025-03-04','2025-03-28',2,'ESTRATEGICO',3,'Potenciar las habilidades del personal operativo.',1,''),(6,'2025-03-12','2026','Mejoramiento del entorno universitario','2025-03-04','2025-03-28',1,'ESTRATEGICO',1,'Espacios funcionales y agradables para estudiantes.',1,''),(7,'2025-04-01','2026','sdasdasdaa','2025-04-01','2025-04-17',1,'estrategico',6,'este es un nuevo test',1,NULL),(20,'2025-04-08','2026','sadadsdfhjufcbhb hj nf sdjad j','2025-04-04','2025-04-18',2,'estrategico',6,'Alberto Cancelaaaaa',1,NULL);
/*!40000 ALTER TABLE `POAS_POAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POAS_PROYECTOMETA`
--

DROP TABLE IF EXISTS `POAS_PROYECTOMETA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POAS_PROYECTOMETA` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `DESCRIPCION` varchar(2000) DEFAULT NULL,
  `CLAVE` varchar(255) DEFAULT NULL,
  `ID_LINEAS_ACCION` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_LINEAS_ACCION` (`ID_LINEAS_ACCION`),
  CONSTRAINT `POAS_PROYECTOMETA_ibfk_1` FOREIGN KEY (`ID_LINEAS_ACCION`) REFERENCES `POAS_LINEASACCION` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POAS_PROYECTOMETA`
--

LOCK TABLES `POAS_PROYECTOMETA` WRITE;
/*!40000 ALTER TABLE `POAS_PROYECTOMETA` DISABLE KEYS */;
INSERT INTO `POAS_PROYECTOMETA` VALUES (1,'PROYECTO/META 1.1','Revisar, actualizar y adecuar la normatividad de los procesos administrativos que operan en cada área de la institución.','IV-LA1-PM11',1),(2,'PROYECTO/META 1.2','Realizar reingeniería de procesos administrativos.','IV-LA1-PM12',1),(3,'PROYECTO/META 1.3','Sistematizar procesos y procedimientos administrativos.','IV-LA1-PM13',1),(4,'PROYECTO/META 1.4','Certificación de procesos administrativos.','IV-LA1-PM14',1),(5,'PROYECTO/META 2.1','Establecer un programa de inversión, renovación y mantenimiento del activo fijo, con base a las necesidades de las diferentes áreas y del PDI 2022-2030.','IV-LA1-PM21',2),(6,'PROYECTO/META 2.2','Fortalecer las tecnologías de la información y comunicación, inversión en equipos informáticos, de comunicación y conectividad, adecuados para cubrir las necesidades académicas y administrativas en una “nueva normalidad”.','IV-LA1-PM22',2);
/*!40000 ALTER TABLE `POAS_PROYECTOMETA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POAS_RESPONSABLES`
--

DROP TABLE IF EXISTS `POAS_RESPONSABLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POAS_RESPONSABLES` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_CONCEPTO` int NOT NULL,
  `ID_USUARIO` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_CONCEPTO` (`ID_CONCEPTO`),
  KEY `ID_USUARIO` (`ID_USUARIO`),
  CONSTRAINT `POAS_RESPONSABLES_ibfk_1` FOREIGN KEY (`ID_CONCEPTO`) REFERENCES `POAS_CONCEPTOACTIVIDAD` (`ID`),
  CONSTRAINT `POAS_RESPONSABLES_ibfk_2` FOREIGN KEY (`ID_USUARIO`) REFERENCES `POAS_USUARIOS` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POAS_RESPONSABLES`
--

LOCK TABLES `POAS_RESPONSABLES` WRITE;
/*!40000 ALTER TABLE `POAS_RESPONSABLES` DISABLE KEYS */;
INSERT INTO `POAS_RESPONSABLES` VALUES (1,1,1),(2,1,2),(3,1,4),(4,2,3);
/*!40000 ALTER TABLE `POAS_RESPONSABLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POAS_SECCIONES`
--

DROP TABLE IF EXISTS `POAS_SECCIONES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POAS_SECCIONES` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(255) NOT NULL,
  `ID_DEPARTAMENTO` int NOT NULL,
  `CLAVE` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_DEPARTAMENTO` (`ID_DEPARTAMENTO`),
  CONSTRAINT `POAS_SECCIONES_ibfk_1` FOREIGN KEY (`ID_DEPARTAMENTO`) REFERENCES `POAS_DEPARTAMENTOS` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POAS_SECCIONES`
--

LOCK TABLES `POAS_SECCIONES` WRITE;
/*!40000 ALTER TABLE `POAS_SECCIONES` DISABLE KEYS */;
INSERT INTO `POAS_SECCIONES` VALUES (1,'DIRECCION DE GESTION DE CALIDAD',1,'RE3.1'),(2,'TALENTO HUMANO',2,'RE4.1');
/*!40000 ALTER TABLE `POAS_SECCIONES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POAS_UNIDADES`
--

DROP TABLE IF EXISTS `POAS_UNIDADES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POAS_UNIDADES` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `DESCRIPCION` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POAS_UNIDADES`
--

LOCK TABLES `POAS_UNIDADES` WRITE;
/*!40000 ALTER TABLE `POAS_UNIDADES` DISABLE KEYS */;
INSERT INTO `POAS_UNIDADES` VALUES (1,'SERVICIOS','descripcion'),(2,'NOCHES','descripcion'),(3,'PIEZAS','descripcion'),(4,'ALIMENTOS','descripcion');
/*!40000 ALTER TABLE `POAS_UNIDADES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POAS_USUARIOS`
--

DROP TABLE IF EXISTS `POAS_USUARIOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POAS_USUARIOS` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(255) NOT NULL,
  `USUARIO` varchar(255) NOT NULL,
  `ID_NIVEL` int NOT NULL,
  `PERMISOS_EXTRA` text,
  `CORREO` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_NIVEL` (`ID_NIVEL`),
  CONSTRAINT `POAS_USUARIOS_ibfk_1` FOREIGN KEY (`ID_NIVEL`) REFERENCES `POAS_NIVELES` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POAS_USUARIOS`
--

LOCK TABLES `POAS_USUARIOS` WRITE;
/*!40000 ALTER TABLE `POAS_USUARIOS` DISABLE KEYS */;
INSERT INTO `POAS_USUARIOS` VALUES (1,'ALBERTO JOSUE CANCELA ARREDONDO','ALBERTO',1,'','desarrollo.sistemas@uhipocrates.edu.mx'),(2,'MARÍA FERNANDA LÓPEZ MARTÍNEZ','MFLOPEZ',2,'','m.lopez@uhipocrates.edu.mx'),(3,'RICARDO GUTIÉRREZ SÁNCHEZ','RGUTIERREZ',3,'','ricardo.gs@uhipocrates.edu.mx'),(4,'LUIS MIGUEL TORRES RIVERA','LMTORRES',4,'','torres.rivera@uhipocrates.edu.mx'),(5,'ANA KAREN PÉREZ MORALES','AKPEREZ',4,'','ak.perez@uhipocrates.edu.mx');
/*!40000 ALTER TABLE `POAS_USUARIOS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-07 11:11:24
