let mapleader = "\<Space>"

inoremap <C-k> <ESC>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
nnoremap <C-n> <C-d>

" instant buffer list
nnoremap gb :ls<CR>:

" search
nnoremap <silent> <C-k><C-k> :nohlsearch<CR>
nnoremap <silent> n n
nnoremap <silent> N N

" tagjump
nnoremap <C-h> :exe("tjump ".expand('<cword>'))<CR>

" terminal normalmode
tnoremap <silent> <C-k> <C-\><C-n>

" window
nnoremap [window] <C-w>
nmap <leader>w [window]
nnoremap <silent> [window]m :call MaximizeWindow()<CR>

" tab, tabline
nmap th <Plug>AirlineSelectPrevTab
nmap tl <Plug>AirlineSelectNextTab
nnoremap <silent> tn :tabnew<CR>
nnoremap <silent> tc :tabclose<CR>

" nerdtree
nnoremap <silent> <leader>t :NERDTreeToggleVCS<CR>
nnoremap <silent> <leader>T :NERDTreeToggle<CR>
