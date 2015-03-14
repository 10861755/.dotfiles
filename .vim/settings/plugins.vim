
" ============== netrw configuration ===============

" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_browse_split = 4
let g:netrw_altv = 1

" Default to tree mode
let g:netrw_liststyle=3

" ============= Airline configuration ===============

if has('gui_running')
	" airline fancy symbols
	let g:airline_powerline_fonts = 1
else
	" Tell pathogen to disable airline if we run from terminal
	call add(g:pathogen_disabled, 'airline')
endif

" =============== Gundo configuration ===============

if has('python')
	let g:gundo_right = 1
else
	" disable Gundo if no python support is present
	call add(g:pathogen_disabled, 'gundo-python')
endif
