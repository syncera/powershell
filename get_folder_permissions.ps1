<#
  .SYNOPSIS
  This script will export an ACL to a CSV file for review #>

﻿$path = Read-Host 'What folder ACL would you like to export?'
$reportpath =".\ACL.csv"
dir -Recurse $path | where { $_.PsIsContainer } | % { $path1 = $_.fullname; Get-Acl $_.Fullname | % { $_.access | Add-Member -MemberType NoteProperty '.\Application Data' -Value $path1 -passthru }} | Export-Csv $reportpath
