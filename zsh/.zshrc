# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="sunrise"

# This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git ruby docker autojump)

source $ZSH/oh-my-zsh.sh

# Set our editor to NeoVim
export EDITOR="nvim"
# Make vim use NeoVim
alias vim=$EDITOR

alias tmux="tmux -2"

export GOPATH=$HOME/go

# Disable dotnetcore from reporting home
export DOTNET_CLI_TELEMETRY_OPTOUT="1"

# Set up rbenv
eval "$(rbenv init -)"

# Fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add MariaDB to the PATH. Mac OS X only
if [[ `uname` == 'Darwin' ]]; then
  export PATH="/usr/local/opt/mariadb@10.1/bin:$PATH"
fi
