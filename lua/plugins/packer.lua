local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'
  -- Components
  use 'mfussenegger/nvim-dap'
  use 'nvim-lualine/lualine.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim'
	}
  use 'nvim-neotest/neotest'
  use {'akinsho/toggleterm.nvim', tag = '*'}
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-treesitter/nvim-treesitter-context'
  -- Helper
  use 'stevearc/aerial.nvim'
  use 'windwp/nvim-autopairs'
  use 'kevinhwang91/nvim-bqf'
  use 'numToStr/Comment.nvim'
  use 'kevinhwang91/nvim-hlslens'
  use 'vladdoster/remember.nvim'
  use 'L3MON4D3/LuaSnip'
  use 'folke/todo-comments.nvim'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'abecodes/tabout.nvim'
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  -- LSP
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use {
    'anuvyklack/fold-preview.nvim',
    requires = 'anuvyklack/keymap-amend.nvim'
  }
  use 'folke/trouble.nvim'
  -- Themes
  use 'onsails/lspkind.nvim'
  use 'nvim-tree/nvim-web-devicons'
  use {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require('mini.icons').setup()
    end
  }
  use 'folke/tokyonight.nvim'
  use 'startup-nvim/startup.nvim'
  use 'kevinhwang91/nvim-ufo'
  use 'kevinhwang91/promise-async'
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
