# Sistema de Gestão de Ginásio

![Uploading image.png…]()


## Descrição

Este projeto é um Sistema de Gestão de Ginásio que gerencia membros, treinadores, aulas e inscrições. Inclui a criação de tabelas e triggers para assegurar a integridade dos dados e impor regras de negócio específicas.

## Estrutura do Projeto

- `schema.sql`: Script SQL para criar as tabelas e triggers.
- `data.sql`: Script SQL para inserir dados iniciais nas tabelas.
- `triggers.sql`: Script SQL contendo os triggers.
- `README.md`: Documentação detalhada do projeto.

## Configuração e Instalação

### Pré-requisitos

- MySQL Server instalado
- Um cliente MySQL (como MySQL Workbench, phpMyAdmin, etc.)

### Passos para Configuração

1. **Clone o repositório:**

   ```bash
   git clone https://github.com/seu-usuario/sistema-gestao-ginasio.git
   cd sistema-gestao-ginasio
     ```

2. Crie a Base de Dados:
   ```
   CREATE DATABASE GINASIO;
   USE GINASIO;
   ```
3. Execute o script de criação de tabelas e triggers:
     ```
     SOURCE schema.sql;
     ```
4. Insira os dados inciais:
     ```
     SOURCE data.sql
     ```

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

Triggers
AtualizarEstadoAula

- Atualiza o estado da aula para 'Cheio' quando o número de inscrições atinge 10.

ImpedirInscricaoDuplicada

- Impede a inscrição de um membro em uma aula se ele já estiver inscrito.

ImpedirInscricaoCheia

- Impede novas inscrições em uma aula que já está cheia (10 inscrições).

