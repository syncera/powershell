<#
  .SYNOPSIS
  This script will pull the OS fingerprint #>
$Access = Get-Date
SWrite-Output "[***] You ran this script on $Access [***]"

$ComputerName = $env:ComputerName
$OS = (Get-WmiObject -Class WIn32_OperatingSystem -ComputerName $ComputerName | Select caption |
  select-string windows) -split("=", "}", "{") [0] -replace "}"| select-string windows
if ($OS -match "10") {Write-Output "[*] You are running $OS"}
if ($OS -match "8") {Write-Output "[*] You are running $OS"}
if ($OS -match "7") {Write-Output "[*] You are running $OS"}
if ($OS -match "2016") {Write-Output "[*] You are running $OS"}
if ($OS -match "2008") {Write-Output "[*] You are running $OS"}

# Query for currently logged in users and whether or not they are active
Write-Output "[*] The following users are currently logged in"
if ($OS -match "7") {$Current = query user | fl | out-host}
# Windows 10 uses this method instead
Else {Get-WmiObject -Class Win32_ComputerSystem | select username}

# List shares available
Write-Output "[*] The following shares are available"
PSDrive | select-object * -exclude used, free, provider, credential, currentlocation | fl

# Check whether or not SMBv1 is enabled or disabled
$SMBCHeck = (Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Lanmanserver\Parameters" -name SMB1 | select-object "SMB1"
  if ( $SMBCHeck -match "0") {Write-Host "SMBv1 is currently disabled."}
  Else {Write-Host "SMBv1 is enabled!"}
