local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to space
vim.g.mapleader = ' '

-- Neovim shortcuts

-- Reload configuration without restart nvim
-- map('n', '<leader>r', ':so %<CR>')

-- Explorer
map('n', '<C-b>', ':NvimTreeToggle<CR>')

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Fast saving with <leader> and s
map('n', '<leader>s', ':w<CR>')
--  map('i', '<leader>s', '<C-c>:w<CR>') -- useless lmao

-- indent in visual mode
map('v', '<', '<gv')
map('v', '>', '>gv')
