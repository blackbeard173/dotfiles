local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
    return
end

local status_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not status_ok then
    return
end

lsp_installer.setup {
    ensure_installed = {
        'clangd',
        'cssls',
        'html',
        'sumneko_lua',
        'tailwindcss',
        'tsserver',
    },
    automatic_installation = false, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        },
    },
    keymaps = {
        toggle_server_expand = "<CR>",
        install_server = "i",
        update_server = "u",
        check_server_version = "c",
        update_all_servers = "U",
        check_outdated_servers = "C",
        uninstall_server = "X",
    },
}
local on_attach = function(client, bufnr)
    local function bufmap(mode, lhs, rhs)
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set(mode, lhs, rhs, bufopts)
    end

    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    bufmap('n', 'K', vim.lsp.buf.hover)
    bufmap('n', 'gd', vim.lsp.buf.definition)
    bufmap('n', 'gi', vim.lsp.buf.implementation)
    bufmap('n', '<space>rn', vim.lsp.buf.rename)
    bufmap('n', '<leader>dj', vim.diagnostic.goto_next)
    bufmap('n', '<leader>dk', vim.diagnostic.goto_prev)
    bufmap('n', '<leader>dl', "<cmd>Telescope diagnostics<cr>")
    -- Configure
    bufmap('n', 'gD', vim.lsp.buf.declaration)
    bufmap('n', '<C-k>', vim.lsp.buf.signature_help)
    bufmap('n', '<space>wa', vim.lsp.buf.add_workspace_folder)
    bufmap('n', '<space>wr', vim.lsp.buf.remove_workspace_folder)
    bufmap('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end)
    bufmap('n', '<space>D', vim.lsp.buf.type_definition)
    bufmap('n', '<space>ca', vim.lsp.buf.code_action)
    bufmap('n', 'gr', vim.lsp.buf.references)
    bufmap('n', '<space>f', vim.lsp.buf.formatting)
end


lspconfig.util.default_config = vim.tbl_extend(
    "force",
    lspconfig.util.default_config,
    {
        on_attach = on_attach
    }
)

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, server in ipairs(lsp_installer.get_installed_servers()) do
    local opts = { capabilities = capabilities }
    if server.name == "sumneko_lua" then
        opts = vim.tbl_deep_extend("keep", {
            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT',
                    },
                    diagnostics = {
                        globals = { 'vim' },
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        }, opts)

    end
    lspconfig[server.name].setup {}
end
