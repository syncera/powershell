<#
  .SYNOPSIS
  This script will display the info of an sso email address and export parts of that information into a text document named after the query, placed on the current user's desktop. #>
  
$dt=[environment]::GetFolderPath([System.Environment+SpecialFolder]::Desktop)
$input = Read-Host -Prompt 'Please enter the email address you would like information about'
Get-ADUser -Filter 'Name -like $input' -properties *
Get-ADUser -Filter 'UserPrincipalName -like $input' | FT SamAccountName,givenname,surname,UserPrincipalName | Out-File "$dt\$input.txt" -Encoding ASCII -Width 80
