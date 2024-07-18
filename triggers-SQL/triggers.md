# Triggers

## Atualizar Estado da Aula

```sql
DELIMITER //

CREATE TRIGGER AtualizarEstadoAula
AFTER INSERT ON Inscricoes
FOR EACH ROW
BEGIN
    DECLARE numInscricoes INT;
    
    SELECT COUNT(*) INTO numInscricoes
    FROM Inscricoes
    WHERE AulaID = NEW.AulaID;
    
    IF numInscricoes >= 10 THEN
        UPDATE Aulas
        SET Estado = 'Cheio'
        WHERE ID = NEW.AulaID;
    ELSE
        UPDATE Aulas
        SET Estado = 'Disponível'
        WHERE ID = NEW.AulaID;
    END IF;
END //

DELIMITER ;
```

## Impedir Incrição Duplicada

```sql
DELIMITER //

CREATE TRIGGER ImpedirInscricaoDuplicada
BEFORE INSERT ON Inscricoes
FOR EACH ROW
BEGIN
    DECLARE inscrito INT DEFAULT 0;
    DECLARE membroNome VARCHAR(100);
    
    -- Verificar se o membro já está inscrito na aula
    SELECT COUNT(*)
    INTO inscrito
    FROM Inscricoes
    WHERE MembroID = NEW.MembroID AND AulaID = NEW.AulaID;
    
    IF inscrito > 0 THEN
        -- Obter o nome do membro
        SELECT Nome INTO membroNome
        FROM Membros
        WHERE ID = NEW.MembroID;
        
        -- Gerar erro
        SET @error_message = CONCAT('Membro ', membroNome, ' já está inscrito nesta aula.');
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = @error_message;
    END IF;
END //

DELIMITER ;
```
## Impedir Incrição em Aula Cheia

```sql
DELIMITER //

CREATE TRIGGER ImpedirInscricaoCheia
BEFORE INSERT ON Inscricoes
FOR EACH ROW
BEGIN
    DECLARE capacidade INT;
    DECLARE inscritos INT;
    DECLARE nome_aula VARCHAR(100);

    -- Verificar a capacidade da aula
    SELECT 10, Nome INTO capacidade, nome_aula -- Defina a capacidade máxima aqui
    FROM Aulas
    WHERE ID = NEW.AulaID;

    -- Contar o número atual de inscrições na aula
    SELECT COUNT(*) INTO inscritos
    FROM Inscricoes
    WHERE AulaID = NEW.AulaID;

    -- Verificar se a aula já está "Cheia"
    IF inscritos >= capacidade THEN
        SET @msg = CONCAT('Aula ', nome_aula, ' já está cheia. Não é possível fazer novas inscrições.');
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @msg;
    END IF;
END //

DELIMITER ;
```
