" Install plugin manager
" curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'morhetz/gruvbox'
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
" Needs: python3 -m pip install --user --upgrade pynvim
Plug 'ncm2/ncm2' " autocomplete
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-pyclang' " c++, work-ish
Plug 'ncm2/ncm2-jedi' " python
Plug 'ncm2/ncm2-racer' " rust
Plug 'ncm2/ncm2-bufword' " get text in buffer
Plug 'ncm2/ncm2-path' " path relative to openning buffer
Plug 'ncm2/ncm2-github' " github integration
Plug 'ncm2/ncm2-tmux' " tmux integration and buffer
Plug 'fgrsnau/ncm2-aspell' " aspell tips
" linter
Plug 'dense-analysis/ale'
call plug#end()

" open nerdtree automatically
" autocmd vimenter * NERDTree
" map n to show file in tree
nmap ,n :NERDTreeFind<CR>
" show in tree after the file is open
" nmap ,n :NERDTreeFind<CR>
" autocmd FileType c,cpp * NERDTreeFind
autocmd BufReadPost,FileReadPost * :NERDTreeFind

" set grubox
colorscheme gruvbox
set background=dark

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone
" Use <TAB> to select the popup menu
inoremap <expr> <Tab> pumvisible() ? "\<c-y>" : "\<Tab>"

" Set libclang file for pyclang
" /usr/local/Cellar/llvm/9.0.0_1/lib/libclang.dylib
let g:ncm2_pyclang#library_path = '/usr/lib/libclang.so'
let g:ncm2_pyclang#args_file_path = ['/home/patrick/.config/nvim/.clang_complete', '.clang_complete']
let g:ncm2_pyclang#gcc_path = '/usr/bin/gcc'
" a list of relative paths for compile_commands.json
let g:ncm2_pyclang#database_path = [
            \ 'compile_commands.json',
            \ 'build/compile_commands.json',
            \ 'b/compile_commands.json',
            \ 'b_cmake/compile_commands.json',
            \ ]

" Let files to be unsaved while loading other files
set hidden

" Show line number in files
set number

" Enable relative numbers
" set relativenumber

" Enable mouse control
set mouse=a

" Show preview split window
set inccommand=split

" Open file search
nnoremap <c-p> :Files<cr>

" Search in all files under the directory
" Needs: community/the_silver_searcher
nnoremap <c-f> :Ag<space>

" Exit
nnoremap <c-d> :qa<cr>

" Save
nnoremap <c-s> :w<cr>

" esc + reload to reload configuraton file
nnoremap reload :source ~/.config/nvim/init.vim<cr>

" Go to declaration, not working yet
autocmd FileType c,cpp nnoremap <buffer> gd :<c-u>call ncm2_pyclang#goto_declaration()<cr>

" Replace all
" %(all lines)s(substitue)/old/new/g(all places in the same line)

" Split vertical and horizontal
" :vsplit
" :hsplit

" Cut
imap <C-K> ,<Esc>dd:startinsert<CR>

" Paste
imap <C-u> <Esc>p:startinsert<CR>

