Write-Host "Configuring WSL System..." -ForegroundColor "Yellow"

Enable-WindowsOptionalFeature -Online -All -FeatureName "Microsoft-Windows-Subsystem-Linux" -NoRestart -WarningAction SilentlyContinue | Out-Null