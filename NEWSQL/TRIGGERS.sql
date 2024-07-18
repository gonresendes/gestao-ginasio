DELIMITER //

CREATE TRIGGER AtualizarEstadoAula
AFTER INSERT ON Inscricoes
FOR EACH ROW
BEGIN
    DECLARE TotalInscricoes INT;
    DECLARE CapacidadeAula INT;
    
    SELECT COUNT(*) INTO TotalInscricoes FROM Inscricoes WHERE AulaID = NEW.AulaID;
    SELECT Capacidade INTO CapacidadeAula FROM Aulas WHERE ID = NEW.AulaID;
    
    IF TotalInscricoes >= CapacidadeAula THEN
        UPDATE Aulas
        SET Estado = 'Cheia'
        WHERE ID = NEW.AulaID;
    END IF;
END;

//

DELIMITER ;


DELIMITER //

CREATE TRIGGER ImpedirInscricaoDuplicada
BEFORE INSERT ON Inscricoes
FOR EACH ROW
BEGIN
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
END;

//

DELIMITER //

CREATE TRIGGER ImpedirInscricaoAulaCheia
BEFORE INSERT ON Inscricoes
FOR EACH ROW
BEGIN
    DECLARE TotalInscricoes INT;
    DECLARE CapacidadeAula INT;
    DECLARE NomeAula VARCHAR(100);

    SELECT COUNT(*) INTO TotalInscricoes FROM Inscricoes WHERE AulaID = NEW.AulaID;
    SELECT Capacidade, Nome INTO CapacidadeAula, NomeAula FROM Aulas WHERE ID = NEW.AulaID;

    IF TotalInscricoes >= CapacidadeAula THEN
        SET @message = CONCAT('A aula ', NomeAula, ' já está cheia.');
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message;
    END IF;
END;

//

DELIMITER ;




