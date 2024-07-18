-- Inserções de dados nas tabelas devidas

INSERT INTO Membros (Nome, DataNascimento, TipoMembro) VALUES 
('Afonso Pinheiro', '2005-03-16', 'Gold'),
('Daniel Pimentel', '2004-08-23', 'Black'),
('Franciso Simas', '2005-03-23', 'Black'),
('Gonçalo Resendes', '2005-04-19', 'Gold'),
('Henrique Pereira', '2004-02-26', 'Black'),
('José Freitas', '2000-10-12', 'Black'),
('Marco Bolarinho', '2001-06-23', 'Gold'),
('Nuno Bento', '2005-10-20', 'Black'),
('Rafael Viola', '2005-11-07', 'BLack'),
('Rafael Raposo', '2004-12-22', 'Gold'),
('Rodrigo Moura', '2004-03-18', 'Black'),
('Rodrigo Costa', '2004-01-10', 'Black');

INSERT INTO Treinadores (Nome, Especialidade) VALUES 
('Silvia Câmera', 'Yoga'),
('José Daniel', 'CrossFit'),
('João Lima', 'Pilates');

INSERT INTO Aulas (Nome, TreinadorID, DataHora, Duracao, Estado, Capacidade) VALUES 
('Yoga', 1, '2024-07-20 08:00:00', 60, 'Disponível', 10),  
('CrossFit', 2, '2024-07-21 10:00:00', 60, 'Disponível', 10),  
('Pilates', 3, '2024-07-22 12:00:00', 60, 'Disponível', 3); 

INSERT INTO Inscricoes (MembroID, AulaID, DataInscricao) VALUES (1, 2, '2024-07-18');
INSERT INTO Inscricoes (MembroID, AulaID, DataInscricao) VALUES (2, 2, '2024-07-18');
INSERT INTO Inscricoes (MembroID, AulaID, DataInscricao) VALUES (3, 3, '2024-07-18');
INSERT INTO Inscricoes (MembroID, AulaID, DataInscricao) VALUES (4, 2, '2024-07-18');
INSERT INTO Inscricoes (MembroID, AulaID, DataInscricao) VALUES (5, 1, '2024-07-18');
INSERT INTO Inscricoes (MembroID, AulaID, DataInscricao) VALUES (6, 1, '2024-07-18');
INSERT INTO Inscricoes (MembroID, AulaID, DataInscricao) VALUES (7, 2, '2024-07-18');
INSERT INTO Inscricoes (MembroID, AulaID, DataInscricao) VALUES (8, 2, '2024-07-18');
INSERT INTO Inscricoes (MembroID, AulaID, DataInscricao) VALUES (8, 1, '2024-07-18');
INSERT INTO Inscricoes (MembroID, AulaID, DataInscricao) VALUES (9, 2, '2024-07-18');
INSERT INTO Inscricoes (MembroID, AulaID, DataInscricao) VALUES (10, 2, '2024-07-18');
INSERT INTO Inscricoes (MembroID, AulaID, DataInscricao) VALUES (11, 3, '2024-07-18');

