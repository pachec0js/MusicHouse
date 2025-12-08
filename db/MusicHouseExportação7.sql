-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caixas`
--

LOCK TABLES `caixas` WRITE;
/*!40000 ALTER TABLE `caixas` DISABLE KEYS */;
INSERT INTO `caixas` VALUES (1,2,28,'fechado','2025-12-05 16:51:12','2025-12-05 22:51:12'),(2,2,28,'fechado','2025-12-07 17:40:47','2025-12-07 18:10:12'),(3,2,28,'fechado','2025-12-07 18:56:58','2025-12-08 02:36:37'),(4,2,28,'fechado','2025-12-08 02:36:37','2025-12-08 03:31:16'),(5,2,28,'aberto','2025-12-08 03:31:16',NULL);
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
  `nome_func` text NOT NULL,
  `email` text NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `descricao` text NOT NULL,
  `categoria` enum('Sistema','Financeiro','Produto','Estoque','Venda','Funcionário','Outros') NOT NULL,
  `prioridade` enum('Baixa','Média','Alta','Crítica') NOT NULL DEFAULT 'Média',
  `apontamento_final` text DEFAULT NULL,
  `status` enum('Aberto','Em andamento','Resolvido','Cancelado') NOT NULL DEFAULT 'Aberto',
  `data_abertura` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_atualizacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_chamado`),
  KEY `fk_chamado_franquia` (`id_franquia`),
  KEY `fk_chamado_func` (`id_funcionario`),
  CONSTRAINT `fk_chamado_franquia` FOREIGN KEY (`id_franquia`) REFERENCES `franquias` (`id_franquia`),
  CONSTRAINT `fk_chamado_func` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_registro`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chamados`
--

LOCK TABLES `chamados` WRITE;
/*!40000 ALTER TABLE `chamados` DISABLE KEYS */;
INSERT INTO `chamados` VALUES (1,2,23,'Giovanni Pezzolato','arthurbuscarinobenedetti8@gmail.com','zxzx','axasa','Financeiro','Média','aaaaaaaaaaaaaaaa','Resolvido','2025-12-06 23:10:49','2025-12-06 23:33:54'),(2,2,23,'Giovanni Pezzolato','arthurbuscarinobenedetti8@gmail.com','saas','sasas','Produto','Crítica','','Aberto','2025-12-06 23:10:57','2025-12-07 00:02:12'),(3,2,23,'Giovanni Pezzolato','arthurbuscarinobenedetti8@gmail.com','asasa','sasasas','Estoque','Baixa','AAAAAAAAAAAAAAAAAAAAA','Resolvido','2025-12-06 23:11:04','2025-12-06 23:49:48'),(4,2,29,'Bruno Pezzolato Hollosi','bruno.pezzolato1@gmail.com','sds','dsds','Funcionário','Crítica','Giovanni Chupa Pinto','Resolvido','2025-12-06 23:13:06','2025-12-06 23:51:01'),(5,2,29,'Bruno Pezzolato Hollosi','bruno.pezzolato1@gmail.com','dsds','dsdsd','Estoque','Crítica',NULL,'Cancelado','2025-12-06 23:13:12','2025-12-06 23:19:10');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `despesas`
--

