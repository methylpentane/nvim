if &compatible
    set nocompatible
endif

augroup MyAutoCmd
    autocmd!
    " no user autocmd yet
augroup END

" True Color
if has('nvim')
    " For Neovim 0.1.3 and 0.1.4
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1

    " Or if you have Neovim >= 0.1.5
    if (has("termguicolors"))
        set termguicolors
    endif
elseif has('patch-7.4.1778')
    set guicolors
endif

let s:dein_cache_path = expand('~/.cache/nvim/dein')
let s:dein_dir = s:dein_cache_path
      \ .'/repos/github.com/Shougo/dein.vim'

if &runtimepath !~ '/dein.vim'
    if !isdirectory(s:dein_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
     endif
     execute 'set runtimepath+=' . fnamemodify(s:dein_dir, ':p')
endif

if dein#load_state(s:dein_cache_path)
    call dein#begin(s:dein_cache_path)

    call dein#load_toml('~/.config/nvim/dein.toml', {'lazy' : 0})
    call dein#load_toml('~/.config/nvim/deinlazy.toml', {'lazy' : 1})

    call dein#end()
    call dein#save_state()
endif

" plugin install
if dein#check_install()
    call dein#install()
endif

" plugin remove
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
    call map(s:removed_plugins, "delete(v:val, 'rf')")
    " call dein#recache_runtimepath() (call by myself)
endif

filetype plugin indent on
syntax enable

runtime! ./options.rc.vim
runtime! ./keymap.rc.vim
runtime! ./functions.rc.vim

