
" =============== Key Mapping/Remapping ===============

" ================= Leader Key Binds ==================

" Map leader key could be <space>, could also be ","
let mapleader=","

" Control-s save 
nmap <c-s> :w<CR> 

" Remove highlighting from searches using <leader> + /  
"nmap <silent> <leader>/ :nohlsearch<CR>

" Remove highlighting when screen is redrawn with Ctl-l
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" Closes a buffer without closing the window it's in
nnoremap <leader>d :bp<bar>sp<bar>bn<bar>bd<CR>

nnoremap <leader>c :bd<CR>

" ================= Standard Key Binds ==================

" Key bind a pair of keys to work tab switching
map 	<A-0> 		:tablast<CR>
map 	<A-1> 		1gt
map 	<A-2> 		2gt
map 	<A-3> 		3gt
map 	<A-4> 		4gt
map 	<A-5> 		5gt
map 	<A-6> 		6gt
map 	<A-7> 		7gt
map 	<A-8> 		8gt
map 	<A-9> 		9gt

" Use square brackets to traverse buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" Use square brackets to traverse quickfix 
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>
nnoremap <silent> [Q :cfirst<CR>
nnoremap <silent> ]Q :clast<CR>

" Use square brackets to traverse tags

" Disable Arrow keys 
nnoremap <up>	 		<nop>
nnoremap <down> 	<nop>
nnoremap <left> 	<nop>
nnoremap <right> 	<nop>

" Window navigation using arrow keys
map <left> 	<C-w>h
map <down> 	<C-w>j
map <up> 		<C-w>k
map <right> <C-w>l

"nnoremap ; : " used to short cut getting to the vim command prompt

" write as root when we dont have root permission
cmap w!! w !sudo tee % >/dev/null

" Naviagate through wrapped lines like logical lines
nnoremap j gj
nnoremap k gk

"let g:user_emmet_leader_key='<A-`>'

" ================= Custom Commands ==================

" New custom commands
" Closes a buffer without closing the window it's in
:command! Bd bp | sp | bn | bd

" ================= Function Key (Fn) Binds ==================

" Disable help 
imap <F1>	<nop>
map <F1>	<nop>
map <C-F1>	<nop>
map <A-F1>	<nop>

" remap control-p pluggin on F1
"let g:ctrlp_map = '<F1>'

" Buffer explorer
noremap <silent> <F2> :BufExplorer<CR>
noremap <silent> <C-F2> :BufExplorerVerticalSplit<CR>
noremap <silent> <A-F2> :BufExplorerHorizontalSplit<CR>

" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction

map <silent> <F3> :call ToggleVExplorer()<CR>

" Change directory to the current file, then print that directory
map <silent> <C-F3> :cd %:p:h<CR>:pwd<CR>

" toggle buffer display on/off
nmap <A-F3> :ls<CR>
"nmap <C-F4> :MBEToggle<CR>

" Toggle Quick Fix Window 
function! ToggleQuickFix()
  if exists("g:qwindow")
    ccl
    unlet g:qwindow
  else
    botright copen 32
    echo len(getqflist())
    let g:qwindow = 1
  endif
endfunction

nmap <script> <silent> <F4> :call ToggleQuickFix()<CR>

" Run program
map <silent> <F5> :!./a.out<CR>

" Toggle Binary mode
function! ToggleBinaryMode()
  if exists("g:bmode")
  	%!xxd -r
    unlet g:bmode
  else
    %!xxd
    let g:bmode = 1
  endif
endfunction

nmap <script> <silent> <F6> :call ToggleBinaryMode()<CR>

" Find out os to call the correct make program
let os = substitute(system('uname'), "\n", "", "")

" Change make program if running on freebsd
if os == "FreeBSD"
	set makeprg=gmake
endif

" Function to call when invoking make
function! Make()
	wa
	make
endfunction

nmap <script> <silent> <F7> :call Make()<CR>

nmap <script> <silent> <C-F7> :!make clean<CR>

" Open tagbar
nmap <F8> :TagbarToggle<CR>

" Run Ctags in the shell
nmap <C-F8> :!ctags -R .<CR>

" Gundo tree
nnoremap <F9> :GundoToggle<CR>

