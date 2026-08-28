@echo off

@REM ==========================================
@REM GitBat - Simplified Git Workflow
@REM Version 1.1
@REM ==========================================

@REM ------------------------------------------
@REM COLORS
@REM ------------------------------------------

set "GREEN=[92m"
set "RED=[91m"
set "YELLOW=[93m"
set "PURPLE=[95m"
set "ORANGE=[38;5;208m"
set "RESET=[0m"

@REM ------------------------------------------
@REM 1. Verify if it was called -h or --help
@REM ------------------------------------------

if "%1"=="-h" goto help
if "%1"=="--help" goto help


@REM ------------------------------------------
@REM 2. Verify if the first argument is
@REM    -m or --message
@REM ------------------------------------------

if "%1"=="-m" goto validate_message
if "%1"=="--message" goto validate_message

echo %RED%[GitBat]%RESET% Error: invalid argument.
echo.
echo Use "gitbat --help" to see the available commands.
exit /b 1


:validate_message

@REM ------------------------------------------
@REM 3. Verifies if a commit message was provided
@REM ------------------------------------------

if "%~2"=="" (
    echo %RED%[GitBat]%RESET% Error: no commit message was provided.
    echo.
    echo %ORANGE%Example:%RESET%
    echo   gitbat -m "my commit message"
    exit /b 1
)

@REM Saves the commit message
set "message=%~2"


@REM ------------------------------------------
@REM 4. Verifies if Git is installed
@REM ------------------------------------------

where git >nul 2>&1

if errorlevel 1 (
    echo %RED%[GitBat]%RESET% Error: Git not found in PATH.
    echo.
    echo Verify that Git is installed and available in the PATH.
    exit /b 1
)


@REM ------------------------------------------
@REM 5. Verifies if we are inside a
@REM    Git repository
@REM ------------------------------------------

git rev-parse --is-inside-work-tree >nul 2>&1

if errorlevel 1 (
    echo %RED%[GitBat]%RESET% Error: this directory is not a Git repository.
    exit /b 1
)


@REM ------------------------------------------
@REM 6. Adds the files
@REM ------------------------------------------

echo.
echo %YELLOW%[GitBat]%RESET% Executing git add .
echo.

git add .

if errorlevel 1 (
    echo.
    echo %RED%[GitBat]%RESET% Error: git add failed.
    exit /b 1
)


@REM ------------------------------------------
@REM 7. Creates the commit
@REM ------------------------------------------

echo.
echo %YELLOW%[GitBat]%RESET% Executing git commit...
echo.

git commit -m "%message%"

if errorlevel 1 (
    echo.
    echo %RED%[GitBat]%RESET% Error: the commit was not created.
    exit /b 1
)


@REM ------------------------------------------
@REM 8. Verifies if --push was specified
@REM ------------------------------------------

if "%3"=="--push" goto push

goto success


:push

@REM ------------------------------------------
@REM 9. Identifies the current branch
@REM ------------------------------------------

for /f "delims=" %%A in ('git branch --show-current') do set "branch=%%A"

if "%branch%"=="" (
    echo.
    echo %RED%[GitBat]%RESET% Error: could not identify the current branch.
    exit /b 1
)


@REM ------------------------------------------
@REM 10. Executes the push
@REM ------------------------------------------

echo.
echo %PURPLE%[GitBat]%RESET% Current branch: %branch%
echo.
echo %YELLOW%[GitBat]%RESET% Executing git push origin %branch%
echo.

git push origin "%branch%"

if errorlevel 1 (
    echo.
    echo %RED%[GitBat]%RESET% Error: the push failed.
    exit /b 1
)

goto success


:success

echo.
echo %GREEN%[GitBat]%RESET% Operation completed successfully.
exit /b 0


@REM ==========================================
@REM HELP
@REM ==========================================

:help

echo.
echo %YELLOW%GitBat - Simplified Git Workflow%RESET%
echo.
echo %PURPLE%Usage:%RESET%
echo.
echo   gitbat -m "commit message"
echo   gitbat --message "commit message"
echo.
echo %PURPLE%With push:%RESET%
echo.
echo   gitbat -m "commit message" --push
echo   gitbat --message "commit message" --push
echo.
echo %PURPLE%Options:%RESET%
echo.
echo   -m, --message
echo       Define the commit message.
echo.
echo   --push
echo       Executes the push to origin on the current branch.
echo.
echo   -h, --help
echo       Show this help message.
echo.

exit /b 0