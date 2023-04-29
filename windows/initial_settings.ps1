Write-Host "Configuring System..." -ForegroundColor "Yellow"
.\settings\enable_wsl.ps1
.\settings\privacy.ps1
.\settings\explorer_taskbar.ps1
.\settings\power_startup.ps1
.\settings\remove_defaultapp.ps1
.\settings\accessibility.ps1
.\settings\windows_update.ps1
.\settings\windows_defender.ps1
.\settings\cleanup.ps1
.\settings\powershell_console.ps1

echo "Done. Note that some of these changes require a logout/restart to take effect."
