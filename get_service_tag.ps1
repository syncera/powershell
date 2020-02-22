<#
.SYNOPSIS
    This script grabs the service tag or serial number from the BIOS #>
    
Get-WmiObject win32_bios | format-list SerialNumber