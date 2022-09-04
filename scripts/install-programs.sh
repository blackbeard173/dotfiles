#! /bin/bash
#  https://search.nixos.org/packages

# install packages
nix-env -iA \
  nixpkgs.bat \
  nixpkgs.curl \
  nixpkgs.dua \
  nixpkgs.fd \
  nixpkgs.fnm \
  nixpkgs.fzf \
  nixpkgs.gcc \
  nixpkgs.git \
  nixpkgs.gitui \
  nixpkgs.htop \
  nixpkgs.jq \
  nixpkgs.lazygit \
  nixpkgs.lsd \
  nixpkgs.neofetch \
  nixpkgs.neovim \
  nixpkgs.ripgrep \
  nixpkgs.starship \
  nixpkgs.stow \
  nixpkgs.tldr \
  nixpkgs.tmux \
  nixpkgs.trash-cli \
  nixpkgs.tree \
  nixpkgs.wget \
  nixpkgs.zellij \
  nixpkgs.zoxide \
  nixpkgs.zsh
