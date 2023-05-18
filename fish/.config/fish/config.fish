set -U fish_greeting

if test -e /home/ubuntu/.nix-profile/etc/profile.d/nix.fish; . /home/ubuntu/.nix-profile/etc/profile.d/nix.fish;

starship init fish | source
zoxide init fish | source
fnm env --use-on-cd | source