#!/usr/bin/env bash

# 1. change to debian unstable
echo "deb http://deb.debian.org/debian unstable main contrib non-free non-free-firmware" | sudo tee /etc/apt/sources.list >/dev/null

# 2. update repos
sudo apt update

# 3. upgrade system
sudo apt full-upgrade -y
sudo apt autopurge -y

# 4. install basics
sudo apt install bash-completion build-essential curl wget git htop neofetch

# 5. install nix
sh <(curl -L https://nixos.org/nix/install) --no-daemon

# 6. source nix
source /home/tron/.nix-profile/etc/profile.d/nix.sh

# 7. install packages
nix-env -iA nixpkgs.git nixpkgs.gitui nixpkgs.gh nixpkgs.starship nixpkgs.zoxide nixpkgs.ripgrep nixpkgs.eza nixpkgs.neovim nixpkgs.gcc

# 8. get dotfiles
gh repo clone blackbeard173/dotfiles
