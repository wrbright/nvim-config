""""""""""""""""""""""""""
"        Vim-Plug        "
""""""""""""""""""""""""""
call plug#begin()
 
    """""
    """ Text, Text Additions, and Text Formatting
    """"
    " Plug 'neoclide/coc.nvim', { 'branch': 'release'}
    Plug 'honza/vim-snippets'
    Plug 'windwp/nvim-autopairs'
    Plug 'machakann/vim-sandwich'
    Plug 'numToStr/Comment.nvim'
    Plug 'vim-scripts/ReplaceWithRegister'
    " Treesitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-refactor'
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    Plug 'p00f/nvim-ts-rainbow'
 
    """""
    """ Additional Panes
    """"
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'preservim/tagbar'
    " Telescope
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope-dap.nvim'
  
    """""
    """ Alternate Functionality
    """"
    Plug 'tpope/vim-fugitive'
    Plug 'lambdalisue/suda.vim'
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
    " Dap
    Plug 'mfussenegger/nvim-dap'
    Plug 'rcarriga/nvim-dap-ui'
    Plug 'theHamsta/nvim-dap-virtual-text'
    " LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'mfussenegger/nvim-jdtls' "java
    " CMP
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'L3MON4D3/LuaSnip'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'onsails/lspkind.nvim'

    """""
    """ aesthetics
    """"
    Plug 'sainnhe/gruvbox-material'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'SmiteshP/nvim-navic'
    " Plug 'onsails/lspkind.nvim'

call plug#end()

""""""""""""""""""""""""""
" Plugin Top Line Config "
""""""""""""""""""""""""""

set completeopt=menu,menuone,noselect

" Lua Config Require (likely ~/.config/nvim/lua/init.lua)
lua require('init')


" lua << EOF
" -- Lua HEREDOC
" EOF

"""""""""""""""""""""""""""
"        Functions        "
"""""""""""""""""""""""""""
function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"""""""""""""""""""""
"        Cmd        "
"""""""""""""""""""""
command W w
command Q q

""""""""""""""""""""""""
"   Plugin Remapping   "
""""""""""""""""""""""""
let g:mapleader = "\<Space>"

nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr><Esc>
nnoremap <leader>gb :lua require('telescope.builtin').live_grep({prompt_title = 'find string in open buffers', grep_open_files=true})<cr>
nnoremap <leader>gf <cmd>Telescope live_grep<cr>
nnoremap <leader>m <cmd>Telescope marks<cr>
nnoremap <leader>r <cmd>Telescope registers<cr>
nnoremap <C-z> :Telescope live_grep<CR>

nnoremap <leader>h :BufferLineCyclePrev<cr>
nnoremap <leader>l :BufferLineCycleNex<cr>
nnoremap <leader>t :BufferLinePick<cr>
nnoremap <leader>x :BufferLinePickClose<cr>

nnoremap <A-g> :Gitsigns preview_hunk<CR>
nnoremap <A-g>n :Gitsigns next_hunk<CR>
nnoremap <A-g>N :Gitsigns prev_hunk<CR>

nnoremap <leader>b :lua require'dap'.toggle_breakpoint()<cr>
nnoremap <leader>s :lua require'dap'.step_into()<cr>
nnoremap <leader>o :lua require'dap'.step_over()<cr>
nnoremap <leader>f :lua require'dap'.step_out()<cr>
nnoremap <leader>d<Leader> :lua require'dap'.continue()<cr>
nnoremap <leader>c :lua require'dapui'.toggle()<cr>

nnoremap <C-t> :NvimTreeToggle<CR>
nnoremap <C-c> :NvimTreeClose<CR>
nmap <C-_> gcc
vmap <C-_> gc


"""""""""""""""""""""""""
"   General Remapping   "
"""""""""""""""""""""""""

" Copy current line down to next line
nnoremap <C-j> :copy .<CR>

" copy lines where visual selection is active to the line below the
" current visual selection adding whitespace to pad the selection
vnoremap <C-j> V"cy`>o<Esc>"cp'[kv']<Esc>o<Esc>gvj

" copy lines where visual selection is active to the line below the
" current visual selection
vnoremap <Leader>j V"cy`>"cp'[v']$

nnoremap <A-r> :%s///g<Left><Left>
nnoremap <A-R> :%s///cg<Left><Left><Left>

" Search for visual selection
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

nnoremap <A-j> :m +1<CR>==
nnoremap <A-k> :m -2<CR>==
vnoremap <A-k> :m'<-2<CR>gv=gv
"`>my`<mzgv`yo`z
vnoremap <A-j> :m'>+1<CR>gv=gv
"`<my`>mzgv`.yo`z

nnoremap <A-h> <<<Left><Left><Left><Left>
vnoremap <A-h> <gv
nnoremap <A-l> >><Right><Right><Right><Right>
vnoremap <A-l> >gv

nnoremap <A-J> mji<CR><Esc>`j:s/\s\+$//e<CR>`j

nnoremap <A-p> "+p
nnoremap <A-P> "0p

nnoremap <A-y> "+yy
vnoremap <A-y> "+y

nnoremap <Leader><Leader><Leader> mj:s/\s\+$//e<CR>`j
nnoremap <A-;> mjA;<Esc>`j

inoremap <A-;> <Esc>mjA;<Esc>`ji

inoremap <A-j> <Down>
inoremap <A-k> <Up>
inoremap <A-h> <Left>
inoremap <A-l> <right>

" Command Line Remappings

cnoremap <A-k> <Up>
cnoremap <A-j> <Down>
cnoremap <A-h> <Left>
cnoremap <A-l> <Right>

cnoremap <A-b> <C-Left>
cnoremap <A-w> <C-Right>

""""""""""""""""""""""""""
"  Colour Configuration  "
""""""""""""""""""""""""""

let g:gruvbox_material_transparent_background=0
autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
colorscheme gruvbox-material
highlight clear EndOfBuffer

"""""""""""""""""""""""""""
"  General Configuration  "
"""""""""""""""""""""""""""

" let g:coc_global_extensions = ['coc-solargraph']

" let g:tagbar_visibility_symbols = {
            \ 'public'    : '🌎',
            \ 'protected' : '🛡',
            \ 'private'   : '🔒'
            \ }

" let g:airline_section_z+=%PS%ln%v

" function! GetAirlineSectionContent()
"   return 'hello world'
" endfunction

" call airline#parts#define_function('func','GetAirlineSectionContent')
" let g:airline_section_y += airline#section#create_right(['','func'])

" let g:airline#extensions#default#layout = [
"             \ [ 'a', 'b', 'c' ],
"             \ [ 'x', 'z', 'error', 'warning', 'y' ],
"             \]

" Bufferline Asked for this
set termguicolors
set nocompatible

set mouse=a  " enable mouse
set number relativenumber
set history=1000 " sets amount of commands, searches, and inserts to store in history
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

"Set Regex Highlighting
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

let g:mkdp_command_for_global = 1

"Remapping tab to autocomplete for COC auto complete
" inoremap <silent><expr> <TAB>
"             \ coc#pum#visible() ? coc#pum#next(1):
"             \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"             \ CheckBackspace() ? "\<Tab>" :
"             \ coc#refresh()
" inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
"             \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" nnoremap <silent> K :call ShowDocumentation()<CR>

" function! ShowDocumentation()
"   if CocAction('hasProvider', 'hover')
"     call CocActionAsync('doHover')
"   else
"     call feedkeys('K', 'in')
"   endif
" endfunction

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
" packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
