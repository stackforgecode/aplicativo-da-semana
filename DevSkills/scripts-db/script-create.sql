-- Criar o banco de dados "UsuarioDB"
CREATE DATABASE UsuarioDB;
GO

-- Usar o banco de dados "UsuarioDB"
USE UsuarioDB;
GO

-- Criar a tabela "Usuario"
CREATE TABLE Usuario (
    Id INT PRIMARY KEY,
    Nome VARCHAR(50),
    Email VARCHAR(50),
    Senha VARCHAR(50)
);
GO

-- Criar a tabela "Auditoria"
CREATE TABLE Auditoria (
    Id INT PRIMARY KEY,
    UsuarioId INT,
    Acao VARCHAR(50),
    DataHora DATETIME,
    FOREIGN KEY (UsuarioId) REFERENCES Usuario(Id)
);
GO

-- Criar a tabela "Tokens de Acesso e Sessão"
CREATE TABLE TokensAcessoSessao (
    Id INT PRIMARY KEY,
    UsuarioId INT,
    Token VARCHAR(100),
    Tipo VARCHAR(50),
    DataExpiracao DATETIME,
    FOREIGN KEY (UsuarioId) REFERENCES Usuario(Id)
);
GO

-- Criar a tabela "Papeis e Permissões"
CREATE TABLE PapeisPermissoes (
    Id INT PRIMARY KEY,
    Papel VARCHAR(50),
    Permissao VARCHAR(50)
);
GO

-- Criar a tabela "RecuperarSenha"
CREATE TABLE RecuperarSenha (
    Id INT PRIMARY KEY,
    UsuarioId INT,
    Token VARCHAR(100),
    DataExpiracao DATETIME,
    FOREIGN KEY (UsuarioId) REFERENCES Usuario(Id)
);
GO

-- Criar o banco de dados "DevSkillsDB"
CREATE DATABASE DevSkillsDB;
GO

-- Usar o banco de dados "DevSkillsDB"
USE DevSkillsDB;
GO

-- Criar a tabela "Developer"
CREATE TABLE Developer (
    Id INT PRIMARY KEY,
    Nome VARCHAR(50),
    Email VARCHAR(50)
);
GO

-- Criar a tabela "Skills"
CREATE TABLE Skills (
    Id INT PRIMARY KEY,
    Nome VARCHAR(50)
);
GO

-- Criar a tabela "DevSkills"
CREATE TABLE DevSkills (
    Id INT PRIMARY KEY,
    DeveloperId INT,
    SkillId INT,
    Nivel INT,
    FOREIGN KEY (DeveloperId) REFERENCES Developer(Id),
    FOREIGN KEY (SkillId) REFERENCES Skills(Id)
);
GO

-- Criar o banco de dados "AuditoriaDB"
CREATE DATABASE AuditoriaDB;
GO

-- Usar o banco de dados "AuditoriaDB"
USE AuditoriaDB;
GO

-- Criar a tabela para registrar as ações de auditoria
CREATE TABLE Auditoria (
    Id INT PRIMARY KEY,
    UsuarioId INT,
    Acao VARCHAR(50),
    DataHora DATETIME,
    FOREIGN KEY (UsuarioId) REFERENCES UsuarioDB.Usuario(Id)
);
GO
