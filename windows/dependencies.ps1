### Install PowerShell Modules
Write-Host "Installing PowerShell Modules..." -ForegroundColor "Yellow"


Install-PackageProvider -Name NuGet

winget install JanDeDobbeleer.OhMyPosh -s winget

# dev tools and frameworks
winget install Microsoft.PowerShell                      --silent --accept-package-agreements
winget install Vim.Vim                                   --silent --accept-package-agreements
winget install -e --id Microsoft.PowerToys               --silent --accept-package-agreements

Refresh-Environment

Install-Module Posh-Git -Scope CurrentUser -Force
Install-Module PSWindowsUpdate -Scope CurrentUser -Force
Install-Module -Name Terminal-Icons -Repository PSGallery
Install-Module TabExpansionPlusPlus -Scope CurrentUser -Force -AllowClobber