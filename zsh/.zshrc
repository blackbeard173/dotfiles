# Tab Completion
autoload -Uz compinit
compinit

# History
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt hist_ignore_all_dups
setopt autocd

# alias
alias ls="lsd -a"
alias ll="lsd -al"
alias nixclean="nix-collect-garbage -d"
alias nixrm="nix-env -e"
alias nixupall="nix-env -u"
alias nixup="nix-env -u"


# Keybinds
bindkey "^[[3~" delete-char # To make Delete Key Work

# nix
if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then . ~/.nix-profile/etc/profile.d/nix.sh; fi

# antidote
[[ -e ~/.antidote ]] || git clone https://github.com/mattmc3/antidote.git ~/.antidote
# source antidote
. ~/.antidote/antidote.zsh
# generate and source plugins from ~/.zsh_plugins.txt
antidote load

# fnm
eval "$(fnm env --use-on-cd)"

# starship
eval "$(starship init zsh)"

