#!/usr/bin/env bash

npm install -g typescript

npm i -g bash-language-server

npm i -g vscode-langservers-extracted # css,html,json

# C/C++ -> clangd
sudo nala install clangd 

# Markdown
# https://github.com/artempyanykh/marksman

# Toml
nix-env -iA nixpkgs.taplo
