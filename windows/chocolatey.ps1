# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco config set cacheLocation c:\ProgramData\choco-cache

# Add PS Gallery
Set-PSRepository -Name "psgallery" -InstallationPolicy Trusted

# Add access to windows update needed by some packages
Install-Module -Name PSWindowsUpdate -RequiredVersion 2.1.0.1

# Add Powershell Package Providers
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Install-PackageProvider -Name Chocolatey -Force

# Refresh environment
refreshenv
