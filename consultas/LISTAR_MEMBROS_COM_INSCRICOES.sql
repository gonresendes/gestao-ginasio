-- Listar os membros com mais de um determinado número de inscrições
SELECT M.ID AS MembroID, M.Nome AS NomeMembro, COUNT(I.ID) AS TotalInscricoes
FROM Membros M
JOIN Inscricoes I ON M.ID = I.MembroID
GROUP BY M.ID, M.Nome
HAVING COUNT(I.ID) > 1; 
