vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- tpope
  use 'tpope/vim-commentary'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'

  -- editing
  use 'ervandew/supertab'

  -- undo tree
  use 'sjl/gundo.vim'

  -- search for files and things
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- motion
  use 'easymotion/vim-easymotion'

  -- make
  use 'neomake/neomake'

  -- multiple cursors
  -- use 'terryma/vim-multiple-cursors'
  use 'mg979/vim-visual-multi'

  -- formatting
  use 'sbdchd/neoformat'

  -- git
  use 'duk3luk3/gitignore'
  use 'lambdalisue/gina.vim'
  use 'rhysd/git-messenger.vim'

  -- looks
  -- maybe switch to wallaby theme
  use 'vim-scripts/wombat256.vim'
  use 'rhysd/wallaby.vim'
  use 'junegunn/seoul256.vim'

  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- ocaml
  use {
    'ocaml/vim-ocaml',
    ft = {'ocaml'}
  }

  use 'tpope/vim-markdown'

  -- memento mori
  use {
    'Leonidas-from-XIV/memento-mori.nvim',
    config = function ()
        vim.g.memento_mori_birthdate = '1988-08-07'
      end
  }

  -- TODO: fix to make this work, somehow
  use {
    "folke/which-key.nvim",
    config = function()
        require("which-key").setup {}
      end
  }

  -- LSP stuff
  use 'neovim/nvim-lspconfig'
  use {
    'tami5/lspsaga.nvim',
    branch = 'nvim51'
  }
  use {
    'RishabhRD/lspactions',
    requires = { {'nvim-lua/plenary.nvim'}, {'nvim-lua/popup.nvim'}, {'tjdevries/astronauta.nvim'} }
  }
  use 'ray-x/lsp_signature.nvim'

  -- completion
  use 'hrsh7th/nvim-cmp'

  require('lualine').setup({
    options = {
      theme = 'powerline'
    },
    sections = {
      lualine_y = {require('memento-mori').memento_mori}
    }
  })
end)
