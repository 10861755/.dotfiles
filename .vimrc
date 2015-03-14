set fileformat=unix

" Load main vimrc
if has("win32") || has("win16")
	source $VIMRUNTIME/../vimfiles/settings/_vimrc
else
	source ~/.vim/settings/_vimrc
endif 
