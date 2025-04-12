-- MySQL dump 10.13  Distrib 5.7.44, for Linux (x86_64)
--
-- Host: localhost    Database: BDSISCUH
-- ------------------------------------------------------
-- Server version	5.7.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `POAS_CONCEPTOACTIVIDAD` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FOLIO` int(11) NOT NULL,
  `TIPO_CUENTA` int(11) NOT NULL,
  `FECHA_EJECUCION` varchar(255) NOT NULL,
  `CONCEPTO` text NOT NULL,
  `UNIDAD` int(11) NOT NULL,
  `CANTIDAD` int(11) NOT NULL,
  `COSTO_UNITARIO` int(11) NOT NULL,
  `IMPORTE_TOTAL` int(11) NOT NULL,
  `OBSERVACIONES` text,
  PRIMARY KEY (`ID`),
  KEY `TIPO_CUENTA` (`TIPO_CUENTA`),
  KEY `FOLIO` (`FOLIO`),
  KEY `UNIDAD` (`UNIDAD`),
  CONSTRAINT `POAS_CONCEPTOACTIVIDAD_ibfk_1` FOREIGN KEY (`TIPO_CUENTA`) REFERENCES `POAS_CUENTAS` (`ID`),
  CONSTRAINT `POAS_CONCEPTOACTIVIDAD_ibfk_2` FOREIGN KEY (`FOLIO`) REFERENCES `POAS_POAS` (`FOLIO`),
  CONSTRAINT `POAS_CONCEPTOACTIVIDAD_ibfk_3` FOREIGN KEY (`UNIDAD`) REFERENCES `POAS_UNIDADES` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POAS_CONCEPTOACTIVIDAD`
--

