#!/usr/bin/env bash

export $(envsubst <~/.env)

if [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then
	source "$HOME/.nix-profile/etc/profile.d/nix.sh"
fi

source "$HOME/.bashrc"
