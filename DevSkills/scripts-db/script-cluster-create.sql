-- Criar o cluster
CREATE CLUSTERED INDEX IX_UsuarioDB ON UsuarioDB.Usuario (Id);
CREATE CLUSTERED INDEX IX_DevSkillsDB ON DevSkillsDB.Developer (Id);
CREATE CLUSTERED INDEX IX_AuditoriaDB ON AuditoriaDB.Auditoria (Id);
