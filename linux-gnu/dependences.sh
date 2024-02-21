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
sudo apt install alacritty -y

# Installing starship
sudo apt install starship -y

sudo apt autoremove -y

echo "Dependencies succesfully installed"
