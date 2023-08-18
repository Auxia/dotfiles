#!/bin/bash

# Script to install my configs and tools on a fresh machine depending on OS

# Check if OS is macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Installing on macOS"

    # Check if brew is installed
    if ! command -v brew &> /dev/null; then
        echo "Installing brew"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    # Check if git is installed
    if ! command -v git &> /dev/null; then
        echo "Installing git"
        brew install git
    fi

    # Check if neovim is installed
    if ! command -v nvim &> /dev/null; then
        echo "Installing neovim"
        brew install neovim
    fi

    # Check if tmux is installed
    if ! command -v tmux &> /dev/null; then
        echo "Installing tmux"
        brew install tmux
    fi

    # Check if fzf is installed
    if ! command -v fzf &> /dev/null; then
        echo "Installing fzf"
        brew install fzf
    fi

    # Check if shell is zsh
    if [[ "$SHELL" != "/bin/zsh" ]]; then
        echo "Changing shell to zsh"
        chsh -s /bin/zsh
    fi
    
    # Check if Oh My Zsh is installed
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        echo "Installing Oh My Zsh"
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi

    # Check if zsh-autosuggestions is installed
    if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
        echo "Installing zsh-autosuggestions"
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    fi
    
    # Check if zsh-syntax-highlighting is installed
    if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
        echo "Installing zsh-syntax-highlighting"
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    fi

    # Check if zsh-completions is installed
    if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-completions" ]; then
        echo "Installing zsh-completions"
        git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
    fi
    
    # Check if packer.nvim is installed
    if [ ! -d "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim" ]; then
        echo "Installing packer.nvim"
        git clone --depth 1 https://github.com/wbthomason/packer.nvim\
        ~/.local/share/nvim/site/pack/packer/start/packer.nvim
    fi

    # Check if conda is installed
    if [ ! -d "$HOME/.miniconda3" ]; then
        echo "Installing miniconda3"
        wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh
        bash Miniconda3-latest-MacOSX-arm64.sh
        rm Miniconda3-latest-MacOSX-arm64.sh
    fi

    # Move all the dotfiles to their
    echo "Moving dotfiles"
    cp -r .config/ $HOME/.config/
    cp .zshrc $HOME/.zshrc

    echo "Setup complete"
fi
