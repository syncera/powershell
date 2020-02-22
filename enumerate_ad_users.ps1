<#
  .SYNOPSIS
  This script is designed to iterate a list of users and cherry pick information #>
  
  $doc= Read-Host -prompt 'Enter the path to the document you want to process'
  $user = Get-Content "$doc"
  ForEach ($user in $doc) {
    Get-ADUser -Filter 'Name -like $user' | FT SamAccountName, Description, UserPrincipalName
  }
