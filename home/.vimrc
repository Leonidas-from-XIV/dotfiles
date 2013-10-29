" .vimrc by Leonidas

" enable the pathogen plugin so it can mangle paths and such
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" deactivate vi compatibility, make usable
set nocompatible

" show command line in normal mode
set showcmd
" brace highlighting
set showmatch
" activate wildmenu - this is definitely useful for switching between files
set wildmenu
set wildignore=*.dll,*.o,*.pyc,*.pyo,*.bak,*.swp,*.exe,*.jpg,*.jpeg,*.png,*.gif

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

" pthon-mode uses folding but I don't like the fact that it is folded by
" default, so I immediately unfold it. Folding manually still works if
" required
autocmd FileType python silent! %foldopen!
" Or just disable it
"let g:pymode_folding = 0
" Access the docs via ,d over an identifier
let g:pymode_doc_key = '<leader>d'
" goto definition of identifier with ,g
autocmd FileType python nmap <leader>g <esc>:RopeGotoDefinition<CR>
" not super-useful because very slow but finds all occurences
autocmd FileType python nmap <leader>f <esc>:RopeFindOccurrences<CR>
" I dislike line numbers but like the other python-mode options
autocmd FileType python setlocal nonumber

" some useful settings for C
autocmd FileType c setlocal shiftwidth=4 expandtab softtabstop=4

" settings for CoffeeScript
autocmd FileType coffee setlocal expandtab shiftwidth=2 softtabstop=2

" Use ,c to compile selected text to corresponding output and print it to stdout
" Thanks to https://github.com/epeli/vimconfig/blob/master/vimrc
" CoffeeScript to Javascript (requires vim-coffee-script plugin)
autocmd FileType coffee vmap <leader>c <esc>:'<,'>CoffeeCompile<CR>

autocmd FileType ruby setlocal shiftwidth=2 expandtab softtabstop=2

" \\\ does comments courtesy of vim-commentary, but does not support OCaml
" OOTB, define this stuff
autocmd FileType ocaml setlocal commentstring=(*%s*) shiftwidth=2

" exclude single quotes from delimitMate in Clojure code
autocmd FileType clojure let b:delimitMate_quotes = "\""

" enable rainbow parens
autocmd VimEnter * RainbowParenthesesToggleAll
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces
" Rainbow Parentheses renders level 10 parens usually ctermfg=black
" but this is unreadable in Solarized theme. Override this particular setting
autocmd VimEnter * highlight level10c ctermfg=darkcyan

" fireplace alias: connect to locally running nREPL at 33033
autocmd FileType clojure command! -buffer Repl Connect nrepl://localhost:33033

" map ,g to Gist: '<,'>Gist
vmap <leader>g <esc>:'<,'>Gist<CR>

" comments
set fo=croq

" syntax highlighting
syntax enable
set t_Co=256
set background=dark
filetype indent on
filetype plugin on
colorscheme solarized

" highlight unwanted spaces
highlight UnwantedSpaces ctermbg=red guibg=red
match UnwantedSpaces /\s\+$\|\s\t\|\t\s/

" Closetag plugin
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim
inoremap </ <C-R>=GetCloseTag()<CR>

" file browser
" hide some files
let g:explHideFiles='^\.,.*\.sw[po]$,.*\.pyc$'
"let g:explDetailedHelp=0

" disable persistance in YankRing. I do not care about old ring contents
let g:yankring_persist = 0

" Tab and Shift-Tab indent and unindent in visual mode
" (conflicts with snippetsEmu, unfortunately)
"vnoremap <TAB> >gv
"vnoremap <S-TAB> <gvi

" Some forms that should be specially indented
set lispwords+=parameterize

" characters to use for :set list
set listchars=tab:▸\ ,eol:¬

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
