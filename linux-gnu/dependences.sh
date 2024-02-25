#!/usr/bin/env bash
## Installing Fira Code
sudo add-apt-repository universe -y
sudo apt install fonts-firacode -y

## Installing Rofi
sudo apt install rofi -y

# Installing Zsh
sudo apt install zsh -y

# Installing Vim
sudo apt install vim -y

# Installing Alacritty
sudo add-apt-repository ppa:aslatter/ppa -y
sudo apt install alacritty -y

# Installing starship
curl -sS https://starship.rs/install.sh | sh

# Installing fd
sudo apt install fdclone

# Installing fzf
sudo apt install fzf

# Installing zoxide
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

# Installing tmux
sudo apt install tmux

# Installing lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

sudo apt autoremove -y

echo "Dependencies succesfully installed"
