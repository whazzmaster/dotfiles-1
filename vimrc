filetype off 
set nocompatible  " Use Vim settings, rather then Vi settings

set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set number
set clipboard=unnamed " Use system clipboard

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'Lokaltog/powerline'
Plugin 'kien/ctrlp.vim'
Plugin 'groenewege/vim-less'
Plugin 'flazz/vim-colorschemes'
Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plugin 'scrooloose/syntastic'
Plugin 'saltstack/salt-vim'
Plugin 'scrooloose/nerdtree' 

call vundle#end()
filetype plugin indent on

" NERDTree
map <C-t> :NERDTreeToggle<CR>

" Colorscheme
colorscheme Tomorrow-Night

" goimports
let g:gofmt_command ="goimports"
" gofmt on save
autocmd FileType go autocmd BufWritePre <buffer> Fmt
" Go complier
autocmd FileType go compiler go

" Taken from http://dougblack.io/words/a-good-vimrc.html
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase
set smartcase

set hidden
set backspace=indent,eol,start

" vim splits
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" PuTTY Fix
if &term =~ "xterm"
    "256 color --
    let &t_Co=256
    " restore screen after quitting
    set t_ti=ESC7ESC[rESC[?47h t_te=ESC[?47lESC8
    if has("terminfo")
        let &t_Sf="\ESC[3%p1%dm"
        let &t_Sb="\ESC[4%p1%dm"
    else
        let &t_Sf="\ESC[3%dm"
        let &t_Sb="\ESC[4%dm"
    endif
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" Autocompletion
filetype plugin indent on
set ofu=syntaxcomplete#Complete
let g:neocomplete#enable_at_startup = 1

" Softtabs, 2 spaces
set tabstop=4
set shiftwidth=4
set expandtab
set wrap

