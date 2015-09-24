
" ================= GUI and other interface options ============================

" =================== Statusline Settings ======================
set statusline=%t      	 			"tail of the filename (t), Full path (F)
set statusline+=\ \ ft:%Y      	"filetype
set statusline+=\ ff:%{&ff} 	"file format
set statusline+=\ enc:%{strlen(&fenc)?&fenc:'none'} "file encoding
set statusline+=\ %{fugitive#statusline()} " Fugitive pluggin
set statusline+=\ %h      "help file flag
set statusline+=\ %m      "modified flag
set statusline+=\ %r      "read only flag
set statusline+=%=      "left/right separator
set statusline+=\ off:%O 	" Offset under the cursor in hexadecimal
set statusline+=\ (0x%02.B) 		" Byte under the cursor in hexadecimal
set statusline+=\ BN:%n 	" Buffer number
set statusline+=\ C:%c     "cursor column
set statusline+=\ LN:%l/%L   "cursor line/total lines

" 8 terminal
set title                " change the terminal's title

" 9 using the mouse

" 10 GUI

set guicursor=n:blinkon0													" Disable cursor blink
set guicursor=i:ver30-blinkoff250-blinkon400			" Change insert cursor

if has('gui_running')
	
	" Change cursor colour
	"highlight Cursor   guifg=black guibg=white 			
	"highlight iCursor  guifg=white  guibg=black

	" Colour scheme to use with gvim
	"colorscheme desert
	"colorscheme wombat256mod
	colorscheme zenburn 
	set background=dark			" setbackground to dark/light

	" Disable scrollbars
	"set guioptions-=r
	"set guioptions-=L

	" Disable the toolbar
	"set guioptions-=T

	" Check operating system
	if has("win32") || has("win16")

		" Start GUI maximized
		"au GUIEnter * simalt ~x
		"set guifont=DejaVu_Sans_Mono_for_Powerline:h11:cANSI
		"set guifont+=DejaVu_Sans_Mono:h11:cANSI
		set guifont=DejaVu_Sans_Mono:h11:cANSI
		set guifontwide=MingLiU:h14

	else
		" check for different *nix's
		let os = substitute(system('uname'), "\n", "", "")

		if os == "FreeBSD"
			" FreeBSD Font
			"set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
			"set guifont+=DejaVu\ Sans\ Mono\ 10
			set guifont=DejaVu\ Sans\ Mono\ 12
		elseif os == "Linux"
			" setup linux font
		endif
	endif

	" Use maximum screen space
	set lines=32
	set columns=80

" Terminal settings
else
	
	colorscheme desert

	set lines=32						" display max number of lines on the screen
	set columns=80					" display max number of columns on the screen

endif

set showcmd
" ============== Remove Screen Flash =====================

set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif
