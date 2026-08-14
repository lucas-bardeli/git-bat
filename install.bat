@echo off

@REM ==========================================
@REM GitBat - Installer
@REM Version 1.0
@REM ==========================================

echo.
echo GitBat Installer
echo =================
echo.

set "install_dir=%~dp0"

echo Install directory:
echo %install_dir%
echo.

if not exist "%install_dir%gitbat.bat" (
    echo [GitBat] Error: gitbat.bat was not found.
    echo.
    pause
    exit /b 1
)

echo Checking user PATH...
echo.

powershell.exe -NoProfile -ExecutionPolicy Bypass -Command ^
"$install = '%install_dir%'.TrimEnd('\'); ^
$path = [Environment]::GetEnvironmentVariable('Path', 'User'); ^
$entries = $path.Split(';'); ^
$found = $false; ^
foreach ($entry in $entries) { ^
    if ($entry.Trim().TrimEnd('\') -ieq $install) { ^
        $found = $true; ^
    } ^
}; ^
if ($found) { ^
    Write-Host '[GitBat] GitBat is already in the user PATH.'; ^
    exit 0 ^
}; ^
if ([string]::IsNullOrWhiteSpace($path)) { ^
    $newPath = $install ^
} else { ^
    $newPath = $path.TrimEnd(';') + ';' + $install ^
}; ^
[Environment]::SetEnvironmentVariable('Path', $newPath, 'User'); ^
Write-Host '[GitBat] GitBat was successfully added to the user PATH.'"

if errorlevel 1 (
    echo.
    echo [GitBat] Error: failed to update the user PATH.
    echo.
    pause
    exit /b 1
)

echo.
echo Close this terminal and open a new one.
echo.
echo Then run:
echo.
echo   gitbat --help
echo.

pause
exit /b 0