# Windows

Windows users need to use the Windows Subsystem for Linux 2 to give themselves a proper shell interface to use all the tools/scripts expected as an Developer.

These scripts should all be considered work in progress, and some editing may be required depending on software updates etc since they were written. However, they should help do the heavy lifting to get the majority of software and configuration in place quickly.

Open the tool "PowerShell ISE" as an **Administrator**. There will be times you need to restart your computer, we assume you'll reopen an administrative session of this tool after each restart.

1. Make scripts executable by running:

    ```Powershell
    Set-ExecutionPolicy RemoteSigned
    ```
	
2. Download and configure windows features

	```Powershell
	Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://github.com/iantasker/windows-dev-setup/configure-windows-features.ps1'))
	```

3. Download and install chocolatey

	```Powershell
	Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://github.com/iantasker/windows-dev-setup/chocolatey.ps1'))
	```	

4. Download and install git

	```Powershell
	Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://github.com/iantasker/windows-dev-setup/git.ps1'))
	```	
	
5. Download and install wsl

	```Powershell
	Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://github.com/iantasker/windows-dev-setup/wsl.ps1'))
	```	
