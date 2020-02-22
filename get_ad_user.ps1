<#
  .SYNOPSIS
  This script will display the relevant info of a given user name and export parts of that information into a text document named after the query, placed on the current user's desktop. 
  Uncomment the last bit to get the file #>

  $dtop=[environment]::GetFolderPath([System.Environment+SpecialFolder]::Desktop)
  $query = Read-Host -Prompt 'Please enter the name you would like information about'
  Get-ADUser -Filter 'Name -like $query' -properties *
  Get-ADUser -Filter 'Name -like $query' | FT SamAccountName,givenname,surname,UserPrincipalName #| Out-File "$dtop\$query.txt" -Encoding ASCII -Width 80
  