# Profile for the Microsoft.Powershell Shell, only. (Not Visual Studio or other PoSh instances)
# ===========

oh-my-posh init pwsh --config "$HOME/Documents/WindowsPowerShell/theme.omp.json" | Invoke-Expression
Import-Module PSReadLine | Out-Null
Import-Module -Name Terminal-Icons | Out-Null
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Import-Module git-aliases -DisableNameChecking

$env:FZF_CTRL_T_COMMAND='$env:FZF_DEFAULT_COMMAND'
$env:FZF_COMPLETION_TRIGGER='~~'
$env:FZF_DEFAULT_OPTS='--multi --height=80%  --layout=reverse-list --border=double --info=inline'

## Zoxide init
Invoke-Expression (& { (zoxide init --cmd cd powershell | Out-String) })
## Starship init
Invoke-Expression (&starship init powershell)