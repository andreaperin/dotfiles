## Install Powershell 7.*.*
echo "Installing Powershell 7 or greater with winget..."
winget install --id Microsoft.Powershell --source winget

# ## Installing Git
# echo "Installing Git with winget..."
# winget install -e --id Git.Git

## Installing scoop
echo "installing Scoop Package Manager..."
Set-ExecutionPolicy RemoteSigned -Scope CurrentUse
irm get.scoop.sh | iex
scoop install sudo
sudo scoop install 7zip git openssh --global
scoop install python

## Installing FiraCode
echo "Installing FiraCode..."
scoop bucket add nerd-fonts
scoop install FiraCode
echo "Font Cache Cleanup..."
.\dotfiles\fontcache-cleanup.ps1

## Installing Oh-My-Posh!
echo "Installing oh-my-posh..."
scoop install https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/oh-my-posh.json
scoop install vscode

echo "Installing PowerShell Modules and Importig PowerShell Profile settings..."
Install-Module -Name PSReadLine -AllowClobber -Force
Install-Module -Name Terminal-Icons -AllowClobber -Force
Update-Module
Copy-Item -Path '.\Microsoft.PowerShell_profile.ps1' -Destination $PROFILE -Force

## Installing Windows Termianal
echo "Installing Windows Terminal with winget..."
winget install -e --id Microsoft.WindowsTerminal

Copy-Item -Path '.\settings.json' -Destination $env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json -Force

echo "Windows Terminal still needs to be set as default Terminal"
echo "Downloa Install FileZilla"
echo "Sync Settings in VSCode and check if Fira Code is Fira Code NF"