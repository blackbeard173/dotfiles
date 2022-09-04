#! /bin/bash

# Update system
function update_system() {
  sudo apt update && sudo apt full-upgrade
}

# Nix package manager
# https://nixos.org/download.html
function install_nix() {
  sh <(curl -L https://nixos.org/nix/install) --no-daemon

  # source nix
  source ~/.nix-profile/etc/profile.d/nix.sh
}

# Nala
# https://gitlab.com/volian/nala/-/wikis/Installation
function install_nala() {
  echo "deb https://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list
  wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg >/dev/null
  sudo apt update && sudo apt install nala
}

# stow dotfiles
function config_stow() {
  stow zsh
  stow neovim
  stow git
  cd
}

# Change Shell
function default_zsh() {
  # add zsh as a login shell
  command -v zsh | sudo tee -a /etc/shells
  # use zsh as default shell
  sudo chsh -s $(which zsh) $USER
}

# fnm/node
function install_node() {
  fnm install --lts # install latest node lts
}

# 0 - update
update_system
# 1 - install nix
install_nix
# 2 - install nala
install_nala
# 3 - install other packages
source ./scripts/install-programs.sh
# 4 - stow config files
config_stow
# 5 - zsh
default_zsh
# 6 - install Node
install_node
