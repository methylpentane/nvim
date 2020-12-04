let mapleader = "\<Space>"

inoremap <C-k> <ESC>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" instant buffer list
nnoremap gb :ls<CR>:

" turn off search highlight
nnoremap <C-k><C-k> :nohlsearch<CR>

" tagjump
nnoremap <C-h> :exe("tjump ".expand('<cword>'))<CR>

" terminal normalmode
tnoremap <silent> <C-k> <C-\><C-n>

" tabline
nmap th <Plug>AirlineSelectPrevTab
nmap tl <Plug>AirlineSelectNextTab

" nerdtree
nmap <leader>t :NERDTreeToggleVCS<CR>
nmap <leader>T :NERDTreeToggle<CR>
