" Egendefinert konfigurasjon for VIM.
" VIM-konfigurasjon hentet fra: https://github.com/amix/vimrc

set number 
set mouse=a

let cwidth=100

" Setter en rød linje ved kolonne 100.
if exists('+colorcolumn')
  let &colorcolumn=cwidth
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>100v.\+', -1)
endif

" Setter opp indentation.
set cinoptions+=g2,h2,N-s

" Finner ctags-filen. Leter oppover i fil-hierarkiet.
set tags=ctags_buffer;

" Hopp mellom buffere med <leader> + shortcut
map <leader>bn :bn<cr>
map <leader>bp :bp<cr>
map <leader>bb :e#<cr>

let wwidth=winwidth('%')
let ntwidth=wwidth-cwidth-6
let g:NERDTreeWinSize=ntwidth
let g:NERDTreeShowHidden=1

" Leter etter en .vimlocal-fil der man starter VIM. Fint for prosjekt-spesifikk konfigurasjon.
silent! so .vimlocal
