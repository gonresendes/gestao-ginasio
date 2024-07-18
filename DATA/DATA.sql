CREATE DATABASE  IF NOT EXISTS `GINASIO` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `GINASIO`;
-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 3.225.159.155    Database: GINASIO
-- ------------------------------------------------------
-- Server version	8.0.37-0ubuntu0.24.04.1

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
-- Table structure for table `Aulas`
--

DROP TABLE IF EXISTS `Aulas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Aulas` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `TreinadorID` int NOT NULL,
  `DataHora` datetime NOT NULL,
  `Duracao` int NOT NULL,
  `Estado` varchar(20) DEFAULT 'Disponível',
  `Capacidade` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `TreinadorID` (`TreinadorID`),
  CONSTRAINT `Aulas_ibfk_1` FOREIGN KEY (`TreinadorID`) REFERENCES `Treinadores` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Aulas`
--

LOCK TABLES `Aulas` WRITE;
/*!40000 ALTER TABLE `Aulas` DISABLE KEYS */;
INSERT INTO `Aulas` VALUES (1,'Yoga',1,'2024-07-20 08:00:00',60,'Disponível',10),(2,'CrossFit',2,'2024-07-21 10:00:00',60,'Disponível',10),(3,'Pilates',3,'2024-07-22 12:00:00',60,'Disponível',3);
/*!40000 ALTER TABLE `Aulas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inscricoes`
--

DROP TABLE IF EXISTS `Inscricoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Inscricoes` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `MembroID` int NOT NULL,
  `AulaID` int NOT NULL,
  `DataInscricao` date NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `MembroID` (`MembroID`),
  KEY `AulaID` (`AulaID`),
  CONSTRAINT `Inscricoes_ibfk_1` FOREIGN KEY (`MembroID`) REFERENCES `Membros` (`ID`),
  CONSTRAINT `Inscricoes_ibfk_2` FOREIGN KEY (`AulaID`) REFERENCES `Aulas` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inscricoes`
--