LOCK TABLES `despesas` WRITE;
/*!40000 ALTER TABLE `despesas` DISABLE KEYS */;
INSERT INTO `despesas` VALUES (1,2,'Luz','Conta de luz dezembro',12100.00,'2025-12-06','2025-12-05','Paga'),(2,1,'Água','asdasd',1222.00,'2025-12-08','2025-11-11','Paga'),(3,1,'Manutenção','aa',10.00,'2025-12-08','2025-02-22','Pendente');
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
) ENGINE=InnoDB AUTO_INCREMENT=715 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (2,2,'142693',103,10),(3,2,'149872',100,10),(6,2,'179632',88,10),(7,2,'184523',110,10),(8,2,'187642',120,10),(10,2,'231640',100,10),(11,2,'231867',100,10),(12,2,'235781',107,10),(14,2,'260498',99,10),(15,2,'270319',100,10),(16,2,'278965',100,10),(17,2,'298504',100,10),(18,2,'304987',100,10),(19,2,'305478',100,10),(20,2,'312654',100,10),(21,2,'345971',100,10),(22,2,'362094',100,10),(23,2,'378902',100,10),(24,2,'379826',100,10),(25,2,'405768',100,10),(26,2,'435219',100,10),(28,2,'481279',100,10),(29,2,'489072',100,10),(30,2,'490175',100,10),(31,2,'493725',100,10),(32,2,'498320',100,10),(33,2,'498731',100,10),(34,2,'512479',100,10),(35,2,'519843',100,10),(37,2,'528903',100,10),(38,2,'537916',100,10),(39,2,'540128',100,10),(40,2,'562893',100,10),(41,2,'582971',100,10),(42,2,'587420',100,10),(43,2,'604823',100,10),(45,2,'619845',100,10),(46,2,'619874',100,10),(47,2,'624981',100,10),(48,2,'628354',100,10),(49,2,'658304',100,10),(50,2,'658319',100,10),(51,2,'679124',100,10),(52,2,'689431',100,10),(54,2,'720158',100,10),(55,2,'739160',100,10),(56,2,'761084',100,10),(58,2,'763910',100,10),(59,2,'784632',100,10),(60,2,'790246',100,10),(61,2,'820491',100,10),(62,2,'826493',100,10),(63,2,'831276',100,10),(64,2,'835207',100,10),(65,2,'837295',100,10),(66,2,'843965',100,10),(67,2,'854763',100,10),(68,2,'874590',100,10),(69,2,'897324',100,10),(70,2,'904315',100,10),(71,2,'912570',100,10),(72,2,'920516',100,10),(73,2,'921543',99,10),(74,2,'924518',100,10),(75,2,'967540',100,10),(76,2,'972184',100,10),(77,2,'981430',250,10),(78,2,'982310',99,10),(79,2,'982410',100,10),(80,2,'982431',100,10),(81,2,'987130',99,10),(85,2,'134759',100,10),(87,2,'143905',100,10),(89,2,'176304',100,10),(90,2,'182653',100,10),(91,2,'184762',100,10),(93,2,'216903',100,10),(94,2,'235891',100,10),(96,2,'239701',100,10),(97,2,'247690',100,10),(99,2,'273816',100,10),(103,2,'284510',100,10),(104,2,'289374',100,10),(106,2,'295239',100,10),(108,2,'312759',100,10),(109,2,'328571',100,10),(113,2,'368524',100,10),(114,2,'371249',100,10),(115,2,'379524',100,10),(118,2,'390862',100,10),(119,2,'394820',100,10),(120,2,'413580',100,10),(121,2,'439678',100,10),(122,2,'451029',100,10),(123,2,'459732',100,10),(124,2,'470128',100,10),(127,2,'473193',100,10),(128,2,'490836',100,10),(130,2,'492631',100,10),(131,2,'493107',100,10),(134,2,'504297',100,10),(135,2,'504856',100,10),(136,2,'508436',100,10),(137,2,'509347',100,10),(138,2,'509387',100,10),(139,2,'512046',100,10),(140,2,'512306',100,10),(142,2,'513958',100,10),(144,2,'514903',99,10),(145,2,'527640',100,10),(148,2,'591732',100,10),(149,2,'592817',100,10),(150,2,'594813',100,10),(154,2,'625478',100,10),(156,2,'627839',100,10),(159,2,'639442',100,10),(160,2,'650921',100,10),(162,2,'701294',100,10),(163,2,'703982',100,10),(164,2,'712486',100,10),(165,2,'722326',100,10),(166,2,'724819',100,10),(167,2,'736294',100,10),(168,2,'748125',100,10),(169,2,'749320',100,10),(172,2,'783024',100,10),(173,2,'801357',100,10),(174,2,'801624',94,10),(175,2,'804529',100,10),(178,2,'811223',100,10),(179,2,'816432',100,10),(180,2,'821390',100,10),(182,2,'821475',100,10),(183,2,'834721',100,10),(184,2,'835620',100,10),(186,2,'847921',100,10),(187,2,'849632',100,10),(188,2,'864203',100,10),(194,2,'936701',100,10),(195,2,'942615',100,10),(196,2,'942810',100,10),(198,2,'953710',100,10),(199,2,'956201',100,10),(200,2,'957230',100,10),(201,2,'958301',100,10),(204,2,'975621',100,10),(206,2,'986435',100,10),(218,1,'142693',589,10),(219,1,'149872',150,10),(222,1,'179632',100,10),(223,1,'184523',90,10),(224,1,'187642',80,10),(226,1,'231640',100,10),(227,1,'231867',100,10),(228,1,'235781',90,10),(230,1,'260498',100,10),(231,1,'270319',100,10),(232,1,'278965',100,10),(233,1,'298504',100,10),(234,1,'304987',100,10),(235,1,'305478',100,10),(236,1,'312654',100,10),(237,1,'345971',100,10),(238,1,'362094',100,10),(239,1,'378902',100,10),(240,1,'379826',100,10),(241,1,'405768',100,10),(242,1,'435219',100,10),(244,1,'481279',100,10),(245,1,'489072',100,10),(246,1,'490175',100,10),(247,1,'493725',100,10),(248,1,'498320',100,10),(249,1,'498731',100,10),(250,1,'512479',100,10),(251,1,'519843',100,10),(253,1,'528903',100,10),(254,1,'537916',100,10),(255,1,'540128',100,10),(256,1,'562893',100,10),(257,1,'582971',100,10),(258,1,'587420',100,10),(259,1,'604823',100,10),(261,1,'619845',100,10),(262,1,'619874',100,10),(263,1,'624981',100,10),(264,1,'628354',100,10),(265,1,'658304',100,10),(266,1,'658319',100,10),(267,1,'679124',100,10),(268,1,'689431',100,10),(270,1,'720158',100,10),(271,1,'739160',100,10),(272,1,'761084',100,10),(274,1,'763910',100,10),(275,1,'784632',100,10),(276,1,'790246',100,10),(277,1,'820491',100,10),(278,1,'826493',100,10),(279,1,'831276',100,10),(280,1,'835207',100,10),(281,1,'837295',100,10),(282,1,'843965',100,10),(283,1,'854763',100,10),(284,1,'874590',100,10),(285,1,'897324',100,10),(286,1,'904315',100,10),(287,1,'912570',100,10),(288,1,'920516',100,10),(289,1,'921543',100,10),(290,1,'924518',100,10),(291,1,'967540',100,10),(292,1,'972184',100,10),(293,1,'981430',0,10),(294,1,'982310',100,10),(295,1,'982410',100,10),(296,1,'982431',100,10),(297,1,'987130',100,10),(300,1,'134759',100,10),(301,1,'143905',100,10),(303,1,'176304',100,10),(304,1,'182653',100,10),(305,1,'184762',100,10),(306,1,'216903',100,10),(307,1,'235891',100,10),(308,1,'239701',100,10),(309,1,'247690',100,10),(311,1,'273816',100,10),(314,1,'284510',100,10),(315,1,'289374',100,10),(316,1,'295239',100,10),(318,1,'312759',100,10),(319,1,'328571',100,10),(322,1,'368524',100,10),(323,1,'371249',100,10),(324,1,'379524',100,10),(326,1,'390862',100,10),(327,1,'394820',100,10),(328,1,'413580',100,10),(329,1,'439678',100,10),(330,1,'451029',100,10),(331,1,'459732',100,10),(332,1,'470128',100,10),(333,1,'473193',100,10),(334,1,'490836',100,10),(335,1,'492631',100,10),(336,1,'493107',100,10),(338,1,'504297',100,10),(339,1,'504856',100,10),(340,1,'508436',100,10),(341,1,'509347',100,10),(342,1,'509387',100,10),(343,1,'512046',100,10),(344,1,'512306',100,10),(345,1,'513958',100,10),(346,1,'514903',100,10),(347,1,'527640',100,10),(349,1,'591732',100,10),(350,1,'592817',100,10),(351,1,'594813',100,10),(352,1,'625478',100,10),(353,1,'627839',100,10),(356,1,'639442',100,10),(357,1,'650921',100,10),(358,1,'701294',100,10),(359,1,'703982',100,10),(360,1,'712486',100,10),(361,1,'722326',100,10),(362,1,'724819',100,10),(363,1,'736294',100,10),(364,1,'748125',100,10),(365,1,'749320',100,10),(367,1,'783024',100,10),(368,1,'801357',100,10),(369,1,'801624',100,10),(370,1,'804529',100,10),(371,1,'811223',100,10),(372,1,'816432',100,10),(373,1,'821390',100,10),(374,1,'821475',100,10),(375,1,'834721',100,10),(376,1,'835620',100,10),(377,1,'847921',100,10),(378,1,'849632',100,10),(379,1,'864203',100,10),(383,1,'936701',100,10),(384,1,'942615',100,10),(385,1,'942810',100,10),(386,1,'953710',100,10),(387,1,'956201',100,10),(388,1,'957230',100,10),(389,1,'958301',100,10),(391,1,'975621',100,10),(393,1,'986435',100,10),(394,1,'256871',10,10),(395,2,'256871',0,10),(396,3,'256871',0,10),(397,4,'256871',0,10),(398,5,'256871',0,10),(399,6,'256871',0,10),(400,7,'256871',0,10),(401,8,'256871',0,10),(402,9,'256871',0,10),(403,10,'256871',0,10),(404,1,'450493',10,10),(405,2,'450493',0,10),(406,3,'450493',0,10),(407,4,'450493',0,10),(408,5,'450493',0,10),(409,6,'450493',0,10),(410,7,'450493',0,10),(411,8,'450493',0,10),(412,9,'450493',0,10),(413,10,'450493',0,10),(414,11,'142693',0,10),(415,11,'149872',0,10),(416,11,'179632',0,10),(417,11,'184523',0,10),(418,11,'187642',0,10),(419,11,'231640',0,10),(420,11,'231867',0,10),(421,11,'235781',0,10),(423,11,'256871',0,10),(424,11,'260498',0,10),(425,11,'270319',0,10),(426,11,'278965',0,10),(427,11,'298504',0,10),(428,11,'304987',0,10),(429,11,'305478',0,10),(430,11,'312654',0,10),(431,11,'345971',0,10),(432,11,'362094',0,10),(433,11,'378902',0,10),(434,11,'379826',0,10),(435,11,'405768',0,10),(436,11,'435219',0,10),(437,11,'481279',0,10),(438,11,'489072',0,10),(439,11,'490175',0,10),(440,11,'493725',0,10),(441,11,'498320',0,10),(442,11,'498731',0,10),(443,11,'512479',0,10),(444,11,'519843',0,10),(445,11,'528903',0,10),(446,11,'537916',0,10),(447,11,'540128',0,10),(448,11,'562893',0,10),(449,11,'582971',0,10),(450,11,'587420',0,10),(451,11,'604823',0,10),(452,11,'619845',0,10),(453,11,'619874',0,10),(454,11,'624981',0,10),(455,11,'628354',0,10),(456,11,'658304',0,10),(457,11,'658319',0,10),(458,11,'679124',0,10),(459,11,'689431',0,10),(460,11,'720158',0,10),(461,11,'739160',0,10),(462,11,'761084',0,10),(463,11,'763910',0,10),(464,11,'784632',0,10),(465,11,'790246',0,10),(466,11,'820491',0,10),(467,11,'826493',0,10),(468,11,'831276',0,10),(469,11,'835207',0,10),(470,11,'837295',0,10),(471,11,'843965',0,10),(472,11,'854763',0,10),(473,11,'874590',0,10),(474,11,'897324',0,10),(475,11,'904315',0,10),(476,11,'912570',0,10),(477,11,'920516',0,10),(478,11,'921543',0,10),(479,11,'924518',0,10),(480,11,'967540',0,10),(481,11,'972184',0,10),(482,11,'981430',0,10),(483,11,'982310',0,10),(484,11,'982410',0,10),(485,11,'982431',0,10),(486,11,'987130',0,10),(487,11,'134759',0,10),(488,11,'143905',0,10),(489,11,'176304',0,10),(490,11,'182653',0,10),(491,11,'184762',0,10),(492,11,'216903',0,10),(493,11,'235891',0,10),(494,11,'239701',0,10),(495,11,'247690',0,10),(496,11,'273816',0,10),(497,11,'284510',0,10),(498,11,'289374',0,10),(499,11,'295239',0,10),(501,11,'312759',0,10),(502,11,'328571',0,10),(503,11,'368524',0,10),(504,11,'371249',0,10),(505,11,'379524',0,10),(506,11,'390862',0,10),(507,11,'394820',0,10),(508,11,'413580',0,10),(509,11,'439678',0,10),(510,11,'450493',0,10),(511,11,'451029',0,10),(512,11,'459732',0,10),(513,11,'470128',0,10),(514,11,'473193',0,10),(515,11,'490836',0,10),(516,11,'492631',0,10),(517,11,'493107',0,10),(518,11,'504297',0,10),(519,11,'504856',0,10),(520,11,'508436',0,10),(521,11,'509347',0,10),(522,11,'509387',0,10),(523,11,'512046',0,10),(524,11,'512306',0,10),(525,11,'513958',0,10),(526,11,'514903',0,10),(527,11,'527640',0,10),(528,11,'591732',0,10),(529,11,'592817',0,10),(530,11,'594813',0,10),(531,11,'625478',0,10),(532,11,'627839',0,10),(533,11,'639442',0,10),(534,11,'650921',0,10),(535,11,'701294',0,10),(536,11,'703982',0,10),(537,11,'712486',0,10),(538,11,'722326',0,10),(539,11,'724819',0,10),(540,11,'736294',0,10),(541,11,'748125',0,10),(542,11,'749320',0,10),(543,11,'783024',0,10),(544,11,'801357',0,10),(545,11,'801624',0,10),(546,11,'804529',0,10),(547,11,'811223',0,10),(548,11,'816432',0,10),(549,11,'821390',0,10),(550,11,'821475',0,10),(551,11,'834721',0,10),(552,11,'835620',0,10),(553,11,'847921',0,10),(554,11,'849632',0,10),(555,11,'864203',0,10),(557,11,'936701',0,10),(558,11,'942615',0,10),(559,11,'942810',0,10),(560,11,'953710',0,10),(561,11,'956201',0,10),(562,11,'957230',0,10),(563,11,'958301',0,10),(564,11,'975621',0,10),(565,11,'986435',0,10),(566,12,'142693',0,10),(567,12,'149872',0,10),(568,12,'179632',0,10),(569,12,'184523',0,10),(570,12,'187642',0,10),(571,12,'231640',0,10),(572,12,'231867',0,10),(573,12,'235781',0,10),(574,12,'256871',0,10),(575,12,'260498',0,10),(576,12,'270319',0,10),(577,12,'278965',0,10),(578,12,'298504',0,10),(579,12,'304987',0,10),(580,12,'305478',0,10),(581,12,'312654',0,10),(582,12,'345971',0,10),(583,12,'362094',0,10),(584,12,'378902',0,10),(585,12,'379826',0,10),(586,12,'405768',0,10),(587,12,'435219',0,10),(588,12,'481279',0,10),(589,12,'489072',0,10),(590,12,'490175',0,10),(591,12,'493725',0,10),(592,12,'498320',0,10),(593,12,'498731',0,10),(594,12,'512479',0,10),(595,12,'519843',0,10),(596,12,'528903',0,10),(597,12,'537916',0,10),(598,12,'540128',0,10),(599,12,'562893',0,10),(600,12,'582971',0,10),(601,12,'587420',0,10),(602,12,'604823',0,10),(603,12,'619845',0,10),(604,12,'619874',0,10),(605,12,'624981',0,10),(606,12,'628354',0,10),(607,12,'658304',0,10),(608,12,'658319',0,10),(609,12,'679124',0,10),(610,12,'689431',0,10),(611,12,'720158',0,10),(612,12,'739160',0,10),(613,12,'761084',0,10),(614,12,'763910',0,10),(615,12,'784632',0,10),(616,12,'790246',0,10),(617,12,'820491',0,10),(618,12,'826493',0,10),(619,12,'831276',0,10),(620,12,'835207',0,10),(621,12,'837295',0,10),(622,12,'843965',0,10),(623,12,'854763',0,10),(624,12,'874590',0,10),(625,12,'897324',0,10),(626,12,'904315',0,10),(627,12,'912570',0,10),(628,12,'920516',0,10),(629,12,'921543',0,10),(630,12,'924518',0,10),(631,12,'967540',0,10),(632,12,'972184',0,10),(633,12,'981430',0,10),(634,12,'982310',0,10),(635,12,'982410',0,10),(636,12,'982431',0,10),(637,12,'987130',0,10),(638,12,'134759',0,10),(639,12,'143905',0,10),(640,12,'176304',0,10),(641,12,'182653',0,10),(642,12,'184762',0,10),(643,12,'216903',0,10),(644,12,'235891',0,10),(645,12,'239701',0,10),(646,12,'247690',0,10),(647,12,'273816',0,10),(648,12,'284510',0,10),(649,12,'289374',0,10),(650,12,'295239',0,10),(651,12,'312759',0,10),(652,12,'328571',0,10),(653,12,'368524',0,10),(654,12,'371249',0,10),(655,12,'379524',0,10),(656,12,'390862',0,10),(657,12,'394820',0,10),(658,12,'413580',0,10),(659,12,'439678',0,10),(660,12,'450493',0,10),(661,12,'451029',0,10),(662,12,'459732',0,10),(663,12,'470128',0,10),(664,12,'473193',0,10),(665,12,'490836',0,10),(666,12,'492631',0,10),(667,12,'493107',0,10),(668,12,'504297',0,10),(669,12,'504856',0,10),(670,12,'508436',0,10),(671,12,'509347',0,10),(672,12,'509387',0,10),(673,12,'512046',0,10),(674,12,'512306',0,10),(675,12,'513958',0,10),(676,12,'514903',0,10),(677,12,'527640',0,10),(678,12,'591732',0,10),(679,12,'592817',0,10),(680,12,'594813',0,10),(681,12,'625478',0,10),(682,12,'627839',0,10),(683,12,'639442',0,10),(684,12,'650921',0,10),(685,12,'701294',0,10),(686,12,'703982',0,10),(687,12,'712486',0,10),(688,12,'722326',0,10),(689,12,'724819',0,10),(690,12,'736294',0,10),(691,12,'748125',0,10),(692,12,'749320',0,10),(693,12,'783024',0,10),(694,12,'801357',0,10),(695,12,'801624',0,10),(696,12,'804529',0,10),(697,12,'811223',0,10),(698,12,'816432',0,10),(699,12,'821390',0,10),(700,12,'821475',0,10),(701,12,'834721',0,10),(702,12,'835620',0,10),(703,12,'847921',0,10),(704,12,'849632',0,10),(705,12,'864203',0,10),(706,12,'936701',0,10),(707,12,'942615',0,10),(708,12,'942810',0,10),(709,12,'953710',0,10),(710,12,'956201',0,10),(711,12,'957230',0,10),(712,12,'958301',0,10),(713,12,'975621',0,10),(714,12,'986435',0,10);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedores`
--

LOCK TABLES `fornecedores` WRITE;
/*!40000 ALTER TABLE `fornecedores` DISABLE KEYS */;
INSERT INTO `fornecedores` VALUES (1,'Madeiras Nobres Brasil','12.345.678/0001-90','Madeira de mogno',8500.00,'contato@madeirasnobres.com','Rua das Árvores 120, Manaus - AM','2025-12-05 12:34:39'),(2,'Metalúrgica SomForte','98.765.432/0001-55','Ligas de latão',4200.50,'vendas@somforte.com','Av. Industrial 455, São Bernardo do Campo - SP','2025-12-05 12:34:39'),(3,'Eletrônicos AudioChip','54.321.987/0001-12','Circuitos integrados',6700.90,'suporte@audiochip.com','Rua Tecnologia 77, Campinas - SP','2025-12-05 12:34:39'),(4,'Cordas Harmonia Ltda','23.456.789/0001-21','Cordas de aço e nylon',1900.00,'contato@harmonia.com','Av. das Artes 310, Curitiba - PR','2025-12-05 12:34:39'),(5,'Acabamentos LuthierCoat','45.678.912/0001-43','Vernizes, seladoras e tintas',2500.75,'vendas@luthiercoat.com','Rua Pintores 500, Joinville - SC','2025-12-05 12:34:39'),(6,'Estojos ProCase','67.891.234/0001-65','Estojos rígidos e bags acolchoados',3100.30,'comercial@procase.com','Av. Central 980, Belo Horizonte - MG','2025-12-05 12:34:39'),(7,'Parafusos & Ferragens São Luís','11.222.333/0001-44','Parafusos',1350.00,'contato@ferragenssl.com','Rua do Metal 201, São Luís - MA','2025-12-05 12:34:39'),(8,'Plásticos e Compostos Melodia','77.888.999/0001-10','Plásticos moldáveis',1600.40,'suporte@melodiaplast.com','Av. das Indústrias 1450, Sorocaba - SP','2025-12-05 12:34:39'),(9,'Espumas Acústicas AcustiFlex','32.165.498/0001-77','Espumas e materiais internos',980.00,'vendas@acustiflex.com','Rua Acústica 222, Porto Alegre - RS','2025-12-05 12:34:39'),(10,'Eletrônica Premium Wiring','44.556.778/0001-88','Fios, cabos blindados',750.50,'contato@premiumwiring.com','Rua Energia 420, Rio de Janeiro - RJ','2025-12-05 12:34:39'),(11,'Marinilze Madeiras','12121214465443','Madeira Rígida Rosa',12122.10,'mari.madeiras@gmail.com','Rua Ida Leone Cleto, 640 - Ruge Ramos - SBC','2025-12-06 22:05:52');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `franquias`
--

LOCK TABLES `franquias` WRITE;
/*!40000 ALTER TABLE `franquias` DISABLE KEYS */;
INSERT INTO `franquias` VALUES (1,'01000-000','Av. Paulista, 1000 - Bela Vista','São Paulo - SP','sp@musichouse.com.br','(11) 98888-1000','Ativo','2025-12-05 12:34:38','2025-12-05 12:34:38'),(2,'20040-020','Rua das Laranjeiras, 315 - Flamengo','Rio de Janeiro - RJ','rj@musichouse.com.br','(21) 97777-2000','Ativo','2025-12-05 12:35:42','2025-12-05 12:35:42'),(3,'30130-970','Av. Afonso Pena, 1500 - Centro','Belo Horizonte - MG','bh@musichouse.com.br','(31) 98888-3000','Ativo','2025-12-05 12:35:42','2025-12-05 12:35:42'),(4,'40015-000','Rua Chile, 25 - Comércio','Salvador - BA','ssa@musichouse.com.br','(71) 98888-4000','Ativo','2025-12-05 12:35:42','2025-12-05 12:35:42'),(5,'80010-100','Rua XV de Novembro, 400 - Centro','Curitiba - PR','ctb@musichouse.com.br','(41) 97777-5000','Ativo','2025-12-05 12:35:42','2025-12-05 12:35:42'),(6,'69005-070','Av. Eduardo Ribeiro, 900 - Centro','Manaus - AM','mao@musichouse.com.br','(92) 98888-6000','Ativo','2025-12-05 12:35:42','2025-12-05 12:35:42'),(7,'64001-010','Av. Frei Serafim, 222 - Centro','Teresina - PI','the@musichouse.com.br','(86) 98888-7000','Ativo','2025-12-05 12:35:42','2025-12-05 12:35:42'),(8,'72000-000','SCS Quadra 2, Bloco D - Asa Sul','Brasília - DF','bsb@musichouse.com.br','(61) 98888-8000','Ativo','2025-12-05 12:35:42','2025-12-05 12:35:42'),(9,'90010-120','Av. Borges de Medeiros, 750 - Centro','Porto Alegre - RS','poa@musichouse.com.br','(51) 98888-9000','Ativo','2025-12-05 12:35:42','2025-12-05 12:35:42'),(10,'58010-101','Av. Epitácio Pessoa, 400 - Tambiá','João Pessoa - PB','jpa@musichouse.com.br','(83) 98888-1010','Ativo','2025-12-05 12:35:42','2025-12-05 12:35:42'),(11,'09632000','Rua Ida Leoni Cleto, 640 - Rudge Ramos','São Bernardo do Campo - SP','mashdugasdvgas@adagvd.com','1145465465454','Inativo','2025-12-06 20:10:58','2025-12-07 00:19:35'),(12,'09551210','Rua Capeberibe, 200 - Barcelona','São Caetano do Sul - SP','ashduahusdh@kahsdhashd','11656546545','Ativo','2025-12-08 00:14:35','2025-12-08 00:14:35');
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
INSERT INTO `funcionarios` VALUES (1,'Marcos Almeida','11111111111','SP-123456','1985-03-12','Masculino','Casado','marcos.almeida@musichouse.com.br','(11) 98888-1101',1,1,NULL,NULL,NULL,NULL,'admin2024',1,'Ativo','2025-12-05 12:35:52','2025-12-07 00:11:12'),(2,'Carla Menezes','11111111112','DF-765432','1988-07-25','Feminino','Solteiro','carla.menezes@musichouse.com.br','(61) 98888-1102',1,1,NULL,NULL,NULL,NULL,'admin2024',1,'Ativo','2025-12-05 12:35:52','2025-12-07 00:11:19'),(3,'João da Silva','11111111113','SP-234567','1990-01-01','Masculino','Solteiro','joao.silva.sp@musichouse.com.br','(11) 98888-2001',1,2,NULL,NULL,NULL,NULL,'loja2024',1,'Ativo','2025-12-05 12:35:52','2025-12-07 00:11:23'),(4,'Ana Beatriz Rocha','11111111114','RJ-345678','1992-05-18','Feminino','Casado','ana.rocha.rj@musichouse.com.br','(21) 97777-2002',2,2,NULL,NULL,NULL,NULL,'loja2024',1,'Ativo','2025-12-05 12:35:52','2025-12-07 00:11:26'),(5,'Lucas Pereira','11111111115','MG-456789','1989-11-09','Masculino','Solteiro','lucas.pereira.bh@musichouse.com.br','(31) 98888-2003',3,2,NULL,NULL,NULL,NULL,'loja2024',1,'Ativo','2025-12-05 12:35:52','2025-12-07 00:18:23'),(6,'Fernanda Carvalho','11111111116','BA-567890','1991-02-27','Feminino','Casado','fernanda.carvalho.ssa@musichouse.com.br','(71) 98888-2004',4,2,NULL,NULL,NULL,NULL,'loja2024',1,'Ativo','2025-12-05 12:35:52','2025-12-07 00:18:26'),(7,'Rafael Monteiro','11111111117','PR-678901','1987-08-03','Masculino','Casado','rafael.monteiro.ctb@musichouse.com.br','(41) 97777-2005',5,2,NULL,NULL,NULL,NULL,'loja2024',1,'Ativo','2025-12-05 12:35:52','2025-12-07 00:18:30'),(8,'Patrícia Nogueira','11111111118','AM-789012','1993-04-14','Feminino','Solteiro','patricia.nogueira.mao@musichouse.com.br','(92) 98888-2006',6,2,NULL,NULL,NULL,NULL,'loja2024',1,'Ativo','2025-12-05 12:35:52','2025-12-07 00:18:34'),(9,'Gustavo Lima','11111111119','PI-890123','1986-09-21','Masculino','Casado','gustavo.lima.the@musichouse.com.br','(86) 98888-2007',7,2,NULL,NULL,NULL,NULL,'loja2024',1,'Ativo','2025-12-05 12:35:52','2025-12-07 00:18:38'),(10,'Mariana Duarte','11111111120','DF-901234','1994-12-30','Feminino','Solteiro','mariana.duarte.bsb@musichouse.com.br','(61) 98888-2008',8,2,NULL,NULL,NULL,NULL,'loja2024',1,'Ativo','2025-12-05 12:35:52','2025-12-07 00:18:41'),(11,'Thiago Souza','11111111121','RS-012345','1988-10-05','Masculino','Casado','thiago.souza.poa@musichouse.com.br','(51) 98888-2009',9,2,NULL,NULL,NULL,NULL,'loja2024',1,'Ativo','2025-12-05 12:35:52','2025-12-07 00:18:45'),(12,'Bruna Oliveira','11111111122','PB-123450','1995-06-17','Feminino','Solteiro','bruna.oliveira.jpa@musichouse.com.br','(83) 98888-2010',10,2,NULL,NULL,NULL,NULL,'loja2024',1,'Ativo','2025-12-05 12:35:52','2025-12-07 00:18:50'),(13,'Felipe Andrade','11111111124','SP-777888','1998-01-22','Masculino','Solteiro','felipe.andrade@musichouse.com.br','(11) 97777-3001',1,3,NULL,NULL,NULL,NULL,'123456',1,'Ativo','2025-12-05 12:35:52','2025-12-07 00:18:55'),(14,'Letícia Moraes','11111111125','RJ-888999','1999-07-11','Feminino','Solteiro','leticia.moraes@musichouse.com.br','(21) 97777-3002',2,3,NULL,NULL,NULL,NULL,'123456',1,'Ativo','2025-12-05 12:35:52','2025-12-07 00:15:59'),(15,'Bruno Costa','11111111126','MG-999000','1997-05-29','Masculino','Solteiro','bruno.costa@musichouse.com.br','(31) 97777-3003',3,3,NULL,NULL,NULL,NULL,'123456',1,'Ativo','2025-12-05 12:35:52','2025-12-07 00:19:01'),(16,'Camila Ribeiro','11111111127','BA-101112','1996-09-19','Feminino','Solteiro','camila.ribeiro@musichouse.com.br','(71) 97777-3004',4,3,NULL,NULL,NULL,NULL,'123456',1,'Ativo','2025-12-05 12:35:52','2025-12-07 00:19:05'),(17,'Diego Martins','11111111128','PR-121314','1994-02-10','Masculino','Casado','diego.martins@musichouse.com.br','(41) 97777-3005',5,3,NULL,NULL,NULL,NULL,'123456',1,'Ativo','2025-12-05 12:35:52','2025-12-07 00:19:09'),(18,'Mariana martiz melo','11111111129','141516','1995-11-03','Feminino','Solteiro','isabela.farias@musichouse.com.br','92977773006',6,4,'\\uploads\\fotosFuncionarios\\1765063815272-c-amp-iacute-ntia-chagas_30072020_101033-G.jpg',NULL,NULL,NULL,'123456',1,'Ativo','2025-12-05 12:35:52','2025-12-07 00:19:13'),(19,'Rogério Tavares','11111111130','PI-161718','1993-08-14','Masculino','Casado','rogerio.tavares@musichouse.com.br','(86) 97777-3007',7,3,NULL,NULL,NULL,NULL,'123456',1,'Ativo','2025-12-05 12:35:52','2025-12-07 00:19:16'),(20,'Nicole Santos','11111111131','DF-181920','1998-04-09','Feminino','Solteiro','nicole.santos@musichouse.com.br','(61) 97777-3008',8,3,NULL,NULL,NULL,NULL,'123456',1,'Ativo','2025-12-05 12:35:52','2025-12-07 00:19:20'),(21,'André Luiz','11111111132','RS-202122','1992-12-01','Masculino','Casado','andre.luiz@musichouse.com.br','(51) 97777-3009',9,3,NULL,NULL,NULL,NULL,'123456',1,'Ativo','2025-12-05 12:35:52','2025-12-07 00:19:23'),(22,'Paula Mendes','11111111133','PB-222324','1997-06-06','Feminino','Solteiro','paula.mendes@musichouse.com.br','(83) 97777-3010',10,3,NULL,NULL,NULL,NULL,'123456',1,'Ativo','2025-12-05 12:35:52','2025-12-07 00:40:20'),(23,'Giovanni Pezzolato','98765432','897654345','1990-05-15','Masculino','Solteiro','arthurbuscarinobenedetti8@gmail.com','(11)91234-5678',2,2,NULL,NULL,NULL,NULL,'$2b$10$pnaF5Ytj8bR5lCm2XDZpT.Cq8iLbWdFFmiqSiTMmj6CnJnQ7McvkO',0,'Ativo','2025-12-05 12:37:07','2025-12-07 00:13:16'),(24,'Bruno pezzolato','21312313123','313131231','2011-11-20','Masculino','Solteiro','gbuscarinobenedetti@gmail.com','131321313133',2,4,NULL,NULL,NULL,NULL,'$2b$10$ESmGjiFSn61OddqezG6vR.n2QIJum.FLL1VmIdX2o6UXPnuKGG9B6',0,'Ativo','2025-12-05 12:39:30','2025-12-08 03:46:24'),(27,'Fabio Pezzolato Pacheco','98765432','897654345','1990-05-15','Masculino','Solteiro','arthur.giovanni.gil@gmail.com','11912345678',1,1,'\\uploads\\fotosFuncionarios\\1765064520480-unnamed.jpg',NULL,NULL,NULL,'$2b$10$Oo4jY7XdzwVkaZL7LIOsI.ND0S5kOGxgh.qPc/XZNMt36.9H6fjpS',0,'Ativo','2025-12-05 12:59:23','2025-12-07 00:12:15'),(28,'Fulano Silva lindo caetano veloso','11111111111','111111111','2007-07-11','Masculino','Casado','giovanni.benedetti@aluno.senai.br','11111111111',2,3,'\\uploads\\fotosFuncionarios\\1765054365615-WhatsApp Image 2025-11-14 at 10.23.43.jpeg',NULL,NULL,NULL,'$2b$10$iczAyqSDgoFSBOsVHFkQKO4XY3GB8jkx3uxCMWK.6nNysLZwj1hOS',0,'Ativo','2025-12-05 16:47:40','2025-12-07 00:12:37'),(29,'Bruno Pezzolato Hollosi','21212121212','121212121','2007-07-11','Masculino','Solteiro','bruno.pezzolato1@gmail.com','21212121212',2,2,NULL,NULL,NULL,NULL,'$2b$10$RfqSNmoe19gZbHnLc9jUy.xAYOZceYy25CfC8sa4Ch1eY2f.MICye',0,'Ativo','2025-12-06 17:39:12','2025-12-07 00:12:31'),(30,'Bruno Gay ','32356544545','878945646','2011-07-20','Masculino','Solteiro','arthur.benedetti@aluno.senai.br','11999215191',11,2,'\\uploads\\fotosFuncionarios\\1765065520400-56_BLOG-GL1-1.jpg',NULL,NULL,NULL,'$2b$10$1s9eUUmfyhlO/CrI9CG1yeumyXK3si4KdHmT.CeQrBgfLfOShpMuO',0,'Inativo','2025-12-06 23:58:40','2025-12-07 00:36:47'),(32,'teste ','11111111111','111111111','0000-00-00','Masculino','Solteiro','asdajisgdyasdyasf@sahdgasdg','111111111111',11,3,'\\uploads\\fotosFuncionarios\\1765068701906-FotoRosto.jpeg',NULL,NULL,NULL,'$2b$10$CA3t92Ej21aQowmcnFvb1OLdTeo0Ai4TKD6e/7P4oMfwXUyv.rrue',1,'Ativo','2025-12-07 00:51:41','2025-12-07 00:51:41'),(33,'Esther Angelo','12345556465','876545645','0000-00-00','Feminino','Viúvo','musichouseempresa@gmail.com','225565655655',12,2,'\\uploads\\fotosFuncionarios\\1765153188996-daviCrianÃ§a.png',NULL,NULL,NULL,'$2b$10$Al/V5i.QBInLxtyD3uy6cuii2DIyflPbF6DWkyaWC1m85jrgBmIJa',0,'Ativo','2025-12-08 00:19:49','2025-12-08 00:21:01');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_venda`
--

