"========================================
" 全般
"----------------------------------------
if has('multi_byte_ime')
	set iminsert=0
	set imsearch=0
endif


"========================================
" フォント
"----------------------------------------
if has('win32')
	set guifont=MonoLisa:h12
	set guifontwide=BIZ_UDゴシック:h14
	set linespace=3
endif


"========================================
" 表示など
"----------------------------------------
colorscheme slate

set guioptions-=i
set guioptions-=m
set guioptions-=T
set columns=120
set lines=35

if has('multi_byte_ime')
	highlight CursorIM guibg=Purple guifg=NONE
endif
