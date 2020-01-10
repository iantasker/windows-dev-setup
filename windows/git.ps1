# Install git
Write-Host "Installing GIT..." -NoNewLine
& choco install git.install --force -y --install-args="/WindowsTerminal"
Write-Host "Done."

# Setup git alias
Write-Host "Setting up git alias..." -NoNewLine
& New-Alias -Name git -Value "$Env:ProgramFiles\Git\bin\git.exe"
Write-Host "Done."

# Set up GIT
Write-Host "Configuring GIT..."
$GIT_MAIL = Read-Host -Prompt "Git commit email? (e.g. user@domain.com)"
$GIT_NAME = Read-Host -Prompt "Git commit name? (e.g. John Doe)"
git config --global user.email "$GIT_MAIL"
git config --global user.name "$GIT_NAME"
git config --global core.autocrlf input
git config --global core.eol lf
git config --global core.fileMode false
Write-Host "Done."
