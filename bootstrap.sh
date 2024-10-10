#!/usr/bin/env bash

# 1. Clone Dotfiles repo.
if [ -d "$HOME/dotfiles" ]; then
	echo "Dotfiles exists."
else
	gh repo clone https://github.com/blackbeard173/dotfiles >/dev/null
fi
