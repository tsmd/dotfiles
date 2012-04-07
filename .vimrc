" 京

set nocompatible

"===========================================================================
" neobundle.vim
"---------------------------------------------------------------------------
filetype off
if has('vim_starting')
  set rtp+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.bundle'))
endif
if finddir('go', '/usr/local') != ''
    set rtp+=/usr/local/go/misc/vim
endif

NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'basyura/jslint.vim'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'tsaleh/vim-matchit'
NeoBundle 'mjbrownie/html-textobjects'
NeoBundle 'othree/html5.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vinarise'
NeoBundle 'sjl/gundo.vim'
"NeoBundle 't9md/vim-textmanip'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'tpope/vim-surround'
"NeoBundle 'tpope/vim-haml'
NeoBundle 'tyru/operator-html-escape.vim'
NeoBundle 'vim-scripts/jsbeautify'
"NeoBundle 'vim-scripts/renamer.vim'
NeoBundle 'vim-scripts/Source-Explorer-srcexpl.vim'
NeoBundle 'vim-scripts/str2numchar.vim'
NeoBundle 'vim-scripts/sudo.vim'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'vim-scripts/trinity.vim'
NeoBundle 'vim-scripts/YankRing.vim'

filetype plugin indent on


"===========================================================================
" SEARCH
"---------------------------------------------------------------------------
set ignorecase
set smartcase
set noincsearch
set wrapscan

"===========================================================================
" EDIT
"---------------------------------------------------------------------------
set backspace=indent,eol,start
set showmatch
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM
" CTRL-A のインクリメント時、0から始まる数字を10進数と見る
set nrformats=alpha,hex ",octal

" INDENT/TAB
set autoindent
" set expandtab
" set tabstop=8
" set softtabstop=4
" set shiftwidth=4

"===========================================================================
" APPEARANCE
"---------------------------------------------------------------------------
set ruler
set list
set listchars=tab:\|\ ,extends:<,trail:-
set wrap
set laststatus=2 "always
set cmdheight=1
set showcmd
" タイトルを表示
set title
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_degrade=1
let g:solarized_italic=0
let g:solarized_contrast="high"
let g:solarized_visibility="low"
let g:solarized_hitrail=0
let g:solarized_menu=0
colorscheme solarized
set cursorline
syntax on

" colorscheme darkspectrum (by. @soucerjp):
"----------------------------------------
"colorscheme darkspectrum
"" 通常の文字、背景色
"hi Normal guifg=#dddddd guibg=#1c1c1c
"" インクリメンタル検索ハイライト
"hi IncSearch guifg=#efca00 guibg=#000000
"" 検索結果ハイライト
"hi Search guifg=#FFFFFF guibg=#aa0000
"" tab
"hi SpecialKey guifg=#444444
"" コメントアウト
"hi Comment guifg=#555555
"" 変数とか命令文
"hi Statement guifg=#E1EBA7
"hi PreProc guifg=#E1EBA7
"" カーソル桁
"hi CursorColumn guibg=#000000
""行番号部分
"hi LineNr guifg=#999999 guibg=#292929

"===========================================================================
" BACKUP
"---------------------------------------------------------------------------
set nobackup
set writebackup

"===========================================================================
" OPERATION
"---------------------------------------------------------------------------
set wildmenu

" Yの動作をDやCと同じにする
nnoremap Y y$

" カーソル位置を中心に保ったままスクロール
"nnoremap <Space> jjjzz
"w <S-Space> kkkzz

" y と d の時にクリップボードに入るようにする
"nnoremap y "+y
"nnoremap d "+d
"vnoremap y "+y
"vnoremap d "+d

" 逆改行（コマンドラインでは使えないみたい）
nnoremap <S-CR> O<Esc>
inoremap <S-CR> <Esc>O

" 分割幅を変更する
nnoremap = <C-W>5>
nnoremap - <C-W>5<
"nnoremap = :vertical resize 78<CR>

" 分割高さを変更する
nnoremap + <C-W>2+
nnoremap _ <C-W>2-

" 選択したテキストを検索する
vmap X y/<C-R>"<CR>


