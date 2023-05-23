# Serviços e Conexões

Para criar um serviço de exportação e importação de dados em uma API .NET Core 7.0 com autenticação JWT e um frontend Razor MVC, você precisará seguir alguns passos:

1. Configurar a autenticação JWT na sua API:
   - Instale o pacote NuGet `Microsoft.AspNetCore.Authentication.JwtBearer` para adicionar suporte ao JWT no seu projeto.
   - No arquivo `Startup.cs`, no método `ConfigureServices`, adicione o seguinte código para configurar a autenticação JWT:

```csharp
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Text;

// ...

services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
    .AddJwtBearer(options =>
    {
        options.TokenValidationParameters = new TokenValidationParameters
        {
            ValidateIssuer = true,
            ValidateAudience = true,
            ValidateLifetime = true,
            ValidateIssuerSigningKey = true,
            ValidIssuer = "your_issuer",
            ValidAudience = "your_audience",
            IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("your_secret_key"))
        };
    });
```

Certifique-se de substituir `"your_issuer"`, `"your_audience"` e `"your_secret_key"` pelos valores corretos para sua aplicação.

2. Criar um endpoint de exportação na sua API:
   - Crie um novo método de ação em um controlador existente ou crie um novo controlador para lidar com a exportação de dados.
   - Decore o método de ação com `[Authorize]` para exigir autenticação.
   - Dentro do método de ação, implemente a lógica para exportar os dados para um formato desejado (por exemplo, CSV, JSON, etc.).
   - Retorne o resultado da exportação, por exemplo, um arquivo para download ou um conteúdo JSON.

```csharp
[Authorize]
[HttpGet("export")]
public IActionResult ExportData()
{
    // Lógica para exportar os dados aqui
    // Exemplo de retorno de um arquivo CSV
    byte[] fileBytes = // Dados do arquivo CSV
    string fileName = "exported_data.csv";
    return File(fileBytes, "text/csv", fileName);
}
```

3. Criar um serviço de importação no frontend Razor MVC:
   - Crie uma página ou uma rota no seu frontend para permitir que os usuários selecionem um arquivo para importação.
   - No controlador correspondente à página ou rota, adicione um método para lidar com a importação de dados.
   - No método de ação, verifique se o usuário está autenticado e autorizado para acessar o serviço de importação.
   - Implemente a lógica para processar o arquivo importado e atualizar os dados na API.

```csharp
// Controlador para importação
public class ImportController : Controller
{
    [Authorize]
    [HttpPost("import")]
    public IActionResult ImportData(IFormFile file)
    {
        // Verificar autenticação e autorização

        // Lógica para processar o arquivo importado
        // Atualize os dados na API conforme necessário

        return RedirectToAction("Index", "Home");
    }
}
```

Desculpe, parece que minha resposta anterior não estava completa. Vou fornecer um exemplo mais detalhado de como criar o serviço de exportação e importação com autenticação JWT em uma API .NET Core 7.0 e um frontend Razor MVC.

Backend (API):

1. Configurar a autenticação JWT na sua API:
   - Instale o pacote NuGet `Microsoft.AspNetCore.Authentication.JwtBearer` para adicionar suporte ao JWT no seu projeto.
   - No arquivo `Startup.cs`, no método `ConfigureServices`, adicione o seguinte código para configurar a autenticação JWT:

```csharp
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Text;

// ...

services.AddAuthentication(options =>
{
    options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
}).AddJwtBearer(options =>
{
    options.TokenValidationParameters = new TokenValidationParameters
    {
        ValidateIssuer = true,
        ValidateAudience = true,
        ValidateLifetime = true,
        ValidateIssuerSigningKey = true,
        ValidIssuer = "your_issuer",
        ValidAudience = "your_audience",
        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("your_secret_key"))
    };
});
```

Certifique-se de substituir `"your_issuer"`, `"your_audience"` e `"your_secret_key"` pelos valores corretos para sua aplicação.

