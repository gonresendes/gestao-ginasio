-- Listar todos os membros incritos em cada aula
SELECT A.ID AS AulaID, A.Nome AS NomeAula, M.ID AS MembroID, M.Nome AS NomeMembro
FROM Inscricoes I
JOIN Aulas A ON I.AulaID = A.ID
JOIN Membros M ON I.MembroID = M.ID
ORDER BY A.ID, M.ID;
