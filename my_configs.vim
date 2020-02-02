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
let g:NERDTreeWinPos="left"

let g:find_cmd=""
if has("win32")
    let g:find_cmd="C:\\Program\ Files\\Git\\usr\\bin\\find.exe"
else
    let g:find_cmd="find"
endif

function FindFileWithExtension(filename, endings)
    for i in a:endings
        let filename_full=a:filename . i
        let result=system("\"" . g:find_cmd . "\"" . ' -iname ' . filename_full)
        if result != ""
            execute "e " . result
            return
        endif
    endfor
endfunction

let header_extensions=[".h", ".hpp"]
let src_extensions=[".cpp", ".c", ".cxx"]

" Switch between header and source file using <leader> + shortcut
map <leader>gt :call FindFileWithExtension(expand("%:t:r"), header_extensions)<cr>
map <leader>gb :call FindFileWithExtension(expand("%:t:r"), src_extensions)<cr>

" Look for a .vimlocal file in the same folder where VIM is started. Nice for project-specific settings.
silent! so .vimlocal
