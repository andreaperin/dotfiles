# Basic commands
function which($name) { Get-Command $name -ErrorAction SilentlyContinue | Select-Object Definition }
function touch($file) { "" | Out-File $file -Encoding ASCII }

# Empty the Recycle Bin on all drives
function Empty-RecycleBin {
    $RecBin = (New-Object -ComObject Shell.Application).Namespace(0xA)
    $RecBin.Items() | %{Remove-Item $_.Path -Recurse -Confirm:$false}
}

function pf {gci -File | fzf --multi --height=80% --border=sharp  --preview='bat --color=always --style=numbers {}' --preview-window='45%,border-sharp' --bind shift-up:preview-page-up,shift-down:preview-page-down}
function pd {gci -Directory | fzf --multi --height=80% --border=sharp --preview='tree -C {}' --preview-window='45%,border-sharp' --bind shift-up:preview-page-up,shift-down:preview-page-down}

### Utilities
### ----------------------------

# Local and Public IPs
function publicip {(Invoke-WebRequest -uri "http://ifconfig.me/ip").Content}
function localip {[System.Net.Dns]::GetHostAddresses($computername)  | where {$_.AddressFamily -notlike "InterNetworkV6"} | foreach {echo $_.IPAddressToString }}
# Clean-up
function clean-up {Invoke-Item "C:/Windows/Prefetch" && Invoke-Item "C:\Users\ADMINI~1\AppData\Local\Temp" && cleanmgr}