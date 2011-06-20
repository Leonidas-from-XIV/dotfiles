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

" get rid of cindent (crappy for mails)
set nocindent

" define <leader> to something more sane than the default backslash
let mapleader = ","
let maplocalleader = ";"

" automatically jump into the last line that was edited
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" settings for Python files
autocmd FileType python setlocal cindent expandtab shiftwidth=4 tabstop=8 softtabstop=4
autocmd FileType python setlocal tags+=$HOME/tags/python.ctags

autocmd FileType c setlocal shiftwidth=4 expandtab softtabstop=4

" settings for CoffeeScript
autocmd FileType coffee setlocal expandtab shiftwidth=2 softtabstop=2

" Use ,c to compile selected text to corresponding output and print it to stdout
" Thanks to https://github.com/epeli/vimconfig/blob/master/vimrc
" CoffeeScript to Javascript (requires vim-coffee-script plugin)
autocmd FileType coffee vmap <leader>c <esc>:'<,'>CoffeeCompile<CR>

" comments
set fo=croq

" syntax highlighting
syntax on
filetype indent on
filetype plugin on
colorscheme elflord

" highlight useless trailing whitespace
highlight trailingSpace ctermbg=Red
" highlight it in all files
syntax match trailingSpace "\s\+$" display
" highlight it in Python files (python.vim overrides the previous declaration)
autocmd FileType python syntax match trailingSpace "\s\+$" display
" enable rainbow parens
autocmd FileType scheme source ~/.vim/bundle/rainbow-parenthesis/syntax/RainbowParenthsis.vim
" set the paren color to something different than black on black background
autocmd FileType scheme hi level10c ctermfg=darkgreen

" http://www.vex.net/~x/python_and_vim.html
set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" improve recognition of Django templates
fun! s:SelectHTML()
  let n = 1
  while n < 50 && n < line("$")
    " check for django
    if getline(n) =~ '{%\s*\(extends\|block\|comment\|ssi\|if\|for\|blocktrans\)\>'
      set ft=htmldjango
      return
    endif
    let n = n + 1
  endwhile
  set ft=html
endfun

autocmd BufNewFile,BufRead *.html,*.htm  call s:SelectHTML()

" file browser
" hide some files
let g:explHideFiles='^\.,.*\.sw[po]$,.*\.pyc$'
"let g:explDetailedHelp=0

" disable persistance in YankRing. I do not care about old ring contents
let g:yankring_persist = 0

" enable 256 colors (currently disabled as vim can request that from terminfo)
"set t_Co=256

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

" VimClojure stuff
" this is default but what the heck...
let vimclojure#HighlightBuiltins = 1
" VimClojure supports parens
let vimclojure#ParenRainbow = 1
