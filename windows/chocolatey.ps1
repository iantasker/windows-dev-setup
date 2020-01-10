# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco config set cacheLocation c:\ProgramData\choco-cache

# Add access to windows update needed by some packages
Install-Module PSWindowsUpdate -MaximumVersion 1.5.2.6

# Add Powershell Package Providers
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Install-PackageProvider -Name Chocolatey -Force

# Refresh environment
refreshenv

