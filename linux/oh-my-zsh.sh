#!/bin/bash

### Install oh-my-zsh, theme and fonts
sudo apt install zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

### PowerLevel9K
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

### Powerline Fonts
git clone --depth 1 https://github.com/powerline/fonts.git /tmp/powerline-fonts
/tmp/powerline-fonts/install.sh
mkdir -p /c/dev/fonts/PowerlineFonts
cp $HOME/.local/share/fonts/*.ttf /c/dev/fonts/PowerlineFonts
rm -rf /tmp/powerline-fonts

### Nerd Fonts
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git /tmp/nerd-fonts
/tmp/nerd-fonts/install.sh --ttf --clean
fc-cache -f -v
mkdir -p /c/dev/fonts/NerdFonts
cp $HOME/.local/share/fonts/NerdFonts/*.ttf /c/dev/fonts/NerdFonts
rm -rf /tmp/nerd-fonts

### Configure oh-my-zsh theme
if grep -q 'POWERLEVEL9K_MODE' $HOME/.zshrc; then
  sed -i 's/POWERLEVEL9K_MODE="[^"]*"/POWERLEVEL9K_MODE="nerdfont-complete"/' $HOME/.zshrc
else
  sed -i '/ZSH_THEME="[^"]*"/iPOWERLEVEL9K_MODE="nerdfont-complete"' $HOME/.zshrc
fi
sed -i 's/ZSH_THEME="[^"]*"/ZSH_THEME="powerlevel9k\/powerlevel9k"/' $HOME/.zshrc
sed -i '/  git/a\  dotenv\n  docker\n  asdf' $HOME/.zshrc
tee -a $HOME/.zshrc <<EOL
. $HOME/.shellrc
EOL

tee $HOME/.shellrc <<EOL
# Let cd look in /c/dev/repos/personal by default
export CDPATH=.:~:/c/dev/repos/personal
EOL

tee -a $HOME/.bashrc <<EOL
if [ -t 1 ]; then
  exec zsh
fi

. $HOME/.shellrc
EOL
