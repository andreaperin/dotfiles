### Install PowerShell Modules
Write-Host "Installing PowerShell Modules..." -ForegroundColor "Yellow"

 [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

winget install JanDeDobbeleer.OhMyPosh -s winget --silent --accept-package-agreements
winget install -e --id Microsoft.PowerToys --silent --accept-package-agreements
winget install -e --id vim.vim --silent --accept-package-agreements
winget install --id Microsoft.Powershell --source winget --silent --accept-package-agreements
winget install fzf
winget install ajeetdsouza.zoxide
winget install -e --id JesseDuffield.lazygit

Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

Install-Module Posh-Git -Scope CurrentUser -Force
Install-Module PSWindowsUpdate -Scope CurrentUser -Force
Install-Module -Name Terminal-Icons -Repository PSGallery
Install-Module TabExpansionPlusPlus -Scope CurrentUser -Force -AllowClobber
Install-Module git-aliases -Scope CurrentUser -AllowClobber


function Refresh-Environment {
    $locations = 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment',
                 'HKCU:\Environment'

    $locations | ForEach-Object {
        $k = Get-Item $_
        $k.GetValueNames() | ForEach-Object {
            $name  = $_
            $value = $k.GetValue($_)
            Set-Item -Path Env:\$name -Value $value
        }
    }

    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}

Refresh-Environment