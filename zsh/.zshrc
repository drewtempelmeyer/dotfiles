# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="geoffgarside"

# This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git ruby docker autojump bundler nvm)

source $ZSH/oh-my-zsh.sh

# Set our editor to NeoVim
export EDITOR="nvim"
# Make vim use NeoVim
alias vim=$EDITOR

alias tmux="tmux -2"

export GOPATH="$HOME/go"
export PATH="$HOME/bin:$GOPATH/bin:$HOME/.local/bin:$PATH"

# Disable dotnetcore from reporting home
export DOTNET_CLI_TELEMETRY_OPTOUT="1"

# Set up rbenv
eval "$(rbenv init -)"

# Fuzzy finder
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fbr - checkout git branch (including remote branches), sorted by most recent commit, limit 30 last branches
fbr() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# Add MariaDB to the PATH. Mac OS X only
if [[ `uname` == 'Darwin' ]]; then
  export PATH="/usr/local/opt/mariadb@10.1/bin:$PATH"
fi
