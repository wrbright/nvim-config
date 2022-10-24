"""""""""""""""""""""""""""
"        Vim-Plug         "
"""""""""""""""""""""""""""
call plug#begin()
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive' 
    Plug 'tpope/vim-surround'
    Plug 'dense-analysis/ale'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
    Plug 'gelguy/wilder.nvim'
    Plug 'preservim/tagbar'
    Plug 'jiangmiao/auto-pairs'
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'lambdalisue/suda.vim'
    Plug 'sainnhe/gruvbox-material'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'vim-airline/vim-airline'
    Plug 'honza/vim-snippets'
    Plug 'nvim-treesitter/nvim-treesitter' 
    Plug 'MunifTanjim/prettier.nvim'
    Plug 'mbbill/undotree'
    Plug 'wbthomason/packer.nvim' 
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'lewis6991/gitsigns.nvim'
call plug#end()


"""""""""""""""""""""""""""
"  Plugin Top Line Config "
"""""""""""""""""""""""""""

" Lua Config Require (likely ~/.config/nvim/lua)
lua require('init')

lua << EOF
-- Lua HEREDOC
EOF


"""""""""""""""""""""""""""
"        Functions        "
"""""""""""""""""""""""""""
function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" function! StartUp()
"   if 0 == argc()
"     NERDTree
"   end
" endfunction

""""""""""""""""""""""""""
"        Auto Cmd        "
""""""""""""""""""""""""""

""""""""""""""""""""""""""
"   Rebinding Shortcuts  "
""""""""""""""""""""""""""

nnoremap <C-t> :NvimTreeToggle<CR>
nnoremap <C-c> :NvimTreeClose<CR>
nmap <C-_> gcc 
vmap <C-_> gc 

nnoremap <C-j> :copy .<CR>

nnoremap <A-k> :m -2<CR>==
nnoremap <A-j> :m +1<CR>==

vnoremap <A-j> :m'>+1<CR>gv=gv
"`<my`>mzgv`yo`z
vnoremap <A-k> :m'<-2<CR>gv=gv 
"`>my`<mzgv`yo`z
nnoremap <A-g> :Gitsigns preview_hunk<CR>

nnoremap <A-h> <<
nnoremap <A-l> >> 
""""""""""""""""""""""""""
"  Colour Configuration  "
""""""""""""""""""""""""""

let g:gruvbox_material_transparent_background=0
autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE 
colorscheme gruvbox-material
highlight clear EndOfBuffer

""""""""""""""""""""""""""
" General Configuration  "
""""""""""""""""""""""""""

let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox_material'
call wilder#setup({'modes': [':', '/', '?']})

call wilder#set_option('renderer', wilder#popupmenu_renderer({
            \ 'highlighter': wilder#basic_highlighter(),
            \ }))

let g:coc_global_extensions = ['coc-solargraph']


" let g:airline_section_z+=%PS%ln%v

" function! GetAirlineSectionContent()
"   return 'hello world'
" endfunction

" call airline#parts#define_function('func','GetAirlineSectionContent')
" let g:airline_section_y += airline#section#create_right(['','func'])

" let g:airline#extensions#default#layout = [
    "    \ [ 'a', 'b', 'c' ],
    "    \ [ 'x', 'z', 'error', 'warning', 'y' ],
"\],
set nocompatible

set mouse=a  " enable mouse
set number relativenumber  
set history=1000 " sets amount of command mode commands to store in history
set signcolumn=yes numberwidth=6
set linebreak
set ruler " always show cursor
set wrap " enable text wrapping
set scrolloff=5 " lines above/below cursor when scrolling
set confirm 
set undofile undodir=~/.vim/undo-dir

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

filetype on

" On pressing tab, insert 4 spaces
set expandtab
" show existing tab with 4 spaces width
set tabstop=4
set softtabstop=4

" when indenting with '>', use 4 spaces width
set shiftwidth=4

syntax on

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Enable auto completion menu after pressing TAB.
set wildmenu

set updatetime=300

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

"Remapping tab to autocomplete for COC auto complete
inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#next(1):
            \ CheckBackspace() ? "\<Tab>" :
            \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
" packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
" silent! helptags ALL
