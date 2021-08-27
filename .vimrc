set shell=/bin/bash
set mouse=a

so ~/.vim/plugins.vim

"fix shitty backspace handling
set backspace=indent,eol,start

"search text selection with //
vnoremap // y/<C-R>"<CR>

"disable for tmux
"set ttymouse=xterm2
"set bg=dark
map <F1> <Plug>NERDCommenterToggle
"map <F2> :WMToggle<CR>
nnoremap <F2> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
map <F3> :TagbarToggle<CR>
"ctags need to be installed
let g:tagbar_ctags_bin='/usr/local/bin/ctags'  " Proper Ctags locations"
"gotags need to be installed
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

map <silent> <F4> :call BufferList()<CR>
map + <C-W>+
map - <C-W>-
map <F7> <C-W><
map <F8> <C-W>>
map <S-F7> 1000<C-W><
map <S-F8> 1000<C-W>>
"map <F10> :Explore<CR>
map <F10> :NERDTreeToggle<CR>
map <F5> :set cursorcolumn<Bar>set cursorline!<CR>
set pastetoggle=<F12>
set t_Co=256
set cursorline
"highlight searching
set hlsearch
set omnifunc=javascriptcomplete#CompleteJS
colorscheme neverland

"tmux vim fuckup fix
"Needed for tmux and vim to play nice
map <Esc>[A <Up>
map <Esc>[B <Down>
map <Esc><Esc><Esc>[C <Right>
map <Esc>[D <Left>
" Console movement
cmap <Esc>[A <Up>
cmap <Esc>[B <Down>
cmap <Esc>[C <Right>
cmap <Esc>[D <Left>


" mods GMT
set tabstop=3
set autoindent
set shiftwidth=3
set expandtab
"set foldmethod=syntax
"set foldcolumn=1                                                                     
let perl_include_pod = 1 
let perl_extended_vars=1

"yamlstuff
"autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

"gostuff
"autowrite writes content of the file when running make
let mapleader = ","
set autowrite 
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
map <C-p> :cprevious<CR>
nnoremap <leader>c :cclose<CR>
"autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
map <F6> :GoDoc<CR>

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

au BufRead,BufNewFile *.go set filetype=go
"let g:go_highlight_functions = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_fields = 1
"let g:go_highlight_types = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_build_constraints = 1

""vim-go stuff
""https://github.com/fatih/vim-go-tutorial#quick-setup
"call plug#begin()
"Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
"Plug 'ctrlpvim/ctrlp.vim'
"call plug#end() 

" show matching brackets
set showmatch

" display mode INSERT/REPLACE/...
set showmode

" select case-insenitiv search (not default)
set ignorecase

" enable syntax highlighting
syntax on

" show cursor line and column in the status line
set ruler
set number

" get easier to use and more user friendly vim defaults
" CAUTION: This option breaks some vi compatibility. 
"          Switch it off if you prefer real vi compatibility
set nocompatible

" TList settings
let g:Tlist_WinWidth=25
let g:Tlist_File_Fold_Auto_Close=1
let g:Tlist_Exit_OnlyWindow=1

"Nerdcommenter needs this:
" automatic indenting
filetype indent on
filetype plugin on

set nocompatible
set history=10000

"nerdcommenter
"call pathogen#infect()
filetype plugin indent on
