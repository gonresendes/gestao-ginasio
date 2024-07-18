-- Listar as aulas ministradas por um determinado treinador
SELECT A.ID AS AulaID, A.Nome AS NomeAula, T.Nome AS NomeTreinador, T.Especialidade
FROM Aulas A
JOIN Treinadores T ON A.TreinadorID = T.ID
WHERE T.Nome = 'José Daniel';
