# Tab Completion
autoload -Uz compinit
compinit

# History
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000
setopt hist_ignore_all_dups
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data
alias history=zsh_history     # force zsh to show the complete history

zsh_history() {
  ARG=$1
  [ -z $ARG ] && less ~/.zsh_history || grep $1 ~/.zsh_history | sort | uniq -u | less
}

# Options
setopt autocd
setopt correct
setopt numericglobsort

# Keybinds
bindkey '^[[3~' delete-char          # To make Delete Key Work
bindkey '^[[1;5C' forward-word       # ctrl + ->             # moves pointer forward a word
bindkey '^[[1;5D' backward-word      # ctrl + <-             # moves pointer backward a word
bindkey '^[[1;3D' beginning-of-line  # alt  + ->             # moves pointer to start of the line
bindkey '^[[1;3C' end-of-line        # alt  + <-             # moves pointer to end of the line
bindkey '^[[1;5B' backward-kill-word # ctrl + arrow down	 # deletes a word backwards
# bindkey '^[[3~' kill-whole-line       # delete         # deletes whole line
bindkey '^[[1;5A' undo           # ctrl + arrow up       # undo
bindkey '^x' edit-command-line   # ctrl + x              # edit line in Vi
bindkey '^x^e' edit-command-line # ctrl + x + e            # same but more common keybind
bindkey '^P' toggle_prompt       # ctrl + p              # change prompt mode

# aliases
alias ls="lsd -a"
alias ll="lsd -al"
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias nixclean="nix-collect-garbage -d"
alias nixrm="nix-env -e"
alias nixupall="nix-env -u '*'"
alias nixup="nix-env -u"

# Neofetch/Pfetch
pfetch
