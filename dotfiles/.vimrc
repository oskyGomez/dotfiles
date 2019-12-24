filetype off                  " required

set rtp+=$HOME/.vim/bundle/Vundle.vim
if filereadable(expand("$HOME/.vimrc.bundles"))
  source $HOME/.vimrc.bundles
endif

filetype plugin indent on    " required

" Edit
scriptencoding utf8
set encoding=utf8
set fileencoding=utf8
set termencoding=utf8

set list " display unprintable characters
set listchars=tab:▸\ ,trail:·
set nowrap " avoid breaking a line single line into multiple lines
set nocompatible " make vim not compatible with vi
set hidden " allow unsaved background buffers and remember marks/undo for them
set history=100 " remember more commands and search history (default is 20)
set expandtab " insert spaces instead of tabs
set smarttab
set tabstop=4 " define how many spaces are added for a tab
set shiftwidth=4 " number of spaces used for autoindent (<<, >>)
set laststatus=2 " always shows statusline for every window
set incsearch " show search result as I type
set hlsearch " highlight the search results
set ignorecase smartcase " make searches case-sensitive only if they contain upper-case characters
set cursorline " highlight current line
set cmdheight=1 " number of screen lines used for the command-line
set number " show line numbers
set relativenumber
set numberwidth=1 " minimal number of columns to used for the line number
set showtabline=2 " always displays tabs
set t_ti= t_te= " doesn't remove vim screen from the view when running external commands (:!ls)
set completefunc=syntaxcomplete#Complete " specifies a function to be used for Insert mode completion with CTRL-X CTRL-U.
set ruler " show line and column numbers in the status bar
set lazyredraw " using relativenumbers/cursorline makes vim pagination (j/k) extremely slow. This helps a little bit.

" entering normal mode timeout
set timeoutlen=1000 ttimeoutlen=0

set clipboard=unnamed
set autoread

" Theme
set background=dark
set t_Co=256
syntax enable
colorscheme monokai
hi SpellBad cterm=bold ctermbg=red ctermfg=white

" Mapping
map <Left> :echo "Arrow keys are not allowed"<cr>
map <Right> :echo "Arrow keys are not allowed"<cr>
map <Up> :echo "Arrow keys are not allowed"<cr>
map <Down> :echo "Arrow keys are not allowed"<cr>

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Use tab to jump between blocks, because it's easier
nnoremap <tab> %
vnoremap <tab> %

" Remove trailing whitespaces and blank lines
function! StripTrailingWhitespace()
if &ft !~ 'markdown'
  call Preserve('%s/\s\+$//e')
endif
endfun

autocmd BufWritePre * call StripTrailingWhitespace()
autocmd BufWritePre * call Preserve('%s/\v($\n\s*)+%$//e')

" Make sure vim returns to the same line when you reopen a file
augroup line_return
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" Shutup backup files
set undodir=/tmp/
set backupdir=/tmp/
set directory=/tmp/
set backup
set noswapfile

" highlight word under cursor w/o moving the cursor position
nnoremap <silent> ! :set hls \| let @/=expand('<cword>')<CR>

" Keep the cursor centered while scrolling
set scrolloff=999

" Custom Commands
command FixEnv %s/[ :\t]\+/=/g | noh
