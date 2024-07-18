-- Registar uma nova inscrição

DELIMITER //

DROP PROCEDURE IF EXISTS RegistrarInscricao //

CREATE PROCEDURE RegistrarInscricao (
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
END;

//

DELIMITER ;


CALL RegistrarInscricao(1, 1, '2024-07-20');
SELECT * FROM Inscricoes;
