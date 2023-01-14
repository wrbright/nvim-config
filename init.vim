""""""""""""""""""""""""""
"        Vim-Plug        "
""""""""""""""""""""""""""
call plug#begin("~/InstalledApplicationsDev/nvim")
    " Dependency needed for many plugins
    Plug 'nvim-lua/plenary.nvim'
    """""
    """ Text, Text Additions, and Text Formatting
    """"
    Plug 'honza/vim-snippets'
    Plug 'windwp/nvim-autopairs' 
    Plug 'machakann/vim-sandwich'
    Plug 'numToStr/Comment.nvim'
    Plug 'vim-scripts/ReplaceWithRegister'
    Plug 'L3MON4D3/LuaSnip'
    " Treesitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-refactor'
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    Plug 'nvim-treesitter/playground'
    Plug 'windwp/nvim-ts-autotag'
    " CMP
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'rcarriga/cmp-dap'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'Saecki/crates.nvim'
    Plug 'David-Kunz/cmp-npm'
    " Plug 'neoclide/coc.nvim', { 'branch': 'release'}
 
    """""
    """ Additional Panes
    """"
    Plug 'nvim-tree/nvim-tree.lua'
    Plug 'preservim/tagbar'
    " Dap
    Plug 'mfussenegger/nvim-dap'
    Plug 'theHamsta/nvim-dap-virtual-text'
    Plug 'rcarriga/nvim-dap-ui'
    " Telescope
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-project.nvim'
 
    """""
    """ Alternate Functionality
    """"
    Plug 'tpope/vim-fugitive'
    Plug 'lambdalisue/suda.vim'
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
    Plug 'kevinhwang91/nvim-hlslens'
    Plug 'wesQ3/vim-windowswap'
    Plug 'samodostal/image.nvim'
    Plug 'nvim-colortils/colortils.nvim'
    " LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'mxsdev/nvim-dap-vscode-js'
    Plug 'mfussenegger/nvim-jdtls' "java
 
    """""
    """ aesthetics
    """"
    Plug 'sainnhe/gruvbox-material'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'p00f/nvim-ts-rainbow'
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'SmiteshP/nvim-navic'
    Plug 'petertriho/nvim-scrollbar'
    Plug 'NvChad/nvim-colorizer.lua'
    Plug 'onsails/lspkind.nvim'
    Plug 'j-hui/fidget.nvim'
call plug#end()

""""""""""""""""""""""""""
" Plugin Top Line Config "
""""""""""""""""""""""""""
let g:mkdp_auto_close = 0

set termguicolors

" Lua Config Require (likely ~/.config/nvim/lua/init.lua)
lua require('init')


" lua << EOF
" -- Lua HEREDOC
" EOF
" Do not auto close the markdown preview browser tab on switching buffer

"""""""""""""""""""""""""""
"        Functions        "
"""""""""""""""""""""""""""
" function! CheckBackspace() abort
"     let col = col('.') - 1
"     return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

"""""""""""""""""""""
"        CMD        "
"""""""""""""""""""""

" enable spellcheck
command Spell set spell spelllang=en_us

" rebind j to gj and other g altered keys for the session
command GJ nnoremap j gj|nnoremap k gk|nnoremap 0 g0|nnoremap $ g$

" Save session in 
command Restoreable mks ~/nvim_session_storage/neovim.session

" Install New Plugins
command Install so ~/.config/nvim/init.vim |PlugInstall


" Oops, fat-fingered command
command W w
command Wq wq
command WQ wq
command Q q
command Qa qa
command QA qa

""""""""""""""""""""""""
"   Plugin Remapping   "
""""""""""""""""""""""""
let g:mapleader = "\<Space>"

"
" Moved To Lua Init (Likely ./lua/init.lua)
"

" cannot map / in lua (or, I am an idiot)
nmap <C-_> gcc
vmap <C-_> gcgv

"""""""""""""""""""""""""
"   General Remapping   "
"""""""""""""""""""""""""
" Copy current line down to next line
nnoremap <C-j> :copy .<CR>

" copy lines where visual selection is active to the line below the
" current visual selection adding white space to pad the selection
vnoremap g<C-j> V"cy`>o<Esc>"cp'[kv']<Esc>o<Esc>gvj

" copy lines where visual selection is active to the line below the
" current visual selection
vnoremap <C-j> V"cy`>"cp'[v']$

" replace previous search
nnoremap <A-r> :%s///g<Left><Left>
nnoremap <A-R> :%s///cg<Left><Left><Left>

