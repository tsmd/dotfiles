"vim:set fenc=utf-8 ts=4 sts=4 sw=4 noet:

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'


"========================================
" 全般
"----------------------------------------
let mapleader = ","
set display=lastline
set ambiwidth=double
set shellslash
set wildmenu
set mouse=ar
set clipboard-=unnamed
set autoread

" 手軽に .vimrc を編集する
nnoremap <Leader>ev :tabedit $MYVIMRC<CR>
nnoremap <Leader>egv :tabedit $MYGVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

" Paste モードをトグルする
nnoremap <Leader>p :<C-u>setlocal paste!<CR>

if has('mac')
	" Macではデフォルトの'iskeyword'がcp932に対応しきれていないので修正
	set iskeyword=@,48-57,_,128-167,224-235
endif


"========================================
" バックアップ
"----------------------------------------
set nobackup
set writebackup
set noundofile
set undodir=.


"========================================
" 検索
"----------------------------------------
set hlsearch
set ignorecase
set smartcase
set noincsearch
set wrapscan


"========================================
" テキスト編集
"----------------------------------------
set showmatch
set backspace=indent,eol,start
set formatoptions=tcqmMj
"set textwidth=78
set autoindent
set smartindent
"set cindent

" カーソルキーで行末／行頭の移動可能に設定
set whichwrap=b,s,[,],<,>

" C-a, C-x の増減対象
set nrformats=hex


"========================================
" 表示など
"----------------------------------------
syntax on
set ruler
set wrap
set sidescrolloff=5
set list
set listchars=tab:\|\ ,extends:<,trail:-
"set showbreak=\ ?\ 
set laststatus=2
set cmdheight=1
set showcmd
set title
set cursorline
set showtabline=2
set t_Co=256


"========================================
" ファイルタイプ別
"----------------------------------------
augroup filetype_javascript
	autocmd!
	autocmd FileType javascript abbrev <buffer> functino function
augroup END


"========================================
" 操作
"----------------------------------------
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>
nnoremap Y y$

" jk で挿入モードを脱出
inoremap jk <ESC>

" 逆改行（コマンドラインでは使えないみたい）
inoremap <S-CR> <Esc>O

"" 分割幅を変更する
"nnoremap = <C-W>5>
"nnoremap - <C-W>5<

"" 分割高さを変更する
"nnoremap + <C-W>2+
"nnoremap _ <C-W>2-

" 選択したテキストを検索する
vnoremap X y/<C-R>"<CR>


"========================================
" その他
"----------------------------------------

" タブの大きさを切り替え
"----------------------------------------
set noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

let s:tabringcount = 3
let s:tabringdic = [
\	{ "expandtab" : 0, "width" : 4 },
\	{ "expandtab" : 0, "width" : 2 },
\	{ "expandtab" : 1, "width" : 4 },
\	{ "expandtab" : 1, "width" : 2 },
\]

function! TabRing(direction)
	let s:tabringcount = (s:tabringcount + len(s:tabringdic) + a:direction) % len(s:tabringdic)
	let entry = s:tabringdic[s:tabringcount]
	execute "set " . (entry["expandtab"] ? "" : "no") . "expandtab"
	let &l:tabstop = entry["width"]
	let &l:softtabstop = entry["width"]
	let &l:shiftwidth = entry["width"]
	echo (entry["expandtab"] ? "SPACE" : "TAB") . " : " . entry["width"]
endfunction

nnoremap <Leader>t :call TabRing(1)<CR>
nnoremap <Leader>T :call TabRing(-1)<CR>


" number を切り替える
"----------------------------------------
set relativenumber

let s:numberring = 1
function! NumberRing(direction)
	let s:numberring = (s:numberring + 3 + a:direction) % 3
	if s:numberring == 0
		setlocal number
		setlocal norelativenumber
	elseif s:numberring == 1
		setlocal number
		setlocal relativenumber
	else
		setlocal nonumber
		setlocal norelativenumber
	endif
endfunc

nnoremap <Leader>n :call NumberRing(1)<cr>
nnoremap <Leader>N :call NumberRing(-1)<cr>


" 文字コードの変更を容易にする
"----------------------------------------
command! Eucjp edit ++enc=euc-jp
command! Utf8 edit ++enc=utf-8
command! Sjis edit ++enc=cp932
command! Feeucjp set fileencoding=euc-jp
command! Feutf8 set fileencoding=utf-8
command! Fesjis set fileencoding=cp932


" 改行コードの変更を容易にする
"----------------------------------------
command! Crlf set fileformat=dos
command! Lf set fileformat=unix


" HTML/XMLのタグを結合する
"----------------------------------------
"nnoremap <C-j> Jxl%JxhhV%j<k$


" レジスタ/マークの確認を楽にする
" FROM http://whileimautomaton.net/2008/08/vimworkshop3-kana-presentation
"----------------------------------------
"nnoremap <Space>m  :<C-u>marks
"nnoremap <Space>r  :<C-u>registers


" 最後に変更されたテキストを選択する
" FROM http://whileimautomaton.net/2008/08/vimworkshop3-kana-presentation
"----------------------------------------
nnoremap gc  `[v`]


" 簡単にカレントディレクトリを変更する
"----------------------------------------
command! -nargs=0 CD :execute 'lcd ' . expand("%:p:h")


"========================================
" プラグイン
"----------------------------------------
call vundle#end()


" テキスト編集
"----------------------------------------
Plugin 'godlygeek/tabular'
nnoremap <Leader>a= :Tabularize /=<CR>
vnoremap <Leader>a= :Tabularize /=<CR>
nnoremap <Leader>a: :Tabularize /:<CR>
vnoremap <Leader>a: :Tabularize /:<CR>

Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-operator-user'

Plugin 'kana/vim-operator-replace'
map R  <Plug>(operator-replace)

Plugin 'thinca/vim-textobj-comment'

Plugin 'tpope/vim-surround'


" プログラミング支援
"----------------------------------------

Plugin 'scrooloose/nerdcommenter'
nmap <C-l> <plug>NERDCommenterToggle j
vmap <C-l> <plug>NERDCommenterToggle


" HTML, CSS
"----------------------------------------
Plugin 'hail2u/vim-css3-syntax'

Plugin 'mattn/emmet-vim'
autocmd FileType css imap <tab> <plug>(EmmetExpandAbbr)
let g:user_emmet_settings = { 'lang' : 'ja' }
let g:use_emmet_complete_tag = 1


" JavaScript
"----------------------------------------


" バージョン管理
"----------------------------------------
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'


" ユーティリティ
"----------------------------------------
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP .'

"Plugin 'scrooloose/nerdtree'


" アピアランス
"----------------------------------------
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'altercation/vim-colors-solarized'
set background=light
colorscheme solarized

"call vundle#end()

filetype plugin indent on