"===========================================================================
" PLUGIN
"---------------------------------------------------------------------------
" vim-smartchar
"----------------------------------------
" inoremap <expr> = smartchr#one_of(' = ', ' == ', ' === ', '====')
" inoremap <expr> : smartchr#one_of(': ', ':')

" neocomplcache
"----------------------------------------
"let g:neocomplcache_enable_at_startup = 1

"---------------------------------------------------------------------------
" textmanip.vim
"----------------------------------------
" 選択したテキストの移動
"vmap <C-j> <Plug>(textmanip-move-down)
"vmap <C-k> <Plug>(textmanip-move-up)
"vmap <C-h> <Plug>(textmanip-move-left)
"vmap <C-l> <Plug>(textmanip-move-right)
" 行の複製
"vmap <C-d> <Plug>(textmanip-duplicate-down)

"---------------------------------------------------------------------------
" matchit
"----------------------------------------
"source $VIMRUNTIME/macros/matchit.vim
"let b:match_words = '<:>,（:）,「:」,【:】,［:］,＜:＞,〈:〉,『:』,“:”,《:》,〔:〕,｛:｝,‘:’,?:?,?:?'

"---------------------------------------------------------------------------
" jslint.vim
"----------------------------------------
function! s:javascript_filetype_settings()
    autocmd BufLeave     <buffer> call jslint#clear()
    autocmd BufWritePost <buffer> call jslint#check()
    autocmd CursorMoved  <buffer> call jslint#message()
endfunction
autocmd FileType javascript call s:javascript_filetype_settings()
"
"---------------------------------------------------------------------------
" quickrun
"----------------------------------------
let g:quickrun_config = {}
let g:quickrun_config.javascript = {'command' : 'node'}
let g:quickrun_config.go = {
\    'command': 'go',
\    'exec': ['go run %s']
\ }

"---------------------------------------------------------------------------
" vimfiler
"----------------------------------------
let g:vimfiler_as_default_explorer = 1

"---------------------------------------------------------------------------
" YankRing.vim
"----------------------------------------
let g:yankring_enabled = 1
let g:yankring_max_history = 20

"---------------------------------------------------------------------------
" zencoding-vim
"----------------------------------------
let g:use_zen_complete_tag = 1


"===========================================================================
" MISC
"---------------------------------------------------------------------------
"set textwidth=78

" タブの大きさを切り替え
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
let s:tsmd_tabringcount = 3
function! Tsmd_tabring()
    if s:tsmd_tabringcount == 0
        set noexpandtab
        set tabstop=8
        set softtabstop=8
        set shiftwidth=8
        echo "TAB : 8"
    elseif s:tsmd_tabringcount == 1
        set noexpandtab
        set tabstop=4
        set softtabstop=4
        set shiftwidth=4
        echo "TAB : 4"
    elseif s:tsmd_tabringcount == 2
        set noexpandtab
        set tabstop=2
        set softtabstop=2
        set shiftwidth=2
        echo "TAB : 2"
    elseif s:tsmd_tabringcount == 3
        set expandtab
        set tabstop=4
        set softtabstop=4
        set shiftwidth=4
        echo "SPACE : 4"
    else
        set expandtab
        set tabstop=2
        set softtabstop=2
        set shiftwidth=2
        echo "SPACE : 2"
    endif
    let s:tsmd_tabringcount = (s:tsmd_tabringcount + 1) % 5
endfunction
nnoremap <Space>t :call Tsmd_tabring()<CR>


" number を切り替える
set relativenumber
let s:numbertoggle = 0
function! NumberToggle()
    if s:numbertoggle == 0
        set number
    elseif s:numbertoggle == 1
        set relativenumber
    else
        set nonumber
        set norelativenumber
    endif
    let s:numbertoggle = (s:numbertoggle + 1) % 3
endfunc
nnoremap <Space>n :call NumberToggle()<cr>


" FocusMode
function! ToggleFocusMode()
  if (&foldcolumn != 12)
    set laststatus=0
    set numberwidth=10
    set foldcolumn=12
    set noruler
    hi FoldColumn ctermbg=none
    hi LineNr ctermfg=0 ctermbg=none
    hi NonText ctermfg=0
  else
    set laststatus=2
    set numberwidth=4
    set foldcolumn=0
    set ruler
    colorscheme solarized
  endif
