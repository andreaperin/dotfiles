Write-Host "Configuring Console..." -ForegroundColor "Yellow"

# Make 'Source Code Pro and Fira Code' available Console fonts
Set-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Console\TrueTypeFont' 000 'Source Code Pro'
Set-ItemProperty -Path "Registry::HKEY_CURRENT_USER\Console" -Name "FaceName" -Value "Fira code" -Type String;
Set-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Console\TrueTypeFont' 000 'FiraCode NF'

@(`
"HKCU:\Console\%SystemRoot%_System32_bash.exe",`
"HKCU:\Console\%SystemRoot%_System32_WindowsPowerShell_v1.0_powershell.exe",`
"HKCU:\Console\%SystemRoot%_SysWOW64_WindowsPowerShell_v1.0_powershell.exe",`
"HKCU:\Console\Windows PowerShell (x86)",`
"HKCU:\Console\Windows PowerShell",`
"HKCU:\Console"`
) | ForEach {
    If (!(Test-Path $_)) {
        New-Item -path $_ -ItemType Folder | Out-Null
    }
