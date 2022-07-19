#! /bin/bash

# install nix package manager
sh <(curl -L https://nixos.org/nix/install) --no-daemon

# source nix
. ~/.nix-profile/etc/profile.d/nix.sh

# install packages
nix-env -iA \
    nixpkgs.zsh \
    nixpkgs.starship \
    nixpkgs.git \
    nixpkgs.gitui \
    nixpkgs.lazygit \
    nixpkgs.fnm \
    nixpkgs.neovim \
    nixpkgs.tmux \
    nixpkgs.stow \
    nixpkgs.lsd \
    nixpkgs.fzf \
    nixpkgs.ripgrep \
    nixpkgs.bat \
    nixpkgs.tldr \
    nixpkgs.htop \
    nixpkgs.bottom \
    nixpkgs.dua \
    nixpkgs.tree \
    nixpkgs.zoxide \
    nixpkgs.fd \
    nixpkgs.xplr \
    nixpkgs.neofetch \
    nixpkgs.gcc \
    nixpkgs.wget \
    nixpkgs.curl

# stow
stow zsh
stow neovim
stow git

# add zsh as a login shell
command -v zsh | sudo tee -a /etc/shells
# use zsh as default shell
sudo chsh -s $(which zsh) $USER

# fnm
fnm install v16.16.0 # replace with current lts
