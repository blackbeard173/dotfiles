#!/usr/bin/env bash

DOTFILE_REPO="git@github.com:blackbeard173/dotfiles.git"
#DOTFILE_REPO="https://github.com/blackbeard173/dotfiles.git"
GH_SSH_PRIVATE="$HOME/.ssh/id_ed25519"
GH_SSH_PUBLIC="${GH_SSH_PRIVATE}.pub"
GH_EMAIL="67589385+blackbeard173@users.noreply.github.com"

function repo_change() {
        sudo apt install curl wget git build-essential apt-transport-https dirmngr

        echo '#unstable repos
deb https://deb.debian.org/debian/ unstable main contrib non-free non-free-firmware
deb-src https://deb.debian.org/debian/ unstable main contrib non-free non-free-firmware' | sudo tee /etc/apt/sources.list

        sudo apt autoremove && sudo apt autoclean
        sudo apt update && sudo apt full-upgrade
}

function install_nix() {
        sh <(curl -L https://nixos.org/nix/install) --no-daemon
        source "$HOME/.nix-profile/etc/profile.d/nix.sh"
}

function stow_dirs() {
        echo "🚀 Stow dirs"
        cd dotfiles || return
        stow_dirs=(
                bash
                fish
                git
                helix
        )
        for stow_dir in "${stow_dirs[@]}"; do
                echo "📦 Stowing ${stow_dir} "
                stow "$stow_dir"
        done
}

function install_packages() {
        echo '🚀 Install packages'
        packages=(
                bat
                exa
                fish
                fnm
                fzf
                git
                gcc
                helix
                neovim
                ripgrep
                shellcheck
                shfmt
                stow
                tree-sitter
                tldr
        )
        for package in "${packages[@]}"; do
                echo "📦 Installing $package"
                nix-env -iA nixpkgs."$package"
        done
}

function generate_ssh() {
        if [ -e "${GH_SSH_PRIVATE}" ]; then
                echo "✨SSH key already exists."
        else
                echo "✨Generating new SSH key..."
                ssh-keygen -t ed25519 -C "$GH_EMAIL"
                echo "✨ New key generated."
                echo "➕ Add the new key to https://github.com/settings/ssh/new"
                echo "- - - - -"
                cat "$GH_SSH_PUBLIC"
                echo "- - - - -"
        fi
}

function dotfiles_clone() {
        if [ -d "$HOME/dotfiles" ]; then
                echo "🔨dotfiles already exists."
        else
                git clone $DOTFILE_REPO
                echo "🔨dotfiles cloned."
        fi
}

repo_change
install_packages
generate_ssh
dotfiles_clone
stow_dirs
