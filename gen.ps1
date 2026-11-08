$p = Join-Path $PSScriptRoot 'config.json'
$n = $env:COMPUTERNAME
(Get-Content $p -Raw) `
    -replace '"rig-id"\s*:\s*null', "`"rig-id`": `"$n`"" `
    -replace '"pass"\s*:\s*null', "`"pass`": `"$n`"" `
    | Set-Content $p