LOCK TABLES `POAS_CONCEPTOACTIVIDAD` WRITE;
/*!40000 ALTER TABLE `POAS_CONCEPTOACTIVIDAD` DISABLE KEYS */;
INSERT INTO `POAS_CONCEPTOACTIVIDAD` VALUES (1,1,4,'2025-02-14','Arreglo floral',3,2,400,800,'Niunapapitodoenolden'),(2,1,2,'2025-02-14','Alimentos del equipo de verificación (7 días por 6 personas)',1,12,3500,42000,'eldiaaaabloo'),(3,2,2,'2025-03-05','YOYO',3,11100,0,5217,''),(4,2,2,'2025-03-05','HEY HEY',3,11100,0,5217,''),(6,20,3,'2025-04-02','holoooooo',2,12,124,1488,NULL),(7,20,2,'2025-04-02','adioooooo',2,12,124,1488,NULL),(8,21,2,'2025-04-10','este es mi concepto o actividad',2,14,12,171,NULL),(9,21,3,'2025-04-10','concepto o actividad este es mi',2,14,54,759,NULL);
/*!40000 ALTER TABLE `POAS_CONCEPTOACTIVIDAD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POAS_CUENTAS`
--

DROP TABLE IF EXISTS `POAS_CUENTAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `POAS_CUENTAS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `DESCRIPCION` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POAS_CUENTAS`
--

LOCK TABLES `POAS_CUENTAS` WRITE;
/*!40000 ALTER TABLE `POAS_CUENTAS` DISABLE KEYS */;
INSERT INTO `POAS_CUENTAS` VALUES (1,'Honorarios','Pagos realizados a terceros, por trabajos profesionales independientes.'),(2,'Renta de autobuses','Renta de autobuses para viajes.'),(3,'Renta de mobiliario','Renta de mobiliario para eventos (sillas, mesas, pantallas, etc.).'),(4,'Suministro y Accesorios de Cómputo','Mouse, teclados, fundas, audífonos, etc.'),(5,'Mobiliario y Equipo Menores','Mobiliario pequeño, como sillas, urnas, cajas, etc.'),(6,'Libros, Revistas y Software','Compras de revistas, libros y software.'),(7,'Decoraciones','Decoraciones para días festivos y conmemorativos.'),(8,'Eventos y Coffee Break','Coffee break, premios o regalos en eventos, compras para realizar eventos.'),(9,'Gastos de Viaje','Boletos de avión, autobús, taxis foráneos, hoteles y comidas.'),(10,'Cursos y Capacitación','Cursos y capacitación para personal.'),(11,'Uniformes','Uniformes como blusas, playeras y batas.'),(12,'Cuotas y Suscripciones','Cuotas a federaciones o suscripciones.'),(13,'Tintorería','Servicios de tintorería para limpieza de textiles.'),(14,'Servicio de Mensajería','Envíos por estafeta, DHL, UPS, FedEx, etc.'),(15,'Trámites y Gestoría','Gastos administrativos gestionados por el servicio escolar.'),(16,'Impuestos y Derechos','Pagos a la Secretaría de Finanzas, Secretaría de Educación, SAT, etc.'),(17,'Transporte Local','Taxis locales (solo Acapulco).'),(18,'Derecho de Patentes, Marcas o Derechos de Autor','Pagos por registros de patentes, marcas o derechos de autor.'),(19,'Alimentos a Estudiantes de Intercambio PILA','Alimentación para estudiantes de intercambio que no pertenecen directamente a UH.'),(20,'Regalos y Eventos Navideños','Decoraciones y regalos exclusivos para eventos navideños.'),(21,'Materiales de Enseñanza','Materiales didácticos según el área académica (cristalería, pipetas, cintas, etc.).'),(22,'Combustibles y Lubricantes','Gasolina y Gas LP.'),(23,'Fletes y Acarreos','Envío de mercancía; si no incluye 4% de IVA retenido, se clasifica como mensajería.'),(24,'Artículos y Suministros de Limpieza','Escobas, esponjas, detergentes y demás productos de limpieza.'),(25,'Publicidad y Comunicación Social','Gastos de publicidad del área de comunicación social.'),(26,'Propaganda de Admisiones','Gastos para la promoción y admisión de nuevos estudiantes.'),(27,'Adquisición de Activo Fijo','Compra de equipos como computadoras y escáneres con costo superior a 5000 pesos.');
/*!40000 ALTER TABLE `POAS_CUENTAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POAS_DEPARTAMENTOS`
--

DROP TABLE IF EXISTS `POAS_DEPARTAMENTOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `POAS_DEPARTAMENTOS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(255) NOT NULL,
  `ID_DIRECCION` int(11) NOT NULL,
  `CLAVE` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_DIRECCION` (`ID_DIRECCION`),
  CONSTRAINT `POAS_DEPARTAMENTOS_ibfk_1` FOREIGN KEY (`ID_DIRECCION`) REFERENCES `POAS_DIRECCIONES` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POAS_DEPARTAMENTOS`
--

LOCK TABLES `POAS_DEPARTAMENTOS` WRITE;
/*!40000 ALTER TABLE `POAS_DEPARTAMENTOS` DISABLE KEYS */;
INSERT INTO `POAS_DEPARTAMENTOS` VALUES (1,'DIRECCION DE GESTION CALIDAD',1,'RE2'),(2,'JEFATURA DE TALENTO HUMANO',1,'RE4'),(3,'DIRECCION DE FINANZAS',2,'CG1'),(4,'DIRECCION DE CONTABILIDAD',2,'CG2'),(5,'JEFATURA DE ADQUISICIONES DE BIENES Y SERVICIOS',2,'CG3'),(6,'FACULTAD DE CIENCIAS DE LA SALUD',4,'VA1'),(7,'VICERRECTORIA OPERATIVA',3,'VO1'),(8,'SECRETARIA PARTICULAR',1,'RE1'),(9,'OFICINA JURIDICA',1,'RE5'),(10,'JEFATURA DE TALENTO HUMANO (capacitacion)',1,'RE4'),(11,'FACULTAD DE CIENCIAS EXACTAS Y CAMPUS VIRTUAL',4,'VA2'),(12,'FACULTAD DE CIENCIAS SOCIALES Y ADMINISTRATIVAS',4,'VA3'),(13,'FACULTAD DE CIENCIAS DE LA COMUNICACION, NEGOCIOS, ARTES Y HUMANIDADES',4,'VA4'),(14,'DIRECCION DE PLANEACION, ARTICULACION Y VINCULACION INSTITUCIONAL',4,'VA5'),(15,'DIRECCION DE POSGRADOS',4,'VA6'),(16,'DIRECCION DE INVESTIGACION Y EMPRENDIMIENTO',4,'VA7'),(17,'DIRECCION DE BACHILLERATO',4,'VA8'),(18,'COORDINACION DE CENTRO DE LENGUAS EXTRANJERAS',4,'VA9'),(19,'COORDINACION DE PROMOCION DEPORTIVA',4,'VA10'),(20,'COORDINACION DE COOPERACION ACADEMICA',4,'VA11'),(21,'COORDINACION DE EXTENSION Y DIFUSION CULTURAL',4,'VA12'),(22,'EVALUACION DEL APRENDIZAJE ESTUDIANTIL',4,'VA13'),(23,'BIBLIOTECA',4,'VA14'),(24,'COORDINACION DE PSICOPEDAGOGIA',4,'VA15'),(25,'DIRECCION DE SERVICIOS ESTUDIANTILES',4,'VA16'),(26,'SERVICIOS PEDAGOGICOS',4,'VA17'),(27,'DIRECCION DE ADMISIONES',3,'VO2'),(28,'JEFATURA DE COMUNICACION SOCIAL',3,'VO3'),(29,'DIRECCION DE SERVICIOS ESCOLARES',3,'VO4'),(30,'COORDINACION DE BECAS Y EXTRACURRICULAR',3,'VO5'),(31,'JEFATURA DE RECURSOS MATERIALES Y SERVICIOS',3,'VO6'),(32,'COORDINACION DE SISTEMAS, REDES Y DESARROLLO TECNOLOGICO',3,'VO7');
/*!40000 ALTER TABLE `POAS_DEPARTAMENTOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POAS_DIRECCIONES`
--

DROP TABLE IF EXISTS `POAS_DIRECCIONES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `POAS_DIRECCIONES` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(255) NOT NULL,
  `CLAVE` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `POAS_EJERECTOR` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `DESCRIPCION` varchar(2000) DEFAULT NULL,
  `CLAVE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `POAS_LINEASACCION` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `DESCRIPCION` varchar(2000) DEFAULT NULL,
  `CLAVE` varchar(255) DEFAULT NULL,
  `ID_EJE_RECTOR` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_EJE_RECTOR` (`ID_EJE_RECTOR`),
  CONSTRAINT `POAS_LINEASACCION_ibfk_1` FOREIGN KEY (`ID_EJE_RECTOR`) REFERENCES `POAS_EJERECTOR` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POAS_LINEASACCION`
--

LOCK TABLES `POAS_LINEASACCION` WRITE;
/*!40000 ALTER TABLE `POAS_LINEASACCION` DISABLE KEYS */;
INSERT INTO `POAS_LINEASACCION` VALUES (1,'LINEA DE ACCION 1','Revisión, mejoramiento y creación de procesos administrativos, para su sistematización e implementación institucional, con la finalidad de brindar servicios óptimos a la comunidad universitaria.','VI-LA1',6),(2,'LINEA DE ACCION 2','Programa de inversión, renovación y mantenimiento del activo fijo.','VI-LA2',6),(3,'LINEA DE ACCION 3','Desarrollo del personal administrativo.','VI-LA3',6),(4,'LINEA DE ACCION 1','Implementación de un modelo educativo innovador con soporte en la tecnología, que favorezca el desarrollo cognitivo e integral de los estudiantes.','I-LA1',1),(5,'LINEA DE ACCION 2','Programas académicos innovadores con calidad y pertinencia.','I-LA2',1),(6,'LINEA DE ACCION 1','Fomento de la investigación en los docentes de todos los niveles educativos.','II-LA1',2),(7,'LINEA DE ACCION 2','Fomento de la investigación en los estudiantes de todos los niveles educativos.','II-LA2',2),(8,'LINEA DE ACCION 3','Consolidación de la producción científica.','II-LA3',2),(9,'LINEA DE ACCION 4','Protección de los derechos de autor, propiedad intelectual, industrial y registro de patentes de investigaciones o proyectos de creaciones tecnológicas.','II-LA4',2),(10,'LINEA DE ACCION 1','El estudiante al centro de los procesos formativos.','III-LA1',3),(11,'LINEA DE ACCION 2','Seguimiento y consolidación de los estudiantes.','III-LA2',3),(12,'LINEA DE ACCION 3','Educación flexible y digital para el aprendizaje.','III-LA3',3),(13,'LINEA DE ACCION 4','Perfil de Egreso con aprendizaje experiencial.','III-LA4',3),(14,'LINEA DE ACCION 1','Aplicar la Detección de Necesidades de Capacitación (DNC) a la planta docente, previo establecimiento de la metodología específica para docencia.','IV-LA1',4),(15,'LINEA DE ACCION 2','Determinar las bases para la conformación de los cuerpos colegiados o cuerpos académicos y la constitución de los mismos por nivel y área del conocimiento.','IV-LA2',4),(16,'LINEA DE ACCION 3','Inducir a la planta docente de manera uniforme sobre los ejes de la formación docente y facilitar programas de formación/capacitación.','IV-LA3',4),(17,'LINEA DE ACCION 4','Consolidar el programa de tutorías, mediante el rediseño del programa integral de tutorías.','IV-LA4',4),(18,'LINEA DE ACCION 5','Consolidar el programa de evaluación docente.','IV-LA5',4),(19,'LINEA DE ACCION 6','Estimular mediante mecanismos de salario emocional al personal académico mejor evaluado.','IV-LA6',4),(20,'LINEA DE ACCION 7','Diseñar y operar el plan de trabajo institucional de docencia para los Docentes de Tiempo Completo.','IV-LA7',4),(21,'LINEA DE ACCION 8','Diseñar el programa de estímulos al desempeño de la práctica docente, en relación al proceso de formación continua, implicándose la promoción horizontal del personal docente.','IV-LA8',4),(22,'LINEA DE ACCION 1','Vinculación con los sectores público, particular y sociedad civil.','V-LA1',5),(23,'LINEA DE ACCION 2','Internacionalización del Conocimiento.','V-LA2',5),(24,'LINEA DE ACCION 3','Gestión del Seguimiento a los Egresados.','V-LA3',5),(25,'LINEA DE ACCION 4','Creación de oportunidades de empleabilidad.','V-LA4',5),(26,'LINEA DE ACCION 5','Educación Continua para la vida y el trabajo.','V-LA5',5),(27,'LINEA DE ACCION 6','Extensión de la Cultura y el Deporte.','V-LA6',5),(28,'LINEA DE ACCION 7','Intercambio y transferencia de experiencias universitarias en los ámbitos social, cultural, deportivo, de investigación e innovación.','V-LA7',5),(29,'LINEA DE ACCION 8','Profesionalización de la formación académica en contextos reales del sector productivo y social.','V-LA8',5),(30,'LINEA DE ACCION 1','Revisión, mejoramiento y creación de procesos administrativos, para su sistematización e implementación institucional, con la finalidad de brindar servicios óptimos a la comunidad universitaria.','VI-LA1',6),(31,'LINEA DE ACCION 2','Programa de inversión, renovación y mantenimiento del activo fijo.','VI-LA2',6),(32,'LINEA DE ACCION 3','Desarrollo del personal administrativo.','VI-LA3',6),(33,'LINEA DE ACCION 4','Calidad y calidez en el servicio.','VI-LA4',6),(34,'LINEA DE ACCION 5','Incremento en la matrícula.','VI-LA5',6),(35,'LINEA DE ACCION 1','Identidad Institucional.','VII-LA1',7),(36,'LINEA DE ACCION 2','Comunidad Estudiantil Integral.','VII-LA2',7),(37,'LINEA DE ACCION 3','Estilos de vida saludable, cuidado de la salud física, mental y social.','VII-LA3',7),(38,'LINEA DE ACCION 4','Cuidado del medio ambiente y responsabilidad social.','VII-LA4',7);
/*!40000 ALTER TABLE `POAS_LINEASACCION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POAS_NIVELES`
--

DROP TABLE IF EXISTS `POAS_NIVELES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `POAS_NIVELES` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NIVEL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `POAS_POAS` (
  `FOLIO` int(11) NOT NULL AUTO_INCREMENT,
  `FECHA_ELABORACION` date NOT NULL,
  `EJERCICIO_FISCAL` varchar(255) NOT NULL,
  `DESCRIPCION` text NOT NULL,
  `FECHA_INICIO` date NOT NULL,
  `FECHA_TERMINO` date NOT NULL,
  `ID_AREA` int(11) NOT NULL,
  `TIPO_GASTO` varchar(255) NOT NULL,
  `ID_PDI_PROYECTOMETA` int(11) DEFAULT NULL,
  `OBSERVACIONES` text,
  `AUTOR` int(11) NOT NULL,
  `NOTA` text,
  PRIMARY KEY (`FOLIO`),
  KEY `ID_PDI_PROYECTOMETA` (`ID_PDI_PROYECTOMETA`),
  KEY `ID_AREA` (`ID_AREA`),
  CONSTRAINT `POAS_POAS_ibfk_1` FOREIGN KEY (`ID_PDI_PROYECTOMETA`) REFERENCES `POAS_PROYECTOMETA` (`ID`),
  CONSTRAINT `POAS_POAS_ibfk_2` FOREIGN KEY (`ID_AREA`) REFERENCES `POAS_SECCIONES` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POAS_POAS`
--

LOCK TABLES `POAS_POAS` WRITE;
/*!40000 ALTER TABLE `POAS_POAS` DISABLE KEYS */;
INSERT INTO `POAS_POAS` VALUES (1,'2025-02-14','2026','Optimización de recursos administrativos institucionales','2026-02-14','2026-02-14',1,'ESTRATEGICO',4,'Proyecto centrado en fortalecer la gestión interna.',1,''),(2,'2025-03-12','2026','Implementación de mejoras tecnológicas y académicas','2025-03-04','2025-03-28',1,'ESTRATEGICO',3,'Aumentar el rendimiento de servicios y plataformas.',1,''),(3,'2025-03-12','2026','Fortalecimiento de procesos administrativos clave','2025-03-04','2025-03-28',1,'ESTRATEGICO',3,'Optimizar tiempos y costos en tareas recurrentes.',1,''),(4,'2025-03-12','2026','Renovación de infraestructura institucional esencial','2025-03-04','2025-03-28',1,'ESTRATEGICO',3,'Modernización física y tecnológica en áreas clave.',1,''),(5,'2025-03-12','2026','Capacitación continua y desarrollo profesional','2025-03-04','2025-03-28',2,'ESTRATEGICO',3,'Potenciar las habilidades del personal operativo.',1,''),(6,'2025-03-12','2026','Mejoramiento del entorno universitario','2025-03-04','2025-03-28',1,'ESTRATEGICO',1,'Espacios funcionales y agradables para estudiantes.',1,''),(7,'2025-04-01','2026','sdasdasdaa','2025-04-01','2025-04-17',1,'estrategico',6,'este es un nuevo test',1,NULL),(20,'2025-04-08','2026','sadadsdfhjufcbhb hj nf sdjad j','2025-04-04','2025-04-18',2,'estrategico',6,'Alberto Cancelaaaaa',1,NULL),(21,'2025-04-02','2026','sadasdasasdasd','2025-04-08','2025-04-24',1,'corriente',5,'este es un poa de ejemplo por lo que no debe tomarse como uno real.',1,NULL);
/*!40000 ALTER TABLE `POAS_POAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POAS_PROYECTOMETA`
--

DROP TABLE IF EXISTS `POAS_PROYECTOMETA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `POAS_PROYECTOMETA` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `DESCRIPCION` varchar(2000) DEFAULT NULL,
  `CLAVE` varchar(255) DEFAULT NULL,
  `ID_LINEAS_ACCION` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_LINEAS_ACCION` (`ID_LINEAS_ACCION`),
  CONSTRAINT `POAS_PROYECTOMETA_ibfk_1` FOREIGN KEY (`ID_LINEAS_ACCION`) REFERENCES `POAS_LINEASACCION` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POAS_PROYECTOMETA`
--

LOCK TABLES `POAS_PROYECTOMETA` WRITE;
/*!40000 ALTER TABLE `POAS_PROYECTOMETA` DISABLE KEYS */;
INSERT INTO `POAS_PROYECTOMETA` VALUES (1,'PROYECTO/META 1.1','Revisar, actualizar y adecuar la normatividad de los procesos administrativos que operan en cada área de la institución.','IV-LA1-PM11',1),(2,'PROYECTO/META 1.2','Realizar reingeniería de procesos administrativos.','IV-LA1-PM12',1),(3,'PROYECTO/META 1.3','Sistematizar procesos y procedimientos administrativos.','IV-LA1-PM13',1),(4,'PROYECTO/META 1.4','Certificación de procesos administrativos.','IV-LA1-PM14',1),(5,'PROYECTO/META 2.1','Establecer un programa de inversión, renovación y mantenimiento del activo fijo, con base a las necesidades de las diferentes áreas y del PDI 2022-2030.','IV-LA1-PM21',2),(6,'PROYECTO/META 2.2','Fortalecer las tecnologías de la información y comunicación, inversión en equipos informáticos, de comunicación y conectividad, adecuados para cubrir las necesidades académicas y administrativas en una “nueva normalidad”.','IV-LA1-PM22',2),(7,'PROYECTO/META 1.1','Elaborar el nuevo Modelo Educativo UH.','I-LA1-PM11',1),(8,'PROYECTO/META 1.2','Asegurar la aplicación del modelo educativo en todos los programas, para garantizar que los estudiantes adquieran los conocimientos, habilidades y valores institucionales para su desarrollo profesional y personal.','I-LA1-PM12',1),(9,'PROYECTO/META 1.3','Asegurar la capacitación docente, alumnos y personal académico-administrativo en lo que respecta al proceso de enseñanza-aprendizaje-evaluación de acuerdo al modelo educativo.','I-LA1-PM13',1),(10,'PROYECTO/META 2.1.1','Formar un programa institucional para la evaluación, actualización, del plan y programa de bachillerato acordes al avance científico y tecnológico y a las necesidades del entorno.','I-LA2-PM211',2),(11,'PROYECTO/META 2.2.2','Crear un programa integral de apoyo que favorezca el proceso de aprendizaje y contribuya a reducir la deserción y rezago escolar, a través del uso de materiales en línea novedosos e innovadores (TIC, TAC Y TEP), a través de un Sistema Institucional de Tutoría y asesorías.','I-LA2-PM212',2),(12,'PROYECTO/META 2.1.3','Impulsar una estrategia que vincule a la comunidad de estudiantes y académicos con los diferentes programas académicos de nivel licenciatura de la UH, articulando el perfil de egreso del bachillerato con los perfiles de ingreso de las licenciaturas.','I-LA2-PM213',5),(13,'PROYECTO/META 2.1.4','Crear los estudios técnicos especializados.','I-LA2-PM214',5),(14,'PROYECTO/META 2.1.5','Impulsar la iniciación temprana en la investigación en los estudiantes con actividades y programas específicos como veranos de investigación.','I-LA2-PM215',5),(15,'PROYECTO/META 2.1.6','Ofrecer cursos para la formación disciplinar docente.','I-LA2-PM216',5),(16,'PROYECTO/META 2.2.1','Formar un programa institucional para la evaluación, actualización, acreditación, cierre y apertura de nuevos programas académicos, para asegurar la calidad y actualización de los programas educativos en los cuales se desarrolle el pensamiento crítico, análisis y resolución de problemas, autogestión y uso y desarrollo de nuevas tecnologías digitales, acordes a las necesidades del entorno laboral.','I-LA2-PM221',5),(17,'PROYECTO/META 2.2.2','Crear las condiciones necesarias para lograr y/o conservar el reconocimiento de calidad de todos los programas educativos ofertados en los diferentes niveles, a través de la evaluación de organismos externos: Organismos Acreditadores (OA) establecido por el COPAES: COMAEM, AMFEM, CONAEDO, etc. Los Comités Interinstitucionales para la Evaluación de la Educación Superior A. C. (CIEES), y el Programa Nacional de Posgrado de Calidad (PNPC, Conacyt).','I-LA2-PM222',5),(18,'PROYECTO/META 2.2.3','Aperturar programas flexibles que den a los alumnos la oportunidad para avanzar en trayectorias escolares personalizadas de acuerdo con sus fortalezas, intereses y tiempo disponible.','I-LA2-PM223',5),(19,'PROYECTO/META 2.2.4','Ampliar el desarrollo y uso de tecnologías de la información (TIC, TAC Y TEP) para mejorar los procesos de enseñanza-aprendizaje y ofrecer nuevas modalidades educativas.','I-LA2-PM224',5),(20,'PROYECTO/META 2.2.5','Crear los Estudios Técnicos Profesionales en las licenciaturas con mayor vinculación a los sectores productivos de nuestra entidad.','I-LA2-PM225',5),(21,'PROYECTO/META 2.2.6','Crear un modelo de educación continua que permita seguir acompañando a los egresados en un proceso de formación constante para su desarrollo profesional, en modalidad virtual, vinculados con las necesidades de los sectores productivos, del sector público y del sector social.','I-LA2-PM226',5),(22,'PROYECTO/META 1.1','Evaluar y actualizar las asignaturas de investigación y/o de emprendimiento.','II-LA1-PM11',6),(23,'PROYECTO/META 1.2','Capacitar a los docentes y del comité de investigación y/o emprendimiento para garantizar la viabilidad de los procesos de enseñanza y proyectos asesorados.','II-LA1-PM12',6),(24,'PROYECTO/META 1.3','Generar reconocimiento científico estatal y nacional.','II-LA1-PM13',6),(25,'PROYECTO/META 1.4','Consolidar grupos de trabajo inter y multidisciplinarios con base en Líneas de Generación y Aplicación de Conocimiento (LGAC) que aporten a la resolución de problemas sociales y ambientales.','II-LA1-PM14',6),(26,'PROYECTO/META 1.5','Incorporar las actividades de investigación e innovación como indicadores del estímulo académico para todos los docentes.','II-LA1-PM15',6),(27,'PROYECTO/META 2.1','Impulsar el desarrollo tecnológico a través de la aplicación del conocimiento.','II-LA2-PM21',7),(28,'PROYECTO/META 2.2','Impulsar la iniciación temprana en la investigación en los estudiantes con actividades y programas específicos como veranos de investigación.','II-LA2-PM22',7),(29,'PROYECTO/META 2.3','Promover la formación de jóvenes investigadores a través del fortalecimiento de las actividades y los programas de apoyo a la investigación.','II-LA2-PM23',7),(30,'PROYECTO/META 2.4','Monitorear o regular los productos generados de las materias de investigación y emprendimiento.','II-LA2-PM24',7),(31,'PROYECTO/META 3.1','Crear un Fondo que sufrague la investigación interna y externa, así como la divulgación nacional e internacional.','II-LA3-PM31',8),(32,'PROYECTO/META 4.1','Actualizar y difundir la normatividad del registro de proyectos e ideas innovadoras.','II-LA4-PM41',9),(33,'PROYECTO/META 4.2','Generar expertos en desarrollo y transferencia de tecnología, propiedad intelectual y patentes, para propiciar el traslado del desarrollo del personal académico al sector productivo.','II-LA4-PM42',9),(34,'PROYECTO/META 4.3','Desarrollo de proyectos innovadores academia-industria con impacto social y ambiental.','II-LA4-PM43',9),(35,'PROYECTO/META 1.1','Fortalecer el proceso de enseñanza-aprendizaje del estudiante.','III-LA1-PM11',10),(36,'PROYECTO/META 2.1','Desarrollar un Programa para el seguimiento de las trayectorias escolares.','III-LA2-PM21',11),(37,'PROYECTO/META 2.2','Impulsar el Apoyo a la Titulación.','III-LA2-PM22',11),(38,'PROYECTO/META 3.1','Implementar herramientas tecnológicas en los programas académicos.','III-LA3-PM31',12),(39,'PROYECTO/META 4.1','Desarrollar e implementar estrategias de aprendizaje experiencial para fortalecer y asegurar el cumplimiento del perfil de egreso de los estudiantes.','III-LA4-PM41',13),(40,'PROYECTO/META 1.1','Diseñar, aplicar y consolidar una metodología institucional de Diagnóstico de Necesidades de Capacitación, específica para docentes de asignatura, de tiempo parcial, completo, y docente investigador.','IV-LA1-PM11',14),(41,'PROYECTO/META 1.2','Capacitar de acuerdo a las necesidades de cada docente y/o colaborador.','IV-LA1-PM12',14),(42,'PROYECTO/META 1.3','Conformar y consolidar un equipo de docentes y personal administrativo de la Universidad Hipócrates, como capacitador institucional.','IV-LA1-PM13',14),(43,'PROYECTO/META 2.1','Revisar y actualizar anualmente el reglamento en el que se encuentren los lineamientos para la conformación de las academias y cuerpos colegiados.','IV-LA2-PM21',15),(44,'PROYECTO/META 2.2','Conformar por programa académico los cuerpos académicos de acuerdo a los lineamientos e involucrar en su integración al director/coordinador, DTC, DTP, DI y docente de asignatura, según corresponda.','IV-LA2-PM22',15),(45,'PROYECTO/META 3.1','Generar en los docentes una cultura de la formación integral y continua de la práctica docente.','IV-LA3-PM31',16),(46,'PROYECTO/META 3.2','Diseñar y desarrollar un programa integral de formación continua.','IV-LA3-PM32',16),(47,'PROYECTO/META 4.1','Revisar y actualizar el programa integral de tutorías.','IV-LA4-PM41',17),(48,'PROYECTO/META 5.1','Revisar y actualizar el proceso e instrumentos para la evaluación docente.','IV-LA5-PM51',18),(49,'PROYECTO/META 6.1','Revisar y actualizar el programa de estímulos y recompensas.','IV-LA6-PM61',19),(50,'PROYECTO/META 7.1','Diseñar el plan de trabajo institucional para los Docentes de Tiempo Completo, que contenga las dimensiones de docencia, investigación, tutoría y asesoramiento de tesis u otros productos académicos para la titulación.','IV-LA7-PM71',20),(51,'PROYECTO/META 7.2','Arraigar en los Docentes de Tiempo Completo, su identidad con las funciones de docencia, investigación, tutoría y asesoramiento de tesis u otros productos académicos para la titulación.','IV-LA7-PM72',20),(52,'PROYECTO/META 7.3','Consolidar institucionalmente el plan de trabajo de los Docentes de Tiempo Completo.','IV-LA7-PM73',20),(53,'PROYECTO/META 8.1','Integrar el Programa de Estímulos al Desempeño Docente, la promoción horizontal del personal docente.','IV-LA8-PM81',21),(54,'PROYECTO/META 1.1','Fortalecer los convenios de colaboración locales, regionales y nacionales para que impacten positivamente en los diversos sectores de la sociedad.','V-LA1-PM11',22),(55,'PROYECTO/META 1.2','Incrementar la presencia institucional en el ámbito nacional a través de la implementación de estrategias de cooperación académica.','V-LA1-PM12',22),(56,'PROYECTO/META 1.3','Crear alianzas con los distintos sectores de la sociedad para colaborar en proyectos orientados al desarrollo sostenible y la equidad de género.','V-LA1-PM13',22),(57,'PROYECTO/META 1.4','Incorporarse y mantener la vinculación institucional con asociaciones civiles u organizaciones independientes relacionadas con la educación superior.','V-LA1-PM14',22),(58,'PROYECTO/META 2.1','Incrementar la cooperación académica internacional.','V-LA2-PM21',23),(59,'PROYECTO/META 2.2','Incorporar la internacionalización en las estrategias didácticas.','V-LA2-PM22',23),(60,'PROYECTO/META 2.3','Generar alianzas con redes u organismos internacionales para colaborar en proyectos académicos.','V-LA2-PM23',23),(61,'PROYECTO/META 3.1','Institucionalizar la relación universidad-egresados.','V-LA3-PM31',24),(62,'PROYECTO/META 3.2','Fortalecer los estudios de seguimiento a egresados para contribuir al diseño y desarrollo de programas de estudios innovadores.','V-LA3-PM32',24),(63,'PROYECTO/META 4.1','Fortalecer el modelo de desarrollo de competencias de empleabilidad.','V-LA4-PM41',25),(64,'PROYECTO/META 5.1','Diseñar e implementar un modelo de formación continua para potenciar el desarrollo profesional de las personas.','V-LA5-PM51',26),(65,'PROYECTO/META 6.1','Promover el acercamiento y participación de la comunidad universitaria en las diferentes expresiones de las artes, la cultura y el deporte universitario.','V-LA6-PM61',27),(66,'PROYECTO/META 6.2','Diseñar y ejecutar un programa de actividades culturales, deportivas y artísticas.','V-LA6-PM62',27),(67,'PROYECTO/META 6.3','Fomentar la presencia y preservación de las tradiciones y la cultura en el ámbito local y regional.','V-LA6-PM63',27),(68,'PROYECTO/META 7.1','Incrementar la cooperación con el sector público y organizaciones de la sociedad civil para el desarrollo y promoción de una oferta cultural y deportiva compartida.','V-LA7-PM71',28),(69,'PROYECTO/META 7.2','Impulsar el intercambio de experiencias en los ámbitos de la investigación y la innovación mediante el acercamiento con otras instituciones de educación superior, el sector productivo y organizaciones diversas.','V-LA7-PM72',28),(70,'PROYECTO/META 7.3','Mantener y fortalecer la generación de publicaciones editoriales y contenidos audiovisuales propios, para difundir el quehacer institucional.','V-LA7-PM73',28),(71,'PROYECTO/META 8.1','Mejorar el desempeño del proceso institucional para la prestación de las prácticas profesionales y el servicio social.','V-LA8-PM81',29),(72,'PROYECTO/META 8.2','Mantener y fortalecer la orientación de la prestación de las prácticas profesionales y el servicio social hacia el logro del perfil de egreso.','V-LA8-PM82',29),(73,'PROYECTO/META 8.3','Generar la participación del sector empresarial en actividades académicas como visitas, seminarios y conferencias.','V-LA8-PM83',29),(74,'PROYECTO/META 1.1','Revisar, actualizar y adecuar la normatividad de los procesos administrativos que operan en cada área de la institución.','VI-LA1-PM11',30),(75,'PROYECTO/META 1.2','Realizar reingeniería de procesos administrativos.','VI-LA1-PM12',30),(76,'PROYECTO/META 1.3','Sistematizar procesos y procedimientos administrativos.','VI-LA1-PM13',30),(77,'PROYECTO/META 1.4','Certificación de procesos administrativos.','VI-LA1-PM14',30),(78,'PROYECTO/META 2.1','Establecer un programa de inversión, renovación y mantenimiento del activo fijo, con base a las necesidades de las diferentes áreas y del PDI 2022-2030.','VI-LA2-PM21',31),(79,'PROYECTO/META 2.2','Fortalecer las tecnologías de la información y comunicación, inversión en equipos informáticos, comunicación y conectividad, adecuados para cubrir las necesidades académicas y administrativas en una \"nueva normalidad\".','VI-LA2-PM22',31),(80,'PROYECTO/META 3.1','Fortalecer el Plan de Desarrollo del Personal Administrativo.','VI-LA3-PM31',32),(81,'PROYECTO/META 3.2','Mejorar la comunicación institucional interna.','VI-LA3-PM32',32),(82,'PROYECTO/META 4.1','Evaluar la calidad y calidez de los servicios en las áreas académicas y administrativas.','VI-LA4-PM41',33),(83,'PROYECTO/META 4.2','Capacitación del personal administrativo y académico.','VI-LA4-PM42',33),(84,'PROYECTO/META 5.1','Crear un modelo de prospección.','VI-LA5-PM51',34),(85,'PROYECTO/META 5.2','Contratar personal con perfil idóneo para el área de admisiones.','VI-LA5-PM52',34),(86,'PROYECTO/META 5.3','Capacitación permanente a los asesores de admisiones.','VI-LA5-PM53',34),(87,'PROYECTO/META 5.4','Evaluar y rediseñar las campañas publicitarias.','VI-LA5-PM54',34),(88,'PROYECTO/META 1.1','Impulsar el sentido de pertenencia en la comunidad universitaria, elevando el espíritu de integración, ética y cultura, que respondan a los valores y principios institucionales.','VII-LA1-PM11',35),(89,'PROYECTO/META 1.2','Generar espacios donde los estudiantes expresen su pensamiento y actividades de la vida universitaria apegadas a la filosofía institucional.','VII-LA1-PM12',35),(90,'PROYECTO/META 2.1','Incluir actividades relacionadas con temas de la igualdad de género que impacten en la sociedad.','VII-LA2-PM21',36),(91,'PROYECTO/META 2.2','Impartir cursos y talleres en temas de integridad social como la equidad de género, derechos humanos, derechos de las personas con discapacidad y la no discriminación.','VII-LA2-PM22',36),(92,'PROYECTO/META 2.3','Generar las políticas necesarias para armonizar todos los instrumentos normativos y protocolos en materia de igualdad de género, no discriminación y una vida libre de violencia.','VII-LA2-PM23',36),(93,'PROYECTO/META 2.4','Impulsar la accesibilidad y el apoyo a las personas con discapacidad, mediante la implementación de medidas y programas en los ámbitos académico, de difusión cultural y de administración universitaria.','VII-LA2-PM24',36),(94,'PROYECTO/META 3.1','Desarrollar un programa institucional permanente de salud física, mental y emocional.','VII-LA3-PM31',37),(95,'PROYECTO/META 3.2','Gestionar convenios con institutos deportivos para fomentar la participación de los estudiantes y ofrecer una diversidad de opciones para su desarrollo físico y recreación.','VII-LA3-PM32',37),(96,'PROYECTO/META 4.1','Atender iniciativas nacionales e internacionales en temas de mejoramiento del medio ambiente y responsabilidad social para promover acciones al interior de la Universidad.','VII-LA4-PM41',38),(97,'PROYECTO/META 4.2','Diseñar políticas institucionales orientadas a lograr una Universidad sustentable para el cuidado del medio ambiente.','VII-LA4-PM42',38);
/*!40000 ALTER TABLE `POAS_PROYECTOMETA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POAS_RESPONSABLES`
--

DROP TABLE IF EXISTS `POAS_RESPONSABLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `POAS_RESPONSABLES` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_CONCEPTO` int(11) NOT NULL,
  `ID_USUARIO` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_CONCEPTO` (`ID_CONCEPTO`),
  KEY `ID_USUARIO` (`ID_USUARIO`),
  CONSTRAINT `POAS_RESPONSABLES_ibfk_1` FOREIGN KEY (`ID_CONCEPTO`) REFERENCES `POAS_CONCEPTOACTIVIDAD` (`ID`),
  CONSTRAINT `POAS_RESPONSABLES_ibfk_2` FOREIGN KEY (`ID_USUARIO`) REFERENCES `POAS_USUARIOS` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `POAS_SECCIONES` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(255) NOT NULL,
  `ID_DEPARTAMENTO` int(11) NOT NULL,
  `CLAVE` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_DEPARTAMENTO` (`ID_DEPARTAMENTO`),
  CONSTRAINT `POAS_SECCIONES_ibfk_1` FOREIGN KEY (`ID_DEPARTAMENTO`) REFERENCES `POAS_DEPARTAMENTOS` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POAS_SECCIONES`
--

LOCK TABLES `POAS_SECCIONES` WRITE;
/*!40000 ALTER TABLE `POAS_SECCIONES` DISABLE KEYS */;
INSERT INTO `POAS_SECCIONES` VALUES (1,'DIRECCION DE GESTION DE CALIDAD',1,'RE2.1'),(2,'TALENTO HUMANO',2,'RE3.1'),(3,'JEFATURA TALENTO HUMANO (capacitacion)',10,'RE4.1'),(4,'SECRETARIA PARTICULAR RECTORIA',8,'RE1.1'),(5,'OFICINA JURIDICA',9,'RE5.1'),(6,'DIRECCION DE FINANZAS',3,'CG1.1'),(7,'DIRECCION DE CONTABILIDAD',4,'CG2.1'),(8,'JEFATURA DE ADQUISICIONES DE BIENES Y SERVICIOS',5,'CG3.1'),(9,'FACULTAD DE CIENCIAS DE LA SALUD',6,'VA1.1'),(10,'FACULTAD DE CIENCIAS EXACTAS Y CAMPUS VIRTUAL',11,'VA2.1'),(11,'FACULTAD DE CIENCIAS SOCIALES Y ADMINISTRATIVAS',12,'VA3.1'),(12,'FACULTAD DE CIENCIAS DE LA COMUNICACION, NEGOCIOS, ARTES Y HUMANIDADES',13,'VA4.1'),(13,'DIRECCION DE PLANEACION, ARTICULACION Y VINCULACION INSTITUCIONAL',14,'VA5.1'),(14,'DIRECCION DE INVESTIGACION Y EMPRENDIMIENTO',16,'VA7.1'),(15,'DIRECCION DE POSGRADOS',15,'VA6.1'),(16,'DIRECCION DE BACHILLERATO',17,'VA8.1'),(17,'DIRECCION DE CENTRO DE LENGUAS EXTRANJERAS',17,'VA9.1'),(18,'COORDINACION DE PROMOCION DEPORTIVA',19,'VA10.1'),(19,'AREA DE GIMNASIO',19,'VA10.2'),(20,'COORDINACION DE COOPERACION ACADEMICA',20,'VA11.1'),(21,'COORDINACION DE EXTENSION Y DIFUSION CULTURAL',21,'VA12.1'),(22,'EVALUACION DEL APRENDIZAJE ESTUDIANTIL',22,'VA13.1'),(23,'COORDINACION DE FORMACION DOCENTE',22,'VA13.2'),(24,'COORDINACION DE PSICOPEDAGOGIA',24,'VA15.1'),(25,'DIRECCCION DE SERVICIOS ESTUDIANTILES',25,'VA16.1'),(26,'SERVICIOS PEDAGOGICOS',26,'VA17.1'),(27,'BIBLIOTECA',23,'VA14.1'),(28,'VICERRECTORIA',7,'VO1.1'),(29,'DIRECCION DE ADMISIONES',27,'VO2.1'),(30,'COORDINACION DE BECAS Y EXTRACURRICULAR',28,'VO3.1'),(31,'DIRECCION DE SERVICIOS ESCOLARES',29,'VO4.1'),(32,'COORDINACION DE BECAS Y EXTRACURRICULAR',30,'VO5.1'),(33,'JEFATURA DE RECURSOS MATERIALES',31,'VO6.1'),(34,'COORDINACION DE SISTEMAS, REDES Y DESARROLLO TECNOLOGICO',32,'VO7.1');
/*!40000 ALTER TABLE `POAS_SECCIONES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POAS_UNIDADES`
--

DROP TABLE IF EXISTS `POAS_UNIDADES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `POAS_UNIDADES` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `DESCRIPCION` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POAS_UNIDADES`
--

LOCK TABLES `POAS_UNIDADES` WRITE;
/*!40000 ALTER TABLE `POAS_UNIDADES` DISABLE KEYS */;
INSERT INTO `POAS_UNIDADES` VALUES (1,'SERVICIOS','descripcion'),(2,'NOCHES','descripcion'),(3,'PIEZAS','descripcion'),(4,'ALIMENTOS','descripcion'),(5,'Pieza','Unidad individual utilizada en inventarios o procesos productivos.'),(6,'Elemento','Parte específica de un conjunto o sistema más grande.'),(7,'Unidad de servicio','Cantidad estandarizada de un servicio ofrecido.'),(8,'Actividad','Acción o proceso registrado dentro del POA.'),(9,'Kilogramo','Unidad de peso utilizada en medición de materiales.'),(10,'Trabajo','Tarea o esfuerzo requerido para alcanzar un objetivo.'),(11,'Tarifa','Valor unitario definido para un servicio o producto.'),(12,'Metro','Medida estándar de longitud para cálculos espaciales.'),(13,'Paquete a granel','Conjunto de productos comercializados sin empaque individual.'),(14,'Caja base','Contenedor estándar utilizado para embalaje y distribución.'),(15,'KIT','Conjunto de piezas organizadas para un propósito específico.'),(16,'Conjunto','Agrupación de elementos con una función en común.'),(17,'Litro','Unidad de volumen utilizada para líquidos y sustancias líquidas.'),(18,'Caja','Estructura de almacenamiento utilizada para contener productos.'),(19,'Mes','Unidad de tiempo utilizada para la planificación mensual.'),(20,'Hora','Medida de tiempo comúnmente usada en planificación.'),(21,'Metro Cuadrado','Unidad de superficie utilizada en construcción y planificación.'),(22,'Equipos','Conjunto de herramientas o dispositivos necesarios para una actividad.'),(23,'Miligramo','Unidad de masa utilizada para pequeñas cantidades de materiales.'),(24,'Paquete','Agrupación de productos con embalaje unificado.'),(26,'Variedad','Diferentes presentaciones de un mismo producto o servicio.'),(27,'Gramo','Unidad de peso estándar utilizada en medición de materiales.'),(28,'Par','Dos unidades agrupadas bajo una misma referencia.'),(29,'Docenas de piezas','Conjunto de 12 unidades agrupadas.'),(30,'Unidad','Medida mínima de conteo utilizada en inventarios.'),(31,'Día','Unidad de tiempo fundamental en la planificación.'),(32,'Lote','Grupo de productos fabricados o procesados juntos.'),(33,'Grupos','Conjunto de elementos organizados bajo un mismo propósito.'),(34,'Mililitro','Unidad de volumen usada en medición de líquidos.'),(35,'Viaje','Desplazamiento realizado en un medio de transporte.');
/*!40000 ALTER TABLE `POAS_UNIDADES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POAS_USUARIOS`
--

DROP TABLE IF EXISTS `POAS_USUARIOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `POAS_USUARIOS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(255) NOT NULL,
  `USUARIO` varchar(255) NOT NULL,
  `ID_NIVEL` int(11) NOT NULL,
  `PERMISOS_EXTRA` text,
  `CORREO` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_NIVEL` (`ID_NIVEL`),
  CONSTRAINT `POAS_USUARIOS_ibfk_1` FOREIGN KEY (`ID_NIVEL`) REFERENCES `POAS_NIVELES` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
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

-- Dump completed on 2025-04-12  6:10:38
