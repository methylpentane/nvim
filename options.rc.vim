set encoding=utf-8
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
set nowrap
set cursorline
set number
set showmatch
set hlsearch
set ignorecase
set smartcase

set laststatus=2
" to be overrided by airline
set statusline=%<%F\ %m%r%h%w
set statusline+=%=%{'['.(&fenc!=''?&fenc:&enc).':'.&fileformat.']'}
set statusline+=\
set statusline+=L%l/%L
set statusline+=\
set statusline+=C%c[%V]%8P

set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set list listchars=tab:\>\-

set scrolloff=5
set sidescrolloff=6

set fileformats=unix,dos,mac
set fileencodings=utf-8,sjis
