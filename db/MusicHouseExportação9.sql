-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: musichouse
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `caixas`
--


drop database if exists `musicHouse`;
CREATE DATABASE IF NOT EXISTS `musicHouse`;
USE `musicHouse`;

DROP TABLE IF EXISTS `caixas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caixas` (
  `id_sessao_caixa` int(11) NOT NULL AUTO_INCREMENT,
  `id_franquia` int(11) NOT NULL,
  `id_funcionario` int(11) NOT NULL,
  `status` enum('aberto','fechado') NOT NULL DEFAULT 'aberto',
  `data_abertura` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_fechamento` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_sessao_caixa`),
  KEY `fk_caixa_franquia` (`id_franquia`),
  KEY `fk_caixa_func` (`id_funcionario`),
  CONSTRAINT `fk_caixa_franquia` FOREIGN KEY (`id_franquia`) REFERENCES `franquias` (`id_franquia`),
  CONSTRAINT `fk_caixa_func` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_registro`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caixas`
--

LOCK TABLES `caixas` WRITE;
/*!40000 ALTER TABLE `caixas` DISABLE KEYS */;
INSERT INTO `caixas` VALUES (1,2,3,'fechado','2025-12-09 20:06:17','2025-12-09 20:06:27'),(2,2,3,'fechado','2025-12-09 20:22:20','2025-12-09 20:25:05');
/*!40000 ALTER TABLE `caixas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `descricao` varchar(300) NOT NULL,
  `icone` text NOT NULL,
  `iconeSite` text NOT NULL,
  PRIMARY KEY (`id_categoria`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Cordas','Toque que emociona.','iconCordas.png','Guitar'),(2,'Percussão','Ritmo que pulsa.','iconPercussao.png','Drum'),(3,'Teclas','Na pontas dos dedos.','iconTeclas.png','Piano'),(4,'Sopro','Som que vem do fôlego.','iconSopro.png','AudioLines'),(5,'Foles','Som do ar em movimento.','iconFoles.png','Wind'),(6,'Áudio','Clareza em cada nota.','iconAudio.png','Speaker'),(7,'Acessórios','O apoio do seu som.','iconAcessorio.png','Plug');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chamados`
--

DROP TABLE IF EXISTS `chamados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chamados` (
  `id_chamado` int(11) NOT NULL AUTO_INCREMENT,
  `id_franquia` int(11) NOT NULL,
  `id_funcionario` int(11) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `descricao` text NOT NULL,
  `categoria` enum('Sistema','Financeiro','Produto','Estoque','Venda','Funcionário','Outros') NOT NULL,
  `prioridade` enum('Baixa','Média','Alta','Crítica') NOT NULL DEFAULT 'Média',
  `status` enum('Aberto','Em andamento','Aguardando resposta','Resolvido','Cancelado') NOT NULL DEFAULT 'Aberto',
  `data_abertura` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_atualizacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_chamado`),
  KEY `fk_chamado_franquia` (`id_franquia`),
  KEY `fk_chamado_func` (`id_funcionario`),
  CONSTRAINT `fk_chamado_franquia` FOREIGN KEY (`id_franquia`) REFERENCES `franquias` (`id_franquia`),
  CONSTRAINT `fk_chamado_func` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_registro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chamados`
--

LOCK TABLES `chamados` WRITE;
/*!40000 ALTER TABLE `chamados` DISABLE KEYS */;
/*!40000 ALTER TABLE `chamados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome_completo` varchar(300) NOT NULL,
  `cpf` char(11) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `status` enum('Ativo','Inativo') NOT NULL DEFAULT 'Ativo',
  `data_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `cpf` (`cpf`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credenciais`
--

DROP TABLE IF EXISTS `credenciais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credenciais` (
  `id_credenciais` int(11) NOT NULL AUTO_INCREMENT,
  `cargo` varchar(150) NOT NULL,
  `descricao` varchar(150) NOT NULL,
  `salario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_credenciais`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credenciais`
--

LOCK TABLES `credenciais` WRITE;
/*!40000 ALTER TABLE `credenciais` DISABLE KEYS */;
INSERT INTO `credenciais` VALUES (1,'Administrador Matriz','Usuário da Matriz com acesso total e controle de todas as filiais.',12000.00),(2,'Gerente de Loja','Usuário responsável por gerenciar uma filial específica.',6000.00),(3,'Caixa','Usuário do PDV responsável por realizar vendas e registrar pagamentos.',2500.00),(4,'Supervisor','Supervisona a loja e abre o catalogo na franquia.',2800.00);
/*!40000 ALTER TABLE `credenciais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cupons`
--

DROP TABLE IF EXISTS `cupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cupons` (
  `id_cupom` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(30) NOT NULL,
  `tipo` enum('percentual','valor_fixo') NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `minimo_compra` decimal(10,2) DEFAULT 0.00,
  `validade` date DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_cupom`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupons`
--

LOCK TABLES `cupons` WRITE;
/*!40000 ALTER TABLE `cupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `cupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `despesas`
--

DROP TABLE IF EXISTS `despesas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `despesas` (
  `id_despesa` int(11) NOT NULL AUTO_INCREMENT,
  `id_franquia` int(11) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `descricao` text NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `data_criacao` date NOT NULL,
  `data_pagamento` date NOT NULL,
  `status` enum('Paga','Pendente','Atrasada') NOT NULL,
  PRIMARY KEY (`id_despesa`),
  KEY `id_franquia` (`id_franquia`),
  CONSTRAINT `despesas_ibfk_1` FOREIGN KEY (`id_franquia`) REFERENCES `franquias` (`id_franquia`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `despesas`
--

LOCK TABLES `despesas` WRITE;
/*!40000 ALTER TABLE `despesas` DISABLE KEYS */;
INSERT INTO `despesas` VALUES (1,2,'Água','Conta de água do mês de dezembro',250.89,'2025-12-09','2025-12-15','Pendente');
/*!40000 ALTER TABLE `despesas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enderecos_cliente`
--

DROP TABLE IF EXISTS `enderecos_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enderecos_cliente` (
  `id_endereco` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `apelido` varchar(60) DEFAULT NULL,
  `logradouro` varchar(150) NOT NULL,
  `numero` varchar(20) DEFAULT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `cidade` varchar(100) NOT NULL,
  `estado` char(2) NOT NULL,
  `cep` varchar(20) NOT NULL,
  `principal` tinyint(1) NOT NULL DEFAULT 0,
  `criada_em` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_endereco`),
  KEY `fk_end_cliente` (`id_cliente`),
  CONSTRAINT `fk_end_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enderecos_cliente`
--

LOCK TABLES `enderecos_cliente` WRITE;
/*!40000 ALTER TABLE `enderecos_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `enderecos_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque` (
  `id_estoque` int(11) NOT NULL AUTO_INCREMENT,
  `id_franquia` int(11) NOT NULL,
  `sku` varchar(6) NOT NULL,
  `quantidade` int(11) NOT NULL DEFAULT 0,
  `aviso` int(11) NOT NULL DEFAULT 10,
  PRIMARY KEY (`id_estoque`),
  KEY `fk_est_franquia` (`id_franquia`),
  CONSTRAINT `fk_est_franquia` FOREIGN KEY (`id_franquia`) REFERENCES `franquias` (`id_franquia`)
) ENGINE=InnoDB AUTO_INCREMENT=355 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (1,2,'134682',49,10),(2,2,'142693',50,10),(3,2,'149872',50,10),(4,2,'152937',50,10),(5,2,'159804',50,10),(6,2,'179632',50,10),(7,2,'184523',50,10),(8,2,'187642',50,10),(9,2,'204718',50,10),(10,2,'231640',50,10),(11,2,'231867',49,10),(12,2,'235781',50,10),(13,2,'245786',50,10),(14,2,'260498',50,10),(15,2,'270319',50,10),(16,2,'278965',50,10),(17,2,'298504',50,10),(18,2,'304987',50,10),(19,2,'305478',50,10),(20,2,'312654',50,10),(21,2,'345971',50,10),(22,2,'362094',50,10),(23,2,'378902',50,10),(24,2,'379826',50,10),(25,2,'405768',50,10),(26,2,'435219',50,10),(27,2,'438915',47,10),(28,2,'481279',50,10),(29,2,'489072',49,10),(30,2,'490175',50,10),(31,2,'493725',50,10),(32,2,'498320',50,10),(33,2,'498731',50,10),(34,2,'512479',50,10),(35,2,'519843',50,10),(36,2,'521394',50,10),(37,2,'528903',50,10),(38,2,'537916',50,10),(39,2,'540128',50,10),(40,2,'562893',50,10),(41,2,'582971',50,10),(42,2,'587420',50,10),(43,2,'604823',50,10),(44,2,'612489',50,10),(45,2,'619845',50,10),(46,2,'619874',50,10),(47,2,'624981',49,10),(48,2,'628354',50,10),(49,2,'658304',50,10),(50,2,'658319',50,10),(51,2,'679124',50,10),(52,2,'689431',50,10),(53,2,'713625',50,10),(54,2,'720158',50,10),(55,2,'739160',50,10),(56,2,'761084',50,10),(57,2,'763201',50,10),(58,2,'763910',50,10),(59,2,'784632',50,10),(60,2,'790246',50,10),(61,2,'820491',50,10),(62,2,'826493',50,10),(63,2,'831276',50,10),(64,2,'835207',50,10),(65,2,'837295',50,10),(66,2,'843965',50,10),(67,2,'854763',50,10),(68,2,'874590',50,10),(69,2,'897324',50,10),(70,2,'904315',50,10),(71,2,'912570',50,10),(72,2,'920516',50,10),(73,2,'921543',50,10),(74,2,'924518',50,10),(75,2,'967540',50,10),(76,2,'972184',50,10),(77,2,'981430',50,10),(78,2,'982310',50,10),(79,2,'982410',50,10),(80,2,'982431',50,10),(81,2,'987130',50,10),(82,2,'105372',50,10),(83,2,'133921',50,10),(84,2,'134759',50,10),(85,2,'143905',50,10),(86,2,'148625',50,10),(87,2,'176304',50,10),(88,2,'182653',50,10),(89,2,'184762',50,10),(90,2,'216903',50,10),(91,2,'235891',50,10),(92,2,'239701',50,10),(93,2,'247690',50,10),(94,2,'271339',50,10),(95,2,'273816',50,10),(96,2,'283619',50,10),(97,2,'283915',50,10),(98,2,'284510',50,10),(99,2,'289374',50,10),(100,2,'295239',50,10),(101,2,'312587',50,10),(102,2,'312759',50,10),(103,2,'328571',50,10),(104,2,'341681',50,10),(105,2,'358901',50,10),(106,2,'368524',50,10),(107,2,'371249',50,10),(108,2,'379524',50,10),(109,2,'384201',50,10),(110,2,'390862',50,10),(111,2,'394820',50,10),(112,2,'413580',50,10),(113,2,'439678',50,10),(114,2,'451029',50,10),(115,2,'459732',50,10),(116,2,'470128',50,10),(117,2,'473193',50,10),(118,2,'490836',50,10),(119,2,'492631',50,10),(120,2,'493107',50,10),(121,2,'496307',50,10),(122,2,'504297',50,10),(123,2,'504856',50,10),(124,2,'508436',50,10),(125,2,'509347',50,10),(126,2,'509387',50,10),(127,2,'512046',50,10),(128,2,'512306',50,10),(129,2,'513958',50,10),(130,2,'514903',50,10),(131,2,'527640',50,10),(132,2,'572931',50,10),(133,2,'591732',50,10),(134,2,'592817',50,10),(135,2,'594813',50,10),(136,2,'625478',50,10),(137,2,'627839',50,10),(138,2,'628430',50,10),(139,2,'639218',50,10),(140,2,'639442',50,10),(141,2,'650921',50,10),(142,2,'701294',50,10),(143,2,'703982',50,10),(144,2,'712486',50,10),(145,2,'722326',50,10),(146,2,'724819',50,10),(147,2,'736294',50,10),(148,2,'748125',50,10),(149,2,'749320',50,10),(150,2,'765584',50,10),(151,2,'783024',50,10),(152,2,'801357',50,10),(153,2,'801624',50,10),(154,2,'804529',50,10),(155,2,'811223',50,10),(156,2,'816432',50,10),(157,2,'821390',50,10),(158,2,'821475',50,10),(159,2,'834721',50,10),(160,2,'835620',50,10),(161,2,'847921',50,10),(162,2,'849632',50,10),(163,2,'864203',50,10),(164,2,'875624',50,10),(165,2,'928473',50,10),(166,2,'936124',50,10),(167,2,'936701',50,10),(168,2,'942615',50,10),(169,2,'942810',50,10),(170,2,'953710',50,10),(171,2,'956201',50,10),(172,2,'957230',50,10),(173,2,'958301',50,10),(174,2,'964802',50,10),(175,2,'975621',50,10),(176,2,'982603',50,10),(177,2,'986435',50,10),(178,1,'134682',300,10),(179,1,'142693',300,10),(180,1,'149872',300,10),(181,1,'152937',300,10),(182,1,'159804',300,10),(183,1,'179632',300,10),(184,1,'184523',300,10),(185,1,'187642',300,10),(186,1,'204718',300,10),(187,1,'231640',300,10),(188,1,'231867',300,10),(189,1,'235781',300,10),(190,1,'245786',300,10),(191,1,'260498',300,10),(192,1,'270319',300,10),(193,1,'278965',300,10),(194,1,'298504',300,10),(195,1,'304987',300,10),(196,1,'305478',300,10),(197,1,'312654',300,10),(198,1,'345971',300,10),(199,1,'362094',300,10),(200,1,'378902',300,10),(201,1,'379826',300,10),(202,1,'405768',300,10),(203,1,'435219',300,10),(204,1,'438915',300,10),(205,1,'481279',300,10),(206,1,'489072',300,10),(207,1,'490175',300,10),(208,1,'493725',300,10),(209,1,'498320',300,10),(210,1,'498731',300,10),(211,1,'512479',300,10),(212,1,'519843',300,10),(213,1,'521394',300,10),(214,1,'528903',300,10),(215,1,'537916',300,10),(216,1,'540128',300,10),(217,1,'562893',300,10),(218,1,'582971',300,10),(219,1,'587420',300,10),(220,1,'604823',300,10),(221,1,'612489',300,10),(222,1,'619845',300,10),(223,1,'619874',300,10),(224,1,'624981',300,10),(225,1,'628354',300,10),(226,1,'658304',300,10),(227,1,'658319',300,10),(228,1,'679124',300,10),(229,1,'689431',300,10),(230,1,'713625',300,10),(231,1,'720158',300,10),(232,1,'739160',300,10),(233,1,'761084',300,10),(234,1,'763201',300,10),(235,1,'763910',300,10),(236,1,'784632',300,10),(237,1,'790246',300,10),(238,1,'820491',300,10),(239,1,'826493',300,10),(240,1,'831276',300,10),(241,1,'835207',300,10),(242,1,'837295',300,10),(243,1,'843965',300,10),(244,1,'854763',300,10),(245,1,'874590',300,10),(246,1,'897324',300,10),(247,1,'904315',300,10),(248,1,'912570',300,10),(249,1,'920516',300,10),(250,1,'921543',300,10),(251,1,'924518',300,10),(252,1,'967540',300,10),(253,1,'972184',300,10),(254,1,'981430',300,10),(255,1,'982310',300,10),(256,1,'982410',300,10),(257,1,'982431',300,10),(258,1,'987130',300,10),(259,1,'105372',300,10),(260,1,'133921',300,10),(261,1,'134759',300,10),(262,1,'143905',300,10),(263,1,'148625',300,10),(264,1,'176304',300,10),(265,1,'182653',300,10),(266,1,'184762',300,10),(267,1,'216903',300,10),(268,1,'235891',300,10),(269,1,'239701',300,10),(270,1,'247690',300,10),(271,1,'271339',300,10),(272,1,'273816',300,10),(273,1,'283619',300,10),(274,1,'283915',300,10),(275,1,'284510',300,10),(276,1,'289374',300,10),(277,1,'295239',300,10),(278,1,'312587',300,10),(279,1,'312759',300,10),(280,1,'328571',300,10),(281,1,'341681',300,10),(282,1,'358901',300,10),(283,1,'368524',300,10),(284,1,'371249',300,10),(285,1,'379524',300,10),(286,1,'384201',300,10),(287,1,'390862',300,10),(288,1,'394820',300,10),(289,1,'413580',300,10),(290,1,'439678',300,10),(291,1,'451029',300,10),(292,1,'459732',300,10),(293,1,'470128',300,10),(294,1,'473193',300,10),(295,1,'490836',300,10),(296,1,'492631',300,10),(297,1,'493107',300,10),(298,1,'496307',300,10),(299,1,'504297',300,10),(300,1,'504856',300,10),(301,1,'508436',300,10),(302,1,'509347',300,10),(303,1,'509387',300,10),(304,1,'512046',300,10),(305,1,'512306',300,10),(306,1,'513958',300,10),(307,1,'514903',300,10),(308,1,'527640',300,10),(309,1,'572931',300,10),(310,1,'591732',300,10),(311,1,'592817',300,10),(312,1,'594813',300,10),(313,1,'625478',300,10),(314,1,'627839',300,10),(315,1,'628430',300,10),(316,1,'639218',300,10),(317,1,'639442',300,10),(318,1,'650921',300,10),(319,1,'701294',300,10),(320,1,'703982',300,10),(321,1,'712486',300,10),(322,1,'722326',300,10),(323,1,'724819',300,10),(324,1,'736294',300,10),(325,1,'748125',300,10),(326,1,'749320',300,10),(327,1,'765584',300,10),(328,1,'783024',300,10),(329,1,'801357',300,10),(330,1,'801624',300,10),(331,1,'804529',300,10),(332,1,'811223',300,10),(333,1,'816432',300,10),(334,1,'821390',300,10),(335,1,'821475',300,10),(336,1,'834721',300,10),(337,1,'835620',300,10),(338,1,'847921',300,10),(339,1,'849632',300,10),(340,1,'864203',300,10),(341,1,'875624',300,10),(342,1,'928473',300,10),(343,1,'936124',300,10),(344,1,'936701',300,10),(345,1,'942615',300,10),(346,1,'942810',300,10),(347,1,'953710',300,10),(348,1,'956201',300,10),(349,1,'957230',300,10),(350,1,'958301',300,10),(351,1,'964802',300,10),(352,1,'975621',300,10),(353,1,'982603',300,10),(354,1,'986435',300,10);
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formaspagamentos`
--

DROP TABLE IF EXISTS `formaspagamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formaspagamentos` (
  `id_pagamento` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` enum('pix','debito','credito') NOT NULL,
  PRIMARY KEY (`id_pagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formaspagamentos`
--

LOCK TABLES `formaspagamentos` WRITE;
/*!40000 ALTER TABLE `formaspagamentos` DISABLE KEYS */;
INSERT INTO `formaspagamentos` VALUES (1,'debito'),(2,'credito'),(3,'pix');
/*!40000 ALTER TABLE `formaspagamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedores`
--

DROP TABLE IF EXISTS `fornecedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedores` (
  `id_fornecedor` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `cnpj` varchar(30) NOT NULL,
  `objeto_fornecido` text NOT NULL,
  `custo` decimal(10,2) NOT NULL,
  `email` varchar(100) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_fornecedor`),
  UNIQUE KEY `cnpj` (`cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedores`
--

LOCK TABLES `fornecedores` WRITE;
/*!40000 ALTER TABLE `fornecedores` DISABLE KEYS */;
INSERT INTO `fornecedores` VALUES (1,'Madeiras Nobres Brasil','12.345.678/0001-90','Madeira de mogno',8500.00,'contato@madeirasnobres.com','Rua das Árvores 120, Manaus - AM','2025-12-09 19:52:13'),(2,'Metalúrgica SomForte','98.765.432/0001-55','Ligas de latão',4200.50,'vendas@somforte.com','Av. Industrial 455, São Bernardo do Campo - SP','2025-12-09 19:52:13'),(3,'Eletrônicos AudioChip','54.321.987/0001-12','Circuitos integrados',6700.90,'suporte@audiochip.com','Rua Tecnologia 77, Campinas - SP','2025-12-09 19:52:13'),(4,'Cordas Harmonia Ltda','23.456.789/0001-21','Cordas de aço e nylon',1900.00,'contato@harmonia.com','Av. das Artes 310, Curitiba - PR','2025-12-09 19:52:13'),(5,'Acabamentos LuthierCoat','45.678.912/0001-43','Vernizes, seladoras e tintas',2500.75,'vendas@luthiercoat.com','Rua Pintores 500, Joinville - SC','2025-12-09 19:52:13'),(6,'Estojos ProCase','67.891.234/0001-65','Estojos rígidos e bags acolchoados',3100.30,'comercial@procase.com','Av. Central 980, Belo Horizonte - MG','2025-12-09 19:52:13'),(7,'Parafusos & Ferragens São Luís','11.222.333/0001-44','Parafusos',1350.00,'contato@ferragenssl.com','Rua do Metal 201, São Luís - MA','2025-12-09 19:52:13'),(8,'Plásticos e Compostos Melodia','77.888.999/0001-10','Plásticos moldáveis',1600.40,'suporte@melodiaplast.com','Av. das Indústrias 1450, Sorocaba - SP','2025-12-09 19:52:13'),(9,'Espumas Acústicas AcustiFlex','32.165.498/0001-77','Espumas e materiais internos',980.00,'vendas@acustiflex.com','Rua Acústica 222, Porto Alegre - RS','2025-12-09 19:52:13'),(10,'Eletrônica Premium Wiring','44.556.778/0001-88','Fios, cabos blindados',750.50,'contato@premiumwiring.com','Rua Energia 420, Rio de Janeiro - RJ','2025-12-09 19:52:13');
/*!40000 ALTER TABLE `fornecedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `franquias`
--

DROP TABLE IF EXISTS `franquias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `franquias` (
  `id_franquia` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_postal` varchar(20) NOT NULL,
  `endereco_completo` varchar(250) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `email_contato` varchar(100) NOT NULL,
  `telefone_contato` varchar(100) NOT NULL,
  `status` enum('Ativo','Inativo') NOT NULL DEFAULT 'Ativo',
  `data_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_franquia`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `franquias`
--

LOCK TABLES `franquias` WRITE;
/*!40000 ALTER TABLE `franquias` DISABLE KEYS */;
INSERT INTO `franquias` VALUES (1,'01000-000','Av. Paulista, 1000 - Bela Vista','São Paulo - SP','sp@musichouse.com.br','(11) 98888-1000','Ativo','2025-12-09 19:52:13','2025-12-09 19:52:13'),(2,'09632000','Rua Ida Leoni Cleto, 640 - Rudge Ramos','São Bernardo do Campo - SP','musichousesaobernardo@gmail.com','11999525254','Ativo','2025-12-09 19:57:07','2025-12-09 19:57:07');
/*!40000 ALTER TABLE `franquias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionarios` (
  `id_registro` int(11) NOT NULL AUTO_INCREMENT,
  `nome_completo` varchar(300) NOT NULL,
  `cpf` char(11) NOT NULL,
  `rg` varchar(9) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `sexo` enum('Masculino','Feminino','Outro') DEFAULT 'Outro',
  `estado_civil` enum('Solteiro','Casado','Divorciado','Viúvo','Outro') DEFAULT 'Solteiro',
  `email` varchar(100) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `id_franquia` int(11) NOT NULL,
  `id_credencial` int(11) NOT NULL,
  `fotoFuncionario` text DEFAULT NULL,
  `token` text DEFAULT NULL,
  `reset_token` varchar(100) DEFAULT NULL,
  `reset_expires` datetime DEFAULT NULL,
  `senha` text NOT NULL,
  `primeiroLogin` tinyint(1) DEFAULT 1,
  `status` enum('Ativo','Inativo') DEFAULT 'Ativo',
  `data_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_registro`),
  KEY `fk_func_franquia` (`id_franquia`),
  KEY `fk_func_cred` (`id_credencial`),
  CONSTRAINT `fk_func_cred` FOREIGN KEY (`id_credencial`) REFERENCES `credenciais` (`id_credenciais`),
  CONSTRAINT `fk_func_franquia` FOREIGN KEY (`id_franquia`) REFERENCES `franquias` (`id_franquia`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
INSERT INTO `funcionarios` VALUES (1,'Giovanni Buscarino Benedetti','12345678901','000000000','2007-07-11','Masculino','Solteiro','gbuscarinobenedetti@gmail.com','11999215191',1,1,NULL,NULL,NULL,NULL,'$2b$10$YxSehrudVIisQMuSMgUG.Ocgw0c6saCKbTm65H8Ub0/GeVjpvVZFi',0,'Ativo','2025-12-09 19:52:37','2025-12-09 19:53:57'),(2,'Arthur Buscarino Benedetti','46545646545','542165465','0000-00-00','Masculino','Solteiro','arthurbuscarinobenedetti8@gmail.com','118974898654',2,2,'\\uploads\\fotosFuncionarios\\1765310301250-WhatsApp Image 2025-11-14 at 10.23.43.jpeg',NULL,NULL,NULL,'$2b$10$2YoY.kw.JvbfAkJOk1hPBOXVLrPMYGrLuveeg4vunuHNdvMqUOvwq',0,'Ativo','2025-12-09 19:58:21','2025-12-09 19:59:17'),(3,'Bruno Pezzolato','54654564654','564564564','2011-12-20','Masculino','Casado','arthur.giovanni.gil@gmail.com','11654564654',2,3,'\\uploads\\fotosFuncionarios\\1765310715880-FotoRosto.jpeg',NULL,NULL,NULL,'$2b$10$WcjPK/fa.a0FLc51L9MgL.1/d6uROdMf4wjIjpIPg5xVr2Z9l14GG',0,'Ativo','2025-12-09 20:04:44','2025-12-09 20:06:13');
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_venda`
--

DROP TABLE IF EXISTS `item_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_venda` (
  `id_item` int(11) NOT NULL AUTO_INCREMENT,
  `id_venda` int(11) NOT NULL,
  `sku_produto` varchar(6) DEFAULT NULL,
  `sku_variacao` varchar(6) DEFAULT NULL,
  `quantidade` int(11) NOT NULL,
  `preco_unitario` decimal(10,2) DEFAULT NULL,
  `lucro` decimal(10,2) DEFAULT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_item`),
  KEY `fk_item_venda` (`id_venda`),
  CONSTRAINT `fk_item_venda` FOREIGN KEY (`id_venda`) REFERENCES `venda` (`id_venda`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_venda`
--

LOCK TABLES `item_venda` WRITE;
/*!40000 ALTER TABLE `item_venda` DISABLE KEYS */;
INSERT INTO `item_venda` VALUES (1,1,'438915',NULL,1,4200.00,1680.00,4200.00),(2,1,'624981',NULL,1,9800.00,3920.00,9800.00),(3,2,'489072',NULL,1,7200.00,2880.00,7200.00),(4,2,'231867',NULL,1,3600.00,1440.00,3600.00),(5,2,'134682',NULL,1,7200.00,2880.00,7200.00),(6,3,'438915',NULL,2,4200.00,3360.00,8400.00);
/*!40000 ALTER TABLE `item_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimentacoes_estoque`
--

DROP TABLE IF EXISTS `movimentacoes_estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimentacoes_estoque` (
  `id_movimentacao` int(11) NOT NULL AUTO_INCREMENT,
  `id_estoque` int(11) NOT NULL,
  `id_franquia` int(11) NOT NULL,
  `id_funcionario` int(11) NOT NULL,
  `tipo_movimentacao` enum('entrada','saida') NOT NULL,
  `quantidade_anterior` int(11) NOT NULL,
  `quantidade_movimentada` int(11) NOT NULL,
  `quantidade_atual` int(11) NOT NULL,
  `observacao` text DEFAULT NULL,
  `data_movimentacao` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_movimentacao`),
  KEY `fk_mov_estoque` (`id_estoque`),
  KEY `fk_mov_franquia` (`id_franquia`),
  KEY `fk_mov_func` (`id_funcionario`),
  CONSTRAINT `fk_mov_estoque` FOREIGN KEY (`id_estoque`) REFERENCES `estoque` (`id_estoque`),
  CONSTRAINT `fk_mov_franquia` FOREIGN KEY (`id_franquia`) REFERENCES `franquias` (`id_franquia`),
  CONSTRAINT `fk_mov_func` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_registro`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimentacoes_estoque`
--

LOCK TABLES `movimentacoes_estoque` WRITE;
/*!40000 ALTER TABLE `movimentacoes_estoque` DISABLE KEYS */;
INSERT INTO `movimentacoes_estoque` VALUES (20,27,2,3,'saida',49,1,48,NULL,'2025-12-09 20:22:35'),(21,47,2,3,'saida',49,1,48,NULL,'2025-12-09 20:22:35'),(22,29,2,3,'saida',49,1,48,NULL,'2025-12-09 20:23:27'),(23,11,2,3,'saida',49,1,48,NULL,'2025-12-09 20:23:27'),(24,1,2,3,'saida',49,1,48,NULL,'2025-12-09 20:23:27'),(25,27,2,3,'saida',47,2,45,NULL,'2025-12-09 20:24:29');
/*!40000 ALTER TABLE `movimentacoes_estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos_filiais`
--

DROP TABLE IF EXISTS `pedidos_filiais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_filiais` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_franquia` int(11) NOT NULL,
  `id_funcionario` int(11) NOT NULL,
  `id_estoque` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `observacao` text NOT NULL,
  `status` enum('Pendente','Aprovado','Recusado') DEFAULT 'Pendente',
  `prioridade` enum('Alta','Média','Baixa') DEFAULT 'Média',
  `data_pedido` timestamp NULL DEFAULT current_timestamp(),
  `data_atualizacao` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_pedido`),
  KEY `fk_franquia` (`id_franquia`),
  KEY `fk_funcionario` (`id_funcionario`),
  KEY `fk_estoque` (`id_estoque`),
  CONSTRAINT `fk_estoque` FOREIGN KEY (`id_estoque`) REFERENCES `estoque` (`id_estoque`),
  CONSTRAINT `fk_franquia` FOREIGN KEY (`id_franquia`) REFERENCES `franquias` (`id_franquia`),
  CONSTRAINT `fk_funcionario` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_registro`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos_filiais`
--

LOCK TABLES `pedidos_filiais` WRITE;
/*!40000 ALTER TABLE `pedidos_filiais` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos_filiais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `id_produto` int(11) NOT NULL AUTO_INCREMENT,
  `sku` varchar(6) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `descricao` varchar(300) NOT NULL,
  `materiais` varchar(300) NOT NULL,
  `detalhes` varchar(300) NOT NULL,
  `nome_cor` varchar(70) NOT NULL,
  `cor` varchar(70) NOT NULL,
  `desconto` int(11) DEFAULT NULL,
  `id_categoria` int(11) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `custo_producao` decimal(10,2) DEFAULT NULL,
  `imagem` text NOT NULL,
  PRIMARY KEY (`id_produto`),
  UNIQUE KEY `sku` (`sku`),
  KEY `fk_prod_categoria` (`id_categoria`),
  CONSTRAINT `fk_prod_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'521394','Violão Clássico (Nylon)','A classical wooden acoustic guitar with nylon strings, natural finish, warm studio lighting, professional product photo.','Tampo em spruce, laterais e fundo em mogno.','Violão de estudo com timbre suave e confortável.','Natural','#b35201',NULL,1,950.00,570.00,'/uploads/fotosProdutos/violao-nylon-frente.png, /uploads/fotosProdutos/violao-nylon-frente-sem-fundo.png, /uploads/fotosProdutos/violao-nylon-verso.png, /uploads/fotosProdutos/violao-nylon-verso-sem-fundo.png'),(2,'713625','Violão Aço (Folk)','A steel-string acoustic folk guitar with a large body and glossy wood finish, photographed on a neutral background with soft lighting.','Corpo em rosewood e tampo em spruce.','Som brilhante, ideal para palco e gravação.','Natural Brilhante','#C49A6C',NULL,1,1350.00,810.00,'/uploads/fotosProdutos/violao-aco-frente.png, /uploads/fotosProdutos/violao-aco-frente-sem-fundo.png, /uploads/fotosProdutos/violao-aco-verso.png, /uploads/fotosProdutos/violao-aco-verso-sem-fundo.png'),(3,'438915','Guitarra Stratocaster','An electric Stratocaster guitar with a white body and black pickguard, modern lighting, high-quality studio image.','Corpo em alder, braço em maple.','Três captadores single coil e chave seletora de 5 posições.','Branco','#FFFFFF',NULL,1,4200.00,2520.00,'/uploads/fotosProdutos/guitarra-stratocaster-frente.png, /uploads/fotosProdutos/guitarra-stratocaster-frente-sem-fundo.png, /uploads/fotosProdutos/guitarra-stratocaster-verso.png, /uploads/fotosProdutos/guitarra-stratocaster-verso-sem-fundo.png'),(4,'820491','Guitarra Les Paul','A Les Paul style electric guitar with a flame maple top, amber color, gold hardware, and dramatic dark background lighting.','Top em maple flame, corpo em mogno.','Dois captadores humbucker e ponte Tune-o-Matic.','Amber Flame','#D2691E',NULL,1,5600.00,3360.00,'/uploads/fotosProdutos/guitarra-lespaul-frente.png, /uploads/fotosProdutos/guitarra-lespaul-frente-sem-fundo.png, /uploads/fotosProdutos/guitarra-lespaul-verso.png, /uploads/fotosProdutos/guitarra-lespaul-verso-sem-fundo.png'),(5,'179632','Baixo Acústico (Baixolão) 4 Cordas','A four-string acoustic bass guitar with a large wooden body, natural matte finish, displayed on a wooden floor with studio lighting.','Tampo em spruce, corpo em mogno.','Captação ativa e braço confortável.','Natural Fosco','#ac6a23',NULL,1,2100.00,1260.00,'/uploads/fotosProdutos/baixolao-frente.png, /uploads/fotosProdutos/baixolao-frente-sem-fundo.png, /uploads/fotosProdutos/baixolao-verso.png, /uploads/fotosProdutos/baixolao-verso-sem-fundo.png'),(6,'493725','Baixo Elétrico Jazz Bass','A Jazz Bass electric guitar with sunburst finish, two pickups, chrome hardware, and studio lighting.','Corpo em alder, braço em maple.','Dois captadores single coil, timbre vintage.','Sunburst','#8B4513',NULL,1,3700.00,2220.00,'/uploads/fotosProdutos/baixo-eletrico-jazz-bass-frente.png, /uploads/fotosProdutos/baixo-eletrico-jazz-bass-frente-sem-fundo.png, /uploads/fotosProdutos/baixo-eletrico-jazz-bass-verso.png, /uploads/fotosProdutos/baixo-eletrico-jazz-bass-verso-sem-fundo.png'),(7,'260498','Baixo Elétrico Precision Bass','A Precision Bass electric guitar with black body, maple neck, vintage look, photographed on dark background.','Corpo em alder, braço maple e captador split coil.','Design clássico e som encorpado.','Preto','#111111',NULL,1,3900.00,2340.00,'/uploads/fotosProdutos/baixo-eletrico-precision-bass-frente.png, /uploads/fotosProdutos/baixo-eletrico-precision-bass-frente-sem-fundo.png, /uploads/fotosProdutos/baixo-eletrico-precision-bass-verso.png, /uploads/fotosProdutos/baixo-eletrico-precision-bass-verso-sem-fundo.png'),(8,'619874','Viola Caipira 12 Cordas','A modern 12-string Brazilian viola caipira, polished wood finish, studio lighting, front-facing product photo.','Corpo em mogno e tampo em spruce.','Braço reforçado, timbre cristalino.','Natural Polido','#D2A679',NULL,1,1600.00,960.00,'/uploads/fotosProdutos/viola-caipira-12-cordas-frente.png, /uploads/fotosProdutos/viola-caipira-12-cordas-frente-sem-fundo.png, /uploads/fotosProdutos/viola-caipira-12-cordas-verso.png, /uploads/fotosProdutos/viola-caipira-12-cordas-verso-sem-fundo.png'),(9,'982310','Violino Profissional','A professional violin with dark varnish, fine wood texture, and elegant studio lighting for concert presentation.','Madeira maple flame e ébano.','Cordas de aço e arco em crina natural.','Vermelho Escuro','#8B0000',NULL,1,6800.00,4080.00,'/uploads/fotosProdutos/violino-frente.png, /uploads/fotosProdutos/violino-frente-sem-fundo.png, /uploads/fotosProdutos/violino-verso.png, /uploads/fotosProdutos/violino-verso-sem-fundo.png'),(10,'312654','Violoncelo Profissional','A professional concert cello with dark polished wood, elegant shape, under soft spotlight on stage.','Corpo em maple europeu.','Som encorpado e sustentado.','Vermelho Mogno','#8B4513',NULL,1,12500.00,7500.00,'/uploads/fotosProdutos/violoncelo-profissional-frente.png, /uploads/fotosProdutos/violoncelo-profissional-frente-sem-fundo.png, /uploads/fotosProdutos/violoncelo-profissional-verso.png, /uploads/fotosProdutos/violoncelo-profissional-verso-sem-fundo.png'),(11,'897324','Ukulele Soprano','A small soprano ukulele with light wood finish, tropical vibe, photographed on beige background with warm light.','Corpo em mahogany e tampo spruce.','Som suave e portátil.','Natural Claro','#E6BE8A',NULL,1,480.00,288.00,'/uploads/fotosProdutos/ukulele-soprano-frente.png, /uploads/fotosProdutos/ukulele-soprano-frente-sem-fundo.png, /uploads/fotosProdutos/ukulele-soprano-verso.png, /uploads/fotosProdutos/ukulele-soprano-verso-sem-fundo.png'),(12,'235781','Banjo 4 Cordas','A 4-string traditional banjo with metallic rim and wooden neck, retro look, natural lighting.','Aros em alumínio e braço em maple.','Som brilhante e percussivo.','Natural com Metal','#C0C0C0',NULL,1,1450.00,870.00,'/uploads/fotosProdutos/banjo-4-cordas-frente.png, /uploads/fotosProdutos/banjo-4-cordas-frente-sem-fundo.png, /uploads/fotosProdutos/banjo-4-cordas-verso.png, /uploads/fotosProdutos/banjo-4-cordas-verso-sem-fundo.png'),(13,'519843','Cavaquinho Elétrico','An electric cavaquinho with solid body, embedded pickups, modern lighting on dark studio background.','Corpo sólido em mogno e captação ativa.','Design moderno, ideal para palco.','Bege Claro','#e0b362',NULL,1,1300.00,780.00,'/uploads/fotosProdutos/cavaquinho-eletrico-frente.png, /uploads/fotosProdutos/cavaquinho-eletrico-frente-sem-fundo.png, /uploads/fotosProdutos/cavaquinho-eletrico-verso.png, /uploads/fotosProdutos/cavaquinho-eletrico-verso-sem-fundo.png'),(14,'624981','Bateria Eletrônica Profissional (Pads de Mesh)','A professional electronic drum kit with mesh pads, large display module, black finish, photographed in a recording studio.','Estrutura em aço e pads com malha dupla.','Módulo digital com 700 sons e conectividade USB/MIDI.','Preto Fosco','#111111',NULL,2,9800.00,5880.00,'/uploads/fotosProdutos/bateria-eletrica-frente.png, /uploads/fotosProdutos/bateria-eletrica-frente-sem-fundo.png, /uploads/fotosProdutos/bateria-eletrica-verso.png, /uploads/fotosProdutos/bateria-eletrica-verso-sem-fundo.png'),(15,'835207','Cajón Flamenco','A flamenco cajón made of polished wood, front striking surface, placed on a wooden floor with warm lighting.','Madeira compensada de bétula e painel frontal em mogno.','Timbre definido para palmas e graves encorpados.','Natural Polido','#D2B48C',NULL,2,890.00,534.00,'/uploads/fotosProdutos/cajon-flamenco-frente.png, /uploads/fotosProdutos/cajon-flamenco-frente-sem-fundo.png, /uploads/fotosProdutos/cajon-flamenco-verso.png, /uploads/fotosProdutos/cajon-flamenco-verso-sem-fundo.png'),(16,'921543','Pandeiro Couro','A leather-headed pandeiro with brass jingles, handcrafted style, rustic lighting on wooden surface.','Aros de madeira e platinelas de latão.','Membrana de couro natural, 10 polegadas.','Natural','#E6BE8A',NULL,2,450.00,270.00,'/uploads/fotosProdutos/pandeiro-couro-frente.png, /uploads/fotosProdutos/pandeiro-couro-frente-sem-fundo.png, /uploads/fotosProdutos/pandeiro-couro-verso-sem-fundo.png, /uploads/fotosProdutos/pandeiro-couro-verso-sem-fundo.png'),(17,'763201','Tamborim Tradicional','A traditional samba tamborim with nylon head, metal rim, placed on a percussion table under studio lighting.','Aro de alumínio e pele de nylon.','Perfeito para bateria de escola de samba.','Prateado','#99846c',NULL,2,240.00,144.00,'/uploads/fotosProdutos/tamborim-frente.png, /uploads/fotosProdutos/tamborim-frente-sem-fundo.png'),(18,'149872','Congas Quinto','A single quinto conga drum, tall and narrow, dark wood finish with chrome hardware, studio lighting.','Madeira de carvalho com ferragens cromadas.','Altura de 75cm e afinação por chaves.','Mogno Escuro','#8B4513',NULL,2,3100.00,1860.00,'/uploads/fotosProdutos/conga-frente.png, /uploads/fotosProdutos/conga-frente-sem-fundo.png, /uploads/fotosProdutos/conga-verso.png, /uploads/fotosProdutos/conga-verso-sem-fundo.png'),(19,'658304','Bongôs Profissional','Professional bongo drums with dark polished wood, metal tuning lugs, photographed on black background.','Mogno e ferragens niqueladas.','Tamanhos 7” e 8,5”, pele natural.','Natural Escuro','#5C4033',NULL,2,1350.00,810.00,'/uploads/fotosProdutos/bongo-frente.png, /uploads/fotosProdutos/bongo-frente-sem-fundo.png, /uploads/fotosProdutos/bongo-verso.png, /uploads/fotosProdutos/bongo-verso-sem-fundo.png'),(20,'278965','Surdo Marcação','A large samba surdo drum for bass rhythm, deep aluminum body, strong visual lighting, street parade vibe.','Corpo em alumínio escovado e pele dupla.','Utilizado em desfiles e blocos de carnaval.','Alumínio','#B0B0B0',NULL,2,1750.00,1050.00,'/uploads/fotosProdutos/surdo-frente.png, /uploads/fotosProdutos/surdo-frente-sem-fundo.png, /uploads/fotosProdutos/surdo-verso.png, /uploads/fotosProdutos/surdo-verso-sem-fundo.png'),(21,'987130','Triângulo Tradicional','A metal triangle percussion instrument with a simple design, hanging with striker, isolated on white background.','Aço inoxidável.','Inclui baqueta e cordão de fixação.','Metálico','#C0C0C0',NULL,2,90.00,54.00,'/uploads/fotosProdutos/triangulo-frente.png, /uploads/fotosProdutos/triangulo-frente-sem-fundo.png, /uploads/fotosProdutos/triangulo-verso.png, /uploads/fotosProdutos/triangulo-verso-sem-fundo.png'),(22,'305478','Tantan Madeira','A wooden tantan drum, cylindrical shape, natural finish, used in pagode music, warm studio lighting.','Mogno e couro natural.','Sonoridade grave e suave.','Natural','#DEB887',NULL,2,760.00,456.00,'/uploads/fotosProdutos/tantan-frente.png, /uploads/fotosProdutos/tantan-frente-sem-fundo.png, /uploads/fotosProdutos/tantan-cima.png, /uploads/fotosProdutos/tantan-cima-sem-fundo.png'),(23,'498320','Reco-reco de Madeira','A wooden reco-reco with carved ridges and a stick, photographed on a light wood surface, warm tones.','Mogno entalhado e baqueta de madeira.','Timbre rústico e artesanal.','Natural Envernizado','#CDAA7D',NULL,2,180.00,108.00,'/uploads/fotosProdutos/reco-reco-frente.png, /uploads/fotosProdutos/reco-reco-frente-sem-fundo.png, /uploads/fotosProdutos/reco-reco-cima.png, /uploads/fotosProdutos/reco-reco-cima-sem-fundo.png'),(24,'152937','Xilofone Estudante','A small xylophone for students with colorful bars, mallets included, photographed on white background.','Base em madeira com lâminas plásticas coloridas.','Acompanha par de baquetas.','Marrom','#ecd7b3',NULL,2,290.00,174.00,'/uploads/fotosProdutos/xilofone-frente.png, /uploads/fotosProdutos/xilofone-frente-sem-fundo.png, /uploads/fotosProdutos/xilofone-verso.png, /uploads/fotosProdutos/xilofone-verso-sem-fundo.png'),(25,'831276','Marimba Orquestral','A professional orchestral marimba with wooden resonators and mallets, concert hall background lighting.','Lâminas de rosewood e ressonadores metálicos.','Som encorpado, usado em orquestras.','Madeira Natural','#8B4513',NULL,2,21000.00,12600.00,'/uploads/fotosProdutos/marimba-orquestral-frente.png, /uploads/fotosProdutos/marimba-orquestral-frente-sem-fundo.png, /uploads/fotosProdutos/marimba-orquestral-verso.png, /uploads/fotosProdutos/marimba-orquestral-verso-sem-fundo.png'),(26,'489072','Glockenspiel Orquestral','A professional orchestral glockenspiel mounted on a frame with mallets, dark concert background lighting.','Lâminas de aço e estrutura tubular.','Sonoridade aguda e cristalina.','Metálico','#D3D3D3',NULL,2,7200.00,4320.00,'/uploads/fotosProdutos/glockenspiel-profissional-frente.png, /uploads/fotosProdutos/glockenspiel-profissional-frente-sem-fundo.png, /uploads/fotosProdutos/glockenspiel-profissional-verso.png, /uploads/fotosProdutos/glockenspiel-profissional-verso-sem-fundo.png'),(27,'612489','Piano Acústico (De Cauda)','A grand acoustic piano with glossy black finish, open lid showing strings, photographed in a concert hall with warm lighting.','Tampa e corpo em madeira nobre com acabamento em poliéster preto.','88 teclas de marfim sintético, som encorpado e harmônico.','Preto Brilhante','#000000',NULL,3,58000.00,34800.00,'/uploads/fotosProdutos/piano-acustico-cauda-frente.png, /uploads/fotosProdutos/piano-acustico-cauda-frente-sem-fundo.png, /uploads/fotosProdutos/piano-acustico-corda-verso.png, /uploads/fotosProdutos/piano-acustico-corda-verso-sem-fundo.png'),(28,'204718','Piano Acústico (Vertical)','An upright acoustic piano made of dark polished wood, photographed against a wall with soft ambient lighting.','Estrutura em madeira de nogueira com martelos de feltro.','Compacto e ideal para ambientes menores.','Mogno Escuro','#5B3A29',NULL,3,28500.00,17100.00,'/uploads/fotosProdutos/piano-acustico-vertical-frente.png, /uploads/fotosProdutos/piano-acustico-vertical-frente-sem-fundo.png, /uploads/fotosProdutos/piano-acustico-vertical-verso.png, /uploads/fotosProdutos/piano-acustico-vertical-verso-sem-fundo.png'),(29,'739160','Piano Digital (Portátil)','A compact digital piano with 88 weighted keys, minimalist black design, displayed in a modern home studio.','Corpo em plástico ABS reforçado, teclas semi-pesadas.','Inclui saída USB e conexão para fones.','Preto Fosco','#1C1C1C',NULL,3,4200.00,2520.00,'/uploads/fotosProdutos/piano-digital-portatil-frente.png, /uploads/fotosProdutos/piano-digital-portatil-frente-sem-fundo.png, /uploads/fotosProdutos/piano-digital-portatil-verso.png, /uploads/fotosProdutos/piano-digital-portatil-verso-sem-fundo.png'),(30,'528903','Piano Digital (De Móvel / Armário)','A cabinet-style digital piano with built-in stand and pedals, dark wood finish, photographed in a cozy living room setting.','Estrutura em MDF revestido e teclas com ação hammer.','Sistema estéreo e 10 timbres internos.','Madeira Escura','#3B2F2F',NULL,3,6400.00,3840.00,'/uploads/fotosProdutos/piano-digital-movel-frente.png, /uploads/fotosProdutos/piano-digital-movel-frente-sem-fundo.png, /uploads/fotosProdutos/piano-digital-movel-verso.png, /uploads/fotosProdutos/piano-digital-movel-verso-sem-fundo.png'),(31,'481279','Teclado Arranjador (Avançado 76/88 Teclas)','A professional arranger keyboard with extended 76 keys, multiple controls and display, photographed in a recording studio.','Carcaça em alumínio leve, display LCD colorido.','Ritmos integrados e gravação em tempo real.','Prateado','#C0C0C0',NULL,3,7500.00,4500.00,'/uploads/fotosProdutos/teclado-arranjador-frente.png, /uploads/fotosProdutos/teclado-arranjador-frente-sem-fundo.png, /uploads/fotosProdutos/teclado-arranjador-verso.png, /uploads/fotosProdutos/teclado-arranjador-verso-sem-fundo.png'),(32,'967540','Teclado Controlador MIDI (25 Teclas)','A small 25-key MIDI controller keyboard with drum pads and knobs, modern lighting on white background.','Corpo em ABS preto fosco e conexões USB-C.','Compatível com DAWs profissionais.','Preto Fosco','#111111',NULL,3,980.00,588.00,'/uploads/fotosProdutos/teclado-controlador-midi-frente.png, /uploads/fotosProdutos/teclado-controlador-midi-frente-sem-frente.png, /uploads/fotosProdutos/teclado-controlador-midi-verso.png, /uploads/fotosProdutos/teclado-controlador-midi-verso-sem-fundo.png'),(33,'379826','Sintetizador (Digital)','A modern digital synthesizer with sleek design, LCD display, and touch controls, in a futuristic studio environment.','Painel metálico com 61 teclas sensíveis à velocidade.','Gerador de som digital com 512 presets.','Preto Grafite','#2F2F2F',NULL,3,8900.00,5340.00,'/uploads/fotosProdutos/sintetizador-digital-frente.png, /uploads/fotosProdutos/sintetizador-digital-frente-sem-fundo.png, /uploads/fotosProdutos/sintetizador-digital-verso.png, /uploads/fotosProdutos/sintetizador-digital-verso-sem-fundo.png'),(34,'982431','Flauta Doce (Contralto)','An alto recorder made of dark wood, traditional design, placed on a sheet of classical music with warm lighting.','Madeira de ébano e chaves ajustadas.','Sonoridade suave e ideal para aprendizado clássico.','Mogno Escuro','#4B3621',NULL,4,420.00,252.00,'/uploads/fotosProdutos/flauta-doce-frente.png, /uploads/fotosProdutos/flauta-doce-frente-sem-fundo.png'),(35,'134682','Flauta Transversal (Profissional)','A professional silver flute with open holes and elegant engravings, photographed in a concert hall setting with warm spotlight.','Prata banhada com corpo em níquel.','Afinada em C, ideal para uso orquestral.','Prateado','#DCDCDC',NULL,4,7200.00,4320.00,'/uploads/fotosProdutos/flauta-transversal-frente.png, /uploads/fotosProdutos/flauta-transversal-frente-sem-fundo.png, /uploads/fotosProdutos/flauta-transversal-verso.png, /uploads/fotosProdutos/flauta-transversal-verso-sem-fundo.png'),(36,'843965','Saxofone (Alto)','An alto saxophone with gold lacquer finish, classic curved shape, photographed against a dark studio background with dramatic light.','Latão com acabamento dourado e chaves em madrepérola.','Timbre clássico e resposta rápida.','Dourado','#FFD700',NULL,4,9800.00,5880.00,'/uploads/fotosProdutos/saxofone-alto-frente.png, /uploads/fotosProdutos/saxofone-alto-frente-sem-fundo.png, /uploads/fotosProdutos/saxofone-alto-verso.png, /uploads/fotosProdutos/saxofone-alto-verso-sem-fundo.png'),(37,'270319','Trompete (Bb)','A standard Bb trumpet with gold lacquer finish and silver mouthpiece, placed on a reflective black surface with concert lighting.','Corpo em latão com bocal niquelado.','Afinado em Si♭, ideal para iniciantes e profissionais.','Dourado','#FFD700',NULL,4,5400.00,3240.00,'/uploads/fotosProdutos/trompete-bb-frente.png, /uploads/fotosProdutos/trompete-bb-frente-sem-fundo.png, /uploads/fotosProdutos/trompete-bb-verso.png, /uploads/fotosProdutos/trompete-bb-verso-sem-fundo.png'),(38,'761084','Clarinete (Bb)','A Bb clarinet with black body and silver keys, lying on a wooden table, soft classical lighting.','Resina ABS com chaves niqueladas.','Sonorização clara e projeção equilibrada.','Preto','#000000',NULL,4,3900.00,2340.00,'/uploads/fotosProdutos/clarinete-bb-frente.png, /uploads/fotosProdutos/clarinete-bb-frente-sem-fundo.png, /uploads/fotosProdutos/clarinete-bb-verso.png, /uploads/fotosProdutos/clarinete-bb-verso-sem-fundo.png'),(39,'689431','Gaita (Harmônica) Diatônica','A diatonic harmonica with metal cover and wooden comb, pocket-size, photographed on a rustic wooden surface.','Corpo em madeira e tampas cromadas.','Tonalidade C, ideal para blues e folk.','Metálico','#C0C0C0',NULL,4,350.00,210.00,'/uploads/fotosProdutos/gaita-harmonica-frente.png, /uploads/fotosProdutos/gaita-harmonica-frente-sem-fundo.png, /uploads/fotosProdutos/gaita-harmonica-verso.png, /uploads/fotosProdutos/gaita-harmonica-verso-sem-fundo.png'),(40,'245786','Fagote (Modelo Profissional)','A professional bassoon with rich red wood finish, intricate silver key system, concert hall background lighting.','Maple vermelho e sistema Heckel.','Instrumento de orquestra com timbre aveludado.','Vermelho Escuro','#8B0000',NULL,4,28500.00,17100.00,'/uploads/fotosProdutos/fagote-frente.png, /uploads/fotosProdutos/fagote-frente-sem-fundo.png, /uploads/fotosProdutos/fagote-verso.png, /uploads/fotosProdutos/fagote-verso-sem-fundo.png'),(41,'924518','Trompa (Modelo Profissional)','A professional French horn with full double horn system, gold lacquer finish, photographed in a concert environment.','Latão dourado com chaves rotativas.','Sonoridade ampla e projeção poderosa.','Dourado Envelhecido','#DAA520',NULL,4,16500.00,9900.00,'/uploads/fotosProdutos/trompa-frente.png, /uploads/fotosProdutos/trompa-frente-sem-fundo.png, /uploads/fotosProdutos/trompa-verso.png, /uploads/fotosProdutos/trompa-verso-sem-fundo.png'),(42,'378902','Corneta (Modelo Profissional)','A professional silver cornet, refined design, photographed on stage lighting setup with blurred orchestra background.','Corpo em prata com válvulas de pistão rápidas.','Timbre suave, ideal para bandas sinfônicas.','Prateado','#C0C0C0',NULL,4,8200.00,4920.00,'/uploads/fotosProdutos/corneta-frente.png, /uploads/fotosProdutos/corneta-frente-sem-fundo.png, /uploads/fotosProdutos/corneta-verso.png, /uploads/fotosProdutos/corneta-verso-sem-fundo.png'),(43,'582971','Acordeon (Sanfona) 80 Baixos','A full-size 80-bass accordion with pearl buttons and decorative grille, photographed in a folk music studio with soft light.','Corpo em madeira compensada, fole em tecido reforçado e botões de madrepérola.','Timbre tradicional, ideal para forró, vanerão e música regional.','Preto com Branco','#000000',NULL,5,9600.00,5760.00,'/uploads/fotosProdutos/acordeon-frente.png, /uploads/fotosProdutos/acordeon-frente-sem-fundo.png, /uploads/fotosProdutos/acordeon-verso.png, /uploads/fotosProdutos/acordeon-verso-sem-fundo.png'),(44,'920516','Harmonium Tradicional Indiano','A classic Indian harmonium with decorative carvings, extended bellows, photographed in a traditional music room setting.','Madeira de teca com entalhes ornamentais.','Timbre quente e ressonância profunda.','Natural Entalhado','#CD853F',NULL,5,8400.00,5040.00,'/uploads/fotosProdutos/harmonium-frente.png, /uploads/fotosProdutos/harmonium-frente-sem-fundo.png, /uploads/fotosProdutos/harmonium-verso.png, /uploads/fotosProdutos/harmonium-verso-sem-fundo.png'),(45,'362094','Bandoneón Clássico Argentino','A classic Argentine bandoneon with black wooden body, pearl buttons, open bellows, photographed under soft tango-style lighting.','Mogno preto com botões de madrepérola.','Instrumento típico do tango, som expressivo e melancólico.','Preto Piano','#111111',NULL,5,11800.00,7080.00,'/uploads/fotosProdutos/bandoneon-frente.png, /uploads/fotosProdutos/bandoneon-frente-sem-fundo.png, /uploads/fotosProdutos/bandoneon-verso.png, /uploads/fotosProdutos/bandoneon-verso-sem-fundo.png'),(46,'142693','Amplificador de Guitarra (Combo)','A combo guitar amplifier with black tolex finish, silver grille cloth, control knobs on top, photographed in a recording studio with moody lighting.','Caixa em MDF revestida com courvin preto e tela prateada.','Potência de 40W RMS, ideal para ensaios e pequenos shows.','Preto Fosco','#1C1C1C',NULL,6,2800.00,1680.00,'/uploads/fotosProdutos/amplificador-de-guitarra-frente.png, /uploads/fotosProdutos/amplificador-de-guitarra-frente-sem-fundo.png, /uploads/fotosProdutos/amplificador-de-guitarra-verso.png, /uploads/fotosProdutos/amplificador-de-guitarra-verso-sem-fundo.png'),(47,'587420','Amplificador de Guitarra (Cabeçote)','A guitar amp head with metal chassis and glowing tubes, placed on top of a speaker cabinet, illuminated by warm stage lighting.','Chassi metálico e válvulas EL34.','Cabeçote valvulado de 100W com canal limpo e drive.','Preto com Detalhes Dourados','#2B2B2B',NULL,6,6200.00,3720.00,'/uploads/fotosProdutos/cabecote-amplificador-guitarra-frente.png, /uploads/fotosProdutos/cabecote-amplificador-guitarra-frente-sem-fundo.png, /uploads/fotosProdutos/cabecote-amplificador-guitarra-verso.png, /uploads/fotosProdutos/cabecote-amplificador-guitarra-verso-sem-fundo.png'),(48,'904315','Amplificador de Baixo (Combo)','A bass combo amplifier with a large speaker grille, dark design, photographed in a rehearsal room environment.','Gabinete em madeira laminada, alto-falante de 15\".','Som encorpado, equalizador ativo de 3 bandas.','Preto Texturizado','#000000',NULL,6,4800.00,2880.00,'/uploads/fotosProdutos/amplificador-de-baixo-frente.png, /uploads/fotosProdutos/amplificador-de-baixo-frente-sem-fundo.png, /uploads/fotosProdutos/amplificador-de-baixo-verso.png, /uploads/fotosProdutos/amplificador-de-baixo-verso-sem-fundo.png'),(49,'231867','Amplificador de Violão (Acústico)','An acoustic guitar amplifier with wooden panel design, control knobs on top, natural light studio photography.','Painel frontal em madeira e circuito transistorado.','Canal duplo com entrada para microfone e violão.','Madeira Natural','#B8860B',NULL,6,3600.00,2160.00,'/uploads/fotosProdutos/amplificador-de-violao-frente.png, /uploads/fotosProdutos/amplificador-de-violao-frente-sem-fundo.png, /uploads/fotosProdutos/amplificador-de-violao-verso.png, /uploads/fotosProdutos/amplificador-de-violao-verso-sem-fundo.png'),(50,'512479','Caixa Acústica (Passiva)','A passive loudspeaker with black grille and metal handles, photographed in a concert setup with stage lights.','Gabinete em MDF com grade metálica e alças laterais.','Suporta até 300W RMS de potência.','Preto Texturizado','#1E1E1E',NULL,6,2100.00,1260.00,'/uploads/fotosProdutos/caixa-acustica-passiva-frente.png, /uploads/fotosProdutos/caixa-acustica-passiva-frente-sem-fundo.png, /uploads/fotosProdutos/caixa-acustica-passiva-verso.png, /uploads/fotosProdutos/caixa-acustica-passiva-verso-sem-fundo.png'),(51,'784632','Mesa de Som (Digital)','A digital audio mixing console with touchscreen and illuminated faders, placed in a modern studio under dim light.','Corpo em alumínio escovado e superfície sensível ao toque.','32 canais digitais com efeitos integrados.','Prata Industrial','#D3D3D3',NULL,6,12500.00,7500.00,'/uploads/fotosProdutos/mesa-de-som-digital-frente.png, /uploads/fotosProdutos/mesa-de-som-digital-frente-sem-fundo.png, /uploads/fotosProdutos/mesa-de-som-digital-verso.png, /uploads/fotosProdutos/mesa-de-som-digital-verso-sem-fundo.png'),(52,'345971','Microfone Dinâmico (Shure SM58 Style)','A dynamic vocal microphone with metal grille and black body, close-up studio shot, isolated on dark background.','Corpo em alumínio e cápsula dinâmica cardioide.','Ideal para vocais ao vivo e apresentações.','Preto e Prata','#2E2E2E',NULL,6,780.00,468.00,'/uploads/fotosProdutos/microfone-dinamico-frente.png, /uploads/fotosProdutos/microfone-dinamico-frente-sem-fundo.png, /uploads/fotosProdutos/microfone-dinamico-verso.png, /uploads/fotosProdutos/microfone-dinamico-verso-sem-fundo.png'),(53,'679124','Microfone Condensador (Estúdio)','A large diaphragm condenser microphone mounted on a shock mount with pop filter, in a professional recording booth.','Corpo metálico prateado com suporte anti-vibração.','Resposta de frequência de 20Hz a 20kHz.','Prateado','#DCDCDC',NULL,6,2100.00,1260.00,'/uploads/fotosProdutos/microfone-estudio-frente.png, /uploads/fotosProdutos/microfone-estudio-frente-sem-fundo.png, /uploads/fotosProdutos/microfone-estudio-verso.png, /uploads/fotosProdutos/microfone-estudio-verso-sem-fundo.png'),(54,'912570','Monitor de Áudio (De Referência)','A studio reference monitor speaker with black matte finish, yellow cone, placed on a mixing desk with computer screens.','Gabinete de MDF, tweeter de seda e woofer Kevlar 5”.','Sonorização flat ideal para mixagem.','Preto com Amarelo','#222222',NULL,6,3800.00,2280.00,'/uploads/fotosProdutos/monitor-audio-referencia-frente.png, /uploads/fotosProdutos/monitor-audio-referencia-frente-sem-fundo.png, /uploads/fotosProdutos/monitor-audio-referencia-verso.png, /uploads/fotosProdutos/monitor-audio-referencia-verso-sem-fundo.png'),(55,'159804','Monitor de Áudio (De Palco)','A wedge-shaped stage monitor speaker on the floor, photographed in a live concert setting with stage lights and cables.','Gabinete inclinado com revestimento antiderrapante.','Potência de 250W RMS, excelente retorno de palco.','Preto Fosco','#1C1C1C',NULL,6,2950.00,1770.00,'/uploads/fotosProdutos/monitor-audio-palco-frente.png, /uploads/fotosProdutos/monitor-audio-palco-frente-sem-fundo.png, /uploads/fotosProdutos/monitor-audio-palco-verso.png, /uploads/fotosProdutos/monitor-audio-palco-verso-sem-fundo.png'),(56,'604823','Interface de Áudio (4+ Canais)','A professional multi-channel audio interface with multiple inputs and outputs, metal rackmount design, illuminated by cool studio light.','Carcaça metálica com conexões balanceadas XLR e TRS.','Compatível com Windows, macOS e Linux.','Prateado','#C0C0C0',NULL,6,4100.00,2460.00,'/uploads/fotosProdutos/interface-audio-frente.png, /uploads/fotosProdutos/interface-audio-frente-sem-fundo.png, /uploads/fotosProdutos/interface-audio-verso.png, /uploads/fotosProdutos/interface-audio-verso-sem-verso.png'),(57,'837295','Fones (Over-ear de Estúdio)','Closed-back over-ear studio headphones with coiled cable, photographed on a mixing desk in soft lighting.','Almofadas em couro sintético e drivers de 40mm.','Design confortável para longas sessões.','Preto Fosco','#111111',NULL,6,890.00,534.00,'/uploads/fotosProdutos/headset-frente.png, /uploads/fotosProdutos/headset-frente-sem-fundo.png, /uploads/fotosProdutos/headset-verso.png, /uploads/fotosProdutos/headset-verso-sem-fundo.png'),(58,'498731','Fones (In-ear de Palco)','Professional in-ear monitor earphones with transparent housing and cable, photographed on a stage background with subtle light reflections.','Carcaça transparente e cabos removíveis.','Resposta precisa, ideal para músicos ao vivo.','Transparente','#EAEAEA',NULL,6,1250.00,750.00,'/uploads/fotosProdutos/fone-ouvido-frente.png, /uploads/fotosProdutos/fone-ouvido-frente-sem-fundo.png, /uploads/fotosProdutos/fone-ouvido-verso.png, /uploads/fotosProdutos/fone-ouvido-verso-sem-fundo.png'),(59,'184523','Cordas Avulsas (Violão Aço / Nylon)','A set of acoustic guitar strings, steel and nylon, neatly packaged with brand label visible, photographed on a wooden table.','Aço niquelado e nylon cristal.','Pacote com 6 cordas, som brilhante e durável.','Prateado e Transparente','#E0E0E0',NULL,7,75.00,45.00,'/uploads/fotosProdutos/corda-violao-frente.png, /uploads/fotosProdutos/corda-violao-frente-sem-fundo'),(60,'537916','Cordas Avulsas (Guitarra)','Electric guitar string set with colorful ball ends, metallic shine under studio lighting, placed beside a guitar headstock.','Aço inoxidável niquelado.','Calibre 0.10 – som equilibrado e boa resistência.','Metálico','#B0B0B0',NULL,7,80.00,48.00,'/uploads/fotosProdutos/corda-guitarra-frente.png, /uploads/fotosProdutos/corda-guitarra-frente-sem-fundo.png'),(61,'972184','Cordas Avulsas (Baixo 4c / 5c)','Bass guitar string set with thick nickel wound coils, photographed close-up on a dark textured background.','Aço niquelado com núcleo hexagonal.','Som grave potente e sustain longo.','Prateado','#C0C0C0',NULL,7,120.00,72.00,'/uploads/fotosProdutos/corda-baixo-frente.png, /uploads/fotosProdutos/corda-baixo-frente-sem-fundo.png'),(62,'405768','Cordas Avulsas (Violino)','Violin string set in elegant packaging, photographed on a wooden violin body in soft natural light.','Aço cromado com alma sintética.','Timbre doce e projeção refinada.','Prateado','#CCCCCC',NULL,7,130.00,78.00,'/uploads/fotosProdutos/corda-violino-frente.png, /uploads/fotosProdutos/corda-violino-frente-sem-fundo.png'),(63,'619845','Palheta (Nylon)','A close-up of nylon guitar picks in different colors and thicknesses, scattered on a wooden table under soft light.','Nylon flexível e durável.','Pacote com 10 unidades de diferentes espessuras.','Sortido','#AAAAAA',NULL,7,25.00,15.00,'/uploads/fotosProdutos/palheta-nylon.png, /uploads/fotosProdutos/palheta-nylon-sem-fundo.png'),(64,'826493','Palheta (Tortex)','Colorful tortex guitar picks with matte texture, arranged in a fan pattern on a clean white background.','Tortex antiderrapante.','Pacote com 10 unidades de timbre equilibrado e pegada firme.','Sortido','#D3D3D3',NULL,7,30.00,18.00,'/uploads/fotosProdutos/palheta-tortex.png, /uploads/fotosProdutos/palheta-tortex-sem-fundo.png'),(65,'540128','Palheta (Jazz)','Small jazz guitar picks with pointed tips, black and red colors, photographed close-up on an amplifier surface.','Nylon rígido com ponta afiada.','Pacote com 10 unidades de design pequeno para precisão máxima.','Preto e Vermelho','#8B0000',NULL,7,35.00,21.00,'/uploads/fotosProdutos/palheta-jazz.png, /uploads/fotosProdutos/palheta-jazz-sem-fundo.png'),(66,'763910','Capotraste (Violão e Guitarra)','A sleek aluminum guitar capo clipped onto an acoustic guitar neck, photographed with natural lighting.','Alumínio anodizado com mola reforçada.','Ajuste rápido e fixação firme.','Prata Escovado','#C0C0C0',NULL,7,90.00,54.00,'/uploads/fotosProdutos/capotraste.png, /uploads/fotosProdutos/capotraste-sem-fundo.png'),(67,'231640','Estante (De Partitura)','A foldable black music stand holding sheet music, photographed in a rehearsal room with soft lighting.','Aço leve dobrável com trava de altura.','Altura ajustável e base reforçada.','Preto Fosco','#222222',NULL,7,250.00,150.00,'/uploads/fotosProdutos/estande-partitura-frente.png, /uploads/fotosProdutos/estande-partitura-frente-sem-fundo.png, /uploads/fotosProdutos/estande-partitura-verso.png, /uploads/fotosProdutos/estande-partitura-verso-sem-fundo.png'),(68,'658319','Estante (Para Teclado)','A double-X keyboard stand supporting an electronic keyboard, photographed on a stage background.','Aço tubular com ajuste rápido.','Compatível com teclados de até 88 teclas.','Preto Brilhante','#000000',NULL,7,310.00,186.00,'/uploads/fotosProdutos/estande-teclado-frente.png, /uploads/fotosProdutos/estande-teclado-frente-sem-fundo.png, /uploads/fotosProdutos/estande-teclado-verso.png, /uploads/fotosProdutos/estande-teclado-verso-sem-fundo.png'),(69,'874590','Pedal de Efeito (Distortion / Overdrive)','Guitar distortion pedal with metal casing and control knobs, glowing LED light, placed on a pedalboard.','Carcaça metálica com potenciômetros duplos.','Som encorpado e quente, estilo vintage.','Laranja Metálico','#FF8C00',NULL,7,520.00,312.00,'/uploads/fotosProdutos/pedal-distortion.png, /uploads/fotosProdutos/pedal-distorcion-sem-fundo.png'),(70,'982410','Pedal de Efeito (Chorus / Delay)','Chorus and delay guitar pedals with colorful designs and multiple control knobs, photographed in studio lighting.','Metal anodizado com circuito analógico.','Efeitos clássicos para ambiência e modulação.','Azul Claro','#87CEEB',NULL,7,580.00,348.00,'/uploads/fotosProdutos/pedal-chorus-delay.png, /uploads/fotosProdutos/pedal-chorus-delay-sem-fundo.png'),(71,'490175','Pedal de Efeito (Looper)','Compact looper pedal with record and play buttons, photographed on a pedalboard setup.','Metal com botão de acionamento reforçado.','Grava e reproduz loops em tempo real.','Vermelho','#B22222',NULL,7,640.00,384.00,'/uploads/fotosProdutos/pedal-looper.png, /uploads/fotosProdutos/pedal-looper-sem-fundo.png'),(72,'304987','Cabo P10 (Instrumento)','Instrument cable with 1/4 inch (P10) jacks, coiled neatly beside an amplifier, photographed with soft shadows.','Fios de cobre com blindagem dupla e conectores niquelados.','Comprimento de 5 metros, baixa interferência.','Preto','#1C1C1C',NULL,7,90.00,54.00,'/uploads/fotosProdutos/cabo-p10.png, /uploads/fotosProdutos/cabo-p10-sem-fundo.png'),(73,'790246','Cabo XLR (Microfone)','Professional XLR microphone cable with metal connectors, coiled on a studio desk next to a condenser microphone.','Condutor em cobre livre de oxigênio.','Comprimento de 3 metros, ideal para estúdios.','Preto','#000000',NULL,7,110.00,66.00,'/uploads/fotosProdutos/cabo-xlr.png, /uploads/fotosProdutos/cabo-xlr-sem-fundo.png'),(74,'628354','Suporte (Para Guitarra/Violão)','A-frame guitar stand holding an acoustic guitar, photographed in a cozy music studio setting.','Aço dobrável com proteção em borracha.','Estável e compacto para transporte.','Preto','#1E1E1E',NULL,7,210.00,126.00,'/uploads/fotosProdutos/suporte-guitarra.png, /uploads/fotosProdutos/suporte-guitarra-sem-fundo.png'),(75,'562893','Suporte (Para Microfone)','Adjustable microphone stand with boom arm, holding a studio microphone, illuminated by soft lighting.','Aço leve com base redonda e braço telescópico.','Ajustável em altura e ângulo.','Preto','#000000',NULL,7,260.00,156.00,'/uploads/fotosProdutos/suporte-microfone.png, /uploads/fotosProdutos/suporte-microfone-sem-fundo.png'),(76,'981430','Case Rígido (Instrumento)','Hard guitar case made of black leather with metal latches, opened slightly showing plush red interior.','MDF revestido em couro sintético e interior aveludado.','Proteção premium para instrumentos de corda.','Preto com Vermelho','#111111',NULL,7,720.00,432.00,'/uploads/fotosProdutos/case-guitarra.png, /uploads/fotosProdutos/case-guitarra-sem-fundo.png, /uploads/fotosProdutos/case-guitarra-fechada.png, /uploads/fotosProdutos/case-guitarra-fechada-sem-fundo.png'),(77,'435219','Bag Soft (Instrumento)','Soft padded gig bag for acoustic guitar with shoulder straps, standing upright on a white background.','Tecido impermeável com alças acolchoadas.','Bolso frontal e reforço traseiro.','Preto','#000000',NULL,7,350.00,210.00,'/uploads/fotosProdutos/case-tecido.png, /uploads/fotosProdutos/case-tecido-sem-fundo.png, /uploads/fotosProdutos/case-tecido-verso.png, /uploads/fotosProdutos/case-tecido-verso-sem-fundo.png'),(78,'720158','Afinador Eletrônico (Clip)','Clip-on guitar tuner attached to the headstock, with illuminated display showing tuning note.','Corpo em ABS e visor LCD colorido.','Rotação 360° e alta precisão de leitura.','Preto','#1A1A1A',NULL,7,150.00,90.00,'/uploads/fotosProdutos/afinador-clipe.png, /uploads/fotosProdutos/afinador-clipe-sem-fundo.png, /uploads/fotosProdutos/afinador-clipe-verso.png, /uploads/fotosProdutos/afinador-clipe-verso-sem-fundo.png'),(79,'298504','Afinador Eletrônico (Pedal)','Pedal tuner with LED display, placed on a pedalboard among other effects pedals, photographed under stage light.','Metal resistente com visor de LED brilhante.','Bypass silencioso, ideal para shows.','Prata e Azul','#C0C0C0',NULL,7,430.00,258.00,'/uploads/fotosProdutos/afinador-pedal.png, /uploads/fotosProdutos/afinador-pedal-sem-fundo.png'),(80,'854763','Baquetas (Madeira - Maple/Hickory)','Pair of wooden drumsticks made from maple and hickory, lying on a snare drum surface in a drum kit setup.','Madeira tratada de alta densidade.','Equilíbrio e resposta natural.','Mogno Claro','#CD853F',NULL,7,70.00,42.00,'/uploads/fotosProdutos/baqueta-madeira.png, /uploads/fotosProdutos/baqueta-madeira-sem-fundo.png'),(81,'187642','Baquetas (Nylon Tip)','Drumsticks with nylon tips resting on cymbals, photographed close-up with warm stage lighting.','Corpo em hickory e ponta em nylon resistente.','Ideal para performances ao vivo e gravações.','Natural e Branco','#EEE8AA',NULL,7,85.00,51.00,'/uploads/fotosProdutos/baqueta-nylon.png, /uploads/fotosProdutos/baqueta-nylon-sem-fundo.png');
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos_fornecedores`
--

DROP TABLE IF EXISTS `produtos_fornecedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos_fornecedores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_produto` int(11) NOT NULL,
  `id_fornecedor` int(11) NOT NULL,
  `codigo_fornecedor` varchar(100) DEFAULT NULL,
  `custo` decimal(10,2) DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_prod_for` (`id_produto`,`id_fornecedor`),
  KEY `fk_pf_forn` (`id_fornecedor`),
  CONSTRAINT `fk_pf_forn` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedores` (`id_fornecedor`),
  CONSTRAINT `fk_pf_prod` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos_fornecedores`
--

LOCK TABLES `produtos_fornecedores` WRITE;
/*!40000 ALTER TABLE `produtos_fornecedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `produtos_fornecedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variacoes_produto`
--

DROP TABLE IF EXISTS `variacoes_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variacoes_produto` (
  `id_variacao` int(11) NOT NULL AUTO_INCREMENT,
  `sku` varchar(6) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `nome_cor` varchar(150) NOT NULL,
  `cor` text NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `custo_producao` decimal(10,2) DEFAULT NULL,
  `desconto` int(11) DEFAULT NULL,
  `imagem` text DEFAULT NULL,
  `status` enum('Ativo','Inativo') DEFAULT 'Ativo',
  `data_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_variacao`),
  UNIQUE KEY `sku` (`sku`),
  KEY `fk_var_prod` (`id_produto`),
  CONSTRAINT `fk_var_prod` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variacoes_produto`
--

LOCK TABLES `variacoes_produto` WRITE;
/*!40000 ALTER TABLE `variacoes_produto` DISABLE KEYS */;
INSERT INTO `variacoes_produto` VALUES (1,'384201',1,'Natural Fosco','#d6b08a',950.00,350.00,0,'/uploads/fotosProdutos/violao-nylon-fosco-frente.png, /uploads/fotosProdutos/violao-nylon-fosco-frente-sem-fundo.png, /uploads/fotosProdutos/violao-nylon-fosco-costa.png, /uploads/fotosProdutos/violao-nylon-fosco-costa-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(2,'928473',1,'Preto Brilhante','#1a1a1a',950.00,370.00,0,'/uploads/fotosProdutos/violao-nylon-preto-frente.png, /uploads/fotosProdutos/violao-nylon-preto-frente-sem-fundo.png, /uploads/fotosProdutos/violao-nylon-preto-verso.png, /uploads/fotosProdutos/violao-nylon-preto-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(3,'572931',2,'Sunburst','#a25a2c',1350.00,420.00,0,'/uploads/fotosProdutos/violao-aco-sunburst-frente.png, /uploads/fotosProdutos/violao-aco-sunburst-frente-sem-fundo.png, /uploads/fotosProdutos/violao-aco-sunburst-verso.png, /uploads/fotosProdutos/violao-aco-sunburst-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(4,'148625',2,'Natural Claro','#e1a965',1350.00,400.00,0,'/uploads/fotosProdutos/violao-aco-claro-frente.png, /uploads/fotosProdutos/violao-aco-claro-frente-sem-fundo.png, /uploads/fotosProdutos/violao-aco-claro-verso.png, /uploads/fotosProdutos/violao-aco-claro-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(5,'639218',3,'Bege com Escudo Preto','#d5c39e',4200.00,580.00,5,'/uploads/fotosProdutos/guitarra-stratocaster-bege-frente.png, /uploads/fotosProdutos/guitarra-stratocaster-bege-frente-sem-fundo.png, /uploads/fotosProdutos/guitarra-stratocaster-bege-verso.png, /uploads/fotosProdutos/guitarra-stratocaster-bege-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(6,'283915',3,'Vermelha Metálica','#b22222',4200.00,590.00,0,'/uploads/fotosProdutos/guitarra-stratocaster-vermelha-frente.png, /uploads/fotosProdutos/guitarra-stratocaster-vermelha-frente-sem-fundo.png, /uploads/fotosProdutos/guitarra-stratocaster-vermelha-verso.png, /uploads/fotosProdutos/guitarra-stratocaster-vermelha-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(7,'496307',3,'Azul Vintage','#4682b4',4200.00,590.00,0,'/uploads/fotosProdutos/guitarra-stratocaster-azul-frente.png, /uploads/fotosProdutos/guitarra-stratocaster-azul-frente-sem-fundo.png, /uploads/fotosProdutos/guitarra-stratocaster-azul-verso.png, /uploads/fotosProdutos/guitarra-stratocaster-azul-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(8,'801624',4,'Cherry Sunburst','#a03a2b',5600.00,650.00,0,'/uploads/fotosProdutos/guitarra-lespaul-sunburst-frente.png, /uploads/fotosProdutos/guitarra-lespaul-sunburst-frente-sem-fundo.png, /uploads/fotosProdutos/guitarra-lespaul-sunburst-verso.png, /uploads/fotosProdutos/guitarra-lespaul-sunburst-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(9,'953710',4,'Gold Top','#d4af37',5600.00,670.00,0,'/uploads/fotosProdutos/guitarra-lespaul-gold-frente.png, /uploads/fotosProdutos/guitarra-lespaul-gold-frente-sem-fundo.png, /uploads/fotosProdutos/guitarra-lespaul-gold-verso.png, /uploads/fotosProdutos/guitarra-lespaul-gold-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(10,'390862',6,'Preto Clássico','#0d0d0d',3700.00,510.00,0,'/uploads/fotosProdutos/baixo-eletrico-jazz-bass-preto-frente.png, /uploads/fotosProdutos/baixo-eletrico-jazz-bass-preto-frente-sem-fundo.png, /uploads/fotosProdutos/baixo-eletrico-jazz-bass-preto-verso.png, /uploads/fotosProdutos/baixo-eletrico-jazz-bass-preto-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(11,'627839',7,'Branco Vintage','#f8f8f8',3900.00,530.00,0,'/uploads/fotosProdutos/baixo-eletrico-precision-bass-branco-frente.png, /uploads/fotosProdutos/baixo-eletrico-precision-bass-branco-frente-sem-fundo.png, /uploads/fotosProdutos/baixo-eletrico-precision-bass-branco-verso.png, /uploads/fotosProdutos/baixo-eletrico-precision-bass-branco-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(12,'512046',7,'Azul Marinho','#001f3f',3900.00,540.00,0,'/uploads/fotosProdutos/baixo-eletrico-precision-bass-azul-frente.png, /uploads/fotosProdutos/baixo-eletrico-precision-bass-azul-frente-sem-fundo.png, /uploads/fotosProdutos/baixo-eletrico-precision-bass-azul-verso.png, /uploads/fotosProdutos/baixo-eletrico-precision-bass-azul-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(13,'749320',8,'Natural Polido','#e3b778',1600.00,380.00,0,'/uploads/fotosProdutos/viola-caipira-12-cordas-polido-frente.png, /uploads/fotosProdutos/viola-caipira-12-cordas-polido-frente-sem-fundo.png, /uploads/fotosProdutos/viola-caipira-12-cordas-polido-verso.png, /uploads/fotosProdutos/viola-caipira-12-cordas-polido-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(14,'801357',8,'Cerejeira Escura','#8b3a3a',1600.00,390.00,0,'/uploads/fotosProdutos/viola-caipira-12-cordas-cerejeira-frente.png, /uploads/fotosProdutos/viola-caipira-12-cordas-cerejeira-frente-sem-fundo.png, /uploads/fotosProdutos/viola-caipira-12-cordas-cerejeira-verso.png, /uploads/fotosProdutos/viola-caipira-12-cordas-cerejeira-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(15,'235891',9,'Madeira Avermelhada','#a0522d',6800.00,460.00,0,'/uploads/fotosProdutos/violino-avermelhado-frente.png, /uploads/fotosProdutos/violino-avermelhado-frente-sem-fundo.png, /uploads/fotosProdutos/violino-avermelhado-verso.png, /uploads/fotosProdutos/violino-avermelhado-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(16,'783024',9,'Marrom Escuro','#4b2e05',6800.00,470.00,0,'/uploads/fotosProdutos/violino-escuro-frente.png, /uploads/fotosProdutos/violino-escuro-frente-sem-fundo.png, /uploads/fotosProdutos/violino-escuro-verso.png, /uploads/fotosProdutos/violino-escuro-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(17,'986435',10,'Natural Envernizado','#c68642',12500.00,750.00,0,'/uploads/fotosProdutos/violoncelo-natural-frente.png, /uploads/fotosProdutos/violoncelo-natural-frente-sem-fundo.png, /uploads/fotosProdutos/violoncelo-natural-verso.png, /uploads/fotosProdutos/violoncelo-natural-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(18,'312759',10,'Cereja Profundo','#6a1b1b',12500.00,760.00,0,'/uploads/fotosProdutos/violoncelo-cereja-frente.png, /uploads/fotosProdutos/violoncelo-cereja-frente-sem-fundo.png, /uploads/fotosProdutos/violoncelo-cereja-verso.png, /uploads/fotosProdutos/violoncelo-cereja-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(19,'470128',11,'Madeira Clara','#f5deb3',480.00,220.00,0,'/uploads/fotosProdutos/ukulele-madeira-frente.png, /uploads/fotosProdutos/ukulele-madeira-frente-sem-fundo.png, /uploads/fotosProdutos/ukulele-madeira-verso.png, /uploads/fotosProdutos/ukulele-madeira-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(20,'942615',11,'Mogno Escuro','#3b1d0a',480.00,230.00,0,'/uploads/fotosProdutos/ukulele-mogno-frente.png, /uploads/fotosProdutos/ukulele-mogno-frente-sem-fundo.png, /uploads/fotosProdutos/ukulele-mogno-verso.png, /uploads/fotosProdutos/ukulele-mogno-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(21,'216903',12,'Natural','#d2a679',1300.00,310.00,0,'/uploads/fotosProdutos/banjo-4cordas-natural-frente.png, /uploads/fotosProdutos/banjo-4cordas-natural-frente-sem-fundo.png, /uploads/fotosProdutos/banjo-4cordas-natural-verso.png, /uploads/fotosProdutos/banjo-4cordas-natural-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(22,'509387',13,'Preto Brilhante','#000000',1300.00,320.00,0,'/uploads/fotosProdutos/cavaquinho-eletrico-preto-frente.png, /uploads/fotosProdutos/cavaquinho-eletrico-preto-frente-sem-fundo.png, /uploads/fotosProdutos/cavaquinho-eletrico-preto-verso.png, /uploads/fotosProdutos/cavaquinho-eletrico-preto-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(23,'379524',14,'Cinza Titânio','#71797e',3500.00,980.00,0,'/uploads/fotosProdutos/bateria-eletrica-cinza-frente.png, /uploads/fotosProdutos/bateria-eletrica-cinza-frente-sem-fundo.png, /uploads/fotosProdutos/bateria-eletrica-cinza-verso.png, /uploads/fotosProdutos/bateria-eletrica-cinza-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(24,'821475',15,'Madeira Clara','#deb887',520.00,240.00,0,'/uploads/fotosProdutos/cajon-flamenco-madeira-frente.png, /uploads/fotosProdutos/cajon-flamenco-madeira-frente-sem-fundo.png, /uploads/fotosProdutos/cajon-flamenco-madeira-verso.png, /uploads/fotosProdutos/cajon-flamenco-madeira-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(25,'295239',15,'Nogal Escuro','#5a3a1a',540.00,250.00,0,'/uploads/fotosProdutos/cajon-flamenco-nogal-frente.png, /uploads/fotosProdutos/cajon-flamenco-nogal-frente-sem-fundo.png, /uploads/fotosProdutos/cajon-flamenco-nogal-verso.png, /uploads/fotosProdutos/cajon-flamenco-nogal-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(26,'473193',16,'Aro Dourado','#cfae30',420.00,190.00,0,'/uploads/fotosProdutos/pandeiro-dourado-frente.png, /uploads/fotosProdutos/pandeiro-dourado-frente-sem-fundo.png, /uploads/fotosProdutos/pandeiro-dourado-verso.png, /uploads/fotosProdutos/pandeiro-dourado-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(27,'849632',16,'Aro Cromado','#c0c0c0',420.00,195.00,0,'/uploads/fotosProdutos/pandeiro-cromado-frente.png, /uploads/fotosProdutos/pandeiro-cromado-frente-sem-fundo.png, /uploads/fotosProdutos/pandeiro-cromado-verso.png, /uploads/fotosProdutos/pandeiro-cromado-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(28,'133921',17,'Prata','#c0c0c0',250.00,160.00,0,'/uploads/fotosProdutos/tamborim-prata-frente.png, /uploads/fotosProdutos/tamborim-prata-frente-sem-fundo.png, /uploads/fotosProdutos/tamborim-prata-verso.png, /uploads/fotosProdutos/tamborim-prata-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(29,'271339',17,'Azul Metálico','#1e3a8a',250.00,170.00,0,'/uploads/fotosProdutos/tamborim-azul-frente.png, /uploads/fotosProdutos/tamborim-azul-frente-sem-fundo.png, /uploads/fotosProdutos/tamborim-azul-verso.png, /uploads/fotosProdutos/tamborim-azul-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(30,'504856',18,'Madeira Natural','#b8860b',1600.00,480.00,0,'/uploads/fotosProdutos/conga-madeira-frente.png, /uploads/fotosProdutos/conga-madeira-frente-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(31,'639442',18,'Vermelho Vinil','#570000',1600.00,490.00,0,'/uploads/fotosProdutos/conga-vermelho-frente.png, /uploads/fotosProdutos/conga-vermelho-frente-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(32,'811223',19,'Madeira Clara','#d2b48c',1100.00,320.00,0,'/uploads/fotosProdutos/bongo-madeira-frente.png, /uploads/fotosProdutos/bongo-madeira-frente-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(33,'513958',19,'Marrom Escuro','#4b2e05',1100.00,330.00,0,'/uploads/fotosProdutos/bongo-marrom-frente.png, /uploads/fotosProdutos/bongo-marrom-frente-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(34,'722326',20,'Alumínio Escovado','#929187',1800.00,410.00,0,'/uploads/fotosProdutos/surdo-aluminio-frente.png, /uploads/fotosProdutos/surdo-aluminio-frente-sem-fundo.png, /uploads/fotosProdutos/surdo-aluminio-verso.png, /uploads/fotosProdutos/surdo-aluminio-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(35,'493107',20,'Preto Fosco','#2b2b2b',1800.00,420.00,0,'/uploads/fotosProdutos/surdo-preto-frente.png, /uploads/fotosProdutos/surdo-preto-frente-sem-fundo.png, /uploads/fotosProdutos/surdo-preto-verso.png, /uploads/fotosProdutos/surdo-preto-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(36,'239701',21,'Metálico','#ecb520',160.00,80.00,0,'/uploads/fotosProdutos/triangulo-metalico-frente.png, /uploads/fotosProdutos/triangulo-metalico-frente-sem-fundo.png, /uploads/fotosProdutos/triangulo-metalico-verso.png, /uploads/fotosProdutos/triangulo-metalico-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(37,'594813',21,'Cromado','#a4a39e',160.00,85.00,0,'/uploads/fotosProdutos/triangulo-cromado-frente.png, /uploads/fotosProdutos/triangulo-cromado-frente-sem-fundo.png, /uploads/fotosProdutos/triangulo-cromado-verso.png, /uploads/fotosProdutos/triangulo-cromado-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(38,'371249',22,'Natural Envernizado','#d9a066',890.00,380.00,0,'/uploads/fotosProdutos/tantan-envernizado-frente.png, /uploads/fotosProdutos/tantan-envernizado-frente-sem-fundo.png, /uploads/fotosProdutos/tantan-envernizado-cima.png, /uploads/fotosProdutos/tantan-envernizado-cima-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(39,'942810',22,'Cerejeira','#8b3a3a',890.00,385.00,0,'/uploads/fotosProdutos/tantan-cerejeira-frente.png, /uploads/fotosProdutos/tantan-cerejeira-frente-sem-fundo.png, /uploads/fotosProdutos/tantan-cerejeira-cima.png, /uploads/fotosProdutos/tantan-cerejeira-cima-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(40,'816432',23,'Natural','#deb887',350.00,110.00,0,'/uploads/fotosProdutos/reco-reco-madeira-frente.png, /uploads/fotosProdutos/reco-reco-madeira-frente-sem-fundo.png, /uploads/fotosProdutos/reco-reco-madeira-cima.png, /uploads/fotosProdutos/reco-reco-madeira-cima-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(41,'504297',23,'Madeira Escura','#4e342e',350.00,120.00,0,'/uploads/fotosProdutos/reco-reco-escuro-cima.png, /uploads/fotosProdutos/reco-reco-escuro-cima-sem-fundo.png, /uploads/fotosProdutos/reco-reco-escuro-frente.png, /uploads/fotosProdutos/reco-reco-escuro-frente-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(42,'358901',24,'Colorido','#eb3b28',680.00,150.00,0,'/uploads/fotosProdutos/xilofone-colorido-frente.png, /uploads/fotosProdutos/xilofone-colorido-frente-sem-fundo.png, /uploads/fotosProdutos/xilofone-colorido-em-pe.png, /uploads/fotosProdutos/xilofone-colorido-em-pe-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(43,'628430',24,'Natural Educacional','#b3c9c6',680.00,160.00,0,'/uploads/fotosProdutos/xilofone-educacional-frente.png, /uploads/fotosProdutos/xilofone-educacional-frente-sem-fundo.png, /uploads/fotosProdutos/xilofone-educacional-verso.png, /uploads/fotosProdutos/xilofone-educacional-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(44,'975621',25,'Madeira Escura','#a06b34',5800.00,750.00,0,'/uploads/fotosProdutos/marimba-escura-frente.png, /uploads/fotosProdutos/marimba-escura-frente-sem-fundo.png, /uploads/fotosProdutos/marimba-escura-verso.png, /uploads/fotosProdutos/marimba-escura-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(45,'134759',25,'Nogal Premium','#632001',5800.00,780.00,0,'/uploads/fotosProdutos/marimba-nogal-frente.png, /uploads/fotosProdutos/marimba-nogal-frente-sem-fundo.png, /uploads/fotosProdutos/marimba-nogal-verso.png, /uploads/fotosProdutos/marimba-nogal-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(46,'341681',27,'Branco Pérola','#f5f5f0',58000.00,2900.00,0,'/uploads/fotosProdutos/piano-acustico-cauda-branco-frente.png, /uploads/fotosProdutos/piano-acustico-cauda-branco-frente-sem-fundo.png, /uploads/fotosProdutos/piano-acustico-cauda-branco-verso.png, /uploads/fotosProdutos/piano-acustico-cauda-branco-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(47,'765584',27,'Mogno Envernizado','#4a1f0a',58000.00,2950.00,0,'/uploads/fotosProdutos/piano-acustico-cauda-mogno-frente.png, /uploads/fotosProdutos/piano-acustico-cauda-mogno-frente-sem-fundo.png, /uploads/fotosProdutos/piano-acustico-cauda-mogno-verso.png, /uploads/fotosProdutos/piano-acustico-cauda-mogno-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(48,'105372',28,'Nogal Escuro','#3e2723',28500.00,2300.00,0,'/uploads/fotosProdutos/piano-acustico-vertical-nogal-frente.png, /uploads/fotosProdutos/piano-acustico-vertical-nogal-frente-sem-fundo.png, /uploads/fotosProdutos/piano-acustico-vertical-nogal-verso.png, /uploads/fotosProdutos/piano-acustico-vertical-nogal-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(49,'982603',28,'Preto Fosco','#1a1a1a',28500.00,2250.00,0,'/uploads/fotosProdutos/piano-acustico-vertical-preto-frente.png, /uploads/fotosProdutos/piano-acustico-vertical-preto-frente-sem-fundo.png, /uploads/fotosProdutos/piano-acustico-vertical-preto-verso.png, /uploads/fotosProdutos/piano-acustico-vertical-preto-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(50,'508436',29,'Preto Clássico','#0d0d0d',4200.00,1800.00,0,'/uploads/fotosProdutos/piano-digital-portatil-preto-frente.png, /uploads/fotosProdutos/piano-digital-portatil-preto-frente-sem-fundo.png, /uploads/fotosProdutos/piano-digital-portatil-preto-verso.png, /uploads/fotosProdutos/piano-digital-portatil-preto-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(51,'650921',29,'Branco Neve','#f8f8ff',4200.00,1820.00,0,'/uploads/fotosProdutos/piano-digital-portatil-branco-frente.png, /uploads/fotosProdutos/piano-digital-portatil-branco-frente-sem-fundo.png, /uploads/fotosProdutos/piano-digital-portatil-branco-verso.png, /uploads/fotosProdutos/piano-digital-portatil-branco-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(52,'289374',30,'Nogal Escuro','#3b2e2a',6400.00,1900.00,0,'/uploads/fotosProdutos/piano-digital-movel-nogal-frente.png, /uploads/fotosProdutos/piano-digital-movel-nogal-frente-sem-fundo.png, /uploads/fotosProdutos/piano-digital-movel-nogal-verso.png, /uploads/fotosProdutos/piano-digital-movel-nogal-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(53,'964802',30,'Preto Satin','#2b2b2b',6400.00,1920.00,0,'/uploads/fotosProdutos/piano-digital-movel-preto-frente.png, /uploads/fotosProdutos/piano-digital-movel-preto-frente-sem-fundo.png, /uploads/fotosProdutos/piano-digital-movel-preto-verso.png, /uploads/fotosProdutos/piano-digital-movel-preto-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(54,'834721',31,'Preto com Display Azul','#101820',7500.00,2000.00,0,'/uploads/fotosProdutos/teclado-arranjador-preto-frente.png, /uploads/fotosProdutos/teclado-arranjador-preto-frente-sem-fundo.png, /uploads/fotosProdutos/teclado-arranjador-preto-verso.png, /uploads/fotosProdutos/teclado-arranjador-preto-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(55,'413580',31,'Cinza Grafite','#545454',7500.00,2050.00,0,'/uploads/fotosProdutos/teclado-arranjador-cinza-frente.png, /uploads/fotosProdutos/teclado-arranjador-cinza-frente-sem-fundo.png, /uploads/fotosProdutos/teclado-arranjador-cinza-verso.png, /uploads/fotosProdutos/teclado-arranjador-cinza-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(56,'247690',32,'Preto Compacto','#181818',980.00,900.00,0,'/uploads/fotosProdutos/teclado-controlador-midi-preto-frente.png, /uploads/fotosProdutos/teclado-controlador-midi-preto-frente-sem-fundo.png, /uploads/fotosProdutos/teclado-controlador-midi-preto-verso.png, /uploads/fotosProdutos/teclado-controlador-midi-preto-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(57,'958301',32,'Branco Studio','#f3f3f3',980.00,920.00,0,'/uploads/fotosProdutos/teclado-controlador-midi-branco-frente.png, /uploads/fotosProdutos/teclado-controlador-midi-branco-frente-sem-fundo.png, /uploads/fotosProdutos/teclado-controlador-midi-branco-verso.png, /uploads/fotosProdutos/teclado-controlador-midi-branco-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(58,'736294',33,'Preto Espacial','#0c0c0c',8900.00,1500.00,0,'/uploads/fotosProdutos/sintetizador-digital-preto-frente.png, /uploads/fotosProdutos/sintetizador-digital-preto-frente-sem-fundo.png, /uploads/fotosProdutos/sintetizador-digital-preto-verso.png, /uploads/fotosProdutos/sintetizador-digital-preto-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(59,'182653',33,'Cinza Metálico','#757575',8900.00,1520.00,0,'/uploads/fotosProdutos/sintetizador-digital-cinza-frente.png, /uploads/fotosProdutos/sintetizador-digital-cinza-frente-sem-fundo.png, /uploads/fotosProdutos/sintetizador-digital-cinza-verso.png, /uploads/fotosProdutos/sintetizador-digital-cinza-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(60,'394820',33,'Vermelho Studio','#a61b1b',8900.00,1550.00,0,'/uploads/fotosProdutos/sintetizador-digital-vermelho-frente.png, /uploads/fotosProdutos/sintetizador-digital-vermelho-frente-sem-fundo.png, /uploads/fotosProdutos/sintetizador-digital-vermelho-verso.png, /uploads/fotosProdutos/sintetizador-digital-vermelho-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(61,'184762',34,'Madeira Clara','#d2b48c',350.00,180.00,0,'/uploads/fotosProdutos/flauta-doce-madeira-frente.png, /uploads/fotosProdutos/flauta-doce-madeira-frente-sem-fundo.png, /uploads/fotosProdutos/flauta-doce-madeira-verso.png, /uploads/fotosProdutos/flauta-doce-madeira-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(62,'509347',34,'Ébano Escuro','#2c2c2c',360.00,200.00,0,'/uploads/fotosProdutos/flauta-doce-ebano-frente.png, /uploads/fotosProdutos/flauta-doce-ebano-frente-sem-fundo.png, /uploads/fotosProdutos/flauta-doce-ebano-verso.png, /uploads/fotosProdutos/flauta-doce-ebano-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(63,'936124',35,'Prateada','#c0c0c0',2300.00,850.00,0,'/uploads/fotosProdutos/flauta-transversal-prata-frente.png, /uploads/fotosProdutos/flauta-transversal-prata-frente-sem-fundo.png, /uploads/fotosProdutos/flauta-transversal-prata-verso.png, /uploads/fotosProdutos/flauta-transversal-prata-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(64,'283619',35,'Dourada Luxo','#d4af37',2500.00,900.00,0,'/uploads/fotosProdutos/flauta-transversal-dourado-frente.png, /uploads/fotosProdutos/flauta-transversal-dourado-frente-sem-fundo.png, /uploads/fotosProdutos/flauta-transversal-dourado-verso.png, /uploads/fotosProdutos/flauta-transversal-dourado-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(65,'724819',36,'Lacado Dourado','#ffd700',5100.00,1800.00,0,'/uploads/fotosProdutos/saxofone-alto-dourado-frente.png, /uploads/fotosProdutos/saxofone-alto-dourado-frente-sem-fundo.png, /uploads/fotosProdutos/saxofone-alto-dourado-verso.png, /uploads/fotosProdutos/saxofone-alto-dourado-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(66,'512306',36,'Preto Níquel','#2b2b2b',5200.00,1850.00,0,'/uploads/fotosProdutos/saxofone-alto-preto-frente.png, /uploads/fotosProdutos/saxofone-alto-preto-frente-sem-fundo.png, /uploads/fotosProdutos/saxofone-alto-preto-verso.png, /uploads/fotosProdutos/saxofone-alto-preto-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(67,'748125',37,'Lacado Dourado','#daa520',3900.00,1500.00,0,'/uploads/fotosProdutos/trompete-bb-dourado-frente.png, /uploads/fotosProdutos/trompete-bb-dourado-frente-sem-fundo.png, /uploads/fotosProdutos/trompete-bb-dourado-verso.png, /uploads/fotosProdutos/trompete-bb-dourado-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(68,'514903',37,'Prateado','#dcdcdc',3950.00,1520.00,0,'/uploads/fotosProdutos/trompete-bb-prateado-frente.png, /uploads/fotosProdutos/trompete-bb-prateado-frente-sem-fundo.png, /uploads/fotosProdutos/trompete-bb-prateado-verso.png, /uploads/fotosProdutos/trompete-bb-prateado-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(69,'821390',37,'Rose Gold','#b76e79',4100.00,1550.00,0,'/uploads/fotosProdutos/trompete-bb-rose-frente.png, /uploads/fotosProdutos/trompete-bb-rose-frente-sem-fundo.png, /uploads/fotosProdutos/trompete-bb-rose-verso.png, /uploads/fotosProdutos/trompete-bb-rose-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(70,'284510',38,'Madeira Negra','#1b1b1b',2800.00,980.00,0,'/uploads/fotosProdutos/clarinete-bb-madeira-frente.png, /uploads/fotosProdutos/clarinete-bb-madeira-frente-sem-fundo.png, /uploads/fotosProdutos/clarinete-bb-madeira-verso.png, /uploads/fotosProdutos/clarinete-bb-madeira-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(71,'956201',38,'Ébano Fosco','#3a3a3a',2850.00,990.00,0,'/uploads/fotosProdutos/clarinete-bb-ebano-frente.png, /uploads/fotosProdutos/clarinete-bb-ebano-frente-sem-fundo.png, /uploads/fotosProdutos/clarinete-bb-ebano-verso.png, /uploads/fotosProdutos/clarinete-bb-ebano-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(72,'490836',39,'Corpo Metálico Prateado','#b0b0b0',480.00,220.00,0,'/uploads/fotosProdutos/gaita-harmonica-prata-frente.png, /uploads/fotosProdutos/gaita-harmonica-prata-frente-sem-fundo.png, /uploads/fotosProdutos/gaita-harmonica-prata-verso.png, /uploads/fotosProdutos/gaita-harmonica-prata-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(73,'703982',39,'Corpo Preto','#101010',490.00,230.00,0,'/uploads/fotosProdutos/gaita-harmonica-preto-frente.png, /uploads/fotosProdutos/gaita-harmonica-preto-frente-sem-fundo.png, /uploads/fotosProdutos/gaita-harmonica-preto-verso.png, /uploads/fotosProdutos/gaita-harmonica-preto-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(74,'875624',40,'Madeira Vermelha','#8b3a3a',10200.00,2500.00,0,'/uploads/fotosProdutos/fagote-vermelho-frente.png, /uploads/fotosProdutos/fagote-vermelho-frente-sem-fundo.png, /uploads/fotosProdutos/fagote-vermelho-verso.png, /uploads/fotosProdutos/fagote-vermelho-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(75,'312587',40,'Mogno Escuro','#4b2e05',10300.00,2550.00,0,'/uploads/fotosProdutos/fagote-mogno-frente.png, /uploads/fotosProdutos/fagote-mogno-frente-sem-fundo.png, /uploads/fotosProdutos/fagote-mogno-verso.png, /uploads/fotosProdutos/fagote-mogno-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(76,'936701',41,'Lacado Dourado','#d4af37',7200.00,1900.00,0,'/uploads/fotosProdutos/trompa-dourado-frente.png, /uploads/fotosProdutos/trompa-dourado-frente-sem-fundo.png, /uploads/fotosProdutos/trompa-dourado-verso.png, /uploads/fotosProdutos/trompa-dourado-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(77,'451029',41,'Rose Gold','#b76e79',7400.00,1950.00,0,'/uploads/fotosProdutos/trompa-rose-frente.png, /uploads/fotosProdutos/trompa-rose-frente-sem-fundo.png, /uploads/fotosProdutos/trompa-rose-verso.png, /uploads/fotosProdutos/trompa-rose-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(78,'864203',42,'Prateada','#c0c0c0',3400.00,1300.00,0,'/uploads/fotosProdutos/corneta-prata-frente.png, /uploads/fotosProdutos/corneta-prata-frente-sem-fundo.png, /uploads/fotosProdutos/corneta-prata-verso.png, /uploads/fotosProdutos/corneta-prata-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(79,'527640',42,'Dourada Tradicional','#daa520',3500.00,1320.00,0,'/uploads/fotosProdutos/corneta-dourada-frente.png, /uploads/fotosProdutos/corneta-dourada-frente-sem-fundo.png, /uploads/fotosProdutos/corneta-dourada-verso.png, /uploads/fotosProdutos/corneta-dourada-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(80,'328571',43,'Preto Clássico','#0a0a0a',9600.00,3100.00,0,'/uploads/fotosProdutos/acordeon-preto-frente.png, /uploads/fotosProdutos/acordeon-preto-frente-sem-fundo.png, /uploads/fotosProdutos/acordeon-preto-verso.png, /uploads/fotosProdutos/acordeon-preto-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(81,'459732',43,'Vermelho Rubi','#9b111e',9800.00,3200.00,0,'/uploads/fotosProdutos/acordeon-vermelho-frente.png, /uploads/fotosProdutos/acordeon-vermelho-frente-sem-fundo.png, /uploads/fotosProdutos/acordeon-vermelho-verso.png, /uploads/fotosProdutos/acordeon-vermelho-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(82,'847921',43,'Branco Pérola','#f8f6f0',9900.00,3250.00,0,'/uploads/fotosProdutos/acordeon-branco-frente.png, /uploads/fotosProdutos/acordeon-branco-frente-sem-fundo.png, /uploads/fotosProdutos/acordeon-branco-verso.png, /uploads/fotosProdutos/acordeon-branco-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(83,'176304',44,'Madeira Clara','#deb887',2400.00,850.00,0,'/uploads/fotosProdutos/harmonium-madeira-frente.png, /uploads/fotosProdutos/harmonium-madeira-frente-sem-fundo.png, /uploads/fotosProdutos/harmonium-madeira-verso.png, /uploads/fotosProdutos/harmonium-madeira-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(84,'592817',44,'Nogal Escuro','#4e342e',2600.00,880.00,0,'/uploads/fotosProdutos/harmonium-nogal-frente.png, /uploads/fotosProdutos/harmonium-nogal-frente-sem-fundo.png, /uploads/fotosProdutos/harmonium-nogal-verso.png, /uploads/fotosProdutos/harmonium-nogal-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(85,'701294',45,'Preto Tradicional','#0f0f0f',5600.00,1450.00,0,'/uploads/fotosProdutos/bandoneon-preto-frente.png, /uploads/fotosProdutos/bandoneon-preto-frente-sem-fundo.png, /uploads/fotosProdutos/bandoneon-preto-verso.png, /uploads/fotosProdutos/bandoneon-preto-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(86,'835620',45,'Madeira Envernizada','#5a3a1a',5800.00,1500.00,0,'/uploads/fotosProdutos/bandoneon-madeira-frente.png, /uploads/fotosProdutos/bandoneon-madeira-frente-sem-fundo.png, /uploads/fotosProdutos/bandoneon-madeira-verso.png, /uploads/fotosProdutos/bandoneon-madeira-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(87,'591732',46,'Preto Clássico','#0f0f0f',3100.00,1200.00,0,'/uploads/fotosProdutos/amplificador-de-guitarra-preto-frente.png, /uploads/fotosProdutos/amplificador-de-guitarra-preto-frente-sem-fundo.png, /uploads/fotosProdutos/amplificador-de-guitarra-preto-verso.png, /uploads/fotosProdutos/amplificador-de-guitarra-preto-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(88,'804529',46,'Creme Vintage','#f3e5ab',3200.00,1250.00,0,'/uploads/fotosProdutos/amplificador-de-guitarra-branco-frente.png, /uploads/fotosProdutos/amplificador-de-guitarra-branco-frente-sem-fundo.png, /uploads/fotosProdutos/amplificador-de-guitarra-branco-verso.png, /uploads/fotosProdutos/amplificador-de-guitarra-branco-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(89,'439678',47,'Preto Metálico','#1c1c1c',3400.00,1350.00,0,'/uploads/fotosProdutos/cabecote-amplificador-guitarra-preto-frente.png, /uploads/fotosProdutos/cabecote-amplificador-guitarra-preto-frente-sem-fundo.png, /uploads/fotosProdutos/cabecote-amplificador-guitarra-preto-verso.png, /uploads/fotosProdutos/cabecote-amplificador-guitarra-preto-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(90,'273816',47,'Cromado','#b5b5b5',3500.00,1400.00,0,'/uploads/fotosProdutos/cabecote-amplificador-guitarra-cromado-frente.png, /uploads/fotosProdutos/cabecote-amplificador-guitarra-cromado-frente-sem-fundo.png, /uploads/fotosProdutos/cabecote-amplificador-guitarra-cromado-verso.png, /uploads/fotosProdutos/cabecote-amplificador-guitarra-cromado-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(91,'957230',48,'Preto','#101010',2800.00,1100.00,0,'/uploads/fotosProdutos/amplificador-de-baixo-preto-frente.png, /uploads/fotosProdutos/amplificador-de-baixo-preto-frente-sem-fundo.png, /uploads/fotosProdutos/amplificador-de-baixo-preto-verso.png, /uploads/fotosProdutos/amplificador-de-baixo-preto-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(92,'368524',48,'Cinza Grafite','#484848',2900.00,1150.00,0,'/uploads/fotosProdutos/amplificador-de-baixo-cinza-frente.png, /uploads/fotosProdutos/amplificador-de-baixo-cinza-frente-sem-fundo.png, /uploads/fotosProdutos/amplificador-de-baixo-cinza-verso.png, /uploads/fotosProdutos/amplificador-de-baixo-cinza-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(93,'712486',49,'Madeira Clara','#c19a6b',2200.00,950.00,0,'/uploads/fotosProdutos/amplificador-de-violao-madeira-frente.png, /uploads/fotosProdutos/amplificador-de-violao-madeira-frente-sem-fundo.png, /uploads/fotosProdutos/amplificador-de-violao-madeira-verso.png, /uploads/fotosProdutos/amplificador-de-violao-madeira-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(94,'143905',49,'Mogno Escuro','#4a2c1d',2300.00,980.00,0,'/uploads/fotosProdutos/amplificador-de-violao-mogno-frente.png, /uploads/fotosProdutos/amplificador-de-violao-mogno-frente-sem-fundo.png, /uploads/fotosProdutos/amplificador-de-violao-mogno-verso.png, /uploads/fotosProdutos/amplificador-de-violao-mogno-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(95,'625478',50,'Preta Tradicional','#1a1a1a',1800.00,1050.00,0,'/uploads/fotosProdutos/caixa-acustica-passiva-preto-frente.png, /uploads/fotosProdutos/caixa-acustica-passiva-preto-frente-sem-fundo.png, /uploads/fotosProdutos/caixa-acustica-passiva-preto-verso.png, /uploads/fotosProdutos/caixa-acustica-passiva-preto-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29'),(96,'492631',51,'Preto Futurista','#121212',8900.00,2800.00,0,'/uploads/fotosProdutos/mesa-de-som-digital-preto-frente.png, /uploads/fotosProdutos/mesa-de-som-digital-preto-frente-sem-fundo.png, /uploads/fotosProdutos/mesa-de-som-digital-preto-verso.png, /uploads/fotosProdutos/mesa-de-som-digital-preto-verso-sem-fundo.png','Ativo','2025-12-09 19:55:29');
/*!40000 ALTER TABLE `variacoes_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venda` (
  `id_venda` int(11) NOT NULL AUTO_INCREMENT,
  `id_franquia` int(11) NOT NULL,
  `id_funcionario` int(11) NOT NULL,
  `id_sessao_caixa` int(11) NOT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  `parcelamento` varchar(50) DEFAULT NULL,
  `lucro` decimal(10,2) DEFAULT NULL,
  `desconto` decimal(10,2) DEFAULT NULL,
  `id_pagamento` int(11) NOT NULL,
  `status` enum('Aberta','Paga','Cancelada') NOT NULL DEFAULT 'Paga',
  `data_venda` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_venda`),
  KEY `fk_venda_franquia` (`id_franquia`),
  KEY `fk_venda_func` (`id_funcionario`),
  KEY `fk_venda_sessao` (`id_sessao_caixa`),
  KEY `fk_venda_pagto` (`id_pagamento`),
  CONSTRAINT `fk_venda_franquia` FOREIGN KEY (`id_franquia`) REFERENCES `franquias` (`id_franquia`),
  CONSTRAINT `fk_venda_func` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_registro`),
  CONSTRAINT `fk_venda_pagto` FOREIGN KEY (`id_pagamento`) REFERENCES `formaspagamentos` (`id_pagamento`),
  CONSTRAINT `fk_venda_sessao` FOREIGN KEY (`id_sessao_caixa`) REFERENCES `caixas` (`id_sessao_caixa`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` VALUES (1,2,3,2,14000.00,NULL,5600.00,0.00,1,'Paga','2025-12-09 20:22:35'),(2,2,3,2,18000.00,'5x de R$ 3.600,00',6840.00,0.00,2,'Paga','2025-12-09 20:23:27'),(3,2,3,2,8400.00,NULL,3360.00,0.00,1,'Paga','2025-12-09 20:24:29');
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda_cupom`
--

DROP TABLE IF EXISTS `venda_cupom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venda_cupom` (
  `id_venda` int(11) NOT NULL,
  `id_cupom` int(11) NOT NULL,
  PRIMARY KEY (`id_venda`,`id_cupom`),
  KEY `fk_vc_cupom` (`id_cupom`),
  CONSTRAINT `fk_vc_cupom` FOREIGN KEY (`id_cupom`) REFERENCES `cupons` (`id_cupom`),
  CONSTRAINT `fk_vc_venda` FOREIGN KEY (`id_venda`) REFERENCES `venda` (`id_venda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda_cupom`
--

LOCK TABLES `venda_cupom` WRITE;
/*!40000 ALTER TABLE `venda_cupom` DISABLE KEYS */;
/*!40000 ALTER TABLE `venda_cupom` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-09 17:38:01
