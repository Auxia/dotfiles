# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell" # set by `omz`

# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search) 

source $ZSH/oh-my-zsh.sh

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vim=nvim
alias vi=nvim
alias zshconfig="nvim ~/.zshrc"
alias cat=bat
alias grep=rg
alias ls='exa'
alias la='exa -a'
alias ll='exa -la'
alias gts='git status'
alias gta='git add'
alias gtc='git commit -m'
alias gtd='git diff'
alias gtp='git push'
alias gtl='git log'
alias yta="yt-dlp --embed-thumbnail -f 'bestaudio/best' -f 'm4a' --downloader aria2c"
alias ytd="yt-dlp -f 'bv[height<=1440]+bestaudio/best' --downloader aria2c"
alias ytdd="yt-dlp -f 'bv[height<=1080]+bestaudio/best' --downloader aria2c" 
alias ytp="yt-dlp --cookies ~/Downloads/cookies.txt --downloader aria2c"
alias mpv="mpv --fs --no-audio-display"
alias iinav="iina --mpv-fs"
alias iinap="iina --pip"
alias brow='arch --x86_64 /usr/local/Homebrew/bin/brew'

alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/auxia/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/auxia/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/auxia/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/auxia/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Adding Flutter to PATH
export PATH="$PATH:/Users/auxia/Code/Gill/flutter/bin"

# The Fuck
eval $(thefuck --alias)


# Z Jump Around
. /opt/homebrew/etc/profile.d/z.sh

# Custom fzf widget
function fzf-widget {
local selected_item=$(find . -type f -o -type d 2>/dev/null | fzf --height 40% --reverse --border --preview '[[ -f {} ]] && bat --color=always --style=numbers {} || echo {} is a directory' --preview-window=right:60%:wrap)
  
  if [ -n "$selected_item" ]; then
    if [ -f "$selected_item" ]; then
      # Open the selected file in Neovim
      nvim "$selected_item"
    elif [ -d "$selected_item" ]; then
      # Change the current directory to the selected directory
      z "$selected_item"
    fi
  fi
  zle reset-prompt
}

zle -N fzf-widget

bindkey '^f' fzf-widget
export PATH=$PATH:/Users/auxia/.spicetify

PATH="/Users/auxia/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/auxia/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/auxia/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/auxia/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/auxia/perl5"; export PERL_MM_OPT;

# Homebrew on Apple Silicon
path=('/opt/homebrew/bin' $path)
export PATH
export OPENSSL_ROOT_DIR=/opt/homebrew/opt/openssl@3
export OPENSSL_ROOT_DIR=/opt/homebrew/opt/openssl@3
fpath+=${ZDOTDIR:-~}/.zsh_functions
