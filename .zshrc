export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$HOME/bin:$HOME/.local/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Theme settings
SPACESHIP_DOCKER_SHOW=false

# Spaceship theme (because I always wanted to be an astronaut). Ended up
# writing code instead. Close enough.
#
# https://github.com/denysdovhan/spaceship-zsh-theme
ZSH_THEME="spaceship"

# Disable marking untracked files under VCS as dirty. This makes repository
# status check for large repositories much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

ZSH_CUSTOM=$HOME/.zsh/custom

plugins=(git rbenv ruby autojump)

source $ZSH/oh-my-zsh.sh

### Ruby environment
eval "$(rbenv init -)"

### Editor settings
export EDITOR=nvim
# Pretend to use oldvim
alias vim="nvim"

# Use current $PATH when using sudo
alias sudo='sudo env PATH=$PATH'

