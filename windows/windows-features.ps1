Write-Host "Enabling windows features..."

Enable-WindowsOptionalFeature -Online -FeatureName Containers
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All
Enable-WindowsOptionalFeature -Online -FeatureName HypervisorPlatform
Enable-WindowsOptionalFeature -Online -FeatureName Windows-Defender-Default-Definitions
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
Enable-WindowsOptionalFeature -Online -FeatureName Printing-PrintToPDFServices-Features

Write-Host "Disable fast-boot"
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v HiberbootEnabled /t reg_dword /d 0 /f

Write-Host "Enable Hibernate"
powercfg -hibernate on
$key = "HKLM:\SYSTEM\CurrentControlSet\Control\Power"
Set-ItemProperty $key HibernateEnabled 1

Write-Host "Showing hidden files..."
$key = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
Set-ItemProperty $key Hidden 1

Write-Host "Disabling hiding extensions for known file types..."
$key = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
Set-ItemProperty $key HideFileExt 0

Write-Host "Restarting explorer shell to apply registry changes..."
Stop-Process -processname explorer