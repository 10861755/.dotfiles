
" ============== netrw configuration ===============

" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_browse_split = 4
let g:netrw_altv = 1

" Default to tree mode
let g:netrw_liststyle=3

" ============= Snipmate configuration ===============

if has("win32") || has("win16")
	let g:snippets_dir = "$VIMRUNTIME/../vimfiles/bundle/snippets/"
else
	let g:snippets_dir = "~/.vim/bundle/snippets/"
endif 

