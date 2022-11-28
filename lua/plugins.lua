----------------------------------Plugins--------------------------------------
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'                          -- self packer
  
  use 'joshdick/onedark.vim'                            -- colorshemes
  use 'ellisonleao/gruvbox.nvim'                        --
  
  use 'Pocco81/auto-save.nvim'                          -- auto-save

  use {'nvim-tree/nvim-tree.lua',                       -- file tree
    requires = {'nvim-tree/nvim-web-devicons'},         -- icons
    tag = 'nightly'}                                    -- upd. every week
 
  use {'nvim-lualine/lualine.nvim',                     -- lua airline
    requires = {'kyazdani42/nvim-web-devicons', opt = true}}

  use {'akinsho/bufferline.nvim',                       -- tabs
    tag = "v3.*",                                       -- prefer ver.
    requires = 'nvim-tree/nvim-web-devicons'}           -- icons

  use {'nvim-telescope/telescope.nvim',                 -- file finder
    tag = '0.1.0',                                      -- ver.
    requires = {{'nvim-lua/plenary.nvim'}}              -- additional
  }

  use 'neovim/nvim-lspconfig'                           -- config for LSP
  use 'hrsh7th/nvim-cmp'                                -- Autocompletion
  use 'hrsh7th/cmp-nvim-lsp'                            -- LSP src. for CMP
  use 'saadparwaiz1/cmp_luasnip'                        -- Snippets src. CMP
  use 'L3MON4D3/LuaSnip'                                -- Snippets

  use 'alvan/vim-closetag'                              -- close html tags
  use 'ap/vim-css-color'                                -- color hi
  use 'cohama/lexima.vim'                               -- close parentheses

end)
