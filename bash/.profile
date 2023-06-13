#!/usr/bin/env bash

export $(envsubst < .env)

if [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; 
  then source "$HOME/.nix-profile/etc/profile.d/nix.sh"; 
fi

export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$HOME/.local/bin:$PNPM_HOME:$PATH"

source "$HOME/.bashrc"
