#!/usr/bin/env bash

# 1. Clone Dotfiles repo.
if [ -d "$HOME/dotfiles" ]; then
	echo "Dotfiles exists."
else
	gh repo clone https://github.com/blackbeard173/dotfiles >/dev/null
fi

# 2. Install Gum.
cd /tmp || exit
GUM_VERSION="0.14.5"
wget -qO gum.rpm "https://github.com/charmbracelet/gum/releases/download/v${GUM_VERSION}/gum-${GUM_VERSION}-1.x86_64.rpm"
sudo dnf install -y ./gum.rpm
rm gum.rpm
cd - || exit
