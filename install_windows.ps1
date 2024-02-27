$ErrorActionPreference = "Stop"
$ErrorActionPreference = "Stop"

Write-Host "This script needs to be run from a powershell5 elevated terminal (NO PWSH7)." -ForegroundColor "Yellow"

$VIM_CONFIG="windows/vim.conf.yaml"
$GIT_CONFIG="windows/git.conf.yaml"
$PWSH_CONFIG="windows/powershellprofile.conf.yaml"
$ALACRITTY_CONFIG="windows/alacritty.conf.yaml"
$LAZYGIT_CONFIG="windows/lazygit.conf.yaml"

$DOTBOT_DIR="dotbot"

$DOTBOT_BIN="bin/dotbot"
$BASEDIR=$PSScriptRoot

$dependenciesPATH="windows\dependencies.ps1"
$settingsPATH="windows\initial_settings.ps1"

$ud1 = Read-Host "Do you want to install all dependecies OhMyPosh, Powershell, vim ? [y] yes, [n] no "
if ($ud1 -eq 'y')
{ 
    . $dependenciesPATH
}
else {Write-Host "dependencis will not be installed" }

$ud1 = Read-Host "Do you want to change windows settings ? [y] yes, [n] no "
if ($ud1 -eq 'y')
{ 
    . $settingsPATH 
}
else {Write-Host "settings will not be changed" }
##TODO pop up notification for changenging default directory alacritty
##TODO copy alacritty.toml, lazygit.yml in Winsdows directory


Write-Host "Creating Symlinks for git, vim and powershell 5 and 7" -ForegroundColor "Yellow"

Set-Location $BASEDIR
git -C $DOTBOT_DIR submodule sync --quiet --recursive
git submodule update --init --recursive $DOTBOT_DIR


foreach ($PYTHON in ('python', 'python3')) {
    # Python redirects to Microsoft Store in Windows 10 when not installed
    if (& { $ErrorActionPreference = "SilentlyContinue"
            ![string]::IsNullOrEmpty((&$PYTHON -V))
            $ErrorActionPreference = "Stop" }) {

        &$PYTHON $(Join-Path $BASEDIR -ChildPath $DOTBOT_DIR | Join-Path -ChildPath $DOTBOT_BIN) -d $BASEDIR -c $PWSH_CONFIG $Args
        &$PYTHON $(Join-Path $BASEDIR -ChildPath $DOTBOT_DIR | Join-Path -ChildPath $DOTBOT_BIN) -d $BASEDIR -c $VIM_CONFIG $Args
        &$PYTHON $(Join-Path $BASEDIR -ChildPath $DOTBOT_DIR | Join-Path -ChildPath $DOTBOT_BIN) -d $BASEDIR -c $GIT_CONFIG $Args
        &$PYTHON $(Join-Path $BASEDIR -ChildPath $DOTBOT_DIR | Join-Path -ChildPath $DOTBOT_BIN) -d $BASEDIR -c $ALACRITTY_CONFIG $Args
        &$PYTHON $(Join-Path $BASEDIR -ChildPath $DOTBOT_DIR | Join-Path -ChildPath $DOTBOT_BIN) -d $BASEDIR -c $LAZYGIT_CONFIG $Args

        return
    }
}
Write-Error "Error: Cannot find Python."