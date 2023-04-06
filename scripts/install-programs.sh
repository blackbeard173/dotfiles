#!/usr/bin/env bash

# install packages
# https://search.nixos.org/packages

packages=(
  ani-cli
  aria2
  axel
  bat
  broot
  cargo-update
  circumflex
  cmatrix
  curl
  dua
  exa
  fd
  ffmpeg-full
  fnm
  fzf
  gcc
  gfold
  gh
  git
  gitui
  gum
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
  newsboat
  pfetch
  python3
  ripgrep
  rsync
  speedtest-cli
  spotdl
  starship
  stow
  tealdeer
  tmux
  trashy
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
