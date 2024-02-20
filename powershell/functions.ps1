# Basic commands
function which($name) { Get-Command $name -ErrorAction SilentlyContinue | Select-Object Definition }
function touch($file) { "" | Out-File $file -Encoding ASCII }

# Empty the Recycle Bin on all drives
function Empty-RecycleBin {
    $RecBin = (New-Object -ComObject Shell.Application).Namespace(0xA)
    $RecBin.Items() | %{Remove-Item $_.Path -Recurse -Confirm:$false}
}

### Utilities
### ----------------------------

# Local and Public IPs
function publicip {(Invoke-WebRequest -uri "http://ifconfig.me/ip").Content}
function localip {[System.Net.Dns]::GetHostAddresses($computername)  | where {$_.AddressFamily -notlike "InterNetworkV6"} | foreach {echo $_.IPAddressToString }}