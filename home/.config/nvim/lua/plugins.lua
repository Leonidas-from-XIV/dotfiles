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
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- ocaml
  use {
    'ocaml/vim-ocaml',
    ft = {'ocaml'}
  }

  -- memento mori
  use {
    'Leonidas-from-XIV/memento-mori.nvim',
    config = function ()
        vim.g.memento_mori_birthdate = '1988-08-07'
      end
  }

  require('lualine').setup({
    options = {
      theme = 'powerline'
    },
    sections = {
      lualine_y = {'MementoMori'}
    }
  })
end)

