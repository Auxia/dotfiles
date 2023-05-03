#!/bin/bash

# Script to install my current workflow tools onto my new manjaro machine

# Update system
sudo pacman -Syu

# Install yay
sudo pacman -S yay

# Install neovim
sudo pacman -S neovim git curl wget fzf tmux

# Install OMZ
echo "Installing Oh My Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh-autosuggestions
echo "Installing zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install zsh-syntax-highlighting
echo "Installing zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install zsh-completions
echo "Installing zsh-completions"
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions

# Install packer.nvim
echo "Installing packer.nvim"
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

# Install nodejs
echo "Installing nodejs"
sudo pacman -S nodejs npm

# Install yarn
echo "Installing yarn"
sudo pacman -S yarn

# Install python
echo "Installing python"
sudo pacman -S python python-pip

echo "Setup complete"
