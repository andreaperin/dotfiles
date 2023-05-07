Write-Host "Configuring System..." -ForegroundColor "Yellow"
. windows\settings\enable_wsl.ps1
. windows\settings\privacy.ps1
. windows\settings\explorer_taskbar.ps1
. windows\settings\power_startup.ps1
. windows\settings\remove_defaultapp.ps1
. windows\settings\accessibility.ps1
. windows\settings\windows_update.ps1
. windows\settings\windows_defender.ps1
. windows\settings\cleanup.ps1
. windows\settings\powershell_console.ps1

echo "Done. Note that some of these changes require a logout/restart to take effect."
