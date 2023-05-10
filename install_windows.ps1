
Write-Host "This script needs to be run from a powershell5 elevated terminal (NO PWSH7)." -ForegroundColor "Yellow"

$dependenciesPATH = "windows\dependencies.ps1"
$settingsPATH = "windows\initial_settings.ps1"

# Check to see if we are currently running "as Administrator"
if (!(Verify-Elevated)) {
   $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
   $newProcess.Arguments = $myInvocation.MyCommand.Definition;
   $newProcess.Verb = "runas";
   [System.Diagnostics.Process]::Start($newProcess);

   exit
}


. $dependenciesPATH
# . $settingsPATH

## TODO use dotbot for coping all powershell folder into powershell windows location
## Adjust the config.yaml in windows folder to match the actual location after win-get installation
