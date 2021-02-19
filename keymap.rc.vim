let mapleader = "\<Space>"

inoremap <C-k> <ESC>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
nnoremap <C-n> <C-d>

" instant buffer list
nnoremap gb :ls<CR>:

" turn off search highlight
nnoremap <C-k><C-k> :nohlsearch<CR>

" tagjump
nnoremap <C-h> :exe("tjump ".expand('<cword>'))<CR>

" terminal normalmode
tnoremap <silent> <C-k> <C-\><C-n>

" window
nnoremap <leader>w <C-w>

" tab, tabline
nmap th <Plug>AirlineSelectPrevTab
nmap tl <Plug>AirlineSelectNextTab
nnoremap tn :tabnew<CR>
nnoremap tc :tabclose<CR>

" nerdtree
nmap <leader>t :NERDTreeToggleVCS<CR>
nmap <leader>T :NERDTreeToggle<CR>
