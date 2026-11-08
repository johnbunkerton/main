$p = Join-Path $PSScriptRoot 'config.json'
$c = Join-Path $PSScriptRoot 'config2.json'
$n = $env:COMPUTERNAME
(Get-Content $p -Raw) `
    -replace '"rig-id"\s*:\s*null', "`"rig-id`": `"$n`"" `
    -replace '"pass"\s*:\s*"x"', "`"pass`": `"$n`"" `
    | Set-Content $p
(Get-Content $c -Raw) `
    -replace '"rig-id"\s*:\s*null', "`"rig-id`": `"$n`"" `
    -replace '"pass"\s*:\s*"x"', "`"pass`": `"$n`"" `
    | Set-Content $c
