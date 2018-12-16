set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'leafgarland/typescript-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/BufOnly.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'digitaltoad/vim-pug'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'alpertuna/vim-header'
Plugin 'fatih/vim-go'
Plugin 'ctrlpvim/ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax enable
set background=dark
colorscheme solarized


augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
  au WinLeave * setlocal nocursorline
  au WinLeave * setlocal nocursorcolumn
augroup END

set nu

if has("gui_running")
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
    set guioptions-=M
    set guifont=Source\ Code\ Pro\ for\ Powerline\ Regular\ 12
endif

filetype plugin indent on
if !exists("g:ycm_semantic_triggers")
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

let NERDTreeIgnore = ['\.js$','\.js.map$']


" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#whitespace#checks = []
let g:airline#extensions#branch#enabled=1

if !exists('g:airline_symbols')
      let g:airline_symbols = {}
  endif
  let g:airline_symbols.space = "\ua0"

" misc
set path^=$PWD/**
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

set hlsearch
set incsearch
nnoremap <CR> :nohlsearch<CR><CR>
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <A-n> :bnext<CR>:redraw<CR>:ls<CR>
nnoremap <A-p> :bprevious<CR>:redraw<CR>:ls<CR>
" ycm
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>jD :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jr :YcmCompleter GoToReferences<CR>
nnoremap <leader>yd :YcmDiags<CR>
" Go
nnoremap <leader>gb :GoBuild<CR>
nnoremap <leader>gi :GoInstall<CR>
nnoremap <leader>gr :GoReferrers<CR>


" remember last session cursor
function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

" for Man page
runtime ftplugin/man.vim
let g:ft_man_open_mode = 'tab'

let g:jsdoc_enable_es6 = 1
let g:jsdoc_allow_input_prompt = 0

let g:syntastic_java_checkers = []

nnoremap <leader>l :NERDTreeFind<CR> 
nnoremap <leader>st :echo strftime('%c')<CR>
let g:header_field_author = 'ngui'
let g:header_field_author_email = 'nguisiautien at gmail dot com'
let g:header_auto_add_header = 0
let g:header_field_modified_timestamp = 0 
let g:header_field_modified_by = 0 
let g:header_field_timestamp_format = '%m/%d/%Y' 
let g:header_field_license_id = 'MIT'
nnoremap <leader>ah :AddHeader<CR>
"let g:ycm_log_level = 'debug'

let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
