-- Inserções de dados nas tabelas devidas

INSERT INTO Membros (Nome, DataNascimento, TipoMembro) VALUES 
('Afonso Pinheiro', '2005-03-16', 'Regular'),
('Daniel Pimentel', '2004-08-23', 'Regular'),
('Gonçalo Resendes', '2005-04-19', 'Regular'),
('Henrique Pereira', '2004-02-26', 'Regular'),
('José Freitas', '2000-10-12', 'Regular'),
('Marco Bolarinho', '2001-06-23', 'Regular'),
('Nuno Bento', '2005-10-20', 'Regular'),
('Rafael Viola', '2005-11-07', 'Regular'),
('Rafael Raposo', '2004-12-22', 'Regular'),
('Rodrigo Moura', '2004-03-18', 'Regular'),
('Rodrigo Costa', '2004-01-10', 'Regular');

INSERT INTO Treinadores (Nome, Especialidade) VALUES 
('Silvia Câmera', 'Yoga'),
('José Daniel', 'CrossFit'),
('João Lima', 'Pilates');

INSERT INTO Aulas (Nome, TreinadorID, DataHora, Duracao, Estado, Capacidade) VALUES 
('Yoga', 1, '2024-07-19 08:00:00', 60, 'Disponível', 10),  
('CrossFit', 2, '2024-07-19 10:00:00', 60, 'Disponível', 10),  
('Pilates', 3, '2024-07-19 12:00:00', 60, 'Disponível', 20); 

INSERT INTO Inscricoes (MembroID, AulaID, DataInscricao) VALUES (1, 2, '2024-07-18');
INSERT INTO Inscricoes (MembroID, AulaID, DataInscricao) VALUES (2, 2, '2024-07-18');
INSERT INTO Inscricoes (MembroID, AulaID, DataInscricao) VALUES (3, 2, '2024-07-18');
INSERT INTO Inscricoes (MembroID, AulaID, DataInscricao) VALUES (4, 2, '2024-07-18');
INSERT INTO Inscricoes (MembroID, AulaID, DataInscricao) VALUES (5, 2, '2024-07-18');
INSERT INTO Inscricoes (MembroID, AulaID, DataInscricao) VALUES (6, 2, '2024-07-18');
INSERT INTO Inscricoes (MembroID, AulaID, DataInscricao) VALUES (7, 2, '2024-07-18');
INSERT INTO Inscricoes (MembroID, AulaID, DataInscricao) VALUES (8, 2, '2024-07-18');
INSERT INTO Inscricoes (MembroID, AulaID, DataInscricao) VALUES (9, 2, '2024-07-18');
INSERT INTO Inscricoes (MembroID, AulaID, DataInscricao) VALUES (10, 2, '2024-07-18');
INSERT INTO Inscricoes (MembroID, AulaID, DataInscricao) VALUES (11, 2, '2024-07-18');

