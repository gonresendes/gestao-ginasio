-- Stored Procedure para calcular o total de inscrições num determinado período

DELIMITER //

CREATE PROCEDURE CalcularTotalInscricoesPorPeriodo (
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
END;

//

DELIMITER ;

SET @total := 0;
CALL CalcularTotalInscricoesPorPeriodo('2024-01-01', '2024-12-31', @total);
SELECT @total AS TotalInscricoes;
