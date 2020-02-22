<#
    .SYNOPSIS
    This script will set the lock screen without having to mess with a GPO or windows enterprise #>
    
Echo "Setting lock screen..."
$ErrorActionPreference = "Stop"
$RegKeyPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP"
$LockScreenSource = ".\image.jpg"
$DesktopPath = "DesktopImagePath"
$DesktopStatus = "DesktopImageStatus"
$DesktopUrl = "DesktopImageUrl"
$LockScreenPath = "LockScreenSource"
$LockScreenStatus = "LockScreenImageStatus"
$LockScreenUrl = "LockScreenImageUrl"
$StatusValue = "1"
$DesktopImageValue = "C:\Windows\System32\Desktop.jpg"
$LockScreenImageValue = "C:\Windows\System32\LockScreen.jpg"
    if(!(Test-Path $RegKeyPath)) {
        Write-Host "Creating registry path $($RegKeyPath)."
        New-Item -Path $RegKeyPath -Force | Out-Null
    }
    if ($LockScreenSource) {
        Write-Host "Copy Lock Screen image from $($LockScreenSource) to $($LockScreenImageValue)."
        Copy-Item $LockScreenSource $LockScreenImageValue -Force
        Write-Host "Creating registry entries for Lock Screen"
        New-ItemProperty -Path $RegKeyPath -Name $LockScreenStatus -Value $StatusValue -PropertyType DWORD -Force | Out-Null
        New-ItemProperty -Path $RegKeyPath -Name $LockScreenPath -Value $LockScreenImageValue -PropertyType STRING -Force | Out-Null
        New-ItemProperty -Path $RegKeyPath -Name $LockScreenUrl -Value $LockScreenImageValue -PropertyType STRING -Force | Out-Null
    }
    if ($BackgroundSource) {
        Write-Host "Copy Desktop Background image from $($BackgroundSource) to $($DesktopImageValue)."
        Copy-Item $BackgroundSource $DesktopImageValue -Force
        Write-Host "Creating registry entries for Desktop Background"
        New-ItemProperty -Path $RegKeyPath -Name $DesktopStatus -Value $StatusValue -PropertyType DWORD -Force | Out-Null
        New-ItemProperty -Path $RegKeyPath -Name $DesktopPath -Value $DesktopImageValue -PropertyType STRING -Force | Out-Null
        New-ItemProperty -Path $RegKeyPath -Name $DesktopUrl -Value $DesktopImageValue -PropertyType STRING -Force | Out-Null
    }