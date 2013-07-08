set nocompatible

let mapleader=","
let g:mapleader=","

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quick editing vimrc file
map <silent> <leader>ee :call SwitchToBuf("~/.vimrc")<cr>
autocmd! bufwritepost .vimrc source ~/.vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call pathogen#infect()
call pathogen#helptags()

" NeoBundle
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'shougo/vimproc'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'L9'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'godlygeek/tabular'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'vim-scripts/VimClojure'
NeoBundle 'terryma/vim-smooth-scroll'
NeoBundle 'altercation/vim-colors-solarized'

set backspace=eol,start,indent
set backspace=2 "make backspace work like other apps
set whichwrap+=<,>,h,l,[,],b,s
set ignorecase
set smartcase
set hlsearch
set nolazyredraw
set magic "Set magic on, for regular expressions
set showmatch 
set mat=2 "How many tenths of a second to blink
set noerrorbells
set novisualbell
set vb
set t_vb=
set tm=500
set number
set expandtab
set lbr
set tw=500
set ai
set si
set wrap
set tabstop=2
set softtabstop=2
set shiftwidth=2
set history=200
"set autoread
set encoding=utf8
set ffs=unix,dos,mac
set hidden
"backup
set nobackup
set nowb
set noswapfile
set showcmd
set showmode
set mouse=a
set selectmode=mouse,key
set sessionoptions+=resize
set clipboard+=unnamed
set fileformats=unix,dos
set laststatus=2
set cmdheight=1
set wildmenu
set wildmode=list:longest
set modelines=0
set ttyfast

" Always splits to the right and below
set splitright
set splitbelow
set fcs=vert:│
" Display unprintable chars
set list
set listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:␣
set showbreak=↪

set scrolloff=10
" Open all folds initially
set foldmethod=indent
set foldlevelstart=99

" No need to show mode due to Powerline
set noshowmode
" Column width indicator
set colorcolumn=+1
" ; to :
nnoremap ; :
" quickly for nohlsearch
nmap <silent> <leader>/ :silent :nohlsearch<CR>

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
augroup MyAutoCmd
  autocmd BufWinEnter * if &modifiable && &ft!='unite' | match ExtraWhitespace /\s\+$/ | endif
  autocmd InsertEnter * if &modifiable && &ft!='unite' | match ExtraWhitespace /\s\+\%#\@<!$/ | endif
  autocmd InsertLeave * if &modifiable && &ft!='unite' | match ExtraWhitespace /\s\+$/ | endif
  autocmd BufWinLeave * if &modifiable && &ft!='unite' | call clearmatches() | endif
augroup END

set wildmode=list:longest,full
set wildmenu "turn on wild menu
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/Library/**,*/.rbenv/**
set wildignore+=*/.nx/**,*.app

setlocal noswapfile
syntax on
filetype on
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

"imap
:imap jj <esc>
:imap <C-s> <Esc>:w<CR>
nmap <leader>x <esc>:x<cr>
nmap <leader>w <esc>:w<cr>
map <leader>full <esc>:set columns=200<cr>

noremap <C-k><C-d> <Esc>gg=G

set shortmess=atl
set tags=tags;
let Tlist_Sort_Type="name"
let TList_Use_Right_Window=1
let Tlist_Compart_Format=1
let Tlist_Exist_OnlyWindow=1
let Tlist_File_Fold_Auto_Close=0
let Tlist_Enable_Fold_Column=0

function! SwitchToBuf(filename)
  let bufwinnr = bufwinnr(a:filename)
  if bufwinnr != -1
    exec bufwinnr . "wincmd w"
    return
  else
    " find in each tab
    tabfirst
    let tab = 1
    while tab <= tabpagenr("$")
      let bufwinnr = bufwinnr(a:filename)
      if bufwinnr != -1
        exec "normal " . tab . "gt"
        exec bufwinnr . "wincmd w"
        return
      endif
      tabnext
      let tab = tab + 1
    endwhile
    " not exist, new tab
    exec "tabnew " . a:filename
  endif
endfunction

"================NERDTree===============
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <leader>n :NERDTreeToggle<cr>
nnoremap <Leader>cd :cd %:p:h<cr>:pwd<cr>

map <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#") . " BG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"bg#")<CR>
:au BufRead, BufNewFile *.css set ft=css syntax=css3

" for Markdown
map <leader>md :%!/usr/local/bin/Markdown.pl > %.html<cr>

" for vim-powerline plug-in
let g:Powerline_symbols = 'fancy'

" for tabularize plug-in
let mapleader=','
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" Clipboard
let g:gist_clip_command='pbcopy'

" sable moving with arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" command-line
cnoremap <C-a> <home>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-e> <end>

" search and replace
noremap <leader>r :%s/
vnoremap <leader>r "+y:%s/\V<C-r>+

imap <C-j> <C-n>

" insert mode move cursor like emacs 
imap <C-f> <C-o>l
imap <C-b> <C-o>h
imap <C-n> <C-o>gj
imap <C-p> <C-o>gk

imap <C-k> <C-o>d$
imap <C-d> <C-o>x
imap <C-u> <C-o>d0
imap <C-a> <C-o>^
imap <C-e> <C-o>$

" smooth scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" multiple-cursors
let g:multi_cursor_start_key='<C-0>'
let g:multi_cursor_quit_key='<ESC>'

" clear highlights on Ctrl-L
nnoremap <silent> <C-l> :nohl<CR><C-l>

"""""" Nerdtree
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2 
" auto-enable spellcheck for certain filetypes
if has('spell')
  au Filetype markdown setlocal spell
endif

""""" Enable NeoBundle
NeoBundleCheck

set background=dark
set t_md= "Disable bold font in bash
set t_Co=256
let g:solarized_termcolors=256
colo solarized

if $TMUX == ''
  set clipboard+=unnamed
endif
