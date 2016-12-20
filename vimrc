set nocompatible              " be iMproved, required
filetype off                  " required

let g:JSHintUpdateWriteOnly = 1
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'L9'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
 Plugin 'ctrlp.vim'
Plugin 'vimplugin/project.vim'
Plugin 'lenny0702/vim-sftp-sync-inPython'
Plugin 'mihaifm/bufstop'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'tmhedberg/matchit'
Plugin 'LargeFile'
Plugin 'jade.vim'
Plugin 'AutoComplPop'
Plugin 'wookiehangover/jshint.vim'
Plugin 'a.vim'
"Plugin 'taglist-plus'
Plugin 'scrooloose/nerdtree'
"Plugin 'vim-scripts/Conque-GDB'
Plugin 'Tagbar'
Plugin 'altercation/vim-colors-solarized' 
Plugin 'mattn/emmet-vim'
Plugin 'hsnks100/VimExplorer'
Plugin 'benmills/vimux'
Plugin 'jszakmeister/vim-togglecursor'
Plugin 'tpope/vim-surround'
Plugin 'changyuheng/color-scheme-holokai-for-vim'
Plugin 'tpope/vim-repeat' 

Plugin 'jelera/vim-javascript-syntax'
Plugin 'luochen1990/rainbow'

Plugin 'easymotion/vim-easymotion'


let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
"Plugin 'Enhanced-Javascript-syntax'


 "Plugin 'jslint.vim'
call vundle#end()            " required
filetype plugin indent on    " required
runtime basic.vim
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}
" air-line
set laststatus=2
"let g:airline_powerline_fonts = 1

"if !exists('g:airline_symbols')
    "let g:airline_symbols = {}
"endif


" airline symbols
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='cool'

"set AirlineTheme=cool
"call AirlineTheme(cool)


nmap _ :call NERDComment(0, "toggle")<CR>
vmap _ :call NERDComment("x", "toggle")<CR>

let g:ctrlp_working_path_mode = 'r'

let g:netrw_chgwin = 2
let g:netrw_silent = 1
let g:netrw_split = 2
let g:netrw_liststyle = 3 

"
"inoremap <ESC> <ESC>:set imdisable<CR>
"nnoremap i :set noimd<CR>i
"nnoremap I :set noimd<CR>I
"nnoremap a :set noimd<CR>a
"nnoremap A :set noimd<CR>A
"nnoremap o :set noimd<CR>o
"nnoremap O :set noimd<CR>O
"nnoremap s :set noimd<CR>s
"nnoremap S :set noimd<CR>S


" Fugitive config
execute "nnoremap <leader>gc :!git commit % -m \"".expand("%:n")."\"<CR>"
"git add %
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gb :Gblame<CR>

"emmet config 
let g:user_emmet_leader_key='<C-Z>'


 

" easymotion
" <Leader>f{char} to move to {char}
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap f <Plug>(easymotion-bd-wl)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
"nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
"map <Leader>j <Plug>(easymotion-j)
"map <Leader>k <Plug>(easymotion-k)


