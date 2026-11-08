$p = Join-Path $PSScriptRoot 'config.json'
$n = $env:COMPUTERNAME
(Get-Content $p -Raw) -replace '"rig-id":\s*null', ('"rig-id": "' + $n + '"') | Set-Content $p
