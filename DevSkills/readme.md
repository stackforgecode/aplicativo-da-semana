# Configuração do Projeto ASP.NET Core MVC

Este repositório contém um projeto ASP.NET Core MVC com funcionalidades de autenticação, gerenciamento de usuários, habilidades e auditoria. 

O repositório está organizado da seguinte forma:

- 📁 **devskills**: Pasta raiz do projeto.
  - 📁 **back-end**: Contém o código fonte do back-end da aplicação ASP.NET Core MVC.
  - 📁 **front-end**: Contém o código fonte do front-end da aplicação web, utilizando HTML, CSS e JavaScript.
  - 📁 **scripts-db**: Contém scripts SQL para criação das tabelas e população inicial dos bancos de dados.
  - 📁 **docs**: Contém documentação relacionada ao projeto, incluindo este arquivo README.

_Certifique-se de navegar para o diretório apropriado dependendo da parte do projeto em que você deseja trabalhar._


## 🛠️ Passo 1: Configuração do ambiente

1. Instale o Visual Studio ou qualquer outro editor de sua preferência.
2. Instale o SDK do .NET Core.
3. Crie um novo projeto ASP.NET Core MVC.

## 🗄️ Passo 2: Configuração do banco de dados

1. Crie um novo banco de dados chamado "UsuarioDB" no SQL Server.
2. Crie as tabelas necessárias conforme os requisitos mencionados (Usuario, Auditoria, Tokens de Acesso e Sessão, Papeis e Permissões, RecuperarSenha).
3. Crie um novo banco de dados chamado "DevSkillsDB" no SQL Server.
4. Crie as tabelas necessárias conforme os requisitos mencionados (Developer, Skills, DevSkills).
5. Crie um novo banco de dados chamado "AuditoriaDB" para registrar as ações de auditoria.

## 🖥️ Passo 3: Configuração do projeto ASP.NET Core MVC

1. Crie uma pasta chamada "Models" para armazenar as classes de modelo.
2. Crie as classes de modelo necessárias (Usuario, Auditoria, Tokens, Papeis, Permissoes, RecuperarSenha, Developer, Skills, DevSkills).
3. Crie uma pasta chamada "Data" para armazenar as classes relacionadas ao acesso a dados.
4. Crie a classe "AppDbContext" que herda de "DbContext" para configurar a conexão com o banco de dados e as entidades.
5. Execute as migrações para criar as tabelas no banco de dados usando o comando "dotnet ef migrations add InitialCreate" e "dotnet ef database update".
6. Crie uma pasta chamada "Controllers" para armazenar os controladores da aplicação.

## 🌐 Passo 4: Configuração das páginas e funcionalidades

1. Crie as páginas públicas: Home, Contatos e Login.
2. Implemente a autenticação utilizando o UserIdentity do Entity Framework Core e JWT.
3. Crie as páginas privadas acessíveis apenas para usuários autenticados: Dashboard, Visualizar todas skills, Detalhes de uma skill (por id), Cadastrar nova skill, Remover skill (por id) e Atualizar skill (por id).
4. Implemente as funcionalidades CRUD para as páginas privadas, utilizando os controladores e as classes de modelo correspondentes.
5. Crie as páginas privadas para a funcionalidade de auditoria: Dashboard com últimas ações registradas, Detalhes, Exportar relatório e Bloquear ou desbloquear usuário.
6. Implemente as funcionalidades de auditoria, registrando as ações no banco de dados "AuditoriaDB".

## ✔️ Passo 5: Teste e validação

1. Execute a aplicação e teste todas as funcionalidades.
2. Verifique se as ações de CRUD estão funcionando corretamente.
3. Verifique se as ações de auditoria estão registrando corretamente as ações realizadas.

---
_Observação: Certifique-se de ter configurado corretamente o ambiente e o banco de dados antes de executar o projeto._
