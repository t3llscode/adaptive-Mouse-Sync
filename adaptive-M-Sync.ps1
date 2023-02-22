$path = $args[0]

. $path\MouseSpeed.ps1 # Thanks to raevilman https://github.com/raevilman/windows-scripts
$settings = Get-Content -Raw -Path $path\settings.json | ConvertFrom-Json

while ($true) {
    $sens = $settings."default"
    $process = Get-Process

    foreach ($array in $settings."nameANDspeed") {
        if ($process | Where-Object { $array[0] -contains $_.ProcessName }) {
            $sens = $array[1]
        }
    }

    if ((Get-ItemProperty 'HKCU:\Control Panel\Mouse' | Select-Object MouseSensitivity) -ne $sens) {
        Set-Mouse -Speed $sens
    }
    Start-Sleep -Seconds $settings."interval"
}