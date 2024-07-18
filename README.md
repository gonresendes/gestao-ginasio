# Sistema de Gestão de Ginásio
## Descrição

Este projeto é um Sistema de Gestão de Ginásio que gerencia membros, treinadores, aulas e inscrições. Inclui a criação de tabelas e triggers para assegurar a integridade dos dados e impor regras de negócio específicas.

## Diagrama ER
![image](https://github.com/user-attachments/assets/da0c02ee-cd81-4607-b05a-1bf963469c43)

## Estrutura do Projeto

- `DATA`: Script SQL com todos os ficheiros necessários para a criação deste projeto com os dados inseridos.
- `create-tables`: Script SQL para criar as tabelas.
- `inserts`: Script SQL para inserir os dados nas tabelas.
- `triggers`: Script SQL contendo os triggers deste projeto.
- `consultas`: Scripts SQL contendo algumas consultas informativas dos dados.
- `stored-procedures`: Scripts SQL contendo algumas funções para desempenhar dentro da base de dados.
- `cursores`: Script SQL para gerar um relatório que lista todas as aulas e a quantidade de inscrições em cada uma num determinado período.


### Pré-requisitos

- MySQL Server instalado
- Um cliente MySQL (como MySQL Workbench, phpMyAdmin, etc.)

### Guia de Instalação
1. Fazer a criação das tabelas a partir da pasta (CREATETABLES.sql);
2. Seguir para a pasta inserts para inserir todos os dados nas tabelas;
3. Fazer as consultas a partir da pasta consultas e fazer as consultas desejadas;
4. Seguir para a pasta triggers e fazer a sua ativação;
5. Ir á pasta stored_procedures e correr os desejados para com as modificações desejadas;
6. Criar um relatório a partir da pasta cursores.

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




