" Custom configuration for VIM.
" Basis configuration are from: https://github.com/amix/vimrc

source $HOME/.vim_runtime/my_configs_coc.vim

set number 
set mouse=a

" Set a font if a GUI is running.
if has("gui_running")
    set guifont=Lucida\ Console:h11
endif

let cwidth=120

" Set up a red line at column=cwidth.
if exists('+colorcolumn')
  let &colorcolumn=cwidth
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>120v.\+', -1)
endif

" Set up indentation.
set cinoptions+=g2,h2,N-s

" Find the CTags file. Currently not in use.
" set tags=ctags_buffer;

" Jump between buffers using <leader> + shortcut
map <leader>bn :bn<cr>
map <leader>bp :bp<cr>
map <leader>bb :e#<cr>

let wwidth=winwidth('%')
let ntwidth=wwidth-cwidth-6
let g:NERDTreeWinSize=ntwidth
let g:NERDTreeShowHidden=1
let g:NERDTreeWinPos = "right"

" Look for a .vimlocal file in the same folder where VIM is started. Nice for project-specific settings.
silent! so .vimlocal
