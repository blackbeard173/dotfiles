local wk = require("which-key")

local Terminal = require('toggleterm.terminal').Terminal
local toggle_float = function()
    local float = Terminal:new({ direction = "float" })
    return float:toggle()
end
local toggle_lazygit = function()
    local lazygit = Terminal:new({ cmd = 'lazygit', direction = "float" })
    return lazygit:toggle()
end

local mappings = {
    q = { ':q<CR>', 'Quit' },
    w = { ':w<CR>', 'Save' },
    s = { ':w<CR>', 'Save' },
    x = { ':bdelete<CR>', 'Close Buffer' },
    E = { ':e ~/.config/nvim/init.lua<CR>', 'Edit Neovim Config' },
    f = {
        name = 'Telescope',
        f = { ':Telescope find_files<CR>', 'Telescope Search Files' },
        r = { ':Telescope live_grep<CR>', 'Telescope Live Grep' },
    },
    l = {
        name = "LSP",
        i = { ":LspInfo<cr>", "Connected Language Servers" },
        k = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
        K = { "<cmd>Lspsaga hover_doc<cr>", "Hover Commands" },
        w = { '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', "Add Workspace Folder" },
        W = { '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', "Remove Workspace Folder" },
        l = {
            '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>',
            "List Workspace Folders"
        },
        t = { '<cmd>lua vim.lsp.buf.type_definition()<cr>', "Type Definition" },
        d = { '<cmd>lua vim.lsp.buf.definition()<cr>', "Go To Definition" },
        D = { '<cmd>lua vim.lsp.buf.declaration()<cr>', "Go To Declaration" },
        r = { '<cmd>lua vim.lsp.buf.references()<cr>', "References" },
        R = { '<cmd>Lspsaga rename<cr>', "Rename" },
        a = { '<cmd>Lspsaga code_action<cr>', "Code Action" },
        e = { '<cmd>Lspsaga show_line_diagnostics<cr>', "Show Line Diagnostics" },
        n = { '<cmd>Lspsaga diagnostic_jump_next<cr>', "Go To Next Diagnostic" },
        N = { '<cmd>Lspsaga diagnostic_jump_prev<cr>', "Go To Previous Diagnostic" }
    },
    p = {
        name = "Packer",
        r = { ":PackerClean<cr>", "Remove Unused Plugins" },
        c = { ":PackerCompile profile=true<cr>", "Recompile Plugins" },
        i = { ":PackerInstall<cr>", "Install Plugins" },
        p = { ":PackerProfile<cr>", "Packer Profile" },
        s = { ":PackerSync<cr>", "Sync Plugins" },
        S = { ":PackerStatus<cr>", "Packer Status" },
        u = { ":PackerUpdate<cr>", "Update Plugins" }
    },
    t = {
        name = "ToggleTerm",
        t = { ":ToggleTerm<cr>", "Split Below" },
        f = { toggle_float, "Floating Terminal" },
        l = { toggle_lazygit, "LazyGit" }
    },

}

local opts = { prefix = '<leader>' }

wk.register(mappings, opts)