" search, not case sensitive 
nnoremap <A-/> /\c<Left><Left>

" Search for visual selection
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" Move text selection
nnoremap <A-j> :m +1<CR>==
nnoremap <A-k> :m -2<CR>==
vnoremap <A-k> :m'<-2<CR>gv=gv
vnoremap <A-j> :m'>+1<CR>gv=gv

" Shift keys by shiftwidth and maintain cursor position on text
nnoremap <A-h> <<4h
vnoremap <A-h> <gv
nnoremap <A-l> >>4l
vnoremap <A-l> >gv

" Move content to right of cursor to new line, remove whitespace
" nnoremap <C-J> mji<CR><Esc>`j:s/\s\+$//e<CR>`j

" Paste from the system clipboard
nnoremap <A-p> "+p
nnoremap <A-P> "0p

" Alternatively copy into system register
nnoremap <A-y> "+y
vnoremap <A-y> "+y

" Remove trailing space
nnoremap <Leader><Leader><Leader> mj:s/\s\+$//e<CR>`j
nnoremap <A-;> mjA;<Esc>`j

nnoremap <A-n> :noh<cr>

" Add semicolon to the end of the current line
inoremap <A-;> <Esc>mjA;<Esc>`ja

" Rebind f1 off of help (now rebound to :Tagbar)
" inoremap <F1> <Esc>

" Easier window navigation
nnoremap <A-H> <C-W>h
nnoremap <A-J> <C-W>j
nnoremap <A-K> <C-W>k
nnoremap <A-L> <C-W>l

nnoremap <A-v> :horizontal split<cr>
nnoremap <A-V> :vertical split<cr>

" Re-size windows
nnoremap <A-<> :vertical resize +5<CR>
nnoremap <A->> :vertical resize -5<CR>
nnoremap <A-=> :horizontal resize +5<CR>
nnoremap <A--> :horizontal resize -5<CR>

" vim keybindings in insert mode
inoremap <A-j> <Down>
inoremap <A-k> <Up>
inoremap <A-h> <Left>
inoremap <A-l> <right>

inoremap <A-w> <C-right>
inoremap <A-b> <C-left>

nnoremap <A-w> <C-w>

"""""""""""""""""""""""""""
" Command Mode Remappings "
"""""""""""""""""""""""""""

" Vim movement in command mode
cnoremap <A-k> <Up>
cnoremap <A-j> <Down>
cnoremap <A-h> <Left>
cnoremap <A-l> <Right>

" Back and forward by WORD(ish)
cnoremap <A-b> <C-Left>
cnoremap <A-w> <C-Right>

""""""""""""""""""""""""""
"  Colour Configuration  "
""""""""""""""""""""""""""

let g:gruvbox_material_transparent_background=1
autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
colorscheme gruvbox-material
highlight clear EndOfBuffer


"""""""""""""""""""""""""""
"  General Configuration  "
"""""""""""""""""""""""""""

" Bufferline Asked for this
set nocompatible
" set termguicolors

" set mouse=a  " enable mouse, default on in neovim
set signcolumn=yes 
set number relativenumber
set numberwidth=2
set history=1000 " sets amount of commands, searches, and inserts to store in history
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

" Why isn't this default?
set fileencoding=utf-8

" detect current file type
filetype on

" On pressing tab, add [tabstop] spaces instead of a tab
set expandtab
" show tab with 4 spaces width
set tabstop=4
set softtabstop=4

" when indenting with '>', use 4 spaces width
set shiftwidth=4

" Set Regex Highlighting
" syntax on

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" While searching though a file incrementally highlight matching characters as you type.
set incsearch
"
" Use highlighting when doing a search.
set hlsearch

" Show partial command you type in the last line of the screen.
set showcmd

" Show matching words during a search.
set showmatch

" Enable auto completion menu after pressing TAB. (default in neovim)
set wildmenu

" Time to wait between edits before writing to the swap file
set updatetime=300

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" Wildmenu will ignore files with these extensions when attempting to open a
" file for editing
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" disable auto text wrapping
set textwidth=0

let g:mkdp_command_for_global = 1

" Disabled until needed
"
" """""""""""""""""""""
" " COC Configuration "
" """""""""""""""""""""

" let g:coc_global_extensions = ['coc-solargraph']

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

" """""""""""""""""""""
" " COC Configuration "
" """""""""""""""""""""
silent! helptags ALL
