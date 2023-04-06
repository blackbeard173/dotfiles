#!/usr/bin/env bash

npm install -g typescript typescript-language-server

npm i -g bash-language-server

npm i -g vscode-langservers-extracted # css,html,json

npm i -g @prisma/language-server

# C/C++ -> clangd
sudo nala install clangd 

# Markdown
# https://github.com/artempyanykh/marksman
nix-env -iA nixpkgs.marksman

# Toml
nix-env -iA nixpkgs.taplo

nix-env -iA nixpkgs.lldb