LOCK TABLES `item_venda` WRITE;
/*!40000 ALTER TABLE `item_venda` DISABLE KEYS */;
INSERT INTO `item_venda` VALUES (1,1,'142693',NULL,2,2800.00,2500.00,5600.00),(2,2,'142693',NULL,1,2800.00,0.00,2800.00),(3,2,'179632',NULL,2,2100.00,3500.00,4200.00),(4,3,'142693',NULL,2,2800.00,3500.00,5600.00),(5,4,'982310',NULL,1,6800.00,2720.00,6800.00),(6,5,'142693',NULL,2,2800.00,2240.00,5600.00),(7,6,'179632',NULL,2,2100.00,1680.00,4200.00),(8,7,'179632',NULL,2,1785.00,1050.00,3570.00),(9,8,'179632',NULL,2,1785.00,1050.00,3570.00),(10,9,'179632',NULL,2,1785.00,1050.00,3570.00),(11,10,NULL,'514903',1,3950.00,2430.00,3950.00),(12,11,'179632',NULL,2,1785.00,1050.00,3570.00),(13,12,'235781',NULL,3,1450.00,1740.00,4350.00),(14,13,'260498',NULL,1,3900.00,1560.00,3900.00),(15,13,'921543',NULL,1,450.00,180.00,450.00),(16,13,'987130',NULL,1,90.00,36.00,90.00),(17,14,NULL,'801624',6,5600.00,29700.00,33600.00);
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
  `data_movimentacao` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_movimentacao`),
  KEY `fk_mov_franquia` (`id_franquia`),
  KEY `fk_mov_func` (`id_funcionario`),
  CONSTRAINT `fk_mov_franquia` FOREIGN KEY (`id_franquia`) REFERENCES `franquias` (`id_franquia`),
  CONSTRAINT `fk_mov_func` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_registro`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimentacoes_estoque`
--

LOCK TABLES `movimentacoes_estoque` WRITE;
/*!40000 ALTER TABLE `movimentacoes_estoque` DISABLE KEYS */;
INSERT INTO `movimentacoes_estoque` VALUES (14,225,1,27,'entrada',100,250,350,'2025-12-05 16:18:58'),(15,298,1,27,'entrada',100,300,400,'2025-12-05 16:21:39'),(16,2,2,28,'saida',98,1,97,'2025-12-05 16:54:44'),(17,6,2,28,'saida',100,2,98,'2025-12-05 16:54:44'),(18,218,1,27,'entrada',100,200,300,'2025-12-06 18:55:37'),(19,293,1,27,'entrada',100,50,150,'2025-12-06 18:57:00'),(20,77,2,27,'entrada',100,150,250,'2025-12-06 18:57:10'),(25,7,2,27,'entrada',100,10,110,'2025-12-07 05:50:05'),(26,223,1,27,'saida',100,10,90,'2025-12-07 05:50:05'),(27,2,2,28,'saida',97,2,95,'2025-12-07 17:41:12'),(28,78,2,28,'saida',100,1,99,'2025-12-07 17:41:44'),(29,2,2,28,'saida',95,2,93,'2025-12-07 17:44:52'),(30,6,2,28,'saida',98,2,96,'2025-12-07 17:46:52'),(31,6,2,28,'saida',96,2,94,'2025-12-07 17:51:34'),(32,6,2,28,'saida',90,2,88,'2025-12-07 18:09:20'),(33,144,2,28,'saida',99,1,98,'2025-12-07 18:57:15'),(34,8,2,27,'entrada',110,10,120,'2025-12-08 02:30:24'),(35,224,1,27,'saida',90,10,80,'2025-12-08 02:30:24'),(36,6,2,28,'saida',88,2,86,'2025-12-08 02:38:14'),(37,12,2,28,'saida',107,3,104,'2025-12-08 02:41:56'),(38,218,1,27,'entrada',300,299,599,'2025-12-08 03:03:00'),(39,14,2,28,'saida',99,1,98,'2025-12-08 03:31:38'),(40,73,2,28,'saida',99,1,98,'2025-12-08 03:31:38'),(41,81,2,28,'saida',99,1,98,'2025-12-08 03:31:38'),(42,2,2,27,'entrada',93,10,103,'2025-12-08 03:41:24'),(43,218,1,27,'saida',599,10,589,'2025-12-08 03:41:24'),(44,219,1,27,'entrada',100,50,150,'2025-12-08 03:58:02'),(45,174,2,28,'saida',94,6,88,'2025-12-08 04:04:33');
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos_filiais`
--

