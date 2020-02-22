<#
.SYNOPSIS
    This script is designed to remove inactive users from the domain.#>

$inactiveUsers = Get-LocalUser | Where-Object {($_.enabled -eq $true) -and ($_.LastLogon -ne $null) -and ($_.LastLogon -le (Get-Date).AddDays(-90))} | Select-Object name,lastlogon,enabled

$inactiveUsers

foreach ($user in $inactiveUsers)
{
    Disable-LocalUser $user.Name -WhatIf
    Set-LocalUser $user.name -Description "Disabled due to $(((get-date) - $user.lastlogon.adddays(90)).days) days of inactivity" -WhatIf
}
