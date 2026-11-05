# run.ps1 - starts the CapsLock productivity layer with Kanata.
#
# From a clone:   .\run.ps1
# From the web:   irm https://raw.githubusercontent.com/wayanlw/ww-kanata/main/run.ps1 | iex
#                 (downloads the needed files into a temp folder, runs them,
#                  and deletes the folder when Kanata exits)

$ErrorActionPreference = 'Stop'

# Raw GitHub base URL of the main branch. Used only when run without a local clone.
$BaseUrl = 'https://raw.githubusercontent.com/wayanlw/ww-kanata/main'

$Files = @(
    'Kanata/kanata_windows_gui_winIOv2_x64.exe',
    'Kanata/kanata_windows_tty_winIOv2_x64.exe',
    'Kanata/kanata_passthru_x64.dll',
    'Kanata/capsy.kbd'
)

$IsLocal = [bool]$PSScriptRoot
if ($IsLocal) {
    $Root = $PSScriptRoot
    $Temp = $null
} else {
    $Temp = Join-Path $env:TEMP ('ww-kanata-' + [guid]::NewGuid().ToString('N'))
    $Root = $Temp
    foreach ($f in $Files) {
        $dest = Join-Path $Root $f
        New-Item -ItemType Directory -Force -Path (Split-Path $dest) | Out-Null
        Invoke-WebRequest -Uri "$BaseUrl/$f" -OutFile $dest
    }
}

try {
    $Kanata = Join-Path $Root 'Kanata'
    $Gui    = Join-Path $Kanata 'kanata_windows_gui_winIOv2_x64.exe'
    $Tty    = Join-Path $Kanata 'kanata_windows_tty_winIOv2_x64.exe'
    $Cfg    = Join-Path $Kanata 'capsy.kbd'

    foreach ($p in @($Gui, $Tty, $Cfg)) {
        if (-not (Test-Path $p)) { throw "Missing file: $p" }
    }

    # Validate the config before starting. Fails fast on a bad config.
    & $Tty --check --cfg $Cfg
    if ($LASTEXITCODE -ne 0) { throw "Config check failed (exit $LASTEXITCODE)." }

    Write-Host 'Starting Kanata. Emergency exit: hold LCtrl + Space + Esc.'
    & $Gui --cfg $Cfg
}
finally {
    if ($Temp -and (Test-Path $Temp)) {
        Remove-Item -Recurse -Force $Temp
    }
}
