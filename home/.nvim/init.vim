" init.vim by Marek Kubica <marek@xivilization.net>
" You need to call :PlugInstall to get the required bundles

call plug#begin('~/.local/share/nvim/plugged')

" tpope
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

" editing
Plug 'ervandew/supertab'

" undo tree
Plug 'sjl/gundo.vim'

" motion
Plug 'easymotion/vim-easymotion'

" git
Plug 'duk3luk3/gitignore'

" looks
" maybe switch to wallaby theme
Plug 'vim-scripts/wombat256.vim'
Plug 'vim-airline/vim-airline'
call plug#end()

" colourscheme
set t_Co=256
set background=dark
colorscheme wombat256mod
