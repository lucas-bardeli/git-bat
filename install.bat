@echo off

@REM ==========================================
@REM GitBat - Installer
@REM Version 1.1
@REM ==========================================

@REM COLORS
set "GREEN=[92m"
set "RED=[91m"
set "YELLOW=[93m"
set "PURPLE=[95m"
set "ORANGE=[38;5;208m"
set "RESET=[0m"

echo.
echo %YELLOW%GitBat Installer%RESET%
echo =================
echo.

set "install_dir=%~dp0"

echo %PURPLE%[GitBat]%RESET% Install directory:
echo %install_dir%
echo.

if not exist "%install_dir%gitbat.bat" (
    echo %RED%[GitBat]%RESET% Error: gitbat.bat was not found.
    echo.
    pause
    exit /b 1
)

echo %YELLOW%[GitBat]%RESET% Checking user PATH...
echo.

powershell.exe -NoProfile -ExecutionPolicy Bypass -Command ^
"$install = '%install_dir%'; ^
$normalizedInstall = $install.TrimEnd('\'); ^
$path = [Environment]::GetEnvironmentVariable('Path', 'User'); ^
$entries = $path.Split(';'); ^
$found = $false; ^
foreach ($entry in $entries) { ^
    if ($entry.Trim().TrimEnd('\') -ieq $normalizedInstall) { ^
        $found = $true; ^
    } ^
}; ^
if ($found) { ^
    Write-Host '%ORANGE%[GitBat]%RESET% GitBat is already in the user PATH.'; ^
    exit 0 ^
}; ^
if ([string]::IsNullOrWhiteSpace($path)) { ^
    $newPath = $install ^
} else { ^
    $newPath = $path.TrimEnd(';') + ';' + $install ^
}; ^
[Environment]::SetEnvironmentVariable('Path', $newPath, 'User'); ^
Write-Host '%GREEN%[GitBat]%RESET% GitBat was successfully added to the user PATH.'"

if errorlevel 1 (
    echo.
    echo %RED%[GitBat]%RESET% Error: failed to update the user PATH.
    echo.
    pause
    exit /b 1
)

echo.
echo Close this terminal and open a new one.
echo.
echo %PURPLE%Then run:%RESET%
echo.
echo   gitbat --help
echo.

pause
exit /b 0