endfunc
nnoremap <F1> :call ToggleFocusMode()<cr>


" WindowsのVimでシンボリックリンクを開いた時に実体で開き直す
" http://d.hatena.ne.jp/ebith/20111207/1323251891
if has('win32')
    autocmd BufRead * call s:IsSymlink()
endif
function! s:IsSymlink()
    let s:res = split(vimproc#system('isSymlink.exe "' . escape(expand('%:p'), '\') . '"'), ',')
    "let s:res = vimproc#system('cmd /c dir "' . expand('%:p') . '" | find <SYMLINK>')
    if (s:res[0] == 'true')
        let s:filetype = &filetype
        edit `=s:res[1]`
        let &syntax = s:filetype
    elseif (s:res[0] == 'error')
        echoerr 'isSymlink : ' . s:res[1]
    endif
endfunction


" レジスタ/マークの確認を楽にする
" FROM http://whileimautomaton.net/2008/08/vimworkshop3-kana-presentation
nnoremap <Space>m  :<C-u>marks
nnoremap <Space>r  :<C-u>registers

" 最後に変更されたテキストを選択する
" FROM http://whileimautomaton.net/2008/08/vimworkshop3-kana-presentation
nnoremap gc  `[v`]

" 日本語対応のための設定:
if has('kaoriya')
    source $VIM/plugins/kaoriya/encode_japan.vim
endif

" MacOS Xメニューの日本語化 (メニュー表示前に行なう必要がある)
if has('mac')
  if exists('$LANG') && $LANG ==# 'ja_JP.UTF-8'
    set langmenu=ja_ja.utf-8.macvim
    set encoding=utf-8
    set ambiwidth=double
  endif
endif

"---------------------------------------------------------------------------
" ファイル名に大文字小文字の区別がないシステム用の設定:
"   (例: DOS/Windows/MacOS)
"
if filereadable($VIM . '/vimrc') && filereadable($VIM . '/ViMrC')
    " tagsファイルの重複防止
    set tags=./tags,tags
endif

"---------------------------------------------------------------------------
" コンソールでのカラー表示のための設定(暫定的にUNIX専用)
" if has('unix') && !has('gui_running') && !has('gui_macvim')
"   let uname = system('uname')
"   if uname =~? "linux"
"     set term=builtin_linux
"   elseif uname =~? "freebsd"
"     set term=builtin_cons25
"   elseif uname =~? "Darwin"
"     set term=beos-ansi
"   else
"     set term=builtin_xterm
"   endif
"   unlet uname
" endif

"---------------------------------------------------------------------------
" コンソール版で環境変数$DISPLAYが設定されていると起動が遅くなる件へ対応
"if !has('gui_running') && has('xterm_clipboard')
"  set clipboard=exclude:cons\\\|linux\\\|cygwin\\\|rxvt\\\|screen
"endif

"---------------------------------------------------------------------------
" プラットホーム依存の特別な設定

" WinではPATHに$VIMが含まれていないときにexeを見つけ出せないので修正
"if has('win32') && $PATH !~? '\(^\|;\)' . escape($VIM, '\\') . '\(;\|$\)'
"  let $PATH = $VIM . ';' . $PATH
"endif

if has('mac')
  " Macではデフォルトの'iskeyword'がcp932に対応しきれていないので修正
  set iskeyword=@,48-57,_,128-167,224-235
endif

"---------------------------------------------------------------------------
" KaoriYaでバンドルしているプラグインのための設定

" autofmt: 日本語文章のフォーマット(折り返し)プラグイン.
set formatexpr=autofmt#japanese#formatexpr()

" Copyright (C) 2011 KaoriYa/MURAOKA Taro


" MacVim-KaoriYa固有の設定
if has('kaoriya') && has('mac')
  let $PATH = simplify($VIM . '/../../MacOS') . ':' . $PATH
  set migemodict=$VIMRUNTIME/dict/migemo-dict
  set migemo
endif
