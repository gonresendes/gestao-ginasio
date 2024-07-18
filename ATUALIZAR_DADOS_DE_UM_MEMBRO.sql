-- Stored Procedure para atualizar os dados de um membro

DELIMITER //

CREATE PROCEDURE AtualizarMembro (
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
END;

//

DELIMITER ;

CALL AtualizarMembro(1, 'Jonny', '1995-05-05', 'Premium');

SELECT * FROM Membros;
