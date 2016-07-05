execute pathogen#infect()
set t_Co=256
set nocompatible
set backspace=2

" Toggle Line numbers
nmap <silent> <F10> :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>
let g:vim_json_syntax_conceal=0
syntax          enable
filetype                on
colorscheme     stereokai
set     background=dark
" Always show the status bar
set		laststatus=2
" Alias for sudo writing
cmap w!! w !sudo tee > /dev/null %
" Populate the powerline symbols
" let g:airline_powerline_fonts = 1
" if !exists('g:airline_symbols')
"	let g:airline_symbols = {}
"endif

" The Status Line
"set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
" Tab Spacing
set             ts=4
set     relativenumber
set number
set paste

" Tab shortcuts
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap tx  :tabclose<CR>

" Window shortcuts
nnoremap wh  :split<Space>
nnoremap wv  :vsplit<Space>
nnoremap wx  :hide<CR>
nnoremap wr  <C-W>=
nnoremap wf  <C-W>_
nnoremap ws  <C-W>R
if bufwinnr(1)
	map <Up>	<C-W>+
	map <Down>	<C-W>-
	map <Right>	<C-W>>
	map <Left>	<C-W><
endif

" CTRL + hjkl for window movement
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
" Don't show the lines of inactive

set wmh=0
" Deal with the long delay in showing mode changes
set ttimeoutlen=5
set noshowmode
command! R !./%

:hi TabLineFill ctermfg=236 ctermbg=cyan
:hi TabLine ctermfg=white ctermbg=236
:hi TabLineSel cterm=bold ctermfg=232 ctermbg=253

" Watch for changes to ~/.vimrc and reload
augroup myvimrc
	au!
	au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC |
if has('gui_running') | so $MYGVIMRC | endif
augroup END


" Increase History
set			history=1000

" The Status Line
"set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
"set statusline=[%n]\ %<%F\ \ \ [%M%R%H%W%Y][%{&ff}]\ \ %=\ line:%l/%L\ col:%c\ \ \ %p%%\ \ \ @%{strftime(\"%H:%M:%S\")}
" Tab Spacing
set		ts=4
set	relativenumber
au BufRead,BufNewFile	*.conf	set filetype=conf

" Syntastic Specifics
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:airline_section_error = 1
let g:syntastic_always_populate_loc_list=1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_theme="serene"
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
set fillchars+=stl:\ ,stlnc:\
" unicode symbols
let g:airline_left_sep = '>'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '<'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = 'Line:'
let g:airline_symbols.branch = 'Branch'
let g:airline_symbols.paste = 'Paste'
let g:airline_symbols.whitespace = ' '
let g:airline_symbols.readonly = 'RO'

" airline symbols
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ' '


if v:version > '730'
	"set statusline+=%#warningmsg#
	"set statusline+=%{SyntasticStatuslineFlag()}
	"set statusline+=%*

	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_loc_list_height=5
	let g:syntastic_auto_loc_list = 1
	let g:syntastic_check_on_open = 1
	let g:syntastic_check_on_wq = 0
	set runtimepath-=~/.vim/
endif
if v:version < '740'
	let g:syntastic_always_populate_loc_list = 0
	let g:syntastic_auto_loc_list = 0
	let g:syntastic_check_on_open = 0
	let g:syntastic_check_on_wq = 0
	set runtimepath-=~/.vimc5/
endif
