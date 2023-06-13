help:
	@echo "Run: 'hx --health' to see a list of installable lsp's."
	@echo "This installer uses instructions from: https://github.com/helix-editor/helix/wiki/How-to-install-the-default-language-servers, to install lsps."
	@echo "Run: 'make [lang]' to install."
astro:
	npm -g install @astrojs/language-server
bash:
	npm -g install bash-language-server
cpp:
	sudo apt install clangd
css html json:
	npm -g install vscode-langservers-extracted
docker:
	npm -g install dockerfile-language-server-nodejs
javascript typescript:
	npm -g install typescript typescript-language-server
prisma:
	npm -g install @prisma/language-server
svelte:
	npm -g install svelte-language-server
lldb:
	nix-env -iA nixpkgs.lldb
toml:
	nix-env -iA nixpkgs.taplo
yaml:
	npm -g install yaml-language-server@next
