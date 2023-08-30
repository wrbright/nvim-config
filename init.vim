" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" "
"                          Vim Based Configurations.                         "  
"                                                                            "
"  Goal: This file should work when using vim (not neovim) without plugins.  "
"  Non-Goal: No errors on startup or during usage when used with vim.        "
"  ToDo: Re-create Gruvbox ColorScheme for Vim Manually                      "
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" "

" """""""""""""""""""""""" "
"  Plugin Top Line Config  "
" """""""""""""""""""""""" "

if has('nvim')
  " Lua Config Require (likely ~/.config/nvim/lua/init.lua)
  lua require'init'
endif

" """"""""""""""""" "
"     Functions     "
" """"""""""""""""" "

" function! CheckBackspace() abort
"     let col = col('.') - 1
"     return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" """""""""""""""""""" "
"  CMD Mode Remapping  "
" """""""""""""""""""" "

" enable spellcheck
command Spell set spell spelllang=en_us

" rebind j to gj and other g altered keys for the session
command GJ nnoremap j gj|nnoremap k gk|nnoremap 0 g0|nnoremap $ g$

" Save Session
command Restoreable mks ~/nvim_session_storage/neovim.session

" Soure init.vim and init.lua
command Source so ~/.config/nvim/init.vim |luafile ~/.config/nvim/lua/init.lua

" Add [pwd] to runtimepath
command AddRun :let &runtimepath.=','.escape(expand('%:p:h'), '\,')

" oops
command W w
command Wq wq
command WQ wq
command Q q
command Qa qa
command QA qa

" """"""""""""""""""" "
"   Plugin Remapping  "
" """"""""""""""""""" "
let g:mapleader = "\<Space>"

"
" (Mostly) moved To Lua Init (Likely ./lua/init.lua)
"

" cannot map / in lua (or, I am an fool)
nmap <C-/> gcc
vmap <C-/> gcgv

nmap <C-_> gcc
vmap <C-_> gcgv

" """"""""""""""""""" "
"  General Remapping  "
" """"""""""""""""""" "
" Copy current line down to next line
nnoremap <C-j> :copy .<CR>

" copy lines where visual selection is active to the line below the
" current visual selection adding white space to pad the selection
vnoremap g<C-j> V"cy`>o<Esc>"cpkv']<Esc>o<Esc>gvj

" copy lines where visual selection is active to the line below the
" current visual selection
vnoremap <C-j> V"cy`>"cpv']$

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
nmap <A-h> <<2h
nmap <A-l> >>2l
vnoremap <A-h> <gv
vnoremap <A-l> >gv

" Move content to right of cursor to new line, remove whitespace (need to find new binding)
" nnoremap <C-J> mji<CR><Esc>`j:s/\s\+$//e<CR>`j

" Paste from the system clipboard
nnoremap <A-p> "+p
nnoremap <A-P> "+P
nnoremap <Leader>p "0p

" Alternatively, copy into system register
nnoremap <A-y> "+y
nnoremap <A-y><A-y> "+yy
vnoremap <A-y> "+y

" Remove trailing space
nnoremap <Leader><Leader><Leader> mj:s/\s\+$//e<CR>`j

" Add semicolon to the end of the current line
nnoremap <A-;> mjA;<Esc>`j
" Add semicolon to the end of the current line
inoremap <A-;> <Esc>mjA;<Esc>`ja

" add a trailing comma to the end of the current line
nnoremap <A-,> mjA,<Esc>`j
" add a trailing comma to the end of the current line
inoremap <A-,> <Esc>mjA,<Esc>`ja

" add a trailing comma to the end of the current line
nnoremap <A-.> mjA.<Esc>`j
" add a trailing comma to the end of the current line
inoremap <A-.> <Esc>mjA.<Esc>`ja

nnoremap <A-n> :noh<cr>

" Move to end of line
inoremap <A-a> <C-o>A

" Rebind f1 off of help (now rebound to :Tagbar) 
" inoremap <F1> <Esc>

" Easier window navigation
nnoremap <A-H> <C-W>h
nnoremap <A-J> <C-W>j
nnoremap <A-K> <C-W>k
nnoremap <A-L> <C-W>l

nnoremap <A-v> :horizontal split<cr>
nnoremap <A-V> :vertical split<cr>

" nnoremap <A-w> <C-w>

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

" """"""""""""""""""""""""" "
"  Command Mode Remappings  "
""""""""""""""""""""""""""" "

