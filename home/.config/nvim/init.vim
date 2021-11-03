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

" hop
nmap <Leader><Leader>w :HopWord<return>

" Filetype customizations

" gc* does comments courtesy of vim-commentary, but does not support OCaml
" OOTB, define this stuff
autocmd FileType ocaml setlocal commentstring=(*%s*) shiftwidth=2
" autocmd FileType ocaml map <buffer> <leader>t :MerlinTypeOf<return>
autocmd FileType ocaml vmap <buffer> <leader>t :MerlinTypeOfSel<return>

" more useful general settings when working with Clojure
autocmd FileType clojure set number nowrap sidescrolloff=7

" check when file changes externally
set autoread
autocmd FocusGained,BufEnter * :checktime

" Telescope
nnoremap <C-p> :Telescope git_files<CR>

" LSP
lua require'lspconfig'.ocamllsp.setup{}
autocmd FileType ocaml map <buffer> <leader>s <Cmd>Lspsaga signature_help<return>
autocmd FileType ocaml map <buffer> <leader>t <Cmd>Lspsaga hover_doc<return>
autocmd FileType ocaml map <buffer> <leader>d <Cmd>lua vim.lsp.buf.definition()<return>
autocmd FileType ocaml map <buffer> <leader>r <Cmd>lua require'lspactions'.rename()<return>

" my GitHub username is long so whenever I need to refer to it I'll be lazy
iabbrev Leon Leonidas-from-XIV
