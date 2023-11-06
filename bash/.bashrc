case $- in
	*i*) ;;
	*) return ;;
esac

if [ -e /home/ghost/.nix-profile/etc/profile.d/nix.sh ]; then
	. /home/ghost/.nix-profile/etc/profile.d/nix.sh
fi

HISTCONTROL=ignoreboth
HISTFILESIZE=2000
HISTSIZE=1000
shopt -s checkwinsize
shopt -s histappend

alias ls=eza

eval "$(starship init bash)"

eval "$(fnm env --use-on-cd)"
