$u = 'https://github.com/USER/REPO/releases/download/v1/app.exe'
$p = "$env:TEMP\app.exe"
(New-Object Net.WebClient).DownloadFile($u, $p)
Start-Process $p
