# Tabelas

## Membros

```sql
CREATE TABLE Membros (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    DataNascimento DATE NOT NULL,
    TipoMembro VARCHAR(50) NOT NULL
);
```
## Treinadores 
```sql
CREATE TABLE Treinadores (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Especialidade VARCHAR(100) NOT NULL
);
```
## Aulas

```sql
CREATE TABLE Aulas (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    TreinadorID INT NOT NULL,
    DataHora DATETIME NOT NULL,
    Duracao INT NOT NULL,
    Estado VARCHAR(20) DEFAULT 'Disponível',
    FOREIGN KEY (TreinadorID) REFERENCES Treinadores(ID)
);
```
## Incricoes

```sql
CREATE TABLE Inscricoes (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    MembroID INT NOT NULL,
    AulaID INT NOT NULL,
    DataInscricao DATE NOT NULL,
    FOREIGN KEY (MembroID) REFERENCES Membros(ID),
    FOREIGN KEY (AulaID) REFERENCES Aulas(ID)
);
```
