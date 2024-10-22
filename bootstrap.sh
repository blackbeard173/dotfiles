#!/usr/bin/env bash

# 1. Clone Dotfiles repo.
if [ -d "$HOME/dotfiles" ]; then
	echo "Dotfiles exists."
else
	gh repo clone https://github.com/blackbeard173/dotfiles >/dev/null
fi

# 2. Install Gum.
if ! command -v gum &>/dev/null; then
	cd /tmp || exit
	GUM_VERSION="0.14.5"
	wget -qO gum.rpm "https://github.com/charmbracelet/gum/releases/download/v${GUM_VERSION}/gum-${GUM_VERSION}-1.x86_64.rpm"
	sudo dnf install -y ./gum.rpm
	rm gum.rpm
	cd - || exit
fi

# 3. Install apps from Fedora repo.
sudo dnf install -y curl wget htop fzf ripgrep bat eza tealdeer fd-find fastfetch tmux stow gnome-tweak-tool adw-gtk3-theme
# Git related
sudo dnf install -y git gh gitui
# Editors
sudo dnf install -y vim neovim helix
sudo dnf remove node* npm*
# Containers
sudo dnf install -y podman
# Media
sudo dnf install mpv vlc

# 4. Install mise (managing dev tools)
if ! command -v mise &>/dev/null; then
	sudo dnf install -y dnf-plugins-core
	sudo dnf config-manager --add-repo https://mise.jdx.dev/rpm/mise.repo
	sudo dnf install -y mise
fi
mise use --global bun@latest
mise use --global go@latest
mise use --global node@lts
# mise use --global python@latest
# add in bashrc
# if command -v mise &>/dev/null; then
#   eval "$(mise activate bash)"
# fi

# 4. Install Ollama
if ! command -v ollama &>/dev/null; then
	curl -fsSL https://ollama.com/install.sh | sh
fi
ollama pull llama3.2:latest
ollama pull qwen2.5-coder:latest
ollama pull qwen2.5:latest

# 5. Install flathub applications
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install -y com.brave.Browser
flatpak install -y com.github.tchx84.Flatseal
flatpak install -y com.github.zocker_160.SyncThingy
flatpak install -y com.google.Chrome
flatpak install -y com.mattjakeman.ExtensionManager
flatpak install -y com.usebottles.bottles
flatpak install -y com.valvesoftware.Steam
flatpak install -y io.github.flattool.Warehouse
flatpak install -y io.github.zen_browser.zen
flatpak install -y md.obsidian.Obsidian
flatpak install -y net.agalwood.Motrix
flatpak install -y org.gnome.World.PikaBackup
flatpak install -y org.libreoffice.LibreOffice
flatpak install -y org.localsend.localsend_app
flatpak install -y org.onlyoffice.desktopeditors
flatpak install -y org.qbittorrent.qBittorrent
flatpak install -y org.torproject.torbrowser-launcher

# 6. Install Zed
if ! command -v zed &>/dev/null; then
	curl -f https://zed.dev/install.sh | sh
fi

# 7. Install VSCode
if ! command -v code &>/dev/null; then
	sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
	echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo >/dev/null
	sudo dnf check-update
	sudo dnf install -y code
fi

# 8. Install Wezterm
if ! command -v wezterm &>/dev/null; then
	sudo dnf copr enable wezfurlong/wezterm-nightly
	sudo dnf install wezterm
fi

# 9. Install starship
if ! command -v starship &>/dev/null; then
	curl -sS https://starship.rs/install.sh | sh
fi
