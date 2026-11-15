@echo off
setlocal enabledelayedexpansion

echo =========================================================
echo  EduTrack - Launching Application
echo =========================================================

call build.bat
if %ERRORLEVEL% neq 0 (
    echo Compilation failed. Cannot start application.
    pause
    exit /b %ERRORLEVEL%
)

set JAVA_CMD=java
where java >nul 2>&1
if %ERRORLEVEL% neq 0 (
    if exist "C:\Program Files\Java\jdk-26.0.2.1\bin\java.exe" (
        set "JAVA_CMD=C:\Program Files\Java\jdk-26.0.2.1\bin\java.exe"
    ) else if defined JAVA_HOME (
        set "JAVA_CMD=%JAVA_HOME%\bin\java.exe"
    )
)

echo Starting EduTrack Server...
"%JAVA_CMD%" -cp bin com.edutrack.Main 8080
pause
