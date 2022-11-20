##  _     _            _    _                        _
## | |__ | | __ _  ___| | _| |__   ___  __ _ _ __ __| |
## | '_ \| |/ _` |/ __| |/ / '_ \ / _ \/ _` | '__/ _` |
## | |_) | | (_| | (__|   <| |_) |  __/ (_| | | | (_| |
## |_.__/|_|\__,_|\___|_|\_\_.__/ \___|\__,_|_|  \__,_|
##

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# exports
## bash
export HISTCONTROL=erasedups:ignoreboth
export HISTSIZE=1000
export HISTFILESIZE=2000
## XDG Base Directory Specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_RUNTIME_DIR="$HOME/.local/run"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"
## pnpm
export PNPM_HOME="/home/blackbeard/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# deno
export DENO_INSTALL="/home/blackbeard/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.bin" ]; then
    PATH="$HOME/.bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

# shopt
shopt -s autocd         # change to named directory
shopt -s cdspell        # autocorrects cd misspellings
shopt -s cmdhist        # save multi-line commands in history as single line
shopt -s dotglob        # If set, the pattern "**" used in a pathname expansion context will match all files and zero or more directories and subdirectories.
shopt -s histappend     # do not overwrite history
shopt -s expand_aliases # expand aliases
shopt -s checkwinsize   # checks term size when bash regains control

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable programmable completion features (you don't need to enable this, if it's already enabled in /etc/bash.bashrc and /etc/profile sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then source ~/.nix-profile/etc/profile.d/nix.sh; fi

# aliases
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

alias ..='cd ..'
alias ~='cd ~'

alias mv='mv -iv'
alias cp='cp -iv'
# alias rm='rm -iv'
alias rm='trash-put'

alias mkdir='mkdir -p'

alias cls='clear'

alias bashcfg='nano ~/.bashrc'

alias ls='lsd -a'
alias ll='lsd -la'

alias pn='pnpm'
alias px='pnpm dlx'
alias pnpx='pnpm dlx'

alias nixclean='nix-collect-garbage -d'
alias nixrm='nix-env -e'
alias nixupall="nix-env -u '*'"
alias nixup='nix-env -u'

eval "$(fnm env --use-on-cd)"

source "$HOME/.cargo/env"

eval "$(starship init bash)"

# pnpm --silent dlx stoic-quotes-cli

# cmatrix -aC red

# era