function! KSOO()

  syntax on

  "language en_US.UTF-8
  set fileencoding=utf-8
  set encoding=utf-8

  if has("win32")
    "set guifont=D2Coding:h18
    "set guifont=NanumGothicCoding\ Bold\ 12
  else
    "set guifont=NanumGothicCoding\ Bold\ 12
  endif
  set guioptions-=m
  set guioptions-=T
  set number            " line Ç¥½Ã¸¦ ÇØÁÝ´Ï´Ù.
  set laststatus=2                                      
  set cmdheight=2                                       
  set cursorline                                        
  set shortmess=atI                                     
  set nu				                                  
  set smarttab                                          
  set smartindent                                       
  set foldenable                                        
  set mouse=a			                                  
  set foldnestmax=2
  set foldlevel=1
  set ignorecase                                        
  set smartcase                                         
  set ignorecase 
  set hlsearch   
  set nocompatible 
  set bs=indent,eol,start 
  set history=1000   
  set ruler         
  set nobackup     
  set title       
  set showmatch  
  set nowrap    
  set wmnu        
  set autochdir
  set noerrorbells visualbell t_vb=
  set hidden
  set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
  set et 
  set ts=2
  set sw=2
  set sts=2 
  set ai 
  set nocursorline
  set noesckeys
  if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
  endif
  let g:mapleader=","
  colorscheme darkblue
  set t_Co=256

  nmap <C-j> :bn<CR>
  nmap <C-k> :bp<CR>
  inoremap <C-h> <C-o>h
  inoremap <C-l> <C-o>l
  imap jj <ESC>j
  imap kk <ESC>k
  nmap <S-SPACE> i<SPACE><ESC>l
  nmap <S-CR> i<CR><ESC>
  vnoremap p "_dP=`]`]
  nnoremap x "_x
  inoremap <C-e> <C-x><C-e>
  inoremap <C-y> <C-x><C-y>
  noremap YY :%y+<CR> 
  vnoremap Y "+y
  vnoremap <C-C> :"+y<CR>
  inoremap <C-V> <ESC>"+pa
  vnoremap <C-V> s<ESC>"+p 
  nnoremap <SPACE>fed :e ~/.vimrc<CR>
  nnoremap <SPACE>feR :source ~/.vimrc<CR>
  nnoremap <leader>d :b#<bar>bd#<CR>

  "compile setting


  "function! Builder()
  "endfunction
  function! Kompile() 
    let b:buildstr = ""
    let l:ext = expand("%:e")
    echo "call kompile"
    if l:ext == "cpp" 
      let b:buildstr = "g++ -std=c++11 -O2 ".expand("%:p")." -o ".expand("%<")
    elseif  l:ext == "py"
      let b:buildstr = "python ".expand("%:p")
    elseif l:ext == "r"
      let b:buildstr = "Rscript ".expand("%:p")
    elseif l:ext == "pl"
      let b:buildstr = "perl ".expand("%:p")
    elseif l:ext == "m"
      let b:buildstr = "octave -qf ".expand("%:p")
    endif

    if filereadable("input.txt")
      let b:buildstr .= " < input.txt"
    endif

    if executable('tmux') && !has('gui')
      call VimuxRunCommand("cd ".expand("%:p:h"))
      call VimuxRunCommand(b:buildstr) 
    else
      let b:buildstr = substitute(b:buildstr, " ", "\\\\ ", "g")
      echo b:buildstr
      silent execute "setlocal makeprg=".b:buildstr
      make
      vertical botright copen
    endif
  endfunction


  function! Exekute()
    if executable("tmux") && !has('gui')
      call VimuxRunCommand(expand("%:p:r") . " <input.txt")
    else
      " noremap <F6> :cexpr system('./'.expand('%:r') .'< input.txt')<CR>:cope<CR><C-w>p
      execute "cexpr system(\"" . expand('%:p:r') . " <input.txt\")"
      normal <CR>
      vertical botright copen
      "execute("vertical botright cope")
      "  <CR>:cop<CR><C-w>p"
    endif
  endfunction


  if has("win32")
    autocmd FileType cpp setlocal makeprg=g++\ -g\ -std=gnu++11\ %:r.cpp\ -o\ %<.exe
    autocmd FileType pl,perl setlocal makeprg=perl\ %\ <input.txt
    autocmd FileType py,python setlocal makeprg=python\ %
    noremap <C-S-B> :wa<CR>:make<CR>:cope<CR><C-w>p
    "autocmd FileType cpp noremap <buffer> <C-F5> :cexpr system('./'.expand('%:r') .'.exe< input.txt')<CR>:cope<CR><C-w>p
    autocmd FileType cpp noremap <buffer> <C-F5> :cexpr system(expand('%:r') ." <input.txt")<CR>:cope<CR><C-w>p
    autocmd FileType cpp noremap <buffer> <C-F6> :cexpr system(expand('%:r'))<CR>:cope<CR><C-w>p
    autocmd FileType cpp noremap <buffer> <F5> :!gdb %<.exe input.txt<CR>:cope<CR><C-w>p
    "noremap <F5> :wa<CR>:make<CR>
    "noremap <C-F5> :! %<.exe < input.txt<CR>
    "autocmd FileType cpp set makeprg=g++\ -std=c++11\ %:r.cpp\ -o\ %<.exe
    "noremap <F9> :call Run()<CR>
    "inoremap <F9> <ESC>:call Run()<CR> 
  else 
    noremap <F6> :cexpr system('./'.expand('%:r') .'< input.txt')<CR>:cope<CR><C-w>p
    noremap <C-S-B> :wa<CR>:call Kompile()<CR><c-w>p
    autocmd FileType cpp noremap <buffer> <F5> :call Exekute()<CR><c-w>p
  endif

  autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
  if bufwinnr(1)
    map <kPlus> <C-W>+
    map <kMinus> <C-W>-
    map <kDivide> <c-w><
    map <kMultiply> <c-w>>
  endif
  set scrolloff=10 


  " swp 파일들 한쪽으로 모으기.
  set scrolloff=10



  if has("gui")
    noremap <M-Space> :simalt ~<CR>
    inoremap <M-Space> <C-O>:simalt ~<CR>
    cnoremap <M-Space> <C-C>:simalt ~<CR>
  endif

  if has("win32")
    runtime delmenu.vim
    runtime menu.vim
  else

  endif




  if has('gui_running')
    set background=light
    colorscheme darkblue
  else
    "set term="term-256color"
    "set term=screen-256color
  endif 


  " reference to recursive parent path
  let l:parent=1
  let l:local_tags = "tags"
  while l:parent <= 8
    exe ":set tags+=".local_tags
      let l:local_tags = "../". l:local_tags
    let l:parent = l:parent+1
  endwhile
endfunction

call KSOO()

