#Requires -RunAsAdministrator

## Prerequisites 
echo "Checking Pre requisites (Git, FiraCode NF)"
try {$null = git --version} 
catch [System.Management.Automation.CommandNotFoundException] {
    Write-Host "Git is not installed."
    Write-Host "Download and install git"
    Start-Process "https://gitforwindows.org/"
    exit
}
echo "Git is installed"

[System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
$FIRACODE=(New-Object System.Drawing.Text.InstalledFontCollection).Families | findstr "FiraCode"
if ( $FIRACODE -eq 'FiraCode NF' )
{
    echo "FiraCode NF is installed"
}
else
{
    echo "FiraCode is not installed"
    echo "Download and install FiraCode NF"
    #Start-Process "https://eng.m.fontke.com/font/61026051/download/"
    #exit
}

## Install Powershell 7.*.*
$PW7 = 'C:\Program Files\PowerShell\7\pwsh.exe'
if (-not(Test-Path -Path $PW7))
{
    echo "Installing Powershell 7 or greater with winget..."
    winget install --id Microsoft.Powershell --source winget
}
else
{
    echo "Powershell 7.*.* already installed"
}

## Install VScode
echo "Checking VSCode Installation"
try {$null = code --version} 
catch [System.Management.Automation.CommandNotFoundException] {
    Write-Host "Vscode is not installed."
    Write-Host "Downloading and installing Vscode..."
    winget install -e --id Microsoft.VisualStudioCode
}
echo "VScode is already installed"

## Installing scoop
echo "Checking Scoop Installation"
try {$null = scoop --version} 
catch [System.Management.Automation.CommandNotFoundException] {
    Write-Host "Scoop is not installed."
    Write-Host "Downloading and installing Scoop..."
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUse
    iex "& {$(irm get.scoop.sh)} -RunAsAdmin"
}
echo "Scoop is already installed"

scoop install sudo
sudo scoop install 7zip git openssh --global
scoop install python

## Installing Choco
echo "Installing Choco"
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

echo "Installing Keypirinha"
choco install keypirinha
echo "Installing Filezilla"
choco install filezilla


# ## Installing Oh-My-Posh!
echo "Installing oh-my-posh..."
scoop install https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/oh-my-posh.json
echo "Installing PowerShell Modules and Importig PowerShell Profile settings..."
Install-Module -Name PSReadLine -AllowClobber -Force
Install-Module -Name Terminal-Icons -AllowClobber -Force
Update-Module
echo "Coping Powershell7 Profile settings..."
cp -Path '..\Microsoft.PowerShell_profile.ps1' -Destination $PROFILE -Force
echo "done"

## Installing Windows Termianal
echo "Checking Windows Terminal Installation"
try {$null = wt --version} 
catch [System.Management.Automation.CommandNotFoundException] {
    Write-Host "Windows Terminal is not installed."
    Write-Host "Downloading and installing Windows Terminal..."
    winget install -e --id Microsoft.WindowsTerminal   
}
echo "Windows Terminal is already installed"
echo "Coping Windows Terminal profile settings"
cp -Path '..\settings.json' -Destination $env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json -Force
echo "done"

echo "If ligatures are missing in Windows Terminal remember to clean Windows Font Cache"
Start-Process "https://thegeekpage.com/how-to-delete-the-font-cache-on-windows-10/"
