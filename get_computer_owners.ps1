<#
    .SYNOPSIS
    This script pulls all domain computers' owner information#>

Get-ADComputer -filter * | Select name,@{n="owner";e={(Get-acl "ad:\$($_.distinguishedname)").owner}}
