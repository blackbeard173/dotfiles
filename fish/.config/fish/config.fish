set -U fish_greeting

# aliases
alias ls "exa -la"
alias v "nvim"
alias fishy "nvim $HOME/.config/fish/config.fish" 

fish_add_path $HOME/.local/bin/

if set -q ZELLIJ
else
  zellij
end
