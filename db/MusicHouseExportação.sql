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

drop database if exists `musicHouse`;
CREATE DATABASE IF NOT EXISTS `musicHouse`;
USE `musicHouse`;

--

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caixas`
--

LOCK TABLES `caixas` WRITE;
/*!40000 ALTER TABLE `caixas` DISABLE KEYS */;
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
  `data_vencimento` date NOT NULL,
  `data_pagamento` date DEFAULT NULL,
  `status` enum('Paga','Pendente','Atrasada') NOT NULL,
  `id_fornecedor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_despesa`),
  KEY `id_franquia` (`id_franquia`),
  KEY `id_fornecedor` (`id_fornecedor`),
  CONSTRAINT `despesas_ibfk_1` FOREIGN KEY (`id_franquia`) REFERENCES `franquias` (`id_franquia`),
  CONSTRAINT `despesas_ibfk_2` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedores` (`id_fornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `despesas`
--

LOCK TABLES `despesas` WRITE;
/*!40000 ALTER TABLE `despesas` DISABLE KEYS */;
INSERT INTO `despesas` VALUES (1,2,'Aluguel','Aluguel mensal da loja',8500.00,'2025-11-05','2025-11-05','Paga',NULL),(2,2,'Energia','Conta de energia elétrica – Enel',1290.50,'2025-11-10',NULL,'Pendente',NULL),(3,2,'Água','Conta de água – Sabesp',230.90,'2025-11-12','2025-11-13','Paga',NULL),(4,2,'Internet','Plano empresarial 500mbps – Vivo',199.99,'2025-11-15',NULL,'Pendente',NULL),(5,2,'Limpeza','Compra de desinfetantes, panos e álcool 70%',320.00,'2025-11-06','2025-11-06','Paga',8),(6,2,'Embalagens','Reabastecimento de sacolas e caixas',780.00,'2025-11-08',NULL,'Pendente',6),(7,2,'Escritório','Papel A4, toners e canetas',455.70,'2025-11-09','2025-11-10','Paga',4),(8,2,'Manutenção','Troca de luminárias e revisão elétrica',620.00,'2025-11-03',NULL,'Atrasada',7),(9,2,'Suprimentos','Reposição de materiais diversos para rotina da loja',540.50,'2025-11-07',NULL,'Atrasada',1),(10,2,'Higiene','Sabonete líquido, papel toalha e rolos de papel',198.90,'2025-11-10','2025-11-10','Paga',3),(11,2,'Tecnologia','Assinatura de sistema e manutenção de computadores',410.00,'2025-11-14',NULL,'Pendente',10),(12,2,'Serviços','Consultoria administrativa mensal',950.00,'2025-11-05',NULL,'Atrasada',9);
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
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (1,2,'134682',100,10),(2,2,'142693',100,10),(3,2,'149872',100,10),(4,2,'152937',100,10),(5,2,'159804',100,10),(6,2,'179632',100,10),(7,2,'184523',100,10),(8,2,'187642',100,10),(9,2,'204718',100,10),(10,2,'231640',100,10),(11,2,'231867',100,10),(12,2,'235781',100,10),(13,2,'245786',100,10),(14,2,'260498',100,10),(15,2,'270319',100,10),(16,2,'278965',100,10),(17,2,'298504',100,10),(18,2,'304987',100,10),(19,2,'305478',100,10),(20,2,'312654',100,10),(21,2,'345971',100,10),(22,2,'362094',100,10),(23,2,'378902',100,10),(24,2,'379826',100,10),(25,2,'405768',100,10),(26,2,'435219',100,10),(27,2,'438915',100,10),(28,2,'481279',100,10),(29,2,'489072',100,10),(30,2,'490175',100,10),(31,2,'493725',100,10),(32,2,'498320',100,10),(33,2,'498731',100,10),(34,2,'512479',100,10),(35,2,'519843',100,10),(36,2,'521394',100,10),(37,2,'528903',100,10),(38,2,'537916',100,10),(39,2,'540128',100,10),(40,2,'562893',100,10),(41,2,'582971',100,10),(42,2,'587420',100,10),(43,2,'604823',100,10),(44,2,'612489',100,10),(45,2,'619845',100,10),(46,2,'619874',100,10),(47,2,'624981',100,10),(48,2,'628354',100,10),(49,2,'658304',100,10),(50,2,'658319',100,10),(51,2,'679124',100,10),(52,2,'689431',100,10),(53,2,'713625',100,10),(54,2,'720158',100,10),(55,2,'739160',100,10),(56,2,'761084',100,10),(57,2,'763201',100,10),(58,2,'763910',100,10),(59,2,'784632',100,10),(60,2,'790246',100,10),(61,2,'820491',100,10),(62,2,'826493',100,10),(63,2,'831276',100,10),(64,2,'835207',100,10),(65,2,'837295',100,10),(66,2,'843965',100,10),(67,2,'854763',100,10),(68,2,'874590',100,10),(69,2,'897324',100,10),(70,2,'904315',100,10),(71,2,'912570',100,10),(72,2,'920516',100,10),(73,2,'921543',100,10),(74,2,'924518',100,10),(75,2,'967540',100,10),(76,2,'972184',100,10),(77,2,'981430',100,10),(78,2,'982310',100,10),(79,2,'982410',100,10),(80,2,'982431',100,10),(81,2,'987130',100,10),(82,2,'105372',100,10),(83,2,'121709',100,10),(84,2,'133921',100,10),(85,2,'134759',100,10),(86,2,'138920',100,10),(87,2,'143905',100,10),(88,2,'148625',100,10),(89,2,'176304',100,10),(90,2,'182653',100,10),(91,2,'184762',100,10),(92,2,'189232',100,10),(93,2,'216903',100,10),(94,2,'235891',100,10),(95,2,'239401',100,10),(96,2,'239701',100,10),(97,2,'247690',100,10),(98,2,'271339',100,10),(99,2,'273816',100,10),(100,2,'275639',100,10),(101,2,'283619',100,10),(102,2,'283915',100,10),(103,2,'284510',100,10),(104,2,'289374',100,10),(105,2,'295038',100,10),(106,2,'295239',100,10),(107,2,'312587',100,10),(108,2,'312759',100,10),(109,2,'328571',100,10),(110,2,'341681',100,10),(111,2,'350921',100,10),(112,2,'358901',100,10),(113,2,'368524',100,10),(114,2,'371249',100,10),(115,2,'379524',100,10),(116,2,'379529',100,10),(117,2,'384201',100,10),(118,2,'390862',100,10),(119,2,'394820',100,10),(120,2,'413580',100,10),(121,2,'439678',100,10),(122,2,'451029',100,10),(123,2,'459732',100,10),(124,2,'470128',100,10),(125,2,'472095',100,10),(126,2,'473092',100,10),(127,2,'473193',100,10),(128,2,'490836',100,10),(129,2,'492108',100,10),(130,2,'492631',100,10),(131,2,'493107',100,10),(132,2,'496307',100,10),(133,2,'503207',100,10),(134,2,'504297',100,10),(135,2,'504856',100,10),(136,2,'508436',100,10),(137,2,'509347',100,10),(138,2,'509387',100,10),(139,2,'512046',100,10),(140,2,'512306',100,10),(141,2,'512968',100,10),(142,2,'513958',100,10),(143,2,'514826',100,10),(144,2,'514903',100,10),(145,2,'527640',100,10),(146,2,'544810',100,10),(147,2,'572931',100,10),(148,2,'591732',100,10),(149,2,'592817',100,10),(150,2,'594813',100,10),(151,2,'602158',100,10),(152,2,'602350',100,10),(153,2,'609472',100,10),(154,2,'625478',100,10),(155,2,'626400',100,10),(156,2,'627839',100,10),(157,2,'628430',100,10),(158,2,'639218',100,10),(159,2,'639442',100,10),(160,2,'650921',100,10),(161,2,'682200',100,10),(162,2,'701294',100,10),(163,2,'703982',100,10),(164,2,'712486',100,10),(165,2,'722326',100,10),(166,2,'724819',100,10),(167,2,'736294',100,10),(168,2,'748125',100,10),(169,2,'749320',100,10),(170,2,'765584',100,10),(171,2,'782356',100,10),(172,2,'783024',100,10),(173,2,'801357',100,10),(174,2,'801624',100,10),(175,2,'804529',100,10),(176,2,'806332',100,10),(177,2,'809631',100,10),(178,2,'811223',100,10),(179,2,'816432',100,10),(180,2,'821390',100,10),(181,2,'821470',100,10),(182,2,'821475',100,10),(183,2,'834721',100,10),(184,2,'835620',100,10),(185,2,'841273',100,10),(186,2,'847921',100,10),(187,2,'849632',100,10),(188,2,'864203',100,10),(189,2,'875624',100,10),(190,2,'879312',100,10),(191,2,'905621',100,10),(192,2,'928473',100,10),(193,2,'936124',100,10),(194,2,'936701',100,10),(195,2,'942615',100,10),(196,2,'942810',100,10),(197,2,'952010',100,10),(198,2,'953710',100,10),(199,2,'956201',100,10),(200,2,'957230',100,10),(201,2,'958301',100,10),(202,2,'964802',100,10),(203,2,'971242',100,10),(204,2,'975621',100,10),(205,2,'982603',100,10),(206,2,'986435',100,10);
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
  `cnpj` char(14) NOT NULL,
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
INSERT INTO `fornecedores` VALUES (1,'MaxiSupply Distribuidora de Materiais','12345678000191','contato@maxisupply.com.br','Av. do Estado, 4500 - São Paulo - SP','2025-11-27 02:00:50'),(2,'BravaPapéis Indústria e Comércio','98765432000188','vendas@bravapapeis.com.br','Rua Coronel Mendes, 210 - Curitiba - PR','2025-11-27 02:00:50'),(3,'Higibras Produtos de Limpeza','11223344000155','comercial@higibras.com.br','Av. Independência, 980 - Porto Alegre - RS','2025-11-27 02:00:50'),(4,'OfficePrime Materiais de Escritório','55667788000199','suporte@officeprime.com.br','Rua Sete de Abril, 112 - São Paulo - SP','2025-11-27 02:00:50'),(5,'FortSteel Ferragens & Construção','10293847560123','vendas@fortsteel.com.br','Av. Brasil, 5500 - Rio de Janeiro - RJ','2025-11-27 02:00:50'),(6,'EcoPack Embalagens Sustentáveis','99887766000144','contato@ecopack.com.br','Rua das Orquídeas, 890 - Campinas - SP','2025-11-27 02:00:50'),(7,'LumiTech Iluminação e Elétrica','33445566000122','suporte@lumitech.com.br','Av. João Pessoa, 1244 - Recife - PE','2025-11-27 02:00:50'),(8,'UltraClean Higiene Profissional','44556677000133','comercial@ultraclean.com.br','Rua Dom Pedro II, 77 - Salvador - BA','2025-11-27 02:00:50'),(9,'MasterOffice Soluções Corporativas','66778899000111','contato@masteroffice.com.br','Av. Goiás, 310 - Goiânia - GO','2025-11-27 02:00:50'),(10,'BrasilTech Equipamentos de TI','77889911000166','vendas@brasiltech.com.br','Rua Projetada 40, 181 - Belo Horizonte - MG','2025-11-27 02:00:50');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `franquias`
--

LOCK TABLES `franquias` WRITE;
/*!40000 ALTER TABLE `franquias` DISABLE KEYS */;
INSERT INTO `franquias` VALUES (1,'01000-000','Av. Paulista, 1000 - Bela Vista','São Paulo - SP','sp@musichouse.com.br','(11) 98888-1000','Ativo','2025-11-27 02:00:43','2025-11-27 02:00:43'),(2,'20040-020','Rua das Laranjeiras, 315 - Flamengo','Rio de Janeiro - RJ','rj@musichouse.com.br','(21) 97777-2000','Ativo','2025-11-27 02:00:47','2025-11-27 02:00:47'),(3,'30130-970','Av. Afonso Pena, 1500 - Centro','Belo Horizonte - MG','bh@musichouse.com.br','(31) 98888-3000','Ativo','2025-11-27 02:00:47','2025-11-27 02:00:47'),(4,'40015-000','Rua Chile, 25 - Comércio','Salvador - BA','ssa@musichouse.com.br','(71) 98888-4000','Ativo','2025-11-27 02:00:47','2025-11-27 02:00:47'),(5,'80010-100','Rua XV de Novembro, 400 - Centro','Curitiba - PR','ctb@musichouse.com.br','(41) 97777-5000','Ativo','2025-11-27 02:00:47','2025-11-27 02:00:47'),(6,'69005-070','Av. Eduardo Ribeiro, 900 - Centro','Manaus - AM','mao@musichouse.com.br','(92) 98888-6000','Ativo','2025-11-27 02:00:47','2025-11-27 02:00:47'),(7,'64001-010','Av. Frei Serafim, 222 - Centro','Teresina - PI','the@musichouse.com.br','(86) 98888-7000','Ativo','2025-11-27 02:00:47','2025-11-27 02:00:47'),(8,'72000-000','SCS Quadra 2, Bloco D - Asa Sul','Brasília - DF','bsb@musichouse.com.br','(61) 98888-8000','Ativo','2025-11-27 02:00:47','2025-11-27 02:00:47'),(9,'90010-120','Av. Borges de Medeiros, 750 - Centro','Porto Alegre - RS','poa@musichouse.com.br','(51) 98888-9000','Ativo','2025-11-27 02:00:47','2025-11-27 02:00:47'),(10,'58010-101','Av. Epitácio Pessoa, 400 - Tambiá','João Pessoa - PB','jpa@musichouse.com.br','(83) 98888-1010','Ativo','2025-11-27 02:00:47','2025-11-27 02:00:47');
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
INSERT INTO `funcionarios` VALUES (1,'Marcos Almeida','11111111111','SP-123456','1985-03-12','Masculino','Casado','marcos.almeida@musichouse.com.br','(11) 98888-1101',1,1,'/funcionarios/marcos-almeida.png',NULL,NULL,NULL,'admin2024',1,'Ativo','2025-11-27 02:01:10','2025-11-27 02:01:10'),(2,'Carla Menezes','11111111112','DF-765432','1988-07-25','Feminino','Solteiro','carla.menezes@musichouse.com.br','(61) 98888-1102',8,1,'/funcionarios/carla-menezes.png',NULL,NULL,NULL,'admin2024',1,'Ativo','2025-11-27 02:01:10','2025-11-27 02:01:10'),(3,'João da Silva','11111111113','SP-234567','1990-01-01','Masculino','Solteiro','joao.silva.sp@musichouse.com.br','(11) 98888-2001',1,2,'/funcionarios/joao-silva-sp.png',NULL,NULL,NULL,'loja2024',1,'Ativo','2025-11-27 02:01:10','2025-11-27 02:01:10'),(4,'Ana Beatriz Rocha','11111111114','RJ-345678','1992-05-18','Feminino','Casado','ana.rocha.rj@musichouse.com.br','(21) 97777-2002',2,2,'/funcionarios/ana-rocha-rj.png',NULL,NULL,NULL,'loja2024',1,'Ativo','2025-11-27 02:01:10','2025-11-27 02:01:10'),(5,'Lucas Pereira','11111111115','MG-456789','1989-11-09','Masculino','Solteiro','lucas.pereira.bh@musichouse.com.br','(31) 98888-2003',3,2,'/funcionarios/lucas-pereira-bh.png',NULL,NULL,NULL,'loja2024',1,'Ativo','2025-11-27 02:01:10','2025-11-27 02:01:10'),(6,'Fernanda Carvalho','11111111116','BA-567890','1991-02-27','Feminino','Casado','fernanda.carvalho.ssa@musichouse.com.br','(71) 98888-2004',4,2,'/funcionarios/fernanda-carvalho-ssa.png',NULL,NULL,NULL,'loja2024',1,'Ativo','2025-11-27 02:01:10','2025-11-27 02:01:10'),(7,'Rafael Monteiro','11111111117','PR-678901','1987-08-03','Masculino','Casado','rafael.monteiro.ctb@musichouse.com.br','(41) 97777-2005',5,2,'/funcionarios/rafael-monteiro-ctb.png',NULL,NULL,NULL,'loja2024',1,'Ativo','2025-11-27 02:01:10','2025-11-27 02:01:10'),(8,'Patrícia Nogueira','11111111118','AM-789012','1993-04-14','Feminino','Solteiro','patricia.nogueira.mao@musichouse.com.br','(92) 98888-2006',6,2,'/funcionarios/patricia-nogueira-mao.png',NULL,NULL,NULL,'loja2024',1,'Ativo','2025-11-27 02:01:10','2025-11-27 02:01:10'),(9,'Gustavo Lima','11111111119','PI-890123','1986-09-21','Masculino','Casado','gustavo.lima.the@musichouse.com.br','(86) 98888-2007',7,2,'/funcionarios/gustavo-lima-the.png',NULL,NULL,NULL,'loja2024',1,'Ativo','2025-11-27 02:01:10','2025-11-27 02:01:10'),(10,'Mariana Duarte','11111111120','DF-901234','1994-12-30','Feminino','Solteiro','mariana.duarte.bsb@musichouse.com.br','(61) 98888-2008',8,2,'/funcionarios/mariana-duarte-bsb.png',NULL,NULL,NULL,'loja2024',1,'Ativo','2025-11-27 02:01:10','2025-11-27 02:01:10'),(11,'Thiago Souza','11111111121','RS-012345','1988-10-05','Masculino','Casado','thiago.souza.poa@musichouse.com.br','(51) 98888-2009',9,2,'/funcionarios/thiago-souza-poa.png',NULL,NULL,NULL,'loja2024',1,'Ativo','2025-11-27 02:01:10','2025-11-27 02:01:10'),(12,'Bruna Oliveira','11111111122','PB-123450','1995-06-17','Feminino','Solteiro','bruna.oliveira.jpa@musichouse.com.br','(83) 98888-2010',10,2,'/funcionarios/bruna-oliveira-jpa.png',NULL,NULL,NULL,'loja2024',1,'Ativo','2025-11-27 02:01:10','2025-11-27 02:01:10'),(13,'Felipe Andrade','11111111124','SP-777888','1998-01-22','Masculino','Solteiro','felipe.andrade@musichouse.com.br','(11) 97777-3001',1,3,'/funcionarios/felipe-andrade.png',NULL,NULL,NULL,'123456',1,'Ativo','2025-11-27 02:01:10','2025-11-27 02:01:10'),(14,'Letícia Moraes','11111111125','RJ-888999','1999-07-11','Feminino','Solteiro','leticia.moraes@musichouse.com.br','(21) 97777-3002',2,3,'/funcionarios/leticia-moraes.png',NULL,NULL,NULL,'123456',1,'Ativo','2025-11-27 02:01:10','2025-11-27 02:01:10'),(15,'Bruno Costa','11111111126','MG-999000','1997-05-29','Masculino','Solteiro','bruno.costa@musichouse.com.br','(31) 97777-3003',3,3,'/funcionarios/bruno-costa.png',NULL,NULL,NULL,'123456',1,'Ativo','2025-11-27 02:01:10','2025-11-27 02:01:10'),(16,'Camila Ribeiro','11111111127','BA-101112','1996-09-19','Feminino','Solteiro','camila.ribeiro@musichouse.com.br','(71) 97777-3004',4,3,'/funcionarios/camila-ribeiro.png',NULL,NULL,NULL,'123456',1,'Ativo','2025-11-27 02:01:10','2025-11-27 02:01:10'),(17,'Diego Martins','11111111128','PR-121314','1994-02-10','Masculino','Casado','diego.martins@musichouse.com.br','(41) 97777-3005',5,3,'/funcionarios/diego-martins.png',NULL,NULL,NULL,'123456',1,'Ativo','2025-11-27 02:01:10','2025-11-27 02:01:10'),(18,'Isabela Farias','11111111129','AM-141516','1995-11-03','Feminino','Solteiro','isabela.farias@musichouse.com.br','(92) 97777-3006',6,3,'/funcionarios/isabela-farias.png',NULL,NULL,NULL,'123456',1,'Ativo','2025-11-27 02:01:10','2025-11-27 02:01:10'),(19,'Rogério Tavares','11111111130','PI-161718','1993-08-14','Masculino','Casado','rogerio.tavares@musichouse.com.br','(86) 97777-3007',7,3,'/funcionarios/rogerio-tavares.png',NULL,NULL,NULL,'123456',1,'Ativo','2025-11-27 02:01:10','2025-11-27 02:01:10'),(20,'Nicole Santos','11111111131','DF-181920','1998-04-09','Feminino','Solteiro','nicole.santos@musichouse.com.br','(61) 97777-3008',8,3,'/funcionarios/nicole-santos.png',NULL,NULL,NULL,'123456',1,'Ativo','2025-11-27 02:01:10','2025-11-27 02:01:10'),(21,'André Luiz','11111111132','RS-202122','1992-12-01','Masculino','Casado','andre.luiz@musichouse.com.br','(51) 97777-3009',9,3,'/funcionarios/andre-luiz.png',NULL,NULL,NULL,'123456',1,'Ativo','2025-11-27 02:01:10','2025-11-27 02:01:10'),(22,'Paula Mendes','11111111133','PB-222324','1997-06-06','Feminino','Solteiro','paula.mendes@musichouse.com.br','(83) 97777-3010',10,3,'/funcionarios/paula-mendes.png',NULL,NULL,NULL,'123456',1,'Ativo','2025-11-27 02:01:10','2025-11-27 02:01:10'),(23,'Arthur Buscarino Benedetti','12345678','000000000','2007-07-11','Masculino','Solteiro','arthurbuscarinobenedetti8@gmail.com','11999215191',2,2,NULL,NULL,NULL,NULL,'$2b$10$GHk/4uijqaDbHs1xowm9hukkYKGqXdLj656yOjvwuz4Gbiqmgfe0O',0,'Ativo','2025-11-27 02:01:54','2025-11-27 02:04:23'),(24,'Giovanni Buscarino Benedetti','12345678','000000000','2007-07-11','Masculino','Solteiro','gbuscarinobenedetti@gmail.com','11999215191',1,1,NULL,NULL,NULL,NULL,'$2b$10$cuORPsLzM3zHq1jQZamn5ukqLGOF2O4XvO/0YOF4s9TIZL6QkpiXG',0,'Ativo','2025-11-27 02:05:51','2025-11-27 02:06:38');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_venda`
--

LOCK TABLES `item_venda` WRITE;
/*!40000 ALTER TABLE `item_venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_venda` ENABLE KEYS */;
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
INSERT INTO `produtos` VALUES (1,'521394','Violão Clássico (Nylon)','A classical wooden acoustic guitar with nylon strings, natural finish, warm studio lighting, professional product photo.','Tampo em spruce, laterais e fundo em mogno.','Violão de estudo com timbre suave e confortável.','Natural','#b35201',NULL,1,950.00,570.00,'violao-nylon-frente.png, violao-nylon-frente-sem-fundo.png, violao-nylon-verso.png, violao-nylon-verso-sem-fundo.png'),(2,'713625','Violão Aço (Folk)','A steel-string acoustic folk guitar with a large body and glossy wood finish, photographed on a neutral background with soft lighting.','Corpo em rosewood e tampo em spruce.','Som brilhante, ideal para palco e gravação.','Natural Brilhante','#C49A6C',NULL,1,1350.00,810.00,'violao-aco-frente.png, violao-aco-frente-sem-fundo.png, violao-aco-verso.png, violao-aco-verso-sem-fundo.png'),(3,'438915','Guitarra Stratocaster','An electric Stratocaster guitar with a white body and black pickguard, modern lighting, high-quality studio image.','Corpo em alder, braço em maple.','Três captadores single coil e chave seletora de 5 posições.','Branco','#FFFFFF',NULL,1,4200.00,2520.00,'guitarra-stratocaster-frente.png, guitarra-stratocaster-frente-sem-fundo.png, guitarra-stratocaster-verso.png, guitarra-stratocaster-verso-sem-fundo.png'),(4,'820491','Guitarra Les Paul','A Les Paul style electric guitar with a flame maple top, amber color, gold hardware, and dramatic dark background lighting.','Top em maple flame, corpo em mogno.','Dois captadores humbucker e ponte Tune-o-Matic.','Amber Flame','#D2691E',NULL,1,5600.00,3360.00,'guitarra-lespaul-frente.png, guitarra-lespaul-frente-sem-fundo.png, guitarra-lespaul-verso.png, guitarra-lespaul-verso-sem-fundo.png'),(5,'179632','Baixo Acústico (Baixolão) 4 Cordas','A four-string acoustic bass guitar with a large wooden body, natural matte finish, displayed on a wooden floor with studio lighting.','Tampo em spruce, corpo em mogno.','Captação ativa e braço confortável.','Natural Fosco','#ac6a23',NULL,1,2100.00,1260.00,'baixolao-frente.png, baixolao-frente-sem-fundo.png, baixolao-verso.png, baixolao-verso-sem-fundo.png'),(6,'493725','Baixo Elétrico Jazz Bass','A Jazz Bass electric guitar with sunburst finish, two pickups, chrome hardware, and studio lighting.','Corpo em alder, braço em maple.','Dois captadores single coil, timbre vintage.','Sunburst','#8B4513',NULL,1,3700.00,2220.00,'baixo-eletrico-jazz-bass-frente.png, baixo-eletrico-jazz-bass-frente-sem-fundo.png, baixo-eletrico-jazz-bass-verso.png, baixo-eletrico-jazz-bass-verso-sem-fundo.png'),(7,'260498','Baixo Elétrico Precision Bass','A Precision Bass electric guitar with black body, maple neck, vintage look, photographed on dark background.','Corpo em alder, braço maple e captador split coil.','Design clássico e som encorpado.','Preto','#111111',NULL,1,3900.00,2340.00,'baixo-eletrico-precision-bass-frente.png, baixo-eletrico-precision-bass-frente-sem-fundo.png, baixo-eletrico-precision-bass-verso.png, baixo-eletrico-precision-bass-verso-sem-fundo.png'),(8,'619874','Viola Caipira 12 Cordas','A modern 12-string Brazilian viola caipira, polished wood finish, studio lighting, front-facing product photo.','Corpo em mogno e tampo em spruce.','Braço reforçado, timbre cristalino.','Natural Polido','#D2A679',NULL,1,1600.00,960.00,'viola-caipira-12-cordas-frente.png, viola-caipira-12-cordas-frente-sem-fundo.png, viola-caipira-12-cordas-verso.png, viola-caipira-12-cordas-verso-sem-fundo.png'),(9,'982310','Violino Profissional','A professional violin with dark varnish, fine wood texture, and elegant studio lighting for concert presentation.','Madeira maple flame e ébano.','Cordas de aço e arco em crina natural.','Vermelho Escuro','#8B0000',NULL,1,6800.00,4080.00,'violino-frente.png, violino-frente-sem-fundo.png, violino-verso.png, violino-verso-sem-fundo.png'),(10,'312654','Violoncelo Profissional','A professional concert cello with dark polished wood, elegant shape, under soft spotlight on stage.','Corpo em maple europeu.','Som encorpado e sustentado.','Vermelho Mogno','#8B4513',NULL,1,12500.00,7500.00,'violoncelo-profissional-frente.png, violoncelo-profissional-frente-sem-fundo.png, violoncelo-profissional-verso.png, violoncelo-profissional-verso-sem-fundo.png'),(11,'897324','Ukulele Soprano','A small soprano ukulele with light wood finish, tropical vibe, photographed on beige background with warm light.','Corpo em mahogany e tampo spruce.','Som suave e portátil.','Natural Claro','#E6BE8A',NULL,1,480.00,288.00,'ukulele-soprano-frente.png, ukulele-soprano-frente-sem-fundo.png, ukulele-soprano-verso.png, ukulele-soprano-verso-sem-fundo.png'),(12,'235781','Banjo 4 Cordas','A 4-string traditional banjo with metallic rim and wooden neck, retro look, natural lighting.','Aros em alumínio e braço em maple.','Som brilhante e percussivo.','Natural com Metal','#C0C0C0',NULL,1,1450.00,870.00,'banjo-4-cordas-frente.png, banjo-4-cordas-frente-sem-fundo.png, banjo-4-cordas-verso.png, banjo-4-cordas-verso-sem-fundo.png'),(13,'519843','Cavaquinho Elétrico','An electric cavaquinho with solid body, embedded pickups, modern lighting on dark studio background.','Corpo sólido em mogno e captação ativa.','Design moderno, ideal para palco.','Bege Claro','#e0b362',NULL,1,1300.00,780.00,'cavaquinho-eletrico-frente.png, cavaquinho-eletrico-frente-sem-fundo.png, cavaquinho-eletrico-verso.png, cavaquinho-eletrico-verso-sem-fundo.png'),(14,'624981','Bateria Eletrônica Profissional (Pads de Mesh)','A professional electronic drum kit with mesh pads, large display module, black finish, photographed in a recording studio.','Estrutura em aço e pads com malha dupla.','Módulo digital com 700 sons e conectividade USB/MIDI.','Preto Fosco','#111111',NULL,2,9800.00,5880.00,'bateria-eletrica-frente.png, bateria-eletrica-frente-sem-fundo.png, bateria-eletrica-verso.png, bateria-eletrica-verso-sem-fundo.png'),(15,'835207','Cajón Flamenco','A flamenco cajón made of polished wood, front striking surface, placed on a wooden floor with warm lighting.','Madeira compensada de bétula e painel frontal em mogno.','Timbre definido para palmas e graves encorpados.','Natural Polido','#D2B48C',NULL,2,890.00,534.00,'cajon-flamenco-frente.png, cajon-flamenco-frente-sem-fundo.png, cajon-flamenco-verso.png, cajon-flamenco-verso-sem-fundo.png'),(16,'921543','Pandeiro Couro','A leather-headed pandeiro with brass jingles, handcrafted style, rustic lighting on wooden surface.','Aros de madeira e platinelas de latão.','Membrana de couro natural, 10 polegadas.','Natural','#E6BE8A',NULL,2,450.00,270.00,'pandeiro-couro-frente.png, pandeiro-couro-frente-sem-fundo.png, pandeiro-couro-verso-sem-fundo.png, pandeiro-couro-verso-sem-fundo.png'),(17,'763201','Tamborim Tradicional','A traditional samba tamborim with nylon head, metal rim, placed on a percussion table under studio lighting.','Aro de alumínio e pele de nylon.','Perfeito para bateria de escola de samba.','Prateado','#99846c',NULL,2,240.00,144.00,'tamborim-frente.png, tamborim-frente-sem-fundo.png, '),(18,'149872','Congas Quinto','A single quinto conga drum, tall and narrow, dark wood finish with chrome hardware, studio lighting.','Madeira de carvalho com ferragens cromadas.','Altura de 75cm e afinação por chaves.','Mogno Escuro','#8B4513',NULL,2,3100.00,1860.00,'conga-frente.png, conga-frente-sem-fundo.png, conga-verso.png, conga-verso-sem-fundo.png'),(19,'658304','Bongôs Profissional','Professional bongo drums with dark polished wood, metal tuning lugs, photographed on black background.','Mogno e ferragens niqueladas.','Tamanhos 7” e 8,5”, pele natural.','Natural Escuro','#5C4033',NULL,2,1350.00,810.00,'bongo-frente.png, bongo-frente-sem-fundo.png, bongo-verso.png, bongo-verso-sem-fundo.png'),(20,'278965','Surdo Marcação','A large samba surdo drum for bass rhythm, deep aluminum body, strong visual lighting, street parade vibe.','Corpo em alumínio escovado e pele dupla.','Utilizado em desfiles e blocos de carnaval.','Alumínio','#B0B0B0',NULL,2,1750.00,1050.00,'surdo-frente.png, surdo-frente-sem-fundo.png, surdo-verso.png, surdo-verso-sem-fundo.png'),(21,'987130','Triângulo Tradicional','A metal triangle percussion instrument with a simple design, hanging with striker, isolated on white background.','Aço inoxidável.','Inclui baqueta e cordão de fixação.','Metálico','#C0C0C0',NULL,2,90.00,54.00,'triangulo-frente.png, triangulo-frente-sem-fundo.png, triangulo-verso.png, triangulo-verso-sem-fundo.png'),(22,'305478','Tantan Madeira','A wooden tantan drum, cylindrical shape, natural finish, used in pagode music, warm studio lighting.','Mogno e couro natural.','Sonoridade grave e suave.','Natural','#DEB887',NULL,2,760.00,456.00,'tantan-frente.png, tantan-frente-sem-fundo.png, tantan-cima.png, tantan-cima-sem-fundo.png'),(23,'498320','Reco-reco de Madeira','A wooden reco-reco with carved ridges and a stick, photographed on a light wood surface, warm tones.','Mogno entalhado e baqueta de madeira.','Timbre rústico e artesanal.','Natural Envernizado','#CDAA7D',NULL,2,180.00,108.00,'reco-reco-frente.png, reco-reco-frente-sem-fundo.png, reco-reco-cima.png, reco-reco-cima-sem-fundo.png'),(24,'152937','Xilofone Estudante','A small xylophone for students with colorful bars, mallets included, photographed on white background.','Base em madeira com lâminas plásticas coloridas.','Acompanha par de baquetas.','Marrom','#ecd7b3',NULL,2,290.00,174.00,'xilofone-frente.png, xilofone-frente-sem-fundo.png, xilofone-verso.png, xilofone-verso-sem-fundo.png'),(25,'831276','Marimba Orquestral','A professional orchestral marimba with wooden resonators and mallets, concert hall background lighting.','Lâminas de rosewood e ressonadores metálicos.','Som encorpado, usado em orquestras.','Madeira Natural','#8B4513',NULL,2,21000.00,12600.00,'marimba-orquestral-frente.png, marimba-orquestral-frente-sem-fundo.png, marimba-orquestral-verso.png, marimba-orquestral-verso-sem-fundo.png'),(26,'489072','Glockenspiel Orquestral','A professional orchestral glockenspiel mounted on a frame with mallets, dark concert background lighting.','Lâminas de aço e estrutura tubular.','Sonoridade aguda e cristalina.','Metálico','#D3D3D3',NULL,2,7200.00,4320.00,'glockenspiel-profissional-frente.png, glockenspiel-profissional-frente-sem-fundo.png, glockenspiel-profissional-verso.png, glockenspiel-profissional-verso-sem-fundo.png'),(27,'612489','Piano Acústico (De Cauda)','A grand acoustic piano with glossy black finish, open lid showing strings, photographed in a concert hall with warm lighting.','Tampa e corpo em madeira nobre com acabamento em poliéster preto.','88 teclas de marfim sintético, som encorpado e harmônico.','Preto Brilhante','#000000',NULL,3,58000.00,34800.00,'piano-acustico-cauda-frente.png, piano-acustico-cauda-frente-sem-fundo.png, piano-acustico-corda-verso.png, piano-acustico-corda-verso-sem-fundo.png'),(28,'204718','Piano Acústico (Vertical)','An upright acoustic piano made of dark polished wood, photographed against a wall with soft ambient lighting.','Estrutura em madeira de nogueira com martelos de feltro.','Compacto e ideal para ambientes menores.','Mogno Escuro','#5B3A29',NULL,3,28500.00,17100.00,'piano-acustico-vertical-frente.png, piano-acustico-vertical-frente-sem-fundo.png, piano-acustico-vertical-verso.png, piano-acustico-vertical-verso-sem-fundo.png'),(29,'739160','Piano Digital (Portátil)','A compact digital piano with 88 weighted keys, minimalist black design, displayed in a modern home studio.','Corpo em plástico ABS reforçado, teclas semi-pesadas.','Inclui saída USB e conexão para fones.','Preto Fosco','#1C1C1C',NULL,3,4200.00,2520.00,'piano-digital-portatil-frente.png, piano-digital-portatil-frente-sem-fundo.png, piano-digital-portatil-verso.png, piano-digital-portatil-verso-sem-fundo.png'),(30,'528903','Piano Digital (De Móvel / Armário)','A cabinet-style digital piano with built-in stand and pedals, dark wood finish, photographed in a cozy living room setting.','Estrutura em MDF revestido e teclas com ação hammer.','Sistema estéreo e 10 timbres internos.','Madeira Escura','#3B2F2F',NULL,3,6400.00,3840.00,'piano-digital-movel-frente.png, piano-digital-movel-frente-sem-fundo.png, piano-digital-movel-verso.png, piano-digital-movel-verso-sem-fundo.png'),(31,'481279','Teclado Arranjador (Avançado 76/88 Teclas)','A professional arranger keyboard with extended 76 keys, multiple controls and display, photographed in a recording studio.','Carcaça em alumínio leve, display LCD colorido.','Ritmos integrados e gravação em tempo real.','Prateado','#C0C0C0',NULL,3,7500.00,4500.00,'teclado-arranjador-frente.png, teclado-arranjador-frente-sem-fundo.png, teclado-arranjador-verso.png, teclado-arranjador-verso-sem-fundo.png'),(32,'967540','Teclado Controlador MIDI (25 Teclas)','A small 25-key MIDI controller keyboard with drum pads and knobs, modern lighting on white background.','Corpo em ABS preto fosco e conexões USB-C.','Compatível com DAWs profissionais.','Preto Fosco','#111111',NULL,3,980.00,588.00,'teclado-controlador-midi-frente.png, teclado-controlador-midi-frente-sem-frente.png, teclado-controlador-midi-verso.png, teclado-controlador-midi-verso-sem-fundo.png'),(33,'379826','Sintetizador (Digital)','A modern digital synthesizer with sleek design, LCD display, and touch controls, in a futuristic studio environment.','Painel metálico com 61 teclas sensíveis à velocidade.','Gerador de som digital com 512 presets.','Preto Grafite','#2F2F2F',NULL,3,8900.00,5340.00,'sintetizador-digital-frente.png, sintetizador-digital-frente-sem-fundo.png, sintetizador-digital-verso.png, sintetizador-digital-verso-sem-fundo.png'),(34,'982431','Flauta Doce (Contralto)','An alto recorder made of dark wood, traditional design, placed on a sheet of classical music with warm lighting.','Madeira de ébano e chaves ajustadas.','Sonoridade suave e ideal para aprendizado clássico.','Mogno Escuro','#4B3621',NULL,4,420.00,252.00,'flauta-doce-frente.png, flauta-doce-frente-sem-fundo.png'),(35,'134682','Flauta Transversal (Profissional)','A professional silver flute with open holes and elegant engravings, photographed in a concert hall setting with warm spotlight.','Prata banhada com corpo em níquel.','Afinada em C, ideal para uso orquestral.','Prateado','#DCDCDC',NULL,4,7200.00,4320.00,'flauta-transversal-frente.png, flauta-transversal-frente-sem-fundo.png, flauta-transversal-verso.png, flauta-transversal-verso-sem-fundo.png'),(36,'843965','Saxofone (Alto)','An alto saxophone with gold lacquer finish, classic curved shape, photographed against a dark studio background with dramatic light.','Latão com acabamento dourado e chaves em madrepérola.','Timbre clássico e resposta rápida.','Dourado','#FFD700',NULL,4,9800.00,5880.00,'saxofone-alto-frente.png, saxofone-alto-frente-sem-fundo.png, saxofone-alto-verso.png, saxofone-alto-verso-sem-fundo.png'),(37,'270319','Trompete (Bb)','A standard Bb trumpet with gold lacquer finish and silver mouthpiece, placed on a reflective black surface with concert lighting.','Corpo em latão com bocal niquelado.','Afinado em Si♭, ideal para iniciantes e profissionais.','Dourado','#FFD700',NULL,4,5400.00,3240.00,'trompete-bb-frente.png, trompete-bb-frente-sem-fundo.png, trompete-bb-verso.png, trompete-bb-verso-sem-fundo.png'),(38,'761084','Clarinete (Bb)','A Bb clarinet with black body and silver keys, lying on a wooden table, soft classical lighting.','Resina ABS com chaves niqueladas.','Sonorização clara e projeção equilibrada.','Preto','#000000',NULL,4,3900.00,2340.00,'clarinete-bb-frente.png, clarinete-bb-frente-sem-fundo.png, clarinete-bb-verso.png, clarinete-bb-verso-sem-fundo.png'),(39,'689431','Gaita (Harmônica) Diatônica','A diatonic harmonica with metal cover and wooden comb, pocket-size, photographed on a rustic wooden surface.','Corpo em madeira e tampas cromadas.','Tonalidade C, ideal para blues e folk.','Metálico','#C0C0C0',NULL,4,350.00,210.00,'gaita-harmonica-frente.png, gaita-harmonica-frente-sem-fundo.png, gaita-harmonica-verso.png, gaita-harmonica-verso-sem-fundo.png'),(40,'245786','Fagote (Modelo Profissional)','A professional bassoon with rich red wood finish, intricate silver key system, concert hall background lighting.','Maple vermelho e sistema Heckel.','Instrumento de orquestra com timbre aveludado.','Vermelho Escuro','#8B0000',NULL,4,28500.00,17100.00,'fagote-frente.png, fagote-frente-sem-fundo.png, fagote-verso.png, fagote-verso-sem-fundo.png'),(41,'924518','Trompa (Modelo Profissional)','A professional French horn with full double horn system, gold lacquer finish, photographed in a concert environment.','Latão dourado com chaves rotativas.','Sonoridade ampla e projeção poderosa.','Dourado Envelhecido','#DAA520',NULL,4,16500.00,9900.00,'trompa-frente.png, trompa-frente-sem-fundo.png, trompa-verso.png, trompa-verso-sem-fundo.png'),(42,'378902','Corneta (Modelo Profissional)','A professional silver cornet, refined design, photographed on stage lighting setup with blurred orchestra background.','Corpo em prata com válvulas de pistão rápidas.','Timbre suave, ideal para bandas sinfônicas.','Prateado','#C0C0C0',NULL,4,8200.00,4920.00,'corneta-frente.png, corneta-frente-sem-fundo.png, corneta-verso.png, corneta-verso-sem-fundo.png'),(43,'582971','Acordeon (Sanfona) 80 Baixos','A full-size 80-bass accordion with pearl buttons and decorative grille, photographed in a folk music studio with soft light.','Corpo em madeira compensada, fole em tecido reforçado e botões de madrepérola.','Timbre tradicional, ideal para forró, vanerão e música regional.','Preto com Branco','#000000',NULL,5,9600.00,5760.00,'acordeon-frente.png, acordeon-frente-sem-fundo.png, acordeon-verso.png, acordeon-verso-sem-fundo.png'),(44,'920516','Harmonium Tradicional Indiano','A classic Indian harmonium with decorative carvings, extended bellows, photographed in a traditional music room setting.','Madeira de teca com entalhes ornamentais.','Timbre quente e ressonância profunda.','Natural Entalhado','#CD853F',NULL,5,8400.00,5040.00,'harmonium-frente.png, harmonium-frente-sem-fundo.png, harmonium-verso.png, harmonium-verso-sem-fundo.png'),(45,'362094','Bandoneón Clássico Argentino','A classic Argentine bandoneon with black wooden body, pearl buttons, open bellows, photographed under soft tango-style lighting.','Mogno preto com botões de madrepérola.','Instrumento típico do tango, som expressivo e melancólico.','Preto Piano','#111111',NULL,5,11800.00,7080.00,'bandoneon-frente.png, bandoneon-frente-sem-fundo.png, bandoneon-verso.png, bandoneon-verso-sem-fundo.png'),(46,'142693','Amplificador de Guitarra (Combo)','A combo guitar amplifier with black tolex finish, silver grille cloth, control knobs on top, photographed in a recording studio with moody lighting.','Caixa em MDF revestida com courvin preto e tela prateada.','Potência de 40W RMS, ideal para ensaios e pequenos shows.','Preto Fosco','#1C1C1C',NULL,6,2800.00,1680.00,'amplificador-de-guitarra-frente.png, amplificador-de-guitarra-frente-sem-fundo.png, amplificador-de-guitarra-verso.png, amplificador-de-guitarra-verso-sem-fundo.png'),(47,'587420','Amplificador de Guitarra (Cabeçote)','A guitar amp head with metal chassis and glowing tubes, placed on top of a speaker cabinet, illuminated by warm stage lighting.','Chassi metálico e válvulas EL34.','Cabeçote valvulado de 100W com canal limpo e drive.','Preto com Detalhes Dourados','#2B2B2B',NULL,6,6200.00,3720.00,'cabecote-amplificador-guitarra-frente.png, cabecote-amplificador-guitarra-frente-sem-fundo.png, cabecote-amplificador-guitarra-verso.png, cabecote-amplificador-guitarra-verso-sem-fundo.png'),(48,'904315','Amplificador de Baixo (Combo)','A bass combo amplifier with a large speaker grille, dark design, photographed in a rehearsal room environment.','Gabinete em madeira laminada, alto-falante de 15\".','Som encorpado, equalizador ativo de 3 bandas.','Preto Texturizado','#000000',NULL,6,4800.00,2880.00,'amplificador-de-baixo-frente.png, amplificador-de-baixo-frente-sem-fundo.png, amplificador-de-baixo-verso.png, amplificador-de-baixo-verso-sem-fundo.png'),(49,'231867','Amplificador de Violão (Acústico)','An acoustic guitar amplifier with wooden panel design, control knobs on top, natural light studio photography.','Painel frontal em madeira e circuito transistorado.','Canal duplo com entrada para microfone e violão.','Madeira Natural','#B8860B',NULL,6,3600.00,2160.00,'amplificador-de-violao-frente.png, amplificador-de-violao-frente-sem-fundo.png, amplificador-de-violao-verso.png, amplificador-de-violao-verso-sem-fundo.png'),(50,'512479','Caixa Acústica (Passiva)','A passive loudspeaker with black grille and metal handles, photographed in a concert setup with stage lights.','Gabinete em MDF com grade metálica e alças laterais.','Suporta até 300W RMS de potência.','Preto Texturizado','#1E1E1E',NULL,6,2100.00,1260.00,'caixa-acustica-passiva-frente.png, caixa-acustica-passiva-frente-sem-fundo.png, caixa-acustica-passiva-verso.png, caixa-acustica-passiva-verso-sem-fundo.png'),(51,'784632','Mesa de Som (Digital)','A digital audio mixing console with touchscreen and illuminated faders, placed in a modern studio under dim light.','Corpo em alumínio escovado e superfície sensível ao toque.','32 canais digitais com efeitos integrados.','Prata Industrial','#D3D3D3',NULL,6,12500.00,7500.00,'mesa-de-som-digital-frente.png, mesa-de-som-digital-frente-sem-fundo.png, mesa-de-som-digital-verso.png, mesa-de-som-digital-verso-sem-fundo.png'),(52,'345971','Microfone Dinâmico (Shure SM58 Style)','A dynamic vocal microphone with metal grille and black body, close-up studio shot, isolated on dark background.','Corpo em alumínio e cápsula dinâmica cardioide.','Ideal para vocais ao vivo e apresentações.','Preto e Prata','#2E2E2E',NULL,6,780.00,468.00,'microfone-dinamico-frente.png, microfone-dinamico-frente-sem-fundo.png, microfone-dinamico-verso.png, microfone-dinamico-verso-sem-fundo.png'),(53,'679124','Microfone Condensador (Estúdio)','A large diaphragm condenser microphone mounted on a shock mount with pop filter, in a professional recording booth.','Corpo metálico prateado com suporte anti-vibração.','Resposta de frequência de 20Hz a 20kHz.','Prateado','#DCDCDC',NULL,6,2100.00,1260.00,'microfone-estudio-frente.png, microfone-estudio-frente-sem-fundo.png, microfone-estudio-verso.png, microfone-estudio-verso-sem-fundo.png'),(54,'912570','Monitor de Áudio (De Referência)','A studio reference monitor speaker with black matte finish, yellow cone, placed on a mixing desk with computer screens.','Gabinete de MDF, tweeter de seda e woofer Kevlar 5”.','Sonorização flat ideal para mixagem.','Preto com Amarelo','#222222',NULL,6,3800.00,2280.00,'monitor-audio-referencia-frente.png, monitor-audio-referencia-frente-sem-fundo.png, monitor-audio-referencia-verso.png, monitor-audio-referencia-verso-sem-fundo.png'),(55,'159804','Monitor de Áudio (De Palco)','A wedge-shaped stage monitor speaker on the floor, photographed in a live concert setting with stage lights and cables.','Gabinete inclinado com revestimento antiderrapante.','Potência de 250W RMS, excelente retorno de palco.','Preto Fosco','#1C1C1C',NULL,6,2950.00,1770.00,'monitor-audio-palco-frente.png, monitor-audio-palco-frente-sem-fundo.png, monitor-audio-palco-verso.png, monitor-audio-palco-verso-sem-fundo.png'),(56,'604823','Interface de Áudio (4+ Canais)','A professional multi-channel audio interface with multiple inputs and outputs, metal rackmount design, illuminated by cool studio light.','Carcaça metálica com conexões balanceadas XLR e TRS.','Compatível com Windows, macOS e Linux.','Prateado','#C0C0C0',NULL,6,4100.00,2460.00,'interface-audio-frente.png, interface-audio-frente-sem-fundo.png, interface-audio-verso.png, interface-audio-verso-sem-verso.png'),(57,'837295','Fones (Over-ear de Estúdio)','Closed-back over-ear studio headphones with coiled cable, photographed on a mixing desk in soft lighting.','Almofadas em couro sintético e drivers de 40mm.','Design confortável para longas sessões.','Preto Fosco','#111111',NULL,6,890.00,534.00,'headset-frente.png, headset-frente-sem-fundo.png, headset-verso.png, headset-verso-sem-fundo.png'),(58,'498731','Fones (In-ear de Palco)','Professional in-ear monitor earphones with transparent housing and cable, photographed on a stage background with subtle light reflections.','Carcaça transparente e cabos removíveis.','Resposta precisa, ideal para músicos ao vivo.','Transparente','#EAEAEA',NULL,6,1250.00,750.00,'fone-ouvido-frente.png, fone-ouvido-frente-sem-fundo.png, fone-ouvido-verso.png, fone-ouvido-verso-sem-fundo.png'),(59,'184523','Cordas Avulsas (Violão Aço / Nylon)','A set of acoustic guitar strings, steel and nylon, neatly packaged with brand label visible, photographed on a wooden table.','Aço niquelado e nylon cristal.','Pacote com 6 cordas, som brilhante e durável.','Prateado e Transparente','#E0E0E0',NULL,7,75.00,45.00,'corda-violao-frente.png, corda-violao-frente-sem-fundo'),(60,'537916','Cordas Avulsas (Guitarra)','Electric guitar string set with colorful ball ends, metallic shine under studio lighting, placed beside a guitar headstock.','Aço inoxidável niquelado.','Calibre 0.10 – som equilibrado e boa resistência.','Metálico','#B0B0B0',NULL,7,80.00,48.00,'corda-guitarra-frente.png, corda-guitarra-frente-sem-fundo.png'),(61,'972184','Cordas Avulsas (Baixo 4c / 5c)','Bass guitar string set with thick nickel wound coils, photographed close-up on a dark textured background.','Aço niquelado com núcleo hexagonal.','Som grave potente e sustain longo.','Prateado','#C0C0C0',NULL,7,120.00,72.00,'corda-baixo-frente.png, corda-baixo-frente-sem-fundo.png'),(62,'405768','Cordas Avulsas (Violino)','Violin string set in elegant packaging, photographed on a wooden violin body in soft natural light.','Aço cromado com alma sintética.','Timbre doce e projeção refinada.','Prateado','#CCCCCC',NULL,7,130.00,78.00,'corda-violino-frente.png, corda-violino-frente-sem-fundo.png'),(63,'619845','Palheta (Nylon)','A close-up of nylon guitar picks in different colors and thicknesses, scattered on a wooden table under soft light.','Nylon flexível e durável.','Pacote com 10 unidades de diferentes espessuras.','Sortido','#AAAAAA',NULL,7,25.00,15.00,'palheta-nylon.png, palheta-nylon-sem-fundo.png'),(64,'826493','Palheta (Tortex)','Colorful tortex guitar picks with matte texture, arranged in a fan pattern on a clean white background.','Tortex antiderrapante.','Pacote com 10 unidades de timbre equilibrado e pegada firme.','Sortido','#D3D3D3',NULL,7,30.00,18.00,'palheta-tortex.png, palheta-tortex-sem-fundo.png'),(65,'540128','Palheta (Jazz)','Small jazz guitar picks with pointed tips, black and red colors, photographed close-up on an amplifier surface.','Nylon rígido com ponta afiada.','Pacote com 10 unidades de design pequeno para precisão máxima.','Preto e Vermelho','#8B0000',NULL,7,35.00,21.00,'palheta-jazz.png, palheta-jazz-sem-fundo.png'),(66,'763910','Capotraste (Violão e Guitarra)','A sleek aluminum guitar capo clipped onto an acoustic guitar neck, photographed with natural lighting.','Alumínio anodizado com mola reforçada.','Ajuste rápido e fixação firme.','Prata Escovado','#C0C0C0',NULL,7,90.00,54.00,'capotraste.png, capotraste-sem-fundo.png'),(67,'231640','Estante (De Partitura)','A foldable black music stand holding sheet music, photographed in a rehearsal room with soft lighting.','Aço leve dobrável com trava de altura.','Altura ajustável e base reforçada.','Preto Fosco','#222222',NULL,7,250.00,150.00,'estande-partitura-frente.png, estande-partitura-frente-sem-fundo.png, estande-partitura-verso.png, estande-partitura-verso-sem-fundo.png'),(68,'658319','Estante (Para Teclado)','A double-X keyboard stand supporting an electronic keyboard, photographed on a stage background.','Aço tubular com ajuste rápido.','Compatível com teclados de até 88 teclas.','Preto Brilhante','#000000',NULL,7,310.00,186.00,'estande-teclado-frente.png, estande-teclado-frente-sem-fundo.png, estande-teclado-verso.png, estande-teclado-verso-sem-fundo.png'),(69,'874590','Pedal de Efeito (Distortion / Overdrive)','Guitar distortion pedal with metal casing and control knobs, glowing LED light, placed on a pedalboard.','Carcaça metálica com potenciômetros duplos.','Som encorpado e quente, estilo vintage.','Laranja Metálico','#FF8C00',NULL,7,520.00,312.00,'pedal-distortion.png, pedal-distorcion-sem-fundo.png'),(70,'982410','Pedal de Efeito (Chorus / Delay)','Chorus and delay guitar pedals with colorful designs and multiple control knobs, photographed in studio lighting.','Metal anodizado com circuito analógico.','Efeitos clássicos para ambiência e modulação.','Azul Claro','#87CEEB',NULL,7,580.00,348.00,'pedal-chorus-delay.png, pedal-chorus-delay-sem-fundo.png'),(71,'490175','Pedal de Efeito (Looper)','Compact looper pedal with record and play buttons, photographed on a pedalboard setup.','Metal com botão de acionamento reforçado.','Grava e reproduz loops em tempo real.','Vermelho','#B22222',NULL,7,640.00,384.00,'pedal-looper.png, pedal-looper-sem-fundo.png'),(72,'304987','Cabo P10 (Instrumento)','Instrument cable with 1/4 inch (P10) jacks, coiled neatly beside an amplifier, photographed with soft shadows.','Fios de cobre com blindagem dupla e conectores niquelados.','Comprimento de 5 metros, baixa interferência.','Preto','#1C1C1C',NULL,7,90.00,54.00,'cabo-p10.png, cabo-p10-sem-fundo.png'),(73,'790246','Cabo XLR (Microfone)','Professional XLR microphone cable with metal connectors, coiled on a studio desk next to a condenser microphone.','Condutor em cobre livre de oxigênio.','Comprimento de 3 metros, ideal para estúdios.','Preto','#000000',NULL,7,110.00,66.00,'cabo-xlr.png, cabo-xlr-sem-fundo.png'),(74,'628354','Suporte (Para Guitarra/Violão)','A-frame guitar stand holding an acoustic guitar, photographed in a cozy music studio setting.','Aço dobrável com proteção em borracha.','Estável e compacto para transporte.','Preto','#1E1E1E',NULL,7,210.00,126.00,'suporte-guitarra.png, suporte-guitarra-sem-fundo.png'),(75,'562893','Suporte (Para Microfone)','Adjustable microphone stand with boom arm, holding a studio microphone, illuminated by soft lighting.','Aço leve com base redonda e braço telescópico.','Ajustável em altura e ângulo.','Preto','#000000',NULL,7,260.00,156.00,'suporte-microfone.png, suporte-microfone-sem-fundo.png'),(76,'981430','Case Rígido (Instrumento)','Hard guitar case made of black leather with metal latches, opened slightly showing plush red interior.','MDF revestido em couro sintético e interior aveludado.','Proteção premium para instrumentos de corda.','Preto com Vermelho','#111111',NULL,7,720.00,432.00,'case-guitarra.png, case-guitarra-sem-fundo.png, case-guitarra-fechada.png, case-guitarra-fechada-sem-fundo.png'),(77,'435219','Bag Soft (Instrumento)','Soft padded gig bag for acoustic guitar with shoulder straps, standing upright on a white background.','Tecido impermeável com alças acolchoadas.','Bolso frontal e reforço traseiro.','Preto','#000000',NULL,7,350.00,210.00,'case-tecido.png, case-tecido-sem-fundo.png, case-tecido-verso.png, case-tecido-verso-sem-fundo.png'),(78,'720158','Afinador Eletrônico (Clip)','Clip-on guitar tuner attached to the headstock, with illuminated display showing tuning note.','Corpo em ABS e visor LCD colorido.','Rotação 360° e alta precisão de leitura.','Preto','#1A1A1A',NULL,7,150.00,90.00,'afinador-clipe.png, afinador-clipe-sem-fundo.png, afinador-clipe-verso.png, afinador-clipe-verso-sem-fundo.png'),(79,'298504','Afinador Eletrônico (Pedal)','Pedal tuner with LED display, placed on a pedalboard among other effects pedals, photographed under stage light.','Metal resistente com visor de LED brilhante.','Bypass silencioso, ideal para shows.','Prata e Azul','#C0C0C0',NULL,7,430.00,258.00,'afinador-pedal.png, afinador-pedal-sem-fundo.png'),(80,'854763','Baquetas (Madeira - Maple/Hickory)','Pair of wooden drumsticks made from maple and hickory, lying on a snare drum surface in a drum kit setup.','Madeira tratada de alta densidade.','Equilíbrio e resposta natural.','Mogno Claro','#CD853F',NULL,7,70.00,42.00,'baqueta-madeira.png, baqueta-madeira-sem-fundo.png'),(81,'187642','Baquetas (Nylon Tip)','Drumsticks with nylon tips resting on cymbals, photographed close-up with warm stage lighting.','Corpo em hickory e ponta em nylon resistente.','Ideal para performances ao vivo e gravações.','Natural e Branco','#EEE8AA',NULL,7,85.00,51.00,'baqueta-nylon.png, baqueta-nylon-sem-fundo.png');
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
INSERT INTO `variacoes_produto` VALUES (1,'384201',1,'Natural Fosco','#d6b08a',950.00,350.00,0,'violao-nylon-fosco-frente.png, violao-nylon-fosco-frente-sem-fundo.png, violao-nylon-fosco-costa.png, violao-nylon-fosco-costa-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(2,'928473',1,'Preto Brilhante','#1a1a1a',950.00,370.00,0,'violao-nylon-preto-frente.png, violao-nylon-preto-frente-sem-fundo.png, violao-nylon-preto-verso.png, violao-nylon-preto-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(3,'572931',2,'Sunburst','#a25a2c',1350.00,420.00,0,'violao-aco-sunburst-frente.png, violao-aco-sunburst-frente-sem-fundo.png, violao-aco-sunburst-verso.png, violao-aco-sunburst-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(4,'148625',2,'Natural Claro','#e1a965',1350.00,400.00,0,'violao-aco-claro-frente.png, violao-aco-claro-frente-sem-fundo.png, violao-aco-claro-verso.png, violao-aco-claro-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(5,'639218',3,'Bege com Escudo Preto','#d5c39e',4200.00,580.00,5,'guitarra-stratocaster-bege-frente.png, guitarra-stratocaster-bege-frente-sem-fundo.png, guitarra-stratocaster-bege-verso.png, guitarra-stratocaster-bege-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(6,'283915',3,'Vermelha Metálica','#b22222',4200.00,590.00,0,'guitarra-stratocaster-vermelha-frente.png, guitarra-stratocaster-vermelha-frente-sem-fundo.png, guitarra-stratocaster-vermelha-verso.png, guitarra-stratocaster-vermelha-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(7,'496307',3,'Azul Vintage','#4682b4',4200.00,590.00,0,'guitarra-stratocaster-azul-frente.png, guitarra-stratocaster-azul-frente-sem-fundo.png, guitarra-stratocaster-azul-verso.png, guitarra-stratocaster-azul-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(8,'801624',4,'Cherry Sunburst','#a03a2b',5600.00,650.00,0,'guitarra-lespaul-sunburst-frente.png, guitarra-lespaul-sunburst-frente-sem-fundo.png, guitarra-lespaul-sunburst-verso.png, guitarra-lespaul-sunburst-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(9,'953710',4,'Gold Top','#d4af37',5600.00,670.00,0,'guitarra-lespaul-gold-frente.png, guitarra-lespaul-gold-frente-sem-fundo.png, guitarra-lespaul-gold-verso.png, guitarra-lespaul-gold-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(10,'390862',6,'Preto Clássico','#0d0d0d',3700.00,510.00,0,'baixo-eletrico-jazz-bass-preto-frente.png, baixo-eletrico-jazz-bass-preto-frente-sem-fundo.png, baixo-eletrico-jazz-bass-preto-verso.png, baixo-eletrico-jazz-bass-preto-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(11,'627839',7,'Branco Vintage','#f8f8f8',3900.00,530.00,0,'baixo-eletrico-precision-bass-branco-frente.png, baixo-eletrico-precision-bass-branco-frente-sem-fundo.png, baixo-eletrico-precision-bass-branco-verso.png, baixo-eletrico-precision-bass-branco-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(12,'512046',7,'Azul Marinho','#001f3f',3900.00,540.00,0,'baixo-eletrico-precision-bass-azul-frente.png, baixo-eletrico-precision-bass-azul-frente-sem-fundo.png, baixo-eletrico-precision-bass-azul-verso.png, baixo-eletrico-precision-bass-azul-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(13,'749320',8,'Natural Polido','#e3b778',1600.00,380.00,0,'viola-caipira-12-cordas-polido-frente.png, viola-caipira-12-cordas-polido-frente-sem-fundo.png, viola-caipira-12-cordas-polido-verso.png, viola-caipira-12-cordas-polido-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(14,'801357',8,'Cerejeira Escura','#8b3a3a',1600.00,390.00,0,'viola-caipira-12-cordas-cerejeira-frente.png, viola-caipira-12-cordas-cerejeira-frente-sem-fundo.png, viola-caipira-12-cordas-cerejeira-verso.png, viola-caipira-12-cordas-cerejeira-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(15,'235891',9,'Madeira Avermelhada','#a0522d',6800.00,460.00,0,'violino-avermelhado-frente.png, violino-avermelhado-frente-sem-fundo.png, violino-avermelhado-verso.png, violino-avermelhado-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(16,'783024',9,'Marrom Escuro','#4b2e05',6800.00,470.00,0,'violino-escuro-frente.png, violino-escuro-frente-sem-fundo.png, violino-escuro-verso.png, violino-escuro-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(17,'986435',10,'Natural Envernizado','#c68642',12500.00,750.00,0,'violoncelo-natural-frente.png, violoncelo-natural-frente-sem-fundo.png, violoncelo-natural-verso.png, violoncelo-natural-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(18,'312759',10,'Cereja Profundo','#6a1b1b',12500.00,760.00,0,'violoncelo-cereja-frente.png, violoncelo-cereja-frente-sem-fundo.png, violoncelo-cereja-verso.png, violoncelo-cereja-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(19,'470128',11,'Madeira Clara','#f5deb3',480.00,220.00,0,'ukulele-madeira-frente.png, ukulele-madeira-frente-sem-fundo.png, ukulele-madeira-verso.png, ukulele-madeira-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(20,'942615',11,'Mogno Escuro','#3b1d0a',480.00,230.00,0,'ukulele-mogno-frente.png, ukulele-mogno-frente-sem-fundo.png, ukulele-mogno-verso.png, ukulele-mogno-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(21,'216903',12,'Natural','#d2a679',1300.00,310.00,0,'banjo-4cordas-natural-frente.png, banjo-4cordas-natural-frente-sem-fundo.png, banjo-4cordas-natural-verso.png, banjo-4cordas-natural-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(22,'509387',13,'Preto Brilhante','#000000',1300.00,320.00,0,'cavaquinho-eletrico-preto-frente.png, cavaquinho-eletrico-preto-frente-sem-fundo.png, cavaquinho-eletrico-preto-verso.png, cavaquinho-eletrico-preto-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(23,'379524',14,'Cinza Titânio','#71797e',3500.00,980.00,0,'bateria-eletrica-cinza-frente.png, bateria-eletrica-cinza-frente-sem-fundo.png, bateria-eletrica-cinza-verso.png, bateria-eletrica-cinza-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(24,'821475',15,'Madeira Clara','#deb887',520.00,240.00,0,'cajon-flamenco-madeira-frente.png, cajon-flamenco-madeira-frente-sem-fundo.png, cajon-flamenco-madeira-verso.png, cajon-flamenco-madeira-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(25,'295239',15,'Nogal Escuro','#5a3a1a',540.00,250.00,0,'cajon-flamenco-nogal-frente.png, cajon-flamenco-nogal-frente-sem-fundo.png, cajon-flamenco-nogal-verso.png, cajon-flamenco-nogal-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(26,'473193',16,'Aro Dourado','#cfae30',420.00,190.00,0,'pandeiro-dourado-frente.png, pandeiro-dourado-frente-sem-fundo.png, pandeiro-dourado-verso.png, pandeiro-dourado-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(27,'849632',16,'Aro Cromado','#c0c0c0',420.00,195.00,0,'pandeiro-cromado-frente.png, padeiro-cromado-frente-sem-fundo.png, pandeiro-cromado-verso.png, pandeiro-cromado-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(28,'133921',17,'Prata','#c0c0c0',250.00,160.00,0,'tamborim-prata-frente.png, tamborim-prata-frente-sem-fundo.png, tamborim-prata-verso.png, tamborim-prata-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(29,'271339',17,'Azul Metálico','#1e3a8a',250.00,170.00,0,'tamborim-azul-frente.png, tamborim-azul-frente-sem-fundo.png, tamborim-azul-verso.png, tamborim-azul-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(30,'504856',18,'Madeira Natural','#b8860b',1600.00,480.00,0,'conga-madeira-frente.png, conga-madeira-frente-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(31,'639442',18,'Vermelho Vinil','#570000',1600.00,490.00,0,'conga-vermelho-frente.png, conga-vermelho-frente-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(32,'811223',19,'Madeira Clara','#d2b48c',1100.00,320.00,0,'bongo-madeira-frente.png, bongo-madeira-frente-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(33,'513958',19,'Marrom Escuro','#4b2e05',1100.00,330.00,0,'bongo-marrom-frente.png, bongo-marrom-frente-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(34,'722326',20,'Alumínio Escovado','#929187',1800.00,410.00,0,'surdo-aluminio-frente.png, surdo-aluminio-frente-sem-fundo.png, surdo-aluminio-verso.png, surdo-aluminio-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(35,'493107',20,'Preto Fosco','#2b2b2b',1800.00,420.00,0,'surdo-preto-frente.png, surdo-preto-frente-sem-fundo.png, surdo-preto-verso.png, surdo-preto-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(36,'239701',21,'Metálico','#ecb520',160.00,80.00,0,'triangulo-metalico-frente.png, triangulo-metalico-frente-sem-fundo.png, triangulo-metalico-verso.png, triangulo-metalico-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(37,'594813',21,'Cromado','#a4a39e',160.00,85.00,0,'triangulo-cromado-frente.png, triangulo-cromado-frente-sem-fundo.png, triangulo-cromado-verso.png, triangulo-cromado-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(38,'371249',22,'Natural Envernizado','#d9a066',890.00,380.00,0,'tantan-envernizado-frente.png, tantan-envernizado-frente-sem-fundo.png, tantan-envernizado-cima.png, tantan-envernizado-cima-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(39,'942810',22,'Cerejeira','#8b3a3a',890.00,385.00,0,'tantan-cerejeira-frente.png, tantan-cerejeira-frente-sem-fundo.png, tantan-cerejeira-cima.png, tantan-cerejeira-cima-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(40,'816432',23,'Natural','#deb887',350.00,110.00,0,'reco-reco-madeira-frente.png, reco-reco-madeira-frente-sem-fundo.png, reco-reco-madeira-cima.png, reco-reco-madeira-cima-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(41,'504297',23,'Madeira Escura','#4e342e',350.00,120.00,0,'reco-reco-escuro-cima.png, reco-reco-escuro-cima-sem-fundo.png, reco-reco-escuro-frente.png, reco-reco-escuro-frente-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(42,'358901',24,'Colorido','#eb3b28',680.00,150.00,0,'xilofone-colorido-frente.png, xilofone-colorido-frente-sem-fundo.png, xilofone-colorido-em-pe.png, xilofone-colorido-em-pe-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(43,'628430',24,'Natural Educacional','#b3c9c6',680.00,160.00,0,'xilofone-educacional-frente.png, xilofone-educacional-frente-sem-fundo.png, xilofone-educacional-verso.png, xilofone-educacional-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(44,'975621',25,'Madeira Escura','#a06b34',5800.00,750.00,0,'marimba-escura-frente.png, marimba-escura-frente-sem-fundo.png, marimba-escura-verso.png, marimba-escura-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(45,'134759',25,'Nogal Premium','#632001',5800.00,780.00,0,'marimba-nogal-frente.png, marimba-nogal-frente-sem-fundo.png, marimba-nogal-verso.png, marimba-nogal-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(46,'341681',27,'Branco Pérola','#f5f5f0',58000.00,2900.00,0,'piano-acustico-cauda-branco-frente.png, piano-acustico-cauda-branco-frente-sem-fundo.png, piano-acustico-cauda-branco-verso.png, piano-acustico-cauda-branco-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(47,'765584',27,'Mogno Envernizado','#4a1f0a',58000.00,2950.00,0,'piano-acustico-cauda-mogno-frente.png, piano-acustico-cauda-mogno-frente-sem-fundo.png, piano-acustico-cauda-mogno-verso.png, piano-acustico-cauda-mogno-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(48,'105372',28,'Nogal Escuro','#3e2723',28500.00,2300.00,0,'piano-acustico-vertical-nogal-frente.png, piano-acustico-vertical-nogal-frente-sem-fundo.png, piano-acustico-vertical-nogal-verso.png, piano-acustico-vertical-nogal-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(49,'982603',28,'Preto Fosco','#1a1a1a',28500.00,2250.00,0,'piano-acustico-vertical-preto-frente.png, piano-acustico-vertical-preto-frente-sem-fundo.png, piano-acustico-vertical-preto-verso.png, piano-acustico-vertical-preto-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(50,'508436',29,'Preto Clássico','#0d0d0d',4200.00,1800.00,0,'piano-digital-portatil-preto-frente.png, piano-digital-portatil-preto-frente-sem-fundo.png, piano-digital-portatil-preto-verso.png, piano-digital-portatil-preto-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(51,'650921',29,'Branco Neve','#f8f8ff',4200.00,1820.00,0,'piano-digital-portatil-branco-frente.png, piano-digital-portatil-branco-frente-sem-fundo.png, piano-digital-portatil-branco-verso.png, piano-digital-portatil-branco-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(52,'289374',30,'Nogal Escuro','#3b2e2a',6400.00,1900.00,0,'piano-digital-movel-nogal-frente.png, piano-digital-movel-nogal-frente-sem-fundo.png, piano-digital-movel-nogal-verso.png, piano-digital-movel-nogal-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(53,'964802',30,'Preto Satin','#2b2b2b',6400.00,1920.00,0,'piano-digital-movel-preto-frente.png, piano-digital-movel-preto-frente-sem-fundo.png, piano-digital-movel-preto-verso.png, piano-digital-movel-preto-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(54,'834721',31,'Preto com Display Azul','#101820',7500.00,2000.00,0,'teclado-arranjador-preto-frente.png, teclado-arranjador-preto-frente-sem-fundo.png, teclado-arranjador-preto-verso.png, teclado-arranjador-preto-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(55,'413580',31,'Cinza Grafite','#545454',7500.00,2050.00,0,'teclado-arranjador-cinza-frente.png, teclado-arranjador-cinza-frente-sem-fundo.png, teclado-arranjador-cinza-verso.png, teclado-arranjador-cinza-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(56,'247690',32,'Preto Compacto','#181818',980.00,900.00,0,'teclado-controlador-midi-preto-frente.png, teclado-controlador-midi-preto-frente-sem-fundo.png, teclado-controlador-midi-preto-verso.png, teclado-controlador-midi-preto-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(57,'958301',32,'Branco Studio','#f3f3f3',980.00,920.00,0,'teclado-controlador-midi-branco-frente.png, teclado-controlador-midi-branco-frente-sem-fundo.png, teclado-controlador-midi-branco-verso.png, teclado-controlador-midi-branco-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(58,'736294',33,'Preto Espacial','#0c0c0c',8900.00,1500.00,0,'sintetizador-digital-preto-frente.png, sintetizador-digital-preto-frente-sem-fundo.png, sintetizador-digital-preto-verso.png, sintetizador-digital-preto-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(59,'182653',33,'Cinza Metálico','#757575',8900.00,1520.00,0,'sintetizador-digital-cinza-frente.png, sintetizador-digital-cinza-frente-sem-fundo.png, sintetizador-digital-cinza-verso.png, sintetizador-digital-cinza-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(60,'394820',33,'Vermelho Studio','#a61b1b',8900.00,1550.00,0,'sintetizador-digital-vermelho-frente.png, sintetizador-digital-vermelho-frente-sem-fundo.png, sintetizador-digital-vermelho-verso.png, sintetizador-digital-vermelho-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(61,'184762',34,'Madeira Clara','#d2b48c',350.00,180.00,0,'flauta-doce-madeira-frente.png, flauta-doce-madeira-frente-sem-fundo.png, flauta-doce-madeira-verso.png, flauta-doce-madeira-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(62,'509347',34,'Ébano Escuro','#2c2c2c',360.00,200.00,0,'flauta-doce-ebano-frente.png, flauta-doce-ebano-frente-sem-fundo.png, flauta-doce-ebano-verso.png, flauta-doce-ebano-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(63,'936124',35,'Prateada','#c0c0c0',2300.00,850.00,0,'flauta-transversal-prata-frente.png, flauta-transversal-prata-frente-sem-fundo.png, flauta-transversal-prata-verso.png, flauta-transversal-prata-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(64,'283619',35,'Dourada Luxo','#d4af37',2500.00,900.00,0,'flauta-transversal-dourado-frente.png, flauta-transversal-dourado-frente-sem-fundo.png, flauta-transversal-dourado-verso.png, flauta-transversal-dourado-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(65,'724819',36,'Lacado Dourado','#ffd700',5100.00,1800.00,0,'saxofone-alto-dourado-frente.png, saxofone-alto-dourado-frente-sem-fundo.png, saxofone-alto-dourado-verso.png, saxofone-alto-dourado-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(66,'512306',36,'Preto Níquel','#2b2b2b',5200.00,1850.00,0,'saxofone-alto-preto-frente.png, saxofone-alto-preto-frente-sem-fundo.png, saxofone-alto-preto-verso.png, saxofone-alto-preto-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(67,'748125',37,'Lacado Dourado','#daa520',3900.00,1500.00,0,'trompete-bb-dourado-frente.png, trompete-bb-dourado-frente-sem-fundo.png, trompete-bb-dourado-verso.png, trompete-bb-dourado-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(68,'514903',37,'Prateado','#dcdcdc',3950.00,1520.00,0,'trompete-bb-prateado-frente.png, trompete-bb-prateado-frente-sem-fundo.png, trompete-bb-prateado-verso.png, trompete-bb-prateado-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(69,'821390',37,'Rose Gold','#b76e79',4100.00,1550.00,0,'trompete-bb-rose-frente.png, trompete-bb-rose-frente-sem-fundo.png, trompete-bb-rose-verso.png, trompete-bb-rose-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(70,'284510',38,'Madeira Negra','#1b1b1b',2800.00,980.00,0,'clarinete-bb-madeira-frente.png, clarinete-bb-madeira-frente-sem-fundo.png, clarinete-bb-madeira-verso.png, clarinete-bb-madeira-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(71,'956201',38,'Ébano Fosco','#3a3a3a',2850.00,990.00,0,'clarinete-bb-ebano-frente.png, clarinete-bb-ebano-frente-sem-fundo.png, clarinete-bb-ebano-verso.png, clarinete-bb-ebano-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(72,'490836',39,'Corpo Metálico Prateado','#b0b0b0',480.00,220.00,0,'gaita-harmonica-prata-frente.png, gaita-harmonica-prata-frente-sem-fundo.png, gaita-harmonica-prata-verso.png, gaita-harmonica-prata-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(73,'703982',39,'Corpo Preto','#101010',490.00,230.00,0,'gaita-harmonica-preto-frente.png, gaita-harmonica-preto-frente-sem-fundo.png, gaita-harmonica-preto-verso.png, gaita-harmonica-preto-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(74,'875624',40,'Madeira Vermelha','#8b3a3a',10200.00,2500.00,0,'fagote-vermelho-frente.png, fagote-vermelho-frente-sem-fundo.png, fagote-vermelho-verso.png, fagote-vermelho-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(75,'312587',40,'Mogno Escuro','#4b2e05',10300.00,2550.00,0,'fagote-mogno-frente.png, fagote-mogno-frente-sem-fundo.png, fagote-mogno-verso.png, fagote-mogno-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(76,'936701',41,'Lacado Dourado','#d4af37',7200.00,1900.00,0,'trompa-dourado-frente.png, trompa-dourado-frente-sem-fundo.png, trompa-dourado-verso.png, trompa-dourado-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(77,'451029',41,'Rose Gold','#b76e79',7400.00,1950.00,0,'trompa-rose-frente.png, trompa-rose-frente-sem-fundo.png, trompa-rose-verso.png, trompa-rose-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(78,'864203',42,'Prateada','#c0c0c0',3400.00,1300.00,0,'corneta-prata-frente.png, corneta-prata-frente-sem-fundo.png, corneta-prata-verso.png, corneta-prata-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(79,'527640',42,'Dourada Tradicional','#daa520',3500.00,1320.00,0,'corneta-dourada-frente.png, corneta-dourada-frente-sem-fundo.png, corneta-dourada-verso.png, corneta-dourada-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(80,'328571',43,'Preto Clássico','#0a0a0a',9600.00,3100.00,0,'acordeon-preto-frente.png, acordeon-preto-frente-sem-fundo.png, acordeon-preto-verso.png, acordeon-preto-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(81,'459732',43,'Vermelho Rubi','#9b111e',9800.00,3200.00,0,'acordeon-vermelho-frente.png, acordeon-vermelho-frente-sem-fundo.png, acordeon-vermelho-verso.png, acordeon-vermelho-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(82,'847921',43,'Branco Pérola','#f8f6f0',9900.00,3250.00,0,'acordeon-branco-frente.png, acordeon-branco-frente-sem-fundo.png, acordeon-branco-verso.png, acordeon-branco-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(83,'176304',44,'Madeira Clara','#deb887',2400.00,850.00,0,'harmonium-madeira-frente.png, harmonium-madeira-frente-sem-fundo.png, harmonium-madeira-verso.png, harmonium-madeira-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(84,'592817',44,'Nogal Escuro','#4e342e',2600.00,880.00,0,'harmonium-nogal-frente.png, harmonium-nogal-frente-sem-fundo.png, harmonium-nogal-verso.png, harmonium-nogal-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(85,'701294',45,'Preto Tradicional','#0f0f0f',5600.00,1450.00,0,'bandoneon-preto-frente.png, bandoneon-preto-frente-sem-fundo.png, bandoneon-preto-verso.png, bandoneon-preto-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(86,'835620',45,'Madeira Envernizada','#5a3a1a',5800.00,1500.00,0,'bandoneon-madeira-frente.png, bandoneon-madeira-frente-sem-fundo.png, bandoneon-madeira-verso.png, bandoneon-madeira-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(87,'591732',46,'Preto Clássico','#0f0f0f',3100.00,1200.00,0,'amplificador-de-guitarra-preto-frente.png, amplificador-de-guitarra-preto-frente-sem-fundo.png, amplificador-de-guitarra-preto-verso.png, amplificador-de-guitarra-preto-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(88,'804529',46,'Creme Vintage','#f3e5ab',3200.00,1250.00,0,'amplificador-de-guitarra-branco-frente.png, amplificador-de-guitarra-branco-frente-sem-fundo.png, amplificador-de-guitarra-branco-verso.png, amplificador-de-guitarra-branco-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(89,'439678',47,'Preto Metálico','#1c1c1c',3400.00,1350.00,0,'cabecote-amplificador-guitarra-preto-frente.png, cabecote-amplificador-guitarra-preto-frente-sem-fundo.png, cabecote-amplificador-guitarra-preto-verso.png, cabecote-amplificador-guitarra-preto-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(90,'273816',47,'Cromado','#b5b5b5',3500.00,1400.00,0,'cabecote-amplificador-guitarra-cromado-frente.png, cabecote-amplificador-guitarra-cromado-frente-sem-fundo.png, cabecote-amplificador-guitarra-cromado-verso.png, cabecote-amplificador-guitarra-cromado-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(91,'957230',48,'Preto','#101010',2800.00,1100.00,0,'amplificador-de-baixo-preto-frente.png, amplificador-de-baixo-preto-frente-sem-fundo.png, amplificador-de-baixo-preto-verso.png, amplificador-de-baixo-preto-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(92,'368524',48,'Cinza Grafite','#484848',2900.00,1150.00,0,'amplificador-de-baixo-cinza-frente.png, amplificador-de-baixo-cinza-frente-sem-fundo.png, amplificador-de-baixo-cinza-verso.png, amplificador-de-baixo-cinza-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(93,'712486',49,'Madeira Clara','#c19a6b',2200.00,950.00,0,'amplificador-de-violao-madeira-frente.png, amplificador-de-violao-madeira-frente-sem-fundo.png, amplificador-de-violao-madeira-verso.png, amplificador-de-violao-madeira-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(94,'143905',49,'Mogno Escuro','#4a2c1d',2300.00,980.00,0,'amplificador-de-violao-mogno-frente.png, amplificador-de-violao-mogno-frente-sem-fundo.png, amplificador-de-violao-mogno-verso.png, amplificador-de-violao-mogno-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(95,'625478',50,'Preta Tradicional','#1a1a1a',1800.00,1050.00,0,'caixa-acustica-passiva-preto-frente.png, caixa-acustica-passiva-preto-frente-sem-fundo.png, caixa-acustica-passiva-preto-verso.png, caixa-acustica-passiva-preto-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00'),(96,'492631',51,'Preto Futurista','#121212',8900.00,2800.00,0,'mesa-de-som-digital-preto-frente.png, mesa-de-som-digital-preto-frente-sem-fundo.png, mesa-de-som-digital-preto-verso.png, mesa-de-som-digital-preto-verso-sem-fundo.png','Ativo','2025-11-27 02:01:00');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
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

-- Dump completed on 2025-11-27 23:56:28
