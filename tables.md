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
