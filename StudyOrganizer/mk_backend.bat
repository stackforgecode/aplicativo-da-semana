dotnet new webapi -o api-study-organizer -f net7.0
    cd api-study-organizer/
    dotnet new globaljson --sdk-version 7.0.203
    
    dotnet dev-certs https --clean /Y
    dotnet dev-certs https --clean --import ./certificate.pfx -p $CREDENTIAL_PLACEHOLDER$
    dotnet dev-certs https --check --trust
    dotnet dev-certs https -ep ./certificate.pfx -p $CREDENTIAL_PLACEHOLDER$ --trust
    dotnet dev-certs https -ep ./certificate.crt --trust --format PEM
    dotnet dev-certs https -ep ./certificate.crt -p $CREDENTIAL_PLACEHOLDER$ --trust --format PEM

    dotnet new gitignore
    @echo off
    echo testsLocais/ >> .gitignore
    echo **\.vscode/ >> .gitignore
    echo **\.history/ >> .gitignore

    del WeatherForecast.cs
    del Controllers\\WeatherForecastController.cs
    del appsettings.json    
    
    Copy /Y "G:\@StackForge\StudyOrganizer\docs\textos\appsettings.json" "G:\@StackForge\StudyOrganizer\api-study-organizer\appsettings.json"
    
    dotnet user-secrets init

    dotnet user-secrets set ConnectionStrings:YourDatabaseAlias "Server=localhost,1433;Database=StudyOrganizeDB;User ID=sa;Password=Local@123456789;Trusted_Connection=True"

    dotnet add package Microsoft.EntityFrameworkCore --version 7.0.5
    dotnet add package Microsoft.EntityFrameworkCore.Tools --version 7.0.5    
    dotnet add package Microsoft.EntityFrameworkCore.Design --version 7.0.5
    dotnet add package Microsoft.EntityFrameworkCore.SqlServer --version 7.0.5
    dotnet add package Microsoft.AspNetCore.Authentication.JwtBearer --version 7.0.5
    dotnet add package Microsoft.AspNetCore.Identity.EntityFrameworkCore --version 7.0.5
    dotnet add package Microsoft.AspNetCore.Identity.UI
    dotnet add package Microsoft.Extensions.Configuration.UserSecrets --version 7.0.0
    dotnet add package System.Diagnostics.DiagnosticSource --version 7.0.2
    dotnet add package Microsoft.VisualStudio.Web.CodeGeneration --version 7.0.6
    dotnet add package Microsoft.VisualStudio.Web.CodeGeneration.Utils --version 7.0.6
    dotnet add package Microsoft.VisualStudio.Web.CodeGeneration.Core --version 7.0.6
    dotnet add package Microsoft.VisualStudio.Web.CodeGeneration.Design --version 7.0.6

    REM dotnet add package Swashbuckle.AspNetCore.Swagger --version 6.5.0
    REM dotnet add package Swashbuckle.AspNetCore.SwaggerGen --version 6.5.0
    REM dotnet add package Swashbuckle.AspNetCore.SwaggerUI --version 6.5.0
    REM dotnet add package Microsoft.AspNetCore.Mvc.NewtonsoftJson --version 7.0.5
    

REM Path: install_pkg.bat