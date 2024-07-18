# Consultas

## Listar Todos os Membros Inscritos em Cada Aula

```sql
SELECT A.ID AS AulaID, A.Nome AS NomeAula, M.ID AS MembroID, M.Nome AS NomeMembro
FROM Inscricoes I
JOIN Aulas A ON I.AulaID = A.ID
JOIN Membros M ON I.MembroID = M.ID
ORDER BY A.ID, M.ID;
```

## Listar os Membros com Mais de um Determinado Número de Inscrições
```sql
SELECT M.ID AS MembroID, M.Nome AS NomeMembro, COUNT(I.ID) AS TotalInscricoes
FROM Membros M
JOIN Inscricoes I ON M.ID = I.MembroID
GROUP BY M.ID, M.Nome
HAVING COUNT(I.ID) > 1; 
```
## Listar as aulas ministradas por um determinado treinador
```sql
SELECT A.ID AS AulaID, A.Nome AS NomeAula, T.Nome AS NomeTreinador, T.Especialidade
FROM Aulas A
JOIN Treinadores T ON A.TreinadorID = T.ID
WHERE T.Nome = 'José Daniel';
```
## Listar as aulas disponíveis numa determinada data
```sql
SELECT * FROM Aulas
WHERE DataHora > '2024-07-20 00:00:00' AND DataHora < '2024-07-22 23:59:59'
AND Estado = 'Disponível';
``
