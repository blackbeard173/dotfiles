#!/usr/bin/env bash

# install packages
# https://search.nixos.org/packages

packages=(
  ani-cli
  bat
  broot
  cargo-update
  circumflex
  cmatrix
  curl
  dua
  fd
  fnm
  fzf
  gcc
  gh
  git
  gitui
  helix
  htop
  just
  kondo
  lazydocker
  lazygit
  lf
  lsd
  mpv-with-scripts
  ncdu
  neofetch
  neovim
  python3
  ripgrep
  rsync
  speedtest-cli
  spotdl
  starship
  stow
  tealdeer
  tmux
  topgrade
  trash-cli
  tree
  wget
  youtube-dl
  yt-dlp
  zellij
  zoxide
  zsh
)

for package in "${packages[@]}"; do
  nix-env -iA nixpkgs."$package"
done
