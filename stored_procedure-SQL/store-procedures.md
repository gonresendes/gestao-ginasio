# Store-Procedures

## Stored Procedure para calcular o total de incrições num determinado período
```sql
DELIMITER //

DROP PROCEDURE IF EXISTS CalcularTotalInscricoesPorPeriodo //

CREATE PROCEDURE CalcularTotalInscricoesPorPeriodo (
    IN p_DataInicio DATE,
    IN p_DataFim DATE,
    OUT p_TotalInscricoes INT
)
BEGIN
    SELECT COUNT(*)
    INTO p_TotalInscricoes
    FROM Inscricoes
    WHERE DataInscricao BETWEEN p_DataInicio AND p_DataFim;
END;

//

DELIMITER ;

SET @total := 0;
CALL CalcularTotalInscricoesPorPeriodo('2024-01-01', '2024-12-31', @total);
SELECT @total AS TotalInscricoes;
```
## Store procedure para registar uma nova inscrição
```sql
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


CALL RegistrarInscricao(4, 1, '2024-07-21');
SELECT * FROM Inscricoes;
```
## Store Procedure para atualizar os dados de um membro
```sql
DELIMITER //

DROP PROCEDURE IF EXISTS AtualizarMembro //

CREATE PROCEDURE AtualizarMembro (
    IN p_MembroID INT,
    IN p_NovoNome VARCHAR(100),
    IN p_NovaDataNascimento DATE,
    IN p_NovoTipoMembro VARCHAR(50)
)
BEGIN
    UPDATE Membros
    SET Nome = p_NovoNome,
        DataNascimento = p_NovaDataNascimento,
        TipoMembro = p_NovoTipoMembro
    WHERE ID = p_MembroID;
END;

//

DELIMITER ;

CALL AtualizarMembro(4, 'Gonçalo Resendes', '2005-04-19', 'Black');

SELECT * FROM Membros;
```
