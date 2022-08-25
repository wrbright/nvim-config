call plug#begin()
  Plug 'ryanoasis/vim-devicons'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'preservim/nerdtree'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive' 
  Plug 'tpope/vim-surround'
  Plug 'dense-analysis/ale'
  Plug 'vim-airline/vim-airline'
  Plug 'junegunn/fzf.vim'
  Plug 'akinsho/bufferline.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'romgrk/barbar.nvim'
  Plug 'gelguy/wilder.nvim'
  Plug 'sainnhe/gruvbox-material'
  Plug 'preservim/tagbar'
call plug#end()


lua << EOF


vim.cmd [[highlight IndentBlanklineIndent1 guifg=#aaaaaa gui=nocombine]]



require("indent_blankline").setup {
    char_highlight_list = {
    "IndentBlanklineIndent1",
   }
}
EOF


noremap <silent> <C-n> :lua require'tree'.toggle()<CR>

"""""""""""""""""""""""""""
"        Functions        "
"""""""""""""""""""""""""""
function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction

""""""""""""""""""""""""""
"        Auto Cmd        "
""""""""""""""""""""""""""
autocmd BufWinEnter * NERDTreeMirror
" autocmd VimEnter * NERDTree
autocmd VimEnter * call StartUp()



""""""""""""""""""""""""""
"   Rebinding Shortcuts  "
""""""""""""""""""""""""""
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-j> :copy .<CR>

""""""""""""""""""""""""""
"  Colour Configuration  "
""""""""""""""""""""""""""
autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE

colorscheme gruvbox-material

" Key bindings can be changed, see below
call wilder#setup({'modes': [':', '/', '?']})

call wilder#set_option('renderer', wilder#popupmenu_renderer({
      \ 'highlighter': wilder#basic_highlighter(),
      \ }))



set nocompatible
filetype on

set mouse=a  " enable mouse
set number relativenumber  
set history=1000 " sets amount of command mode commands to store in history
set signcolumn=yes numberwidth=6
set linebreak
set ruler                                       " always show cursor
set wrap                                        " enable text wrapping
set scrolloff=5                                 " lines above/below cursor when scrolling
set confirm
set undofile undodir=~/.vim/undo-dir

"" indent guides enabled at startup
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

filetype plugin indent on
" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2


syntax on
set number

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Set tab width columns.
set tabstop=2
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

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

set updatetime=300

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

"Use space character instead of tabs

"Remapping tab to autocomplete for COC auto complete
set expandtab

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
