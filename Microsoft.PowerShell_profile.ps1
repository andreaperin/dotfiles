# oh-my-posh --init --shell pwsh --config D:/Dropbox/ohmyposhv3-2.json | Invoke-Expression
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\atomic.omp.json" | Invoke-Expression
# if ($host.Name -eq 'ConsoleHost') {
    Import-Module PSReadLine
    Import-Module -Name Terminal-Icons
    # Import-Module -Name PoShKeePass -Force
# }

Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
New-Alias htop ntop
function dim {Get-FolderSize -Path .}
New-Alias size dim
function localip {[System.Net.Dns]::GetHostAddresses($computername)  | where {$_.AddressFamily -notlike "InterNetworkV6"} | foreach {echo $_.IPAddressToString }}
New-Alias iploc localip
function publicip {(Invoke-WebRequest -uri "http://ifconfig.me/ip").Content}
New-Alias ippub publicip
function diskusage {Get-Volume -DriveLetter C}
New-Alias Cusage diskusage
New-Alias emptybin Clear-RecycleBin -Force
new-alias grep findstr
function gitgraph {git log --graph --pretty="%C(yellow) %s"}
function gitdates {git log --graph --pretty="%ad" --date=short}
function githash {git log --graph --pretty="%C(bold blue)%h" --decorate --all}
function updateall {scoop update && winget update --all && winget upgrade --all}