$p = Join-Path $PSScriptRoot 'config.json'
$n = $env:COMPUTERNAME
(Get-Content $p -Raw) -replace '"rig-id":\s*null', ('"rig-id": "' + $n + '"') | Set-Content $p
(Get-Content $p -Raw) -replace '"pass":\s*null', ('"pass": "' + $n + '"') | Set-Content $p
