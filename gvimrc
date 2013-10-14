set visualbell t_vb =  "turn off error beep/flash
set novisualbell     "turn off visual bell
set lines=80
set columns=200
set background=light
if has("gui_gtk2")
  set guifont=Inconsolata-dz\ 10
  " set guifont=Ubuntu\ Mono\ for\ Powerline\ 12
elseif has("win32")  
  echo "win32"
  set guifont=Consolas:h10
  behave mswin
  autocmd GUIEnter * simalt ~x
else
  set guifont=Menlo\ for\ Powerline:h14   
endif
"autocmd InsertLeave * se nocul
"autocmd InsertEnter * se cul
set guioptions-=T
set guioptions-=m
set guioptions-=l
set guioptions-=b
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
