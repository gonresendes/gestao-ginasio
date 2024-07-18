# Sistema de Gestão de Ginásio
## Descrição

Este projeto é um Sistema de Gestão de Ginásio que gerencia membros, treinadores, aulas e inscrições. Inclui a criação de tabelas e triggers para assegurar a integridade dos dados e impor regras de negócio específicas.

![image](https://github.com/user-attachments/assets/da0c02ee-cd81-4607-b05a-1bf963469c43)

## Estrutura do Projeto

- `schema.sql`: Script SQL para criar as tabelas e triggers.
- `data.sql`: Script SQL para inserir dados iniciais nas tabelas.
- `triggers.sql`: Script SQL contendo os triggers.
- `README.md`: Documentação detalhada do projeto.


### Pré-requisitos

- MySQL Server instalado
- Um cliente MySQL (como MySQL Workbench, phpMyAdmin, etc.)

## Estrutura da Base de Dados
### Tabelas

Membros

-   ID: INT AUTO_INCREMENT PRIMARY KEY
-   Nome: VARCHAR(100) NOT NULL
-   DataNascimento: DATE NOT NULL
-   TipoMembro: VARCHAR(50) NOT NULL

Treinadores

-   ID: INT AUTO_INCREMENT PRIMARY KEY
-   Nome: VARCHAR(100) NOT NULL
-   Especialidade: VARCHAR(100) NOT NULL

Aulas

-   ID: INT AUTO_INCREMENT PRIMARY KEY
-   Nome: VARCHAR(100) NOT NULL
-   TreinadorID: INT NOT NULL (Foreign Key referenciando Treinadores.ID)
-   DataHora: DATETIME NOT NULL
-   Duracao: INT NOT NULL
-   Estado: VARCHAR(20) DEFAULT 'Disponível'
-   Capacidade INT NOT NULL

Inscricoes

-   ID: INT AUTO_INCREMENT PRIMARY KEY
-   MembroID: INT NOT NULL (Foreign Key referenciando Membros.ID)
-   AulaID: INT NOT NULL (Foreign Key referenciando Aulas.ID)
-   DataIncricao: DATE NOT NULL



