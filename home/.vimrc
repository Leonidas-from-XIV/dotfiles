" .vimrc by Marek Kubica <marek@xivilization.net>
" You need to call :PluginInstall to get the required bundles

" deactivate vi compatibility, make usable
set nocompatible

" Vundle setup dance
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'ervandew/supertab'
Plugin 'Raimondi/delimitMate'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/Gundo'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-unimpaired'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'bling/vim-airline'
Plugin 'duk3luk3/gitignore'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'majutsushi/tagbar'

" Permanent very magic mode
Plugin 'coot/CRDispatcher'
Plugin 'coot/EnchantedVim'

" gist
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'

" language bundles
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'xhr/vim-io'
Plugin 'Leonidas-from-XIV/vim-coffee-script'

" git
Plugin 'tpope/vim-fugitive'

" looks
Plugin 'vim-scripts/wombat256.vim'
Plugin 'MnO2/vim-ocaml-conceal'
Plugin 'enomsg/vim-haskellConcealPlus'

call vundle#end()
filetype plugin indent on
" end of Vundle setup

" load Merlin if installed
if executable("opam")
  let s:opamshare = substitute(system('opam config var share'),'\n$','','''')
  let s:merlinpath = s:opamshare . "/merlin/vim"
  if isdirectory(s:merlinpath)
    execute "set rtp+=" . s:merlinpath
  endif
endif

" show command line in normal mode
set showcmd
" brace highlighting
set showmatch
" activate wildmenu - this is definitely useful for switching between files
set wildmenu
" Tab-complete files up to longest unambiguous prefix
set wildmode=list:longest,full

" Set 7 lines to the cursor - when moving vertically using j/k
set scrolloff=7

" http://vim.wikia.com/wiki/Accessing_the_system_clipboard
" needs +clipboard / +xterm_clipboard
" (in Arch you need the gvim package even with console vim)
set clipboard=unnamedplus

" define <leader> to something more sane than the default backslash
let mapleader = ","
let maplocalleader = ";"

" default tab maximum is 10, srsly?
set tabpagemax=100

" I can't stand these stupid swapfiles, just disable them. they're not
" helpful anyway
set nobackup
set nowritebackup
set noswapfile

" disable tear-off menus in gvim - rule of ugly!
set guioptions-=t
" also, don't waste space on toolbar
set guioptions-=T

" some sane font for the GUI with fallbacks:
" Droid Sans Mono (Dotted if available)
" DejaVu Sans Mono
" whatever Monospace you got
set guifont=Droid\ Sans\ Mono\ Dotted\ 11,Droid\ Sans\ Mono\ 11,DejaVu\ Sans\ Mono\ 11,Monospace\ 11

" automatically jump into the last line that was edited
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" get rid of cindent (crappy for mails)
set nocindent
" smartindent tends to break plain text just as well
set nosmartindent
" " deactivate it for hashes
inoremap # #

" always display airline
set laststatus=2
let g:airline_powerline_fonts = 1

" some useful settings for C
autocmd FileType c setlocal shiftwidth=4 expandtab softtabstop=4

" settings for CoffeeScript
autocmd FileType coffee setlocal expandtab shiftwidth=2 softtabstop=2

" Use ,c to compile selected text to corresponding output and print it to stdout
" Thanks to https://github.com/epeli/vimconfig/blob/master/vimrc
" CoffeeScript to Javascript (requires vim-coffee-script plugin)
autocmd FileType coffee vmap <leader>c <esc>:'<,'>CoffeeCompile<CR>

autocmd FileType ruby setlocal shiftwidth=2 expandtab softtabstop=2

" gc* does comments courtesy of vim-commentary, but does not support OCaml
" OOTB, define this stuff
autocmd FileType ocaml setlocal commentstring=(*%s*) shiftwidth=2
autocmd FileType ocaml map <buffer> <leader>t :MerlinTypeOf<return>
autocmd FileType ocaml vmap <buffer> <leader>t :MerlinTypeOfSel<return>

" exclude single quotes from delimitMate in Clojure code
autocmd FileType clojure let b:delimitMate_quotes = "\""

" enable rainbow parens
"autocmd VimEnter * RainbowParenthesesToggleAll
"autocmd Syntax * RainbowParenthesesLoadRound
"autocmd Syntax * RainbowParenthesesLoadSquare
"autocmd Syntax * RainbowParenthesesLoadBraces
" Rainbow Parentheses renders level 10 parens usually ctermfg=black
" but this is unreadable in Solarized theme. Override this particular setting
"autocmd VimEnter * highlight level10c ctermfg=darkcyan

" map ,g to Gist: '<,'>Gist
vmap <leader>g <esc>:'<,'>Gist<CR>

" ,u triggers Gundo view
nmap <silent> <leader>u :GundoToggle<CR>

" ,tt goes to tagbar
map <leader>tt :TagbarToggle<CR>

" comments
set fo=croq

" syntax highlighting
syntax enable
set t_Co=256
set background=dark
colorscheme wombat256mod

" highlight unwanted spaces
"highlight UnwantedSpaces ctermbg=red guibg=red
"match UnwantedSpaces /\s\+$\|\s\t\|\t\s/

" disable persistance in YankRing. I do not care about old ring contents
let g:yankring_persist = 0
let g:yankring_replace_n_pkey = '<C-K>'
let g:yankring_replace_n_nkey = '<C-J>'

" Tab and Shift-Tab indent and unindent in visual mode
" (conflicts with snippetsEmu, unfortunately)
"vnoremap <TAB> >gv
"vnoremap <S-TAB> <gvi

" Some forms that should be specially indented
set lispwords+=parameterize

" characters to use for :set list
set list
" But only interesting whitespace
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

" move through wrapped lines
" http://vim.wikia.com/wiki/Move_through_wrapped_lines
imap <silent> <Down> <C-o>gj
imap <silent> <Up> <C-o>gk
nmap <silent> <Down> gj
nmap <silent> <Up> gk

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

" auto-reload .vimrc & _vimrc after editing
" http://vimcasts.org/episodes/updating-your-vimrc-file-on-the-fly/
autocmd BufWritePost .vimrc,_vimrc source $MYVIMRC