2. Criar um endpoint de exportação na sua API:
   - Crie um novo método de ação em um controlador existente ou crie um novo controlador para lidar com a exportação de dados.
   - Decore o método de ação com `[Authorize]` para exigir autenticação.
   - Dentro do método de ação, implemente a lógica para exportar os dados para um formato desejado (por exemplo, CSV, JSON, etc.).
   - Retorne o resultado da exportação, por exemplo, um arquivo para download ou um conteúdo JSON.

```csharp
[Authorize]
[HttpGet("export")]
public IActionResult ExportData()
{
    // Lógica para exportar os dados aqui
    // Exemplo de retorno de um arquivo CSV
    byte[] fileBytes = // Dados do arquivo CSV
    string fileName = "exported_data.csv";
    return File(fileBytes, "text/csv", fileName);
}
```

Frontend (Razor MVC):

1. Crie uma página para permitir que os usuários acessem o serviço de exportação:
   - No seu projeto Razor MVC, crie uma nova página (por exemplo, Export.cshtml) com um formulário para acionar a exportação.
   - No formulário, adicione um botão para acionar a exportação e inclua um campo para o token JWT.

```html
@page
@model ExportModel

<form method="post" action="/import" enctype="multipart/form-data">
    <input type="hidden" name="token" value="@Model.JwtToken" />
    <button type="submit">Export Data</button>
</form>
```

2. No controlador correspondente à página, adicione um método para lidar com a exportação de dados:
   - Verifique se o usuário está autenticado e autorizado para acessar o serviço de exportação.
   - Faça uma solicitação HTTP para o endpoint de exportação da API, incluindo o token JWT no cabeçalho de autorização.

```csharp
public class ExportModel : PageModel
{
    public
    
}    
   
---

Desculpe pela confusão anterior. No caso de uma página Razor MVC, você pode lidar com a exportação de dados no controlador correspondente à página da seguinte maneira:

1. No controlador da página (por exemplo, ExportController.cs), adicione um método HTTP GET para exibir a página de exportação:

```csharp
public class ExportController : Controller
{
    public IActionResult Index()
    {
        // Lógica para obter o token JWT do usuário autenticado
        string jwtToken = // Obtenha o token JWT do usuário autenticado

        var model = new ExportModel
        {
            JwtToken = jwtToken
        };

        return View(model);
    }
}
```

2. Crie uma classe de modelo (por exemplo, ExportModel.cs) para armazenar o token JWT:

```csharp
public class ExportModel
{
    public string JwtToken { get; set; }
}
```

3. Crie uma página Razor correspondente (por exemplo, Index.cshtml) para exibir o formulário de exportação:

```html
@model ExportModel

<form method="post" action="/export">
    <input type="hidden" name="token" value="@Model.JwtToken" />
    <button type="submit">Export Data</button>
</form>
```

4. No mesmo controlador, adicione um método HTTP POST para lidar com o envio do formulário de exportação:

```csharp
[HttpPost("/export")]
public async Task<IActionResult> ExportData(string token)
{
    // Verificar a autenticidade e validade do token JWT

    // Criar uma solicitação HTTP para o endpoint de exportação da API
    var httpClient = new HttpClient();
    httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

    var response = await httpClient.GetAsync("http://your-api-url/export");

    // Verificar o status da resposta e tratar adequadamente
    if (response.IsSuccessStatusCode)
    {
        // Processar o arquivo de exportação ou mostrar uma mensagem de sucesso
        // Exemplo: byte[] fileBytes = await response.Content.ReadAsByteArrayAsync();
    }
    else
    {
        // Lidar com a falha na exportação
        // Exemplo: string errorMessage = await response.Content.ReadAsStringAsync();
    }

    return RedirectToAction("Index", "Home");
}
```

Certifique-se de substituir "http://your-api-url/export" pela URL correta do endpoint de exportação da sua API.

Com esse código, quando o usuário acessar a página de exportação, o token JWT será obtido do usuário autenticado e será enviado junto com a solicitação HTTP POST para o endpoint de exportação da API. Você pode processar o arquivo de exportação no lado do servidor ou fornecer um link para download na resposta da API, dependendo da sua implementação específica.
    
