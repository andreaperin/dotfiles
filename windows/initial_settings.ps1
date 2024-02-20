Write-Host "Configuring System..." -ForegroundColor "Yellow"
. windows\settings\enable_wsl.ps1
. windows\settings\explorer_taskbar.ps1
. windows\settings\power_startup.ps1
. windows\settings\cleanup.ps1

echo "Done. Note that some of these changes require a logout/restart to take effect."
