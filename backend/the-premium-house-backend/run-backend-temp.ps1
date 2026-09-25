$ErrorActionPreference = "Continue"
Set-Location "C:\Users\aarif\the-premium-house\backend\the-premium-house-backend"
$env:JAVA_HOME = "C:\Program Files\Eclipse Adoptium\jdk-21.0.12.101-hotspot"
$env:PATH = "$env:JAVA_HOME\bin;$env:PATH"
$env:JWT_SECRET = [Environment]::GetEnvironmentVariable("JWT_SECRET","User")
if ([string]::IsNullOrWhiteSpace($env:JWT_SECRET)) {
    $env:JWT_SECRET = [Environment]::GetEnvironmentVariable("JWT_SECRET","Machine")
}
& "C:\Users\aarif\tools\apache-maven-3.9.16\bin\mvn.cmd" spring-boot:run
