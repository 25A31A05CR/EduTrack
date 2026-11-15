@echo off
setlocal enabledelayedexpansion

echo =========================================================
echo  EduTrack - Compiling Java Backend
echo =========================================================

set JAVAC_CMD=javac

where javac >nul 2>&1
if %ERRORLEVEL% neq 0 (
    if exist "C:\Program Files\Java\jdk-26.0.2.1\bin\javac.exe" (
        set "JAVAC_CMD=C:\Program Files\Java\jdk-26.0.2.1\bin\javac.exe"
    ) else if defined JAVA_HOME (
        set "JAVAC_CMD=%JAVA_HOME%\bin\javac.exe"
    )
)

if not exist "bin" mkdir bin
if not exist "data" mkdir data

echo Using compiler: %JAVAC_CMD%
"%JAVAC_CMD%" -encoding UTF-8 -d bin -sourcepath src src\com\edutrack\Main.java src\com\edutrack\model\*.java src\com\edutrack\database\*.java src\com\edutrack\handler\*.java src\com\edutrack\view\*.java

if %ERRORLEVEL% equ 0 (
    echo.
    echo [SUCCESS] Compilation finished successfully. Output in \bin
) else (
    echo.
    echo [ERROR] Compilation failed.
)

exit /b %ERRORLEVEL%
