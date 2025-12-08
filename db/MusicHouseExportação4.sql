-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: musichouse
-- ------------------------------------------------------
-- Server version	8.0.44

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
  `id_sessao_caixa` int NOT NULL AUTO_INCREMENT,
  `id_franquia` int NOT NULL,
  `id_funcionario` int NOT NULL,
  `status` enum('aberto','fechado') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'aberto',
  `data_abertura` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_fechamento` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_sessao_caixa`),
  KEY `fk_caixa_franquia` (`id_franquia`),
  KEY `fk_caixa_func` (`id_funcionario`),
  CONSTRAINT `fk_caixa_franquia` FOREIGN KEY (`id_franquia`) REFERENCES `franquias` (`id_franquia`),
  CONSTRAINT `fk_caixa_func` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_registro`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caixas`
--

LOCK TABLES `caixas` WRITE;
/*!40000 ALTER TABLE `caixas` DISABLE KEYS */;
INSERT INTO `caixas` VALUES (1,2,23,'fechado','2025-12-01 13:05:20','2025-12-02 03:24:09'),(2,2,26,'fechado','2025-12-01 13:08:58','2025-12-01 13:10:20'),(3,2,26,'fechado','2025-12-02 01:18:20','2025-12-02 02:01:37'),(4,2,26,'fechado','2025-12-02 02:03:50','2025-12-02 02:34:12'),(5,2,26,'fechado','2025-12-02 02:34:18','2025-12-02 02:34:26'),(6,2,26,'fechado','2025-12-02 03:15:46','2025-12-02 03:24:09'),(7,2,26,'fechado','2025-12-03 13:56:10','2025-12-03 19:00:02'),(8,2,26,'fechado','2025-12-03 19:00:02','2025-12-03 19:03:46'),(9,2,26,'fechado','2025-12-04 02:57:58','2025-12-04 02:58:15'),(10,2,26,'fechado','2025-12-04 16:09:04','2025-12-04 16:09:09'),(11,2,26,'aberto','2025-12-04 16:09:08',NULL);
/*!40000 ALTER TABLE `caixas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `descricao` varchar(300) COLLATE utf8mb4_general_ci NOT NULL,
  `icone` text COLLATE utf8mb4_general_ci NOT NULL,
  `iconeSite` text COLLATE utf8mb4_general_ci NOT NULL,
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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nome_completo` varchar(300) COLLATE utf8mb4_general_ci NOT NULL,
  `cpf` char(11) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(120) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `status` enum('Ativo','Inativo') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Ativo',
  `data_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `id_credenciais` int NOT NULL AUTO_INCREMENT,
  `cargo` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `descricao` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
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
  `id_cupom` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `tipo` enum('percentual','valor_fixo') COLLATE utf8mb4_general_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `minimo_compra` decimal(10,2) DEFAULT '0.00',
  `validade` date DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `id_despesa` int NOT NULL AUTO_INCREMENT,
  `id_franquia` int NOT NULL,
  `categoria` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `descricao` text COLLATE utf8mb4_general_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `data_criacao` date NOT NULL,
  `data_pagamento` date NOT NULL,
  `status` enum('Paga','Pendente','Atrasada') COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_despesa`),
  KEY `id_franquia` (`id_franquia`),
  CONSTRAINT `despesas_ibfk_1` FOREIGN KEY (`id_franquia`) REFERENCES `franquias` (`id_franquia`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `despesas`
--

LOCK TABLES `despesas` WRITE;
/*!40000 ALTER TABLE `despesas` DISABLE KEYS */;
INSERT INTO `despesas` VALUES (9,2,'Luz','Conta de energia aaaaaaaaaaaaaaaa',5463.00,'2025-01-03','2025-01-03','Paga'),(10,2,'Internet','Plano empresarial de internet fibra',199.90,'2025-01-01','0000-00-00','Pendente'),(11,2,'Limpeza','Serviços terceirizados de limpeza semanal',350.00,'2025-01-04','0000-00-00','Pendente'),(12,2,'Materiais de Escritório','Compra de folhas, canetas e organizadores',89.90,'2025-01-02','2025-01-02','Paga'),(13,2,'Marketing','Impulsionamento de posts nas redes sociais',300.00,'2025-01-05','0000-00-00','Pendente'),(14,2,'Manutenção','Reparo no ar condicionado da loja',650.00,'2025-01-02','0000-00-00','Pendente'),(15,2,'Segurança','Serviço de monitoramento e alarme',180.00,'2025-01-06','0000-00-00','Pendente'),(16,2,'Transporte','Frete de instrumentos musicais para a filial',240.00,'2025-01-03','2025-01-03','Paga'),(17,2,'Telefone','Linha telefônica empresarial',79.90,'2025-01-01','0000-00-00','Pendente'),(19,2,'Equipamentos','Compra de suportes de guitarra',320.00,'2025-01-05','2025-01-05','Paga'),(20,2,'TI','Suporte técnico e manutenção de sistemas',420.00,'2025-01-08','0000-00-00','Pendente'),(21,2,'Seguro','Seguro mensal da loja',210.75,'2025-01-09','0000-00-00','Pendente'),(22,2,'Viagem','Deslocamento para reunião da franquia',380.00,'2025-01-04','0000-00-00','Pendente'),(23,2,'Produtos de Limpeza','Reposição de detergentes e materiais',65.40,'2025-01-02','2025-01-02','Paga'),(24,2,'Eventos','Custo para participação em feira de música',1500.00,'2025-01-10','0000-00-00','Pendente'),(25,2,'Treinamentos','Capacitação de vendedores',275.00,'2025-01-06','0000-00-00','Pendente'),(26,2,'Uniformes','Compra de novos uniformes para a equipe',430.00,'2025-01-09','2025-01-10','Paga'),(27,2,'Serviços Gerais','Pequenos reparos e ajustes na loja',115.00,'2025-01-03','0000-00-00','Pendente'),(28,2,'limpeza','qweqeqweq',20000.00,'2025-12-01','2025-11-30','Paga'),(30,2,'luz','ddd',555.00,'2025-12-02','2025-12-27','Pendente'),(31,2,'luz','uuu',88.00,'2025-12-02','0000-00-00','Pendente'),(32,2,'internet','aaaa',888.00,'2025-12-02','0000-00-00','Pendente'),(33,2,'internet','aaaa',888.00,'2025-12-02','0000-00-00','Pendente'),(34,2,'internet','aaaa',888.00,'2025-12-02','0000-00-00','Pendente'),(35,2,'Luz','bb',9.00,'2025-12-02','0000-00-00','Pendente'),(36,2,'Água','hhhhh',2000.00,'2025-12-02','2020-01-20','Pendente');
/*!40000 ALTER TABLE `despesas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enderecos_cliente`
--

DROP TABLE IF EXISTS `enderecos_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enderecos_cliente` (
  `id_endereco` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `apelido` varchar(60) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `logradouro` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `numero` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `complemento` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bairro` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cidade` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `estado` char(2) COLLATE utf8mb4_general_ci NOT NULL,
  `cep` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `principal` tinyint(1) NOT NULL DEFAULT '0',
  `criada_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `id_estoque` int NOT NULL AUTO_INCREMENT,
  `id_franquia` int NOT NULL,
  `sku` varchar(6) COLLATE utf8mb4_general_ci NOT NULL,
  `quantidade` int NOT NULL DEFAULT '0',
  `aviso` int NOT NULL DEFAULT '10',
  PRIMARY KEY (`id_estoque`),
  KEY `fk_est_franquia` (`id_franquia`),
  CONSTRAINT `fk_est_franquia` FOREIGN KEY (`id_franquia`) REFERENCES `franquias` (`id_franquia`)
) ENGINE=InnoDB AUTO_INCREMENT=1154 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (297,2,'134682',130,10),(298,2,'142693',100,10),(299,2,'149872',100,10),(300,2,'152937',100,10),(301,2,'159804',100,10),(302,2,'179632',100,10),(303,2,'184523',100,10),(304,2,'187642',100,10),(305,2,'204718',100,10),(306,2,'231640',100,10),(307,2,'231867',100,10),(308,2,'235781',100,10),(309,2,'245786',100,10),(310,2,'260498',100,10),(311,2,'270319',100,10),(312,2,'278965',100,10),(313,2,'298504',100,10),(314,2,'304987',100,10),(315,2,'305478',100,10),(316,2,'312654',100,10),(317,2,'345971',100,10),(318,2,'362094',100,10),(319,2,'378902',100,10),(320,2,'379826',100,10),(321,2,'405768',100,10),(322,2,'435219',100,10),(323,2,'438915',100,10),(324,2,'481279',100,10),(325,2,'489072',100,10),(326,2,'490175',100,10),(327,2,'493725',100,10),(328,2,'498320',100,10),(329,2,'498731',100,10),(330,2,'512479',100,10),(331,2,'519843',100,10),(332,2,'521394',96,10),(333,2,'528903',100,10),(334,2,'537916',100,10),(335,2,'540128',100,10),(336,2,'562893',100,10),(337,2,'582971',100,10),(338,2,'587420',100,10),(339,2,'604823',100,10),(340,2,'612489',100,10),(341,2,'619845',100,10),(342,2,'619874',100,10),(343,2,'624981',100,10),(344,2,'628354',100,10),(345,2,'658304',100,10),(346,2,'658319',100,10),(347,2,'679124',100,10),(348,2,'689431',100,10),(349,2,'713625',100,10),(350,2,'720158',100,10),(351,2,'739160',100,10),(352,2,'761084',100,10),(353,2,'763201',100,10),(354,2,'763910',100,10),(355,2,'784632',100,10),(356,2,'790246',100,10),(357,2,'820491',100,10),(358,2,'826493',100,10),(359,2,'831276',100,10),(360,2,'835207',100,10),(361,2,'837295',100,10),(362,2,'843965',100,10),(363,2,'854763',100,10),(364,2,'874590',100,10),(365,2,'897324',100,10),(366,2,'904315',100,10),(367,2,'912570',100,10),(368,2,'920516',100,10),(369,2,'921543',100,10),(370,2,'924518',100,10),(371,2,'967540',100,10),(372,2,'972184',100,10),(373,2,'981430',100,10),(374,2,'982310',100,10),(375,2,'982410',100,10),(376,2,'982431',100,10),(377,2,'987130',100,10),(378,2,'105372',100,10),(380,2,'133921',100,10),(381,2,'134759',100,10),(383,2,'143905',100,10),(384,2,'148625',100,10),(385,2,'176304',100,10),(386,2,'182653',100,10),(387,2,'184762',100,10),(389,2,'216903',100,10),(390,2,'235891',100,10),(392,2,'239701',100,10),(393,2,'247690',100,10),(394,2,'271339',100,10),(395,2,'273816',100,10),(397,2,'283619',100,10),(398,2,'283915',100,10),(399,2,'284510',100,10),(400,2,'289374',100,10),(402,2,'295239',100,10),(403,2,'312587',100,10),(404,2,'312759',100,10),(405,2,'328571',100,10),(406,2,'341681',100,10),(408,2,'358901',100,10),(409,2,'368524',100,10),(410,2,'371249',100,10),(411,2,'379524',100,10),(413,2,'384201',96,10),(414,2,'390862',100,10),(415,2,'394820',100,10),(416,2,'413580',100,10),(417,2,'439678',100,10),(418,2,'451029',100,10),(419,2,'459732',100,10),(420,2,'470128',100,10),(423,2,'473193',100,10),(424,2,'490836',100,10),(426,2,'492631',100,10),(427,2,'493107',100,10),(428,2,'496307',100,10),(430,2,'504297',100,10),(431,2,'504856',100,10),(432,2,'508436',100,10),(433,2,'509347',100,10),(434,2,'509387',100,10),(435,2,'512046',100,10),(436,2,'512306',100,10),(438,2,'513958',100,10),(440,2,'514903',100,10),(441,2,'527640',100,10),(443,2,'572931',100,10),(444,2,'591732',100,10),(445,2,'592817',100,10),(446,2,'594813',100,10),(450,2,'625478',100,10),(452,2,'627839',100,10),(453,2,'628430',100,10),(454,2,'639218',100,10),(455,2,'639442',100,10),(456,2,'650921',100,10),(458,2,'701294',100,10),(459,2,'703982',100,10),(460,2,'712486',100,10),(461,2,'722326',100,10),(462,2,'724819',100,10),(463,2,'736294',100,10),(464,2,'748125',100,10),(465,2,'749320',100,10),(466,2,'765584',100,10),(468,2,'783024',100,10),(469,2,'801357',100,10),(470,2,'801624',100,10),(471,2,'804529',100,10),(474,2,'811223',100,10),(475,2,'816432',100,10),(476,2,'821390',100,10),(478,2,'821475',100,10),(479,2,'834721',100,10),(480,2,'835620',100,10),(482,2,'847921',100,10),(483,2,'849632',100,10),(484,2,'864203',100,10),(485,2,'875624',100,10),(488,2,'928473',92,10),(489,2,'936124',100,10),(490,2,'936701',100,10),(491,2,'942615',100,10),(492,2,'942810',100,10),(494,2,'953710',100,10),(495,2,'956201',100,10),(496,2,'957230',100,10),(497,2,'958301',100,10),(498,2,'964802',100,10),(500,2,'975621',100,10),(501,2,'982603',100,10),(502,2,'986435',100,10),(533,1,'610822',10,10),(534,2,'610822',0,10),(535,3,'610822',0,10),(536,4,'610822',0,10),(537,5,'610822',0,10),(538,6,'610822',0,10),(539,7,'610822',0,10),(540,8,'610822',0,10),(541,9,'610822',0,10),(542,10,'610822',0,10),(573,1,'424468',10,10),(574,2,'424468',100,10),(575,3,'424468',1000,10),(576,4,'424468',0,10),(577,5,'424468',0,10),(578,6,'424468',0,10),(579,7,'424468',0,10),(580,8,'424468',0,10),(581,9,'424468',0,10),(582,10,'424468',0,10),(753,1,'729306',10,10),(754,2,'729306',0,10),(755,3,'729306',0,10),(756,4,'729306',0,10),(757,5,'729306',0,10),(758,6,'729306',0,10),(759,7,'729306',0,10),(760,8,'729306',0,10),(761,9,'729306',0,10),(762,10,'729306',0,10),(813,1,'830985',10,10),(814,2,'830985',0,10),(815,3,'830985',0,10),(816,4,'830985',0,10),(817,5,'830985',0,10),(818,6,'830985',0,10),(819,7,'830985',0,10),(820,8,'830985',0,10),(821,9,'830985',0,10),(822,10,'830985',0,10),(823,1,'540037',10,10),(824,2,'540037',0,10),(825,3,'540037',0,10),(826,4,'540037',0,10),(827,5,'540037',0,10),(828,6,'540037',0,10),(829,7,'540037',0,10),(830,8,'540037',0,10),(831,9,'540037',0,10),(832,10,'540037',0,10),(833,1,'287260',10,10),(834,2,'287260',111,10),(835,3,'287260',1111,10),(836,4,'287260',111,10),(837,5,'287260',0,10),(838,6,'287260',0,10),(839,7,'287260',0,10),(840,8,'287260',0,10),(841,9,'287260',0,10),(842,10,'287260',0,10),(843,1,'802827',10,10),(844,2,'802827',0,10),(845,3,'802827',0,10),(846,4,'802827',0,10),(847,5,'802827',0,10),(848,6,'802827',0,10),(849,7,'802827',0,10),(850,8,'802827',0,10),(851,9,'802827',0,10),(852,10,'802827',0,10),(853,1,'066581',10,10),(854,2,'066581',0,10),(855,3,'066581',0,10),(856,4,'066581',0,10),(857,5,'066581',0,10),(858,6,'066581',0,10),(859,7,'066581',0,10),(860,8,'066581',0,10),(861,9,'066581',0,10),(862,10,'066581',0,10),(863,1,'208882',10,10),(864,2,'208882',10,10),(865,3,'208882',0,10),(866,4,'208882',0,10),(867,5,'208882',0,10),(868,6,'208882',0,10),(869,7,'208882',0,10),(870,8,'208882',0,10),(871,9,'208882',0,10),(872,10,'208882',0,10),(873,19,'134682',0,10),(874,19,'142693',0,10),(875,19,'149872',0,10),(876,19,'152937',0,10),(877,19,'159804',0,10),(878,19,'179632',0,10),(879,19,'184523',0,10),(880,19,'187642',0,10),(881,19,'204718',0,10),(882,19,'208882',0,10),(883,19,'231640',0,10),(884,19,'231867',0,10),(885,19,'235781',0,10),(886,19,'245786',0,10),(887,19,'260498',0,10),(888,19,'270319',0,10),(889,19,'278965',0,10),(890,19,'298504',0,10),(891,19,'304987',0,10),(892,19,'305478',0,10),(893,19,'312654',0,10),(894,19,'345971',0,10),(895,19,'362094',0,10),(896,19,'378902',0,10),(897,19,'379826',0,10),(898,19,'405768',0,10),(899,19,'435219',0,10),(900,19,'438915',0,10),(901,19,'481279',0,10),(902,19,'489072',0,10),(903,19,'490175',0,10),(904,19,'493725',0,10),(905,19,'498320',0,10),(906,19,'498731',0,10),(907,19,'512479',0,10),(908,19,'519843',0,10),(909,19,'521394',0,10),(910,19,'528903',0,10),(911,19,'537916',0,10),(912,19,'540037',0,10),(913,19,'540128',0,10),(914,19,'562893',0,10),(915,19,'582971',0,10),(916,19,'587420',0,10),(917,19,'604823',0,10),(918,19,'612489',0,10),(919,19,'619845',0,10),(920,19,'619874',0,10),(921,19,'624981',0,10),(922,19,'628354',0,10),(923,19,'658304',0,10),(924,19,'658319',0,10),(925,19,'679124',0,10),(926,19,'689431',0,10),(927,19,'713625',0,10),(928,19,'720158',0,10),(929,19,'729306',0,10),(930,19,'739160',0,10),(931,19,'761084',0,10),(932,19,'763201',0,10),(933,19,'763910',0,10),(934,19,'784632',0,10),(935,19,'790246',0,10),(936,19,'802827',0,10),(937,19,'820491',0,10),(938,19,'826493',0,10),(939,19,'830985',0,10),(940,19,'831276',0,10),(941,19,'835207',0,10),(942,19,'837295',0,10),(943,19,'843965',0,10),(944,19,'854763',0,10),(945,19,'874590',0,10),(946,19,'897324',0,10),(947,19,'904315',0,10),(948,19,'912570',0,10),(949,19,'920516',0,10),(950,19,'921543',0,10),(951,19,'924518',0,10),(952,19,'967540',0,10),(953,19,'972184',0,10),(954,19,'981430',0,10),(955,19,'982310',0,10),(956,19,'982410',0,10),(957,19,'982431',0,10),(958,19,'987130',0,10),(959,19,'066581',0,10),(960,19,'105372',0,10),(961,19,'133921',0,10),(962,19,'134759',0,10),(963,19,'143905',0,10),(964,19,'148625',0,10),(965,19,'176304',0,10),(966,19,'182653',0,10),(967,19,'184762',0,10),(968,19,'216903',0,10),(969,19,'235891',0,10),(970,19,'239701',0,10),(971,19,'247690',0,10),(972,19,'271339',0,10),(973,19,'273816',0,10),(974,19,'283619',0,10),(975,19,'283915',0,10),(976,19,'284510',0,10),(977,19,'287260',0,10),(978,19,'289374',0,10),(979,19,'295239',0,10),(980,19,'312587',0,10),(981,19,'312759',0,10),(982,19,'328571',0,10),(983,19,'341681',0,10),(984,19,'358901',0,10),(985,19,'368524',0,10),(986,19,'371249',0,10),(987,19,'379524',0,10),(988,19,'384201',0,10),(989,19,'390862',0,10),(990,19,'394820',0,10),(991,19,'413580',0,10),(992,19,'424468',0,10),(993,19,'439678',0,10),(994,19,'451029',0,10),(995,19,'459732',0,10),(996,19,'470128',0,10),(997,19,'473193',0,10),(998,19,'490836',0,10),(999,19,'492631',0,10),(1000,19,'493107',0,10),(1001,19,'496307',0,10),(1002,19,'504297',0,10),(1003,19,'504856',0,10),(1004,19,'508436',0,10),(1005,19,'509347',0,10),(1006,19,'509387',0,10),(1007,19,'512046',0,10),(1008,19,'512306',0,10),(1009,19,'513958',0,10),(1010,19,'514903',0,10),(1011,19,'527640',0,10),(1012,19,'572931',0,10),(1013,19,'591732',0,10),(1014,19,'592817',0,10),(1015,19,'594813',0,10),(1016,19,'610822',0,10),(1017,19,'625478',0,10),(1018,19,'627839',0,10),(1019,19,'628430',0,10),(1020,19,'639218',0,10),(1021,19,'639442',0,10),(1022,19,'650921',0,10),(1023,19,'701294',0,10),(1024,19,'703982',0,10),(1025,19,'712486',0,10),(1026,19,'722326',0,10),(1027,19,'724819',0,10),(1028,19,'736294',0,10),(1029,19,'748125',0,10),(1030,19,'749320',0,10),(1031,19,'765584',0,10),(1032,19,'783024',0,10),(1033,19,'801357',0,10),(1034,19,'801624',0,10),(1035,19,'804529',0,10),(1036,19,'811223',0,10),(1037,19,'816432',0,10),(1038,19,'821390',0,10),(1039,19,'821475',0,10),(1040,19,'834721',0,10),(1041,19,'835620',0,10),(1042,19,'847921',0,10),(1043,19,'849632',0,10),(1044,19,'864203',0,10),(1045,19,'875624',0,10),(1046,19,'928473',0,10),(1047,19,'936124',0,10),(1048,19,'936701',0,10),(1049,19,'942615',0,10),(1050,19,'942810',0,10),(1051,19,'953710',0,10),(1052,19,'956201',0,10),(1053,19,'957230',0,10),(1054,19,'958301',0,10),(1055,19,'964802',0,10),(1056,19,'975621',0,10),(1057,19,'982603',0,10),(1058,19,'986435',0,10),(1059,1,'312231',10,10),(1060,2,'312231',0,10),(1061,3,'312231',0,10),(1062,4,'312231',0,10),(1063,5,'312231',0,10),(1064,6,'312231',0,10),(1065,7,'312231',0,10),(1066,8,'312231',0,10),(1067,9,'312231',0,10),(1068,10,'312231',0,10),(1069,11,'312231',0,10),(1070,12,'312231',0,10),(1071,13,'312231',0,10),(1072,14,'312231',0,10),(1073,15,'312231',0,10),(1074,16,'312231',0,10),(1075,17,'312231',0,10),(1076,18,'312231',0,10),(1077,19,'312231',0,10),(1078,1,'959839',10,10),(1079,2,'959839',0,10),(1080,3,'959839',0,10),(1081,4,'959839',0,10),(1082,5,'959839',0,10),(1083,6,'959839',0,10),(1084,7,'959839',0,10),(1085,8,'959839',0,10),(1086,9,'959839',0,10),(1087,10,'959839',0,10),(1088,11,'959839',0,10),(1089,12,'959839',0,10),(1090,13,'959839',0,10),(1091,14,'959839',0,10),(1092,15,'959839',0,10),(1093,16,'959839',0,10),(1094,17,'959839',0,10),(1095,18,'959839',0,10),(1096,19,'959839',0,10),(1097,1,'991282',10,10),(1098,2,'991282',0,10),(1099,3,'991282',0,10),(1100,4,'991282',0,10),(1101,5,'991282',0,10),(1102,6,'991282',0,10),(1103,7,'991282',0,10),(1104,8,'991282',0,10),(1105,9,'991282',0,10),(1106,10,'991282',0,10),(1107,11,'991282',0,10),(1108,12,'991282',0,10),(1109,13,'991282',0,10),(1110,14,'991282',0,10),(1111,15,'991282',0,10),(1112,16,'991282',0,10),(1113,17,'991282',0,10),(1114,18,'991282',0,10),(1115,19,'991282',0,10),(1116,1,'021539',10,10),(1117,2,'021539',0,10),(1118,3,'021539',0,10),(1119,4,'021539',0,10),(1120,5,'021539',0,10),(1121,6,'021539',0,10),(1122,7,'021539',0,10),(1123,8,'021539',0,10),(1124,9,'021539',0,10),(1125,10,'021539',0,10),(1126,11,'021539',0,10),(1127,12,'021539',0,10),(1128,13,'021539',0,10),(1129,14,'021539',0,10),(1130,15,'021539',0,10),(1131,16,'021539',0,10),(1132,17,'021539',0,10),(1133,18,'021539',0,10),(1134,19,'021539',0,10),(1135,1,'644290',10,10),(1136,2,'644290',0,10),(1137,3,'644290',0,10),(1138,4,'644290',0,10),(1139,5,'644290',0,10),(1140,6,'644290',0,10),(1141,7,'644290',0,10),(1142,8,'644290',0,10),(1143,9,'644290',0,10),(1144,10,'644290',0,10),(1145,11,'644290',0,10),(1146,12,'644290',0,10),(1147,13,'644290',0,10),(1148,14,'644290',0,10),(1149,15,'644290',0,10),(1150,16,'644290',0,10),(1151,17,'644290',0,10),(1152,18,'644290',0,10),(1153,19,'644290',0,10);
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formaspagamentos`
--

DROP TABLE IF EXISTS `formaspagamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formaspagamentos` (
  `id_pagamento` int NOT NULL AUTO_INCREMENT,
  `tipo` enum('pix','debito','credito') COLLATE utf8mb4_general_ci NOT NULL,
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
  `id_fornecedor` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `cnpj` varchar(30) NOT NULL,
  `objeto_fornecido` text NOT NULL,
  `custo` decimal(10,2) NOT NULL,
  `email` varchar(100) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `data_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_fornecedor`),
  UNIQUE KEY `cnpj` (`cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedores`
--

LOCK TABLES `fornecedores` WRITE;
/*!40000 ALTER TABLE `fornecedores` DISABLE KEYS */;
INSERT INTO `fornecedores` VALUES (1,'Madeiras Nobres Brasil','12.345.678/0001-90','Madeira de mogno',8500.00,'contato@madeirasnobres.com','Rua das Árvores 120, Manaus - AM','2025-12-04 21:13:07'),(2,'Metalúrgica SomForte','98.765.432/0001-55','Ligas de latão',4200.50,'vendas@somforte.com','Av. Industrial 455, São Bernardo do Campo - SP','2025-12-04 21:13:07'),(3,'Eletrônicos AudioChip','54.321.987/0001-12','Circuitos integrados',6700.90,'suporte@audiochip.com','Rua Tecnologia 77, Campinas - SP','2025-12-04 21:13:07'),(4,'Cordas Harmonia Ltda','23.456.789/0001-21','Cordas de aço e nylon',1900.00,'contato@harmonia.com','Av. das Artes 310, Curitiba - PR','2025-12-04 21:13:07'),(5,'Acabamentos LuthierCoat','45.678.912/0001-43','Vernizes, seladoras e tintas',2500.75,'vendas@luthiercoat.com','Rua Pintores 500, Joinville - SC','2025-12-04 21:13:07'),(6,'Estojos ProCase','67.891.234/0001-65','Estojos rígidos e bags acolchoados',3100.30,'comercial@procase.com','Av. Central 980, Belo Horizonte - MG','2025-12-04 21:13:07'),(7,'Parafusos & Ferragens São Luís','11.222.333/0001-44','Parafusos',1350.00,'contato@ferragenssl.com','Rua do Metal 201, São Luís - MA','2025-12-04 21:13:07'),(8,'Plásticos e Compostos Melodia','77.888.999/0001-10','Plásticos moldáveis',1600.40,'suporte@melodiaplast.com','Av. das Indústrias 1450, Sorocaba - SP','2025-12-04 21:13:07'),(9,'Espumas Acústicas AcustiFlex','32.165.498/0001-77','Espumas e materiais internos',980.00,'vendas@acustiflex.com','Rua Acústica 222, Porto Alegre - RS','2025-12-04 21:13:07'),(10,'Eletrônica Premium Wiring','44.556.778/0001-88','Fios, cabos blindados',750.50,'contato@premiumwiring.com','Rua Energia 420, Rio de Janeiro - RJ','2025-12-04 21:13:07');
/*!40000 ALTER TABLE `fornecedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `franquias`
--

DROP TABLE IF EXISTS `franquias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `franquias` (
  `id_franquia` int NOT NULL AUTO_INCREMENT,
  `codigo_postal` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `endereco_completo` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `cidade` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `email_contato` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `telefone_contato` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `status` enum('Ativo','Inativo') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Ativo',
  `data_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `atualizado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_franquia`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `franquias`
--

LOCK TABLES `franquias` WRITE;
/*!40000 ALTER TABLE `franquias` DISABLE KEYS */;
INSERT INTO `franquias` VALUES (1,'01000-000','Av. Paulista, 1000 - Bela Vista','São Paulo - SP','sp@musichouse.com.br','(11) 98888-1000','Ativo','2025-11-27 02:00:43','2025-11-27 02:00:43'),(2,'20040-020','Rua das Laranjeiras, 315 - Flamengo','Rio de Janeiro - RJ','rj@musichouse.com.br','(21) 97777-2000','Ativo','2025-11-27 02:00:47','2025-12-04 20:00:32'),(3,'30130-970','Av. Afonso Pena, 1500 - Centro','Belo Horizonte - MG','bh@musichouse.com.br','(31) 98888-3000','Ativo','2025-11-27 02:00:47','2025-11-27 02:00:47'),(4,'40015-000','Rua Chile, 25 - Comércio','Salvador - BA','ssa@musichouse.com.br','(71) 98888-4000','Ativo','2025-11-27 02:00:47','2025-11-27 02:00:47'),(5,'80010-100','Rua XV de Novembro, 400 - Centro','Curitiba - PR','ctb@musichouse.com.br','(41) 97777-5000','Ativo','2025-11-27 02:00:47','2025-11-27 02:00:47'),(6,'69005-070','Av. Eduardo Ribeiro, 900 - Centro','Manaus - AM','mao@musichouse.com.br','(92) 98888-6000','Ativo','2025-11-27 02:00:47','2025-11-27 02:00:47'),(7,'64001-010','Av. Frei Serafim, 222 - Centro','Teresina - PI','the@musichouse.com.br','(86) 98888-7000','Ativo','2025-11-27 02:00:47','2025-11-27 02:00:47'),(8,'72000-000','SCS Quadra 2, Bloco D - Asa Sul','Brasília - DF','bsb@musichouse.com.br','(61) 98888-8000','Ativo','2025-11-27 02:00:47','2025-11-27 02:00:47'),(9,'90010-120','Av. Borges de Medeiros, 750 - Centro','Porto Alegre - RS','poa@musichouse.com.br','(51) 98888-9000','Ativo','2025-11-27 02:00:47','2025-11-27 02:00:47'),(10,'58010-101','Av. Epitácio Pessoa, 400 - Tambiá','João Pessoa - PB','jpa@musichouse.com.br','(83) 98888-1010','Ativo','2025-11-27 02:00:47','2025-11-27 02:00:47'),(11,'09551210','Rua Capeberibe, 2121212 - Barcelona','São Caetano do Sul - SP','fsdsdsa','1111111111','Ativo','2025-12-04 18:41:40','2025-12-04 19:53:37'),(12,'09551210','Rua Capeberibe, 2121212 - Barcelona','São Caetano do Sul - SP','fsdsdsa','1111111111','Ativo','2025-12-04 18:42:29','2025-12-04 19:47:56'),(13,'09551210','Rua Capeberibe, 2121212 - Barcelona','São Caetano do Sul - SP','fsdsdsa','1111111111','Ativo','2025-12-04 18:42:31','2025-12-04 19:49:19'),(14,'09551210','Rua Capeberibe, 2121212 - Barcelona','São Caetano do Sul - SP','fsdsdsa','1111111111','Ativo','2025-12-04 18:42:57','2025-12-04 18:42:57'),(15,'09551210','Rua Capeberibe, 258 - Barcelona','São Caetano do Sul - SP','brpezzolato','12121212','Ativo','2025-12-04 18:50:03','2025-12-04 18:50:03'),(16,'09551210','Rua Capeberibe, 258 - Barcelona','São Caetano do Sul - SP','asasa','21','Ativo','2025-12-04 18:50:29','2025-12-04 18:50:29'),(17,'09551210','Rua Capeberibe, 21212 - Barcelona','São Caetano do Sul - SP','12121','12212','Ativo','2025-12-04 18:51:20','2025-12-04 18:51:20'),(18,'09551210','Rua Capeberibe, 21 - Barcelona','São Caetano do Sul - SP','sdsdsd','212121','Inativo','2025-12-04 18:53:25','2025-12-04 20:01:31'),(19,'09551210','Rua Capeberibe, 121212 - Barcelona','São Caetano do Sul - SP','12121212121212','2121212121212','Inativo','2025-12-04 18:56:08','2025-12-04 20:03:19');
/*!40000 ALTER TABLE `franquias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionarios` (
  `id_registro` int NOT NULL AUTO_INCREMENT,
  `nome_completo` varchar(300) COLLATE utf8mb4_general_ci NOT NULL,
  `cpf` char(11) COLLATE utf8mb4_general_ci NOT NULL,
  `rg` varchar(9) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `sexo` enum('Masculino','Feminino','Outro') COLLATE utf8mb4_general_ci DEFAULT 'Outro',
  `estado_civil` enum('Solteiro','Casado','Divorciado','Viúvo','Outro') COLLATE utf8mb4_general_ci DEFAULT 'Solteiro',
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `id_franquia` int NOT NULL,
  `id_credencial` int NOT NULL,
  `fotoFuncionario` text COLLATE utf8mb4_general_ci,
  `token` text COLLATE utf8mb4_general_ci,
  `reset_token` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reset_expires` datetime DEFAULT NULL,
  `senha` text COLLATE utf8mb4_general_ci NOT NULL,
  `primeiroLogin` tinyint(1) DEFAULT '1',
  `status` enum('Ativo','Inativo') COLLATE utf8mb4_general_ci DEFAULT 'Ativo',
  `data_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `atualizado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_registro`),
  KEY `fk_func_franquia` (`id_franquia`),
  KEY `fk_func_cred` (`id_credencial`),
  CONSTRAINT `fk_func_cred` FOREIGN KEY (`id_credencial`) REFERENCES `credenciais` (`id_credenciais`),
  CONSTRAINT `fk_func_franquia` FOREIGN KEY (`id_franquia`) REFERENCES `franquias` (`id_franquia`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
INSERT INTO `funcionarios` VALUES (1,'Marcos Almeida','11111111111','SP-123456','1985-03-12','Masculino','Casado','marcos.almeida@musichouse.com.br','(11) 98888-1101',1,1,NULL,NULL,NULL,NULL,'admin2024',1,'Ativo','2025-11-27 02:01:10','2025-12-01 01:50:27'),(2,'Carla Menezes','11111111112','123456','1988-07-25','Feminino','Casado','carla.menezes@musichouse.com.br','(61) 98888-1102',8,1,NULL,NULL,NULL,NULL,'admin2024',1,'Ativo','2025-11-27 02:01:10','2025-12-01 02:22:37'),(3,'João da Silva','11111111113','SP-234567','1990-01-01','Masculino','Solteiro','joao.silva.sp@musichouse.com.br','(11) 98888-2001',1,2,NULL,NULL,NULL,NULL,'loja2024',1,'Ativo','2025-11-27 02:01:10','2025-12-01 01:50:27'),(4,'ana','11111111111','111111111','2007-02-22','Masculino','Outro','ana.rocha.rj@musichouse.com','11111111111',2,2,NULL,NULL,NULL,NULL,'loja2024',1,'Ativo','2025-11-27 02:01:10','2025-12-04 20:00:26'),(5,'Lucas Pereira','11111111115','MG-456789','1989-11-09','Masculino','Solteiro','lucas.pereira.bh@musichouse.com.br','(31) 98888-2003',3,2,NULL,NULL,NULL,NULL,'loja2024',1,'Ativo','2025-11-27 02:01:10','2025-12-01 01:50:27'),(6,'Fernanda Carvalho','11111111116','BA-567890','1991-02-27','Feminino','Casado','fernanda.carvalho.ssa@musichouse.com.br','(71) 98888-2004',4,2,NULL,NULL,NULL,NULL,'loja2024',1,'Ativo','2025-11-27 02:01:10','2025-12-01 01:50:27'),(7,'Rafael Monteiro','11111111117','PR-678901','1987-08-03','Masculino','Casado','rafael.monteiro.ctb@musichouse.com.br','(41) 97777-2005',5,2,NULL,NULL,NULL,NULL,'loja2024',1,'Ativo','2025-11-27 02:01:10','2025-12-01 01:50:27'),(8,'Patrícia Nogueira','11111111118','AM-789012','1993-04-14','Feminino','Solteiro','patricia.nogueira.mao@musichouse.com.br','(92) 98888-2006',6,2,NULL,NULL,NULL,NULL,'loja2024',1,'Ativo','2025-11-27 02:01:10','2025-12-01 01:50:27'),(9,'Gustavo Lima','11111111119','PI-890123','1986-09-21','Masculino','Casado','gustavo.lima.the@musichouse.com.br','(86) 98888-2007',7,2,NULL,NULL,NULL,NULL,'loja2024',1,'Ativo','2025-11-27 02:01:10','2025-12-01 01:50:27'),(10,'Mariana Duarte','11111111120','DF-901234','1994-12-30','Feminino','Solteiro','mariana.duarte.bsb@musichouse.com.br','(61) 98888-2008',8,2,NULL,NULL,NULL,NULL,'loja2024',1,'Ativo','2025-11-27 02:01:10','2025-12-01 01:50:27'),(11,'Thiago Souza','11111111121','RS-012345','1988-10-05','Masculino','Casado','thiago.souza.poa@musichouse.com.br','(51) 98888-2009',9,2,NULL,NULL,NULL,NULL,'loja2024',1,'Ativo','2025-11-27 02:01:10','2025-12-01 01:50:27'),(12,'Bruna Oliveira','11111111122','PB-123450','1995-06-17','Feminino','Solteiro','bruna.oliveira.jpa@musichouse.com.br','(83) 98888-2010',19,2,NULL,NULL,NULL,NULL,'loja2024',1,'Inativo','2025-11-27 02:01:10','2025-12-04 20:03:19'),(13,'Felipe Andrade','11111111124','SP-777888','1998-01-22','Masculino','Solteiro','felipe.andrade@musichouse.com.br','(11) 97777-3001',1,3,NULL,NULL,NULL,NULL,'123456',1,'Ativo','2025-11-27 02:01:10','2025-12-01 01:50:27'),(14,'Leticia Melo','10121415478','111111111','1999-07-11','Feminino','Casado','leticia.moraes@musichouse.com.br','(21) 97777-3002',2,3,'\\uploads\\fotosFuncionarios\\1764556105967-WhatsApp Image 2025-11-14 at 10.23.43.jpeg',NULL,NULL,NULL,'123456',1,'Ativo','2025-11-27 02:01:10','2025-12-04 20:00:26'),(15,'Bruno Costa','11111111126','MG-999000','1997-05-29','Masculino','Solteiro','bruno.costa@musichouse.com.br','(31) 97777-3003',3,3,NULL,NULL,NULL,NULL,'123456',1,'Ativo','2025-11-27 02:01:10','2025-12-01 01:50:27'),(16,'Camila Ribeiro','11111111127','BA-101112','1996-09-19','Feminino','Solteiro','camila.ribeiro@musichouse.com.br','(71) 97777-3004',4,3,NULL,NULL,NULL,NULL,'123456',1,'Ativo','2025-11-27 02:01:10','2025-12-01 01:50:27'),(17,'Diego Martins','11111111128','PR-121314','1994-02-10','Masculino','Casado','diego.martins@musichouse.com.br','(41) 97777-3005',5,3,NULL,NULL,NULL,NULL,'123456',1,'Ativo','2025-11-27 02:01:10','2025-12-01 01:50:27'),(18,'Isabela Farias','11111111129','AM-141516','1995-11-03','Feminino','Solteiro','isabela.farias@musichouse.com.br','(92) 97777-3006',6,3,NULL,NULL,NULL,NULL,'123456',1,'Ativo','2025-11-27 02:01:10','2025-12-01 01:50:27'),(19,'Rogério Tavares','11111111130','PI-161718','1993-08-14','Masculino','Casado','rogerio.tavares@musichouse.com.br','(86) 97777-3007',7,3,NULL,NULL,NULL,NULL,'123456',1,'Ativo','2025-11-27 02:01:10','2025-12-01 01:50:27'),(20,'Nicole Santos','11111111131','DF-181920','1998-04-09','Feminino','Solteiro','nicole.santos@musichouse.com.br','(61) 97777-3008',8,3,NULL,NULL,NULL,NULL,'123456',1,'Ativo','2025-11-27 02:01:10','2025-12-01 01:50:27'),(21,'André Luiz','11111111132','RS-202122','1992-12-01','Masculino','Casado','andre.luiz@musichouse.com.br','(51) 97777-3009',9,3,NULL,NULL,NULL,NULL,'123456',1,'Ativo','2025-11-27 02:01:10','2025-12-01 01:50:27'),(22,'Paula Mendes','11111111133','PB-222324','1997-06-06','Feminino','Solteiro','paula.mendes@musichouse.com.br','(83) 97777-3010',19,3,NULL,NULL,NULL,NULL,'123456',1,'Inativo','2025-11-27 02:01:10','2025-12-04 20:03:19'),(23,'Arthur Buscarino Benedetti','12345678','000000000','2007-07-11','Masculino','Solteiro','arthurbuscarinobenedetti8@gmail.com','11999215191',2,2,'\\uploads\\fotosFuncionarios\\1764770972866-logoSENAI.png',NULL,NULL,NULL,'$2b$10$GHk/4uijqaDbHs1xowm9hukkYKGqXdLj656yOjvwuz4Gbiqmgfe0O',0,'Ativo','2025-11-27 02:01:54','2025-12-04 20:00:26'),(24,'Giovanni Buscarino Benedetti','12345678','000000000','2007-07-11','Masculino','Solteiro','gbuscarinobenedetti@gmail.com','11999215191',1,1,NULL,NULL,NULL,NULL,'$2b$10$cuORPsLzM3zHq1jQZamn5ukqLGOF2O4XvO/0YOF4s9TIZL6QkpiXG',0,'Ativo','2025-11-27 02:05:51','2025-11-27 02:06:38'),(26,'Giulia','45307489870','123456789','2007-07-11','Feminino','Casado','senaigiovannibenedetti@gmail.com','11910613570',2,3,'\\uploads\\fotosFuncionarios\\1764596678438-WhatsApp Image 2025-09-13 at 16.38.26 (2).jpeg',NULL,NULL,NULL,'$2b$10$kRO1t9hXUmelDXvoc0/xYOxieYxgq26sFjznbnBde4kty7Fs8QsWq',0,'Ativo','2025-12-01 01:39:37','2025-12-04 20:00:26'),(27,'aa','2121211212','121221','2025-12-01','Feminino','Solteiro','aaa@aa','21212121212',2,1,NULL,NULL,NULL,NULL,'$2b$10$BuvQoGodteho0NCnl34W/udur1mK9CJTUb8N9G.9mec9rPbp4b3OC',1,'Ativo','2025-12-02 00:32:47','2025-12-04 20:00:26'),(28,'Giulia Berraaaa','99999999','7746455','2025-12-17','Feminino','Solteiro','giuliaatinhalinda2012@gmail.com','jjjjjjjjjjj',2,3,NULL,NULL,NULL,NULL,'$2b$10$IYibNvghIXxmKmWgXCrURepy.YpRi4238KtJIRIqmKntbRDwFGbUe',1,'Ativo','2025-12-02 01:06:28','2025-12-04 20:00:26'),(29,'aaaaaaaaaaaaa','777777','888888888','2025-12-23','Feminino','','ana.rocha.rj@musichouse.com.br','99999999',2,2,NULL,NULL,NULL,NULL,'$2b$10$qWAwLYg2DSkIIoO2u64.cOBo9Pix6Q7oj1d8vpFr3oQgLCP4YbUU6',1,'Ativo','2025-12-02 02:42:27','2025-12-04 20:00:26'),(32,'Giulia Pezzolato','98765432','897654345','1990-05-15','Masculino','Solteiro','giovanni.benedetti@aluno.senai.br','(11)91234-5678',2,4,NULL,NULL,NULL,NULL,'$2b$10$yn9FYfPt3uLwfx7j5tRSjOMEMgaTLAaJl5ZghA3dRCFMHmTGPZGRG',0,'Ativo','2025-12-03 11:40:09','2025-12-04 20:00:26'),(33,'Skibidi','32442342423','234234242','0000-00-00','Masculino','Solteiro','email@Musichouse.com','112321312343',2,3,NULL,NULL,NULL,NULL,'$2b$10$VhE2xHdp/GKK7B0ZqeyugekJEi..RK6TVf/KouAlRcJPqNuVt6UWm',1,'Ativo','2025-12-03 13:32:33','2025-12-04 20:00:26'),(34,'Giulia Berraquero Ventre','44472559870','560883201','0000-00-00','Feminino','Outro','giulia@11111.com','1196923486',2,3,NULL,NULL,NULL,NULL,'$2b$10$Ab4M/yHldegCJwfWtBdNwuTZvOwLLuqKYmZPr7TkEJDoGkcZlsT7K',1,'Ativo','2025-12-03 17:52:07','2025-12-04 20:00:26'),(35,'aaaaaaaaaaa','55555555555','555555555','0000-00-00','Feminino','Casado','aaaaaaaaa@a','555555555555',2,3,NULL,NULL,NULL,NULL,'$2b$10$Vt5PYrmzHTeTv3kKJgbkuOi3UyB1M0qatcNG7jr7Hx2mk/sb3ncGC',1,'Ativo','2025-12-03 19:27:52','2025-12-04 20:00:26'),(36,'giulia','11111111111','111111111','2011-11-11','Feminino','Casado','guuu@fghju.com','111111111111',2,3,NULL,NULL,NULL,NULL,'$2b$10$xSdn5ihEsnMVgN3xwNejHuJtEcPO407TKxNCTUprcoo/RfUUzbbQK',1,'Ativo','2025-12-03 21:29:42','2025-12-04 20:00:26'),(37,'giulia','11111111111','111111111','2011-11-11','Feminino','Casado','guuu@fghju.com','111111111111',2,3,NULL,NULL,NULL,NULL,'$2b$10$XIiFj42xqPJyQYAKhiSdBOg8C0LEp8WS9xi2nitIT3MgI5fvn1k5O',1,'Ativo','2025-12-03 21:29:43','2025-12-04 20:00:26'),(38,'aaaaaaaaaaaaaa','11111111111','111111111','2011-11-11','Feminino','Divorciado','11@gmail.c','111111111111',2,3,NULL,NULL,NULL,NULL,'$2b$10$UlSpWg8968bWfiExZFSH9ecaWsuW.36RgEkyD9NdoZUA7yfUz2.2C',1,'Ativo','2025-12-03 21:52:27','2025-12-04 20:00:26');
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_venda`
--

DROP TABLE IF EXISTS `item_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_venda` (
  `id_item` int NOT NULL AUTO_INCREMENT,
  `id_venda` int NOT NULL,
  `sku_produto` varchar(6) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sku_variacao` varchar(6) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `quantidade` int NOT NULL,
  `preco_unitario` decimal(10,2) DEFAULT NULL,
  `lucro` decimal(10,2) DEFAULT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_item`),
  KEY `fk_item_venda` (`id_venda`),
  CONSTRAINT `fk_item_venda` FOREIGN KEY (`id_venda`) REFERENCES `venda` (`id_venda`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_venda`
--

LOCK TABLES `item_venda` WRITE;
/*!40000 ALTER TABLE `item_venda` DISABLE KEYS */;
INSERT INTO `item_venda` VALUES (1,1,'521394',NULL,1,950.00,380.00,950.00),(2,1,'498320',NULL,1,180.00,72.00,180.00),(3,1,'987130',NULL,1,90.00,36.00,90.00),(4,2,NULL,'247690',1,980.00,80.00,980.00),(5,2,'481279',NULL,1,7500.00,3000.00,7500.00),(6,2,'790246',NULL,1,110.00,44.00,110.00),(7,3,'305478',NULL,1,760.00,304.00,760.00),(8,3,'837295',NULL,1,890.00,356.00,890.00),(9,3,NULL,'875624',1,10200.00,7700.00,10200.00),(10,4,'305478',NULL,3,760.00,912.00,2280.00),(11,5,'713625',NULL,1,1350.00,540.00,1350.00),(12,6,'521394',NULL,1,930.00,620.00,930.00),(13,6,NULL,'384201',1,855.00,505.00,855.00),(14,6,NULL,'928473',2,475.00,210.00,950.00),(15,7,'521394',NULL,1,930.00,620.00,930.00),(16,7,NULL,'928473',2,475.00,210.00,950.00),(17,7,NULL,'384201',1,855.00,505.00,855.00),(18,8,'521394',NULL,1,930.00,620.00,930.00),(19,8,NULL,'928473',2,475.00,210.00,950.00),(20,8,NULL,'384201',1,855.00,505.00,855.00),(21,9,'521394',NULL,1,930.00,620.00,930.00),(22,9,NULL,'928473',2,475.00,210.00,950.00),(23,9,NULL,'384201',1,855.00,505.00,855.00);
/*!40000 ALTER TABLE `item_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimentacoes_estoque`
--

DROP TABLE IF EXISTS `movimentacoes_estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimentacoes_estoque` (
  `id_movimentacao` int NOT NULL AUTO_INCREMENT,
  `id_estoque` int NOT NULL,
  `id_franquia` int NOT NULL,
  `id_funcionario` int NOT NULL,
  `tipo_movimentacao` enum('entrada','saida') NOT NULL,
  `quantidade_anterior` int NOT NULL,
  `quantidade_movimentada` int NOT NULL,
  `quantidade_atual` int NOT NULL,
  `data_movimentacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_movimentacao`),
  KEY `fk_mov_estoque` (`id_estoque`),
  KEY `fk_mov_franquia` (`id_franquia`),
  KEY `fk_mov_func` (`id_funcionario`),
  CONSTRAINT `fk_mov_estoque` FOREIGN KEY (`id_estoque`) REFERENCES `estoque` (`id_estoque`),
  CONSTRAINT `fk_mov_franquia` FOREIGN KEY (`id_franquia`) REFERENCES `franquias` (`id_franquia`),
  CONSTRAINT `fk_mov_func` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_registro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimentacoes_estoque`
--

LOCK TABLES `movimentacoes_estoque` WRITE;
/*!40000 ALTER TABLE `movimentacoes_estoque` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimentacoes_estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos_filiais`
--

DROP TABLE IF EXISTS `pedidos_filiais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_filiais` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `id_franquia` int NOT NULL,
  `id_funcionario` int NOT NULL,
  `id_estoque` int NOT NULL,
  `quantidade` int NOT NULL,
  `observacao` text NOT NULL,
  `status` enum('Pendente','Aprovado','Recusado') DEFAULT 'Pendente',
  `prioridade` enum('Alta','Média','Baixa') DEFAULT 'Média',
  `data_pedido` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `data_atualizacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pedido`),
  KEY `fk_franquia` (`id_franquia`),
  KEY `fk_funcionario` (`id_funcionario`),
  KEY `fk_estoque` (`id_estoque`),
  CONSTRAINT `fk_estoque` FOREIGN KEY (`id_estoque`) REFERENCES `estoque` (`id_estoque`),
  CONSTRAINT `fk_franquia` FOREIGN KEY (`id_franquia`) REFERENCES `franquias` (`id_franquia`),
  CONSTRAINT `fk_funcionario` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_registro`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos_filiais`
--

LOCK TABLES `pedidos_filiais` WRITE;
/*!40000 ALTER TABLE `pedidos_filiais` DISABLE KEYS */;
INSERT INTO `pedidos_filiais` VALUES (1,2,23,297,90,'okok','Pendente','Alta','2025-12-04 20:25:57','2025-12-04 20:25:57'),(2,2,23,307,200,'Para preparação de black friday','Pendente','Alta','2025-12-04 21:05:23','2025-12-04 21:05:23'),(3,2,23,400,10,'preparação de black','Pendente','Alta','2025-12-04 21:05:45','2025-12-04 21:05:45');
/*!40000 ALTER TABLE `pedidos_filiais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `id_produto` int NOT NULL AUTO_INCREMENT,
  `sku` varchar(6) COLLATE utf8mb4_general_ci NOT NULL,
  `nome` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `descricao` text COLLATE utf8mb4_general_ci,
  `materiais` varchar(300) COLLATE utf8mb4_general_ci NOT NULL,
  `detalhes` varchar(300) COLLATE utf8mb4_general_ci NOT NULL,
  `nome_cor` varchar(70) COLLATE utf8mb4_general_ci NOT NULL,
  `cor` varchar(70) COLLATE utf8mb4_general_ci NOT NULL,
  `desconto` int DEFAULT NULL,
  `id_categoria` int NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `custo_producao` decimal(10,2) DEFAULT NULL,
  `imagem` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_produto`),
  UNIQUE KEY `sku` (`sku`),
  KEY `fk_prod_categoria` (`id_categoria`),
  CONSTRAINT `fk_prod_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'521394','Violão Clássico Nylon','Classical wooden acoustic guitar with nylon strings, natural finish, warm studio lighting, professional product photo.','Tampo em spruce, laterais e fundo em mogno.','Violão de estudo com timbre suave e confortável.','Natural','#c25a04',NULL,1,930.00,310.00,'violao-nylon-frente.png, violao-nylon-frente-sem-fundo.png, violao-nylon-verso.png, violao-nylon-verso-sem-fundo.png'),(2,'713625','Violão Aço Folk','A steel-string acoustic folk guitar with a large body and glossy wood finish, photographed on a neutral background with soft lighting.','Corpo em rosewood e tampo em spruce.','Som brilhante, ideal para palco e gravação.','Natural Brilhante','#C49A6C',NULL,1,1350.00,810.00,'violao-aco-frente.png, violao-aco-frente-sem-fundo.png, violao-aco-verso.png, violao-aco-verso-sem-fundo.png'),(3,'438915','Guitarra Stratocaster','An electric Stratocaster guitar with a white body and black pickguard, modern lighting, high-quality studio image.','Corpo em alder, braço em maple.','Três captadores single coil e chave seletora de 5 posições.','Branco','#FFFFFF',NULL,1,4200.00,2520.00,'guitarra-stratocaster-frente.png, guitarra-stratocaster-frente-sem-fundo.png, guitarra-stratocaster-verso.png, guitarra-stratocaster-verso-sem-fundo.png'),(4,'820491','Guitarra Les Paul','A Les Paul style electric guitar with a flame maple top, amber color, gold hardware, and dramatic dark background lighting.','Top em maple flame, corpo em mogno.','Dois captadores humbucker e ponte Tune-o-Matic.','Amber Flame','#D2691E',NULL,1,5600.00,3360.00,'guitarra-lespaul-frente.png, guitarra-lespaul-frente-sem-fundo.png, guitarra-lespaul-verso.png, guitarra-lespaul-verso-sem-fundo.png'),(5,'179632','Baixo Acústico Baixolão 4 Cordas','Four-string acoustic bass guitar with a large wooden body, natural matte finish, displayed on a wooden floor with studio lighting.','Tampo em spruce, corpo em mogno.','Captação ativa e braço confortável.','Natural Fosco','#ac6a23',20,1,2100.00,1260.00,'baixolao-frente.png, baixolao-frente-sem-fundo.png, baixolao-verso.png, baixolao-verso-sem-fundo.png'),(6,'493725','Baixo Elétrico Jazz Bass','A Jazz Bass electric guitar with sunburst finish, two pickups, chrome hardware, and studio lighting.','Corpo em alder, braço em maple.','Dois captadores single coil, timbre vintage.','Sunburst','#8B4513',NULL,1,3700.00,2220.00,'baixo-eletrico-jazz-bass-frente.png, baixo-eletrico-jazz-bass-frente-sem-fundo.png, baixo-eletrico-jazz-bass-verso.png, baixo-eletrico-jazz-bass-verso-sem-fundo.png'),(7,'260498','Baixo Elétrico Precision Bass','A Precision Bass electric guitar with black body, maple neck, vintage look, photographed on dark background.','Corpo em alder, braço maple e captador split coil.','Design clássico e som encorpado.','Preto','#111111',NULL,1,3900.00,2340.00,'baixo-eletrico-precision-bass-frente.png, baixo-eletrico-precision-bass-frente-sem-fundo.png, baixo-eletrico-precision-bass-verso.png, baixo-eletrico-precision-bass-verso-sem-fundo.png'),(8,'619874','Viola Caipira 12 Cordas','A modern 12-string Brazilian viola caipira, polished wood finish, studio lighting, front-facing product photo.','Corpo em mogno e tampo em spruce.','Braço reforçado, timbre cristalino.','Natural Polido','#D2A679',NULL,1,1600.00,960.00,'viola-caipira-12-cordas-frente.png, viola-caipira-12-cordas-frente-sem-fundo.png, viola-caipira-12-cordas-verso.png, viola-caipira-12-cordas-verso-sem-fundo.png'),(9,'982310','Violino Profissional','A professional violin with dark varnish, fine wood texture, and elegant studio lighting for concert presentation.','Madeira maple flame e ébano.','Cordas de aço e arco em crina natural.','Vermelho Escuro','#8B0000',NULL,1,6800.00,4080.00,'violino-frente.png, violino-frente-sem-fundo.png, violino-verso.png, violino-verso-sem-fundo.png'),(10,'312654','Violoncelo Profissional','A professional concert cello with dark polished wood, elegant shape, under soft spotlight on stage.','Corpo em maple europeu.','Som encorpado e sustentado.','Vermelho Mogno','#8B4513',NULL,1,12500.00,7500.00,'violoncelo-profissional-frente.png, violoncelo-profissional-frente-sem-fundo.png, violoncelo-profissional-verso.png, violoncelo-profissional-verso-sem-fundo.png'),(11,'897324','Ukulele Soprano','A small soprano ukulele with light wood finish, tropical vibe, photographed on beige background with warm light.','Corpo em mahogany e tampo spruce.','Som suave e portátil.','Natural Claro','#E6BE8A',NULL,1,480.00,288.00,'ukulele-soprano-frente.png, ukulele-soprano-frente-sem-fundo.png, ukulele-soprano-verso.png, ukulele-soprano-verso-sem-fundo.png'),(12,'235781','Banjo 4 Cordas','A 4-string traditional banjo with metallic rim and wooden neck, retro look, natural lighting.','Aros em alumínio e braço em maple.','Som brilhante e percussivo.','Natural com Metal','#C0C0C0',NULL,1,1450.00,870.00,'banjo-4-cordas-frente.png, banjo-4-cordas-frente-sem-fundo.png, banjo-4-cordas-verso.png, banjo-4-cordas-verso-sem-fundo.png'),(13,'519843','Cavaquinho Elétrico','An electric cavaquinho with solid body, embedded pickups, modern lighting on dark studio background.','Corpo sólido em mogno e captação ativa.','Design moderno, ideal para palco.','Bege Claro','#e0b362',NULL,1,1300.00,780.00,'cavaquinho-eletrico-frente.png, cavaquinho-eletrico-frente-sem-fundo.png, cavaquinho-eletrico-verso.png, cavaquinho-eletrico-verso-sem-fundo.png'),(14,'624981','Bateria Eletrônica Profissional (Pads de Mesh)','A professional electronic drum kit with mesh pads, large display module, black finish, photographed in a recording studio.','Estrutura em aço e pads com malha dupla.','Módulo digital com 700 sons e conectividade USB/MIDI.','Preto Fosco','#111111',NULL,2,9800.00,5880.00,'bateria-eletrica-frente.png, bateria-eletrica-frente-sem-fundo.png, bateria-eletrica-verso.png, bateria-eletrica-verso-sem-fundo.png'),(15,'835207','Cajón Flamenco','A flamenco cajón made of polished wood, front striking surface, placed on a wooden floor with warm lighting.','Madeira compensada de bétula e painel frontal em mogno.','Timbre definido para palmas e graves encorpados.','Natural Polido','#D2B48C',NULL,2,890.00,534.00,'cajon-flamenco-frente.png, cajon-flamenco-frente-sem-fundo.png, cajon-flamenco-verso.png, cajon-flamenco-verso-sem-fundo.png'),(16,'921543','Pandeiro Couro','A leather-headed pandeiro with brass jingles, handcrafted style, rustic lighting on wooden surface.','Aros de madeira e platinelas de latão.','Membrana de couro natural, 10 polegadas.','Natural','#E6BE8A',NULL,2,450.00,270.00,'pandeiro-couro-frente.png, pandeiro-couro-frente-sem-fundo.png, pandeiro-couro-verso-sem-fundo.png, pandeiro-couro-verso-sem-fundo.png'),(17,'763201','Tamborim Tradicional','A traditional samba tamborim with nylon head, metal rim, placed on a percussion table under studio lighting.','Aro de alumínio e pele de nylon.','Perfeito para bateria de escola de samba.','Prateado','#99846c',NULL,2,240.00,144.00,'tamborim-frente.png, tamborim-frente-sem-fundo.png, '),(18,'149872','Congas Quinto','A single quinto conga drum, tall and narrow, dark wood finish with chrome hardware, studio lighting.','Madeira de carvalho com ferragens cromadas.','Altura de 75cm e afinação por chaves.','Mogno Escuro','#8B4513',NULL,2,3100.00,1860.00,'conga-frente.png, conga-frente-sem-fundo.png, conga-verso.png, conga-verso-sem-fundo.png'),(19,'658304','Bongôs Profissional','Professional bongo drums with dark polished wood, metal tuning lugs, photographed on black background.','Mogno e ferragens niqueladas.','Tamanhos 7” e 8,5”, pele natural.','Natural Escuro','#5C4033',NULL,2,1350.00,810.00,'bongo-frente.png, bongo-frente-sem-fundo.png, bongo-verso.png, bongo-verso-sem-fundo.png'),(20,'278965','Surdo Marcação','A large samba surdo drum for bass rhythm, deep aluminum body, strong visual lighting, street parade vibe.','Corpo em alumínio escovado e pele dupla.','Utilizado em desfiles e blocos de carnaval.','Alumínio','#B0B0B0',NULL,2,1750.00,1050.00,'surdo-frente.png, surdo-frente-sem-fundo.png, surdo-verso.png, surdo-verso-sem-fundo.png'),(21,'987130','Triângulo Tradicional','A metal triangle percussion instrument with a simple design, hanging with striker, isolated on white background.','Aço inoxidável.','Inclui baqueta e cordão de fixação.','Metálico','#C0C0C0',NULL,2,90.00,54.00,'triangulo-frente.png, triangulo-frente-sem-fundo.png, triangulo-verso.png, triangulo-verso-sem-fundo.png'),(22,'305478','Tantan Madeira','A wooden tantan drum, cylindrical shape, natural finish, used in pagode music, warm studio lighting.','Mogno e couro natural.','Sonoridade grave e suave.','Natural','#DEB887',NULL,2,760.00,456.00,'tantan-frente.png, tantan-frente-sem-fundo.png, tantan-cima.png, tantan-cima-sem-fundo.png'),(23,'498320','Reco-reco de Madeira','A wooden reco-reco with carved ridges and a stick, photographed on a light wood surface, warm tones.','Mogno entalhado e baqueta de madeira.','Timbre rústico e artesanal.','Natural Envernizado','#CDAA7D',NULL,2,180.00,108.00,'reco-reco-frente.png, reco-reco-frente-sem-fundo.png, reco-reco-cima.png, reco-reco-cima-sem-fundo.png'),(24,'152937','Xilofone Estudante','A small xylophone for students with colorful bars, mallets included, photographed on white background.','Base em madeira com lâminas plásticas coloridas.','Acompanha par de baquetas.','Marrom','#ecd7b3',NULL,2,290.00,174.00,'xilofone-frente.png, xilofone-frente-sem-fundo.png, xilofone-verso.png, xilofone-verso-sem-fundo.png'),(25,'831276','Marimba Orquestral','A professional orchestral marimba with wooden resonators and mallets, concert hall background lighting.','Lâminas de rosewood e ressonadores metálicos.','Som encorpado, usado em orquestras.','Madeira Natural','#8B4513',NULL,2,21000.00,12600.00,'marimba-orquestral-frente.png, marimba-orquestral-frente-sem-fundo.png, marimba-orquestral-verso.png, marimba-orquestral-verso-sem-fundo.png'),(26,'489072','Glockenspiel Orquestral','A professional orchestral glockenspiel mounted on a frame with mallets, dark concert background lighting.','Lâminas de aço e estrutura tubular.','Sonoridade aguda e cristalina.','Metálico','#D3D3D3',NULL,2,7200.00,4320.00,'glockenspiel-profissional-frente.png, glockenspiel-profissional-frente-sem-fundo.png, glockenspiel-profissional-verso.png, glockenspiel-profissional-verso-sem-fundo.png'),(27,'612489','Piano Acústico (De Cauda)','A grand acoustic piano with glossy black finish, open lid showing strings, photographed in a concert hall with warm lighting.','Tampa e corpo em madeira nobre com acabamento em poliéster preto.','88 teclas de marfim sintético, som encorpado e harmônico.','Preto Brilhante','#000000',NULL,3,58000.00,34800.00,'piano-acustico-cauda-frente.png, piano-acustico-cauda-frente-sem-fundo.png, piano-acustico-corda-verso.png, piano-acustico-corda-verso-sem-fundo.png'),(28,'204718','Piano Acústico (Vertical)','An upright acoustic piano made of dark polished wood, photographed against a wall with soft ambient lighting.','Estrutura em madeira de nogueira com martelos de feltro.','Compacto e ideal para ambientes menores.','Mogno Escuro','#5B3A29',NULL,3,28500.00,17100.00,'piano-acustico-vertical-frente.png, piano-acustico-vertical-frente-sem-fundo.png, piano-acustico-vertical-verso.png, piano-acustico-vertical-verso-sem-fundo.png'),(29,'739160','Piano Digital (Portátil)','A compact digital piano with 88 weighted keys, minimalist black design, displayed in a modern home studio.','Corpo em plástico ABS reforçado, teclas semi-pesadas.','Inclui saída USB e conexão para fones.','Preto Fosco','#1C1C1C',NULL,3,4200.00,2520.00,'piano-digital-portatil-frente.png, piano-digital-portatil-frente-sem-fundo.png, piano-digital-portatil-verso.png, piano-digital-portatil-verso-sem-fundo.png'),(30,'528903','Piano Digital (De Móvel / Armário)','A cabinet-style digital piano with built-in stand and pedals, dark wood finish, photographed in a cozy living room setting.','Estrutura em MDF revestido e teclas com ação hammer.','Sistema estéreo e 10 timbres internos.','Madeira Escura','#3B2F2F',NULL,3,6400.00,3840.00,'piano-digital-movel-frente.png, piano-digital-movel-frente-sem-fundo.png, piano-digital-movel-verso.png, piano-digital-movel-verso-sem-fundo.png'),(31,'481279','Teclado Arranjador (Avançado 76/88 Teclas)','A professional arranger keyboard with extended 76 keys, multiple controls and display, photographed in a recording studio.','Carcaça em alumínio leve, display LCD colorido.','Ritmos integrados e gravação em tempo real.','Prateado','#C0C0C0',NULL,3,7500.00,4500.00,'teclado-arranjador-frente.png, teclado-arranjador-frente-sem-fundo.png, teclado-arranjador-verso.png, teclado-arranjador-verso-sem-fundo.png'),(32,'967540','Teclado Controlador MIDI (25 Teclas)','A small 25-key MIDI controller keyboard with drum pads and knobs, modern lighting on white background.','Corpo em ABS preto fosco e conexões USB-C.','Compatível com DAWs profissionais.','Preto Fosco','#111111',NULL,3,980.00,588.00,'teclado-controlador-midi-frente.png, teclado-controlador-midi-frente-sem-frente.png, teclado-controlador-midi-verso.png, teclado-controlador-midi-verso-sem-fundo.png'),(33,'379826','Sintetizador (Digital)','A modern digital synthesizer with sleek design, LCD display, and touch controls, in a futuristic studio environment.','Painel metálico com 61 teclas sensíveis à velocidade.','Gerador de som digital com 512 presets.','Preto Grafite','#2F2F2F',NULL,3,8900.00,5340.00,'sintetizador-digital-frente.png, sintetizador-digital-frente-sem-fundo.png, sintetizador-digital-verso.png, sintetizador-digital-verso-sem-fundo.png'),(34,'982431','Flauta Doce (Contralto)','An alto recorder made of dark wood, traditional design, placed on a sheet of classical music with warm lighting.','Madeira de ébano e chaves ajustadas.','Sonoridade suave e ideal para aprendizado clássico.','Mogno Escuro','#4B3621',NULL,4,420.00,252.00,'flauta-doce-frente.png, flauta-doce-frente-sem-fundo.png'),(35,'134682','Flauta Transversal (Profissional)','A professional silver flute with open holes and elegant engravings, photographed in a concert hall setting with warm spotlight.','Prata banhada com corpo em níquel.','Afinada em C, ideal para uso orquestral.','Prateado','#DCDCDC',NULL,4,7200.00,4320.00,'flauta-transversal-frente.png, flauta-transversal-frente-sem-fundo.png, flauta-transversal-verso.png, flauta-transversal-verso-sem-fundo.png'),(36,'843965','Saxofone (Alto)','An alto saxophone with gold lacquer finish, classic curved shape, photographed against a dark studio background with dramatic light.','Latão com acabamento dourado e chaves em madrepérola.','Timbre clássico e resposta rápida.','Dourado','#FFD700',NULL,4,9800.00,5880.00,'saxofone-alto-frente.png, saxofone-alto-frente-sem-fundo.png, saxofone-alto-verso.png, saxofone-alto-verso-sem-fundo.png'),(37,'270319','Trompete (Bb)','A standard Bb trumpet with gold lacquer finish and silver mouthpiece, placed on a reflective black surface with concert lighting.','Corpo em latão com bocal niquelado.','Afinado em Si♭, ideal para iniciantes e profissionais.','Dourado','#FFD700',NULL,4,5400.00,3240.00,'trompete-bb-frente.png, trompete-bb-frente-sem-fundo.png, trompete-bb-verso.png, trompete-bb-verso-sem-fundo.png'),(38,'761084','Clarinete (Bb)','A Bb clarinet with black body and silver keys, lying on a wooden table, soft classical lighting.','Resina ABS com chaves niqueladas.','Sonorização clara e projeção equilibrada.','Preto','#000000',NULL,4,3900.00,2340.00,'clarinete-bb-frente.png, clarinete-bb-frente-sem-fundo.png, clarinete-bb-verso.png, clarinete-bb-verso-sem-fundo.png'),(39,'689431','Gaita (Harmônica) Diatônica','A diatonic harmonica with metal cover and wooden comb, pocket-size, photographed on a rustic wooden surface.','Corpo em madeira e tampas cromadas.','Tonalidade C, ideal para blues e folk.','Metálico','#C0C0C0',NULL,4,350.00,210.00,'gaita-harmonica-frente.png, gaita-harmonica-frente-sem-fundo.png, gaita-harmonica-verso.png, gaita-harmonica-verso-sem-fundo.png'),(40,'245786','Fagote (Modelo Profissional)','A professional bassoon with rich red wood finish, intricate silver key system, concert hall background lighting.','Maple vermelho e sistema Heckel.','Instrumento de orquestra com timbre aveludado.','Vermelho Escuro','#8B0000',NULL,4,28500.00,17100.00,'fagote-frente.png, fagote-frente-sem-fundo.png, fagote-verso.png, fagote-verso-sem-fundo.png'),(41,'924518','Trompa (Modelo Profissional)','A professional French horn with full double horn system, gold lacquer finish, photographed in a concert environment.','Latão dourado com chaves rotativas.','Sonoridade ampla e projeção poderosa.','Dourado Envelhecido','#DAA520',NULL,4,16500.00,9900.00,'trompa-frente.png, trompa-frente-sem-fundo.png, trompa-verso.png, trompa-verso-sem-fundo.png'),(42,'378902','Corneta (Modelo Profissional)','A professional silver cornet, refined design, photographed on stage lighting setup with blurred orchestra background.','Corpo em prata com válvulas de pistão rápidas.','Timbre suave, ideal para bandas sinfônicas.','Prateado','#C0C0C0',NULL,4,8200.00,4920.00,'corneta-frente.png, corneta-frente-sem-fundo.png, corneta-verso.png, corneta-verso-sem-fundo.png'),(43,'582971','Acordeon (Sanfona) 80 Baixos','A full-size 80-bass accordion with pearl buttons and decorative grille, photographed in a folk music studio with soft light.','Corpo em madeira compensada, fole em tecido reforçado e botões de madrepérola.','Timbre tradicional, ideal para forró, vanerão e música regional.','Preto com Branco','#000000',NULL,5,9600.00,5760.00,'acordeon-frente.png, acordeon-frente-sem-fundo.png, acordeon-verso.png, acordeon-verso-sem-fundo.png'),(44,'920516','Harmonium Tradicional Indiano','A classic Indian harmonium with decorative carvings, extended bellows, photographed in a traditional music room setting.','Madeira de teca com entalhes ornamentais.','Timbre quente e ressonância profunda.','Natural Entalhado','#CD853F',NULL,5,8400.00,5040.00,'harmonium-frente.png, harmonium-frente-sem-fundo.png, harmonium-verso.png, harmonium-verso-sem-fundo.png'),(45,'362094','Bandoneón Clássico Argentino','A classic Argentine bandoneon with black wooden body, pearl buttons, open bellows, photographed under soft tango-style lighting.','Mogno preto com botões de madrepérola.','Instrumento típico do tango, som expressivo e melancólico.','Preto Piano','#111111',NULL,5,11800.00,7080.00,'bandoneon-frente.png, bandoneon-frente-sem-fundo.png, bandoneon-verso.png, bandoneon-verso-sem-fundo.png'),(46,'142693','Amplificador de Guitarra (Combo)','A combo guitar amplifier with black tolex finish, silver grille cloth, control knobs on top, photographed in a recording studio with moody lighting.','Caixa em MDF revestida com courvin preto e tela prateada.','Potência de 40W RMS, ideal para ensaios e pequenos shows.','Preto Fosco','#1C1C1C',NULL,6,2800.00,1680.00,'amplificador-de-guitarra-frente.png, amplificador-de-guitarra-frente-sem-fundo.png, amplificador-de-guitarra-verso.png, amplificador-de-guitarra-verso-sem-fundo.png'),(47,'587420','Amplificador de Guitarra (Cabeçote)','A guitar amp head with metal chassis and glowing tubes, placed on top of a speaker cabinet, illuminated by warm stage lighting.','Chassi metálico e válvulas EL34.','Cabeçote valvulado de 100W com canal limpo e drive.','Preto com Detalhes Dourados','#2B2B2B',NULL,6,6200.00,3720.00,'cabecote-amplificador-guitarra-frente.png, cabecote-amplificador-guitarra-frente-sem-fundo.png, cabecote-amplificador-guitarra-verso.png, cabecote-amplificador-guitarra-verso-sem-fundo.png'),(48,'904315','Amplificador de Baixo (Combo)','A bass combo amplifier with a large speaker grille, dark design, photographed in a rehearsal room environment.','Gabinete em madeira laminada, alto-falante de 15\".','Som encorpado, equalizador ativo de 3 bandas.','Preto Texturizado','#000000',NULL,6,4800.00,2880.00,'amplificador-de-baixo-frente.png, amplificador-de-baixo-frente-sem-fundo.png, amplificador-de-baixo-verso.png, amplificador-de-baixo-verso-sem-fundo.png'),(49,'231867','Amplificador de Violão (Acústico)','An acoustic guitar amplifier with wooden panel design, control knobs on top, natural light studio photography.','Painel frontal em madeira e circuito transistorado.','Canal duplo com entrada para microfone e violão.','Madeira Natural','#B8860B',NULL,6,3600.00,2160.00,'amplificador-de-violao-frente.png, amplificador-de-violao-frente-sem-fundo.png, amplificador-de-violao-verso.png, amplificador-de-violao-verso-sem-fundo.png'),(50,'512479','Caixa Acústica (Passiva)','A passive loudspeaker with black grille and metal handles, photographed in a concert setup with stage lights.','Gabinete em MDF com grade metálica e alças laterais.','Suporta até 300W RMS de potência.','Preto Texturizado','#1E1E1E',NULL,6,2100.00,1260.00,'caixa-acustica-passiva-frente.png, caixa-acustica-passiva-frente-sem-fundo.png, caixa-acustica-passiva-verso.png, caixa-acustica-passiva-verso-sem-fundo.png'),(51,'784632','Mesa de Som (Digital)','A digital audio mixing console with touchscreen and illuminated faders, placed in a modern studio under dim light.','Corpo em alumínio escovado e superfície sensível ao toque.','32 canais digitais com efeitos integrados.','Prata Industrial','#D3D3D3',NULL,6,12500.00,7500.00,'mesa-de-som-digital-frente.png, mesa-de-som-digital-frente-sem-fundo.png, mesa-de-som-digital-verso.png, mesa-de-som-digital-verso-sem-fundo.png'),(52,'345971','Microfone Dinâmico (Shure SM58 Style)','A dynamic vocal microphone with metal grille and black body, close-up studio shot, isolated on dark background.','Corpo em alumínio e cápsula dinâmica cardioide.','Ideal para vocais ao vivo e apresentações.','Preto e Prata','#2E2E2E',NULL,6,780.00,468.00,'microfone-dinamico-frente.png, microfone-dinamico-frente-sem-fundo.png, microfone-dinamico-verso.png, microfone-dinamico-verso-sem-fundo.png'),(53,'679124','Microfone Condensador (Estúdio)','A large diaphragm condenser microphone mounted on a shock mount with pop filter, in a professional recording booth.','Corpo metálico prateado com suporte anti-vibração.','Resposta de frequência de 20Hz a 20kHz.','Prateado','#DCDCDC',NULL,6,2100.00,1260.00,'microfone-estudio-frente.png, microfone-estudio-frente-sem-fundo.png, microfone-estudio-verso.png, microfone-estudio-verso-sem-fundo.png'),(54,'912570','Monitor de Áudio (De Referência)','A studio reference monitor speaker with black matte finish, yellow cone, placed on a mixing desk with computer screens.','Gabinete de MDF, tweeter de seda e woofer Kevlar 5”.','Sonorização flat ideal para mixagem.','Preto com Amarelo','#222222',NULL,6,3800.00,2280.00,'monitor-audio-referencia-frente.png, monitor-audio-referencia-frente-sem-fundo.png, monitor-audio-referencia-verso.png, monitor-audio-referencia-verso-sem-fundo.png'),(55,'159804','Monitor de Áudio (De Palco)','A wedge-shaped stage monitor speaker on the floor, photographed in a live concert setting with stage lights and cables.','Gabinete inclinado com revestimento antiderrapante.','Potência de 250W RMS, excelente retorno de palco.','Preto Fosco','#1C1C1C',NULL,6,2950.00,1770.00,'monitor-audio-palco-frente.png, monitor-audio-palco-frente-sem-fundo.png, monitor-audio-palco-verso.png, monitor-audio-palco-verso-sem-fundo.png'),(56,'604823','Interface de Áudio (4+ Canais)','A professional multi-channel audio interface with multiple inputs and outputs, metal rackmount design, illuminated by cool studio light.','Carcaça metálica com conexões balanceadas XLR e TRS.','Compatível com Windows, macOS e Linux.','Prateado','#C0C0C0',NULL,6,4100.00,2460.00,'interface-audio-frente.png, interface-audio-frente-sem-fundo.png, interface-audio-verso.png, interface-audio-verso-sem-verso.png'),(57,'837295','Fones (Over-ear de Estúdio)','Closed-back over-ear studio headphones with coiled cable, photographed on a mixing desk in soft lighting.','Almofadas em couro sintético e drivers de 40mm.','Design confortável para longas sessões.','Preto Fosco','#111111',NULL,6,890.00,534.00,'headset-frente.png, headset-frente-sem-fundo.png, headset-verso.png, headset-verso-sem-fundo.png'),(58,'498731','Fones (In-ear de Palco)','Professional in-ear monitor earphones with transparent housing and cable, photographed on a stage background with subtle light reflections.','Carcaça transparente e cabos removíveis.','Resposta precisa, ideal para músicos ao vivo.','Transparente','#EAEAEA',NULL,6,1250.00,750.00,'fone-ouvido-frente.png, fone-ouvido-frente-sem-fundo.png, fone-ouvido-verso.png, fone-ouvido-verso-sem-fundo.png'),(59,'184523','Cordas Avulsas (Violão Aço / Nylon)','A set of acoustic guitar strings, steel and nylon, neatly packaged with brand label visible, photographed on a wooden table.','Aço niquelado e nylon cristal.','Pacote com 6 cordas, som brilhante e durável.','Prateado e Transparente','#E0E0E0',NULL,7,75.00,45.00,'corda-violao-frente.png, corda-violao-frente-sem-fundo'),(60,'537916','Cordas Avulsas (Guitarra)','Electric guitar string set with colorful ball ends, metallic shine under studio lighting, placed beside a guitar headstock.','Aço inoxidável niquelado.','Calibre 0.10 – som equilibrado e boa resistência.','Metálico','#B0B0B0',NULL,7,80.00,48.00,'corda-guitarra-frente.png, corda-guitarra-frente-sem-fundo.png'),(61,'972184','Cordas Avulsas (Baixo 4c / 5c)','Bass guitar string set with thick nickel wound coils, photographed close-up on a dark textured background.','Aço niquelado com núcleo hexagonal.','Som grave potente e sustain longo.','Prateado','#C0C0C0',NULL,7,120.00,72.00,'corda-baixo-frente.png, corda-baixo-frente-sem-fundo.png'),(62,'405768','Cordas Avulsas (Violino)','Violin string set in elegant packaging, photographed on a wooden violin body in soft natural light.','Aço cromado com alma sintética.','Timbre doce e projeção refinada.','Prateado','#CCCCCC',NULL,7,130.00,78.00,'corda-violino-frente.png, corda-violino-frente-sem-fundo.png'),(63,'619845','Palheta (Nylon)','A close-up of nylon guitar picks in different colors and thicknesses, scattered on a wooden table under soft light.','Nylon flexível e durável.','Pacote com 10 unidades de diferentes espessuras.','Sortido','#AAAAAA',NULL,7,25.00,15.00,'palheta-nylon.png, palheta-nylon-sem-fundo.png'),(64,'826493','Palheta (Tortex)','Colorful tortex guitar picks with matte texture, arranged in a fan pattern on a clean white background.','Tortex antiderrapante.','Pacote com 10 unidades de timbre equilibrado e pegada firme.','Sortido','#D3D3D3',NULL,7,30.00,18.00,'palheta-tortex.png, palheta-tortex-sem-fundo.png'),(65,'540128','Palheta (Jazz)','Small jazz guitar picks with pointed tips, black and red colors, photographed close-up on an amplifier surface.','Nylon rígido com ponta afiada.','Pacote com 10 unidades de design pequeno para precisão máxima.','Preto e Vermelho','#8B0000',NULL,7,35.00,21.00,'palheta-jazz.png, palheta-jazz-sem-fundo.png'),(66,'763910','Capotraste (Violão e Guitarra)','A sleek aluminum guitar capo clipped onto an acoustic guitar neck, photographed with natural lighting.','Alumínio anodizado com mola reforçada.','Ajuste rápido e fixação firme.','Prata Escovado','#C0C0C0',NULL,7,90.00,54.00,'capotraste.png, capotraste-sem-fundo.png'),(67,'231640','Estante (De Partitura)','A foldable black music stand holding sheet music, photographed in a rehearsal room with soft lighting.','Aço leve dobrável com trava de altura.','Altura ajustável e base reforçada.','Preto Fosco','#222222',NULL,7,250.00,150.00,'estande-partitura-frente.png, estande-partitura-frente-sem-fundo.png, estande-partitura-verso.png, estande-partitura-verso-sem-fundo.png'),(68,'658319','Estante (Para Teclado)','A double-X keyboard stand supporting an electronic keyboard, photographed on a stage background.','Aço tubular com ajuste rápido.','Compatível com teclados de até 88 teclas.','Preto Brilhante','#000000',NULL,7,310.00,186.00,'estande-teclado-frente.png, estande-teclado-frente-sem-fundo.png, estande-teclado-verso.png, estande-teclado-verso-sem-fundo.png'),(69,'874590','Pedal de Efeito (Distortion / Overdrive)','Guitar distortion pedal with metal casing and control knobs, glowing LED light, placed on a pedalboard.','Carcaça metálica com potenciômetros duplos.','Som encorpado e quente, estilo vintage.','Laranja Metálico','#FF8C00',NULL,7,520.00,312.00,'pedal-distortion.png, pedal-distorcion-sem-fundo.png'),(70,'982410','Pedal de Efeito (Chorus / Delay)','Chorus and delay guitar pedals with colorful designs and multiple control knobs, photographed in studio lighting.','Metal anodizado com circuito analógico.','Efeitos clássicos para ambiência e modulação.','Azul Claro','#87CEEB',NULL,7,580.00,348.00,'pedal-chorus-delay.png, pedal-chorus-delay-sem-fundo.png'),(71,'490175','Pedal de Efeito (Looper)','Compact looper pedal with record and play buttons, photographed on a pedalboard setup.','Metal com botão de acionamento reforçado.','Grava e reproduz loops em tempo real.','Vermelho','#B22222',NULL,7,640.00,384.00,'pedal-looper.png, pedal-looper-sem-fundo.png'),(72,'304987','Cabo P10 (Instrumento)','Instrument cable with 1/4 inch (P10) jacks, coiled neatly beside an amplifier, photographed with soft shadows.','Fios de cobre com blindagem dupla e conectores niquelados.','Comprimento de 5 metros, baixa interferência.','Preto','#1C1C1C',NULL,7,90.00,54.00,'cabo-p10.png, cabo-p10-sem-fundo.png'),(73,'790246','Cabo XLR (Microfone)','Professional XLR microphone cable with metal connectors, coiled on a studio desk next to a condenser microphone.','Condutor em cobre livre de oxigênio.','Comprimento de 3 metros, ideal para estúdios.','Preto','#000000',NULL,7,110.00,66.00,'cabo-xlr.png, cabo-xlr-sem-fundo.png'),(74,'628354','Suporte (Para Guitarra/Violão)','A-frame guitar stand holding an acoustic guitar, photographed in a cozy music studio setting.','Aço dobrável com proteção em borracha.','Estável e compacto para transporte.','Preto','#1E1E1E',NULL,7,210.00,126.00,'suporte-guitarra.png, suporte-guitarra-sem-fundo.png'),(75,'562893','Suporte (Para Microfone)','Adjustable microphone stand with boom arm, holding a studio microphone, illuminated by soft lighting.','Aço leve com base redonda e braço telescópico.','Ajustável em altura e ângulo.','Preto','#000000',NULL,7,260.00,156.00,'suporte-microfone.png, suporte-microfone-sem-fundo.png'),(76,'981430','Case Rígido (Instrumento)','Hard guitar case made of black leather with metal latches, opened slightly showing plush red interior.','MDF revestido em couro sintético e interior aveludado.','Proteção premium para instrumentos de corda.','Preto com Vermelho','#111111',NULL,7,720.00,432.00,'case-guitarra.png, case-guitarra-sem-fundo.png, case-guitarra-fechada.png, case-guitarra-fechada-sem-fundo.png'),(77,'435219','Bag Soft (Instrumento)','Soft padded gig bag for acoustic guitar with shoulder straps, standing upright on a white background.','Tecido impermeável com alças acolchoadas.','Bolso frontal e reforço traseiro.','Preto','#000000',NULL,7,350.00,210.00,'case-tecido.png, case-tecido-sem-fundo.png, case-tecido-verso.png, case-tecido-verso-sem-fundo.png'),(78,'720158','Afinador Eletrônico (Clip)','Clip-on guitar tuner attached to the headstock, with illuminated display showing tuning note.','Corpo em ABS e visor LCD colorido.','Rotação 360° e alta precisão de leitura.','Preto','#1A1A1A',NULL,7,150.00,90.00,'afinador-clipe.png, afinador-clipe-sem-fundo.png, afinador-clipe-verso.png, afinador-clipe-verso-sem-fundo.png'),(79,'298504','Afinador Eletrônico (Pedal)','Pedal tuner with LED display, placed on a pedalboard among other effects pedals, photographed under stage light.','Metal resistente com visor de LED brilhante.','Bypass silencioso, ideal para shows.','Prata e Azul','#C0C0C0',NULL,7,430.00,258.00,'afinador-pedal.png, afinador-pedal-sem-fundo.png'),(80,'854763','Baquetas (Madeira - Maple/Hickory)','Pair of wooden drumsticks made from maple and hickory, lying on a snare drum surface in a drum kit setup.','Madeira tratada de alta densidade.','Equilíbrio e resposta natural.','Mogno Claro','#CD853F',NULL,7,70.00,42.00,'baqueta-madeira.png, baqueta-madeira-sem-fundo.png'),(81,'187642','Baquetas (Nylon Tip)','Drumsticks with nylon tips resting on cymbals, photographed close-up with warm stage lighting.','Corpo em hickory e ponta em nylon resistente.','Ideal para performances ao vivo e gravações.','Natural e Branco','#EEE8AA',NULL,7,85.00,51.00,'baqueta-nylon.png, baqueta-nylon-sem-fundo.png');
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variacoes_produto`
--

DROP TABLE IF EXISTS `variacoes_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variacoes_produto` (
  `id_variacao` int NOT NULL AUTO_INCREMENT,
  `sku` varchar(6) COLLATE utf8mb4_general_ci NOT NULL,
  `id_produto` int NOT NULL,
  `nome_cor` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `cor` text COLLATE utf8mb4_general_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `custo_producao` decimal(10,2) DEFAULT NULL,
  `desconto` int DEFAULT NULL,
  `imagem` text COLLATE utf8mb4_general_ci,
  `status` enum('Ativo','Inativo') COLLATE utf8mb4_general_ci DEFAULT 'Ativo',
  `data_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_variacao`),
  UNIQUE KEY `sku` (`sku`),
  KEY `fk_var_prod` (`id_produto`),
  CONSTRAINT `fk_var_prod` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variacoes_produto`
--

LOCK TABLES `variacoes_produto` WRITE;
/*!40000 ALTER TABLE `variacoes_produto` DISABLE KEYS */;
INSERT INTO `variacoes_produto` VALUES (97,'384201',1,'Natural Fosco','#d6b08a',950.00,350.00,10,'violao-nylon-fosco-frente.png, violao-nylon-fosco-frente-sem-fundo.png, violao-nylon-fosco-costa.png, violao-nylon-fosco-costa-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(98,'928473',1,'Preto Brilhante','#1a1a1a',950.00,370.00,50,'violao-nylon-preto-frente.png, violao-nylon-preto-frente-sem-fundo.png, violao-nylon-preto-verso.png, violao-nylon-preto-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(99,'572931',2,'Sunburst','#a25a2c',1350.00,420.00,0,'violao-aco-sunburst-frente.png, violao-aco-sunburst-frente-sem-fundo.png, violao-aco-sunburst-verso.png, violao-aco-sunburst-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(100,'148625',2,'Natural Claro','#e1a965',1350.00,400.00,0,'violao-aco-claro-frente.png, violao-aco-claro-frente-sem-fundo.png, violao-aco-claro-verso.png, violao-aco-claro-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(101,'639218',3,'Bege com Escudo Preto','#d5c39e',4200.00,580.00,5,'guitarra-stratocaster-bege-frente.png, guitarra-stratocaster-bege-frente-sem-fundo.png, guitarra-stratocaster-bege-verso.png, guitarra-stratocaster-bege-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(102,'283915',3,'Vermelha Metálica','#b22222',4200.00,590.00,0,'guitarra-stratocaster-vermelha-frente.png, guitarra-stratocaster-vermelha-frente-sem-fundo.png, guitarra-stratocaster-vermelha-verso.png, guitarra-stratocaster-vermelha-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(103,'496307',3,'Azul Vintage','#4682b4',4200.00,590.00,0,'guitarra-stratocaster-azul-frente.png, guitarra-stratocaster-azul-frente-sem-fundo.png, guitarra-stratocaster-azul-verso.png, guitarra-stratocaster-azul-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(104,'801624',4,'Cherry Sunburst','#a03a2b',5600.00,650.00,0,'guitarra-lespaul-sunburst-frente.png, guitarra-lespaul-sunburst-frente-sem-fundo.png, guitarra-lespaul-sunburst-verso.png, guitarra-lespaul-sunburst-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(105,'953710',4,'Gold Top','#d4af37',5600.00,670.00,0,'guitarra-lespaul-gold-frente.png, guitarra-lespaul-gold-frente-sem-fundo.png, guitarra-lespaul-gold-verso.png, guitarra-lespaul-gold-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(106,'390862',6,'Preto Clássico','#0d0d0d',3700.00,510.00,0,'baixo-eletrico-jazz-bass-preto-frente.png, baixo-eletrico-jazz-bass-preto-frente-sem-fundo.png, baixo-eletrico-jazz-bass-preto-verso.png, baixo-eletrico-jazz-bass-preto-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(107,'627839',7,'Branco Vintage','#f8f8f8',3900.00,530.00,0,'baixo-eletrico-precision-bass-branco-frente.png, baixo-eletrico-precision-bass-branco-frente-sem-fundo.png, baixo-eletrico-precision-bass-branco-verso.png, baixo-eletrico-precision-bass-branco-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(108,'512046',7,'Azul Marinho','#001f3f',3900.00,540.00,0,'baixo-eletrico-precision-bass-azul-frente.png, baixo-eletrico-precision-bass-azul-frente-sem-fundo.png, baixo-eletrico-precision-bass-azul-verso.png, baixo-eletrico-precision-bass-azul-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(109,'749320',8,'Natural Polido','#e3b778',1600.00,380.00,0,'viola-caipira-12-cordas-polido-frente.png, viola-caipira-12-cordas-polido-frente-sem-fundo.png, viola-caipira-12-cordas-polido-verso.png, viola-caipira-12-cordas-polido-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(110,'801357',8,'Cerejeira Escura','#8b3a3a',1600.00,390.00,0,'viola-caipira-12-cordas-cerejeira-frente.png, viola-caipira-12-cordas-cerejeira-frente-sem-fundo.png, viola-caipira-12-cordas-cerejeira-verso.png, viola-caipira-12-cordas-cerejeira-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(111,'235891',9,'Madeira Avermelhada','#a0522d',6800.00,460.00,0,'violino-avermelhado-frente.png, violino-avermelhado-frente-sem-fundo.png, violino-avermelhado-verso.png, violino-avermelhado-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(112,'783024',9,'Marrom Escuro','#4b2e05',6800.00,470.00,0,'violino-escuro-frente.png, violino-escuro-frente-sem-fundo.png, violino-escuro-verso.png, violino-escuro-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(113,'986435',10,'Natural Envernizado','#c68642',12500.00,750.00,0,'violoncelo-natural-frente.png, violoncelo-natural-frente-sem-fundo.png, violoncelo-natural-verso.png, violoncelo-natural-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(114,'312759',10,'Cereja Profundo','#6a1b1b',12500.00,760.00,0,'violoncelo-cereja-frente.png, violoncelo-cereja-frente-sem-fundo.png, violoncelo-cereja-verso.png, violoncelo-cereja-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(115,'470128',11,'Madeira Clara','#f5deb3',480.00,220.00,0,'ukulele-madeira-frente.png, ukulele-madeira-frente-sem-fundo.png, ukulele-madeira-verso.png, ukulele-madeira-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(116,'942615',11,'Mogno Escuro','#3b1d0a',480.00,230.00,0,'ukulele-mogno-frente.png, ukulele-mogno-frente-sem-fundo.png, ukulele-mogno-verso.png, ukulele-mogno-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(117,'216903',12,'Natural','#d2a679',1300.00,310.00,0,'banjo-4cordas-natural-frente.png, banjo-4cordas-natural-frente-sem-fundo.png, banjo-4cordas-natural-verso.png, banjo-4cordas-natural-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(118,'509387',13,'Preto Brilhante','#000000',1300.00,320.00,0,'cavaquinho-eletrico-preto-frente.png, cavaquinho-eletrico-preto-frente-sem-fundo.png, cavaquinho-eletrico-preto-verso.png, cavaquinho-eletrico-preto-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(119,'379524',14,'Cinza Titânio','#71797e',3500.00,980.00,0,'bateria-eletrica-cinza-frente.png, bateria-eletrica-cinza-frente-sem-fundo.png, bateria-eletrica-cinza-verso.png, bateria-eletrica-cinza-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(120,'821475',15,'Madeira Clara','#deb887',520.00,240.00,0,'cajon-flamenco-madeira-frente.png, cajon-flamenco-madeira-frente-sem-fundo.png, cajon-flamenco-madeira-verso.png, cajon-flamenco-madeira-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(121,'295239',15,'Nogal Escuro','#5a3a1a',540.00,250.00,0,'cajon-flamenco-nogal-frente.png, cajon-flamenco-nogal-frente-sem-fundo.png, cajon-flamenco-nogal-verso.png, cajon-flamenco-nogal-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(122,'473193',16,'Aro Dourado','#cfae30',420.00,190.00,0,'pandeiro-dourado-frente.png, pandeiro-dourado-frente-sem-fundo.png, pandeiro-dourado-verso.png, pandeiro-dourado-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(123,'849632',16,'Aro Cromado','#c0c0c0',420.00,195.00,0,'pandeiro-cromado-frente.png, padeiro-cromado-frente-sem-fundo.png, pandeiro-cromado-verso.png, pandeiro-cromado-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(124,'133921',17,'Prata','#c0c0c0',250.00,160.00,0,'tamborim-prata-frente.png, tamborim-prata-frente-sem-fundo.png, tamborim-prata-verso.png, tamborim-prata-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(125,'271339',17,'Azul Metálico','#1e3a8a',250.00,170.00,0,'tamborim-azul-frente.png, tamborim-azul-frente-sem-fundo.png, tamborim-azul-verso.png, tamborim-azul-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(126,'504856',18,'Madeira Natural','#b8860b',1600.00,480.00,0,'conga-madeira-frente.png, conga-madeira-frente-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(127,'639442',18,'Vermelho Vinil','#570000',1600.00,490.00,0,'conga-vermelho-frente.png, conga-vermelho-frente-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(128,'811223',19,'Madeira Clara','#d2b48c',1100.00,320.00,0,'bongo-madeira-frente.png, bongo-madeira-frente-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(129,'513958',19,'Marrom Escuro','#4b2e05',1100.00,330.00,0,'bongo-marrom-frente.png, bongo-marrom-frente-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(130,'722326',20,'Alumínio Escovado','#929187',1800.00,410.00,0,'surdo-aluminio-frente.png, surdo-aluminio-frente-sem-fundo.png, surdo-aluminio-verso.png, surdo-aluminio-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(131,'493107',20,'Preto Fosco','#2b2b2b',1800.00,420.00,0,'surdo-preto-frente.png, surdo-preto-frente-sem-fundo.png, surdo-preto-verso.png, surdo-preto-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(132,'239701',21,'Metálico','#ecb520',160.00,80.00,0,'triangulo-metalico-frente.png, triangulo-metalico-frente-sem-fundo.png, triangulo-metalico-verso.png, triangulo-metalico-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(133,'594813',21,'Cromado','#a4a39e',160.00,85.00,0,'triangulo-cromado-frente.png, triangulo-cromado-frente-sem-fundo.png, triangulo-cromado-verso.png, triangulo-cromado-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(134,'371249',22,'Natural Envernizado','#d9a066',890.00,380.00,0,'tantan-envernizado-frente.png, tantan-envernizado-frente-sem-fundo.png, tantan-envernizado-cima.png, tantan-envernizado-cima-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(135,'942810',22,'Cerejeira','#8b3a3a',890.00,385.00,0,'tantan-cerejeira-frente.png, tantan-cerejeira-frente-sem-fundo.png, tantan-cerejeira-cima.png, tantan-cerejeira-cima-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(136,'816432',23,'Natural','#deb887',350.00,110.00,0,'reco-reco-madeira-frente.png, reco-reco-madeira-frente-sem-fundo.png, reco-reco-madeira-cima.png, reco-reco-madeira-cima-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(137,'504297',23,'Madeira Escura','#4e342e',350.00,120.00,0,'reco-reco-escuro-cima.png, reco-reco-escuro-cima-sem-fundo.png, reco-reco-escuro-frente.png, reco-reco-escuro-frente-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(138,'358901',24,'Colorido','#eb3b28',680.00,150.00,0,'xilofone-colorido-frente.png, xilofone-colorido-frente-sem-fundo.png, xilofone-colorido-em-pe.png, xilofone-colorido-em-pe-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(139,'628430',24,'Natural Educacional','#b3c9c6',680.00,160.00,0,'xilofone-educacional-frente.png, xilofone-educacional-frente-sem-fundo.png, xilofone-educacional-verso.png, xilofone-educacional-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(140,'975621',25,'Madeira Escura','#a06b34',5800.00,750.00,0,'marimba-escura-frente.png, marimba-escura-frente-sem-fundo.png, marimba-escura-verso.png, marimba-escura-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(141,'134759',25,'Nogal Premium','#632001',5800.00,780.00,0,'marimba-nogal-frente.png, marimba-nogal-frente-sem-fundo.png, marimba-nogal-verso.png, marimba-nogal-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(142,'341681',27,'Branco Pérola','#f5f5f0',58000.00,2900.00,0,'piano-acustico-cauda-branco-frente.png, piano-acustico-cauda-branco-frente-sem-fundo.png, piano-acustico-cauda-branco-verso.png, piano-acustico-cauda-branco-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(143,'765584',27,'Mogno Envernizado','#4a1f0a',58000.00,2950.00,0,'piano-acustico-cauda-mogno-frente.png, piano-acustico-cauda-mogno-frente-sem-fundo.png, piano-acustico-cauda-mogno-verso.png, piano-acustico-cauda-mogno-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(144,'105372',28,'Nogal Escuro','#3e2723',28500.00,2300.00,0,'piano-acustico-vertical-nogal-frente.png, piano-acustico-vertical-nogal-frente-sem-fundo.png, piano-acustico-vertical-nogal-verso.png, piano-acustico-vertical-nogal-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(145,'982603',28,'Preto Fosco','#1a1a1a',28500.00,2250.00,0,'piano-acustico-vertical-preto-frente.png, piano-acustico-vertical-preto-frente-sem-fundo.png, piano-acustico-vertical-preto-verso.png, piano-acustico-vertical-preto-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(146,'508436',29,'Preto Clássico','#0d0d0d',4200.00,1800.00,0,'piano-digital-portatil-preto-frente.png, piano-digital-portatil-preto-frente-sem-fundo.png, piano-digital-portatil-preto-verso.png, piano-digital-portatil-preto-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(147,'650921',29,'Branco Neve','#f8f8ff',4200.00,1820.00,0,'piano-digital-portatil-branco-frente.png, piano-digital-portatil-branco-frente-sem-fundo.png, piano-digital-portatil-branco-verso.png, piano-digital-portatil-branco-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(148,'289374',30,'Nogal Escuro','#3b2e2a',6400.00,1900.00,0,'piano-digital-movel-nogal-frente.png, piano-digital-movel-nogal-frente-sem-fundo.png, piano-digital-movel-nogal-verso.png, piano-digital-movel-nogal-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(149,'964802',30,'Preto Satin','#2b2b2b',6400.00,1920.00,0,'piano-digital-movel-preto-frente.png, piano-digital-movel-preto-frente-sem-fundo.png, piano-digital-movel-preto-verso.png, piano-digital-movel-preto-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(150,'834721',31,'Preto com Display Azul','#101820',7500.00,2000.00,0,'teclado-arranjador-preto-frente.png, teclado-arranjador-preto-frente-sem-fundo.png, teclado-arranjador-preto-verso.png, teclado-arranjador-preto-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(151,'413580',31,'Cinza Grafite','#545454',7500.00,2050.00,0,'teclado-arranjador-cinza-frente.png, teclado-arranjador-cinza-frente-sem-fundo.png, teclado-arranjador-cinza-verso.png, teclado-arranjador-cinza-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(152,'247690',32,'Preto Compacto','#181818',980.00,900.00,0,'teclado-controlador-midi-preto-frente.png, teclado-controlador-midi-preto-frente-sem-fundo.png, teclado-controlador-midi-preto-verso.png, teclado-controlador-midi-preto-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(153,'958301',32,'Branco Studio','#f3f3f3',980.00,920.00,0,'teclado-controlador-midi-branco-frente.png, teclado-controlador-midi-branco-frente-sem-fundo.png, teclado-controlador-midi-branco-verso.png, teclado-controlador-midi-branco-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(154,'736294',33,'Preto Espacial','#0c0c0c',8900.00,1500.00,0,'sintetizador-digital-preto-frente.png, sintetizador-digital-preto-frente-sem-fundo.png, sintetizador-digital-preto-verso.png, sintetizador-digital-preto-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(155,'182653',33,'Cinza Metálico','#757575',8900.00,1520.00,0,'sintetizador-digital-cinza-frente.png, sintetizador-digital-cinza-frente-sem-fundo.png, sintetizador-digital-cinza-verso.png, sintetizador-digital-cinza-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(156,'394820',33,'Vermelho Studio','#a61b1b',8900.00,1550.00,0,'sintetizador-digital-vermelho-frente.png, sintetizador-digital-vermelho-frente-sem-fundo.png, sintetizador-digital-vermelho-verso.png, sintetizador-digital-vermelho-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(157,'184762',34,'Madeira Clara','#d2b48c',350.00,180.00,0,'flauta-doce-madeira-frente.png, flauta-doce-madeira-frente-sem-fundo.png, flauta-doce-madeira-verso.png, flauta-doce-madeira-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(158,'509347',34,'Ébano Escuro','#2c2c2c',360.00,200.00,0,'flauta-doce-ebano-frente.png, flauta-doce-ebano-frente-sem-fundo.png, flauta-doce-ebano-verso.png, flauta-doce-ebano-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(159,'936124',35,'Prateada','#c0c0c0',2300.00,850.00,0,'flauta-transversal-prata-frente.png, flauta-transversal-prata-frente-sem-fundo.png, flauta-transversal-prata-verso.png, flauta-transversal-prata-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(160,'283619',35,'Dourada Luxo','#d4af37',2500.00,900.00,0,'flauta-transversal-dourado-frente.png, flauta-transversal-dourado-frente-sem-fundo.png, flauta-transversal-dourado-verso.png, flauta-transversal-dourado-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(161,'724819',36,'Lacado Dourado','#ffd700',5100.00,1800.00,0,'saxofone-alto-dourado-frente.png, saxofone-alto-dourado-frente-sem-fundo.png, saxofone-alto-dourado-verso.png, saxofone-alto-dourado-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(162,'512306',36,'Preto Níquel','#2b2b2b',5200.00,1850.00,0,'saxofone-alto-preto-frente.png, saxofone-alto-preto-frente-sem-fundo.png, saxofone-alto-preto-verso.png, saxofone-alto-preto-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(163,'748125',37,'Lacado Dourado','#daa520',3900.00,1500.00,0,'trompete-bb-dourado-frente.png, trompete-bb-dourado-frente-sem-fundo.png, trompete-bb-dourado-verso.png, trompete-bb-dourado-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(164,'514903',37,'Prateado','#dcdcdc',3950.00,1520.00,0,'trompete-bb-prateado-frente.png, trompete-bb-prateado-frente-sem-fundo.png, trompete-bb-prateado-verso.png, trompete-bb-prateado-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(165,'821390',37,'Rose Gold','#b76e79',4100.00,1550.00,0,'trompete-bb-rose-frente.png, trompete-bb-rose-frente-sem-fundo.png, trompete-bb-rose-verso.png, trompete-bb-rose-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(166,'284510',38,'Madeira Negra','#1b1b1b',2800.00,980.00,0,'clarinete-bb-madeira-frente.png, clarinete-bb-madeira-frente-sem-fundo.png, clarinete-bb-madeira-verso.png, clarinete-bb-madeira-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(167,'956201',38,'Ébano Fosco','#3a3a3a',2850.00,990.00,0,'clarinete-bb-ebano-frente.png, clarinete-bb-ebano-frente-sem-fundo.png, clarinete-bb-ebano-verso.png, clarinete-bb-ebano-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(168,'490836',39,'Corpo Metálico Prateado','#b0b0b0',480.00,220.00,0,'gaita-harmonica-prata-frente.png, gaita-harmonica-prata-frente-sem-fundo.png, gaita-harmonica-prata-verso.png, gaita-harmonica-prata-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(169,'703982',39,'Corpo Preto','#101010',490.00,230.00,0,'gaita-harmonica-preto-frente.png, gaita-harmonica-preto-frente-sem-fundo.png, gaita-harmonica-preto-verso.png, gaita-harmonica-preto-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(170,'875624',40,'Madeira Vermelha','#8b3a3a',10200.00,2500.00,0,'fagote-vermelho-frente.png, fagote-vermelho-frente-sem-fundo.png, fagote-vermelho-verso.png, fagote-vermelho-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(171,'312587',40,'Mogno Escuro','#4b2e05',10300.00,2550.00,0,'fagote-mogno-frente.png, fagote-mogno-frente-sem-fundo.png, fagote-mogno-verso.png, fagote-mogno-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(172,'936701',41,'Lacado Dourado','#d4af37',7200.00,1900.00,0,'trompa-dourado-frente.png, trompa-dourado-frente-sem-fundo.png, trompa-dourado-verso.png, trompa-dourado-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(173,'451029',41,'Rose Gold','#b76e79',7400.00,1950.00,0,'trompa-rose-frente.png, trompa-rose-frente-sem-fundo.png, trompa-rose-verso.png, trompa-rose-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(174,'864203',42,'Prateada','#c0c0c0',3400.00,1300.00,0,'corneta-prata-frente.png, corneta-prata-frente-sem-fundo.png, corneta-prata-verso.png, corneta-prata-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(175,'527640',42,'Dourada Tradicional','#daa520',3500.00,1320.00,0,'corneta-dourada-frente.png, corneta-dourada-frente-sem-fundo.png, corneta-dourada-verso.png, corneta-dourada-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(176,'328571',43,'Preto Clássico','#0a0a0a',9600.00,3100.00,0,'acordeon-preto-frente.png, acordeon-preto-frente-sem-fundo.png, acordeon-preto-verso.png, acordeon-preto-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(177,'459732',43,'Vermelho Rubi','#9b111e',9800.00,3200.00,0,'acordeon-vermelho-frente.png, acordeon-vermelho-frente-sem-fundo.png, acordeon-vermelho-verso.png, acordeon-vermelho-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(178,'847921',43,'Branco Pérola','#f8f6f0',9900.00,3250.00,0,'acordeon-branco-frente.png, acordeon-branco-frente-sem-fundo.png, acordeon-branco-verso.png, acordeon-branco-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(179,'176304',44,'Madeira Clara','#deb887',2400.00,850.00,0,'harmonium-madeira-frente.png, harmonium-madeira-frente-sem-fundo.png, harmonium-madeira-verso.png, harmonium-madeira-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(180,'592817',44,'Nogal Escuro','#4e342e',2600.00,880.00,0,'harmonium-nogal-frente.png, harmonium-nogal-frente-sem-fundo.png, harmonium-nogal-verso.png, harmonium-nogal-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(181,'701294',45,'Preto Tradicional','#0f0f0f',5600.00,1450.00,0,'bandoneon-preto-frente.png, bandoneon-preto-frente-sem-fundo.png, bandoneon-preto-verso.png, bandoneon-preto-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(182,'835620',45,'Madeira Envernizada','#5a3a1a',5800.00,1500.00,0,'bandoneon-madeira-frente.png, bandoneon-madeira-frente-sem-fundo.png, bandoneon-madeira-verso.png, bandoneon-madeira-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(183,'591732',46,'Preto Clássico','#0f0f0f',3100.00,1200.00,0,'amplificador-de-guitarra-preto-frente.png, amplificador-de-guitarra-preto-frente-sem-fundo.png, amplificador-de-guitarra-preto-verso.png, amplificador-de-guitarra-preto-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(184,'804529',46,'Creme Vintage','#f3e5ab',3200.00,1250.00,0,'amplificador-de-guitarra-branco-frente.png, amplificador-de-guitarra-branco-frente-sem-fundo.png, amplificador-de-guitarra-branco-verso.png, amplificador-de-guitarra-branco-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(185,'439678',47,'Preto Metálico','#1c1c1c',3400.00,1350.00,0,'cabecote-amplificador-guitarra-preto-frente.png, cabecote-amplificador-guitarra-preto-frente-sem-fundo.png, cabecote-amplificador-guitarra-preto-verso.png, cabecote-amplificador-guitarra-preto-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(186,'273816',47,'Cromado','#b5b5b5',3500.00,1400.00,0,'cabecote-amplificador-guitarra-cromado-frente.png, cabecote-amplificador-guitarra-cromado-frente-sem-fundo.png, cabecote-amplificador-guitarra-cromado-verso.png, cabecote-amplificador-guitarra-cromado-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(187,'957230',48,'Preto','#101010',2800.00,1100.00,0,'amplificador-de-baixo-preto-frente.png, amplificador-de-baixo-preto-frente-sem-fundo.png, amplificador-de-baixo-preto-verso.png, amplificador-de-baixo-preto-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(188,'368524',48,'Cinza Grafite','#484848',2900.00,1150.00,0,'amplificador-de-baixo-cinza-frente.png, amplificador-de-baixo-cinza-frente-sem-fundo.png, amplificador-de-baixo-cinza-verso.png, amplificador-de-baixo-cinza-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(189,'712486',49,'Madeira Clara','#c19a6b',2200.00,950.00,0,'amplificador-de-violao-madeira-frente.png, amplificador-de-violao-madeira-frente-sem-fundo.png, amplificador-de-violao-madeira-verso.png, amplificador-de-violao-madeira-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(190,'143905',49,'Mogno Escuro','#4a2c1d',2300.00,980.00,0,'amplificador-de-violao-mogno-frente.png, amplificador-de-violao-mogno-frente-sem-fundo.png, amplificador-de-violao-mogno-verso.png, amplificador-de-violao-mogno-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(191,'625478',50,'Preta Tradicional','#1a1a1a',1800.00,1050.00,0,'caixa-acustica-passiva-preto-frente.png, caixa-acustica-passiva-preto-frente-sem-fundo.png, caixa-acustica-passiva-preto-verso.png, caixa-acustica-passiva-preto-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(192,'492631',51,'Preto Futurista','#121212',8900.00,2800.00,0,'mesa-de-som-digital-preto-frente.png, mesa-de-som-digital-preto-frente-sem-fundo.png, mesa-de-som-digital-preto-verso.png, mesa-de-som-digital-preto-verso-sem-fundo.png','Ativo','2025-12-03 19:27:49'),(193,'610822',1,'vinho','#230a0a',543.21,123.45,10,'https://placehold.co/500x500','Ativo','2025-12-03 23:12:15'),(195,'424468',3,'qsasa','#452121',123.45,1.11,50,'https://placehold.co/500x500','Ativo','2025-12-03 23:21:02');
/*!40000 ALTER TABLE `variacoes_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venda` (
  `id_venda` int NOT NULL AUTO_INCREMENT,
  `id_franquia` int NOT NULL,
  `id_funcionario` int NOT NULL,
  `id_sessao_caixa` int NOT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  `parcelamento` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lucro` decimal(10,2) DEFAULT NULL,
  `desconto` decimal(10,2) DEFAULT NULL,
  `id_pagamento` int NOT NULL,
  `status` enum('Aberta','Paga','Cancelada') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Paga',
  `data_venda` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_venda`),
  KEY `fk_venda_franquia` (`id_franquia`),
  KEY `fk_venda_func` (`id_funcionario`),
  KEY `fk_venda_sessao` (`id_sessao_caixa`),
  KEY `fk_venda_pagto` (`id_pagamento`),
  CONSTRAINT `fk_venda_franquia` FOREIGN KEY (`id_franquia`) REFERENCES `franquias` (`id_franquia`),
  CONSTRAINT `fk_venda_func` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_registro`),
  CONSTRAINT `fk_venda_pagto` FOREIGN KEY (`id_pagamento`) REFERENCES `formaspagamentos` (`id_pagamento`),
  CONSTRAINT `fk_venda_sessao` FOREIGN KEY (`id_sessao_caixa`) REFERENCES `caixas` (`id_sessao_caixa`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` VALUES (1,2,26,2,1220.00,NULL,488.00,0.00,1,'Paga','2025-12-01 13:09:19'),(2,2,26,2,8590.00,NULL,3124.00,0.00,1,'Paga','2025-12-01 13:09:48'),(3,2,26,2,11850.00,'1x de R$ 11.850,00',7942.00,0.00,2,'Paga','2025-12-01 13:10:12'),(4,2,26,3,2280.00,NULL,912.00,0.00,1,'Paga','2025-12-02 01:18:54'),(5,2,26,8,1350.00,'6x de R$ 225,00',513.00,0.00,2,'Paga','2025-12-03 19:01:32'),(6,2,26,11,2735.00,NULL,1335.00,1045.00,1,'Paga','2025-12-04 16:09:52'),(7,2,26,11,2735.00,'3x de R$ 911,00',1268.25,1045.00,2,'Paga','2025-12-04 16:13:35'),(8,2,26,11,2735.00,'4x de R$ 683,00',1268.25,1045.00,2,'Paga','2025-12-04 16:19:42'),(9,2,26,11,2735.00,'1x de R$ 2.735,00',1268.25,1045.00,2,'Paga','2025-12-04 16:21:36');
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda_cupom`
--

DROP TABLE IF EXISTS `venda_cupom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venda_cupom` (
  `id_venda` int NOT NULL,
  `id_cupom` int NOT NULL,
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

-- Dump completed on 2025-12-04 19:42:27