" Vim movement in command mode
cnoremap <A-k> <Up>
cnoremap <A-j> <Down>
cnoremap <A-h> <Left>
cnoremap <A-l> <Right>

" Back and forward by WORD(ish)
cnoremap <A-b> <C-Left>
cnoremap <A-w> <C-Right>

" """""""""""""""""""""""""""""""" "
"  Program Specific Configuration  "
" """""""""""""""""""""""""""""""" "
if has('nvim')
  set signcolumn=yes 
  set history=10000 " sets amount of commands, searches, and inserts to store in history
else
  set wildmenu " Enable auto completion menu after pressing TAB. 
  set mouse=a  " enable mouse
  set history=500 " sets amount of commands, searches, and inserts to store in history
  set autoindent " Automatically indent
  set belloff " Should be default
  set nocompatible " Don't pretend to be VI (Default in Neovim)
  filetype on " detect current file type
  set nocursorline
endif

" """"""""""""""""""""""""" "
"   General Configuration   "
" """"""""""""""""""""""""" "
let g:c_syntax_for_h = 1
set shell=/bin/bash

" enable 24bit color
set termguicolors

" Add offset number in column offset on the left
set number relativenumber

" Ensure number column is at minimum, two characters wide
set numberwidth=2

" disable text wrapping
set nowrap 

" non-selected lines above/below cursor when scrolling
set scrolloff=5 

" When saving a file with a newer swap, quitting, or other issues with any
" exit of the buffer arise, give list of choices on intended behavior 
set confirm

" Enable persistant undos and set the location of the persistant undo file
set undofile undodir=~/.vim/undo-dir

" Why isn't this default?
" set fileencoding=utf-8

" Tabs are shown 2 spaces wide
set tabstop=2
set softtabstop=2

" when indenting with '>', use 2 spaces width
set shiftwidth=2

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" While searching though a file incrementally highlight matching characters as you type. (neovim default)
set incsearch

" Use highlighting when doing a search. (neovim default)
set hlsearch

" Show partial command you type in the last line of the screen.
set showcmd

" Show matching words during a search.
set showmatch

" Time to wait between edits before writing to the swap file
set updatetime=300

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" Wildmenu will ignore files with these extensions when attempting to open a
" file for editing
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" disable auto text wrapping when in insert mode
set textwidth=0

" """""""""""""""""""" "
" Plugin Configuration "
" """""""""""""""""""" "

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

if has('nvim')
  " Allow for Markdown command to be run from anywhere (useless without Markdown Plugin)
  let g:mkdp_command_for_global = 1

  " Do not auto close the markdown preview browser tab on switching buffer
  let g:mkdp_auto_close = 0
endif

" """"""""""""""""""""""""""""""""""""" "
"  Vim Specific Statusline and Tabline  "
" """"""""""""""""""""""""""""""""""""" "

