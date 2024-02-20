# Profile for the Microsoft.Powershell Shell, only. (Not Visual Studio or other PoSh instances)
# ===========

oh-my-posh init pwsh --config "$HOME/Documents/WindowsPowerShell/theme.omp.json" | Invoke-Expression
Import-Module PSReadLine | Out-Null
Import-Module -Name Terminal-Icons | Out-Null
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Import-Module git-aliases -DisableNameChecking
