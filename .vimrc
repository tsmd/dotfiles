set ambiwidth=double
syntax enable

set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set smarttab

set backspace=indent,eol,start

set hlsearch
set incsearch
set ignorecase
set smartcase

nnoremap Y y$
inoremap jk <ESC>

if has("clipboard")
	" CTRL-X and SHIFT-Del are Cut
	vnoremap <C-X> "+x
	vnoremap <S-Del> "+x

	" CTRL-C and CTRL-Insert are Copy
	vnoremap <C-C> "+y
	vnoremap <C-Insert> "+y

	" CTRL-V and SHIFT-Insert are Paste
	map <C-V> "+gP
	map <S-Insert> "+gP

	cmap <C-V> <C-R>+
	cmap <S-Insert> <C-R>+
endif

if 1
	exe 'inoremap <script> <C-V> <C-G>u' . paste#paste_cmd['i']
	exe 'vnoremap <script> <C-V> ' . paste#paste_cmd['v']
endif