if !has('nvim')

  " Tabline 
  set showtabline=2
  set tabline="%1T"

  " Statusline. Mildly altered from:
  " https://github.com/Greduan/dotfiles/blob/76e16dd8a04501db29989824af512c453550591d/vim/after/plugin/statusline.vim

  let g:currentmode={
		\ 'n'  : 'N ',
		\ 'no' : 'N·Operator Pending ',
		\ 'v'  : 'V ',
		\ 'V'  : 'V·Line ',
		\ 'x22' : 'V·Block ',
		\ '^V' : 'V·Block ',
		\ 's'  : 'Select ',
		\ 'S'  : 'S·Line ',
		\ 'x19' : 'S·Block ',
		\ 'i'  : 'I ',
		\ 'R'  : 'R ',
		\ 'Rv' : 'V·Replace ',
		\ 'c'  : 'Command ',
		\ 'cv' : 'Vim Ex ',
		\ 'ce' : 'Ex ',
		\ 'r'  : 'Prompt ',
		\ 'rm' : 'More ',
		\ 'r?' : 'Confirm ',
		\ '!'  : 'Shell ',
		\ 't'  : 'Terminal '
		\}

	" Automatically change the statusline color depending on mode
	function! ChangeStatuslineColor()
		if (mode() =~# '\v(n|no)')
			execute 'hi! StatusLine ctermfg=008 guifg=#000000 gui=None cterm=None'
		elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
			execute 'hi! StatusLine ctermfg=005 guifg=#007D00 gui=None cterm=None'
		elseif (mode() ==# 'i')
			execute 'hi! StatusLine ctermfg=004 guifg=#3080AC gui=None cterm=None'
		else
			execute 'hi! StatusLine ctermfg=006 guifg=orange gui=None cterm=None'
		endif

		return ''
	endfunction

	" Find out the size of the file loaded by the buffer and output it.
	function! FileSize()
		let bytes = getfsize(expand('%:p'))

		if (bytes >= 1024)
			let kbytes = bytes / 1024
		endif

		if (exists('kbytes') && kbytes >= 1000)
			let mbytes = kbytes / 1000
		endif

		if bytes <= 0
			return '0'
		endif

		if (exists('mbytes'))
			return mbytes . 'MB '
		elseif (exists('kbytes'))
			return kbytes . 'KB '
		else
			return bytes . 'B '
		endif

	endfunction

	function! ReadOnly()

		if &readonly || !&modifiable
			return ''
		else
			return ''
		endif

	endfunction

	" function! GitInfo()
	" 	let git = fugitive#head()
	" 	if git != ''
	" 		return ' '.fugitive#head()
	" 	else
	" 		return ''
	" 	endfunction

	" http://stackoverflow.com/a/10416234/213124
	set laststatus=2
	set statusline=
	set statusline+=%{ChangeStatuslineColor()}               " Changing the statusline color
	set statusline+=%0*\ %{toupper(g:currentmode[mode()])}   " Current mode
	set statusline+=%8*\ [%n]                                " buffernr
	set statusline+=%8*\ %<%F\ %{ReadOnly()}\ %m\ %w\        " File+path
	set statusline+=%*
	set statusline+=%9*\ %=                                  " Space
	set statusline+=%8*\ %y\                                 " FileType
	set statusline+=%7*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\ " Encoding & Fileformat
	set statusline+=%8*\ %-3(%{FileSize()}%)                 " File size
	set statusline+=%0*\ %3p%%\ \ %l:\ %3c\                 " Rownumber/total (%)
endif

" """"""""""""""""""""""" "
"  Colour Configuration  "
" """"""""""""""""""""""" "

if has('nvim') 
	let g:gruvbox_material_transparent_background=1
	colorscheme gruvbox-material
	autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
	highlight clear EndOfBuffer
else
	colorscheme sorbet
endif

highlight CursorLineNr guifg=#BEB6B0

" Comment Left on purpose. COC can be re-enabled when inside an unfamiliar
" languages codebase for completion and LSP support

" " """"""""""""""""""" "
" "  COC Configuration  "
" " """"""""""""""""""" "

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

" " """"""""""""""""""""""" "
" "  COC Configuration end  "
" " """"""""""""""""""""""" "

" " """"""""""""""""""""""" "
" "  COC Configuration end  "
" " """"""""""""""""""""""" "


" Create helptags, suppress command output
silent! helptags ALL
