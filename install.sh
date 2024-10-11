#!/usr/bin/env bash

# This script sets up tmux and nvim for a new setup for a mostly seamless experience.
#
# MacOS
#		- Expects homebrew (brew) to be installed

set -euo pipefail

DOTFILES_PATH="$HOME/dotfiles"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	# Only supporting apt for now
	sudo apt update -qq
	sudo apt install stow tmux -y
elif [[ "$OSTYPE" == "darwin"* ]]; then
	# Mac OSX
	brew update
	brew install stow
	brew install tmux
fi

# Setup nvim directory
stow --dir=$DOTFILES_PATH --target=$HOME nvim

# Setup tmux directory
stow --dir=$DOTFILES_PATH --target=$HOME tmux

# Install tmux plugin manager
bash "$DOTFILES_PATH/scripts/install-tpm.sh"

echo "Done."
