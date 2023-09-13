-- Package manager configuration

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer
    use 'wbthomason/packer.nvim'
    -- Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
   --Treesitter 
   use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
   --Undotree
   use('mbbill/undotree')
   --Lsp
   use {'neovim/nvim-lspconfig'}
   use {"williamboman/mason.nvim"}
   use {"williamboman/mason-lspconfig.nvim"}

   --Autocompletion
   use {'hrsh7th/nvim-cmp'}
   use {'hrsh7th/cmp-nvim-lsp'}
   use({
	    "L3MON4D3/LuaSnip",
	    tag = "v2.*",
    })

   --Oxocarbon colorscheme
   use {'winters0x64/oxocarbon.nvim'}
   --Nvimtree
   use {'nvim-tree/nvim-tree.lua'}
   --Icons for lualine and nvimtree
   use {'nvim-tree/nvim-web-devicons'}
   --Lualine
   use {
        'nvim-lualine/lualine.nvim',
         requires = { 'nvim-tree/nvim-web-devicons', opt = true }
     }
   --Barbar
   use{'romgrk/barbar.nvim'}
   --Toggleterm
   -- use {"akinsho/toggleterm.nvim", tag = '*'}
 end)
