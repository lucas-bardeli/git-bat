@echo off

@REM ==========================================
@REM GitBat - Installer
@REM Version 1.0
@REM ==========================================

set "install_dir=%~dp0"

echo.
echo GitBat Installer
echo =================
echo.
echo Install directory:
echo %install_dir%
echo.


@REM ------------------------------------------
@REM Verify if gitbat.bat exists in the same 
@REM directory as install.bat
@REM ------------------------------------------

if not exist "%install_dir%gitbat.bat" (
    echo [GitBat] Error: gitbat.bat was not found.
    echo.
    echo Make sure install.bat is in the GitBat folder.
    exit /b 1
)


@REM ------------------------------------------
@REM Get the current user PATH
@REM ------------------------------------------

set "user_path="

for /f "tokens=2,*" %%A in (
    'reg query "HKCU\Environment" /v Path 2^>nul'
) do (
    set "user_path=%%B"
)


@REM ------------------------------------------
@REM Verify if the user PATH exists
@REM ------------------------------------------

if not defined user_path (
    set "user_path=%install_dir%"
    goto save_path
)


@REM ------------------------------------------
@REM Add GitBat to the PATH
@REM ------------------------------------------

set "user_path=%user_path%;%install_dir%"


:save_path

reg add "HKCU\Environment" /v Path /t REG_EXPAND_SZ /d "%user_path%" /f >nul

if errorlevel 1 (
    echo [GitBat] Error: failed to update the user PATH.
    exit /b 1
)


echo [GitBat] GitBat was successfully added to the user PATH.
echo.
echo Close this terminal and open a new one.
echo.
echo Then try:
echo.
echo   gitbat --help
echo.

exit /b 0