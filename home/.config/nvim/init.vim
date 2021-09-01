" init.vim by Marek Kubica <marek@xivilization.net>

lua require('plugins')

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
"set clipboard=unnamedplus

" always display airline
set laststatus=2
let g:airline_powerline_fonts = 1

" easymotion
" bidirectional \\w
" nmap <Leader><Leader>w <Plug>(easymotion-bd-w)
" bidirectional \\w over multiple windows
nmap <Leader><Leader>w <Plug>(easymotion-overwin-w)

" Display memento mori info in airline
" let g:airline_section_y = '%-0.5{MementoMori()}'
" let g:memento_mori_birthdate = '1988-08-07'

" load Merlin & ocp-indent if installed
" if executable("opam")
"   let s:opamshare = substitute(system('opam config var share'),'\n$','','''')
"   let s:merlinpath = s:opamshare . "/merlin/vim"
"   if isdirectory(s:merlinpath)
"     execute "set rtp+=" . s:merlinpath
"   endif
"   let s:ocpindentpath = s:opamshare . "/ocp-indent/vim"
"   if isdirectory(s:ocpindentpath)
"     execute "set rtp+=" . s:ocpindentpath
"     " set rtp^=s:ocpindentpath
"   endif
" endif

" Filetype customizations

" gc* does comments courtesy of vim-commentary, but does not support OCaml
" OOTB, define this stuff
autocmd FileType ocaml setlocal commentstring=(*%s*) shiftwidth=2
autocmd FileType ocaml map <buffer> <leader>t :MerlinTypeOf<return>
autocmd FileType ocaml vmap <buffer> <leader>t :MerlinTypeOfSel<return>

" more useful general settings when working with Clojure
autocmd FileType clojure set number nowrap sidescrolloff=7

" check when file changes externally
set autoread
autocmd FocusGained,BufEnter * :checktime

" Telescope
nnoremap <C-p> :Telescope git_files<CR>