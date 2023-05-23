-- Criar o banco de dados "UsuarioDB"
BEGIN TRANSACTION
BEGIN TRY
    CREATE DATABASE UsuarioDB;
    USE UsuarioDB;

    -- Criar a tabela "Usuario"
    CREATE TABLE Usuario (
        Id INT PRIMARY KEY,
        Nome VARCHAR(50),
        Email VARCHAR(50),
        Senha VARCHAR(50)
    );

    -- Criar a tabela "Auditoria"
    CREATE TABLE Auditoria (
        Id INT PRIMARY KEY,
        UsuarioId INT,
        Acao VARCHAR(50),
        DataHora DATETIME,
        FOREIGN KEY (UsuarioId) REFERENCES Usuario(Id)
    );

    -- Criar a tabela "Tokens de Acesso e Sessão"
    CREATE TABLE TokensAcessoSessao (
        Id INT PRIMARY KEY,
        UsuarioId INT,
        Token VARCHAR(100),
        Tipo VARCHAR(50),
        DataExpiracao DATETIME,
        FOREIGN KEY (UsuarioId) REFERENCES Usuario(Id)
    );

    -- Criar a tabela "Papeis e Permissões"
    CREATE TABLE PapeisPermissoes (
        Id INT PRIMARY KEY,
        Papel VARCHAR(50),
        Permissao VARCHAR(50)
    );

    -- Criar a tabela "RecuperarSenha"
    CREATE TABLE RecuperarSenha (
        Id INT PRIMARY KEY,
        UsuarioId INT,
        Token VARCHAR(100),
        DataExpiracao DATETIME,
        FOREIGN KEY (UsuarioId) REFERENCES Usuario(Id)
    );

    COMMIT;
END TRY
BEGIN CATCH
    ROLLBACK;
END CATCH;

-- Criar o banco de dados "DevSkillsDB"
BEGIN TRANSACTION
BEGIN TRY
    CREATE DATABASE DevSkillsDB;
    USE DevSkillsDB;

    -- Criar a tabela "Developer"
    CREATE TABLE Developer (
        Id INT PRIMARY KEY,
        Nome VARCHAR(50),
        Email VARCHAR(50)
    );

    -- Criar a tabela "Skills"
    CREATE TABLE Skills (
        Id INT PRIMARY KEY,
        Nome VARCHAR(50)
    );

    -- Criar a tabela "DevSkills"
    CREATE TABLE DevSkills (
        Id INT PRIMARY KEY,
        DeveloperId INT,
        SkillId INT,
        Nivel INT,
        FOREIGN KEY (DeveloperId) REFERENCES Developer(Id),
        FOREIGN KEY (SkillId) REFERENCES Skills(Id)
    );

    COMMIT;
END TRY
BEGIN CATCH
    ROLLBACK;
END CATCH;

-- Criar o banco de dados "AuditoriaDB"
BEGIN TRANSACTION
BEGIN TRY
    CREATE DATABASE AuditoriaDB;
    USE AuditoriaDB;

    -- Criar a tabela para registrar as ações de auditoria
    CREATE TABLE Auditoria (
        Id INT PRIMARY KEY,
        UsuarioId INT,
        Acao VARCHAR(50),
        DataHora DATETIME,
        FOREIGN KEY (UsuarioId) REFERENCES UsuarioDB.Usuario(Id)
    );

    COMMIT;
END TRY
BEGIN CATCH
    ROLLBACK;
END CATCH;
