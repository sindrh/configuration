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

let g:include_dir="."
let g:src_dir="."

function FindFileWithExtension(root_path, filename, endings)
    for i in a:endings
        let filename_full=a:filename . i
        let result=system("\"" . g:find_cmd . "\" \"" . a:root_path . "\"" . ' -iname ' . filename_full)
        if result != ""
            execute "e " . result
            return
        endif
    endfor
endfunction

" List of extensions. If you like to, you can redefine these in a project-specific .vimlocal file.
let g:header_extensions=[".h", ".hpp"]
let g:src_extensions=[".cpp", ".c", ".cxx"]

" Switch between header and source file using <leader> + shortcut
map <leader>gt :call FindFileWithExtension(g:include_dir, expand("%:t:r"), g:header_extensions)<cr>
map <leader>gb :call FindFileWithExtension(g:src_dir, expand("%:t:r"), g:src_extensions)<cr>

" Function to run a command in an open terminal (if only one is open).
" Use this to map custom commands in .vimlocal.
function RunCommandInTerminal(command)
    let terms = term_list()
    if len(terms) == 1
        let term = get(terms, 0)
        call term_sendkeys(term, a:command . "\<CR>")
    endif
endfunction

let g:terminal_rows=8
let g:terminal_rows_tmp = g:terminal_rows
" This is useful when splitting the window up for the terminal.
set splitbelow


" - Opens a new terminal if not open already and sets default size.
" - Hide open terminal (set size to 1) if the size is other than 1.
" - Set to previous size if terminal is hidden (size is 1).
" - It is recommended to use 'set splitbelow' before using this function. 
function ToggleTerminal()
    let terms = term_list()
    if len(terms) == 1
        let term = get(terms, 0)
        let sizenow = term_getsize(term)
        if get(sizenow, 0) == 1
            call term_setsize(term, g:terminal_rows_tmp, 0)
        else
            let g:terminal_rows_tmp=get(sizenow, 0)
            call term_setsize(term, 1, 0)
        endif
    else
        execute("terminal ++rows=" . g:terminal_rows)
        call feedkeys("\<C-W>\<C-p>")
    endif
endfunction

map <leader>tt :call ToggleTerminal()<CR>

" Make sure MRU is mapped (is otherwise in conflict with CoC-plugin).
map <leader>f :MRU<CR>

" Disable ALE. Seems like CoC provides similar functionality.
let g:ale_enabled=0

" Look for a .vimlocal file in the same folder where VIM is started. Nice for project-specific settings.
silent! so .vimlocal
