<#
  .SYNOPSIS
  This script duplicates an Active Directory entry into the same OU it presides in, calls it "NewUser" -- you must finish the entry manually.#>
  
$name = Read-Host 'What user to copy? Must be the SamAccountName'
$dupe=Get-ADUser -Identity $name
Echo "Template found, duplicating to 'NewUser'"
New-ADUser -Instance $dupe -SamAccountName "NewUser"
Echo "Process completed. Exiting..."
Exit
