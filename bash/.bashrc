#!/usr/bin/env bash

##  _     _            _    _                        _
## | |__ | | __ _  ___| | _| |__   ___  __ _ _ __ __| |
## | '_ \| |/ _` |/ __| |/ / '_ \ / _ \/ _` | '__/ _` |
## | |_) | | (_| | (__|   <| |_) |  __/ (_| | | | (_| |
## |_.__/|_|\__,_|\___|_|\_\_.__/ \___|\__,_|_|  \__,_|
##

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

## bash
export HISTCONTROL=erasedups:ignoreboth
export HISTFILESIZE=2000
export HISTSIZE=1000

## XDG Base Directory Specification
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_RUNTIME_DIR="$HOME/.local/run"
export XDG_STATE_HOME="$HOME/.local/state"

## pnpm
export PATH="$PNPM_HOME:$PATH"
export PNPM_HOME="$HOME/.local/share/pnpm"

## deno
# export DENO_INSTALL="$HOME/.deno"
# export PATH="$DENO_INSTALL/bin:$PATH"

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
shopt -s checkwinsize   # checks term size when bash regains control
shopt -s cmdhist        # save multi-line commands in history as single line
shopt -s dotglob        # If set, the pattern "**" used in a pathname expansion context will match all files and zero or more directories and subdirectories.
shopt -s expand_aliases # expand aliases
shopt -s histappend     # do not overwrite history

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

# alias rm='rm -iv'
alias ..='cd ..'
alias ~='cd ~'
alias bashcfg='nano ~/.bashrc'
alias cls='clear'
alias cp='cp -iv'
alias ll='exa -la'
alias ls='exa -a'
alias mkdir='mkdir -p'
alias mv='mv -iv'
alias nixclean='nix-collect-garbage -d'
alias nixrm='nix-env -e'
alias nixup='nix-env -u'
alias nixupall="nix-env -u '*'"
alias pn='pnpm'
alias pnpx='pnpm dlx'
alias px='pnpm dlx'
alias rm='trash'
alias v='nvim'
alias ze='zellij'

# cmatrix -aC red
# era
# pnpm --silent dlx stoic-quotes-cli
# source "$HOME/.cargo/env"
eval "$(fnm env --use-on-cd)"
eval "$(zoxide init bash)"
eval "$(starship init bash)"