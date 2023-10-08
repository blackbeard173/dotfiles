set -U fish_greeting
starship init fish | source
zoxide init fish | source
fnm env --use-on-cd | source
abbr ls "exa -la"
abbr tree "tree -a -C -l -I '.git|node_modules'"
