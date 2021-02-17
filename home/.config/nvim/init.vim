" init.vim by Marek Kubica <marek@xivilization.net>
" You need to call :PlugInstall to get the required bundles

"call plug#begin('~/.local/share/nvim/plugged')
call plug#begin(stdpath('data') . '/plugged')

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

" make
Plug 'neomake/neomake'

" multiple cursors
"Plug 'terryma/vim-multiple-cursors'
Plug 'mg979/vim-visual-multi'

" formatting
Plug 'sbdchd/neoformat'

" git
Plug 'duk3luk3/gitignore'
Plug 'lambdalisue/gina.vim'
Plug 'rhysd/git-messenger.vim'

" looks
" maybe switch to wallaby theme
Plug 'vim-scripts/wombat256.vim'
Plug 'rhysd/wallaby.vim'
Plug 'junegunn/seoul256.vim'
Plug 'vim-airline/vim-airline'

" ocaml
Plug 'ocaml/vim-ocaml', {'for': 'ocaml'}

" clojure
Plug 'Olical/conjure', {'tag': 'v4.14.0', 'for': 'clojure'}
Plug 'Olical/AnsiEsc'
Plug 'guns/vim-sexp', {'for': 'clojure'}
Plug 'tpope/vim-sexp-mappings-for-regular-people', {'for': 'clojure'}
Plug 'luochen1990/rainbow'

" align
" mostly for clojure
Plug 'junegunn/vim-easy-align', {'for': 'clojure'}

" memento mori
Plug 'Leonidas-from-XIV/memento-mori.nvim'
call plug#end()

" colourscheme
set t_Co=256
set background=dark
colorscheme wombat256mod

"set background=light
"let g:seoul256_background = 256
"colo seoul256

" don't exit visual mode after indenting/outdenting; inspired by
" http://vimcasts.org/episodes/indentation-commands/
vmap < <gv
vmap > >gv

" sexp editing uses local leader and why not space since its default mapping
" is not all that useful anyway
"nnoremap <Space> <Nop>
"let maplocalleader=" "
let maplocalleader=","

let g:sexp_enable_insert_mode_mappings = 0

" enable rainbow parens
let g:rainbow_active = 1

" automatically exit insert mode after inactivity
au CursorHoldI * stopinsert
au InsertEnter * let updaterestore=&updatetime | set updatetime=4000
au InsertLeave * let &updatetime=updaterestore

" http://vimcasts.org/episodes/bubbling-text/
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" copy to clipboard
set clipboard=unnamedplus

" fzf
" don't open files multiple times
let g:fzf_buffers_jump = 1

" always display airline
set laststatus=2
let g:airline_powerline_fonts = 1

" always display ALE gutter
" (actually I want to never display it but oh well)
let g:ale_sign_column_always = 1
" don't fucking mess with the bottom line
let g:ale_set_loclist = 0

" easymotion
" bidirectional \\w
" nmap <Leader><Leader>w <Plug>(easymotion-bd-w)
" bidirectional \\w over multiple windows
nmap <Leader><Leader>w <Plug>(easymotion-overwin-w)

" Display memento mori info in airline
let g:airline_section_y = '%-0.5{MementoMori()}'
let g:memento_mori_birthdate = '1988-08-07'

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

" enable easy align
autocmd FileType clojure nmap ga <Plug>(EasyAlign)
autocmd FileType clojure xmap ga <Plug>(EasyAlign)
" auto alignment for [] and {} in Clojure forms
"autocmd FileType clojure map <buffer> <leader>] vi[ga-<Space><return>
"autocmd FileType clojure map <buffer> <leader>} vi{ga-<Space><return>
autocmd FileType clojure nmap <buffer> <leader>] vi[<c-v>$:EasyAlign\ g/^\S/<cr>gv=
autocmd FileType clojure nmap <buffer> <leader>} vi{<c-v>$:EasyAlign\ g/^\S/<cr>gv=

" more useful general settings when working with Clojure
autocmd FileType clojure set number nowrap sidescrolloff=999

" https://github.com/Olical/conjure/wiki/Displaying-ANSI-escape-code-colours-in-the-log-buffer
autocmd BufEnter conjure-log-* AnsiEsc

" FZF
let g:fzf_buffers_jump = 1
nnoremap <C-p> :GFiles<CR>
