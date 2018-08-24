" Egendefinert konfigurasjon for VIM.
" VIM-konfigurasjon hentet fra: https://github.com/amix/vimrc

set number 
set mouse=a

" Setter en rød linje ved kolonne 100.
if exists('+colorcolumn')
  set colorcolumn=100
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>100v.\+', -1)
endif

" Setter opp indentation.
set cinoptions+=g2,h2,N-s

" Finner ctags-filen. Leter oppover i fil-hierarkiet.
set tags=tags;

" Hopp mellom buffere med <leader>bp og <leader>bn
map <leader>bn :bn<cr>
map <leader>bp :bp<cr>

let g:NERDTreeWinSize=90

" Leter etter en .vimlocal-fil der man starter VIM. Fint for prosjekt-spesifikk konfigurasjon.
silent! so .vimlocal
