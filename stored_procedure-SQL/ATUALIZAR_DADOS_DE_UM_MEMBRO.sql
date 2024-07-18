-- Stored Procedure para atualizar os dados de um membro

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
