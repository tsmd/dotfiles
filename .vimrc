"vim:set fenc=utf-8 ts=4 sts=4 sw=4 noet:


"========================================
" 全般
"----------------------------------------
let mapleader = ","
set display=lastline
set ambiwidth=double
set shellslash
set wildmenu
set mouse=ar

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
set undofile
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
set list
set listchars=tab:\|\ ,extends:<,trail:-,nbsp:␣
set showbreak=\ ↳\ 
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

let s:tabringcount = 0
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
command! -nargs=? -complete=dir -bang CD  call s:ChangeCurrentDir('<args>', '<bang>')
function! s:ChangeCurrentDir(directory, bang)
	if a:directory == ''
		lcd %:p:h
	else
		execute 'lcd ' . a:directory
	endif
	if a:bang == ''
		pwd
	endif
endfunction

nnoremap <Leader>cd :<C-u>CD<CR>


"========================================
" プラグイン
"----------------------------------------
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
	set runtimepath+=~/vimfiles/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.bundle'))

let g:quickrun_config = {}


" テキスト編集
"----------------------------------------
NeoBundle 'godlygeek/tabular'
nnoremap <Leader>a= :Tabularize /=<CR>
vnoremap <Leader>a= :Tabularize /=<CR>
nnoremap <Leader>a: :Tabularize /:<CR>
vnoremap <Leader>a: :Tabularize /:<CR>

NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'kana/vim-textobj-line'
NeoBundle 'kana/vim-operator-user'

NeoBundle 'kana/vim-operator-replace'
map R  <Plug>(operator-replace)

"NeoBundle 'Shougo/neocomplcache'
"let g:neocomplcache_enable_at_startup = 1
"let g:neocomplcache_snippets_dir = $HOME.'/snippets'
"imap <C-l> <Plug>(neocomplcache_snippets_expand)
"smap <C-l> <Plug>(neocomplcache_snippets_expand)
""noremap es :<C-u>NeoComplCacheEditSnippets<CR>

"NeoBundle 'Shougo/neosnippet'

"NeoBundle 't9md/vim-textmanip'
"" 選択したテキストの移動
"vmap <C-j> <Plug>(textmanip-move-down)
"vmap <C-k> <Plug>(textmanip-move-up)
"vmap <C-h> <Plug>(textmanip-move-left)
"vmap <C-l> <Plug>(textmanip-move-right)
"" 行の複製
""vmap <C-d> <Plug>(textmanip-duplicate-down)

NeoBundle 'thinca/vim-qfreplace'
NeoBundle 'thinca/vim-textobj-comment'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tsaleh/vim-matchit'
"NeoBundle 'tyru/operator-html-escape.vim'


" プログラミング支援
"----------------------------------------

NeoBundle 'scrooloose/nerdcommenter'
nmap <C-l> <plug>NERDCommenterToggle
vmap <C-l> <plug>NERDCommenterToggle

NeoBundle 'scrooloose/syntastic'


" HTML, CSS
"----------------------------------------
NeoBundle 'hail2u/vim-css3-syntax'

NeoBundle 'mattn/emmet-vim'
autocmd FileType css imap <tab> <plug>(EmmetExpandAbbr)
let g:user_emmet_settings = { 'lang' : 'ja' }
let g:use_emmet_complete_tag = 1

NeoBundle 'othree/html5.vim'


" JavaScript
"----------------------------------------
let g:quickrun_config.javascript = {'command' : 'node'}

NeoBundle 'jelera/vim-javascript-syntax'
let g:SimpleJsIndenter_CaseIndentLevel = -1

NeoBundle 'jiangmiao/simple-javascript-indenter'
NeoBundle 'nono/vim-handlebars'

NeoBundle 'teramako/jscomplete-vim'
autocmd FileType javascript setlocal omnifunc=jscomplete#CompleteJS
let g:jscomplete_use = ['dom']


" バージョン管理
"----------------------------------------
NeoBundle 'tpope/vim-fugitive'
"NeoBundle 'airblade/vim-gitgutter'

" ビルド
"----------------------------------------
NeoBundle 'thinca/vim-quickrun'


" ユーティリティ
"----------------------------------------
NeoBundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"NeoBundle 'scrooloose/nerdtree'

"NeoBundle 'Shougo/unite.vim'
"" インサートモードで開始
"let g:unite_enable_start_insert = 1
"" 最近開いたファイル履歴の保存数
"let g:unite_source_file_mru_limit = 50
"" 垂直分割で開く
"let g:unite_enable_split_vertically=1
"" 開く
"noremap <C-_> :Unite -buffer-name=files buffer file_mru bookmark file<CR>

"NeoBundle 'Shougo/vimfiler'
"let g:vimfiler_as_default_explorer = 1

"NeoBundle 'Shougo/vimproc'
"NeoBundle 'Shougo/vimshell'
"NeoBundle 'sjl/gundo.vim'
NeoBundle 'vim-scripts/sudo.vim'

"NeoBundle 'vim-scripts/YankRing.vim'
" YankRing FIFOモード
"function! Fifo()
	"YRClear
	"nnoremap p pa
"endfunc
"function! FifoEnd()
	"nnoremap p p
"endfunc
"command! Fifo :call Fifo()
"command! FifoEnd :call FifoEnd()

" Appearance
"----------------------------------------
NeoBundle 'bling/vim-airline'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_theme = 'wombat'

NeoBundle 'w0ng/vim-hybrid'
colorscheme hybrid
