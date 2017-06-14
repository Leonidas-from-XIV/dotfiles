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

" search for files and things
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" motion
Plug 'easymotion/vim-easymotion'

" linting
Plug 'w0rp/ale'

" git
Plug 'duk3luk3/gitignore'
Plug 'lambdalisue/gina.vim'

" looks
" maybe switch to wallaby theme
Plug 'vim-scripts/wombat256.vim'
Plug 'vim-airline/vim-airline'
call plug#end()

" colourscheme
set t_Co=256
set background=dark
colorscheme wombat256mod

" don't exit visual mode after indenting/outdenting; inspired by
" http://vimcasts.org/episodes/indentation-commands/
vmap < <gv
vmap > >gv

" http://vimcasts.org/episodes/bubbling-text/
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" fzf
" don't open files multiple times
let g:fzf_buffers_jump = 1

" always display airline
set laststatus=2
let g:airline_powerline_fonts = 1

" load Merlin & ocp-indent if installed
if executable("opam")
  let s:opamshare = substitute(system('opam config var share'),'\n$','','''')
  let s:merlinpath = s:opamshare . "/merlin/vim"
  if isdirectory(s:merlinpath)
    execute "set rtp+=" . s:merlinpath
  endif
  let s:ocpindentpath = s:opamshare . "/ocp-indent/vim"
  if isdirectory(s:ocpindentpath)
    execute "set rtp+=" . s:ocpindentpath
    " set rtp^=s:ocpindentpath
  endif
endif

" ALE
" function! LinterStatus() abort
"     let l:counts = ale#statusline#Count(bufnr(''))

"     let l:all_errors = l:counts.error + l:counts.style_error
"     let l:all_non_errors = l:counts.total - l:all_errors

"     return l:counts.total == 0 ? 'OK' : printf(
"     \   '%dW %dE',
"     \   all_non_errors,
"     \   all_errors
"     \)
" endfunction

" set statusline=%{LinterStatus()}

" Filetype customizations

" gc* does comments courtesy of vim-commentary, but does not support OCaml
" OOTB, define this stuff
autocmd FileType ocaml setlocal commentstring=(*%s*) shiftwidth=2
autocmd FileType ocaml map <buffer> <leader>t :MerlinTypeOf<return>
autocmd FileType ocaml vmap <buffer> <leader>t :MerlinTypeOfSel<return>
