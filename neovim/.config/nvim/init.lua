vim.o.number = true
vim.o.relativenumber = true

vim.o.ignorecase = true
vim.o.smartcase = true

-- winbar
vim.o.winbar = "%t %m %h"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("keymaps")
require("lazynvim")

vim.cmd.colorscheme("carbonfox")
