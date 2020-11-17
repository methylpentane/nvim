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
augroup ctags
    autocmd!
    autocmd BufWritePost * call s:execute_ctags()
augroup END

" transparent background
function! Transparent() abort
    highlight Normal guibg=NONE
    highlight NonText guibg=NONE
    highlight EndOfBuffer guibg=NONE
    highlight CursorLine guibg=NONE
    highlight SpecialKey guibg=NONE
endfunction
" augroup transparent
"     autocmd!
"     autocmd VimEnter * call Transparent()
" augroup END

" airline custom parts
let s:subscripts = ['₀','₁','₂','₃','₄','₅','₆','₇','₈','₉']
function! Percentage() abort
    let cursor_line_loc = line('.')
    let buf_line_num = line('$')
    let percent = ( cursor_line_loc*100 ) / buf_line_num
    let percent_point= ( ( cursor_line_loc*100 ) % buf_line_num )*10 / buf_line_num
    return printf("%d.%s%%", percent, get(s:subscripts, percent_point, ''))
endfunction
