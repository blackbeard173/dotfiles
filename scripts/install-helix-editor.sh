#! /bin/bash
# https://docs.helix-editor.com/install.html

cd
git clone https://github.com/helix-editor/helix
cd helix
cargo install --path helix-term
cd

mv -iv ~/helix/runtime ~/.config/helix/runtime

hx --grammar fetch
hx --grammar build
