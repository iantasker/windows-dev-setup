$reposPath = "C:\dev\repos\personal\"
$distroPaths = "C:\dev\distros\"

# Create dev folder structure
Write-Host "Create default dev folder structure..." -NoNewLine
& New-Item -ItemType Directory -Force -Path "$reposPath"
& New-Item -ItemType Directory -Force -Path "$distroPaths"
Write-Host "Done."

choco install docker-desktop --pre

# Clone git windows-dev-setup repo
Write-Host "Cloning iantasker\windows-dev-setup git repository..." -NoNewLine
& Set-Location -Path $defaultPath
& git clone git@github.com:iantasker/windows-dev-setup.git | Out-Null
Write-Host "Done."

Write-Host "Downloading Ubuntu Distro..." -NoNewLine
& Set-Location -Path "$distroPaths" | Out-Null
& Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1604 -OutFile Ubuntu.appx -UseBasicParsing
Write-Host "Done."

Write-Host "Install Ubuntu Distro..." -NoNewLine
& Add-AppxPackage .\Ubuntu.appx
Write-Host "Done."

Write-Host "Configuring Ubuntu Distro..." -NoNewLine
& wsl --set-default-version 2
& wsl --set-version Ubuntu-18.04 2
Write-Host "Done."
