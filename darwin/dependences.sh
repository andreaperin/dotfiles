#!/usr/bin/env bash
## Installing Fira Code
brew tap homebrew/cask-fonts
brew install --cask font-fira-code

# Installing Zsh
brew install zsh

# Installing Vim
brew install vim

# Installing Alacritty
brew install alacritty

# Installing starship
brew install starship

# Installing fd
brew install fd

# Installing fzf
brew install fzf
$(brew --prefix)/opt/fzf/install

# Installing zoxide
brew install zoxide

# Installing tmux
brew install tmux

# Installing lazygit
brew install jesseduffield/lazygit/lazygit

echo "Dependencies succesfully installed"
