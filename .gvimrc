"vim:set fenc=utf-8 ts=4 sts=4 sw=4 noet:


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
	set guifont=Inconsolata:h12
	set guifontwide=MS_Gothic:h12
	"set guifont=VL_Gothic:h12
	set linespace=3
	"set renderoptions=type:directx,renmode:1
elseif has('gui_macvim')
	set guifont=VL-Gothic-Regular:h16
elseif has('mac')
	set guifont=Osaka-mono:h14
elseif has('xfontset')
	" UNIX用 (xfontsetを使用)
	set guifontset=a14,r14,k14
endif


"========================================
" 表示など
"----------------------------------------
"set guioptions=
set columns=170
set lines=50

colorscheme solarized
set background=light

if has('multi_byte_ime')
	highlight CursorIM guibg=Purple guifg=NONE
endif


"========================================
" 印刷
"----------------------------------------
if has('printer')
	if has('win32')
		set printfont=MS_Mincho:h12:cSHIFTJIS
		"set printfont=MS_Gothic:h12:cSHIFTJIS
	endif
endif
