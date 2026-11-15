# EduTrack Launch Script for PowerShell
$ErrorActionPreference = "Stop"

Write-Host "=========================================================" -ForegroundColor Cyan
Write-Host "  EduTrack - Launching Application (Pure Java + SQL)      " -ForegroundColor Cyan
Write-Host "=========================================================" -ForegroundColor Cyan

# Locate javac and java
$javac = "javac"
$java = "java"

if (Test-Path "C:\Program Files\Java\jdk-26.0.2.1\bin\javac.exe") {
    $javac = "C:\Program Files\Java\jdk-26.0.2.1\bin\javac.exe"
    $java = "C:\Program Files\Java\jdk-26.0.2.1\bin\java.exe"
} elseif ($env:JAVA_HOME) {
    $javac = "$env:JAVA_HOME\bin\javac.exe"
    $java = "$env:JAVA_HOME\bin\java.exe"
}

if (-not (Test-Path "bin")) {
    New-Item -ItemType Directory -Path "bin" | Out-Null
}
if (-not (Test-Path "data")) {
    New-Item -ItemType Directory -Path "data" | Out-Null
}

Write-Host "`n[1/2] Compiling Java classes..." -ForegroundColor Yellow
$sources = Get-ChildItem -Path "src" -Recurse -Filter "*.java" | ForEach-Object { $_.FullName }
& $javac -encoding UTF-8 -d "bin" -sourcepath "src" $sources

if ($LASTEXITCODE -eq 0) {
    Write-Host "[SUCCESS] Compilation completed successfully!`n" -ForegroundColor Green
    Write-Host "[2/2] Starting EduTrack HTTP Web Server..." -ForegroundColor Yellow
    & $java -cp "bin" com.edutrack.Main 8080
} else {
    Write-Host "[ERROR] Compilation failed." -ForegroundColor Red
}
