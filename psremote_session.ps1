<#
  .SYNOPSIS
  This script is designed to open a session to a remote system and run a command #>
  
$Variable = New-PSSession -ComputerName 'Hostname' # hostname of the machine you want to control
Invoke-Command -Session $Variable -ScriptBlock {
    cd 'c:\temp'
    # cd '\\share$'
    Start-Process '.\program.exe' -ArgumentList '/alltheswitches' -Wait
    # Start-Process '.\program.msi' -ArgumentList '/alltheswitches' -Wait
}
Remove-PSSession -Session $Variable
