. "C:\path\to\your\MouseSpeed.ps1" # Thanks to raevilman https://github.com/raevilman/windows-scripts

while ($true) {
    # default cursor speed:
    $sens = 10
    # paths to the FPS games you want to activate your different cursor speed with:
    $paths = @("D:\00 Program Files\SteamLibrary\steamapps\common\Counter-Strike Global Offensive\csgo.exe",
        "E:\00 Program Files\Riot Games\VALORANT\live\ShooterGame\Binaries\Win64\VALORANT-Win64-Shipping.exe")

    if (Get-Process | Where-Object { $paths -contains $_.Path }) {
        $sens = 1 # cursor speed value if FPS game is open
    }
    else {
        $sens = 10 # cursor speed value if no FPS game is open
    }
    if ((Get-ItemProperty 'HKCU:\Control Panel\Mouse' | Select-Object MouseSensitivity) -ne $sens) {
        Set-Mouse -Speed $sens
    }
    Start-Sleep -Seconds 15
}