LOCK TABLES `Inscricoes` WRITE;
/*!40000 ALTER TABLE `Inscricoes` DISABLE KEYS */;
INSERT INTO `Inscricoes` VALUES (1,1,2,'2024-07-18'),(2,2,2,'2024-07-18'),(3,3,3,'2024-07-18'),(4,4,2,'2024-07-18'),(5,5,1,'2024-07-18'),(6,6,1,'2024-07-18'),(7,7,2,'2024-07-18'),(8,8,2,'2024-07-18'),(9,8,1,'2024-07-18'),(10,9,2,'2024-07-18'),(11,10,2,'2024-07-18'),(12,11,3,'2024-07-18'),(13,4,1,'2024-07-21');
/*!40000 ALTER TABLE `Inscricoes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `ImpedirInscricaoDuplicada` BEFORE INSERT ON `Inscricoes` FOR EACH ROW BEGIN
    DECLARE InscricaoExistente INT;
    DECLARE NomeAula VARCHAR(100);
    DECLARE NomeMembro VARCHAR(100);

    SELECT COUNT(*) INTO InscricaoExistente FROM Inscricoes
    WHERE MembroID = NEW.MembroID AND AulaID = NEW.AulaID;

    IF InscricaoExistente > 0 THEN
        SELECT Nome INTO NomeAula FROM Aulas WHERE ID = NEW.AulaID;
        SELECT Nome INTO NomeMembro FROM Membros WHERE ID = NEW.MembroID;

        SET @message = CONCAT('O membro ', NomeMembro, ' já está inscrito na aula ', NomeAula, '.');
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `ImpedirInscricaoAulaCheia` BEFORE INSERT ON `Inscricoes` FOR EACH ROW BEGIN
    DECLARE TotalInscricoes INT;
    DECLARE CapacidadeAula INT;
    DECLARE NomeAula VARCHAR(100);

    SELECT COUNT(*) INTO TotalInscricoes FROM Inscricoes WHERE AulaID = NEW.AulaID;
    SELECT Capacidade, Nome INTO CapacidadeAula, NomeAula FROM Aulas WHERE ID = NEW.AulaID;

    IF TotalInscricoes >= CapacidadeAula THEN
        SET @message = CONCAT('A aula ', NomeAula, ' já está cheia.');
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `AtualizarEstadoAula` AFTER INSERT ON `Inscricoes` FOR EACH ROW BEGIN
    DECLARE TotalInscricoes INT;
    DECLARE CapacidadeAula INT;
    
    SELECT COUNT(*) INTO TotalInscricoes FROM Inscricoes WHERE AulaID = NEW.AulaID;
    SELECT Capacidade INTO CapacidadeAula FROM Aulas WHERE ID = NEW.AulaID;
    
    IF TotalInscricoes >= CapacidadeAula THEN
        UPDATE Aulas
        SET Estado = 'Cheia'
        WHERE ID = NEW.AulaID;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Membros`
--

DROP TABLE IF EXISTS `Membros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Membros` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `DataNascimento` date NOT NULL,
  `TipoMembro` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Membros`
--

LOCK TABLES `Membros` WRITE;
/*!40000 ALTER TABLE `Membros` DISABLE KEYS */;
INSERT INTO `Membros` VALUES (1,'Afonso Pinheiro','2005-03-16','Gold'),(2,'Daniel Pimentel','2004-08-23','Black'),(3,'Gonçalo Resendes','2005-04-19','Gold'),(4,'Gonçalo Resendes','2005-04-19','Black'),(5,'José Freitas','2000-10-12','Black'),(6,'Marco Bolarinho','2001-06-23','Gold'),(7,'Nuno Bento','2005-10-20','Black'),(8,'Rafael Viola','2005-11-07','BLack'),(9,'Rafael Raposo','2004-12-22','Gold'),(10,'Rodrigo Moura','2004-03-18','Black'),(11,'Rodrigo Costa','2004-01-10','Black');
/*!40000 ALTER TABLE `Membros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Treinadores`
--

DROP TABLE IF EXISTS `Treinadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Treinadores` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Especialidade` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Treinadores`
--

LOCK TABLES `Treinadores` WRITE;
/*!40000 ALTER TABLE `Treinadores` DISABLE KEYS */;
INSERT INTO `Treinadores` VALUES (1,'Silvia Câmera','Yoga'),(2,'José Daniel','CrossFit'),(3,'João Lima','Pilates');
/*!40000 ALTER TABLE `Treinadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'GINASIO'
--

--
-- Dumping routines for database 'GINASIO'
--
/*!50003 DROP PROCEDURE IF EXISTS `AtualizarMembro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `AtualizarMembro`(
    IN p_MembroID INT,
    IN p_NovoNome VARCHAR(100),
    IN p_NovaDataNascimento DATE,
    IN p_NovoTipoMembro VARCHAR(50)
)
BEGIN
    -- Atualiza os dados do membro
    UPDATE Membros
    SET Nome = p_NovoNome,
        DataNascimento = p_NovaDataNascimento,
        TipoMembro = p_NovoTipoMembro
    WHERE ID = p_MembroID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CalcularTotalInscricoesPorPeriodo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `CalcularTotalInscricoesPorPeriodo`(
    IN p_DataInicio DATE,
    IN p_DataFim DATE,
    OUT p_TotalInscricoes INT
)
BEGIN
    -- Calcula o total de inscrições no período especificado
    SELECT COUNT(*)
    INTO p_TotalInscricoes
    FROM Inscricoes
    WHERE DataInscricao BETWEEN p_DataInicio AND p_DataFim;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegistrarInscricao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `RegistrarInscricao`(
    IN p_MembroID INT,
    IN p_AulaID INT,
    IN p_DataInscricao DATE
)
BEGIN
    DECLARE CapacidadeAula INT;
    DECLARE TotalInscricoes INT;
    DECLARE NomeAula VARCHAR(100);

    SELECT Capacidade INTO CapacidadeAula FROM Aulas WHERE ID = p_AulaID;
    SELECT COUNT(*) INTO TotalInscricoes FROM Inscricoes WHERE AulaID = p_AulaID;
    SELECT Nome INTO NomeAula FROM Aulas WHERE ID = p_AulaID;

    IF TotalInscricoes >= CapacidadeAula THEN
        SET @message = CONCAT('A aula ', NomeAula, ' está cheia. Não é possível realizar a inscrição.');

        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message;
    ELSE
        INSERT INTO Inscricoes (MembroID, AulaID, DataInscricao)
        VALUES (p_MembroID, p_AulaID, p_DataInscricao);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RelatorioAulasComInscricoesPorPeriodo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `RelatorioAulasComInscricoesPorPeriodo`(
    IN p_DataInicio DATE,
    IN p_DataFim DATE
)
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE v_AulaID INT;
    DECLARE v_NomeAula VARCHAR(100);

    DECLARE curAula CURSOR FOR
        SELECT ID, Nome
        FROM Aulas;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    CREATE TEMPORARY TABLE IF NOT EXISTS TempRelatorio (
        AulaID INT,
        NomeAula VARCHAR(100),
        QuantidadeInscricoes INT
    );

    OPEN curAula;
    read_loop: LOOP
        FETCH curAula INTO v_AulaID, v_NomeAula;

        IF done THEN
            LEAVE read_loop;
        END IF;

        SET @QuantidadeInscricoes := (
            SELECT COUNT(*)
            FROM Inscricoes
            WHERE AulaID = v_AulaID
            AND DataInscricao BETWEEN p_DataInicio AND p_DataFim
        );

        -- Insere os resultados na tabela temporária
        INSERT INTO TempRelatorio (AulaID, NomeAula, QuantidadeInscricoes)
        VALUES (v_AulaID, v_NomeAula, @QuantidadeInscricoes);
    END LOOP;

    CLOSE curAula;

    SELECT * FROM TempRelatorio;

    DROP TEMPORARY TABLE IF EXISTS TempRelatorio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-18 16:28:37
