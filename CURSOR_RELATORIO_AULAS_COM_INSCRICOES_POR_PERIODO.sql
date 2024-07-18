DELIMITER //

CREATE PROCEDURE RelatorioAulasComInscricoesPorPeriodo (
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
END;

//

DELIMITER ;


CALL RelatorioAulasComInscricoesPorPeriodo('2024-01-01', '2024-12-31');
