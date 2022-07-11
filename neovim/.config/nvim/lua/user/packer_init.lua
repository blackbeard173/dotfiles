-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
end

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_init.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

-- Install plugins
return packer.startup({ function(use)
    -- Add you plugins here:
    use 'wbthomason/packer.nvim' -- packer can manage itself

    -- Color schemes
    use 'navarasu/onedark.nvim'
    -- use {'Everblush/everblush.nvim' , as='everblush' }

    use 'kyazdani42/nvim-web-devicons'

    use {
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons' }
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {
        'akinsho/bufferline.nvim',
        tag = "v2.*",
        requires = { 'kyazdani42/nvim-web-devicons' },
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' }
    }

    use 'folke/which-key.nvim'

    -- Dashboard
    use {
        'goolord/alpha-nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
    }

    -- TreeSitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'windwp/nvim-ts-autotag'
    use 'p00f/nvim-ts-rainbow'
    use 'windwp/nvim-autopairs'

    -- LSP
    use 'neovim/nvim-lspconfig'
    -- Auto Completion
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            -- Sources
            'hrsh7th/cmp-nvim-lsp',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
        },
    }
    use 'L3MON4D3/LuaSnip'
    use 'williamboman/nvim-lsp-installer'
    use 'onsails/lspkind.nvim'
    use { "rafamadriz/friendly-snippets",
        requires = { 'L3MON4D3/LuaSnip' }
    }

    -- Git
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup {
                current_line_blame = true,
            }
        end
    }

    use 'lukas-reineke/indent-blankline.nvim'

    use { "akinsho/toggleterm.nvim", tag = 'v1.*' }
    use 'numToStr/Comment.nvim' -- check out nvim-ts-comment

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end,
    -- Floating Window
    config = {
        display = {
            open_fn = require('packer.util').float,
        }
    }
}
)
