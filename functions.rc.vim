" ctags but I use anyjump.vim now
set tags=.tags;~
function! s:execute_ctags() abort
    let tag_name = '.tags'
    let tags_path = findfile(tag_name, '.;')
    if tags_path ==# ''
        return
    endif
    let tags_dirpath = fnamemodify(tags_path, ':p:h')
    execute 'silent !cd' tags_dirpath '&& ctags -R -f' tag_name '2> /dev/null &'
endfunction
" augroup ctags
"     autocmd!
"     autocmd BufWritePost * call s:execute_ctags()
" augroup END

" transparent background
function! s:transparent() abort
    highlight Normal guibg=NONE
    highlight NonText guibg=NONE
    highlight EndOfBuffer guibg=NONE
    highlight CursorLine guibg=NONE
    highlight SpecialKey guibg=NONE
endfunction
command! Transparent call s:transparent()

" Transparent window
augroup transparent_windows
    autocmd!
    autocmd Filetype deoplete set winblend=30
augroup END

" wrap at text file
augroup wrapping
    autocmd!
    autocmd Filetype text set wrap
    autocmd Filetype markdown set wrap
augroup END

" rsync
function! s:execute_rsync(...) abort
    let rsync_name = '.rsync_autocmd'
    let rsync_path = findfile(rsync_name, '.;')
    if rsync_path ==# ''
        return
    endif
    let lines = readfile(rsync_path)
    let line = get(lines, 0)
    if a:0 > 0
        if a:1 == 'Dry'
            execute '!rsync -ahvn' line
        else
            echo '有効でない引数'
        end
    else
        execute '!rsync -ahvz' line
    end
endfunction
command! Rsync call s:execute_rsync()
command! DryRsync call s:execute_rsync('Dry')

" session load&save
function! s:save_session() abort
    let session_path = $HOME.'/vim-sessions/'.substitute(getcwd(), '[/|.]', '_', 'g')
    execute 'mksession!' session_path
endfunction
function! s:load_session() abort
    let session_path = $HOME.'/vim-sessions/'.substitute(getcwd(), '[/|.]', '_', 'g')
    execute 'source' session_path
endfunction
command! SaveSession call s:save_session()
command! LoadSession call s:load_session()

" save fold when :w
augroup folding
    autocmd!
    autocmd BufWritePost * if expand('%') != '' && &buftype !~ 'nofile' | mkview | endif
    autocmd BufRead * if expand('%') != '' && &buftype !~ 'nofile' | silent! loadview | endif
augroup END
set viewoptions-=options

" airline custom parts
let s:subscripts = ['₀','₁','₂','₃','₄','₅','₆','₇','₈','₉']
function! Percentage() abort
    let cursor_line_loc = line('.')
    let buf_line_num = line('$')
    let percent = ( cursor_line_loc*100 ) / buf_line_num
    let percent_point= ( ( cursor_line_loc*100 ) % buf_line_num )*10 / buf_line_num
    return printf("%d.%s%%", percent, get(s:subscripts, percent_point, ''))
endfunction

" window maximization
function! MaximizeWindow()
    :resize
    :vertical resize
endfunction

" fcitx
if executable('fcitx5')
    augroup fcitx
        autocmd!
        autocmd InsertLeave * :call system('fcitx5-remote -c')
    augroup END
endif

" colorscheme
function! Tender()
    :colorscheme tender
    :AirlineTheme tender
    :set background=dark
endfunction

function! Papercolor()
    :colorscheme PaperColor
    :AirlineTheme papercolor
    :set background=light
endfunction
