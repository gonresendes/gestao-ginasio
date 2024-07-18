-- Listar as aulas disponíveis numa determinada data
SELECT * FROM Aulas
WHERE DataHora > '2024-07-20 00:00:00' AND DataHora < '2024-07-20 23:59:59'
AND Estado = 'Disponível';