LOCK TABLES `pedidos_filiais` WRITE;
/*!40000 ALTER TABLE `pedidos_filiais` DISABLE KEYS */;
INSERT INTO `pedidos_filiais` VALUES (18,2,23,77,150,'asdasdasdasd','Aprovado','Alta','2025-12-06 17:29:53','2025-12-06 18:57:10'),(19,2,23,96,300,'okokopok','Pendente','Alta','2025-12-07 02:56:57','2025-12-07 02:56:57'),(20,2,23,2,10,'ASDASD','Aprovado','Média','2025-12-07 03:57:46','2025-12-08 03:41:24'),(21,2,23,6,10,'sadasdasd','Recusado','Alta','2025-12-07 04:17:40','2025-12-08 03:33:56'),(22,2,23,7,10,'asdasd','Aprovado','Média','2025-12-07 04:18:05','2025-12-07 05:50:05'),(23,2,23,8,10,'asdasd','Aprovado','Alta','2025-12-07 04:21:01','2025-12-08 02:30:24'),(24,2,23,11,101,'asdasdasd','Pendente','Média','2025-12-07 04:21:28','2025-12-07 04:21:28'),(25,2,23,12,10,'asdasdasd','Aprovado','Média','2025-12-07 04:21:32','2025-12-07 05:31:26'),(29,2,23,77,100,'ojkoijij','Pendente','Alta','2025-12-08 02:45:33','2025-12-08 02:45:33');
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
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (4,'820491','Guitarra Les Paul','A Les Paul style electric guitar with a flame maple top, amber color, gold hardware, and dramatic dark background lighting.','Top em maple flame, corpo em mogno.','Dois captadores humbucker e ponte Tune-o-Matic.','Amber Flame','#D2691E',NULL,1,5600.00,3360.00,'/uploads/fotosProdutos/guitarra-lespaul-frente.png, /uploads/fotosProdutos/guitarra-lespaul-frente-sem-fundo.png, /uploads/fotosProdutos/guitarra-lespaul-verso.png, /uploads/fotosProdutos/guitarra-lespaul-verso-sem-fundo.png'),(5,'179632','Baixo Acústico (Baixolão) 4 Cordas','A four-string acoustic bass guitar with a large wooden body, natural matte finish, displayed on a wooden floor with studio lighting.','Tampo em spruce, corpo em mogno.','Captação ativa e braço confortável.','Natural Fosco','#ac6a23',15,1,2100.00,1260.00,''),(6,'493725','Baixo Elétrico Jazz Bass','A Jazz Bass electric guitar with sunburst finish, two pickups, chrome hardware, and studio lighting.','Corpo em alder, braço em maple.','Dois captadores single coil, timbre vintage.','Sunburst','#8B4513',NULL,1,3700.00,2220.00,'/uploads/fotosProdutos/baixo-eletrico-jazz-bass-frente.png, /uploads/fotosProdutos/baixo-eletrico-jazz-bass-frente-sem-fundo.png, /uploads/fotosProdutos/baixo-eletrico-jazz-bass-verso.png, /uploads/fotosProdutos/baixo-eletrico-jazz-bass-verso-sem-fundo.png'),(7,'260498','Baixo Elétrico Precision Bass','A Precision Bass electric guitar with black body, maple neck, vintage look, photographed on dark background.','Corpo em alder, braço maple e captador split coil.','Design clássico e som encorpado.','Preto','#111111',NULL,1,3900.00,2340.00,'/uploads/fotosProdutos/baixo-eletrico-precision-bass-frente.png, /uploads/fotosProdutos/baixo-eletrico-precision-bass-frente-sem-fundo.png, /uploads/fotosProdutos/baixo-eletrico-precision-bass-verso.png, /uploads/fotosProdutos/baixo-eletrico-precision-bass-verso-sem-fundo.png'),(8,'619874','Viola Caipira 12 Cordas','A modern 12-string Brazilian viola caipira, polished wood finish, studio lighting, front-facing product photo.','Corpo em mogno e tampo em spruce.','Braço reforçado, timbre cristalino.','Natural Polido','#D2A679',NULL,1,1600.00,960.00,'/uploads/fotosProdutos/viola-caipira-12-cordas-frente.png, /uploads/fotosProdutos/viola-caipira-12-cordas-frente-sem-fundo.png, /uploads/fotosProdutos/viola-caipira-12-cordas-verso.png, /uploads/fotosProdutos/viola-caipira-12-cordas-verso-sem-fundo.png'),(9,'982310','Violino Profissional','A professional violin with dark varnish, fine wood texture, and elegant studio lighting for concert presentation.','Madeira maple flame e ébano.','Cordas de aço e arco em crina natural.','Vermelho Escuro','#8B0000',NULL,1,6800.00,4080.00,'/uploads/fotosProdutos/violino-frente.png, /uploads/fotosProdutos/violino-frente-sem-fundo.png, /uploads/fotosProdutos/violino-verso.png, /uploads/fotosProdutos/violino-verso-sem-fundo.png'),(10,'312654','Violoncelo Profissional','A professional concert cello with dark polished wood, elegant shape, under soft spotlight on stage.','Corpo em maple europeu.','Som encorpado e sustentado.','Vermelho Mogno','#8B4513',NULL,1,12500.00,7500.00,'/uploads/fotosProdutos/violoncelo-profissional-frente.png, /uploads/fotosProdutos/violoncelo-profissional-frente-sem-fundo.png, /uploads/fotosProdutos/violoncelo-profissional-verso.png, /uploads/fotosProdutos/violoncelo-profissional-verso-sem-fundo.png'),(11,'897324','Ukulele Soprano','A small soprano ukulele with light wood finish, tropical vibe, photographed on beige background with warm light.','Corpo em mahogany e tampo spruce.','Som suave e portátil.','Natural Claro','#E6BE8A',NULL,1,480.00,288.00,'/uploads/fotosProdutos/ukulele-soprano-frente.png, /uploads/fotosProdutos/ukulele-soprano-frente-sem-fundo.png, /uploads/fotosProdutos/ukulele-soprano-verso.png, /uploads/fotosProdutos/ukulele-soprano-verso-sem-fundo.png'),(12,'235781','Banjo 4 Cordas','A 4-string traditional banjo with metallic rim and wooden neck, retro look, natural lighting.','Aros em alumínio e braço em maple.','Som brilhante e percussivo.','Natural com Metal','#C0C0C0',NULL,1,1450.00,870.00,'/uploads/fotosProdutos/banjo-4-cordas-frente.png, /uploads/fotosProdutos/banjo-4-cordas-frente-sem-fundo.png, /uploads/fotosProdutos/banjo-4-cordas-verso.png, /uploads/fotosProdutos/banjo-4-cordas-verso-sem-fundo.png'),(13,'519843','Cavaquinho Elétrico','An electric cavaquinho with solid body, embedded pickups, modern lighting on dark studio background.','Corpo sólido em mogno e captação ativa.','Design moderno, ideal para palco.','Bege Claro','#e0b362',NULL,1,1300.00,780.00,'/uploads/fotosProdutos/cavaquinho-eletrico-frente.png, /uploads/fotosProdutos/cavaquinho-eletrico-frente-sem-fundo.png, /uploads/fotosProdutos/cavaquinho-eletrico-verso.png, /uploads/fotosProdutos/cavaquinho-eletrico-verso-sem-fundo.png'),(14,'624981','Bateria Eletrônica Profissional (Pads de Mesh)','A professional electronic drum kit with mesh pads, large display module, black finish, photographed in a recording studio.','Estrutura em aço e pads com malha dupla.','Módulo digital com 700 sons e conectividade USB/MIDI.','Preto Fosco','#111111',NULL,2,9800.00,5880.00,'/uploads/fotosProdutos/bateria-eletrica-frente.png, /uploads/fotosProdutos/bateria-eletrica-frente-sem-fundo.png, /uploads/fotosProdutos/bateria-eletrica-verso.png, /uploads/fotosProdutos/bateria-eletrica-verso-sem-fundo.png'),(15,'835207','Cajón Flamenco','A flamenco cajón made of polished wood, front striking surface, placed on a wooden floor with warm lighting.','Madeira compensada de bétula e painel frontal em mogno.','Timbre definido para palmas e graves encorpados.','Natural Polido','#D2B48C',NULL,2,890.00,534.00,'/uploads/fotosProdutos/cajon-flamenco-frente.png, /uploads/fotosProdutos/cajon-flamenco-frente-sem-fundo.png, /uploads/fotosProdutos/cajon-flamenco-verso.png, /uploads/fotosProdutos/cajon-flamenco-verso-sem-fundo.png'),(16,'921543','Pandeiro Couro','A leather-headed pandeiro with brass jingles, handcrafted style, rustic lighting on wooden surface.','Aros de madeira e platinelas de latão.','Membrana de couro natural, 10 polegadas.','Natural','#E6BE8A',NULL,2,450.00,270.00,'/uploads/fotosProdutos/pandeiro-couro-frente.png, /uploads/fotosProdutos/pandeiro-couro-frente-sem-fundo.png, /uploads/fotosProdutos/pandeiro-couro-verso-sem-fundo.png, /uploads/fotosProdutos/pandeiro-couro-verso-sem-fundo.png'),(18,'149872','Congas Quinto','A single quinto conga drum, tall and narrow, dark wood finish with chrome hardware, studio lighting.','Madeira de carvalho com ferragens cromadas.','Altura de 75cm e afinação por chaves.','Mogno Escuro','#8B4513',NULL,2,3100.00,1860.00,'/uploads/fotosProdutos/conga-frente.png, /uploads/fotosProdutos/conga-frente-sem-fundo.png, /uploads/fotosProdutos/conga-verso.png, /uploads/fotosProdutos/conga-verso-sem-fundo.png'),(19,'658304','Bongôs Profissional','Professional bongo drums with dark polished wood, metal tuning lugs, photographed on black background.','Mogno e ferragens niqueladas.','Tamanhos 7” e 8,5”, pele natural.','Natural Escuro','#5C4033',NULL,2,1350.00,810.00,'/uploads/fotosProdutos/bongo-frente.png, /uploads/fotosProdutos/bongo-frente-sem-fundo.png, /uploads/fotosProdutos/bongo-verso.png, /uploads/fotosProdutos/bongo-verso-sem-fundo.png'),(20,'278965','Surdo Marcação','A large samba surdo drum for bass rhythm, deep aluminum body, strong visual lighting, street parade vibe.','Corpo em alumínio escovado e pele dupla.','Utilizado em desfiles e blocos de carnaval.','Alumínio','#B0B0B0',NULL,2,1750.00,1050.00,'/uploads/fotosProdutos/surdo-frente.png, /uploads/fotosProdutos/surdo-frente-sem-fundo.png, /uploads/fotosProdutos/surdo-verso.png, /uploads/fotosProdutos/surdo-verso-sem-fundo.png'),(21,'987130','Triângulo Tradicional','A metal triangle percussion instrument with a simple design, hanging with striker, isolated on white background.','Aço inoxidável.','Inclui baqueta e cordão de fixação.','Metálico','#C0C0C0',NULL,2,90.00,54.00,'/uploads/fotosProdutos/triangulo-frente.png, /uploads/fotosProdutos/triangulo-frente-sem-fundo.png, /uploads/fotosProdutos/triangulo-verso.png, /uploads/fotosProdutos/triangulo-verso-sem-fundo.png'),(22,'305478','Tantan Madeira','A wooden tantan drum, cylindrical shape, natural finish, used in pagode music, warm studio lighting.','Mogno e couro natural.','Sonoridade grave e suave.','Natural','#DEB887',NULL,2,760.00,456.00,'/uploads/fotosProdutos/tantan-frente.png, /uploads/fotosProdutos/tantan-frente-sem-fundo.png, /uploads/fotosProdutos/tantan-cima.png, /uploads/fotosProdutos/tantan-cima-sem-fundo.png'),(23,'498320','Reco-reco de Madeira','A wooden reco-reco with carved ridges and a stick, photographed on a light wood surface, warm tones.','Mogno entalhado e baqueta de madeira.','Timbre rústico e artesanal.','Natural Envernizado','#CDAA7D',NULL,2,180.00,108.00,'/uploads/fotosProdutos/reco-reco-frente.png, /uploads/fotosProdutos/reco-reco-frente-sem-fundo.png, /uploads/fotosProdutos/reco-reco-cima.png, /uploads/fotosProdutos/reco-reco-cima-sem-fundo.png'),(25,'831276','Marimba Orquestral','A professional orchestral marimba with wooden resonators and mallets, concert hall background lighting.','Lâminas de rosewood e ressonadores metálicos.','Som encorpado, usado em orquestras.','Madeira Natural','#8B4513',NULL,2,21000.00,12600.00,'/uploads/fotosProdutos/marimba-orquestral-frente.png, /uploads/fotosProdutos/marimba-orquestral-frente-sem-fundo.png, /uploads/fotosProdutos/marimba-orquestral-verso.png, /uploads/fotosProdutos/marimba-orquestral-verso-sem-fundo.png'),(26,'489072','Glockenspiel Orquestral','A professional orchestral glockenspiel mounted on a frame with mallets, dark concert background lighting.','Lâminas de aço e estrutura tubular.','Sonoridade aguda e cristalina.','Metálico','#D3D3D3',NULL,2,7200.00,4320.00,'/uploads/fotosProdutos/glockenspiel-profissional-frente.png, /uploads/fotosProdutos/glockenspiel-profissional-frente-sem-fundo.png, /uploads/fotosProdutos/glockenspiel-profissional-verso.png, /uploads/fotosProdutos/glockenspiel-profissional-verso-sem-fundo.png'),(29,'739160','Piano Digital (Portátil)','A compact digital piano with 88 weighted keys, minimalist black design, displayed in a modern home studio.','Corpo em plástico ABS reforçado, teclas semi-pesadas.','Inclui saída USB e conexão para fones.','Preto Fosco','#1C1C1C',NULL,3,4200.00,2520.00,'/uploads/fotosProdutos/piano-digital-portatil-frente.png, /uploads/fotosProdutos/piano-digital-portatil-frente-sem-fundo.png, /uploads/fotosProdutos/piano-digital-portatil-verso.png, /uploads/fotosProdutos/piano-digital-portatil-verso-sem-fundo.png'),(30,'528903','Piano Digital (De Móvel / Armário)','A cabinet-style digital piano with built-in stand and pedals, dark wood finish, photographed in a cozy living room setting.','Estrutura em MDF revestido e teclas com ação hammer.','Sistema estéreo e 10 timbres internos.','Madeira Escura','#3B2F2F',NULL,3,6400.00,3840.00,'/uploads/fotosProdutos/piano-digital-movel-frente.png, /uploads/fotosProdutos/piano-digital-movel-frente-sem-fundo.png, /uploads/fotosProdutos/piano-digital-movel-verso.png, /uploads/fotosProdutos/piano-digital-movel-verso-sem-fundo.png'),(31,'481279','Teclado Arranjador (Avançado 76/88 Teclas)','A professional arranger keyboard with extended 76 keys, multiple controls and display, photographed in a recording studio.','Carcaça em alumínio leve, display LCD colorido.','Ritmos integrados e gravação em tempo real.','Prateado','#C0C0C0',NULL,3,7500.00,4500.00,'/uploads/fotosProdutos/teclado-arranjador-frente.png, /uploads/fotosProdutos/teclado-arranjador-frente-sem-fundo.png, /uploads/fotosProdutos/teclado-arranjador-verso.png, /uploads/fotosProdutos/teclado-arranjador-verso-sem-fundo.png'),(32,'967540','Teclado Controlador MIDI (25 Teclas)','A small 25-key MIDI controller keyboard with drum pads and knobs, modern lighting on white background.','Corpo em ABS preto fosco e conexões USB-C.','Compatível com DAWs profissionais.','Preto Fosco','#111111',NULL,3,980.00,588.00,'/uploads/fotosProdutos/teclado-controlador-midi-frente.png, /uploads/fotosProdutos/teclado-controlador-midi-frente-sem-frente.png, /uploads/fotosProdutos/teclado-controlador-midi-verso.png, /uploads/fotosProdutos/teclado-controlador-midi-verso-sem-fundo.png'),(33,'379826','Sintetizador (Digital)','A modern digital synthesizer with sleek design, LCD display, and touch controls, in a futuristic studio environment.','Painel metálico com 61 teclas sensíveis à velocidade.','Gerador de som digital com 512 presets.','Preto Grafite','#2F2F2F',NULL,3,8900.00,5340.00,'/uploads/fotosProdutos/sintetizador-digital-frente.png, /uploads/fotosProdutos/sintetizador-digital-frente-sem-fundo.png, /uploads/fotosProdutos/sintetizador-digital-verso.png, /uploads/fotosProdutos/sintetizador-digital-verso-sem-fundo.png'),(34,'982431','Flauta Doce (Contralto)','An alto recorder made of dark wood, traditional design, placed on a sheet of classical music with warm lighting.','Madeira de ébano e chaves ajustadas.','Sonoridade suave e ideal para aprendizado clássico.','Mogno Escuro','#4B3621',NULL,4,420.00,252.00,'/uploads/fotosProdutos/flauta-doce-frente.png, /uploads/fotosProdutos/flauta-doce-frente-sem-fundo.png'),(36,'843965','Saxofone (Alto)','An alto saxophone with gold lacquer finish, classic curved shape, photographed against a dark studio background with dramatic light.','Latão com acabamento dourado e chaves em madrepérola.','Timbre clássico e resposta rápida.','Dourado','#FFD700',NULL,4,9800.00,5880.00,'/uploads/fotosProdutos/saxofone-alto-frente.png, /uploads/fotosProdutos/saxofone-alto-frente-sem-fundo.png, /uploads/fotosProdutos/saxofone-alto-verso.png, /uploads/fotosProdutos/saxofone-alto-verso-sem-fundo.png'),(37,'270319','Trompete (Bb)','A standard Bb trumpet with gold lacquer finish and silver mouthpiece, placed on a reflective black surface with concert lighting.','Corpo em latão com bocal niquelado.','Afinado em Si♭, ideal para iniciantes e profissionais.','Dourado','#FFD700',NULL,4,5400.00,3240.00,'/uploads/fotosProdutos/trompete-bb-frente.png, /uploads/fotosProdutos/trompete-bb-frente-sem-fundo.png, /uploads/fotosProdutos/trompete-bb-verso.png, /uploads/fotosProdutos/trompete-bb-verso-sem-fundo.png'),(38,'761084','Clarinete (Bb)','A Bb clarinet with black body and silver keys, lying on a wooden table, soft classical lighting.','Resina ABS com chaves niqueladas.','Sonorização clara e projeção equilibrada.','Preto','#000000',NULL,4,3900.00,2340.00,'/uploads/fotosProdutos/clarinete-bb-frente.png, /uploads/fotosProdutos/clarinete-bb-frente-sem-fundo.png, /uploads/fotosProdutos/clarinete-bb-verso.png, /uploads/fotosProdutos/clarinete-bb-verso-sem-fundo.png'),(39,'689431','Gaita (Harmônica) Diatônica','A diatonic harmonica with metal cover and wooden comb, pocket-size, photographed on a rustic wooden surface.','Corpo em madeira e tampas cromadas.','Tonalidade C, ideal para blues e folk.','Metálico','#C0C0C0',NULL,4,350.00,210.00,'/uploads/fotosProdutos/gaita-harmonica-frente.png, /uploads/fotosProdutos/gaita-harmonica-frente-sem-fundo.png, /uploads/fotosProdutos/gaita-harmonica-verso.png, /uploads/fotosProdutos/gaita-harmonica-verso-sem-fundo.png'),(41,'924518','Trompa (Modelo Profissional)','A professional French horn with full double horn system, gold lacquer finish, photographed in a concert environment.','Latão dourado com chaves rotativas.','Sonoridade ampla e projeção poderosa.','Dourado Envelhecido','#DAA520',NULL,4,16500.00,9900.00,'/uploads/fotosProdutos/trompa-frente.png, /uploads/fotosProdutos/trompa-frente-sem-fundo.png, /uploads/fotosProdutos/trompa-verso.png, /uploads/fotosProdutos/trompa-verso-sem-fundo.png'),(42,'378902','Corneta (Modelo Profissional)','A professional silver cornet, refined design, photographed on stage lighting setup with blurred orchestra background.','Corpo em prata com válvulas de pistão rápidas.','Timbre suave, ideal para bandas sinfônicas.','Prateado','#C0C0C0',NULL,4,8200.00,4920.00,'/uploads/fotosProdutos/corneta-frente.png, /uploads/fotosProdutos/corneta-frente-sem-fundo.png, /uploads/fotosProdutos/corneta-verso.png, /uploads/fotosProdutos/corneta-verso-sem-fundo.png'),(43,'582971','Acordeon (Sanfona) 80 Baixos','A full-size 80-bass accordion with pearl buttons and decorative grille, photographed in a folk music studio with soft light.','Corpo em madeira compensada, fole em tecido reforçado e botões de madrepérola.','Timbre tradicional, ideal para forró, vanerão e música regional.','Preto com Branco','#000000',NULL,5,9600.00,5760.00,'/uploads/fotosProdutos/acordeon-frente.png, /uploads/fotosProdutos/acordeon-frente-sem-fundo.png, /uploads/fotosProdutos/acordeon-verso.png, /uploads/fotosProdutos/acordeon-verso-sem-fundo.png'),(44,'920516','Harmonium Tradicional Indiano','A classic Indian harmonium with decorative carvings, extended bellows, photographed in a traditional music room setting.','Madeira de teca com entalhes ornamentais.','Timbre quente e ressonância profunda.','Natural Entalhado','#CD853F',NULL,5,8400.00,5040.00,'/uploads/fotosProdutos/harmonium-frente.png, /uploads/fotosProdutos/harmonium-frente-sem-fundo.png, /uploads/fotosProdutos/harmonium-verso.png, /uploads/fotosProdutos/harmonium-verso-sem-fundo.png'),(45,'362094','Bandoneón Clássico Argentino','A classic Argentine bandoneon with black wooden body, pearl buttons, open bellows, photographed under soft tango-style lighting.','Mogno preto com botões de madrepérola.','Instrumento típico do tango, som expressivo e melancólico.','Preto Piano','#111111',NULL,5,11800.00,7080.00,'/uploads/fotosProdutos/bandoneon-frente.png, /uploads/fotosProdutos/bandoneon-frente-sem-fundo.png, /uploads/fotosProdutos/bandoneon-verso.png, /uploads/fotosProdutos/bandoneon-verso-sem-fundo.png'),(46,'142693','Amplificador de Guitarra (Combo)','A combo guitar amplifier with black tolex finish, silver grille cloth, control knobs on top, photographed in a recording studio with moody lighting.','Caixa em MDF revestida com courvin preto e tela prateada.','Potência de 40W RMS, ideal para ensaios e pequenos shows.','Preto Fosco','#1C1C1C',NULL,6,2800.00,1680.00,'/uploads/fotosProdutos/amplificador-de-guitarra-frente.png, /uploads/fotosProdutos/amplificador-de-guitarra-frente-sem-fundo.png, /uploads/fotosProdutos/amplificador-de-guitarra-verso.png, /uploads/fotosProdutos/amplificador-de-guitarra-verso-sem-fundo.png'),(47,'587420','Amplificador de Guitarra (Cabeçote)','A guitar amp head with metal chassis and glowing tubes, placed on top of a speaker cabinet, illuminated by warm stage lighting.','Chassi metálico e válvulas EL34.','Cabeçote valvulado de 100W com canal limpo e drive.','Preto com Detalhes Dourados','#2B2B2B',NULL,6,6200.00,3720.00,'/uploads/fotosProdutos/cabecote-amplificador-guitarra-frente.png, /uploads/fotosProdutos/cabecote-amplificador-guitarra-frente-sem-fundo.png, /uploads/fotosProdutos/cabecote-amplificador-guitarra-verso.png, /uploads/fotosProdutos/cabecote-amplificador-guitarra-verso-sem-fundo.png'),(48,'904315','Amplificador de Baixo (Combo)','A bass combo amplifier with a large speaker grille, dark design, photographed in a rehearsal room environment.','Gabinete em madeira laminada, alto-falante de 15\".','Som encorpado, equalizador ativo de 3 bandas.','Preto Texturizado','#000000',NULL,6,4800.00,2880.00,'/uploads/fotosProdutos/amplificador-de-baixo-frente.png, /uploads/fotosProdutos/amplificador-de-baixo-frente-sem-fundo.png, /uploads/fotosProdutos/amplificador-de-baixo-verso.png, /uploads/fotosProdutos/amplificador-de-baixo-verso-sem-fundo.png'),(49,'231867','Amplificador de Violão (Acústico)','An acoustic guitar amplifier with wooden panel design, control knobs on top, natural light studio photography.','Painel frontal em madeira e circuito transistorado.','Canal duplo com entrada para microfone e violão.','Madeira Natural','#B8860B',NULL,6,3600.00,2160.00,'/uploads/fotosProdutos/amplificador-de-violao-frente.png, /uploads/fotosProdutos/amplificador-de-violao-frente-sem-fundo.png, /uploads/fotosProdutos/amplificador-de-violao-verso.png, /uploads/fotosProdutos/amplificador-de-violao-verso-sem-fundo.png'),(50,'512479','Caixa Acústica (Passiva)','A passive loudspeaker with black grille and metal handles, photographed in a concert setup with stage lights.','Gabinete em MDF com grade metálica e alças laterais.','Suporta até 300W RMS de potência.','Preto Texturizado','#1E1E1E',NULL,6,2100.00,1260.00,'/uploads/fotosProdutos/caixa-acustica-passiva-frente.png, /uploads/fotosProdutos/caixa-acustica-passiva-frente-sem-fundo.png, /uploads/fotosProdutos/caixa-acustica-passiva-verso.png, /uploads/fotosProdutos/caixa-acustica-passiva-verso-sem-fundo.png'),(51,'784632','Mesa de Som (Digital)','A digital audio mixing console with touchscreen and illuminated faders, placed in a modern studio under dim light.','Corpo em alumínio escovado e superfície sensível ao toque.','32 canais digitais com efeitos integrados.','Prata Industrial','#D3D3D3',NULL,6,12500.00,7500.00,'/uploads/fotosProdutos/mesa-de-som-digital-frente.png, /uploads/fotosProdutos/mesa-de-som-digital-frente-sem-fundo.png, /uploads/fotosProdutos/mesa-de-som-digital-verso.png, /uploads/fotosProdutos/mesa-de-som-digital-verso-sem-fundo.png'),(52,'345971','Microfone Dinâmico (Shure SM58 Style)','A dynamic vocal microphone with metal grille and black body, close-up studio shot, isolated on dark background.','Corpo em alumínio e cápsula dinâmica cardioide.','Ideal para vocais ao vivo e apresentações.','Preto e Prata','#2E2E2E',NULL,6,780.00,468.00,'/uploads/fotosProdutos/microfone-dinamico-frente.png, /uploads/fotosProdutos/microfone-dinamico-frente-sem-fundo.png, /uploads/fotosProdutos/microfone-dinamico-verso.png, /uploads/fotosProdutos/microfone-dinamico-verso-sem-fundo.png'),(53,'679124','Microfone Condensador (Estúdio)','A large diaphragm condenser microphone mounted on a shock mount with pop filter, in a professional recording booth.','Corpo metálico prateado com suporte anti-vibração.','Resposta de frequência de 20Hz a 20kHz.','Prateado','#DCDCDC',NULL,6,2100.00,1260.00,'/uploads/fotosProdutos/microfone-estudio-frente.png, /uploads/fotosProdutos/microfone-estudio-frente-sem-fundo.png, /uploads/fotosProdutos/microfone-estudio-verso.png, /uploads/fotosProdutos/microfone-estudio-verso-sem-fundo.png'),(54,'912570','Monitor de Áudio (De Referência)','A studio reference monitor speaker with black matte finish, yellow cone, placed on a mixing desk with computer screens.','Gabinete de MDF, tweeter de seda e woofer Kevlar 5”.','Sonorização flat ideal para mixagem.','Preto com Amarelo','#222222',NULL,6,3800.00,2280.00,'/uploads/fotosProdutos/monitor-audio-referencia-frente.png, /uploads/fotosProdutos/monitor-audio-referencia-frente-sem-fundo.png, /uploads/fotosProdutos/monitor-audio-referencia-verso.png, /uploads/fotosProdutos/monitor-audio-referencia-verso-sem-fundo.png'),(56,'604823','Interface de Áudio (4+ Canais)','A professional multi-channel audio interface with multiple inputs and outputs, metal rackmount design, illuminated by cool studio light.','Carcaça metálica com conexões balanceadas XLR e TRS.','Compatível com Windows, macOS e Linux.','Prateado','#C0C0C0',NULL,6,4100.00,2460.00,'/uploads/fotosProdutos/interface-audio-frente.png, /uploads/fotosProdutos/interface-audio-frente-sem-fundo.png, /uploads/fotosProdutos/interface-audio-verso.png, /uploads/fotosProdutos/interface-audio-verso-sem-verso.png'),(57,'837295','Fones (Over-ear de Estúdio)','Closed-back over-ear studio headphones with coiled cable, photographed on a mixing desk in soft lighting.','Almofadas em couro sintético e drivers de 40mm.','Design confortável para longas sessões.','Preto Fosco','#111111',NULL,6,890.00,534.00,'/uploads/fotosProdutos/headset-frente.png, /uploads/fotosProdutos/headset-frente-sem-fundo.png, /uploads/fotosProdutos/headset-verso.png, /uploads/fotosProdutos/headset-verso-sem-fundo.png'),(58,'498731','Fones (In-ear de Palco)','Professional in-ear monitor earphones with transparent housing and cable, photographed on a stage background with subtle light reflections.','Carcaça transparente e cabos removíveis.','Resposta precisa, ideal para músicos ao vivo.','Transparente','#EAEAEA',NULL,6,1250.00,750.00,'/uploads/fotosProdutos/fone-ouvido-frente.png, /uploads/fotosProdutos/fone-ouvido-frente-sem-fundo.png, /uploads/fotosProdutos/fone-ouvido-verso.png, /uploads/fotosProdutos/fone-ouvido-verso-sem-fundo.png'),(59,'184523','Cordas Avulsas (Violão Aço / Nylon)','A set of acoustic guitar strings, steel and nylon, neatly packaged with brand label visible, photographed on a wooden table.','Aço niquelado e nylon cristal.','Pacote com 6 cordas, som brilhante e durável.','Prateado e Transparente','#E0E0E0',NULL,7,75.00,45.00,'/uploads/fotosProdutos/corda-violao-frente.png, /uploads/fotosProdutos/corda-violao-frente-sem-fundo'),(60,'537916','Cordas Avulsas (Guitarra)','Electric guitar string set with colorful ball ends, metallic shine under studio lighting, placed beside a guitar headstock.','Aço inoxidável niquelado.','Calibre 0.10 – som equilibrado e boa resistência.','Metálico','#B0B0B0',NULL,7,80.00,48.00,'/uploads/fotosProdutos/corda-guitarra-frente.png, /uploads/fotosProdutos/corda-guitarra-frente-sem-fundo.png'),(61,'972184','Cordas Avulsas (Baixo 4c / 5c)','Bass guitar string set with thick nickel wound coils, photographed close-up on a dark textured background.','Aço niquelado com núcleo hexagonal.','Som grave potente e sustain longo.','Prateado','#C0C0C0',NULL,7,120.00,72.00,'/uploads/fotosProdutos/corda-baixo-frente.png, /uploads/fotosProdutos/corda-baixo-frente-sem-fundo.png'),(62,'405768','Cordas Avulsas (Violino)','Violin string set in elegant packaging, photographed on a wooden violin body in soft natural light.','Aço cromado com alma sintética.','Timbre doce e projeção refinada.','Prateado','#CCCCCC',NULL,7,130.00,78.00,'/uploads/fotosProdutos/corda-violino-frente.png, /uploads/fotosProdutos/corda-violino-frente-sem-fundo.png'),(63,'619845','Palheta (Nylon)','A close-up of nylon guitar picks in different colors and thicknesses, scattered on a wooden table under soft light.','Nylon flexível e durável.','Pacote com 10 unidades de diferentes espessuras.','Sortido','#AAAAAA',NULL,7,25.00,15.00,'/uploads/fotosProdutos/palheta-nylon.png, /uploads/fotosProdutos/palheta-nylon-sem-fundo.png'),(64,'826493','Palheta (Tortex)','Colorful tortex guitar picks with matte texture, arranged in a fan pattern on a clean white background.','Tortex antiderrapante.','Pacote com 10 unidades de timbre equilibrado e pegada firme.','Sortido','#D3D3D3',NULL,7,30.00,18.00,'/uploads/fotosProdutos/palheta-tortex.png, /uploads/fotosProdutos/palheta-tortex-sem-fundo.png'),(65,'540128','Palheta (Jazz)','Small jazz guitar picks with pointed tips, black and red colors, photographed close-up on an amplifier surface.','Nylon rígido com ponta afiada.','Pacote com 10 unidades de design pequeno para precisão máxima.','Preto e Vermelho','#8B0000',NULL,7,35.00,21.00,'/uploads/fotosProdutos/palheta-jazz.png, /uploads/fotosProdutos/palheta-jazz-sem-fundo.png'),(66,'763910','Capotraste (Violão e Guitarra)','A sleek aluminum guitar capo clipped onto an acoustic guitar neck, photographed with natural lighting.','Alumínio anodizado com mola reforçada.','Ajuste rápido e fixação firme.','Prata Escovado','#C0C0C0',NULL,7,90.00,54.00,'/uploads/fotosProdutos/capotraste.png, /uploads/fotosProdutos/capotraste-sem-fundo.png'),(67,'231640','Estante (De Partitura)','A foldable black music stand holding sheet music, photographed in a rehearsal room with soft lighting.','Aço leve dobrável com trava de altura.','Altura ajustável e base reforçada.','Preto Fosco','#222222',NULL,7,250.00,150.00,'/uploads/fotosProdutos/estande-partitura-frente.png, /uploads/fotosProdutos/estande-partitura-frente-sem-fundo.png, /uploads/fotosProdutos/estande-partitura-verso.png, /uploads/fotosProdutos/estande-partitura-verso-sem-fundo.png'),(68,'658319','Estante (Para Teclado)','A double-X keyboard stand supporting an electronic keyboard, photographed on a stage background.','Aço tubular com ajuste rápido.','Compatível com teclados de até 88 teclas.','Preto Brilhante','#000000',NULL,7,310.00,186.00,'/uploads/fotosProdutos/estande-teclado-frente.png, /uploads/fotosProdutos/estande-teclado-frente-sem-fundo.png, /uploads/fotosProdutos/estande-teclado-verso.png, /uploads/fotosProdutos/estande-teclado-verso-sem-fundo.png'),(69,'874590','Pedal de Efeito (Distortion / Overdrive)','Guitar distortion pedal with metal casing and control knobs, glowing LED light, placed on a pedalboard.','Carcaça metálica com potenciômetros duplos.','Som encorpado e quente, estilo vintage.','Laranja Metálico','#FF8C00',NULL,7,520.00,312.00,'/uploads/fotosProdutos/pedal-distortion.png, /uploads/fotosProdutos/pedal-distorcion-sem-fundo.png'),(70,'982410','Pedal de Efeito (Chorus / Delay)','Chorus and delay guitar pedals with colorful designs and multiple control knobs, photographed in studio lighting.','Metal anodizado com circuito analógico.','Efeitos clássicos para ambiência e modulação.','Azul Claro','#87CEEB',NULL,7,580.00,348.00,'/uploads/fotosProdutos/pedal-chorus-delay.png, /uploads/fotosProdutos/pedal-chorus-delay-sem-fundo.png'),(71,'490175','Pedal de Efeito (Looper)','Compact looper pedal with record and play buttons, photographed on a pedalboard setup.','Metal com botão de acionamento reforçado.','Grava e reproduz loops em tempo real.','Vermelho','#B22222',NULL,7,640.00,384.00,'/uploads/fotosProdutos/pedal-looper.png, /uploads/fotosProdutos/pedal-looper-sem-fundo.png'),(72,'304987','Cabo P10 (Instrumento)','Instrument cable with 1/4 inch (P10) jacks, coiled neatly beside an amplifier, photographed with soft shadows.','Fios de cobre com blindagem dupla e conectores niquelados.','Comprimento de 5 metros, baixa interferência.','Preto','#1C1C1C',NULL,7,90.00,54.00,'/uploads/fotosProdutos/cabo-p10.png, /uploads/fotosProdutos/cabo-p10-sem-fundo.png'),(73,'790246','Cabo XLR (Microfone)','Professional XLR microphone cable with metal connectors, coiled on a studio desk next to a condenser microphone.','Condutor em cobre livre de oxigênio.','Comprimento de 3 metros, ideal para estúdios.','Preto','#000000',NULL,7,110.00,66.00,'/uploads/fotosProdutos/cabo-xlr.png, /uploads/fotosProdutos/cabo-xlr-sem-fundo.png'),(74,'628354','Suporte (Para Guitarra/Violão)','A-frame guitar stand holding an acoustic guitar, photographed in a cozy music studio setting.','Aço dobrável com proteção em borracha.','Estável e compacto para transporte.','Preto','#1E1E1E',NULL,7,210.00,126.00,'/uploads/fotosProdutos/suporte-guitarra.png, /uploads/fotosProdutos/suporte-guitarra-sem-fundo.png'),(75,'562893','Suporte (Para Microfone)','Adjustable microphone stand with boom arm, holding a studio microphone, illuminated by soft lighting.','Aço leve com base redonda e braço telescópico.','Ajustável em altura e ângulo.','Preto','#000000',NULL,7,260.00,156.00,'/uploads/fotosProdutos/suporte-microfone.png, /uploads/fotosProdutos/suporte-microfone-sem-fundo.png'),(76,'981430','Case Rígido (Instrumento)','Hard guitar case made of black leather with metal latches, opened slightly showing plush red interior.','MDF revestido em couro sintético e interior aveludado.','Proteção premium para instrumentos de corda.','Preto com Vermelho','#111111',NULL,7,720.00,432.00,'/uploads/fotosProdutos/case-guitarra.png, /uploads/fotosProdutos/case-guitarra-sem-fundo.png, /uploads/fotosProdutos/case-guitarra-fechada.png, /uploads/fotosProdutos/case-guitarra-fechada-sem-fundo.png'),(77,'435219','Bag Soft (Instrumento)','Soft padded gig bag for acoustic guitar with shoulder straps, standing upright on a white background.','Tecido impermeável com alças acolchoadas.','Bolso frontal e reforço traseiro.','Preto','#000000',NULL,7,350.00,210.00,'/uploads/fotosProdutos/case-tecido.png, /uploads/fotosProdutos/case-tecido-sem-fundo.png, /uploads/fotosProdutos/case-tecido-verso.png, /uploads/fotosProdutos/case-tecido-verso-sem-fundo.png'),(78,'720158','Afinador Eletrônico (Clip)','Clip-on guitar tuner attached to the headstock, with illuminated display showing tuning note.','Corpo em ABS e visor LCD colorido.','Rotação 360° e alta precisão de leitura.','Preto','#1A1A1A',NULL,7,150.00,90.00,'/uploads/fotosProdutos/afinador-clipe.png, /uploads/fotosProdutos/afinador-clipe-sem-fundo.png, /uploads/fotosProdutos/afinador-clipe-verso.png, /uploads/fotosProdutos/afinador-clipe-verso-sem-fundo.png'),(79,'298504','Afinador Eletrônico (Pedal)','Pedal tuner with LED display, placed on a pedalboard among other effects pedals, photographed under stage light.','Metal resistente com visor de LED brilhante.','Bypass silencioso, ideal para shows.','Prata e Azul','#C0C0C0',NULL,7,430.00,258.00,'/uploads/fotosProdutos/afinador-pedal.png, /uploads/fotosProdutos/afinador-pedal-sem-fundo.png'),(80,'854763','Baquetas (Madeira - Maple/Hickory)','Pair of wooden drumsticks made from maple and hickory, lying on a snare drum surface in a drum kit setup.','Madeira tratada de alta densidade.','Equilíbrio e resposta natural.','Mogno Claro','#CD853F',NULL,7,70.00,42.00,''),(81,'187642','Baquetas (Nylon Tip)','Drumsticks with nylon tips resting on cymbals, photographed close-up with warm stage lighting.','Corpo em hickory e ponta em nylon resistente.','Ideal para performances ao vivo e gravações.','Natural e Branco','#EEE8AA',NULL,7,85.00,51.00,'/uploads/fotosProdutos/baqueta-nylon.png, /uploads/fotosProdutos/baqueta-nylon-sem-fundo.png'),(83,'256871','Giovanni ','Giovanni Giovanni Giovanni Giovanni Giovanni Giovanni Giovanni Giovanni Giovanni Giovanni Giovanni Giovanni Giovanni Giovanni Giovanni Giovanni ','Giovanni Giovanni Giovanni Giovanni Giovanni ','Giovanni Giovanni Giovanni Giovanni Giovanni Giovanni Giovanni Giovanni Giovanni ','Giovanni Giovanni Giovanni ','#230000',NULL,1,500.00,50.00,'\\uploads\\fotosProdutos\\1765046150073-Captura de tela 2024-10-12 232808.png,\\uploads\\fotosProdutos\\1765046150075-Captura de tela 2024-10-12 233209.png,\\uploads\\fotosProdutos\\1765046150077-Captura de tela 2024-10-12 233908.png,\\uploads\\fotosProdutos\\1765046150079-Captura de tela 2024-10-12 234541.png');
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
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variacoes_produto`
--

LOCK TABLES `variacoes_produto` WRITE;
/*!40000 ALTER TABLE `variacoes_produto` DISABLE KEYS */;
INSERT INTO `variacoes_produto` VALUES (8,'801624',4,'Cherry Sunburst','#a03a2b',5600.00,650.00,0,'/uploads/fotosProdutos/guitarra-lespaul-sunburst-frente.png, /uploads/fotosProdutos/guitarra-lespaul-sunburst-frente-sem-fundo.png, /uploads/fotosProdutos/guitarra-lespaul-sunburst-verso.png, /uploads/fotosProdutos/guitarra-lespaul-sunburst-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(9,'953710',4,'Gold Top','#d4af37',5600.00,670.00,0,'/uploads/fotosProdutos/guitarra-lespaul-gold-frente.png, /uploads/fotosProdutos/guitarra-lespaul-gold-frente-sem-fundo.png, /uploads/fotosProdutos/guitarra-lespaul-gold-verso.png, /uploads/fotosProdutos/guitarra-lespaul-gold-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(10,'390862',6,'Preto Clássico','#0d0d0d',3700.00,510.00,0,'/uploads/fotosProdutos/baixo-eletrico-jazz-bass-preto-frente.png, /uploads/fotosProdutos/baixo-eletrico-jazz-bass-preto-frente-sem-fundo.png, /uploads/fotosProdutos/baixo-eletrico-jazz-bass-preto-verso.png, /uploads/fotosProdutos/baixo-eletrico-jazz-bass-preto-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(11,'627839',7,'Branco Vintage','#f8f8f8',3900.00,530.00,0,'/uploads/fotosProdutos/baixo-eletrico-precision-bass-branco-frente.png, /uploads/fotosProdutos/baixo-eletrico-precision-bass-branco-frente-sem-fundo.png, /uploads/fotosProdutos/baixo-eletrico-precision-bass-branco-verso.png, /uploads/fotosProdutos/baixo-eletrico-precision-bass-branco-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(12,'512046',7,'Azul Marinho','#001f3f',3900.00,540.00,0,'/uploads/fotosProdutos/baixo-eletrico-precision-bass-azul-frente.png, /uploads/fotosProdutos/baixo-eletrico-precision-bass-azul-frente-sem-fundo.png, /uploads/fotosProdutos/baixo-eletrico-precision-bass-azul-verso.png, /uploads/fotosProdutos/baixo-eletrico-precision-bass-azul-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(13,'749320',8,'Natural Polido','#e3b778',1600.00,380.00,0,'/uploads/fotosProdutos/viola-caipira-12-cordas-polido-frente.png, /uploads/fotosProdutos/viola-caipira-12-cordas-polido-frente-sem-fundo.png, /uploads/fotosProdutos/viola-caipira-12-cordas-polido-verso.png, /uploads/fotosProdutos/viola-caipira-12-cordas-polido-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(14,'801357',8,'Cerejeira Escura','#8b3a3a',1600.00,390.00,0,'/uploads/fotosProdutos/viola-caipira-12-cordas-cerejeira-frente.png, /uploads/fotosProdutos/viola-caipira-12-cordas-cerejeira-frente-sem-fundo.png, /uploads/fotosProdutos/viola-caipira-12-cordas-cerejeira-verso.png, /uploads/fotosProdutos/viola-caipira-12-cordas-cerejeira-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(15,'235891',9,'Madeira Avermelhada','#a0522d',6800.00,460.00,0,'/uploads/fotosProdutos/violino-avermelhado-frente.png, /uploads/fotosProdutos/violino-avermelhado-frente-sem-fundo.png, /uploads/fotosProdutos/violino-avermelhado-verso.png, /uploads/fotosProdutos/violino-avermelhado-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(16,'783024',9,'Marrom Escuro','#4b2e05',6800.00,470.00,0,'/uploads/fotosProdutos/violino-escuro-frente.png, /uploads/fotosProdutos/violino-escuro-frente-sem-fundo.png, /uploads/fotosProdutos/violino-escuro-verso.png, /uploads/fotosProdutos/violino-escuro-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(17,'986435',10,'Natural Envernizado','#c68642',12500.00,750.00,0,'/uploads/fotosProdutos/violoncelo-natural-frente.png, /uploads/fotosProdutos/violoncelo-natural-frente-sem-fundo.png, /uploads/fotosProdutos/violoncelo-natural-verso.png, /uploads/fotosProdutos/violoncelo-natural-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(18,'312759',10,'Cereja Profundo','#6a1b1b',12500.00,760.00,0,'/uploads/fotosProdutos/violoncelo-cereja-frente.png, /uploads/fotosProdutos/violoncelo-cereja-frente-sem-fundo.png, /uploads/fotosProdutos/violoncelo-cereja-verso.png, /uploads/fotosProdutos/violoncelo-cereja-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(19,'470128',11,'Madeira Clara','#f5deb3',480.00,220.00,0,'/uploads/fotosProdutos/ukulele-madeira-frente.png, /uploads/fotosProdutos/ukulele-madeira-frente-sem-fundo.png, /uploads/fotosProdutos/ukulele-madeira-verso.png, /uploads/fotosProdutos/ukulele-madeira-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(20,'942615',11,'Mogno Escuro','#3b1d0a',480.00,230.00,0,'/uploads/fotosProdutos/ukulele-mogno-frente.png, /uploads/fotosProdutos/ukulele-mogno-frente-sem-fundo.png, /uploads/fotosProdutos/ukulele-mogno-verso.png, /uploads/fotosProdutos/ukulele-mogno-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(21,'216903',12,'Natural','#d2a679',1300.00,310.00,0,'/uploads/fotosProdutos/banjo-4cordas-natural-frente.png, /uploads/fotosProdutos/banjo-4cordas-natural-frente-sem-fundo.png, /uploads/fotosProdutos/banjo-4cordas-natural-verso.png, /uploads/fotosProdutos/banjo-4cordas-natural-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(22,'509387',13,'Preto Brilhante','#000000',1300.00,320.00,0,'/uploads/fotosProdutos/cavaquinho-eletrico-preto-frente.png, /uploads/fotosProdutos/cavaquinho-eletrico-preto-frente-sem-fundo.png, /uploads/fotosProdutos/cavaquinho-eletrico-preto-verso.png, /uploads/fotosProdutos/cavaquinho-eletrico-preto-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(23,'379524',14,'Cinza Titânio','#71797e',3500.00,980.00,0,'/uploads/fotosProdutos/bateria-eletrica-cinza-frente.png, /uploads/fotosProdutos/bateria-eletrica-cinza-frente-sem-fundo.png, /uploads/fotosProdutos/bateria-eletrica-cinza-verso.png, /uploads/fotosProdutos/bateria-eletrica-cinza-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(24,'821475',15,'Madeira Clara','#deb887',520.00,240.00,0,'/uploads/fotosProdutos/cajon-flamenco-madeira-frente.png, /uploads/fotosProdutos/cajon-flamenco-madeira-frente-sem-fundo.png, /uploads/fotosProdutos/cajon-flamenco-madeira-verso.png, /uploads/fotosProdutos/cajon-flamenco-madeira-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(25,'295239',15,'Nogal Escuro','#5a3a1a',540.00,250.00,0,'/uploads/fotosProdutos/cajon-flamenco-nogal-frente.png, /uploads/fotosProdutos/cajon-flamenco-nogal-frente-sem-fundo.png, /uploads/fotosProdutos/cajon-flamenco-nogal-verso.png, /uploads/fotosProdutos/cajon-flamenco-nogal-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(26,'473193',16,'Aro Dourado','#cfae30',420.00,190.00,0,'/uploads/fotosProdutos/pandeiro-dourado-frente.png, /uploads/fotosProdutos/pandeiro-dourado-frente-sem-fundo.png, /uploads/fotosProdutos/pandeiro-dourado-verso.png, /uploads/fotosProdutos/pandeiro-dourado-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(27,'849632',16,'Aro Cromado','#c0c0c0',420.00,195.00,0,'/uploads/fotosProdutos/pandeiro-cromado-frente.png, /uploads/fotosProdutos/pandeiro-cromado-frente-sem-fundo.png, /uploads/fotosProdutos/pandeiro-cromado-verso.png, /uploads/fotosProdutos/pandeiro-cromado-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(30,'504856',18,'Madeira Natural','#b8860b',1600.00,480.00,0,'/uploads/fotosProdutos/conga-madeira-frente.png, /uploads/fotosProdutos/conga-madeira-frente-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(31,'639442',18,'Vermelho Vinil','#570000',1600.00,490.00,0,'/uploads/fotosProdutos/conga-vermelho-frente.png, /uploads/fotosProdutos/conga-vermelho-frente-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(32,'811223',19,'Madeira Clara','#d2b48c',1100.00,320.00,0,'/uploads/fotosProdutos/bongo-madeira-frente.png, /uploads/fotosProdutos/bongo-madeira-frente-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(33,'513958',19,'Marrom Escuro','#4b2e05',1100.00,330.00,0,'/uploads/fotosProdutos/bongo-marrom-frente.png, /uploads/fotosProdutos/bongo-marrom-frente-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(34,'722326',20,'Alumínio Escovado','#929187',1800.00,410.00,0,'/uploads/fotosProdutos/surdo-aluminio-frente.png, /uploads/fotosProdutos/surdo-aluminio-frente-sem-fundo.png, /uploads/fotosProdutos/surdo-aluminio-verso.png, /uploads/fotosProdutos/surdo-aluminio-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(35,'493107',20,'Preto Fosco','#2b2b2b',1800.00,420.00,0,'/uploads/fotosProdutos/surdo-preto-frente.png, /uploads/fotosProdutos/surdo-preto-frente-sem-fundo.png, /uploads/fotosProdutos/surdo-preto-verso.png, /uploads/fotosProdutos/surdo-preto-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(36,'239701',21,'Metálico','#ecb520',160.00,80.00,0,'/uploads/fotosProdutos/triangulo-metalico-frente.png, /uploads/fotosProdutos/triangulo-metalico-frente-sem-fundo.png, /uploads/fotosProdutos/triangulo-metalico-verso.png, /uploads/fotosProdutos/triangulo-metalico-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(37,'594813',21,'Cromado','#a4a39e',160.00,85.00,0,'/uploads/fotosProdutos/triangulo-cromado-frente.png, /uploads/fotosProdutos/triangulo-cromado-frente-sem-fundo.png, /uploads/fotosProdutos/triangulo-cromado-verso.png, /uploads/fotosProdutos/triangulo-cromado-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(38,'371249',22,'Natural Envernizado','#d9a066',890.00,380.00,0,'/uploads/fotosProdutos/tantan-envernizado-frente.png, /uploads/fotosProdutos/tantan-envernizado-frente-sem-fundo.png, /uploads/fotosProdutos/tantan-envernizado-cima.png, /uploads/fotosProdutos/tantan-envernizado-cima-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(39,'942810',22,'Cerejeira','#8b3a3a',890.00,385.00,0,'/uploads/fotosProdutos/tantan-cerejeira-frente.png, /uploads/fotosProdutos/tantan-cerejeira-frente-sem-fundo.png, /uploads/fotosProdutos/tantan-cerejeira-cima.png, /uploads/fotosProdutos/tantan-cerejeira-cima-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(40,'816432',23,'Natural','#deb887',350.00,110.00,0,'/uploads/fotosProdutos/reco-reco-madeira-frente.png, /uploads/fotosProdutos/reco-reco-madeira-frente-sem-fundo.png, /uploads/fotosProdutos/reco-reco-madeira-cima.png, /uploads/fotosProdutos/reco-reco-madeira-cima-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(41,'504297',23,'Madeira Escura','#4e342e',350.00,120.00,0,'/uploads/fotosProdutos/reco-reco-escuro-cima.png, /uploads/fotosProdutos/reco-reco-escuro-cima-sem-fundo.png, /uploads/fotosProdutos/reco-reco-escuro-frente.png, /uploads/fotosProdutos/reco-reco-escuro-frente-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(44,'975621',25,'Madeira Escura','#a06b34',5800.00,750.00,0,'/uploads/fotosProdutos/marimba-escura-frente.png, /uploads/fotosProdutos/marimba-escura-frente-sem-fundo.png, /uploads/fotosProdutos/marimba-escura-verso.png, /uploads/fotosProdutos/marimba-escura-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(45,'134759',25,'Nogal Premium','#632001',5800.00,780.00,0,'/uploads/fotosProdutos/marimba-nogal-frente.png, /uploads/fotosProdutos/marimba-nogal-frente-sem-fundo.png, /uploads/fotosProdutos/marimba-nogal-verso.png, /uploads/fotosProdutos/marimba-nogal-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(50,'508436',29,'Preto Clássico','#0d0d0d',4200.00,1800.00,0,'/uploads/fotosProdutos/piano-digital-portatil-preto-frente.png, /uploads/fotosProdutos/piano-digital-portatil-preto-frente-sem-fundo.png, /uploads/fotosProdutos/piano-digital-portatil-preto-verso.png, /uploads/fotosProdutos/piano-digital-portatil-preto-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(51,'650921',29,'Branco Neve','#f8f8ff',4200.00,1820.00,0,'/uploads/fotosProdutos/piano-digital-portatil-branco-frente.png, /uploads/fotosProdutos/piano-digital-portatil-branco-frente-sem-fundo.png, /uploads/fotosProdutos/piano-digital-portatil-branco-verso.png, /uploads/fotosProdutos/piano-digital-portatil-branco-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(52,'289374',30,'Nogal Escuro','#3b2e2a',6400.00,1900.00,0,'/uploads/fotosProdutos/piano-digital-movel-nogal-frente.png, /uploads/fotosProdutos/piano-digital-movel-nogal-frente-sem-fundo.png, /uploads/fotosProdutos/piano-digital-movel-nogal-verso.png, /uploads/fotosProdutos/piano-digital-movel-nogal-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(54,'834721',31,'Preto com Display Azul','#101820',7500.00,2000.00,0,'/uploads/fotosProdutos/teclado-arranjador-preto-frente.png, /uploads/fotosProdutos/teclado-arranjador-preto-frente-sem-fundo.png, /uploads/fotosProdutos/teclado-arranjador-preto-verso.png, /uploads/fotosProdutos/teclado-arranjador-preto-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(55,'413580',31,'Cinza Grafite','#545454',7500.00,2050.00,0,'/uploads/fotosProdutos/teclado-arranjador-cinza-frente.png, /uploads/fotosProdutos/teclado-arranjador-cinza-frente-sem-fundo.png, /uploads/fotosProdutos/teclado-arranjador-cinza-verso.png, /uploads/fotosProdutos/teclado-arranjador-cinza-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(56,'247690',32,'Preto Compacto','#181818',980.00,900.00,0,'/uploads/fotosProdutos/teclado-controlador-midi-preto-frente.png, /uploads/fotosProdutos/teclado-controlador-midi-preto-frente-sem-fundo.png, /uploads/fotosProdutos/teclado-controlador-midi-preto-verso.png, /uploads/fotosProdutos/teclado-controlador-midi-preto-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(57,'958301',32,'Branco Studio','#f3f3f3',980.00,920.00,0,'/uploads/fotosProdutos/teclado-controlador-midi-branco-frente.png, /uploads/fotosProdutos/teclado-controlador-midi-branco-frente-sem-fundo.png, /uploads/fotosProdutos/teclado-controlador-midi-branco-verso.png, /uploads/fotosProdutos/teclado-controlador-midi-branco-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(58,'736294',33,'Preto Espacial','#0c0c0c',8900.00,1500.00,0,'/uploads/fotosProdutos/sintetizador-digital-preto-frente.png, /uploads/fotosProdutos/sintetizador-digital-preto-frente-sem-fundo.png, /uploads/fotosProdutos/sintetizador-digital-preto-verso.png, /uploads/fotosProdutos/sintetizador-digital-preto-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(59,'182653',33,'Cinza Metálico','#757575',8900.00,1520.00,0,'/uploads/fotosProdutos/sintetizador-digital-cinza-frente.png, /uploads/fotosProdutos/sintetizador-digital-cinza-frente-sem-fundo.png, /uploads/fotosProdutos/sintetizador-digital-cinza-verso.png, /uploads/fotosProdutos/sintetizador-digital-cinza-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(60,'394820',33,'Vermelho Studio','#a61b1b',8900.00,1550.00,0,'/uploads/fotosProdutos/sintetizador-digital-vermelho-frente.png, /uploads/fotosProdutos/sintetizador-digital-vermelho-frente-sem-fundo.png, /uploads/fotosProdutos/sintetizador-digital-vermelho-verso.png, /uploads/fotosProdutos/sintetizador-digital-vermelho-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(61,'184762',34,'Madeira Clara','#d2b48c',350.00,180.00,0,'/uploads/fotosProdutos/flauta-doce-madeira-frente.png, /uploads/fotosProdutos/flauta-doce-madeira-frente-sem-fundo.png, /uploads/fotosProdutos/flauta-doce-madeira-verso.png, /uploads/fotosProdutos/flauta-doce-madeira-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(62,'509347',34,'Ébano Escuro','#2c2c2c',360.00,200.00,0,'/uploads/fotosProdutos/flauta-doce-ebano-frente.png, /uploads/fotosProdutos/flauta-doce-ebano-frente-sem-fundo.png, /uploads/fotosProdutos/flauta-doce-ebano-verso.png, /uploads/fotosProdutos/flauta-doce-ebano-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(65,'724819',36,'Lacado Dourado','#ffd700',5100.00,1800.00,0,'/uploads/fotosProdutos/saxofone-alto-dourado-frente.png, /uploads/fotosProdutos/saxofone-alto-dourado-frente-sem-fundo.png, /uploads/fotosProdutos/saxofone-alto-dourado-verso.png, /uploads/fotosProdutos/saxofone-alto-dourado-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(66,'512306',36,'Preto Níquel','#2b2b2b',5200.00,1850.00,0,'/uploads/fotosProdutos/saxofone-alto-preto-frente.png, /uploads/fotosProdutos/saxofone-alto-preto-frente-sem-fundo.png, /uploads/fotosProdutos/saxofone-alto-preto-verso.png, /uploads/fotosProdutos/saxofone-alto-preto-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(67,'748125',37,'Lacado Dourado','#daa520',3900.00,1500.00,0,'/uploads/fotosProdutos/trompete-bb-dourado-frente.png, /uploads/fotosProdutos/trompete-bb-dourado-frente-sem-fundo.png, /uploads/fotosProdutos/trompete-bb-dourado-verso.png, /uploads/fotosProdutos/trompete-bb-dourado-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(68,'514903',37,'Prateado','#dcdcdc',3950.00,1520.00,0,'/uploads/fotosProdutos/trompete-bb-prateado-frente.png, /uploads/fotosProdutos/trompete-bb-prateado-frente-sem-fundo.png, /uploads/fotosProdutos/trompete-bb-prateado-verso.png, /uploads/fotosProdutos/trompete-bb-prateado-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(69,'821390',37,'Rose Gold','#b76e79',4100.00,1550.00,0,'/uploads/fotosProdutos/trompete-bb-rose-frente.png, /uploads/fotosProdutos/trompete-bb-rose-frente-sem-fundo.png, /uploads/fotosProdutos/trompete-bb-rose-verso.png, /uploads/fotosProdutos/trompete-bb-rose-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(70,'284510',38,'Madeira Negra','#1b1b1b',2800.00,980.00,0,'/uploads/fotosProdutos/clarinete-bb-madeira-frente.png, /uploads/fotosProdutos/clarinete-bb-madeira-frente-sem-fundo.png, /uploads/fotosProdutos/clarinete-bb-madeira-verso.png, /uploads/fotosProdutos/clarinete-bb-madeira-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(71,'956201',38,'Ébano Fosco','#3a3a3a',2850.00,990.00,0,'/uploads/fotosProdutos/clarinete-bb-ebano-frente.png, /uploads/fotosProdutos/clarinete-bb-ebano-frente-sem-fundo.png, /uploads/fotosProdutos/clarinete-bb-ebano-verso.png, /uploads/fotosProdutos/clarinete-bb-ebano-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(72,'490836',39,'Corpo Metálico Prateado','#b0b0b0',480.00,220.00,0,'/uploads/fotosProdutos/gaita-harmonica-prata-frente.png, /uploads/fotosProdutos/gaita-harmonica-prata-frente-sem-fundo.png, /uploads/fotosProdutos/gaita-harmonica-prata-verso.png, /uploads/fotosProdutos/gaita-harmonica-prata-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(73,'703982',39,'Corpo Preto','#101010',490.00,230.00,0,'/uploads/fotosProdutos/gaita-harmonica-preto-frente.png, /uploads/fotosProdutos/gaita-harmonica-preto-frente-sem-fundo.png, /uploads/fotosProdutos/gaita-harmonica-preto-verso.png, /uploads/fotosProdutos/gaita-harmonica-preto-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(76,'936701',41,'Lacado Dourado','#d4af37',7200.00,1900.00,0,'/uploads/fotosProdutos/trompa-dourado-frente.png, /uploads/fotosProdutos/trompa-dourado-frente-sem-fundo.png, /uploads/fotosProdutos/trompa-dourado-verso.png, /uploads/fotosProdutos/trompa-dourado-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(77,'451029',41,'Rose Gold','#b76e79',7400.00,1950.00,0,'/uploads/fotosProdutos/trompa-rose-frente.png, /uploads/fotosProdutos/trompa-rose-frente-sem-fundo.png, /uploads/fotosProdutos/trompa-rose-verso.png, /uploads/fotosProdutos/trompa-rose-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(78,'864203',42,'Prateada','#c0c0c0',3400.00,1300.00,0,'/uploads/fotosProdutos/corneta-prata-frente.png, /uploads/fotosProdutos/corneta-prata-frente-sem-fundo.png, /uploads/fotosProdutos/corneta-prata-verso.png, /uploads/fotosProdutos/corneta-prata-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(79,'527640',42,'Dourada Tradicional','#daa520',3500.00,1320.00,0,'/uploads/fotosProdutos/corneta-dourada-frente.png, /uploads/fotosProdutos/corneta-dourada-frente-sem-fundo.png, /uploads/fotosProdutos/corneta-dourada-verso.png, /uploads/fotosProdutos/corneta-dourada-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(80,'328571',43,'Preto Clássico','#0a0a0a',9600.00,3100.00,0,'/uploads/fotosProdutos/acordeon-preto-frente.png, /uploads/fotosProdutos/acordeon-preto-frente-sem-fundo.png, /uploads/fotosProdutos/acordeon-preto-verso.png, /uploads/fotosProdutos/acordeon-preto-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(81,'459732',43,'Vermelho Rubi','#9b111e',9800.00,3200.00,0,'/uploads/fotosProdutos/acordeon-vermelho-frente.png, /uploads/fotosProdutos/acordeon-vermelho-frente-sem-fundo.png, /uploads/fotosProdutos/acordeon-vermelho-verso.png, /uploads/fotosProdutos/acordeon-vermelho-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(82,'847921',43,'Branco Pérola','#f8f6f0',9900.00,3250.00,0,'/uploads/fotosProdutos/acordeon-branco-frente.png, /uploads/fotosProdutos/acordeon-branco-frente-sem-fundo.png, /uploads/fotosProdutos/acordeon-branco-verso.png, /uploads/fotosProdutos/acordeon-branco-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(83,'176304',44,'Madeira Clara','#deb887',2400.00,850.00,0,'/uploads/fotosProdutos/harmonium-madeira-frente.png, /uploads/fotosProdutos/harmonium-madeira-frente-sem-fundo.png, /uploads/fotosProdutos/harmonium-madeira-verso.png, /uploads/fotosProdutos/harmonium-madeira-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(84,'592817',44,'Nogal Escuro','#4e342e',2600.00,880.00,0,'/uploads/fotosProdutos/harmonium-nogal-frente.png, /uploads/fotosProdutos/harmonium-nogal-frente-sem-fundo.png, /uploads/fotosProdutos/harmonium-nogal-verso.png, /uploads/fotosProdutos/harmonium-nogal-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(85,'701294',45,'Preto Tradicional','#0f0f0f',5600.00,1450.00,0,'/uploads/fotosProdutos/bandoneon-preto-frente.png, /uploads/fotosProdutos/bandoneon-preto-frente-sem-fundo.png, /uploads/fotosProdutos/bandoneon-preto-verso.png, /uploads/fotosProdutos/bandoneon-preto-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(86,'835620',45,'Madeira Envernizada','#5a3a1a',5800.00,1500.00,0,'/uploads/fotosProdutos/bandoneon-madeira-frente.png, /uploads/fotosProdutos/bandoneon-madeira-frente-sem-fundo.png, /uploads/fotosProdutos/bandoneon-madeira-verso.png, /uploads/fotosProdutos/bandoneon-madeira-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(87,'591732',46,'Preto Clássico','#0f0f0f',3100.00,1200.00,0,'/uploads/fotosProdutos/amplificador-de-guitarra-preto-frente.png, /uploads/fotosProdutos/amplificador-de-guitarra-preto-frente-sem-fundo.png, /uploads/fotosProdutos/amplificador-de-guitarra-preto-verso.png, /uploads/fotosProdutos/amplificador-de-guitarra-preto-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(88,'804529',46,'Creme Vintage','#f3e5ab',3200.00,1250.00,0,'/uploads/fotosProdutos/amplificador-de-guitarra-branco-frente.png, /uploads/fotosProdutos/amplificador-de-guitarra-branco-frente-sem-fundo.png, /uploads/fotosProdutos/amplificador-de-guitarra-branco-verso.png, /uploads/fotosProdutos/amplificador-de-guitarra-branco-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(89,'439678',47,'Preto Metálico','#1c1c1c',3400.00,1350.00,0,'/uploads/fotosProdutos/cabecote-amplificador-guitarra-preto-frente.png, /uploads/fotosProdutos/cabecote-amplificador-guitarra-preto-frente-sem-fundo.png, /uploads/fotosProdutos/cabecote-amplificador-guitarra-preto-verso.png, /uploads/fotosProdutos/cabecote-amplificador-guitarra-preto-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(90,'273816',47,'Cromado','#b5b5b5',3500.00,1400.00,0,'/uploads/fotosProdutos/cabecote-amplificador-guitarra-cromado-frente.png, /uploads/fotosProdutos/cabecote-amplificador-guitarra-cromado-frente-sem-fundo.png, /uploads/fotosProdutos/cabecote-amplificador-guitarra-cromado-verso.png, /uploads/fotosProdutos/cabecote-amplificador-guitarra-cromado-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(91,'957230',48,'Preto','#101010',2800.00,1100.00,0,'/uploads/fotosProdutos/amplificador-de-baixo-preto-frente.png, /uploads/fotosProdutos/amplificador-de-baixo-preto-frente-sem-fundo.png, /uploads/fotosProdutos/amplificador-de-baixo-preto-verso.png, /uploads/fotosProdutos/amplificador-de-baixo-preto-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(92,'368524',48,'Cinza Grafite','#484848',2900.00,1150.00,0,'/uploads/fotosProdutos/amplificador-de-baixo-cinza-frente.png, /uploads/fotosProdutos/amplificador-de-baixo-cinza-frente-sem-fundo.png, /uploads/fotosProdutos/amplificador-de-baixo-cinza-verso.png, /uploads/fotosProdutos/amplificador-de-baixo-cinza-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(93,'712486',49,'Madeira Clara','#c19a6b',2200.00,950.00,0,'/uploads/fotosProdutos/amplificador-de-violao-madeira-frente.png, /uploads/fotosProdutos/amplificador-de-violao-madeira-frente-sem-fundo.png, /uploads/fotosProdutos/amplificador-de-violao-madeira-verso.png, /uploads/fotosProdutos/amplificador-de-violao-madeira-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(94,'143905',49,'Mogno Escuro','#4a2c1d',2300.00,980.00,0,'/uploads/fotosProdutos/amplificador-de-violao-mogno-frente.png, /uploads/fotosProdutos/amplificador-de-violao-mogno-frente-sem-fundo.png, /uploads/fotosProdutos/amplificador-de-violao-mogno-verso.png, /uploads/fotosProdutos/amplificador-de-violao-mogno-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(95,'625478',50,'Preta Tradicional','#1a1a1a',1800.00,1050.00,0,'/uploads/fotosProdutos/caixa-acustica-passiva-preto-frente.png, /uploads/fotosProdutos/caixa-acustica-passiva-preto-frente-sem-fundo.png, /uploads/fotosProdutos/caixa-acustica-passiva-preto-verso.png, /uploads/fotosProdutos/caixa-acustica-passiva-preto-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(96,'492631',51,'Preto Futurista','#121212',8900.00,2800.00,0,'/uploads/fotosProdutos/mesa-de-som-digital-preto-frente.png, /uploads/fotosProdutos/mesa-de-som-digital-preto-frente-sem-fundo.png, /uploads/fotosProdutos/mesa-de-som-digital-preto-verso.png, /uploads/fotosProdutos/mesa-de-som-digital-preto-verso-sem-fundo.png','Ativo','2025-12-05 12:36:25'),(97,'450493',83,'teste','#a90166',250.00,25.00,0,'\\uploads\\fotosProdutos\\1765047090699-Captura de tela 2025-04-29 132246.png,\\uploads\\fotosProdutos\\1765047090701-Captura de tela 2025-04-29 133356.png,\\uploads\\fotosProdutos\\1765047090704-Captura de tela 2025-04-29 133703.png,\\uploads\\fotosProdutos\\1765047090706-Captura de tela 2025-05-01 145803.png','Ativo','2025-12-06 17:38:35');
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` VALUES (1,2,28,1,5600.00,NULL,NULL,0.00,1,'Paga','2025-12-05 16:51:52'),(2,2,28,1,7000.00,NULL,700.00,0.00,1,'Paga','2025-12-05 16:54:44'),(3,2,28,2,5600.00,NULL,-560.00,0.00,3,'Paga','2025-12-07 17:41:12'),(4,2,28,2,6800.00,NULL,2720.00,0.00,1,'Paga','2025-12-07 17:41:44'),(5,2,28,2,5600.00,NULL,2240.00,0.00,1,'Paga','2025-12-07 17:44:52'),(6,2,28,2,4200.00,NULL,1680.00,0.00,1,'Paga','2025-12-07 17:46:52'),(7,2,28,2,3570.00,'4x de R$ 892,00',997.50,630.00,2,'Paga','2025-12-07 17:51:34'),(8,2,28,2,3570.00,'4x de R$ 892,00',NULL,630.00,2,'Paga','2025-12-07 18:07:51'),(9,2,28,2,3570.00,'4x de R$ 892,00',997.50,630.00,2,'Paga','2025-12-07 18:09:20'),(10,2,28,3,3950.00,NULL,2430.00,0.00,1,'Paga','2025-12-07 18:57:15'),(11,2,28,4,3570.00,NULL,1050.00,630.00,1,'Paga','2025-12-08 02:38:14'),(12,2,28,4,4350.00,NULL,1740.00,0.00,1,'Paga','2025-12-08 02:41:56'),(13,2,28,5,4440.00,NULL,1776.00,0.00,3,'Paga','2025-12-08 03:31:37'),(14,2,28,5,33600.00,NULL,29700.00,0.00,3,'Paga','2025-12-08 04:04:33');
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

-- Dump completed on 2025-12-08  1:43:43
